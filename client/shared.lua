function open_win()
if guiSetVisible(admKeys,true) then
    guiSetVisible(admKeys,false)
end
if getPlayerSerial(source) == "your serial" or getPlayerSerial(thePlayer) == "" then
guiSetVisible(admKeys, true)
showCursor(true)
else 
outputChatBox("You do not have permissions to access this board", 255, 0, 0)
end
end 
addCommandHandler("gen_code", open_win)