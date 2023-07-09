ESX = nil 

TriggerEvent('esx:getSharedObject', function(obj) 
    ESX = obj  
end)  

RegisterNetEvent('eyrp_banks:withdrawMoney') 
AddEventHandler('eyrp_banks:withdrawMoney', function(amount)  
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local base = 0 

	amount = tonumber(amount)
	base = xPlayer.getAccount('bank').money

	if amount == nil or amount > base then
		TriggerClientEvent('esx:showNotification', _source, 'Ogiltig summa...')
	else
		xPlayer.removeAccountMoney('bank', amount)
		xPlayer.addMoney(amount)
		TriggerClientEvent('esx:showNotification', _source, 'Du tog ut <span style="color:green">' .. amount .. ' SEK</span> från din bank.') 
	end
end)   


RegisterServerEvent('eyrp_banks:SubmitMoney')
AddEventHandler('eyrp_banks:SubmitMoney', function(amount)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
    amount = tonumber(amount)

	if amount == nil or amount > xPlayer.getMoney() then
		TriggerClientEvent('esx:showNotification', _source, 'Ogiltig summa...')
	else
		xPlayer.removeMoney(amount)
		xPlayer.addAccountMoney('bank', tonumber(amount))
		TriggerClientEvent('esx:showNotification', _source, 'Du satte in <span style="color:green">' .. amount .. ' SEK</span> i din bank.') 
	end
end) 

