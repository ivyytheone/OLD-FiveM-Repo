Funcs = {}; 

Funcs.AddVehicle = function(Data)

    MySQL.Async.fetchAll('SELECT plate FROM owned_vehicles WHERE plate=@plate', {
        ['@plate'] = Data.Plate
    }, function(Resp)
        if not Resp[1] then 
            MySQL.Async.execute('INSERT INTO owned_vehicles (owner, plate, vehicle, insured) VALUES (@owner, @plate, @vehicle, @insured)', {
                ['@owner'] = Data.Owner, 
                ['@plate'] = Data.Plate, 
                ['@vehicle'] = Data.Vehicle, 
                ['@insured'] = ''
            })
            MySQL.Async.execute('INSERT INTO garages (owner, plate, vehicleinfo, garage) VALUES (@owner, @plate, @vehicleinfo, @garage)', {
                ['@owner'] = Data.Owner, 
                ['@plate'] = Data.Plate, 
                ['@vehicleinfo'] = Data.Vehicle, 
                ['@garage'] = 'Garage: Bilfirman'
            })  
            TriggerClientEvent('eyrp_cardealer:AddKeyToGlovebox', -1, {
                Plate = Data.Plate,
                Model = Data.Label
            })
        end
    end)
end