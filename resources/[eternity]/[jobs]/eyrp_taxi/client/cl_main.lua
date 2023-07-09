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
    
    local blip = AddBlipForCoord(vector3(906.128173828125, -159.5094757080078, 74.1683349609375))

    SetBlipSprite(blip, 56)
    SetBlipScale(blip, 0.7)
    SetBlipColour(blip, 4)
    SetBlipAsShortRange(blip, true)

    BeginTextCommandSetBlipName('STRING')
    AddTextComponentSubstringPlayerName("Uber")
    EndTextCommandSetBlipName(blip)

    while true do  

        local playerPed, sleepThread = PlayerPedId(), 850; 

        for jobIndex, jobValue in pairs(Config.Joblocations) do 

            local Dst = #(GetEntityCoords(playerPed) - jobValue.Coords); 

            if Dst <= 5.0 and ESX.PlayerData.job ~= nil and ESX.PlayerData.job.name == "taxi" then  
                sleepThread = 5; 

                local displayText = jobValue.Text  

                if Dst <= 1.0 then  
                    displayText = "[~g~E~s~] - " .. jobValue.Text

                    if IsControlJustReleased(0, 38) then  
                        Action.HandleIndex(jobIndex)
                    end
                end

                ESX.Game.Utils.DrawText3D(jobValue.Coords, ("%s"):format(displayText))
            end
        end

        Citizen.Wait(sleepThread); 
    end
end)