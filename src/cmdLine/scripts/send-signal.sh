#!/bin/bash
 
signal_caught_sigterm() {
  echo "Script cancellation by SIGTERM...."
  exit 0
}

# trap signal_caught_sigterm SIGTERM
counter=0;

while true;
do
  while :; do echo 'Hit CTRL+C'; sleep 1; done
  if [[ $counter -eq 10 ]];
  then
    ps -ef | grep 'CmdLine_' | grep -v grep | awk '{print $2}' | xargs -r kill -2
  fi
  
  if [[ $counter -eq 20 ]];
  then
    exit 1
  fi
  
  sleep 1;
  ((counter++))
done
