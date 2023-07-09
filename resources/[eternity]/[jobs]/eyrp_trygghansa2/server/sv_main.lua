ESX = {}

TriggerEvent("esx:getSharedObject", function(object) 
    ESX = object
end)

MySQL.ready(function()
    MySQL.Async.execute([[ALTER TABLE `owned_vehicles` ADD COLUMN IF NOT EXISTS `insured` VARCHAR(255)]])

    local job_data = {
        name = "trygghansa",
        label = "Trygghansa",
        whitelisted = true
    }
    
    MySQL.Async.fetchAll("SELECT `name` FROM `jobs` WHERE `name`=@name", {["@name"] = job_data.name}, function(name)
        if #name == 0 then 
            Trace("^1The job is not in the database; adding it.")
            -- varför använde du sync??
            MySQL.Async.execute("INSERT INTO `jobs` (`name`, `label`, `whitelisted`) VALUES (@name, @label, @whitelisted)", {
                ["@name"] = job_data.name,
                ["@label"] = job_data.label,
                ["@whitelisted"] = job_data.whitelisted
            }, function()
                Trace(("Added the %s to the database."):format(job_data.name))
            end)
        else 
            Trace(("%s was in the database; nothing happened."):format(job_data.name))
        end
    end)
end)

Trace = function(msg)
    print(("[^4%s^0]: ^2%s^0"):format(GetCurrentResourceName(), msg))
end

RegisterNetEvent('InsureVehicle', function(plate, insured)
    local source = source
    MySQL.Async.execute('UPDATE `owned_vehicles` SET insured = @insured WHERE plate = @plate', { ['@insured'] = insured,  ['@plate'] = plate }, function(affectedRows)
        if (affectedRows > 0) then
            TriggerClientEvent("esx:showNotification", source, string.format("Du försäkrade ~y~%s~w~ med ~g~%s~w~", plate, insured)) 
        end
    end)
end)

ESX.RegisterServerCallback('GetPlayers', function(source, callback)
    local source = source
    local player = ESX.GetPlayerFromId(source)

    if player then 
        callback(player)
    end
end)

ESX.RegisterServerCallback('Search', function(source, callback)
    local rows = MySQL.Sync.fetchAll('SELECT * FROM owned_vehicles')
    callback(rows)
end)