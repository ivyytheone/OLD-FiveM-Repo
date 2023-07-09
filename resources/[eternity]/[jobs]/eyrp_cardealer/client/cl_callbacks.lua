RegisterNUICallback('NuiHandler', function(Data)
    Funcs.EventHandler({
        Event = Data.Event, 
        Callback = Data.Data
    })
end)