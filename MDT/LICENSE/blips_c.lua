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

-- Create blip (DMV License)
local dmvschool_location = {239.09, -1381.57, 33.74}
Citizen.CreateThread(function()
	if mdt.Server_Licenses == true then
		local pos = dmvschool_location
		local blip = AddBlipForCoord(pos[1],pos[2],pos[3])
		SetBlipSprite(blip,225)
		SetBlipColour(blip,64)
		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString('DMV School')
		EndTextCommandSetBlipName(blip)
		SetBlipAsShortRange(blip,true)
		SetBlipAsMissionCreatorBlip(blip,true)
	end
end)

-- Create blip (CDL License)
local cdlschool_location = {-320.51, -1390.1, 36.5}
Citizen.CreateThread(function()
	if mdt.Server_Licenses == true then
		local pos = cdlschool_location
		local blip = AddBlipForCoord(pos[1],pos[2],pos[3])
		SetBlipSprite(blip,477)
		SetBlipColour(blip,26)
		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString('CDL School')
		EndTextCommandSetBlipName(blip)
		SetBlipAsShortRange(blip,true)
		SetBlipAsMissionCreatorBlip(blip,true)
	end
end)

-- Create blip (Weapon License)
local wpschool_location = {14.23, -1105.74, 29.8}
Citizen.CreateThread(function()
	if mdt.Server_Licenses == true then
		local pos = wpschool_location
		local blip = AddBlipForCoord(pos[1],pos[2],pos[3])
		SetBlipSprite(blip,110)
		SetBlipColour(blip,75)
		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString('Weapon License')
		EndTextCommandSetBlipName(blip)
		SetBlipAsShortRange(blip,true)
		SetBlipAsMissionCreatorBlip(blip,true)
	end
end)

-- Create blip (RESET LICENSE)
local resetpoints_location = {233.25, -410.27, 49.11}
Citizen.CreateThread(function()
	local pos = resetpoints_location
	local blip = AddBlipForCoord(pos[1],pos[2],pos[3])
	SetBlipSprite(blip,498)
	SetBlipColour(blip,52)
	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString('Reset License Points')
	EndTextCommandSetBlipName(blip)
	SetBlipAsShortRange(blip,true)
	SetBlipAsMissionCreatorBlip(blip,true)
end)