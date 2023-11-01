-- Project folders and saved images directory configuration
-- Ensure the path ends with '/'
ClipboardImagePath = "/Users/ybouane/Downloads/"

-- Prefix for saved image filenames (DavinciCopy-0, DavinciCopy-1, DavinciCopy-2, ...)
ClipboardImagePrefix = "DavinciCopy-"

-- Name of the bin that will contain the copied images
local BinName = "Clipboard"

-- DaVinci Resolve API setup
local projman = resolve:GetProjectManager()
local proj = projman:GetCurrentProject()
local mediapool = proj:GetMediaPool()
local mediaStorage = resolve:GetMediaStorage()

local ProjectPath = ClipboardImagePath .. proj:GetName() .. "/"

-- Function to add a 'Clipboard' bin to the media pool
function AddClipboardBin(subFolders, root)
    if #subFolders == 0 then 
        mediapool:AddSubFolder(root, BinName)
        return
    end

    local foundClipboard = false

    for _, folder in pairs(subFolders) do
        if tonumber(folder) == nil then
            if folder:GetName() == BinName then
                foundClipboard = true
                break
            end
        end
    end

    if not foundClipboard then 
        mediapool:AddSubFolder(root, BinName)
    end
end

-- Function to retrieve the 'Clipboard' bin from the media pool
function GetClipboardBin(subFolders)
    for _, folder in pairs(subFolders) do
        if tonumber(folder) == nil and folder:GetName() == BinName then
            return folder
        end
    end
end

-- Function to count the number of image files in a directory
function GetFileCount(path, offset)
    local count = 0
    local command = "ls \"" .. path:sub(1, -2) .. "\" | grep -E \"" .. ClipboardImagePrefix .. "[0-9]+\\.png\" | wc -l"
    
    for line in io.popen(command):lines() do 
        count = tonumber(line)
    end
    
    return count + offset
end

-- Function to check if a directory exists
function DirExists(dir)
    local ok, _, code = os.rename(dir, dir)
    if not ok and code == 13 then
        return true
    end
    return ok
end

-- Function to create the project directory if it does not exist
function AddProjectDirectory()
    os.execute("mkdir -p \"" .. ProjectPath .. "\"")
end

-- Function to save an image from the clipboard
function SaveImageFromClipboard()
    local attempts = 0
    local path
    
    repeat
        path = ProjectPath .. ClipboardImagePrefix .. GetFileCount(ProjectPath, attempts) .. ".png"
        attempts = attempts + 1
    until not DirExists(path)

    local command = "osascript -e 'tell application \"System Events\" to set theImage to (the clipboard as «class PNGf»)' -e 'set theFile to (open for access POSIX file \"" .. path .. "\" with write permission)' -e 'write theImage to theFile' -e 'close access theFile'"
    os.execute(command)
end

-- Function to wait for a specified amount of time
function Wait(seconds)
    local endTime = os.clock() + seconds
    while os.clock() < endTime do end
end

-- Function to wait for a file to exist, with a timeout
function FileTimeout(filePath)
    local attempts = 0
    local limit = 10

    while attempts < limit do
        if io.open(filePath) then
            return true
        else
            attempts = attempts + 1
            Wait(0.25)
        end
    end

    return false
end

-- Main script
if not DirExists(ProjectPath) then
    AddProjectDirectory()
end

SaveImageFromClipboard()

local rootFolder = mediapool:GetRootFolder()
local subfolders = rootFolder:GetSubFolderList()

AddClipboardBin(subfolders, rootFolder)
local ClipboardFolder = GetClipboardBin(subfolders)

mediapool:SetCurrentFolder(ClipboardFolder)

local success = FileTimeout(ProjectPath)
if success then
    mediaStorage:AddItemListToMediaPool(ProjectPath)
end
