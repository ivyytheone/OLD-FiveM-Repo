ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterServerCallback('eyrp_garage:GetGarageVehicles', function(source, callback, garage)
    MySQL.Async.fetchAll('SELECT * FROM garages WHERE garage = @garage', {
        ['@garage'] = garage
    }, function(result)
        local info = {};
        for i=1, #result do 
            result[i].vehicleinfo = json.decode(result[i].vehicleinfo)
            table.insert(info, result[i])
        end
        callback(info)
    end)
end)

ESX.RegisterServerCallback('eyrp_garage:errorHandler', function(source, callback, id)
    MySQL.Async.fetchAll('SELECT * FROM garages WHERE id = @id', {
        ['@id'] = id
    }, function(resp)
        if resp[1] ~= nil then 
            callback(true)
        else
            callback(false)
        end
    end)
end)

ESX.RegisterServerCallback('eyrp_garage:vehDamage', function(source, callback, id)
    MySQL.Async.fetchAll('SELECT * FROM garages WHERE id = @id', {
        ['@id'] = id
    }, function(result)
        for i=1, #result, 1 do 
            callback(json.decode(result[i].broken))
        end
    end)
end)