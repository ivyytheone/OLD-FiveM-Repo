Camera = {}

Camera.Init = function(CameraProp)
    local Player = PlayerPedId()

    if IsEntityPlayingAnim(Player, 'amb@world_human_paparazzi@male@base', 'base', 3) or DoesEntityExist(CameraProp) or IsEntityAttached(CameraProp) then
        Camera.Create(CameraProp)
    end
end

Camera.Create = function(CameraProp)
    local Player = PlayerPedId()
    Hud = false

    if DoesCamExist(Camera.Cam) then 
        Camera.DestroyCam(Camera.Cam) 
    else

        Camera.Scaleform = RequestScaleformMovie('HELI_CAM');

        while not HasScaleformMovieLoaded(Camera.Scaleform) do Citizen.Wait(10) end;

        Camera.Cam = CreateCam("DEFAULT_SCRIPTED_CAMERA", true)
        SetCamActive(Camera.Cam, true)
        RenderScriptCams(true, true, 1000, true, false)
        AttachCamToEntity(Camera.Cam, CameraProp, 0.09, -0.4, 0.0, true)
        SetCamRot(Camera.Cam, 0.0, 0.0, GetEntityHeading(Player))
        SetTimecycleModifier("heliGunCam")
        SetTimecycleModifierStrength(0.3)

        while IsCamActive(Camera.Cam) do
            local Player, sleepThread = PlayerPedId(), 250
            sleepThread = 7;

            local RightAxisX = GetDisabledControlNormal(0, 220);
            local RightAxisY = GetDisabledControlNormal(0, 221);
            local Rotation = GetCamRot(Camera.Cam, 2);
    
            if RightAxisX ~= 0.0 or RightAxisY ~= 0.0 then
                local NewZ = Rotation.z+RightAxisX*-1.0*5;
                local NewX = math.max(math.min(20.0, Rotation.x + RightAxisY*-1.0*5), -89.5);
    
                SetCamRot(Camera.Cam, NewX, 0.0, NewZ, 2);
                SetEntityHeading(Player, NewZ)
            end

            ESX.ShowHelpNotification('~INPUT_CELLPHONE_SELECT~ - Ta kort\n~INPUT_CELLPHONE_CANCEL~ - Avbryt')

                 local camFov = GetCamFov(Camera.Cam)

                 if IsControlJustReleased(0, 15) then 
                     SetCamFov(Camera.Cam, camFov + 5.0)
                 end

                 if IsControlJustReleased(0, 14) then 
                     SetCamFov(Camera.Cam, camFov - 5.0)
                 end

            if IsDisabledControlJustReleased(0, 176) and IsCamActive(Camera.Cam) then
                PlaySoundFrontend(-1, "Camera_Shoot", "Phone_Soundset_Franklin", false)
                Camera.Flash(GetPlayerServerId(PlayerId()))
                Camera.UploadImage()
            end


            if IsControlJustReleased(0, 177) then
                Camera.DestroyCam(Camera.Cam)
                DeleteEntity(CameraProp)
                SetEntityAsNoLongerNeeded(CameraProp)
                SetScaleformMovieAsNoLongerNeeded(Camera.Scaleform)
                ClearPedTasks(Player)
            end

            Citizen.Wait(sleepThread)
        end

    end
end

Camera.DestroyCam = function(Camera)
    SetCamActive(Camera, false)
    RenderScriptCams(false, false, 0, 1, 0);
    DestroyCam(Camera) 
    ClearTimecycleModifier()
end

Camera.UploadImage =  function()
    exports['screenshot-basic']:requestScreenshotUpload('https://discord.com/api/webhooks/860579832344477736/GsMuJJ4AjmMbVnZnVAqeH_mE2peUD1YKrJsSwxRsbN1L7VOHICxy26d5PbaAT4ajWeuz', 'files[]', {
        encoding = 'png',
        resolution = { 1920, 1080 }
    }, function(data)
        local resp = json.decode(data);

        TriggerServerEvent('eyrp_core:UploadImage', resp.attachments[1].proxy_url)
    end)
