OpenStoreComputer = function()
    local alarmPlaying = IsAlarmPlaying("JEWEL_STORE_HEIST_ALARMS")

    if not alarmPlaying then return end

    GlobalFunction("STOP_ALARM")

    ESX.ShowNotification('Du stängde av larmet', 'info')

    Robbing = false
end

CheckRob = function()
    if Robbing then  
        return true 
    else
        return false
    end
end
    
exports('CheckRob', CheckRob)