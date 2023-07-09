Action = {}; 

Action.HandleIndex = function(Event) 
    if Event == "BossMenu" then  
        TriggerEvent('esx_society:openBossMenu', 'taxi', function(data2, menu2)
            menu2.close() 
        end)  
    end

    if Event == "Garage" then   
        ESX.Game.SpawnVehicle("taxi", vector3(897.3594360351562, -152.25038146972656, 76.558349609375), 325.5215148925781, function() 
            ESX.ShowNotification("Du tog ut ett fordon.")
        end)
    end

    if Event == "Park" then  
        TriggerEvent("esx:deleteVehicle")
    end
end