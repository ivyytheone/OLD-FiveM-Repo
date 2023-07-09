handleWhitelist = function(name, reason, deferals)
    deferals.defer()

    local player = source
    deferals.update('Kontrollerar whitelist...')

    Wait(1500)
    local idx = Funcs.GetPlayerIdentifiers(player)

    local sqlQuery = [[
        SELECT * FROM whitelisted
    ]]

    MySQL.Async.fetchAll(sqlQuery, {}, function(whitelisted)

        for i = 1, #whitelisted do

            if whitelisted[i].identifier == idx.steam then
                deferals.update('Välkommen in!')
                Wait(1500)
                deferals.done()
            else
                deferals.update('Du är inte whitelistad på Eternity')
                CancelEvent()
            end
        end
    end)
end

AddEventHandler('playerConnecting', handleWhitelist)