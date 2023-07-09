-- CreateThread(function()
--     Wait(100)

--     while true do
--         local player, sleepThread = PlayerPedId(), 500;

--         for index, value in pairs(Config.Markets) do

--             local distance = #(GetEntityCoords(player) - value)

--             if distance <= 2.0 and not IsPedDeadOrDying(player) and IsPedOnFoot(player) then
--                 sleepThread = 7;

--                 exports['eyrp_tools']:DrawText3D(value, '[~g~E~s~] - Jobmarknad')

--                 if IsControlJustReleased(0, 38) then
--                     Funcs:EventHandler({ Event = 'OPEN' })
--                 end
--             end
--         end
--         Wait(sleepThread)
--     end
-- end)

RegisterCommand('open', function()
    EventHandler({ Event = 'OPEN' })
end)