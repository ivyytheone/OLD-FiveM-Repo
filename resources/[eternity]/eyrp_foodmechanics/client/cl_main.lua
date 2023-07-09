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

    Model = nil

    while true do
        local player, sleepThread = PlayerPedId(), 500;

        for foodMachine, foodIndex in pairs(Config.Machines) do
            
            local object = GetClosestObjectOfType(GetEntityCoords(player), 1.0, GetHashKey(foodMachine))

            displayCoords = {
                x = GetEntityCoords(object).x + Config.Alignments[foodMachine].x,
                y = GetEntityCoords(object).y + Config.Alignments[foodMachine].y,
                z = GetEntityCoords(object).z + Config.Alignments[foodMachine].z
            }

            if DoesEntityExist(object) then
                local distance = #(GetEntityCoords(player) - vector3(displayCoords.x, displayCoords.y, displayCoords.z))

                if distance <= 1.0 and not IsPedDeadOrDying(player) and IsPedOnFoot(player) and not IsEntityPlayingAnim(player, 'mini@sprunk','plyr_buy_drink_pt1', 3) and not DoesEntityExist(ThisObj) then
                    sleepThread = 7;

                    exports['eyrp_tools']:DrawText3D(displayCoords, '[~g~E~s~] - Automat')

                    if IsControlJustReleased(0, 38) then
                        OpenMenu(foodIndex)
                    end
                end
            end
        end
        Wait(sleepThread)
    end
end)

OpenMenu = function(Index)
        ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'foodMachine', {
        title = "Automat", 
        align = "top-right", 
        elements = Config.Elemets[Index]
    }, function(data, menu) 
        local value = data.current.item 

        if value then
            if Utils.GetPlayerMoney(data.current.price) then
                PlayAnimation(data.current.prop)
                TriggerServerEvent('eyrp_foodmechanics:removeMoney', data.current.price) 

                exports['eyrp_inventory']:addInventoryItem({
                    item = value,
                    message = true,
                    data = {}
                })

            else
                ESX.ShowNotification('Du har inte tillräckligt med pengar', 'error')
            end
        end
    end, function(data, menu)
        menu.close()
    end)
end

PlayAnimation = function(Prop)
    local player = PlayerPedId();

    if DoesEntityExist(ThisObj) or IsEntityAttached(ThisObj) or IsEntityPlayingAnim(PlayerPedId(), 'mini@sprunk', 'plyr_buy_drink_pt1', 3) then
        ESX.ShowNotification('Vänta lite...')
        return
    end

    RequestAmbientAudioBank("VENDING_MACHINE")
    HintAmbientAudioBank("VENDING_MACHINE", 0, -1)

    SetPedCurrentWeaponVisible(player, false, true, 1, 0)

    exports['eyrp_tools']:PlayAnimation({
        Ped = player,
        Dict = 'mini@sprunk',
        Lib = 'plyr_buy_drink_pt1',
        Flag = 1
    })

    Wait(3400)
    
    ReleaseAmbientAudioBank()

    exports['eyrp_tools']:SpawnObject({
        Model = Prop,
        Coords = GetEntityCoords(player)
    }, function(Object)
        ThisObj = Object

        AttachEntityToEntity(Object, player, GetPedBoneIndex(player, 18905), 0.12, 0.001, 0.020, 288.0, 105.0, 0.0, true, true, false, true, 1, true)

        Wait(400)
        ClearPedTasks(player)

        Wait(700)
        DeleteEntity(Object)
        SetEntityAsNoLongerNeeded(Object)
    end)

end