RegisterServerEvent('eyrp_quests:Labs:LockDoors')
AddEventHandler('eyrp_quests:Labs:LockDoors', function(State)
    TriggerClientEvent('eyrp_quests:Labs:LockDoors', -1, State)
end)