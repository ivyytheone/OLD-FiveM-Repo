PawnShop = {}

Citizen.CreateThread(function()
    while ESX == nil do
        Citizen.Wait(1);

        ESX = exports["es_extended"]:getSharedObject()  
    end 

    if ESX.IsPlayerLoaded() then
        ESX.PlayerData = ESX.GetPlayerData()
    end 


    local Blip = AddBlipForCoord(vector3(-631.5167236328125, -237.7705993652344, 38.0783462524414))

    SetBlipSprite(Blip, 431)
    SetBlipScale(Blip, 0.7)
    SetBlipColour(Blip, 0)
    SetBlipAsShortRange(Blip, true)

    BeginTextCommandSetBlipName('STRING')
    AddTextComponentSubstringPlayerName("Vangelico")
    EndTextCommandSetBlipName(Blip)

    Utils.SpawnEntityPed({
        Model = 'u_f_y_comjane', 
        Coords = vector4(-622.3895874023438, -229.7583923339844, 38.05704879760742, 307.17816162109375), 
    })

    while true do 

        local playerPed, sleepThread = PlayerPedId(), 850; 

        for i = 1, #Config.Zones do 

            local Dst = #(GetEntityCoords(playerPed) - Config.Zones[i]); 

            if Dst <= 5.0 then  
                sleepThread = 5; 

                ESX.DrawScriptMarker({
                    type = 6, 
                    pos = Config.Zones[i] - vector3(0.0, 0.0, 0.985),
                    sizeX = 1.0, sizeY = 1.0, sizeZ = 1.0,
                    r = 0, g = 250, b = 0, 
                    rotate = true
                });
                
                if Dst <= 1.0 then  
                    ESX.ShowHelpNotification('~INPUT_CONTEXT~ Prata med kassörskan'); 

                    if IsControlJustReleased(0, 38) then  
                        Action:OpenPawnShop()
                    end
                end
            end
        end

        Citizen.Wait(sleepThread); 
    end
end)