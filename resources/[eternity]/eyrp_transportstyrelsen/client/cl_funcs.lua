Funcs = {
    EventHandler = function(Data)
        if (Data.Event == "CLOSE") then  
            SetNuiFocus(false, false)
        end

        if (Data.Event == 'openNui') then
            SetNuiFocus(true, true)      
            SendNUIMessage({
                Message = "OPEN"
            })
        end

        if (Data.Event == "SearchVehicle") then  
            ESX.TriggerServerCallback("eyrp_transportstyrelsen:SearchVehicle", function(Response)
                if Response then  

                    SendNUIMessage({
                        Message = "RESPONSE",
                        Data = json.encode(Response),
                        VehicleModel = GetLabelText(GetDisplayNameFromVehicleModel(GetHashKey(Response.vehicle.model)))
                    })

                else
                    exports['eyrp_notify']:LoadNotification('Det finns inget fordon med det registreringsnummret ' .. Data.Callback .. '', 'error')
                end
            end, Data.Callback)
        end
    end
};