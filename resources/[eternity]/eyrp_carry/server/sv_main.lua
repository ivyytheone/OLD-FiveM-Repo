RegisterServerEvent('eyrp_carry:SyncShoulder')
AddEventHandler('eyrp_carry:SyncShoulder', function(Target, Player)
    TriggerClientEvent('eyrp_carry:SyncShoulder', Target, Player)
end)