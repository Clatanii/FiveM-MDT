----------------------------------------------
----    ---   / AUTHOR: ALPHA \   ----	  ----
----------------------------------------------

-- Alpha Email: clatani123123@gmail.com
-- SRR Email: statewiderealisticrp@gmail.com
-- Alpha Discord: Alpha#5199

----------------------------------------------
---- YOU HAVE NO RIGHTS TO COPY/UPLOAD OR ----
---- CLAIM THIS SCRIPT(BASE) AS YOURS.    ----
----------------------------------------------
-- *CC* Valdemar Hägglund

-----------------------------
--- */* SCRIPT EVENTS */* ---
-----------------------------

-- */* EVENT FOR SHOWING CHAR WINDOW AT JOIN IF TURNED ON IF CONFIG */*
RegisterServerEvent("CHAR:SHOW_AT_JOIN")
AddEventHandler("CHAR:SHOW_AT_JOIN", function()
	local PLAYER = source
	local STEAMID = GetSteamID(PLAYER)
	
	SRR_CHAR_INFO(PLAYER, STEAMID)
end)

-------------------------------
--- */* SCRIPT COMMANDS */* ---
-------------------------------

-- Character Part (/char(acter) command)
RegisterCommand("character", function(source, args, rawCommand)
	local PLAYER = source
	local STEAMID = GetSteamID(PLAYER)
	--
	TriggerClientEvent("CORE_FIX:CLOSE_1", PLAYER)
	--
	-- SHOW CHARACTER INFO --
	if args[1] == nil then
		SRR_CHAR_INFO(PLAYER, STEAMID)	
	elseif args[1] == "create" then
		-- IF IT IS WRONG SYNTAX --
		if args[5] == nil or args[6] then
			TriggerClientEvent('chatMessage', PLAYER, "^1[CMD_INP_ERR] -[D]- {SYNTAX ERROR} -[S]- {USE CORRECT SYNTAX}", {255, 255, 255})
		-- IF GENDER IS NOT VALID --
		elseif args[5] ~= "Male" and args[5] ~= "Female" then
			TriggerClientEvent('chatMessage', PLAYER, "^1[CMD_INP_ERR] -[D]- {STRING: GENDER} -[S]- {VALID INPUT: Male & Female}")
		-- CREATE CHARACTER --
		else
			SRR_CHAR_RESET(PLAYER, STEAMID)
			Citizen.Wait(1) 
			SRR_CHAR_CREATE(PLAYER, STEAMID, args[2], args[3], args[4], args[5])
			TriggerClientEvent("SRR_CHAR:s_Notify", PLAYER, "" .. mdt.Server_Color .. "CHAR: ~w~"..args[2].." "..args[3].." Was created successfully")
			--
			Citizen.Wait(1000) 
			SRR_CHAR_INFO(PLAYER, STEAMID)
			--
		end
	-- RESET CHARACTER --
	elseif args[1] == "reset" then
		SRR_CHAR_RESET(PLAYER, STEAMID)
		TriggerClientEvent("SRR_CHAR:s_Notify", PLAYER, "" .. mdt.Server_Color .. "CHAR: ~w~Character was removed successfully")
	end
end, false)

-- Character Part (/char command)
RegisterCommand("char", function(source, args, rawCommand)
	local PLAYER = source
	local STEAMID = GetSteamID(PLAYER)
	--
	TriggerClientEvent("CORE_FIX:CLOSE_1", PLAYER)
	--
	-- SHOW CHARACTER INFO --
	if args[1] == nil then
		SRR_CHAR_INFO(PLAYER, STEAMID)	
	elseif args[1] == "create" then
		-- IF IT IS WRONG SYNTAX --
		if args[5] == nil or args[6] then
			TriggerClientEvent('chatMessage', PLAYER, "^1[CMD_INP_ERR] -[D]- {SYNTAX ERROR} -[S]- {USE CORRECT SYNTAX}", {255, 255, 255})
		-- IF GENDER IS NOT VALID --
		elseif args[5] ~= "Male" and args[5] ~= "Female" then
			TriggerClientEvent('chatMessage', PLAYER, "^1[CMD_INP_ERR] -[D]- {STRING: GENDER} -[S]- {VALID INPUT: Male & Female}")
		-- CREATE CHARACTER --
		else
			SRR_CHAR_RESET(PLAYER, STEAMID)
			Citizen.Wait(1) 
			SRR_CHAR_CREATE(PLAYER, STEAMID, args[2], args[3], args[4], args[5])
			TriggerClientEvent("SRR_CHAR:s_Notify", PLAYER, "" .. mdt.Server_Color .. "CHAR: ~w~"..args[2].." "..args[3].." Was created successfully")
			--
			Citizen.Wait(1000) 
			SRR_CHAR_INFO(PLAYER, STEAMID)
			--
		end
	-- RESET CHARACTER --
	elseif args[1] == "reset" then
		SRR_CHAR_RESET(PLAYER, STEAMID)
		TriggerClientEvent("SRR_CHAR:s_Notify", PLAYER, "" .. mdt.Server_Color .. "CHAR: ~w~Character was removed successfully")
	end
end, false)

