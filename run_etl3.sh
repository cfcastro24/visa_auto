#!/bin/bash

#Example of how to run vpn/201210 data set in the background
nohup time python -u visa_auto.py -d dns -m 201210 > logs/visa_auto.dns_201210.log 2>&1
nohup time python -u visa_auto.py -d dns -m 201211 > logs/visa_auto.dns_201211.log 2>&1
nohup time python -u visa_auto.py -d dns -m 201212 > logs/visa_auto.dns_201212.log 2>&1
nohup time python -u visa_auto.py -d dns -m 201301 > logs/visa_auto.dns_201301.log 2>&1
nohup time python -u visa_auto.py -d dns -m 201302 > logs/visa_auto.dns_201302.log 2>&1
nohup time python -u visa_auto.py -d dns -m 201303 > logs/visa_auto.dns_201303.log 2>&1

nohup time python -u visa_auto.py -d dhcp -m 201210 > logs/visa_auto.dhcp_201210.log 2>&1
nohup time python -u visa_auto.py -d dhcp -m 201211 > logs/visa_auto.dhcp_201211.log 2>&1
nohup time python -u visa_auto.py -d dhcp -m 201212 > logs/visa_auto.dhcp_201212.log 2>&1
nohup time python -u visa_auto.py -d dhcp -m 201301 > logs/visa_auto.dhcp_201301.log 2>&1
nohup time python -u visa_auto.py -d dhcp -m 201302 > logs/visa_auto.dhcp_201302.log 2>&1
nohup time python -u visa_auto.py -d dhcp -m 201303 > logs/visa_auto.dhcp_201303.log 2>&1

