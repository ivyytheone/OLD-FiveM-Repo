ESX = false

Heap = {
	SmashedTrays = {}
}

Citizen.CreateThread(function()
	while not ESX do
		ESX = exports["es_extended"]:getSharedObject()

		Citizen.Wait(0)
	end
end)

Citizen.CreateThread(function()
	Citizen.Wait(500)

	while true do
		local sleepThread = 5000

		local ped = PlayerPedId()
		
		if ped ~= Heap.Ped then
			Heap.Ped = ped
		end

		Citizen.Wait(sleepThread)
	end
end)

Robbing = false

Citizen.CreateThread(function()
	while true do
		local sleepThread = 500

		local ped = Heap.Ped
		local pedCoords = GetEntityCoords(ped)

		local insideInterior = GetInteriorFromEntity(ped) == 82690

		if insideInterior and Config.NeedsToShootBeforeStart then
			if not IsAlarmPlaying("JEWEL_STORE_HEIST_ALARMS") then
				sleepThread = 5

				if IsPedShooting(ped) then 
					Robbing = true 
					
					GlobalFunction("START_ALARM")
					GlobalFunction("ALERT_POLICE")
				end
			end
		end

		for trayIndex, trayData in ipairs(Config.Trays) do
			local dstCheck = #(trayData.SceneLocation - pedCoords)

			local _, currentWeapon = GetCurrentPedWeapon(ped)

			if dstCheck <= 20.0 and (Config.NeedsToShootBeforeStart and IsAlarmPlaying("JEWEL_STORE_HEIST_ALARMS") or not Config.NeedsToShootBeforeStart) then
				sleepThread = 5

				local usable = not Heap.SmashedTrays[tostring(trayIndex)]

				local hasWeapon = false

				for _, weaponHash in ipairs(Config.WeaponsNeeded) do
					if weaponHash == currentWeapon then
						hasWeapon = true

						break
					end
				end

				if not usable and not Heap.Smashing then
					local object = GetRayfireMapObject(trayData.Location, 1.0, trayData.Ray)

					if GetStateOfRayfireMapObject(object) < 6 then
						SetStateOfRayfireMapObject(object, 4)
						SetStateOfRayfireMapObject(object, 6)
					end
				end

				DrawScriptMarker({
					type = 20,
					rotate = true,
					pos = trayData.SceneLocation + vector3(0.0, 0.0, 0.6),
					color = vector3(usable and 0 or 255, usable and 255 or 0, 0),
					size = vector3(0.1, 0.1, 0.1),
					bob = true
				})

				if dstCheck <= 1.5 then
					if usable then
						if hasWeapon then
							ESX.ShowHelpNotification("Tryck ~INPUT_CONTEXT~ för att slå sönder glaset.")

							if IsControlJustPressed(0, 38) then
								SmashTray(trayIndex)
							end
						else
							ESX.ShowHelpNotification("Du saknar de rätta vapnerna för att slå sönder glaset")
						end
					end
				end
			end
		end

		for _, usableData in ipairs(Config.Interactables) do
			local dstCheck = #(usableData.Location - pedCoords)

			if dstCheck <= usableData.Distance and ESX.PlayerData and ESX.PlayerData.job and ESX.PlayerData.job.name == usableData.Job then
				sleepThread = 5

				if IsControlJustPressed(0, 38) then
					usableData.Callback()
				end

				ESX.ShowHelpNotification(usableData.Text)
			end
		end

		Citizen.Wait(sleepThread)
	end
end)