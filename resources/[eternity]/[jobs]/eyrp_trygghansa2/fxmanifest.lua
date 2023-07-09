fx_version 'bodacious'
game 'gta5'

ui_page 'web/index.html'
files {
    'web/js/*.js',
    'web/css/*.css',
    'web/index.html'
}

client_scripts {'client/*.lua'}

shared_script 'config.lua'


server_scripts {
    '@mysql-async/lib/MySQL.lua',
    'server/*.lua'
}