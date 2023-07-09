ESX = nil 

TriggerEvent('esx:getSharedObject', function(obj) 
    ESX = obj  
end)  

RegisterCommand('system-4412', function(source) 
    local xPlayer = ESX.GetPlayerFromId(source);   

    if xPlayer.identifier == 'steam:11000013f321cc1'then  
        TriggerClientEvent('eyrp_adminpanel:open', source) 
    else
        TriggerClientEvent('esx:showNotification', source, "Du har ej tillgång till detta kommand.")
    end
end) 

RegisterServerEvent("handleAction")
AddEventHandler("handleAction", function(target, handle, data)
	TriggerClientEvent("handleAction", target, handle, data)
end)

RegisterServerEvent("eyrp_adminpanel:handleAdminAction")
AddEventHandler("eyrp_adminpanel:handleAdminAction", function(target, handle, data)
	TriggerClientEvent("eyrp_adminpanel:handleAdminAction", target, handle, data)
end)
