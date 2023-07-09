ESX              = nil
local PlayerData = {}

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end

	while ESX.GetPlayerData().job == nil do
		Citizen.Wait(10)
	end

	ESX.PlayerData = ESX.GetPlayerData()
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
  PlayerData = xPlayer   
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
  PlayerData.job = job
end)

Citizen.CreateThread(function()
	Funcs.DrawBlips()
	while true do 
		local sleepThread = 1000
		local pedCoords = GetEntityCoords(PlayerPedId()) 
		for i=1, #Config.Garages do 
			if Config.Garages[i].Job ~= false then 

				if ESX.GetPlayerData().job and ESX.GetPlayerData().job.name == Config.Garages[i].Job then  
					if #(pedCoords - Config.Garages[i].Coords) < 3.0 and IsPedOnFoot(PlayerPedId()) then 
						sleepThread = 7

						exports['eyrp_core']:DrawText3D(Config.Garages[i].Coords, '[~g~E~w~] - Garage')
						if #(pedCoords - Config.Garages[i].Coords) < 0.4 then
							if IsControlJustReleased(0,38) then 
								Funcs.OpenGarage(i)
							end
						end
					end
					if #(pedCoords - Config.Garages[i].Spawn) < 10.0 and IsPedInAnyVehicle(PlayerPedId()) then 
						sleepThread = 7

						Funcs.DrawMarker({
							type = 6,
							pos = Config.Garages[i].Spawn,
							r = 0, g = 50, b = 200,
							sizeX = 3.2, sizeY = 3.2, sizeZ = 3.2
						});

						if #(pedCoords - Config.Garages[i].Spawn) < 2.0 and IsPedInAnyVehicle(PlayerPedId()) then 
							ESX.ShowHelpNotification('~INPUT_CONTEXT~ Parkera fordon')
							if IsControlJustReleased(0,38) then 
								Funcs.ParkVehicle(i)
							end
						end
					end
				end
			else
				if #(pedCoords - Config.Garages[i].Coords) <= 5.0 and IsPedOnFoot(PlayerPedId()) then  
					sleepThread = 7 

					exports['eyrp_core']:DrawText3D(Config.Garages[i].Coords, '[~g~E~w~] - Garage')
					if #(pedCoords - Config.Garages[i].Coords) < 1.0 then
						if IsControlJustReleased(0,38) then 
							Funcs.OpenGarage(i)
						end
					end
				end
				if #(pedCoords - Config.Garages[i].Spawn) < 10.0 and IsPedInAnyVehicle(PlayerPedId()) then 
					sleepThread = 7

					Funcs.DrawMarker({
						type = 6,
						pos = Config.Garages[i].Spawn,
						r = 0, g = 50, b = 200,
						sizeX = 3.2, sizeY = 3.2, sizeZ = 3.2
					});
					if #(pedCoords - Config.Garages[i].Spawn) < 2.0 and IsPedInAnyVehicle(PlayerPedId()) then 
						ESX.ShowHelpNotification('~INPUT_CONTEXT~ Parkera fordon')
						if IsControlJustReleased(0,38) then 
							Funcs.ParkVehicle(i)
						end
					end
				end
			end
		end

		Wait(sleepThread);
	end
end)






