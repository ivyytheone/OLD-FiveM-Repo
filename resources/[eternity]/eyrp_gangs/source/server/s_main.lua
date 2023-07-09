ESX = nil 

TriggerEvent('esx:getSharedObject', function(obj) 
    ESX = obj  
end) 

ESX.RegisterServerCallback("eyrp_gangs:setGang", function(Source, Cb, Gang, Target)
    local Player = ESX.GetPlayerFromId(Source); 

    if not Gang then  
        Gang = "None"
    end

    MySQL.Sync.fetchAll("UPDATE users SET gang = @gang WHERE identifier = @Player", {
        ["@Player"] = Player.identifier, 
        ["@gang"] = Gang, 
        ["@Rank"] = Rank
    }, function(Rows)
    end)
end)

ESX.RegisterServerCallback("eyrp_gangs:removePlayerGang", function(Source, Cb, Player, Gang)
    local Player = ESX.GetPlayerFromId(Player); 

    MySQL.Sync.fetchAll("UPDATE users SET gang = @gang, rank = @rank WHERE identifier = @identifier", {
        ["@identifier"] = Player.identifier, 
        ["@gang"] = "None", 
        ["@rank"] = 0
    }, function(Rows)
        -- Done code
    end)
end)

ESX.RegisterServerCallback("eyrp_gangs:getGangMembers", function(Source, Cb)
    local Player = ESX.GetPlayerFromId(Source); 

    if Player then
        MySQL.Async.fetchAll("SELECT gang FROM users WHERE identifier = @identifier", { 
            ["@identifier"] = Player.identifier,
        }, function(Rows) 
            if Rows[1] then
                Cb({
                    Gang = Rows[1], 
                })
            end
        end)
    end
end)

ESX.RegisterServerCallback("eyrp_gangs:checkReward", function(Source, Cb, Mark, Gang)
    local Player = ESX.GetPlayerFromId(Source); 

    if Player then 
        MySQL.Async.fetchAll("SELECT Reward, Cooldown FROM ownedmarks WHERE Gangname = @Gangname", {
            ["@Gangname"] = Player.Gangname, 
            ["@Reward"] = Reward, 
            ["@Cooldown"] = Cooldown,
        }, function(Response)
            Cb({
                Cooldown = Response[2], 
            })

            if Response[1] == 0 then  
                Cb(false)
            else
                Cb({
                    Reward = Response[1], 
                })
            end
        end)
    end
end)

ESX.RegisterServerCallback("eyrp_gangs:setCooldown", function(Source, Cb, Place, Gang)
    local Player = ESX.GetPlayerFromId(Source); 

    if Player then 
        MySQL.Async.execute("INSERT INTO ownedmarks (Gangname, Mark, Reward, Cooldown) VALUES (@Gangname, @Mark, @Reward, @Cooldown)", {
            ["@Gangname"] = json.encode(Gang), 
            ["@Mark"] = Place, 
            ["@Reward"] = math.random(6000, 10000),
            ["@Cooldown"] = 4000
        })

        TriggerClientEvent("esx:showNotification", Source, "Du tog över ~y~" .. Place .. "~s~ Kom tillbaka om 24h för att hämta ut din belöning.")
    end
end)