#!/usr/bin/env python
'''
Script Name:	visa_auto.py
Created by: 	cfc@gp (carlos.f.castro@emc.com)
Created on: 	03/07/2013
Description: 	Designed to automate the flow of data logs from ETL
		HDFS and GPDB. This process includes file management, 
		log parsing via map/reduce, transformation and data loads
		to GPDB system for the following datasets: bluecoat, vpn,
		active directory, netscout, dns, dhcp, fwcheckpoint and
		fwpix.

Usage: python visa_auto.py -d <dataset> -m <monthday> -o <options {1-5}>
where options are:
	1 - Rezip
	2 - Load HDFS
	3 - Run MapReduce
	4 - Create External Tables
	5 - Load GPDB
'''

#Import all modules
try:
	import os, sys, getopt, time, logging, subprocess, datetime
	from optparse import OptionParser
except Exception, err:
    print err

###############################
###list all the file paths here
###############################

### Scripts & Log file paths
scripts_dir = "/data1/auto_scripts/bin/"
log_dir = "/data1/auto_scripts/logs/"

### ETL file paths
input_dir="/data1/input/"
output_dir="/data2/output/"

### HDFS file paths
hdfs_input_dir="/data/input/"
hdfs_output_dir="/data/output/"

###############################
### Initialize  Logging
###############################
date = time.strftime("%Y%m%d")
logging.basicConfig(level=logging.INFO,
      format='%(asctime)s-[%(levelname)-s]-%(message)s',
      datefmt='%Y%m%d%:%H:%M:%S',
      filename=log_dir+'visa_auto.'+date+'.log',
      filemode='a')

###############################
def usage(exitarg = None):
   print __doc__
   if exitarg:
      print "Error:"
   sys.exit(exitarg)
###############################

###############################
### Step 0 - Precheck input folder for new files
###############################

def pre_check ():
	print "###############################"
	print "Starting Step 0 - Pre-Checks:"
	print "Dataset: "+dataset
	print "Month/Day: "+monthday
	logging.info("Starting Step 0 - Pre-Checks:")
	try:
		file_list=os.listdir(input_dir+dataset+"/"+monthday)
		num_files=len(file_list)
		if num_files==0:
			logging.error("Exiting: No files in folder %s%s/%s" % (input_dir,dataset,monthday))
			print "[ERROR]-Exiting: No files found in %s%s/%s directory" % (input_dir,dataset,monthday)
			sys.exit()
		else:
			print "Total Number of Files found: %s" %(num_files)
			print "Pre-Checks Complete"
			logging.info ("Step-0 Complete w/out errors")
			
	except Exception, e:
		logging.error(str(e))
		usage( '[ERROR]:-' +str(e))
	print "###############################"
###############################
### Step 1 - Rezip
###############################

def rezip (dataset, monthday):
        print "###############################"
        print "Starting Step 1 - Rezip:"
        logging.info("Starting Step 1 - Rezip") 

	def randbin(dataset, monthday):	
		randbin_log = log_dir+"rezip_"+dataset+"_"+monthday+".log"
		randbin_cmd = scripts_dir+"./randbin.sh %s %s > %s 2>&1" % (dataset,monthday, randbin_log)

                try:
                        print "Start rezip process for dataset: %s monthday: %s" % (dataset,monthday)
                        print "See logfile for details at:"+randbin_log
			subprocess.call(randbin_cmd, shell=True)
                except Exception, e:
                        usage( '[ERROR]:-' +str(e))

	if dataset == "active_directory":
		randbin(dataset, monthday)	
	elif dataset == "vpn":
		randbin(dataset, monthday)	
	elif dataset == "bluecoat":
		randbin(dataset, monthday)	
	elif dataset == "netscout":
		randbin(dataset, monthday)	
	elif dataset == "dhcp":
		print "DHCP: NO NEED TO REZIP"
	elif dataset == "dns":
		print "DNS: NO NEED TO REZIP"
	elif dataset == "fwcheckpoint":
		randbin(dataset, monthday)	
	elif dataset == "fwpix":
		randbin(dataset, monthday)	
	#elif dataset =="idefense":
	#	print "IDEFENSE: NO NEED TO REZIP"
	else:
		sys.stderr.write( "[ERROR]:-Dataset not recognized" % (dataset) )
		logging.error("Dataset: %s not recognized !") % (dataset)
		sys.exit( 1 )
        logging.info("Step 1 Complete!") 
        print "###############################"

