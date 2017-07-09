#!/bin/bash
# Fastest i3lock script with blur background. Replace megulock.png with any image to be shown in the middle,
# (try choosing a transparent .png obviously)
# place it in your /home/ directory, alternatively, change the directory in the script yourself,
# but longer directories may add load time which is counterproductive as the main goal of this script
# is to be the fastest. Change RES=* and and adjust it accordingly to your resolution or it wont work.

TMPBG=/tmp/screen.png
LOCK=$HOME/megulock.png
RES=1280x800

ffmpeg -f xllgrap -video_size $RES -y -i $DISPLAY -i $LOCK -filter_complex "boxblur=5:1,overlay=(main_w-overlay_w)/2:(main_h-overlay_h)/2" -vframes 1 $TMPBG
i3lock -u -i $TMPBG
rm /tmp/screen.png
