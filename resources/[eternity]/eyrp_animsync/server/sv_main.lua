ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('eyrp:slapSync')
AddEventHandler('eyrp:slapSync', function(target)
    TriggerClientEvent('eyrp:getSlapped', -1, target)
    Wait(600)
    TriggerClientEvent('eyrp:shakeCam', target, 0.16)
    Wait(3000)
    TriggerClientEvent('esx:showNotification', target, 'Du känner dig yr av smällen')
end)

RegisterServerEvent('eyrp:headSync')
AddEventHandler('eyrp:headSync', function(target)
    TriggerClientEvent('eyrp:getHead', -1, target)
    Wait(600)
    TriggerClientEvent('eyrp:shakeCam', target, 0.86)
    Wait(3000)
    TriggerClientEvent('esx:showNotification', target, 'Du känner dig jävligt yr av smällen')
end)

RegisterServerEvent('eyrp:krokSync')
AddEventHandler('eyrp:krokSync', function(target)
    TriggerClientEvent('eyrp:getKrok', -1, target)
    Wait(600)
    TriggerClientEvent('eyrp:shakeCam', target, 0.86)
    Wait(3000)
    TriggerClientEvent('esx:showNotification', target, 'Du känner dig jävligt yr av smällen')
end)

RegisterServerEvent('eyrp:SyncPee')
AddEventHandler('eyrp:SyncPee', function(target)
    TriggerClientEvent('eyrp:SyncPee', -1, target)
end)

RegisterServerEvent('eyrp:SyncFartParticles', function(target)
    TriggerClientEvent('eyrp:SyncFartParticles', -1, target)
end)

RegisterServerEvent('eyrp:SyncBurp')
AddEventHandler('eyrp:SyncBurp', function(target)
    TriggerClientEvent('eyrp:startBurp', -1, target)
end)
