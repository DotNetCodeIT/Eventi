#!/bin/sh

ffmpeg \
  -loop 1 -t 5 -i generic/attestato.png \
  -loop 1 -t 5 -i generic/selfielottery.png \
  -loop 1 -t 5 -i generic/sondaggio.png \
   -loop 1 -t 5 -i generic/track.png \
  -filter_complex "[0]scale=500:500[s0];[1]scale=500:500[s1];[2]scale=500:500[s2];[3]scale=500:500[s3]; \
  [s0][s1]xfade=transition=pixelize:duration=1:offset=4,format=yuv420p[s01]; \
  [s01][s2]xfade=transition=pixelize:duration=1:offset=8,format=yuv420p[s02]; \
  [s02][s3]xfade=transition=pixelize:duration=1:offset=12,format=yuv420p" out.mp4

