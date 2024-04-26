#!/bin/bash

for file in /videos/*.mp4; do
    export fileName=$(basename $file .mp4)
    export url=rtsp://rtsp-server:8554/$fileName
    echo read rtsp from $(echo $url | sed "s/rtsp-server/$HOST_NAME/g")
    ffmpeg -d -re -stream_loop -1 -i $file -c copy -f rtsp $url &
done

tail -f /dev/null