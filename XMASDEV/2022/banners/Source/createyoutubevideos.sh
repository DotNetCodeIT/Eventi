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



while read youtube; do
   roomId=$(jq -r '.roomId' <<< "$youtube")
   echo $roomId
   url=$(jq -r '.url' <<< "$youtube")
   echo $url
   yt-dlp --downloader aria2c -S res,ext:mp4:m4a --recode mp4  $url -o "$roomId.mp4"

   
done <<< $(jq -c '.youtubelive[]' $config)


while read session; do
   title=$(jq -r '.title' <<< "$session")
   echo $title
   description=$(jq -r '.description' <<< "$session")
   echo $description
   roomId=$(jq -r '.roomId' <<< "$session")
   sessionId=$(jq -r '.id' <<< "$session")
   liveStart=$(jq -r '.liveStartsAt' <<< "$session")
   liveEnd=$(jq -r '.liveEndsAt' <<< "$session")
   echo ffmpeg -ss $liveStart -to $liveEnd -i "$roomId.mp4" -c copy "$sessionId.mp4" -y
   ffmpeg -ss $liveStart -to $liveEnd -i "$roomId.mp4" -c copy "$sessionId.mp4" -y
   sleep 5s # Waits 5 seconds.
done <<< $(jq -c '.sessions[]' $config)

json=$(cat $config)

readJsonConfig() {
        echo $json | jq -r $1
}

echo $(readJsonConfig ".groupName")

