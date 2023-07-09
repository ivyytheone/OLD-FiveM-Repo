ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterServerCallback('eyrp_rakel:Change', function(Source, Callback, dob, rakel)

    local Response = MySQL.Sync.fetchAll('SELECT firstname, lastname, job FROM users WHERE dateofbirth = @dob ', {['@dob'] = dob})

    if Response[1] then
        if not Response[1].job == 'police' then 
            MySQL.Async.execute('UPDATE users SET rakel = @rakel WHERE dateofbirth = @dob', {
                ['@dob'] = dob, 
                ['@rakel'] = rakel
            })
            Callback(Response[1])
        else
            TriggerClientEvent('esx:showNotification', Source, 'Individen med detta personnummret är inte polis', 'error') 
        end
    else
        Callback(false)
    end
end)