Config = {}
Config.Marker = false -- change if you want a marker or not

Config.Ped = {
	Model = `mp_m_shopkeep_01`
}

Config.UseESXNotifications = true

Config.Currency = "SEK" -- change to your own currency
Config.Blip = {
	Name 	= "ICA", -- name on the map
	Sprite 	= 59, -- icon
	Color 	= 4, --color
	Scale 	= 0.8 
}

Config.Shops = {
	vector3(374.20562744141, 327.77850341797, 103.56639099121),
	vector3(25.748945236206, -1345.4937744141, 29.49702835083),
	vector3(-47.25, -1756.58, 29.42),
	vector3(-707.36, -912.83, 19.22),
	vector3(-1224.09, -908.13, 12.33),
	vector3(-1486.07, -380.21, 40.16),
	vector3(1135.3, -980.55, 46.42),
	vector3(1163.33, -322.25, 69.21),
	vector3(2555.08, 382.18, 108.64),
	vector3(-3041.03, 585.11, 7.91),
	vector3(-3243.89, 1001.32, 12.84),
	vector3(-2967.87, 389.3, 15.04),
	vector3(-1821.55, 793.97, 138.12),
	vector3(548.08, 2669.36, 42.16),
	vector3(1167.64, 2709.41, 38.16),
	vector3(2676.91, 3281.38, 55.24),
	vector3(1960.18, 3742.21, 32.36),
	vector3(1390.93, 3604.4, 35.0),
	vector3(1699.44, 4923.41, 42.06),
	vector3(1729.82, 6416.42, 35.04),
}

Config.Tabs = {
	{ 
		Label = "Ätbart", 
		Items = {
			{ label = "Billys Original", item = "billys", image = "https://cdn.discordapp.com/attachments/500758341941985280/835197957660999710/billys.png", price = 15 },	  
			{ label = "Marabou Mjölchoklad", item = "marabou", image = "https://cdn.discordapp.com/attachments/827131287793696808/827144696811487262/48131.png", price = 20 },	
		}
	},
	{ 
		Label = "Dryck", 	
		Items = {
			{ label = "Nocco Miami 33cl", item = "noccomiami", image = "https://cdn.discordapp.com/attachments/827131287793696808/827144467651231774/miami.png", price = 25 },
			{ label = "Coca-Cola 33cl", item = "cola", image = "https://cdn.discordapp.com/attachments/827131287793696808/827147280356343828/sleek_can_coca_cola_original.png", price = 15 },
			{ label = "Redbull 33cl", item = "redbull", image = "https://cdn.discordapp.com/attachments/500758341941985280/835197029848055889/redbull.png", price = 20 },
			{ label = "Fanta Orange 33cl", item = "fanta", image = "https://cdn.discordapp.com/attachments/827131287793696808/827146735910125619/096981800_1609770918_fanta_orange.png", price = 15 },
		}
	},

	{ 
		Label = "Tobak", 	
		Items = {
			{ label = "Winston Röda Långa", item = "winston", image = "https://cdn.discordapp.com/attachments/617817813142208547/808758031663628358/winston-classic.jpg", price = 55 },
			{ label = "Prince Gold Plus", item = "prince", image = "https://cdn.discordapp.com/attachments/617817813142208547/808758799489564682/prince-fine-gold-plus.jpg", price = 65, },

			{ label = "Ettan Orginal Stock", item = "ettanorginalstock", image = "https://cdn.discordapp.com/attachments/617817813142208547/835499156323303484/ettanorginalstock.png", price = 450, },
			{ label = "Ettan Orginal", item = "ettanorginal", image = "https://cdn.discordapp.com/attachments/617817813142208547/835499157874802698/ettanorginal.png", price = 50, },
			{ label = "Ettan Vit Stock", item = "ettanvitstock", image = "https://cdn.discordapp.com/attachments/617817813142208547/835499162601521203/ettanvitstock.png", price = 450, },
			{ label = "Ettan Vit", item = "ettanvit", image = "https://cdn.discordapp.com/attachments/617817813142208547/835499159305977866/ettanvit.png", price = 50, },
		}
	},

	{ 
		Label = "Diverse", 	
		Items = {
			{ label = "iPhone 11", item = "phone", image = "https://cdn.discordapp.com/attachments/500758341941985280/835198240013942784/iphone.png", price = 999 },
			{ label = "Tändare", item = "lighter", image = "https://cdn.discordapp.com/attachments/500758341941985280/835198490388070420/lighter.png", price = 20 },
	    	{ label = "Kikare", item = "binoculars", image = "https://cdn.discordapp.com/attachments/617817813142208547/835498688708608040/binoculars.png", price = 299 },
			{ label = "JBL Boombox", item = "hifi", image = "https://cdn.discordapp.com/attachments/500758341941985280/835198679148134420/hifi.png", price = 2999 },
			{ label = "Käpp", item = "kepp", image = "https://cdn.discordapp.com/attachments/617817813142208547/836294612213170226/kepp.png", price = 399 },
			{ label = "Paraply", item = "paraply", image = "https://cdn.discordapp.com/attachments/617817813142208547/836309178808926228/paraply.png", price = 299 },
		}
	},

	{ 
		Label = "Läkemedel", 	
		Items = {
			{ label = "Alvedon 500mg", item = "alvedon", image = "https://cdn.discordapp.com/attachments/617817813142208547/836306448819552266/alvedon.png", price = 299 },
			{ label = "Orifarm 500mg", item = "orifarm", image = "https://cdn.discordapp.com/attachments/617817813142208547/836306761874407514/orifarm.png", price = 299 },
			{ label = "Bandage", item = "bandage", image = "https://i.imgur.com/WOafQkX.png", price = 149 },
		}
	},
}

Strings = {
	eText = "~INPUT_CONTEXT~ Öppna ~b~%s",
	DropText = "Sug kuk på ringmorgon",
	Bought = "Du köpte ~y~1 %s för %s SEK"
}