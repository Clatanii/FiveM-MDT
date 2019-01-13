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


-------------------------------
--- */* SCRIPT COMMANDS */* ---
-------------------------------

-- MDT main structure
RegisterCommand("mdt", function(source, args, rawCommand)
	local PLAYER = source
	local STEAMID = GetSteamID(PLAYER)
	--
	if args[1] == nil then
		TriggerClientEvent("SRR_CHAR:MDT_CLOSE_ARRAY", source)
		TriggerClientEvent("SRR_CHAR:HomePage_MDT", source, mdt.Server_Color .. mdt.Server_Name .. " ~w~| MOBILE DATA TERMINAL", "~c~This Mobile Device is owned by the San Andreas Goverment 2018 & 2019 - CC("..mdt.Server_Name..")", "", "" .. mdt.Server_Color .. "ISSUES & BUGS:", "~c~For any issues or/and bugs with the MDT system, report in our discord.", "", "" .. mdt.Server_Color .. "MDT COMMANDS & CONTROLS:", "~c~All the following commands are to be used after /mdt", "~w~warcheck (ID), chacheck (ID), placheck (PLATE), bolcheck, idcheck (ID), addp (ID) (POINTS)", "~w~addwar (ID) (WARRENT), addcha (ID) (CHARGE), flag stolen (PLATE) (0/1), addbolo (BOLO)", "~w~clearwar (ID) (WARRENT), clearcha (ID) (CHARGE), delplate (PLATE), clearbol", "", "" .. mdt.Server_Color .. "STATUS & PERSONAL MDT INFO:", "~c~Your status and personal info and/or notes. [/mdt addnote (NOTE)] to add a note.", "~w~PERSONAL NOTE: ~c~", "~w~MDT VERSION: ~c~", "~w~MDT NETWORK STATUS: ~g~")
	end
	--
	-- (MAIN PART)
	--
	if args[1] == "addnote" then
		if args[2] == nil then
			TriggerClientEvent('chatMessage', PLAYER, "^1[CMD_INP_ERR] Wrong syntax for command", {255, 255, 255})
		else
			local str = "";
				for i = 2, #args do
					if (str == "") then
						str = args[i];
					else
						str = str .. " " .. args[i];
					end
				end
			TriggerClientEvent("SRR_CHAR:NOTE_MDT", PLAYER, str)
		end
	end
	--
	-- (LICENSE POINTS PART)
	--
	if args[1] == "addp" then
		if args[3] > mdt.Server_Points then
			TriggerClientEvent('chatMessage', PLAYER, "^1[CMD_INP_ERR] Exceeded max value for [Points] - [Max: "..mdt.Server_Points.."]", {255, 255, 255})
		else
			TriggerClientEvent("MDT_SKIP_EVENT:POINT_ADD", PLAYER, args[2], args[3])
		end
	end
	--
	-- (BOLO PART)
	--
	if args[1] == "addbolo" and args[2] then
		local str = "";
				for i = 2, #args do
					if (str == "") then
						str = args[i];
					else
						str = str .. " " .. args[i];
					end
				end
		TriggerClientEvent("MDT_SKIP_EVENT:BOLO_ADD", PLAYER, str) --
	end
	--
	if args[1] == "clearbol" then
		TriggerClientEvent("MDT_SKIP_EVENT:BOLO_CLEAR", PLAYER, str) --
	end
	--
	if args[1] == "bolcheck" then
		TriggerClientEvent("MDT_SKIP_EVENT:BOLO_CHECK", PLAYER) --
	end
	--
	-- (WARRANT PART)
	--
	if args[1] == "addwar" and GetPlayerName(args[2]) and args[3] then
		local str = "";
				for i = 3, #args do
					if (str == "") then
						str = args[i];
					else
						str = str .. " " .. args[i];
					end
				end
		TriggerClientEvent("MDT_SKIP_EVENT:WAR_ADD", PLAYER, args[2], str) --
	end
	--
	if args[1] == "clearwar" and args[2] and (GetPlayerName(args[2])) then
		TriggerClientEvent("MDT_SKIP_EVENT:WAR_CLEAR", PLAYER, args[2]) --
	end
	--
	if args[1] == "warcheck" then
		TriggerClientEvent("MDT_SKIP_EVENT:WAR_CHECK", PLAYER, args[2]) --
	end
	--
	-- (CHARGES PART)
	--
	if args[1] == "addcha" and GetPlayerName(args[2]) and args[3] then
		local str = "";
				for i = 3, #args do
					if (str == "") then
						str = args[i];
					else
						str = str .. " " .. args[i];
					end
				end
		TriggerClientEvent("MDT_SKIP_EVENT:CHA_ADD", PLAYER, args[2], str) --
	end
	--
	if args[1] == "clearcha" and args[2] and (GetPlayerName(args[2])) then
		TriggerClientEvent("MDT_SKIP_EVENT:CHA_REM", PLAYER, args[2]) --
	end
	--
	if args[1] == "chacheck" then
		TriggerClientEvent("MDT_SKIP_EVENT:CHA_CHECK", PLAYER, args[2]) --
	end
	--
	-- (CHARACTER PART)
	--
	if args[1] == "idcheck" then
		TriggerClientEvent("MDT_SKIP_EVENT:ID_CHECK", PLAYER, args[2]) --
	end
	--
	-- (VEHICLE REG)
	--
	if args[1] == "placheck" then
		TriggerClientEvent("MDT_SKIP_EVENT:PLATE_CHECK", PLAYER, args[2]) --
	end
	--
	-- (VEHICLE REG STOLEN FLAG)
	--
	if args[1] == "flag" then
		if args[2] == "stolen" then
			TriggerClientEvent("MDT_SKIP_EVENT:PLATE_FLAG_STOLEN", PLAYER, args[3], args[4]) --
		end
	end
	--
	-- (VEHICLE REG DELETE PLATE)
	--
	if args[1] == "delplate" then
		TriggerClientEvent("MDT_SKIP_EVENT:PLATE_DEL", PLAYER, args[2]) --
	end
	--
end, false)

