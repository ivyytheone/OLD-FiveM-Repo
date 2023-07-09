fx_version 'cerulean'

game 'gta5'

server_scripts {
    '@mysql-async/lib/MySQL.lua',
    's/*.lua'
}

client_scripts {
    'c/*.lua'
}

exports {
    'GetCompanyMoney'
}

server_exports {
    'Deposit',
    'GetCompanyMoney',
    'Withdraw'
}