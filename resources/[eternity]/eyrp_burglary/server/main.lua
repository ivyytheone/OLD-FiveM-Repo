ESX = nil
stuff = {
    cachedHouses = {},
    cachedLoot = {},
    alarm = {}
}

TriggerEvent("esx:getSharedObject", function(library) 
	ESX = library 
end)

RegisterServerEvent("eyrp_burglary:handleAction")
AddEventHandler("eyrp_burglary:handleAction", function(action, data)
    TriggerClientEvent("eyrp_burglary:handleAction", -1, action, data)
    if action == "lock" then
        if not stuff.cachedHouses[data.houseId] then 
            stuff.cachedHouses[data.houseId] = {
                locked = true
            }
        end

        if data.lock then
            stuff.alarm[data.houseId] = false
        end
        
        stuff.cachedHouses[data.houseId].locked = data.lock
        if not data.lock then
            local player = ESX.GetPlayerFromId(source)
            if Config.LoseLockpick then
                if not data.lock then
                    player.removeInventoryItem(Config.Lockpick, 1)
                end
            end
        end
    elseif action == "loot" then
        if not stuff.cachedLoot[tostring(data.houseId)] then
            stuff.cachedLoot[tostring(data.houseId)] = {}
        end
        stuff.cachedLoot[tostring(data.houseId)][data.id] = true
    elseif action == "registerHouse" then
        if stuff.cachedHouses[data.houseId] then return end
        stuff.cachedHouses[data.houseId] = {
            locked = true
        }
    elseif action == "enter" then
        if stuff.cachedLoot[tostring(data.houseId)] then return end
        stuff.cachedLoot[tostring(data.houseId)] = {}
    elseif action == "alarm" then
        stuff.alarm[data.houseId] = true
    elseif action == "giveitem" then
        local player, rewards = ESX.GetPlayerFromId(source), Config.HouseTypes[data.type].rewards
        if math.random(1, 100) <= Config.NothingChance then
            TriggerClientEvent("esx:showNotification", source, Config.Strings["foundnothing"])
        else
            if math.random(1, 100) <= Config.WeaponChance then
                local randomWep = rewards.weapons[math.random(1, #rewards.weapons)]
                if ESX.GetWeaponLabel(randomWep.weapon) ~= nil then
                    if randomWep.type == "melee" then
                        player.addInventoryItem({
                            item = randomWep.weapon, 
                            count = 1
                        })
                        Notification(Config.Strings["found_meeleweapon"]:format(ESX.GetWeaponLabel(randomWep.weapon)))
                    else
                        player.addWeapon(randomWep.weapon, randomWep.bullets)
                        Notification(Config.Strings["found_weapon"]:format(ESX.GetWeaponLabel(randomWep.weapon), randomWep.bullets))
                    end
                else
                    print("^1EYRP_BURGLARY: THE WEAPON '" .. randomWep.weapon .. "' CAN'T BE FOUND. CHECK THE CONFIG.")
                end
            else
                local randomItem = rewards.items[math.random(1, #rewards.items)]

                player.addInventoryItem({
                    item = randomItem.item, 
                    count = randomItem.amount
                })
                
                Notification(Config.Strings["found_item"]:format(randomItem.amount, ESX.GetItemLabel(randomItem.item)))
            end
        end
    elseif action == "lockpick" then
        local police, players, player = 0, ESX.GetPlayers(), ESX.GetPlayerFromId(source)
        for i = 1, #players do 
            local player = ESX.GetPlayerFromId(players[i])
            if player["job"].name == 'police' then
                police = police + 1
            end
        end

        if police >= Config.RequiredPolices then
            TriggerClientEvent("eyrp_burglary:lockpick", source, data.houseId)
        else
            Notification(Config.Strings["not_enough_polices"])
        end
    end
end) 


Notification = function(msg)
    if Config.pNotify then
        TriggerClientEvent("pNotify:SendNotification", source, {
            text = msg, 
            type = "info", 
            timeout = 2500, 
            layout = "bottomCenter", 
            queue = "eyrp"
        })
    else
        TriggerClientEvent("esx:showNotification", source, msg)
    end
end

AddEventHandler('es:playerLoaded', function(source, _player)
    TriggerClientEvent("eyrp_burglary:handleAction", -1, "playerconnected", stuff)
end)