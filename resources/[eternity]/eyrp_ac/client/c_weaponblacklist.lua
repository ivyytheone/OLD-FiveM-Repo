CreateThread(function()
    Wait(100)

    while true do
        local player, sleepThread = PlayerPedId(), 250;

        for index, value in pairs(Config.Weapons) do
            if GetSelectedPedWeapon(player) == GetHashKey(value) then
                RemoveAllPedWeapons(player, true)
                exports['eyrp_notify']:LoadNotification('Vafan leker du?')
                TriggerServerEvent('eyrp_blacklist:SendToDiscord', source, { Coords = GetEntityCoords(player), Model = value, Text = 'har använt ett blacklistat vapen' })
            end
        end
        Wait(sleepThread)
    end
end)