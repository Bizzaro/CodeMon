#!/bin/bash
ori=`stat -f %z $1`

echo "Welcome to CodeMon! Watching $1 now..."
$2 &
pid=$!
echo "STARTED PID $pid"

while true; do
    #use trap to catch CTRL-C (SIGINT)
    trap "kill -9 $pid; exit" INT
    now=`stat -f %z $1`
    date=`date`
    if [[ $now != $ori ]]; then
        echo "--------"
        echo "Change detected @ $date"
        #send kill command to old run time
        kill -9 $pid
        #hide ugly kill message
        wait $pid 2> /dev/null
        $2 &
        pid=$!
        echo "STARTED PID $pid"
        ori=$now
    fi
    sleep 1
done