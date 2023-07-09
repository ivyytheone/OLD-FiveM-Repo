local ESX = nil

TriggerEvent("esx:getSharedObject", function(library) 
	ESX = library 
end)

RegisterServerEvent('nxrp-barbershop:pay')
AddEventHandler('nxrp-barbershop:pay', function(price)
	local player = ESX.GetPlayerFromId(source)
	player.removeMoney(price)
end)

RegisterServerEvent('nxrp-barbershop:active')
AddEventHandler('nxrp-barbershop:active', function(barber, chair, status)
	TriggerClientEvent('nxrp-barbershop:active', -1, barber, chair, status)
end)