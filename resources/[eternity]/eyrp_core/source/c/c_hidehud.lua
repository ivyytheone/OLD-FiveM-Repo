local components =  {
    HUD_AREA_NAME = { id = 7, hidden = true },
    HUD_WEAPON_WHEEL = { id = 19, hidden = true },
    HUD_WEAPON_WHEEL_STATS = { id = 20, hidden = true },
    HUD_STREET_NAME = { id = 9, hidden = true },
    HUD_WANTED_STARS = { id = 1, hidden = true },
    HUD_VEHICLE_NAME = { id = 6, hidden = true },
    HUD_WEAPON_ICON = { id = 2, hidden = true },
}

CreateThread(function()
    Wait(100)
    while true do

        for idx, val in pairs(components) do
            if val.hidden then
                HideHudComponentThisFrame(val.id)
            else
                ShowHudComponentThisFrame(val.id)
            end
        end

        local playerCoords = GetEntityCoords(PlayerPedId())                                                     
        ClearAreaOfCops(playerCoords.x, playerCoords.y, playerCoords.z, 400.0)

        Wait(7)
    end
end)