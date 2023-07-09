
RegisterCommand("coords", function(source, args)
	local coords = GetEntityCoords(PlayerPedId()) 
	local heading = GetEntityHeading(PlayerPedId())
	SendNUIMessage({
		action = "copy",
		type = args[1],
	    coords = { x = coords.x, y = coords.y, z = coords.z, heading = heading }
	})
end)