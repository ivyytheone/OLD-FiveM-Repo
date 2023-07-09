ESX.RegisterServerCallback('eyrp_gangs:TakeOverZone', function(Source, Callback, Zone)
    local player = ESX.GetPlayerFromId(Source);

    if player then

        local sqlQuery = [[
            SELECT
                gang
            FROM
                users
            WHERE
                identifier = @identifier
        ]]

        MySQL.Async.fetchAll(sqlQuery, {
            ['@identifier'] = player.identifier
        }, function(Gang)

            if Gang[1] then
                MySQL.Async.execute('UPDATE ownedmarks SET owner = @owner WHERE zone = @zone', {
                    ['@zone'] = Zone,
                    ['@owner'] = Gang[1].gang
                })

                Callback(Gang[1].gang)
            else
                Callback(false)
            end
        end)
    else
        Callback(false)
    end
end)

ESX.RegisterServerCallback('eyrp_gangs:GiveUpZone', function(Source, Callback, Zone)
    MySQL.Async.execute('UPDATE ownedmarks SET owner = @owner WHERE zone = @zone', {
        ['@zone'] = Zone,
        ['@owner'] = 'Ingen'
    })

    Callback(true)
end)

ESX.RegisterServerCallback('eyrp_gangs:GetZoneData', function(Source, Callback, Zone)
    local player = ESX.GetPlayerFromId(Source);

    if player then

        local sqlQuery = [[
            SELECT
                gang
            FROM
                users
            WHERE
                identifier = @identifier
        ]]

        MySQL.Async.fetchAll(sqlQuery, {
            ['@identifier'] = player.identifier
        }, function(Gang)

            if Gang[1] then
                local sqlQuery = [[
                    SELECT * FROM ownedmarks WHERE zone = @zone
                ]]
            
                MySQL.Async.fetchAll(sqlQuery, {
                    ['@zone'] = Zone
                }, function(ZoneData)

                    if Gang[1].gang == 'None' then
                        Callback({ State = 'NoGang', Data = ZoneData[1].owner })

                    elseif ZoneData[1].owner == 'Ingen' then
                        Callback({ State = 'NoOwner', Data = ZoneData[1].owner })

                    elseif ZoneData[1].owner == Gang[1].gang then
                        Callback({ State = 'IsInOwnerGang', Data = ZoneData[1].owner })

                    else
                        Callback({ State = 'IsInOtherGang', Data = ZoneData[1].Owner })
                    end
                    
                end)
            end
        end)
    end
end)

RegisterServerEvent('eyrp_gangs:NotifyGangMembers', function(Gang)
    local sqlQuery = [[
        SELECT identifier FROM users WHERE gang = @gang
    ]]

    MySQL.Async.fetchAll(sqlQuery, {
        ['@gang'] = Gang
    }, function(Response)
        print(json.encode(Response))
    end)
end)