-- Register Vehicle Part
RegisterCommand('veh', function(source, args, rawCommand)
	local PLAYER = source
	local STEAMID = GetSteamID(PLAYER)
	-- -- --
	-- -- --
	if args[1] == nil then
		TriggerClientEvent("SRR_CHAR:MDT_CLOSE_ARRAY", PLAYER)
		TriggerClientEvent("SRR_CHAR:HomePage", PLAYER, mdt.Server_Color .. mdt.Server_Name .. " ~w~| VEHICLE REGISTRATIONS", "~c~Here you can (de)reg your vehicles to make them legal to drive in (SA)", "", "" .. mdt.Server_Color .. "VEHICLE COMMANDS:", "~c~/veh ~w~to show vehicle reg help page", "~c~/veh reg ~w~to reg current vehicle that you are inside", "~c~/veh list ~w~to list all current registered vehicles", "~c~/veh dereg (PLATE) ~w~to remove plate from database", "", "", "", "")
	end
	--
	if args[1] == "list" then
		MDT_SQL_DISPLAY_VEH_REGS(PLAYER)
	end
	--
	if args[1] == "reg" then
		TriggerClientEvent("MDT_VEH_REG_PART_1", PLAYER)
	end
	--
	if args[1] == "dereg" then
		TriggerClientEvent("MDT_VEH_DEREG_PART_1", PLAYER, args[2])
	end
end, false)

-- Flash ID Part
RegisterCommand('flashid', function(source, args, rawCommand)
	local PLAYER = source
	local STEAMID = GetSteamID(PLAYER)
	
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
				TriggerClientEvent("sendProximityMessage25Command", PLAYER, "^3"..GetPlayerName(PLAYER).." flashes ID (Name: "..firstname.." "..lastname..", DOB: "..dob..", Driver's License: "..tostring(driverlicense)..", C-Driver's License: "..tostring(commercialdriverlicense)..", Firearm License: "..tostring(firearmlicense)..")")
			end
		elseif (#CharacterInfo == 0) then
			TriggerClientEvent('chatMessage', PLAYER, "^1[CMD_LOD_ERR] Character not found", {255, 255, 255})
		end
	end);
end)

