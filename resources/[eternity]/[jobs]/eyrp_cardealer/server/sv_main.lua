ESX = nil 

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj  
end)  

ESX.RegisterServerCallback('eyrp_cardealer:DoesPlateExist', function(Source, Callback, Plate)
    MySQL.Async.fetchAll('SELECT plate FROM owned_vehicles WHERE plate=@plate', {
        ['@plate'] = Plate 
    }, function(Resp) 
        if Resp[1] then 
            Callback(true)
        else
            Callback(false)
        end
    end)
end)

ESX.RegisterServerCallback('eyrp_cardealer:FetchOrders', function(Source, Callback)
    MySQL.Async.fetchAll('SELECT * FROM cardealer_vehicles WHERE state=@state', {
        ['@state'] = 'waiting'
    }, function(Resp)
        for i=1, #Resp do 
            local minutes; 
            local hour; 
            local Weekday = os.date('%A', Resp[i].arriving)

            if ( (string.len(os.date("*t", Resp[i].arriving).min)) <= 1) then 
                minutes = '0' .. os.date("*t", Resp[i].arriving).min
            else
                minutes = os.date("*t", Resp[i].arriving).min
            end

            if ( (string.len(os.date("*t", Resp[i].arriving).hour)) <= 1) then 
                hour = '0' .. os.date("*t", Resp[i].arriving).hour
            else
                hour = os.date("*t", Resp[i].arriving).hour
            end

            Resp[i].time = ('%s %s:%s'):format(Config.WeekDays[Weekday], hour, minutes); 
            Resp[i].vehicle = json.decode(Resp[i].vehicle); 
        end
        Callback(Resp)
    end)
end)

ESX.RegisterServerCallback('eyrp_cardealer:FetchStockedVehicles', function(Source, Callback)
    MySQL.Async.fetchAll('SELECT * FROM cardealer_vehicles WHERE state=@state', {
        ['@state'] = 'in-stock'
    }, function(Resp)
        for i=1, #Resp do 
            Resp[i].vehicle = json.decode(Resp[i].vehicle); 
        end
        Callback(Resp)
    end)
end)

CreateThread(function()
    while true do 
        MySQL.Async.fetchAll('SELECT * FROM cardealer_vehicles WHERE state = @state', {
            ['@state'] = 'waiting'
        }, function(Resp)
            for i=1, #Resp do 
                if (Resp[i].arriving < os.time()) then 
                    MySQL.Async.execute('UPDATE cardealer_vehicles SET state = @state WHERE arriving = @arriving', {
                        ['@state'] = 'in-stock',
                        ['@arriving'] = Resp[i].arriving
                    })

                    Funcs.AddVehicle({
                        Plate = json.decode(Resp[i].vehicle).plate, 
                        Owner = 'Bilfirman', 
                        Vehicle = Resp[i].vehicle, 
                        Label = Resp[i].vehicle_label
                    })
                end
            end
        end)
        Wait(1000)
    end
end)