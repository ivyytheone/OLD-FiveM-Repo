HasLoaded = false
AddEventHandler("playerSpawned", function()
    if not HasLoaded then
        ShutdownLoadingScreenNui()
        HasLoaded = true
    end
end)