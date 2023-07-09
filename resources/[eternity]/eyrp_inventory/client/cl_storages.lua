Storages = {
    -- ['mechanic-storage1'] = {
    --     Title = 'Skåp',
    --     Coords = vector3(-344.8109436035156, -127.97262573242188, 39.0096435546875),
    --     Slots = 240,
    --     Colour = '~b~'
    -- },
};

RegisterNetEvent('CloseInventory')
AddEventHandler('CloseInventory', function()
    if CurrentStorage then
        Inventory.CloseUniqueTab(CurrentStorage);

        CurrentStorage = nil
    end
end)

Citizen.CreateThread(function()
    while true do
        local sleepThread, Player = 1000, PlayerPedId();

        if not IsEntityDead(Player) and not CurrentStorage then
            for Name, Data in pairs(Storages) do
                local Dst = #(GetEntityCoords(Player) - Data.Coords);

                if Dst < 1.5 and (not Data.Job or (ESX.PlayerData['job'].name == Data.Job)) then
                    sleepThread = 5;
                    
                    ESX.ShowHelpNotification(('Tryck ~INPUT_CONTEXT~ för att öppna %s%s~w~.'):format((Data.Colour and Data.Colour or ''), string.lower(Data.Title)));

                    if Dst < 1.0 then
                        if IsControlJustReleased(0, 38) then
                            CurrentStorage = ('Storage-%s'):format(Name);

                            Inventory.OpenUniqueTab({
                                name = ('Storage-%s'):format(Name),
                                inventory = 'other',
                                slots = Data.Slots,
                                title = Data.Title
                            })
                
                            Citizen.Wait(150);
                
                            Inventory.OpenInventory()
                        end
                    end
                end
            end
        end

        Citizen.Wait(sleepThread)
    end
end)

