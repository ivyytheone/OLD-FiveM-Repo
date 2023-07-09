self = {}
stuff = {
    cachedHouses = {},
    cachedLoot = {},
    alarm = {}
}
ESX = nil

Citizen.CreateThread(function()
	while not ESX do
		TriggerEvent("esx:getSharedObject", function(library) 
			ESX = library 
		end)
		Citizen.Wait(0)
    end
end)

RegisterNetEvent("esx:playerLoaded")
AddEventHandler("esx:playerLoaded", function(data)
	ESX.PlayerData = data
end)

RegisterNetEvent("esx:setJob")
AddEventHandler("esx:setJob", function(job)
	ESX.PlayerData["job"] = job
end)

RegisterNetEvent("eyrp_burglary:handleAction")
AddEventHandler("eyrp_burglary:handleAction", function(action, data)
    if action == "lock" then
        if not stuff.cachedHouses[data.houseId] then 
            stuff.cachedHouses[data.houseId] = {
                locked = true
            }
        end

        if data.lock then
            stuff.alarm[data.houseId] = false
        end

        stuff.cachedHouses[data.houseId].locked = data.lock
    elseif action == "loot" then
        if not stuff.cachedLoot[tostring(data.houseId)] then
            stuff.cachedLoot[tostring(data.houseId)] = {}
        end
        stuff.cachedLoot[tostring(data.houseId)][data.id] = true
    elseif action == "registerHouse" then
        if stuff.cachedHouses[data.houseId] then return end
        stuff.cachedHouses[data.houseId] = {
            locked = true
        }
    elseif action == "enter" then
        if stuff.cachedLoot[tostring(data.houseId)] then return end
        stuff.cachedLoot[tostring(data.houseId)] = {}
    elseif action == "alarm" then
        if self.house == data.houseId then
            Notification(Config.Strings["alarm_started"])
        end
        local streetname = GetStreetNameAtCoord(Config.Houses[data.houseId].doorPos, Citizen.ResultAsInteger(), Citizen.ResultAsInteger())
        if Config.GcPhone then
            TriggerServerEvent("esx_addons_gcphone:startCall", "police", Config.Strings["police_notif"]:format(GetStreetNameFromHashKey(streetname) .. " " .. GetLabelText(GetNameOfZone(Config.Houses[data.houseId].doorPos))), Config.Houses[data.houseId].doorPos, {
                PlayerCoords = Config.Houses[data.houseId].doorPos,
            })
        else 
            exports['eyrp_phone']:CreateAlarm({
                Coords = Config.Houses[data.houseId].doorPos,
                Title = 'Inbrott',
                Description = ("Ett inbrottslarm startade"),
                Priority = '1'
            })
        end

        stuff.alarm[data.houseId] = true
    elseif action == "playerconnected" then
        stuff = {
            cachedHouses = data.cachedHouses,
            cachedLoot = data.cachedLoot,
            alarm = data.alarm
        }
    end
end)

RegisterNetEvent("eyrp_burglary:lockpick")
AddEventHandler("eyrp_burglary:lockpick", function(house)
    StartLockpick(house)
end)

