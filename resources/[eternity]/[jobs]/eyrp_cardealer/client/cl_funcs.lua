Funcs = {};

Funcs.OpenIndex = function(Index)
    if Index == "CarDealers" then 
        SetNuiFocus(true,true)
        SendNUIMessage({
            Event = 'Open'
        })
    elseif Index == "BossActions" then 
        TriggerEvent("esx_society:openBossMenu", "cardealer", function(Data, Menu) 
            Menu.close()
        end)
    end
end

Funcs.EventHandler = function(Data) 
    if (Data.Event == 'Close') then 
        SetNuiFocus(false, false)
        SendNUIMessage({
            Event = 'Close'
        })
    elseif (Data.Event == 'FetchVehicles') then 
        SendNUIMessage({
            Event = 'LoadVehicles', 
            Data = Config.Vehicles[Data.Callback]
        })
        VehicleCategory = Data.Callback
    elseif (Data.Event == 'FetchVehicleData') then 
        SendNUIMessage({
            Event = 'LoadVehicle', 
            Data = Config.Vehicles[VehicleCategory][Data.Callback]
        })
    elseif (Data.Event == 'OrderVehicle') then 
        TriggerServerEvent('eyrp_cardealer:EventHandler', {
            Event = 'OrderVehicle', 
            Callback = {
                Vehicle = Config.Vehicles[VehicleCategory][Data.Callback],
                Plate = Utils.GenerateRandomPlate() 
            }
        })
    elseif (Data.Event == 'FetchOrders') then 
        ESX.TriggerServerCallback('eyrp_cardealer:FetchOrders', function(Orders)
            SendNUIMessage({
                Event = 'FetchOrders',
                Data = Orders
            })
        end)
    elseif (Data.Event == 'ReloadOrderList') then 
        TriggerServerEvent('eyrp_cardealer:EventHandler', {
            Event = 'ReloadOrderList',
            Callback = Data.Callback
        })
    elseif (Data.Event == 'RefreshOrderList') then 
        ESX.TriggerServerCallback('eyrp_cardealer:FetchOrders', function(Orders)
            SendNUIMessage({
                Event = 'ReloadOrderList',
                Data = Orders
            })
        end)
    elseif ( Data.Event == 'LoadStockedVehicles' ) then 
        ESX.TriggerServerCallback('eyrp_cardealer:FetchStockedVehicles', function(Stocked)
            SendNUIMessage({
                Event = 'LoadStockedVehicles',
                Data = Stocked
            })
        end)
    elseif (Data.Event == 'SellVehicleToCustomer') then 
        
        local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()

        if closestPlayer ~= -1 and closestDistance <= 3.0 then
            TriggerServerEvent('eyrp_cardealer:EventHandler', {
                Event = 'SellVehicle', 
                Plate = Data.Callback.Plate, 
                Player = GetPlayerServerId(closestPlayer),
                Id = Data.Callback.Id
            })

            ESX.ShowNotification(('Du sålde ett fordon med regnummret ~y~%s~s~'):format(Data.Callback.Plate))
        else
            TriggerServerEvent('eyrp_cardealer:EventHandler', {
                Event = 'SellVehicle', 
                Plate = Data.Callback.Plate, 
                Player = GetPlayerServerId(PlayerId()),
                Id = Data.Callback.Id
            })
        end
    end 
end