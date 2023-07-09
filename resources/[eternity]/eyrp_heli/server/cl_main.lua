RegisterServerEvent('eyrp_heli:UpdateLights')
AddEventHandler('eyrp_heli:UpdateLights', function(state)
	local serverID = source
	TriggerClientEvent('eyrp_heli:UpdateLights', -1, serverID, state)
end)