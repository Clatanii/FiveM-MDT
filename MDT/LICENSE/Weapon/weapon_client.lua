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
local dmvschool_location = {14.23, -1105.74, 29.8}
local DMV_SA_LastPage = false
local dmvped = {
  {type = 4, hash = 0xc99f21c4, x = 14.23, y = -1105.74, z = 29.8, a = 3374176},
}
local dmvpedpos = {
	{ ['x'] = 14.23, ['y'] = -1105.74, ['z'] = 29.8 },
}

-----------------------------
--- */* SCRIPT EVENTS */* ---
-----------------------------

RegisterNetEvent('SRR_CHAR_SAF:WaitTime')
AddEventHandler('SRR_CHAR_SAF:WaitTime', function(ID)
	local wait_time = math.random(300000, 600000)
	drawNotification("~r~Weapon License: ~w~Your ID is being processed, Please wait 10 - 15 minutes before you get a note.")
	--
	Citizen.Wait(wait_time)
	--
	drawNotification("~r~Weapon License~w~: Congratz! Now you have an legal san andreas weapon license!")
	TriggerServerEvent("CHAR_SAF_FIREARM_UPDATE", ID)
end)

---------------------------------
--- */* SCRIPT START-MAIN */* ---
---------------------------------

Citizen.CreateThread(function()
	while mdt.Server_Licenses == true do
		Citizen.Wait(0)
		DrawMarker(0, 14.23, -1105.74, 29.8, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.5, 0.5, 0.5, 225, 59, 59, 100, false, false, 0, false, false, false, false)
		local pos = GetEntityCoords(GetPlayerPed(-1), false)
		for k,v in ipairs(dmvpedpos) do
			if(Vdist(14.23, -1105.74, 29.8, pos.x, pos.y, pos.z) < 1.0)then
			DisplayHelpText("~r~Weapon License: ~w~Press *E* to get your weapon license!")
				if(IsControlJustReleased(1, 38)) then																			
					ShowBoxMain("~r~   F-SA ~w~| INTRODUCTION", "~w~Welcome to San Andreas offical weapon license guide. Here", "you can get your firearm license today! Before you can get", "your offical license on your ID we need some information", "from you so we can check some things on your ID.", "", "~r~Weapon License Requirements:", "~w~* No previous crime history", "~w~* No active warrants", "~w~* Be an member of San Andreas", "~w~* Be 18 years old or more", "", "~w~If you want to continue and send in your application please", "press ~g~(Y)~w~. Otherwise you can escape this page and you will ", "not be charged for anything. Have a great day!", "", "~r~SA Weapon Licene Note:")
					end
				if(IsControlJustPressed(0, 246)) then
					showmyinfo = false
					TriggerServerEvent("CHAR_FD:CHECK_VALID_1")
				end
			end
		end
	end
end)


--------------------------------
--- */* SCRIPT FUNCTIONS */* ---
--------------------------------

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


-- Display Help text function
function DisplayHelpText(str)
	SetTextComponentFormat("STRING")
	AddTextComponentString(str)
	DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end

---------------------------------
--- */* SCRIPT BASE LOOPS */* ---
---------------------------------