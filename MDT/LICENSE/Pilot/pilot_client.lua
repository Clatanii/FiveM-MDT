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

---------------------------------
--- */* LOCAL FILE CONFIG */* ---
---------------------------------

-- +/+ DMV Main +/+ --
local pschool_location = {-1153.68, -2715.58, 19.89}
local DMV_SA_LastPage = false
showmyinfo = false
local dmvped = {
  {type=4, hash=0xc99f21c4, x=-2715.58, y=-1153.68, z=19.89, a=3374176},
}
local dmvpedpos = {
	{ ['x'] = 1153.68, ['y'] = -2715.58, ['z'] = 19.89 },
}

-- +/+ Main Arrays +/+ --
local maxErrors = 8 -- Change the amount of Errors allowed for the player to pass the driver test, any number above this will result in a failed test
local onTestEvent = 2
local theorylock = 0
local onTtest = 0
local testblock = 0
local DamageControl = 0
local SpeedControl = 0
local CruiseControl = 0
local Error = 0

-- +/+ Speed Vars +/+ --
local kmh = 3.6
local VehSpeed = 0
local speed_limit_resi = 85.0
local speed_limit_town = 85.0
local speed_limit_freeway = 103
local speed = kmh

-----------------------------
--- */* SCRIPT EVENTS */* ---
-----------------------------

-- Event to start function Course1()
RegisterNetEvent('SRR_CHAR_DMV:StartCourse1_P')
AddEventHandler('SRR_CHAR_DMV:StartCourse1_P', function()
	Course1()
end)

---------------------------------
--- */* SCRIPT START-MAIN */* ---
---------------------------------

-- Main Script Part
Citizen.CreateThread(function()
	--while true do
	while mdt.Server_Licenses == true do
		Citizen.Wait(0)
		DrawMarker(0, -1153.68, -2715.58, 19.89, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.5, 0.5, 0.5, 138, 109, 227, 100, false, false, 0, false, false, false, false)
		local pos = GetEntityCoords(GetPlayerPed(-1), false)
		for k,v in ipairs(dmvpedpos) do
			if(Vdist(-1153.68, -2715.58, 19.89, pos.x, pos.y, pos.z) < 1.0)then
			DisplayHelpText("~p~PLC: ~w~Press *E* to start the Pilot course")
				if(IsControlJustReleased(1, 38)) then																			
					ShowBoxMain("~p~PLC-SA ~w~| INTRODUCTION", "~w~Welcome to the Pilot Learning Course, We are here", "~w~to help you get your pilot's license today, But before that", "you will need to have a basic understanding of how the", "airplane works and how to be a good pilot in general.", "", "~p~Pilot's License Requirements:", "  ~w~* Filled 18 years old or more", "  ~w~* Pass Medical Exam", "  ~w~* Good Eye-Vision", "  ~w~* Have a San-Andreas ID card", "", "~w~If you want to continue and start the actual course please", "~w~press ~g~(Y)~w~. Otherwise you can close this page and you will", "not be charged for anything. Have a great day!")
					end
				if(IsControlJustPressed(0, 246)) then
					showmyinfo = false
					TriggerServerEvent("CHAR_DMV:CHECK_VALID_1_P")
				end
			end
		end
	--end
	end
end)


--------------------------------
--- */* SCRIPT FUNCTIONS */* ---
--------------------------------

-- Start driving test
function startptest_p()
	onTestBlipp_p = AddBlipForCoord(-1217.71, -3325.79, 13.94)
	N_0x80ead8e2e1d5d52e(onTestBlipp_p)
	SetBlipRoute(onTestBlipp_p, 1)
	onTestEvent = 1
	DamageControl = 1
	SpeedControl = 1
	onTtest = 3
	SpawnTestCar_p()
end

-- End test
function EndTestTasks()
		onTestBlipp_p = nil
		onTestEvent = 17
		theorylock = 0
		onTtest = 0
		testblock = 0
		DamageControl = 0
		SpeedControl = 0
		CruiseControl = 0
		Error = 0
		TaskLeaveVehicle(GetPlayerPed(-1), veh, 0)
		DeleteEntity(veh)
		DeletePed(dmvped)
		--
		CarTargetForLock = GetPlayersLastVehicle(GetPlayerPed(-1))
		lockStatus = GetVehicleDoorLockStatus(CarTargetForLock)
		SetVehicleDoorsLocked(CarTargetForLock, 2)
		SetVehicleDoorsLockedForPlayer(CarTargetForLock, PlayerId(), false)
		SetEntityAsMissionEntity(CarTargetForLock, true, true)
		Citizen.InvokeNative( 0xEA386986E786A54F, Citizen.PointerValueIntInitialized( CarTargetForLock ) )
		FreezeEntityPosition(GetPlayerPed(-1), false)		
		--
		SetEntityCoords(GetPlayerPed(-1),-1152.56, -2713.52, 19.89, true, false, false,true)
		--
		SetEntityInvincible(GetPlayerPed(-1), false)
end

