ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) 
    ESX = obj 
end)

ESX.RegisterServerCallback('eternity_character:GetCharacters', function(source, callback)
    local player = ESX.GetPlayerFromId(source); 

    if player then 
        MySQL.Async.fetchAll([[
            SELECT * FROM users WHERE dateofbirth = @characterId
        ]], {
            ['@characterId'] = player.character.socialnumber
        }, function(response)
            if response then 
                callback(response)
            else
                callback(false)
            end
        end)
    end
end)