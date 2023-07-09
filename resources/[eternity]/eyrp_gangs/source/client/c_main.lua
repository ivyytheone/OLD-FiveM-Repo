self = {}; 

Citizen.CreateThread(function()
    while ESX == nil do
        Citizen.Wait(1);

        ESX = exports["es_extended"]:getSharedObject()  
    end 

    if ESX.IsPlayerLoaded() then
        ESX.PlayerData = ESX.GetPlayerData()
    end

    while true do 
        local Player, sleepThread = PlayerPedId(), 850; 

        for gangIndex, gangValue in pairs(Config.Gangs) do 
            local Dst = #(GetEntityCoords(Player) - gangValue["Stash"])
            local Dst2 = #(GetEntityCoords(Player) - gangValue["Dressing"])

            local Dst3 = #(GetEntityCoords(Player) - gangValue["Computer"])

            if Dst <= 2.0 then  
                sleepThread = 5; 

                ESX.Game.Utils.DrawText3D(gangValue["Stash"], "[~g~E~s~] - Öppna stash"); 

                if Dst <= 1.5 then  
                    if IsControlJustReleased(0, 38) or IsDisabledControlJustPressed(0, 38) then 
                        if not IsEntityDead(Player) then 
                            if exports.eyrp_inventory:HasSpecificItem({
                                item = gangValue['Item'], 
                                data = {
                                    keydata = gangValue['KeyData']
                                }
                            }) then  
                                CurrentStorage = ('Storage-%s'):format(gangName);
    
                                exports["eyrp_inventory"]:OpenUniqueTab({
                                    name = ('Storage-%s'):format(gangName),
                                    inventory = 'other',
                                    slots = 50,
                                    title = 'Förråd'
                                })
                    
                                Citizen.Wait(150);
                    
                                exports["eyrp_inventory"]:OpenInventory() 
                            else
                                ESX.ShowNotification("Du har inte nyckeln till detta stash", "error")
                            end
                        else
                            ESX.ShowNotification("Du kan inte göra detta när du är medvetslös.", "error")
                        end
                    end
                end
            end

            if Dst2 <= 5.0 then  
                sleepThread = 5; 

                ESX.Game.Utils.DrawText3D(gangValue["Dressing"], "[~g~E~s~] - Öppna garderob"); 

                if Dst2 <= 1.5 then 
                    if IsControlJustReleased(0, 38) or IsDisabledControlJustPressed(0, 38) then 
                        if not IsEntityDead(Player) then
                            if exports.eyrp_inventory:HasSpecificItem({
                                item = "key", 
                                data = {
                                    keydata = gangValue['KeyData']
                                }
                            }) then  
                                ESX.TriggerServerCallback("eyrp_clotingstore:getPlayerDressing", function(dressings)
                                    local menuElements = {}
                            
                                    for dressingIndex, dressingLabel in ipairs(dressings) do
                                        table.insert(menuElements, {
                                            ["label"] = dressingLabel, 
                                            ["outfit"] = dressingIndex
                                        })
                                    end
                            
                                    ESX.UI.Menu.Open("default", GetCurrentResourceName(), "motel_main_dressing_menu", {
                                        ["title"] = "Garderob",
                                        ["align"] = "right",
                                        ["elements"] = menuElements
                                    }, function(menuData, menuHandle)
                                        local currentOutfit = menuData["current"]["outfit"]
                            
                                        TriggerEvent("skinchanger:getSkin", function(skin)
                                            ESX.TriggerServerCallback("eyrp_clotingstore:getPlayerOutfit", function(clothes)
                                                TriggerEvent("skinchanger:loadClothes", skin, clothes)
                                                TriggerEvent("esx_skin:setLastSkin", skin)
                            
                                                TriggerEvent("skinchanger:getSkin", function(skin)
                                                    TriggerServerEvent("esx_skin:save", skin)
                                                end)
                                            end, currentOutfit)
                                        end)
                                    end, function(menuData, menuHandle)
                                        menuHandle.close()
                                    end)
                                end)
                            else
                                ESX.ShowNotification("Du har inte nyckeln till denna garderob", "error")
                            end
                        else
                            ESX.ShowNotification("Du kan inte göra detta när du är medvetslös.", "error")
                        end
                    end
                end
            end

            if Dst3 <= 5.0 then 
                sleepThread = 5; 

                ESX.Game.Utils.DrawText3D(gangValue["Computer"], "[~g~E~s~] - Öppna datorn"); 

                if Dst3 <= 1.5 then 
                    if IsControlJustReleased(0, 38) or IsDisabledControlJustPressed(0, 38) then 
                        if not IsEntityDead(Player) then 
                            if exports.eyrp_inventory:HasSpecificItem({
                                item = "key", 
                                data = {
                                    keydata = gangValue['KeyData']
                                }
                            }) then 
                                local Target, Distance = ESX.Game.GetClosestPlayer(); 

                                if Distance ~= -1 and Distance <= 2.0 then
                                    self.target = Target
                                    self.closestPlayer = GetPlayerPed(self.target)

                                    ESX.UI.Menu.Open("default", GetCurrentResourceName(), "Computer", 
                                    {
                                        title = "Välj alternativ", 
                                        align = "right", 
                                        elements = {
                                            { label = "Bjud in person (Närmaste)", event = "invite_player" }, 
                                            { label = "Ta bort person", event = "remove_player" }
                                        }
                                    }, function(Data, Menu)
                                        local Value = Data.current.event

                                        if Value == "invite_player" then 
                                            ESX.TriggerServerCallback("eyrp_gangs:setGang", function(Response)
                                                if Response then  
                                                    ESX.ShowNotification("Du bjöd in närmaste person till " .. gangValue["GangLabel"])
                                                else
                                                    print("Something went wrong")
                                                end
                                            end, gangValue["GangLabel"], GetPlayerServerId(self.target))
                                        end

                                        if Value == "remove_player" then 
                                            ESX.TriggerServerCallback("eyrp_gangs:removePlayerGang", function(Response)  
                                                if Response then 
                                                end
                                            end, GetPlayerServerId(self.target), gangValue["GangLabel"])
                                        end
                                    end, function(Data, Menu)
                                        Menu.close()
                                    end)
                                else
                                    ESX.ShowNotification("Det är ingen i närheten.", "error") 
                                end
                            else 
                                ESX.ShowNotification("Du kan inte lösernordet till denna datorn.", "error")
                            end
                        else
                            ESX.ShowNotification("Du kan inte göra detta när du är medvetslös.", "error")
                        end
                    end
                end
            end

            if self.inAciton then  
                local MaxDst = #(GetEntityCoords(Player) - gangValue) 

                if MaxDst <= 10.0 then  
                    ESX.ShowNotification("Du måste vara i zonen för att förhandla, gå tillbaka innan detta avslutas.")
                end
            end
        end

        Citizen.Wait(sleepThread);
    end
end)

RegisterNetEvent('CloseInventory')
AddEventHandler('CloseInventory', function()
    if CurrentStorage then
        exports['eyrp_inventory']:CloseUniqueTab(CurrentStorage)

        CurrentStorage = nil
    end
end)


RegisterCommand('addKey', function(source, args)
    local plyCoords = GetEntityCoords(PlayerPedId())
    local streetHash = GetStreetNameAtCoord(plyCoords.x, plyCoords.y, plyCoords.z)
    local streetname = GetStreetNameFromHashKey(streetHash)

    exports['eyrp_inventory']:addInventoryItem({
        item = 'key',
        message = true,
        data = {
            keydata = args[1],
            adress = streetname
        }
    })
end)

RegisterCommand('setgang', function()
    ESX.TriggerServerCallback('eyrp_gangs:setGang', function(hej)
        print(hej)
    end, 'Grove Street')
end)