-- Start introduction of DMV school
function Course1()
	local myPed = GetPlayerPed(-1)
	DTutOpen = true
	SetEntityCoords(myPed,-709.29, -3360.73, 152.28,true, false, false,true)
	ShowBoxMainPage("20","~p~PLC-SA ~w~| INTRODUCTION", "~w~Theory and practice are both important elements of flying", "~w~instruction. This introduction will cover the basics and", "ensure you are prepared with enough information and", "knowledge for your test. ", "", "The information from your theory lessons combined", "with the experience from your practical lesson are vital for", "negotiating the situations and dilemmas you will face in the", "air. Sit back and enjoy as we start. It is highly", "recommended that you pay attention to every detail,", "most of these questions can be existent under your", "theory test.")
	Citizen.Wait(20000)
	DTutOpen = false
	DTutOpen = true
	SetEntityCoords(myPed,-1204.88, -2687.88, 115.48,true, false, false,true)
	ShowBoxMainPage("30","~p~PLC-SA ~w~| INTRODUCTION", "There are four fundamental basic flight maneuvers upon", "which all flying tasks are based:", "", "~p~*~w~    straight-and-level", "~p~*~w~    flight", "~p~*~w~    turns", "~p~*~w~    climbs", "~p~*~w~    and descents.", "", "All controlled flight consists of one or a combination of ", "these basic maneuvers. If a student pilot is able to perform", "these maneuvers well, and the student’s proficiency", "is based on accurate feel and control analysis rather", "than mechanical movements, the ability to perform", "any assigned maneuver will only be a matter of obtaining", "a clear visual and mental conception of it.")
	Citizen.Wait(30000)
	DTutOpen = false
	DTutOpen = true
	SetEntityCoords(myPed,-920.81, -2500.87, 158.68 ,true, false, false,true)
	ShowBoxMainPage("45","~p~PLC-SA ~w~| INTRODUCTION", "In explaining the functions of the controls, the instructor", "should emphasize that the controls never change in the", "results produced in relation to the pilot. The pilot should ", "always be considered the center of movement of the airplane", "or the reference point from which the movements, of the ", "airplane are judged and described. The following will", "always be true, regardless of the airplane’s attitude in", "relation to the Earth.", "", "~p~*~w~ When back pressure is applied to the elevator control, the", "   airplane’s nose rises in relation to the pilot.", "~p~*~w~ When forward pressure is applied to the elevator ", "   control, the  airplane’s nose lowers in relation to the pilot.", "~p~*~w~ When right pressure is applied to the aileron control, the", "   airplane’s right wing lowers in relation to the pilot.", "~p~*~w~ When left pressure is applied to the aileron control, the", "   airplane’s left wing lowers in relation to the pilot.", "~p~*~w~ When pressure is applied to the right rudder pedal, the", "   airplane’s nose moves (yaws) to the right in relation to the", "   pilot.", "~p~*~w~ When pressure is applied to the left rudder pedal, the ", "   airplane’s nose moves (yaws) to the left in relation to the", "   pilot.")
	Citizen.Wait(45000)
	DTutOpen = false
	DTutOpen = true
	SetEntityCoords(myPed,-1316.81, -2591.68, 29.78,true, false, false,true)
	ShowBoxMainPage("40","~p~PLC-SA ~w~| INTRODUCTION", "To understand the relationship between airspeed, bank", "and radius of turn, it should be noted that the rate of turn", "at any given true airspeed depends on the horizontal lift", "component. The horizontal lift component varies in proportion", "to the amount of bank. Therefore the rate of turn at a given", "airspeedincreases as the angle of bank is increased. On the", "other hand, when a turn is made at a higher airspeed at a", "given bankangle, the inertia is greater and the horizontal", "lift componentrequired for the turn is greater, causing the", "turning rate tobecome slower.", "", "Therefore, at a given angle of bank, a higher airspeed makes", "the radius of turn larger because the airplane turns at a",  "slower rate.")
	Citizen.Wait(40000)
	DTutOpen = false
	DTutOpen = true
	SetEntityCoords(myPed,-1367.53, -2620.12, 14.95,true, false, false,true)
	ShowBoxMainPage("45","~p~PLC-SA ~w~| INTRODUCTION", "Taxiing, also sometimes written taxying, is the movement" ,"of an aircraft on the ground, under its own power, in contrast " ,"to towing or push-back where the aircraft is moved by a tug." ,"The aircraft usually moves on wheels, but the term also" ,"includes aircraft with skis or floats (for water-based travel).", "", "An airplane uses taxiways to taxi from one place on an airport", "to another; for example, when moving from a hangar to the", "runway. The term taxiing is not used for the accelerating", "run along a runway prior to takeoff, or the decelerating run", "immediately after landing.", "", "When taxiing, aircraft travel slowly. This ensures that they", "can be stopped quickly and do not risk wheel damage on", "larger aircraft if they accidentally turn off the paved surface.", "Taxi speeds are typically 16 to 19 kn (30 to 35 km/h). Rotor", "downwash limits helicopter hover-taxiing near parked", "light aircraft. The use of engine thrust near terminals is", "restricted due to the possibility of jet blast damage.")
	Citizen.Wait(45000)
	DTutOpen = false
	DTutOpen = true
	SetEntityCoords(myPed,-1797.96, -2685.06, 36.35,true, false, false,true)
	ShowBoxMainPage("45","~p~PLC-SA ~w~| INTRODUCTION", "Takeoff is the phase of flight in which an aerospace vehicle", "goes from the ground to flying in the air.", "", "For light aircraft, usually full power is used during takeoff.", "Large transport category (airliner) aircraft may use a reduced", "power for takeoff, where less than full power is applied in", "order to prolong engine life, reduce maintenance costs and", "reduce noise emissions. In some emergency cases, the power", "used can then be increased to increase the aircraft's", "performance. Before takeoff, the engines, particularly piston", "engines, are routinely run up at high power to check for", "engine-related problems.", "", "The nose is raised to a nominal 5°–15° nose up pitch attitude", "to increase lift from the wings and effect liftoff. For most", "aircraft, attempting a takeoff without a pitch-up would", "require cruise speeds while still on the runway.")
	Citizen.Wait(45000)
	DTutOpen = false
	DTutOpen = true
	SetEntityCoords(myPed,-1160.89, -2184.63, 16.20,true, false, false,true)
	ShowBoxMainPage("45","~p~PLC-SA ~w~| INTRODUCTION", "Landing is the last part of a flight, where a flying animal", "aircraft, or spacecraft returns to the ground. When the flying", "object returns to water, the process is called alighting", "although it is commonly called landing, touchdown or", "splashdown as well. A normal aircraft flight would include", "several parts of flight including taxi, takeoff, climb, cruise", "descent and landing.", "", "In a light aircraft, with little crosswind, the ideal landing is", "when contact with the ground occurs as the forward speed is", "reduced to the point where there is no longer sufficient", "airspeed to remain aloft. The stall warning is often heard", "just before landing, indicating that this speed and altitude", "have been reached. The result is very light touch down.", "", "In large transport category (airliner) aircraft, pilots land", "the aircraft by flying the airplane on to the runway. The", "airspeed and attitude of the plane are adjusted for landing.", "The airspeed is kept well above stall speed and at a constant", "rate of descent.")
	Citizen.Wait(45000)
	DTutOpen = false
	DTutOpen = true
	SetEntityCoords(myPed,-1163.78, -2760.49, 35.70,true, false, false,true)
	DMV_SA_LastPage = true
	ShowBoxMainPage("15","~p~PLC-SA ~w~| INTRODUCTION", "You have now completed the first task, You are now ready", "for the next step. Right now we are preparing your aircraft", "for your pilot test. We wish you the best luck on the test!", "", "~p~USEFUL TIPS:", " ~p~* ~w~Stay calm and focus"," ~p~* ~w~Avoid hitting any object or flying to low", " ~p~* ~w~Pay attention to the guide")
	Citizen.Wait(15000)
	DTutOpen = false
	showmyinfo = false
	--
	OnTestEvent = 1
    theorylock = 4
	startptest_p()
