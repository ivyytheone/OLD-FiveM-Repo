Citizen.CreateThread(function()
    while ESX == nil do
        Citizen.Wait(100);

        ESX = exports["es_extended"]:getSharedObject()  
    end 

    if ESX.IsPlayerLoaded() then
        ESX.PlayerData = ESX.GetPlayerData()
    end 

    local blip = AddBlipForCoord(vector3(432.6961669921875, -981.744873046875, 30.71146774291992))

	SetBlipSprite(blip, 137)
	SetBlipScale(blip, 0.7)
	SetBlipColour(blip, 0)
	SetBlipAsShortRange(blip, true)

	BeginTextCommandSetBlipName('STRING')
	AddTextComponentSubstringPlayerName("Polisen")
	EndTextCommandSetBlipName(blip)
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

        for index, value in pairs(Config.Joblocations) do  

            local Dst = #(GetEntityCoords(pedPlayer) - value.Coords);  

            if Dst <= 2.0 and ESX.PlayerData.job ~= nil and ESX.PlayerData.job.name == "police" then 
                sleepThread = 5; 

                exports['eyrp_core']:DrawText3D(value.Coords, "[~g~E~s~] - " .. value.Text)

                if IsControlJustReleased(0, 38) then  
                    Action.GetAction(index);
                end
            end
        end

        Citizen.Wait(sleepThread); 
    end
end)  

Citizen.CreateThread(function()
    Citizen.Wait(100)

    while true do
        local Player, sleepThread = PlayerPedId(), 250
            
        local closestSpike = GetClosestObjectOfType(GetEntityCoords(Player), 4.0, GetHashKey('p_ld_stinger_s'), false)

        local Distance = #(GetEntityCoords(Player) - GetEntityCoords(closestSpike))

        if Distance <= 4.0 and IsPedInAnyVehicle(Player) then

            local Vehicle = GetVehiclePedIsIn(Player, false)

            if Vehicle then

                for i = 0, 7, 1 do
                    SetVehicleTyreBurst(Vehicle, i, true, 1000)
                end
            end
        end
        
        Citizen.Wait(sleepThread)
    end
end)