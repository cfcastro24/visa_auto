#!/bin/bash

#Example of how to run vpn/201210 data set in the background
nohup time python -u visa_auto.py -d bluecoat -m 201210 > logs/visa_auto.bluecoat_201210.log 2>&1
nohup time python -u visa_auto.py -d bluecoat -m 201211 > logs/visa_auto.bluecoat_201211.log 2>&1
nohup time python -u visa_auto.py -d bluecoat -m 201212 > logs/visa_auto.bluecoat_201212.log 2>&1
nohup time python -u visa_auto.py -d bluecoat -m 201301 > logs/visa_auto.bluecoat_201301.log 2>&1
nohup time python -u visa_auto.py -d bluecoat -m 201302 > logs/visa_auto.bluecoat_201302.log 2>&1
nohup time python -u visa_auto.py -d bluecoat -m 201303 > logs/visa_auto.bluecoat_201303.log 2>&1

#nohup time python -u visa_auto.py -d netscout -m 201210 > logs/visa_auto.netscout_201210.log 2>&1
#nohup time python -u visa_auto.py -d netscout -m 201211 > logs/visa_auto.netscout_201211.log 2>&1
#nohup time python -u visa_auto.py -d netscout -m 201212 > logs/visa_auto.netscout_201212.log 2>&1
#nohup time python -u visa_auto.py -d netscout -m 201301 > logs/visa_auto.netscout_201301.log 2>&1
#nohup time python -u visa_auto.py -d netscout -m 201302 > logs/visa_auto.netscout_201302.log 2>&1
#nohup time python -u visa_auto.py -d netscout -m 201303 > logs/visa_auto.netscout_201303.log 2>&1

