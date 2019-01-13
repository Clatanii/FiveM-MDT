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

------------------------------------------
--- */* SCRIPT CLIENT LOCAL CONFIG */* ---
------------------------------------------

-- */* Basic Vars */*
local ped = GetPlayerPed(-1)
local showmyinfo = false

-- */* SCREEN VARS */*
local resx, resy = GetScreenResolution()
local xoffs = 355

-- */* ARRAYS */*
mdt_bolos = {};
mdt_warrents = {};
mdt_charges = {};
mdt_id = {};
veh_plate = {};
mdt_plate = {};
mdt_chari = {};

-- */* Main Page Vars */*
CHAR_MDT_ONDUTY_VAR = true
CHAR_MDT_STATUS_CURRENT = "STABLE"
CHAR_MDT_NOTE = "NOT SET"

-----------------------------
--- */* SCRIPT EVENTS */* ---
-----------------------------

-- Vehicle Reg Event
RegisterNetEvent('MDT_VEH_REG_PART_1')
AddEventHandler('MDT_VEH_REG_PART_1', function()
	VehicleRegistartionNotification()
end)

-- Vehicle De-Reg Event
RegisterNetEvent('MDT_VEH_DEREG_PART_1')
AddEventHandler('MDT_VEH_DEREG_PART_1', function(PLATE)
	VehicleDeRegistartionNotification(PLATE)
end)

RegisterNetEvent('MDT_SQL_VEHICLE_NOTE_REG')
AddEventHandler('MDT_SQL_VEHICLE_NOTE_REG', function(vehicleplate)
	SetNotificationTextEntry("STRING")
	AddTextComponentSubstringPlayerName("~w~This Vehicle has now been registered to your name.")
	SetNotificationMessage("CHAR_PEGASUS_DELIVERY", "CHAR_PEGASUS_DELIVERY", true, 4, "SRR - VREG", "" .. mdt.Server_Color .. "Plate:~w~ "..vehicleplate)
	DrawNotification(false, true);
end)

-- Change Personal Note
RegisterNetEvent('SRR_CHAR:NOTE_MDT')
AddEventHandler('SRR_CHAR:NOTE_MDT', function(note)
	local ped = GetPlayerPed(-1)
	if IsPedInAnyVehicle(ped) and CHAR_MDT_ONDUTY_VAR == true then
		if GetVehicleClass( GetVehiclePedIsIn(ped, false ) ) == 18 then
		--
			drawNotification("" .. mdt.Server_Color .. "MDT~w~: Your personal note has been changed")
			CHAR_MDT_NOTE = note
		--
		end
	end
end)

-- Close all MDT windows
RegisterNetEvent('SRR_CHAR:MDT_CLOSE')
AddEventHandler('SRR_CHAR:MDT_CLOSE', function()
	showmyinfo = false
end)

-- Close all MDT windows with arrays
RegisterNetEvent('SRR_CHAR:MDT_CLOSE_ARRAY')
AddEventHandler('SRR_CHAR:MDT_CLOSE_ARRAY', function()
	mdt_bolos = {};
	mdt_warrents = {};
	mdt_charges = {};
	mdt_id = {};
	veh_plate = {};
	mdt_plate = {};
	mdt_chari = {};
end)

-- Show Black Box Template for main
RegisterNetEvent('SRR_CHAR:HomePage_MDT')
AddEventHandler('SRR_CHAR:HomePage_MDT', function(menu, desc1, desc2, desc3, line1, line2, line3, line4, line5, line6, line7, line8, line9, line10, line11, line12, line13, line14, line15, line16)
  Citizen.CreateThread(function()
	Citizen.Wait(0)
	local ped = GetPlayerPed(-1)
	--
	if IsPedInAnyVehicle(ped) and CHAR_MDT_ONDUTY_VAR == true then
        if GetVehicleClass( GetVehiclePedIsIn(ped, false ) ) == 18 then
	--
			showmyinfo = false
			Citizen.Wait(1)
			PlaySoundFrontend(-1, "Menu_Accept", "Phone_SoundSet_Default", 1);
			showmyinfo = true
			ShowMDTblackbox_MDT_MAIN(menu, desc1, desc2, desc3, line1, line2, line3, line4, line5, line6, line7, line8, line9, line10, line11, line12, line13, line14, line15, line16)

			while showmyinfo do
			Citizen.Wait(1)
			if (IsControlJustPressed(1, 178)) then
				showmyinfo = false
				PlaySoundFrontend(-1, "BACK", "HUD_AMMO_SHOP_SOUNDSET", 1)
			end
		end
	end
end
end)
end)

