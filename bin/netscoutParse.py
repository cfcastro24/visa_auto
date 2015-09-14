#!/usr/bin/python

import sys


for line in sys.stdin:
   if line.startswith('TimeStamp'):
      continue

   line = line.strip()
   line = line.split(',',2)
   line.append(line[1])

   if line[1].count(':') < 9:
      l = line[1].split(':')
      while len(l) <= 9:
         l.insert(-1, '')
      line[1] = ':'.join(l)

   line[1] = line[1].replace(':', ',')
   line[1] = line[1].replace('->', ',')
   line[2] = line[2].replace('n/a', '')
   line = ','.join(line)

   print line
