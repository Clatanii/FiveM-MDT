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

-- */* RESOURCE MANIFEST VERSION */*
resource_manifest_version '05cfa83c-a124-4cfa-a768-c24a5811d8f9'

-- */* SERVER SCRIPTS (SERVERSIDE) */*
server_scripts {
	'@mysql-async/lib/MySQL.lua', -- */* MYSQL REQUIRED */*
	--
	'MDT/mdt_server.lua', -- */* LOAD SERVER SCRIPT */*
	
	-- CHARACTER
	'CHAR/char_server.lua',
	
	'config.lua', -- */* MAIN CONFIG FILE */*
	
	-- ALL LICENSES FILES
	'LICENSE/CDL/cdl_server.lua',
	--
	'LICENSE/DMV/dmv_server.lua',
	--
	'LICENSE/Weapon/weapon_server.lua',
}

-- */* CLIENT SCRIPTS (CLIENTSIDE) */*
client_scripts { 
	-- MDT 
	'MDT/mdt_client.lua', -- */* LOAD MAIN CLIENT SCRIPT */*
	'MDT/mdt_client_skip.lua', -- */* LOAD EVENT FILE CLIENT SCRIPT */*
	
	-- CHARACTER
	'CHAR/char_client.lua',

	'config.lua', -- */* MAIN CONFIG FILE */*
	--
	'LICENSE/blips_c.lua', -- */* BLIPS FOR EVERYTHING IN SYSTEM
	-- ALL LICENSES FILES
	'LICENSE/CDL/cdl_client.lua',
	--
	'LICENSE/DMV/dmv_client.lua',
	--
	'LICENSE/Weapon/weapon_client.lua',
}
