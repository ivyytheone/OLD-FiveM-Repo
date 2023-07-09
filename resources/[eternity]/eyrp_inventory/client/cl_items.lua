Inventory.GetHotbarItem = function(slot)
    local ItemData;

    for i = 1, #Inventory.PlayerInventories do
        if (string.find(Inventory.PlayerInventories[i], 'pocket')) then
            local Tab = Inventory.GetTab(Inventory.PlayerInventories[i]);

            for item = 1, #Tab.items do
                if (Tab.items[item].slot == tostring(slot)) then
                    ItemData = Tab.items[item]
                    break
                end
            end
        end
    end

    return ItemData or false
end