-- Show Black Box Template for others MDT
RegisterNetEvent('SRR_CHAR:HomePage_MDT_OTHERS')
AddEventHandler('SRR_CHAR:HomePage_MDT_OTHERS', function(menu, desc1, desc2, desc3, line1, line2, line3, line4, line5, line6, line7, line8, line9, line10, line11, line12, line13, line14, line15, line16)
  Citizen.CreateThread(function()
	Citizen.Wait(0)
	--
	if IsPedInAnyVehicle(ped) and CHAR_MDT_ONDUTY_VAR == true then
        if GetVehicleClass( GetVehiclePedIsIn(ped, false ) ) == 18 then
	--
			showmyinfo = false
			Citizen.Wait(1)
			PlaySoundFrontend(-1, "Menu_Accept", "Phone_SoundSet_Default", 1);
			showmyinfo = true
			ShowMDTblackbox_MDT_OTHER(menu, desc1, desc2, desc3, line1, line2, line3, line4, line5, line6, line7, line8, line9, line10, line11, line12, line13, line14, line15, line16)

			while showmyinfo do
			Citizen.Wait(1)
			if (IsControlJustPressed(1, 178)) then
				showmyinfo = false
				PlaySoundFrontend(-1, "BACK", "HUD_AMMO_SHOP_SOUNDSET", 1)
			end
		end
	end
end
end)
end)

-- Show Black Box Template for others (none vehicle/not need to be in veh)
RegisterNetEvent('SOSA:BOX_TEMPLATE')
AddEventHandler('SOSA:BOX_TEMPLATE', function(menu, desc1, desc2, desc3, line1, line2, line3, line4, line5, line6, line7, line8, line9, line10, line11, line12, line13, line14, line15, line16)
	Citizen.CreateThread(function()
		Citizen.Wait(0)
			-- */* --
			showmyinfo = false
			Citizen.Wait(1)
			PlaySoundFrontend(-1, "Menu_Accept", "Phone_SoundSet_Default", 1)
			showmyinfo = true
			ShowMDTblackbox_MDT_OTHER(menu, desc1, desc2, desc3, line1, line2, line3, line4, line5, line6, line7, line8, line9, line10, line11, line12, line13, line14, line15, line16)
			-- */* --
			while showmyinfo do
			Citizen.Wait(1)
			-- */* --
			if (IsControlJustPressed(1, 178)) then
				showmyinfo = false
				PlaySoundFrontend(-1, "BACK", "HUD_AMMO_SHOP_SOUNDSET", 1)
			end
			-- */* --
		end
	end)
end)

