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
--- */* SCRIPT CONFIG */* ---
-----------------------------
showmyinfo = false

-- */* Character RP info */*
CHAR_BAC_LEVEL = 0.0
CHAR_DRUG_LEVEL = 0.0

-----------------------------
--- */* SCRIPT EVENTS */* ---
-----------------------------

-- Show Black Box Template
RegisterNetEvent('SRR_CHAR:HomePage')
AddEventHandler('SRR_CHAR:HomePage', function(menu, desc1, desc2, desc3, line1, line2, line3, line4, line5, line6, line7, line8, line9, line10, line11, line12, line13, line14, line15, line16, line17)
  Citizen.CreateThread(function()
	showmyinfo = false
	Citizen.Wait(0)
	PlaySoundFrontend(-1, "Menu_Accept", "Phone_SoundSet_Default", 1);
	showmyinfo = true
	ShowMDTblackbox(menu, desc1, desc2, desc3, line1, line2, line3, line4, line5, line6, line7, line8, line9, line10, line11, line12, line13, line14, line15, line16, line17)

    while showmyinfo do
      Citizen.Wait(1)
      if (IsControlJustPressed(1, 178)) then
        showmyinfo = false
		PlaySoundFrontend(-1, "BACK", "HUD_AMMO_SHOP_SOUNDSET", 1);
      end
    end
  end)
end)

-- Notification Template
RegisterNetEvent('SRR_CHAR:s_Notify')
AddEventHandler('SRR_CHAR:s_Notify', function(message)
	drawNotification(message)
end)

--------------------------------
--- */* SCRIPT FUNCTIONS */* ---
--------------------------------

function ShowMDTblackbox(menu, desc1, desc2, desc3, line1, line2, line3, line4, line5, line6, line7, line8, line9, line10, line11, line12, line13, line14, line15, line16, line17)
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
			drawTxt(1.043, 1.205, 1.0,1.0,0.48, line17, 255, 255, 255, 200)
			drawTxt(1.387, 1.253, 1.0,1.0,0.40, line18, 255, 255, 255, 200)
			drawTxt(1.192, 1.245, 1.0,1.0,0.45, "~c~P R E S S  ~c~D E L  ~c~T O  C L O S E", 255, 255, 255, 200);
		end
	end)
end

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

function DisplayHelpText(str)
	SetTextComponentFormat("STRING")
	AddTextComponentString(str)
	DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end

function float(number)
    number = number + 0.00001
    return number
end

function drawNotification(text)
	SetNotificationTextEntry("STRING")
	AddTextComponentString(text)
	DrawNotification(true, true)
end