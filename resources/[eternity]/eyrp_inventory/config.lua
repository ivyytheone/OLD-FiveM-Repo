Config = {};

Config.Items = {
    ['radio'] = { 
        label = 'Sepura SC2020', 
        image = 'https://cdn.discordapp.com/attachments/617817813142208547/836309368542461982/radio.png', 
        startData = { frequency = 0 }, 
        prop = 'prop_cs_hand_radio', 
        description = 'Sepura SC20-serien är banbrytande, mångsidig och kombinerar uppdragskritisk säkerhet och TETRA-funktioner med andra databärare, exempelvis LTE och Wi-Fi. SC2024 Baspaket på 380-430MHz levereras som standard med GPS, batteri och antenn. Terminalen är förberedd för Bluetooth™, Wi-Fi och klass 3 RF-uteffekt.<br><br><span style="font-weight:bold">Frekevns: @frequency</span>', 
        buttons = {
            { icon = 'close', color = '#d13333', func = function(source, data)
                TriggerClientEvent('eyrp_radio:LeaveRadio', source, data)
            end },
    
            { icon = 'play_arrow', color = '#0cd427', func = function(source, data)
                TriggerClientEvent('eyrp_radio:JoinRadio', source, data)
            end },
    
            { label = 'Frekvens', color = '#33a2d1', func = function(source, data)
                exports['eyrp_inventory']:CloseInventory(source);
                TriggerClientEvent('eyrp_radio:ChangeFrequency', source, data)
            end },
        }},

    --DIVERSE

    ['bandage'] = {
        label = 'Bandage',
        image = 'https://i.imgur.com/WOafQkX.png',
        description = 'En bunt bandage.<br><br><span style="font-weight: bold">@maxBandage rullar kvar.</span>', 
        startData = { maxBandage = 10 }, 
        buttons = {
            { label = 'Använd', color = '#33a2d1', func = function(source, data)   
                exports['eyrp_inventory']:CloseInventory(source);
                TriggerClientEvent("eyrp_core:UseBanage", source, data , "prop_ld_health_pack")
            end },
        }
    },

    ['fishingrod'] = {
        label = 'Fiskespö',
        image = 'https://purepng.com/public/uploads/medium/purepng.com-fishing-rodfishing-polefishingpolefishing-rodrod-1701528136466jwte8.png',
        description = '',
        prop = "prop_fishing_rod_01",
        useable = true
    },

    ['fishbait'] = {
        label = 'Fiskebete',
        image = 'https://i.imgur.com/0NVEJBt.png',
        description = '',
        prop = "prop_starfish_01",
    },

    ['bag'] = {
        label = 'Väska', 
        image = 'https://cdn.discordapp.com/attachments/788646237259431969/860508816445145088/nike-club-team-swoosh-backpack-bag-png-favpng-3sv7HXEjB7zaX3qeLWA1nemHq-removebg-preview.png', 
        description = 'En rimlig väska där du kan förvara saker.', 
        prop = 'prop_cs_heist_bag_02', 
        buttons = {
            { label = 'Öppna väskan', color = '#33a2d1', func = function(source, data)   
                exports['eyrp_inventory']:CloseInventory(source);
                TriggerClientEvent('eyrp_core:openBag', source, data)
            end }, 
        }
    }, 

    ['handcuffs'] = {
        label = 'Handfängsel',
        image = 'https://cdn.discordapp.com/attachments/782453597928423464/870814922399940648/np_hand-cuffs.png',
        description = 'Ingen information.',
    },

    ['sidavbitare'] = {
        label = 'Sidavbitare',
        image = 'https://cdn.discordapp.com/attachments/782453597928423464/870815216601022494/150335-removebg-preview.png',
        description = 'Ingen information.',
    },

    ['key_grove'] = {
        label = 'Nyckel',
        image = 'https://cdn.discordapp.com/attachments/775820543638896701/844965641618063430/key_building.png',
        description = 'Nyckel till <span style="font-weight:bold">Forum DR </span>',
        useable = true
    },

    ['key'] = {
        label = 'Nyckel',
        image = 'https://cdn.discordapp.com/attachments/775820543638896701/844965641618063430/key_building.png',
        description = 'Adress: @adress',
    },

    ['camera'] = {
        label = 'Canon EOS R6',
        image = 'https://cdn.discordapp.com/attachments/617817813142208547/843852216729075732/canon.png',
        description = 'Canon EOS (Electro-Optical System) är en produktfamilj som innefattar Canons modernare spegelreflexkameror (även kallat systemkameror) och kringutrustning. EOS-systemet lanserades 1987 med Canon EOS 650 och beteckningen används än idag för Canons digitala spegelreflexkameror. I samband med lanseringen av EOS-systemet lanserades också en ny serie objektiv, EF-serien, med autofokusmotorn i objektivet, där all kommunikation mellan objektiv och kamerahus skedde helt elektroniskt.',
        useable = true
    },

    ['bigcamera'] = {
        label = 'Sony HXR-MC2500J',
        image = 'https://cdn.discordapp.com/attachments/841036909965738024/848223741312761887/bigcamera.png',
        description = 'HXR-MC2500 är en axelkamera som ger ett professionellt intryck både till utseende och handhavande och är idealisk för bröllop, företagsevent och i utbildningsmiljöer. Kameran har ett internminne på 32GB och tillsammans med ett externt minneskort (säljs separat) får du ett flexibelt arbetsflöde och möjliggör inspelning på båda medierna samtidigt för säkerhet eller för att utöka minneskapaciteten.',
        useable = true
    },

    ['krycka'] = {
        label = 'Krycka',
        image = 'https://cdn.discordapp.com/attachments/617817813142208547/842444288934543420/32372.jpg',
        description = 'En vacker krycka',
        useable = true
    },

    ['hifi'] = {
        label = 'JBL Boombox',
        image = 'https://cdn.discordapp.com/attachments/617817813142208547/836306850802434108/hifi.png',
        useable = true,
        description = 'Scenen fritt för kraftpaketet: JBL Boombox 2 övertygar med klart ljud och djup, kraftfull bas. Med soundboxen kan inte bara flera bluetooth aktiverade enheter – såsom smartphones eller surfplattor, men kan också laddas ytterligare. Tack vare det kraftfulla batteriet är du inte tycker om musik. Gränser inställd: Det laddade batteriet säkerställer upp till 24 timmars favoritmusik - och platsen spelar ingen roll alls. Vare sig vid poolen, i trädgården eller på stranden – njuta av musik är möjligt både inomhus och utomhus. Flera partyboost-kompatibla enheter kan anslutas till varandra med partyboost – för att helt enkelt få alla fester att rulla.'
    },

    ['hackkit'] = {
        label = 'Hackningskit',
        image = 'https://cdn.discordapp.com/attachments/797647971516678174/864989998675787796/Hak5_SDR-RF-bundle-removebg-preview.png',
        description = 'Hackningskit gör så du kan hacka fordon.', 
        buttons = {
            { label = 'Använd', color = '#42a5f5', func = function(Source, Data)
                TriggerClientEvent('lowkey_hotwiring:hackVehicle', source)
            end }
        }
    }, 

    ['paraply'] = {
        label = 'Paraply',
        image = 'https://cdn.discordapp.com/attachments/617817813142208547/836309178808926228/paraply.png',
        useable = true,
        description = 'Bra att ha när det regnar'
    },

    ['dl'] = {
        label = 'Dagens Lunch',
        prop = 'prop_food_tray_03',
        image = 'https://cdn.discordapp.com/attachments/842922981943672843/842925810884804628/matbricka.png',
        description = 'Dagens lunch innehåller en nybakad baguette med närodlad krispig isbergssallad samt en uppfriskande samt kryddig salsasås. Tillbehör såsom en stor Coca Cola med 3 isbitar direkt från island.',
        buttons = {
            { label = 'Använd', color = '#f2a530', func = function(source, data)
                exports['eyrp_inventory']:CloseInventory(source);
                local Options = {
                    Prop = 'prop_sandwich_01',
                    Animation = {
                        Dict = 'mp_player_inteat@burger',
                        Lib = 'mp_player_int_eat_burger_fp'
                    },
                    Bone = {
                        Index = 18905,
                        X = 0.12,
                        Y = 0.028,
                        Z = 0.001,
                        XR = 10.0,
                        YR = 175.0,
                        ZR = 0.0
                    }
                },

                print(json.encode(Options))
                TriggerClientEvent('eyrp_core:onEat', source, data, Options)
            end },
        }
    },

    ['policekey'] = { 
        label = 'Passerkort', 
        image = 'https://cdn.discordapp.com/attachments/760946792366997516/842582629286281226/policekey.png', 
        prop = 'prop_cs_business_card', 
        description = 'Passerkort till <span style="font-weight:bold">Polisstationen</span> <br><br><span style="font-weight: bold">Tillhörande:</span> @name <br><span style="font-weight: bold">Rank:</span> @level' 
    },

    ['hospitalkey'] = { 
        label = 'Passerkort', 
        image = 'https://cdn.discordapp.com/attachments/760946792366997516/842584566085976084/hospitalkey.png', 
        prop = 'prop_cs_business_card', 
        description = 'Passerkort till <span style="font-weight:bold">Sjukhuset</span> <br><br><span style="font-weight: bold">Tillhörande:</span> @firstname @lastname <br><span style="font-weight: bold">Rank:</span> @rank' 
    }, 

    ['motelkey'] = { 
        label = 'Motellnyckel', 
        image = 'https://cdn.discordapp.com/attachments/788646237259431969/861039638108831744/gangkey.png', 
        prop = 'prop_cs_keys_01', 
        description = 'Tillhör: @firstname @lastname (Motellrum #@motelroom)' 
    },

    ['binoculars'] = {
        label = 'Kikare',
        image = 'https://cdn.discordapp.com/attachments/617817813142208547/836309796977901588/binoculars.png',
        useable = true,
        description = 'Kikare'
    },

    ['kepp'] = {
        label = 'Käpp',
        image = 'https://cdn.discordapp.com/attachments/617817813142208547/836294612213170226/kepp.png',
        description = 'En träkäpp',
        useable = true
    }, 

    ['phone'] = {
        label = 'iPhone 11',
        prop = 'prop_amb_phone',
        description = 'Apple iPhone 11 är en mobiltelefon från Apple. Skärmen har en upplösning på 1125x2446. iPhone 11 Pro Maxs kamera har fått en uppdatering, den har extra bra mörkerseende och ett utmärkt HDR-läge för stillbilder.',
        image = 'https://cdn.discordapp.com/attachments/775820543638896701/847643542498967562/iphone.png'
    },

    ['ipad'] = {
        label = 'Ipad 11',
        description = 'Ipad (i kommersiella sammanhang iPad) är en surfplatta, eller en portabel pekdator, från det amerikanska hemelektronikföretaget Apple. Ipad presenterades första gången den 27 januari 2010 av Apples grundare och VD Steve Jobs på en presskonferens i San Francisco.',
        image = 'https://cdn.discordapp.com/attachments/775820543638896701/842132531466076190/ipad.png'
    },

    ['lighter'] = {
        label = 'Tändare',
        image = 'https://cdn.discordapp.com/attachments/617817813142208547/836294613701623829/lighter.png',
        useable = true,
        prop = 'ng_proc_ciglight01a',
        description = 'Tändaren är en liten handhållen anordning för att skapa eld vid behov. Flertalet varianter använder bensin eller lägre kolväten (propan och butan) som bränsle. Bränslet antänds med gnistor som bildas av metall som gnids mot en speciell tändsten när användaren aktiverar enheten. Vissa tändare nyttjar istället mineral som möjliggör piezoelektrisk tändning eller är helt elektroniska och drivs av ett uppladdningsbart batteri.'
    },

    ['alvedon'] = {
        label = 'Alvedon 500mg',
        image = 'https://cdn.discordapp.com/attachments/617817813142208547/836306448819552266/alvedon.png',
        prop = 'r4lle_alvedon',
        startData = { pills = 20 }, 
        description = 'Paracetamol är ett febernedsättande och smärtstillande läkemedel som i Sverige bland annat säljs receptfritt under varunamnen Alvedon, Panodil med fler. Vid föreskriven användning är det ovanligt med biverkningar.<br><br><span style="font-weight: bold">Detta paket innehåller @pills tabletter</span>',
        buttons = {
            { label = 'Använd', color = '#f2a530', func = function(source, data)
                exports['eyrp_inventory']:CloseInventory(source);
                    TriggerClientEvent('eyrp_items:UseMedicItem', source, data, 'r4lle_alvedon')
            end },
        }
    },

    ['pepperspray'] = {
        label = 'Pepparspray',
        image = 'https://personforsvar.se/images/zoom/bg_forsvarspray_farglos_front.png',
        description = 'Ingen information.',
        prop = "w_am_flare",
        buttons = {
            { label = 'Använd', color = '#f2a530', func = function(source, data)
                exports['eyrp_inventory']:CloseInventory(source);
                    TriggerClientEvent('pepperspray:Togglepepperspray', source)
            end },
        }
    },

    ['plate'] = {
        label = 'Regg Plåt',
        image = 'https://cdn.discordapp.com/attachments/617817813142208547/836306448819552266/alvedon.png',
        useable = true,
        prop = 'r4lle_alvedon',
        description = 'Illigal regg = @plate'
    },

    ['orifarm'] = {
        label = 'Orifarm 500mg',
        image = 'https://cdn.discordapp.com/attachments/617817813142208547/836306761874407514/orifarm.png',
        startData = { pills = 20 }, 
        prop = 'r4lle_orifarm',
        description = 'Ibuprofen är en febernedsättande, antiinflammatorisk och smärtstillande medicin, som varken är beroendeframkallande eller narkotikaklassad. Ämnet är ett kortverkande NSAID-preparat och säljs receptfritt på apotek. Namnet ibuprofen är ett teleskopord bildat av delarna i, bu, pro och fen från ämnets systematiska namn 2-(4-isobutylfenyl)propansyra.<br><br><span style="font-weight: bold">Detta paket innehåller @pills tabletter</span>',
        buttons = {
            { label = 'Använd', color = '#f2a530', func = function(source, data)
                exports['eyrp_inventory']:CloseInventory(source);
                    TriggerClientEvent('eyrp_items:UseMedicItem', source, data, 'r4lle_orifarm')
            end },
        }
    },
    

    ['idcard'] = {
        label = 'Identitetskort',
        image = 'https://cdn.discordapp.com/attachments/617817813142208547/836294610741493801/idcard.png', 
        prop = 'p_ld_id_card_002',
        description = '<span style="font-weight: bold">Förnamn:</span> @firstname<br><span style="font-weight: bold">Efternamn:</span> @lastname<br><span style="font-weight: bold">Personummer:</span> @dob<br><span style="font-weight: bold">Kön:</span> @sex<br><span style="font-weight: bold">Längd:</span> @height cm<br><span style="font-weight: bold">Utfärdat:</span> @date',
        buttons = {
            { label = 'Visa', color = '#33a2d1', func = function(source, data)
                exports['eyrp_inventory']:CloseInventory(source);
                TriggerClientEvent('eyrp_idcard:Open', source, data)
            end },
        }
    },

    ['qpark'] = {
        label = 'Qpark Tjänstekort',
        image = 'https://cdn.discordapp.com/attachments/617817813142208547/840607304037695508/qpark.png',
        description = 'Tjänstekort tillhörande <span style="font-weight:bold">Qpark AB</span>.'
    },

    ['policecard'] = {
        label = 'Polisbricka',
        image = 'https://cdn.discordapp.com/attachments/617817813142208547/840609869719666698/police_id.png',
        description = 'Tjänstebevis Polismyndigheten <br><br><span style="font-weight: bold">Tillhörande:</span> @firstname @lastname<br><span style="font-weight: bold">Rakel:</span> @rakel<br><span style="font-weight: bold">Rank:</span> @rank'
    },

    ['paper'] = {
        label = 'Pappersfil',
        image = 'https://cdn.discordapp.com/attachments/617817813142208547/842143790348632064/paper-png.png',
        useable = true,
        description = 'Fil nummer <span style="font-weight: bold">@header</span><br><br><span style="font-weight: bold">Individ:</span> @firstname @lastname<br><span style="font-weight: bold">Personnummer:</span> @dob<br> <span style="font-weight: bold">Datum utfärdat:</span> @date<br>'
    },

    ['lockpick'] = {
        label = 'Dyrkset',
        image = 'https://cdn.discordapp.com/attachments/782453597928423464/865318108101083146/lockpick_kit.png', 
        startData = { durability = 100 },
        description = 'Hållbarhet: @durability / 100',
        buttons = {
            { label = 'Använd', color = '#33a2d1', func = function(source, data)
                exports['eyrp_inventory']:CloseInventory(source);
                TriggerClientEvent('eyrp_burglary:lockpickHouse', source, data)
            end },
        }
    },

    ['teddybear'] = {
        label = 'Teddybjörn',
        image = 'https://cdn.discordapp.com/attachments/617817813142208547/840619444094763020/teddybear.png',
        description = 'En väldigt mjuk teddybjörn'
    },

    ['ros'] = {
        label = 'Ros',
        image = 'https://cdn.discordapp.com/attachments/775820543638896701/840674241619034122/rose.png',
        description = 'En röd ros'
    },

    ['prisonclothes'] = {
        label = 'Fängelsekläder',
        image = 'https://cdn.discordapp.com/attachments/782453597928423464/840936972252086293/prisonclothes.png',
        useable = true,
        description = 'En vacker grå outfit', 
        buttons = {
            { label = 'Använd', color = '#33a2d1', func = function(source, data)
                exports['eyrp_inventory']:CloseInventory(source);
                TriggerClientEvent('al-fangelseklader', source)
            end },
        }
    },

    ['hospitalbag'] = {
        label = 'Väska',
        image = 'https://cdn.discordapp.com/attachments/782453597928423464/840936972252086293/prisonclothes.png',
        description = 'Väska tilhörande <span style="font-weight:bold">Sjukvården Eternity</span>'
    },

    ['hospitalbackpack'] = {
        label = 'Ryggsäck',
        image = 'https://cdn.discordapp.com/attachments/782453597928423464/840936972252086293/prisonclothes.png',
        description = 'Ryggsäck tilhörande <span style="font-weight:bold">Sjukvården Eternity</span>'
    },

    ['policebag'] = {
        label = 'Väska',
        image = 'https://cdn.discordapp.com/attachments/782453597928423464/840936972252086293/prisonclothes.png',
        description = 'Väska tilhörande <span style="font-weight:bold">Polismyndigheten Eternity</span>'
    },

    ['foto'] = {
        label = 'Bild',
        image = 'https://cdn.discordapp.com/attachments/782453597928423464/870823224223617074/hui-PIXA422501_ggfxz4vx-removebg-preview.png',
        description = 'En extremt fin bild.'
    },


    --MAT
    ['bread'] = {
        label = 'Bröd',
        image = 'https://cdn.discordapp.com/attachments/782453597928423464/870815470352232468/np_sandwich.png',
        prop = 'v_ret_247_bread1',
        description = 'En god macka',
                buttons = {
            { label = 'Använd', color = '#f2a530', func = function(source, data)
                exports['eyrp_inventory']:CloseInventory(source);
                local Options = {
                    Prop = 'prop_sandwich_01',
                    Animation = {
                        Dict = 'mp_player_inteat@burger',
                        Lib = 'mp_player_int_eat_burger_fp'
                    },
                    Bone = {
                        Index = 18905,
                        X = 0.12,
                        Y = 0.028,
                        Z = 0.001,
                        XR = 10.0,
                        YR = 175.0,
                        ZR = 0.0
                    }
                },

                print(json.encode(Options))
                TriggerClientEvent('eyrp_core:onEat', source, data, Options)
            end },
        }
    }, 

    ['billys'] = {
        label = 'Billys Original',
        image = 'https://cdn.discordapp.com/attachments/617817813142208547/836306339549937725/billys.png',
        prop = 'billys',
        description = 'Billys avser ett djupfryst färdigmatssortiment bestående av panpizzor och på senare tid även lasagne och pannkakor med fyllning, som säljs i dagligvaruhandeln och servicehandeln i Skandinavien och i Finland. Produkterna produceras av Gunnar Dafgård AB i Källby',
        buttons = {
            { label = 'Använd', color = '#f2a530', func = function(source, data)
                exports['eyrp_inventory']:CloseInventory(source);
                local Options = {
                    Prop = 'billys',
                    Animation = {
                        Dict = 'amb@world_human_seat_wall_eating@male@both_hands@base',
                        Lib = 'base'
                    },
                    Bone = {
                        Index = 18905,
                        X = 0.10,
                        Y = 0.0022,
                        Z = 0.084,
                        XR = 350.0,
                        YR = 125.0,
                        ZR = 0.0
                    }
                },

                print(json.encode(Options))
                TriggerClientEvent('eyrp_core:onEat', source, data, Options)
            end },
        }
    },

    ['marabou'] = {
        label = 'Marabou Mjölkchoklad',
        image = 'https://cdn.discordapp.com/attachments/617817813142208547/836294615917133824/marabou.png',
        prop =  'marabou',
        description = 'Marabou är ett svenskt varumärke för chokladkonfektyr, som ägs av Mondelez International. Marabou etablerades i Sundbyberg 1916 som ett dotterföretag till det norska chokladföretaget Freia.',
        buttons = {
            { label = 'Använd', color = '#f2a530', func = function(source, data)
                exports['eyrp_inventory']:CloseInventory(source);
                local Options = {
                    Prop = 'marabou',
                    Animation = {
                        Dict = 'amb@world_human_seat_wall_eating@male@both_hands@base',
                        Lib = 'base'
                    },
                    Bone = {
                        Index = 18905,
                        X = 0.17,
                        Y = 0.0022,
                        Z = 0.084,
                        XR = 340.0,
                        YR = 125.0,
                        ZR = 0.0
                    }
                },

                print(json.encode(Options))
                TriggerClientEvent('eyrp_core:onEat', source, data, Options)
            end },
        }
    },

    ['kebabrulle'] = {
        label = 'Kebabrulle',
        image = 'https://cdn.discordapp.com/attachments/775820543638896701/840630369799766036/kebabrulle.png',
        prop = 'itap_kebab',
        description = 'Kebab är en maträtt från Mellanöstern, östra Medelhavet och Sydasien innehållande bitar av kött, fisk, eller grönsaker rostade eller grillade på spett. En del restauranger och gatukök tillreder inte köttet själva utan får det levererat.',
        buttons = {
            { label = 'Använd', color = '#f2a530', func = function(source, data)
                exports['eyrp_inventory']:CloseInventory(source);
                local Options = {
                    Prop = 'itap_kebab',
                    Animation = {
                        Dict = 'amb@world_human_seat_wall_eating@male@both_hands@base',
                        Lib = 'base'
                    },
                    Bone = {
                        Index = 18905,
                        X = 0.15,
                        Y = 0.022,
                        Z = 0.084,
                        XR = 280.0,
                        YR = 125.0,
                        ZR = 0.0
                    }
                },

                print(json.encode(Options))
                TriggerClientEvent('eyrp_core:onEat', source, data, Options)
            end },
        }
    },

    ['chokladmunk'] = {
        label = 'Chokladmunk',
        image = 'https://cdn.discordapp.com/attachments/841036909965738024/856256454235652156/chokladmunk.png',
        prop = 'prop_donut_02',
        description = 'Klassisk donut med en chokladglasyr toppad med chokladflakes.',
        buttons = {
            { label = 'Använd', color = '#f2a530', func = function(source, data)
                exports['eyrp_inventory']:CloseInventory(source);
                local Options = {
                    Prop = 'prop_donut_02',
                    Animation = {
                        Dict = 'amb@world_human_seat_wall_eating@male@both_hands@base',
                        Lib = 'base'
                    },
                    Bone = {
                        Index = 18905,
                        X = 0.17,
                        Y = 0.0022,
                        Z = 0.084,
                        XR = 340.0,
                        YR = 125.0,
                        ZR = 0.0
                    }
                },

                print(json.encode(Options))
                TriggerClientEvent('eyrp_core:onEat', source, data, Options)
            end },
        }
    },

    ['ringmunk'] = {
        label = 'Sockermunk',
        prop = 'prop_donut_01',
        image = 'https://cdn.discordapp.com/attachments/500607440228712458/856334368926334976/ringmunk.png',
        description = 'Klassisk, saftig ringmunk täckt med strösocker.',
        buttons = {
            { label = 'Använd', color = '#f2a530', func = function(source, data)
                exports['eyrp_inventory']:CloseInventory(source);
                local Options = {
                    Prop = 'prop_donut_01',
                    Animation = {
                        Dict = 'amb@world_human_seat_wall_eating@male@both_hands@base',
                        Lib = 'base'
                    },
                    Bone = {
                        Index = 18905,
                        X = 0.17,
                        Y = 0.0022,
                        Z = 0.084,
                        XR = 340.0,
                        YR = 125.0,
                        ZR = 0.0
                    }
                },

                print(json.encode(Options))
                TriggerClientEvent('eyrp_core:onEat', source, data, Options)
            end },
        }
    },

    --DRYCK
        
    ['kaffe'] = {
        label = 'Kaffe',
        prop = 'p_amb_coffeecup_01',
        image = 'https://cdn.discordapp.com/attachments/775820543638896701/852339005395042304/kaffe.png',
        description = 'En varm kopp kaffe',
        useable = true
    },

    ['fanta'] = {
        label = 'Fanta Orange 33cl',
        image = 'https://cdn.discordapp.com/attachments/617817813142208547/836294607783592036/fanta.png',
        prop = 'fanta',
        description = 'Fanta är en kolsyrad läskedryck med fruktsmak, producerad av The Coca-Cola Company. Den skapades i Tyskland 1940 som ett alternativ till Coca-Cola. Den mest populära smaken är apelsin, men drycken finns i mer än 100 varianter. Avvikelser i ingredienser och smaker förekommer mellan länder.',
        buttons = {
            { label = 'Använd', color = '#f2a530', func = function(source, data)
                exports['eyrp_inventory']:CloseInventory(source);
                    TriggerClientEvent('eyrp_core:onDrink', source, data, 'fanta')
            end },
        }},

    ['monster'] = {
        label = 'Monster Original 500ml',
        image = 'https://cdn.discordapp.com/attachments/775820543638896701/840675210453975090/monster.png',
        prop = 'itap_monster',
        description = 'Gör som skateåkaren Rob Dyrdek eller snöskotercrossföraren Tucker Hibbert, drick Monster Energi och få extra mycket energi när du behöver det. Monster Energy är från början en amerikansk energidryck som snabbt blivit väldigt populär i Sverige. Den finns i ett antal olika varianter och storlekar men detta är det gröna originalet och innehåller 500 ml per burk.',
        buttons = {
            { label = 'Använd', color = '#f2a530', func = function(source, data)
                exports['eyrp_inventory']:CloseInventory(source);
                    TriggerClientEvent('eyrp_core:onDrink', source, data, 'itap_monster')
            end },
        }},

    ['monster2'] = {
        label = 'Monster Absolutely Zero 500ml',
        image = 'https://cdn.discordapp.com/attachments/617817813142208547/851508324389093426/monster2.png',
        prop = 'itap_monster2',
        description = 'Äntligen kan du äta LCHF och dricka Monsters älskade energidryck samtidigt. Monster Absolutely Zero innehåller inget tillsatt socker och inga onödiga kolorier. Perfekt för att släcka törsten efter ett hårt träningspass.',
        buttons = {
            { label = 'Använd', color = '#f2a530', func = function(source, data)
                exports['eyrp_inventory']:CloseInventory(source);
                    TriggerClientEvent('eyrp_core:onDrink', source, data, 'itap_monster2')
            end },
        }},

    ['monster3'] = {
        label = 'Monster Lewis Hamilton 500ml',
        image = 'https://cdn.discordapp.com/attachments/617817813142208547/851508724740128768/monster3.png',
        prop = 'itap_monster3',
        description = 'När den trefaldiga världsmästaren i F1, Lewis Hamilton, rör sig i 15.000 RPM och 320 km/h behöver han ha en dryck som kan hålla tempot - vilket precis Monster Energy 44 gör. Monster Energy 44 är en unik energidryck framtagen speciellt för och med Lewis Hamilton, för att skapa en energidryck som ökar tempot till det maximala. Med sin ljusa, skarpa och uppfriskande smak kommer du inte att bli besviken.',
        buttons = {
            { label = 'Använd', color = '#f2a530', func = function(source, data)
                exports['eyrp_inventory']:CloseInventory(source);
                    TriggerClientEvent('eyrp_core:onDrink', source, data, 'itap_monster3')
            end },
        }},

    ['redbull'] = {
        label = 'Redbull 25cl',
        prop = 'redbull',
        description = 'Redbull är en energidryck som livar upp kropp och sinne och ger dig vingar när du behöver dem. Drycken uppskattas över hela världen av toppidrottare, studenter, under krävande arbetsdagar och av förare vid långa bilkörningar.',
        image = 'https://cdn.discordapp.com/attachments/617817813142208547/836299255294590986/redbull.png',
        buttons = {
            { label = 'Använd', color = '#f2a530', func = function(source, data)
                exports['eyrp_inventory']:CloseInventory(source);
                    TriggerClientEvent('eyrp_core:onDrink', source, data, 'redbull')
            end },
        }},

    ['noccomiami'] = {
        label = 'Nocco Miami 33cl',
        image = 'https://cdn.discordapp.com/attachments/617817813142208547/836294977696301127/noccomiami.png',
        prop = 'nocco',
        description = 'Nocco Miami! En dryck som har karisma, energi och utseendet för att vinna årets bästa energidryck, helt klart! Om man skall försöka sammanfatta hur denna dryck smakar så kan vi väl säga som såhär: Tänk dig att du precis landat med flyget i Florida, du är trött men trots det oerhört taggad på vad som komma skall. Du tar din första kvällspromenad på South Beach efter en långsam Uberskjuts dit och bestämmer dig för att njuta lite extra mycket av första kvällen. Du är helt ny på stället, men du känner dig ändå hemma på något sätt. ',
        buttons = {
            { label = 'Använd', color = '#f2a530', func = function(source, data)
                exports['eyrp_inventory']:CloseInventory(source);
                    TriggerClientEvent('eyrp_core:onDrink', source, data, 'nocco')
            end },
        }},
    

    ['cola'] = {
        label = 'Coca Cola 33cl',
        image = 'https://cdn.discordapp.com/attachments/617817813142208547/836306093936214077/cola.png',
        prop = 'cola',
        description = 'Coca-Cola är en kolsyrad läskedryck med colasmak som tillverkas av The Coca-Cola Company, grundat 1886 i Atlanta, Georgia, USA. Coca-Cola säljs i olika varianter i länder över hela världen, och är ett av världens starkaste varumärken.',
        buttons = {
            { label = 'Använd', color = '#f2a530', func = function(source, data)
                exports['eyrp_inventory']:CloseInventory(source);
                    TriggerClientEvent('eyrp_core:onDrink', source, data, 'cola')
            end },
        }},

    ['water'] = {
        label = 'Vatten',
        image = 'https://cdn.discordapp.com/attachments/788646237259431969/838388039092142120/water.png',
        prop = 'prop_ld_flow_bottle',
        description = 'En fin vatten flaska',
        buttons = {
            { label = 'Använd', color = '#f2a530', func = function(source, data)
                exports['eyrp_inventory']:CloseInventory(source);
                    TriggerClientEvent('eyrp_core:onDrink', source, data, 'prop_ld_flow_bottle')
            end },
        }},



    ---Tobak
    ['winston'] = {
        label = 'Winston Röda Långa',
        image = 'https://cdn.discordapp.com/attachments/617817813142208547/836294663845052436/winston.png',
        startData = { ciggcount = 20 }, 
        description = 'Winston är ett amerikanskt cigarettmärke som är tillverkas av R.J. Reynolds Tobacco Company. Märket introducerades 1954 och blev snabbt USA:s populäraste märke. Märket Winston är näst störst efter L&M. I Sverige tillverkas och säljs varumärket Winston av tobaksföretaget JTI Sweden AB.<br><br><span style="font-weight: bold">Detta paket innehåller @ciggcount cigaretter</span>',
        prop = 'ng_proc_cigpak01a',
        buttons = {
            { label = 'Ta en cigg', color = '#33a2d1', func = function(source, data)
                exports['eyrp_inventory']:CloseInventory(source);
                TriggerClientEvent('eyrp_tobak:UseCigg', source, data)
            end },
        }},

    ['camel'] = {
        label = 'Camel blå',
        image = 'https://cdn.discordapp.com/attachments/826065663721603102/851268751080423464/camel.png',
        startData = { ciggcount = 20 }, 
        description = 'Camel är ett cigarettmärke som delvis ägs av R.J. Reynolds Tobacco Company. Camel lanserades år 1913 av R.J. Reynolds Tobacco Company. Det första året såldes 1 miljon cigaretter, men redan året efter hade försäljningen stigit till 425 miljoner. Camel är även känt för sina förpackningar som har en bild på en dromedar. Studerar man bilden noga så sägs det att man kan se olika dolda bilder i dromedarens mönster, bland annat Manneken Pis.<br><br><span style="font-weight: bold">Detta paket innehåller @ciggcount cigaretter</span>',
        prop = 'ng_proc_cigpak01a',
        buttons = {
            { label = 'Ta en cigg', color = '#33a2d1', func = function(source, data)
                exports['eyrp_inventory']:CloseInventory(source);
                TriggerClientEvent('eyrp_tobak:UseCigg', source, data)
            end },
        }},

    ['carwash'] = {
        label = 'Tvättsvamp',
        image = 'https://cdn.discordapp.com/attachments/775820543638896701/863858773559214090/sponge.png',
        description = 'Gör din bil skinande ren',
        prop = 'prop_rag_01',
        buttons = {
            { label = 'Tvätta', color = '#00ff00', func = function(source, data)
                exports['eyrp_inventory']:CloseInventory(source);
                TriggerClientEvent('eyrp_items:StartClean', source, data)
            end },
        }},

    ['gulablend'] = {
        label = 'Gula blend',
        image = 'https://cdn.discordapp.com/attachments/826065663721603102/851270354794184714/gulablend.png',
        startData = { ciggcount = 20 }, 
        description = 'Blend är ett svenskt varumärke för cigaretter, som introducerades 1971 av Svenska Tobaks AB. Cigarettmärket introducerades av Svenska tobaks AB för att få ett cigarettmärke med lägre tjärhalt, den första varianten, som kom att kallas gula blend efter färgen på paketet, hade en tjärhalt på 12 mg. Året efter lanserades en variant med mentolsmak, som kallades blåa blend.<br><br><span style="font-weight: bold">Detta paket innehåller @ciggcount cigaretter</span>',
        prop = 'ng_proc_cigpak01a',
        buttons = {
            { label = 'Ta en cigg', color = '#33a2d1', func = function(source, data)
                exports['eyrp_inventory']:CloseInventory(source);
                TriggerClientEvent('eyrp_tobak:UseCigg', source, data)
            end },
        }},
    

    ['ettanvit'] = {
        label = 'Ettan Vit',
        image = 'https://cdn.discordapp.com/attachments/617817813142208547/836294605544357928/ettanvit.png',
        startData = { snuscount = 20 }, 
        description = 'Ettan White Portion är ett white-portionssnus från Ettan. Ettan som är ett av Sveriges äldsta snusmärken, har i stort sett inte förändrats i receptet sedan 1822. Den traditionella tobakssmaken är något mildare vilket gör att de rökiga aromerna lyser igenom. Du anar även inslag av torkat gräs, tjära och malt. Liten hint av mörk choklad kan också träda fram. Portionerna är fyllda med smak, men torra på ytan i sitt white-utförande och erbjuder en lång smakrelease. Tidigare tillverkades Ettan snus av snusfabrikanten Ljunglöf, men på senare år har Swedish Match tagit över tillverkningen.<br><br><span style="font-weight: bold">Denna dosa innehåller @snuscount prillor</span>',
        buttons = {
            { label = 'Stoppa upp en prilla', color = '#33a2d1', func = function(source, data)
                exports['eyrp_inventory']:CloseInventory(source);
                TriggerClientEvent('eyrp_tobak:UseSnus', source, data)
            end },
        }},

    ['granitvitstark'] = {
        label = 'Granit Vit Stark',
        image = 'https://cdn.discordapp.com/attachments/617817813142208547/851507200022544454/granitvitstark.png',
        startData = { snuscount = 20 }, 
        description = 'Granit Stark Vit är ett snus med kraftig tobakskaraktär som ger en större upplevelse. I vita portioner bibehålls fukten inuti prillan för att ge en långvarig snusupplevelse med låg rinnighet. Granit snus tillverkas av Fiedler och Lundgren här i Sverige och finns i många olika utföranden.<br><br><span style="font-weight: bold">Denna dosa innehåller @snuscount prillor</span>',
        buttons = {
            { label = 'Stoppa upp en prilla', color = '#33a2d1', func = function(source, data)
                exports['eyrp_inventory']:CloseInventory(source);
                TriggerClientEvent('eyrp_tobak:UseSnus', source, data)
            end },
    }},

    ['rodalacket'] = {
        label = 'Röda Lacket',
        image = 'https://cdn.discordapp.com/attachments/826065663721603102/851268158450171954/roda.png',
        startData = { snuscount = 20 }, 
        description = 'Röda Lacket Lös har varit med länge på den svenska snusscenen! Smaken har inslag av fruktighet och tobaken är relativt mild och bränner inte så starkt. Röda Lacket är känd för att vara enkel att baka, vilket beror på att den är mycket finkorning.<br><br><span style="font-weight: bold">Denna dosa innehåller @snuscount gram snus</span>',
        buttons = {
            { label = 'Stoppa upp en prilla', color = '#33a2d1', func = function(source, data)
                exports['eyrp_inventory']:CloseInventory(source);
                TriggerClientEvent('eyrp_tobak:UseSnus', source, data)
            end },
    }},

    ['ettanoriginal'] = {
        label = 'Ettan Original',
        image = 'https://cdn.discordapp.com/attachments/617817813142208547/851169778785583114/ettanoriginal.png',
        startData = { snuscount = 20 }, 
        description = 'Ettan Portion är det närmsta du kan komma den traditionella smaken i Ettan lös i portionsform. Ettan som är ett av Sveriges äldsta snusmärken, har i stort sett inte förändrats i receptet sedan 1822. Den traditionella tobakssmaken är något mildare vilket gör att de rökiga aromerna lyser igenom. Du anar även inslag av torkat gräs, tjära och malt. Liten hint av mörk choklad kan också lysa igenom. Portionerna är fyllda med smak och erbjuder en lång smakrelease.<br><br><span style="font-weight: bold">Denna dosa innehåller @snuscount prillor</span>',
        buttons = {
            { label = 'Stoppa upp en prilla', color = '#33a2d1', func = function(source, data)
                exports['eyrp_inventory']:CloseInventory(source);
                TriggerClientEvent('eyrp_tobak:UseSnus', source, data)
            end },
        }
    },
    
    

    ['prince'] = {
        label = 'Prince Fine Gold Plus',
        image = 'https://cdn.discordapp.com/attachments/617817813142208547/836309582035943444/prince.png',
        startData = { ciggcount = 20 }, 
        prop = 'ng_proc_cigpak01a',
        description = 'Prince Fine Gold Plus är en ny och uppdaterad variant av den välbekanta Prince Double Filter. En paket innehåller: 20 st.<br><br><span style="font-weight: bold">Detta paket innehåller @ciggcount cigaretter</span>',
        buttons = {
            { label = 'Ta en cigg', color = '#33a2d1', func = function(source, data)
                exports['eyrp_inventory']:CloseInventory(source);
                TriggerClientEvent('eyrp_tobak:UseCigg', source, data)
            end },
        }},

    ['cigar'] = {
        label = 'Cigarr',
        prop = 'prop_cigar_01',
        image = 'https://cdn.discordapp.com/attachments/617817813142208547/837379648320438312/cigar.png',
        description = 'Cigarr är ett rökverk tillverkat av fermenterad (genom jäsningsprocesser förädlad) och ofta lagrad tobak, rullad i ett eller flera tobaksblad. Fermentationen reducerar sockerhalten och bryter även ner proteiner. Detta gör att röken blir basisk, vilket i sin tur medför att nikotinet, som är en alkaloid, uppträder fritt i röken. Nikotinet kan därför upptas direkt i munnens slemhinnor, och röken behöver därför inte dras ner i lungorna för att få samma upptagning av nikotin.',
        buttons = {
            { label = 'Rök', color = '#eb9234', func = function(source, data)
                exports['eyrp_inventory']:CloseInventory(source);
                TriggerClientEvent('eyrp_tobak:Cigar', source, data)
            end },
        }},

    ['ettanvitstock'] = {
        label = 'Ettan vit stock',
        image = 'https://cdn.discordapp.com/attachments/617817813142208547/836294606692810802/ettanvitstock.png',
        startData = { snusdosor = 10  }, 
        description = '<br><br><span style="font-weight: bold">Denna stock innehåller @snusdosor snusdosor</span>',
        buttons = {
            { label = 'Använd', color = '#f2a530', func = function(Source, Data)
                exports['eyrp_inventory']:CloseInventory(source);
                TriggerClientEvent('eyrp_items:UseStock', source, Data, 'ettanvit')
            end }
        }},


    -- Smycken      
    ['silver_necklace'] = {
        label = 'Silverhalsband',
        image = 'https://cdn.discordapp.com/attachments/836345666900066394/836347752966389810/unknown.png',
        description = '', 
        prop = "prop_michael_backpack",
    },

    ['guld_halsband'] = {
        label = 'Guld halsband',
        image = 'https://cdn.discordapp.com/attachments/836345666900066394/864357208534810624/gnecklace.png',
        description = '', 
        prop = "prop_michael_backpack",
    },

    ['rolex_watch'] = {
        label = 'Rolex Klocka',
        image = 'https://cdn.discordapp.com/attachments/836345666900066394/864357309920575518/rolex.png',
        description = '', 
        prop = "prop_michael_backpack",
    },

    ['wellington_watch'] = {
        label = 'Wellington klocka',
        image = 'https://cdn.discordapp.com/attachments/836345666900066394/864358330482163712/klockaa.png',
        description = '', 
        prop = "prop_michael_backpack",
    },

    ['gold_ring'] = {
        label = 'Guldring',
        image = 'https://cdn.discordapp.com/attachments/836345666900066394/836347777872167002/unknown.png',
        description = '', 
        prop = "prop_michael_backpack",
    },

    ['silver_ring'] = {
        label = 'Silverring',
        image = 'https://cdn.discordapp.com/attachments/836345666900066394/864358556315549726/sring.png',
        description = '', 
        prop = "prop_michael_backpack",
    },

    ['diamond_ring'] = {
        label = 'Diamantring',
        image = 'https://cdn.discordapp.com/attachments/836345666900066394/864357380228513802/diamantring.png',
        description = '', 
        prop = "prop_michael_backpack",
    },

    -- Droger
    ['metafetamin'] = {
        label = 'Metamfetamin',
        image = 'https://cdn.discordapp.com/attachments/836345666900066394/843205891925999646/methbag.png',
        useable = true,
        prop = "bkr_prop_meth_openbag_01a"
    },

    ['cannabis'] = {
        label = 'Marijuana',
        image = 'https://cdn.discordapp.com/attachments/836345666900066394/843206243165274122/marijuana.png',
        useable = true,
        prop = "prop_weed_block_01"
    },

    ---VAPEN
    ['pistol'] = {
        label = 'Glock 17',
        image = 'https://cdn.discordapp.com/attachments/617817813142208547/836294658137128980/weapon_pistol.png',
        description = 'Glock GmbH är en vapentillverkare med säte i Deutsch-Wagram i Österrike. Företaget som är uppkallat efter grundaren Gaston Glock är mest känt för sina pistoler, men tillverkar även knivar och fältspadar.<br><br>Ammunition: @ammo',
        weapon = 'weapon_pistol',
    },

    ['ak47'] = {
        label = 'AK - 47',
        image = 'https://cdn.discordapp.com/attachments/782453597928423464/863932727425630258/cybergun-kalashnikov-ak47-tactical-full-stock-kit-removebg-preview.png',
        description = 'AK-47, förkortning av 7,62 mm Automatkarbin Kalasjnikov[a] modell 1947 (ryska: 7,62 мм Автомат Калашникова образца 1947),[2] i Sovjetunionen formellt enbart betecknad 7,62 mm Automatkarbin Kalasjnikov[a] (ryska: 7,62 мм Автомат Калашникова), förkortning AK,[2] även kallad Kalasj, Kalasjmat, Kalasjnikov och liknande, är en sovjetisk automatkarbin i kaliber 7,62 mm som togs i bruk 1949 av Sovjetunionen.<br><br>Ammunition: @ammo',
        weapon = 'weapon_assaultrifle',
    },

    ['carbinerifle'] = {
        label = 'Colt M4A1',
        image = 'https://i.imgur.com/hMiAGYG.png',
        description = 'Ammunition: @ammo',
        weapon = 'weapon_carbinerifle',
    }, 

    ['combatpistol'] = {
        label = 'Sig Sauer P226',
        image = 'https://cdn.discordapp.com/attachments/617817813142208547/836296483543580692/weapon_combatpistol.png',
        description = 'Sig Sauer P226 är en halvautomatisk pistol, känd för sin goda kvalitet. Kalibrar: 9x19mm, .40S&W och .357 SIG. P226s längd är 196mm(7.7 tum) och bredden är 38.1(1.5tum).<br><br>Ammunition: @ammo',
        weapon = 'weapon_combatpistol',
    }, 

    ['smg'] = {
        label = 'MP5',
        image = 'https://cdn.discordapp.com/attachments/617817813142208547/836294659952082974/weapon_smg.png',
        weapon = 'weapon_smg',
        description = 'H&K MP5 är en kulsprutepistol tillverkad av det tyska företaget Heckler & Koch. Kaliber: 9x19mm Parabellum.<br><br>Ammunition: @ammo',
    }, 

    ['flashlight'] = {
        label = 'KLARUS XT21X 4000 LUMENTTT',
        image = 'https://i.imgur.com/Tyymk1i.png',
        weapon = 'weapon_flashlight',
        prop = 'w_me_flashlight',
        description = 'Ficklampa är ett bärbart belysningssverktyg där ljuskällan består av en eller flera elektriska lampor. Den första ficklampan uppfanns 1898. Den var från början handhållen men för stor för att få plats i en ficka, senare under 1900-talet utvecklade varianter i "fickformat". De inbyggda ljuskällorna är numera ofta små kryptonglödlampor eller lysdiodlampor. Ficklampor är i regel batteridrivna.'
    },

    ['tazer'] = {
        label = 'Tazer X26',
        image = 'https://cdn.discordapp.com/attachments/617817813142208547/836294660539547718/weapon_stungun.png',
        weapon = 'weapon_stungun',
        description = 'Elchockvapen är en typ av mindre dödliga vapen som skickar en elektrisk stöt genom den träffade – endera genom att vapnet trycks mot en person eller genom att avlossa projektiler som är trådförbundna med skjutanordningen eller har ett eget batteri. Elchockvapen som måste tryckas mot en person kallas för stun guns. Det finns även elbälten och elchockbatonger som fungerar enligt samma princip som stun guns.',
        prop = 'w_pi_stungun'
    },

    ['nightstick'] = {
        label = 'B&T TRITON Advanced Tactical Expanderbatong 50 cm',
        description = 'Batong (från franska bâton, käpp, stav) är ett slagvapen, vanligen tillverkat av hårdgummi med en metallisk kärna. Många varianter av batong finns: teleskopbatong, elbatong och fjäderbatong är de mest kända varianterna. Även den sydafrikanska flodhästpiskan är en variant på batongen. Batong ingår i polisens och fångvårdens beväpning i många länder. ',
        image = 'https://i.imgur.com/6MBysX6.png',
        weapon = 'weapon_nightstick',
        prop = 'w_me_nightstick'
    },

    ['knife'] = {
        label = 'Kniv',
        image = 'https://cdn.discordapp.com/attachments/617817813142208547/836294651086503976/weapon_knife.png',
        weapon = 'weapon_knife',
    },

    ['switchblade'] = {
        label = 'Fickkniv',
        image = 'https://cdn.discordapp.com/attachments/617817813142208547/836294661168824320/weapon_switchblade.png',
        weapon = 'weapon_switchblade',
        description = 'En fickkniv eller fällkniv är en kniv vars blad kan fällas in i skaftet. När den är hopfälld är den oftast tillräckligt liten för att få plats i en ficka. Fickknivar innehåller ibland flera andra verktyg förutom knivbladet. Dessa går på vissa knivar att låsa i utfällt läge, ibland även i infällt läge.'
    },

    ['mic'] = {
        label = 'Røde interview Go',
        image = 'https://cdn.discordapp.com/attachments/617817813142208547/848706148340990002/rode.png',
        description = 'Förvandlar din Wireless Go till en handhållen mikrofon. Rode Interview Go fästs vid botten av din Wireless Go sändare och förvandlar den till en handhållen, sändningsklar mikrofon. Anslut bara Wireless Go sändaren till Interview Go adaptern så är du redo att gå. Den ser bra ut på kameran, vilket gör den idealisk för rapporter, intervjuer och mer. Wireless Gos cold shoe fäster ldirekt till Interview Go för att säkerställa och snäva passform. En vindskydd med hög täthet inkluderar också perfekt för att skydda mikrofonen mot vind- och väderförhållanden. Det hjälper också till att minimera plosiver, skydda kapseln medan du spelar in för bästa ljud.'
    },

    ['bigmic'] = {
        label = 'Røde Boompole 3m',
        image = 'https://cdn.discordapp.com/attachments/617817813142208547/848728234191486986/rodearm.png',
        description = 'På Boompole kan du montera din mikrofon ordentligt och vrida den i olika riktningar, vilket innebär att du lätt kan ändra positioner och följa din ljudkälla. Rode Bompole kan förlängas från 0,84 m (33-tums ) till 3m (10)'
    },

    ['hammer'] = {
        label = 'Hammare',
        image = 'https://cdn.discordapp.com/attachments/617817813142208547/836294649714442240/weapon_hammer.png',
        weapon = 'weapon_hammer',
        description = 'En fin hammare'
    },

    ['hatchet'] = {
        label = 'Yxa',
        image = 'https://i.imgur.com/yr4cclR.png',
        weapon = 'weapon_wrench',
        description = ''
    },

    ['battleaxe'] = {
        label = 'Sportsyxa',
        image = 'https://i.imgur.com/dfEPDvo.png',
        weapon = 'weapon_battleaxe',
        description = ''
    },

    ['bat'] = {
        label = 'Basebollsträ',
        image = 'https://media.discordapp.net/attachments/712698139831959623/809942003369771008/WEAPON_BAT.png',
        weapon = 'weapon_bat',
        description = ''
    },

    ['knuckle'] = {
        label = 'Knogjärn',
        image = 'https://media.discordapp.net/attachments/712698139831959623/809942066859737118/WEAPON_KNUCKLE.png',
        weapon = 'weapon_knuckle',
        description = ''
    },

    ['parachute'] = { 
        label = 'Fallskärm', 
        image = 'https://i.imgur.com/yrFdep0.png', 
        weapon = 'gadget_parachute', 
        prop = 'p_parachute_s', 
        description = '' 
    },

    ['crowbar'] = {
        label = 'Kofot',
        image = 'https://cdn.discordapp.com/attachments/809933482952097792/821724187148025866/croebar.png',
        weapon = 'weapon_crowbar',
        description = ''
    },


    ['mohammedsrpg'] = {
        label = 'Kofot',
        image = 'https://cdn.discordapp.com/attachments/809933482952097792/821724187148025866/croebar.png',
        weapon = 'weapon_rpg',
        description = '@ammo'
    },

    ['sniperrifle'] = {
        label = 'Jakt vapen',
        image = 'https://cdn.discordapp.com/attachments/809933482952097792/821724187148025866/croebar.png',
        weapon = 'weapon_sniperrifle',
        description = 'Ammunition: @ammo'
    },


    ['carkey'] = { label = 'Bilnyckel', image = 'https://cdn.discordapp.com/attachments/675230497009303552/687321653059125333/key.png', prop = 'prop_cuff_keys_01', description = '<span style="font-weight: bold">Registreringsnummer</span>: @plate<br><span style="font-weight: bold">Modell</span>: @model', buttons = {
		{ label = 'Lås / Lås upp', color = '#42a5f5', func = function(Source, Data)
			TriggerClientEvent('eyrp_carkeys:executeLocksystem', source)
		end }
	}},
}

Config.Keys = {
    'policekey',
    'hospitalkey',
    'key_grove',
    'carkey', 
    'key', 
    'motelkey'
}

Config.Hotbars = {
    157, 
    158,
    160,
    164,
    165
}

Config.Inventory = {
    Slots = {
        ['pocket'] = 20,
        ['keyring'] = 12,
        ['ground'] = 200
    },

    Titles = {
        ['pocket'] = 'Ficka',
        ['keyring'] = 'Nyckelknippa',
        ['ground'] = 'Marken'
    },

    Defaults = {
        { name = 'pocket', inventory = 'personal', data = { denied = Config.Keys } },
        { name = 'keyring', inventory = 'personal', data = { allowed = Config.Keys } }
    }
}

Config.OpenInventoryKey = 37
