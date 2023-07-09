ESX = nil  

TriggerEvent('esx:getSharedObject', function(obj) 
    ESX = obj  
end)  

ESX.RegisterServerCallback('eyrp_rich:GetIdentity', function(source, cb)
    local Player, maxplayers = ESX.GetPlayerFromId(source), GetConvarInt('sv_maxclients')

    if Player then
        local sqlQuery = [[
            SELECT 
        firstname, 
            lastname 
        FROM 
            users 
        WHERE 
            identifier = @identifier
	]]

	MySQL.Async.fetchAll(sqlQuery, {
		['@identifier'] = Player.identifier
	}, function(resp)
            if resp[1] then
                cb(resp[1], maxplayers)
            end
	    end)
    end
end)

ESX.RegisterServerCallback("eyrp_rich:getPlayerTime", function(Source, Cb)
    local playTimeCooldown = 60000 * 5
    local lastPlayTimeAdded = GetGameTimer() + playTimeCooldown
    if GetGameTimer() - lastPlayTimeAdded > playTimeCooldown then
        for _, characterData in pairs(X.LoadedCharacters) do
            local lastPlayTime = characterData["custom"]["timePlayed"] or 0

            characterData["custom"]["add"]("timePlayed", lastPlayTime + 5)

            if characterData.custom.CHARACTER_IN_DUTY then
                local dataStorage = exports["x-datastorage"]:GetStorage(characterData.characterId)

                local lastTotalDutyTime = dataStorage and dataStorage.Get("MINUTES_IN_DUTY") or 0

                dataStorage.Update("MINUTES_IN_DUTY", lastTotalDutyTime + 5)
            end
        end

        ESX.Trace("5 minutes playtime added to each and everyone.")

        lastPlayTimeAdded = GetGameTimer()
    end
end)