RegisterNetEvent('eyrp_carry:SyncShoulder')
AddEventHandler('eyrp_carry:SyncShoulder', function(TargetPlayer, SourcePlayer)

    local Player, Target = GetPlayerPed(GetPlayerFromServerId(SourcePlayer)), GetPlayerPed(GetPlayerFromServerId(TargetPlayer))

    if IsEntityAttached(Target) then
        DetachEntity(Target)
        ClearPedTasks(Target)
        return
    end

    exports['eyrp_core']:LoadAnimDict('nm')
    TaskPlayAnim(Target, 'nm', 'firemans_carry', 2.0, -1.0, -1, 33, 0, false, false, false)

    AttachEntityToEntity(Target, Player, 0, 0.27, 0.15, 0.63, 0.5, 0.5, 180, false, false, false, false, 2, false)
end)