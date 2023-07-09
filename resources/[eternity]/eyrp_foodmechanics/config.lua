Config = {};

Config.Machines = {
    ['prop_vend_soda_01'] = 'Drinks',
    ['prop_vend_soda_02'] = 'Drinks',
    ['prop_vend_snak_01'] = 'Foods',
    ['prop_vend_coffe_01'] = 'Coffe'
}

Config.Alignments = {
    ['prop_vend_coffe_01'] = {
        x = 0.0, 
        y = 0.0, 
        z = 1.0
    },
    ['prop_vend_soda_02'] = {
        x = 0.0, 
        y = 0.0, 
        z = 0.0
    },
    ['prop_vend_snak_01'] = {
        x = 0.0, 
        y = 0.0, 
        z = 0.0
    },
    ['prop_vend_soda_01'] = {
        x = 0.0, 
        y = 0.0, 
        z = 0.0
    },
}

Config.Elemets = {
    ['Coffe'] = {
        {
            ['label'] = 'Kaffe (20kr)',
            ['price'] = 20,
            ['item'] = 'kaffe',
            ['prop'] = 'p_amb_coffeecup_01'
        },
    },

    ['Foods'] = {
        {
            ['label'] = 'Marabou Mjölkcohklad (20kr)',
            ['price'] = 20,
            ['item'] = 'marabou',
            ['prop'] = 'marabou'
        },
        {
            ['label'] = 'Chokladmunk (10kr)',
            ['price'] = 10,
            ['item'] = 'chokladmunk',
            ['prop'] = 'prop_donut_02'
        },
        {
            ['label'] = 'Sockermunk (10kr)',
            ['price'] = 10,
            ['item'] = 'ringmunk',
            ['prop'] = 'prop_donut_01'
        },
        {
            ['label'] = 'Macka (10kr)',
            ['price'] = 10,
            ['item'] = 'bread',
            ['prop'] = 'prop_sandwich_01'
        }

    },

    ['Drinks'] = {
        { 
            ['label'] = 'Coca Cola 33cl (15kr)',
            ['price'] = 15,
            ['item'] = 'cola',
            ['prop'] = 'cola'
        },
        { 
            ['label'] = 'Fanta Orange 33cl (15kr)',
            ['price'] = 15,
            ['item'] = 'fanta',
            ['prop'] = 'fanta'
        },
        { 
            ['label'] = 'Nocco Miami 33cl (25kr)',
            ['price'] = 25,
            ['item'] = 'noccomiami',
            ['prop'] = 'nocco'
        },
        { 
            ['label'] = 'Redbull 25cl (20kr)',
            ['price'] = 20,
            ['item'] = 'redbull',
            ['prop'] = 'redbull'
        },
        { 
            ['label'] = 'Monster Original 500ml (25kr)',
            ['price'] = 25,
            ['item'] = 'monster',
            ['prop'] = 'itap_monster'
        },
        { 
            ['label'] = 'Monster Absolutely Zero 500ml (25kr)',
            ['price'] = 25,
            ['item'] = 'monster2',
            ['prop'] = 'itap_monster2'
        },
        { 
            ['label'] = 'Monster Lewis Hamilton 500ml (25kr)',
            ['price'] = 25,
            ['item'] = 'monster3',
            ['prop'] = 'itap_monster3'
        }
    }
}