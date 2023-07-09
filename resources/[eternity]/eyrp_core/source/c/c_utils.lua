Utils, sleepThread = {}, 10;

Utils.LoadAnimDict = function(dict)
    while not HasAnimDictLoaded(dict) do
        RequestAnimDict(dict)
        Citizen.Wait(sleepThread)
    end
end

Utils.Trim = function(s)
    return string.gsub(s, "%s+", "")
end

Utils.LoadPtfx = function(asset)
    while not HasNamedPtfxAssetLoaded(asset) do
        RequestNamedPtfxAsset(asset)
        Citizen.Wait(sleepThread)
    end
end

Utils.LoadAnimSet = function(set)
    while not HasAnimSetLoaded(set) do
        RequestAnimSet(set)
        Citizen.Wait(sleepThread)
    end
end

Utils.LoadCutScene = function(scene)
    while not HasCutsceneLoaded(scene) do
        RequestCutscene(scene)
        Citizen.Wait(sleepThread)
    end
end

Utils.LoadScaleForm = function(scaleForm) 
    while not HasScaleformMovieLoaded(scaleForm) do
        RequestScaleformMovie(scaleForm)
        Citizen.Wait(sleepThread)
    end
end

Utils.LoadModel = function(model)
    while not HasModelLoaded(model) do
        RequestModel(model)
        Citizen.Wait(sleepThread)
    end
end

Utils.PlayAnimation = function(AnimData)
    Utils.LoadAnimDict(AnimData['Dict'])
    TaskPlayAnim(PlayerPedId(), AnimData['Dict'], AnimData['Lib'], 2.0, -1.0, -1, 49, 0, 0, 0, 0)
end

Utils.PlayScenario = function(scenario)
    if not IsPedUsingScenario(PlayerPedId(), scenario) then
        TaskStartScenarioInPlace(PlayerPedId(), scenario, 0, true)
    end
end

Utils.PlayMovementClipSpeed = function(clip)
    Utils.LoadAnimSet(clip)
    SetPedMovementClipset(PlayerPedId(), clip, true)
end

Utils.DrawText3D = function(coords, text)
    local onScreen, _x, _y = World3dToScreen2d(coords.x, coords.y, coords.z)
    
    SetTextScale(0.38, 0.38)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 200)
    SetTextEntry("STRING")
    SetTextCentre(1)

    AddTextComponentString(text)
    DrawText(_x, _y)

    local factor = string.len(text) / 370
    DrawRect(_x, _y + 0.0125, 0.015 + factor, 0.03, 41, 11, 41, 68)
end


Utils.DrawAdvancedMarker = function(markerData)
    DrawMarker(
        markerData["type"] or 1, 
        markerData["pos"] or vector3(0.0, 0.0, 0.0), 0.0, 0.0, 0.0, (markerData["type"] == 6 and -90.0 or markerData["rotate"] and -180.0) or 0.0, 0.0, 0.0, 
        markerData["sizeX"] or 1.0, 
        markerData["sizeY"] or 1.0, 
        markerData["sizeZ"] or 1.0, 
        markerData["r"] or 1.0, 
        markerData["g"] or 1.0, 
        markerData["b"] or 1.0, 
        markerData["a"] or 100, false, true, 2, false, false, false, false)
end

exports('PlayMovementClipSpeed', Utils.PlayMovementClipSpeed)
exports('LoadAnimDict', Utils.LoadAnimDict)
exports('LoadPftx', Utils.LoadPtfx)
exports('LoadAnimSet', Utils.LoadAnimSet)
exports('LoadModel', Utils.LoadModel)
exports('LoadCutScene', Utils.LoadCutScene)
exports('LoadScaleForm', Utils.LoadScaleForm)
exports('PlayAnimation', Utils.PlayAnimation)
exports('PlayScenario', Utils.PlayScenario)
exports('DrawText3D', Utils.DrawText3D)
exports('DrawMarker', Utils.DrawAdvancedMarker)