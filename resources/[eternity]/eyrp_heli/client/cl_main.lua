CreateThread(function()
	Wait(100)

	while true do
		local player, sleepThread = PlayerPedId(), 500;

		local vehicle = GetVehiclePedIsIn(player, false)

		if vehicle > 0 and not IsPedDeadOrDying(player) and IsPedInAnyHeli(player) and GetEntityModel(vehicle) == GetHashKey('polmav') and GetEntityHeightAboveGround(vehicle) > 5.0 then
			sleepThread = 7;

			Utils.HelpText('~INPUT_DETONATE~ - Sökarljus')

			if IsControlJustReleased(0, 47) then
				Action.HandleSpotlight()
			end
		end
		Wait(sleepThread)
	end
end)

RegisterNetEvent('eyrp_heli:UpdateLights')
AddEventHandler('eyrp_heli:UpdateLights', function(serverID, state)
	local heli = GetVehiclePedIsIn(GetPlayerPed(GetPlayerFromServerId(serverID)), false)
	SetVehicleSearchlight(heli, state, false)
end)