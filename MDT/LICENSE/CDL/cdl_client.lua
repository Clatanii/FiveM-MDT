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
----------------------
--- BASE VARIABLES ---
----------------------

-- +/+ DMV Main +/+ --
local dmvschool_location = {-320.51, -1390.1, 36.5}
local DMV_SA_LastPage = false
local dmvped = {
  {type = 4, hash = 0xc99f21c4, x = -320.51, y = -1390.1, z = 36.5, a = 3374176},
}
local dmvpedpos = {
	{ ['x'] = -320.51, ['y'] = -1390.1, ['z'] = 36.5 },
}

-- +/+ Main Arrays +/+ --
c_maxc_Errors = 20 -- Change the amount of c_Errors allowed for the player to pass the driver test, any number above this will result in a failed test
c_c_onTestEvent = 0
c_theorylock = 0
c_onTtest = 0
c_testblock = 0
c_DamageControl = 0
c_SpeedControl = 0
c_CruiseControl = 0
c_Error = 0

-- +/+ Speed Vars +/+ --
local kmh = 3.6
local VehSpeed = 0
local speed_limit_resi = 85.0
local speed_limit_town = 85.0
local speed_limit_freeway = 103
local speed_limit_outside = 75
local speed = kmh

-----------------------------
--- */* SCRIPT EVENTS */* ---
-----------------------------

-- Event to start function Course1()
RegisterNetEvent('SRR_CHAR_DMV:StartCourse1_CDL')
AddEventHandler('SRR_CHAR_DMV:StartCourse1_CDL', function()
	Course1_cdl()
end)

---------------------------------
--- */* SCRIPT START-MAIN */* ---
---------------------------------

Citizen.CreateThread(function()
	while mdt.Server_Licenses == true do
		Citizen.Wait(0)
		DrawMarker(0, -320.51, -1390.1, 36.5, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.5, 0.5, 0.5, 128, 198, 255, 100, false, false, 0, false, false, false, false)
		local pos = GetEntityCoords(GetPlayerPed(-1), false)
		for k,v in ipairs(dmvpedpos) do
			if(Vdist(-320.51, -1390.1, 36.5, pos.x, pos.y, pos.z) < 1.0)then
			DisplayHelpText("~b~DMV: ~w~Press *E* to start the CDL course")
				if(IsControlJustReleased(1, 38)) then																			
					ShowBoxMain("~b~CDL-SA ~w~| INTRODUCTION", "Welcome to the Commercial driver's license school. We are", "here to help you get your CDL (Commercial driver's license)", "today! Here you will start with a guide that will cover the", "basics and get you ready to have a CD-license.", "", "~b~Commercial Driver's License Requirements:", "  ~b~* ~w~Have a valid San Andreas driver's license", "  ~b~* ~w~Pay CD-license Fees", "  ~b~* ~w~Have a San Andreas ID card", "", "~w~If you want to continue and start the actual course please", "~w~press ~g~(Y)~w~. Otherwise you can close this page and you will", "not be charged for anything. Have a great day!")
					end
				if(IsControlJustPressed(0, 246)) then
					showmyinfo = false
					TriggerServerEvent("CHAR_CDL:CHECK_VALID_1")
				end
			end
		end
	end
end)


--------------------------------
--- */* SCRIPT FUNCTIONS */* ---
--------------------------------

function c_startptest()
	c_onTestBlipp = AddBlipForCoord(-2044.71, -379.6, 10.99)
	N_0x80ead8e2e1d5d52e(c_onTestBlipp)
	SetBlipRoute(c_onTestBlipp, 1)
	c_onTestEvent = 1
	c_DamageControl = 1
	c_SpeedControl = 2
	c_onTtest = 3
	c_SpawnTestCar()
end

