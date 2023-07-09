fx_version 'cerulean'

game 'gta5'

client_scripts {
    'c/*.lua'
}

server_scripts {
    '@mysql-async/lib/MySQL.lua',
    's/*.lua'
}

ui_page 'nui/index.html'

files {
    'nui/**/**/**'
}

shared_script 'config.lua'