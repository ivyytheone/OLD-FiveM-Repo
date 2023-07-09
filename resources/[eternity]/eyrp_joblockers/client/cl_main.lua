Citizen.CreateThread(function()
    while ESX == nil do
        Citizen.Wait(100);

        ESX = exports["es_extended"]:getSharedObject()  
    end 

    if ESX.IsPlayerLoaded() then
        ESX.PlayerData = ESX.GetPlayerData()
    end
end)

-- Citizen.CreateThread(function()
--     while true do
--         local Player, sleepThread = PlayerPedId(), 250

--         for index, value in pairs(Config.Lockers) do
            
--             local Distance = #(GetEntityCoords(Player) - value.Coords)

--             if Distance < 1.5 and ESX.PlayerData.job.name == value.Job and IsPedOnFoot(Player) then
--                 sleepThread = 7;
--                 exports['eyrp_core']:DrawText3D(value.Coords, '[~o~E~s~] - Skåp')

--                 if IsControlJustReleased(0, 38) then
--                     Actions.OpenLockerMenu({
--                         Index = index
--                     })
--                 end
--             end
            
--         end

--         Citizen.Wait(sleepThread)
--     end
-- end)