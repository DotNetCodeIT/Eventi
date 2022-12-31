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

while read session; do
    title = jq -r '.title' <<< $session
    echo $(title)
    description = jq -r '.description' <<< $session
    echo $(description)
done <<< $(jq -c '.sessions[]' $config)

json=$(cat $config)

readJsonConfig() {
        echo $json | jq -r $1
}

echo $(readJsonConfig ".groupName")

