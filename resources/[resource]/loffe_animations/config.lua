Config = {}
Config['Debug'] = false -- if this is enabled, synced animations will just spawn an npc that will do the animation with you

Config['pNotify'] = false -- use pNotify for notifications?

Config['SelectableButtons'] = { -- find controls here https://docs.fivem.net/docs/game-references/controls/
    {'~INPUT_MULTIPLAYER_INFO~', 20},
    {'~INPUT_REPLAY_SHOWHOTKEY~', 311},
    {'~INPUT_SELECT_CHARACTER_MICHAEL~', 166},
    {'~INPUT_SELECT_CHARACTER_TREVOR~', 168},
    {'~INPUT_CELLPHONE_CAMERA_GRID~', 183},
}

Config['OpenMenu'] = false -- button to open menu, set to false to disable hardcoded button opening (e.g if you want to add it to your own menu) 
Config['CancelAnimation'] = 105
-- TriggerEvent('loffe_animations:openMenu') < event to open the menu

Config['PoleDance'] = { -- allows you to pole dance at the strip club, you can of course add more locations if you want.
    ['Enabled'] = true,
    ['Locations'] = {
        {['Position'] = vector3(112.60, -1286.76, 28.56), ['Number'] = '3'},
        {['Position'] = vector3(-43.46, 6397.22, 31.88), ['Number'] = '1'},
        {['Position'] = vector3(102.24, -1290.54, 29.26), ['Number'] = '2'}
    }
}

Strings = {
    ['Choose_Favorite'] = 'Vilken knapp %s?',
    ['Select_Favorite'] = 'Lägg till favorit',
    ['Manage_Favorites'] = 'Ändra favoriter',
    ['Close'] = 'Stäng',
    ['Updated_Favorites'] = 'Uppdaterade favoriter.',
    ['Remove?'] = 'Ta bort "%s" som favorit?',
    ['Yes'] = 'Ja',
    ['No'] = 'Nej',
    ['Animations'] = 'Animationer',
    ['Synced'] = 'Synkade Animationer',
    ['Sync_Request'] = '%s %s?',
    ['Pole_Dance'] = '[~r~E~w~] Strippa',
    ['Noone_Close'] = 'Ingen är nära!',
    ['Not_In_Car'] = 'Du är inte i ett fordon!'
}

Config['Synced'] = {
    {
        ['Label'] = 'Krama',
        ['RequesterLabel'] = 'Vill du krama',
        ['Requester'] = {
            ['Type'] = 'animation', ['Dict'] = 'mp_ped_interaction', ['Anim'] = 'kisses_guy_a', ['Flags'] = 0,
        },
        ['Accepter'] = {
            ['Type'] = 'animation', ['Dict'] = 'mp_ped_interaction', ['Anim'] = 'kisses_guy_b', ['Flags'] = 0, ['Attach'] = {
                ['Bone'] = 9816,
                ['xP'] = 0.05,
                ['yP'] = 1.15,
                ['zP'] = -0.05,

                ['xR'] = 0.0,
                ['yR'] = 0.0,
                ['zR'] = 180.0,
            }
        }
    },
    {
        ['Label'] = 'High five',
        ['RequesterLabel'] = 'Vill du göra en high five med',
        ['Requester'] = {
            ['Type'] = 'animation', ['Dict'] = 'mp_ped_interaction', ['Anim'] = 'highfive_guy_a', ['Flags'] = 0,
        },
        ['Accepter'] = {
            ['Type'] = 'animation', ['Dict'] = 'mp_ped_interaction', ['Anim'] = 'highfive_guy_b', ['Flags'] = 0, ['Attach'] = {
                ['Bone'] = 9816,
                ['xP'] = -0.5,
                ['yP'] = 1.25,
                ['zP'] = 0.0,

                ['xR'] = 0.9,
                ['yR'] = 0.3,
                ['zR'] = 180.0,
            }
        }
    },
    {
        ['Label'] = 'Gangster Kram',
        ['RequesterLabel'] = 'Vill du Gangster krama',
        ['Requester'] = {
            ['Type'] = 'animation', ['Dict'] = 'mp_ped_interaction', ['Anim'] = 'hugs_guy_a', ['Flags'] = 0,
        },
        ['Accepter'] = {
            ['Type'] = 'animation', ['Dict'] = 'mp_ped_interaction', ['Anim'] = 'hugs_guy_b', ['Flags'] = 0, ['Attach'] = {
                ['Bone'] = 9816,
                ['xP'] = -0.025,
                ['yP'] = 1.15,
                ['zP'] = 0.0,

                ['xR'] = 0.0,
                ['yR'] = 0.0,
                ['zR'] = 180.0,
            }
        }
    },
    {
        ['Label'] = 'Fistbump',
        ['RequesterLabel'] = 'vill du fistbumpa',
        ['Requester'] = {
            ['Type'] = 'animation', ['Dict'] = 'anim@mp_player_intcelebrationpaired@f_f_fist_bump', ['Anim'] = 'fist_bump_left', ['Flags'] = 0,
        },
        ['Accepter'] = {
            ['Type'] = 'animation', ['Dict'] = 'anim@mp_player_intcelebrationpaired@f_f_fist_bump', ['Anim'] = 'fist_bump_right', ['Flags'] = 0, ['Attach'] = {
                ['Bone'] = 9816,
                ['xP'] = -0.6,
                ['yP'] = 0.9,
                ['zP'] = 0.0,

                ['xR'] = 0.0,
                ['yR'] = 0.0,
                ['zR'] = 270.0,
            }
        }
    },
    {
        ['Label'] = 'Skaka hand (kompis)',
        ['RequesterLabel'] = 'Vill du skaka hand med',
        ['Requester'] = {
            ['Type'] = 'animation', ['Dict'] = 'mp_ped_interaction', ['Anim'] = 'handshake_guy_a', ['Flags'] = 0,
        },
        ['Accepter'] = {
            ['Type'] = 'animation', ['Dict'] = 'mp_ped_interaction', ['Anim'] = 'handshake_guy_b', ['Flags'] = 0, ['Attach'] = {
                ['Bone'] = 9816,
                ['xP'] = 0.0,
                ['yP'] = 1.2,
                ['zP'] = 0.0,

                ['xR'] = 0.0,
                ['yR'] = 0.0,
                ['zR'] = 180.0,
            }
        }
    },
    {
        ['Label'] = 'Skaka hand (jobb)',
        ['RequesterLabel'] = 'Vill du skaka hand med',
        ['Requester'] = {
            ['Type'] = 'animation', ['Dict'] = 'mp_common', ['Anim'] = 'givetake1_a', ['Flags'] = 0,
        },
        ['Accepter'] = {
            ['Type'] = 'animation', ['Dict'] = 'mp_common', ['Anim'] = 'givetake1_b', ['Flags'] = 0, ['Attach'] = {
                ['Bone'] = 9816,
                ['xP'] = 0.075,
                ['yP'] = 1.0,
                ['zP'] = 0.0,

                ['xR'] = 0.0,
                ['yR'] = 0.0,
                ['zR'] = 180.0,
            }
        }
    },
        -- NSFW animations vvvvvvvv
        {
            ['Label'] = 'Ge avsugning (stående)',
            ['RequesterLabel'] = 'Vill du ha en avsugning av',
            ['Requester'] = {
                ['Type'] = 'animation', ['Dict'] = 'misscarsteal2pimpsex', ['Anim'] = 'pimpsex_hooker', ['Flags'] = 1, ['Attach'] = {
                    ['Bone'] = 9816,
                    ['xP'] = 0.0,
                    ['yP'] = 0.65,
                    ['zP'] = 0.0,
    
                    ['xR'] = 120.0,
                    ['yR'] = 0.0,
                    ['zR'] = 180.0,
                }
            },
            ['Accepter'] = {
                ['Type'] = 'animation', ['Dict'] = 'misscarsteal2pimpsex', ['Anim'] = 'pimpsex_punter', ['Flags'] = 1,
            },
        },
        {
            ['Label'] = 'Bli pippad (stående)',
            ['RequesterLabel'] = 'Vill du bli pippad av',
            ['Requester'] = {
                ['Type'] = 'animation', ['Dict'] = 'misscarsteal2pimpsex', ['Anim'] = 'shagloop_hooker', ['Flags'] = 1, ['Attach'] = {
                    ['Bone'] = 9816,
                    ['xP'] = 0.05,
                    ['yP'] = 0.4,
                    ['zP'] = 0.0,
    
                    ['xR'] = 120.0,
                    ['yR'] = 0.0,
                    ['zR'] = 180.0,
                }
            },
            ['Accepter'] = {
                ['Type'] = 'animation', ['Dict'] = 'misscarsteal2pimpsex', ['Anim'] = 'shagloop_pimp', ['Flags'] = 1,
            },
        },
        {
            ['Label'] = 'Fjärt pipp (stående)', 
            ['RequesterLabel'] = 'Vill du bli tagen i röven utav',
            ['Requester'] = {
                ['Type'] = 'animation', ['Dict'] = 'rcmpaparazzo_2', ['Anim'] = 'shag_loop_a', ['Flags'] = 1,
            }, 
            ['Accepter'] = {
                ['Type'] = 'animation', ['Dict'] = 'rcmpaparazzo_2', ['Anim'] = 'shag_loop_poppy', ['Flags'] = 1, ['Attach'] = {
                    ['Bone'] = 9816,
                    ['xP'] = 0.015,
                    ['yP'] = 0.35,
                    ['zP'] = 0.0,
    
                    ['xR'] = 0.9,
                    ['yR'] = 0.3,
                    ['zR'] = 0.0,
                },
            },
        },
        {
            ['Label'] = "Pippa (förarsätet)", 
            ['RequesterLabel'] = 'Vill du bli pippad av',
            ['Car'] = true,
            ['Requester'] = {
                ['Type'] = 'animation', ['Dict'] = 'oddjobs@assassinate@vice@sex', ['Anim'] = 'frontseat_carsex_loop_m', ['Flags'] = 1,
            }, 
            ['Accepter'] = {
                ['Type'] = 'animation', ['Dict'] = 'oddjobs@assassinate@vice@sex', ['Anim'] = 'frontseat_carsex_loop_f', ['Flags'] = 1,
            },
        },
        {
            ['Label'] = "Bli pippad (förarsätet)", 
            ['RequesterLabel'] = 'Vill du pippa',
            ['Car'] = true,
            ['Requester'] = {
                ['Type'] = 'animation', ['Dict'] = 'random@drunk_driver_2', ['Anim'] = 'cardrunksex_loop_f', ['Flags'] = 1,
            }, 
            ['Accepter'] = {
                ['Type'] = 'animation', ['Dict'] = 'random@drunk_driver_2', ['Anim'] = 'cardrunksex_loop_m', ['Flags'] = 1,
            },
        },
        {
            ['Label'] = "Ta emot avsugning (förarsätet)", 
            ['RequesterLabel'] = 'Vill du ge en avsugning till',
            ['Car'] = true,
            ['Requester'] = {
                ['Type'] = 'animation', ['Dict'] = 'oddjobs@towing', ['Anim'] = 'm_blow_job_loop', ['Flags'] = 1,
            }, 
            ['Accepter'] = {
                ['Type'] = 'animation', ['Dict'] = 'oddjobs@towing', ['Anim'] = 'f_blow_job_loop', ['Flags'] = 1,
            },
        },
        -- NSFW animations ^^^^^^^
}

