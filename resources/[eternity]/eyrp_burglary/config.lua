Config = {}

Config.RequiredPolices = 0 --The required amount of polices that needs to be available to do a burglary.
Config.AlertPoliceImmediately = false --Alert the police when you've finished the lockpicking, or you'll need to be quiet inside the house or the police will be alerted.
Config.PoliceJobName = "police" --The name of the police job.
Config.CanPolicesLock = true --Set to true if you wan't that the polices can lock the doors.
Config.PoliceLockButton = 47 --Choose the button when the police lock the door. default: 47
Config.GCPhone = false --Set to true if you use GCPhone, the default phone is esx_phone3 or esx_phone
Config.pNotify = false --Set to true if you use pNotify.
Config.Lockpick = "lockpick" --The name of the lockpick item.
Config.LoseLockpick = true --Set to true if you want that you lose the lockpick when you lockpick.
Config.LockpickTime = math.random(30000, 60000) --Set the lockpick time, set the time in milliseconds.
Config.SearchTime = math.random(15000, 20000) --Set the search time, set the time in milliseconds.
Config.WeaponChance = 1 --The chance that you'll got a weapon when you search.
Config.NothingChance = 30 --The chance that you'll not get anything.

Config.Animations = { ---Don't touch these if you don't know what you're doing...
    Lockpicking = {
        lib = "missheistfbisetup1",
        anim = "hassle_intro_loop_f"
    },
    Searching = {
        scenario = "PROP_HUMAN_BUM_BIN"
    }
}