function EndTestTasks_CDL()
		c_onTestBlipp = nil
		c_onTestEvent = 17
		Citizen.Wait(100)
		c_onTestEvent = 0
		c_DamageControl = 0
		c_SpeedControl = 0
		c_Error = 0
		TaskLeaveVehicle(GetPlayerPed(-1), veh, 0)
		DeleteEntity(bus)
		DeletePed(dped)
		--
		CarTargetForLock = GetPlayersLastVehicle(GetPlayerPed(-1))
		lockStatus = GetVehicleDoorLockStatus(CarTargetForLock)
		SetVehicleDoorsLocked(CarTargetForLock, 2)
		SetVehicleDoorsLockedForPlayer(CarTargetForLock, PlayerId(), false)
		SetEntityAsMissionEntity(CarTargetForLock, true, true)
		Citizen.InvokeNative( 0xEA386986E786A54F, Citizen.PointerValueIntInitialized( CarTargetForLock ) )
		FreezeEntityPosition(GetPlayerPed(-1), false)		
end

function Course1_cdl()
local myPed = GetPlayerPed(-1)
	DTutOpen = true
	SetEntityCoords(myPed,-165.62, -1837.68, 57.72,true, false, false,true)
	ShowBoxMainPage("~b~20","~b~CDL-SA ~w~| INTRODUCTION", "What can you do with the CDL? These are the things ", "that you can drive while holding a Commercial Driver's ", "License.", "", " ~b~* ~w~Heavy police vehicles.", " ~b~* ~w~Charter buses.", " ~b~* ~w~City buses.", " ~b~* ~w~Tractor-trailers (Includes single, double, and triple trailers).", " ~b~* ~w~Large freight trucks.", " ~b~* ~w~Vehicles carrying hazardous materials.", " ~b~* ~w~Delivery trucks.", " ~b~* ~w~Large construction vehicles.", " ~b~* ~w~Waste management vehicles.", " ~b~* ~w~Firefighting vehicles.")
	Citizen.Wait(20000)
	DTutOpen = false
	DTutOpen = true
	SetEntityCoords(myPed,-122.92, -2297.29, 48.81,true, false, false,true)
	ShowBoxMainPage("~b~20","~b~CDL-SA ~w~| INTRODUCTION", "Safety Rules and Regulations are important to keep everyone", "safe including you as you are driving a heavier vehicle and", "it can cause more harm to others than a normal vehicle.", "", "~b~(1) ~w~Smoking is not allowed during fueling operations.", "~b~(2) ~w~A zero tolerance drug and alcohol policy is in effect.", "~b~(3) ~w~Pre and post trip inspections of equipment/vehicles must", "be completed daily.", "~b~(4) ~w~HORSEPLAY and running shall not be permitted on the ", "premises to include all work areas in/outside the buildings", "and parking lots", "~b~(5) ~w~All CD drivers must follow the SA laws (speeds & weight", "limits, drivetime, drive time, flagging, tarps, signage, etc)")
	Citizen.Wait(20000)
	DTutOpen = false
	DTutOpen = true
	SetEntityCoords(myPed,-126.58, -2366.44, 24.83,true, false, false,true)
	ShowBoxMainPage("~b~20","~b~CDL-SA ~w~| INTRODUCTION", "This is a guide that will cover the basics of a truck's", "movement and steering & driving, Its important to know", "how the truck is working and how to use it in a safe manner.", "", "~b~(1) Steering:", "The steering wheel should normally be held lightly with both", "hands Gripping the wheel too tightly can lead to fatigue and", "prevent smooth movement when steering.", "", "~b~(2) Negotiating Corners:", "When a vehicle turns, the path of the back wheels has a", "smaller radius than that of the front wheels. This causes the", "rear of the vehicle to ’cut-in’ when turning")
	Citizen.Wait(20000)
	DTutOpen = false
	DTutOpen = true
	SetEntityCoords(myPed,-269.88, -2425.92, 127.48,true, false, false,true)
	ShowBoxMainPage("~b~20","~b~CDL-SA ~w~| INTRODUCTION", "This is a guide that will cover the basics of a truck's", "movement and steering & driving, Its important to know", "how the truck is working and how to use it in a safe manner.", "", "~b~(3) Sharp Turns:", "The following are some important points to observe when", "making sharp or restricted turns.", "~b~- ~w~Keep a constant watch on traffic movements in your", " mirrors throughout the turn. ", "~b~- ~w~Use your turn signals and brake lights to give other", " drivers as much warning of your intentions as possible.", "~b~- ~w~Correctly position the vehicle on the road as it approaches", " the intersection or junction.", "~b~- ~w~Reduce speed to 'very slow' so you have time to turn.")
	Citizen.Wait(20000)
	DTutOpen = false
	DTutOpen = true
	SetEntityCoords(myPed,-915.53, -2519.6, 55.29,true, false, false,true)
	ShowBoxMainPage("~b~20","~b~CDL-SA ~w~| INTRODUCTION", "This is a guide that will cover the basics of a truck's", "movement and steering & driving, Its important to know", "how the truck is working and how to use it in a safe manner.", "", "~b~(4) Braking:", "As a professional truck driver you should always be aware", "of the danger posed by your vehicle if should you lose control", "of its speed or direction. Your complete understanding of", "the braking system of your vehicle and skill in using it", "correctly are essential to your safety and that of the general", "public. Never drive a vehicle if you are not familiar with its", "braking system.")
	Citizen.Wait(20000)
	DTutOpen = false
	DTutOpen = true
	SetEntityCoords(myPed,-1197.05, -1790.54, 32.54,true, false, false,true)
	ShowBoxMainPage("~b~20","~b~CDL-SA ~w~| INTRODUCTION", "This is a guide that will cover the basics of a truck's", "movement and steering & driving, Its important to know", "how the truck is working and how to use it in a safe manner.", "", "~b~(5) Braking on Hills:", "Complete loss of brakes when descending hills is one of the", "‘nightmare’ experiences truck drivers fear most. In most", "cases the failure occurrs as a result of poor vehicle", "maintenance or poor driving practices (or a combination of", "both). In most instances therefore, brake loss can be", "prevented. And on the rare occasion when it can’t, safe", "driving practices can minimise the dangers.")
	Citizen.Wait(20000)
	DTutOpen = false
	DTutOpen = true
	SetEntityCoords(myPed,-1297.09, -1055.03, 34.77,true, false, false,true)
	DMV_SA_LastPage = true
	ShowBoxMainPage("~b~30","~b~CDL-SA ~w~| INTRODUCTION", "This is a guide that will cover the basics of a truck's", "movement and steering & driving, Its important to know", "how the truck is working and how to use it in a safe manner.", "", "~b~(6) Reversing", "The procedures for reversing a rigid motor vehicle are", "different from those of an articulated vehicle, or any vehicle", "with a trailer. In the case of a rigid motor vehicle you should", "begin by turning the steering wheel so that the top of the", "wheel moves in the direction you wish to move the rear of the", "vehicle, With an articulated vehicle or a 'pig' trailer (which", "does not have steerable front wheels) you should begin", "by turning the bottom of the steering wheel in the direction", "you want the rear of the vehicle (i.e. the trailer) to go.")
	Citizen.Wait(30000)
	DTutOpen = false
	DTutOpen = true
	SetEntityCoords(myPed, -1238.16, -848.39, 85.16,true, false, false,true)
	DMV_SA_LastPage = true
	ShowBoxMainPage("~b~20","~b~CDL-SA ~w~| INTRODUCTION", "Broken-down vehicles are a hazard to the safety of other road", "users. They are more dangerous when the vehicle is hard", "to see due to darkness, weather, or location (like just over", "the crest of a hill.)", "", "~b~If your vehicle breaks down or becomes unsafe to drive:", "~b~* ~w~park it off the road, if possible", "~b~* ~w~switch on your four-way flashers (hazard warning lights)", "~b~* ~w~place reflectors or other warning devices at appropriate", "   places, as required by SA regulations", "~b~* ~w~Call for assistance, by the time you are waiting, remain", "   with your vehicle.")
	Citizen.Wait(20000)
	DTutOpen = false
	DTutOpen = true
	SetEntityCoords(myPed,-1058.93, -238.23, 60.68,true, false, false,true)
	DMV_SA_LastPage = true
	ShowBoxMainPage("~b~20","~b~CDL-SA ~w~| INTRODUCTION", "Emergencies, As a professional driver you are bound to", "face an emergency at some stage in your driving career. This", "could be a problem with a load of dangerous goods, skidding,", "brake failure, tyre failure or even a fire.", "", "~b~You can drastically reduce the likelihood of emergencies by:", "~b~* ~w~driving defensively so that you are always in control of", "   your vehicle.", "~b~* ~w~making certain, before every journey, that your vehicle", "   is well maintained and in a safe condition.", "~b~* ~w~knowing what cargo you are carrying and what todo with it ", "   if there is a problem.")
	Citizen.Wait(20000)
	DTutOpen = false
	--
	c_onTestEvent = 1
    c_theorylock = 4
	c_startptest()