--------------------------------
--- */* SCRIPT FUNCTIONS */* ---
--------------------------------

-- */* SQL PART */* --

--------------------------
-- */* MDT - POINTS */* --
--------------------------

-- Add bolo to MDT-System
RegisterServerEvent("MDT_SKIP_EVENT:POINT_ADD_2")
AddEventHandler('MDT_SKIP_EVENT:POINT_ADD_2', function(player, points)
	local steamID = GetSteamID(source)
	local p_steamID = GetSteamID(player)
	local PLAYER = source
	--
	MySQL.Async.fetchAll("SELECT * FROM chars WHERE STEAMID = @STEAMID", {["@STEAMID"] = p_steamID}, function(CharacterInfo)
		if (#CharacterInfo >= 1) then
			for i = 1, #CharacterInfo, 1 do
				local driverlicensepoints = CharacterInfo[i].license_p
				local add_p = driverlicensepoints + points
				--
				MySQL.Async.execute("UPDATE chars SET license_p=@LICENSEP WHERE STEAMID = @STEAMID", {["@STEAMID"] = p_steamID, ['@LICENSEP'] = add_p})
				--
				TriggerClientEvent("SRR_CHAR:s_Notify", PLAYER, "" .. mdt.Server_Color .. "MDT~w~: You gave "..GetPlayerName(player).." "..points.." points")
			end
		end
	end);
end)

-------------------------
-- */* MDT - BOLOS */* --
-------------------------

-- Add bolo to MDT-System
RegisterServerEvent("MDT_SKIP_EVENT:BOLO_ADD_2")
AddEventHandler('MDT_SKIP_EVENT:BOLO_ADD_2', function(str)
	local steamID = GetSteamID(source)
	local PLAYER = source
	--
	MySQL.Async.execute("INSERT INTO srr_char_bolos (`ts`, `STEAMID`, `Username`, `bolo`) VALUES (NOW(), @STEAMID, @Username, @bolo);",
		{["@STEAMID"] = steamID, ["@Username"] = GetPlayerName(source), ['@bolo'] = str}, function()
		TriggerClientEvent("SRR_CHAR:s_Notify", PLAYER, "" .. mdt.Server_Color .. "MDT~w~: Bolo was successfully added to the system")
	end);
end)

-- Clear all bolos from MDT-System
RegisterServerEvent("MDT_SKIP_EVENT:BOLO_CLEAR_2")
AddEventHandler('MDT_SKIP_EVENT:BOLO_CLEAR_2', function(str)
	local steamID = GetSteamID(source)
	local PLAYER = source
	--
	MySQL.Async.execute("TRUNCATE TABLE srr_char_bolos",
		{["@plate"] = str}, function()
		TriggerClientEvent("SRR_CHAR:s_Notify", PLAYER, "" .. mdt.Server_Color .. "MDT~w~: All bolos was cleared")
	end);
end)

-- List all bolos from MDT-System
RegisterServerEvent("MDT_SKIP_EVENT:BOLO_CHECK_2")
AddEventHandler('MDT_SKIP_EVENT:BOLO_CHECK_2', function()
	local steamID = GetSteamID(source)
	local PLAYER = source
	--
	MySQL.Async.fetchAll("SELECT * FROM srr_char_bolos ORDER BY `ts` DESC LIMIT 20", {}, function(bolos)
		TriggerClientEvent("Jobs:displayBolos", PLAYER, bolos);
		if (#bolos == 0) then
			TriggerClientEvent("SRR_CHAR:s_Notify", PLAYER, "" .. mdt.Server_Color .. "MDT~w~: No active bolos were found")
		elseif (#bolos >= 0) then
			TriggerClientEvent("SRR_CHAR:MDT_CLOSE", PLAYER)
			TriggerClientEvent("SRR_CHAR:s_Notify", PLAYER, "" .. mdt.Server_Color .. "MDT~w~: Bolo's were found in the system, loading...")
		end
	end);
end)

---------------------------
-- */* MDT - WARRANT */* --
---------------------------

-- Add warrant to MDT-System
RegisterServerEvent("MDT_SKIP_EVENT:WAR_ADD_2")
AddEventHandler('MDT_SKIP_EVENT:WAR_ADD_2', function(player, warrant)
	local source_steamID = GetSteamID(source)
	local player_steamID = GetSteamID(player)
	local PLAYER = source
	--
	MySQL.Async.execute("INSERT INTO srr_char_warrants (`ts`, `STEAMID`, `Username`, `officer_STEAMID`, `officer_Username`, `warrant_a`) VALUES (NOW(), @STEAMID, @Username, @officer_STEAMID, @officer_Username, @warrant_a);",
		{["@STEAMID"] = player_steamID, ["@Username"] = GetPlayerName(player), ["@officer_STEAMID"] = source_steamID, ['@officer_Username'] = GetPlayerName(source), ['@warrant_a'] = warrant}, function()
		TriggerClientEvent("SRR_CHAR:s_Notify", PLAYER, "" .. mdt.Server_Color .. "MDT~w~: Warrant was put out successfully")
	end);
end)

-- Add warrant to MDT-System
RegisterServerEvent("MDT_SKIP_EVENT:WAR_ADD_2")
AddEventHandler('MDT_SKIP_EVENT:WAR_ADD_2', function(player, charge)
	local source_steamID = GetSteamID(source)
	local player_steamID = GetSteamID(player)
	local PLAYER_ = source
	--
	MySQL.Async.execute("INSERT INTO srr_char_warrants (`ts`, `STEAMID`, `Username`, `officer_STEAMID`, `officer_Username`, `warrant`) VALUES (NOW(), @STEAMID, @Username, @officer_STEAMID, @officer_Username, @charge);",
		{["@STEAMID"] = player_steamID, ["@Username"] = GetPlayerName(player), ["@officer_STEAMID"] = source_steamID, ['@officer_Username'] = GetPlayerName(source), ['@charge'] = charge}, function()
		TriggerClientEvent("SRR_CHAR:s_Notify", PLAYER_, "" .. mdt.Server_Color .. "MDT~w~: Warrant was added successfully")
		--
		if mdt.Server_Show_War == true then
			TriggerClientEvent("SRR_CHAR:s_Notify", player, "~r~ACTIVE ARREST WARRANT~w~:")
			TriggerClientEvent("SRR_CHAR:s_Notify", player, "~c~"..charge)
		end
	end);
end)

-- Remove warrant from MDT-System on ID
RegisterServerEvent("MDT_SKIP_EVENT:WAR_CLEAR_2")
AddEventHandler('MDT_SKIP_EVENT:WAR_CLEAR_2', function(player)
	local steamID = GetSteamID(source)
	local player_steamID = GetSteamID(player)
	local PLAYER_ = source
	--
	MySQL.Async.execute("DELETE FROM srr_char_warrants WHERE STEAMID = @STEAMID",
		{["@STEAMID"] = player_steamID}, function()
		TriggerClientEvent("SRR_CHAR:s_Notify", PLAYER_, "" .. mdt.Server_Color .. "MDT~w~: You have successfully cleared all warrants from: "..GetPlayerName(player))
		TriggerClientEvent("SRR_CHAR:s_Notify", player, "" .. mdt.Server_Color .. "Your warrants has been cleared by a officer")
	end);
end)

-- List all warrants from MDT-System
RegisterServerEvent("MDT_SKIP_EVENT:WAR_CHECK_2")
AddEventHandler('MDT_SKIP_EVENT:WAR_CHECK_2', function(player)
	local source_steamID = GetSteamID(source)
	local player_steamID = GetSteamID(player)
	local PLAYER_ = source
	--
	MySQL.Async.fetchAll("SELECT * FROM srr_char_warrants WHERE STEAMID = @STEAMID ORDER BY `ts` DESC LIMIT 20", {["@STEAMID"] = player_steamID}, function(warrant)
		if (#warrant == 0) then
			TriggerClientEvent("SRR_CHAR:s_Notify", PLAYER_, "" .. mdt.Server_Color .. "MDT~w~: No active arrest warrants were found")
		elseif (#warrant >= 0) then
			TriggerClientEvent("SRR_CHAR:MDT_CLOSE", PLAYER_)
			TriggerClientEvent("Jobs:displayWarrents", PLAYER_, GetPlayerName(player), warrant)
			TriggerClientEvent("SRR_CHAR:s_Notify", PLAYER_, "" .. mdt.Server_Color .. "MDT~w~: Active arrest warrants were found")
		end
	end);
end)

--------------------------
-- */* MDT - CHARGE */* --
--------------------------

-- Add charge to MDT-System
RegisterServerEvent("MDT_SKIP_EVENT:CHA_ADD_2")
AddEventHandler('MDT_SKIP_EVENT:CHA_ADD_2', function(player, charge)
	local source_steamID = GetSteamID(source)
	local player_steamID = GetSteamID(player)
	local PLAYER_ = source
	--
	MySQL.Async.execute("INSERT INTO srr_char_charges (`ts`, `STEAMID`, `Username`, `officer_STEAMID`, `officer_Username`, `charge`) VALUES (NOW(), @STEAMID, @Username, @officer_STEAMID, @officer_Username, @charge);",
		{["@STEAMID"] = player_steamID, ["@Username"] = GetPlayerName(player), ["@officer_STEAMID"] = source_steamID, ['@officer_Username'] = GetPlayerName(source), ['@charge'] = charge}, function()
		TriggerClientEvent("SRR_CHAR:s_Notify", PLAYER_, "" .. mdt.Server_Color .. "MDT~w~: Charge was added successfully")
		--
		TriggerClientEvent("SRR_CHAR:s_Notify", player, "" .. mdt.Server_Color .. "YOU WERE CHARGED WITH THE FOLLOWING CHARGE~w~:")
		TriggerClientEvent("SRR_CHAR:s_Notify", player, "~w~"..charge)
	end);
end)

-- Remove charges from MDT-System on ID
RegisterServerEvent("MDT_SKIP_EVENT:CHA_REM_2")
AddEventHandler('MDT_SKIP_EVENT:CHA_REM_2', function(player)
	local steamID = GetSteamID(source)
	local player_steamID = GetSteamID(player)
	local PLAYER_ = source
	--
	MySQL.Async.execute("DELETE FROM srr_char_charges WHERE STEAMID = @STEAMID",
		{["@STEAMID"] = player_steamID}, function()
		TriggerClientEvent("SRR_CHAR:s_Notify", PLAYER_, "" .. mdt.Server_Color .. "MDT~w~: You have successfully cleared all charges from: "..GetPlayerName(player))
		TriggerClientEvent("SRR_CHAR:s_Notify", player, "" .. mdt.Server_Color .. "Your charges has been cleared by a officer")
	end);
end)

-- List all charges from MDT-System
RegisterServerEvent("MDT_SKIP_EVENT:CHA_CHECK_2")
AddEventHandler('MDT_SKIP_EVENT:CHA_CHECK_2', function(player)
	local source_steamID = GetSteamID(source)
	local player_steamID = GetSteamID(player)
	local PLAYER_ = source
	--
	MySQL.Async.fetchAll("SELECT * FROM srr_char_charges WHERE STEAMID = @STEAMID ORDER BY `ts` DESC LIMIT 20", {["@STEAMID"] = player_steamID}, function(charge)
		if (#charge == 0) then
			TriggerClientEvent("SRR_CHAR:s_Notify", PLAYER_, "" .. mdt.Server_Color .. "MDT~w~: No previous charges were found")
		elseif (#charge >= 0) then
			TriggerClientEvent("SRR_CHAR:MDT_CLOSE", PLAYER_)
			TriggerClientEvent("Jobs:displayCharges", PLAYER_, GetPlayerName(player), charge)
			TriggerClientEvent("SRR_CHAR:s_Notify", PLAYER_, "" .. mdt.Server_Color .. "MDT~w~: Previous charges were found")
		end
	end);
end)

----------------------
-- */* MDT - ID */* --
----------------------

-- Display player Char_ID info in MDT-System
RegisterServerEvent("MDT_SKIP_EVENT:ID_CHECK_2")
AddEventHandler('MDT_SKIP_EVENT:ID_CHECK_2', function(player)
	local source_steamID = GetSteamID(source)
	local player_steamID = GetSteamID(player)
	local PLAYER_ = source
	
	MySQL.Async.fetchAll("SELECT * FROM chars WHERE STEAMID = @STEAMID", {["@STEAMID"] = player_steamID}, function(Firstname)
		if (#Firstname == 0) then
			TriggerClientEvent("SRR_CHAR:s_Notify", PLAYER_, "" .. mdt.Server_Color .. "MDT~w~: No person was found on that ID")
		elseif (#Firstname >= 0) then
			TriggerClientEvent("SRR_CHAR:MDT_CLOSE", PLAYER_)
			TriggerClientEvent("Jobs:displayID", PLAYER_, GetPlayerName(player), Firstname)
			TriggerClientEvent("SRR_CHAR:s_Notify", PLAYER_, "" .. mdt.Server_Color .. "MDT~w~: Person was found on ID, Loading...")
		end
	end);
end)

-- Reset license points SQL-function (check if player has any warrent(s) first)
RegisterServerEvent("MDT_SQL_RESET_D_POINTS")
AddEventHandler("MDT_SQL_RESET_D_POINTS", function(VALUE)
	local source_steamID = GetSteamID(source)
	local PLAYER = source
	
	MySQL.Async.fetchAll("SELECT * FROM srr_char_warrants WHERE STEAMID = @STEAMID ORDER BY `ts` DESC LIMIT 20", {["@STEAMID"] = source_steamID}, function(warrant)
	if (#warrant == 0) then
		MDT_SQL_RESET_D_POINTS_END(PLAYER)
		TriggerClientEvent("SRR_CHAR:s_Notify", PLAYER, "" .. mdt.Server_Color .. "Your license points was successfully reseted by the court house")
		--
		local SQL = 'UPDATE srrcore SET BANK = @MONEY WHERE STEAMID = @ID'
		local PARAM = {ID = source_steamID, MONEY = bank_value - VALUE}
		MySQL.Async.execute(SQL,PARAM)
		elseif (#warrant >= 0) then
			TriggerClientEvent("SRR_CHAR:s_Notify", PLAYER, "~r~You cannot reset your license points while you have active warrant(s)")	
		end
    end);
end)


-- Reset license points SQL-function
function MDT_SQL_RESET_D_POINTS_END(source)
	local source_steamID = GetSteamID(source)
	--
	MySQL.Async.fetchAll("UPDATE chars SET license_p = 0 WHERE STEAMID = @STEAMID", {["@STEAMID"] = source_steamID}, function()
	end);
end

------------------------------------------
-- */* MDT - VEHICLE REG OWN CLIENT */* --
------------------------------------------

-- Add current plate to database SQL-function (EVENT)
function MDT_SQL_ADD_PLATE(source, plate, veh_name)
	local PLAYER = source
	local source_steamID = GetSteamID(PLAYER)
	--
	TriggerClientEvent("MDT_SQL_VEHICLE_NOTE_REG", PLAYER, plate)
	MySQL.Async.execute("INSERT INTO srr_char_plate (`ts`, `STEAMID`, `Username`, `plate_number`, `veh_name`) VALUES (NOW(), @STEAMID, @Username, @plate_number, 	 @veh_name);", {["@STEAMID"] = source_steamID, ["@Username"] = GetPlayerName(PLAYER), ['@plate_number'] = plate, ['@veh_name'] = veh_name}, function()
	end);
end

-- Remove typed plate to database SQL-function (EVENT)
function MDT_SQL_REMOVE_PLATE(source, plate)
	local source_steamID = GetSteamID(source)
	local PLAYER = source
	--
	SRR_MONEY_BANK_REM_VALUE_DEREG(PLAYER, source_steamID, 350, plate)
end

-- Check if plate exists already in database SQL-function (EVENT)
RegisterServerEvent("MDT_SQL_CHECK_PLATE")
AddEventHandler("MDT_SQL_CHECK_PLATE", function(plate, veh_displaytext)
	local source_steamID = GetSteamID(source)
	local PLAYER = source
	
	MySQL.Async.fetchAll("SELECT * FROM srr_char_plate WHERE plate_number = @plate_number", {["@plate_number"] = plate}, function(PlateInfo)
		if (#PlateInfo == 0) then
			MDT_SQL_ADD_PLATE(PLAYER, plate, veh_displaytext)
		elseif (#PlateInfo >= 0) then
			TriggerClientEvent("SRR_CHAR:s_Notify", PLAYER, mdt.Server_Color .. "VEH REG~w~: This plate is already registered to San Andreas")
		end
	end);
end)

-- Check if plate exists already in database SQL-function (EVENT)
RegisterServerEvent("MDT_SQL_CHECK_R_PLATE")
AddEventHandler("MDT_SQL_CHECK_R_PLATE", function(plate)
	local source_steamID = GetSteamID(source)
	local PLAYER = source
	
	MySQL.Async.fetchAll("SELECT * FROM srr_char_plate WHERE STEAMID = @STEAMID and plate_number = @plate_number", {["@STEAMID"] = source_steamID, ["@plate_number"] = plate }, function(IsVehReg)
		if (#IsVehReg == 0) then
			TriggerClientEvent("SRR_CHAR:s_Notify", PLAYER, "" .. mdt.Server_Color .. "VEH REG~w~: The plate was not found in our system")
		elseif (#IsVehReg >= 0) then
			MDT_SQL_REMOVE_PLATE(PLAYER, plate)
		end
	end);
end)

-- List all plates in database SQL-function 
function MDT_SQL_DISPLAY_VEH_REGS(source)
	local source_steamID = GetSteamID(source)
	--
	MySQL.Async.fetchAll("SELECT * FROM srr_char_plate WHERE STEAMID = @STEAMID ORDER BY `ts` DESC LIMIT 20", {["@STEAMID"] = source_steamID}, function(vehs)
		if (#vehs == 0) then
			TriggerClientEvent("SRR_CHAR:s_Notify", source, "" .. mdt.Server_Color .. "VEH REG~w~: No current registrated plates were found, use /veh for more info")
		elseif (#vehs >= 0) then
			TriggerClientEvent("SRR_CHAR:MDT_CLOSE", source)
			TriggerClientEvent("Jobs:displayPlate", source, GetPlayerName(source), vehs)
		end
	end);
end

AddEventHandler('playerDropped', function(reason)
	local PLAYER = source
	source_steamID = GetSteamID(PLAYER)
	if mdt.Server_Del_Veh == true then
		MySQL.Async.execute("DELETE FROM srr_char_plate WHERE STEAMID = @STEAMID", {["@STEAMID"] = source_steamID}, function()
		end);
	end
end)

-------------------------------
-- */* MDT - VEHICLE REG */* --
-------------------------------

-- List all plates in database SQL-function 
RegisterServerEvent("MDT_SKIP_EVENT:PLATE_CHECK_2")
AddEventHandler('MDT_SKIP_EVENT:PLATE_CHECK_2', function(plate)
	local source_steamID = GetSteamID(source)
	local steam = nil
	local PLAYER_ = source
	--
	MySQL.Async.fetchAll("SELECT * FROM srr_char_plate WHERE plate_number = @plate_number ORDER BY `ts` DESC LIMIT 20", {["@plate_number"] = plate}, function(vehs)
		if (#vehs == 0) then
			TriggerClientEvent("SRR_CHAR:s_Notify", PLAYER_, "" .. mdt.Server_Color .. "MDT~w~: No person was found on that plate")
		elseif (#vehs >= 0) then
			TriggerClientEvent("SRR_CHAR:s_Notify", PLAYER_, "" .. mdt.Server_Color .. "MDT~w~: Person was found on vehicle, Loading...")
			TriggerClientEvent("SRR_CHAR:MDT_CLOSE", PLAYER_)
			for i = 1, #vehs, 1 do
				steam = vehs[i].STEAMID
			end
			MDT_SQL_DISPLAY_PLATE_PROCESS_2(PLAYER_, steam, plate, vehs)
		end
	end);
end)

function MDT_SQL_DISPLAY_PLATE_PROCESS_2(source, steam, plate, vehs)
	local source_steamID = GetSteamID(source)

	MySQL.Async.fetchAll("SELECT * FROM chars WHERE STEAMID = @STEAMID", {["@STEAMID"] = steam}, function(chari)
		TriggerClientEvent("Jobs:displayPlate_MDT", source, vehs, chari)
	end);
end

RegisterServerEvent("MDT_SKIP_EVENT:PLATE_FLAG_STOLEN_2")
AddEventHandler('MDT_SKIP_EVENT:PLATE_FLAG_STOLEN_2', function(plate, bool)
	local source_steamID = GetSteamID(source)
	local PLAYER_ = source
	--
	MySQL.Async.execute("UPDATE srr_char_plate SET flag_stolen = @flag_stolen WHERE plate_number = @plate_number", {["@plate_number"] = plate, ['flag_stolen'] = bool})
	TriggerClientEvent("SRR_CHAR:s_Notify", PLAYER_, "" .. mdt.Server_Color .. "MDT~w~: Plate: " .. mdt.Server_Color .. "" ..plate.." ~w~was flagged")
end)

RegisterServerEvent("MDT_SKIP_EVENT:PLATE_DEL_2")
AddEventHandler("MDT_SKIP_EVENT:PLATE_DEL_2", function(plate)
	local source_steamID = GetSteamID(source)
	local PLAYER = source
	--
	MySQL.Async.execute("DELETE FROM srr_char_plate WHERE plate_number = @plate_number;",
	{['@plate_number'] = plate}, function()
	TriggerClientEvent("SRR_CHAR:s_Notify", PLAYER, "" .. mdt.Server_Color .. "MDT~w~: Plate: " .. mdt.Server_Color .. "" ..plate.." ~w~was removed")
	end);
end)

------------------------------------------------------------------------------------------------
--- */* EVENT FOR REMOVING PLAYER WARRANTS WHEN DOING SOMETHING (ETC RELEASED FROM JAIL) */* ---
------------------------------------------------------------------------------------------------

--[[
Use this if you want to clear persons warrants from outside the script [etc jailscript on release]
- * \ / * - - * \ / * - - * \ / * - - * \ / * - - * \ / * - - * \ / * - - * \ / * - - * \ / * -
	TriggerServerEvent('SRR:RemoveFromWarrentList', GetPlayerServerId(PlayerId()))
- * / \ * - - * / \ * - - * / \ * - - * / \ * - - * / \ * - - * / \ * - - * / \ * - - * / \ * -
--]]

-- Remove warrants (event)
RegisterServerEvent("SRR:RemoveFromWarrentList")
AddEventHandler('SRR:RemoveFromWarrentList', function(ID)
    RemovePlayerFromWanted(ID)
end)

-- Remove warrants (func)
function RemovePlayerFromWanted(ID)
    local steamID = GetSteamID(ID)
    local sql = "DELETE FROM srr_char_warrants WHERE steamID = @id"
    local param = {id = steamID }
    MySQL.Async.execute(sql, param )
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