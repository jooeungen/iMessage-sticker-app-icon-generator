#!/bin/bash
#
# Copyright (C) 2017 Dundin <jooeungen@gmail.com>
#
# Based on https://github.com/smallmuou/ios-icon-generator/blob/master/ios-icon-generator.sh
# from Wenva <lvyexuwenfa100@126.com>
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is furnished
# to do so, subject to the following conditions:
# 
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
# 
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
# THE SOFTWARE.

set -e

SRC_FILE_SQUARE="$1"
SRC_FILE_RECTANGLE="$2"
DST_PATH="$3"

VERSION=1.0.0

info() {
     local green="\033[1;32m"
     local normal="\033[0m"
     echo -e "[${green}INFO${normal}] $1"
}

error() {
     local red="\033[1;31m"
     local normal="\033[0m"
     echo -e "[${red}ERROR${normal}] $1"
}

usage() {
cat << EOF
VERSION: $VERSION
USAGE:
    $0 square_srcfile rectangle_srcfile dstpath

DESCRIPTION:
    This script aim to generate ios app icons easier and simply.

    square_srcfile - The source png image of square size. Preferably above 1024x1024
    rectangle_scrfile - The source png image of rectangle size. Preferably above 1200x768

    dstpath - The destination path where the icons generate to.

    This script is depend on ImageMagick. So you must install ImageMagick first
    You can use 'sudo brew install ImageMagick' to install it

AUTHOR:
    Dundin<jooeungen@gmail.com>

LICENSE:
    This script follow MIT license.

EXAMPLE:
    $0 square.png rectangle.png ~/project/resource
EOF
}

# Check ImageMagick
command -v convert >/dev/null 2>&1 || { error >&2 "The ImageMagick is not installed. Please use brew to install it first."; exit -1; }

# Check param
if [ $# != 3 ];then
    usage
    exit -1
fi

# Check dst path whether exist.
if [ ! -d "$DST_PATH" ];then
    mkdir -p "$DST_PATH"
fi

# For the exact size of the icons, refer to: https://developer.apple.com/ios/human-interface-guidelines/extensions/messaging/

info 'Generate iMessage Sticker IconImage...'
convert "$SRC_FILE_SQUARE" -resize 58x58 "$DST_PATH/05ipad_settings_29x29_2x.png"
convert "$SRC_FILE_SQUARE" -resize 58x58 "$DST_PATH/01iphone_settings_29x29_2x.png"
convert "$SRC_FILE_SQUARE" -resize 87x87 "$DST_PATH/02iphone_settings_29x29_3x.png"

convert "$SRC_FILE_RECTANGLE" -resize x40 "$DST_PATH/temp.png"
convert "$DST_PATH/temp.png" -gravity Center -crop 54x40+0+0 "$DST_PATH/09messages_27x20_2x.png"

convert "$SRC_FILE_RECTANGLE" -resize x60 "$DST_PATH/temp1.png"
convert "$DST_PATH/temp1.png"  -gravity Center -crop 81x60+0+0 "$DST_PATH/10messages_27x20_3x.png"

convert "$SRC_FILE_RECTANGLE" -resize x48 "$DST_PATH/temp2.png"
convert "$DST_PATH/temp2.png"  -gravity Center -crop 64x48+0+0 "$DST_PATH/12messages_32x24_2x.png"

convert "$SRC_FILE_RECTANGLE" -resize x72 "$DST_PATH/temp7.png"
convert "$DST_PATH/temp7.png"  -gravity Center -crop 96x72+0+0 "$DST_PATH/13messages_32x24_3x.png"

convert "$SRC_FILE_RECTANGLE" -resize x100 "$DST_PATH/temp3.png"
convert "$DST_PATH/temp3.png"  -gravity Center -crop 134x100+0+0 "$DST_PATH/06messages_ipad_67x50_2x.png"

convert "$SRC_FILE_RECTANGLE" -resize x110 "$DST_PATH/temp4.png"
convert "$DST_PATH/temp4.png"  -gravity Center -crop 148x110+0+0 "$DST_PATH/07messages_ipadPro_74x55_2x.png"

convert "$SRC_FILE_RECTANGLE" -resize x90 "$DST_PATH/temp5.png"
convert "$DST_PATH/temp5.png"  -gravity Center -crop 120x90+0+0 "$DST_PATH/03messages_iphone_60x45_2x.png"

convert "$SRC_FILE_RECTANGLE" -resize x135 "$DST_PATH/temp6.png"
convert "$DST_PATH/temp6.png"  -gravity Center -crop 180x135+0+0 "$DST_PATH/04messages_iphone_60x45_3x.png"

rm $DST_PATH/temp*.png


info 'Generate Done.'
