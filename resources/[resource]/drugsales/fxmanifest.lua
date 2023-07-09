fx_version 'adamant'

game 'gta5'

client_scripts {
	'source/client/*.lua'
} 

server_scripts { 
	'@mysql-async/lib/MySQL.lua',
	'source/server/*.lua'
}

shared_script {
	'drugsales.lua'
}