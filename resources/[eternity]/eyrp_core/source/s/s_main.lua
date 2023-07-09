ESX = nil 

TriggerEvent('esx:getSharedObject', function(obj) 
    ESX = obj  
end) 

ESX.RegisterServerCallback("eyrp_core:payMoney", function(source, callback, price)
    local player = ESX.GetPlayerFromId(source);

    if player then
        if player.getMoney() >= tonumber(price) then
            player.removeMoney(tonumber(price))

            callback(true)
        else
            callback(false)
        end
    end
end)

ESX.RegisterServerCallback('eyrp_core:getPlayerData', function(source, callback)
    local player = ESX.GetPlayerFromId(source);

    if player then

        local sqlQuery = [[
            SELECT * FROM users WHERE identifier = @identifier
        ]]

        MySQL.Async.fetchAll(sqlQuery, {
            ['@identifier'] = player.identifier
        }, function(response)
            if response[1] then
                callback(response[1])
            else
                callback(false)
            end
        end)
    else
        callback(false)
    end
end)

ESX.RegisterServerCallback('eyrp_core:richPresence', function(source, callback)
    local player = ESX.GetPlayerFromId(source)

    if player then

        local sqlQuery = [[
            SELECT firstname, lastname FROM users WHERE identifier = @identifier
        ]]

        MySQL.Async.fetchAll(sqlQuery, {
            ['@identifier'] = player.identifier
        }, function(response)
            if response[1] then
                callback({
                    firstname = response[1].firstname,
                    lastname = response[1].lastname,
                    maxplayers = GetConvarInt('sv_maxclients')
                })
            else
                callback(false)
            end
        end)
    else
        callback(false)
    end
end)

RegisterNetEvent('entityRemoved')
AddEventHandler('entityRemoved', function(entity)
    print(entity)
end)