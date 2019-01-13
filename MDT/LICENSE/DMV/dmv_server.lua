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
RegisterServerEvent("CHAR_DMV:D_License_T")
AddEventHandler("CHAR_DMV:D_License_T", function()
	local PLAYER = source
	local STEAMID = GetSteamID(PLAYER)
	--
	CHAR_DMV_DLICENSE_UPDATE(PLAYER, STEAMID, true)
end)

-- Change 'd_license' (Driver's License) value in SQL-Database (event) [false]
RegisterServerEvent("CHAR_DMV:D_License_F")
AddEventHandler("CHAR_DMV:D_License_F", function()
	local PLAYER = source
	local STEAMID = GetSteamID(PLAYER)
	--
	CHAR_DMV_DLICENSE_UPDATE(PLAYER, STEAMID, false)
end)

-- Get info from 'chars' Character in SQL-Database
RegisterServerEvent("CHAR_DMV:CHECK_VALID_1")
AddEventHandler("CHAR_DMV:CHECK_VALID_1", function()
	local PLAYER = source
	local STEAMID = GetSteamID(PLAYER)
	--
	SRR_DMV_CHECK_INFO(PLAYER, STEAMID)
end)

--------------------------------
--- */* SCRIPT FUNCTIONS */* ---
--------------------------------

-- Change 'd_license' (Driver's License) value in SQL-Database
function CHAR_DMV_DLICENSE_UPDATE(USER, ID, VALUE)
	MySQL.Async.execute("UPDATE chars SET d_license=@DLICENSE WHERE STEAMID = @STEAMID", {["@STEAMID"] = ID, ['@DLICENSE'] = VALUE})
end

-- Get info from 'chars' Character in SQL-Database
function SRR_DMV_CHECK_INFO(USER, ID)
    local Username = GetPlayerName(USER)
	local ID = GetSteamID(USER)
	
    MySQL.Async.fetchAll("SELECT * FROM chars WHERE STEAMID = @STEAMID", {["@STEAMID"] = ID}, function(CharacterInfo)
        for i = 1, #CharacterInfo, 1 do
            if #CharacterInfo == nil then
				TriggerClientEvent("SRR_CHAR:s_Notify", USER, "~o~CDL ERROR~w~: Couldnt load character details...")
			else
				SRR_MONEY_BANK_REM_VALUE_DMV(USER, ID, 800)
			end	
		end
    end)
end

-- Remove money when starting course SQL-function
function SRR_MONEY_BANK_REM_VALUE_DMV(USER, ID, VALUE)
    local Username = GetPlayerName(USER)
	--
	TriggerClientEvent("SRR_CHAR_DMV:StartCourse1_DMV", USER)
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