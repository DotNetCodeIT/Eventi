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

video=()
videodata=()
while read session; do
   title=$(jq -r '.title' <<< "$session")
   #echo $title
   description=$(jq -r '.description' <<< "$session")
   #echo $description
   roomId=$(jq -r '.roomId' <<< "$session")
   sessionId=$(jq -r '.id' <<< "$session")
   liveStart=$(jq -r '.liveStartsAt' <<< "$session")
   liveEnd=$(jq -r '.liveEndsAt' <<< "$session")
   echo ffmpeg -ss $liveStart -to $liveEnd -i "$roomId.mp4" -c copy "$sessionId.mp4" -y
   video+=("ffmpeg -ss $liveStart -to $liveEnd -i ""$roomId.mp4"" -c copy ""$sessionId.mp4"" -y")
   echo "{\"title\": \"$title\",\"description\":\"$description\"}" > "$sessionId.json"
  #echo $json_data
  #echo $json_data > $sessionId.json
  #videodata+=("$json_data")
   videodata+=("{\"title\": \"$title\",\"description\":\"$description\"}")
  #videodata+=("$json_data")
done <<< $(jq -c '.sessions[]' $config)
#echo ${video[@]}
for i in ${!video[@]} # "${video[@]}"
do
   ${video[$i]}
   echo ${videodata[$i]}
   # or do whatever with individual element of the array
done

json=$(cat $config)


readJsonConfig() {
        echo $json | jq -r $1
}

echo $(readJsonConfig ".groupName")

