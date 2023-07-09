fx_version 'adamant'

game 'gta5'

server_scripts {
    "@mysql-async/lib/MySQL.lua",
    "server/*.lua",
}

client_scripts {
    "client/*.lua",
}

ui_page {
    'static/index.html',
}