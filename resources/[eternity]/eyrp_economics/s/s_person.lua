ESX = nil  

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj  
end)


ESX.RegisterServerCallback('eyrp_economics:handlePaycheck', function(source, callback)
    local player = ESX.GetPlayerFromId(source);

    local paycheck = {
        hour = tonumber(math.floor(os.date('!%H') + 2)),
        minute = tonumber(os.date('!%M'))
    }

    if player then

        local sqlQuery = [[
            SELECT salary FROM users WHERE identifier = @identifier
        ]]

        MySQL.Async.fetchAll(sqlQuery, {
            ['@identifier'] = player.identifier
        }, function(currentSalary)

            if currentSalary[1].salary then

                if paycheck.hour == 10 and paycheck.minute == 52 then
                    if currentSalary[1].salary == 0 then callback(false) return end

                    callback(currentSalary[1].salary)
                    GiveSalary(player.identifier, currentSalary[1].salary)
                else
                    callback(false)
                    UpdateSalary(player.identifier, currentSalary[1].salary)
                end
            else
                callback(false)
            end
        end)
    else
        callback(false)
    end
end)

GiveSalary = function(identifier, amount)
    MySQL.Async.execute('UPDATE users SET salary = @salary WHERE identifier = @identifier', {
        ['@identifier'] = identifier,
        ['@salary'] = 0,
    })
end

UpdateSalary = function(identifier, amount)
    MySQL.Async.execute('UPDATE users SET salary = @salary WHERE identifier = @identifier', {
        ['@identifier'] = identifier,
        ['@salary'] = tonumber(amount) + 1
    })
end