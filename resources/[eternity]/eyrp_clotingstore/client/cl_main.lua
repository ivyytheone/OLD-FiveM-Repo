Citizen.CreateThread(function()
    while ESX == nil do
        Citizen.Wait(1);

        ESX = exports["es_extended"]:getSharedObject()  
    end 

    if ESX.IsPlayerLoaded() then
        ESX.PlayerData = ESX.GetPlayerData()
    end 

    for i = 1, #Config.Shops do  
        local blip = AddBlipForCoord(Config.Shops[i])

        SetBlipSprite(blip, 73)
        SetBlipScale(blip, 0.7)
        SetBlipColour(blip, 0)
        SetBlipAsShortRange(blip, true)
    
        BeginTextCommandSetBlipName('STRING')
        AddTextComponentSubstringPlayerName("Klädbutik")
        EndTextCommandSetBlipName(blip)
    end
end)


Citizen.CreateThread(function() 
    Citizen.Wait(100); 

    while true do  

        local pedPlayer, sleepThread = PlayerPedId(), 750; 

        for i = 1, #Config.Shops do  

            local Dst = #(GetEntityCoords(pedPlayer) - Config.Shops[i]) 

            if Dst <= 5.0 then  
                sleepThread = 5; 

                Utils.DrawScriptMarker({
                    type = 6, 
                    pos = Config.Shops[i] - vector3(0, 0, 0.88), 
                    r = 50, g = 150, b = 250, 
                    sizeX = 1.0, sizeY = 1.0, sizeZ = 1.0, 
                    rotate = true
                }); 

                if Dst <= 1.0 then  
                    ESX.ShowHelpNotification("~INPUT_CONTEXT~ Öppna klädäffären"); 

                    if IsControlJustReleased(0, 38) then  
                        Action.OpenShop()
                    end
                end
            end 
        end

        Citizen.Wait(sleepThread); 
    end
end)