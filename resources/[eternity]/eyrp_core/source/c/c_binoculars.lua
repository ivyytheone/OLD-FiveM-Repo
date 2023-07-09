BINOCULARS = {};

BINOCULARS.OpenBinocular = function()
    if BINOCULARS.Using then
        BINOCULARS.CloseBinocular();
        return
    end

    BINOCULARS.Using = true;

    if not IsPedInAnyVehicle(PlayerPedId(), false) then
        Utils.PlayScenario('WORLD_HUMAN_BINOCULARS')
    end

    BINOCULARS.Vehicle = GetVehiclePedIsIn(PlayerPedId(), false) or nil; 

    SetTimecycleModifier('default');
    SetTimecycleModifierStrength(0.3);

    BINOCULARS.Scaleform = RequestScaleformMovie('BINOCULARS');

    while not HasScaleformMovieLoaded(BINOCULARS.Scaleform) do
        Citizen.Wait(10)
    end;

    BINOCULARS.Cam = CreateCam('DEFAULT_SCRIPTED_CAMERA', true);
    BINOCULARS.Fov = (150.0+-15.0)*0.5;

    AttachCamToEntity(BINOCULARS.Cam, PlayerPedId(), 0.0, 0.4, 0.8, true);
    SetCamRot(BINOCULARS.Cam, 0.0, 0.0, GetEntityHeading(PlayerPedId()));
    SetCamFov(BINOCULARS.Cam, BINOCULARS.Fov);
    RenderScriptCams(true, false, 0, 1, 0);

    PushScaleformMovieFunction(BINOCULARS.Scaleform, 'SET_CAM_LOGO')
    PushScaleformMovieFunctionParameterInt(0)
    PopScaleformMovieFunctionVoid()

    while BINOCULARS.Using do
        local Player = PlayerPedId();

        if IsControlJustReleased(0, 177) then
            BINOCULARS.CloseBinocular()
        end

        local RightAxisX = GetDisabledControlNormal(0, 220);
        local RightAxisY = GetDisabledControlNormal(0, 221);
        local Rotation = GetCamRot(BINOCULARS.Cam, 2);

        if RightAxisX ~= 0.0 or RightAxisY ~= 0.0 then
            local NewZ = Rotation.z+RightAxisX*-1.0*5;
            local NewX = math.max(math.min(20.0, Rotation.x + RightAxisY*-1.0*5), -89.5);

            SetCamRot(BINOCULARS.Cam, NewX, 0.0, NewZ, 2);
            SetEntityHeading(Player, NewZ)
        end

        if IsControlJustPressed(0, 241) then
            BINOCULARS.Fov = math.max(BINOCULARS.Fov - 10.0, -15.0)
        elseif IsControlJustPressed(0, 242) then
            BINOCULARS.Fov = math.min(BINOCULARS.Fov + 10.0, 150.0)
        end

        if math.abs(BINOCULARS.Fov - GetCamFov(BINOCULARS.Cam)) < 0.1 then
            BINOCULARS.Fov = GetCamFov(BINOCULARS.Cam)
        end

        if BINOCULARS.Fov ~= GetCamFov(BINOCULARS.Cam) then
            SetCamFov(BINOCULARS.Cam, GetCamFov(BINOCULARS.Cam) + (BINOCULARS.Fov - GetCamFov(BINOCULARS.Cam)) * 0.5)
        end

        DrawScaleformMovieFullscreen(BINOCULARS.Scaleform, 255, 255, 255, 255);

        if IsEntityDead(Player) or not IsPedUsingScenario(Player, 'WORLD_HUMAN_BINOCULARS' or DoesEntityExist(BINOCULARS.Vehicle) and (not GetVehiclePedIsIn(Player, false) == BINOCULARS.Vehicle)) then
            BINOCULARS.CloseBinocular()
        end
        
        Citizen.Wait(0)
    end
end

BINOCULARS.CloseBinocular = function()
    BINOCULARS.Using = false;

    ClearPedTasks(PlayerPedId());

    ClearTimecycleModifier();

    RenderScriptCams(false, false, 0, 1, 0);
    DestroyCam(BINOCULARS.Cam, false);

    SetScaleformMovieAsNoLongerNeeded(BINOCULARS.Scaleform);
end

RegisterNetEvent('eyrp_binoculars')
AddEventHandler('eyrp_binoculars', function(Data)
    BINOCULARS.OpenBinocular()
end)