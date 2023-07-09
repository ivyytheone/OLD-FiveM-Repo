Actions = {}; 
CurrentStorage = {}

Actions.OpenLockerMenu = function(Data)
    ESX.TriggerServerCallback('identity', function(data)
        CurrentStorage = ('%s-%s-%s'):format(ESX.PlayerData.job.name, data.firstname, data.lastname),

        exports['eyrp_inventory']:OpenUniqueTab({
            name = ('%s-%s-%s'):format(ESX.PlayerData.job.name, data.firstname, data.lastname),
            inventory = 'other',
            slots = 10,
            title = 'Skåp'
        })
    
        Citizen.Wait(150)
    
        exports['eyrp_inventory']:OpenInventory()
    end)
end

exports('OpenPersonalLocker', Actions.OpenLockerMenu)
