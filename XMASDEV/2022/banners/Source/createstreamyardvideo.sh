#!/bin/bash

helpFunction()
{
   echo ""
   echo "Usage: $0 -i inputfilename"
   echo -e "\t-i Input File name"
   exit 1 # Exit script after printing help
}

while getopts "i:o:" opt
do
   case "$opt" in
      i ) parameterI="$OPTARG" ;;
      o ) parameterO="$OPTARG" ;;
      ? ) helpFunction ;; # Print helpFunction in case parameter is non-existent
   esac
done

# Print helpFunction in case parameters are empty
if [ -z "$parameterI" ]  || [ -z "$parameterO" ]
then
   echo "Some or all of the parameters are empty";
   helpFunction
fi

# Begin script in case all parameters are correct
echo "$parameterI"
echo "$parameterO"

rm $parameterO
# ffmpeg -loop 1 -i $parameterI -c:v libx264 -t 15 -pix_fmt yuv420p -vf scale=1920:1080 $parameterO

rm $parameterO

ffmpeg \
  -loop 1 -t 10 -i $parameterI \
  -loop 1 -t 10 -i ./sponsor-slide.png \
  -loop 1 -t 10 -i generic/track.png \
  -loop 1 -t 10 -i generic/attestato.png \
  -loop 1 -t 10 -i generic/selfielottery.png \
  -loop 1 -t 10 -i generic/mobileApp.png \
  -loop 1 -t 10 -i generic/sondaggio.png \
  -loop 1 -t 10 -i sponsor/sponsor1/sponsor1_1.png \
  -loop 1 -t 10 -i sponsor/sponsor1/sponsor1_2.png \
  -loop 1 -t 10 -i sponsor/sponsor2/sponsor2_1.png \
  -loop 1 -t 10 -i sponsor/sponsor2/sponsor2_2.png \
  -loop 1 -t 10 -i sponsor/sponsor3/sponsor3_1.png \
  -loop 1 -t 10 -i sponsor/sponsor3/sponsor3_2.png \
  -i audio.mp3 \
  -filter_complex "[0]scale=1920:1080[s0];[1]scale=1920:1080[s1];[2]scale=1920:1080[s2];[3]scale=1920:1080[s3];[4]scale=1920:1080[s4];[5]scale=1920:1080[s5];  \
  [6]scale=1920:1080[s6];[7]scale=1920:1080[s7];[8]scale=1920:1080[s8];[9]scale=1920:1080[s9];[10]scale=1920:1080[s10];[11]scale=1920:1080[s11];[12]scale=1920:1080[s12];
  [s0][s1]xfade=transition=pixelize:duration=1:offset=9,format=yuv420p[s01]; \
  [s01][s2]xfade=transition=pixelize:duration=1:offset=18,format=yuv420p[s02]; \
  [s02][s3]xfade=transition=pixelize:duration=1:offset=27,format=yuv420p[s03]; \
  [s03][s4]xfade=transition=pixelize:duration=1:offset=36,format=yuv420p[s04]; \
  [s04][s5]xfade=transition=pixelize:duration=1:offset=45,format=yuv420p[s05]; \
  [s05][s6]xfade=transition=pixelize:duration=1:offset=54,format=yuv420p[s06]; \
  [s06][s7]xfade=transition=pixelize:duration=1:offset=63,format=yuv420p[s07]; \
  [s07][s8]xfade=transition=pixelize:duration=1:offset=72,format=yuv420p[s08]; \
  [s08][s9]xfade=transition=pixelize:duration=1:offset=81,format=yuv420p[s09]; \
  [s09][s10]xfade=transition=pixelize:duration=1:offset=90,format=yuv420p[s010]; \
  [s010][s11]xfade=transition=pixelize:duration=1:offset=99,format=yuv420p[s011]; \
  [s011][s12]xfade=transition=pixelize:duration=1:offset=108,format=yuv420p" $parameterO

