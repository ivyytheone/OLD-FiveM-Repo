RegisterServerEvent('eyrp_tobak:SyncCigar')
AddEventHandler('eyrp_tobak:SyncCigar', function(Prop)
    TriggerClientEvent('eyrp_tobak:SyncCigar', -1, Prop)
end)

RegisterServerEvent('eyrp:syncCamera')
AddEventHandler('eyrp:syncCamera', function(NetId)
    TriggerClientEvent('eyrp:cameraFlash', -1, NetId)
end)

RegisterServerEvent('eyrp_core:SyncChampange')
AddEventHandler('eyrp_core:SyncChampange', function(Prop)
    TriggerClientEvent('eyrp_core:SyncChampange', -1, Prop)
end)

RegisterServerEvent('eyrp_core:SyncCoffe')
AddEventHandler('eyrp_core:SyncCoffe', function(Prop)
    TriggerClientEvent('eyrp_core:SyncCoffe', -1, Prop)
end)