end

-- Spawn car and begin driving part
function SpawnTestCar_p()
	local hashVeh = GetHashKey("mammatus")
	local dhash = GetHashKey('s_m_m_pilot_01')
	local myPed = GetPlayerPed(-1)
	local ply = GetPlayerPed(-1)
	local plyCoords = GetEntityCoords(ply, 0)
			
	RequestModel(dhash)
	RequestModel(hashVeh)
	while not HasModelLoaded(hashVeh) do
		Citizen.Wait(0)
	end
	while not HasModelLoaded(dhash) do
		Citizen.Wait(0)
	end
							
	local veh = CreateVehicle(hashVeh, -1267.18, -3373.27, 14.06, 331.51, true, false)

	local plate = math.random(100, 900)
	SetVehicleOnGroundProperly(veh)
	SetVehicleNumberPlateText(veh, "PLC "..plate.." ")
	
	local id = NetworkGetNetworkIdFromEntity(veh)
	SetNetworkIdCanMigrate(id, true)
	SetModelAsNoLongerNeeded(hashVeh)
	
	-- Settings
	CruiseControl = 0
	SetPedIntoVehicle(myPed, veh, - 1)
	
	-- Ped
	dmvped = CreatePedInsideVehicle(veh, 4, dhash, 0, true, true)
	SetPedCanBeDraggedOut(dmvped, true)
	SetPedStayInVehicleWhenJacked(dmvped, true)
	SetEntityInvincible(dmvped, true)
	SetBlockingOfNonTemporaryEvents(dmvped, true)
	--
	DTutOpen = false
	SetEntityVisible(myPed, true)
	FreezeEntityPosition(GetVehiclePedIsUsing(GetPlayerPed(-1)), true)
	--
	ShowBoxMainPage("10","     ~p~PLC-SA ~w~| DRIVING", "Hello there, Im going to be your guide today! Im gonna sit", "in the passanger seat and i will give you instructions", "on what to do. I wish you the best luck!", "", "Before we start, Im gonna give you 10 seconds to make", "you comfortable. Look around, take a deep breath etc.", "", "~p~---------------------------------------------------------------------------", "", "~c~Your mission is simple, take me and the plane to grapeseed", "~c~landing field and park up the plane!")
	Citizen.Wait(10000)
	showmyinfo = false
	FreezeEntityPosition(GetVehiclePedIsUsing(GetPlayerPed(-1)), false)	
	
	------------------------------------------------
end

