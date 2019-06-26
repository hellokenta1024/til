#!/bin/sh

set -eu

cd ~/Desktop

ls Screen\ Shot*.png | while read f
do
  ym=$(echo $f | gsed -r 's/^Screen Shot ([0-9]+)-([0-9]+).*$/\1\2/g')
  mkdir -p "$ym"
  mv -n -v "$f" "$ym"
done