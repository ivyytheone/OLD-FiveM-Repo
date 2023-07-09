Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) 
            ESX = obj 
        end)
		Citizen.Wait(0)
	end
end)

RegisterNetEvent('lowkey_drugsales:globalActions', function(action, data) 
    if action == "openDrugsales" then    
        ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'character_items', {
            title = 'Välj vad du vill sälja', 
            algin = 'top-right', 
            elements = {
                {
                    label = 'Kokain', 
                    item = 'bandage', 
                }, 
                {
                    label = 'Lsd', 
                    item = 'lsd'
                }
            }
        }, function(data, menu) 
            local item = data.current.item 

            if item then   
                if UTILS.GETCHARACTERITEM(item) then    
                    local randomPrice = math.random(50, 150)
                    ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'sell', {
                        title = 'Kan du sälja detta för?', 
                        algin = 'top-right', 
                        elements = {
                            {
                                label = randomPrice .. ' KR', 
                                event = 'firstPrice'
                            },
                            {
                                label = 'Nej, vill ha högre pris', 
                                event = 'higher'
                            }
                        }
                    }, function(data2, menu2) 
                        local sell = data2.current.event 

                        if sell == 'firstPrice' then  
                            TriggerServerEvent('lowkey_drugsales:sellItem', item, randomPrice)
                        else
                            tabel.insert(elements, 'Sista pris ' .. math.random(70, 160))
                        end
                    end, function(data2, menu2) 
                        menu2.close()
                    end)
                else
                    ESX.ShowNotification('Du har inget ~r~' .. data.current.label .. '~s~ att sälja!')
                end
            end
        end, function(data, menu) 
            menu.close()
        end)
    end 
end)

