Actions = {}; 

RegisterCommand('test', function()
    Actions.Walk()
end)

Actions.StartPlanceCutScene = function()
    -- local Player = PlayerPedId()
    -- TriggerEvent('chat:clear')
    -- TriggerEvent('eyrp_intro:Cutscene')
    -- Citizen.Wait(21000)
    -- Actions.StartNui()
    -- Citizen.Wait(9000)
    -- DoScreenFadeOut(3000)
    -- Citizen.Wait(3000)
    -- StopCutsceneImmediately()
    -- DeletePedClone()
    Actions.Walk()
end

Actions.Walk = function()
    local Player = PlayerPedId()
    Actions.CreateCamera()
    SetEntityCoords(Player, vector3(-1045.135009765625, -2750.3798828125, 21.36342430114746))
    SetEntityHeading(Player, 328.3738098144531)
    DoScreenFadeIn(1000)
    TaskGoToCoordAnyMeans(Player, vector3(-1035.1336669921875, -2733.47607421875, 20.16929054260254), 1.0)
    Citizen.Wait(8000)
    ClearTimecycleModifier()
    Actions.DestroyCamera()
    
    TriggerServerEvent('eyrp_intro:AddStartingLoadout', source)
    PlaySoundFrontend(-1, "BASE_JUMP_PASSED", "HUD_AWARDS", 1)
end

RegisterCommand('lowkey', function()
    PlaySoundFrontend(-1, 'BACK', 'HUD_AMMO_SHOP_SOUNDSET', false)
end)

Actions.CreateCamera = function()
    if not DoesCamExist(Cam) then
        Cam = CreateCam('DEFAULT_SCRIPTED_CAMERA', true)
        SetCamActive(Cam, true)
        RenderScriptCams(true, false, 2500, true, false)
        SetCamCoord(Cam, -1048.1954345703125, -2743.92138671875, 21.35937690734863)
        PointCamAtEntity(Cam, PlayerPedId())
    end
end

Actions.DestroyCamera = function()
    SetCamActive(Cam, false)
    RenderScriptCams(false, true, 4000, true, false)
    DestroyCam(Cam, true)
end

Actions.StartNui = function()
    SendNUIMessage({
        display = true
    })
    PlaySoundFrontend(-1, "BASE_JUMP_PASSED", "HUD_AWARDS", 1)

    Citizen.Wait(5000)

    SendNUIMessage({
        display = false
    })
end

exports('StartIntro', Actions.Walk)