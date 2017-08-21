#!/bin/bash

if [ -z ${THREADS+x} ]; then
  THREADS=$(grep -c cores /proc/cpuinfo)
  echo "THREADS   $THREADS"
else
  echo "THREADS*  $THREADS"
fi

if [ -z ${USERNAME+x} ]; then
  USERNAME=iz4TVAV4CCH37f29dHNmE2dG1U8txxbTvhzJ7x55TmR2TevMZY91imK5z8PZAgAuihQ9YyrxVfiWPSiMbviZLZt229UzCRkxP
  echo "USERNAME  $USERNAME"
else
  echo "USERNAME* $USERNAME"
fi

echo "ALGORITHM $ALGORITHM"
echo "URL       $URL"
echo "PRIORITY  $PRIORITY"

nice -n $PRIORITY cpuminer -a $ALGORITHM -o $URL -u $USERNAME -p $PASSWORD -t $THREADS
