ESX = nil 

TriggerEvent('esx:getSharedObject', function(obj) 
    ESX = obj  
end) 

RegisterNetEvent('eyrp_foodmechanics:removeMoney', function(Price) 
    local xPlayer = ESX.GetPlayerFromId(source); 

    print(Price)

    xPlayer.removeMoney(Price)
end)