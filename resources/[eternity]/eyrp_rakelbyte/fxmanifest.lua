fx_version 'cerulean'

game 'gta5'

server_scripts {
	'@mysql-async/lib/MySQL.lua',
	'server/*.lua'
}

client_scripts {
	'client/*.lua',
}

files {
	'web/**/**',
}

ui_page 'web/index.html'