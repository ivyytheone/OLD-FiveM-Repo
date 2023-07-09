-- FXVersion Version
fx_version 'adamant'
games { 'gta5' }

-- Client Scripts
client_script 'client/main.lua'

-- Server Scripts
server_script 'server/main.lua'

-- NUI Default Page
ui_page "client/html/index.html"

-- Files needed for NUI
-- DON'T FORGET TO ADD THE SOUND FILES TO THIS!
files {
    'client/html/index.html',
    'client/html/sounds/demo.ogg',
    'client/html/sounds/fart1.ogg',
    'client/html/sounds/fart2.ogg',
    'client/html/sounds/fart3.ogg',
    'client/html/sounds/burp.ogg',
    'client/html/sounds/carlock.ogg',
    'client/html/sounds/nuiblocker.ogg',
    'client/html/sounds/seatbelt.ogg', 
    'client/html/sounds/dembe.ogg',
    'client/html/sounds/takeoffbelt.ogg',
    'client/html/sounds/putonseatbelt.ogg'
}
