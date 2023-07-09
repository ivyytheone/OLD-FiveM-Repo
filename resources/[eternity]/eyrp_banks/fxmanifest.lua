fx_version 'adamant'

game 'gta5'

client_scripts {
	'client/*.lua'
} 

server_scripts { 
	'@mysql-async/lib/MySQL.lua',
	'server/*.lua'
}

shared_script {
	'config.lua'
}

ui_page "web/index.html" 

files {
    'web/js/app.js', 
	'web/css/app.css', 
	'web/index.html'
}

shared_script {
	'config.lua'
}