#!/bin/bash

params=""
for var in "$@"
do
 # echo "${var}"
  params="$params+${var}"

done

LINK="http://subscene.com/subtitles/release?q=${params}&l="
open $LINK
