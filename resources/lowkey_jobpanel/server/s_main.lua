ESX = nil

TriggerEvent('esx:getSharedObject', function(obj)
    ESX = obj 
end)

ESX.RegisterServerCallback('lowkey_jobpanel:getData', function(source, callback, data)
    local player = ESX.GetPlayerFromId(source); 

    if not player then 
        callback({
            type = 'error', 
            message = 'Could not find player'
        })    
        return 
    end 

    local self = Jobpanel; 

    local employees = self:getEmployees(data.job);
    local capital = self:getBalance(data.job); 
    local ranks = self:getRanks(data.job); 

    callback {
        type = 'success', 
        data = {
            capital = capital, 
            ranks = ranks, 
            employees = employees
        }
    }
end)

ESX.RegisterServerCallback('lowkey_jobpanel:updateCharacter', function(source, callback, data)
    print(json.encode(data.characterData))

    local self = Jobpanel;
    local jobGrades = self:getRanks(data.characterData.job); 
    local character = Jobpanel:getCharacterData(data.characterData.id);

    if data.rank.value ~= character.job_grade then 
        local sqlQuery = MySQL.Sync.execute([[
            UPDATE users SET job_grade = @job_grade WHERE identifier = @id
        ]], {
            ['@job_grade'] = data.rank.value, 
            ['@id'] = data.characterData.id
        })
    end

    if data.characterData.hasAccess ~= character.hasAccess then 
        local rowsChanged = MySQL.Sync.execute([[
            UPDATE users SET hasAccess = @hasAccess WHERE identifier = @id
        ]], {
            ['@hasAccess'] = data.characterData.hasAccess, 
            ['@id'] = data.characterData.id
        })
    end

    callback(true)
end)

ESX.RegisterServerCallback('lowkey_jobpanel:updateCapital', function(source, callback, data)
    local self = Jobpanel;
    local balance = self:getBalance(data.job); 

    local player = ESX.GetPlayerFromId(source);

    if not player then return end; 

    local sqlQuery = {}
    local amount = tonumber(data.amount); 

    if data.type == 'deposit' then 
        if player.getMoney() >= amount then 
            sqlQuery = [[
                UPDATE addon_account_data SET money = money + @amount WHERE account_name = @account_name
            ]]
        else
            callback({
                type = 'error', 
                message = 'Du har inte tillräckligt med pengar på dig!'
            })
            return
        end
    else
        if balance >= amount then 
            sqlQuery = [[
                UPDATE addon_account_data SET money = money - @amount WHERE account_name = @account_name
            ]]
        else
            callback({
                type = 'error', 
                message = 'Det finns inte tillräckligt med pengar i kapitalet!'
            })
            return
        end
    end

    MySQL.Sync.execute(sqlQuery, {
        ['@amount'] = data.amount, 
        ['@account_name'] = 'society_' .. data.job
    })

    callback(true)
end)

ESX.RegisterServerCallback('lowkey_jobpanel:firePlayer', function(source, callback, data)
    local self = Jobpanel;

    local sqlQuery = MySQL.Sync.execute([[
        UPDATE users SET job = @job, job_grade = @job_grade WHERE identifier = @id
    ]], {
        ['@job'] = 'unemployed', 
        ['@job_grade'] = 0, 
        ['@id'] = data.player.id
    })

    callback(true)
end)

ESX.RegisterServerCallback('lowkey_jobpanel:hirePlayer', function(source, callback, data)
    local target = ESX.GetPlayerFromId(data.player);
    
    local sqlQuery = MySQL.Sync.execute([[
        UPDATE users SET job = @job, job_grade = @job_grade WHERE identifier = @id
    ]], {
        ['@job'] = data.job, 
        ['@job_grade'] = 0, 
        ['@id'] = target.character.id
    })

    callback({
        type = 'success', 
        message = ('Du har anställt %s!'):format(target.character.firstname .. ' ' .. target.character.lastname)
    })
end)

ESX.RegisterServerCallback('lowkey_jobpanel:getCharacterData', function(source, callback, data)
    callback(Jobpanel:getCharacterData(data.id))
end)