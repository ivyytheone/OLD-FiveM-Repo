CurrentStorage = nil

RegisterNetEvent('CloseInventory')
AddEventHandler('CloseInventory', function()
    if CurrentStorage then
        exports['eyrp_inventory']:CloseUniqueTab(CurrentStorage)

        CurrentStorage = nil
    end
end)

Actions = {
    OpenInv = function(Data)
        CurrentStorage = ('evidence-%s-%s-%s'):format(Data[1], Data[2], Data[3])

        exports['eyrp_inventory']:OpenUniqueTab({
            name =  ('evidence-%s-%s-%s'):format(Data[1], Data[2], Data[3]),
            inventory = 'other',
            slots = 20,
            title = ('Bevisarkiv-%s-%s-%s'):format(Data[1], Data[2], Data[3])
        })

        Citizen.Wait(150)
        
        exports['eyrp_inventory']:OpenInventory()
    end
};