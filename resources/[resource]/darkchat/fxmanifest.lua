fx_version 'cerulean'

game 'gta5'

ui_page './web/index.html'

client_scripts {
    './client/*.lua'
}

server_scripts {
    '@mysql-async/lib/MySQL.lua',
    './server/*.lua'
}

files{
    '**/**/**/**/**'
}