RegisterNetEvent("esx:playerLoaded")
AddEventHandler("esx:playerLoaded", function(data)
	ESX.PlayerData = data
end)

RegisterNetEvent("esx:setJob")
AddEventHandler("esx:setJob", function(job)
	ESX.PlayerData["job"] = job
end) 

Citizen.CreateThread(function()
    while ESX == nil do
        Citizen.Wait(1);

        ESX = exports["es_extended"]:getSharedObject()  
    end 

    if ESX.IsPlayerLoaded() then
        ESX.PlayerData = ESX.GetPlayerData()
    end

    while true do  

        local playerPed, sleepThread = PlayerPedId(), 950; 

        for index, value in pairs(Config.Joblocations) do  

            local Dst = #(GetEntityCoords(playerPed) - value.Coords); 

            if Dst <= 5.0 and ESX.PlayerData.job ~= nil and ESX.PlayerData.job.name == Config.Jobname then  
                sleepThread = 5; 

                Utils.Draw3DText({
                    Coords = value.Coords, 
                    Text = ('[~g~E~s~] %s'):format(value.Text)
                })

                if Dst <= 1.0 then  
                    if IsControlJustReleased(0, 38) then  
                        Utils.globalAction({
                            Action = index, 
                            Data = true
                        })
                    end
                end
            end
        end

        Citizen.Wait(sleepThread); 
    end
end)