--------------------------------
--- */* SCRIPT FUNCTIONS */* ---
--------------------------------

-- Create Character in SQL-Database
function SRR_CHAR_CREATE(USER, ID, FIRSTNAME, LASTNAME, DOB, GENDER)
    local Username = GetPlayerName(USER)
    
	-- CHARACTER SYSTEM INSERT
    local SQL = 'INSERT IGNORE INTO chars (STEAMID, USERNAME, FIRSTNAME, LASTNAME, DOB, GENDER) VALUES (@STEAMID, @NAME, @FIRSTNAME, @LASTNAME, @DOB, @GENDER)'
    local SQLParam = {STEAMID = ID, NAME = Username, FIRSTNAME = FIRSTNAME, LASTNAME = LASTNAME, DOB = DOB, GENDER = GENDER}
    MySQL.Async.execute(SQL, SQLParam)
end

-- Get info from Character in SQL-Database
function SRR_CHAR_INFO(USER, ID)
    local Username = GetPlayerName(USER)
	
    MySQL.Async.fetchAll("SELECT * FROM chars WHERE STEAMID = @STEAMID", {["@STEAMID"] = ID}, function(CharacterInfo)
			if (#CharacterInfo >= 1) then
				for i = 1, #CharacterInfo, 1 do
					firstname = CharacterInfo[i].Firstname
					lastname = CharacterInfo[i].Lastname
					dob = CharacterInfo[i].DOB
					gender = CharacterInfo[i].Gender
					driverlicense = CharacterInfo[i].d_license
					commercialdriverlicense = CharacterInfo[i].cd_license
					driverlicensepoints = CharacterInfo[i].license_p
					boatinglicense = CharacterInfo[i].b_license
					firearmlicense = CharacterInfo[i].f_license
					--
					if driverlicensepoints >= 15 then
						driverlicensepoints = "~r~15 (suspended)"
					end
					--
					if mdt.Server_Licenses == true then
						TriggerClientEvent('SRR_CHAR:HomePage', USER, mdt.Server_Color .. mdt.Server_Name .. "~w~ | CHARACTERS", "~c~Here you can find some useful information and settings about your ingame charcter(s).", "~c~Here is a small guide on how to use the char system.", "", "" .. mdt.Server_Color .. "CHARACTER COMMANDS:", "~c~/char(acter) create Firstname Lastname DD/MM/YYYY Gender ~w~to create an character", "~c~/char(acter) reset ~w~to reset your character(s)", "", "" .. mdt.Server_Color .. "MY CHARACTER:", "Firstname: ~c~"..firstname, "Lastname: ~c~"..lastname, "DOB: ~c~"..dob, "Gender: ~c~"..gender, "Driver's License: ~c~"..tostring(driverlicense), "Commercial Driver's License: ~c~"..tostring(commercialdriverlicense), "Driver's License Points: ~c~"..driverlicensepoints, "Pilot License: ~c~"..tostring(boatinglicense), "Firearm's License: ~c~"..tostring(firearmlicense))
					else
						TriggerClientEvent('SRR_CHAR:HomePage', USER, mdt.Server_Color .. mdt.Server_Name .. "~w~ | CHARACTERS", "~c~Here you can find some useful information and settings about your ingame charcter(s).", "~c~Here is a small guide on how to use the char system.", "", "" .. mdt.Server_Color .. "CHARACTER COMMANDS:", "~c~/char(acter) create Firstname Lastname DD/MM/YYYY Gender ~w~to create an character", "~c~/char(acter) reset ~w~to reset your character(s)", "", "" .. mdt.Server_Color .. "MY CHARACTER:", "Firstname: ~c~"..firstname, "Lastname: ~c~"..lastname, "DOB: ~c~"..dob, "Gender: ~c~"..gender, "Driver's License Points: ~c~"..driverlicensepoints, "", "", "", "" , "", false)
					end
					end
			elseif (#CharacterInfo == 0 ) then
				TriggerClientEvent('SRR_CHAR:HomePage', USER, mdt.Server_Color .. mdt.Server_Name .. "~w~ | CHARACTERS", "~c~Here you can find some useful information and settings about your ingame charcter(s).", "~c~Here is a small guide on how to use the char system.", "", "" .. mdt.Server_Color .. "CHARACTER COMMANDS:", "~c~/char(acter) create Firstname Lastname DD/MM/YYYY Gender ~w~to create an character", "~c~/char(acter) reset ~w~to reset your character(s)", "", "~r~*/* IMPORTANT NOTE */*", "Please create an character to be available to roleplay properly", "", "", "", "", "", "", "", "", "", false)
		end
    end);
end

-- Get info from Character in SQL-Database [EVENT]
RegisterServerEvent("MDT_SKIP_EVENT:SHOW_CHAR_INFO")
AddEventHandler('MDT_SKIP_EVENT:SHOW_CHAR_INFO', function()
	local PLAYER = source
	local STEAMID = GetSteamID(PLAYER)
    local Username = GetPlayerName(PLAYER)
	
    MySQL.Async.fetchAll("SELECT * FROM chars WHERE STEAMID = @STEAMID", {["@STEAMID"] = STEAMID}, function(CharacterInfo)
			if (#CharacterInfo >= 1) then
				for i = 1, #CharacterInfo, 1 do
					firstname = CharacterInfo[i].Firstname
					lastname = CharacterInfo[i].Lastname
					dob = CharacterInfo[i].DOB
					gender = CharacterInfo[i].Gender
					driverlicense = CharacterInfo[i].d_license
					commercialdriverlicense = CharacterInfo[i].cd_license
					driverlicensepoints = CharacterInfo[i].license_p
					boatinglicense = CharacterInfo[i].b_license
					firearmlicense = CharacterInfo[i].f_license
					--
					if driverlicensepoints >= 15 then
						driverlicensepoints = "~r~15 (suspended)"
					end
					--
					if mdt.Server_Licenses == true then
						TriggerClientEvent('SRR_CHAR:HomePage', USER, mdt.Server_Color .. mdt.Server_Name .. "~w~ | CHARACTERS", "~c~Here you can find some useful information and settings about your ingame charcter(s).", "~c~Here is a small guide on how to use the char system.", "", "" .. mdt.Server_Color .. "CHARACTER COMMANDS:", "~c~/char(acter) create Firstname Lastname DD/MM/YYYY Gender ~w~to create an character", "~c~/char(acter) reset ~w~to reset your character(s)", "", "" .. mdt.Server_Color .. "MY CHARACTER:", "Firstname: ~c~"..firstname, "Lastname: ~c~"..lastname, "DOB: ~c~"..dob, "Gender: ~c~"..gender, "Driver's License: ~c~"..tostring(driverlicense), "Commercial Driver's License: ~c~"..tostring(commercialdriverlicense), "Driver's License Points: ~c~"..driverlicensepoints, "Pilot License: ~c~"..tostring(boatinglicense), "Firearm's License: ~c~"..tostring(firearmlicense))
					else
						TriggerClientEvent('SRR_CHAR:HomePage', USER, mdt.Server_Color .. mdt.Server_Name .. "~w~ | CHARACTERS", "~c~Here you can find some useful information and settings about your ingame charcter(s).", "~c~Here is a small guide on how to use the char system.", "", "" .. mdt.Server_Color .. "CHARACTER COMMANDS:", "~c~/char(acter) create Firstname Lastname DD/MM/YYYY Gender ~w~to create an character", "~c~/char(acter) reset ~w~to reset your character(s)", "", "" .. mdt.Server_Color .. "MY CHARACTER:", "Firstname: ~c~"..firstname, "Lastname: ~c~"..lastname, "DOB: ~c~"..dob, "Gender: ~c~"..gender, "Driver's License Points: ~c~"..driverlicensepoints, "", "", "", "" , "", false)
					end
					end
			elseif (#CharacterInfo == 0 ) then
				TriggerClientEvent('SRR_CHAR:HomePage', PLAYER, mdt.Server_Color .. mdt.Server_Name .. "~w~ | MY CHARACTER", "~c~Here you can find some useful information and settings about your ingame charcter(s).", "~c~Here is a small guide on how to use the char system.", "", "" .. mdt.Server_Color .. "CHARACTER COMMANDS:", "~c~/char(acter) create Firstname Lastname DD/MM/YYYY Gender ~w~to create an character", "~c~/char(acter) reset ~w~to reset your character(s)", "", "~r~*/* IMPORTANT NOTE */*", "Please create an character to be available to roleplay properly", "", "", "", "", "", "", "", "", "", false)
		end
    end);
end)

-- Reset Character in SQL-Database
function SRR_CHAR_RESET(USER, ID)
    local Username = GetPlayerName(USER)
	
	-- CHARACTER SYSTEM DELETE
    local SQL = "DELETE FROM chars WHERE STEAMID = @STEAMID"
    local param = {STEAMID = ID}
    MySQL.Async.execute(SQL, param)
	--
end

-------------------------------------
--- */* SCRIPT BASE FUNCTIONS */* ---
-------------------------------------

-- Get SteamID
function GetSteamID(PLAYER)
    local identifiers = GetPlayerIdentifiers(PLAYER)
    local steamid = string.upper(string.sub(identifiers[1], 7))
    return steamid
end