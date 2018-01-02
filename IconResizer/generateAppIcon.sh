#!/bin/bash -e

# --------------------------------------------------------
# Generate app icons and xcassets file from a single image
# Ben Clayton, Calvium Ltd. 
# --------------------------------------------------------
# To use this, place script in `appname` folder inside your project (i.e. the folder that Xcode generates for you containing your source code, it's named after whatever you called the app). 
# Create folder there called `RawImages`. 
# Source icon should 1024x1024 and be called appIcon.png. If the icon changes, you can just run this again to regenerate everything.
# This script assumes that you have the default setup of an Images.xcassets file containing the AppIcon.appiconset. 
# Adjust iconPath below if you use something different
sourceIconName="./appIcon.png"

# Ensure we're running in location of script.
#cd "`dirname $0`"

# Check imagemagick is installed
# http://stackoverflow.com/questions/592620/check-if-a-program-exists-from-a-bash-script
command -v convert >/dev/null 2>&1 || { echo >&2 "I require imagemagick but it's not installed.  Aborting."; exit 1; }

iconPath="Images.xcassets/AppIcon.appiconset"

mkdir -p "$iconPath"

# clean it out
rm -rf $iconPath/*.png

# iPhone and iPad iOS7+ Sizes
convert $sourceIconName -resize 40x40 $iconPath/iphone-icon-20@2x.png
convert $sourceIconName -resize 60x60 $iconPath/iphone-icon-20@3x.png
convert $sourceIconName -resize 58x58 $iconPath/iphone-icon-29@2x.png
convert $sourceIconName -resize 87x87 $iconPath/iphone-icon-29@3x.png
convert $sourceIconName -resize 80x80 $iconPath/iphone-icon-40@2x.png
convert $sourceIconName -resize 120x120 $iconPath/iphone-icon-40@3x.png
convert $sourceIconName -resize 120x120 $iconPath/iphone-icon-60@2x.png
convert $sourceIconName -resize 180x180 $iconPath/iphone-icon-60@3x.png
convert $sourceIconName -resize 20x120 $iconPath/ipad-icon-20.png
convert $sourceIconName -resize 40x40 $iconPath/ipad-icon-20@2x.png
convert $sourceIconName -resize 29x29 $iconPath/ipad-icon-29.png
convert $sourceIconName -resize 58x58 $iconPath/ipad-icon-29@2x.png
convert $sourceIconName -resize 40x40 $iconPath/ipad-icon-40.png
convert $sourceIconName -resize 80x80 $iconPath/ipad-icon-40@2x.png
convert $sourceIconName -resize 76x76 $iconPath/ipad-icon-76.png
convert $sourceIconName -resize 152x152 $iconPath/ipad-icon-76@2x.png
convert $sourceIconName -resize 167x167 $iconPath/ipad-icon-83.5@2x.png
convert $sourceIconName -resize 1024x1024 $iconPath/marketing-icon-1024.png


cat > "$iconPath/Contents.json" << EOF
{
  "images" : [
    {
      "idiom" : "iphone",
      "size" : "20x20",
      "scale" : "2x",
      "filename" : "iphone-icon-20@2x.png"
    },
    {
      "idiom" : "iphone",
      "size" : "20x20",
      "scale" : "3x",
      "filename" : "iphone-icon-20@3x.png"
    },
    {
      "idiom" : "iphone",
      "size" : "29x29",
      "scale" : "2x",
      "filename" : "iphone-icon-29@2x.png"
    },
    {
      "idiom" : "iphone",
      "size" : "29x29",
      "scale" : "3x",
      "filename" : "iphone-icon-29@3x.png"
    },
    {
      "size" : "40x40",
      "idiom" : "iphone",
      "scale" : "2x",
      "filename" : "iphone-icon-40@2x.png"
    },
    {
      "idiom" : "iphone",
      "size" : "40x40",
      "scale" : "3x",
      "filename" : "iphone-icon-40@3x.png"
    },
    {
      "idiom" : "iphone",
      "size" : "60x60",
      "scale" : "2x",
      "filename" : "iphone-icon-60@2x.png"
    },
    {
      "size" : "60x60",
      "idiom" : "iphone",
      "scale" : "3x",
      "filename" : "iphone-icon-60@3x.png"
    },
    {
      "idiom" : "ipad",
      "size" : "20x20",
      "scale" : "1x",
      "filename" : "ipad-icon-20.png"
    },
    {
      "idiom" : "ipad",
      "size" : "20x20",
      "scale" : "2x",
      "filename" : "ipad-icon-20@2x.png"
    },
    {
      "size" : "29x29",
      "idiom" : "ipad",
      "scale" : "1x",
      "filename" : "ipad-icon-29.png"
    },
    {
      "idiom" : "ipad",
      "size" : "29x29",
      "scale" : "2x",
      "filename" : "ipad-icon-29@2x.png"
    },
    {
      "idiom" : "ipad",
      "size" : "40x40",
      "scale" : "1x",
      "filename" : "ipad-icon-40.png"
    },
    {
      "idiom" : "ipad",
      "size" : "40x40",
      "scale" : "2x",
      "filename" : "ipad-icon-40@2x.png"
    },
    {
      "size" : "76x76",
      "idiom" : "ipad",
      "scale" : "1x",
      "filename" : "ipad-icon-76.png"
    },
    {
      "size" : "76x76",
      "idiom" : "ipad",
      "scale" : "2x",
      "filename" : "ipad-icon-76@2x.png"
    },
    {
      "idiom" : "ipad",
      "size" : "83.5x83.5",
      "scale" : "2x",
      "filename" : "ipad-icon-83.5@2x.png"
    },
    {
      "size" : "1024x1024",
      "idiom" : "ios-marketing",
      "scale" : "1x",
      "filename" : "marketing-icon-1024.png"
    }
  ],
  "info" : {
    "version" : 1,
    "author" : "xcode"
  }
}
EOF
