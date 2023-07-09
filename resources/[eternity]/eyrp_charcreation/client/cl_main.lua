Citizen.CreateThread(function()
    while ESX == nil do
        Citizen.Wait(1);

        ESX = exports["es_extended"]:getSharedObject()  
    end 

    if ESX.IsPlayerLoaded() then
        ESX.PlayerData = ESX.GetPlayerData()
    end

    while true do  
        Citizen.Wait(0)

        if Charcreation.DisableControls then
			DisableControlAction(2, 30, true)
			DisableControlAction(2, 31, true)
			DisableControlAction(2, 32, true)
			DisableControlAction(2, 33, true)
			DisableControlAction(2, 34, true)
			DisableControlAction(2, 35, true)
			DisableControlAction(0, 25, true) 
			DisableControlAction(0, 24, true) 
        end
    end
end)

Charcreation = {}

RegisterNetEvent('eyrp_charcreation:createCharacter')
AddEventHandler('eyrp_charcreation:createCharacter', function()
    local Player = PlayerPedId()
    
    Charcreation.DisableControls = true

    SetEntityCoords(Player, Config.Start.Coords); 
    SetEntityHeading(Player, Config.Start.Heading)
    
    DoScreenFadeOut(400) 
    Wait(1000) 
    DoScreenFadeIn(400) 

    exports['eyrp_core']:LoadAnimDict(Config.Start.Animations.Dict)

    TaskPlayAnim(Player, Config.Start.Animations.Dict, Config.Start.Animations.Lib, 2.0, -1.0, -1, 0, 0, 2, 0)

    Utils.CreateCam()

    Wait(2000)

    PlaySoundFrontend(-1, 'BACK', 'HUD_AMMO_SHOP_SOUNDSET', false)
    Action:OpenCreationMenu()
end)