end

function c_SpawnTestCar()
	------------------------------------------------	
	local hashtrail = GetHashKey("trailerlogs")
	local hashtruck = GetHashKey("packer")
	local dhash = GetHashKey('s_m_y_Construct_01')
	local myPed = GetPlayerPed(-1)
	local ply = GetPlayerPed(-1)
	local plyCoords = GetEntityCoords(ply, 0)
			
	RequestModel(hashtrail)
	while not HasModelLoaded(hashtrail) do
		Citizen.Wait(0)
	end
	
	RequestModel(hashtruck)
	while not HasModelLoaded(hashtruck) do
		Citizen.Wait(0)
	end
	RequestModel(dhash)
	while not HasModelLoaded(dhash) do
		Citizen.Wait(0)
	end
							
	trailer = CreateVehicle(hashtrail, -350.6, 1368.44, 31.26, 168.8, true, false)
	truck = CreateVehicle(hashtruck, -348.34, -1351.07, 31.29, 171.8, true, false)

	local plate = math.random(100, 900)
	SetVehicleOnGroundProperly(trailer, truck)
	SetVehicleNumberPlateText(truck, "DMV "..plate.." ")
	SetVehicleModKit(truck, 0)
	SetVehicleColours(truck,74,74)
	SetVehicleExtraColours(truck, 0, 0)
	
	local id = NetworkGetNetworkIdFromEntity(trailer, truck)
	SetNetworkIdCanMigrate(id, true)
	SetModelAsNoLongerNeeded(hashtrail, hashtruck)
	
	AttachVehicleToTrailer(truck, trailer, 1)
	
	-- Settings
	c_CruiseControl = 0
	SetPedIntoVehicle(myPed, truck, - 1)
	
	-- Ped
	dped = CreatePedInsideVehicle(truck, 4, dhash, 0, true, true)
	SetPedCanBeDraggedOut(dped, true)
	SetPedStayInVehicleWhenJacked(dped, true)
	SetEntityInvincible(dped, true)
	SetBlockingOfNonTemporaryEvents(dped, true)
	--
	DTutOpen = false
	SetEntityVisible(myPed, true)
	FreezeEntityPosition(GetVehiclePedIsUsing(GetPlayerPed(-1)), true)
	--
	ShowBoxMainPage("~b~15","     ~b~CDL-SA ~w~| DRIVING", "Hello there, Im going to be your guide today! Im gonna sit", "in the passanger seat and i will give you instructions", "on what to do. I wish you the best luck!", "", "Before we start, Im gonna give you 15 seconds to make", "you comfortable. Look around, turn off your phone etc.", "", "~b~---------------------------------------------------------------------------")
	Citizen.Wait(15000)
	DrawMissionText2("Head over to the ~b~Highway! ~w~(Look GPS)", 7000)
	drawNotification("Area: ~y~Town\n~s~Speed limit: ~y~50 mph\n~s~Error Points: ~y~".. c_Error.."/20")
	showmyinfo = false
	FreezeEntityPosition(GetVehiclePedIsUsing(GetPlayerPed(-1)), false)
	------------------------------------------------	
