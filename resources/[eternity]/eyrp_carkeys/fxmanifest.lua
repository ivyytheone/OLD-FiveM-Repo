fx_version 'cerulean'

game 'gta5'

server_scripts {
	'server/*.lua',
	'@mysql-async/lib/MySQL.lua'
}

client_scripts {
	'client/*.lua',
	'config.lua'
}

exports {
	'CheckKey'
}