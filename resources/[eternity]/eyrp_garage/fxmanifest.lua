  
fx_version 'adamant'

game 'gta5'

server_scripts {
	'server/*.lua',
	'@mysql-async/lib/MySQL.lua'
}

client_scripts {
	'client/*.lua',
	'config.lua'
}

ui_page 'html/index.html'

files {
	'html/*.html',
	'html/css/*.css',
	'html/js/jquery/jquery.js',
	'html/js/*.js',
	'html/assets/img/*.png',
	'html/assets/fonts/*.ttf'
}