end

Camera.Flash = function(Player)
    TriggerServerEvent('eyrp:syncCamera', Player)
end

RegisterNetEvent('eyrp_camera:Start')
AddEventHandler('eyrp_camera:Start', function(Camera)
    Camera.Init(Camera)
end)

RegisterNetEvent('eyrp:cameraFlash')
AddEventHandler('eyrp:cameraFlash', function(targetPed)
     local thePed = GetPlayerPed(GetPlayerFromServerId(targetPed))

     local Ptfx = {
         Dict = 'scr_bike_business',
         Lib = 'scr_bike_cfid_camera_flash',
         Wait = '200'
     }

     Utils.LoadPtfx(Ptfx.Dict)
     SetPtfxAssetNextCall(Ptfx.Dict)
     particle = StartParticleFxLoopedOnEntity(Ptfx.Lib, thePed, 0.0, 0.7, 0.57, 1065353216, 0, 0, 0, 1065353216, 1065353216, 1065353216, 0)
     Citizen.Wait(Ptfx.Wait)
     StopParticleFxLooped(particle, true)
end)

BigCamera = {}

BigCamera.Init = function(Prop)
    local Player = PlayerPedId()

    if IsEntityPlayingAnim(Player, 'missfinale_c2mcs_1', 'fin_c2_mcs_1_camman', 3) or DoesEntityExist(Prop) or IsEntityAttached(Prop) then
        BigCamera.Create(Prop)
    end
end

BigCamera.Create = function(Prop)

    if DoesCamExist(BigCamera.Cam) then
        BigCamera.DestroyCam(BigCamera.Cam)
        DeleteEntity(Prop)
        ClearPedTasks(PlayerPedId())
    else
     BigCamera.Cam = CreateCam("DEFAULT_SCRIPTED_CAMERA", true)
     SetCamActive(BigCamera.Cam, true)
     RenderScriptCams(true, true, 1000, true, false)
     StopCamShaking(BigCamera.Cam, true)
     AttachCamToEntity(BigCamera.Cam, Prop, 0.29, 0.0, 0.0, true)
     SetCamRot(BigCamera.Cam, 0.0, 0.0, GetEntityHeading(PlayerPedId()))
     SetTimecycleModifier("heliGunCam")
     SetTimecycleModifierStrength(0.3)

         while IsCamActive(BigCamera.Cam) do
            
            local RightAxisX = GetDisabledControlNormal(0, 220);
            local RightAxisY = GetDisabledControlNormal(0, 221);
            local Rotation = GetCamRot(BigCamera.Cam, 2);
    
            if RightAxisX ~= 0.0 or RightAxisY ~= 0.0 then
                local NewZ = Rotation.z+RightAxisX*-1.0*5;
                local NewX = math.max(math.min(20.0, Rotation.x + RightAxisY*-1.0*5), -89.5);
    
                SetCamRot(BigCamera.Cam, NewX, 0.0, NewZ, 2);
                SetEntityHeading(PlayerPedId(), NewZ)
            end

             local camFov = GetCamFov(BigCamera.Cam)

             if IsControlJustReleased(0, 15) then 
                 SetCamFov(BigCamera.Cam, camFov + 5.0)
             end

             if IsControlJustReleased(0, 14) then 
                 SetCamFov(BigCamera.Cam, camFov - 5.0)
             end


             if IsControlJustReleased(0, 177) then
                BigCamera.DestroyCam(BigCamera.Cam)
                DeleteEntity(Prop)
                ClearPedTasks(PlayerPedId())
                SetEntityAsNoLongerNeeded(Prop)
            end

             Citizen.Wait(7)
         end
    end
end

BigCamera.DestroyCam = function(Camera)
    SetCamActive(Camera, false)
    RenderScriptCams(false, false, 0, 1, 0);
    DestroyCam(Camera) 
    ClearTimecycleModifier()
end