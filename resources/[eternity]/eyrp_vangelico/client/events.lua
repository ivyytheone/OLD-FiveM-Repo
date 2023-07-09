RegisterNetEvent("esx:playerLoaded")
AddEventHandler("esx:playerLoaded", function(response)
    ESX.PlayerData = response

    Initialize()
end)

RegisterNetEvent("esx:setJob")
AddEventHandler("esx:setJob", function(response)
    ESX.PlayerData.job = response
end)

RegisterNetEvent("q-vangelico:eventHandler")
AddEventHandler("q-vangelico:eventHandler", function(event, eventData)
    Trace(event, json.encode(eventData))

    if event == "SMASH_TRAY" then
        local trayIndex = eventData.Tray

        Heap.SmashedTrays[tostring(trayIndex)] = true

        local trayData = Config.Trays[trayIndex]

        RequestNamedPtfxAsset("scr_jewelheist")

        while not HasNamedPtfxAssetLoaded("scr_jewelheist") do
            Citizen.Wait(0)
        end

        UseParticleFxAsset("scr_jewelheist")

        local object = GetRayfireMapObject(trayData.Location, 1.0, trayData.Ray)

        SetStateOfRayfireMapObject(object, 4)

        local ped = NetToPed(eventData.Net)

        while true do
            Citizen.Wait(0)

            local currentAnimTime = GetEntityAnimCurrentTime(ped, "missheist_jewel", eventData.Animation)

            if currentAnimTime > Config.AnimSpeeds[eventData.Animation] then
                for _ = 1, 3 do
                    PlaySoundFromCoord(-1, "Glass_Smash", trayData.SceneLocation, 0, 0, 0)
                end

                PlaySoundFromCoord(GetSoundId(), "SMASH_CABINET_PLAYER", trayData.SceneLocation, "JEWEL_HEIST_SOUNDS", 0, 0, 0)

                SetStateOfRayfireMapObject(object, 6)

                StartParticleFxNonLoopedOnEntity("scr_jewel_cab_smash", GetCurrentPedWeaponEntityIndex(ped), vector3(0.0, 0.0, 0.0), vector3(0.0, 0.0, 0.0), 1065353216, 0, 0, 0)

                break
            end
        end
    elseif event == "START_ALARM" then
        ToggleAlarm(true)
    elseif event == "STOP_ALARM" then
        ToggleAlarm(false)
    elseif event == "ALERT_POLICE" then
        if ESX.PlayerData and ESX.PlayerData.job and ESX.PlayerData.job.name == "police" then
            local blipHandle = AddBlipForCoord(Config.Interactables[1].Location)

            SetBlipScale(blipHandle, 1.0)
            SetBlipSprite(blipHandle, 161)
            SetBlipColour(blipHandle, 25)

            BeginTextCommandSetBlipName("STRING")
            AddTextComponentString("Jewelrobbery")
            EndTextCommandSetBlipName(blipHandle)

            ESX.ShowNotification("The alarm in the jewel store just started, get there fast!")

            SetTimeout(60000 * 2, function()
                RemoveBlip(blipHandle)
            end)
        end
    end
end)

RegisterNetEvent("q-vangelico:startAlarm")
AddEventHandler("q-vangelico:startAlarm", function()
    ToggleAlarm(true)

    GlobalFunction("ALERT_POLICE")
end)

AddEventHandler("onResourceStop", function(resource)
    if resource == GetCurrentResourceName() then
        ToggleAlarm(false)

        for _, trayData in ipairs(Config.Trays) do
            local object = GetRayfireMapObject(trayData.Location, 0.5, trayData.Ray)

            SetStateOfRayfireMapObject(object, 2)
        end
    end
end)