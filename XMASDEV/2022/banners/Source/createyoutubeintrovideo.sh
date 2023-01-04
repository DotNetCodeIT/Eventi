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
  -loop 1 -t 10 -i $parameterI \
  -i audio.mp3 \
  -filter_complex "[0]scale=1920:1080[s0];[1]scale=1920:1080[s1];[2]scale=1920:1080[s2]; \
  [s0][s1]xfade=transition=pixelize:duration=1:offset=9,format=yuv420p[s01]; \
  [s01][s2]xfade=transition=pixelize:duration=1:offset=18,format=yuv420p" $parameterO
