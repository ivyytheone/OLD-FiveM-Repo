RegisterNUICallback('exit', function()
    SendNUIMessage({
		array = false,
		garageInfo = false,
		open = false,
	})
	SetNuiFocus(false, false)
end)

RegisterNUICallback('TakeOutVehicle', function(data)
    Funcs.TakeOutVehicle(data.vInfo.id, data.vArray.model, data.vArray) 
end)
