ESX = {}

TriggerEvent("esx:getSharedObject", function(library) 
	ESX = library 
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(d)
	TriggerEvent("esx:getSharedObject", function(library) 
		ESX = library 
	end)

	ESX.PlayerData = d
end)

local seatbelt = false
local ind = {l = false, r = false}

local lastEngineHealth = nil;
local lastSpeed = nil;

local lastFeuPosition = nil;
local lastFeuRoute = nil;

local showingHud = false;

Citizen.CreateThread(function()
	SendNUIMessage({
		showhud = false
	})
	
	SendNUIMessage({
		clignotantGauche = false,
		clignotantDroite = false,
	})

	while true do
		local sleepThread, Ped = 1500, GetPlayerPed(-1)

		if(IsPedInAnyVehicle(Ped)) then
			local PedCar = GetVehiclePedIsIn(Ped, false)
			if PedCar and GetPedInVehicleSeat(PedCar, -1) == Ped then
				sleepThread = 300;

				if not showingHud then
					-- SendNUIMessage({
					-- 	showhud = true
					-- })

					showingHud = true
				end


				-- Speed
				carSpeed = math.ceil(GetEntitySpeed(PedCar) * 3.2)

				if lastSpeed ~= carSpeed then
					SendNUIMessage({
						showhud = true,
						speed = carSpeed
					})

					lastSpeed = carSpeed
				end

				if not IsCar(PedCar) then
					SendNUIMessage({
						seatbelt = true
					})
				end

				local vehicleHealth = GetVehicleEngineHealth(PedCar)
				
				if (lastEngineHealth ~= vehicleHealth) then
					if (vehicleHealth > 500) then
						SendNUIMessage({
							engine = 1
						})
					elseif vehicleHealth <= 500 and vehicleHealth > 250 then
						SendNUIMessage({
							engine = 2
						})
					elseif vehicleHealth <= 250 then
						SendNUIMessage({
							engine = 3
						})
					end

					lastEngineHealth = GetVehicleEngineHealth(PedCar)
				end

				-- Lights
				_,feuPosition,feuRoute = GetVehicleLightsState(PedCar)

				if (lastFeuPosition ~= feuPosition) or (lastFeuRoute ~= feuRoute) then
					if(feuPosition == 1 and feuRoute == 0) then
						SendNUIMessage({
							feuPosition = true
						})
					else
						SendNUIMessage({
							feuPosition = false
						})
					end

					if(feuPosition == 1 and feuRoute == 1) then
						SendNUIMessage({
							feuRoute = true
						})
					else
						SendNUIMessage({
							feuRoute = false
						})
					end

					lastFeuPosition = feuPosition;
					lastFeuRoute = feuRoute
				end

				-- if(VehIndicatorLight == 0) then
				-- 	SendNUIMessage({
				-- 		clignotantGauche = false,
				-- 		clignotantDroite = false,
				-- 	})
				-- elseif(VehIndicatorLight == 1) then
				-- 	SendNUIMessage({
				-- 		clignotantGauche = true,
				-- 		clignotantDroite = false,
				-- 	})
				-- elseif(VehIndicatorLight == 2) then
				-- 	SendNUIMessage({
				-- 		clignotantGauche = false,
				-- 		clignotantDroite = true,
				-- 	})
				-- elseif(VehIndicatorLight == 3) then
				-- 	SendNUIMessage({
				-- 		clignotantGauche = true,
				-- 		clignotantDroite = true,
				-- 	})
				-- end

			else
				if showingHud then
					SendNUIMessage({
						showhud = false
					})

					showingHud = false
				end
			end
		else
			if showingHud then
				SendNUIMessage({
					showhud = false
				})

				showingHud = false
			end
		end

		Citizen.Wait(sleepThread)
	end
end)

Citizen.CreateThread(function()
	while true do
		local player = PlayerPedId();

		if IsPedInAnyVehicle(player, false) then
			local vehicle = GetVehiclePedIsIn(player, false);

			if IsCar(vehicle) then
				if not seatbelt then
					if GetEntitySpeed(vehicle) > 2.0 then
						PlaySoundFrontend(-1, 'OTHER_TEXT', 'HUD_AWARDS')
					end
				end
			end
		end

		Citizen.Wait(1000)
	end
end)

Citizen.CreateThread(function()
	while true do
		local Ped = GetPlayerPed(-1)
		if(IsPedInAnyVehicle(Ped)) then
			local PedCar = GetVehiclePedIsIn(Ped, false)
			if PedCar and GetPedInVehicleSeat(PedCar, -1) == Ped then
				carSpeed = math.ceil(GetEntitySpeed(PedCar) * 3.6)
				fuel = GetVehicleFuelLevel(PedCar)
				rpm = GetVehicleCurrentRpm(PedCar)
				SendNUIMessage({
			showfuel = true,
					fuel = fuel
				})
			end
		end

		Citizen.Wait(1)
	end
end)

exports('BeltState', function()
	local player = PlayerPedId()
	if not IsPedInAnyVehicle(player, false) then 
		ESX.ShowNotification('Du sitter inte i ett fordon') 
		return 
	end

	local vehicle = GetVehiclePedIsIn(player, false)

	if not IsCar(vehicle) then return end

	seatbelt = not seatbelt

	SendNUIMessage({
		seatbelt = seatbelt
	})
end)

exports('GetBeltState', function() 
	return seatbelt
end)

local speedBuffer  = {}
local velBuffer    = {}
local wasInCar     = false

IsCar = function(veh)
	local vc = GetVehicleClass(veh)
	return (vc >= 0 and vc <= 7) or (vc >= 9 and vc <= 12) or (vc >= 17 and vc <= 20)
end	

Fwv = function (entity)
	local hr = GetEntityHeading(entity) + 90.0
	if hr < 0.0 then hr = 360.0 + hr end
	hr = hr * 0.0174533
	return { x = math.cos(hr) * 2.0, y = math.sin(hr) * 2.0 }
end

Citizen.CreateThread(function()
	Citizen.Wait(500)
	while true do
		
		local ped = GetPlayerPed(-1)
		local car = GetVehiclePedIsIn(ped)
		
		if car ~= 0 and (wasInCar or IsCar(car)) then
		
			wasInCar = true
			
			if seatbelt then DisableControlAction(0, 75) end
			
			speedBuffer[2] = speedBuffer[1]
			speedBuffer[1] = GetEntitySpeed(car)
			
			if speedBuffer[2] ~= nil 
			   and not seatbelt
			   and GetEntitySpeedVector(car, true).y > 1.0  
			   and speedBuffer[1] > 19.25
			   and (speedBuffer[2] - speedBuffer[1]) > (speedBuffer[1] * 0.255) then
			   
				local co = GetEntityCoords(ped)
				local fw = Fwv(ped)
				SetEntityCoords(ped, co.x + fw.x, co.y + fw.y, co.z - 0.47, true, true, true)
				SetEntityVelocity(ped, velBuffer[2].x, velBuffer[2].y, velBuffer[2].z)
				Citizen.Wait(1)
				SetPedToRagdoll(ped, 1000, 1000, 0, 0, 0, 0)
			end
				
			velBuffer[2] = velBuffer[1]
			velBuffer[1] = GetEntityVelocity(car)

		elseif wasInCar then
			wasInCar = false
			seatbelt = false
			SendNUIMessage({
				seatbelt = seatbelt
			})
			speedBuffer[1], speedBuffer[2] = 0.0, 0.0
		end

		Citizen.Wait(0)
	end
end)