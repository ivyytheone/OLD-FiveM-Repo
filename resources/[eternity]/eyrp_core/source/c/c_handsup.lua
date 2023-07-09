CreateThread(function()
    Wait(100)

    while true do
        local Player, sleepThread = PlayerPedId(), 100

        if IsControlPressed(0, 323) then
            if IsEntityPlayingAnim(Player, "mp_arresting", "idle", 3) then return end
            handsup = true;
        else
            if handsup then
                handsup = false;
                SetFacialIdleAnimOverride(Player, 'pose_normal_1', 0)
                ClearPedTasks(Player)
            end
        end

        if handsup then
            RemoveAllPedWeapons(Player, false);

            if not IsEntityPlayingAnim(Player, 'random@mugging3', 'handsup_standing_base', 3) then
                SetFacialIdleAnimOverride(Player, 'mood_stressed_1', 0)

                exports['eyrp_tools']:PlayAnimation({
                    Ped = Player,
                    Dict = 'random@mugging3',
                    Lib = 'handsup_standing_base',
                    Flag = 49
                })
            end
        end

        if IsControlJustReleased(0, 323) then
            if IsEntityPlayingAnim(Player, "mp_arresting", "idle", 3) then return end
            
            SetFacialIdleAnimOverride(Player, 'pose_normal_1', 0)
            ClearPedTasks(Player)
        end

        Wait(sleepThread)
    end
end)