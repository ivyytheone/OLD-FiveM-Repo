Citizen.CreateThread(function()
    while ESX == nil do
        Citizen.Wait(1);

        ESX = exports["es_extended"]:getSharedObject()  
    end 

    if ESX.IsPlayerLoaded() then
        ESX.PlayerData = ESX.GetPlayerData()
    end

    for i = 1, #Config.Zones do 
        local blip = AddBlipForCoord(Config.Zones[i])

        SetBlipSprite(blip, 94)
        SetBlipScale(blip, 0.7)
        SetBlipColour(blip, 0)
        SetBlipAsShortRange(blip, true)
    
        BeginTextCommandSetBlipName('STRING')
        AddTextComponentSubstringPlayerName("Fallskärmshoppning")
        EndTextCommandSetBlipName(blip)
    end
end)

Citizen.CreateThread(function()
    while true do 
        local Player, sleepThread = PlayerPedId(), 850; 

        for i = 1, #Config.Zones do 
            local Dst = #(GetEntityCoords(Player) - Config.Zones[i]); 

            if Dst <= 5.0 then 
                sleepThread = 5; 

                ESX.DrawScriptMarker({
                    pos = Config.Zones[i] - vector3(0.0, 0.0, 0.985),  
                    type = 27,
                    sizeX = 1.5, sizeY = 1.5, sizeZ = 1.5,
                    r = 50, g = 155, b = 250,
                });  

                ESX.Game.Utils.DrawText3D(Config.Zones[i], "[~g~E~s~] - Hoppa fallskärm (~o~" .. Config.Price .." kr~s~)"); 

                if Dst <= 1.5 then 
                    if IsControlJustReleased(0, 38) then 
                        Funcs:StartParachuting()
                    end
                end
            end
        end

        Citizen.Wait(sleepThread); 
    end
end)
