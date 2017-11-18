# App icon generator for iMessageSticker

This shell script is to generate all the necessary app icons for iMessageSticker of different sizes and ratios with a single command. 

## Requirement
This script uses ImageMagick. So you must install ImageMagick before using this script. You can install ImageMagick with following command. 

```
$ sudo brew install ImageMagick
```


## Usage 

Run the script with two source image path and a destination path.

```
$ sh iMessageSticker-icon-generator.sh [SRC_FILE_SQUARE] [SRC_FILE_RECTANGLE] [DST_PATH]

// EXAMPLE
$ sh iMessageSticker-icon-generator.sh ~/project/square.png ~/projet/rectangle.png ~/project/resource

```
The preferable size of the input source images is as follows.

* Square Image : 1024x1024 pixel
* Rectangle Image : 1200x768 pixel 

After running the script, there will be 11 resulting image files in the destination path. Now you can fill the iMessage App Icon like the following screenshot. 

<center><img alt="App Icon Screenshot" src="https://raw.githubusercontent.com/jooeungen/iMessage-sticker-app-icon-generator/master/app_icon_screenshot.png" /></center>




