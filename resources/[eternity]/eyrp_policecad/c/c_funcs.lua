Funcs = {
    PlayAnimation = function()
        local player = PlayerPedId();

        if DoesEntityExist(tablet) or IsEntityAttached(tablet) or IsEntityPlayingAnim(player, 'amb@code_human_in_bus_passenger_idles@female@tablet@idle_a', 'idle_a', 3) then 
            ClearPedTasks(player)
            DeleteEntity(tablet)
            SetModelAsNoLongerNeeded(tablet)
            return
        end

        exports['eyrp_tools']:SpawnObject({
            Model = 'prop_cs_tablet',
            Coords = GetEntityCoords(player)
        }, function(object)
            tablet = object

            exports['eyrp_tools']:PlayAnimation({
                Ped = player,
                Dict = 'amb@code_human_in_bus_passenger_idles@female@tablet@idle_a',
                Lib = 'idle_a',
                Flag = 49
            })

            AttachEntityToEntity(object, player, GetPedBoneIndex(player, 28422), 0.0, -0.03, 0.0, 20.0, -90.0, 0.0, true, true, false, true, 1, true)
        end)
    end
}

RegisterCommand('surrender', function()
    exports['eyrp_tools']:PlayAnimation({
        Ped = PlayerPedId(),
        Dict = 'random@getawaydriver',
        Lib = 'idle_2_hands_up',
        Flag = 1
    })
end)

RegisterCommand('tablet', function()
    Funcs.PlayAnimation()
end)