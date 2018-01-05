#!/bin/bash

if [ -z ${THREADS+x} ]; then
  THREADS=$(grep -c cores /proc/cpuinfo)
  echo "THREADS   $THREADS"
else
  echo "THREADS*  $THREADS"
fi

if [ -z ${USERNAME+x} ]; then
  USERNAME="1NxArbhConL6QCZArbX7fYERiG35At4aNbjeuJ5E7WRZPpRFnJd2KdGR6SFZkWYeDZc8s6QtbQr2Gdc2LC34QZ8oUvYiSWR"
  echo "USERNAME  $USERNAME"
else
  echo "USERNAME* $USERNAME"
fi

echo "ALGORITHM $ALGORITHM"
echo "URL       $URL"
echo "PRIORITY  $PRIORITY"

nice -n $PRIORITY xmrig -a $ALGORITHM -o $URL -u $USERNAME -p $PASSWORD -t $THREADS
