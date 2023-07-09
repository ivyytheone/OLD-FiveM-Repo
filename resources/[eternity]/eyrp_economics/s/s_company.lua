ESX = nil  

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj  
end)  

Deposit = function(Data, Callback)
    GetCompanyMoney(Data.Job, function(Amount)

        MySQL.Async.execute('UPDATE company_money SET money = @money WHERE job = @job', {
            ['@job'] = Data.Job, 
            ['@money'] = Amount + tonumber(Data.Money)
        }, function(rowsChanged)

            if rowsChanged == 1 then
                Callback(true)
            else
                Callback(false)
            end
        end)
    end)
end

Withdraw = function(Data, Callback)

    GetCompanyMoney(Data.Job, function(Amount)

        if tonumber(Amount) >= tonumber(Data.Money) then   

            MySQL.Async.execute('UPDATE company_money SET money = @money WHERE job = @job', {
                ['@job'] = Data.Job, 
                ['@money'] = tonumber(Amount) - tonumber(Data.Money)
            }, function(rowsChanged)

                if rowsChanged == 1 then
                    Callback(true)
                end
            end)
        else
            Callback(false)
        end
    end)
end

GetCompanyMoney = function(Job, Callback)

    local sqlQuery = [[
        SELECT money FROM company_money WHERE job = @job
    ]]

    MySQL.Async.fetchAll(sqlQuery, {
        ['@job'] = Job
    }, function(Money)

        if Money[1].money then
            Callback(tonumber(Money[1].money))
        else
            Callback(false)
        end
    end)
end

ESX.RegisterServerCallback('eyrp_society:GetComanyMoney', function(Source, Callback, Job)
    GetCompanyMoney(Job, function(Amount)

        Callback(Amount)
    end)
end)