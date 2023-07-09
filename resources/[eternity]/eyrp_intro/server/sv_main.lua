ESX = nil 

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj  
end)  

RegisterServerEvent('eyrp_intro:AddStartingLoadout')
AddEventHandler('eyrp_intro:AddStartingLoadout', function()
    local Player = ESX.GetPlayerFromId(source)

    if Player then
        if Player.getMoney() >= 0 then
            Player.removeMoney(Player.getMoney())
            Player.addMoney(1000)
        end

        Player.addInventoryItem({
            item = 'phone',
        })
    end
end)
