#!/bin/sh

function make_content {
    for i in $(seq 1 $1); do printf "0"; done;
}

if [ -z ${USERAGENT+x} ]; then ua_header=""; else ua_header="-H User-Agent:$USERAGENT"; fi
if [ -z ${SLEEP+x} ]; then SLEEP=1; fi
if [ -z ${SIZE+x} ]; then extra_header=""; else extra_header="-H X-HTTP-MONKEY-EXTRA:$(make_content $SIZE)"; fi

if [ "$#" -eq 0 ]; then
    echo "Url not specified"
    exit 1
fi

while [ 1  ]
do
    for u in $@
    do
        curl $ua_header $extra_header -v $u
    done
    
    sleep $SLEEP
done