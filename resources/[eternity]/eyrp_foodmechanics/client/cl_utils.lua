Utils = {};

Utils.GetPlayerMoney = function(money)
    local playerMoney = ESX.GetPlayerData().money

    if playerMoney >= money then
        return true
    end

    return false
end