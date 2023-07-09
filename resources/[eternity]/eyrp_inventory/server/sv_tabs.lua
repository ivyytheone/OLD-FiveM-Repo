Inventory.CreateTab = function(data)
    if not Inventory.Public then Inventory.Public = {} end;

    if Inventory.DoesTabExist(data.name) then return end;

    table.insert(Inventory.Public, data);

    local PlayerInventory = false;

    for i = 1, #Config.Inventory['Defaults'] do
        if string.find(data.name, Config.Inventory['Defaults'][i].name) then 
            PlayerInventory = true;
            break
        end
    end

    if PlayerInventory then return end;

    local sqlQuery = [[
        INSERT
            INTO
        inventories
            (name, data)
        VALUES
            (@name, @data)
    ]]

    MySQL.Sync.execute(sqlQuery, {
        ['@name'] = data.name,
        ['@data'] = json.encode(data)
    })
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

Inventory.DoesTabExist = function(name)
    local Exist = false;

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

Inventory.SaveTab = function(data)
    local sqlQuery = [[
		UPDATE
            inventories
        SET
            data = @data
        WHERE
            name = @name
    ]]
    
    MySQL.Sync.execute(sqlQuery, {
        ['@name'] = data.name,
        ['@data'] = json.encode(data)
    })
end

Inventory.GetTabFromUUID = function(uuid)
    local Tab;

    for i = 1, #Inventory.Public do
        for item = 1, #Inventory.Public[i].items do
            if Inventory.Public[i].items[item].uuid == uuid then
                Tab = Inventory.Public[i].name;
                break
            end
        end
    end

    return Tab or false
end