-- Give end results and stop everything
function EndDTest()
	FreezeEntityPosition(GetVehiclePedIsUsing(GetPlayerPed(-1)), true)
	ShowBoxMainPage("20","     ~p~PLC-SA ~w~| RESULTS", "Your piloting course is now finished, You are soon to know", "your final results. Remember, You can always come back", "another day and retry the test if you failed it.", "", "~p~RESULTS:", "  ~p~* ~w~Status: ~g~Passed", "", "Congratz! Now you have a legal San Andreas pilot license!")
	TriggerServerEvent('CHAR_DMV:D_License_P_T')
	Citizen.Wait(20000)
	showmyinfo = false
	EndTestTasks()
	FreezeEntityPosition(GetVehiclePedIsUsing(GetPlayerPed(-1)), false)
	FreezeEntityPosition(GetPlayerPed(-1), false)
end

-- Show Main Page template
function ShowBoxMainPage(secs, head, text1, text2, text3, text4, text5, text6, text7, text8, text9, text10, text11, text12, text13, text14, text15, text16, text17, text18, text19, text20, text21, text22, text23)
  Citizen.CreateThread(function()
	Citizen.Wait(0)
	PlaySoundFrontend(-1, "Menu_Accept", "Phone_SoundSet_Default", 1);
	showmyinfo = false
	local myPed = GetPlayerPed(-1)
	showmyinfo1 = true
	local pos = dmvschool_location
	
	ShowInfoblackboxPage(secs, head, text1, text2, text3, text4, text5, text6, text7, text8, text9, text10, text11, text12, text13, text14, text15, text16, text17, text18, text19, text20, text21, text22, text23)

    while showmyinfo1 do
      Citizen.Wait(1)
      if (IsControlJustReleased(1, 178)) and DMV_SA_LastPage == true then
        showmyinfo1 = false
		showmyinfo = false
		DTutOpen = false
		SetEntityCoords(myPed, pos[1],pos[2],pos[3],true, false, false,true)
		drawNotification("~p~PLC: ~w~You stopped your training session")
		PlaySoundFrontend(-1, "BACK", "HUD_AMMO_SHOP_SOUNDSET", 1)
		end
	  end
  end)
end

-- Show Main template
function ShowInfoblackbox(head, text1, text2, text3, text4, text5, text6, text7, text8, text9, text10, text11, text12, text13, text14, text15)
	Citizen.CreateThread(function()
	local playername = GetPlayerName(PlayerId())
	local resx, resy = GetScreenResolution()
	local xoffs = 355
	showmyinfo = true
	showmyinfo1 = false
		while showmyinfo == true do
			Citizen.Wait(1)
			DrawRect((float(1080 + xoffs)/1.5)/resx, (float(524)/1.5)/resy, (float(500)/1.5)/resx, (float(650)/1.5)/resy, 0, 0, 0, 200)
			--
			drawTxt(1.137, 0.675, 1.0,1.0,1.1, head, 255, 255, 255, 200)
			--
			drawTxt(1.127, 0.730, 1.0,1.0,0.48, text1, 255, 255, 255, 200)
			drawTxt(1.127, 0.751, 1.0,1.0,0.48, text2, 255, 255, 255, 200)
			drawTxt(1.127, 0.772, 1.0,1.0,0.48, text3, 255, 255, 255, 200)
			drawTxt(1.127, 0.793, 1.0,1.0,0.48, text4, 255, 255, 255, 200)
			drawTxt(1.127, 0.814, 1.0,1.0,0.48, text5, 255, 255, 255, 200)
			drawTxt(1.127, 0.835, 1.0,1.0,0.48, text6, 255, 255, 255, 200)
			drawTxt(1.127, 0.856, 1.0,1.0,0.48, text7, 255, 255, 255, 200)
			drawTxt(1.127, 0.877, 1.0,1.0,0.48, text8, 255, 255, 255, 200)
			drawTxt(1.127, 0.898, 1.0,1.0,0.48, text9, 255, 255, 255, 200)
			drawTxt(1.127, 0.919, 1.0,1.0,0.48, text10, 255, 255, 255, 200)
			drawTxt(1.127, 0.940, 1.0,1.0,0.48, text11, 255, 255, 255, 200)
			drawTxt(1.127, 0.961, 1.0,1.0,0.48, text12, 255, 255, 255, 200)
			drawTxt(1.127, 0.982, 1.0,1.0,0.48, text13, 255, 255, 255, 200)
			drawTxt(1.127, 1.003, 1.0,1.0,0.48, text14, 255, 255, 255, 200)
			drawTxt(1.127, 1.024, 1.0,1.0,0.48, text15, 255, 255, 255, 200)
			--
			drawTxt(1.195, 1.243, 1.0,1.0,0.45, "~c~P R E S S  ~c~D E L  ~c~T O  C L O S E", 255, 255, 255, 200)
		end
	end)
end

