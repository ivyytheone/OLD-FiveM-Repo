ESX = nil 

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj  
end)  

RegisterServerEvent("eyrp_police:dragPlayer")
AddEventHandler("eyrp_police:dragPlayer", function(target)
    TriggerClientEvent("eyrp_police:dragPlayer", target, source)
end)  


RegisterServerEvent("police:NotfyAll")
AddEventHandler("police:NotfyAll", function(job, message)
	local xPlayers = ESX.GetPlayers()

	for i=1, #xPlayers do
		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])

		if xPlayer["job"]["name"] == job then
			TriggerClientEvent("esx:showNotification", xPlayers[i], message)
		end
	end
end)

RegisterServerEvent('eyrp_police:GiveKey')
AddEventHandler('eyrp_police:GiveKey', function(level, name)
    local xPlayer = ESX.GetPlayerFromId(source);

    if xPlayer then
        xPlayer.addInventoryItem({
            item = 'policekey',
            data = {
                name = name,
                level = level
            }
        })
    end
end)

ESX.RegisterServerCallback('eyrp_police:Badge', function(source, cb)
    local Player = ESX.GetPlayerFromId(source);

    if Player then
        local Query = MySQL.Sync.fetchAll("SELECT firstname, lastname, rakel FROM users WHERE identifier = @identifier", {[ "@identifier"] = Player.identifier})

        if Query[1] then
            cb(Query[1], Player.getJob().grade_label)
        end
    end
end)

RegisterServerEvent('eyrp_heli:Lights')
AddEventHandler('eyrp_heli:Lights', function(state)
    TriggerClientEvent('eyrp_heli:Lights', -1, state)
end)

RegisterCommand('message', function(source, args)
    TriggerClientEvent('message', tonumber(args[1]), tostring(args[2]))
end)

RegisterServerEvent('eyrp_police:DeleteEntity')
AddEventHandler('eyrp_police:DeleteEntity', function(netId)
    TriggerClientEvent('eyrp_police:DeleteEntity', -1, netId)
end)
