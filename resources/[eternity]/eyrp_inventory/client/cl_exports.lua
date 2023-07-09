Inventory.HasItem = function(itemName)
    local itemFound = false;
    
    for i = 1, #Inventory.PlayerInventories do
        local Tab = Inventory.GetTab(Inventory.PlayerInventories[i]);

        for item = 1, #Tab.items do
            if (Tab.items[item].name == itemName) then
                itemFound = true;
                break
            end
        end
    end

    return itemFound
end

Inventory.HasSpecificItem = function(data)
    local itemFound = false;

    for i = 1, #Inventory.PlayerInventories do
        local Tab = Inventory.GetTab(Inventory.PlayerInventories[i]);

        for item = 1, #Tab.items do
            if itemFound then break end;

            if (Tab.items[item].name == data.item) then
                if Tab.items[item].data then
                    local foundData = 0;
                    local dataAmount = 0;
                    
                    for k,v in pairs(data.data) do
                        dataAmount = dataAmount + 1;

                        if Tab.items[item].data[k] and Tab.items[item].data[k] == v then
                            foundData = foundData + 1;
                        end
                    end

                    if foundData == dataAmount then
                        itemFound = true
                        break
                    end
                end
            end
        end
    end

    return itemFound
end

Inventory.HasSpecificItems = function(data)
    local items = {};

    for i = 1, #Inventory.PlayerInventories do
        local Tab = Inventory.GetTab(Inventory.PlayerInventories[i]);

        for item = 1, #Tab.items do
            if (Tab.items[item].name == data.item) then
                table.insert(items, Tab.items[item])
            end
        end
    end

    return items
end

Inventory.AddPlayerItem = function(data)
    if not ESX.PlayerData then return end;

    local name;

    for i = 1, #Config.Inventory['Defaults'] do
        if name then break end;

        if Config.Inventory['Defaults'][i].data['denied'] then
            for item = 1, #Config.Inventory['Defaults'][i].data['denied'] do
                if Config.Inventory['Defaults'][i].data['denied'][item] == data.item then
                    name = nil;
                    break
                else
                    name = Config.Inventory['Defaults'][i].name
                end
            end

        elseif Config.Inventory['Defaults'][i].data['allowed'] then
            for item = 1, #Config.Inventory['Defaults'][i].data['allowed'] do
                if Config.Inventory['Defaults'][i].data['allowed'][item] == data.item then
                    name = Config.Inventory['Defaults'][i].name
                    break
                end
            end

        end
    end

    if not name then return end;

    for i = 1, #Inventory.PlayerInventories do
        if string.find(Inventory.PlayerInventories[i], name) then
            name = Inventory.PlayerInventories[i]
        end
    end

    if not name then return end;

    if not data.data then data.data = {} end;
    
    if Config.Items[data.item].startData then
        for k,v in pairs(Config.Items[data.item].startData) do
            data.data[k] = v
        end
    end;

    for i = 1, data.count or 1 do
        if Inventory.GetEmptySlot({ name = name }) then
            if data.message ~= false then
                ESX.ShowNotification(('Du fick 1 ~y~%s~w~.'):format(Config.Items[data.item].label))
            end
        
            Inventory.EventHandler('AddItem', {
                item = {
                    name = data.item,
                    data = data.data or {},
                    uuid = Inventory.GenerateUUID(),
                    slot = Inventory.GetEmptySlot({
                        name = name
                    })
                },
                name = name
            })
        else
            ESX.ShowNotification('Du har inte tillräckligt med utrymme, förmålet lades på marken.');

            Inventory.EventHandler('AddGround', {
                name = data.item,
                data = data.data or {},
                uuid = Inventory.GenerateUUID()
            })
        end

        Citizen.Wait(150)
    end
end

Inventory.OpenUniqueTab = function(data)
    if Inventory.IsTabOpened(data.name) then return end;
    
    if not Inventory.DoesTabExist(data.name) then
        Inventory.CreateTab(data)
    end

    while not Inventory.DoesTabExist(data.name) do
        Citizen.Wait(250)
    end

    Inventory.AddTab(data.name, data.inventory);
end

Inventory.CloseUniqueTab = function(name)
    if not Inventory.IsTabOpened(name) then return end;

    Inventory.RemoveTab(name)
end

exports('HasItem', Inventory.HasItem)
exports('HasSpecificItem', Inventory.HasSpecificItem)
exports('HasSpecificItems', Inventory.HasSpecificItems)
exports('addInventoryItem', Inventory.AddPlayerItem)
exports('OpenUniqueTab', Inventory.OpenUniqueTab)
exports('CloseUniqueTab', Inventory.CloseUniqueTab)
exports('OpenInventory', Inventory.OpenInventory)
exports('CloseInventory', function()
    Inventory.CloseInventory()
    SendNUIMessage({
        event = 'CloseInventory'
    })
end)

exports('GetHoldingItem', function()
    return Inventory.Holding and Inventory.GetHotbarItem(Inventory.Holding - 1) or false
end)

RegisterNetEvent('eyrp_inventory:AddPlayerItem')
AddEventHandler('eyrp_inventory:AddPlayerItem', Inventory.AddPlayerItem)

RegisterNetEvent('esx:addInventoryItem')
AddEventHandler('esx:addInventoryItem', function(item, count)
    if not item or not item.name then return end;
    if not Config.Items[item.name] or Config.Items[item.name].weapon then return end;

    Inventory.AddPlayerItem({
        item = item.name,
        count = count
    })
end)

RegisterNetEvent('esx:addWeapon')
AddEventHandler('esx:addWeapon', function(name, ammo)
    if not Config.Items[string.lower(name)] or not Config.Items[string.lower(name)].weapon then return end;

    Inventory.AddPlayerItem({
        item = string.lower(name),
        data = {
            ammo = ammo
        }
    })
end)

RegisterNetEvent('esx:removeInventoryItem')
AddEventHandler('esx:removeInventoryItem', function(item, count)
    for x = 1, count or 1 do
        for i = 1, #Inventory.PlayerInventories do
            local Tab = Inventory.GetTab(Inventory.PlayerInventories[i]);
    
            for itemI = 1, #Tab.items do
                if (Tab.items[itemI].name == item.name) then
                    TriggerServerEvent('eyrp_inventory:eventHandler', 'RemoveItem', {
                        name = Tab.name,
                        item = Tab.items[itemI]
                    })
                    break
                end
            end
        end
    end
end)