-- Show Main Page blackbox template
function ShowInfoblackboxPage(secs, head, text1, text2, text3, text4, text5, text6, text7, text8, text9, text10, text11, text12, text13, text14, text15, text16, text17, text18, text19, text20, text21, text22, text23)
	Citizen.CreateThread(function()
	local playername = GetPlayerName(PlayerId())
	local resx, resy = GetScreenResolution()
	local xoffs = 355
	showmyinfo1 = false
	showmyinfo = true
		while showmyinfo == true do
			Citizen.Wait(1)
			DrawRect((float(1080 + xoffs)/1.5)/resx, (float(524)/1.5)/resy, (float(500)/1.5)/resx, (float(650)/1.5)/resy, 0, 0, 0, 200)
			--
			drawTxt(1.137, 0.675, 1.0,1.0,1.1, head, 255, 255, 255, 200)
			--
			drawTxt(1.127, 0.730, 1.0,1.0,0.48, text1, 255, 255, 255, 200)
			drawTxt(1.127, 0.751, 1.0,1.0,0.48, text2, 255, 255, 255, 200)
			drawTxt(1.127, 0.772, 1.0,1.0,0.48, text3, 255, 255, 255, 200)
			drawTxt(1.127, 0.793, 1.0,1.0,0.48, text4, 255, 255, 255, 200)
			drawTxt(1.127, 0.814, 1.0,1.0,0.48, text5, 255, 255, 255, 200)
			drawTxt(1.127, 0.835, 1.0,1.0,0.48, text6, 255, 255, 255, 200)
			drawTxt(1.127, 0.856, 1.0,1.0,0.48, text7, 255, 255, 255, 200)
			drawTxt(1.127, 0.877, 1.0,1.0,0.48, text8, 255, 255, 255, 200)
			drawTxt(1.127, 0.898, 1.0,1.0,0.48, text9, 255, 255, 255, 200)
			drawTxt(1.127, 0.919, 1.0,1.0,0.48, text10, 255, 255, 255, 200)
			drawTxt(1.127, 0.940, 1.0,1.0,0.48, text11, 255, 255, 255, 200)
			drawTxt(1.127, 0.961, 1.0,1.0,0.48, text12, 255, 255, 255, 200)
			drawTxt(1.127, 0.982, 1.0,1.0,0.48, text13, 255, 255, 255, 200)
			drawTxt(1.127, 1.003, 1.0,1.0,0.48, text14, 255, 255, 255, 200)
			drawTxt(1.127, 1.024, 1.0,1.0,0.48, text15, 255, 255, 255, 200)
			drawTxt(1.127, 1.045, 1.0,1.0,0.48, text16, 255, 255, 255, 200)
			drawTxt(1.127, 1.066, 1.0,1.0,0.48, text17, 255, 255, 255, 200)
			drawTxt(1.127, 1.087, 1.0,1.0,0.48, text18, 255, 255, 255, 200)
			drawTxt(1.127, 1.108, 1.0,1.0,0.48, text19, 255, 255, 255, 200)
			drawTxt(1.127, 1.129, 1.0,1.0,0.48, text20, 255, 255, 255, 200)
			drawTxt(1.127, 1.150, 1.0,1.0,0.48, text21, 255, 255, 255, 200)
			drawTxt(1.127, 1.171, 1.0,1.0,0.48, text22, 255, 255, 255, 200)
			drawTxt(1.127, 1.192, 1.0,1.0,0.48, text23, 255, 255, 255, 200)
			--
			drawTxt(1.155, 1.243, 1.0,1.0,0.45, "~c~P L E A S E  W A I T  ~p~"..secs.."  S E C S  ~c~T O  C O N T I N U E", 255, 255, 255, 200)
		end
	end)
end

-- [not used at moment] - used to break and reset
function ErrorBreakTest()
		onTestBlipp_p = nil
		onTestEvent = 16
		Citizen.Wait(100)
		onTestEvent = 0
		DamageControl = 0
		SpeedControl = 0
		Error = 0
		TaskLeaveVehicle(GetPlayerPed(-1), veh, 0)
		Wait(1000)
		CarTargetForLock = GetPlayersLastVehicle(GetPlayerPed(-1))
		lockStatus = GetVehicleDoorLockStatus(CarTargetForLock)
		SetVehicleDoorsLocked(CarTargetForLock, 2)
		SetVehicleDoorsLockedForPlayer(CarTargetForLock, PlayerId(), false)
		SetEntityAsMissionEntity(CarTargetForLock, true, true)
		Wait(2000)
		Citizen.InvokeNative( 0xEA386986E786A54F, Citizen.PointerValueIntInitialized( CarTargetForLock ) )
		FreezeEntityPosition(GetPlayerPed(-1), false)	
end

---------------------------------
--- */* SCRIPT BASE LOOPS */* ---
---------------------------------

