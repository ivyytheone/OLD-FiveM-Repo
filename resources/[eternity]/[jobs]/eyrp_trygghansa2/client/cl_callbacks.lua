RegisterNUICallback("close", function(data)
    SetNuiFocus(false, false)
end)

RegisterNUICallback("insure", function(data)
    TriggerServerEvent("InsureVehicle", data.plate, data.insurance)
    local closest = {}

    -- if data.price ~= 0 then 
    --     closest.player, closest.distance = ESX.Game.GetClosestPlayer()
    
    --     if closest.player == -1 or closest.distance > 3.0 then 
    --         ESX.ShowNotification("Ingen i närheten")
    --     end

    --     TriggerServerEvent("esx_billing:sendBilling", GetPlayerServerId(closest.player), 'society_trygghansa', 'Trygghansa försäkringar', data.price)
    -- end
end)

RegisterNUICallback("search", function(data, cb)
    ESX.TriggerServerCallback("Search", function(vehicles) 
        local vehTable = {}

        for _, vehicle in ipairs(vehicles) do
            local plate = vehicle.plate:sub(1, data.length)
            if (string.lower(vehicle.plate) == string.lower(data.plate)) then 
                local veh = json.decode(vehicle["vehicle"])

                table.insert(vehTable, {
                    plate = vehicle.plate,
                    insured = vehicle.insured,
                    model = GetLabelText(GetDisplayNameFromVehicleModel(veh.model))
                })

                cb(vehTable)
            end
        end
    end)
end)