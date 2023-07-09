ESX = nil 

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj  
end)  

RegisterNetEvent('eyrp_cardealer:EventHandler', function(Data) 
    if (Data.Event == 'OrderVehicle') then 
        local generatedPlate = Data.Callback.Plate; 
        --[[ print(os.date('*t') ]]
        local arriving = os.time() + Config.OrderTime

        TriggerEvent('esx_addonaccount:getSharedAccount', 'society_cardealer', function(account)
            print(account.money)
            if (account.money >= Data.Callback.Vehicle.Price) then 
                account.removeMoney(Data.Callback.Vehicle.Price)
                MySQL.Async.execute('INSERT INTO cardealer_vehicles (vehicle, vehicle_label, price, state, arriving) VALUES (@vehicle, @vehicle_label, @price, @state, @arriving)', {
                    ['@vehicle'] = json.encode({model = Data.Callback.Vehicle.Model, plate = generatedPlate, bodyHealth	= 1000, engineHealth = 1000, fuelLevel = 100}),
                    ['@vehicle_label'] = Data.Callback.Vehicle.Label,
                    ['@price'] = Data.Callback.Vehicle.Price,
                    ['@state'] = 'waiting',
                    ['@arriving'] = arriving
                })
                TriggerClientEvent('esx:showNotification', source, 'Du beställde en ~y~' .. Data.Callback.Vehicle.Label, 'success')
            else
                TriggerClientEvent('esx:showNotification', source, 'Finns inte tillräckligt med ~y~pengar', 'error')
            end
        end)

    elseif (Data.Event == 'ReloadOrderList') then 


        MySQL.Async.execute('DELETE FROM cardealer_vehicles WHERE id=@id', {
            ['@id'] = Data.Callback
        })
        
    elseif (Data.Event == 'BuyVehicle') then 
        local generatedPlate = Data.Plate

        MySQL.Async.execute('INSERT INTO owned_vehicles (owner, plate, vehicle) VALUES (@owner, @plate, @vehicle)', {
			['@owner']   = 'Bilfirman',
			['@plate']   = generatedPlate,
			['@vehicle'] = json.encode({model = Data.Vehicle.Model, plate = generatedPlate})
		})
    elseif (Data.Event == 'SellVehicle') then 
        MySQL.Async.execute('UPDATE owned_vehicles SET owner = @owner WHERE plate=@plate', {
            ['@owner'] = ESX.GetPlayerFromId(Data.Player).getIdentifier(), 
            ['@plate'] = Data.Plate
        }, function(rowsChanged)
            local target = ESX.GetPlayerFromId(Data.Player); 

            MySQL.Async.execute('DELETE FROM cardealer_vehicles WHERE id=@id', {
                ['@id'] = Data.Id
            })
        end)
    end
end)

