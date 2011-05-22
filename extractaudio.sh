#!/bin/bash
if [ "$1" == "" ] ; then
  echo
  echo "extractaudio 1.0/5.3.2011 by Oliver Prygotzki"
  echo "https://github.com/NoNoNo/shellscripts-extractaudio"
  echo
  echo "Extracts the audio track of a video file without transcoding:"
  echo "MP3 or M4A from container formats like MOV/AVI/FLV/M4V/MP4,"
  echo "with autodetection. Syntax: extractaudio INPUT.ext"
  echo "The audio track is saved as INPUT.ext.mp3 or INPUT.ext.m4a"
  echo 
  exit
fi

AUDIOCODEC=$(ffmpeg -i "$1" 2>&1 | grep Stream | grep Audio)

echo "${AUDIOCODEC}" | grep mp3 &> /dev/null
if [ "$?" -eq "0" ]; then
  nice ffmpeg -loglevel 0 -i "$1" -vn -acodec copy "$1".mp3
  if [ "$?" -eq "0" ]; then
    STATUSTEXT="Saved as $1.mp3"
  else
    STATUSTEXT="FFmpeg quit unsuccessfully!"
  fi  
else
  echo "${AUDIOCODEC}" | grep aac &> /dev/null
  if [ "$?" -eq "0" ]; then
    nice ffmpeg -loglevel 0 -i "$1" -vn -acodec copy "$1".temp.aac
    if [ "$?" -eq "0" ]; then
      nice MP4Box -add "$1".temp.aac "$1".m4a
      rm "$1".temp.aac
      STATUSTEXT="Saved as $1.m4a"
    else
      STATUSTEXT="FFmpeg quit unsuccessfully!"
    fi
  else 
    echo "${AUDIOCODEC}" | grep Audio &> /dev/null
    if [ "$?" -eq "0" ]; then
      STATUSTEXT="This script can only extract MP3 and AAC audio tracks!"
    else
      AUDIOCODEC="- Did not find audio track! -"
      STATUSTEXT=""
    fi
  fi
fi

echo
echo "The video contains this audio track:"
echo "${AUDIOCODEC}"
echo "${STATUSTEXT}"
echo
