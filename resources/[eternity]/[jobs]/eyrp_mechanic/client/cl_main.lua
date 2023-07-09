Citizen.CreateThread(function()
    while ESX == nil do
        Citizen.Wait(1);

        ESX = exports["es_extended"]:getSharedObject()  
    end 

    if ESX.IsPlayerLoaded() then
        ESX.PlayerData = ESX.GetPlayerData()
    end 

    local Blip = AddBlipForCoord(vector3(-352.5711364746094, -135.95953369140625, 39.0096206665039)) 
	SetBlipSprite (Blip, 402)
    SetBlipDisplay(Blip, 4)
	SetBlipScale  (Blip, 0.8)
    SetBlipColour (Blip, 0) 
    SetBlipAsShortRange(Blip, true)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString("Mekonomen")
    EndTextCommandSetBlipName(Blip)
end) 

RegisterNetEvent("esx:playerLoaded")
AddEventHandler("esx:playerLoaded", function(data)
	ESX.PlayerData = data
end)

RegisterNetEvent("esx:setJob")
AddEventHandler("esx:setJob", function(job)
	ESX.PlayerData["job"] = job
end) 

Citizen.CreateThread(function()  
    Citizen.Wait(100); 

    while true do  
        local pedPlayer, sleepThread = PlayerPedId(), 750; 

        for index, value in pairs(Config.Jobloctions) do  
            local playerDst = #(GetEntityCoords(pedPlayer) - value.Coords); 

            if playerDst <= 5.0 and ESX.PlayerData.job ~= nil and ESX.PlayerData.job.name == Config.Jobname then  
                sleepThread = 5; 
                
                ESX.DrawScriptMarker({
                    pos = value.Coords,  
                    type = 2,
                    sizeX = 0.1,
                    sizeY = 0.1,
                    sizeZ = 0.1,
                    r = 0,
                    g = 255,
                    b = 0,  
                    rotate = true
                });  

                if playerDst <= 1.0 then   
                    ESX.ShowHelpNotification(("~INPUT_CONTEXT~ %s"):format(value.Text));

                    if IsControlJustReleased(0, 38) then  
                        TriggerEvent('eyrp_mechanic:globalAction', index)
                    end
                end
            end
        end

        Citizen.Wait(sleepThread); 
    end
end)