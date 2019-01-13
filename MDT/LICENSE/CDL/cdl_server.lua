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

-- Change 'd_license' (C-Driver's License) value in SQL-Database (event) [true]
RegisterServerEvent("CHAR_DMV:CD_License_T")
AddEventHandler("CHAR_DMV:CD_License_T", function()
	local PLAYER = source
	local STEAMID = GetSteamID(PLAYER)
	--
	CHAR_CDL_DLICENSE_UPDATE(PLAYER, STEAMID, true)
end)

-- Change 'd_license' (C-Driver's License) value in SQL-Database (event) [false]
RegisterServerEvent("CHAR_DMV:CD_License_F")
AddEventHandler("CHAR_DMV:CD_License_F", function()
	local PLAYER = source
	local STEAMID = GetSteamID(PLAYER)
	--
	SRR_CDL_CHECK_INFO(PLAYER, STEAMID, false)
end)

-- Get info from 'chars' Character in SQL-Database
RegisterServerEvent("CHAR_CDL:CHECK_VALID_1")
AddEventHandler("CHAR_CDL:CHECK_VALID_1", function()
	local PLAYER = source
	local STEAMID = GetSteamID(PLAYER)
	--
	SRR_CDL_CHECK_INFO(PLAYER, STEAMID)
end)

--------------------------------
--- */* SCRIPT FUNCTIONS */* ---
--------------------------------

-- Change 'd_license' (Driver's License) value in SQL-Database
function CHAR_CDL_DLICENSE_UPDATE(USER, ID, VALUE)
	MySQL.Async.execute("UPDATE chars SET cd_license=@DLICENSE WHERE STEAMID = @STEAMID", {["@STEAMID"] = ID, ['@DLICENSE'] = VALUE})
end

-- Get info from 'chars' Character in SQL-Database
function SRR_CDL_CHECK_INFO(USER, ID)
    local Username = GetPlayerName(USER)
	
    MySQL.Async.fetchAll("SELECT * FROM chars WHERE STEAMID = @STEAMID", {["@STEAMID"] = ID}, function(CharacterInfo)
        for i = 1, #CharacterInfo, 1 do
            if CharacterInfo == nil then
				TriggerClientEvent("SRR_CHAR:s_Notify", USER, "~b~CDL ERROR~w~: Couldnt load character details...")
			elseif CharacterInfo[i].d_license == false then
				TriggerClientEvent("SRR_CHAR:s_Notify", USER, "~b~CDL ERROR~w~: You dont have an normal driver's license yet")
			else
				SRR_MONEY_BANK_REM_VALUE_CDL(USER, ID, 1200)
			end	
		end
    end)
end

-- Remove money when starting course SQL-function
function SRR_MONEY_BANK_REM_VALUE_CDL(USER, ID, VALUE)
    local Username = GetPlayerName(USER)
	
	TriggerClientEvent("SRR_CHAR_DMV:StartCourse1_CDL", USER)
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