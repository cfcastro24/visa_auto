#!/bin/bash

DATASET=$1
MONTHDAY=$2

INPUTDIR=/data1/input/$DATASET/$MONTHDAY
OUTPUTDIR=/data2/output/$DATASET/$MONTHDAY

BINS=`/data1/auto_scripts/bin/./numsplits.sh $INPUTDIR`


echo making $OUTPUTDIR
mkdir $OUTPUTDIR


echo making $BINS split directories
for i in `seq 1 $BINS`
do
  mkdir $OUTPUTDIR/split_$i
done

NUMFILES=`ls $INPUTDIR | wc -l`
echo there are $NUMFILES number of files that will be copied

echo binning and unzipping the files
COUNT=0
for f in `ls $INPUTDIR`
do
   cat $INPUTDIR/$f | gunzip > $OUTPUTDIR/split_$[$RANDOM % $BINS + 1]/$f.unzipped
   COUNT=$[COUNT + 1]
   echo $COUNT out of $NUMFILES complete: $[$COUNT * 100 / $NUMFILES]'%'
done


echo reconstituting directories as single gzip files
mkdir $OUTPUTDIR/gzipped/
for i in `seq 1 $BINS`
do
  echo "  " working on split_$i
  cat $OUTPUTDIR/split_$i/* | gzip > $OUTPUTDIR/gzipped/split_$i.gz
done

echo cleaning up unzipped files
for i in `seq 1 $BINS`	
do
  echo "  " removing folder split_$i
  rm -Rf $OUTPUTDIR/split_$i
done
