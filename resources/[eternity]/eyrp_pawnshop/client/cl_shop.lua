local buyLocations = {
    ["Klockorna"] = vector3(-623.2053833007812, -232.7645721435547, 38.05704879760742), 
    ["Halsband"] = vector3(-619.2723388671875, -232.79818725585935, 38.05704879760742), 
} 

Citizen.CreateThread(function() 
    Citizen.Wait(100); 

    while true do 

        local playerPed, sleepThread = PlayerPedId(), 850; 

        for index, value in pairs(buyLocations) do 

            local Dst = #(GetEntityCoords(playerPed) - value); 

            if Dst <= 5.0 and not exports["eyrp_vangelico"]:CheckRob() then  
                sleepThread = 5; 

                ESX.Game.Utils.DrawText3D(value, "[~g~E~s~] - Bläddra bland ~o~" .. index); 

                if Dst <= 1.0 then  
                    if IsControlJustReleased(0, 38) then  
                        OpenShopMenu(index)
                    end
                end
            end
        end

        Citizen.Wait(sleepThread); 
    end
end)

OpenShopMenu = function(Event)
    if Event == "Klockorna" then  
        TriggerEvent('esx_skin:openRestrictedMenu', function(data, menu)
            menu.close()

            ESX.UI.Menu.Open('default', GetCurrentResourceName(), "clock", {
                title = "Är du säker? (" .. Config.Price .. " sek)", 
                align = "right", 
                elements = {
                    {
                        ["label"] = "Ja", ["value"] = "yes",
                    }, 
                    {
                        ["label"] = "Nej", ["value"] = "no",
                    },
                }
            }, function(data2, menu2) 
                local answer = data2.current.value 

                if answer == "yes" then  
                    ESX.TriggerServerCallback('eyrp_pawnshop:getPlayerCash', function(Response) 
                        if Response then  
                            TriggerEvent('skinchanger:getSkin', function(skin)
								TriggerServerEvent('esx_skin:save', skin)
							end)

                            menu2.close()

                            ESX.ShowNotification("Du betalade ~y~" .. Config.Price .. " kr")
                        else
                            TriggerEvent('esx_skin:getLastSkin', function(skin)
								TriggerEvent('skinchanger:loadSkin', skin)
							end)

                            ESX.ShowNotification('Du har inte tillräcklig med ~r~pengar', "error")
                        end
                    end)
                else
                    menu2.close()
                end
            end, function(data2, menu2)
                print('Du kan inte stänga via detta..')
            end)
        end, function(data, menu)
        end, {
            "watches_1", 
            "watches_2"
        })
    end

    if Event == "halspand" then  
        TriggerEvent('esx_skin:openRestrictedMenu', function(data, menu)
            menu.close()

            ESX.UI.Menu.Open('default', GetCurrentResourceName(), "chain", {
                title = "Är du säker? (" .. Config.Price .. " sek)", 
                align = "right", 
                elements = {
                    {
                        ["label"] = "Ja", ["value"] = "yes",
                    }, 
                    {
                        ["label"] = "Nej", ["value"] = "no",
                    },
                }
            }, function(data2, menu2) 
                local answer = data2.current.value 

                if answer == "yes" then  
                    ESX.TriggerServerCallback('eyrp_pawnshop:getPlayerCash', function(Response) 
                        if Response then  
                            TriggerEvent('skinchanger:getSkin', function(skin)
								TriggerServerEvent('esx_skin:save', skin)
							end)

                            menu2.close()

                            ESX.ShowNotification("Du betalade ~y~" .. Config.Price .. " kr")
                        else
                            TriggerEvent('esx_skin:getLastSkin', function(skin)
								TriggerEvent('skinchanger:loadSkin', skin)
							end)

                            ESX.ShowNotification('Du har inte tillräcklig med ~r~pengar', "error")
                        end
                    end)
                else
                    menu2.close()
                end
            end, function(data2, menu2)
                print('Du kan inte stänga via detta..')
            end)
        end, function(data, menu)
        end, {
            "chain_1", 
            "chain_2"
        })
    end
end