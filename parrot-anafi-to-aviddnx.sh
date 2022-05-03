#!/bin/sh

if [ -d $1 ]; then
    filelist=$(ls $1P0*MP4)
else
    echo 'Directory is not valid!'
    exit 1
fi

for inputfile in $filelist
do
    outputfile=${inputfile//MP4/'mov'}
    ffmpeg -nostdin -i $inputfile -c:v dnxhd -vf "scale=1920:1080,fps=60,format=yuv422p" -b:v 120M -y -an $outputfile
done
exit 0
