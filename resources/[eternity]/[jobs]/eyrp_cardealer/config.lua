Config = {};

Config.OrderTime = 1 --86400 

Config.Locations = {
    CarDealer = {
        CarDealers = {
            Text = "Öppna datorn",
            Coords = vector3(-825.25, -208.9998779296875, 37.47154998779297)
        },
        BossActions = {
            Text = "Öppna chefpanel",
            Coords = vector3(-788.852294921875, -216.44815063476565, 37.07962417602539)
        }

    }
}

Config.Vehicles = {
    ['sports'] = {
        {
            Label = 'Buffalo',
            Model = 'buffalo',
            Price = 20000,
            Img = './assets/img/vehicles/buffalo.png',
            Desc = ""
        },
        {
            Label = 'Comet',
            Model = 'comet',
            Price = 20000,
            Img = 'https://static.wikia.nocookie.net/gtawiki/images/d/d2/Comet-GTAV-front.png/revision/latest?cb=20160702195302',
            Desc = "Du ville alltid ha en av dessa när du gick i gymnasiet - och nu kan du ha bilen som säger till alla ja, det här är implantat - på huvudet och i den svindriga tårtan bredvid dig. Bom. Du går, tiger."
        },
        {
            Label = '9F',
            Model = '9F',
            Price = 20000,
            Img = 'https://static.wikia.nocookie.net/gtawiki/images/2/2d/9F-GTAV-front.png/revision/latest?cb=20150529201705',
            Desc = "När du väl sitter i den här bilen vill du inte köra något annat. Jättebra i snön. Inte riktigt, du kommer förmodligen att dö om du tar det överväldigade djuret i närheten av fukt. Som tur är bor du i en öken."
        },
        {
            Label = '9F Cabrio',
            Model = '9F Cabrio',
            Price = 20000,
            Img = 'https://static.wikia.nocookie.net/gtawiki/images/a/a1/9FCabrio-GTAV-front.png/revision/latest/scale-to-width-down/350?cb=20150529201708',
            Desc = "Det är inget fel med standard Obey 9F, men det här är Eternity. Spendera extra 5k och få den konvertibla versionen. Du spenderar tillräckligt med ditt liv i luftkonditionering redan."
        },
        {
            Label = 'Alpha',
            Model = 'alpha',
            Price = 20000,
            Img = 'https://static.wikia.nocookie.net/gtawiki/images/9/94/Alpha-GTAV-front.png/revision/latest/scale-to-width-down/350?cb=20160917231444',
            Desc = "Alpha blandar modern prestanda och design med den klassiska lyxiga stilen på en ståtlig bil. Den är elegant, sexig och hanterar så bra att du glömmer att du kör den. Vilket kan vara ett problem vid 150 mph .."
        },
        {
            Label = 'Banshee',
            Model = 'banshee',
            Price = 20000,
            Img = 'https://static.wikia.nocookie.net/gtawiki/images/9/9e/BansheeTopless-GTAV-front.png/revision/latest/scale-to-width-down/350?cb=20160929173526',
            Desc = "Det är inget fel med standard Obey 9F, men det här är Eternity. Spendera extra 5k och få den konvertibla versionen. Du spenderar tillräckligt med ditt liv i luftkonditionering redan."
        },
        {
            Label = 'Buffalo Sport',
            Model = 'buffalo2',
            Price = 20000,
            Img = 'https://static.wikia.nocookie.net/gtawiki/images/e/e1/BuffaloS-GTAV-front.png/revision/latest/scale-to-width-down/350?cb=20150531171438',
            Desc = "Spotted som rusar iväg från många Eternity brottsplatser, detta är en specialutgåva av den uppdaterade 60 -talets muskelbil. Sportmotorpaketet, aerodynamiska body styling -paketet och årliga uppgraderingar gör priset värt"
        },
        {
            Label = 'Carbonizzare',
            Model = 'carbonizzare',
            Price = 20000,
            Img = 'https://static.wikia.nocookie.net/gtawiki/images/7/7b/CarbonizzareDown-GTAV-front.png/revision/latest/scale-to-width-down/350?cb=20160917231442',
            Desc = "Det är ingen chock att ett land där en man inte hade några betänkligheter om att klä sig i en kanarigul string skulle veta hur man producerar fordon som får dig att märkas. Carbonizzare är den ultimata sportbilen för miljonären som vill att folk ska veta att de är miljonärer."
        },
        {
            Label = 'Coquette',
            Model = 'coquette',
            Price = 20000,
            Img = 'https://static.wikia.nocookie.net/gtawiki/images/0/08/Coquette-GTAV-front.png/revision/latest/scale-to-width-down/350?cb=20190818142055',
            Desc = "Något tillverkat i Amerika som fortfarande kan ta på sig den asiatiska importen? Ja, Coquette har klarat tidens tand och med den här nya modellen blåste Invetero igenom alla sina räddningspengar för att skapa en slutprodukt som bara 1% har råd med. Bita inte i handen som matar dig"
        },
        {
            Label = 'Elegy RH8',
            Model = 'elegy2',
            Price = 20000,
            Img = 'https://static.wikia.nocookie.net/gtawiki/images/4/4f/ElegyRH8-GTAV-front.png/revision/latest/scale-to-width-down/350?cb=20160525194616',
            Desc = "Född i bränderna i Mt. Fuji och testad på någon tysk vägtullväg, du kan äntligen lagligt äga denna legendariska superbil utan rädsla för att få din dörr sparkad av FIB eftersom de hellre krossar importbilar än att fånga terrorister."
        },
        {
            Label = 'Feltzer',
            Model = 'feltzer',
            Price = 20000,
            Img = 'https://static.wikia.nocookie.net/gtawiki/images/8/8f/Feltzer-GTAVPC-Front.png/revision/latest/scale-to-width-down/350?cb=20150718115304',
            Desc = "Denna lyxbil på ingångsnivå är för killar på ingångsnivå-säljare, marknadsföringsdörrar, människor på tekniska företag som vill känna att de har klarat det men de kommer aldrig riktigt att göra det. Visa människor vilken typ av man du vill vara."
        },
        {
            Label = 'Furore GT',
            Model = 'furoregt',
            Price = 20000,
            Img = 'https://static.wikia.nocookie.net/gtawiki/images/5/56/FuroreGT-GTAV-front.png/revision/latest/scale-to-width-down/350?cb=20160302175246',
            Desc = "Från Los Santos till Eternity, Sverige kommer den här uppdaterade klassikerns utseende, kraft, arv och exklusivitet att vända på huvudet och öppna benen (öppningsbara ben kan inte garanteras). Det är så iögonfallande som konsumtionen blir, och du bryr dig inte. Egentligen bryr du dig förmodligen om du inte skulle tänka på att köpa den."
        },
        {
            Label = 'Fusilade',
            Model = 'fusilade',
            Price = 20000,
            Img = 'https://static.wikia.nocookie.net/gtawiki/images/a/a0/Fusilade-GTAV-front.png/revision/latest/scale-to-width-down/350?cb=20160409171753',
            Desc = "Svenskt märke, tyska pengar och tillverkning. Detta är bilen som dina farföräldrar kämpade för att förhindra. Lagade mat efter att Schyster marknadsavdelning tillbringade en natt på kokain och bratwurst. De har inte tittat tillbaka sedan."
        },
        {
            Label = 'Futo',
            Model = 'futo',
            Price = 20000,
            Img = 'https://static.wikia.nocookie.net/gtawiki/images/6/67/Futo-GTAV-front.PNG/revision/latest/scale-to-width-down/350?cb=20180726155611',
            Desc = "Futo är Karins gåva till en demografisk kärna som inte behöver mer än ett lätt chassi, bakhjulsdrift och farligt dåligt dragkraft för att ha bra nytta."
        },
        {
            Label = 'Go Go Monkey Blista',
            Model = 'blista3',
            Price = 20000,
            Img = 'https://static.wikia.nocookie.net/gtawiki/images/7/76/GoGoMonkeyBlista-GTAV-front.png/revision/latest/scale-to-width-down/350?cb=20160929162113',
            Desc = "För de oinvigde är det en snygg liten 80 -talskompakt med retro arkadspel. Men för dig är det ett hedersmärke. Det är ett bevis på varje podium du klättrade, varje kula du dodged, varje satsning du placerade, varje fordon du anpassade, varje konkurrent du offrade och varje långfinger du knuffade inför varje idiot som var tillräckligt dum för att stå i vägen. Till segraren går bytet."
        },
        {
            Label = 'Jester',
            Model = 'jester',
            Price = 20000,
            Img = 'https://static.wikia.nocookie.net/gtawiki/images/a/af/Jester-GTAV-front.png/revision/latest/scale-to-width-down/350?cb=20160917231438',
            Desc = "En japansk hybridelektrisk sportbil med en front-end som är utformad för att se ut som en arg flin kan vara för nyckfull för vissa, men med en 4-liters V6-motor, 420 hk och en toppfart på 180 mph, packar Dinka Jester fortfarande en allvarlig poängen."
        },
        {
            Label = 'Jester Racing',
            Model = 'jester2',
            Price = 20000,
            Img = 'https://static.wikia.nocookie.net/gtawiki/images/f/fd/Jester%28Racecar%29-GTAV-front.png/revision/latest/scale-to-width-down/350?cb=20161111195702',
            Desc = "En japansk hybridelektrisk sportbil med en front-end som är utformad för att se ut som ett arg flin kan vara för nyckfullt för vissa, men med en 4-liters V6-motor och 420 hk har Dinka Jester fortfarande en allvarlig punchline. Race tuned specialutgåva."
        },
        {
            Label = 'Massacro',
            Model = 'massacro',
            Price = 20000,
            Img = 'https://static.wikia.nocookie.net/gtawiki/images/1/12/Massacro-GTAV-front.png/revision/latest/scale-to-width-down/350?cb=20180331183607',
            Desc = "Sofistikerade, överlägsna, klassbesatta och med mer än lite aggression under huven, är denna grand tourer från Dewbauchee lika klassiskt brittisk som de kommer."
        },
        {
            Label = 'Massacro Racing',
            Model = 'massacro2',
            Price = 20000,
            Img = 'https://static.wikia.nocookie.net/gtawiki/images/d/d0/Massacro%28Racecar%29-GTAV-front.png/revision/latest/scale-to-width-down/350?cb=20180331183605',
            Desc = "Sofistikerade, överlägsna, klassbesatta och med mer än lite aggression under huven, är denna grand tourer från Dewbauchee lika klassiskt brittisk som de kommer. Race tuned specialutgåva."
        },
        {
            Label = 'Penumbra',
            Model = 'penumbra',
            Price = 20000,
            Img = 'https://static.wikia.nocookie.net/gtawiki/images/c/cc/Penumbra-GTAV-front.png/revision/latest/scale-to-width-down/350?cb=20171024163859',
            Desc = "Högpresterande kompakt bil för den typen av människor som driver runt hörnen med en barnstol i ryggen. Nyligen avbruten, så det kan vara värt att vänta ett decennium eller så för att det ska bli ironiskt coolt."
        },
        {
            Label = 'Rapid GT',
            Model = 'rapidgt',
            Price = 20000,
            Img = 'https://static.wikia.nocookie.net/gtawiki/images/4/42/RapidGT-GTAV-front.png/revision/latest/scale-to-width-down/350?cb=20150529203102',
            Desc = "Den ultimata blandningen av lyx, förfining och avel, Rapid GT är en brittisk superbil som är lika överlägsen och klassistisk som sina landsmän, men utan att behöva självförakta."
        },
        {
            Label = 'Schwartzer',
            Model = 'schwartzer',
            Price = 20000,
            Img = 'https://static.wikia.nocookie.net/gtawiki/images/f/ff/Schwartzer-GTAV-front.png/revision/latest/scale-to-width-down/350?cb=20160929173528',
            Desc = "Säg vad du vill om tyskarna - de kan lyx. Och deras ekonomi är den enda värda en skit i Europa. Denna modell har alla typer av tillägg - för många för att anges av juridiska skäl."
        },
        {
            Label = 'Sprunk Buffalo',
            Model = 'buffalo3',
            Price = 20000,
            Img = 'https://static.wikia.nocookie.net/gtawiki/images/3/34/SprunkBuffalo-GTAVPC-front.png/revision/latest/scale-to-width-down/350?cb=20150529175841',
            Desc = "Precis som standard Bravado är det ännu en återupplivad muskelbil från 1960 -talet för den över muskulösa EDM -generationen - men den här gången med exklusiv Sprunk Livery!"
        },
        {
            Label = 'Sultan',
            Model = 'sultan',
            Price = 20000,
            Img = 'https://static.wikia.nocookie.net/gtawiki/images/b/bb/Sultan-GTAV-front.png/revision/latest/scale-to-width-down/350?cb=20180331183641',
            Desc = "För en storögd junior chef i slutet av 90-talet sa ingenting jag har nästan råd att köpa europeisk som Karin Sultan. Idag är du en arg medelålders, pre-diabetiker, wannabe rallyförare, men sultanen är fortfarande din bästa vän: med dina pengar och vår expertis kan detta bli den högoktaniga racer du drömde om som tonåring och fortfarande har ingen aning om hur man kör. Kvalificerad för anpassning på Benny's Original Motor Works."
        },
        {
            Label = 'Zentorno',
            Model = 'zentorno',
            Price = 20000,
            Img = 'https://static.wikia.nocookie.net/gtawiki/images/6/60/Zentorno-GTAV-front.png/revision/latest/scale-to-width-down/350?cb=20160302171211',
            Desc = "Se till att de andra 99% vet att du sitter i ett fordon som de inte har råd med denna högljudda, fräcka, i ansiktet superbil från Pegassi. Vansinnigt snabbt med en högteknologisk interiör, det här är så nära som du kan komma till en stridsflygplan på hjul. Det enda som går upp snabbare än 0-60 på denna bad boy är din försäkringspremie."
        },

    }, 
    ['bikes'] = {
        {
            Label = 'Akuma',
            Model = 'akuma',
            Price = 20000,
            Img = 'https://static.wikia.nocookie.net/gtawiki/images/9/9a/Akuma-GTAV-front.png/revision/latest/scale-to-width-down/350?cb=20160127214020',
            Desc = "En japansk grenraket som kommer att tillfredsställa damerna."
        },
        {
            Label = 'Bagger',
            Model = 'bagger',
            Price = 20000,
            Img = 'https://static.wikia.nocookie.net/gtawiki/images/1/10/Bagger-GTAV-front.png/revision/latest/scale-to-width-down/350?cb=20160121202520',
            Desc = "Som varje Bagger-ägare kommer att berätta för dig utan ett spår av alltförbrukande ånger, Det är en bra cykel för cruising. Vilket är ett annat sätt att säga Det är en bra cykel för att inte gå någonstans snabbt eller effektivt. Så djupt in i morfar chic det går runt och uppnår gangland charm, det här är cykeln för dig om du inte kan bestämma dig och inte bryr dig om hur du ser ut under tiden."
        },
        {
            Label = 'Bati 801',
            Model = 'bati',
            Price = 20000,
            Img = 'https://static.wikia.nocookie.net/gtawiki/images/d/d9/Bati801-GTAV-front.png/revision/latest/scale-to-width-down/350?cb=20160127211358',
            Desc = "Det ultimata i att gå 0-80 på 2.3, sedan 80-0 i en bråkdel när du glider under en traktorvagn."
        },
        {
            Label = 'Bati 801RR',
            Model = 'bati2',
            Price = 20000,
            Img = 'https://static.wikia.nocookie.net/gtawiki/images/e/e3/Bati801RR-GTAV-front-Sprunk.png/revision/latest/scale-to-width-down/350?cb=20160214210359',
            Desc = ""
        },
        {
            Label = 'Bati 802',
            Model = 'bati',
            Price = 20000,
            Img = './assets/img/vehicles/buffalo.png',
            Desc = ""
        },
        {
            Label = 'Carbon RS',
            Model = 'carbonrs',
            Price = 20000,
            Img = 'https://static.wikia.nocookie.net/gtawiki/images/2/2d/CarbonRS-GTAV-front.png/revision/latest/scale-to-width-down/350?cb=20160130214329',
            Desc = "Denna superbike från Nagasaki är extra lätt på grund av dess kolfiberkropp, vilket resulterar i en mycket fin gräns mellan körkraft och infernal deathtrap. Det är en linje som är värd att gå."
        },
        {
            Label = 'Daemon',
            Model = 'daemon',
            Price = 20000,
            Img = './assets/img/vehicles/buffalo.png',
            Desc = "Om du tar dig tid att verkligen lära känna den västra daemonen, avlägsna associationerna till landslagssuccéer, sleaze, klass A -opiater och olagliga skjutvapen när du går, hittar du verkligen ingen anledning att köpa det alls. Lyckligtvis för dig är vissa rykter svårare att tvätta än halka fläckar föregående fett-rumpa kvar på sadeln, så spänn ihop."
        },
        {
            Label = 'Double T',
            Model = 'doublet',
            Price = 20000,
            Img = './assets/img/vehicles/buffalo.png',
            Desc = "Om du tar dig tid att verkligen lära känna den västra daemonen, avlägsna associationerna till landslagssuccéer, sleaze, klass A -opiater och olagliga skjutvapen när du går, hittar du verkligen ingen anledning att köpa det alls. Lyckligtvis för dig är vissa rykter svårare att tvätta än halka fläckar föregående fett-rumpa kvar på sadeln, så spänn ihop."
        },
        {
            Label = 'Daemon',
            Model = 'daemon',
            Price = 20000,
            Img = './assets/img/vehicles/buffalo.png',
            Desc = "Om du tar dig tid att verkligen lära känna den västra daemonen, avlägsna associationerna till landslagssuccéer, sleaze, klass A -opiater och olagliga skjutvapen när du går, hittar du verkligen ingen anledning att köpa det alls. Lyckligtvis för dig är vissa rykter svårare att tvätta än halka fläckar föregående fett-rumpa kvar på sadeln, så spänn ihop."
        },
        {
            Label = 'Daemon',
            Model = 'daemon',
            Price = 20000,
            Img = './assets/img/vehicles/buffalo.png',
            Desc = "Om du tar dig tid att verkligen lära känna den västra daemonen, avlägsna associationerna till landslagssuccéer, sleaze, klass A -opiater och olagliga skjutvapen när du går, hittar du verkligen ingen anledning att köpa det alls. Lyckligtvis för dig är vissa rykter svårare att tvätta än halka fläckar föregående fett-rumpa kvar på sadeln, så spänn ihop."
        },
        {
            Label = 'Daemon',
            Model = 'daemon',
            Price = 20000,
            Img = './assets/img/vehicles/buffalo.png',
            Desc = "Om du tar dig tid att verkligen lära känna den västra daemonen, avlägsna associationerna till landslagssuccéer, sleaze, klass A -opiater och olagliga skjutvapen när du går, hittar du verkligen ingen anledning att köpa det alls. Lyckligtvis för dig är vissa rykter svårare att tvätta än halka fläckar föregående fett-rumpa kvar på sadeln, så spänn ihop."
        },
        {
            Label = 'Daemon',
            Model = 'daemon',
            Price = 20000,
            Img = './assets/img/vehicles/buffalo.png',
            Desc = "Om du tar dig tid att verkligen lära känna den västra daemonen, avlägsna associationerna till landslagssuccéer, sleaze, klass A -opiater och olagliga skjutvapen när du går, hittar du verkligen ingen anledning att köpa det alls. Lyckligtvis för dig är vissa rykter svårare att tvätta än halka fläckar föregående fett-rumpa kvar på sadeln, så spänn ihop."
        },
        {
            Label = 'Daemon',
            Model = 'daemon',
            Price = 20000,
            Img = './assets/img/vehicles/buffalo.png',
            Desc = "Om du tar dig tid att verkligen lära känna den västra daemonen, avlägsna associationerna till landslagssuccéer, sleaze, klass A -opiater och olagliga skjutvapen när du går, hittar du verkligen ingen anledning att köpa det alls. Lyckligtvis för dig är vissa rykter svårare att tvätta än halka fläckar föregående fett-rumpa kvar på sadeln, så spänn ihop."
        },
        {
            Label = 'Daemon',
            Model = 'daemon',
            Price = 20000,
            Img = './assets/img/vehicles/buffalo.png',
            Desc = "Om du tar dig tid att verkligen lära känna den västra daemonen, avlägsna associationerna till landslagssuccéer, sleaze, klass A -opiater och olagliga skjutvapen när du går, hittar du verkligen ingen anledning att köpa det alls. Lyckligtvis för dig är vissa rykter svårare att tvätta än halka fläckar föregående fett-rumpa kvar på sadeln, så spänn ihop."
        },
        {
            Label = 'Daemon',
            Model = 'daemon',
            Price = 20000,
            Img = './assets/img/vehicles/buffalo.png',
            Desc = "Om du tar dig tid att verkligen lära känna den västra daemonen, avlägsna associationerna till landslagssuccéer, sleaze, klass A -opiater och olagliga skjutvapen när du går, hittar du verkligen ingen anledning att köpa det alls. Lyckligtvis för dig är vissa rykter svårare att tvätta än halka fläckar föregående fett-rumpa kvar på sadeln, så spänn ihop."
        },
        {
            Label = 'Daemon',
            Model = 'daemon',
            Price = 20000,
            Img = './assets/img/vehicles/buffalo.png',
            Desc = "Om du tar dig tid att verkligen lära känna den västra daemonen, avlägsna associationerna till landslagssuccéer, sleaze, klass A -opiater och olagliga skjutvapen när du går, hittar du verkligen ingen anledning att köpa det alls. Lyckligtvis för dig är vissa rykter svårare att tvätta än halka fläckar föregående fett-rumpa kvar på sadeln, så spänn ihop."
        },
        {
            Label = 'Daemon',
            Model = 'daemon',
            Price = 20000,
            Img = './assets/img/vehicles/buffalo.png',
            Desc = "Om du tar dig tid att verkligen lära känna den västra daemonen, avlägsna associationerna till landslagssuccéer, sleaze, klass A -opiater och olagliga skjutvapen när du går, hittar du verkligen ingen anledning att köpa det alls. Lyckligtvis för dig är vissa rykter svårare att tvätta än halka fläckar föregående fett-rumpa kvar på sadeln, så spänn ihop."
        },
        {
            Label = 'Daemon',
            Model = 'daemon',
            Price = 20000,
            Img = './assets/img/vehicles/buffalo.png',
            Desc = "Om du tar dig tid att verkligen lära känna den västra daemonen, avlägsna associationerna till landslagssuccéer, sleaze, klass A -opiater och olagliga skjutvapen när du går, hittar du verkligen ingen anledning att köpa det alls. Lyckligtvis för dig är vissa rykter svårare att tvätta än halka fläckar föregående fett-rumpa kvar på sadeln, så spänn ihop."
        },
        {
            Label = 'Daemon',
            Model = 'daemon',
            Price = 20000,
            Img = './assets/img/vehicles/buffalo.png',
            Desc = "Om du tar dig tid att verkligen lära känna den västra daemonen, avlägsna associationerna till landslagssuccéer, sleaze, klass A -opiater och olagliga skjutvapen när du går, hittar du verkligen ingen anledning att köpa det alls. Lyckligtvis för dig är vissa rykter svårare att tvätta än halka fläckar föregående fett-rumpa kvar på sadeln, så spänn ihop."
        },
        {
            Label = 'Daemon',
            Model = 'daemon',
            Price = 20000,
            Img = './assets/img/vehicles/buffalo.png',
            Desc = "Om du tar dig tid att verkligen lära känna den västra daemonen, avlägsna associationerna till landslagssuccéer, sleaze, klass A -opiater och olagliga skjutvapen när du går, hittar du verkligen ingen anledning att köpa det alls. Lyckligtvis för dig är vissa rykter svårare att tvätta än halka fläckar föregående fett-rumpa kvar på sadeln, så spänn ihop."
        },
        {
            Label = 'Daemon',
            Model = 'daemon',
            Price = 20000,
            Img = './assets/img/vehicles/buffalo.png',
            Desc = "Om du tar dig tid att verkligen lära känna den västra daemonen, avlägsna associationerna till landslagssuccéer, sleaze, klass A -opiater och olagliga skjutvapen när du går, hittar du verkligen ingen anledning att köpa det alls. Lyckligtvis för dig är vissa rykter svårare att tvätta än halka fläckar föregående fett-rumpa kvar på sadeln, så spänn ihop."
        }

    },
    ['commercial'] = {

    },
    ['government'] = {
        {
            Label = 'Volvo XC70 W1 YB',
            Model = 'police',
            Price = 20000,
            Img = 'https://cdn.discordapp.com/attachments/653986674996674587/653988552924856342/Grand_Theft_Auto_V_Screenshot_2018.03.10_-_11.32.55.76.png',
            Desc = "I Volvo XC70 kombineras förstklassig komfort och elegans med ett lastutrymme på imponerande 575 liter. Baksätet kan fällas i tre delar, med delningen 40/20/40, vilket ger ännu större möjlighet att skräddarsy utrymmet. Med hela baksätet fällt utökas lastutrymmet till enorma 1 600 liter"
        },
        {
            Label = 'Volvo XC70 W1',
            Model = 'police2',
            Price = 20000,
            Img = 'https://cdn.discordapp.com/attachments/653986674996674587/653988552924856342/Grand_Theft_Auto_V_Screenshot_2018.03.10_-_11.32.55.76.png',
            Desc = "I Volvo XC70 kombineras förstklassig komfort och elegans med ett lastutrymme på imponerande 575 liter. Baksätet kan fällas i tre delar, med delningen 40/20/40, vilket ger ännu större möjlighet att skräddarsy utrymmet. Med hela baksätet fällt utökas lastutrymmet till enorma 1 600 liter"
        },
        {
            Label = 'Volvo XC70 Civilbil',
            Model = 'police13',
            Price = 20000,
            Img = 'https://cdn.discordapp.com/attachments/653986674996674587/662037245141712956/xc70civ2.png',
            Desc = "I Volvo XC70 kombineras förstklassig komfort och elegans med ett lastutrymme på imponerande 575 liter. Baksätet kan fällas i tre delar, med delningen 40/20/40, vilket ger ännu större möjlighet att skräddarsy utrymmet. Med hela baksätet fällt utökas lastutrymmet till enorma 1 600 liter"
        },
        {
            Label = 'VW T6 Civilbil',
            Model = 'police15',
            Price = 20000,
            Img = 'https://cdn.discordapp.com/attachments/653986848598786048/662026207168036903/t5civ.png',
            Desc = "Det första man möts av när Multivan rullar in på scenen är en helt omarbetad front, där grillen tillsammans med exklusiva LED- huvudstrålkastare och en omformad stötfångare ger bilen en helt ny look. Designteamet har gett nya T6:an en “bred” och självsäker uppsyn."
        },
        {
            Label = 'Volvo V90 CC W1',
            Model = 'police3',
            Price = 20000,
            Img = 'https://cdn.discordapp.com/attachments/653986763093573644/660652547555721217/cc1.png',
            Desc = "Efter ett par år med konceptbilar drog det äntligen ihop sig i augusti 2014 då nya Volvo XC90 presenterades, Volvos första modell baserad på SPA-plattformen. Därefter fick vi vänta nästa ett och ett halvt år innan första SPA-baserade icke-suven gjorde entré. Det var i december 2015 och då var det sedanmodellen S90 som hade premiär i Göteborg. Men det är först i dag som modellen som flest svenskar väntar på har premiär, nämligen nya Volvo V90 som ersätter V70 som i under 19 år och tre generationer legat i topp bland svenskarnas val av bil."
        },
        {
            Label = 'Volvo V90 CC W1 YB',
            Model = 'police47',
            Price = 20000,
            Img = 'https://cdn.discordapp.com/attachments/653986763093573644/660652547555721217/cc1.png',
            Desc = "Efter ett par år med konceptbilar drog det äntligen ihop sig i augusti 2014 då nya Volvo XC90 presenterades, Volvos första modell baserad på SPA-plattformen. Därefter fick vi vänta nästa ett och ett halvt år innan första SPA-baserade icke-suven gjorde entré. Det var i december 2015 och då var det sedanmodellen S90 som hade premiär i Göteborg. Men det är först i dag som modellen som flest svenskar väntar på har premiär, nämligen nya Volvo V90 som ersätter V70 som i under 19 år och tre generationer legat i topp bland svenskarnas val av bil."
        },
        {
            Label = 'Volvo V90 CC Civilbil',
            Model = 'police14',
            Price = 20000,
            Img = 'https://cdn.discordapp.com/attachments/653986763093573644/660654586528530461/cc3.png',
            Desc = "Efter ett par år med konceptbilar drog det äntligen ihop sig i augusti 2014 då nya Volvo XC90 presenterades, Volvos första modell baserad på SPA-plattformen. Därefter fick vi vänta nästa ett och ett halvt år innan första SPA-baserade icke-suven gjorde entré. Det var i december 2015 och då var det sedanmodellen S90 som hade premiär i Göteborg. Men det är först i dag som modellen som flest svenskar väntar på har premiär, nämligen nya Volvo V90 som ersätter V70 som i under 19 år och tre generationer legat i topp bland svenskarnas val av bil."
        },
        {
            Label = 'VW Tiguan W3',
            Model = 'police55',
            Price = 20000,
            Img = 'https://cdn.discordapp.com/attachments/742901598304469045/843088686798995506/unknown.png',
            Desc = "Nya Tiguan visar med sin uttrycksfulla design vad det innebär att ständigt förnya sig själv. De samstämda proportionerna och den omdesignade fronten med framhävda linjer ut mot skärmarna skapar konturen av en kraftfull modern bilmodell. Stark, vägledande och funktionell."
        },
        {
            Label = 'Volvo V70 W1',
            Model = 'police56',
            Price = 20000,
            Img = 'https://cdn.discordapp.com/attachments/732030840720064562/857759468167364608/unknown.png',
            Desc = "Volvo V70 är en personbil från Volvo Personvagnar som tillverkades i tre generationer mellan 1997 och 2016."
        },
        {
            Label = 'VW Amarok Civilbil',
            Model = 'police17',
            Price = 20000,
            Img = 'https://cdn.discordapp.com/attachments/721272776626929725/731862936448008222/civrok1.png',
            Desc = "Amarok är en fyrhjulsdriven pickup med kraftfulla V6-motorer med bra prestanda och vridmoment. Välj TDI-motor på 204 hk (150 kW) eller med 258 hk (190 kW). Motorerna har BlueMotion Technology som bland annat innebär start/stopp-system."
        },
        {
            Label = 'VW Amarok W3',
            Model = 'police28',
            Price = 20000,
            Img = 'https://cdn.discordapp.com/attachments/721272776626929725/721359436039585822/Grand_Theft_Auto_V_Screenshot_2020.03.14_-_11.33.02.26.png',
            Desc = "Amarok är en fyrhjulsdriven pickup med kraftfulla V6-motorer med bra prestanda och vridmoment. Välj TDI-motor på 204 hk (150 kW) eller med 258 hk (190 kW). Motorerna har BlueMotion Technology som bland annat innebär start/stopp-system."
        },
        {
            Label = 'VW Passat W1',
            Model = 'police81',
            Price = 20000,
            Img = 'https://cdn.discordapp.com/attachments/653987130074464256/653987487139495940/Grand_Theft_Auto_V_Screenshot_2018.08.18_-_23.24.25.75.png',
            Desc = "Volkswagen Passat är en bilmodell från Volkswagen lanserad 1974. ... Passaten som är uppkallad efter en vind, var en ny modellserie i mellansegmentet, bilen var baserad på Audi 80, från fronten till B-stolpen."
        },
        {
            Label = 'VW Passat Civilbil',
            Model = 'police63',
            Price = 20000,
            Img = 'https://img.gta5-mods.com/q75/images/swedish-police-unmarked-passat-els-replace/c4ae18-Picture1.jpg',
            Desc = "Volkswagen Passat är en bilmodell från Volkswagen lanserad 1974. ... Passaten som är uppkallad efter en vind, var en ny modellserie i mellansegmentet, bilen var baserad på Audi 80, från fronten till B-stolpen."
        },
        {
            Label = 'VW T6 W1',
            Model = 'police20',
            Price = 20000,
            Img = 'https://cdn.discordapp.com/attachments/653986848598786048/666328545009598475/Grand_Theft_Auto_V_Screenshot_2020.01.13_-_18.09.32.90.png',
            Desc = "Det första man möts av när Multivan rullar in på scenen är en helt omarbetad front, där grillen tillsammans med exklusiva LED- huvudstrålkastare och en omformad stötfångare ger bilen en helt ny look. Designteamet har gett nya T6:an en “bred” och självsäker uppsyn."
        },
        {
            Label = 'VW T6 W1 YB',
            Model = 'police61',
            Price = 20000,
            Img = 'https://cdn.discordapp.com/attachments/653986848598786048/666328545009598475/Grand_Theft_Auto_V_Screenshot_2020.01.13_-_18.09.32.90.png',
            Desc = "Det första man möts av när Multivan rullar in på scenen är en helt omarbetad front, där grillen tillsammans med exklusiva LED- huvudstrålkastare och en omformad stötfångare ger bilen en helt ny look. Designteamet har gett nya T6:an en “bred” och självsäker uppsyn."
        },
        {
            Label = 'Polismotorcykel',
            Model = 'policeb',
            Price = 20000,
            Img = 'http://utryckningsfordon.se/wopre/wp-content/uploads/2019/08/polis_BMW_R1200_GSA_UL.jpg',
            Desc = ""
        },
        {
            Label = 'Polismotorcykel (Offroad)',
            Model = 'polisdirt',
            Price = 20000,
            Img = 'http://utryckningsfordon.se/wopre/wp-content/uploads/2019/08/polis_BMW_R1200_GSA_UL.jpg',
            Desc = ""
        },
        {
            Label = 'Mercedes-Benz E-Klass - Civil',
            Model = 'fbi',
            Price = 20000,
            Img = 'https://cdn.discordapp.com/attachments/870387487074304020/872622911721205770/unknown.png',
            Desc = ""
        },
        {
            Label = 'BMW X5 Civilbil',
            Model = 'fbi2',
            Price = 20000,
            Img = 'http://utryckningsfordon.se/wopre/wp-content/uploads/2019/08/polis_BMW_R1200_GSA_UL.jpg',
            Desc = ""
        },

        --Ambulansen

        {
            Label = 'Volvo XC90 Nilsson W3',
            Model = 'ambulance1',
            Price = 20000,
            Img = 'https://cdn.discordapp.com/attachments/750709867358191757/750709966083588134/unknown.png',
            Desc = "Med Volvo XC90 som grundbil läggs grunden för höga ingångsvärden vad gäller säkerhet, miljö, ergonomi och funktion. Tack vare tillverkarens ledande position inom så väl aktiv som passiv säkerhet kan vi erbjuda en ambulans i världsklass. Detta i kombination med Nilssons mångåriga kunnande av bilbyggnationer resulterar i en ambulans i absolut toppklass som kan lastas med >700kg och köras på B-körkort."
        },
        {
            Label = 'Volvo V90 CC W1',
            Model = 'ambulance3',
            Price = 20000,
            Img = 'https://cdn.discordapp.com/attachments/617817813142208547/876596953855713311/unknown.png',
            Desc = "Efter ett par år med konceptbilar drog det äntligen ihop sig i augusti 2014 då nya Volvo XC90 presenterades, Volvos första modell baserad på SPA-plattformen. Därefter fick vi vänta nästa ett och ett halvt år innan första SPA-baserade icke-suven gjorde entré. Det var i december 2015 och då var det sedanmodellen S90 som hade premiär i Göteborg. Men det är först i dag som modellen som flest svenskar väntar på har premiär, nämligen nya Volvo V90 som ersätter V70 som i under 19 år och tre generationer legat i topp bland svenskarnas val av bil."
        },
        {
            Label = 'Mercedes-Benz Vito Nidia Akutambulans',
            Model = 'ambulance4',
            Price = 20000,
            Img = 'https://cdn.discordapp.com/attachments/621414314502520853/681213652690272278/1.png',
            Desc = "Mercedes Benz Vito Nidia 4x4 är vår senaste ambulans med Nidiainredning. Inredningen består av formpressad ABS-plast som är hygienisk och viktoptimerad. Nya Viton med fyrhjulsdrift och större motor gör konceptet fulländat. Säkerheten för förare och passagerare har också höjts och Viton har idag fem stjärnor i Euro-Ncap."
        },
        {
            Label = 'Volvo XC70 Akutbil',
            Model = 'ambulance7',
            Price = 20000,
            Img = 'https://img.gta5-mods.com/q75/images/swedish-xc70-ambulans-paintjob/3cb0eb-Ambulans.PNG',
            Desc = "I Volvo XC70 kombineras förstklassig komfort och elegans med ett lastutrymme på imponerande 575 liter. Baksätet kan fällas i tre delar, med delningen 40/20/40, vilket ger ännu större möjlighet att skräddarsy utrymmet. Med hela baksätet fällt utökas lastutrymmet till enorma 1 600 liter"
        },
        {
            Label = 'Mercedes-Benz Vito Akutläkarbil',
            Model = 'ambulance8',
            Price = 20000,
            Img = 'https://cdn.discordapp.com/attachments/621414314502520853/653567194491387917/unknown.png',
            Desc = "Mercedes Vito är en kompakt transportbil som har plats för allt som ska med. Vito kommer i flera olika utföranden och längder. Vito Skåpbil är en praktisk skåpbil som smidigt tar sig fram i trånga stadsmiljöer såsom på landsvägar. Vito Mixto erbjuder dig erbjuder dig det bästa av två världar. Det generösa lastutrymmet rymmer både passagerare och bagage, likväl last i arbetet. Vito Tourer är som gjort för resesällskap och passar utmärkt som shuttlebuss eller taxi. Här får du plats för 9 personer och massor av körglädje."
        },
        {
            Label = 'Renault Master ML Akutambulans',
            Model = 'ambulance9',
            Price = 20000,
            Img = 'https://cdn.discordapp.com/attachments/621414314502520853/653567744725352473/unknown.png',
            Desc = "Denna frontbåge är unikt modellanpassad till Renault Master 2020- följer bilens linjer snyggt. Passar ihop med bilens radar, p-sensorer, kamera och bogserögla. Monterings detaljerna är noga framtagna till modellerna ovan för att få en så stabil infästning och enkelt "
        },
        {
            Label = 'Renault Master ML Akutambulans',
            Model = 'ambulance10',
            Price = 20000,
            Img = 'https://cdn.discordapp.com/attachments/621414314502520853/653571838579834892/e30fe6306a68c55be42a12684886df04.png',
            Desc = "Efter ett par år med konceptbilar drog det äntligen ihop sig i augusti 2014 då nya Volvo XC90 presenterades, Volvos första modell baserad på SPA-plattformen. Därefter fick vi vänta nästa ett och ett halvt år innan första SPA-baserade icke-suven gjorde entré. Det var i december 2015 och då var det sedanmodellen S90 som hade premiär i Göteborg. Men det är först i dag som modellen som flest svenskar väntar på har premiär, nämligen nya Volvo V90 som ersätter V70 som i under 19 år och tre generationer legat i topp bland svenskarnas val av bil."
        },

    }, 
    ['sedans'] = {
        {
            Label = 'Asea',
            Model = 'asea',
            Price = 20000,
            Img = 'https://static.wikia.nocookie.net/gtawiki/images/5/58/Asea-GTAV-front.png/revision/latest/scale-to-width-down/350?cb=20160406180243',
            Desc = "En prisvärd, utan krusiduller, bränsleeffektiv kompakt sedan. När gott om utrymme är centralt i marknadsföringskampanjen, får du vad du ser."
        },
        {
            Label = 'Asterope',
            Model = 'asterope',
            Price = 20000,
            Img = 'https://static.wikia.nocookie.net/gtawiki/images/e/ec/Asterope-GTAV-front.png/revision/latest/scale-to-width-down/350?cb=20161018175632',
            Desc = "Asterope marknadsförs av Karin som ett uppnåeligt lyxfordon och är den perfekta bilen för mellanchefen som vet att han aldrig kommer bli en ledande befattningshavare men inte riktigt kan erkänna det än."
        },
        {
            Label = 'Emperor',
            Model = 'emperor',
            Price = 20000,
            Img = 'https://static.wikia.nocookie.net/gtawiki/images/4/4c/Emperor-GTAV-front.png/revision/latest/scale-to-width-down/350?cb=20161018180208',
            Desc = "Skön billig dålig bil."
        },
        {
            Label = 'Fugitive',
            Model = 'fugitive',
            Price = 20000,
            Img = 'https://static.wikia.nocookie.net/gtawiki/images/5/5c/Fugitive-GTAV-front.png/revision/latest/scale-to-width-down/350?cb=20161018180444',
            Desc = "The Fugitive är go-to cruiser för brottsbekämpning och de som vill låtsas att de är brottsbekämpande. Gassträckan är inte så stor, men poliser sitter mestadels med bilen på tomgång ändå."
        },
        {
            Label = 'Glendale',
            Model = 'glendale',
            Price = 20000,
            Img = 'https://static.wikia.nocookie.net/gtawiki/images/4/47/Glendale-GTAV-front.png/revision/latest/scale-to-width-down/350?cb=20150530113232',
            Desc = "Det som är känt i branschen som en droghandlare bil. 1990-talets lyxiga tyska fyrdörrars sedan vände 2010-talets roterande depå för trappad kokain. Räkna med att bli stoppad av poliserna och fastna av junkies."
        },
        {
            Label = 'Ingot',
            Model = 'ingot',
            Price = 20000,
            Img = 'https://static.wikia.nocookie.net/gtawiki/images/6/62/Ingot-GTAV-front.png/revision/latest/scale-to-width-down/350?cb=20190513111715',
            Desc = "Denna klassiska Vulcar kombi har ansetts vara den säkraste bilen som någonsin gjorts och har varit det valda fordonet för riktigt hemska förare i 20 år."
        },
        {
            Label = 'Intruder',
            Model = 'intruder',
            Price = 20000,
            Img = 'https://static.wikia.nocookie.net/gtawiki/images/7/7c/Intruder-GTAV-front.png/revision/latest/scale-to-width-down/350?cb=20160305191559',
            Desc = "Den japanskt tillverkade inkräktaren lanserades av Karin för att konkurrera på samma marknad som tyska högpresterande lyxbilar (dvs genom att kopiera dem exakt med undermåliga delar och sälja för halva priset)."
        },
        {
            Label = 'Premier',
            Model = 'premier',
            Price = 20000,
            Img = 'https://static.wikia.nocookie.net/gtawiki/images/c/ca/Premier-GTAV-front.png/revision/latest/scale-to-width-down/350?cb=20161018180637',
            Desc = "Under produktionen från 2004 till 2010 fick Declasse Premier aldrig dragkraft på den amerikanska marknaden men var vansinnigt populär i Kanada. Varför? Ingen vet ... Det är ett nationellt psyke som trotsar analys."
        },
        {
            Label = 'Primo',
            Model = 'primo',
            Price = 20000,
            Img = 'https://static.wikia.nocookie.net/gtawiki/images/1/10/Primo-GTAV-front.png/revision/latest/scale-to-width-down/350?cb=20160406175756',
            Desc = "Ingenting sa köp amerikansk när importen svepte över staterna på 70- och 80 -talet som Albany Primo. En medelstor lyxbil som byggdes för att hålla."
        },
        {
            Label = 'Regina',
            Model = 'bati',
            Price = 20000,
            Img = 'https://static.wikia.nocookie.net/gtawiki/images/9/97/Regina-TLAD-front.png/revision/latest/scale-to-width-down/350?cb=20170921191911',
            Desc = "Signatur Dundreary -galler, överdådig träpanel, rymligt bagageutrymme och ett takräcke för familjens hund - det ultimata fordonet för att leva förortsdrömmen från 1960 -talet idag."
        },
        {
            Label = 'Romero Hearse',
            Model = 'romero',
            Price = 20000,
            Img = 'https://static.wikia.nocookie.net/gtawiki/images/1/15/RomeroHearse-GTAV-front.png/revision/latest/scale-to-width-down/350?cb=20160929173527',
            Desc = "OK din subversiva lilla renegade, hur nära kanten är du beredd att komma? Visst, du färgade håret magenta, och citatet på din T-shirt är ganska nihilistiskt, och dina åsikter går den mörka och grubblande gränsen mellan för mycket sanning och för mycket ironi. Men är du beredd att köra till skolan två fot från ett sönderfallande lik för att bevisa din poäng?"
        },
        {
            Label = 'Stanier',
            Model = 'stanier',
            Price = 20000,
            Img = 'https://static.wikia.nocookie.net/gtawiki/images/7/7b/Stanier-GTAV-front.png/revision/latest/scale-to-width-down/350?cb=20160305182639',
            Desc = ""
        },
        {
            Label = 'Stratum',
            Model = 'Stratum',
            Price = 20000,
            Img = 'https://static.wikia.nocookie.net/gtawiki/images/3/38/Stratum-GTAV-front.png/revision/latest/scale-to-width-down/350?cb=20160305185828',
            Desc = "Missa inte detta tillfälle att få en Classic Stratum kombi till ett förmånligt pris. En kortlivad Zirkonium-modell som plågades av dåliga recensioner ... Eller som vi vill kalla det, Limited Edition!"
        },
        {
            Label = 'Stretch',
            Model = 'stretch',
            Price = 20000,
            Img = 'https://static.wikia.nocookie.net/gtawiki/images/4/48/Stretch-GTAV-front.png/revision/latest/scale-to-width-down/350?cb=20160409182123',
            Desc = "Vem vill inte ha sin egen limousin? Möjligen den minst praktiska bilen för att navigera i en urbana storstadsmetropol, men slå en strippstång och en margaritamaskin i ryggen, och du kommer inte att bry dig om din förare tar 3 timmar att hitta en parkeringsplats"
        },
        {
            Label = 'Super Diamond',
            Model = 'superd',
            Price = 20000,
            Img = 'https://static.wikia.nocookie.net/gtawiki/images/d/d8/SuperDiamond-GTAV-front.png/revision/latest/scale-to-width-down/350?cb=20160409182331',
            Desc = "Synonymt med stil och lyx, interiören i Super Diamond har så mycket läder och trä, det är som att sitta på ett bibliotek. Den historiska brittiska biltillverkaren togs över av tyskarna i slutet av 90 -talet, utan några som helst hårda känslor."
        },
        {
            Label = 'Surge',
            Model = 'surge',
            Price = 20000,
            Img = 'https://static.wikia.nocookie.net/gtawiki/images/c/c2/Surge-GTAV-front.png/revision/latest/scale-to-width-down/350?cb=20161018181104',
            Desc = "https://static.wikia.nocookie.net/gtawiki/images/c/c2/Surge-GTAV-front.png/revision/latest/scale-to-width-down/350?cb=20161018181104"
        },
        {
            Label = 'Tailgater',
            Model = 'tailgater',
            Price = 20000,
            Img = 'https://static.wikia.nocookie.net/gtawiki/images/e/e1/Tailgater-GTAV-front.png/revision/latest/scale-to-width-down/350?cb=20160917232330',
            Desc = "Luxury German Sedan. Better than a BF, but not quite a Benefactor. Fast and practical with a classy look, this is just the car to over-leverage on."
        },
        {
            Label = 'Warrener',
            Model = 'warrener',
            Price = 20000,
            Img = 'https://static.wikia.nocookie.net/gtawiki/images/3/3c/Warrener-GTAV-front.png/revision/latest/scale-to-width-down/350?cb=20160302171843',
            Desc = "Den legendariska svenska fyrdörrars sedan. Hela boxy -designen på en Vulcar från 1980 -talet, utan tillförlitlighet. För älskare av tighta jeans, mikrobryggerier och 70 -talsshow."
        },
        {
            Label = 'Washington',
            Model = 'washington',
            Price = 20000,
            Img = 'https://static.wikia.nocookie.net/gtawiki/images/1/12/Washington-GTAV-front.png/revision/latest/scale-to-width-down/350?cb=20160410151922',
            Desc = "Is there a more iconic town car than the Washington? Own a piece of livery history! (Just don't loiter for too long at traffic lights or someone will get in the back and ask you to take them to the airport)"
        }
        
    },
    ['compacts'] = {

    },
    ['suv'] = {
        
    },
    ['boats'] = {

    }
}

Config.WeekDays = {
    ['Monday'] = 'Måndag',
    ['Tuesday'] = 'Tisdag',
    ['Wednesday'] = 'Onsdag',
    ['Thursday'] = 'Torsdag',
    ['Friday'] = 'Fredag',
    ['Saturday'] = 'Lördag',
    ['Sunday'] = 'Söndag', 
}