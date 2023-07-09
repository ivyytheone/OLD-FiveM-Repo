Jobpanel = {}; 

function Jobpanel:getEmployees(job)
    local sqlQuery = MySQL.Sync.fetchAll([[
        SELECT 
            firstname, lastname, job_grade, identifier, hasAccess
        FROM 
            users 
        WHERE 
            job = @job
    ]], {
        ['@job'] = job
    })

    if sqlQuery and #sqlQuery > 0 then 
        return sqlQuery
    end
end

function Jobpanel:getBalance(job)
    local sqlQuery = MySQL.Sync.fetchAll([[
        SELECT 
            money 
        FROM 
            addon_account_data 
        WHERE 
            account_name = @accountname
    ]], {
        ['@accountname'] = 'society_' .. job
    })

    if sqlQuery and #sqlQuery > 0 then 
        return sqlQuery[1].money
    end
end

function Jobpanel:getRanks(job)
    local sqlQuery = MySQL.Sync.fetchAll([[
        SELECT 
            * 
        FROM 
            job_grades 
        WHERE 
            job_name = @job_name
    ]], {
        ['@job_name'] = job
    })

    if sqlQuery and #sqlQuery > 0 then 
        return sqlQuery
    end
end

function Jobpanel:getCharacterData(id)
    local results = MySQL.Sync.fetchAll([[
        SELECT 
            firstname, lastname, hasAccess, job_grade 
        FROM 
            users 
        WHERE 
            identifier = @id
    ]], {
        ['@id'] = id
    })

    if results and #results > 0 then 
        return {
            firstname = results[1].firstname, 
            lastname = results[1].lastname, 
            hasAccess = results[1].hasAccess, 
            job_grade = results[1].job_grade, 
            id = id
        }
    end
end 