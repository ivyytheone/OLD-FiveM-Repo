LoadModel = function(model)
    if not IsModelValid(model) then return print('message from ' .. GetInvokingResource() or GetCurrentResourceName() .. ' ' .. model .. ' is not a valid model!') end

    RequestModel(model)
    RequestCollisionForModel(model)

    while not HasModelLoaded(model) or not HasCollisionForModelLoaded(model) do
        Wait(10)
    end

    SetModelAsNoLongerNeeded(model)
end

LoadAnimDict = function(Dict)
    if not DoesAnimDictExist(Dict) then return print('message from ' .. GetInvokingResource() or GetCurrentResourceName() .. ' ' .. Dict .. ' is not a valid animation dictionary') end

    RequestAnimDict(Dict)

    while not HasAnimDictLoaded(Dict) do
        Wait(10)
    end
end

LoadPtfx = function(asset)
    RequestNamedPtfxAsset(asset)

    while not HasNamedPtfxAssetLoaded(asset) do
        Wait(10)
    end
end

PlayAnimation = function(Data)
    if not IsEntityPlayingAnim(Data.Ped, Data.Dict, Data.Lib, 3) then
        if not Data.Flag then Data.Flag = 49 end

        LoadAnimDict(Data.Dict)
        TaskPlayAnim(Data.Ped, Data.Dict, Data.Lib, 2.0, -1.0, -1, Data.Flag, 0, 0, 0, 0)
    end
end

LoadAnimSet = function(Set)
    RequestAnimSet(Set)

    while not HasAnimSetLoaded(Set) do
        Wait(10)
    end
end

LoadScaleForm = function(Movie)
    local ScaleForm = RequestScaleformMovie(Movie)

    while not HasScaleformMovieLoaded(ScaleForm) do
        Wait(10)
    end

    return ScaleForm
end

PlayScenario = function(Data)
    if IsPedUsingAnyScenario(Data.Ped) then 
        ClearPedTasks(Data.Ped)
    end
    TaskStartScenarioInPlace(Data.Ped, Data.Scenario, 0, true)
end

LoadCollision = function(Coords, Entity)
    RequestCollisionAtCoord(Coords)

    while not HasCollisionLoadedAroundEntity(Entity) do
        Wait(10)
    end
end

SpawnVehicle = function(Data, Callback)
    local Model = (type(Data.Model) == 'number' and Data.Model or GetHashKey(Data.Model))

    if not IsModelAVehicle(Model) then return print('Meddelande från ' .. GetInvokingResource() .. ' - ' .. Data.Model .. ' är inte ett fordon!') end

    CreateThread(function()
        LoadModel(Model)

        Vehicle = CreateVehicle(Model, Data.Coords, - vector4(0, 0, 0.98, 0), true, false)
        VehicleId = NetworkGetNetworkIdFromEntity(Vehicle)

        SetNetworkIdCanMigrate(VehicleId, true)
        SetEntityAsMissionEntity(Vehicle, true, false)
        SetVehicleHasBeenOwnedByPlayer(Vehicle, true)
        SetVehicleNeedsToBeHotwired(Vehicle, false)
        SetVehRadioStation(Vehicle, 'OFF')

        LoadCollision(Data.Coords, Vehicle)

        if Callback ~= nil then
            Callback(Vehicle)
        end
    end)
end

SpawnObject = function(Data, Callback)
    local Model = (type(Data.Model) == 'number' and Data.Model or GetHashKey(Data.Model))

    CreateThread(function()
        LoadModel(Model)

        Object = CreateObject(Model, Data.Coords, true, false, true)

        SetNetworkIdExistsOnAllMachines(NetworkGetNetworkIdFromEntity(Object), true)
        SetNetworkIdCanMigrate(NetworkGetNetworkIdFromEntity(Object), true)

        if Callback ~= nil then
            Callback(Object)
        end
    end)
end

SpawnPed = function(Data, Callback)
    local Model = (type(Data.Model) == 'number' and Data.Model or GetHashKey(Data.Model))

    if not IsModelAPed(Model or GetHashKey(Model)) then return print('Meddelande från ' .. GetInvokingResource() .. ' - ' .. Data.Model .. ' är inte en ped!') end
    LoadModel(Model)

    Ped = CreatePed(5, Model, Data.Coords, - vector4(0, 0, 0.98, 0), true, false)

    if Callback ~= nil then
        Callback(Ped)
    end
end

DrawText3D = function(Coords, Text)
    local onScreen, _x, _y = World3dToScreen2d(Coords.x, Coords.y, Coords.z)
    
    SetTextScale(0.38, 0.38)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 200)
    SetTextEntry("STRING")
    SetTextCentre(1)

    AddTextComponentString(Text)
    DrawText(_x, _y)

    local factor = string.len(Text) / 370
    DrawRect(_x, _y + 0.0125, 0.015 + factor, 0.03, 41, 11, 41, 68)
end

DrawText2D = function(x, y, scale, text)
    SetTextFont(0)
    SetTextProportional(0)
    SetTextScale(scale, scale)
    SetTextColour(255,255,255,255)
    SetTextDropShadow(0,0,0,0,255)
    SetTextEdge(2, 0, 0, 0, 255)
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(x, y)

    local factor = string.len(text) / 100
    DrawRect(x, y + 0.015, factor / 2.2, 0.05, 20, 90, 114, 100)
end

Createinput = function(TextEntry, ExampleText, MaxStringLenght)
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

ShowMessage = function(Title, Message, Time)
    local Scaleform = LoadScaleForm('MP_BIG_MESSAGE_FREEMODE')

    BeginScaleformMovieMethod(Scaleform, 'SHOW_SHARD_WASTED_MP_MESSAGE')
    PushScaleformMovieMethodParameterString(Title)
    PushScaleformMovieMethodParameterString(Message)
    EndScaleformMovieMethod()
    PlaySoundFrontend(-1, "BASE_JUMP_PASSED", "HUD_AWARDS", 1)

    while Time > 0 do
        Wait(1)

        Time = Time - 0.01

        DrawScaleformMovieFullscreen(Scaleform, 255, 255, 255, 255)
    end

    SetScaleformMovieAsNoLongerNeeded(Scaleform)
end

RegisterChangableKey = function(Type, Description, Key, Callback)
    RegisterKeyMapping(Type, Description or "Ny key", "keyboard", Key)
    
    RegisterCommand(Type, Callback)
end