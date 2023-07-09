ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('eyrp_death:revive')
AddEventHandler('eyrp_death:revive', function(target)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	
	TriggerClientEvent('eyrp_death:revive', target)
end)


TriggerEvent('es:addGroupCommand', 'revive', 'admin', function(source, args, user)
	if args[1] ~= nil then
		if GetPlayerName(tonumber(args[1])) ~= nil then
			print('eyrp_death: ' .. GetPlayerName(source) .. ' is reviving a player!')
			TriggerClientEvent('eyrp_death:revive', tonumber(args[1]))
		end
	else
		TriggerClientEvent('eyrp_death:revive', source)
	end
end, function(source, args, user)
	TriggerClientEvent('chatMessage', source, "SYSTEM", {255, 0, 0}, "Insufficient Permissions.")
end, {help = 'Revive player', params = {{name = 'id'}}})


