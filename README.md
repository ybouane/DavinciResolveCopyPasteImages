# Davinci Resolve: Image Clipboard Script
Script takes the current image saved to your clipboard  
and if it does not exists, creates a new "Clipboard" bin in the mediapool  
then it adds the newly saved image into that bin, Ready to be dragged into the timeline

## Installation
Stupidly easy to install.  
Download the `ImageClipboard.lua` file in releases or clone repo.  

Place the file in `C:\Users\<user>\AppData\Roaming\Blackmagic Design\DaVinci Resolve\Support\Fusion\Scripts\Edit\`  
The script is accessed through `Workspace>Scripts>ImageClipboard` in Davinci Resolve.  

But before we can run the script, we need probably want to change one line inside the `.lua` file.  
Open it up with something like VSCode, Notepad or anything that can edit it.  
And change the Directory Path on `line 4 (ClipboardImagePath)` to be where you want the images to be saved at.  
Don't forget that you *need* a "/" at the end of the path to indicate inside the directory.  

You can also change the image prefix if you want but that's not needed.  
Now you can go back into Davinci Resolve and try it out!  

