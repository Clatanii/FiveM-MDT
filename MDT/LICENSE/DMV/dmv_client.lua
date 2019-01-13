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
local dmvschool_location = {239.09, -1381.57, 33.74}
local DMV_SA_LastPage = false
showmyinfo = false
local dmvped = {
  {type=4, hash=0xc99f21c4, x=239.09, y=-1381.57, z=33.74, a=3374176},
}
local dmvpedpos = {
	{ ['x'] = 238.95, ['y'] = -1381.83, ['z'] = 33.74 },
}

-- +/+ Main Arrays +/+ --
maxErrors = 8 -- Change the amount of Errors allowed for the player to pass the driver test, any number above this will result in a failed test
onTestEvent = 0
theorylock = 0
onTtest = 0
testblock = 0
DamageControl = 0
SpeedControl = 0
CruiseControl = 0
Error = 0

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
RegisterNetEvent('SRR_CHAR_DMV:StartCourse1_DMV')
AddEventHandler('SRR_CHAR_DMV:StartCourse1_DMV', function()
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
		DrawMarker(0, 239.09, -1381.57, 33.74, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.5, 0.5, 0.5, 216, 123, 27, 100, false, false, 0, false, false, false, false)
		local pos = GetEntityCoords(GetPlayerPed(-1), false)
		for k,v in ipairs(dmvpedpos) do
			if(Vdist(239.09, -1381.57, 33.74, pos.x, pos.y, pos.z) < 1.0)then
			DisplayHelpText("~o~DMV: ~w~Press *E* to start the DMV course")
				if(IsControlJustReleased(1, 38)) then																			
					ShowBoxMain("~o~DMV-SA ~w~| INTRODUCTION", "~w~Welcome to the Department Of Motor Vehicles, We are here", "~w~to help you get your driver's license today, But before that", "you will need to have a basic understanding of how the", "traffic works and how to be a good driver in general.", "", "~o~Driver's License Requirements:", "  ~w~* Filled 18 years old or more", "  ~w~* Pay Driver License Fees", "  ~w~* Good Eye-Vision", "  ~w~* Have a San-Andreas ID card", "", "~w~If you want to continue and start the actual course please", "~w~press ~g~(Y)~w~. Otherwise you can close this page and you will", "not be charged for anything. Have a great day!")
					end
				if(IsControlJustPressed(0, 246)) then
					showmyinfo = false
					TriggerServerEvent("CHAR_DMV:CHECK_VALID_1")
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
function startptest()
	onTestBlipp = AddBlipForCoord(255.13990783691,-1400.7319335938,30.5374584198)
	N_0x80ead8e2e1d5d52e(onTestBlipp)
	SetBlipRoute(onTestBlipp, 1)
	onTestEvent = 1
	DamageControl = 1
	SpeedControl = 1
	onTtest = 3
	SpawnTestCar()
end

-- End test
function EndTestTasks()
		onTestBlipp = nil
		onTestEvent = 17
		Citizen.Wait(100)
		onTestEvent = 0
		DamageControl = 0
		SpeedControl = 0
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
end

-- Start introduction of DMV school
function Course1()
local myPed = GetPlayerPed(-1)
	DTutOpen = true
	SetEntityCoords(myPed,173.01181030273, -1391.4141845703, 29.408880233765,true, false, false,true)
	ShowBoxMainPage("20","~o~DMV-SA ~w~| INTRODUCTION", "~w~Theory and practice are both important elements of driving", "~w~instruction. This introduction will cover the basics and", "ensure you are prepared with enough information and", "knowledge for your test. ", "", "The information from your theory lessons combined", "with the experience from your practical lesson are vital for", "negotiating the situations and dilemmas you will face on the", "road. Sit back and enjoy as we start. It is highly", "recommended that you pay attention to every detail,", "most of these questions can be existent under your", "theory test.")
	Citizen.Wait(20000)
	DTutOpen = false
	DTutOpen = true
	SetEntityCoords(myPed,-428.49026489258, -993.306640625, 46.008815765381,true, false, false,true)
	ShowBoxMainPage("30","~o~DMV-SA ~w~| INTRODUCTION", "~w~Accidents, incidents and environmental concerns duty to", "yield. All drivers have a duty to obey the rules of the road", "in order to avoid foreseeable harm to others. Failure to", "yield the right of way when required by law can lead to", "liability for any resulting accidents.", "", "When you hear a siren coming, you should yield to the", "emergency, simply pull over to your right. You must", "always stop when a traffic officers teels you to. Aggressive", "driving, a car that endangers or is likely to endager people", "or property is considered to be aggressive driving.", "", "However, aggressive driving, can lead to tragic accidents.", "It is far wiser to drive defensively and to always be on the", "lookout for the potential risk of crashes.")
	Citizen.Wait(30000)
	DTutOpen = false
	DTutOpen = true
	SetEntityCoords(myPed,-282.55557250977, -282.55557250977, 31.633310317993,true, false, false,true)
	ShowBoxMainPage("30","~o~DMV-SA ~w~| INTRODUCTION", "~w~Built-Up Areas/Towns, The ~o~35 mph ~w~limit usually applies to all", "traffic on all roads with street lighting unless otherwise", "specified. Driving at speeds too fast for the road and driving", "conditions can be dangerous. You should always reduce", "", "your speed when sharing the road with pedestrians or", "driving at night, as it is more difficult to see other road", "users, Weather conditions make it safer to do so. Remember,", "large vehicles and motorcycles need a greater distance", "to stop.", "", "On 'smaller' roads outside the city/towns the ~o~50 mph~w~ limit", "applies to all roads.")
	Citizen.Wait(30000)
	DTutOpen = false
	DTutOpen = true
	SetEntityCoords(myPed,246.35220336914, -1204.3403320313, 43.669715881348,true, false, false,true)
	ShowBoxMainPage("20","~o~DMV-SA ~w~| INTRODUCTION", "Freeways/Motorways, Traffic on motorways usually travels", "faster than on other roads, so you have less time to react.", "It is especially important to use your sences earlier and", "look much further ahead than you would on other roads.", "", "Check the traffic on motorway and match your speed to fit", "safely into the traffic flow in the left-hand lane.", "", "The ~o~speed limit ~w~on a Freeway/Motorway Area is ~o~60 mph~w~ on a", "2 Lane Highway/Freeway/Interstate (i.e. Great Ocean Highway", ",Route 68) and ~o~70 MPH~w~ on 4 Lane Highway/Freeway/", "Interstate (i.e. Senora Freeway, Los Santos Freeway)", "", "", "", "", "", "")
	Citizen.Wait(20000)
	DTutOpen = false
	DTutOpen = true
	SetEntityCoords(myPed,187.465, -1428.82, 43.9302,true, false, false,true)
	ShowBoxMainPage("20","~o~DMV-SA ~w~| INTRODUCTION", "Alcohol/Drugs, Drinking while driving is very dangerous,", "alcohol and/or drugs impair your judgment. Impaired", "affects how you react to sounds and what you see.","","However, the DMV allows a certain amount of alcohol", "concentration for those driving with a valid driver's license.", "0.08% is the legal limit for a driver's blood alcohol", "concentration (BAC)", "", "", "", "", "")
	Citizen.Wait(20000)
	DTutOpen = false
	DTutOpen = true
	SetEntityCoords(myPed,-678.67, -717.16, 68.17,true, false, false,true)
	ShowBoxMainPage("30","~o~DMV-SA ~w~| INTRODUCTION", "A car has several signalling devices - indicators, brake light,", "hazard warning light, headlights, reversing light and the car", "horn. These signalling devices are used by a driver to", "communicate to other road users what they intend to do.", "", "They help drivers 'read the road'. Signals give advance", "warning to other road users that you intend to perform a", "manoeuvre. Giving appropiate signals at the correct time", "and place and correctly interpreting the signals of other", "road users are important for the safety of all road users.", "", "Your signals must be given in good time before you start ", "your manoeuvre and for long enough for their meaning", "to be clear to other road users. Don't signal too soon", "as this could cause confusion.")
	Citizen.Wait(30000)
	DTutOpen = false
	DTutOpen = true
	SetEntityCoords(myPed,187.465, -1428.82, 43.9302,true, false, false,true)
	DMV_SA_LastPage = true
	ShowBoxMainPage("15","~o~DMV-SA ~w~| INTRODUCTION", "You have now completed the first task, You are now ready", "for the next step. Right now we are preparing your vehicle", "for your driving test. We wish you the best luck on the test!", "", "~o~USEFUL TIPS:", " ~o~* ~w~Stay under the speed limit"," ~o~* ~w~Avoid hitting any object", " ~o~* ~w~Pay attention to the traffic")
	Citizen.Wait(15000)
	DTutOpen = false
	showmyinfo = false
	--
	OnTestEvent = 1
    theorylock = 4
	startptest()
end

-- Spawn car and begin driving part
function SpawnTestCar()
	local hashVeh = GetHashKey("oracle")
	local dhash = GetHashKey('ig_stevehains')
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
							
	local veh = CreateVehicle(hashVeh, 249.40971374512,-1407.2303466797,30.409454345703, 320.4, true, false)

	local plate = math.random(100, 900)
	SetVehicleOnGroundProperly(veh)
	SetVehicleNumberPlateText(veh, "DMV "..plate.." ")
	SetVehicleModKit(veh, 0)
	SetVehicleMod(veh, 23, 10, false)
	SetVehicleWindowTint(veh, tonumber(6))
	SetVehicleColours(veh,138,138)
	SetVehicleExtraColours(veh, 23, 0, true) 
	
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
	ShowBoxMainPage("10","     ~o~DMV-SA ~w~| DRIVING", "Hello there, Im going to be your guide today! Im gonna sit", "in the passanger seat and i will give you instructions", "on what to do. I wish you the best luck!", "", "Before we start, Im gonna give you 10 seconds to make", "you comfortable. Look around, turn off your phone etc.", "", "~o~---------------------------------------------------------------------------")
	Citizen.Wait(10000)
	showmyinfo = false
	FreezeEntityPosition(GetVehiclePedIsUsing(GetPlayerPed(-1)), false)	
	
	------------------------------------------------
end

-- Give end results and stop everything
function EndDTest()
        if Error >= maxErrors then
			FreezeEntityPosition(GetVehiclePedIsUsing(GetPlayerPed(-1)), true)
			ShowBoxMainPage("20","     ~o~DMV-SA ~w~| RESULTS", "Your driving course is now finished, You are soon to know", "your final results. Remember, You can always come back", "another day and retry the test if you failed it.", "", "~o~RESULTS:", "  ~o~* ~w~Status: ~r~Failed", "  ~o~* ~w~Error Points: "..Error.." / 8", "", "You can come back another day if you want to retry the test!")
			Citizen.Wait(20000)
			showmyinfo = false
			EndTestTasks()
			FreezeEntityPosition(GetVehiclePedIsUsing(GetPlayerPed(-1)), false)
			FreezeEntityPosition(GetPlayerPed(-1), false)
		else
			FreezeEntityPosition(GetVehiclePedIsUsing(GetPlayerPed(-1)), true)
			ShowBoxMainPage("20","     ~o~DMV-SA ~w~| RESULTS", "Your driving course is now finished, You are soon to know", "your final results. Remember, You can always come back", "another day and retry the test if you failed it.", "", "~o~RESULTS:", "  ~o~* ~w~Status: ~g~Passed", "  ~o~* ~w~Error Points: "..Error.." / 8", "", "Congratz! Now you have a legal San Andreas driver's license!")
			TriggerServerEvent('CHAR_DMV:D_License_T')
			Citizen.Wait(20000)
			showmyinfo = false
			EndTestTasks()
			FreezeEntityPosition(GetVehiclePedIsUsing(GetPlayerPed(-1)), false)
			FreezeEntityPosition(GetPlayerPed(-1), false)
		end
end

-- Show Main Page template
function ShowBoxMainPage(secs, head, text1, text2, text3, text4, text5, text6, text7, text8, text9, text10, text11, text12, text13, text14, text15)
  Citizen.CreateThread(function()
	Citizen.Wait(0)
	PlaySoundFrontend(-1, "Menu_Accept", "Phone_SoundSet_Default", 1);
	showmyinfo = false
	local myPed = GetPlayerPed(-1)
	showmyinfo1 = true
	local pos = dmvschool_location
	
	ShowInfoblackboxPage(secs, head, text1, text2, text3, text4, text5, text6, text7, text8, text9, text10, text11, text12, text13, text14, text15)

    while showmyinfo1 do
      Citizen.Wait(1)
      if (IsControlJustReleased(1, 178)) and DMV_SA_LastPage == true then
        showmyinfo1 = false
		showmyinfo = false
		DTutOpen = false
		SetEntityCoords(myPed, pos[1],pos[2],pos[3],true, false, false,true)
		drawNotification("~o~DMV-SCHOOL: ~w~You stopped your training session")
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
function ShowInfoblackboxPage(secs, head, text1, text2, text3, text4, text5, text6, text7, text8, text9, text10, text11, text12, text13, text14, text15)
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
			--
			drawTxt(1.155, 1.243, 1.0,1.0,0.45, "~c~P L E A S E  W A I T  ~o~"..secs.."  S E C S  ~c~T O  C O N T I N U E", 255, 255, 255, 200)
		end
	end)
end

-- [not used at moment] - used to break and reset
function ErrorBreakTest()
		onTestBlipp = nil
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

-- Speed limits on driving test
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)
		CarSpeed = GetEntitySpeed(GetCar()) * speed
        if(IsPedInAnyVehicle(GetPlayerPed(-1), false)) and SpeedControl == 1 and CarSpeed >= speed_limit_resi then
		drawNotification("~o~DMV-SCHOOL: ~w~You are speeding! Slow down! You are driving in a ~o~30 mph~w~ zone!")
			Error = Error + 1	
			Citizen.Wait(10000)
		elseif(IsPedInAnyVehicle(GetPlayerPed(-1), false)) and SpeedControl == 2 and CarSpeed >= speed_limit_town then
		drawNotification("~o~DMV-SCHOOL: ~w~You are speeding! Slow down! You are driving in a ~o~35 mph~w~ zone!")
			Error = Error + 1
			Citizen.Wait(10000)
		elseif(IsPedInAnyVehicle(GetPlayerPed(-1), false)) and SpeedControl == 3 and CarSpeed >= speed_limit_freeway then
		drawNotification("~o~DMV-SCHOOL: ~w~You are speeding! Slow down! You are driving in a ~o~60 mph~w~ zone!")
			Error = Error + 1
			Citizen.Wait(10000)
		end
	end