Config['Animations'] = {
    {
    
        ['Label'] = 'Nödlägen',
        ['Data'] = {
            {['Label'] = "Bli arresterad", ['Type'] = 'animation', ['Dict'] = 'random@arrests@busted', ['Anim'] = 'idle_a', ['Flags'] = 1},
            {['Label'] = "Beskjuten", ['Type'] = 'animation', ['Dict'] = 'anim@heists@ornate_bank@hostages@cashier_a@', ['Anim'] = 'flinch_loop_underfire', ['Flags'] = 1},
            {['Label'] = "Beskjuten: Ligg", ['Type'] = 'animation', ['Dict'] = 'anim@heists@ornate_bank@hostages@ped_a@', ['Anim'] = 'flinch_loop_underfire', ['Flags'] = 1},
            {['Label'] = "Beskjuten: sitt", ['Type'] = 'animation', ['Dict'] = 'anim@heists@ornate_bank@hostages@cashier_a@', ['Anim'] = 'flinch_loop_underfire', ['Flags'] = 1},
            {['Label'] = "ligg ner", ['Type'] = 'animation', ['Dict'] = 'anim@heists@ornate_bank@hostages@ped_a@', ['Anim'] = 'idle', ['Flags'] = 1},
            {['Label'] = "Rädd", ['Type'] = 'animation', ['Dict'] = 'anim@heists@fleeca_bank@hostages@ped_d@', ['Anim'] = 'idle', ['Flags'] = 1},
            {['Label'] = "Underlägsen", ['Type'] = 'animation', ['Dict'] = 'amb@code_human_cower_stand@male@react_cowering', ['Anim'] = 'base_right', ['Flags'] = 1},
    
        }    
    },
    {
        
        ['Label'] = 'Förarsätet',
        ['Data'] = {
            {['Label'] = "Prata med baksätet", ['Type'] = 'animation', ['Dict'] = 'oddjobs@taxi@driver', ['Anim'] = 'leanover_idle', ['Flags'] = 1},
            {['Label'] = "Ge/Ta genom rutan", ['Type'] = 'animation', ['Dict'] = 'oddjobs@taxi@cyi', ['Anim'] = 'std_hand_off_ps_passenger', ['Flags'] = 1},
            {['Label'] = "Upp med händerna", ['Type'] = 'animation', ['Dict'] = 'anim@mp_player_intincarsurrenderstd@ds@', ['Anim'] = 'idle_a', ['Flags'] = 1},
            {['Label'] = "Träna på gitarren", ['Type'] = 'animation', ['Dict'] = 'anim@mp_player_intincarair_guitarstd@ds@', ['Anim'] = 'idle_a', ['Flags'] = 1},
            {['Label'] = "Trumma lite", ['Type'] = 'animation', ['Dict'] = 'anim@mp_player_intincarair_synthstd@ds@', ['Anim'] = 'idle_a', ['Flags'] = 1},
            {['Label'] = "chicken", ['Type'] = 'animation', ['Dict'] = 'anim@mp_player_intincarchicken_tauntstd@ds@', ['Anim'] = 'idle_a', ['Flags'] = 1},
            {['Label'] = "Bli avsugen", ['Type'] = 'animation', ['Dict'] = 'oddjobs@towing', ['Anim'] = 'm_blow_job_loop', ['Flags'] = 1},
            {['Label'] = "Ha sex", ['Type'] = 'animation', ['Dict'] = 'mini@prostitutes@sexlow_veh', ['Anim'] = 'low_car_sex_loop_player', ['Flags'] = 1},
    
        }    
    },
    {
        
        ['Label'] = 'Passagerarsätet',
        ['Data'] = {
            {['Label'] = "uttråkad", ['Type'] = 'animation', ['Dict'] = 'amb@code_human_in_car_idles@low@ps@idle_d', ['Anim'] = 'idle_k', ['Flags'] = 1},
            {['Label'] = "Spy ur bilen", ['Type'] = 'animation', ['Dict'] = 'oddjobs@taxi@tie', ['Anim'] = 'vomit_outside', ['Flags'] = 1},
            {['Label'] = "Ge avsugning", ['Type'] = 'animation', ['Dict'] = 'oddjobs@towing', ['Anim'] = 'f_blow_job_loop', ['Flags'] = 1},
            {['Label'] = "Ge avsugning", ['Type'] = 'animation', ['Dict'] = 'mini@prostitutes@sexnorm_veh', ['Anim'] = 'bj_loop_prostitute', ['Flags'] = 1},
            {['Label'] = "Ha sex", ['Type'] = 'animation', ['Dict'] = 'mini@prostitutes@sexlow_veh', ['Anim'] = 'low_car_sex_loop_female', ['Flags'] = 1},
    
        }    
    },
    {
        
        ['Label'] = 'Festligheter',
        ['Data'] = {
            {['Label'] = "Spela musik", ['Type'] = 'scenario', ['Anim'] = 'WORLD_HUMAN_MUSICIAN'},
            {['Label'] = "Dj", ['Type'] = 'animation', ['Dict'] = 'anim@mp_player_intcelebrationmale@dj', ['Anim'] = 'dj', ['Flags'] = 1},
            {['Label'] = "Grog", ['Type'] = 'scenario', ['Anim'] = 'WORLD_HUMAN_DRINKING'},
            {['Label'] = "Ölfest", ['Type'] = 'scenario', ['Anim'] = 'WORLD_HUMAN_PARTYING'},
            {['Label'] = "Luftgitarr", ['Type'] = 'animation', ['Dict'] = 'anim@mp_player_intcelebrationmale@air_guitar', ['Anim'] = 'air_guitar', ['Flags'] = 1},
            {['Label'] = "Luftjucka", ['Type'] = 'animation', ['Dict'] = 'anim@mp_player_intcelebrationfemale@air_shagging', ['Anim'] = 'air_shagging', ['Flags'] = 1},
            {['Label'] = "Rock'n'roll", ['Type'] = 'animation', ['Dict'] = 'mp_player_int_upperrock', ['Anim'] = 'mp_player_int_rock', ['Flags'] = 1},
            {['Label'] = "Helt ute och cykla", ['Type'] = 'animation', ['Dict'] = 'amb@world_human_bum_standing@drunk@idle_a', ['Anim'] = 'idle_a', ['Flags'] = 1},
            {['Label'] = "Sten, sax, påse", ['Type'] = 'animation', ['Dict'] = 'amb@code_human_in_car_mp_actions@fist_pump@low@ps@base', ['Anim'] = 'idle_a', ['Flags'] = 1},
            {['Label'] = " - Sten", ['Type'] = 'animation', ['Dict'] = 'amb@code_human_in_car_mp_actions@fist_pump@low@ps@base', ['Anim'] = 'enter', ['Flags'] = 1},
            {['Label'] = " - Sax", ['Type'] = 'animation', ['Dict'] = 'amb@code_human_in_car_mp_actions@v_sign@low@ps@base', ['Anim'] = 'idle_a', ['Flags'] = 1},
            {['Label'] = " - Påse", ['Type'] = 'animation', ['Dict'] = 'anim@mp_player_intupperwave', ['Anim'] = 'idle_a_fp', ['Flags'] = 1},
            {['Label'] = "Dans 1 (Krograggaren)", ['Type'] = 'animation', ['Dict'] = 'rcmnigel1bnmt_1b', ['Anim'] = 'dance_loop_tyler', ['Flags'] = 1},
            {['Label'] = "Dans 2 (Skogsdansen)", ['Type'] = 'animation', ['Dict'] = 'special_ped@mountain_dancer@monologue_1@monologue_1a', ['Anim'] = 'mtn_dnc_if_you_want_to_get_to_heaven', ['Flags'] = 1},
            {['Label'] = "Dans 3 (Smygdansare)", ['Type'] = 'animation', ['Dict'] = 'amb@code_human_in_car_mp_actions@dance@bodhi@rds@base', ['Anim'] = 'idle_b', ['Flags'] = 1},
            {['Label'] = "Dans 4 (Taggad Festnisse)", ['Type'] = 'animation', ['Dict'] = 'anim@mp_player_intupperair_synth', ['Anim'] = 'idle_a_fp', ['Flags'] = 1},
            {['Label'] = "Dans 5 (Shake it!)", ['Type'] = 'animation', ['Dict'] = 'missfam2leadinoutmcs3', ['Anim'] = 'onboat_leadin_tracy', ['Flags'] = 1},
            {['Label'] = "Dans 6 (Swing)", ['Type'] = 'animation', ['Dict'] = 'misschinese2_crystalmazemcs1_ig', ['Anim'] = 'dance_loop_tao', ['Flags'] = 1},
            {['Label'] = "Dans 7 (Mjukisdansen)", ['Type'] = 'scenario', ['Anim'] = 'WORLD_HUMAN_STRIP_WATCH_STAND'},
            {['Label'] = "Dans 8 (Bäst på krogen)", ['Type'] = 'animation', ['Dict'] = 'anim@amb@nightclub@dancers@crowddance_facedj@', ['Anim'] = 'hi_dance_facedj_15_v2_male^2', ['Flags'] = 1},
    
        }    
    },
    {
        
        ['Label'] = 'Hälsningar',
        ['Data'] = {
            {['Label'] = "Tjena!", ['Type'] = 'animation', ['Dict'] = 'gestures@m@standing@casual', ['Anim'] = 'gesture_hello', ['Flags'] = 1},
            {['Label'] = "Skaka hand", ['Type'] = 'animation', ['Dict'] = 'mp_common', ['Anim'] = 'givetake1_a', ['Flags'] = 1},
            {['Label'] = "Slå händerna samman", ['Type'] = 'animation', ['Dict'] = 'mp_ped_interaction', ['Anim'] = 'handshake_guy_a', ['Flags'] = 1},
            {['Label'] = "Skaka hand samt krama", ['Type'] = 'animation', ['Dict'] = 'mp_ped_interaction', ['Anim'] = 'hugs_guy_a', ['Flags'] = 1},
            {['Label'] = "Militärhälsing", ['Type'] = 'animation', ['Dict'] = 'mp_player_int_uppersalute', ['Anim'] = 'mp_player_int_salute', ['Flags'] = 1},
            {['Label'] = "Boop!", ['Type'] = 'animation', ['Dict'] = 'anim@mp_radio@medium_apment', ['Anim'] = 'action_a_kitchen', ['Flags'] = 1},
            {['Label'] = "Gangsta", ['Type'] = 'animation', ['Dict'] = 'missfbi3_sniping', ['Anim'] = 'dance_m_default', ['Flags'] = 1},
    
        }    
    },
    {
        
        ['Label'] = 'Sport/Träning',
        ['Data'] = {
            {['Label'] = "Flexar", ['Type'] = 'animation', ['Dict'] = 'amb@world_human_muscle_flex@arms_at_side@base', ['Anim'] = 'base', ['Flags'] = 1},
            {['Label'] = "Pumpa stång", ['Type'] = 'scenario', ['Anim'] = 'world_human_muscle_free_weights'},
            {['Label'] = "Armhävningar", ['Type'] = 'animation', ['Dict'] = 'amb@world_human_push_ups@male@base', ['Anim'] = 'base', ['Flags'] = 1},
            {['Label'] = "Sit-ups", ['Type'] = 'animation', ['Dict'] = 'amb@world_human_sit_ups@male@base', ['Anim'] = 'base', ['Flags'] = 1},
            {['Label'] = "Yoga", ['Type'] = 'animation', ['Dict'] = 'amb@world_human_yoga@male@base', ['Anim'] = 'base_a', ['Flags'] = 1},
            {['Label'] = "Pullups på stång", ['Type'] = 'scenario', ['Anim'] = 'prop_human_muscle_chin_ups'},
            {['Label'] = "Bänkpress", ['Type'] = 'scenario', ['Anim'] = 'prop_human_seat_muscle_bench_press'},
            {['Label'] = "Fyfan vad slut jag är!", ['Type'] = 'animation', ['Dict'] = 'amb@world_human_jog_standing@male@idle_b', ['Anim'] = 'idle_d', ['Flags'] = 1},
            {['Label'] = "Bakåtvolt", ['Type'] = 'animation', ['Dict'] = 'anim@arena@celeb@flat@solo@no_props@', ['Anim'] = 'flip_a_player_a', ['Flags'] = 1},
            {['Label'] = "Tagga inför hopp", ['Type'] = 'animation', ['Dict'] = 'oddjobs@bailbond_mountain', ['Anim'] = 'base_jump_idle', ['Flags'] = 1},
            {['Label'] = " - Hoppa", ['Type'] = 'animation', ['Dict'] = 'oddjobs@bailbond_mountain', ['Anim'] = 'base_jump_spot', ['Flags'] = 1},
            {['Label'] = "Karate Kid", ['Type'] = 'animation', ['Dict'] = 'missbigscore1leadinoutbs_1_int', ['Anim'] = 'leadin_loop_a_trevor', ['Flags'] = 1},
    
        }    
    },
    {
        
        ['Label'] = 'Jobbrelaterat',
        ['Data'] = {
            {['Label'] = "Anteckning", ['Type'] = 'scenario', ['Anim'] = 'code_human_medic_time_of_death'},
            {['Label'] = "Skrivblock", ['Type'] = 'scenario', ['Anim'] = 'WORLD_HUMAN_CLIPBOARD'},
            {['Label'] = "Polis: Brottsplatsundersökning", ['Type'] = 'animation', ['Dict'] = 'amb@code_human_police_investigate@idle_b', ['Anim'] = 'idle_f', ['Flags'] = 1},
            {['Label'] = "Polis: Prata i radio", ['Type'] = 'animation', ['Dict'] = 'random@arrests', ['Anim'] = 'generic_radio_chatter', ['Flags'] = 1},
            {['Label'] = "Polis: Trafikangivelse", ['Type'] = 'scenario', ['Anim'] = 'WORLD_HUMAN_CAR_PARK_ATTENDANT'},
            {['Label'] = "Polis: Kikare", ['Type'] = 'scenario', ['Anim'] = 'WORLD_HUMAN_BINOCULARS'},
            {['Label'] = "Polis: Sysslolös", ['Type'] = 'scenario', ['Anim'] = 'world_human_cop_idles'},
            {['Label'] = "Sjukvård: Undersöka", ['Type'] = 'scenario', ['Anim'] = 'CODE_HUMAN_MEDIC_KNEEL'},
            {['Label'] = "Sjukvård: Bröstpump", ['Type'] = 'animation', ['Dict'] = 'mini@cpr@char_a@cpr_str', ['Anim'] = 'cpr_pumpchest', ['Flags'] = 1},
            {['Label'] = "Sjukvård: Mun mot mun", ['Type'] = 'animation', ['Dict'] = 'mini@cpr@char_a@cpr_str', ['Anim'] = 'cpr_kol', ['Flags'] = 1},
            {['Label'] = "Patient: Ligg på rygg", ['Type'] = 'animation', ['Dict'] = 'anim@gangops@morgue@table@', ['Anim'] = 'ko_front', ['Flags'] = 1},
            {['Label'] = "Mekaniker: Meka motor", ['Type'] = 'animation', ['Dict'] = 'mini@repair', ['Anim'] = 'fixing_a_ped', ['Flags'] = 1},
            {['Label'] = "Mekaniker: Svetsa", ['Type'] = 'scenario', ['Anim'] = 'world_human_welding'},
            {['Label'] = "Trädgård: Gräva med liten spade", ['Type'] = 'scenario', ['Anim'] = 'world_human_gardener_plant'},
            {['Label'] = "Trädgård: Lövblåsare", ['Type'] = 'scenario', ['Anim'] = 'WORLD_HUMAN_GARDENER_LEAF_BLOWER'},
            {['Label'] = "Städning: Borsta", ['Type'] = 'scenario', ['Anim'] = 'WORLD_HUMAN_JANITOR'},
            {['Label'] = "Städning: Putsa", ['Type'] = 'scenario', ['Anim'] = 'WORLD_HUMAN_MAID_CLEAN'},
            {['Label'] = "Butiksbiträde: Ge ölback", ['Type'] = 'animation', ['Dict'] = 'mp_am_hold_up', ['Anim'] = 'purchase_beerbox_shopkeeper', ['Flags'] = 1},
            {['Label'] = "Bartender: Hälla upp öl", ['Type'] = 'animation', ['Dict'] = 'mini@drinking', ['Anim'] = 'shots_barman_b', ['Flags'] = 1},
            {['Label'] = "Journalist: Tag kort", ['Type'] = 'scenario', ['Anim'] = 'WORLD_HUMAN_PAPARAZZI'},
            {['Label'] = "Snickra", ['Type'] = 'scenario', ['Anim'] = 'WORLD_HUMAN_HAMMERING'},
            {['Label'] = "Clown: Leka staty", ['Type'] = 'scenario', ['Anim'] = 'WORLD_HUMAN_HUMAN_STATUE'},
            {['Label'] = "Borra ett hål i gatan", ['Type'] = 'scenario', ['Anim'] = 'WORLD_HUMAN_CONST_DRILL'},
            {['Label'] = "Uteliggare: Tigg med skylt", ['Type'] = 'scenario', ['Anim'] = 'WORLD_HUMAN_BUM_FREEWAY'},
            {['Label'] = "Uteliggare: Tvätta sig i en vattenpöl", ['Type'] = 'scenario', ['Anim'] = 'WORLD_HUMAN_BUM_WASH'},
            {['Label'] = "Uteliggare: Ta en tupplur", ['Type'] = 'scenario', ['Anim'] = 'WORLD_HUMAN_BUM_SLUMPED'},
            {['Label'] = "Uteliggare: Leta i sopor", ['Type'] = 'scenario', ['Anim'] = 'PROP_HUMAN_BUM_BIN'},
            {['Label'] = "Hallå här är jag!", ['Type'] = 'animation', ['Dict'] = 'misscarsteal2', ['Anim'] = 'come_here_idle_c', ['Flags'] = 1},
            {['Label'] = "Hacka dator", ['Type'] = 'animation', ['Dict'] = 'mp_prison_break', ['Anim'] = 'hack_loop', ['Flags'] = 1},
            {['Label'] = "Fiskar", ['Type'] = 'scenario', ['Anim'] = 'world_human_stand_fishing'},
            {['Label'] = "Bouncer", ['Type'] = 'animation', ['Dict'] = 'mini@strip_club@idles@bouncer@base', ['Anim'] = 'base', ['Flags'] = 1},
    
        }    
    },
    {
        
        ['Label'] = 'Humor',
        ['Data'] = {
            {['Label'] = "Klappa", ['Type'] = 'scenario', ['Anim'] = 'WORLD_HUMAN_CHEERING'},
            {['Label'] = "Tummenupp!", ['Type'] = 'animation', ['Dict'] = 'mp_action', ['Anim'] = 'thanks_male_06', ['Flags'] = 1},
            {['Label'] = "Snyggt där!", ['Type'] = 'animation', ['Dict'] = 'gestures@m@standing@casual', ['Anim'] = 'gesture_point', ['Flags'] = 1},
            {['Label'] = "Följ med!", ['Type'] = 'animation', ['Dict'] = 'gestures@m@standing@casual', ['Anim'] = 'gesture_come_here_soft', ['Flags'] = 1},
            {['Label'] = "Kom igen då!", ['Type'] = 'animation', ['Dict'] = 'gestures@m@standing@casual', ['Anim'] = 'gesture_bring_it_on', ['Flags'] = 1},
            {['Label'] = "Pratar du med mig?", ['Type'] = 'animation', ['Dict'] = 'gestures@m@standing@casual', ['Anim'] = 'gesture_me', ['Flags'] = 1},
            {['Label'] = "I helvete heller!", ['Type'] = 'animation', ['Dict'] = 'anim@am_hold_up@male', ['Anim'] = 'shoplift_high', ['Flags'] = 1},
            {['Label'] = "Vad gör jag här...", ['Type'] = 'animation', ['Dict'] = 'anim@mp_player_intcelebrationmale@face_palm', ['Anim'] = 'face_palm', ['Flags'] = 1},
            {['Label'] = "Lugna ner dig ", ['Type'] = 'animation', ['Dict'] = 'gestures@m@standing@casual', ['Anim'] = 'gesture_easy_now', ['Flags'] = 1},
            {['Label'] = "Uhm, ok, helvete!", ['Type'] = 'animation', ['Dict'] = 'oddjobs@assassinate@multi@', ['Anim'] = 'react_big_variations_a', ['Flags'] = 1},
            {['Label'] = "Uppvärmning (slagsmål)", ['Type'] = 'animation', ['Dict'] = 'anim@deathmatch_intros@unarmed', ['Anim'] = 'intro_male_unarmed_e', ['Flags'] = 1},
            {['Label'] = "Det är inte möjligt!", ['Type'] = 'animation', ['Dict'] = 'gestures@m@standing@casual', ['Anim'] = 'gesture_damn', ['Flags'] = 1},
            {['Label'] = "Krama", ['Type'] = 'animation', ['Dict'] = 'mp_ped_interaction', ['Anim'] = 'kisses_guy_a', ['Flags'] = 1},
            {['Label'] = "Far åt helvete", ['Type'] = 'animation', ['Dict'] = 'mp_player_int_upperfinger', ['Anim'] = 'mp_player_int_finger_01_enter', ['Flags'] = 1},
            {['Label'] = "Dra en skinntarsan", ['Type'] = 'animation', ['Dict'] = 'mp_player_int_upperwank', ['Anim'] = 'mp_player_int_wank_01', ['Flags'] = 1},
            {['Label'] = "Självmord: Pistol", ['Type'] = 'animation', ['Dict'] = 'mp_suicide', ['Anim'] = 'pistol', ['Flags'] = 1},
            {['Label'] = "Självmord: Piller", ['Type'] = 'animation', ['Dict'] = 'mp_suicide', ['Anim'] = 'pill', ['Flags'] = 1},
            {['Label'] = "Förbannad", ['Type'] = 'animation', ['Dict'] = 'oddjobs@towingangryidle_a', ['Anim'] = 'idle_b', ['Flags'] = 1},
            {['Label'] = "Finger", ['Type'] = 'animation', ['Dict'] = 'anim@mp_player_intselfiethe_bird', ['Anim'] = 'idle_a', ['Flags'] = 1},
            {['Label'] = "Peta näsan", ['Type'] = 'animation', ['Dict'] = 'anim@mp_player_intcelebrationmale@nose_pick', ['Anim'] = 'nose_pick', ['Flags'] = 1},
            {['Label'] = "Gråter", ['Type'] = 'animation', ['Dict'] = 'switch@trevor@floyd_crying', ['Anim'] = 'console_wasnt_fun_end_loop_floyd', ['Flags'] = 1},
            {['Label'] = "Släng kyss♥", ['Type'] = 'animation', ['Dict'] = 'anim@mp_player_intselfieblow_kiss', ['Anim'] = 'exit', ['Flags'] = 1},
    
        }    
    },
    {
        
        ['Label'] = 'Danser',
        ['Data'] = {
            {['Label'] = "Dans 1", ['Type'] = 'animation', ['Dict'] = 'anim@amb@nightclub@dancers@crowddance_groups@hi_intensity', ['Anim'] = 'hi_dance_crowd_17_v1_male^5', ['Flags'] = 1},
            {['Label'] = "Dans 2", ['Type'] = 'animation', ['Dict'] = 'anim@amb@nightclub@dancers@crowddance_groups@hi_intensity', ['Anim'] = 'hi_dance_crowd_15_v2_female^2', ['Flags'] = 1},
            {['Label'] = "Dans 3", ['Type'] = 'animation', ['Dict'] = 'anim@amb@nightclub@dancers@crowddance_groups@hi_intensity', ['Anim'] = 'hi_dance_crowd_15_v1_male^1', ['Flags'] = 1},
            {['Label'] = "Dans 4", ['Type'] = 'animation', ['Dict'] = 'anim@amb@nightclub@dancers@crowddance_groups@hi_intensity', ['Anim'] = 'hi_dance_crowd_15_v1_male^2', ['Flags'] = 1},
            {['Label'] = "Dans 5", ['Type'] = 'animation', ['Dict'] = 'anim@amb@nightclub@dancers@crowddance_groups@hi_intensity', ['Anim'] = 'hi_dance_crowd_15_v1_female^1', ['Flags'] = 1},
            {['Label'] = "Dans 6", ['Type'] = 'animation', ['Dict'] = 'anim@amb@nightclub@dancers@crowddance_groups@hi_intensity', ['Anim'] = 'hi_dance_crowd_15_v1_male^3', ['Flags'] = 1},
            {['Label'] = "Dans 7", ['Type'] = 'animation', ['Dict'] = 'anim@amb@nightclub@dancers@crowddance_groups@hi_intensity', ['Anim'] = 'hi_dance_crowd_15_v1_female^2', ['Flags'] = 1},
            {['Label'] = "Dans 8", ['Type'] = 'animation', ['Dict'] = 'anim@amb@nightclub@dancers@crowddance_groups@hi_intensity', ['Anim'] = 'hi_dance_crowd_15_v1_male^4', ['Flags'] = 1},
            {['Label'] = "Dans 9", ['Type'] = 'animation', ['Dict'] = 'anim@amb@nightclub@dancers@crowddance_groups@hi_intensity', ['Anim'] = 'hi_dance_crowd_15_v1_male^5', ['Flags'] = 1},
            {['Label'] = "Dans 10", ['Type'] = 'animation', ['Dict'] = 'anim@amb@nightclub@dancers@crowddance_groups@hi_intensity', ['Anim'] = 'hi_dance_crowd_15_v1_male^6', ['Flags'] = 1},
            {['Label'] = "Dans 11", ['Type'] = 'animation', ['Dict'] = 'anim@amb@nightclub@dancers@crowddance_groups@hi_intensity', ['Anim'] = 'hi_dance_crowd_15_v2_female^1', ['Flags'] = 1},
            {['Label'] = "Dans 12", ['Type'] = 'animation', ['Dict'] = 'anim@amb@nightclub@dancers@crowddance_groups@hi_intensity', ['Anim'] = 'hi_dance_crowd_15_v2_female^3', ['Flags'] = 1},
            {['Label'] = "Dans 13", ['Type'] = 'animation', ['Dict'] = 'anim@amb@nightclub@dancers@crowddance_groups@hi_intensity', ['Anim'] = 'hi_dance_crowd_15_v2_female^4', ['Flags'] = 1},
            {['Label'] = "Dans 14", ['Type'] = 'animation', ['Dict'] = 'anim@amb@nightclub@dancers@crowddance_groups@hi_intensity', ['Anim'] = 'hi_dance_crowd_15_v2_female^5', ['Flags'] = 1},
            {['Label'] = "Dans 15", ['Type'] = 'animation', ['Dict'] = 'anim@amb@nightclub@dancers@crowddance_groups@hi_intensity', ['Anim'] = 'hi_dance_crowd_15_v2_female^6', ['Flags'] = 1},
            {['Label'] = "Dans 16", ['Type'] = 'animation', ['Dict'] = 'anim@amb@nightclub@dancers@crowddance_groups@hi_intensity', ['Anim'] = 'hi_dance_crowd_15_v2_male^1', ['Flags'] = 1},
            {['Label'] = "Dans 17", ['Type'] = 'animation', ['Dict'] = 'anim@amb@nightclub@dancers@crowddance_groups@hi_intensity', ['Anim'] = 'hi_dance_crowd_15_v2_male^2', ['Flags'] = 1},
            {['Label'] = "Dans 18", ['Type'] = 'animation', ['Dict'] = 'anim@amb@nightclub@dancers@crowddance_groups@hi_intensity', ['Anim'] = 'hi_dance_crowd_15_v2_male^3', ['Flags'] = 1},
            {['Label'] = "Dans 19", ['Type'] = 'animation', ['Dict'] = 'anim@amb@nightclub@dancers@crowddance_groups@hi_intensity', ['Anim'] = 'hi_dance_crowd_15_v2_male^4', ['Flags'] = 1},
            {['Label'] = "Dans 20", ['Type'] = 'animation', ['Dict'] = 'anim@amb@nightclub@dancers@crowddance_groups@hi_intensity', ['Anim'] = 'hi_dance_crowd_17_v1_female^1', ['Flags'] = 1},
            {['Label'] = "Dans 21", ['Type'] = 'animation', ['Dict'] = 'anim@amb@nightclub@dancers@crowddance_groups@hi_intensity', ['Anim'] = 'hi_dance_crowd_15_v2_male^5', ['Flags'] = 1},
            {['Label'] = "Dans 22", ['Type'] = 'animation', ['Dict'] = 'anim@amb@nightclub@dancers@crowddance_groups@hi_intensity', ['Anim'] = 'hi_dance_crowd_15_v2_male^6', ['Flags'] = 1},
            {['Label'] = "Dans 23", ['Type'] = 'animation', ['Dict'] = 'anim@amb@nightclub@dancers@crowddance_groups@hi_intensity', ['Anim'] = 'hi_dance_crowd_17_v1_female^2', ['Flags'] = 1},
            {['Label'] = "Dans 24", ['Type'] = 'animation', ['Dict'] = 'anim@amb@nightclub@dancers@crowddance_groups@hi_intensity', ['Anim'] = 'hi_dance_crowd_17_v2_male^1', ['Flags'] = 1},
            {['Label'] = "Dans 25", ['Type'] = 'animation', ['Dict'] = 'anim@amb@nightclub@dancers@crowddance_groups@hi_intensity', ['Anim'] = 'hi_dance_crowd_17_v1_female^3', ['Flags'] = 1}, 
            {['Label'] = "Dans 26", ['Type'] = 'animation', ['Dict'] = 'anim@amb@nightclub@dancers@crowddance_groups@hi_intensity', ['Anim'] = 'hi_dance_crowd_17_v1_female^4', ['Flags'] = 1},
            {['Label'] = "Dans 27", ['Type'] = 'animation', ['Dict'] = 'anim@amb@nightclub@dancers@crowddance_groups@hi_intensity', ['Anim'] = 'hi_dance_crowd_17_v1_female^5', ['Flags'] = 1},
            {['Label'] = "Dans 28", ['Type'] = 'animation', ['Dict'] = 'anim@amb@nightclub@dancers@crowddance_groups@hi_intensity', ['Anim'] = 'hi_dance_crowd_17_v1_female^6', ['Flags'] = 1},
            {['Label'] = "Dans 29", ['Type'] = 'animation', ['Dict'] = 'anim@amb@nightclub@dancers@crowddance_groups@hi_intensity', ['Anim'] = 'hi_dance_crowd_17_v1_male^1', ['Flags'] = 1},
            {['Label'] = "Dans 30", ['Type'] = 'animation', ['Dict'] = 'anim@amb@nightclub@dancers@crowddance_groups@hi_intensity', ['Anim'] = 'hi_dance_crowd_17_v1_male^2', ['Flags'] = 1},
            {['Label'] = "Dans 31", ['Type'] = 'animation', ['Dict'] = 'anim@amb@nightclub@dancers@crowddance_groups@hi_intensity', ['Anim'] = 'hi_dance_crowd_17_v1_male^3', ['Flags'] = 1},
            {['Label'] = "Dans 32", ['Type'] = 'animation', ['Dict'] = 'anim@amb@nightclub@dancers@crowddance_groups@hi_intensity', ['Anim'] = 'hi_dance_crowd_09_v1_female^1', ['Flags'] = 1},
            {['Label'] = "Dans 33", ['Type'] = 'animation', ['Dict'] = 'anim@amb@nightclub@dancers@crowddance_groups@hi_intensity', ['Anim'] = 'hi_dance_crowd_09_v1_female^2', ['Flags'] = 1},
            {['Label'] = "Dans 34", ['Type'] = 'animation', ['Dict'] = 'anim@amb@nightclub@dancers@crowddance_groups@hi_intensity', ['Anim'] = 'hi_dance_crowd_09_v1_female^3', ['Flags'] = 1},
            {['Label'] = "Dans 35", ['Type'] = 'animation', ['Dict'] = 'anim@amb@nightclub@dancers@crowddance_groups@hi_intensity', ['Anim'] = 'hi_dance_crowd_09_v1_female^5', ['Flags'] = 1},
            {['Label'] = "Dans 36", ['Type'] = 'animation', ['Dict'] = 'anim@amb@nightclub@dancers@crowddance_groups@hi_intensity', ['Anim'] = 'hi_dance_crowd_09_v1_female^6', ['Flags'] = 1},
            {['Label'] = "Dans 37", ['Type'] = 'animation', ['Dict'] = 'anim@amb@nightclub@dancers@crowddance_groups@hi_intensity', ['Anim'] = 'hi_dance_crowd_09_v1_male^1', ['Flags'] = 1},
            {['Label'] = "Dans 38", ['Type'] = 'animation', ['Dict'] = 'anim@amb@nightclub@dancers@crowddance_groups@hi_intensity', ['Anim'] = 'hi_dance_crowd_09_v1_male^2', ['Flags'] = 1},
            {['Label'] = "Dans 39", ['Type'] = 'animation', ['Dict'] = 'anim@amb@nightclub@dancers@crowddance_groups@hi_intensity', ['Anim'] = 'hi_dance_crowd_09_v1_male^3', ['Flags'] = 1},
            {['Label'] = "Dans 40", ['Type'] = 'animation', ['Dict'] = 'anim@amb@nightclub@dancers@crowddance_groups@hi_intensity', ['Anim'] = 'hi_dance_crowd_09_v1_male^4', ['Flags'] = 1},
            {['Label'] = "Dans 41", ['Type'] = 'animation', ['Dict'] = 'anim@amb@nightclub@dancers@crowddance_groups@hi_intensity', ['Anim'] = 'hi_dance_crowd_09_v1_male^5', ['Flags'] = 1},
            {['Label'] = "Dans 42", ['Type'] = 'animation', ['Dict'] = 'anim@amb@nightclub@dancers@crowddance_groups@hi_intensity', ['Anim'] = 'hi_dance_crowd_09_v1_male^6', ['Flags'] = 1},
            {['Label'] = "Dans 43", ['Type'] = 'animation', ['Dict'] = 'anim@amb@nightclub@dancers@crowddance_groups@hi_intensity', ['Anim'] = 'hi_dance_crowd_17_v2_female^1', ['Flags'] = 1},
            {['Label'] = "Dans 44", ['Type'] = 'animation', ['Dict'] = 'anim@amb@nightclub@dancers@crowddance_groups@hi_intensity', ['Anim'] = 'hi_dance_crowd_17_v2_female^2', ['Flags'] = 1},
            {['Label'] = "Dans 45", ['Type'] = 'animation', ['Dict'] = 'anim@amb@nightclub@dancers@crowddance_groups@hi_intensity', ['Anim'] = 'hi_dance_crowd_17_v2_female^3', ['Flags'] = 1},
            {['Label'] = "Dans 46", ['Type'] = 'animation', ['Dict'] = 'anim@amb@nightclub@dancers@crowddance_groups@hi_intensity', ['Anim'] = 'hi_dance_crowd_17_v2_female^4', ['Flags'] = 1},
            {['Label'] = "Dans 47", ['Type'] = 'animation', ['Dict'] = 'anim@amb@nightclub@dancers@crowddance_groups@hi_intensity', ['Anim'] = 'hi_dance_crowd_17_v2_female^5', ['Flags'] = 1},
            {['Label'] = "Dans 48", ['Type'] = 'animation', ['Dict'] = 'random@chasethievesgen', ['Anim'] = 'flee_backward_shopkeeper', ['Flags'] = 0},
            {['Label'] = "Dans 49", ['Type'] = 'animation', ['Dict'] = 'anim@amb@nightclub@dancers@crowddance_groups@hi_intensity', ['Anim'] = 'hi_dance_crowd_17_v2_female^6', ['Flags'] = 1},
            {['Label'] = "Dans 50", ['Type'] = 'animation', ['Dict'] = 'anim@amb@nightclub@dancers@crowddance_groups@hi_intensity', ['Anim'] = 'hi_dance_crowd_17_v1_male^4', ['Flags'] = 1},
            {['Label'] = "Dans 51", ['Type'] = 'animation', ['Dict'] = 'anim@amb@nightclub@dancers@crowddance_groups@hi_intensity', ['Anim'] = 'hi_dance_crowd_17_v2_male^2', ['Flags'] = 1},
            {['Label'] = "Dans 52", ['Type'] = 'animation', ['Dict'] = 'anim@amb@nightclub@dancers@crowddance_facedj@', ['Anim'] = 'hi_dance_facedj_09_v1_male^3', ['Flags'] = 1},
            {['Label'] = "Dans 53", ['Type'] = 'animation', ['Dict'] = 'anim@amb@nightclub@dancers@crowddance_facedj@', ['Anim'] = 'hi_dance_facedj_09_v2_male^4', ['Flags'] = 1},
            {['Label'] = "Dans 54", ['Type'] = 'animation', ['Dict'] = 'anim@amb@nightclub@dancers@crowddance_facedj@', ['Anim'] = 'hi_dance_facedj_09_v2_male^6', ['Flags'] = 1},
            {['Label'] = "Mongo Dansen", ['Type'] = 'animation', ['Dict'] = 'anim@amb@casino@mini@dance@dance_solo@female@var_b@', ['Anim'] = 'high_center', ['Flags'] = 1},
        }    
    },
    {
        
        ['Label'] = 'Diverse',
        ['Data'] = {
            {['Label'] = "Sitt på marken", ['Type'] = 'animation', ['Dict'] = 'anim@heists@fleeca_bank@ig_7_jetski_owner', ['Anim'] = 'owner_idle', ['Flags'] = 1},
            {['Label'] = "Sitt mot en vägg", ['Type'] = 'scenario', ['Anim'] = 'WORLD_HUMAN_STUPOR'},
            {['Label'] = "Sitt på marken", ['Type'] = 'scenario', ['Anim'] = 'WORLD_HUMAN_PICNIC'},
            {['Label'] = "Sitta och pilla på telefon", ['Type'] = 'animation', ['Dict'] = 'anim@heists@prison_heistunfinished_biztarget_idle', ['Anim'] = 'target_idle', ['Flags'] = 1},
            {['Label'] = "Sitt på bänk, tänker på livet", ['Type'] = 'animation', ['Dict'] = 'switch@michael@parkbench_smoke_ranger', ['Anim'] = 'parkbench_smoke_ranger_loop', ['Flags'] = 1},
            {['Label'] = "Sitt på bänk, avslappnad", ['Type'] = 'animation', ['Dict'] = 'switch@michael@on_sofa', ['Anim'] = 'base_michael', ['Flags'] = 1},
            {['Label'] = "Luta dig mot en vägg", ['Type'] = 'animation', ['Dict'] = 'amb@world_human_leaning@male@wall@back@legs_crossed@base', ['Anim'] = 'base', ['Flags'] = 1},
            {['Label'] = "Luta dig mot en vägg cool", ['Type'] = 'animation', ['Dict'] = 'amb@world_human_leaning@male@wall@back@foot_up@idle_a', ['Anim'] = 'idle_a', ['Flags'] = 1},
            {['Label'] = "Luta dig mot en vägg -slumpad", ['Type'] = 'scenario', ['Anim'] = 'WORLD_HUMAN_LEANING'},
            {['Label'] = "Häng över räcke", ['Type'] = 'scenario', ['Anim'] = 'prop_human_bum_shopping_cart'},
            {['Label'] = "Luta dig mot ett räcke", ['Type'] = 'animation', ['Dict'] = 'anim@amb@yacht@rail@standing@male@variant_01@', ['Anim'] = 'base', ['Flags'] = 1},
            {['Label'] = "Luta dig mot en bardisk", ['Type'] = 'animation', ['Dict'] = 'anim@amb@yacht@rail@standing@male@variant_02@', ['Anim'] = 'base', ['Flags'] = 1},
            {['Label'] = "Ligga på rygg", ['Type'] = 'scenario', ['Anim'] = 'WORLD_HUMAN_SUNBATHE_BACK'},
            {['Label'] = "Ligga på mage", ['Type'] = 'scenario', ['Anim'] = 'WORLD_HUMAN_SUNBATHE'},
            {['Label'] = "Drick en kopp kaffe", ['Type'] = 'scenario', ['Anim'] = 'WORLD_HUMAN_AA_COFFEE'},
            {['Label'] = "Grilla", ['Type'] = 'scenario', ['Anim'] = 'PROP_HUMAN_BBQ'},
            {['Label'] = "Titanic", ['Type'] = 'animation', ['Dict'] = 'mini@prostitutes@sexlow_veh', ['Anim'] = 'low_car_bj_to_prop_female', ['Flags'] = 1},
            {['Label'] = "Händerna upp i luften", ['Type'] = 'animation', ['Dict'] = 'anim@mp_rollarcoaster', ['Anim'] = 'hands_up_idle_a_player_one', ['Flags'] = 10},
            {['Label'] = "Ta en selfie", ['Type'] = 'scenario', ['Anim'] = 'world_human_tourist_mobile'},
            {['Label'] = "Filma med telefonen", ['Type'] = 'scenario', ['Anim'] = 'WORLD_HUMAN_MOBILE_FILM_SHOCKING'},
            {['Label'] = "Tjuvlyssna (Genom vägg)", ['Type'] = 'animation', ['Dict'] = 'mini@safe_cracking', ['Anim'] = 'idle_base', ['Flags'] = 1},
            {['Label'] = "Pilla med mobilen", ['Type'] = 'scenario', ['Anim'] = 'world_human_stand_mobile'},
            {['Label'] = "Vars fan är jag? (karta)", ['Type'] = 'scenario', ['Anim'] = 'world_human_tourist_map'},
            {['Label'] = "Ont i magen(liggandes)", ['Type'] = 'animation', ['Dict'] = 'combat@damage@writheidle_a', ['Anim'] = 'writhe_idle_b', ['Flags'] = 1},
            {['Label'] = "Kissnödig", ['Type'] = 'animation', ['Dict'] = 'amb@world_human_prostitute@cokehead@base', ['Anim'] = 'base', ['Flags'] = 1},
            {['Label'] = "Nervös", ['Type'] = 'animation', ['Dict'] = 'switch@michael@parkbench_smoke_ranger', ['Anim'] = 'ranger_nervous_loop', ['Flags'] = 1},
            {['Label'] = "Armarna i kors", ['Type'] = 'animation', ['Dict'] = 'anim@heists@heist_corona@single_team', ['Anim'] = 'single_team_loop_boss', ['Flags'] = 1},
        
        }    
    },
    {
        
        ['Label'] = 'Stunt',
        ['Data'] = {
          {['Label'] = "Sväng åt vänster", ['Type'] = 'animation', ['Dict'] = 'rcmextreme2atv', ['Anim'] = 'idle_b', ['Flags'] = 32},
          {['Label'] = "Ta de chill", ['Type'] = 'animation', ['Dict'] = 'rcmextreme2atv', ['Anim'] = 'idle_a', ['Flags'] = 32},
          {['Label'] = "Sväng åt vänster", ['Type'] = 'animation', ['Dict'] = 'rcmextreme2atv', ['Anim'] = 'idle_c', ['Flags'] = 32},
          {['Label'] = "Sida till sida ", ['Type'] = 'animation', ['Dict'] = 'rcmextreme2atv', ['Anim'] = 'idle_d', ['Flags'] = 32},
          {['Label'] = "Surfa", ['Type'] = 'animation', ['Dict'] = 'rcmextreme2atv', ['Anim'] = 'idle_e', ['Flags'] = 32},
        }    
    },
    {
        
        ['Label'] = 'Gångstilar',
        ['Data'] = {
            {['Label'] = "Normal man", ['Type'] = 'walking_style', ['Style'] = 'move_m@generic'},
            {['Label'] = "Normal kvinna", ['Type'] = 'walking_style', ['Style'] = 'move_f@generic'},
            {['Label'] = "Deprimerad man", ['Type'] = 'walking_style', ['Style'] = 'move_m@depressed@a'},
            {['Label'] = "Deprimerad kvinna", ['Type'] = 'walking_style', ['Style'] = 'move_f@depressed@a'},
            {['Label'] = "Business", ['Type'] = 'walking_style', ['Style'] = 'move_m@business@a'},
            {['Label'] = "Business 2", ['Type'] = 'walking_style', ['Style'] = 'move_m@business@b'},
            {['Label'] = "Business 3", ['Type'] = 'walking_style', ['Style'] = 'move_m@business@c'},
            {['Label'] = "Bestämd", ['Type'] = 'walking_style', ['Style'] = 'move_m@brave@a'},
            {['Label'] = "Lugn", ['Type'] = 'walking_style', ['Style'] = 'move_m@casual@a'},
            {['Label'] = "Tung person", ['Type'] = 'walking_style', ['Style'] = 'move_m@fat@a'},
            {['Label'] = "Hipster", ['Type'] = 'walking_style', ['Style'] = 'move_m@hipster@a'},
            {['Label'] = "Skadad", ['Type'] = 'walking_style', ['Style'] = 'move_m@injured'},
            {['Label'] = "Osäker snabb", ['Type'] = 'walking_style', ['Style'] = 'move_m@hurry@a'},
            {['Label'] = "Hobo", ['Type'] = 'walking_style', ['Style'] = 'move_m@hobo@a'},
            {['Label'] = "Ledsen", ['Type'] = 'walking_style', ['Style'] = 'move_m@sad@a'},
            {['Label'] = "Biff", ['Type'] = 'walking_style', ['Style'] = 'move_m@muscle@a'},
            {['Label'] = "Chokad", ['Type'] = 'walking_style', ['Style'] = 'move_m@shocked@a'},
            {['Label'] = "Avvikande", ['Type'] = 'walking_style', ['Style'] = 'move_m@shadyped@a'},
            {['Label'] = "Utmattad", ['Type'] = 'walking_style', ['Style'] = 'move_m@buzzed'},
            {['Label'] = "Bestämd snabb", ['Type'] = 'walking_style', ['Style'] = 'move_m@hurry_butch@a'},
            {['Label'] = "Hippie", ['Type'] = 'walking_style', ['Style'] = 'move_m@money'},
            {['Label'] = "Smygaktig springstil", ['Type'] = 'walking_style', ['Style'] = 'move_m@quick'},
            {['Label'] = "Tudelu", ['Type'] = 'walking_style', ['Style'] = 'move_f@maneater'},
            {['Label'] = "Två väskor och högklackat", ['Type'] = 'walking_style', ['Style'] = 'move_f@sassy'},
            {['Label'] = "Arrogant", ['Type'] = 'walking_style', ['Style'] = 'move_f@arrogant@a'},
            {['Label'] = "Jag kan också springa", ['Type'] = 'walking_style', ['Style'] = 'move_m@alien'},
            {['Label'] = "Getto", ['Type'] = 'walking_style', ['Style'] = 'move_m@gangster@generic'},
            {['Label'] = "Full", ['Type'] = 'walking_style', ['Style'] = 'move_m@drunk@slightlydrunk'},
            {['Label'] = "Fullare", ['Type'] = 'walking_style', ['Style'] = 'move_m@drunk@moderatedrunk'},
            {['Label'] = "Fullast", ['Type'] = 'walking_style', ['Style'] = 'move_m@drunk@verydrunk'},
            {['Label'] = "Franklin", ['Type'] = 'walking_style', ['Style'] = 'move_p_m_one'},
            {['Label'] = "Gangster", ['Type'] = 'walking_style', ['Style'] = 'move_m@gangster@ng'},
            {['Label'] = "Grooving", ['Type'] = 'walking_style', ['Style'] = 'anim@move_m@grooving@'},
            {['Label'] = "Hipster", ['Type'] = 'walking_style', ['Style'] = 'move_m@hipster@a'},
            {['Label'] = "Snabba på", ['Type'] = 'walking_style', ['Style'] = 'move_f@hurry@a'},
        }    
    },



    {
        
        ['Label'] = 'Överkroppen',
        ['Data'] = {
            {['Label'] = "Peta i näsan", ['Type'] = 'animation', ['Dict'] = 'anim@mp_player_intuppernose_pick', ['Anim'] = 'idle_a', ['Flags'] = 1},
            {['Label'] = "Luftjucka", ['Type'] = 'animation', ['Dict'] = 'anim@mp_player_intupperair_shagging', ['Anim'] = 'idle_a', ['Flags'] = 1},
            {['Label'] = "Knäck fingrarna", ['Type'] = 'animation', ['Dict'] = 'anim@mp_player_intupperknuckle_crunch', ['Anim'] = 'idle_a', ['Flags'] = 1},
            {['Label'] = "Nej nej", ['Type'] = 'animation', ['Dict'] = 'anim@mp_player_intupperno_way', ['Anim'] = 'idle_a', ['Flags'] = 1},
            {['Label'] = "Tummar upp", ['Type'] = 'animation', ['Dict'] = 'anim@mp_player_intupperthumbs_up', ['Anim'] = 'idle_a', ['Flags'] = 1},
            {['Label'] = "Vifta Peace", ['Type'] = 'animation', ['Dict'] = 'anim@mp_player_intupperv_sign', ['Anim'] = 'idle_a', ['Flags'] = 1},
            {['Label'] = "Kokobello", ['Type'] = 'animation', ['Dict'] = 'anim@mp_player_intupperyou_loco', ['Anim'] = 'idle_a', ['Flags'] = 1},
            {['Label'] = "Tyst", ['Type'] = 'animation', ['Dict'] = 'anim@mp_player_intuppershush', ['Anim'] = 'idle_a', ['Flags'] = 1},
            {['Label'] = "Klappa", ['Type'] = 'animation', ['Dict'] = 'anim@mp_player_intupperslow_clap', ['Anim'] = 'idle_a', ['Flags'] = 1},
            {['Label'] = ":P", ['Type'] = 'animation', ['Dict'] = 'anim@mp_player_intupperthumb_on_ears', ['Anim'] = 'idle_a', ['Flags'] = 1},
            {['Label'] = "Vinka som en drottning", ['Type'] = 'animation', ['Dict'] = 'anim@mp_player_intupperwave', ['Anim'] = 'idle_a', ['Flags'] = 1},
            {['Label'] = "Groove", ['Type'] = 'animation', ['Dict'] = 'anim@mp_player_intupperuncle_disco', ['Anim'] = 'idle_a', ['Flags'] = 1},
            {['Label'] = "Klia rövhålet", ['Type'] = 'animation', ['Dict'] = 'mp_player_int_upperarse_pick ', ['Anim'] = 'enter', ['Flags'] = 1},
            {['Label'] = "Fuck You", ['Type'] = 'animation', ['Dict'] = 'anim@mp_player_intselfiethe_bird', ['Anim'] = 'idle_a', ['Flags'] = 1},
    
        }    
    },
    {
        
        ['Label'] = 'PEGI 21',
        ['Data'] = {
            {['Label'] = "Klias på bollarna", ['Type'] = 'animation', ['Dict'] = 'mp_player_int_uppergrab_crotch', ['Anim'] = 'mp_player_int_grab_crotch', ['Flags'] = 1},
            {['Label'] = "Vink vink", ['Type'] = 'animation', ['Dict'] = 'mini@strip_club@idles@stripper', ['Anim'] = 'stripper_idle_02', ['Flags'] = 1},
            {['Label'] = "Bröstfokus", ['Type'] = 'animation', ['Dict'] = 'mini@strip_club@backroom@', ['Anim'] = 'stripper_b_backroom_idle_b', ['Flags'] = 1},
            {['Label'] = "Strip Tease 1", ['Type'] = 'animation', ['Dict'] = 'mini@strip_club@lap_dance@ld_girl_a_song_a_p1', ['Anim'] = 'ld_girl_a_song_a_p1_f', ['Flags'] = 1},
            {['Label'] = "Strip Tease 2", ['Type'] = 'animation', ['Dict'] = 'mini@strip_club@private_dance@part2', ['Anim'] = 'priv_dance_p2', ['Flags'] = 1},
            {['Label'] = "Stip Tease 3", ['Type'] = 'animation', ['Dict'] = 'mini@strip_club@private_dance@part3', ['Anim'] = 'priv_dance_p3', ['Flags'] = 1},
            {['Label'] = "Lapdance 1", ['Type'] = 'animation', ['Dict'] = 'mini@strip_club@lap_dance@ld_girl_a_song_a_p1', ['Anim'] = 'ld_girl_a_song_a_p1_f_face', ['Flags'] = 1},
            {['Label'] = "Ta", ['Type'] = 'animation', ['Dict'] = 'rcmpaparazzo_2', ['Anim'] = 'shag_loop_poppy', ['Flags'] = 1},
            {['Label'] = "Ge", ['Type'] = 'animation', ['Dict'] = 'rcmpaparazzo_2', ['Anim'] = 'shag_loop_a', ['Flags'] = 1},
            {['Label'] = "Kolla på strippor", ['Type'] = 'animation', ['Dict'] = 'mini@strip_club@leaning@base', ['Anim'] = 'base', ['Flags'] = 1},
    
        }    
    }, 
}
