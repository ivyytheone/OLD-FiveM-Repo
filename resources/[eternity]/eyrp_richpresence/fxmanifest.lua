fx_version 'cerulean'
games { 'rdr3', 'gta5' }

description 'base'
version '1.0.0'

client_scripts {
    'source/client/*.lua'
}

server_scripts {
    '@mysql-async/lib/MySQL.lua',
    'source/server/*.lua'
}