###############################
### Step 2 - Load HDFS
###############################
def load_hdfs(dataset, monthday):
	print "###############################"
	print "Starting Step 2 - Load HDFS:"
        logging.info("Starting Step 2- Load HDFS") 
	try:	
		mkdir_hdfs_cmd = "hadoop fs -mkdir %s%s/%s" % (hdfs_input_dir, dataset, monthday)
		load_hdfs_cmd = "hadoop fs -put %s%s/%s/gzipped/*.gz %s%s/%s" % (output_dir, dataset, monthday, hdfs_input_dir, dataset, monthday) 
		load_hdfs_in_cmd = "hadoop fs -put %s%s/%s/*.gz %s%s/%s" % (input_dir, dataset, monthday, hdfs_input_dir, dataset, monthday) 
	
		print "Running command:" +load_hdfs_cmd

        	if dataset == "active_directory":
			subprocess.call(mkdir_hdfs_cmd, shell=True)
			subprocess.call(load_hdfs_cmd, shell=True)
		elif dataset == "vpn":
			subprocess.call(mkdir_hdfs_cmd, shell=True)
			subprocess.call(load_hdfs_cmd, shell=True)
		elif dataset == "bluecoat":
			subprocess.call(mkdir_hdfs_cmd, shell=True)
			subprocess.call(load_hdfs_cmd, shell=True)
		elif dataset == "netscout":
			subprocess.call(mkdir_hdfs_cmd, shell=True)
			subprocess.call(load_hdfs_cmd, shell=True)
		elif dataset == "dhcp":
			subprocess.call(mkdir_hdfs_cmd, shell=True)
			subprocess.call(load_hdfs_in_cmd, shell=True)
		elif dataset == "dns":
			subprocess.call(mkdir_hdfs_cmd, shell=True)
			subprocess.call(load_hdfs_in_cmd, shell=True)
		elif dataset == "fwcheckpoint":
			subprocess.call(mkdir_hdfs_cmd, shell=True)
			subprocess.call(load_hdfs_cmd, shell=True)
		elif dataset == "fwpix":
			subprocess.call(mkdir_hdfs_cmd, shell=True)
			subprocess.call(load_hdfs_cmd, shell=True)
        	#elif dataset =="idefense":
         	#       print "IDEFENSE: NO NEED TO REZIP"
        	else:
                	sys.stderr.write( "[ERROR]:-Dataset not recognized" % (dataset) )
                	logging.error("Dataset: %s not recognized !") % (dataset)
                	sys.exit( 1 )
        except Exception, e:
		logging.error(str(e))
		usage('[ERROR]:-' +str(e))
        logging.info("Step 2 Complete!") 
        print "###############################"

###############################
### Step 3 - Run MR Jobs
###############################

def run_mr_jobs(dataset, monthday):
        print "###############################"
        print "Starting Step 3 - Run Map/Reduce Jobs:"
        logging.info("Starting Step 3 Run Map/Reduce Jobs!") 
        try:
		mr_cmd=scripts_dir+"./run_mr_%s.sh %s %s %s" % (dataset, dataset, monthday, scripts_dir)
        	print "Running command: "+mr_cmd
		
		if dataset == "active_directoy":
			print "Dataset AD, No parsing required - skipping"
		else:
			subprocess.call(mr_cmd, shell=True)
        except Exception, e:
		logging.error(str(e))
		usage('[ERROR]:-' +str(e))
        logging.info("Step 3 Complete!") 
	print "###############################"

