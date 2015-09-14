#!/usr/bin/env python

# to run this:
#   hadoop jar /opt/dca/libexec/hadoop/contrib/streaming/hadoop-streaming-1.0.0-gphd-1.1.0.0.jar -D mapred.reduce.tasks=0 -file fwpixparse.py -mapper fwpixparse.py -input /data/rezip/fwpix/*/*gz -output /data/csv/fwpix


import sys

for line in sys.stdin:
  line = line.strip()
  date = line[:15]
  rest = line[16:]
  ip, rest = rest.split(' ', 1)

  print '%s' % ('\t'.join([date, ip, rest]))

