#!/usr/bin/env python

# to run this:
#   hadoop jar /opt/dca/libexec/hadoop/contrib/streaming/hadoop-streaming-1.0.0-gphd-1.1.0.0.jar -D mapred.reduce.tasks=0 -file bluecoatparse.py -mapper bluecoatparse.py -input /data/rezip/bluecoat/ -output /data/csv/bluecoat


import sys

for line in sys.stdin:
	if line.startswith('#'):
		continue
	
	line = line.strip()
	words1 = line.split('"')
	words2 = []
	for idx, word in enumerate(words1):
		if idx % 2 == 0:
			words2.extend(word.split())
		else:
			words2.append(word.strip())
	print '%s' % ('\t'.join(words2))