###############################
### Step 4 - Create External Table
###############################

def crt_ext(dataset, monthday):
        print("###############################")
        print "Starting Step 4 - Create External Table:"
        logging.info("Starting Step 4 - Create External Table!")
	crt_ext_cmd = "sed 's/<CHANGE_MONTHDAY>/%s/g' ext/ext_%s.sql |psql -d visa_lab" % (monthday, dataset)
        print "Running command: "+crt_ext_cmd
	try:
		subprocess.call(crt_ext_cmd, shell=True)
        except Exception, e:
		logging.error(str(e))
                usage('[ERROR]:-' +str(e))
        logging.info("Step 4 Complete!") 
        print "###############################"

###############################
### Step 5 - Load GPDB
###############################

def load_gpdb(dataset, monthday):
        print "###############################"
        print "Starting Step 5 - Load GPDB"
        logging.info("Starting Step 5 - Load GPDB!")
	year=monthday[:4]
	load_trnsfrm_cmd = "sed -e 's/<CHANGE_MONTHDAY>/%s/g' -e 's/<CHANGE_YEAR>/%s/g' ext/load_trnsfrm_%s.sql |psql -d visa_lab" % (monthday, year, dataset)
        try:
		subprocess.call(load_trnsfrm_cmd, shell=True)
        except Exception, e:
		logging.error(str(e))
                usage('[ERROR]:-' +str(e))
        print "###############################"

###############################
### main
###############################

def main():

	parser = OptionParser( version="%prog 1.0" )
	parser.add_option( "-d", "--dataset", dest="dataset", help="Specify dataset to load (vpn, active_directory, fwpix, fwcheckpoint, dns, dhcp, bluecoat, netscout)")
	parser.add_option( "-m", "--monthday", dest="monthday", default=time.strftime("%Y%m%d"), help="Year/Month/Day of dataset (i.e. 201211)")
	parser.add_option( "-o", "--option", dest="option", help="Options (User Number to specify): 1-Rezip 2-Load HDFS 3-Run MapReduce Jobs 4-Create External Table 5-Load GPDB")
	(options, args) = parser.parse_args()

        print "###############################"
        print "Starting visa_auto.py w/ arguments: %s" % (options)
        logging.info("###############################")
        logging.info("Starting visa_auto.py w/ arguments: %s" % (options))
	if not options.dataset:
		sys.stderr.write( "[ERROR]:-No Dataset Specified Specified\n" )
		logging.error("No Dataset specified!")
        	print "###############################"
		sys.exit( 1 )
	else:
		global dataset    #Set by input parameters
		global monthday   #Set by input parameters

		dataset=options.dataset
		monthday=options.monthday
	
		if not options.option:
			pre_check()
			rezip(dataset, monthday)
			load_hdfs(dataset, monthday)
			run_mr_jobs(dataset,monthday)
			crt_ext(dataset, monthday)
			load_gpdb(dataset, monthday)
		elif options.option == "1":	#Rezip
			pre_check()
			rezip(dataset, monthday)
		elif options.option == "2":	#Load HDFS
			load_hdfs(dataset, monthday)
		elif options.option == "3":	#Run MapReduce
			run_mr_jobs(dataset, monthday)
		elif options.option == "4":	#Create External Tables
			crt_ext(dataset, monthday)
		elif options.option == "5":	#Load GPDB
			load_gpdb(dataset, monthday)
		else:
			sys.stderr.write( "[ERROR]:-No Dataset Specified Specified\n" )
			logging.error("Option not recognized (not in range 1-5")
			logging.error("Exiting")
        		print "###############################"
			sys.exit( 1 )
        print "Script Complete!"
        print "###############################"
        logging.info("Script Complete!")
        logging.info("###############################")


if __name__ == '__main__':
        main()
