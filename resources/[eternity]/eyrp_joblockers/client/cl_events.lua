RegisterNetEvent('CloseInventory')
AddEventHandler('CloseInventory', function()
    if CurrentStorage then
        exports['eyrp_inventory']:CloseUniqueTab(CurrentStorage)

        CurrentStorage = nil
    end
end)