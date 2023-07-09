GlobalFunction = function(event, data)
	local options = {
		event = event,
		data = data
	}

	TriggerServerEvent("q-vangelico:globalEvent", options)
end

Initialize = function()
	ESX.TriggerServerCallback("q-vangelico:fetchTrays", function(trays)
		Heap.SmashedTrays = trays or {}

		if table.count(Heap.SmashedTrays) > 0 then
			ToggleAlarm(true)
		end
	end)
end

SmashTray = function(trayIndex)
	if Heap.SmashedTrays[tostring(trayIndex)] then return end

	if Heap.Smashing then return end

	Heap.Smashing = true

	ESX.TriggerServerCallback("q-vangelico:fetchPolicemen", function(enough)
		if enough or Config.EnableDebug then
			local trayData = Config.Trays[trayIndex]

			local inPlace = GotoPlace(Heap.Ped, trayData.SceneLocation, 0.1, -1, trayData.SceneRotation.z, 0.5)

			if not inPlace then Heap.Smashing = false return end
			if Heap.SmashedTrays[tostring(trayIndex)] then return end

			if table.count(Heap.SmashedTrays) <= 0 and not IsAlarmPlaying("JEWEL_STORE_HEIST_ALARMS") then
				GlobalFunction("START_ALARM")
			end

			GlobalFunction("SMASH_TRAY", {
				Tray = trayIndex,
				Net = PedToNet(Heap.Ped),
				Animation = trayData.Animation
			})

			LoadModels({
				"missheist_jewel",
				GetHashKey("prop_gas_grenade")
			})

			RequestScriptAudioBank("SCRIPT\\JWL_HA_RAID_STORE", 0, -1)
			RequestScriptAudioBank("SCRIPT\\JWL_HEIST_RAID_GLASS_SMASH", 0, -1)
			StartAudioScene("JSH_2B_CABINET_SMASH")

			TaskPlayAnimAdvanced(Heap.Ped, "missheist_jewel", trayData.Animation, trayData.SceneLocation + vector3(0.0, 0.0, 0.985), trayData.SceneRotation, 1000.0, -4.0, -1, 1, 11000.0)

			Citizen.Wait(50)

			local animSpeed = Config.AnimSpeeds[trayData.Animation]

			local flipped = false; local fakeObject

			while true do
				Citizen.Wait(0)

				if not IsEntityPlayingAnim(Heap.Ped, "missheist_jewel", trayData.Animation, 3) then
					Heap.Smashing = false

					DeleteEntity(fakeObject)

					ESX.ShowNotification("You canceled the thing, and therefore you didn't receive your reward.")

					return
				end

				if GetEntityAnimCurrentTime(Heap.Ped, "missheist_jewel", trayData.Animation) >= animSpeed and not flipped then
					flipped = true

					if DoesObjectOfTypeExistAtCoords(trayData.Location, 2.0, GetHashKey("p_int_jewel_mirror"), 0) then
						local mirror = GetClosestObjectOfType(trayData.Location, 2.0, GetHashKey("p_int_jewel_mirror"))

						fakeObject = CreateObject(GetHashKey("prop_gas_grenade"), GetEntityCoords(mirror), true, true, false)

						SetEntityVisible(fakeObject, false, 0)
						ApplyForceToEntity(fakeObject, 0, 0.0, 0.0, 0.1, vector3(0.0, 0.0, 0.0), 0, 1, 1, 0, 0, 1)
					end
				end

				if GetEntityAnimCurrentTime(Heap.Ped, "missheist_jewel", trayData.Animation) >= 0.9 then
					break
				end
			end

			TriggerServerEvent("q-vangelico:giveReward")

			DeleteEntity(fakeObject)

			ClearPedTasks(Heap.Ped)
		else
			ESX.ShowNotification("There is nothing to steal at this time. (Not enough policemen).")
		end

		Heap.Smashing = false
	end)
end

ToggleAlarm = function(toggle)
	if toggle then
		while not PrepareAlarm("JEWEL_STORE_HEIST_ALARMS") do
			Citizen.Wait(0)
		end

		StartAlarm("JEWEL_STORE_HEIST_ALARMS", 0)
	else
		StopAlarm("JEWEL_STORE_HEIST_ALARMS", true)
	end
end

