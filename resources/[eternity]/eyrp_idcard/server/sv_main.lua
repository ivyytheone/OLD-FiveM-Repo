ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) 
	ESX = obj 
end)

ESX.RegisterServerCallback('eyrp_idcard:addInventoryItem', function(source, callback)
	local player = ESX.GetPlayerFromId(source); 

	if player then 
		MySQL.Async.fetchAll([[
			SELECT * FROM users WHERE identifier = @identifier
		]], {
			['@identifier'] = GetPlayerIdentifiers(source)[1], 
		}, function(data)
			if data[1] then 
				player.addInventoryItem({
					item = 'idcard', 
					data = {
						firstname = data[1].firstname, 
						lastname = data[1].lastname, 
						dob = data[1].dateofbirth, 
						sex = data[1].sex, 
						height = data[1].height, 
						date = os.date('%x')
					}
				})
			end
		end)
	end
end)