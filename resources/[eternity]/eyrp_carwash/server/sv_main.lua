ESX = nil 

TriggerEvent('esx:getSharedObject', function(obj) 
    ESX = obj  
end) 

ESX.RegisterServerCallback('eyrp_carwash:getPlayerCash', function(source, callback) 
    local xPlayer = ESX.GetPlayerFromId(source); 

    if xPlayer then  
        if xPlayer.getMoney() >= Config.Price then  
            callback(true)
        else
            callback(false)
        end
    end
end)