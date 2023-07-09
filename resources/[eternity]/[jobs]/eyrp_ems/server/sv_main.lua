ESX = nil 

TriggerEvent('esx:getSharedObject', function(obj) 
    ESX = obj  
end)  

ESX.RegisterServerCallback('eyrp_ems:getName', function(source, callback) 
    local xPlayer = ESX.GetPlayerFromId(source);  

    if GetCurrentResourceName() ~= "eyrp_ems" then 
        print(("Du har inte ha %s, vänligen byt och namn på filen till eyrp_ems"):format(GetCurrentResourceName())) 

        local wrongname = GetCurrentResourceName()
        callback(wrongname)
    else
        callback(false)
    end
end)

RegisterNetEvent('eyrp_ems:healPlayer', function(player) 
    TriggerClientEvent('eyrp_ems:healPlayer', player)
end)