end)

-- Main Driving Thread
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        local veh = GetVehiclePedIsUsing(GetPlayerPed(-1))
		local ped = GetPlayerPed(-1)
		local check_veh = IsPedInVehicle(ped, veh, true)
		if HasEntityCollidedWithAnything(veh) and DamageControl == 1 then
		drawNotification("~o~DMV-SCHOOL: ~w~The vehicle was damaged! Watch it!")
			Citizen.Wait(1000)
			Error = Error + 1	
		end
	if onTestEvent == 1 then
		DisableControlAction(1, 75, true)
		if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), 255.13990783691,-1400.7319335938,29.5374584198, true) > 4.0001 then
		   DrawMarker(1,255.13990783691,-1400.7319335938,29.5374584198,0, 0, 0, 0, 0, 0, 1.5, 1.5, 1.5, 216, 123, 27, 255, 0, 0, 2, 0, 0, 0, 0)
		else
		    if onTestBlipp ~= nil and DoesBlipExist(onTestBlipp) then
				Citizen.InvokeNative(0x86A652570E5F25DD,Citizen.PointerValueIntInitialized(onTestBlipp))
		    end
			onTestBlipp = AddBlipForCoord(271.8747253418,-1370.5744628906,31.932783126831)
			N_0x80ead8e2e1d5d52e(onTestBlipp)
		    DrawMissionText2("Head to the next point !", 5000)
			onTestEvent = 2
		end
	end
	
	if onTestEvent == 2 then
		DisableControlAction(1, 75, true)
		if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)),271.8747253418,-1370.5744628906,30.932783126831, true) > 4.0001 then
		   DrawMarker(1,271.8747253418,-1370.5744628906,30.932783126831,0, 0, 0, 0, 0, 0, 1.5, 1.5, 1.5, 216, 123, 27, 255, 0, 0, 2, 0, 0, 0, 0)
		else
		    if onTestBlipp ~= nil and DoesBlipExist(onTestBlipp) then
				Citizen.InvokeNative(0x86A652570E5F25DD,Citizen.PointerValueIntInitialized(onTestBlipp))
		    end
			onTestBlipp = AddBlipForCoord(234.90780639648,-1345.3854980469, 30.542045593262)
			N_0x80ead8e2e1d5d52e(onTestBlipp)
			SetBlipRoute(onTestBlipp, 1)
		    DrawMissionText2("Head over to the next point!", 5000)
			onTestEvent = 3		
		end
	end
	
	if onTestEvent == 3 then
		DisableControlAction(1, 75, true)
		if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)),234.90780639648,-1345.3854980469, 29.542045593262, true) > 4.0001 then
		   DrawMarker(1,234.90780639648,-1345.3854980469, 29.542045593262,0, 0, 0, 0, 0, 0, 1.5, 1.5, 1.5, 216, 123, 27, 255, 0, 0, 2, 0, 0, 0, 0)
		else
		    if onTestBlipp ~= nil and DoesBlipExist(onTestBlipp) then
				Citizen.InvokeNative(0x86A652570E5F25DD,Citizen.PointerValueIntInitialized(onTestBlipp))
		    end
			onTestBlipp = AddBlipForCoord(217.82102966309,-1410.5201416016,29.292112350464)
			N_0x80ead8e2e1d5d52e(onTestBlipp)
			SetBlipRoute(onTestBlipp, 1)
		    DrawMissionText2("Make a quick ~r~stop~s~ for pedastrian ~y~crossing", 5000)
			PlaySound(-1, "RACE_PLACED", "HUD_AWARDS", 0, 0, 1)
			FreezeEntityPosition(GetVehiclePedIsUsing(GetPlayerPed(-1)), true) -- Freeze Entity
			Citizen.Wait(4000)
			FreezeEntityPosition(GetVehiclePedIsUsing(GetPlayerPed(-1)), false) -- Freeze Entity
			DrawMissionText2("~g~Great!~s~ lets keep moving!", 5000)
			onTestEvent = 4
		end
	end	
	
		if onTestEvent == 4 then
		DisableControlAction(1, 75, true)
		if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)),217.82102966309,-1410.5201416016,28.292112350464, true) > 4.0001 then
		   DrawMarker(1,217.82102966309,-1410.5201416016,28.292112350464,0, 0, 0, 0, 0, 0, 1.5, 1.5, 1.5, 216, 123, 27, 255, 0, 0, 2, 0, 0, 0, 0)
		else
		    if onTestBlipp ~= nil and DoesBlipExist(onTestBlipp) then
				Citizen.InvokeNative(0x86A652570E5F25DD,Citizen.PointerValueIntInitialized(onTestBlipp))
		    end
			onTestBlipp = AddBlipForCoord(178.55052185059,-1401.7551269531,28.725154876709)
			N_0x80ead8e2e1d5d52e(onTestBlipp)
			SetBlipRoute(onTestBlipp, 1)
		    DrawMissionText2("   		    Do a quick ~r~stop~s~ and watch your ~y~LEFT~s~ before entering traffic", 5000)
			PlaySound(-1, "RACE_PLACED", "HUD_AWARDS", 0, 0, 1)
			FreezeEntityPosition(GetVehiclePedIsUsing(GetPlayerPed(-1)), true) -- Freeze Entity
			Citizen.Wait(6000)
			FreezeEntityPosition(GetVehiclePedIsUsing(GetPlayerPed(-1)), false) -- Freeze Entity
			DrawMissionText2("~g~Great!~s~ now take a ~y~RIGHT~s~ and pick your lane", 5000)
			drawNotification("Area: ~y~Town\n~s~Speed limit: ~y~50 mph\n~s~Error Points: ~y~".. Error.."/8")
			SpeedControl = 2
			onTestEvent = 5
			Citizen.Wait(4000)
		end
	end	
	
		if onTestEvent == 5 then
		DisableControlAction(1, 75, true)
		if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)),178.55052185059,-1401.7551269531,27.725154876709, true) > 4.0001 then
		   DrawMarker(1,178.55052185059,-1401.7551269531,27.725154876709,0, 0, 0, 0, 0, 0, 1.5, 1.5, 1.5, 216, 123, 27, 255, 0, 0, 2, 0, 0, 0, 0)
		else
		    if onTestBlipp ~= nil and DoesBlipExist(onTestBlipp) then
				Citizen.InvokeNative(0x86A652570E5F25DD,Citizen.PointerValueIntInitialized(onTestBlipp))
		    end
			onTestBlipp = AddBlipForCoord(113.16044616699,-1365.2762451172,28.725179672241)
			N_0x80ead8e2e1d5d52e(onTestBlipp)
			SetBlipRoute(onTestBlipp, 1)
		    DrawMissionText2("Watch the traffic ~y~lights~s~ !", 5000)
			onTestEvent = 6
		end
	end	

		if onTestEvent == 6 then
		DisableControlAction(1, 75, true)
		if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)),113.16044616699,-1365.2762451172,27.725179672241, true) > 4.0001 then
		   DrawMarker(1,113.16044616699,-1365.2762451172,27.725179672241,0, 0, 0, 0, 0, 0, 1.5, 1.5, 1.5, 216, 123, 27, 255, 0, 0, 2, 0, 0, 0, 0)
		else
		    if onTestBlipp ~= nil and DoesBlipExist(onTestBlipp) then
				Citizen.InvokeNative(0x86A652570E5F25DD,Citizen.PointerValueIntInitialized(onTestBlipp))
		    end
			onTestBlipp = AddBlipForCoord(-73.542953491211,-1364.3355712891,27.789325714111)
			N_0x80ead8e2e1d5d52e(onTestBlipp)
			SetBlipRoute(onTestBlipp, 1)
			onTestEvent = 7
		end
	end		
		
	
		if onTestEvent == 7 then
		DisableControlAction(1, 75, true)
		if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)),-73.542953491211,-1364.3355712891,27.789325714111, true) > 4.0001 then
		   DrawMarker(1,-73.542953491211,-1364.3355712891,27.789325714111,0, 0, 0, 0, 0, 0, 1.5, 1.5, 1.5, 216, 123, 27, 255, 0, 0, 2, 0, 0, 0, 0)
		else
		    if onTestBlipp ~= nil and DoesBlipExist(onTestBlipp) then
				Citizen.InvokeNative(0x86A652570E5F25DD,Citizen.PointerValueIntInitialized(onTestBlipp))
		    end
			onTestBlipp = AddBlipForCoord(-355.14373779297,-1420.2822265625,27.868143081665)
			N_0x80ead8e2e1d5d52e(onTestBlipp)
			SetBlipRoute(onTestBlipp, 1)
		    DrawMissionText2("Make sure to stop for passing vehicles !", 5000)
			onTestEvent = 8
		end
	end			
	
		if onTestEvent == 8 then
		DisableControlAction(1, 75, true)
		if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)),-355.14373779297,-1420.2822265625,27.868143081665, true) > 4.0001 then
		   DrawMarker(1,-355.14373779297,-1420.2822265625,27.868143081665,0, 0, 0, 0, 0, 0, 1.5, 1.5, 1.5, 216, 123, 27, 255, 0, 0, 2, 0, 0, 0, 0)
		else
		    if onTestBlipp ~= nil and DoesBlipExist(onTestBlipp) then
				Citizen.InvokeNative(0x86A652570E5F25DD,Citizen.PointerValueIntInitialized(onTestBlipp))
		    end
			onTestBlipp = AddBlipForCoord(-439.14846801758,-1417.1004638672,27.704095840454)
			N_0x80ead8e2e1d5d52e(onTestBlipp)
			SetBlipRoute(onTestBlipp, 1)
			onTestEvent = 9
		end
	end			
	
		if onTestEvent == 9 then
		DisableControlAction(1, 75, true)
		if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)),-439.14846801758,-1417.1004638672,27.704095840454, true) > 4.0001 then
		   DrawMarker(1,-439.14846801758,-1417.1004638672,27.704095840454,0, 0, 0, 0, 0, 0, 1.5, 1.5, 1.5, 216, 123, 27, 255, 0, 0, 2, 0, 0, 0, 0)
		else
		    if onTestBlipp ~= nil and DoesBlipExist(onTestBlipp) then
				Citizen.InvokeNative(0x86A652570E5F25DD,Citizen.PointerValueIntInitialized(onTestBlipp))
		    end
			onTestBlipp = AddBlipForCoord(-453.79092407227,-1444.7265625,27.665870666504)
			N_0x80ead8e2e1d5d52e(onTestBlipp)
			SetBlipRoute(onTestBlipp, 1)
			onTestEvent = 10
		end
	end		

		if onTestEvent == 10 then
		DisableControlAction(1, 75, true)
		if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)),-453.79092407227,-1444.7265625,27.665870666504, true) > 4.0001 then
		   DrawMarker(1,-453.79092407227,-1444.7265625,27.665870666504,0, 0, 0, 0, 0, 0, 1.5, 1.5, 1.5, 216, 123, 27, 255, 0, 0, 2, 0, 0, 0, 0)
		else
		    if onTestBlipp ~= nil and DoesBlipExist(onTestBlipp) then
				Citizen.InvokeNative(0x86A652570E5F25DD,Citizen.PointerValueIntInitialized(onTestBlipp))
		    end
			onTestBlipp = AddBlipForCoord(-463.23712158203,-1592.1785888672,37.519771575928)
			N_0x80ead8e2e1d5d52e(onTestBlipp)
			SetBlipRoute(onTestBlipp, 1)
		    DrawMissionText2("Time to hit the road, watch your speed and dont crash !", 5000)
			PlaySound(-1, "RACE_PLACED", "HUD_AWARDS", 0, 0, 1)
			drawNotification("Area: ~y~2 Lane Freeway\n~s~Speed limit: ~y~60 mph\n~s~Error Points: ~y~".. Error.."/8")
			onTestEvent = 11
			SpeedControl = 3
			Citizen.Wait(4000)
		end
	end		

		if onTestEvent == 11 then
		DisableControlAction(1, 75, true)
		if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)),-463.23712158203,-1592.1785888672,37.519771575928, true) > 4.0001 then
		   DrawMarker(1,-463.23712158203,-1592.1785888672,37.519771575928,0, 0, 0, 0, 0, 0, 1.5, 1.5, 1.5, 216, 123, 27, 255, 0, 0, 2, 0, 0, 0, 0)
		else
		    if onTestBlipp ~= nil and DoesBlipExist(onTestBlipp) then
				Citizen.InvokeNative(0x86A652570E5F25DD,Citizen.PointerValueIntInitialized(onTestBlipp))
		    end
			onTestBlipp = AddBlipForCoord(-900.64721679688,-1986.2814941406,26.109502792358)
			N_0x80ead8e2e1d5d52e(onTestBlipp)
			SetBlipRoute(onTestBlipp, 1)
			onTestEvent = 12
		end
	end
	
		if onTestEvent == 12 then
		DisableControlAction(1, 75, true)
		if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)),-900.64721679688,-1986.2814941406,26.109502792358, true) > 4.0001 then
		   DrawMarker(1,-900.64721679688,-1986.2814941406,26.109502792358,0, 0, 0, 0, 0, 0, 1.5, 1.5, 1.5, 216, 123, 27, 255, 0, 0, 2, 0, 0, 0, 0)
		else
		    if onTestBlipp ~= nil and DoesBlipExist(onTestBlipp) then
				Citizen.InvokeNative(0x86A652570E5F25DD,Citizen.PointerValueIntInitialized(onTestBlipp))
		    end
			onTestBlipp = AddBlipForCoord(1225.7598876953,-1948.7922363281,38.718940734863)
			N_0x80ead8e2e1d5d52e(onTestBlipp)
			SetBlipRoute(onTestBlipp, 1)
			onTestEvent = 13
		end
	end	
	
		if onTestEvent == 13 then
		DisableControlAction(1, 75, true)
		if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)),1225.7598876953,-1948.7922363281,38.718940734863, true) > 4.0001 then
		   DrawMarker(1,1225.7598876953,-1948.7922363281,38.718940734863,0, 0, 0, 0, 0, 0, 1.5, 1.5, 1.5, 216, 123, 27, 255, 0, 0, 2, 0, 0, 0, 0)
		else
		    if onTestBlipp ~= nil and DoesBlipExist(onTestBlipp) then
				Citizen.InvokeNative(0x86A652570E5F25DD,Citizen.PointerValueIntInitialized(onTestBlipp))
		    end
			onTestBlipp = AddBlipForCoord(209.54621887207,-1412.8677978516,29.652387619019)
			N_0x80ead8e2e1d5d52e(onTestBlipp)
			SetBlipRoute(onTestBlipp, 1)
			onTestEvent = 14
		end
	end	
	
		if onTestEvent == 14 then
		DisableControlAction(1, 75, true)
		if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)),1225.7598876953,-1948.7922363281,38.718940734863, true) > 4.0001 then
		   DrawMarker(1,1225.7598876953,-1948.7922363281,38.718940734863,0, 0, 0, 0, 0, 0, 1.5, 1.5, 1.5, 216, 123, 27, 255, 0, 0, 2, 0, 0, 0, 0)
		else
		    if onTestBlipp ~= nil and DoesBlipExist(onTestBlipp) then
				Citizen.InvokeNative(0x86A652570E5F25DD,Citizen.PointerValueIntInitialized(onTestBlipp))
		    end
			onTestBlipp = AddBlipForCoord(1163.6030273438,-1841.7713623047,35.679168701172)
			N_0x80ead8e2e1d5d52e(onTestBlipp)
			SetBlipRoute(onTestBlipp, 1)
			DrawMissionText2("Entering town, watch your speed!", 5000)
			drawNotification("~r~Slow down!\n~s~Area: ~y~Town\n~s~Speed limit: ~y~50 mph\n~s~Error Points: ~y~".. Error.."/8")
			onTestEvent = 15
		end
	end			
	
	if onTestEvent == 15 then
	DisableControlAction(1, 75, true)
		if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)),1163.6030273438,-1841.7713623047,35.679168701172, true) > 4.0001 then
		   DrawMarker(1,213.86,-1362.73,29.58,0, 0, 0, 0, 0, 0, 1.5, 1.5, 1.5, 216, 123, 27, 255, 0, 0, 2, 0, 0, 0, 0)
		else
		    if onTestBlipp ~= nil and DoesBlipExist(onTestBlipp) then
				Citizen.InvokeNative(0x86A652570E5F25DD,Citizen.PointerValueIntInitialized(onTestBlipp))
		    end
			onTestBlipp = AddBlipForCoord(213.86,-1362.73,30.58)
			N_0x80ead8e2e1d5d52e(onTestBlipp)
			SetBlipRoute(onTestBlipp, 1)
			PlaySound(-1, "RACE_PLACED", "HUD_AWARDS", 0, 0, 1)
		    DrawMissionText2("Good job, now lets head back!", 5000)
			SpeedControl = 2
			onTestEvent = 16
		end
	end		

		if onTestEvent == 16 then
		DisableControlAction(1, 75, true)
		if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)),213.86,-1362.73,30.58, true) > 4.0001 then
		   DrawMarker(1,213.86,-1362.73,30.58,0, 0, 0, 0, 0, 0, 1.5, 1.5, 1.5, 216, 123, 27, 255, 0, 0, 2, 0, 0, 0, 0)
		else
		    if onTestBlipp ~= nil and DoesBlipExist(onTestBlipp) then
				Citizen.InvokeNative(0x86A652570E5F25DD,Citizen.PointerValueIntInitialized(onTestBlipp))
		    end
			EndDTest()
		end
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