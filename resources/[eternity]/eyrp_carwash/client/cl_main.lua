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

        SetBlipSprite(blip, 100)
        SetBlipScale(blip, 0.7)
        SetBlipColour(blip, 4)
        SetBlipAsShortRange(blip, true)
    
        BeginTextCommandSetBlipName('STRING')
        AddTextComponentSubstringPlayerName("Billtvätt")
        EndTextCommandSetBlipName(blip)
    end
end) 

Citizen.CreateThread(function()  
    while true do  

        local playerPed, sleepThread = PlayerPedId(), 850; 

        for i = 1, #Config.Zones do  

            local Dst = #(GetEntityCoords(playerPed) - Config.Zones[i]); 

            if Dst <= 5.0 and IsPedInAnyVehicle(playerPed, false) then  
                sleepThread = 5; 

                ESX.Game.Utils.DrawText3D(Config.Zones[i], "Tryck [~g~E~s~] för att tvätta ditt ~o~fordon~s~ (" .. Config.Price .. " SEK)"); 

                if Dst <= 1.0 then  
                    if IsControlJustReleased(0, 38) then  
                        ESX.TriggerServerCallback('eyrp_carwash:getPlayerCash', function(Resopnse) 
                            if Resopnse then   
                                local vehicle = GetVehiclePedIsIn(playerPed, false)

                                SetVehicleDirtLevel(vehicle, 0.1) 
                                ESX.ShowNotification('Du tvättade ditt fordon för ~g~' .. Config.Price .. " sek")
                            else
                                ESX.ShowNotification('Du har inte tillräcklig med ~r~pengar~s~', "error")
                            end
                        end)
                    end
                end
            end
        end

        Citizen.Wait(sleepThread); 
    end
end)