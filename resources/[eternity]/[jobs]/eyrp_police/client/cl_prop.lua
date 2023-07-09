Props = {}

Props.List = {
    prop_barrier_work05 = { 
        ['Index'] = 28422,
        ['X'] = 0.0,
        ['Y'] = -0.08,
        ['Z'] = -1.0,
        ['XR'] = -180.0,
        ['YR'] = -180.0,
        ['ZR'] = 0.0,
        ['Dict'] = 'anim@heists@box_carry@',
        ['Lib'] = 'idle'
    },

    p_ld_stinger_s = { 
        ['Index'] = 28422,
        ['X'] = 0.0,
        ['Y'] = -0.08,
        ['Z'] = -0.1,
        ['XR'] = -180.0,
        ['YR'] = -120.0,
        ['ZR'] = 85.0,
        ['Dict'] = 'anim@heists@box_carry@',
        ['Lib'] = 'idle'
    }
}

Props.OpenMenu = function()
    local mElements = {
		{
			label = "Barriär",
			action = "prop_barrier_work05"
		},   
        {
			label = "Spikmatta",
			action = "p_ld_stinger_s"
		},  
	} 

    ESX.UI.Menu.Open("default", GetCurrentResourceName(), "props", {
		["title"] = "Ta fram objekt",
		["align"] = Config.Align,
		["elements"] = mElements 
	}, function(data, menu) 
        local Event = data.current.action

        if Event then
            Props.Use(Event)
        end
		
    end, function(data, menu) 
		menu.close() 
    end)
end

Props.Use = function(Name)
    local Player = PlayerPedId()
    local Options = Props.List[Name]

    if IsPedDeadOrDying(Player) or not IsPedOnFoot(Player) then return end

    if IsEntityPlayingAnim(Player, Options.Dict, Options.Lib, 3) then
        exports['eyrp_notify']:LoadNotification('Släpp det du har i händerna först', 'error', true)
        return
    end

    exports['eyrp_core']:LoadModel(Name)

    local Coords = GetOffsetFromEntityInWorldCoords(Player, 0.0, 0.6, 0.0);

    Funcs.SpawnObject(Name, GetEntityCoords(Player), function(Object)
        
        ClearPedTasks(Player)
        RemoveAllPedWeapons(Player, true)
        AttachEntityToEntity(Object, Player, GetPedBoneIndex(Player, Options.Index), Options.X, Options.Y, Options.Z, Options.XR, Options.YR, Options.ZR, 1, 1, 0, true, 2, 1)

        exports['eyrp_core']:PlayAnimation({
            Dict = Options.Dict,
            Lib = Options.Lib
        })

        while true do
            local sleepThread = 250;

            if DoesEntityExist(Object) and IsEntityAttached(Object) then
                sleepThread = 7
                Funcs.DrawTxt(0.9, 1.4, 1.0, 1.0, 0.3, '[~r~G~s~] - Avbryt / [~g~E~s~] - Släpp', 255, 255, 255, 255)

                if IsControlJustReleased(0, 38) then
                    DetachEntity(Object)
                    ClearPedTasks(Player)
                end

                if IsControlJustReleased(0, 47) then
                    if DoesEntityExist(Object) and IsEntityAttached(Object) then
                        DeleteEntity(Object)
                        SetModelAsNoLongerNeeded(Object)
                        ClearPedTasks(Player)
                    end
                end
            end

            if DoesEntityExist(Object) and IsEntityAttached(Object) and not IsEntityPlayingAnim(Player, Options.Dict, Options.Lib, 3) then
                exports['eyrp_core']:PlayAnimation({
                    Dict = Options.Dict,
                    Lib = Options.Lib
                })
            end

            Citizen.Wait(sleepThread)
        end
    end)

end

Citizen.CreateThread(function()
    Citizen.Wait(100)

    while true do
        local Player, sleepThread = PlayerPedId(), 250

        for index, value in pairs(Props.List) do

            local ClosestProp = GetClosestObjectOfType(GetEntityCoords(Player), 2.0, GetHashKey(index), false, false, false)

            local TextCoords = {
                x = GetEntityCoords(ClosestProp).x,
                y = GetEntityCoords(ClosestProp).y,
                z = GetEntityCoords(ClosestProp).z + 1
            }

            local Distance = #(GetEntityCoords(Player) - GetEntityCoords(ClosestProp))

            if Distance <= 2.0 and not IsEntityAttached(ClosestProp) and not IsPedDeadOrDying(Player) and IsPedOnFoot(Player) then
                sleepThread = 7;

                exports['eyrp_core']:DrawText3D(TextCoords, '[~o~E~s~] - Plocka upp')

                if IsControlJustReleased(0, 38) then
                    TriggerServerEvent('eyrp_police:DeleteEntity', NetworkGetNetworkIdFromEntity(ClosestProp))
                    Props.Use(index)
                end
            end
        end

        Citizen.Wait(sleepThread)
    end
end)

RegisterNetEvent('eyrp_police:DeleteEntity', function(netId)
    local object = NetworkGetEntityFromNetworkId(netId)

    DeleteEntity(object)
    DeleteObject(object)
    SetEntityAsNoLongerNeeded(object)
end)