ESX = nil 

TriggerEvent('esx:getSharedObject', function(obj) 
    ESX = obj  
end)  

ESX.RegisterServerCallback('eyrp_bennys:getName', function(source, callback) 
    local xPlayer = ESX.GetPlayerFromId(source);  

    if GetCurrentResourceName() ~= "eyrp_bennys" then 
        print(("Du har inte ha %s, vänligen byt och namn på filen till eyrp_bennys"):format(GetCurrentResourceName())) 

        local wrongname = GetCurrentResourceName()
        callback(wrongname)
    else
        callback(false)
    end
end)
