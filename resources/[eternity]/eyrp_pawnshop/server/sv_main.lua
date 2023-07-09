ESX = nil 

TriggerEvent('esx:getSharedObject', function(obj) 
    ESX = obj  
end) 

ESX.RegisterServerCallback('eyrp_pawnshop:sellItem', function(source, callback, item, price) 
    local xPlayer = ESX.GetPlayerFromId(source);  
 
    xPlayer.removeInventoryItem(item, 1)
    xPlayer.addMoney(price)  
    callback(true)
end)

ESX.RegisterServerCallback('eyrp_pawnshop:getPlayerCash', function(source, callback) 
    local xPlayer = ESX.GetPlayerFromId(source); 

    if xPlayer then  
        if xPlayer.getMoney() >= Config.Price then  
            callback(true)
            xPlayer.removeMoney(Config.Price)
        else
            callback(false)
        end
    end
end)

RegisterNetEvent('eyrp_pawnshop:sendDiscordLog', function(Label, Price) 
    SendToDiscord('Sålde en ' .. Label .. ' för ' .. Price .. ' SEK')
end)