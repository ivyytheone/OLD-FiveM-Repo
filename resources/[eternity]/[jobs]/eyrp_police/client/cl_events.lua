ESX = nil

Citizen.CreateThread(function()
    while ESX == nil do
        Citizen.Wait(100);

        ESX = exports["es_extended"]:getSharedObject()  
    end 

    if ESX.IsPlayerLoaded() then
        ESX.PlayerData = ESX.GetPlayerData()
    end 
end)

RegisterNetEvent("eyrp_police:dragPlayer")
AddEventHandler("eyrp_police:dragPlayer", function(source)
	cachedData["isDragged"] = not cachedData["isDragged"]
	cachedData["drag-copId"] = source
	while true do
		local sleepThread, player = 200, PlayerPedId()

		if cachedData["isDragged"] then
			sleepThread = 5 

			targetPed = GetPlayerPed(GetPlayerFromServerId(cachedData["drag-copId"]))

			if not IsPedSittingInAnyVehicle(player) then

				AttachEntityToEntity(player, targetPed, 11816, 0.20, 0.58, 0.0, 0.0, 0.0, 0.0, false, false, false, false, 2, true) 
			else
				ClearPedTasks(targetPed)
				cachedData["isDragged"] = false
				DetachEntity(player, true, false) 
			end

			if IsPedDeadOrDying(targetPed, true) then
				cachedData["isDragged"] = false
				DetachEntity(player, true, false)
			end

		else
			ClearPedTasks(targetPed)
			DetachEntity(player, true, false)
			break
		end

		if IsEntityAttached(player) and GetEntitySpeed(targetPed) == 0.0 then
			exports['eyrp_tools']:PlayAnimation({
				Ped = player,
				Dict = 'mp_arresting',
				Lib = 'idle',
				Flag = 1
			})
		end

		if IsEntityAttached(player) and GetEntitySpeed(targetPed) >= 1.5 then
			exports['eyrp_tools']:PlayAnimation({
				Ped = player,
				Dict = 'mp_arresting',
				Lib = 'walk',
				Flag = 1
			})
		end

		Citizen.Wait(sleepThread)
	end
end)   

RegisterNetEvent('CloseInventory')
AddEventHandler('CloseInventory', function()
    if CurrentStorage then
        exports["eyrp_inventory"]:CloseUniqueTab(CurrentStorage);

        CurrentStorage = nil
    end
end)


RegisterNetEvent('eyrp_police:sendEfterlysning') 
AddEventHandler('eyrp_police:sendEfterlysning', function(text)  
    TriggerEvent('chat:addMessage', {
        template = '<div style="padding: 0.4vw; margin: 0.7vw; width: 50%; background-color: rgba(48, 180, 228, 0.6); border-radius: 3px;"><i class="fas fa-user-circle"></i>👮 <span style="font-weight: 700">Polisen Efterlysning</span><br>{0}</br></div>',
        args = { text }
    })
end) 

RegisterNetEvent('eyrp_police:sendPublic') 
AddEventHandler('eyrp_police:sendPublic', function(text)  
    TriggerEvent('chat:addMessage', {
        template = '<div style="padding: 0.4vw; margin: 0.7vw; width: 50%; background-color: rgba(48, 180, 228, 0.6); border-radius: 3px;"><i class="fas fa-user-circle"></i>👮 <span style="font-weight: 700">Polisen</span><br>{0}</br></div>',
        args = { text }
    })
end)
