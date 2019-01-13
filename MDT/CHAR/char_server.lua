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
--- */* SCRIPT CONFIG */* ---
-----------------------------

-- */* Character Version */* --
Base_Char_Version = "0.1"

-- */* NIL VARS */* --
local firstname = "not set"
local lastname = "not set"
local dob = "not set"
local gender = "not set"
local driverlicense = "not set"
local commercialdriverlicense = "not set"
local driverlicensepoints = "not set"
local boatinglicense = "not set"
local firearmlicense = "not set"

-- */* DEBUG VARS */* --
local CHAR_DEBUG_MODE = false -- */* NOT IN USE IN THIS VERSION */*


-----------------------------
--- */* SCRIPT EVENTS */* ---
-----------------------------

-------------------------------
--- */* SCRIPT COMMANDS */* ---
-------------------------------

-- Character Part
RegisterCommand("character", function(source, args, rawCommand)
	local PLAYER = source
	local STEAMID = GetSteamID(PLAYER)
	--
	
	if args[1] == nil then
		SRR_CHAR_INFO(PLAYER, STEAMID)
	elseif args[1] == "create" then
		if args[5] == nil or args[6] then
			TriggerClientEvent('chatMessage', PLAYER, "^1[CMD_INP_ERR] Wrong syntax for command", {255, 255, 255})
		elseif not nil then
			SRR_CHAR_RESET(PLAYER, STEAMID)
			Citizen.Wait(1) 
			SRR_CHAR_CREATE(PLAYER, STEAMID, args[2], args[3], args[4], args[5])
			TriggerClientEvent("SRR_CHAR:s_Notify", PLAYER, "" .. mdt.Server_Color .. "CHAR: ~w~"..args[2].." "..args[3].." Was created successfully")
		else
			if mdt.Server_Licenses == true then
				TriggerClientEvent('SRR_CHAR:HomePage', USER, mdt.Server_Color .. mdt.Server_Name .. "~w~ | CHARACTERS", "~w~Here you can find some useful information and settings about your ingame charcter(s).", "~w~Here is a small guide on how to use the char system.", "", "" .. mdt.Server_Color .. "CHARACTER COMMANDS:", "~c~/character create Firstname Lastname DD/MM/YYYY Gender ~w~to create an character", "~c~/character reset ~w~to reset your character(s)", "", "" .. mdt.Server_Color .. "MY CHARACTER:", "Firstname: ~c~"..firstname, "Lastname: ~c~"..lastname, "DOB: ~c~"..dob, "Gender: ~c~"..gender, "Driver's License: ~c~"..tostring(driverlicense), "Commercial Driver's License: ~c~"..tostring(commercialdriverlicense), "Driver's License Points: ~c~"..driverlicensepoints, "Pilot License(~y~IN-DEV~w~): ~c~"..tostring(boatinglicense), "Firearm's License: ~c~"..tostring(firearmlicense))
			else
				TriggerClientEvent('SRR_CHAR:HomePage', USER, mdt.Server_Color .. mdt.Server_Name .. "~w~ | CHARACTERS", "~w~Here you can find some useful information and settings about your ingame charcter(s).", "~w~Here is a small guide on how to use the char system.", "", "" .. mdt.Server_Color .. "CHARACTER COMMANDS:", "~c~/character create Firstname Lastname DD/MM/YYYY Gender ~w~to create an character", "~c~/character reset ~w~to reset your character(s)", "", "" .. mdt.Server_Color .. "MY CHARACTER:", "Firstname: ~c~"..firstname, "Lastname: ~c~"..lastname, "DOB: ~c~"..dob, "Gender: ~c~"..gender, "Driver's License Points: ~c~"..driverlicensepoints, "", "", "", "" , "", false)
			end
		end
	elseif args[1] == "reset" then
		SRR_CHAR_RESET(PLAYER, STEAMID)
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
						TriggerClientEvent('SRR_CHAR:HomePage', USER, mdt.Server_Color .. mdt.Server_Name .. "~w~ | CHARACTERS", "~w~Here you can find some useful information and settings about your ingame charcter(s).", "~w~Here is a small guide on how to use the char system.", "", "" .. mdt.Server_Color .. "CHARACTER COMMANDS:", "~c~/character create Firstname Lastname DD/MM/YYYY Gender ~w~to create an character", "~c~/character reset ~w~to reset your character(s)", "", "" .. mdt.Server_Color .. "MY CHARACTER:", "Firstname: ~c~"..firstname, "Lastname: ~c~"..lastname, "DOB: ~c~"..dob, "Gender: ~c~"..gender, "Driver's License: ~c~"..tostring(driverlicense), "Commercial Driver's License: ~c~"..tostring(commercialdriverlicense), "Driver's License Points: ~c~"..driverlicensepoints, "Pilot License(~y~IN-DEV~w~): ~c~"..tostring(boatinglicense), "Firearm's License: ~c~"..tostring(firearmlicense))
					else
						TriggerClientEvent('SRR_CHAR:HomePage', USER, mdt.Server_Color .. mdt.Server_Name .. "~w~ | CHARACTERS", "~w~Here you can find some useful information and settings about your ingame charcter(s).", "~w~Here is a small guide on how to use the char system.", "", "" .. mdt.Server_Color .. "CHARACTER COMMANDS:", "~c~/character create Firstname Lastname DD/MM/YYYY Gender ~w~to create an character", "~c~/character reset ~w~to reset your character(s)", "", "" .. mdt.Server_Color .. "MY CHARACTER:", "Firstname: ~c~"..firstname, "Lastname: ~c~"..lastname, "DOB: ~c~"..dob, "Gender: ~c~"..gender, "Driver's License Points: ~c~"..driverlicensepoints, "", "", "", "" , "", false)
					end
					end
			elseif (#CharacterInfo == 0 ) then
				TriggerClientEvent('SRR_CHAR:HomePage', USER, mdt.Server_Color .. mdt.Server_Name .. "~w~ | CHARACTERS", "~w~Here you can find some useful information and settings about your ingame charcter(s).", "~w~Here is a small guide on how to use the char system.", "", "" .. mdt.Server_Color .. "CHARACTER COMMANDS:", "~c~/character create Firstname Lastname DD/MM/YYYY Gender ~w~to create an character", "~c~/character reset ~w~to reset your character(s)", "", "~r~*/* IMPORTANT NOTE */*", "Please create an character to be avail to RP properly", "", "", "", "", "", "", "", "", "", false)
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
						TriggerClientEvent('SRR_CHAR:HomePage', USER, mdt.Server_Color .. mdt.Server_Name .. "~w~ | CHARACTERS", "~w~Here you can find some useful information and settings about your ingame charcter(s).", "~w~Here is a small guide on how to use the char system.", "", "" .. mdt.Server_Color .. "CHARACTER COMMANDS:", "~c~/character create Firstname Lastname DD/MM/YYYY Gender ~w~to create an character", "~c~/character reset ~w~to reset your character(s)", "", "" .. mdt.Server_Color .. "MY CHARACTER:", "Firstname: ~c~"..firstname, "Lastname: ~c~"..lastname, "DOB: ~c~"..dob, "Gender: ~c~"..gender, "Driver's License: ~c~"..tostring(driverlicense), "Commercial Driver's License: ~c~"..tostring(commercialdriverlicense), "Driver's License Points: ~c~"..driverlicensepoints, "Pilot License(~y~IN-DEV~w~): ~c~"..tostring(boatinglicense), "Firearm's License: ~c~"..tostring(firearmlicense))
					else
						TriggerClientEvent('SRR_CHAR:HomePage', USER, mdt.Server_Color .. mdt.Server_Name .. "~w~ | CHARACTERS", "~w~Here you can find some useful information and settings about your ingame charcter(s).", "~w~Here is a small guide on how to use the char system.", "", "" .. mdt.Server_Color .. "CHARACTER COMMANDS:", "~c~/character create Firstname Lastname DD/MM/YYYY Gender ~w~to create an character", "~c~/character reset ~w~to reset your character(s)", "", "" .. mdt.Server_Color .. "MY CHARACTER:", "Firstname: ~c~"..firstname, "Lastname: ~c~"..lastname, "DOB: ~c~"..dob, "Gender: ~c~"..gender, "Driver's License Points: ~c~"..driverlicensepoints, "", "", "", "" , "", false)
					end
					end
			elseif (#CharacterInfo == 0 ) then
				TriggerClientEvent('SRR_CHAR:HomePage', PLAYER, mdt.Server_Color .. mdt.Server_Name .. "~w~ | MY CHARACTER", "~w~Here you can find some useful information and settings about your ingame charcter(s).", "~w~Here is a small guide on how to use the char system.", "", "" .. mdt.Server_Color .. "CHARACTER COMMANDS:", "~c~/character create Firstname Lastname DD/MM/YYYY Gender ~w~to create an character", "~c~/character reset ~w~to reset your character(s)", "", "~r~*/* IMPORTANT NOTE */*", "Please create an character to be avail to RP properly", "", "", "", "", "", "", "", "", "", false)
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
	TriggerClientEvent("SRR_CHAR:s_Notify", USER, "" .. mdt.Server_Color .. "CHAR~w~: Character was reseted successfully")
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