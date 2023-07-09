Action = {};  

function Action:OpenShopMenu() 
    ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'ShopMenu', {
        title = 'Vad vill du köpa?', 
        align = 'top-right', 
        elements = Config.Items
    }, function(data, menu) 
        local event = data.current.item 

        if event then  

            ESX.TriggerServerCallback('eyrp_core:payMoney', function(HasMoney)
                if HasMoney then
                    exports['eyrp_inventory']:addInventoryItem({
                        item = data.current.item,
                        message = true,
                        data = {}
                    })
                else
                    exports['eyrp_notify']:LoadNotification('Du har inte råd med detta', 'error', true)
                end
            end, data.current.price)
        end
    end, function(data, menu) 
        menu.close()
    end)
end