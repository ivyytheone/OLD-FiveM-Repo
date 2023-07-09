Utils = {
    PlayAnimation = function(ped, dict, anim, settings)
        if dict then
            Citizen.CreateThread(function()
                RequestAnimDict(dict)
    
                while not HasAnimDictLoaded(dict) do
                    Citizen.Wait(100)
                end
    
                if settings == nil then
                    TaskPlayAnim(ped, dict, anim, 1.0, -1.0, 1.0, 0, 0, 0, 0, 0)
                else 
                    local speed = 1.0
                    local speedMultiplier = -1.0
                    local duration = 1.0
                    local flag = 0
                    local playbackRate = 0
    
                    if settings["speed"] then
                        speed = settings["speed"]
                    end
    
                    if settings["speedMultiplier"] then
                        speedMultiplier = settings["speedMultiplier"]
                    end
    
                    if settings["duration"] then
                        duration = settings["duration"]
                    end
    
                    if settings["flag"] then
                        flag = settings["flag"]
                    end
    
                    if settings["playbackRate"] then
                        playbackRate = settings["playbackRate"]
                    end
    
                    TaskPlayAnim(ped, dict, anim, speed, speedMultiplier, duration, flag, playbackRate, 0, 0, 0)
                end
    
                RemoveAnimDict(dict)
            end)
        else
            TaskStartScenarioInPlace(ped, anim, 0, true)
        end
    end,
    
    Draw3DText = function(Data)
        local onScreen, _x, _y = World3dToScreen2d(Data.coords.x, Data.coords.y, Data.coords.z) 
    
        SetTextScale(0.38, 0.38)
        SetTextFont(8)
        SetTextProportional(1)
        SetTextColour(255, 255, 255, 200)
        SetTextEntry("STRING")
        SetTextCentre(1)
    
        AddTextComponentString(Data.text)
        DrawText(_x, _y)
    end, 

    OpenDialogMenu = function(Data, callback)
        ESX.UI.Menu.CloseAll(); 
        ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'dialog-menu', {
            title = Data.title, 
        }, function(menuData, menuIndex)
            local currentValue = menuData.value 

            print(currentValue)

            if currentValue then 
                if callback ~= nil then
                    callback(currentValue)
                end
            end
        end, function(menuData, menuIndex)
            menuIndex.close()
        end) 
    end
}