#!/bin/bash
ori=`stat -f %z $1`

echo "Welcome to CodeMon! Watching $1 now..."
$2 &
pid=$!
echo "STARTED PID $pid"

while true; do
    #use trap to catch CTRL-C (SIGINT)
    trap "pkill -TERM -P $pid; exit" INT
    now=`stat -f %z $1`
    date=`date`
    if [[ $now != $ori ]]; then
        echo "--------"
        echo "Change detected @ $date"
        #send kill command to old run time
        pkill -TERM -P $pid
        #hide ugly kill message
        $2 &
        pid=$!
        echo "STARTED PID $pid"
        ori=$now
    fi
    sleep 1
done