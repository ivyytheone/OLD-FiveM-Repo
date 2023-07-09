ESX = nil 

local CooldownActive = false

TriggerEvent('esx:getSharedObject', function(obj) 
    ESX = obj  
end) 

RegisterServerEvent('eyrp_detentioncall:SendPage')
AddEventHandler('eyrp_detentioncall:SendPage', function(Value) 
    if not CooldownActive then
        if Config.UseMythicNotify then
            TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'success', text = _U('successfulPage')})
        else 
            TriggerClientEvent('esx:showNotification', source, "Du tillkalla personal")
        end
        TriggerClientEvent('eyrp_detentioncall:SendMessage', source, Value)
        if Config.Cooldown ~= 0 then
            CooldownTimer()
        end
    else
        if Config.UseMythicNotify then
            TriggerClientEvent('mythic_notify:client:SendAlert', source,{ type = 'error', text = _U('recentPage')})
        else 
            TriggerClientEvent('esx:showNotification', source, "Du har redan att använt knappen!")
        end
    end
end)

function CooldownTimer()
    timeLeft = Config.Cooldown
    CooldownActive = true
	
	while true do
		Citizen.Wait(60000)
		timeLeft = timeLeft - 1

        if timeLeft <= 0 then
            CooldownActive = false
			break
		end
	end
end

-- RegisterServerEvent('eyrp_detentioncall:SendPage')
-- AddEventHandler('eyrp_detentioncall:SendPage', function(Value)
--     if not CooldownActive then 

--         else 
--             TriggerClientEvent('esx:showNotification', source, "Du tillkalla " .. Value )
--         end
--         TriggerClientEvent('RNG_FrontDeskPage:Page', source, location)
--         if Config.CoolDown ~= 0 then
--             CooldownTimer()
--         end
--     else
--         TriggerClientEvent('esx:showNotification', source, _U('recentPage'))
--     end
-- end)