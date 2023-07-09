Config                            = {}

Config.DrawDistance               = 100.0
Config.MarkerColor                = { r = 150, g = 0, b = 0 }
Config.MarkerSize                 = { x = 1.2, y = 1.2, z = 1.0 }
Config.ReviveReward               = 0  -- revive reward, set to 0 if you don't want it enabled
Config.AntiCombatLog              = true -- enable anti-combat logging?
Config.NPCJobEarnings =           {min = 150, max = 300}
Config.LoadIpl                    = false -- disable if you're using fivem-ipl or other IPL loaders
Config.Locale                     = 'sv'

local second = 1000
local minute = 60 * second

-- How much time before auto respawn at hospital
Config.RespawnDelayAfterRPDeath   = 20 * minute

-- How much time before a menu opens to ask the player if he wants to respawn at hospital now
-- The player is not obliged to select YES, but he will be auto respawn
-- at the end of RespawnDelayAfterRPDeath just above.
Config.RespawnToHospitalMenuTimer   = true
Config.MenuRespawnToHospitalDelay   = 10 * minute

Config.EnablePlayerManagement       = true
Config.EnableSocietyOwnedVehicles   = false

Config.RemoveWeaponsAfterRPDeath    = true
Config.RemoveCashAfterRPDeath       = true
Config.RemoveItemsAfterRPDeath      = true

-- Will display a timer that shows RespawnDelayAfterRPDeath time remaining
Config.ShowDeathTimer               = true

-- Will allow to respawn at any time, don't use with RespawnToHospitalMenuTimer enabled!
Config.EarlyRespawn                 = false
-- The player can have a fine (on bank account)
Config.RespawnFine                  = false
Config.RespawnFineAmount            = 200

Config.Blip = {
	Pos     = { x = 307.76, y = -590.84, z = 43.29 },
	Sprite  = 61,
	Display = 4,
	Scale   = 1.2,
	Colour  = 2,
}

Config.HelicopterSpawner = {
	SpawnPoint = { x = 313.33, y = -1465.2, z = 45.5 },
	Heading    = 0.0
}

-- https://wiki.fivem.net/wiki/Vehicles
Config.AuthorizedVehicles = {

	{
		model = 'ambulance',
		label = 'Mercedes Sprinter Ambulans'
	},
	{
		model = 'fbi',
		label = 'Mercedes Akutbil'
	}

}

Config.VirusWear = {
	male = {
		['tshirt_1'] = 62,  ['tshirt_2'] = 3,
		['torso_1'] = 67,   ['torso_2'] = 3,
		['decals_1'] = 0,   ['decals_2'] = 0,
		['arms'] = 86,
		['pants_1'] = 40,   ['pants_2'] = 3,
		['shoes_1'] = 62,   ['shoes_2'] = 4,
		['helmet_1'] = -1,  ['helmet_2'] = 0,
		['chain_1'] = 0,    ['chain_2'] = 0,
		['glasses_1'] = 0,  ['glasses_2'] = 0,
		['bproof_1'] = 0,   ['bproof_2'] = 0,
		['bags_1'] = 36,    ['bags_2'] = 0,
		['mask_1'] = 46,    ['mask_2'] = 0,
		['ears_1'] = 0,     ['ears_2'] = 0
	},
	female = {
		['tshirt_1'] = 43,  ['tshirt_2'] = 3,
		['torso_1'] = 61,   ['torso_2'] = 3,
		['decals_1'] = 0,   ['decals_2'] = 0,
		['arms'] = 101,
		['pants_1'] = 40,   ['pants_2'] = 3,
		['shoes_1'] = 65,   ['shoes_2'] = 4,
		['helmet_1'] = -1,  ['helmet_2'] = 0,
		['chain_1'] = 0,    ['chain_2'] = 0,
		['glasses_1'] = 5,  ['glasses_2'] = 0,
		['bproof_1'] = 0,   ['bproof_2'] = 0,
		['bags_1'] = 36,    ['bags_2'] = 0,
		['mask_1'] = 46,    ['mask_2'] = 0,
		['ears_1'] = 0,     ['ears_2'] = 0
	}
  }


Config.Zones = {

	--HospitalInteriorEntering1 = { -- huvud ingång
	--	Pos	= { x = 334.17, y = -569.92, z = 42.32 },
	--	Type = 1
	--},

	--HospitalInteriorInside1 = {
	--	Pos	= { x = 272.8, y = -1358.8, z = 23.5 },
	--	Type = -1
	--},

	--HospitalInteriorOutside1 = {
	--	Pos	= { x = 333.29, y = -572.01, z = 42.32 },
	--	Type = -1
	--},

	--HospitalInteriorExit1 = {
	--	Pos	= { x = 275.51, y = -1361.23, z = 23.54 },
	--	Type = 1
	--},

	--HospitalInteriorEntering2 = { -- Lift go to the roof
	--	Pos	= { x = 315.53, y = -593.83, z = 42.29 },
	--	Type = -1
	--},

	HospitalInteriorInside2 = { -- Roof outlet
	    Pos	= { x = 311.49, y = -589.32, z = 42.29 },
		Type = -1
	},

--	HospitalInteriorOutside2 = { -- Lift back from roof
--		Pos	= { x = 317.35,	y = -583.7, z = 42.29 },
--		Type = -1
--	},

--	HospitalInteriorExit2 = { -- Roof entrance
--	    Pos	= { x = 338.51,	y = -583.83, z = 74.17 },
--		Type = 2
--	},

	AmbulanceActions = { -- Cloakroom
		Pos	= { x = 299.05, y = -598.26, z = 42.30 },
		Type = 25
	},

	VehicleSpawner = {
		Pos	= { x = 334.06, y = -561.4, z = 28.74-0.95 },
		Type = 25
	},

	VehicleSpawnPoint = {
		Pos	= { x = 341.82, y = -560.49, z = 28.74 },
		Type = -1
	},

	VehicleDeleter = {
		Pos	= { x = 329.67, y = -556.06, z = 28.74 },
		Type = 36
	},

	Pharmacy = {
		Pos	= { x = 309.54, y = -569.24, z = 42.30 },
		Type = 1
	}

--	ParkingDoorGoOutInside = {
--		Pos	= { x = 234.56, y = -1373.77, z = 20.97 },
--		Type = 1
--	},

--	ParkingDoorGoOutOutside = {
--		Pos	= { x = 320.98, y = -1478.62, z = 28.81 },
--		Type = -1
--	},

--	ParkingDoorGoInInside = {
--		Pos	= { x = 238.64, y = -1368.48, z = 23.53 },
--		Type = -1
--	},

--	ParkingDoorGoInOutside = {
--		Pos	= { x = 317.97, y = -1476.13, z = 28.97 },
--		Type = 1
--	},

--	StairsGoTopTop = {
--		Pos	= { x = 251.91, y = -1363.3, z = 38.53 },
--		Type = -1
--	},

--	StairsGoTopBottom = {
--		Pos	= { x = 237.45, y = -1373.89, z = 26.30 },
--		Type = -1
--	},

--	StairsGoBottomTop = {
	--	Pos	= { x = 256.58, y = -1357.7, z = 37.30 },
--		Type = -1
--	},

	--StairsGoBottomBottom = {
	--	Pos	= { x = 235.45, y = -1372.89, z = 26.30 },
	--	Type = -1
	
}

Config.JobLocations = {
	
	{x = 296.6, y = -581.55, z = 42.73},
}

