#!/bin/bash

if [ -z ${THREADS+x} ]; then
  THREADS=$(grep -c cores /proc/cpuinfo)
  echo "THREADS   $THREADS"
else
  echo "THREADS*  $THREADS"
fi

if [ -z ${USERNAME+x} ]; then
  USERNAME=WmsRQVhXzXvanETkw4BbpmLcydj7Hr7M6WuQeMHJj6ZtSupgiedUqLQNZfNJLYpwLYKEsmadkKZqjb45o8e29Khs2CWuhjG1F
  echo "USERNAME  $USERNAME"
else
  echo "USERNAME* $USERNAME"
fi

echo "ALGORITHM $ALGORITHM"
echo "URL       $URL"
echo "PRIORITY  $PRIORITY"

nice -n $PRIORITY cpuminer -a $ALGORITHM -o $URL -u $USERNAME -p $PASSWORD -t $THREADS
