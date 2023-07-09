Config.MegaMall = {
    ["entrance"] = {
        ["pos"] = vector3(2747.9279785156, 3472.796875, 55.673221588135),
        ["label"] = "Gå in."
    },
    ["exit"] = {
        ["pos"] = vector3(1087.4390869141, -3099.419921875, -38.99995803833),
        ["label"] = "Gå ut."
    },
    ["computer"] = {
        ["pos"] = vector3(1088.4245605469, -3101.2800292969, -38.99995803833),
        ["label"] = "Använd datorn."
    },
    ["object"] = {
        ["pos"] = vector3(1095.916015625, -3100.3781738281, -38.99995803833),
        ["rotation"] = vector3(0.0, 0.0, 270.0)
    }
}

Config.FurnishingPurchasables = {
    ["Sängar"] = {
        ["big_double_bed"] = {
            ["label"] = "Dubbelsäng, medelstorlek",
            ["description"] = "En snygg säng som är ganska stor.",
            ["price"] = 1500,
            ["model"] = `apa_mp_h_bed_double_09`
        }
    },

    ["Växter"] = {
        ["high_brown_pot"] = {
            ["label"] = "Hög växt i brun kruka",
            ["description"] = "Hög växt i brun kruka.",
            ["price"] = 600,
            ["model"] = `apa_mp_h_acc_plant_tall_01`
        }
    },

    ["Förvaring"] = {
        ["large_drawer"] = {
            ["label"] = "Stor byrålåda",
            ["description"] = "En stor byrålåda som ger dig möjlighet att förvara föremål.",
            ["price"] = 1350,
            ["model"] = `hei_heist_bed_chestdrawer_04`,
            ["func"] = function(furnishId)
                OpenStorage("motel-" .. furnishId)
            end
        }
    },
    
    ["Mattor"] = {
        ["big_rug"] = {
            ["label"] = "Blå/Vit ombre färgad matta",
            ["description"] = "En snygg matta som ser bra ut med en gradient effekt.",
            ["price"] = 799,
            ["model"] = `apa_mp_h_acc_rugwoolm_03`
        }
    },
    
    ["Lampor"] = {
        ["floorlamp_mp_apa"] = {
            ["label"] = "Golvlampa design",
            ["description"] = "En snygg lampa som ger bra ljus samtidigt som den är snygg.",
            ["price"] = 599,
            ["model"] = `apa_mp_h_floorlamp_b`
        }
    },

    ["Bänkar"] = {
        ["gray_white_tv_table"] = {
            ["label"] = "Gråvit tvbänk",
            ["description"] = "En snygg bänk.",
            ["price"] = 1100,
            ["model"] = `apa_mp_h_str_sideboardl_13`
        }
    },

    ["Bord"] = {
        ["modern_triangle_table"] = {
            ["label"] = "Modern Trekantigt bord",
            ["description"] = "Ett snyggt bord.",
            ["price"] = 799,
            ["model"] = `apa_mp_h_tab_coffee_07`
        }
    },

    ["Tavlor"] = {
        ["orange_painting"] = {
            ["label"] = "S - Orange tavla",
            ["description"] = "En snygg tavla.",
            ["price"] = 399,
            ["model"] = `apa_p_h_acc_artwalll_02`
        }
    },

    ["Stolar"] = {
        ["chair_glass"] = {
            ["label"] = "Ståbord i glas",
            ["description"] = "En skön stol.",
            ["price"] = 699,
            ["model"] = `bkr_prop_clubhouse_armchair_01a`
        }
    },

    ["Elektronik"] = {
        ["big_tv"] = {
            ["label"] = "Stor TV",
            ["description"] = "En stor och bra kvalité TV.",
            ["price"] = 3300,
            ["model"] = `ex_prop_ex_tv_flat_01`
        }
    },

    ["Prydnader"] = {
        ["three_vases"] = {
            ["label"] = "3 små vaser på en bricka",
            ["description"] = "Snygga vaser, design.",
            ["price"] = 299,
            ["model"] = `hei_heist_acc_tray_01`
        }
    },

    ["Fritid"] = {
        ["water_can"] = {
            ["label"] = "Vatten grej",
            ["description"] = "En vatten grej som du kan ta vatten ur.",
            ["price"] = 599,
            ["model"] = `prop_watercooler`,
            ["func"] = function(furnishId)
                UseWaterCan(furnishId)
            end
        }
    }
}