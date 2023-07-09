Event = {}

RegisterNetEvent('eyrp_bennys:globalAction') 
AddEventHandler('eyrp_bennys:globalAction', function(action, Data) 
    if action == 'BossActions' then 
        TriggerEvent("esx_society:openBossMenu", "bennys", function(Data, Menu)
            Menu.close()
        end)
    end 
 
    if action == 'DressingRoom' then  
        Action.Dressing = 1
    end
end)