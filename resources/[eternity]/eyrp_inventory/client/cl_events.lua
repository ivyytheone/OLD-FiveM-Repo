RegisterNUICallback('EventHandler', function(data)
    Inventory.EventHandler(data.event, data.data)
end)
