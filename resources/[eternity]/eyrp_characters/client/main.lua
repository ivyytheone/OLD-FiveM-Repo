ESX = nil

Characters = {}

Citizen.CreateThread(function()
    while ESX == nil do
        Citizen.Wait(200)
        TriggerEvent('esx:getSharedObject', function (obj) ESX = obj end)
    end
end)
Citizen.CreateThread(function()
    Citizen.Wait(7)
    if NetworkIsSessionStarted() then
        Citizen.Wait(100)
        TriggerServerEvent("esx_kashacters:SetupCharacters")
        TriggerEvent("esx_kashacters:SetupCharacters")
    end
end)

local IsChoosing = true
Citizen.CreateThread(function ()
    while true do
        Citizen.Wait(0)
        if IsChoosing then
            DisplayHud(false)
            DisplayRadar(false)
        end
    end
end)
local cam = nil
local cam2 = nil
RegisterNetEvent('esx_kashacters:SetupCharacters')
AddEventHandler('esx_kashacters:SetupCharacters', function()
    DoScreenFadeOut(10)
    while not IsScreenFadedOut() do
        Citizen.Wait(10)
    end
    SetTimecycleModifier('hud_def_blur')
    FreezeEntityPosition(GetPlayerPed(-1), true)
    InitialSetup()
end)

RegisterNetEvent('esx_kashacters:SetupUI')
AddEventHandler('esx_kashacters:SetupUI', function(Characters)
    DoScreenFadeIn(500)
    Citizen.Wait(500)
    ToggleSound(true)
    SetNuiFocus(true, true)
    SendNUIMessage({
        action = "openui",
        characters = Characters,
    })
end)

RegisterNetEvent('esx_kashacters:SpawnCharacter')
AddEventHandler('esx_kashacters:SpawnCharacter', function()
    TriggerServerEvent('es:firstJoinProper')
    TriggerEvent('es:allowedToSpawn')
    SetTimecycleModifier('default')
    ShouldSwitchIn = true
    IsChoosing = false
end)

RegisterNetEvent('esx_kashacters:SpawnCharacter2')
AddEventHandler('esx_kashacters:SpawnCharacter2', function(spawn, location)
    TriggerServerEvent('es:firstJoinProper')
    TriggerEvent('es:allowedToSpawn')
    SetTimecycleModifier('default')
    Citizen.Wait(3000)
    FreezeEntityPosition(PlayerPedId(), true)
    SetEntityCoordsNoOffset(GetPlayerPed(-1), spawn.x, spawn.y, spawn.z - 10, false, false, false, true)

    DoScreenFadeIn(500)
    Citizen.Wait(500)
    DestroyAllCams(true)
    Citizen.Wait(500)
    ShouldSwitchIn = true
    Citizen.Wait(500)
    SetEntityCoordsNoOffset(GetPlayerPed(-1), spawn.x, spawn.y, spawn.z, false, false, false, true)
    RequestCollisionAtCoord(spawn.x, spawn.y, spawn.z)
    FreezeEntityPosition(PlayerPedId(), false)
    IsChoosing = false
    DisplayHud(true)
    DisplayRadar(true)
end)

function ToggleSound(state)
    if state then
        StartAudioScene("MP_LEADERBOARD_SCENE");
    else
        StopAudioScene("MP_LEADERBOARD_SCENE");
    end
end

RegisterNetEvent('esx_kashacters:ReloadCharacters')
AddEventHandler('esx_kashacters:ReloadCharacters', function()
    TriggerServerEvent("esx_kashacters:SetupCharacters")
    TriggerEvent("esx_kashacters:SetupCharacters")
end) 

--RegisterCommand('startmenu', function() 
--    TriggerEvent('skinchanger:getSkin', function(skin)
--        TriggerServerEvent('esx_skin:save', skin)
--    end)

--    TriggerEvent('esx_kashacters:ReloadCharacters')
--end)

RegisterNUICallback("CharacterChosen", function(data, cb)
    SetNuiFocus(false,false)
    DoScreenFadeOut(500)
    TriggerServerEvent('esx_kashacters:CharacterChosen', data.charid, data.ischar, data.location)
    while not IsScreenFadedOut() do
        Citizen.Wait(10)
    end
    cb("ok")
end)

