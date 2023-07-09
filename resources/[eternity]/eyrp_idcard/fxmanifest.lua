fx_version 'cerulean'

game 'gta5'

server_scripts {
	'@mysql-async/lib/MySQL.lua',
	'server/*.lua'
}

client_scripts {
	'client/*.lua'
}

ui_page 'web/index.html'

files {
	'web/index.html',
	'web/assets/css/*.css',
	'web/assets/js/*.js',
	'web/assets/fonts/roboto/*',
	'web/assets/images/*.png'
}
