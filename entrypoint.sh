#!/bin/sh

if [ -z ${USERAGENT+x} ]; then ua_header=""; else ua_header="User-Agent:$USERAGENT"; fi
if [ -z ${SLEEP+x} ]; then SLEEP=1; fi

if [ "$#" -eq 0 ]; then
    echo "Url not specified"
    exit 1
fi

while [ 1  ]
do
    for u in $@
    do
        curl -H $ua_header -v $u
    done
    
    sleep $SLEEP
done