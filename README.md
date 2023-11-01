# Script to Copy & Paste Images directly in Davinci Resolve
Script takes the current image saved to your clipboard and if it does not exists, creates a new "Clipboard" bin in the mediapool then it adds the newly saved image into that bin, Ready to be dragged into the timeline

**Works on Windows & MacOS**

## Installation MacOS
Stupidly easy to install.  
Download the `ImageClipboardMac.lua` file in releases.

Place the file in `/Users/<Username>/Library/Application Support/Blackmagic Design/DaVinci Resolve/Fusion/Scripts`

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
Download the `ImageClipboardWindows.lua` file in releases.

Place the file in `C:\Users\<Username>\AppData\Roaming\Blackmagic Design\DaVinci Resolve\Support\Fusion\Scripts\Edit\`
The script is accessed through `Workspace>Scripts>ImageClipboard` in Davinci Resolve.  

But before we can run the script, we need probably want to change one line inside the `ImageClipboardWindows.lua` file.  
Open it up with something like VSCode, Notepad or anything that can edit it.  

And change the Directory Path on `line 4 (ClipboardImagePath)` to be where you want the images to be saved at.  
Don't forget that you *need* a "/" at the end of the path to indicate inside the directory.  
*(Also don't forget that it needs to be a "/" and not "\\", this is for the entire path)*

You can also change the image prefix if you want but that's not needed.  
Now you can go back into Davinci Resolve and try it out!  

---
<p align="center">
  <img src="https://github.com/VilleOlof/DavinciClipboardScript/blob/main/Example.gif" alt="animated" />
</p>


---
This repo is a slightly improved version of https://github.com/VilleOlof/DavinciClipboardScript and the MacOS script is based on https://github.com/VilleOlof/DavinciClipboardScript/issues/4
