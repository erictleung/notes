# imagemagick Notes

# convert `sample.jpg` to gray scale
convert sample.jpg -colorspace Gray gray-sample.jpg

# resize image to the best it can i.e. retain aspect ratio
convert sample.jpg -resize 64x64 resize-sample.jpg

# resize but ignore aspect ratio
convert sample.jpg -resize 64x64\! resize-sample-no-ratio.jpg

# percentage resize
convert sample.jpg -resize 50% sample-percent-resize.jpg
