CreateThread(function()
    Wait(100)

    while true do
        local Player, sleepThread = PlayerPedId(), 250;

        for index, value in pairs(Config.Models) do

            local Vehicle = GetVehiclePedIsIn(Player, true)

            if IsPedInAnyVehicle(Player, false) and GetEntityModel(Vehicle) == GetHashKey(value) then
                DeleteVehicle(Vehicle)

                TriggerServerEvent('eyrp_blacklist:SendToDiscord', source, { Coords = GetEntityCoords(Player), Model = value, Text = 'har använt ett blacklistat fordon' })
            end
        end
        
        Wait(sleepThread)
    end
end)