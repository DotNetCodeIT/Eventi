#!/bin/sh

for f in room*; do
    if [ -d "$f" ]; then
        # Will not run if no directories are available
        echo "$f"

        cp $f/*.jpeg "./outputimg/$f.jpeg"
    fi
done