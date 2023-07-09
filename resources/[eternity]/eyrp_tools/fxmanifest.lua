fx_version 'cerulean'
game 'gta5'

client_scripts {
    'source/c/*.lua'
}

server_scripts {
    'source/s/*.lua'
}

exports {
    'LoadModel',
    'LoadAnimDict',
    'LoadAnimSet',
    'PlayScenario',
    'LoadCollision',
    'SpawnVehicle',
    'SpawnObject',
    'SpawnPed',
    'PlayAnimation',
    'DrawText3D',
    'DrawText2D',
    'ShowMessage',
    'LoadScaleForm',
    'RegisterChangableKey',
    'LoadPtfx',
    'Createinput'
}

server_exports {
    'GetPlayerIdentifiers'
}