DrawButtons = function(buttonsToDraw)
	local instructionScaleform = RequestScaleformMovie("instructional_buttons")

	while not HasScaleformMovieLoaded(instructionScaleform) do
		Wait(0)
	end

	PushScaleformMovieFunction(instructionScaleform, "CLEAR_ALL")
	PushScaleformMovieFunction(instructionScaleform, "TOGGLE_MOUSE_BUTTONS")
	PushScaleformMovieFunctionParameterBool(0)
	PopScaleformMovieFunctionVoid()

	for buttonIndex, buttonValues in ipairs(buttonsToDraw) do
		PushScaleformMovieFunction(instructionScaleform, "SET_DATA_SLOT")
		PushScaleformMovieFunctionParameterInt(buttonIndex - 1)

		PushScaleformMovieMethodParameterButtonName(buttonValues["button"])
		PushScaleformMovieFunctionParameterString(buttonValues.label)
		PopScaleformMovieFunctionVoid()
	end

	PushScaleformMovieFunction(instructionScaleform, "DRAW_INSTRUCTIONAL_BUTTONS")
	PushScaleformMovieFunctionParameterInt(-1)
	PopScaleformMovieFunctionVoid()
	DrawScaleformMovieFullscreen(instructionScaleform, 255, 255, 255, 255)
end

DrawBusySpinner = function(text)
    SetLoadingPromptTextEntry("STRING")
    AddTextComponentSubstringPlayerName(text)
    ShowLoadingPrompt(3)
end

PlayAnimation = function(ped, dict, anim, settings)
	if dict then
        RequestAnimDict(dict)

        while not HasAnimDictLoaded(dict) do
            Citizen.Wait(0)
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
	else
		TaskStartScenarioInPlace(ped, anim, 0, true)
	end
end

LoadModels = function(models)
	for _, model in ipairs(models) do
		if IsModelValid(model) then
			while not HasModelLoaded(model) do
				RequestModel(model)
	
				Citizen.Wait(10)
			end
		else
			while not HasAnimDictLoaded(model) do
				RequestAnimDict(model)
	
				Citizen.Wait(10)
			end    
		end
	end
end

CleanupModels = function(models)
	for _, model in ipairs(models) do
		if IsModelValid(model) then
			SetModelAsNoLongerNeeded(model)
		else
			RemoveAnimDict(model)  
		end
	end
end

DrawScriptMarker = function(markerData)
	DrawMarker(markerData["type"] or 1, markerData["pos"] or vector3(0.0, 0.0, 0.0), 0.0, 0.0, 0.0, (markerData["type"] == 6 and -90.0 or markerData["rotate"] and -180.0) or 0.0, 0.0, 0.0, markerData["size"] or vector3(1.0, 1.0, 1.0), markerData["color"] or vector3(255, 255, 255), markerData["opacity"] or 100, markerData["bob"] and true or false, true, 2, false, false, false, false)
end

DrawScriptText = function(coords, text)
	local _, _x, _y = World3dToScreen2d(coords.x, coords.y, coords.z)

	SetTextScale(0.35, 0.35)
	SetTextFont(4)
	SetTextProportional(1)
	SetTextColour(255, 255, 255, 215)
	SetTextEntry("STRING")
	SetTextCentre(1)
	AddTextComponentString(text)
	DrawText(_x, _y)

	local factor = (string.len(text)) / 370

	DrawRect(_x, _y + 0.0125, 0.015 + factor, 0.03, 41, 11, 41, 68)
end

CreateScriptBlip = function(blipData)
	local createdBlip = AddBlipForCoord(blipData.Location)

	SetBlipSprite(createdBlip, blipData.Sprite or 1)
	SetBlipScale(createdBlip, blipData.Scale or 0.5)
	SetBlipColour(createdBlip, blipData.Colour or 1)
	SetBlipAsShortRange(createdBlip, blipData.ShortRange == nil and true or blipData.ShortRange)
	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString(blipData.Label or "Blip")
	EndTextCommandSetBlipName(createdBlip)

	return createdBlip
end

DrawDebugLine = function(pos1, pos2, color)
	if not Config.EnableDebug then return end

	DrawLine(pos1, pos2, color)
end

OpenInput = function(label, type)
	AddTextEntry(type, label)

	DisplayOnscreenKeyboard(1, type, "", "", "", "", "", 30)

	while UpdateOnscreenKeyboard() == 0 do
		DisableAllControlActions(0)
		Wait(0)
	end

	if GetOnscreenKeyboardResult() then
	  	return GetOnscreenKeyboardResult()
	end
end