-- Main Piloting Thread
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
		if onTestEvent >= 1 and onTestEvent <= 15 then
			SetEntityInvincible(GetPlayerPed(-1), true)
		end
        local veh = GetVehiclePedIsUsing(GetPlayerPed(-1))
		local ped = GetPlayerPed(-1)
		local check_veh = IsPedInVehicle(ped, veh, true)
	if onTestEvent == 1 then
		DisableControlAction(1, 75, true)
		if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), -1217.71, -3325.79, 13.94, true) > 4.0001 then
		   DrawMarker(1, -1217.71, -3325.79, 13.94-1, 0, 0, 0, 0, 0, 0, 1.5, 1.5, 1.5, 138, 109, 227, 255, 0, 0, 2, 0, 0, 0, 0)
		else
		    if onTestBlipp_p ~= nil and DoesBlipExist(onTestBlipp_p) then
				Citizen.InvokeNative(0x86A652570E5F25DD,Citizen.PointerValueIntInitialized(onTestBlipp_p))
		    end
			onTestBlipp_p = AddBlipForCoord(-1123.50, -3312.53, 13.95)
			N_0x80ead8e2e1d5d52e(onTestBlipp_p)
		    DrawMissionText2("~w~Taxi to the side of runway ~o~33L ~w~and hold", 7000)
			PlaySoundFrontend(-1,  "End_Squelch", "CB_RADIO_SFX", 1)
			onTestEvent = 2
		end
	end
	
	if onTestEvent == 2 then
		DisableControlAction(1, 75, true)
		if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), -1123.50, -3312.53, 13.95, true) > 4.0001 then
		   DrawMarker(1,-1123.50, -3312.53, 13.95-1,0, 0, 0, 0, 0, 0, 1.5, 1.5, 1.5, 138, 109, 227, 255, 0, 0, 2, 0, 0, 0, 0)
		else
		    if onTestBlipp_p ~= nil and DoesBlipExist(onTestBlipp_p) then
				Citizen.InvokeNative(0x86A652570E5F25DD,Citizen.PointerValueIntInitialized(onTestBlipp_p))
		    end
			onTestBlipp_p = AddBlipForCoord(-1790.29, -2888.34, 50.80)
			N_0x80ead8e2e1d5d52e(onTestBlipp_p)
			SetBlipRoute(onTestBlipp_p, 1)
		    DrawMissionText2("You have clearance to tax out to ~o~33L ~w~and to takeoff, Full ~b~throttle ~w~when you ready!", 8000)
			PlaySoundFrontend(-1,  "End_Squelch", "CB_RADIO_SFX", 1)
			onTestEvent = 3		
		end
	end
	
	if onTestEvent == 3 then
		DisableControlAction(1, 75, true)
		if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), -1790.29, -2888.34, 50.80, true) > 15.0 then
		   DrawMarker(6, -1790.29, -2888.34, 50.80, 0, 0, 0, 0, 0, 0, 25.0, 25.0, 25.0, 138, 109, 227, 255, 0, true, 0, true, 0, 0, 0)
		else
		    if onTestBlipp_p ~= nil and DoesBlipExist(onTestBlipp_p) then
				Citizen.InvokeNative(0x86A652570E5F25DD,Citizen.PointerValueIntInitialized(onTestBlipp_p))
		    end
			onTestBlipp_p = AddBlipForCoord(-3381.22, -1138.66, 341.25)
			N_0x80ead8e2e1d5d52e(onTestBlipp_p)
			SetBlipRoute(onTestBlipp_p, 1)
		    DrawMissionText2("Start making a ~o~climb~w~, Find a balance, Not to ~r~high ~w~or to ~b~low~w~.", 8000)
			PlaySoundFrontend(-1,  "End_Squelch", "CB_RADIO_SFX", 1)
			onTestEvent = 4
		end
	end	
	
		if onTestEvent == 4 then
		DisableControlAction(1, 75, true)
		if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), -3381.22, -1138.66, 341.25, true) > 15.0 then
		   DrawMarker(6, -3381.22, -1138.66, 341.25, 0, 0, 0, 0, 0, 0, 25.0, 25.0, 25.0, 138, 109, 227, 255, 0, true, 0, true, 0, 0, 0)
		else
		    if onTestBlipp_p ~= nil and DoesBlipExist(onTestBlipp_p) then
				Citizen.InvokeNative(0x86A652570E5F25DD,Citizen.PointerValueIntInitialized(onTestBlipp_p))
		    end
			onTestBlipp_p = AddBlipForCoord(-4403.07, 1053.64, 646.69)
			N_0x80ead8e2e1d5d52e(onTestBlipp_p)
			SetBlipRoute(onTestBlipp_p, 1)
			DrawMissionText2("Head to the next ~b~point!", 5000)
			PlaySoundFrontend(-1,  "End_Squelch", "CB_RADIO_SFX", 1)
			onTestEvent = 5
		end
	end	
	
		if onTestEvent == 5 then
		DisableControlAction(1, 75, true)
		if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)),-4403.07, 1053.64, 646.69, true) > 15.0 then
		    DrawMarker(6, -4403.07, 1053.64, 646.69, 0, 0, 0, 0, 0, 0, 25.0, 25.0, 25.0, 138, 109, 227, 255, 0, true, 0, true, 0, 0, 0)
		else
		    if onTestBlipp_p ~= nil and DoesBlipExist(onTestBlipp_p) then
				Citizen.InvokeNative(0x86A652570E5F25DD,Citizen.PointerValueIntInitialized(onTestBlipp_p))
		    end
			onTestBlipp_p = AddBlipForCoord(-3946.04, 4322.43, 637.27)
			N_0x80ead8e2e1d5d52e(onTestBlipp_p)
			SetBlipRoute(onTestBlipp_p, 1)
		    DrawMissionText2("Continue to the next point, Make a small left turn to aviod ~g~military ~w~airspace~r~!~w~", 5000)
			PlaySoundFrontend(-1,  "End_Squelch", "CB_RADIO_SFX", 1)
			onTestEvent = 6
		end
	end	

		if onTestEvent == 6 then
		DisableControlAction(1, 75, true)
		if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), -3946.04, 4322.43, 637.27, true) > 15.0 then
		   DrawMarker(6, -3946.04, 4322.43, 637.27, 0, 0, 0, 0, 0, 0, 25.0, 25.0, 25.0, 138, 109, 227, 255, 0, true, 0, true, 0, 0, 0)
		else
		    if onTestBlipp_p ~= nil and DoesBlipExist(onTestBlipp_p) then
				Citizen.InvokeNative(0x86A652570E5F25DD,Citizen.PointerValueIntInitialized(onTestBlipp_p))
		    end
			onTestBlipp_p = AddBlipForCoord(-1410.60, 4345.54, 349.17)
			N_0x80ead8e2e1d5d52e(onTestBlipp_p)
			DrawMissionText2("Start making a right turn to the next point!", 5000)
			PlaySoundFrontend(-1,  "End_Squelch", "CB_RADIO_SFX", 1)
			SetBlipRoute(onTestBlipp_p, 1)
			onTestEvent = 7
		end
	end		
		
	
		if onTestEvent == 7 then
		DisableControlAction(1, 75, true)
		if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), -1410.60, 4345.54, 349.17, true) > 15.0 then
		   DrawMarker(6, -1410.60, 4345.54, 349.17, 0, 0, 0, 0, 0, 0, 25.0, 25.0, 25.0, 138, 109, 227, 255, 0, true, 0, true, 0, 0, 0)
		  
		else
		    if onTestBlipp_p ~= nil and DoesBlipExist(onTestBlipp_p) then
				Citizen.InvokeNative(0x86A652570E5F25DD,Citizen.PointerValueIntInitialized(onTestBlipp_p))
		    end
			onTestBlipp_p = AddBlipForCoord(317.43, 4228.77, 216.72)
			N_0x80ead8e2e1d5d52e(onTestBlipp_p)
			SetBlipRoute(onTestBlipp_p, 1)
		    DrawMissionText2("What an ~g~amazing ~w~view right! Take a moment to look around!", 5000)
			PlaySoundFrontend(-1,  "End_Squelch", "CB_RADIO_SFX", 1)
			onTestEvent = 8
		end
	end			
	
		if onTestEvent == 8 then
		DisableControlAction(1, 75, true)
		if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), 317.43, 4228.77, 216.72, true) > 15.0 then
		   DrawMarker(6, 317.43, 4228.77, 216.72, 0, 0, 0, 0, 0, 0, 25.0, 25.0, 25.0, 138, 109, 227, 255, 0, true, 0, true, 0, 0, 0)
		else
		    if onTestBlipp_p ~= nil and DoesBlipExist(onTestBlipp_p) then
				Citizen.InvokeNative(0x86A652570E5F25DD,Citizen.PointerValueIntInitialized(onTestBlipp_p))
		    end
			onTestBlipp_p = AddBlipForCoord(655.69, 4124.70, 206.0)
			N_0x80ead8e2e1d5d52e(onTestBlipp_p)
			SetBlipRoute(onTestBlipp_p, 1)
			DrawMissionText2("~b~Landing ~w~time is comming closer, Make a small right ~g~turn ~w~to line up", 5000)
			PlaySoundFrontend(-1,  "End_Squelch", "CB_RADIO_SFX", 1)
			onTestEvent = 9
		end
	end			
	
		if onTestEvent == 9 then
		DisableControlAction(1, 75, true)
		if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), 655.69, 4124.70, 206.02, true) > 15.0 then
		   DrawMarker(6, 655.69, 4124.70, 206.0, 0, 0, 0, 0, 0, 0, 25.0, 25.0, 25.0, 138, 109, 227, 255, 0, true, 0, true, 0, 0, 0)
		   
		else
		    if onTestBlipp_p ~= nil and DoesBlipExist(onTestBlipp_p) then
				Citizen.InvokeNative(0x86A652570E5F25DD,Citizen.PointerValueIntInitialized(onTestBlipp_p))
		    end
			onTestBlipp_p = AddBlipForCoord(1464.76, 4492.87, 112.92)
			N_0x80ead8e2e1d5d52e(onTestBlipp_p)
			SetBlipRoute(onTestBlipp_p, 1)
			DrawMissionText2("Start to slow ~y~down ~w~and line the plane up to the field", 7000)
			PlaySoundFrontend(-1,  "End_Squelch", "CB_RADIO_SFX", 1)
			onTestEvent = 10
		end
	end		

		if onTestEvent == 10 then
		DisableControlAction(1, 75, true)
		if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), 1464.76, 4492.87, 112.92, true) > 15.0 then
		   DrawMarker(6, 1464.76, 4492.87, 112.92, 0, 0, 0, 0, 0, 0, 25.0, 25.0, 25.0, 138, 109, 227, 255, 0, true, 0, true, 0, 0, 0)
		else
		    if onTestBlipp_p ~= nil and DoesBlipExist(onTestBlipp_p) then
				Citizen.InvokeNative(0x86A652570E5F25DD,Citizen.PointerValueIntInitialized(onTestBlipp_p))
		    end
			onTestBlipp_p = AddBlipForCoord(2005.84, 4748.72, 41.49)
			N_0x80ead8e2e1d5d52e(onTestBlipp_p)
			SetBlipRoute(onTestBlipp_p, 1)
			onTestEvent = 11
			Citizen.Wait(4000)
		end
	end		

		if onTestEvent == 11 then
		DisableControlAction(1, 75, true)
		if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), 2005.84, 4748.72, 41.49, true) > 15.0 then
		   DrawMarker(6, 2005.84, 4748.72, 41.49, 0, 0, 0, 0, 0, 0, 25.0, 25.0, 25.0, 138, 109, 227, 255, 0, true, 0, true, 0, 0, 0)
		else
		    if onTestBlipp_p ~= nil and DoesBlipExist(onTestBlipp_p) then
				Citizen.InvokeNative(0x86A652570E5F25DD,Citizen.PointerValueIntInitialized(onTestBlipp_p))
		    end
			onTestBlipp_p = AddBlipForCoord(2133.37, 4783.44, 41.13)
			N_0x80ead8e2e1d5d52e(onTestBlipp_p)
			SetBlipRoute(onTestBlipp_p, 1)
			DrawMissionText2("~b~Touchdown! ~w~Great job! Take the plane to the hangar!", 8000)
			PlaySoundFrontend(-1,  "End_Squelch", "CB_RADIO_SFX", 1)
			onTestEvent = 12
		end
	end
	
		if onTestEvent == 12 then
		DisableControlAction(1, 75, true)
		if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)),2133.37, 4783.44, 41.13-1, true) > 4.0001 then
		   DrawMarker(1, 2133.37, 4783.44, 41.13-1, 0, 0, 0, 0, 0, 0, 1.5, 1.5, 1.5, 138, 109, 227, 255, 0, 0, 2, 0, 0, 0, 0)
		else
		    if onTestBlipp_p ~= nil and DoesBlipExist(onTestBlipp_p) then
				Citizen.InvokeNative(0x86A652570E5F25DD,Citizen.PointerValueIntInitialized(onTestBlipp_p))
		    end
			EndDTest()
		end
	end	
	
	if GetVehicleEngineHealth(GetVehiclePedIsIn(GetPlayerPed(-1),false)) <= 0 and onTestEvent >= 3 and onTestEvent <= 12 then
		if onTestBlipp_p ~= nil and DoesBlipExist(onTestBlipp_p) then
			Citizen.InvokeNative(0x86A652570E5F25DD,Citizen.PointerValueIntInitialized(onTestBlipp_p))
		end
		drawNotification("~p~PLC-SA: ~w~Your plane was ~r~destroyed~w~, Course canceled.")
		EndTestTasks()
		FreezeEntityPosition(GetVehiclePedIsUsing(GetPlayerPed(-1)), false)
		FreezeEntityPosition(GetPlayerPed(-1), false)
	end
