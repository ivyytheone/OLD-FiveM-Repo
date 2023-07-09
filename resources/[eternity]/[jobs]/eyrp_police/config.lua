Config = {}; 
 
Config.Align = "top-right" 

Config.Joblocations = {
    Dressing = {
        Coords = vector3(467.2853698730469, -984.2543334960938, 30.69198608398437), 
        Text = "Omklädningsrum"
    }, 

	RakelChange = {
		Coords = vector3(450.1957702636719, -980.5967407226564, 30.68949317932129),
		Text = "Öppna datorn"
	},

	BossAction = {
		Coords = vector3(462.0910949707031, -985.5801391601564, 30.72807502746582), 
		Text = "Chef panel"
	}, 

	Computer = {
		Coords = vector3(442.80755615234375, -981.9624633789064, 30.68950462341308),  
		Text = "Dator"
	},

	Print = {
		Coords = vector3(450.4491271972656, -989.5234985351564, 30.68951225280761),
		Text = "Skrivare"
	},

	Keys = {
		Coords = vector3(469.07086181640625, -974.6918334960938, 26.27327346801757), 
		Text = "Hämta ut nyckel"
	},

	Policebadge = {
		Coords = vector3(451.8480529785156, -999.125732421875, 30.72134780883789),
		Text = "Polisbricka"
	},

	BoatGarage = {
		Coords = vector3(-796.727783203125, -1511.8328857421875, 1.59521460533142),
		SpawnPos = vector3(-797.217529296875, -1502.914306640625, 0.88165837526321),
		Heading = 108.84194946289064,
		Vehicle = 'predator',
		Text = "Båtgarage"
	},

	HelicopterGarage = {
		Coords = vector3(454.3323059082031, -985.9485473632812, 43.69140625),  
		SpawnPos = vector3(449.3264770507813, -981.2835693359376, 43.69141006469726), 
		Heading = 92.36848449707033,
		Text = "Garage"
	}, 

	HelicopterPark = {
		Coords = vector3(449.2301025390625, -981.352783203125, 43.69137573242187), 
		Text = "Parkera"
	},
}  

Config.Menu = {
	Props = {
		{
			label = "Barriär",
			action = "barrier",
			prop = 'prop_barrier_work05',
		},

		{
			label = "Spikmatta",
			action = "spik",
			prop = 'p_ld_stinger_s'
		},

		{
			label = "Varningstält: Olycka",
			action = "olycka",
			prop = 'ba_prop_battle_champ_open_02',
		},

		{
			label = "Varningstält: Polisen",
			action = "polisenTalt",
			prop = 'ba_prop_battle_champ_closed_03'
		},

		{
			label = "Varningstält: Spikmatta",
			action = "spikTalt",
			prop = 'ba_prop_battle_champ_closed_02'
		}
	} 

}

Config.Vehicles = {
	{
		label = "Polis bil", 
		model = "m2"
	}
} 

Config.Helicopter = 'polmav'


