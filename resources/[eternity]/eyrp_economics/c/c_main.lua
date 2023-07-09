ESX = nil

Citizen.CreateThread(function()
    while ESX == nil do
        Citizen.Wait(100);

        ESX = exports["es_extended"]:getSharedObject()  
    end 

    if ESX.IsPlayerLoaded() then
        ESX.PlayerData = ESX.GetPlayerData()
    end 
end)

CreateThread(function()
    Wait(100)

    while true do
        Wait(60000)

        ESX.TriggerServerCallback('eyrp_economics:handlePaycheck', function(Response)

            if Response then

                exports['eyrp_notify']:LoadNotification('Du mottog din dagliga lön på ' .. Response .. 'kr')
            end
        end)
    end
end)

GetCompanyMoney = function(Job, Callback)

    if not Job then return end

    ESX.TriggerServerCallback('eyrp_society:GetComanyMoney', function(Response)

        if Response then 
            Callback(Response)
        else
            Callback(false)
        end

    end, Job)
end