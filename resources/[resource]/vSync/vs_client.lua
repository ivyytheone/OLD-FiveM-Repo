CurrentWeather = 'EXTRASUNNY'
local lastWeather = CurrentWeather
local baseTime = 0
local timeOffset = 0
local timer = 0
local freezeTime = false
local blackout = false

RegisterNetEvent('vSync:updateWeather')
AddEventHandler('vSync:updateWeather', function(NewWeather, newblackout)
    CurrentWeather = NewWeather
    blackout = newblackout
end)

Citizen.CreateThread(function()
    while true do
        if lastWeather ~= CurrentWeather then
            lastWeather = CurrentWeather
            SetWeatherTypeOverTime(CurrentWeather, 15.0)
            Citizen.Wait(15000)
        end
        Citizen.Wait(100) -- Wait 0 seconds to prevent crashing.
        SetBlackout(blackout)
        ClearOverrideWeather()
        ClearWeatherTypePersist()
        SetWeatherTypePersist(lastWeather)
        SetWeatherTypeNow(lastWeather)
        SetWeatherTypeNowPersist(lastWeather)
        if lastWeather == 'XMAS' then
            SetForceVehicleTrails(true)
            SetForcePedFootstepsTracks(true)
        else
            SetForceVehicleTrails(false)
            SetForcePedFootstepsTracks(false)
        end
    end
end)



AddEventHandler('playerSpawned', function()
    TriggerServerEvent('vSync:requestSync')
end)

Citizen.CreateThread(function()
    TriggerEvent('chat:addSuggestion', '/weather', 'Byt väder.', {{ name="weatherType", help="Available types: extrasunny, clear, neutral, smog, foggy, overcast, clouds, clearing, rain, thunder, snow, blizzard, snowlight, xmas & halloween"}})
    TriggerEvent('chat:addSuggestion', '/freezeweather', 'Frys/Sluta frys vädret.')
end)

-- Display a notification above the minimap.
function ShowNotification(text, blink)
    if blink == nil then blink = false end
    SetNotificationTextEntry("STRING")
    AddTextComponentSubstringPlayerName(text)
    DrawNotification(blink, false)
end

RegisterNetEvent('vSync:notify')
AddEventHandler('vSync:notify', function(message, blink)
    ShowNotification(message, blink)
end)

local enableWeatherControl = false
-- Set this to true if you want this resource to set the weather to xmas for you.
-- DO NOT SET THIS TO TRUE IF YOU HAVE ANOTHER RESOURCE ALREADY MANAGING/SYNCING THE WEATHER FOR YOU.



-- No need to touch anything below.
Citizen.CreateThread(function()
    
    local showHelp = true
    local loaded = false
    
    while true do
        if enableWeatherControl then
            SetWeatherTypeNowPersist('XMAS')
        end
        Citizen.Wait(0) -- prevent crashing
        if IsNextWeatherType('XMAS') then -- check for xmas weather type
            -- enable frozen water effect (water isn't actually ice, just looks like there's an ice layer on top of the water)
            N_0xc54a08c85ae4d410(3.0)
            -- preview: https://vespura.com/hi/i/2eb901ad4b1.gif
            
            SetForceVehicleTrails(true)
            SetForcePedFootstepsTracks(true)
            
            if not loaded then
                RequestScriptAudioBank("ICE_FOOTSTEPS", false)
                RequestScriptAudioBank("SNOW_FOOTSTEPS", false)
                RequestNamedPtfxAsset("core_snow")
                while not HasNamedPtfxAssetLoaded("core_snow") do
                    Citizen.Wait(0)
                end
                UseParticleFxAssetNextCall("core_snow")
                loaded = true
            end
            RequestAnimDict('anim@mp_snowball') -- pre-load the animation
            if IsControlJustReleased(0, 344) and not IsPedInAnyVehicle(GetPlayerPed(-1), true) and not IsPlayerFreeAiming(PlayerId()) and not IsPedSwimming(PlayerPedId()) and not IsPedSwimmingUnderWater(PlayerPedId()) and not IsPedRagdoll(PlayerPedId()) and not IsPedFalling(PlayerPedId()) and not IsPedRunning(PlayerPedId()) and not IsPedSprinting(PlayerPedId()) and GetInteriorFromEntity(PlayerPedId()) == 0 and not IsPedShooting(PlayerPedId()) and not IsPedUsingAnyScenario(PlayerPedId()) and not IsPedInCover(PlayerPedId(), 0) then -- check if the snowball should be picked up
                TaskPlayAnim(PlayerPedId(), 'anim@mp_snowball', 'pickup_snowball', 8.0, -1, -1, 0, 1, 0, 0, 0) -- pickup the snowball
                Citizen.Wait(1950) -- wait 1.95 seconds to prevent spam clicking and getting a lot of snowballs without waiting for animatin to finish.
                GiveWeaponToPed(GetPlayerPed(-1), GetHashKey('WEAPON_SNOWBALL'), 2, false, true) -- get 2 snowballs each time.
            end
        else
            -- disable frozen water effect
            if loaded then N_0xc54a08c85ae4d410(0.0) end
            loaded = false
            RemoveNamedPtfxAsset("core_snow")
            ReleaseNamedScriptAudioBank("ICE_FOOTSTEPS")
            ReleaseNamedScriptAudioBank("SNOW_FOOTSTEPS")
            SetForceVehicleTrails(false)
            SetForcePedFootstepsTracks(false)
        end
        if GetSelectedPedWeapon(PlayerPedId()) == GetHashKey('WEAPON_SNOWBALL') then
            SetPlayerWeaponDamageModifier(PlayerId(), 0.0)
        end
    end
end)

