ESX = {}; 

TriggerEvent('esx:getSharedObject', function(object)
    ESX = object
end)

ESX.RegisterServerCallback('lowkey_atm:WithdrawCash', function(source, callback, amount)
    local player = ESX.GetPlayerFromId(source); 

    amount = tonumber(amount)

    if not type(amount) == 'number' then 
        TriggerClientEvent('esx:showNotification', source, 'Du måste använda nummer')
    end

    if player then 
        if amount > player.getAccount('bank').money then 
            callback(false)
        else
            player.removeAccountMoney('bank', amount); 
            player.addMoney(amount); 

            callback(true)
        end
    end
end)

ESX.RegisterServerCallback('lowkey_atm:DepositCash', function(source, callback, amount)
    local player = ESX.GetPlayerFromId(source); 

    amount = tonumber(amount)

    if not type(amount) == 'number' then 
        TriggerClientEvent('esx:showNotification', source, 'Du måste använda nummer')
    end

    if player then 
        if amount > player.getMoney() then 
            callback(false)
        else
            player.removeMoney(amount)
            player.addAccountMoney('bank', amount)

            callback(true)
        end
    end
end)