Config = {
    Start = {
        Coords = vector3(405.6191711425781, -997.1217651367188, -99.00411987304688), 
        Heading = 87.24614715576172, 
        Animations = {
            Dict = "mp_character_creation@customise@male_a", 
            Lib = "intro"
        },
    },

    Cam = {
        Coords = vector3(415.1120300292969, -998.4392700195312, -98.4041519165039), 
        Heading = 88.86622619628906
    }
};

Config.Categories = {
    {
        ["label"] = "Kön",
        ["options"] = {
            { ["label"] = "Välj kön", ["type"] = "sex" }
        }
    },
    {
        ["label"] = "Ansikte",
        ["anim"] = "face",
        ["options"] = {
            { ["label"] = "Ansiktsform", ["type"] = "face" },
            { ["label"] = "Ögonfärg", ["type"] = "eye_color" },
            { ["label"] = "Näsbredd", ["type"] = "nose_width" },
            { ["label"] = "Näslutning höjd", ["type"] = "nose_peak_height" },
            { ["label"] = "Näslutning längd", ["type"] = "nose_peak_length" },
            { ["label"] = "Näslutning nedåt", ["type"] = "nose_peak_lowering" },
            { ["label"] = "Näsben höjd", ["type"] = "nose_bone_high" },
            { ["label"] = "Ögonbrynshöjd", ["type"] = "eyebrown_high" },
            { ["label"] = "Kindbenshöjd", ["type"] = "cheeks_bone_high" },
            { ["label"] = "Kindbensbredd", ["type"] = "cheeks_bone_width" },
            { ["label"] = "Kindbredd", ["type"] = "cheeks_width" },
            { ["label"] = "Käkbensbredd", ["type"] = "jaw_bone_width" },
            { ["label"] = "Käkbenslängd", ["type"] = "jaw_bone_back_length" },
            { ["label"] = "Hakbenlutning", ["type"] = "chimp_bone_lowering" },
            { ["label"] = "Hakbenslängd", ["type"] = "chimp_bone_length" },
            { ["label"] = "Hakbensbredd", ["type"] = "chimp_bone_width" },
            { ["label"] = "Hakgrop", ["type"] = "chimp_hole" }
        }
    },
    {
        ["label"] = "Hy",
        ["anim"] = "face",
        ["options"] = {
            { ["label"] = "Hudfärg", ["type"] = "skin" },
            { ["label"] = "Rynkor", ["type"] = "age_1" },
            { ["label"] = "Rynkor mängd", ["type"] = "age_2" },
            { ["label"] = "Smink typ", ["type"] = "makeup_1" },
            { ["label"] = "Smink tjocklek", ["type"] = "makeup_2" },
            { ["label"] = "Smink färg 1", ["type"] = "makeup_3" },
            { ["label"] = "Smink färg 2", ["type"] = "makeup_4" },
            { ["label"] = "Läppstift", ["type"] = "lipstick_1" },
            { ["label"] = "Läppstift mängd", ["type"] = "lipstick_2" },
            { ["label"] = "Läppstift färg", ["type"] = "lipstick_3" },
            { ["label"] = "Blush", ["type"] = "blush_1" },
            { ["label"] = "Blush mängd", ["type"] = "blush_2" },
            { ["label"] = "Blush färg", ["type"] = "blush_3" },
            { ["label"] = "Akne", ["type"] = "blemishes_1" },
            { ["label"] = "Akne mängd", ["type"] = "blemishes_2" },
            { ["label"] = "Fräknar", ["type"] = "moles_1" },
            { ["label"] = "Fräknar mängd", ["type"] = "moles_2" },
            { ["label"] = "Solbränna", ["type"] = "sun_1" },
            { ["label"] = "Solbränna mängd", ["type"] = "sun_2" },
        }
    },
    {
        ["label"] = "Hår",
        ["anim"] = "face",
        ["options"] = {
            { ["label"] = "Hår", ["type"] = "hair_1" },
            { ["label"] = "Hårfärg", ["type"] = "hair_color_1" },
            { ["label"] = "Skägg", ["type"] = "beard_1" },
            { ["label"] = "Skäggmängd", ["type"] = "beard_2" },
            { ["label"] = "Skäggfärg", ["type"] = "beard_3" },
            { ["label"] = "Ögonbryn", ["type"] = "eyebrows_1" },
            { ["label"] = "Ögonbrynmängd", ["type"] = "eyebrows_2" },
            { ["label"] = "Ögonbrynfärg", ["type"] = "eyebrows_3" }
        }
    },
    {
        ["label"] = "Tröja / T-Shirt",
        ["anim"] = "drop_intro",
        ["animOutro"] = "drop_outro",
        ["options"] = {
            { ["label"] = "T-Shirt", ["type"] = "tshirt_1" },
            { ["label"] = "T-Shirt färg", ["type"] = "tshirt_2" },
            { ["label"] = "Tröja", ["type"] = "torso_1" },
            { ["label"] = "Tröjfärg", ["type"] = "torso_2" },
            { ["label"] = "Armar 1", ["type"] = "arms" },
            { ["label"] = "Armar 2", ["type"] = "arms_2" }, 
        }
    },
    {
        ["label"] = "Accessoarer", 
        ["options"] = {
            { ["label"] = "Halsband 1", ["type"] = "chain_1" },
            { ["label"] = "Halsband 2", ["type"] = "chain_1" },
            { ["label"] = "Hjälm 1", ["type"] = "helmet_1" },
            { ["label"] = "Hjälm 2", ["type"] = "helmet_2" },
            { ["label"] = "Glasögon 1", ["type"] = "glasses_1" },
            { ["label"] = "Glasögon 2", ["type"] = "glasses_2" },
            { ["label"] = "Klockor 1", ["type"] = "watches_1" },
            { ["label"] = "Klockor 2", ["type"] = "watches_2" },
        }
    },
    {
        ["label"] = "Byxor",
        ["anim"] = "clothes_a",
        ["options"] = {
            { ["label"] = "Byxor", ["type"] = "pants_1" },
            { ["label"] = "Byxfärg", ["type"] = "pants_2" }
        }
    },
    {
        ["label"] = "Skor",
        ["anim"] = "clothes_a",
        ["options"] = {
            { ["label"] = "Skor", ["type"] = "shoes_1" },
            { ["label"] = "Skofärg", ["type"] = "shoes_2" }
        }
    },
}
