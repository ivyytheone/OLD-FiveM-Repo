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

    local blip = AddBlipForCoord(vector3(304.84735107421875, -586.7178955078125, 43.28406143188476))

    SetBlipSprite(blip, 61)
    SetBlipScale(blip, 0.7)
    SetBlipColour(blip, 4)
    SetBlipAsShortRange(blip, true)

    BeginTextCommandSetBlipName('STRING')
    AddTextComponentSubstringPlayerName("Sjukhuset")
    EndTextCommandSetBlipName(blip)


    while true do  

        local playerPed, sleepThread = PlayerPedId(), 850; 

        for index, value in pairs(Config.Joblocations) do  

            local Dst = #(GetEntityCoords(playerPed) - value.Coords); 

            if Dst <= 5.0 and ESX.PlayerData.job ~= nil and ESX.PlayerData.job.name == "ambulance" then  
                sleepThread = 5; 

                Utils.DrawScriptMarker({
                    pos = value.Coords - vector3(0.0, 0.0, 0.985),  
                    type = 6,
                    sizeX = 1.0,
                    sizeY = 1.0,
                    sizeZ = 1.0,
                    r = 0,
                    g = 255,
                    b = 0,
                });   

                if Dst <= 1.0 then  
                    ESX.ShowHelpNotification(('~INPUT_CONTEXT~ %s'):format(value.Text)) 

                    if IsControlJustReleased(0, 38) then  
                        globalFunction(index)
                    end
                end
            end
        end

        Citizen.Wait(sleepThread); 
    end
end)

