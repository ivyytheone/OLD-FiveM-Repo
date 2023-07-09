fx_version 'cerulean'
game 'gta5'

client_scripts {
    'source/c/c_main.lua',
    'source/c/*.lua'
}

server_scripts {
    '@mysql-async/lib/MySQL.lua',
    'source/s/*.lua'
}

shared_script 'source/config.lua'