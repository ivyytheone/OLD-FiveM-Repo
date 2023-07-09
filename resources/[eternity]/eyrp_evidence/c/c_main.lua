Citizen.CreateThread(function()
    while ESX == nil do
        Citizen.Wait(1);
  
        ESX = exports["es_extended"]:getSharedObject()  
    end 
  
    if ESX.IsPlayerLoaded() then
        ESX.PlayerData = ESX.GetPlayerData()
    end
end)

CreateThread(function()
    Wait(100)

    while true do
        local player, sleepThread = PlayerPedId(), 500;

        for index, value in pairs(Config.Locations) do

            local distance = #(GetEntityCoords(player) - value)

            if distance <= 2.0 and IsPedOnFoot(player) and not IsPedDeadOrDying(player) then
                sleepThread = 7;

                exports['eyrp_tools']:DrawText3D(value, '[~g~E~s~] - Öppna bevisarkiv')

                if IsControlJustReleased(0, 38) then
                    Funcs.EventHandler({ Event = 'OPEN' })
                end
            end
        end
        Wait(sleepThread)
    end
end)
