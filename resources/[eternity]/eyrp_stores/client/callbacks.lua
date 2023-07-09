RegisterNUICallback("eventHandler", function(data)
    local ItemData = data.data
    if data.event == "close" then 
        SetNuiFocus(false, false)
    elseif data.event == "buyItems" then 
        ESX.TriggerServerCallback("buyItems", function(hasMoney)
            if hasMoney then 
                ESX.ShowNotification(string.format(Strings.Bought, ItemData.item.label, ItemData.price), 'success')
            else
                ESX.ShowNotification('Du har inte tillräckligt med pengar', "error")
            end
        end, ItemData.Category, ItemData.item)
    end
end)