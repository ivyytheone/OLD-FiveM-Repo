local ESX	 = nil
local open = false
local cam  = nil

Citizen.CreateThread(function()
    while ESX == nil do
        Citizen.Wait(1);

        ESX = exports["es_extended"]:getSharedObject()  
    end 

    if ESX.IsPlayerLoaded() then
        ESX.PlayerData = ESX.GetPlayerData()
    end
end)


RegisterNetEvent('eyrp_register:open')
AddEventHandler('eyrp_register:open', function()
	if not DoesCamExist(cam) then
		cam = CreateCam('DEFAULT_SCRIPTED_CAMERA', true)
	end

	SetCamActive(cam,  true)
	RenderScriptCams(true,  false,  0,  true,  true)
	SetCamCoord(cam, -288.92544555664, -2443.6701660156, 591.98687744141)
	PointCamAtCoord(cam, -169.18321228027, -1056.4204101563, 129.99223327637)

	--SetEntityCollision(GetPlayerPed(-1),  false,  false)
	SetEntityVisible(GetPlayerPed(-1),  false)
	FreezeEntityPosition(GetPlayerPed(-1), true);

	SetNuiFocus(true, true)
	open = true

	SendNUIMessage({
		action = "open"
	})
end)


RegisterNUICallback('register', function(data, cb)
	ESX.TriggerServerCallback('eyrp_register:register', function(success)
		if success then
			SetNuiFocus(false, false)
			open = false

			SendNUIMessage({
				action = "close"
			})

			DoScreenFadeOut(1000)
			Citizen.Wait(1000)
			SetCamActive(cam,  false)
			RenderScriptCams(false,  false,  0,  true,  true)
			--SetEntityCollision(GetPlayerPed(-1),  true,  true)
			SetEntityVisible(GetPlayerPed(-1),  true)
			FreezeEntityPosition(GetPlayerPed(-1), false)
			--SetEntityCoords(GetPlayerPed(-1), -235.42385864258, -2002.8851318359, 23.685377120972)
			TriggerEvent('eyrp_charcreation:createCharacter')
			DoScreenFadeIn(1000)
			Citizen.Wait(1000)
		end
	end, data)
end)


Citizen.CreateThread(function()
    while true do
		Citizen.Wait(0)
      		if open then
	      DisableControlAction(0, 1, true) -- LookLeftRight
	      DisableControlAction(0, 2, true) -- LookUpDown
	      DisableControlAction(0, 24, true) -- Attack
	      DisablePlayerFiring(GetPlayerPed(-1), true) -- Disable weapon firing
	      DisableControlAction(0, 142, true) -- MeleeAttackAlternate
	      DisableControlAction(0, 106, true) -- VehicleMouseControlOverride
      end
    end
end)
