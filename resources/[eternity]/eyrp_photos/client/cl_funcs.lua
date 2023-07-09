Funcs = {}

Funcs.OpenMenu = function()
    ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'photo',
    {
        title = "Ange Bildadress",
    }, function(data3, menu3) 

        menu3.close() 

        if data3.value == nil then
            ESX.ShowNotification('Du måste ange en URL', 'error')
        end

        exports['eyrp_inventory']:addInventoryItem({
            item = 'foto',
            data = {
                image = data3.value
            }
        })
    end,
    function(data3, menu3)
        menu3.close()
    end) 
end