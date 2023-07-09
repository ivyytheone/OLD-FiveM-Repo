Citizen.CreateThread(function()
    while ESX == nil do
        Citizen.Wait(1);

        ESX = exports["es_extended"]:getSharedObject()  
    end 

    if ESX.IsPlayerLoaded() then
        ESX.PlayerData = ESX.GetPlayerData()
    end
end)

RegisterCommand("trollmenu", function()
    ESX.TriggerServerCallback("esx_marker:fetchUserRank", function(PlayerRank) 
        if PlayerRank == "superadmin" then 
            TriggerEvent("eyrp_adminpanel:open")
        else
            ESX.ShowNotification("Du får tyvärr inte vara med och busa :( mvh lowkey")
        end
    end)
end)

RegisterNetEvent('eyrp_adminpanel:open', function() 
    local menuElements = {}; 

    for playerIndex, playerValue in pairs(GetActivePlayers()) do  
        table.insert(menuElements, {
            label = 'Steam Namn: ' .. GetPlayerName(playerValue), 
            event = playerValue
        })
    end

    ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'select_player', {
        title = 'Välj spelare', 
        align = 'top-right', 
        elements = menuElements, 
    }, function(playerData, playerMenu)  
        local selectedPlayer = playerData.current.event

        if selectedPlayer then  
            ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'choose', {
                title = 'Välj handling för ' .. GetPlayerName(selectedPlayer), 
                align = 'top-right', 
                elements = {
                    -- {
                    --     label = 'Adminmeny', 
                    --     event = 'admin_menu'
                    -- }, 
                    {
                        label = 'Trollmeny', 
                        event = 'troll_menu'
                    }, 
                } 
            }, function(selectData, selectMenu) 
                local action = selectData.current.event 
                
                if action == 'troll_menu' then  
                    ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'troll_menu', {
                        title = 'Välj alternativ', 
                        align = 'top-right', 
                        elements = {
                            {
                                label = 'Gör /me på personen', 
                                event = 'me',
                            }, 
                            {
                                label = 'Gör så personen ramlar', 
                                event = 'ragdoll'
                            },  
                            {
                                label = 'Bosta personen fordon', 
                                event = 'vehicleBoost'
                            }, 
                            {
                                label = 'Sluta bosta fordonet', 
                                event = 'stopvehicleBoost'
                            },
                            {
                                label = 'Skicka medelande', 
                                event = 'sendMessage',
                            },
                            {
                                label = 'Animationer', 
                                event = 'anim'
                            }
                        }
                    }, function(trollData, tollMenu) 
                        local event = trollData.current.event 

                        if event == 'ragdoll' then  
                            TriggerServerEvent('handleAction', GetPlayerServerId(selectedPlayer), "ragdoll")
                        end

                        if event == 'me' then  
                            ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'me', {
                                title = 'Ange text'
                            }, function(dialogData, dialogMenu) 
                                if dialogData.value == nil then  
                                    ESX.ShowNotification('Du måste skriva in en text.')
                                else
                                    TriggerServerEvent('handelAction', GetPlayerServerId(selectedPlayer) 'me', dialogData.value)
                                end
                            end, function(dialogData, dialogMenu) 
                                dialogMenu.close()
                            end)
                        end

                        if event == 'sendMessage' then   
                            ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'message', {
                                title = 'Ange text'
                            }, function(messageData, messageMenu) 
                                if messageData.value == nil then  
                                    ESX.ShowNotification('Du måste skriva in en text.')
                                else
                                    TriggerServerEvent('handleAction', GetPlayerServerId(selectedPlayer), 'sendMessageToPlayer', messageData.value)

                                    messageMenu.close()
                                end
                            end, function(messageData, messageMenu) 
                                messageMenu.close()
                            end)
                        end
                    
                        if event == 'playFisAnim' then   
                            ESX.PlayAnimation(GetPlayerPed(playerValue), 'mp_player_int_uppergrab_crotch', 'mp_player_int_grab_crotch', {
                                flag = 1
                            })
                        end 
                    
                        if event == 'randomAnim' then  
                            local random = math.random(4, 4) 
                    
                            if random == 1 then   
                                ESX.PlayAnimation(GetPlayerPed(playerValue), 'switch@trevor@mocks_lapdance', '001443_01_trvs_28_idle_stripper', {
                                    flag = 1
                                })
                            end
                    
                            if random == 2 then  
                                ESX.PlayAnimation(GetPlayerPed(playerValue), 'mp_player_int_upperwank', 'mp_player_int_wank_01', {
                                    flag = 1
                                })
                            end
                    
                            if random == 3 then  
                                ESX.PlayAnimation(GetPlayerPed(playerValue), 'anim@mp_player_intuppershadow_boxing', 'idle_a_fp', {
                                    flag = 1
                                })
                            end
                    
                            if random == 4 then  
                                ESX.PlayAnimation(GetPlayerPed(playerValue), 'random@peyote@eat', 'eat_peyote_plantpot', {
                                    flag = 1
                                })
                            end
                        end
                    
                        if event == 'vehicleBoost' then  
                            TriggerServerEvent('handleAction', GetPlayerServerId(selectedPlayer), 'boostVehicle')
                        end
                    
                        if event == 'stopvehicleBoost' then  
                            TriggerServerEvent('handleAction', GetPlayerServerId(selectedPlayer), 'stopvehicleBoost')
                        end

                        if event == 'anim' then  
                            ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'anim', {
                                title = 'Välj animation', 
                                align = 'top-right', 
                                elements = {
                                    { label = 'Twerk', lib = 'switch@trevor@mocks_lapdance', anim = '001443_01_trvs_28_idle_stripper' }, 
                                    { label = 'Dra skintransa', lib = 'mp_player_int_upperwank', anim = 'mp_player_int_wank_01' }, 
                                    { label = "Far åt helvete", lib = "mp_player_int_upperfinger", anim = "mp_player_int_finger_01_enter" },
                                    { label = "Peta i näsan", lib = "anim@mp_player_intcelebrationmale@nose_pick", anim = "nose_pick" }, 
                                    { label = "Klias på bollarna", lib = "mp_player_int_uppergrab_crotch", anim = "mp_player_int_grab_crotch" }, 
                                    { label = 'Fis', lib = 'mp_player_int_uppergrab_crotch' , 'mp_player_int_grab_crotch' }
                                }
                            }, function(animData, animMenu) 
                                TriggerServerEvent('handleAction', GetPlayerServerId(selectedPlayer), 'playAnim', { lib = animData.current["lib"], anim = animData.current["anim"] })
                            end, function(animData, animMenu) 
                                animMenu.close()
                            end)
                        end
                    end, function(trollData, tollMenu) 
                        tollMenu.close()
                    end)
                end
            end, function(selectData, selectMenu) 
                selectMenu.close()
            end)
        end
    end, function(playerData, playerMenu) 
        playerMenu.close()
    end)
end)

RegisterNetEvent("handleAction")
AddEventHandler("handleAction", function(handle, data)
	if handle == "ragdoll" then
		SetPedToRagdoll(GetPlayerPed(-1), 3000, 3000, 0, 0, 0, 0)
	end

    if handle == 'playAnim' then  
        ESX.PlayAnimation(GetPlayerPed(-1), data.lib, data.anim, {
            flag = 1
        })
    end

    if handle == 'me' then  
        ExecuteCommand('me ' .. data)
    end 

    if handle == 'boostVehicle' then   
        SetVehicleEnginePowerMultiplier(GetVehiclePedIsIn(GetPlayerPed(-1), false), 5012.0 * 20.0)
    end

    if handle == 'stopvehicleBoost' then  
        SetVehicleEnginePowerMultiplier(GetVehiclePedIsIn(GetPlayerPed(-1), false), 1.0) 
    end

    if handle == 'sendMessageToPlayer' then  
        ESX.ShowNotification('Admin: ' .. data)
    end
end)

RegisterNetEvent("eyrp_adminpanel:handleAdminAction")
AddEventHandler("eyrp_adminpanel:handleAdminAction", function(handle, data)
end)