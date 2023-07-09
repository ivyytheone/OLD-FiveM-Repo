fx_version 'adamant'
game 'gta5'

client_scripts {'client/*.lua'}
shared_script 'config.lua'
server_scripts {'server/*.lua', '@mysql-async/lib/MySQL.lua'}