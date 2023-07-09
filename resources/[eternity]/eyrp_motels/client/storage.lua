RegisterNetEvent('CloseInventory')
AddEventHandler('CloseInventory', function()
    if CurrentStorage then
        exports["eyrp_inventory"]:CloseUniqueTab(CurrentStorage);

        CurrentStorage = nil
    end
end)

OpenStorage = function(storageId)
    CurrentStorage = ('Storage-%s'):format(storageId);

    exports["eyrp_inventory"]:OpenUniqueTab({
        name = ('Storage-%s'):format(storageId),
        inventory = 'other',
        slots = 50,
        title = "Förråd"
    })

    Citizen.Wait(150);
                        
    exports["eyrp_inventory"]:OpenInventory() 
end