ESX               = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

----
--ESX.RegisterUsableItem('handcuffs', function(source)
	--TriggerClientEvent('esx_handcuffs:cuffcheck', source, source)
--end)

RegisterServerEvent('esx_handcuffs:cuffing')
AddEventHandler('esx_handcuffs:cuffing', function(source, originalsource)
  TriggerClientEvent('esx_handcuffs:cuff', source, originalsource)
end)

----
--ESX.RegisterUsableItem('key', function(source)
	--TriggerClientEvent('esx_handcuffs:unlockingcuffs', source, source, 'key')
--end)

--ESX.RegisterUsableItem('dyrk', function(source)
	--TriggerClientEvent('esx_handcuffs:unlockingcuffs', source, source, 'dyrk')
--end)

RegisterServerEvent('esx_handcuffs:unlocking')
AddEventHandler('esx_handcuffs:unlocking', function(source)
  TriggerClientEvent('esx_handcuffs:unlockingcuffs', source)
end)
--- 

RegisterNetEvent('esx_handcuffs:unhandcuff') 
AddEventHandler('esx_handcuffs:unhandcuff', function(source) 
	TriggerClientEvent('esx_handcuffs:uncuff', source)
end)

RegisterServerEvent('esx_handcuffs:removeItem')
AddEventHandler('esx_handcuffs:removeItem', function(player, item)
	local xPlayer = ESX.GetPlayerFromId(player)
	
	if item == 'handcuffs' then
		xPlayer.removeInventoryItem('sidavbitare', 1)
	elseif item == 'key' then
		xPlayer.addInventoryItem('sidavbitare', 1)
	elseif item == 'dyrk' then
		xPlayer.removeInventoryItem('handcuffs', 1)
	end
end)
