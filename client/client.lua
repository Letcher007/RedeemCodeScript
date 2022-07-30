loadstring(exports.dgs:dgsG2DLoadHooker())()
loadstring(exports.dgs:dgsImportFunction())()

--addCommandHandler("gen_donate", function()
	--guiSetVisible(admKeys, true)
	--showCursor(true)
--end)-
----------------------------------------------------------------------------------
local screenW, screenH = guiGetScreenSize()

admKeys = guiCreateWindow((screenW - 290) / 2, (screenH - 151) / 2, 290, 151, "Generator Donat Code", false)
guiSetProperty(admKeys, "CaptionColour", "FF95FC02")
guiWindowSetMovable(admKeys, false)
----------------------------------------------------------------------------------
mony = guiCreateEdit(53, 41, 184, 32,"", false, admKeys)
guiSetProperty(mony, "Font", "default-bold-small")
guiSetProperty(mony, "NormalTextColour", "FF1E213D") 
guiEditSetMaxLength(mony, 7) 
----------------------------------------------------------------------------------		
infotext2 = guiCreateLabel(53, 82, 184, 23, "Creation Restrictions  \"Donate-code\"\n  min: 1.000 $ / max: 2.000.000$", false, admKeys)
guiSetFont(infotext2, "default-small")
guiLabelSetColor(infotext2, 142, 158, 0)    
----------------------------------------------------------------------------------
addBut = guiCreateButton(10, 116, 119, 27,"create", false, admKeys)
guiSetFont(addBut, "default-bold-small")
guiSetProperty(addBut, "NormalTextColour", "FF1BE800")
----------------------------------------------------------------------------------
cencelBut = guiCreateButton(161, 116, 119, 26,"close", false, admKeys)
guiSetFont(cencelBut, "default-bold-small")
guiSetProperty(cencelBut, "NormalTextColour", "FFE2052F")   
----------------------------------------------------------------------------------		
guiWindowSetSizable(admKeys,false)
guiSetVisible(admKeys, false)

addEvent("startMenuKey", true)
addEventHandler("startMenuKey", getRootElement(), function()
	if localPlayer == source then
		showCursor(true)
		guiSetVisible(admKeys, true)
	end
end)

addEventHandler("onClientGUIClick", getRootElement(), function()
	if source == cencelBut then
		guiSetVisible(admKeys, false)
		showCursor(false)
	elseif source == addBut then
		money = guiGetText(mony)

		if tonumber(money) >= 1000 and tonumber(money) <= 2000000 then

				triggerServerEvent("createKey", localPlayer, tonumber(money))
				guiSetVisible(admKeys, false)
				showCursor(false)
		end
	elseif source == cencel then
		guiSetVisible(menuDonat, false)
		showCursor(false)
	elseif source == setCode then
		keyDonat = guiGetText(editDonat)
		if keyDonat ~= "" then
			triggerServerEvent("vvodKey", localPlayer, keyDonat)
			guiSetVisible(menuDonat, false)
			showCursor(false)
		end
	end

end)
----------------------------------------------------------------------------------	
local screenW, screenH = guiGetScreenSize()
menuDonat = guiCreateWindow((screenW - 290) / 2, (screenH - 151) / 2, 290, 151, "Activation  Donate-Code", false)
guiWindowSetMovable(menuDonat, false)
guiWindowSetSizable(menuDonat, false)
guiSetProperty(menuDonat, "CaptionColour", "FFEE7E10")
----------------------------------------------------------------------------------	
editDonat = guiCreateEdit(53, 41, 184, 32,"", false, menuDonat)
guiSetProperty(editDonat, "Font", "default-bold-small")
guiSetProperty(editDonat, "NormalTextColour", "FF1E213D") 
----------------------------------------------------------------------------------
infotext01 = guiCreateLabel(56, 82, 179, 15, " Donate Code format': XXXX-XXXX-XXXX", false, menuDonat)
guiSetFont(infotext01, "default-small")
guiLabelSetColor(infotext01, 254, 220, 99)
----------------------------------------------------------------------------------		
infotext2 = guiCreateLabel(94, 94, 102, 15, " 16 characters (A-Z, 0-9)", false, menuDonat)
guiSetFont(infotext2, "default-small")
guiLabelSetColor(infotext2, 254, 98, 98)    
----------------------------------------------------------------------------------	
setCode = guiCreateButton(10, 116, 119, 27,"Activation", false, menuDonat)
guiSetFont(setCode, "default-bold-small")
guiSetProperty(setCode, "NormalTextColour", "FF1BE800")
----------------------------------------------------------------------------------	
cencel = guiCreateButton(161, 116, 119, 26,"Cancel", false, menuDonat)
guiSetFont(cencel, "default-bold-small")
guiSetProperty(cencel, "NormalTextColour", "FFE2052F")  
----------------------------------------------------------------------------------	
guiSetVisible(menuDonat, false)

addCommandHandler("donate", function()
	guiSetVisible(menuDonat, true)
	showCursor(true)
end)