RegisterNUICallback("closeBank", function()
    SetNuiFocus(false, false)
end)

RegisterNUICallback("withdraw", function(data)
    if not type(tonumber(data.amount)) == "number" then  
        ESX.ShowNotification("Du måste ange siffror.", "error")
    end

    if tonumber(data.amount) == nil then 
        ESX.ShowNotification("Du måste ange ett giltigt nummer", "error")
    end

    TriggerServerEvent("eyrp_banks:withdrawMoney", data.amount)
end)

RegisterNUICallback("deposit", function(data)
    if not type(tonumber(data.amount)) == "number" then  
        ESX.ShowNotification("Du måste ange siffror.", "error")
    end

    if tonumber(data.amount) == nil then 
        ESX.ShowNotification("Du måste ange ett giltigt nummer", "error")
    end

    TriggerServerEvent("eyrp_banks:SubmitMoney", data.amount)
end)