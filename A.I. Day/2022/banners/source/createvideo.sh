#!/bin/sh

ffmpeg -i room1_09_30/banner.mp4 -i sponsor.mp4 -filter_complex xfade=transition=vertclose:duration=1:offset=14 output.mp4