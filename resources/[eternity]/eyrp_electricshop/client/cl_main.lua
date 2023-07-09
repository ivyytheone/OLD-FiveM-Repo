Citizen.CreateThread(function()
    while ESX == nil do
        Citizen.Wait(1);

        ESX = exports["es_extended"]:getSharedObject()  
    end 

    if ESX.IsPlayerLoaded() then
        ESX.PlayerData = ESX.GetPlayerData()
    end

    for i = 1, #Config.ElectricShop do  
        local blip = AddBlipForCoord(Config.ElectricShop[i]) 
        SetBlipSprite (blip, 78)
		SetBlipDisplay(blip, 4)
		SetBlipScale  (blip, 0.7)
		SetBlipColour (blip, 0) 
		SetBlipAsShortRange(blip, true)
		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString("Moans elektronik äffär")
		EndTextCommandSetBlipName(blip)
    end
end)

CreateThread(function()
    Wait(100)

    exports['eyrp_tools']:SpawnPed({
        Model = Config.Model,
        Coords = vector4(-656.9755249023438, -858.78955078125, 23.50306892395019, 358.3597717285156)
    }, function(SpawnedPed)
        FreezeEntityPosition(SpawnedPed, true)
        SetBlockingOfNonTemporaryEvents(SpawnedPed, true)
        SetEntityInvincible(SpawnedPed, true)

        while true do
            local player, sleepThread = PlayerPedId(), 500;

            for index, value in pairs(Config.ElectricShop) do

                local distance = #(GetEntityCoords(player) - value)

                if distance <= 3.0 and not IsPedDeadOrDying(player) and IsPedOnFoot(player) and DoesEntityExist(SpawnedPed) then
                    sleepThread = 7;
    
                    exports['eyrp_tools']:DrawText3D(value, '[~g~E~s~] - Köp av Moan')
    
                    if IsControlJustReleased(0, 38) then
                        Action:OpenShopMenu()
                    end
                end
            end
            Wait(sleepThread)
        end
    end)
end)