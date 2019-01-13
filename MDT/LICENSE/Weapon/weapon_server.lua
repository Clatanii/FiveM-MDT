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

-- Get info from 'chars' Character in SQL-Database
RegisterServerEvent("CHAR_FD:CHECK_VALID_1")
AddEventHandler("CHAR_FD:CHECK_VALID_1", function()
	local PLAYER = source
	local STEAMID = GetSteamID(PLAYER)
	--
	SRR_FD_CHECK_INFO(PLAYER, STEAMID)
end)
--------------------------------
--- */* SCRIPT FUNCTIONS */* ---
--------------------------------

-- Change 'f_license' (Weapon License) value in SQL-Database
RegisterServerEvent("CHAR_SAF_FIREARM_UPDATE")
AddEventHandler("CHAR_SAF_FIREARM_UPDATE", function(ID)
	local PLAYER = source
	
	MySQL.Async.execute("UPDATE chars SET f_license=@DLICENSE WHERE STEAMID = @STEAMID", {["@STEAMID"] = ID, ['@DLICENSE'] = true})
end)

-- Get info from 'chars' Character in SQL-Database
function SRR_FD_CHECK_INFO(USER, ID)
    local Username = GetPlayerName(USER)
	
    MySQL.Async.fetchAll("SELECT * FROM chars WHERE STEAMID = @STEAMID", {["@STEAMID"] = ID}, function(CharacterInfo)
        for i = 1, #CharacterInfo, 1 do
            if CharacterInfo == nil then
				TriggerClientEvent("SRR_CHAR:s_Notify", USER, "~r~Weapon License~w~: Couldnt load character details...")
			elseif CharacterInfo[i].f_license == true then
				TriggerClientEvent("SRR_CHAR:s_Notify", USER, "~r~Weapon License~w~: You already have an firearm license for SA")
			else
				SRR_MONEY_BANK_REM_VALUE_WL(USER, ID, 300)
			end	
		end
    end)
end

-- Remove money when starting course SQL-function
function SRR_MONEY_BANK_REM_VALUE_WL(USER, ID, VALUE)
    local Username = GetPlayerName(USER)
	--
	TriggerClientEvent("SRR_CHAR_SAF:WaitTime", USER, ID)
end

-------------------------------------
--- */* SCRIPT BASE FUNCTIONS */* ---
-------------------------------------