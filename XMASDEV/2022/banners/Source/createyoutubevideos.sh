#!/bin/bash
 
test_json=$(echo "{ }" | jq)
if [ "$test_json" != "{}" ]; then
        echo "jq not installed"
        exit 1
fi
 
config=$1
 
if [ ! -f "$config" ]; then
        echo "config file $config not valid"
        exit 2
fi
 
json=$(cat $config)

while read user; do
    jq -r '.title' <<< $user
done <<< $(jq -c '.sessions[]' $config)


