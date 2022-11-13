#!/bin/sh

for f in *; do
    if [ -d "$f" ]; then
        # Will not run if no directories are available
        echo "$f"
        ./createvideofromimage.sh -i $f/*.jpeg -o $f/banner.mp4

    fi
done