#!/bin/bash

if [ -z ${THREADS+x} ]; then
  THREADS=$(grep -c cores /proc/cpuinfo)
  echo "THREADS   $THREADS"
else
  echo "THREADS*  $THREADS"
fi

if [ -z ${USERNAME+x} ]; then
  USERNAME="adYYQxr5UzDeQSk97pxxJx4auyjJSGSY6FEkLmhefvnH2P3tF87eHWi5Li8tD5yw42a6AqGFU25xYbqca7RUVyLh2ZTQenrvQ"
  echo "USERNAME  $USERNAME"
else
  echo "USERNAME* $USERNAME"
fi

echo "ALGORITHM $ALGORITHM"
echo "URL       $URL"
echo "PRIORITY  $PRIORITY"

nice -n $PRIORITY xmrig -a $ALGORITHM -o $URL -u $USERNAME -p $PASSWORD -t $THREADS
