ESX = nil 

TriggerEvent('esx:getSharedObject', function(obj) 
    ESX = obj  
end) 

RegisterServerEvent("eyrp_nightclub:sendMessage")
AddEventHandler("eyrp_nightclub:sendMessage", function(text) 
    TriggerClientEvent("eyrp_nightclub:sendMessage", -1, text, source)
end)  
