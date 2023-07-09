ESX = nil 

TriggerEvent('esx:getSharedObject', function(obj) 
    ESX = obj  
end) 

RegisterNetEvent("eyrp_shops:removePlayerCash") 
AddEventHandler("eyrp_shops:removePlayerCash", function(Cash) 
    local Player = ESX.GetPlayerFromId(source); 

    if Player then 
        Player.removeMoney(Cash)
    end
end)