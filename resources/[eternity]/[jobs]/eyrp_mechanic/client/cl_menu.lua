Menu = {};  

Citizen.CreateThread(function() 
    while true do   
        Citizen.Wait(0)

        if IsControlJustReleased(0, 167) and ESX.PlayerData.job ~= nil and ESX.PlayerData.job.name == Config.Jobname then  
            Menu.OpenMenu()
        end
    end
end)   

Menu.OpenMenu = function() 
    ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'mechanic', {
        title = 'Mekonomen', 
        align = 'right', 
        elements = {
            { ['label'] = 'Kolla motorhälsa', ['event'] = 'search_damage' }, 
            { ['label'] = 'Kolla motortempratur', ['event'] = 'vehicle_temp' }, 
            { ['label'] = 'Reparera fordon', ['event'] = 'repair_vehicle' }, 
            { ["label"] = 'Skicka faktura', ['event'] = "send_billing"}
        }
    }, function(data, menu) 
        local action = data.current.event  
        local Vehicle = ESX.Game.GetVehicleInDirection();

        local playerCoords = GetEntityCoords(PlayerPedId())

        if action == 'search_damage' then   
            local EngineHealth = '~g~';
            if GetVehicleEngineHealth(Vehicle) <= 500 then
                EngineHealth = '~y~'
            end

            if GetVehicleEngineHealth(Vehicle) <= 250 then
                EngineHealth = '~r~'
            end 

            ESX.ShowNotification('Motorhälsa: ' .. EngineHealth .. math.floor(GetVehicleEngineHealth(Vehicle) / 10) .. '%')
        end

        if action == 'vehicle_temp' then   
            ESX.ShowNotification('Fordonets temperatur ligger på: ~y~' .. math.floor(GetVehicleEngineTemperature(Vehicle, 1)) .. '°C')
        end

        if action == 'repair_vehicle' then  

            exports['eyrp_tools']:PlayAnimation({
                Ped = PlayerPedId(),
                Dict = 'mini@repair',
                Lib = 'fixing_a_ped',
                Flag = 1
            })

            if IsPedInAnyVehicle(PlayerPedId(), false) then
                vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
            else
                vehicle = GetClosestVehicle(playerCoords.x, playerCoords.y, playerCoords.z, 5.0, 0, 71)
            end

            SetVehicleDoorOpen(vehicle, 4, false, true)

            exports['eyrp_progressbar']:StartProgress('Reparerar...', math.random(20000, 30000), '#0892C6', function()
                SetVehicleEngineHealth(vehicle, 1000)
                SetVehicleEngineOn(vehicle, true, true )
                SetVehicleFixed(vehicle)
                ClearPedTasks(PlayerPedId())
                SetVehicleDoorShut(vehicle, 4, true)
            end) 
        end

        if action == "send_billing" then 
            exports.billing:createbilling()
        end
    end, function(data, menu) 
        menu.close()
    end)
end
