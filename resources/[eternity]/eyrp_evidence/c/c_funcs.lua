Funcs = {
    EventHandler = function(Data)
        if Data.Event == 'CLOSE' then
            SetNuiFocus(false, false)
        end

        if Data.Event == 'OPEN' then
            SetNuiFocus(true, true)

            SendNUIMessage({
                Message = "OPEN"
            })
        end

        if Data.Event == 'SEARCH' then
            ESX.TriggerServerCallback('eyrp_evidence:FetchUsers', function(Response)
                if Response then

                    SendNUIMessage({
                        Message = "RESPONSE",
                        Data = Response
                    })
                else
                    exports['eyrp_notify']:LoadNotification('Personen hittades inte', 'error')
                end
            end, Data.Callback)
        end

        if Data.Event == 'OPEN_INV' then
            SetNuiFocus(false, false)
            Actions.OpenInv(Data.Callback)
        end
    end
}