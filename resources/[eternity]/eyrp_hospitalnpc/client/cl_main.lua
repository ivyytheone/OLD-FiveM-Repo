Citizen.CreateThread(function()
    while ESX == nil do
        Citizen.Wait(1);

        ESX = exports["es_extended"]:getSharedObject()  
    end 

    if ESX.IsPlayerLoaded() then
        ESX.PlayerData = ESX.GetPlayerData()
    end

    SpawnHospitalNpc()


    while true do
        local wait = 250

        if Hospital.BlockKeys then
            for i = 0, 31 do
                DisableAllControlActions(i)
            end

            wait = 0
        end

        Wait(wait)
    end
end)

Hospital = {
    TimeCaring = 5 * 60000, 
    BlockKeys = false
}; 

Citizen.CreateThread(function()  
    while true do 
        local Player, sleepThread = PlayerPedId(), 750; 

        for i = 1, #Config.Zones do  
            local Dst = #(GetEntityCoords(Player) - Config.Zones[i]);  

            local HealthLost = (GetEntityMaxHealth(Player) - GetEntityHealth(Player)) * 3

            if Dst <= 5.0 and not IsPedInAnyVehicle(Player) then  
                sleepThread = 5; 

                ESX.DrawScriptMarker({
                    pos = Config.Zones[i] - vector3(0.0, 0.0, 0.985),  
                    type = 2,
                    sizeX = 0.2,
                    sizeY = 0.2,
                    sizeZ = 0.2,
                    r = 0,
                    g = 255,
                    b = 0,
                    rotate = true
                });  

                if Dst <= 2.5 then  
                    ESX.ShowHelpNotification("~INPUT_CONTEXT~ Få vård för ~g~" .. HealthLost .. " KR~w~\n~INPUT_DETONATE~ Köp läkemedel"); 

                    if IsControlJustReleased(0, 38) or IsDisabledControlJustReleased(0, 38) then  
                        if IsEntityDead(Player) then   
                            Funcs:HealthCare(HealthLost)
                        else
                            ESX.ShowNotification("Du får prata med mina kollegor om dina skador.")
                        end
                    end

                    if IsControlJustReleased(0, 47) then 
                        ESX.UI.Menu.Open("default", GetCurrentResourceName(), "hospital_shop", {
                            title = "Apoteket", 
                            align = 'right', 
                            elements = Config.Shop.Products
                        }, function(Data, Menu) 
                            local value = Data.current.value 

                            if value then 
                                ESX.TriggerServerCallback('eyrp_core:payMoney', function(hasMoney)

                                    if hasMoney then
                                        exports['eyrp_inventory']:addInventoryItem({
                                            item = value,
                                            message = true,
                                            data = {}
                                        })

                                        ESX.ShowNotification('Du betalade ~y~' .. data.current.price .. '~s~', 'info')
                                    else
                                        ESX.ShowNotification("Du har inte tillräcklig med pengar", "error")
                                    end
                                end, Data.current.price)

                            end  
                        end, function(Data, Menu) 
                            Menu.close()
                        end)
                    end
                end
            end
        end
        
        Citizen.Wait(sleepThread)
    end
end)

