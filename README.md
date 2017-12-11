# App icon generator for iMessageSticker

This shell script is to generate all the necessary app icons for iMessageSticker of different sizes and ratios with a single command. It also includes Contents.json file so that you don't have to drag each of the image files to the project. 

## Requirement
This script uses ImageMagick. So you must install ImageMagick before using this script. You can install ImageMagick with following command. 

```
$ sudo brew install ImageMagick
```

If you don't have brew installed yet, install brew first. 

```
$ /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```


## Usage 

Run the script with two source image paths in terminal. You can easily get the path of the image by dragging the image into the terminal window. 

```
$ sh iMessageSticker-icon-generator.sh [SRC_FILE_SQUARE] [SRC_FILE_RECTANGLE]

// EXAMPLE
$ sh iMessageSticker-icon-generator.sh ~/project/square.png ~/projet/rectangle.png
```

The preferable size of the input source images is as follows.

* Square Image : 1024x1024 pixel
* Rectangle Image : 1200x768 pixel

After running the script, there will be 11 resulting image files and a Content.json file in the resource folder. By simply dragging all the images and json file to ```[YOUR XCODE PROJECT PATH]/StickerPackExtension/Stickers.xcstickers/iMessage App Icon.stickersiconset```.

Then the images are filled automatically in Xcode project like the following screenshot. 

<center><img alt="App Icon Screenshot" src="https://raw.githubusercontent.com/jooeungen/iMessage-sticker-app-icon-generator/master/app_icon_screenshot.png" /></center>

Don't get mad with photoshop resizing any more! 



