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

--- * --- * --- * --- * --- * --- * --- * -
----- SERVER EVENTS BEING PASSED OVER -----
--- * --- * --- * --- * --- * --- * --- * -

-- Bolo commands [add] - (events)
RegisterNetEvent("MDT_SKIP_EVENT:BOLO_ADD")
AddEventHandler("MDT_SKIP_EVENT:BOLO_ADD", function(str)
local ped = GetPlayerPed(-1)
	if IsPedInAnyVehicle(ped) then
		if GetVehicleClass( GetVehiclePedIsIn(ped, false ) ) == 18 then
			--
			TriggerServerEvent("MDT_SKIP_EVENT:BOLO_ADD_2", str)
		end
	end
end)

-- Bolo commands [clear] - (events)
RegisterNetEvent("MDT_SKIP_EVENT:BOLO_CLEAR")
AddEventHandler("MDT_SKIP_EVENT:BOLO_CLEAR", function(str)
local ped = GetPlayerPed(-1)
	if IsPedInAnyVehicle(ped) then
		if GetVehicleClass( GetVehiclePedIsIn(ped, false ) ) == 18 then
			--
			TriggerServerEvent("MDT_SKIP_EVENT:BOLO_CLEAR_2", str)
		end
	end
end)

-- Bolo commands [check] - (events)
RegisterNetEvent("MDT_SKIP_EVENT:BOLO_CHECK")
AddEventHandler("MDT_SKIP_EVENT:BOLO_CHECK", function(str)
local ped = GetPlayerPed(-1)
	if IsPedInAnyVehicle(ped) then
		if GetVehicleClass( GetVehiclePedIsIn(ped, false ) ) == 18 then
			--
			TriggerServerEvent("MDT_SKIP_EVENT:BOLO_CHECK_2", str)
		end
	end
end)

---------------------------------------------------------------------------------------

-- Points commands [add] - (events)
RegisterNetEvent("MDT_SKIP_EVENT:POINT_ADD")
AddEventHandler("MDT_SKIP_EVENT:POINT_ADD", function(id, points)
local ped = GetPlayerPed(-1)
	if IsPedInAnyVehicle(ped) then
		if GetVehicleClass( GetVehiclePedIsIn(ped, false ) ) == 18 then
			--
			TriggerServerEvent("MDT_SKIP_EVENT:POINT_ADD_2", id, points)
		end
	end
end)

---------------------------------------------------------------------------------------

-- War commands [check] - (events)
RegisterNetEvent("MDT_SKIP_EVENT:WAR_ADD")
AddEventHandler("MDT_SKIP_EVENT:WAR_ADD", function(id, str)
local ped = GetPlayerPed(-1)
	if IsPedInAnyVehicle(ped) then
		if GetVehicleClass( GetVehiclePedIsIn(ped, false ) ) == 18 then
			--
			TriggerServerEvent("MDT_SKIP_EVENT:WAR_ADD_2", id, str)
		end
	end
end)

-- War commands [clear] - (events)
RegisterNetEvent("MDT_SKIP_EVENT:WAR_CLEAR")
AddEventHandler("MDT_SKIP_EVENT:WAR_CLEAR", function(id)
local ped = GetPlayerPed(-1)
	if IsPedInAnyVehicle(ped) then
		if GetVehicleClass( GetVehiclePedIsIn(ped, false ) ) == 18 then
			--
			TriggerServerEvent("MDT_SKIP_EVENT:WAR_CLEAR_2", id)
		end
	end
end)

-- War commands [check] - (events)
RegisterNetEvent("MDT_SKIP_EVENT:WAR_CHECK")
AddEventHandler("MDT_SKIP_EVENT:WAR_CHECK", function(id)
local ped = GetPlayerPed(-1)
	if IsPedInAnyVehicle(ped) then
		if GetVehicleClass( GetVehiclePedIsIn(ped, false ) ) == 18 then
			--
			TriggerServerEvent("MDT_SKIP_EVENT:WAR_CHECK_2", id)
		end
	end
end)

