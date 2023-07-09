Citizen.CreateThread(function()
    while ESX == nil do
        Citizen.Wait(1);

        ESX = exports["es_extended"]:getSharedObject()  
    end 

    if ESX.IsPlayerLoaded() then
        ESX.PlayerData = ESX.GetPlayerData()
    end
end)

Citizen.CreateThread(function() 
    while true do  
        local Player, sleepThread = PlayerPedId(), 850; 

        for Index, Value in pairs(Config.Jobs) do  
            local Dst = #(GetEntityCoords(Player) - Value.Coords); 
            
            if Dst <= 5.0 then  
                sleepThread = 5; 

                ESX.Game.Utils.DrawText3D(Value.Coords, "[~g~E~s~] - " .. Value.Text); 

                if Dst <= 1.0 then  
                    if IsControlJustReleased(0, 38) then  
                        TriggerServerEvent("eyrp_detentioncall:SendPage", Value)
                    end
                end
            end
        end

        Citizen.Wait(sleepThread); 
    end
end)

RegisterNetEvent("eyrp_detentioncall:SendMessage") 
AddEventHandler("eyrp_detentioncall:SendMessage", function(Value)
    for k, v in pairs(Value.Jobs) do  
        if (ESX.PlayerData.job ~= nil and ESX.PlayerData.job.name == v) then  
            ESX.ShowNotification('<strong style="font-size:15px">SOS Alarm - Inkommande larm</strong><br> En person har aktiverat knappen vid reception.')
        end
    end
end)