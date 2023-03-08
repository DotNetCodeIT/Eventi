#!/bin/sh

for f in room*; do
    if [ -d "$f" ]; then
        # Will not run if no directories are available
        echo "$f"
        # ./createstreamyardvideo.sh -i $f/*.jpeg -o $f/$f.mp4
        ./createstreamyardvideo.sh -i ./$f/$f.jpeg -o ./output/$f.mp4
    fi
done