ESX = nil 

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj  
end)  

RegisterNetEvent('eyrp_clotingstore:payOutfit') 
AddEventHandler('eyrp_clotingstore:payOutfit', function() 
    local xPlayer = ESX.GetPlayerFromId(source); 

	xPlayer.removeMoney(Config.Price)

	TriggerClientEvent('esx:showNotification', source, 'Du betalade <span style="color:green">' .. Config.Price .. ' SEK</span>')
end)

RegisterServerEvent('eyrp_clotingstore:saveOutfit')
AddEventHandler('eyrp_clotingstore:saveOutfit', function(label, skin)
	local xPlayer = ESX.GetPlayerFromId(source)

	TriggerEvent('esx_datastore:getDataStore', 'property', xPlayer.identifier, function(store)
		local dressing = store.get('dressing')

		if dressing == nil then
			dressing = {}
		end

		table.insert(dressing, {
			label = label,
			skin  = skin
		})

		store.set('dressing', dressing)
	end)
end) 

ESX.RegisterServerCallback('eyrp_clotingstore:getPlayerDressing', function(source, cb)
	local xPlayer  = ESX.GetPlayerFromId(source)
  
	TriggerEvent('esx_datastore:getDataStore', 'property', xPlayer.identifier, function(store)
  
	  local count    = store.count('dressing')
	  local labels   = {}
  
	  for i=1, count, 1 do
		local entry = store.get('dressing', i)
		table.insert(labels, entry.label)
	  end
  
	  cb(labels)
	end)
end) 

ESX.RegisterServerCallback('eyrp_clotingstore:getPlayerOutfit', function(source, cb, num)
	local xPlayer  = ESX.GetPlayerFromId(source)
  
	TriggerEvent('esx_datastore:getDataStore', 'property', xPlayer.identifier, function(store)
	  local outfit = store.get('dressing', num)
	  cb(outfit.skin)
	end)
end)
  