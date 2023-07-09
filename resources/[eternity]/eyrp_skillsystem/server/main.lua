local ESX = nil

TriggerEvent("esx:getSharedObject", function(response)
    ESX = response
end)

ESX.RegisterServerCallback("skills:retrieveSkills", function(source, cb, defaultSkills)
    local src = source

    local player = ESX.GetPlayerFromId(src)

    if player then
        local fetchSQL = [[
            SELECT
                skills
            FROM
                characters_skills
            WHERE
                cid = @id
        ]]

        MySQL.Async.fetchAll(fetchSQL, { ["@id"] = player["identifier"] }, function(response)
            if response and #response > 0 then
                local skills = response[1]["skills"]

                cb(json.decode(skills))
            end
        end)
    else
        cb(false)
    end
end)

ESX.RegisterServerCallback("skills:updateSkills", function(source, cb, updateSkills)
    local src = source

    local player = ESX.GetPlayerFromId(src)

    if player then
        local updateSQL = [[
            INSERT
                INTO
            characters_skills
                (cid, skills)
            VALUES
                (@cid, @newSkills)
            ON DUPLICATE KEY UPDATE
                skills = @newSkills
        ]]

        MySQL.Async.execute(updateSQL, { 
            ["@cid"] = player["identifier"], ["@newSkills"] = json.encode(updateSkills) 
        }, function(rowsChanged)
            if rowsChanged > 0 then
                cb(true)
            else
                cb(false)
            end
        end)
    else
        cb(false)
    end
end)
