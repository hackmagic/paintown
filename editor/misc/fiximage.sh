#!/bin/bash

# I guess imagemagick can support other formats... if you need one add it to the list

for f in $(find ./ -iname "*.png" -or -iname "*.bmp" -or -iname "*.jpg" -or -iname "*.jpeg" -or -iname "*.gif" | sed -e 's/\.\///g');do
	if [ "x$1" = "xreplace" ] || [ "x$1" = "x-r" ]; then
		convert -fill "rgb(255,0,255)" -opaque transparent -draw "color 0,0 floodfill" -trim $f $f
		echo "Converted $f"
	else
		convert -fill "rgb(255,0,255)" -opaque transparent -draw "color 0,0 floodfill" -trim $f new-$f
		echo "Converted $f to new-$f"
	fi
done

