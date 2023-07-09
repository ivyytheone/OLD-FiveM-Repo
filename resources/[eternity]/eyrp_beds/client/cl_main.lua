CreateThread(function()
    Wait(100)

    while true do
        local Player, sleepThread = PlayerPedId(), 500;
        
        for index, value in pairs(Config.Beds) do
            local Object = GetClosestObjectOfType(GetEntityCoords(Player), 2.0, value)

            if DoesEntityExist(Object) then
                local Distance = #(GetEntityCoords(Player) - GetEntityCoords(Object))

                if Distance <= 2.0 and IsPedOnFoot(Player) and Utils.CheckState() and not BedActive[Object] then
                    sleepThread = 7;
                    Funcs.DrawText3D(GetEntityCoords(Object), '[~g~E~s~] - Lägg dig på sängen')

                    if IsControlJustReleased(0, 38) then
                        Utils.HandleBed(Object)
                    end
                end
            end
        end
        Wait(sleepThread)
    end
end)