ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterNetEvent('eyrp_carkeys:giveKey')
AddEventHandler('eyrp_carkeys:giveKey', function(data)
    local player = ESX.GetPlayerFromId(source)
    player.addInventoryItem({
        item = 'carkey',
        data = {
            plate = data.plate,
            model = data.model
        }
    })
end)