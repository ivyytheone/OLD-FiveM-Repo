ESX = nil 

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj  
end)  

ESX.RegisterServerCallback('eyrp_menu:getPlayerData', function(source, cb, target)
	local xPlayer = ESX.GetPlayerFromId(target)
  
	local data = {
		name = GetPlayerName(target),
		inventory = xPlayer.inventory,
		accounts = xPlayer.accounts,
		money = xPlayer.get('money'),
		weapons = xPlayer.loadout
	}
	cb(data)
end) 

RegisterNetEvent("eyrp_menu:EventHandler")
AddEventHandler("eyrp_menu:EventHandler", function(Event, Data)  
	TriggerClientEvent("eyrp_menu:EventHandler", source, Event, Data)
end)

RegisterServerEvent("eyrp_menu:giveMoney")
AddEventHandler("eyrp_menu:giveMoney", function(target, amount)
	local player = ESX.GetPlayerFromId(source)
	local player2 = ESX.GetPlayerFromId(target)
	
	if tonumber(player.getMoney()) >= tonumber(amount) then
		TriggerClientEvent("eyrp_menu:EventHandler", target, "targetAnim", target)
		player.removeMoney(amount)
		player2.addMoney(amount)
		TriggerClientEvent("esx:showNotification", source, "Du gav iväg " .. amount .. "kr.")
		TriggerClientEvent("esx:showNotification", target, "Du fick " .. amount .. "kr.")
	else
		TriggerClientEvent("esx:showNotification", source, "Du har inte " .. amount .. " SEK på dig.")
	end
end)  

RegisterServerEvent('eyrp_menu:Lyft')
AddEventHandler('eyrp_menu:Lyft', function(target)
	local targetPlayer = ESX.GetPlayerFromId(target)
	TriggerClientEvent('eyrp_menu:bliLyft', targetPlayer.source, source)
	TriggerClientEvent('eyrp_menu:lyftPerson', source, target)
end)  

RegisterNetEvent('esx_handcuffs:unhandcuff') 
AddEventHandler('esx_handcuffs:unhandcuff', function(source) 
	TriggerClientEvent('esx_handcuffs:uncuff', source)
end)

RegisterServerEvent('esx_policejob:handcuff')
AddEventHandler('esx_policejob:handcuff', function(source)
  TriggerClientEvent('esx_handcuffs:cuff', source)
end)


ESX.RegisterServerCallback('GetPlayer', function(source, cb, id)
    local Player = ESX.GetPlayerFromId(id or source);

    if Player then
        cb(Player)
    else
        cb(false)
    end
end)

RegisterServerEvent('searchPlayer')
AddEventHandler('searchPlayer', function(target) 
    TriggerEvent('eyrp_inventory:GetPlayerInventories', target, function(inventories)
        if inventories and #inventories > 0 then
            TriggerClientEvent('searchPlayer', source, inventories, target)
        end
    end)
end)

ESX.RegisterServerCallback("eyrp_menu:fetchPlayerVehicles", function(source, callback, garage)
	local player = ESX.GetPlayerFromId(source)

	if player then
		local sqlQuery = [[
			SELECT
				plate, vehicle
			FROM
				owned_vehicles
			WHERE
				owner = @cid
		]]

		if garage then
			sqlQuery = [[
				SELECT
					plate, vehicle, fuel
				FROM
					owned_vehicles
				WHERE
					owner = @cid and garage = @garage
			]]
		end

		MySQL.Async.fetchAll(sqlQuery, {
			["@cid"] = player["identifier"],
			["@garage"] = garage
		}, function(responses)
			local playerVehicles = {}

			for key, vehicleData in ipairs(responses) do
				table.insert(playerVehicles, {
					["plate"] = vehicleData["plate"],
					["props"] = json.decode(vehicleData["vehicle"]),
					["fuel"] = vehicleData["fuel"]
				})
			end

			callback(playerVehicles)
		end)
	else
		callback(false)
	end
end)
