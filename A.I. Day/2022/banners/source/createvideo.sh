#!/bin/sh

#ffmpeg -i room1_09_30/banner.mp4 -i ./aiday-sponsor.mp4 -c:v libx264  -filter_complex xfade=transition=vertclose:duration=1:offset=14 output.mp4

ffmpeg -f concat -i ./room1_09_30/banner.mp4 -i ./aiday-sponsor.mp4 -i ./room1_09_30/banner.mp4 -i A47.mp4 -filter_complex '[0:0][1:0]...[2:0]concat=n=10:v=0:a=1,volume=1dB[a0]; [3]volume=0.5dB[a1];[a0][a1]amerge[a]' -map '[a]' -strict -2 -y 10_with_music.mp4
