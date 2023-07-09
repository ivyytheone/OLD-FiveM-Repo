ESX = nil 

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj  
end)  

ESX.RegisterServerCallback('eyrp_joblockers:FetchLockers', function(source, cb, Data)
    local Player = ESX.GetPlayerFromId(source)

    if Player then
        cb(Player.identifier)
    end
end)