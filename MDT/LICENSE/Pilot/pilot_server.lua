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

-- Change 'd_license' (Driver's License) value in SQL-Database (event) [true]
RegisterServerEvent("CHAR_DMV:D_License_P_T")
AddEventHandler("CHAR_DMV:D_License_P_T", function()
	local PLAYER = source
	local STEAMID = GetSteamID(PLAYER)
	--
	CHAR_P_PLICENSE_UPDATE(PLAYER, STEAMID, true)
end)

-- Change 'd_license' (Driver's License) value in SQL-Database (event) [false]
RegisterServerEvent("CHAR_DMV:D_License_P_F")
AddEventHandler("CHAR_DMV:D_License_P_F", function()
	local PLAYER = source
	local STEAMID = GetSteamID(PLAYER)
	--
	CHAR_P_PLICENSE_UPDATE(PLAYER, STEAMID, false)
end)

-- Get info from 'chars' Character in SQL-Database
RegisterServerEvent("CHAR_DMV:CHECK_VALID_1_P")
AddEventHandler("CHAR_DMV:CHECK_VALID_1_P", function()
	local PLAYER = source
	local STEAMID = GetSteamID(PLAYER)
	--
	SRR_P_CHECK_INFO(PLAYER, STEAMID)
end)

--------------------------------
--- */* SCRIPT FUNCTIONS */* ---
--------------------------------

-- Change 'd_license' (Driver's License) value in SQL-Database
function CHAR_P_PLICENSE_UPDATE(USER, ID, VALUE)
	MySQL.Async.execute("UPDATE chars SET b_license=@PLICENSE WHERE STEAMID = @STEAMID", {["@STEAMID"] = ID, ['@PLICENSE'] = VALUE})
end

-- Get info from 'chars' Character in SQL-Database
function SRR_P_CHECK_INFO(USER, ID)
    local Username = GetPlayerName(USER)
	local ID = GetSteamID(USER)
	
    MySQL.Async.fetchAll("SELECT * FROM chars WHERE STEAMID = @STEAMID", {["@STEAMID"] = ID}, function(CharacterInfo)
        for i = 1, #CharacterInfo, 1 do
            if #CharacterInfo == nil then
				TriggerClientEvent("SRR_CHAR:s_Notify", USER, "~p~PLC ERROR~w~: Couldnt load character details...")
			else
				PLC_START_COURSE(USER, ID)
			end	
		end
    end)
end

-- Remove money when starting course SQL-function
function PLC_START_COURSE(USER, ID)
    local Username = GetPlayerName(USER)
	--
	TriggerClientEvent("SRR_CHAR_DMV:StartCourse1_P", USER)
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