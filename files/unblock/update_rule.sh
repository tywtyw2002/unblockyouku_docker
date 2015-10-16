#!/bin/bash

TMP_RULE_PATH=/tmp/new_rules

update_rules() {
    curl -o $TMP_RULE_PATH http://pac.uku.im/regex
}

check_rules() {
    diff -q $1 /tmp/new_rules > /dev/null
    if (($? == 1)); then
        mv $1 $1.bak-`date +"%Y%m%d"`
        mv $TMP_RULE_PATH $1
        /usr/bin/supervisorctl restart squid
    else
        rm $TMP_RULE_PATH
    fi
}

if [ -z "$1" ]; then
    echo "Usage: $0 RULE_FILE"
    exit 1
fi

if [ ! -f $1 ]; then
    echo "File: $1 does not exists!"
    exit 2
fi

update_rules
check_rules $1

