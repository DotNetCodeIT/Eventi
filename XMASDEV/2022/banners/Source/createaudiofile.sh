#!/bin/bash

ffmpeg -t 136 -i AzureDayMarko.mpeg -af "afade=type=in:start_time=0:duration=5" -c:a libmp3lame audio.mp3