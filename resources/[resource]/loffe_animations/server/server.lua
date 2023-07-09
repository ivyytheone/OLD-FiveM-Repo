ESX = nil
TriggerEvent("esx:getSharedObject", function(response)
    ESX = response
end)

Citizen['CreateThread'](function()
    MySQL['Async']['execute']([[ALTER TABLE `characters` ADD COLUMN IF NOT EXISTS `animations` LONGTEXT]])
end)

ESX['RegisterServerCallback']('loffe_animations:get_favorites', function(source, cb)
    local src = source
    
    local xPlayer = ESX.GetPlayerFromId(src)

    MySQL['Async']['fetchScalar']("SELECT animations FROM characters WHERE id = @cid", {["@cid"] = xPlayer["characterId"]}, function(result)
        if not result then
            MySQL['Async']['execute']([[
                UPDATE `characters` SET animations=@animations WHERE id = @cid
            ]], {
                ['@animations'] = '{}',
                ["@cid"] = xPlayer["characterId"],
            })
            cb('{}')
        else
            cb(result or '{}')
        end
    end)
end)

RegisterServerEvent('loffe_animations:update_favorites')
AddEventHandler('loffe_animations:update_favorites', function(animations)
    local src = source
    
    local xPlayer = ESX.GetPlayerFromId(src)

    MySQL['Async']['execute']([[
        UPDATE `characters` SET animations=@animations WHERE id = @cid
    ]], {
        ['@animations'] = animations,
        ["@cid"] = xPlayer["characterId"],
    })

    if Config['pNotify'] then
        pNotify(xPlayer['source'], Strings['Updated_Favorites'], 'success', 3500)
    else
        TriggerClientEvent('esx:showNotification', xPlayer['source'], Strings['Updated_Favorites'])
    end
end)

RegisterServerEvent('loffe_animations:syncAccepted')
AddEventHandler('loffe_animations:syncAccepted', function(requester, id)
    local accepted = source
    
    TriggerClientEvent('loffe_animations:playSynced', accepted, requester, id, 'Accepter')
    TriggerClientEvent('loffe_animations:playSynced', requester, accepted, id, 'Requester')
end)

RegisterServerEvent('loffe_animations:requestSynced')
AddEventHandler('loffe_animations:requestSynced', function(target, id)
    local requester = source
    local xPlayer = ESX.GetPlayerFromId(requester)
    
    MySQL['Async']['fetchScalar']("SELECT firstname FROM characters WHERE id = @cid", {["@cid"] = xPlayer["characterId"]}, function(firstname)
        TriggerClientEvent('loffe_animations:syncRequest', target, requester, id, firstname)
    end)    
end)

pNotify = function(src, message, messagetype, messagetimeout)
    TriggerClientEvent("pNotify:SendNotification", src, {
        text = (message),
        type = messagetype,
        timeout = (messagetimeout),
        layout = "bottomCenter",
        queue = "global"
    })
end