----------------------------
--- */* SCRIPT LOOPS */* ---
----------------------------

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)

		-- MDT display [BOLOS]
		if (#mdt_bolos > 0) then
			drawTxt(1.043, 0.675, 1.0,1.0,1.1, mdt.Server_Color .. mdt.Server_Name .. " ~w~| MOBILE DATA TERMINAL", 255, 255, 255, 200)
			drawTxt(1.043, 0.730, 1.0,1.0,0.48, "~c~This Mobile Device is owned by the San Andreas Goverment 2018 & 2019 - CC("..mdt.Server_Name..")", 255, 255, 255, 200)
			drawTxt(1.043, 0.780, 1.0,1.0,0.48, "" .. mdt.Server_Color .. "ACTIVE BOLOS:", 255, 255, 255, 200)
			DrawRect((float(1080 + xoffs)/1.5)/resx, (float(524)/1.5)/resy, (float(800)/1.5)/resx, (float(650)/1.5)/resy, 0, 0, 0, 200);
			for i = 1, #mdt_bolos do
				drawTxt(1.043, 0.780 + i*0.021, 1.0,1.0,0.48, "[" .. mdt_bolos[i].ts .. "] " .. mdt_bolos[i].bolo .. " ~c~(by " .. mdt_bolos[i].Username .. ")~w~", 255, 255, 255, 200);
				if (i == #mdt_bolos) then
					drawTxt(1.192, 1.245, 1.0,1.0,0.45, "~c~P R E S S  ~c~D E L  ~c~T O  C L O S E", 255, 255, 255, 200)
				end
			end
			if (IsControlJustPressed(0, 178)) then
				mdt_bolos = {};
				showmyinfo = false
				PlaySoundFrontend(-1, "BACK", "HUD_AMMO_SHOP_SOUNDSET", 1);
			end
		end
		
		-- MDT display [WARRANTS]
		if (#mdt_warrents > 0) then
			drawTxt(1.043, 0.675, 1.0,1.0,1.1, mdt.Server_Color .. mdt.Server_Name .. " ~w~| MOBILE DATA TERMINAL", 255, 255, 255, 200)
			drawTxt(1.043, 0.730, 1.0,1.0,0.48, "~c~This Mobile Device is owned by the San Andreas Goverment 2018 & 2019 - CC("..mdt.Server_Name..")", 255, 255, 255, 200)
			drawTxt(1.043, 0.780, 1.0,1.0,0.48, "" .. mdt.Server_Color .. "ACTIVE ARREST WARRANTS:", 255, 255, 255, 200)
			DrawRect((float(1080 + xoffs)/1.5)/resx, (float(524)/1.5)/resy, (float(800)/1.5)/resx, (float(650)/1.5)/resy, 0, 0, 0, 200);
			for i = 1, #mdt_warrents do
				drawTxt(1.043, 0.780 + i*0.021, 1.0,1.0,0.48, "[" .. mdt_warrents[i].ts .. "] " .. mdt_warrents[i].warrant .. " ~c~(by " .. mdt_warrents[i].officer_Username .. ")", 255, 255, 255, 200);
				if (i == #mdt_warrents) then
					drawTxt(1.192, 1.245, 1.0,1.0,0.45, "~c~P R E S S  ~c~D E L  ~c~T O  C L O S E", 255, 255, 255, 200);
				end
			end
			if (IsControlJustPressed(0, 178)) then
				mdt_warrents = {};
				showingmdtboxblack = false
				mdt_playerName = nil;
				PlaySoundFrontend(-1, "BACK", "HUD_AMMO_SHOP_SOUNDSET", 1);
			end
		end
		
		-- MDT display [CHARGES]
		if (#mdt_charges > 0) then
			drawTxt(1.043, 0.675, 1.0,1.0,1.1, mdt.Server_Color .. mdt.Server_Name .. " ~w~| MOBILE DATA TERMINAL", 255, 255, 255, 200)
			drawTxt(1.043, 0.730, 1.0,1.0,0.48, "~c~This Mobile Device is owned by the San Andreas Goverment 2018 & 2019 - CC("..mdt.Server_Name..")", 255, 255, 255, 200)
			drawTxt(1.043, 0.780, 1.0,1.0,0.48, "" .. mdt.Server_Color .. "PREV CHARGES:", 255, 255, 255, 200)
			DrawRect((float(1080 + xoffs)/1.5)/resx, (float(524)/1.5)/resy, (float(800)/1.5)/resx, (float(650)/1.5)/resy, 0, 0, 0, 200);
			for i = 1, #mdt_charges do
				drawTxt(1.043, 0.780 + i*0.021, 1.0,1.0,0.48, "[" .. mdt_charges[i].ts .. "] " .. mdt_charges[i].charge .. " ~c~(by " .. mdt_charges[i].officer_Username .. ")", 255, 255, 255, 200);
				if (i == #mdt_charges) then
					drawTxt(1.192, 1.245, 1.0,1.0,0.45, "~c~P R E S S  ~c~D E L  ~c~T O  C L O S E", 255, 255, 255, 200);
				end
			end
			if (IsControlJustPressed(0, 178)) then
				mdt_charges = {};
				showingmdtboxblack = false
				mdt_playerName = nil;
				PlaySoundFrontend(-1, "BACK", "HUD_AMMO_SHOP_SOUNDSET", 1);
			end
		end
		-- MDT display [ID]
		if (#mdt_id > 0) then
			drawTxt(1.043, 0.675, 1.0,1.0,1.1, mdt.Server_Color .. mdt.Server_Name .. " ~w~| MOBILE DATA TERMINAL", 255, 255, 255, 200)
			drawTxt(1.043, 0.730, 1.0,1.0,0.48, "~c~This Mobile Device is owned by the San Andreas Goverment 2018 & 2019 - CC("..mdt.Server_Name..")", 255, 255, 255, 200)
			DrawRect((float(1080 + xoffs)/1.5)/resx, (float(524)/1.5)/resy, (float(800)/1.5)/resx, (float(650)/1.5)/resy, 0, 0, 0, 200);
			for i = 1, #mdt_id do
				drawTxt(1.043, 0.780, 1.0,1.0,0.48, "" .. mdt.Server_Color .. "ID INFORMATION:", 255, 255, 255, 200)
				drawTxt(1.043, 0.805, 1.0,1.0,0.48, "~w~Firstname: ~c~"..mdt_id[i].Firstname, 255, 255, 255, 200)
				drawTxt(1.043, 0.830, 1.0,1.0,0.48, "~w~Lastname: ~c~"..mdt_id[i].Lastname, 255, 255, 255, 200)
				drawTxt(1.043, 0.855, 1.0,1.0,0.48, "~w~D/O/B: ~c~"..mdt_id[i].DOB, 255, 255, 255, 200)
				drawTxt(1.043, 0.880, 1.0,1.0,0.48, "~w~Gender: ~c~"..mdt_id[i].Gender, 255, 255, 255, 200)
				if mdt.Server_Licenses == true then
					drawTxt(1.043, 0.905, 1.0,1.0,0.48, "~w~Valid Driver's License: ~c~"..tostring(mdt_id[i].d_license), 255, 255, 255, 200)
					drawTxt(1.043, 0.930, 1.0,1.0,0.48, "~w~Valid C-Driver's License: ~c~"..tostring(mdt_id[i].cd_license), 255, 255, 255, 200)
					drawTxt(1.043, 0.980, 1.0,1.0,0.48, "~w~Valid Pilot License(~y~IN-DEV~w~): ~c~"..tostring(mdt_id[i].b_license), 255, 255, 255, 200)
					drawTxt(1.043, 1.005, 1.0,1.0,0.48, "~w~Valid Firearm's License: ~c~"..tostring(mdt_id[i].f_license), 255, 255, 255, 200)
					if mdt_id[i].license_p >= 15 then
						drawTxt(1.043, 0.955, 1.0,1.0,0.48, "~w~Driver's License Points: ~r~15 (suspended)", 255, 255, 255, 200)
					else
						drawTxt(1.043, 0.955, 1.0,1.0,0.48, "~w~Driver's License Points: ~c~"..mdt_id[i].license_p, 255, 255, 255, 200)
					end
				else
					if mdt_id[i].license_p >= 15 then
						drawTxt(1.043, 0.905, 1.0,1.0,0.48, "~w~Driver's License Points: ~r~15 (suspended)", 255, 255, 255, 200)
					else
						drawTxt(1.043, 0.905, 1.0,1.0,0.48, "~w~Driver's License Points: ~c~"..mdt_id[i].license_p, 255, 255, 255, 200)
					end
				end
				--
				if (i == #mdt_id) then
					drawTxt(1.192, 1.245, 1.0,1.0,0.45, "~c~P R E S S  ~c~D E L  ~c~T O  C L O S E", 255, 255, 255, 200);
				end
			end
			if (IsControlJustPressed(0, 178)) then
				mdt_id = {};
				showingmdtboxblack = false
				mdt_playerName = nil;
				PlaySoundFrontend(-1, "BACK", "HUD_AMMO_SHOP_SOUNDSET", 1);
			end
		end
		-- MDT display [PLATE(S)]
		if (#mdt_plate > 0) then
			drawTxt(1.043, 0.675, 1.0,1.0,1.1, mdt.Server_Color .. mdt.Server_Name .. " ~w~| MOBILE DATA TERMINAL", 255, 255, 255, 200)
			drawTxt(1.043, 0.730, 1.0,1.0,0.48, "~c~This Mobile Device is owned by the San Andreas Goverment 2018 & 2019 - CC("..mdt.Server_Name..")", 255, 255, 255, 200)
			DrawRect((float(1080 + xoffs)/1.5)/resx, (float(524)/1.5)/resy, (float(800)/1.5)/resx, (float(650)/1.5)/resy, 0, 0, 0, 200);
			for i = 1, #mdt_plate do
				drawTxt(1.043, 0.780, 1.0,1.0,0.48, "" .. mdt.Server_Color .. "PLATE HISTORY:", 255, 255, 255, 200)
				drawTxt(1.043, 0.780 + i*0.021, 1.0,1.0,0.48, "~w~[~c~" .. mdt_plate[i].plate_number .. "~w~] ~c~- ~w~(~c~".. mdt_plate[i].veh_name .."~w~) ~c~- ~w~[~c~Stolen: ".. tostring(mdt_plate[i].flag_stolen) .."~w~) ~c~- ~w~[".. mdt_plate[i].Username .. "]", 255, 255, 255, 200);
				drawTxt(1.043, 0.780 + i*0.042, 1.0,1.0,0.48, "  ~w~[~w~Full name: ~c~"..mdt_chari[i].Firstname.." ~w~/ ~c~"..mdt_chari[i].Lastname.."~w~] ~c~- ~w~[DOB: ~c~"..mdt_chari[i].DOB.."~w~]", 255, 255, 255, 200);
				if (i == #mdt_plate) then
					drawTxt(1.192, 1.245, 1.0,1.0,0.45, "~c~P R E S S  ~c~D E L  ~c~T O  C L O S E", 255, 255, 255, 200);
				end
			end
			if (IsControlJustPressed(0, 178)) then
				mdt_plate = {};
				mdt_chari = {};
				showingmdtboxblack = false
				mdt_playerName = nil;
				PlaySoundFrontend(-1, "BACK", "HUD_AMMO_SHOP_SOUNDSET", 1);
			end
		end
		-- CHAR display [PLATES - CLIENT]
		if (#veh_plate > 0) then
			drawTxt(1.043, 0.675, 1.0,1.0,1.1, mdt.Server_Color .. mdt.Server_Name .. " ~w~| VEHICLE REGISTRATIONS", 255, 255, 255, 200)
			drawTxt(1.043, 0.730, 1.0,1.0,0.48, "~c~All current vehicles that are registered to the san andreas DMV", 255, 255, 255, 200)
			DrawRect((float(1080 + xoffs)/1.5)/resx, (float(524)/1.5)/resy, (float(800)/1.5)/resx, (float(650)/1.5)/resy, 0, 0, 0, 200);
			for i = 1, #veh_plate do
				drawTxt(1.043, 0.780, 1.0,1.0,0.48, "" .. mdt.Server_Color .. "CURRENT REGISTERED VEHICLES:", 255, 255, 255, 200)
				drawTxt(1.043, 0.780 + i*0.021, 1.0,1.0,0.48, "~w~[~c~" .. veh_plate[i].plate_number .. "~w~] ~c~- ~w~(~c~".. veh_plate[i].veh_name .."~w~) ~c~- ~w~[~c~Stolen: ".. tostring(veh_plate[i].flag_stolen) .."~w~)", 255, 255, 255, 200);
				if (i == #veh_plate) then
					drawTxt(1.192, 1.245, 1.0,1.0,0.45, "~c~P R E S S  ~c~D E L  ~c~T O  C L O S E", 255, 255, 255, 200);
				end
			end
			if (IsControlJustPressed(0, 178)) then
				veh_plate = {};
				showingmdtboxblack = false
				mdt_playerName = nil;
				PlaySoundFrontend(-1, "BACK", "HUD_AMMO_SHOP_SOUNDSET", 1);
			end
		end
	end
end)

--------------------------------
--- */* SCRIPT FUNCTIONS */* ---
--------------------------------

-- Show MDT window for the main page
function ShowMDTblackbox_MDT_MAIN(menu, desc1, desc2, desc3, line1, line2, line3, line4, line5, line6, line7, line8, line9, line10, line11, line12, line13, line14, line15, line16)
	Citizen.CreateThread(function()
	local resx, resy = GetScreenResolution()
	local xoffs = 355
		while showmyinfo == true do
			Citizen.Wait(1)
			DrawRect((float(1080 + xoffs)/1.5)/resx, (float(524)/1.5)/resy, (float(800)/1.5)/resx, (float(650)/1.5)/resy, 0, 0, 0, 200)
			drawTxt(1.043, 0.675, 1.0,1.0,1.1, menu, 255, 255, 255, 200)
			drawTxt(1.043, 0.730, 1.0,1.0,0.48, desc1, 255, 255, 255, 200)
			drawTxt(1.043, 0.755, 1.0,1.0,0.48, desc2, 255, 255, 255, 200)
			drawTxt(1.043, 0.780, 1.0,1.0,0.48, desc3, 255, 255, 255, 200)
			drawTxt(1.043, 0.805, 1.0,1.0,0.48, line1, 255, 255, 255, 200)
			drawTxt(1.043, 0.830, 1.0,1.0,0.48, line2, 255, 255, 255, 200)
			drawTxt(1.043, 0.855, 1.0,1.0,0.48, line3, 255, 255, 255, 200)
			drawTxt(1.043, 0.880, 1.0,1.0,0.48, line4, 255, 255, 255, 200)
			drawTxt(1.043, 0.905, 1.0,1.0,0.48, line5, 255, 255, 255, 200)
			drawTxt(1.043, 0.930, 1.0,1.0,0.48, line6, 255, 255, 255, 200)
			drawTxt(1.043, 0.955, 1.0,1.0,0.48, line7, 255, 255, 255, 200)
			drawTxt(1.043, 0.980, 1.0,1.0,0.48, line8, 255, 255, 255, 200)
			drawTxt(1.043, 1.005, 1.0,1.0,0.48, line9, 255, 255, 255, 200)
			drawTxt(1.043, 1.030, 1.0,1.0,0.48, line10, 255, 255, 255, 200)
			drawTxt(1.043, 1.055, 1.0,1.0,0.48, line11..CHAR_MDT_NOTE, 255, 255, 255, 200)
			drawTxt(1.043, 1.080, 1.0,1.0,0.48, line12..mdt.Script_Ver, 255, 255, 255, 200)
			drawTxt(1.043, 1.105, 1.0,1.0,0.48, line13..CHAR_MDT_STATUS_CURRENT, 255, 255, 255, 200)
			drawTxt(1.043, 1.130, 1.0,1.0,0.48, line14, 255, 255, 255, 200)
			drawTxt(1.043, 1.155, 1.0,1.0,0.48, line15, 255, 255, 255, 200)
			drawTxt(1.043, 1.180, 1.0,1.0,0.48, line16, 255, 255, 255, 200)
			drawTxt(1.387, 1.253, 1.0,1.0,0.40, line18, 255, 255, 255, 200)
			drawTxt(1.192, 1.245, 1.0,1.0,0.45, "~c~P R E S S  ~c~D E L  ~c~T O  C L O S E", 255, 255, 255, 200)
		end
	end)
end

-- Show MDT window for the other pages
function ShowMDTblackbox_MDT_OTHER(menu, desc1, desc2, desc3, line1, line2, line3, line4, line5, line6, line7, line8, line9, line10, line11, line12, line13, line14, line15, line16)
	Citizen.CreateThread(function()
	local resx, resy = GetScreenResolution()
	local xoffs = 355
		while showmyinfo == true do
			Citizen.Wait(1)
			DrawRect((float(1080 + xoffs)/1.5)/resx, (float(524)/1.5)/resy, (float(800)/1.5)/resx, (float(650)/1.5)/resy, 0, 0, 0, 200)
			drawTxt(1.043, 0.675, 1.0,1.0,1.1, menu, 255, 255, 255, 200)
			drawTxt(1.043, 0.730, 1.0,1.0,0.48, desc1, 255, 255, 255, 200)
			drawTxt(1.043, 0.755, 1.0,1.0,0.48, desc2, 255, 255, 255, 200)
			drawTxt(1.043, 0.780, 1.0,1.0,0.48, desc3, 255, 255, 255, 200)
			drawTxt(1.043, 0.805, 1.0,1.0,0.48, line1, 255, 255, 255, 200)
			drawTxt(1.043, 0.830, 1.0,1.0,0.48, line2, 255, 255, 255, 200)
			drawTxt(1.043, 0.855, 1.0,1.0,0.48, line3, 255, 255, 255, 200)
			drawTxt(1.043, 0.880, 1.0,1.0,0.48, line4, 255, 255, 255, 200)
			drawTxt(1.043, 0.905, 1.0,1.0,0.48, line5, 255, 255, 255, 200)
			drawTxt(1.043, 0.930, 1.0,1.0,0.48, line6, 255, 255, 255, 200)
			drawTxt(1.043, 0.955, 1.0,1.0,0.48, line7, 255, 255, 255, 200)
			drawTxt(1.043, 0.980, 1.0,1.0,0.48, line8, 255, 255, 255, 200)
			drawTxt(1.043, 1.005, 1.0,1.0,0.48, line9, 255, 255, 255, 200)
			drawTxt(1.043, 1.030, 1.0,1.0,0.48, line10, 255, 255, 255, 200)
			drawTxt(1.043, 1.055, 1.0,1.0,0.48, line11, 255, 255, 255, 200)
			drawTxt(1.043, 1.080, 1.0,1.0,0.48, line12, 255, 255, 255, 200)
			drawTxt(1.043, 1.105, 1.0,1.0,0.48, line13, 255, 255, 255, 200)
			drawTxt(1.043, 1.130, 1.0,1.0,0.48, line14, 255, 255, 255, 200)
			drawTxt(1.043, 1.155, 1.0,1.0,0.48, line15, 255, 255, 255, 200)
			drawTxt(1.043, 1.180, 1.0,1.0,0.48, line16, 255, 255, 255, 200)
			drawTxt(1.387, 1.253, 1.0,1.0,0.40, line18, 255, 255, 255, 200)
			drawTxt(1.192, 1.245, 1.0,1.0,0.45, "~c~P R E S S  ~c~D E L  ~c~T O  C L O S E", 255, 255, 255, 200);
		end
	end)
end

-- Display Bolos from MDT-System
function CLIENT_DISPLAY_BOLOS(bolos)
local ped = GetPlayerPed(-1)
	if IsPedInAnyVehicle(ped) then
		if GetVehicleClass( GetVehiclePedIsIn(ped, false ) ) == 18 then
			--
			PlaySoundFrontend(-1, "Menu_Accept", "Phone_SoundSet_Default", 1)
			--
			mdt_bolos = bolos;
			mdt_warrents = {};
			mdt_playerName = nil;
			mdt_charges = {};
			mdt_id = {};
			veh_plate = {};
			mdt_plate = {};
			mdt_chari = {};
		end
	end
end
RegisterNetEvent("Jobs:displayBolos");
AddEventHandler("Jobs:displayBolos", CLIENT_DISPLAY_BOLOS)

-- Display warrants from MDT-System
function CLIENT_DISPLAY_WARRANT(playerName, warrant)
local ped = GetPlayerPed(-1)
	if IsPedInAnyVehicle(ped) then
		if GetVehicleClass( GetVehiclePedIsIn(ped, false ) ) == 18 then
			--
			PlaySoundFrontend(-1, "Menu_Accept", "Phone_SoundSet_Default", 1)
			--
			mdt_bolos = {};
			mdt_warrents = warrant;
			mdt_playerName = playerName;
			mdt_charges = {};
			mdt_id = {};
			veh_plate = {};
			mdt_plate = {};
			mdt_chari = {};
		end
	end
end
RegisterNetEvent("Jobs:displayWarrents");
AddEventHandler("Jobs:displayWarrents", CLIENT_DISPLAY_WARRANT)

-- Display charges from MDT-System
function CLIENT_DISPLAY_CHARGE(playerName, charges)
local ped = GetPlayerPed(-1)
	if IsPedInAnyVehicle(ped) then
		if GetVehicleClass( GetVehiclePedIsIn(ped, false ) ) == 18 then
			--
			PlaySoundFrontend(-1, "Menu_Accept", "Phone_SoundSet_Default", 1)
			--
			mdt_charges = charges;
			mdt_bolos = {};
			mdt_warrents = {};
			mdt_playerName = playerName;
			mdt_id = {};
			veh_plate = {};
			mdt_plate = {};
			mdt_chari = {};
		end
	end
end
RegisterNetEvent("Jobs:displayCharges");
AddEventHandler("Jobs:displayCharges", CLIENT_DISPLAY_CHARGE)

-- Display plates from MDT-System
function MDT_DISPLAY_PLATE(plate, chari)
local ped = GetPlayerPed(-1)
	if IsPedInAnyVehicle(ped) then
		if GetVehicleClass( GetVehiclePedIsIn(ped, false ) ) == 18 then
			--
			PlaySoundFrontend(-1, "Menu_Accept", "Phone_SoundSet_Default", 1)
			--
			mdt_charges = {}
			mdt_bolos = {};
			mdt_warrents = {};
			mdt_playerName = playerName;
			mdt_id = {};
			veh_plate = {};
			mdt_plate = plate;
			mdt_chari = chari;
		end
	end
end
RegisterNetEvent("Jobs:displayPlate_MDT");
AddEventHandler("Jobs:displayPlate_MDT", MDT_DISPLAY_PLATE)

-- Display ID from Char-System
function CLIENT_DISPLAY_ID(playerName, characterInfo)
local ped = GetPlayerPed(-1)
	if IsPedInAnyVehicle(ped) then
		if GetVehicleClass( GetVehiclePedIsIn(ped, false ) ) == 18 then
			--
			PlaySoundFrontend(-1, "Menu_Accept", "Phone_SoundSet_Default", 1)
			--
			mdt_charges = {}
			mdt_bolos = {};
			mdt_warrents = {};
			mdt_playerName = playerName;
			mdt_id = characterInfo;
			veh_plate = {};
			mdt_plate = {};
			mdt_chari = {};
		end
	end
end
RegisterNetEvent("Jobs:displayID");
AddEventHandler("Jobs:displayID", CLIENT_DISPLAY_ID)

-- Display ID from Char-System
function CLIENT_DISPLAY_PLATE(playerName, plates)
local ped = GetPlayerPed(-1)
	--
	PlaySoundFrontend(-1, "Menu_Accept", "Phone_SoundSet_Default", 1)
	--
	mdt_charges = {}
	mdt_bolos = {};
	mdt_warrents = {};
	mdt_playerName = playerName;
	mdt_id = {};
	veh_plate = plates;
	mdt_plate = {};
	mdt_chari = {};
end
RegisterNetEvent("Jobs:displayPlate");
AddEventHandler("Jobs:displayPlate", CLIENT_DISPLAY_PLATE)

function CourtMenuRenewLicense()
    local PED = GetPlayerPed(-1)
    local COORDS = GetEntityCoords(PED, true)
    local COURTLOCATION = Vdist(233.31, -410.29, 48.11, COORDS.x, COORDS.y, COORDS.z)

    -- Open InteractionMenu
    if COURTLOCATION < 2 then
        DrawTextOnScreen(233.31, -410.29, 48.11 + 0.5, '[~g~E~s~] Renew License Points')
	    if IsControlJustReleased(0, 38) and GetLastInputMethod( 0 ) then
			TriggerServerEvent("MDT_SQL_RESET_D_POINTS", 2800)
        end
    end
end

-- Vehicle Reg
function VehicleRegistartionNotification()
local vehicle = GetLastDrivenVehicle()
local vehicleplate = GetVehicleNumberPlateText(vehicle)
local veh_displaytext = GetLabelText(GetDisplayNameFromVehicleModel(GetEntityModel(vehicle)))


	if IsPedInAnyVehicle(GetPlayerPed(-1), 0) and (GetPedInVehicleSeat(GetVehiclePedIsIn(GetPlayerPed(-1), 0), -1) == GetPlayerPed(-1)) and GetVehicleClass(vehicle) == 0 or GetVehicleClass(vehicle) == 1 or GetVehicleClass(vehicle) == 2 or GetVehicleClass(vehicle) == 3 or GetVehicleClass(vehicle) == 4 or GetVehicleClass(vehicle) == 5 or GetVehicleClass(vehicle) == 6 or GetVehicleClass(vehicle) == 7 or GetVehicleClass(vehicle) == 8 or GetVehicleClass(vehicle) == 9 or GetVehicleClass(vehicle) == 10 or GetVehicleClass(vehicle) == 11 or GetVehicleClass(vehicle) == 12 then
	--
	TriggerServerEvent("MDT_SQL_CHECK_PLATE", vehicleplate, veh_displaytext)
	--
	elseif GetVehicleClass(vehicle) == 18 or GetVehicleClass(vehicle) == 19 or GetVehicleClass(vehicle) == 17 then
		drawNotification("" .. mdt.Server_Color .. "VEH REG~w~: This vehicle is already registered to the goverment")
	elseif GetVehicleClass(vehicle) == 16 or GetVehicleClass(vehicle) == 13 or GetVehicleClass(vehicle) == 14 or GetVehicleClass(vehicle) == 15 then
		drawNotification("~r~You need to be in a valid vehicle to use this command")
	else
		drawNotification("~r~You need to be in a valid vehicle to use this command")
	end
end

-- Vehicle De-Reg
function VehicleDeRegistartionNotification(PLATE)
local vehicleplate = PLATE
local random_val = math.random(300000, 900000)
--
drawNotification("" .. mdt.Server_Color .. "VEH DEREG~w~: This process can take up to " .. mdt.Server_Color .. "5~w~ to " .. mdt.Server_Color .. "15~w~ minutes, Please wait")
--
Citizen.Wait(random_val)
TriggerServerEvent("MDT_SQL_CHECK_R_PLATE", vehicleplate)
end

---------------------------------
--- */* SCRIPT BASE LOOPS */* ---
---------------------------------

Citizen.CreateThread(function()
    while true do 
        Citizen.Wait(0)
        CourtMenuRenewLicense()
    end
end)

-------------------------------------
--- */* SCRIPT BASE FUNCTIONS */* ---
-------------------------------------

function drawTxt(x,y ,width,height,scale, text, r,g,b,a)
	SetTextFont(4)
	SetTextProportional(0)
	SetTextScale(scale, scale)
	SetTextColour(r, g, b, a)
	SetTextDropShadow(0, 0, 0, 0,255)
	SetTextEdge(2, 0, 0, 0, 255)
	SetTextDropShadow()
	SetTextOutline()
	SetTextEntry("STRING")
	AddTextComponentString(text)
	DrawText(x - width/2, y - height/2 + 0.005)
end

function drawNotification(text)
	SetNotificationTextEntry("STRING")
	AddTextComponentString(text)
	DrawNotification(true, true)
end

function float(number)
    number = number + 0.00001
    return number
end

function DrawTextOnScreen(x,y,z, text)
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    
    SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x,_y)
    local factor = (string.len(text)) / 370
    DrawRect(_x,_y+0.0125, 0.015+ factor, 0.03, 41, 11, 41, 68)
end

-- Template for 25 meters message
line18 = "~m~Author: Alpha#5199"
RegisterNetEvent('sendProximityMessage25Command')
AddEventHandler('sendProximityMessage25Command', function(msg)
  local myId = PlayerId()
  local pid = GetPlayerFromServerId(id)
  if pid == myId then
    TriggerEvent("chatMessage", "", {120, 95, 190}, msg)
  elseif GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(myId)), GetEntityCoords(GetPlayerPed(pid)), true) < 25.000 then
    TriggerEvent("chatMessage", "", {120, 95, 190}, msg)
  end
end)
