ESX = nil  

TriggerEvent('esx:getSharedObject', function(obj) 
    ESX = obj  
end)  

ESX.RegisterServerCallback('eyrp_voi:Pay', function(Source, Callback, Amount)
    local Player = ESX.GetPlayerFromId(Source);

    if Player then
        if tonumber(Player.getMoney()) >= tonumber(Amount) then
            Player.removeMoney(tonumber(Amount))

            Callback(true)
        else
            Player.removeMoney(tonumber(Amount))
            Callback(false)
        end
    end
end)