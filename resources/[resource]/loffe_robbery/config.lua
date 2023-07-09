Config = {}
Translation = {}

Config.Shopkeeper = 416176080 -- hash of the shopkeeper ped
Config.Locale = 'sv' -- 'en', 'sv' or 'custom'

Config.Shops = {
    {coords = vector3(24.03449058532715, -1347.8515625, 29.49702453613281), heading = 266.0, money = {500, 1000}, cops = 0, blip = false, name = '7/11', cooldown = {hour = 0, minute = 30, second = 0}, robbed = false},
    {coords = vector3(-705.73, -914.91, 19.22-0.98), heading = 91.0, money = {500, 1000}, cops = 0, blip = false, name = '7/11', cooldown = {hour = 0, minute = 30, second = 0}, robbed = false},
    {coords = vector3(372.0137023925781, 326.0346984863281, 103.56637573242188), heading = 252.26791381835935, money = {500, 1000}, cops = 0, blip = false, name = '7/11', cooldown = {hour = 0, minute = 30, second = 0}, robbed = false}
}

Translation = {
    ['en'] = {
        ['shopkeeper'] = 'shopkeeper',
        ['robbed'] = "I was just robbed and ~r~don't ~w~have any money left!",
        ['cashrecieved'] = 'You got:',
        ['currency'] = '$',
        ['scared'] = 'Scared:',
        ['no_cops'] = 'There are ~r~not~w~ enough cops online!',
        ['cop_msg'] = 'We have sent a photo of the robber taken by the CCTV camera!',
        ['set_waypoint'] = 'Set waypoint to the store',
        ['hide_box'] = 'Close this box',
        ['robbery'] = 'Robbery in progress',
        ['walked_too_far'] = 'You walked too far away!'
    },
    ['nl'] = {
        ['shopkeeper'] = 'winkelier',
        ['robbed'] = "Ik ben net beroofd en ik heb ~r~geen ~w~geld meer over!",
        ['cashrecieved'] = 'Je hebt:',
        ['currency'] = '$',
        ['scared'] = 'Bang:',
        ['no_cops'] = 'Er zijn ~r~niet ~w~genoeg agenten online!',
        ['cop_msg'] = 'We hebben een foto van de overvaller gestuurd die genomen is door de CCTV camera!',
        ['set_waypoint'] = 'Stel een waypoint in naar de winkel',
        ['hide_box'] = 'Sluit deze doos',
        ['robbery'] = 'Overval gaande',
        ['walked_too_far'] = 'Je bent te ver weg gelopen!'
    },    
    ['sv'] = {
        ['shopkeeper'] = 'butiksbiträde',
        ['robbed'] = 'Jag blev precis rånad och har inga pengar kvar!',
        ['cashrecieved'] = 'Du fick:',
        ['currency'] = 'SEK',
        ['scared'] = 'Rädd:',
        ['no_cops'] = 'Det är inte tillräckligt med poliser online!',
        ['cop_msg'] = 'Vi har skickat en bild på rånaren från övervakningskamerorna!',
        ['set_waypoint'] = 'Sätt GPS punkt på butiken',
        ['hide_box'] = 'Stäng denna rutan',
        ['robbery'] = 'Pågående butiksrån',
        ['walked_too_far'] = 'Du gick för långt bort!'
    },
    ['custom'] = { -- edit this to your language
        ['shopkeeper'] = '',
        ['robbed'] = '',
        ['cashrecieved'] = '',
        ['currency'] = '',
        ['scared'] = '',
        ['no_cops'] = '',
        ['cop_msg'] = '',
        ['set_waypoint'] = '',
        ['hide_box'] = '',
        ['robbery'] = '',
        ['walked_too_far'] = ''
    }
}