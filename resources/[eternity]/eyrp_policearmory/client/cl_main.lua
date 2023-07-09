ESX = nil

Citizen.CreateThread(function()
    while ESX == nil do
        Citizen.Wait(100);

        ESX = exports["es_extended"]:getSharedObject()  
    end 

    if ESX.IsPlayerLoaded() then
        ESX.PlayerData = ESX.GetPlayerData()
    end 
end) 

Animation = {
    Dict = 'anim_casino_b@amb@casino@games@shared@dealer@',
    Lib = 'idle'
}

CreateThread(function()
    Wait(100)

    exports['eyrp_tools']:SpawnPed({
        Model = Config.Model,
        Coords = Config.Coords,
    }, function(Ped)
        SetEntityInvincible(Ped, true)
        SetBlockingOfNonTemporaryEvents(Ped, true)
        Wait(1000)
        FreezeEntityPosition(Ped, true)

        ClearPedTasks(Ped)

        if not IsEntityPlayingAnim(Ped, Animation.Dict, Animation.Lib, 3) then
            exports['eyrp_tools']:PlayAnimation({
                Ped = Ped,
                Dict = Animation.Dict,
                Lib = Animation.Lib,
                Flag = 49
            })
        end

        while true do
            local player, sleepThread = PlayerPedId(), 500;

            if DoesEntityExist(Ped) then
                local distance = #(GetEntityCoords(player) - GetEntityCoords(Ped))

                if distance <= 2.0 and not IsPedDeadOrDying(player) and IsEntityPlayingAnim(Ped, Animation.Dict, Animation.Lib, 3) and IsPedOnFoot(player) then
                    sleepThread = 7;
                    exports['eyrp_core']:DrawText3D(GetEntityCoords(Ped), '[~g~E~s~] - ' .. Config.Text)
        
                    if IsControlJustReleased(0, 38) then
                        Utils.OpenMenu()
                    end
                end
            end
            Wait(sleepThread)
        end
    end)
end)