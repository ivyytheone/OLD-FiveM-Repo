Funcs = {}; 

Funcs.LoadAnimDict = function(dict)
    while not HasAnimDictLoaded(dict) do
        RequestAnimDict(dict)
        Wait(100)
    end
end

Funcs.BlinkLights = function(Vehicle)
    SetVehicleLights(Vehicle, 2)
    Citizen.Wait(200)
    SetVehicleLights(Vehicle, 1)
    Citizen.Wait(200)
    SetVehicleLights(Vehicle, 2)
    Citizen.Wait(200)
    SetVehicleLights(Vehicle, 1)

    SetVehicleLightsMode(Vehicle, 0)
    SetVehicleLights(Vehicle, 0)
end

Funcs.PlayAnim = function()

    local Player = PlayerPedId()

    Animation = {
        Dict = 'anim@mp_player_intmenu@key_fob@',
        Lib = 'fob_click_fp',
        Prop = 'itap_bilnyckel'
    }

    exports['eyrp_core']:LoadModel(Animation.Prop)

    CarKey = CreateObject(GetHashKey(Animation.Prop), GetEntityCoords(Player), 1, 1, 1)
    AttachEntityToEntity(CarKey, Player, GetPedBoneIndex(Player, 57005), 0.11, 0.03, -0.03, 210.0, 190.0, 0.0, true, true, false, true, 1, true)

    exports['eyrp_core']:PlayAnimation({
        Dict = Animation.Dict,
        Lib = Animation.Lib
    })

    Citizen.Wait(800)
    ClearPedTasks(Player)
    DeleteEntity(CarKey)
end 