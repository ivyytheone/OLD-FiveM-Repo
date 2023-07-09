RegisterNetEvent('eyrp_garage:ParkVehicle')
AddEventHandler('eyrp_garage:ParkVehicle', function(plate, vehicleinfo, broken, garage)
    local xPlayer = ESX.GetPlayerFromId(source)
    MySQL.Async.execute('INSERT INTO garages (`owner`, `plate`, `vehicleinfo`, `garage`) VALUES (@owner, @plate, @vehicleinfo, @garage)', {
        ['@owner'] = xPlayer.getIdentifier(),
        ['@plate'] = plate, 
        ['@vehicleinfo'] = json.encode(vehicleinfo),
        ['@garage'] = garage,
    })
end)

RegisterNetEvent('eyrp_garage:TakeOutVehicle')
AddEventHandler('eyrp_garage:TakeOutVehicle', function(id)
    MySQL.Async.execute('DELETE FROM garages WHERE id = @id', {
        ['@id'] = id
    })
end)

RegisterNetEvent('eyrp_garage:AddVehicleToGarage', function(Data)
    MySQL.Async.execute('INSERT INTO garages (`owner`, `plate`, `vehicleinfo`, `garage`) VALUES (@owner, @plate, @vehicleinfo, @garage)', {
        ['@owner'] = Data.Owner,
        ['@plate'] = Data.Plate, 
        ['@vehicleinfo'] = Data.Vehicle,
        ['@garage'] = Data.Garage,
    })
end)