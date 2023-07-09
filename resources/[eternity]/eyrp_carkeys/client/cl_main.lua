ESX = nil

Citizen.CreateThread(function()
    while ESX == nil do
        Citizen.Wait(10);

        ESX = exports["es_extended"]:getSharedObject()  
    end 

    if ESX.IsPlayerLoaded() then
        ESX.PlayerData = ESX.GetPlayerData()
    end 

end) 

RegisterNetEvent('eyrp_carkeys:Init')
AddEventHandler('eyrp_carkeys:Init', function(Data)

	local Player = PlayerPedId()
	local Vehicle = ESX.Game.GetClosestVehicle(GetEntityCoords(Player), false)

	local Distance = #(GetEntityCoords(Player) - GetEntityCoords(Vehicle))

	if Distance <= 4.0 and IsPedOnFoot(Player) then
		print(Data.Item['data'].plate)
		if ESX.Game.GetVehicleProperties(Vehicle).plate == Data.Item['data'].plate then
			if GetVehicleDoorLockStatus(Vehicle) == 1 then

				if IsPedOnFoot(Player) then
					Funcs.PlayAnim()
				end

				TriggerServerEvent('InteractSound_SV:PlayWithinDistance', 0.5, 'carlock', 0.3)
				Funcs.BlinkLights(Vehicle)

				SetVehicleDoorsLocked(Vehicle, 2)
				exports['eyrp_notify']:LoadNotification('Du låste en ~y~' .. Data.Item['data'].model, 'success')
			elseif GetVehicleDoorLockStatus(Vehicle) == 2 then
			
				if IsPedOnFoot(Player) then
					Funcs.PlayAnim()
				end

				TriggerServerEvent('InteractSound_SV:PlayWithinDistance', 0.5, 'carlock', 0.3)
				Funcs.BlinkLights(Vehicle)

				SetVehicleDoorsLocked(Vehicle, 1)
				exports['eyrp_notify']:LoadNotification('Du låste upp en ~y~' .. Data.Item['data'].model, 'success')
			end
		else
			exports['eyrp_notify']:LoadNotification('Ditt fordon är inte i närheten', 'error', true)
		end
	elseif IsPedInAnyVehicle(Player, true) then
		Vehicle = GetVehiclePedIsIn(Player, false)

		if GetVehicleDoorLockStatus(Vehicle) == 1 then

			TriggerServerEvent('InteractSound_SV:PlayWithinDistance', 0.5, 'carlock', 0.3)
			Funcs.BlinkLights(Vehicle)

			SetVehicleDoorsLocked(Vehicle, 2)
			exports['eyrp_notify']:LoadNotification('Du låste ~y~fordonet~s~ innifrån', 'success')

		elseif GetVehicleDoorLockStatus(Vehicle) == 2 then

			TriggerServerEvent('InteractSound_SV:PlayWithinDistance', 0.5, 'carlock', 0.3)
			Funcs.BlinkLights(Vehicle)

			SetVehicleDoorsLocked(Vehicle, 1)
			exports['eyrp_notify']:LoadNotification('Du låste upp ~y~fordonet~s~ innifrån', 'success')
		end
	else
		exports['eyrp_notify']:LoadNotification('Det finns inget fordon i närheten', 'error', true)
	end
end)

Carkeys = {};

Carkeys.FastBind = function()
	local Player = PlayerPedId()

	local Vehicle = ESX.Game.GetClosestVehicle(GetEntityCoords(Player), false)

	local Distance = #(GetEntityCoords(Player) - GetEntityCoords(Vehicle))

	if Distance <= 4.0 and IsPedOnFoot(Player) then
		if exports['eyrp_inventory']:HasSpecificItem({
			item = 'carkey',
			data = {
				plate = ESX.Game.GetVehicleProperties(Vehicle).plate
			}
		}) then
			if GetVehicleDoorLockStatus(Vehicle) == 1 then
			
				if IsPedOnFoot(Player) then
					Funcs.PlayAnim()
				end

				TriggerServerEvent('InteractSound_SV:PlayWithinDistance', 0.5, 'carlock', 0.3)
				Funcs.BlinkLights(Vehicle)

				SetVehicleDoorsLocked(Vehicle, 2)
				exports['eyrp_notify']:LoadNotification('Du låste ~y~fordonet~s~', 'success')

			elseif GetVehicleDoorLockStatus(Vehicle) == 2 then

				if IsPedOnFoot(Player) then
					Funcs.PlayAnim()
				end

				TriggerServerEvent('InteractSound_SV:PlayWithinDistance', 0.5, 'carlock', 0.3)
				Funcs.BlinkLights(Vehicle)

				SetVehicleDoorsLocked(Vehicle, 1)
				exports['eyrp_notify']:LoadNotification('Du låste upp ~y~fordonet~s~', 'success')

			end
		else
			exports['eyrp_notify']:LoadNotification('Ditt fordon är inte i närheten', 'error', true)
		end
	elseif IsPedInAnyVehicle(Player, true) then
		Vehicle = GetVehiclePedIsIn(Player, false)

		if GetVehicleDoorLockStatus(Vehicle) == 1 then

			TriggerServerEvent('InteractSound_SV:PlayWithinDistance', 0.5, 'carlock', 0.3)
			Funcs.BlinkLights(Vehicle)

			SetVehicleDoorsLocked(Vehicle, 2)
			exports['eyrp_notify']:LoadNotification('Du låste ~y~fordonet~s~ innifrån', 'success')

		elseif GetVehicleDoorLockStatus(Vehicle) == 2 then

			TriggerServerEvent('InteractSound_SV:PlayWithinDistance', 0.5, 'carlock', 0.3)
			Funcs.BlinkLights(Vehicle)

			SetVehicleDoorsLocked(Vehicle, 1)
			exports['eyrp_notify']:LoadNotification('Du låste upp ~y~fordonet~s~ innifrån', 'success')
		end
	else
		exports['eyrp_notify']:LoadNotification('Det finns inget fordon i närheten', 'error', true)
	end
end

Citizen.CreateThread(function()
	exports['eyrp_core']:LoadAnimDict('anim@mp_player_intmenu@key_fob@')
	exports['eyrp_core']:LoadModel('itap_bilnyckel')

	while true do

		if IsPedInAnyVehicle(PlayerPedId(), false) and GetVehicleDoorLockStatus(GetVehiclePedIsIn(PlayerPedId(), false)) == 2 then
			DisableControlAction(0, 75)

			if IsControlJustReleased(0, 23) then
				exports['eyrp_notify']:LoadNotification('Du måste låsa upp fordonet', 'error', true)
			end
		end

		Citizen.Wait(7)
	end
end)