Citizen.CreateThread(function()
    
    while true do local sleep, player = 1000, PlayerPedId()
        for houseIndex, houseData in pairs(Config.Houses) do
            local dst = #(houseData.doorPos - GetEntityCoords(player))

            if not self.lockpicking and dst <= 5.0 then
                sleep = 5
                local text = Config.Strings["locked"]
                if not stuff.cachedHouses[houseIndex] then
                    HandleAction("registerHouse", { houseId = houseIndex })
                else
                    if not stuff.cachedHouses[houseIndex].locked then
                        text = Config.Strings["unlocked"]
                        if Config.CanPolicesLock then
                            if ESX.PlayerData["job"] and ESX.PlayerData["job"]["name"] == Config.PoliceJobName then
                                text = text .. "\n~w~" .. Config.Strings["police_lock"]
                            end
                        end
                    else
                        text = Config.Strings["locked"]
                    end
                end

                if dst <= 1.0 then
                    if IsControlJustReleased(0, 38) then
                        PlaySoundFrontend(-1, 'BACK', 'HUD_AMMO_SHOP_SOUNDSET', false)
                        if not stuff.cachedHouses[houseIndex].locked then
                            SetEntityCoords(player, Config.HouseTypes[houseData.housetype].entering - vector3(0, 0, 0.98))
                            EnterInstance(houseIndex)
                            self.house, self.type = houseIndex, houseData.housetype
                            HandleAction("enter", { houseId = houseIndex })
                        else
                            local target, distance = ESX.Game.GetClosestPlayer()

                            if distance ~= -1 and distance <= 2.0 then
                                if IsEntityPlayingAnim(target, Config.Animations["Lockpicking"].lib, Config.Animations["Lockpicking"].anim, 3) then
                                    Notification(Config.Strings["already_lockpicking"])
                                else
                                    HandleAction("lockpick", { houseId = houseIndex })
                                end
                            else
                                HandleAction("lockpick", { houseId = houseIndex })
                            end
                        end
                    elseif ESX.PlayerData["job"] and ESX.PlayerData["job"]["name"] == Config.PoliceJobName and Config.CanPolicesLock and IsControlJustReleased(0, Config.PoliceLockButton) then
                        PlaySoundFrontend(-1, 'BACK', 'HUD_AMMO_SHOP_SOUNDSET', false)
                        if not stuff.cachedHouses[houseIndex].locked then
                            Notification(Config.Strings["you_locked"])
                            HandleAction("lock", { houseId = houseIndex, lock = true })
                        end
                    end
                end

                DrawText3D(houseData.doorPos + vector3(0, 0, 0.4), text)
            end
            if stuff.alarm[houseIndex] then
                if dst <= 50.0 then
                    sleep = 5
                    PlaySoundFromCoord(-1, "scanner_alarm_os", houseData.doorPos, "dlc_xm_iaa_player_facility_sounds", 1, 0.1, 0)
                end
            end

            while self.house ~= nil do Wait(0)
                local dst, text = #(Config.HouseTypes[self.type].entering - GetEntityCoords(player)), Config.Strings["leave"]
                if dst <= 10.0 then
                    if dst <= 1.0 then
                        text = "[~g~E~w~] " .. text
                        if IsControlJustReleased(0, 38) then
                            if string.match(text, "[~g~E~w~]") then
                                PlaySoundFrontend(-1, 'BACK', 'HUD_AMMO_SHOP_SOUNDSET', false)
                                SetEntityCoords(player, Config.Houses[self.house].doorPos - vector3(0, 0, 0.98))
                                ExitInstance()
                                self.house, self.type = nil
                                break
                            end
                        end
                    end
                    DrawText3D(Config.HouseTypes[self.type].entering + vector3(0, 0, 0.4), text)
                end

                if dst > 99.0 then
                    ExitInstance()
                    self.house, self.type = nil
                    break
                end

                if stuff.alarm[self.house] then
                    PlaySoundFromCoord(-1, "scanner_alarm_os", Config.HouseTypes[self.type].entering, "dlc_xm_iaa_player_facility_sounds", 1, 0.1, 0)
                end

                for lootIndex, lootData in pairs(Config.HouseTypes[self.type].lootPlaces) do
                    local dst, text = #(lootData.coords - GetEntityCoords(player)), Config.Strings["search"]:format(lootData.label)
                    if not self.searching and dst <= 1.5 then
                        if dst <= 0.2 then
                            text = "[~g~E~w~] " .. text
                            if IsControlJustReleased(0, 38) then
                                local startSearch = function()
                                    HandleAction("loot", { houseId = self.house, id = lootIndex })
                                    self.searching, self.startTime = true, GetGameTimer()
                                    TaskStartScenarioAtPosition(player, Config.Animations["Searching"].scenario, lootData.coords, lootData.heading, -1, false, true)
                                    while self.searching do Wait(0)
                                        if stuff.alarm[self.house] then
                                            PlaySoundFromCoord(-1, "scanner_alarm_os", Config.HouseTypes[self.type].entering, "dlc_xm_iaa_player_facility_sounds", 1, 0.1, 0)
                                        end
                                        local timer = (GetGameTimer() - self.startTime) / Config.SearchTime * 100
                                        help(Config.Strings["searching"]:format(math.floor(timer)) .. "%") 
                                        if not IsPedUsingScenario(player, Config.Animations["Searching"].scenario) then
                                            Notification(Config.Strings["canceled"])
                                            self.searching = nil
                                        elseif timer >= 100 then
                                            self.searching = false
                                            ClearPedTasks(player)
                                            HandleAction("giveitem", { type = self.type })
                                        elseif IsControlJustReleased(0, 73) then
                                            ClearPedTasks(player)
                                        end
                                    end
                                end

                                if not stuff.cachedLoot[tostring(self.house)][lootIndex] then
                                    PlaySoundFrontend(-1, 'BACK', 'HUD_AMMO_SHOP_SOUNDSET', false)
                                    startSearch()
                                else
                                    Notification(Config.Strings["not_available"])
                                end
                            end
                        end
                        DrawText3D(lootData.coords + vector3(0, 0, 0.1), text)
                    end
                end

                if not Config.AlertPoliceImmediately then
                    if not stuff.alarm[self.house] then
                        if IsPedRunning(player) then
                            if math.random(1, 10000) > 9990 then
                                HandleAction("alarm", { houseId = self.house })
                            end
                        elseif IsPedJumping(player) then
                            if math.random(1, 10000) > 9990 then
                                HandleAction("alarm", { houseId = self.house })
                            end
                        elseif IsPedShooting(player) then
                            HandleAction("alarm", { houseId = self.house })                     
                        end
                    end
                end
            end
        end
        Citizen.Wait(sleep)
    end
end)

freezeddoor = false
CreateThread(function()
	while true do
		Wait(0)
		if not freezeddoor then
			freezeddoor = true
			local door = GetClosestObjectOfType(-14.86892, -1441.182, 18.58479, 2.0, GetHashKey('v_ilev_fa_frontdoor'), false, 0, 0)
			FreezeEntityPosition(door, true)
		end
	end
end)