RegisterNetEvent('CloseInventory')
AddEventHandler('CloseInventory', function()
    if CurrentStorage then
        exports['eyrp_inventory']:CloseUniqueTab(CurrentStorage)

        ClearPedTasks(PlayerPedId())
        SetVehicleDoorShut(ESX.Game.GetClosestVehicle(GetEntityCoords(PlayerPedId()), false), 5, true)
        CurrentStorage = nil
    end
end)

Trunk = {}

Trunk.Open = function(Vehicle)

    CurrentStorage = ('trunk-%s'):format(Utils.Trim(GetVehicleNumberPlateText(Vehicle)))

    exports['eyrp_inventory']:OpenUniqueTab({
        name =  ('trunk-%s'):format(Utils.Trim(GetVehicleNumberPlateText(Vehicle))),
        inventory = 'other',
        slots = 10,
        title = 'Baklucka'
    })

    TaskTurnPedToFaceEntity(PlayerPedId(), Vehicle)

    Citizen.Wait(500)
    Utils.PlayScenario('PROP_HUMAN_BUM_BIN')
    Citizen.Wait(150)
    exports['eyrp_inventory']:OpenInventory()

end

Glovebox = {}

Glovebox.Open = function()

    local Player = PlayerPedId()

    if IsPedInAnyVehicle(Player, true) then
        local Vehicle = GetVehiclePedIsIn(Player, false)

        if not IsPedDeadOrDying(Player) then
            CurrentStorage = ('glovebox-%s'):format(Utils.Trim(GetVehicleNumberPlateText(Vehicle)))

            exports['eyrp_inventory']:OpenUniqueTab({
                name = ('glovebox-%s'):format(Utils.Trim(GetVehicleNumberPlateText(Vehicle))),
                inventory = 'other',
                slots = 5,
                title = 'Handsfack'
            })
    
            Citizen.Wait(150)
            
            exports['eyrp_inventory']:OpenInventory()
        end
    else
        exports['eyrp_notify']:LoadNotification('Du sitter ej i ett fordon', 'error', true)
    end
end

CreateThread(function()
    Wait(100)
    while true do
        local Player, sleepThread = PlayerPedId(), 500
        local Vehicle = ESX.Game.GetClosestVehicle(GetEntityCoords(Player), false)

        local Coords = GetWorldPositionOfEntityBone(Vehicle, GetEntityBoneIndexByName(Vehicle, 'boot'))

        local Distance = #(GetEntityCoords(Player) - Coords)

        if Distance <= 1.5 and IsPedOnFoot(Player) and not IsPedDeadOrDying(Player) and not IsPedUsingScenario(Player, 'PROP_HUMAN_BUM_BIN') then
            sleepThread = 7;
            exports['eyrp_core']:DrawText3D(GetEntityCoords(Player), '[~o~E~s~] - Baklucka')

            if IsControlJustReleased(0, 38) then
                if tonumber(GetVehicleDoorLockStatus(Vehicle)) == 1 then
                    SetVehicleDoorOpen(Vehicle, 5, false, false)
    
                    Trunk.Open(Vehicle)
                else
                    exports['eyrp_notify']:LoadNotification('Fordonet är låst', 'error', true)
                end
            end
        end
        Citizen.Wait(sleepThread)
    end
end)

exports('OpenGlovebox', Glovebox.Open)