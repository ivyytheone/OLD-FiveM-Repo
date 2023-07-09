fx_version 'cerulean'
game 'gta5'

client_scripts {
	"client/*",
}

server_scripts {
	"@mysql-async/lib/MySQL.lua",
	"server/*"
}

shared_scripts {
	"config.lua",
	"shared/*"
}

exports {
	"SmashTray"
}