Config.HouseTypes = {

    GrooveStreet = {
        entering = vector3(346.52, -1012.87, -99.2),
        lootPlaces = {
            { coords = vector3(346.10, -1001.75, -99.2), heading = 90.44, label = "Byrå" },
            { coords = vector3(342.75, -1003.26, -99.2), heading = 181.18, label = "Köksskåp" },
            { coords = vector3(344.13, -1002.12, -99.2), heading = 273.93, label = "Köksskåp" },
            { coords = vector3(339.35, -1003.42, -99.2), heading = 175.61, label = "Byrå" },
            { coords = vector3(338.12, -996.660, -99.2), heading = 91.2, label = "TV-bänk" },
            { coords = vector3(340.64, -996.24, -99.2), heading = 271.88, label = "Soffbord" },
            { coords = vector3(345.3, -996.08, -99.2), heading = 267.29, label = "Bokhylla" },
            { coords = vector3(345.38, -994.19, -99.2), heading = 267.96, label = "Bokhylla" },
            { coords = vector3(351.34, -999.22, -99.2), heading = 182.88, label = "Byrå" },
            { coords = vector3(350.62, -993.5, -99.2), heading = 2.08, label = "Garderob" },
            { coords = vector3(349.18, -994.82, -99.2), heading = 88.52, label = "Nattduksbord" },
            { coords = vector3(347.23, -994.2, -99.2), heading = 89.03, label = "Badrumsskåp" }
        },

        rewards = {
            items = {
                { item = "bandage", amount = math.random(1, 2) },
                { item = "camera", amount = math.random(1, 2) },
                { item = "kepp", amount = math.random(1, 2) },
                { item = "ros", amount = math.random(1, 2) },
                { item = "phone", amount = 1 },
                { item = "lighter", amount = 1 },
                { item = "binoculars", amount = math.random(1, 2) }
            },

            weapons = {
                { weapon = "pistol", type = "gun", bullets = math.random(22, 55) },
                { weapon = "knife", type = "melee" },
                { weapon = "ak47", type = "melee" }
            }
        }
    },

    Franklin = {
        entering = vector3(-14.16, -1440.14, 18.49),
        lootPlaces = {
            { coords = vector3(-9.36, -1441.4, 18.49), heading = 230.15, label = "TV-bänk" },
            { coords = vector3(-12.41, -1434.99, 18.49), heading = 106.11, label = "Bokhylla" },
            { coords = vector3(-12.56, -1436.88, 18.49), heading = 61.17, label = "Bokhylla" },
            { coords = vector3(-16.55, -1434.75, 18.49), heading = 177.08, label = "Nattduksbord" },
            { coords = vector3(-17.66, -1432.17, 18.49), heading = 348.87, label = "Byrå" },
            { coords = vector3(-17.13, -1430.46, 18.49), heading = 98.63, label = "Förråd" },
            { coords = vector3(-11.91, -1428.11, 18.49), heading = 354.4, label = "Köksskåp" },
            { coords = vector3(-12.94, -1429.25, 18.49), heading = 188.18, label = "Städskrub" },
            { coords = vector3(-10.15, -1429.37, 18.49), heading = 269.19, label = "Köksskåp" }
        },

        rewards = {
            items = {
                { item = "bandage", amount = math.random(1, 2) },
                { item = "camera", amount = math.random(1, 2) },
                { item = "kepp", amount = math.random(1, 2) },
                { item = "ros", amount = math.random(1, 2) },
                { item = "phone", amount = 1 },
                { item = "lighter", amount = 1 },
                { item = "binoculars", amount = math.random(1, 2) }
            },

            weapons = {
                { weapon = "pistol", type = "gun", bullets = math.random(22, 55) },
                { weapon = "knife", type = "melee" },
                { weapon = "ak47", type = "melee" }
            }
        }
    },

    Apartments = {
        entering = vector3(266.12, -1007.28, -101.01),
        lootPlaces = {
            { coords = vector3(265.91, -999.35, -99.01), heading = 267.66, label = "Byrå" },
            { coords = vector3(264.06, -995.43, -99.01), heading = 360.0, label = "Köksskåp" },
            { coords = vector3(261.36, -1002.49, -99.01), heading = 0.01, label = "Byrå" },
            { coords = vector3(262.84, -1003.05, -99.01), heading = 264.22, label = "Nattduksbord" },
            { coords = vector3(257.12, -995.59, -99.01), heading = 54.31, label = "TV-bänk" },
            { coords = vector3(265.85, -996.73, -99.01), heading = 270.74, label = "Köksskåp" }
        },

        rewards = {
            items = {
                { item = "bandage", amount = math.random(1, 2) },
                { item = "camera", amount = math.random(1, 2) },
                { item = "kepp", amount = math.random(1, 2) },
                { item = "ros", amount = math.random(1, 2) },
                { item = "phone", amount = 1 },
                { item = "lighter", amount = 1 },
                { item = "binoculars", amount = math.random(1, 2) }
            },

            weapons = {
                { weapon = "pistol", type = "gun", bullets = math.random(22, 55) },
                { weapon = "knife", type = "melee" },
                { weapon = "ak47", type = "melee" }
            }
        }
    },

    Richmans = {
        entering = vector3(117.2, 559.95, 184.3),

        lootPlaces = {
            { coords = vector3(123.0, 557.37, 184.3), heading = 15.37, label = "Köksskåp" },
            { coords = vector3(123.21, 555.36, 184.3), heading = 198.54, label = "Köksskåp" },
            { coords = vector3(118.09, 548.45, 184.1), heading = 99.09, label = "Byrå" },
            { coords = vector3(118.33, 543.95, 183.9), heading = 96.89, label = "Byrå" },
            { coords = vector3(126.19, 543.29, 183.9), heading = 275.6, label = "TV-bänk" },
            { coords = vector3(125.03, 547.67, 184.1), heading = 181.33, label = "Bokhylla" },
            { coords = vector3(116.57, 561.7, 180.5), heading = 52.11, label = "Bokhylla" },
            { coords = vector3(118.43, 543.38, 180.5), heading = 97.5, label = "Byrå" },
            { coords = vector3(126.45, 542.35, 180.52), heading = 280.99, label = "Nattduksbord" },
            { coords = vector3(126.04, 546.11, 180.52), heading = 275.81, label = "Nattduksbord" },
            { coords = vector3(124.5, 556.52, 180.51), heading = 4.34, label = "Badrumsskåp" },
            { coords = vector3(118.11, 564.07, 176.7), heading = 1.5, label = "Bokhylla" }, 
            { coords = vector3(114.18, 560.88, 176.7), heading = 91.04, label = "Bokhylla" },
            { coords = vector3(113.88, 569.29, 176.7), heading = 67.67, label = "Skrivbord" },
            { coords = vector3(119.53, 569.88, 176.7), heading = 275.5, label = "Garderob" }
        },

        rewards = {
            items = {
                { item = "bandage", amount = math.random(1, 2) },
                { item = "camera", amount = math.random(1, 2) },
                { item = "kepp", amount = math.random(1, 2) },
                { item = "ros", amount = math.random(1, 2) },
                { item = "phone", amount = 1 },
                { item = "lighter", amount = 1 },
                { item = "binoculars", amount = math.random(1, 2) }
            },

            weapons = {
                { weapon = "pistol", type = "gun", bullets = math.random(22, 55) },
                { weapon = "knife", type = "melee" },
                { weapon = "ak47", type = "melee" }
            }
        }
    }
}

Config.Strings = {
    ["locked"] = "~r~Låst\n~w~[E] Använd dyrkset.", 
    ["unlocked"] = "~g~Olåst\n~w~[E] Gå in.",
    ["police_lock"] = "[G] Lås dörren.",
    ["leave"]  = "Gå ut.",
    ["search"] = "Sök ~g~%s",
    ["searching"] = "Söker... ~g~%s",
    ["lockpicking"] = "Dyrkar... ~g~%s",
    ["canceled"] = "Du avbröt sökningen.",
    ["canceled_lockpicking"] = "Du avbröt dyrkningen.",
    ["foundnothing"] = "Du hittade ingenting.",
    ["found_weapon"] = "Du hittade <span style='color:yellow'>%s</span> med <span style='color:yellow'>%s</span> skott.",
    ["found_meeleweapon"] = "Du hittade en <span style='color:yellow'>%s</span>.",
    ["found_item"] = "Du hittade <span style='color:yellow'>%s %s</span>.",
    ["not_available"] = "Någon sökte precis här...",
    ["you_locked"] = "Du låste dörren.",
    ["alarm_started"]  = "Larmet startades, polisen har blivit tillkallat.",
    ["already_lockpicking"] = "Någon dyrkar redan...",
    ["not_enough_polices"] = "Det är inga tillräckligt med poliser i tjänst.",
    ["no_lockpick"] = "Du behöver ett dyrkset...",
    ["police_notif"] = "Ett inbrottslarm startades vid %s."
}