end
function EndDTest_CDL()
        if c_Error >= c_maxc_Errors then
			FreezeEntityPosition(GetVehiclePedIsUsing(GetPlayerPed(-1)), true)
			ShowBoxMainPage("~b~20","     ~b~CDL-SA ~w~| RESULTS", "Your driving course is now finished, You are soon to know", "your final results. Remember, You can always come back", "another day and retry the test if you failed it.", "", "~b~RESULTS:", "  ~b~* ~w~Status: ~r~Failed", "  ~b~* ~w~Error Points: "..c_Error.." / 20", "", "You can come back another day if you want to retry the test!")
			Citizen.Wait(20000)
			showmyinfo = false
			EndTestTasks()
			FreezeEntityPosition(GetVehiclePedIsUsing(GetPlayerPed(-1)), false)
			FreezeEntityPosition(GetPlayerPed(-1), false)
		else
			FreezeEntityPosition(GetVehiclePedIsUsing(GetPlayerPed(-1)), true)
			ShowBoxMainPage("~b~20","     ~b~CDL-SA ~w~| RESULTS", "Your driving course is now finished, You are soon to know", "your final results. Remember, You can always come back", "another day and retry the test if you failed it.", "", "~b~RESULTS:", "  ~b~* ~w~Status: ~g~Passed", "  ~b~* ~w~Error Points: "..c_Error.." / 20", "", "Congratz! Now you have a legal San Andreas driver's license!")
			TriggerServerEvent('CHAR_DMV:CD_License_T')
			Citizen.Wait(20000)
			showmyinfo = false
			EndTestTasks_CDL()
			FreezeEntityPosition(GetVehiclePedIsUsing(GetPlayerPed(-1)), false)
			FreezeEntityPosition(GetPlayerPed(-1), false)
		end
