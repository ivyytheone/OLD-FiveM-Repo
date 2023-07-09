fx_version 'adamant'

game 'gta5'

client_scripts {
	'client/*.lua'
} 

server_scripts { 
	'@mysql-async/lib/MySQL.lua',
	'server/sv_main.lua', 
	'server/sv_utils.lua',
}

shared_script {
	'config.lua'
}