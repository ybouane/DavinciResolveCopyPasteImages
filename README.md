# Script to Copy & Paste Images directly in Davinci Resolve
Script takes the current image saved to your clipboard and if it does not exists, creates a new "Clipboard" bin in the mediapool then it adds the newly saved image into that bin, Ready to be dragged into the timeline

**Works on Windows & MacOS**

## Installation MacOS
Stupidly easy to install.  
Download the [ImageClipboardMac.lua](https://github.com/ybouane/DavinciResolveCopyPasteImages/releases/latest/download/ImageClipboardMac.lua) file in releases.

Place the file in `/Users/<Username>/Library/Application Support/Blackmagic Design/DaVinci Resolve/Fusion/Scripts/Utility/`

*Tip: You can use `Cmd+Shift+.` to show hidden folders/files in Finder.*

The script is accessed through `Workspace>Scripts>ImageClipboard` in Davinci Resolve.  

But before we can run the script, we need probably want to change one line inside the `ImageClipboardMac.lua` file.  
Open it up with something like VSCode, TextEdit or anything that can edit it.  

And change the Directory Path on `line 4 (ClipboardImagePath)` to be where you want the images to be saved at.  
Don't forget that you *need* a "/" at the end of the path to indicate inside the directory.  

You can also change the image prefix if you want but that's not needed.
Now you can go back into Davinci Resolve and try it out!

## Installation Windows
Stupidly easy to install.  
Download the [ImageClipboardWindows.lua](https://github.com/ybouane/DavinciResolveCopyPasteImages/releases/latest/download/ImageClipboardWindows.lua) file in releases.

Place the file in `C:\Users\<Username>\AppData\Roaming\Blackmagic Design\DaVinci Resolve\Support\Fusion\Scripts\Utility\`
The script is accessed through `Workspace>Scripts>ImageClipboard` in Davinci Resolve.  

But before we can run the script, we need probably want to change one line inside the `ImageClipboardWindows.lua` file.  
Open it up with something like VSCode, Notepad or anything that can edit it.  

And change the Directory Path on `line 4 (ClipboardImagePath)` to be where you want the images to be saved at.  
Don't forget that you *need* a "/" at the end of the path to indicate inside the directory.  
*(Also don't forget that it needs to be a "/" and not "\\", this is for the entire path)*

You can also change the image prefix if you want but that's not needed.  
Now you can go back into Davinci Resolve and try it out!  


## Assign custom keyboard shortcut to the script
Once the script is installed, you can assign a keyboard shortcut to make the use of the script easier:
<img width="1140" alt="image" src="https://github.com/ybouane/DavinciResolveCopyPasteImages/assets/14046002/8ad60130-bbd5-4745-8dc5-65bc27c5b093">


---
<p align="center">
  <img src="https://github.com/VilleOlof/DavinciClipboardScript/blob/main/Example.gif" alt="animated" />
</p>


---
This repo is a slightly improved version of https://github.com/VilleOlof/DavinciClipboardScript and the MacOS script is based on https://github.com/VilleOlof/DavinciClipboardScript/issues/4