end

function c_ErrorBreakTest()
		c_onTestBlipp = nil
		c_onTestEvent = 16
		Citizen.Wait(100)
		c_onTestEvent = 0
		c_DamageControl = 0
		c_SpeedControl = 0
		c_Error = 0
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

function SpawnNextSessionTruckCDL()
	DeletePed(dped)
	
	local hashtruck = GetHashKey("Coach")
	local dhash = GetHashKey('s_m_y_Construct_01')
	local myPed = GetPlayerPed(-1)
	local ply = GetPlayerPed(-1)
	local plyCoords = GetEntityCoords(ply, 0)
	
	RequestModel(hashtruck)
	while not HasModelLoaded(hashtruck) do
		Citizen.Wait(0)
	end
	RequestModel(dhash)
	while not HasModelLoaded(dhash) do
		Citizen.Wait(0)
	end
							
	local bus = CreateVehicle(hashtruck, -1896.42, 1991.41, 142.08, 7.4, true, false)

	local plate = math.random(100, 900)
	SetVehicleOnGroundProperly(bus)
	SetVehicleNumberPlateText(bus, "DMV "..plate.." ")
	
	local id = NetworkGetNetworkIdFromEntity(bus)
	SetNetworkIdCanMigrate(id, true)
	SetModelAsNoLongerNeeded(hashtrail, hashtruck)

	
	-- Settings
	c_CruiseControl = 0
	SetPedIntoVehicle(myPed, bus, - 1)
	
	DTutOpen = false
	SetEntityVisible(myPed, true)
	FreezeEntityPosition(GetVehiclePedIsUsing(GetPlayerPed(-1)), true)
	--
	DeleteEntity(truck)
	DeleteEntity(trailer)
	--
	ShowBoxMainPage("~b~15","     ~b~CDL-SA ~w~| DRIVING", "Great job! Now you have completed the first driving task!", "You are now to do the last part of the test. You are going to", "drive this bus back to our place. Good luck!", "", "~b~---------------------------------------------------------------------------")
	Citizen.Wait(15000)
	showmyinfo = false
	FreezeEntityPosition(GetVehiclePedIsUsing(GetPlayerPed(-1)), false)
	------------------------------------------------	

end

---------------------------------
--- */* SCRIPT BASE LOOPS */* ---
---------------------------------