Config.Clothes = {
	["Polisuniform"] = {
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

		officer = {
			male = {
				['tshirt_1'] = 38, ['tshirt_2'] = 0,
				['torso_1'] = 100, ['torso_2'] = 1,
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

		sergeant = {
			male = {
				['tshirt_1'] = 38, ['tshirt_2'] = 0,
				['torso_1'] = 100, ['torso_2'] = 2,
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

		lieutenant = {
			male = {
				['tshirt_1'] = 38, ['tshirt_2'] = 0,
				['torso_1'] = 100, ['torso_2'] = 3,
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
				['torso_1'] = 90, ['torso_2'] = 2,
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

		chief = {
			male = {
				['tshirt_1'] = 38, ['tshirt_2'] = 0,
				['torso_1'] = 100, ['torso_2'] = 3,
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
				['torso_1'] = 90, ['torso_2'] = 4,
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

		boss = {
			male = {
				['tshirt_1'] = 38, ['tshirt_2'] = 0,
				['torso_1'] = 100, ['torso_2'] = 3,
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
				['torso_1'] = 90, ['torso_2'] = 4,
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
		}
	},

	["Skyddsvästar"] = {
		slider = true,
		recruit = {
			male = {
				{ ['bproof_1'] = 0,  ['bproof_2'] = 0, },
				{ ['bproof_1'] = 15,  ['bproof_2'] = 0, },
				{ ['bproof_1'] = 15,  ['bproof_2'] = 1, },
				{ ['bproof_1'] = 12,  ['bproof_2'] = 0, }
			},
			female = {
				{ ['bproof_1'] = 0,  ['bproof_2'] = 0, },
				{ ['bproof_1'] = 17,  ['bproof_2'] = 0, },
				{ ['bproof_1'] = 17,  ['bproof_2'] = 1, },
				{ ['bproof_1'] = 17,  ['bproof_2'] = 2, }
			}
		},

		chief = {
			male = {
				{ ['bproof_1'] = 0,  ['bproof_2'] = 0, },
				{ ['bproof_1'] = 15,  ['bproof_2'] = 0, },
				{ ['bproof_1'] = 15,  ['bproof_2'] = 1, },
				{ ['bproof_1'] = 12,  ['bproof_2'] = 0, },
				{ ['bproof_1'] = 15,  ['bproof_2'] = 2, },
			},
			female = {
				{ ['bproof_1'] = 0,  ['bproof_2'] = 0, },
				{ ['bproof_1'] = 17,  ['bproof_2'] = 0, },
				{ ['bproof_1'] = 17,  ['bproof_2'] = 1, },
				{ ['bproof_1'] = 17,  ['bproof_2'] = 2, },
				{ ['bproof_1'] = 18,  ['bproof_2'] = 0, },
				{ ['bproof_1'] = 18,  ['bproof_2'] = 1, }
			}
		},

		boss = {
			male = {
				{ ['bproof_1'] = 0,  ['bproof_2'] = 0, },
				{ ['bproof_1'] = 15,  ['bproof_2'] = 0, },
				{ ['bproof_1'] = 15,  ['bproof_2'] = 1, },
				{ ['bproof_1'] = 12,  ['bproof_2'] = 0, },
				{ ['bproof_1'] = 15,  ['bproof_2'] = 2, },
			},
			female = {
				{ ['bproof_1'] = 0,  ['bproof_2'] = 0, },
				{ ['bproof_1'] = 17,  ['bproof_2'] = 0, },
				{ ['bproof_1'] = 17,  ['bproof_2'] = 1, },
				{ ['bproof_1'] = 17,  ['bproof_2'] = 2, },
				{ ['bproof_1'] = 18,  ['bproof_2'] = 0, },
				{ ['bproof_1'] = 18,  ['bproof_2'] = 1, }
			}
		},
	},

	["Motorcykelsuniform"] = {
		recruit = {
			male = {
				['tshirt_1'] = 15, ['tshirt_2'] = 0,
				['torso_1'] = 220, ['torso_2'] = 0,
				['decals_1'] = -1, ['decals_2'] = 0,
				['arms'] = 20,
				['pants_1'] = 59, ['pants_2'] = 9,
				['shoes_1'] = 25, ['shoes_2'] = 0,
				['helmet_1'] = 62, ['helmet_2'] = 8,
				['chain_1'] = 1, ['chain_2'] = 0,
				['ears_1'] = -1, ['ears_2'] = 0,
				['bproof_1'] = 0,  ['bproof_2'] = 0,
				['mask_1'] = 11, ['mask'] = 0
			},
			female = {
				['tshirt_1'] = 15, ['tshirt_2'] = 0,
				['torso_1'] = 220, ['torso_2'] = 0,
				['decals_1'] = 8, ['decals_2'] = 0,
				['arms'] = 20,
				['pants_1'] = 59, ['pants_2'] = 9,
				['shoes_1'] = 25, ['shoes_2'] = 0,
				['helmet_1'] = 62, ['helmet_2'] = 8,
				['chain_1'] = 1, ['chain_2'] = 0,
				['ears_1'] = -1, ['ears_2'] = 0,
				['bproof_1'] = 0,  ['bproof_2'] = 0,
				['mask_1'] = 11, ['mask'] = 0
			}
		}
	},

	["Insatsuniform"] = {
		recruit = {
			male = {
				['tshirt_1'] = 38,  ['tshirt_2'] = 0,
				['torso_1'] = 243,   ['torso_2'] = 0,
				['decals_1'] = 8,   ['decals_2'] = 0,
				['arms'] = 31,
				['pants_1'] = 59,   ['pants_2'] = 9,
				['shoes_1'] = 25,   ['shoes_2'] = 0,
				['helmet_1'] = 39,  ['helmet_2'] = 0,
				['chain_1'] = 1, ['chain_2'] = 0,
				['ears_1'] = 21,     ['ears_2'] = 0,
				['bproof_1'] = 12,  ['bproof_2'] = 0,
				['mask_1'] = 52,    ['mask_2'] = 0
			},
			female = {
				['tshirt_1'] = 38,  ['tshirt_2'] = 0,
				['torso_1'] = 243,   ['torso_2'] = 0,
				['decals_1'] = 8,   ['decals_2'] = 0,
				['arms'] = 31,
				['pants_1'] = 59,   ['pants_2'] = 9,
				['shoes_1'] = 25,   ['shoes_2'] = 0,
				['helmet_1'] = 39,  ['helmet_2'] = 0,
				['chain_1'] = 1, ['chain_2'] = 0,
				['ears_1'] = 21,     ['ears_2'] = 0,
				['bproof_1'] = 16,  ['bproof_2'] = 2,
				['mask_1'] = 54,    ['mask_2'] = 0
			}
		}
	},
	["Vinteruniform"] = {
		recruit = {
			male = {
				['tshirt_1'] = 38, ['tshirt_2'] = 0,
				['torso_1'] = 251, ['torso_2'] = 0,
				['decals_1'] = 0, ['decals_2'] = 0,
				['arms'] = 17,
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
				['torso_1'] = 251, ['torso_2'] = 1,
				['decals_1'] = 0, ['decals_2'] = 0,
				['arms'] = 31,
				['pants_1'] = 48, ['pants_2'] = 0,
				['shoes_1'] = 25, ['shoes_2'] = 0,
				['helmet_1'] = -1, ['helmet_2'] = 0,
				['chain_1'] = 1, ['chain_2'] = 0,
				['ears_1'] = -1, ['ears_2'] = 0,
				['bproof_1'] = 0,  ['bproof_2'] = 0,
				['mask_1'] = 11, ['mask'] = 0
			}
		}
	},
	["Långärmad"] = {
		recruit = {
			male = {
				['tshirt_1'] = 38, ['tshirt_2'] = 0,
				['torso_1'] = 98, ['torso_2'] = 0,
				['decals_1'] = 0, ['decals_2'] = 0,
				['arms'] = 17,
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
				['torso_1'] = 98, ['torso_2'] = 1,
				['decals_1'] = 0, ['decals_2'] = 0,
				['arms'] = 31,
				['pants_1'] = 48, ['pants_2'] = 0,
				['shoes_1'] = 25, ['shoes_2'] = 0,
				['helmet_1'] = -1, ['helmet_2'] = 0,
				['chain_1'] = 1, ['chain_2'] = 0,
				['ears_1'] = -1, ['ears_2'] = 0,
				['bproof_1'] = 0,  ['bproof_2'] = 0,
				['mask_1'] = 11, ['mask'] = 0
			}
		}
	}
}