end
end)

-- Disable movements and make invisnble while using character cam as instruction window
Citizen.CreateThread(function()
  while true do
    if DTutOpen then
      local ply = GetPlayerPed(-1)
      local active = true
	  SetEntityVisible(ply, false)
	  FreezeEntityPosition(ply, true)
      DisableControlAction(0, 1, active) -- LookLeftRight
      DisableControlAction(0, 2, active) -- LookUpDown
      DisablePlayerFiring(ply, true) -- Disable weapon firing
      DisableControlAction(0, 142, active) -- MeleeAttackAlternate
      DisableControlAction(0, 106, active) -- VehicleMouseControlOverride
    end
    Citizen.Wait(0)
  end
end)

-- Main Bow Template
function ShowBoxMain(head, text1, text2, text3, text4, text5, text6, text7, text8, text9, text10, text11, text12, text13, text14, text15)
  Citizen.CreateThread(function()
	Citizen.Wait(0)
	PlaySoundFrontend(-1, "Menu_Accept", "Phone_SoundSet_Default", 1);
	showmyinfo1 = false
	showmyinfo = true
	ShowInfoblackbox(head, text1, text2, text3, text4, text5, text6, text7, text8, text9, text10, text11, text12, text13, text14, text15)

    while showmyinfo do
      Citizen.Wait(1)
      if (IsControlJustPressed(1, 178)) then
        showmyinfo = false
		PlaySoundFrontend(-1, "BACK", "HUD_AMMO_SHOP_SOUNDSET", 1);
      end
    end
  end)
end

-------------------------------------
--- */* SCRIPT BASE FUNCTIONS */* ---
-------------------------------------

-- Draw mission text function
function DrawMissionText2(m_text, showtime)
    ClearPrints()
	SetTextEntry_2("STRING")
	AddTextComponentString(m_text)
	DrawSubtitleTimed(showtime, 1)
end

-- Get current vehicle ped is in function
function GetCar() 
	return GetVehiclePedIsIn(GetPlayerPed(-1),false) 
end

-- Draw text function
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

-- Display Help text function
function DisplayHelpText(str)
	SetTextComponentFormat("STRING")
	AddTextComponentString(str)
	DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end

-- Get float [for window template(s)] function
function float(number)
    number = number + 0.00001
    return number
end

-- Draw notification function
function drawNotification(text)
	SetNotificationTextEntry("STRING")
	AddTextComponentString(text)
	DrawNotification(true, true)
end