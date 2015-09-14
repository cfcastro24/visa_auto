#!/bin/bash

DATASET=$1
MONTHDAY=$2
BINDIR=$3

HDFSINPUTDIR=/data/input/$DATASET/$MONTHDAY
HDFSOUTPUTDIR=/data/output/$DATASET/$MONTHDAY

hadoop jar /opt/dca/libexec/hadoop/contrib/streaming/hadoop-streaming-1.0.0-gphd-1.1.0.0.jar -D mapred.reduce.tasks=0 -file $BINDIR\fwpixParse.py -mapper $BINDIR\fwpixParse.py -input $HDFSINPUTDIR/*.gz -output $HDFSOUTPUTDIR
