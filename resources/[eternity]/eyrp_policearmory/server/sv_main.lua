ESX = nil 

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj  
end)

ESX.RegisterServerCallback('eyrp_policearmory:PoliceCard', function(source, Callback)
    local Player = ESX.GetPlayerFromId(source);

    if Player then
        local Query = MySQL.Sync.fetchAll("SELECT firstname, lastname, rakel FROM users WHERE identifier = @identifier ", { ['@identifier'] = Player.identifier })

        if Query[1] then
            Callback(Query[1], Player.getJob().grade_label)
        else
            Callback(false)
        end
    else
        Callback(false)
    end
end)