---------------------------------------------------------------------------------------

-- Cha commands [add] - (events)
RegisterNetEvent("MDT_SKIP_EVENT:CHA_ADD")
AddEventHandler("MDT_SKIP_EVENT:CHA_ADD", function(id, str)
local ped = GetPlayerPed(-1)
	if IsPedInAnyVehicle(ped) then
		if GetVehicleClass( GetVehiclePedIsIn(ped, false ) ) == 18 then
			--
			TriggerServerEvent("MDT_SKIP_EVENT:CHA_ADD_2", id, str)
		end
	end
end)

-- Cha commands [clear] - (events)
RegisterNetEvent("MDT_SKIP_EVENT:CHA_REM")
AddEventHandler("MDT_SKIP_EVENT:CHA_REM", function(id)
local ped = GetPlayerPed(-1)
	if IsPedInAnyVehicle(ped) then
		if GetVehicleClass( GetVehiclePedIsIn(ped, false ) ) == 18 then
			--
			TriggerServerEvent("MDT_SKIP_EVENT:CHA_REM_2", id)
		end
	end
end)

-- Cha commands [check] - (events)
RegisterNetEvent("MDT_SKIP_EVENT:CHA_CHECK")
AddEventHandler("MDT_SKIP_EVENT:CHA_CHECK", function(id)
local ped = GetPlayerPed(-1)
	if IsPedInAnyVehicle(ped) then
		if GetVehicleClass( GetVehiclePedIsIn(ped, false ) ) == 18 then
			--
			TriggerServerEvent("MDT_SKIP_EVENT:CHA_CHECK_2", id)
		end
	end
end)

---------------------------------------------------------------------------------------

-- ID commands [check] - (events)
RegisterNetEvent("MDT_SKIP_EVENT:ID_CHECK")
AddEventHandler("MDT_SKIP_EVENT:ID_CHECK", function(id)
local ped = GetPlayerPed(-1)
	if IsPedInAnyVehicle(ped) then
		if GetVehicleClass( GetVehiclePedIsIn(ped, false ) ) == 18 then
			--
			TriggerServerEvent("MDT_SKIP_EVENT:ID_CHECK_2", id)
		end
	end
end)

-- Plate commands [check] - (events)
RegisterNetEvent("MDT_SKIP_EVENT:PLATE_CHECK")
AddEventHandler("MDT_SKIP_EVENT:PLATE_CHECK", function(plate)
local ped = GetPlayerPed(-1)
	if IsPedInAnyVehicle(ped) then
		if GetVehicleClass( GetVehiclePedIsIn(ped, false ) ) == 18 then
			--
			TriggerServerEvent("MDT_SKIP_EVENT:PLATE_CHECK_2", plate)
		end
	end
end)

-- Plate commands [flag - stolen] - (events)
RegisterNetEvent("MDT_SKIP_EVENT:PLATE_FLAG_STOLEN")
AddEventHandler("MDT_SKIP_EVENT:PLATE_FLAG_STOLEN", function(plate, var)
local ped = GetPlayerPed(-1)
	if IsPedInAnyVehicle(ped) then
		if GetVehicleClass( GetVehiclePedIsIn(ped, false ) ) == 18 then
			--
			TriggerServerEvent("MDT_SKIP_EVENT:PLATE_FLAG_STOLEN_2", plate, var)
		end
	end
end)

-- Plate commands [del plate] - (events)
RegisterNetEvent("MDT_SKIP_EVENT:PLATE_DEL")
AddEventHandler("MDT_SKIP_EVENT:PLATE_DEL", function(plate)
local ped = GetPlayerPed(-1)
	if IsPedInAnyVehicle(ped) then
		if GetVehicleClass( GetVehiclePedIsIn(ped, false ) ) == 18 then
			--
			TriggerServerEvent("MDT_SKIP_EVENT:PLATE_DEL_2", plate)
		end
	end
end)