-- Speed limits on driving test
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)
		CarSpeed = GetEntitySpeed(GetCar()) * speed
        if(IsPedInAnyVehicle(GetPlayerPed(-1), false)) and c_SpeedControl == 1 and CarSpeed >= speed_limit_resi then
		drawNotification("~b~CDL-SCHOOL: ~w~You are speeding! Slow down! You are driving in a ~b~30 mph~w~ zone!")
			c_Error = c_Error + 1	
			Citizen.Wait(10000)
		elseif(IsPedInAnyVehicle(GetPlayerPed(-1), false)) and c_SpeedControl == 2 and CarSpeed >= speed_limit_town then
		drawNotification("~b~CDL-SCHOOL: ~w~You are speeding! Slow down! You are driving in a ~b~50 mph~w~ zone!")
			c_Error = c_Error + 1
			Citizen.Wait(10000)
		elseif(IsPedInAnyVehicle(GetPlayerPed(-1), false)) and c_SpeedControl == 3 and CarSpeed >= speed_limit_freeway then
		drawNotification("~b~CDL-SCHOOL: ~w~You are speeding! Slow down! You are driving in a ~b~60 mph~w~ zone!")
			c_Error = c_Error + 1
			Citizen.Wait(10000)
		elseif(IsPedInAnyVehicle(GetPlayerPed(-1), false)) and c_SpeedControl == 4 and CarSpeed >= speed_limit_outside then
		drawNotification("~b~CDL-SCHOOL: ~w~You are speeding! Slow down! You are driving in a ~b~45 mph~w~ zone!")
			c_Error = c_Error + 1
			Citizen.Wait(10000)
		end
	end
end)

