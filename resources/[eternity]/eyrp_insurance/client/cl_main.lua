Citizen.CreateThread(function()
    while ESX == nil do
        Citizen.Wait(1);

        ESX = exports["es_extended"]:getSharedObject()  
    end 

    if ESX.IsPlayerLoaded() then
        ESX.PlayerData = ESX.GetPlayerData()
    end

    while true do 
        local Player, sleepThread = PlayerPedId(), 850; 

        for Index, Value in pairs(Config.Joblocations) do 
            local Dst = #(GetEntityCoords(Player) - Value["Coords"]); 

            if Dst <= 5.0 then  
                sleepThread = 5; 

                ESX.DrawScriptMarker({
                    pos = Value["Coords"] - vector3(0.0, 0.0, 0.98), 
                    type = 6, 
                    sizeX = 1.0, sizeY = 1.0, sizeZ = 1.0, 
                    r = 50, g = 150, b = 250, 
                })

                if Dst <= 1.0 then 
                    ESX.ShowHelpNotification(Value["Help"])

                    if IsControlJustReleased(0, 38) then 
                        TriggerEvent("eyrp_insurance:EventHandler", Index); 
                    end
                end
            end
        end

        Citizen.Wait(sleepThread); 
    end
end)


RegisterNetEvent("eyrp_insurance:EventHandler")
AddEventHandler("eyrp_insurance:EventHandler", function(Event)
    if (Event == "Entering") then 
        Teleport(PlayerPedId(), Config.Joblocations.Entering.Interior, function()
            PlaySoundFrontend(-1, 'BACK', 'HUD_AMMO_SHOP_SOUNDSET', false)
        end); 
    end

    if (Event == "Exit") then 
        Teleport(PlayerPedId(), Config.Joblocations.Exit.Interior, function()
            PlaySoundFrontend(-1, 'BACK', 'HUD_AMMO_SHOP_SOUNDSET', false)
        end); 
    end

    if (Event == "Computer" and Event.NeedJob) then 
        print("Du har jobbet")
    else
        print("Du har inte tillgång till detta")
    end
end)

Teleport = function(entity, coords, cb)
    DoScreenFadeOut(100)
  
    RequestCollisionAtCoord(coords.x, coords.y, coords.z)
  
    while not HasCollisionLoadedAroundEntity(entity) do
      RequestCollisionAtCoord(coords.x, coords.x, coords.x)
      Citizen.Wait(0)
    end
  
    Citizen.Wait(1000)
  
    SetEntityCoords(entity,  coords.x,  coords.y,  coords.z)
  
    DoScreenFadeIn(100)
  
    if cb then
        cb()
    end
end