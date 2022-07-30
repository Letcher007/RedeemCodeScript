symbols = {'A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z',1,2,3,4,5,6,7,8,9,0}

addEventHandler("onResourceStart", resourceRoot,
	function()
		database = dbConnect("sqlite", "files/database/database.db")
		dbExec(database, "CREATE TABLE IF NOT EXISTS donat(keyDonat, money, author, get)")
		dbExec(database, "CREATE TABLE IF NOT EXISTS data(idKey, keyDonat, name, money, time)")
		db = database
	end
)

addEvent("checkRules", true)
addEventHandler("checkRules", getRootElement(), function()
	if source then
		local accName = getAccountName(getPlayerAccount(source ))
    	if isObjectInACLGroup("user."..accName, aclGetGroup( "Admin" )) then
    		triggerClientEvent("startMenuKey", source)
    	end
    end
end)
addEvent("createKey", true)
addEventHandler("createKey", getRootElement(), function(money)
	if source and money then
		local accName = getAccountName(getPlayerAccount(source ))
		key = getRandomKey()
		id = getFreeID() or 1
		local time = getRealTime()
		local h = time.hour
		local m = time.minute
		local s = time.second
		dbExec(db, "INSERT INTO donat VALUES(?, ?, ?, ?)", key, money, accName, false)
		dbExec(db, "INSERT INTO data VALUES(?, ?, ?, ?, ?)", id, key, accName, money, h..":"..m..":"..s)
		outputChatBox("#FFFFFF'Donat Code' #FFFFFF- #FF8400"..key.." #FFFFFFOn #42E00D".. money .. "$", source,255,255,255,true)
		outputChatBox("#FFFFFFPlease write '#FF8400/donate#FFFFFF #FFFFFFto active donate code", source,255,255,255,true)
    end
end)

function getFreeID()
	local result = dbPoll(dbQuery(db, "SELECT * FROM data"), -1)
	newID = false
	for i, id in pairs (result) do
		if tonumber(id["idKey"] ~= i) then
			newID = i 
			break
		end
	end
	if newID then return newID else return #result + 1 end
end

addEvent("vvodKey", true)
addEventHandler("vvodKey", getRootElement(), function(key)
	if source and key then
		local data = dbPoll(dbQuery(db, "SELECT * FROM donat"), -1)
		if data then
			for k,v in pairs(data) do
				local typeKey = v["get"]
				local keyData = v["keyDonat"]
				local money = 	v["money"] 
				if key == keyData then
					money = v["money"] 
					givePlayerMoney(source, money)
					exports.global:giveMoney(source, money)
					if money and keyData then
							outputChatBox("#FFFFFFYou Activated	#FF8400 Donat Code #FFFFFF Received  #42E00D"..money.."$",source,255,255,255,true)
					end
					dbExec(db, "DELETE FROM donat WHERE keyDonat = ?", key)
				end
			end
		end
	end
end)

function getRandomKey()
	s1 = symbols[math.random(#symbols)]
	s2 = symbols[math.random(#symbols)]
	s3 = symbols[math.random(#symbols)]
	s4 = symbols[math.random(#symbols)]
	s5 = symbols[math.random(#symbols)]
	s6 = symbols[math.random(#symbols)]
	s7 = symbols[math.random(#symbols)]
	s8 = symbols[math.random(#symbols)]
	s9 = symbols[math.random(#symbols)]
	s10 = symbols[math.random(#symbols)]
	s11 = symbols[math.random(#symbols)]
	s12 = symbols[math.random(#symbols)]
	return s1..s2..s3..s4.."-"..s5..s6..s7..s8.."-"..s9..s10..s11..s12
end