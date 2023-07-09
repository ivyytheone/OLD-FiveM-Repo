Config = {}; 

Config.Jobname = 'mechanic'

Config.Jobloctions = {
    BossAction = {
        Text = "Chef meny", 
        Coords = vector3(-344.9884948730469, -129.83128356933597, 39.0096321105957),
    }, 
    
    DressingRoom = {
        Text = 'Omklädnigsrum', 
        Coords = vector3(-345.5638122558594, -122.97689056396484, 39.00962448120117)
    }, 

    SendBilling = {
        Text = 'Skicka faktura', 
        Coords = vector3(-345.7719421386719, -131.9512939453125, 39.00963973999023)
    }, 

    Garage = {
        Text = 'Garage', 
        Coords = vector3(-349.0067138671875, -113.18212127685548, 39.53007278442383)
    }, 

    ParkVehicle = {
        Coords = vector3(-369.4065551757813, -107.80500030517578, 38.68035125732422), 
        Text = 'Parkera fordonet'
    }
}

Config.Clothes = {
	["Mekonomen outfit"] = {
		recruit = {
			male = {
				['tshirt_1'] = 38, ['tshirt_2'] = 0,
				['torso_1'] = 100, ['torso_2'] = 0,
				['decals_1'] = 8, ['decals_2'] = 0,
				['arms'] = 19,
				['pants_1'] = 46, ['pants_2'] = 0,
				['shoes_1'] = 25, ['shoes_2'] = 0,
				['helmet_1'] = -1, ['helmet_2'] = 0,
				['chain_1'] = 1, ['chain_2'] = 0,
				['ears_1'] = -1, ['ears_2'] = 0,
				['bproof_1'] = 0,  ['bproof_2'] = 0,
				['mask_1'] = 11, ['mask'] = 0
			},
			female = {
				['tshirt_1'] = 28, ['tshirt_2'] = 0,
				['torso_1'] = 90, ['torso_2'] = 1,
				['decals_1'] = 7, ['decals_2'] = 0,
				['arms'] = 31,
				['pants_1'] = 48, ['pants_2'] = 0,
				['shoes_1'] = 25, ['shoes_2'] = 0,
				['helmet_1'] = -1, ['helmet_2'] = 0,
				['chain_1'] = 1, ['chain_2'] = 0,
				['ears_1'] = -1, ['ears_2'] = 0,
				['bproof_1'] = 0,  ['bproof_2'] = 0,
				['mask_1'] = 11, ['mask'] = 0
			}
		},
    }
}