#!/bin/bash
defaultFilename=output.mp3
filename=${1:-$defaultFilename}

ffmpeg -t 136 -y -i AzureDayMarko.mpeg -af "afade=type=in:start_time=0:duration=5" -c:a libmp3lame $filename
