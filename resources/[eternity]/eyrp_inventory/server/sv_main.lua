Inventory = {}

ESX = {}

TriggerEvent('esx:getSharedObject', function(library) 
	ESX = library 
end)

RegisterServerEvent('eyrp_inventory:eventHandler')
AddEventHandler('eyrp_inventory:eventHandler', function(event, data)
	TriggerClientEvent('eyrp_inventory:eventHandler', -1, event, data);
	
	if event == 'AddPlayerInventory' then
		if not Inventory.PlayerInventories then
			Inventory.PlayerInventories = {}
		end;

		local Player = ESX.GetPlayerFromId(source);
		
		Inventory.PlayerInventories[data] = Player.identifier
	elseif event == 'CreateTab' then
		Inventory.CreateTab(data);

	elseif event == 'RemoveTab' then

	elseif event == 'AddItem' then
		local Tab = Inventory.GetTab(data.name);

		if not Tab.items then Tab.items = {} end;

		table.insert(Tab.items, data.item)

		if Inventory.PlayerInventories[Tab.name] then
			Inventory.SavePlayer({
				player = Inventory.PlayerInventories[Tab.name],
				Tab = Tab
			})
		else
			Inventory.SaveTab(Tab)
		end
	elseif event == 'RemoveItem' then
		local Tab = Inventory.GetTab(data.name or Inventory.GetTabFromUUID(data.item.uuid));

		if not Tab.items then Tab.items = {} end;

		for i = 1, #Tab.items do
			if Tab.items[i].uuid == data.item.uuid then
				table.remove(Tab.items, i)
				break
			end
		end

		if Inventory.PlayerInventories[Tab.name] then
			Inventory.SavePlayer({
				player = Inventory.PlayerInventories[Tab.name],
				Tab = Tab
			})
		else
			Inventory.SaveTab(Tab)
		end
	elseif event == 'UpdateItem' then
		local Tab = Inventory.GetTab(data.name or Inventory.GetTabFromUUID(data.item.uuid));

		if not Tab.items then Tab.items = {} end;

		for i = 1, #Tab.items do
			if Tab.items[i].uuid == data.item.uuid then
				Tab.items[i].data = data.item.data
				break
			end
		end

		if Inventory.PlayerInventories[Tab.name] then
			Inventory.SavePlayer({
				player = Inventory.PlayerInventories[Tab.name],
				Tab = Tab
			})
		else
			Inventory.SaveTab(Tab)
		end
	elseif event == 'AddGround' then
		if not Inventory.GroundItems then Inventory.GroundItems = {} end;

		table.insert(Inventory.GroundItems, data)
	elseif event == 'RemoveGround' then
		if not Inventory.GroundItems then Inventory.GroundItems = {} end;

		for i = 1, #Inventory.GroundItems do
			if (Inventory.GroundItems[i].item['uuid'] == data.uuid) then
				table.remove(Inventory.GroundItems, i)
				break
			end
		end
	elseif event == 'ButtonClicked' then
		if data.button == 'use' then
			if ESX.UsableItemsCallbacks[data.item.name] then
				ESX.UsableItemsCallbacks[data.item.name](source, {
					Item = data.item,
					Tab = Inventory.GetTabFromUUID(data.item.uuid),
					Source = source,
					Remove = function()
						TriggerEvent('eyrp_inventory:eventHandler', 'RemoveItem', {
							name = Inventory.GetTabFromUUID(data.item.uuid),
							item = data.item
						})
					end,
					Update = function(newData)
						TriggerEvent('eyrp_inventory:eventHandler', 'UpdateItem', {
							name = Inventory.GetTabFromUUID(data.item.uuid),
							item = {
								uuid = data.item.uuid,
								data =  newData
							}
						})
					end
				})
			end
		else
			if Config.Items[data.item.name].buttons and Config.Items[data.item.name].buttons[tonumber(data.button)] then
				Config.Items[data.item.name].buttons[tonumber(data.button)].func(source, {
					Item = data.item,
					Tab = Inventory.GetTabFromUUID(data.item.uuid),
					Source = source,
					Remove = function()
						TriggerEvent('eyrp_inventory:eventHandler', 'RemoveItem', {
							name = Inventory.GetTabFromUUID(data.item.uuid),
							item = data.item
						})
					end,
					Update = function(newData)
						TriggerEvent('eyrp_inventory:eventHandler', 'UpdateItem', {
							name = Inventory.GetTabFromUUID(data.item.uuid),
							item = {
								uuid = data.item.uuid,
								data = newData
							}
						})
					end
				})
			end
		end
	end
end)

ESX.RegisterServerCallback('eyrp_inventory:GetPublicData', function(source, cb)
	if not Inventory.GroundItems then Inventory.GroundItems = {} end;

	if not Inventory.Public then 
		Inventory.GetInventories();

		while not Inventory.Public do
			Citizen.Wait(0)
		end
	end;

	local player = ESX.GetPlayerFromId(source);

	local sqlQuery = [[
		SELECT
			inventory
		FROM
			users
		WHERE
			identifier = @identifier
	]]

	MySQL.Async.fetchAll(sqlQuery, {
		['@identifier'] = player.identifier
	}, function(response)
		cb({
			Public = Inventory.Public,
			GroundItems = Inventory.GroundItems,
			Items = Config.Items,
			PlayerInventories = (response and response[1] and response[1].inventory) and json.decode(response[1].inventory) or {}
		})
	end)
end)

ESX.RegisterServerCallback('GetJobAndCash', function(source, cb)
	local player = ESX.GetPlayerFromId(source);

	cb({
		Cash = player.getMoney(),
		Job = ('%s - %s'):format(player.job.label, player.job.grade_label)
	})
end)

RegisterServerEvent('eyrp_inventory:GetPlayerInventories')
AddEventHandler('eyrp_inventory:GetPlayerInventories', function(source, cb)
    local player = ESX.GetPlayerFromId(source);

    if not player then cb({}) return end;

    local inventories = {};

    for name, identifier in pairs(Inventory.PlayerInventories) do
        if identifier == player.identifier then
            table.insert(inventories, name)
        end
    end

    cb(inventories)
end)

TriggerEvent('es:addGroupCommand', 'giveitem', 'admin', function(source, args, user)
    local player = ESX.GetPlayerFromId(args[1])

    if args[1] == 'me' then player = ESX.GetPlayerFromId(source) end

    if player then
        if not args[2] then TriggerClientEvent('chat:addMessage', source, { 
            args = { '^5Eternity ', 'Skriv in ett föremål.' } 
        }) return end

        if not args[3] then TriggerClientEvent('chat:addMessage', source, { 
            args = { '^5Eternity ', 'Skriv in ett antal.' } 
        }) return end

        if not type(args[3]) == 'number' then TriggerClientEvent('chat:addMessage', source, { 
            args = { '^5Eternity ', 'Antalet måste vara ett nummer.' } 
        }) return end

        if not Config.Items[args[2]] then TriggerClientEvent('chat:addMessage', source, { 
            args = { '^5Eternity ', 'Detta föremål existerar inte.' } 
        }) return end

        player.addInventoryItem({
            item = args[2],
            count = args[3]
        })

		else
			TriggerClientEvent('chat:addMessage', source, { args = { '^5Eternity ', 'Spelaren hittades inte.' } })
        end
    end, function(source, args, user)
end)