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

-- */* CONFIG */*
mdt = {
	-- */* CURRENT VERSION */*
	Script_Ver = "1.2",
	-- */* SERVER NAME */*
	Server_Name = 'FIVEM', -- (Recommend using first initials of server name, to make it look better and fit inside box)
	-- */* MAIN COLOR FOR THINGS */* 
	Server_Color = '~p~',
	-- */* WHEN LEAVING SERVER SHOULD IT CLEAR YOUR REGISTERED VEHICLES */*
	Server_Del_Veh = true, -- (Valid Options: true or false)
	-- */* IF LICENSES ARE TO BE INGAME AND USED (FIREARM, DMV, CDL) */*
	Server_Licenses = true, -- (Valid Options: true or false)
	-- */* MAX POINTS OFFICERS CAN GIVE */*
	Server_Points = "3", -- ([Default: 3] - Max points officers can give to a person)
	-- */* WHEN PUTTING OUT WARRANT SHOW AN NOTICE TO THE PLAYER */*
	Server_Show_War = true -- (Valid Options: true or false)
}

-- Message on resource start in server console/log
AddEventHandler('onResourceStart', function(resourceName)
	if resourceName == GetCurrentResourceName() then
	   print("------------------------------------------------------------")
	   print("-- Author: Alpha#5199 / - / Version: "..mdt.Script_Ver.."")
	   print("-- Loading: Installing script & connecting to SQL")
 	   print("-- Resource: MDT & Licenses & Reg & Character System")
	   print("------------------------------------------------------------")
    	end	
end)

--[[
*/* ALL COLORS AVAILBLE */*

	Colors:
	~r~ = Red
	~b~ = Blue
	~g~ = Green
	~y~ = Yellow
	~p~ = Purple
	~c~ = Grey
	~m~ = Dark Grey
	~u~ = Black
	~o~ = Orange
	
*/* ALL COLORS AVAILBLE */*
--]]
