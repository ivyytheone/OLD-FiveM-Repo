Action = {}; 

function Action:OpenPawnShop() 
    ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'pawnshop', {
        title = 'Pantbutik', 
        align = Config.Align, 
        elements = Config.Items 
    }, function(data, menu)  
        local value = data.current.item

        if value then  
            if (exports['eyrp_inventory']:HasItem(value)) then  
                ESX.TriggerServerCallback('eyrp_pawnshop:sellItem', function(sold)  
                    if sold then 
                        TriggerServerEvent('eyrp_pawnshop:sendDiscordLog', data.current.label, data.current.price)
                    else
                        print('test')
                    end
                end, value, data.current.price)
            else
                ESX.ShowNotification('Du har inte någon ~r~' .. data.current.label .. '~s~')
            end
        end
    end, function(data, menu) 
        menu.close()
    end)
end