-- Driving test
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        local veh = GetVehiclePedIsUsing(GetPlayerPed(-1))
		local ped = GetPlayerPed(-1)
		local check_veh = IsPedInVehicle(ped, spawned_car, true)
		if HasEntityCollidedWithAnything(veh) and c_DamageControl == 1 then
		drawNotification("~b~CDL-SCHOOL: ~w~The vehicle was damaged! Watch it!")
			Citizen.Wait(1000)
			c_Error = c_Error + 1	
		end
	if c_onTestEvent == 1 then
		DisableControlAction(1, 75, true)
		if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)),-2044.71, -379.6, 9.99, true) > 4.0001 then
		   DrawMarker(1, -2044.71, -379.6, 9.99, 0, 0, 0, 0, 0, 0, 1.5, 1.5, 1.5, 128, 198, 255, 100, 0, 0, 2, 0, 0, 0, 0)
		else
		    if c_onTestBlipp ~= nil and DoesBlipExist(c_onTestBlipp) then
				Citizen.InvokeNative(0x86A652570E5F25DD,Citizen.PointerValueIntInitialized(c_onTestBlipp))
		    end
			print("hej")
			c_onTestBlipp = AddBlipForCoord(-3084.58, 1183.23, 20.7)
			N_0x80ead8e2e1d5d52e(c_onTestBlipp)
			SetBlipRoute(c_onTestBlipp, 1)
			 DrawMissionText2("Continue to drive on the ~b~highway~w~!", 5000)
			drawNotification("Area: ~y~2 Lane Freeway\n~s~Speed limit: ~y~60 mph\n~s~Error Points: ~y~".. c_Error.."/20")
			c_SpeedControl = 3
			c_onTestEvent = 2
		end
	end
	
	if c_onTestEvent == 2 then
		DisableControlAction(1, 75, true)
		if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)),-3084.58, 1183.23, 19.7, true) > 4.0001 then
		   DrawMarker(1,-3084.58, 1183.23, 19.7, 0, 0, 0, 0, 0, 0, 1.5, 1.5, 1.5, 128, 198, 255, 100, 0, 0, 2, 0, 0, 0, 0)
		else
		    if c_onTestBlipp ~= nil and DoesBlipExist(c_onTestBlipp) then
				Citizen.InvokeNative(0x86A652570E5F25DD,Citizen.PointerValueIntInitialized(c_onTestBlipp))
		    end
			c_onTestBlipp = AddBlipForCoord(-1902.48, 2056.19, 140.7)
			N_0x80ead8e2e1d5d52e(c_onTestBlipp)
			SetBlipRoute(c_onTestBlipp, 1)
			drawNotification("Area: ~y~Road\n~s~Speed limit: ~y~45 mph\n~s~Error Points: ~y~".. c_Error.."/20")
		    DrawMissionText2("Head over to the next point!", 5000)
			c_onTestEvent = 3
			c_SpeedControl = 4		
		end
	end
	
	if c_onTestEvent == 3 then
		DisableControlAction(1, 75, true)
		if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)),-1902.48, 2056.19, 139.7, true) > 4.0001 then
		   DrawMarker(1,-1902.48, 2056.19, 139.7, 0, 0, 0, 0, 0, 0, 1.5, 1.5, 1.5, 128, 198, 255, 100, 0, 0, 2, 0, 0, 0, 0)
		else
		    if c_onTestBlipp ~= nil and DoesBlipExist(c_onTestBlipp) then
				Citizen.InvokeNative(0x86A652570E5F25DD,Citizen.PointerValueIntInitialized(c_onTestBlipp))
		    end
			c_onTestBlipp = AddBlipForCoord(-726.23, 992.73, 238.01)
			N_0x80ead8e2e1d5d52e(c_onTestBlipp)
			SetBlipRoute(c_onTestBlipp, 1)
		    DrawMissionText2("Completed ~g~first~w~ task!", 5000)
			PlaySound(-1, "RACE_PLACED", "HUD_AWARDS", 0, 0, 1)
			SpawnNextSessionTruckCDL()
			Citizen.Wait(1000)
			c_SpeedControl = 4
			drawNotification("Area: ~y~Road\n~s~Speed limit: ~y~45 mph\n~s~Error Points: ~y~".. c_Error.."/20")
			c_onTestEvent = 4
		end
	end	
	
		if c_onTestEvent == 4 then
		DisableControlAction(1, 75, true)
		if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)),-726.23, 992.73, 237.01, true) > 4.0001 then
		   DrawMarker(1,-726.23, 992.73, 237.01, 0, 0, 0, 0, 0, 0, 1.5, 1.5, 1.5, 128, 198, 255, 100, 0, 0, 2, 0, 0, 0, 0)
		else
		    if c_onTestBlipp ~= nil and DoesBlipExist(c_onTestBlipp) then
				Citizen.InvokeNative(0x86A652570E5F25DD,Citizen.PointerValueIntInitialized(c_onTestBlipp))
		    end
			c_onTestBlipp = AddBlipForCoord(-317.8, -1364.85, 31.3)
			N_0x80ead8e2e1d5d52e(c_onTestBlipp)
			SetBlipRoute(c_onTestBlipp, 1)
				
			DrawMissionText2("Entering city, ~r~Slow ~w~down!", 5000)
			drawNotification("Area: ~y~Town\n~s~Speed limit: ~y~50 mph\n~s~Error Points: ~y~".. c_Error.."/20")
			c_SpeedControl = 2
			c_onTestEvent = 5
			Citizen.Wait(4000)
		end
	end	
	
		if c_onTestEvent == 5 then
		DisableControlAction(1, 75, true)
		if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)),-317.8, -1364.85, 30.3, true) > 4.0001 then
		   DrawMarker(1,-317.8, -1364.85, 30.3, 0, 0, 0, 0, 0, 0, 1.5, 1.5, 1.5, 128, 198, 255, 100, 0, 0, 2, 0, 0, 0, 0)
		else
		    if c_onTestBlipp ~= nil and DoesBlipExist(c_onTestBlipp) then
				Citizen.InvokeNative(0x86A652570E5F25DD,Citizen.PointerValueIntInitialized(c_onTestBlipp))
		    end
			FreezeEntityPosition(GetVehiclePedIsUsing(GetPlayerPed(-1)), true)
			--
			EndDTest_CDL()
		end
	end	
end
end)

-- Get current vehicle ped is in function
dripdrip = "~m~Author: Alpha#5199"
function GetCar() 
	return GetVehiclePedIsIn(GetPlayerPed(-1),false) 
end

-- Display Help text function
function DisplayHelpText(str)
	SetTextComponentFormat("STRING")
	AddTextComponentString(str)
	DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end