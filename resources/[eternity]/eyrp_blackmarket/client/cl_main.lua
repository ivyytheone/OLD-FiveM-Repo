Citizen.CreateThread(function()
    while ESX == nil do
        Citizen.Wait(1);

        ESX = exports["es_extended"]:getSharedObject()  
    end 

    if ESX.IsPlayerLoaded() then
        ESX.PlayerData = ESX.GetPlayerData()
    end
end)


Citizen.CreateThread(function()
    Citizen.Wait(100); 

    while true do 
        if not ESX.IsPlayerLoaded() then return end
        
        local Player, sleepThread = PlayerPedId(), 850; 

        local Dst = #(GetEntityCoords(Player) - Config.Position.Coords); 

        if Dst <= 1.0 then 
            sleepThread = 5; 

            ESX.DrawScriptMarker({
                pos = Config.Position.Coords - vector3(0.0, 0.0, 0.985),  
                type = 6,
                sizeX = 1.0, sizeY = 1.0, sizeZ = 1.0,
                r = 50, g = 155, b = 250,
            });  

            ESX.ShowHelpNotification("~INPUT_CONTEXT~ Öppna ~r~svartamarknaden")

            if IsControlJustReleased(0, 38) then 
                ESX.UI.Menu.Open("dialog", GetCurrentResourceName(), "password", {
                    title = "Ange lösernord",
                }, function(DialogData, DialogMenu)
                    local Password = DialogData.value 

                    DialogMenu.close()

                    if Password == nil then  
                        ESX.ShowNotification("Du måste ange något")
                    end

                    if Password == Config.Position.Code then 
                        ESX.UI.Menu.Open('default', GetCurrentResourceName(), "blackmarket", {
                            title = "Svartamarknaden", 
                            align = "center", 
                            elements = Config.Products
                        }, function(Data, Menu)
                            local Value = Data.current

                            if Value then
                                ESX.TriggerServerCallback("eyrp_core:payMoney", function(Response)
                                    if Response then  
                                        if Value.type == "item" then 
                                            exports.eyrp_inventory:addInventoryItem({
                                                Item = Value.item,
                                                Message = true, 
                                                Data = {} 
                                            })
                                        end

                                        if Value.type == "weapon" then 
                                            exports.eyrp_inventory:addInventoryItem({
                                                Item = Value.item,
                                                Message = true, 
                                                Data = {
                                                    ammo = 40
                                                } 
                                            })
                                        end
                                    else
                                        ESX.ShowNotification("Du har inte tillräckligt med pengar.")
                                    end
                                end, Value.price) 
                            end
                        end, function(Data, Menu)
                            Menu.close()
                        end)
                    else
                        ESX.ShowNotification("Du angede fel lösernord.")
                    end
                end, function(DialogData, DialogMenu)
                    DialogMenu.close()
                end)
            end
        end

        Citizen.Wait(sleepThread);
    end
end)