RegisterNUICallback("DeleteCharacter", function(data, cb)
    SetNuiFocus(false,false)
    DoScreenFadeOut(500)
    TriggerServerEvent('esx_kashacters:DeleteCharacter', data.charid)
    while not IsScreenFadedOut() do
        Citizen.Wait(10)
    end
    cb("ok")
end)

RegisterNUICallback("createCharacter", function(Data) 
    SetNuiFocus(false, false) 
    
    ESX.TriggerServerCallback("esx_kashacters:createCharacters", function(Response) 
        if Response then  
            TriggerEvent('esx_kashacters:SpawnCharacter')
        else
            print("Du har inte anget alla elements.")
        end
    end, Data)
end)

-- set the opacity of the clouds
local cloudOpacity = 0.01 -- (default: 0.01)

-- setting this to false will NOT mute the sound as soon as the game loads 
-- (you will hear background noises while on the loading screen, so not recommended)
local muteSound = true -- (default: true)


function ToggleSound(state)
    if state then
        StartAudioScene("MP_LEADERBOARD_SCENE");
    else
        StopAudioScene("MP_LEADERBOARD_SCENE");
    end
end
 
-- Runs the initial setup whenever the script is loaded.
function InitialSetup()
    -- Stopping the loading screen from automatically being dismissed.
    --SetManualShutdownLoadingScreenNui(true)
    -- Disable sound (if configured)
    ToggleSound(muteSound)
    -- Switch out the player if it isn't already in a switch state.
    if not IsPlayerSwitchInProgress() then
        SwitchOutPlayer(PlayerPedId(), 0, 1)
    end
end
 
 
-- Hide radar & HUD, set cloud opacity, and use a hacky way of removing third party resource HUD elements.
function ClearScreen()
    SetCloudHatOpacity(cloudOpacity)
    HideHudAndRadarThisFrame()
   
    -- nice hack to 'hide' HUD elements from other resources/scripts. kinda buggy though.
    SetDrawOrigin(0.0, 0.0, 0.0, 0)
end
 
-- Sometimes this gets called too early, but sometimes it's perfectly timed,
-- we need this to be as early as possible, without it being TOO early, it's a gamble!
--InitialSetup()
 
 
Citizen.CreateThread(function()
 
    -- In case it was called too early before, call it again just in case.
  --  InitialSetup()
   
    -- Wait for the switch cam to be in the sky in the 'waiting' state (5).
    while GetPlayerSwitchState() ~= 5 do
        Citizen.Wait(0)
        ClearScreen()
    end
   
    -- Shut down the game's loading screen (this is NOT the NUI loading screen).
    ShutdownLoadingScreen()
   
    ClearScreen()
    Citizen.Wait(0)
    DoScreenFadeOut(0)
   
    -- Shut down the NUI loading screen.
    ShutdownLoadingScreenNui()
   
    ClearScreen()
    Citizen.Wait(0)
    ClearScreen()
    DoScreenFadeIn(500)
    while not IsScreenFadedIn() do
        Citizen.Wait(0)
        ClearScreen()
    end
   
    local timer = GetGameTimer()

    while not ShouldSwitchIn do
        Wait(100)
    end
   
    -- Re-enable the sound in case it was muted.
    ToggleSound(false)
   
    while true do
        ClearScreen()
        Citizen.Wait(0)
       
        -- wait 5 seconds before starting the switch to the player
        if GetGameTimer() - timer > 5000 then
           
            -- Switch to the player.
            SwitchInPlayer(PlayerPedId())
           
            ClearScreen()
           
            -- Wait for the player switch to be completed (state 12).
            while GetPlayerSwitchState() ~= 12 do
                Citizen.Wait(0)
                ClearScreen()
            end
            -- Stop the infinite loop.
            break
        end
    end
   
    -- Reset the draw origin, just in case (allowing HUD elements to re-appear correctly)
    ClearDrawOrigin()
end)