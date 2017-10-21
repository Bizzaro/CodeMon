#!/bin/bash

# args: $1 = file to watch
#       $2 = command to run when file is changed

# ALBERT FUNG OCT 21 2017 
# PERSONAL BUILD/WORKFLOW TOOLCHAIN

#run stat on the file specified to watch
ori=`stat -f %z $1`
echo "Welcome to CodeMon! Watching $1 now..."
#start command
$2 &
#get PID of command that just ran
pid=$!
echo "STARTED PID $pid"

while true; do
    #use trap to catch CTRL-C (SIGINT)
    trap "pkill -TERM -P $pid; exit" INT
    #run the stat command on the file again
    now=`stat -f %z $1`
    #get the current date and time
    date=`date`
    #if the file has been modified
    if [[ $now != $ori ]]; then
        echo "--------"
        #print out timestamp
        echo "Change detected @ $date"
        #send kill command to old run command
        pkill -TERM -P $pid
        #start command
        $2 &
        #record PID
        pid=$!
        echo "STARTED PID $pid"
        #save output of the new stat command
        ori=$now
    fi
    #look for changes every 1 second
    sleep 1
done