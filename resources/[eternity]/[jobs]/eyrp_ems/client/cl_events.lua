RegisterNetEvent('eyrp_ems:globalFunction', function(action) 
    if action == 'BossAction' then 
        TriggerEvent("esx_society:openBossMenu", "ambulance", function(Data, Menu)
            Menu.close()
        end)
    end

    if action == "DressingRoom" then  
        Action.Dressing = 1
    end

    if action == "TeleportToRoof" then   
        ESX.Game.Teleport(PlayerPedId(), vector3(338.59515380859375, -583.8712768554688, 74.16171264648438), function()
        end)
    end

    if action == "TeleportToHospital" then   
        ESX.Game.Teleport(PlayerPedId(), vector3(332.3311462402344, -595.6350708007812, 43.28409576416015), function()
        end)
    end

    if action == "Garage" then  
        ESX.Game.SpawnVehicle("buzzard", vector3(351.70867919921875, -587.8342895507812, 74.16172790527344), 243.912353515625, function()
        end)
    end

    if action == "Park" then  
        TriggerEvent("esx:deleteVehicle")
    end
end)

RegisterNetEvent('eyrp_ems:healPlayer', function() 
    local playerPed = PlayerPedId()
	local maxHealth = GetEntityMaxHealth(playerPed)

    SetEntityHealth(playerPed, 2000) 
end)