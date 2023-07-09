self = {};
self.CachedPlant = {}
Weed = {};

Weed.Plants = {
    'Prop_weed_01',
    'bkr_prop_weed_lrg_01a',
    'bkr_prop_weed_lrg_01b',
    'bkr_prop_weed_med_01b',
    'bkr_prop_weed_01_small_01a',
    'bkr_prop_weed_01_small_01b'
}

CreateThread(function()
    self.InWeed = false
    Wait(100)
    
    while true do
        local player, sleepThread = PlayerPedId(), 500;

        if #(GetEntityCoords(player) - Config.Weed.Outside.Coords) <= 2.0 and not IsPedDeadOrDying(player) and IsPedOnFoot(player) then
            sleepThread = 7;

            exports['eyrp_tools']:DrawText3D(Config.Weed.Outside.Coords, '[~r~E~s~] - Gå in')

            if IsControlJustReleased(0, 38) then
                Weed.Teleport(self.InWeed)
            end
        end

        if #(GetEntityCoords(player) - Config.Weed.Inside.Coords) <= 2.0 and not IsPedDeadOrDying(player) and IsPedOnFoot(player) then
            sleepThread = 7;

            exports['eyrp_tools']:DrawText3D(Config.Weed.Inside.Coords, '[~r~E~s~] - Gå ut')

            if IsControlJustReleased(0, 38) then
                Weed.Teleport(self.InWeed)
            end
        end

        for index, value in pairs(Weed.Plants) do
            local weedplant = GetClosestObjectOfType(GetEntityCoords(player), 1.5, GetHashKey(value))

            if DoesEntityExist(weedplant) then
                local distance = #(GetEntityCoords(player) - GetEntityCoords(weedplant))

                if distance <= 1.5 and not IsPedDeadOrDying(player) and not self.CachedPlant[weedplant] and self.InWeed and not IsPedUsingScenario(player, 'WORLD_HUMAN_GARDENER_PLANT') then
                    sleepThread = 7;

                    exports['eyrp_tools']:DrawText3D(GetEntityCoords(weedplant), '[~r~E~s~] - Skörda')

                    if IsControlJustReleased(0, 38) then
                        Weed.Init(weedplant)
                    end
                end
            end
        end

        Wait(sleepThread)
    end
end)

Weed.Init = function(Object)
    local player = PlayerPedId();
    TaskTurnPedToFaceEntity(player, Object)
    ClearPedTasks(player)
    SetCurrentPedWeapon(player, GetHashKey('WEAPON_UNARMED'), true)

    Wait(500)

    exports['eyrp_tools']:PlayScenario({
        Ped = player,
        Scenario = 'WORLD_HUMAN_GARDENER_PLANT'
    })

    exports['eyrp_progressbar']:StartProgress('Skördar...', math.random(10000, 20000), '#ad1400', function()
        ClearPedTasks(player)
        self.CachedPlant[Object] = true

        CreateModelSwap(GetEntityCoords(Object), 0.001, GetEntityModel(Object), GetHashKey('bkr_prop_weed_01_small_01c'))

        exports['eyrp_inventory']:addInventoryItem({
            item = 'cannabis',
            message = true,
            data = {
                amount = math.random(5, 10)
            }
        })
    end)
end

Weed.Teleport = function(State)
    local player = PlayerPedId()

    if State then
        DoScreenFadeOut(500)
        Wait(500)
        SetEntityCoords(player, Config.Weed.Outside.Coords)
        SetEntityHeading(player, Config.Weed.Outside.Heading)
        Wait(500)
        DoScreenFadeIn(1000)
        self.InWeed = false
    else
        DoScreenFadeOut(500)
        Wait(500)
        SetEntityCoords(player, Config.Weed.Inside.Coords)
        SetEntityHeading(player, Config.Weed.Inside.Heading)
        Wait(500)
        DoScreenFadeIn(1000)
        self.InWeed = true
    end
end