Inventory.CreateTab = function(data)
    if not data.title then
        for k,v in pairs(Config.Inventory['Titles']) do
            if (string.find(data.name, k)) then
                data.title = v;
            end
        end
    end

    if not data.slots then
        for k,v in pairs(Config.Inventory['Slots']) do
            if (string.find(data.name, k)) then
                data.slots = v;
            end
        end
    end

    Inventory.EventHandler('CreateTab', {
        name = data.name,
        inventory = data.inventory,
        title = data.title or data.name,
        slots = data.slots or 16,
        data = data.data or {},
        items = data.items or {}
    })
end

Inventory.AddTab = function(name, inventory)
    table.insert(Inventory.Player, name)

    local Tab =  Inventory.GetTab(name);
    
    if inventory then
        Tab.inventory = inventory
    end

    if Inventory.Opened then
        SendNUIMessage({
            event = 'CreateTab',
            data = Tab
        })
    end
end

Inventory.RemoveTab = function(name)
    for i = 1, #Inventory.Player do
        if (Inventory.Player[i] == name) then
            table.remove(Inventory.Player, i)

            if Inventory.Opened then
                SendNUIMessage({
                    event = 'RemoveTab',
                    data = {
                        name = name
                    }
                })
            end

            break
        end
    end
end

Inventory.IsTabOpened = function(name)
    local tabOpened = false;
    
    if not Inventory.Player then Inventory.Player = {} end;
    
    for i = 1, #Inventory.Player do
        if (Inventory.Player[i] == name) then
            tabOpened = true;
            break
        end
    end

    return tabOpened
end

Inventory.GetTab = function(name)    
    local tab = false;
    
    for i = 1, #Inventory.Public do
        if Inventory.Public[i] then
            if (Inventory.Public[i].name == name) then
                tab = Inventory.Public[i];
                break
            end
        end
    end

    return tab
end

Inventory.GetEmptySlot = function(data)
    local tab = Inventory.GetTab(data.name);
    local slot;

    for i = 0, tab.slots - 1 do
        local notFree = false;

        for item = 1, #tab.items do
            if tonumber(tab.items[item].slot) == i then
                notFree = true;
                break
            end
        end

        if not notFree then 
            slot = i;
            break 
        end
    end

    if #tab.items < 1 then slot = 0 end

    return slot and tostring(slot) or false
end

Inventory.DoesTabExist = function(name)
    local Exist = false;

    if not Inventory.Public then return end;

    for i = 1, #Inventory.Public do
        if Inventory.Public[i] then
            if (Inventory.Public[i].name == name) then
                Exist = true;
                break
            end
        end
    end

    return Exist
end