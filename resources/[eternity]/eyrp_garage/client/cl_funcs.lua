Funcs = {};

Funcs.OpenGarage = function(id)
	gId = id
	SetNuiFocus(true,true)
	SendNUIMessage({
		open = true,
		info = {
			garage = Config.Garages[id],
		}
	})
	ESX.TriggerServerCallback('eyrp_garage:GetGarageVehicles', function(vehicles)
		local gVehicles = {}
		for i=1, #vehicles, 1 do
			if Config.Garages[gId].Shared ~= false then 
				gVehicles = vehicles[i]
			else
				if exports['eyrp_inventory']:HasSpecificItem({
					item = 'carkey',
					data = {
						plate = vehicles[i].plate
					}
				}) then
					gVehicles = vehicles[i]
				else
					return 
				end
			end
			SendNUIMessage({
				open = true, 
				info = {
					vData = gVehicles,
					garage = Config.Garages[id],
					vehicleArray = gVehicles.vehicleinfo,
					vLabel = GetLabelText(GetDisplayNameFromVehicleModel(tonumber(gVehicles.vehicleinfo.model) or GetHashKey(gVehicles.vehicleinfo.model)))
				}
			})
		end	
	end, Config.Garages[id].Label)
end

Funcs.ParkVehicle = function(id)
	array = {};
	local vehicle = ESX.Game.GetVehicleProperties(GetVehiclePedIsIn(PlayerPedId(), false))
	if Config.Garages[id].Shared ~= false then 
		ESX.Game.DeleteVehicle(GetVehiclePedIsIn(PlayerPedId(), false))
		TriggerServerEvent('eyrp_garage:ParkVehicle', vehicle.plate, vehicle, array, Config.Garages[id].Label)
	else
		if exports['eyrp_inventory']:HasSpecificItem({
			item = 'carkey',
			data = {
				plate = vehicle.plate
			}
		}) then
			ESX.Game.DeleteVehicle(GetVehiclePedIsIn(PlayerPedId(), false))
			
			TriggerServerEvent('eyrp_garage:ParkVehicle', vehicle.plate, vehicle, array, Config.Garages[id].Label)
		else
			ESX.ShowNotification('Du har ingen nyckel till detta fordon', 'error')
		end
	end
end

Funcs.TakeOutVehicle = function(id, cVehicle, array)
	ESX.TriggerServerCallback('eyrp_garage:errorHandler', function(exist)
		if not exist then 
			ESX.ShowNotification('Något gick fel, försök igen', 'error')
		else
			if ESX.Game.IsSpawnPointClear(Config.Garages[gId].Spawn, 5.0) then 
				TriggerServerEvent('eyrp_garage:TakeOutVehicle', id) 

				ESX.Game.SpawnVehicle(cVehicle, Config.Garages[gId].Spawn, Config.Garages[gId].Heading, function(vehicle)
					SetEntityAsMissionEntity(vehicle, true, true)
					Funcs.SetVehicleProperties(vehicle, array, id)
					NetworkFadeInEntity(vehicle, true)
					

					if array.bodyHealth <= 980.0 then 
						for i=0, 7, 1 do 
							SmashVehicleWindow(vehicle, i)
						end
						SetVehicleDoorBroken(vehicle, 4, true)
					end

				end)
			else
				ESX.ShowNotification('Det är något i vägen, försök igen', 'error')
			end
		end
	end, id)
end

Funcs.BlinkLights = function(Vehicle)
	SetVehicleLights(Vehicle, 2)
	Citizen.Wait(200)
	SetVehicleLights(Vehicle, 1)
	Citizen.Wait(200)
	SetVehicleLights(Vehicle, 2)
	Citizen.Wait(200)
	SetVehicleLights(Vehicle, 1)

	SetVehicleLightsMode(Vehicle, 0)
	SetVehicleLights(Vehicle, 0)
end

Funcs.PlayAnimation = function()
	local Player = PlayerPedId()

	Animation = {
		Dict = 'anim@mp_player_intmenu@key_fob@',
		Lib = 'fob_click_fp',
		Prop = 'prop_cuff_keys_01'
	}

	exports['eyrp_tools']:SpawnObject({
		Model = Animation.Prop,
		Coords = GetEntityCoords(Player)
	}, function(Object)
		AttachEntityToEntity(Object, Player, GetPedBoneIndex(Player, 57005), 0.11, 0.03, -0.03, 210.0, 190.0, 0.0, true, true, false, true, 1, true)

		exports['eyrp_tools']:PlayAnimation({
			Ped = Player,
			Dict = Animation.Dict,
			Lib = Animation.Lib
		})

		Wait(800)

		ClearPedTasks(Player)
		DeleteEntity(Object)
	end)
end

Funcs.DrawBlips = function()
	for i=1, #Config.Garages, 1 do 
		if Config.Garages[i].Blip then 
			local blip = AddBlipForCoord(Config.Garages[i].Coords)
			SetBlipSprite(blip, 50)
			SetBlipDisplay(blip, 6)
			SetBlipColour(blip, 38)
			SetBlipScale(blip, 0.9)
			BeginTextCommandSetBlipName("STRING")
			AddTextComponentString(Config.Garages[i].Label)
			EndTextCommandSetBlipName(blip) 
		end
	end
end

Funcs.SetVehicleProperties = function(vehicle, vehProps, id)
    ESX.Game.SetVehicleProperties(vehicle, vehProps)
	ESX.Game.SetVehicleProperties(vehicle, {
		engineHealth = tonumber(vehProps.engineHealth),
		bodyHealth = tonumber(vehProps.bodyHealth),
		fuelLevel = tonumber(vehProps.fuelLevel)
	})
end;

Funcs.DrawMarker = function(markerData)
    DrawMarker(markerData['type'] or 1, markerData['pos'] or vector3(0.0, 0.0, 0.0), 0.0, 0.0, 0.0, (markerData['type'] == 6 and -90.0 or markerData['rotate'] and -180.0) or 0.0, 0.0, 0.0, markerData['sizeX'] or 1.0, markerData['sizeY'] or 1.0, markerData['sizeZ'] or 1.0, markerData['r'] or 1.0, markerData['g'] or 1.0, markerData['b'] or 1.0, 100, markerData['bob'] and true or false, false, 2, false, false, false, false)
end;