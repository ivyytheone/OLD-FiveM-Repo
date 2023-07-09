Utils = {};

Utils.OpenMenu = function()
    local menuElements = {
        { 
            label = "Hämta ut Polisbricka", 
            event = "policecard"
        }, 
        { 
            label = "Hämta ut Passerkort", 
            event = "Key"
        }, 
    }
    ESX.UI.Menu.Open('default', GetCurrentResourceName(), "options",
    {
        title = 'Daniel',
        align = "top-right",
        elements = menuElements
    }, function(data, menu)
        local Action = data.current.event 

        if Action then
            menu.close()
            Utils.HandleAction(Action, data, menu)
        end

    end, function(data, menu)
        menu.close() 
    end)
end

Utils.HandleAction = function(Index, data, menu)

    if Index == 'policecard' then
        Funcs.PoliceCard()
    end

    if Index == 'Key' then
        Funcs.GiveKey()
    end
end

Utils.Input= function(TextEntry, ExampleText, MaxStringLenght)
    AddTextEntry('FMMC_KEY_TIP1', TextEntry) 
    DisplayOnscreenKeyboard(1, "FMMC_KEY_TIP1", "", ExampleText, "", "", "", MaxStringLenght) 

    while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do
        RemoveAllPedWeapons(PlayerPedId());
        
        Citizen.Wait(100)
    end
        
    if UpdateOnscreenKeyboard() ~= 2 then
        local Result = GetOnscreenKeyboardResult()
        Citizen.Wait(500)
        return Result
    else
        Citizen.Wait(500)
        return false 
    end
end

RegisterCommand('deleteped', function()
    local Ped, Distance = ESX.Game.GetClosestPed(Config.Coords)

    DeletePed(Ped)
end)

Utils.PlayAnimation = function(Prop)
    local Ped, Distance = ESX.Game.GetClosestPed(Config.Coords)

    ClearPedTasks(Ped)

    exports['eyrp_core']:LoadAnimDict('mp_cop_armoury')

    TaskPlayAnim(Ped, 'mp_cop_armoury', 'ammo_on_counter_cop', 2.0, -1.0, 1.0, 0, 0, 0, 0, 0)

    exports['eyrp_core']:LoadModel(Prop)
    Prop = CreateObject(GetHashKey(Prop), GetEntityCoords(Ped), 1, 1, 1)

    AttachEntityToEntity(Prop, Ped, GetPedBoneIndex(Ped, 60309), -0.01, 0.00, 0.037, 20.0, -420.0, 180.0, true, true, false, true, 1, true)
    
    TaskPlayAnim(PlayerPedId(), 'mp_cop_armoury', 'ammo_on_counter', 2.0, -1.0, 1.0, 0, 0, 0, 0, 0)

    ClearPedTasks(Ped)
    ClearPedTasks(PlayerPedId())

    Citizen.Wait(8000)

    DeleteEntity(Prop)
    SetModelAsNoLongerNeeded(Prop)

    TaskPlayAnim(Ped, Animation.Dict, Animation.Lib, 2.0, -1.0, 1.0, 49, 0, 0, 0, 0)
end