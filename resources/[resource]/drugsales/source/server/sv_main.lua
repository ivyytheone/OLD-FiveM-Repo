ESX = nil 

TriggerEvent('esx:getSharedObject', function(obj) 
    ESX = obj 
end)

RegisterNetEvent('lowkey_drugsales:sellItem', function(item, price) 
    local xPlayer = ESX.GetPlayerFromId(source); 

    xPlayer.removeMoney(price) 
    xPlayer.removeInventoryItem(item, 1) 

    TriggerClientEvent('esx:showNotification', source, 'Du sålde ' .. item .. ', för ' .. price)
end)

