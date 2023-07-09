ESX = nil 

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj  
end)  

ESX.RegisterServerCallback('eyrp_quests:GetConfig', function(Source, Callback)
    Callback(Config)
end)