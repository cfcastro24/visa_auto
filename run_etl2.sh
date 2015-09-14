#!/bin/bash

#Run ETL1 datasets: fwpix
nohup time python -u visa_auto.py -d fwpix -m 201210 > logs/visa_auto.fwpix_201210.log 2>&1
nohup time python -u visa_auto.py -d fwpix -m 201211 > logs/visa_auto.fwpix_201211.log 2>&1
nohup time python -u visa_auto.py -d fwpix -m 201212 > logs/visa_auto.fwpix_201212.log 2>&1
nohup time python -u visa_auto.py -d fwpix -m 201301 > logs/visa_auto.fwpix_201301.log 2>&1
nohup time python -u visa_auto.py -d fwpix -m 201302 > logs/visa_auto.fwpix_201302.log 2>&1
nohup time python -u visa_auto.py -d fwpix -m 201303 > logs/visa_auto.fwpix_201303.log 2>&1

#Run ETL1 datasets: fwcheckpoint
nohup time python -u visa_auto.py -d fwcheckpoint -m 201210 > logs/visa_auto.fwcheckpoint_201210.log 2>&1
nohup time python -u visa_auto.py -d fwcheckpoint -m 201211 > logs/visa_auto.fwcheckpoint_201211.log 2>&1
nohup time python -u visa_auto.py -d fwcheckpoint -m 201212 > logs/visa_auto.fwcheckpoint_201212.log 2>&1
nohup time python -u visa_auto.py -d fwcheckpoint -m 201301 > logs/visa_auto.fwcheckpoint_201301.log 2>&1
nohup time python -u visa_auto.py -d fwcheckpoint -m 201302 > logs/visa_auto.fwcheckpoint_201302.log 2>&1
nohup time python -u visa_auto.py -d fwcheckpoint -m 201303 > logs/visa_auto.fwcheckpoint_201303.log 2>&1

