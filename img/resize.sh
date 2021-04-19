#!/usr/bin/env bash

set -e

SIZES=( 2550 1920 1440 768 480 )
IN="$1"
OUT=$(basename "$1" | sed 's/\(.*\)\..*/\1/')

srcset=''

for size in "${SIZES[@]}"
do
	final="${OUT}_${size}.jpg"
	convert "$IN" -resize $size -quality 92 "$final"
	srcset="${srcset}img/${final} ${size}w, "
done

# remove trailing comma and space
srcset=${srcset::-2}

original=$(basename "$IN")

echo "<img src=\"img/${original}\""
echo "	   srcset=\"${srcset}\""
echo "     alt=\"Jan Hostettler\">"

