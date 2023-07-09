ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterServerCallback('eyrp_evidence:FetchUsers', function(Source, Callback, Data)
    local sqlQuery = [[
        SELECT firstname, lastname, height, sex, phone_number, image FROM users WHERE dateofbirth = @dob
    ]]

    MySQL.Async.fetchAll(sqlQuery, {
        ['@dob'] = Data
    }, function(Response)
        if Response[1] then
            Callback(Response[1])
        else
            Callback(false)
        end
    end)
end)