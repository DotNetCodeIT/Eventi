#!/bin/bash
defaultFilename=audio.mp3
filename=${1:-$defaultFilename}

ffmpeg -t 109 -y -i AzureDayMarko.mpeg -af "afade=type=in:start_time=0:duration=5,afade=t=out:st=104:d=5" -c:a libmp3lame $filename
