Citizen.CreateThread(function()
    while ESX == nil do
        Citizen.Wait(1);

        ESX = exports["es_extended"]:getSharedObject()  
    end 

    if ESX.IsPlayerLoaded() then
        ESX.PlayerData = ESX.GetPlayerData()
    end
end)

RegisterNetEvent("lowkey_hotwiring:hackVehicle")
AddEventHandler("lowkey_hotwiring:hackVehicle", function()   
    local Self = PlayerPedId(); 
    local playerCoords = GetEntityCoords(Self); 
    local ClosestVehicle = GetClosestVehicle(playerCoords, 5.0, 0, 71);  

    if ClosestVehicle <= 1.0 then  
        ESX.ShowNotification('Inget fordon är i närheten..', "error")
    else
        if GetVehicleDoorLockStatus(ClosestVehicle) == 2 then   
            SetVehicleDoorsLocked(ClosestVehicle, 1) 

            ESX.ShowNotification('Du låste upp fordonet.')

            ESX.PlayAnimation(Self, "anim@mp_player_intmenu@key_fob@", "fob_click_fp", {
                flag = 1
            })

            Citizen.Wait(800) 

            PlaySoundFrontend(-1, 'BACK', 'HUD_AMMO_SHOP_SOUNDSET', false)

            TriggerServerEvent("lowkey_hotwiring:removeInventoryItem")
            
            ClearPedTasks(Self)
        else
            ESX.ShowNotification('Fordonet är redan upplåst')
        end
    end
end)