ModifyVehicle = function(vehicle, r, g, b)
	SetVehicleCustomPrimaryColour(vehicle, r, g, b)
	SetVehicleCustomSecondaryColour(vehicle, r, g, b)
	SetVehicleModKit(vehicle, 0)
	SetVehicleMod(vehicle, 0, GetNumVehicleMods(vehicle, 0) - 1, false)
	SetVehicleMod(vehicle, 1, GetNumVehicleMods(vehicle, 1) - 1, false)
	SetVehicleMod(vehicle, 2, GetNumVehicleMods(vehicle, 2) - 1, false)
	SetVehicleMod(vehicle, 3, GetNumVehicleMods(vehicle, 3) - 1, false)
	SetVehicleMod(vehicle, 4, GetNumVehicleMods(vehicle, 4) - 1, false)
	SetVehicleMod(vehicle, 5, GetNumVehicleMods(vehicle, 5) - 1, false)
	SetVehicleMod(vehicle, 6, GetNumVehicleMods(vehicle, 6) - 1, false)
	SetVehicleMod(vehicle, 7, GetNumVehicleMods(vehicle, 7) - 1, false)
	SetVehicleMod(vehicle, 8, GetNumVehicleMods(vehicle, 8) - 1, false)
	SetVehicleMod(vehicle, 9, GetNumVehicleMods(vehicle, 9) - 1, false)
	SetVehicleMod(vehicle, 10, GetNumVehicleMods(vehicle, 10) - 1, false)
	SetVehicleMod(vehicle, 11, GetNumVehicleMods(vehicle, 11) - 1, false)
	SetVehicleMod(vehicle, 12, GetNumVehicleMods(vehicle, 12) - 1, false)
	SetVehicleMod(vehicle, 13, GetNumVehicleMods(vehicle, 13) - 1, false)
	SetVehicleMod(vehicle, 14, 16, false)
	SetVehicleMod(vehicle, 15, GetNumVehicleMods(vehicle, 15) - 2, false)
	SetVehicleMod(vehicle, 16, GetNumVehicleMods(vehicle, 16) - 1, false)
	ToggleVehicleMod(vehicle, 17, true)
	ToggleVehicleMod(vehicle, 18, true)
	ToggleVehicleMod(vehicle, 19, true)
	ToggleVehicleMod(vehicle, 20, true)
	ToggleVehicleMod(vehicle, 21, true)
	ToggleVehicleMod(vehicle, 22, true)
	SetVehicleMod(vehicle, 23, 1, false)
	SetVehicleMod(vehicle, 24, 1, false)
	SetVehicleMod(vehicle, 25, GetNumVehicleMods(vehicle, 25) - 1, false)
	SetVehicleMod(vehicle, 27, GetNumVehicleMods(vehicle, 27) - 1, false)
	SetVehicleMod(vehicle, 28, GetNumVehicleMods(vehicle, 28) - 1, false)
	SetVehicleMod(vehicle, 30, GetNumVehicleMods(vehicle, 30) - 1, false)
	SetVehicleMod(vehicle, 33, GetNumVehicleMods(vehicle, 33) - 1, false)
	SetVehicleMod(vehicle, 34, GetNumVehicleMods(vehicle, 34) - 1, false)
	SetVehicleMod(vehicle, 35, GetNumVehicleMods(vehicle, 35) - 1, false)
	SetVehicleMod(vehicle, 38, GetNumVehicleMods(vehicle, 38) - 1, true)
	SetVehicleTyreSmokeColor(vehicle, 0, 0, 127)
end

FadeOut = function(duration)
	DoScreenFadeOut(duration)

	while not IsScreenFadedOut() do
		Citizen.Wait(0)
	end
end

FadeIn = function(duration)
	DoScreenFadeIn(duration)

	while not IsScreenFadedIn() do
		Citizen.Wait(0)
	end
end

DrawMissionText = function(InfoText)
	local InfoTextWidth = GetTextWidth(InfoText, 0, 0.4)

	SetTextFont(0)
	SetTextProportional(0)
	SetTextScale(0.4, 0.4)
	SetTextColour(255, 255, 255, 255)
	SetTextDropShadow(0, 0, 0, 0,255)
	SetTextEdge(1, 0, 0, 0, 255)
	SetTextEntry("STRING")
	AddTextComponentString(InfoText)
	DrawRect(0.5, 0.915, InfoTextWidth + 0.01, 0.04, 10, 10, 10, 100)
	DrawText(0.5 - InfoTextWidth / 2, 0.9)
end

GetTextWidth = function(text, font, scale)
	SetTextEntryForWidth("STRING")
	AddTextComponentSubstringPlayerName(text)
	SetTextFont(font)
	SetTextScale(scale, scale)

	return EndTextCommandGetWidth(true)
end

GotoPlace = function(ped, coords, speed, timeout, heading, distanceToSlide)
	TaskGoStraightToCoord(ped, coords.x, coords.y, coords.z, speed, timeout, heading, distanceToSlide)

	while GetScriptTaskStatus(ped, 0x7d8f4411) ~= 7 do

		if ped == PlayerPedId() then
			if IsControlJustPressed(0, 32) then
				ClearPedTasks(ped) return false
			end

			if IsControlJustPressed(0, 33) then
				ClearPedTasks(ped) return false
			end

			if IsControlJustPressed(0, 34) then
				ClearPedTasks(ped) return false
			end

			if IsControlJustPressed(0, 35) then
				ClearPedTasks(ped) return false
			end
		end

		Citizen.Wait(0)
	end

	return true
end
