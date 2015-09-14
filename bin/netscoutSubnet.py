#!/usr/bin/env python

import sys
import os

# read the subnet data
subnet_lookup = {}
for line in os.popen('hadoop fs -cat /data/subnet/subnet-2013-02-05.csv'):
   if line[0] == 'N': continue
   
   s = [ part.replace(',', ';') for part in line.split('"')[1::2] ]

   subnet = s[1].strip('" ')
   try:
      cdir = int(s[3].strip('" /'))
   except:
      continue
   
   subnet_lookup[(subnet, cdir)] = ','.join(s)

def itr_lookup(ip):
   parts = [ int(p) for p in ip.split('.') ]
   b = 32
   for i in xrange(4):
      for j in xrange(8):
         yield '.'.join(str(p) for p in parts), b
         parts[3 - i] = parts[3 - i] / (2 ** (j + 1)) * (2 ** (j + 1))
         print parts
         b -= 1


def lookup(ip):
   for mip in itr_lookup(ip):
      try:
         return subnet_lookup[(mip[0], mip[1])]
      except:
         continue

   return ',' * 14

#print lookup('1.55.8.254')


for line in sys.stdin:
   if line.startswith('TimeStamp'):
      continue

   try:
      line = line.split(',',2)
      ips = line[1].split(':')[-1]
      ips = ips.split('->')


      print '%s,%s' % (ips[0], lookup(ips[0]))
      print '%s,%s' % (ips[1], lookup(ips[1]))
   except:
      print 'FAIL:', line
