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

    Utils.CreateBlip()

    while true do  

        local playerPed, sleepThread = PlayerPedId(), 850; 

        for location, locationCoords in pairs(Config.Locations) do 

            local Dst = #(GetEntityCoords(playerPed) - locationCoords["Coords"]); 

            if Dst <= 5.0 then  
                sleepThread = 5; 

                ESX.Game.Utils.DrawText3D(locationCoords["Coords"], ("[~g~E~s~] %s"):format(locationCoords["Text"])); 

                if Dst <= 1.0 then 
                    if IsControlJustReleased(0, 38) then  
                        Utils.EventHandler(location)
                    end
                end
            end
        end

        Citizen.Wait(sleepThread); 
    end
end)
