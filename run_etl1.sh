#!/bin/bash

#Run ETL1 datasets: active_directory
nohup time python -u visa_auto.py -d active_directory -m 201205_201210 > logs/visa_auto.active_directory_201205_201210.log 2>&1
nohup time python -u visa_auto.py -d active_directory -m 201211 > logs/visa_auto.active_directory_201211.log 2>&1
nohup time python -u visa_auto.py -d active_directory -m 201212 > logs/visa_auto.active_directory_201212.log 2>&1
nohup time python -u visa_auto.py -d active_directory -m 201301 > logs/visa_auto.active_directory_201301.log 2>&1
nohup time python -u visa_auto.py -d active_directory -m 201302 > logs/visa_auto.active_directory_201302.log 2>&1
nohup time python -u visa_auto.py -d active_directory -m 201303 > logs/visa_auto.active_directory_201303.log 2>&1

#Run ETL1 datasets: vpn
nohup time python -u visa_auto.py -d vpn -m 201210 > logs/visa_auto.vpn_201205_201210.log 2>&1
nohup time python -u visa_auto.py -d vpn -m 201211 > logs/visa_auto.vpn_201211.log 2>&1
nohup time python -u visa_auto.py -d vpn -m 201212 > logs/visa_auto.vpn_201212.log 2>&1
nohup time python -u visa_auto.py -d vpn -m 201301 > logs/visa_auto.vpn_201301.log 2>&1
nohup time python -u visa_auto.py -d vpn -m 201302 > logs/visa_auto.vpn_201302.log 2>&1
nohup time python -u visa_auto.py -d vpn -m 201303 > logs/visa_auto.vpn_201303.log 2>&1

