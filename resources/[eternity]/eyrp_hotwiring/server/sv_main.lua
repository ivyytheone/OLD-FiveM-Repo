ESX = nil 

TriggerEvent('esx:getSharedObject', function(obj) 
    ESX = obj  
end) 

RegisterNetEvent("lowkey_hotwiring:removeInventoryItem")
AddEventHandler("lowkey_hotwiring:removeInventoryItem", function() 
    local Player = ESX.GetPlayerFromId(source); 

    Player.removeInventoryItem("hackkit", 1) 
end)