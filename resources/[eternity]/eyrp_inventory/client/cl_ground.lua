Citizen.CreateThread(function()
    while true do
        while not Inventory.GroundItems do
            Citizen.Wait(750)
        end

        local sleepThread, Player = 500, PlayerPedId();

        for i = 1, #Inventory.GroundItems do
            local Data = Inventory.GroundItems[i];
            local Dst = #(GetEntityCoords(Player) - vector3(Data.coords[1], Data.coords[2], Data.coords[3]));

            if Dst < 2.0 then
                sleepThread = 5;

                Funcs.DrawText3D(Data.coords[1], Data.coords[2], Data.coords[3] - 1, Config.Items[Data.item.name].label)
            end

            if Dst < 1.0 then
                local NearItem = false;
                for item = 1, #Inventory.NearItems do
                    if (Inventory.NearItems[item].uuid == Data.item['uuid']) then
                        NearItem = true;
                        break
                    end
                end

                if not NearItem then
                    table.insert(Inventory.NearItems, Data.item)

                    if Inventory.Opened then
                        SendNUIMessage({
                            event = 'AddGround',
                            data = Data
                        })
                    end
                end
            else
                for item = 1, #Inventory.NearItems do
                    if (Inventory.NearItems[item].uuid == Data.item['uuid']) then
                        if Inventory.Opened then
                            SendNUIMessage({
                                event = 'RemoveGround',
                                data = Inventory.NearItems[item]
                            })
                        end

                        table.remove(Inventory.NearItems, item)
                        break
                    end
                end
            end
        end

        Citizen.Wait(sleepThread)
    end
end)