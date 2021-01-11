#!/bin/sh

function make_content {
    for i in $(seq 1 $1); do printf "0"; done;
}

if [ -z ${USERAGENT+x} ]; then ua_header=""; else ua_header="-H User-Agent:$USERAGENT"; fi
if [ -z ${SLEEP+x} ]; then SLEEP=1; fi
if [ -z ${SIZE+x} ]; then extra_header=""; else extra_header="-H X-HTTP-MONKEY-EXTRA:$(make_content $SIZE)"; fi
if [ -z ${BACKGROUND+x} ]; then BACKGROUND=0; fi

if [ "$#" -eq 0 ]; then
    echo "Url not specified"
    exit 1
fi

while [ 1  ]
do
    for u in $@
    do
        if [ $BACKGROUND -eq "1" ]; then
            curl $ua_header $extra_header -v $u > /dev/null 2>&1 &
        else
            curl $ua_header $extra_header -v $u
        fi
    done
    
    sleep $SLEEP
done