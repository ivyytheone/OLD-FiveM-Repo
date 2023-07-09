RegisterNetEvent('eyrp_mechanic:globalAction', function(action) 
    if action == "BossAction" then  
        TriggerEvent("esx_society:openBossMenu", "mechanic", function(Data, Menu)
            Menu.close()
        end)
    end

    if action == 'DressingRoom' then  
        Action.Dressing = 1
    end

    if action == 'SendBilling' then   
        exports.billing:createbilling()
    end

    if action == 'Garage' then  
        ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'mechanic_garage', {
            title = 'Garage', 
            align = 'top-right', 
            elements = {
                { label = 'Flatbed', vehicle = 'flatbed3' }, 
            }
        }, function(data, menu)  
            local choosenVehicle = data.current.vehicle 

            if choosenVehicle then  
                ESX.Game.SpawnVehicle(choosenVehicle, vector3(-369.4065551757813, -107.80500030517578, 38.68035125732422), 69.11721801757812, function(vehicle) 
                    ESX.ShowNotification('Du tog ut en ' .. data.current.label)
                end)
            end
        end, function(data, menu) 
            menu.close()
        end)
    end

    if action == 'ParkVehicle' then  
        TriggerEvent('esx:deleteVehicle')
    end
end)