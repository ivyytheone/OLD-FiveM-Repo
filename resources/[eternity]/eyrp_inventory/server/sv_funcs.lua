Inventory.SavePlayer = function(data)
	local Player = ESX.GetPlayerFromIdentifier(data.player);

	if Player then
		local sqlQuery = [[
			SELECT
				inventory
			FROM
				users
			WHERE
				identifier = @identifier
		]]

		MySQL.Async.fetchAll(sqlQuery, {
			['@identifier'] = Player.identifier
		}, function(response)
			local Inventory = (response and response[1] and response[1].inventory) and json.decode(response[1].inventory) or {};

			Inventory[string.find(data.Tab.name, 'pocket') and 'pocket' or 'keyring'] = data.Tab.items;

			local sqlQuery = [[
				UPDATE
					users
				SET
					inventory = @inventory
				WHERE
					identifier = @identifier
			]]

			MySQL.Sync.execute(sqlQuery, {
				['@identifier'] = Player.identifier,
				['@inventory'] = json.encode(Inventory)
			})
		end)
	end
end

Inventory.GetInventories = function()
	local sqlQuery = [[
		SELECT
			*
		FROM
			inventories
	]]

    MySQL.Async.fetchAll(sqlQuery, {}, function(inventories)
        Inventory.Public = {};

        for i = 1, #inventories do
			local data = json.decode(inventories[i].data);

			table.insert(Inventory.Public, data)
		end
	end)
end