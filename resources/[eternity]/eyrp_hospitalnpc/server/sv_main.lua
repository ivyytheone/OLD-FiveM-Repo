ESX = nil 

TriggerEvent('esx:getSharedObject', function(obj) 
    ESX = obj  
end) 

RegisterNetEvent("eyrp_hospitalnpc:removeMoney")
AddEventHandler("eyrp_hospitalnpc:removeMoney", function(HealthLost) 
    local Player = ESX.GetPlayerFromId()

    if Player then  
        Player.removeMoney(HealthLost)
    end
end)

ESX.RegisterServerCallback("eyrp_hospital:fetchAmbulance", function(source, cb)
    local players = ESX.GetPlayers()

    local ambulancemen = 0

    for i = 1, #players do
        local player = ESX.GetPlayerFromId(players[i])

        if player then
            if player["job"]["name"] == "ambulance" then
                ambulancemen = ambulancemen + 1
            end
        end
    end

    if ambulancemen == 0 then
        cb(true)
    else
        cb(false)
    end
end)