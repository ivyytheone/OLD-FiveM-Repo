  local PlayerData              = {}
  local FirstSpawn              = true
  local IsDead                  = false
  local HasAlreadyEnteredMarker = false
  local IsDragged                 = false
  local CopPed                    = 0
  local LastZone                = nil
  local CurrentAction           = nil
  local CurrentActionMsg        = ''
  local CurrentActionData       = {}
  local IsBusy                  = false
  
  ESX                           = nil
  
  Citizen.CreateThread(function()
	  while ESX == nil do
		  TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		  Citizen.Wait(10)
	  end
  
	  Citizen.Wait(5000)
	  PlayerData = ESX.GetPlayerData()
  end)
  
  function RespawnPed(ped, coords)
	  SetEntityCoordsNoOffset(ped, coords.x, coords.y, coords.z, false, false, false, true)
	  NetworkResurrectLocalPlayer(coords.x, coords.y, coords.z, coords.heading, true, false)
	  SetPlayerInvincible(ped, false)
	  TriggerEvent('playerSpawned', coords.x, coords.y, coords.z, coords.heading)
	  ClearPedBloodDamage(ped)
  
	  ESX.UI.Menu.CloseAll()
  end
  
  RegisterNetEvent('esx_ambulancejob:heal')
  AddEventHandler('esx_ambulancejob:heal', function(_type)
	  local playerPed = GetPlayerPed(-1)
	  local maxHealth = GetEntityMaxHealth(playerPed)
	  if _type == 'small' then
		  local health = GetEntityHealth(playerPed)
		  local newHealth = math.min(maxHealth , math.floor(health + maxHealth/8))
		  SetEntityHealth(playerPed, newHealth)
	  elseif _type == 'big' then
		  SetEntityHealth(playerPed, maxHealth)
	  end
  end)

  Citizen.CreateThread(function()
	while true do
	  Citizen.Wait(0)
		if IsDead then
		  DisableControlAction(0, 170, true)
		  DisableControlAction(0, 289, true)
		  DisableControlAction(0, 167, true)
		end
	end
  end)
  
  
  function StartRespawnToHospitalMenuTimer()
	  Citizen.SetTimeout(Config.MenuRespawnToHospitalDelay, function()
		  if IsDead then
			  ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'respawn_hospital',
			  {
				  title = _U('respawn_at_hospital'),
				  align = 'bottom-right',
				  elements = {
					  {label = _U('no'),  value = 'no'},
					  {label = _U('yes'), value = 'yes'}
				  }
			  }, function(data, menu)
				  if data.current.value == 'yes' then
					  RemoveItemsAfterRPDeath()
				  end
				  menu.close()
			  end)
		  end
	  end)
  end
  
  function StartRespawnTimer()
	  Citizen.SetTimeout(Config.RespawnDelayAfterRPDeath, function()
		  if IsDead then
			  RemoveItemsAfterRPDeath()
		  end
	  end)
  end
  
  function ShowTimer()
	  local timer = Config.RespawnDelayAfterRPDeath
	  
	  Citizen.CreateThread(function()
		  while timer > 0 and IsDead do
			  Citizen.Wait(0)
			  
			  raw_seconds = timer/1000
			  raw_minutes = raw_seconds/60
			  minutes = stringsplit(raw_minutes, ".")[1]
			  seconds = stringsplit(raw_seconds-(minutes*60), ".")[1]
  
			  SetTextFont(4)
			  SetTextProportional(0)
			  SetTextScale(0.0, 0.5)
			  SetTextColour(255, 255, 255, 255)
			  SetTextDropshadow(0, 0, 0, 0, 255)
			  SetTextEdge(1, 0, 0, 0, 255)
			  SetTextDropShadow()
			  SetTextOutline()
  
			  local text = _U('please_wait', minutes, seconds)
  
			  if Config.EarlyRespawn then
			  end
  
			  SetTextCentre(true)
			  BeginTextCommandDisplayText("STRING")
			  AddTextComponentSubstringPlayerName(text)
			  EndTextCommandDisplayText(0.5, 0.8)
  
			  if Config.EarlyRespawn then
				  if IsControlPressed(0, 38) then
					  RemoveItemsAfterRPDeath()
					  break
				  end
			  end
			  timer = timer - 15
		  end
  
		  if Config.EarlyRespawn then
			  while timer <= 0 and IsDead do
				  Citizen.Wait(10)
  
				  SetTextFont(4)
				  SetTextProportional(0)
				  SetTextScale(0.0, 0.5)
				  SetTextColour(255, 255, 255, 255)
				  SetTextDropshadow(0, 0, 0, 0, 255)
				  SetTextEdge(1, 0, 0, 0, 255)
				  SetTextDropShadow()
				  SetTextOutline()
				  SetTextCentre(true)
  
				  BeginTextCommandDisplayText("STRING")
				  AddTextComponentSubstringPlayerName(_U('press_respawn'))
				  EndTextCommandDisplayText(0.5, 0.8)
  
				  if IsControlPressed(0, 38) then
					  RemoveItemsAfterRPDeath()
					  break
				  end
			  end
		  end
	  end)
  end
  
  function RemoveItemsAfterRPDeath()
	  TriggerServerEvent('esx_ambulancejob:setDeathStatus', 0)
  
	  Citizen.CreateThread(function()
		  DoScreenFadeOut(800)
		  while not IsScreenFadedOut() do
			  Citizen.Wait(10)
		  end
  
		  ESX.TriggerServerCallback('esx_ambulancejob:removeItemsAfterRPDeath', function()
			  ESX.SetPlayerData('lastPosition', Config.Zones.HospitalInteriorInside2.Pos)
			  ESX.SetPlayerData('loadout', {})
  
			  TriggerServerEvent('esx:updateLastPosition', Config.Zones.HospitalInteriorInside2.Pos)
			  RespawnPed(GetPlayerPed(-1), Config.Zones.HospitalInteriorInside2.Pos)
  
			  StopScreenEffect('DeathFailOut')
			  DoScreenFadeIn(800)
		  end)
	  end)
  end
  
  function OnPlayerDeath()
	  IsDead = true
	  TriggerServerEvent('esx_ambulancejob:setDeathStatus', 1)
  
	  if Config.ShowDeathTimer == true then
		  ShowTimer()
	  end
  
	  StartRespawnTimer()
  --	StartDistressSignal()
  
	  if Config.RespawnToHospitalMenuTimer then
		  StartRespawnToHospitalMenuTimer()
	  end
  
	  --ClearPedTasksImmediately(GetPlayerPed(-1))
	  StartScreenEffect('DeathFailMPDark', 0, false)
  end
  
  function TeleportFadeEffect(entity, coords)
  
	Citizen.CreateThread(function()
  
	  DoScreenFadeOut(800)
  
	  while not IsScreenFadedOut() do
		Citizen.Wait(0)
	  end
  
	  ESX.Game.Teleport(entity, coords, function()
		DoScreenFadeIn(800)
	  end)
  
	end)
  
  end
  
  function WarpPedInClosestVehicle(ped)
  
	local coords = GetEntityCoords(ped)
  
	local vehicle, distance = ESX.Game.GetClosestVehicle({
	  x = coords.x,
	  y = coords.y,
	  z = coords.z
	})
  
	if distance ~= -1 and distance <= 5.0 then
  
	  local maxSeats = GetVehicleMaxNumberOfPassengers(vehicle)
	  local freeSeat = nil
  
	  for i=maxSeats - 1, 0, -1 do
		if IsVehicleSeatFree(vehicle, i) then
		  freeSeat = i
		  break
		end
	  end
  
	  if freeSeat ~= nil then
		TaskWarpPedIntoVehicle(ped, vehicle, freeSeat)
	  end
  
	else
	  ESX.ShowNotification(_U('no_vehicles'))
	end
  
  end
  
  function OpenAmbulanceActionsMenu()
  
	local elements = {
	  {label = _U('cloakroom'), value = 'cloakroom'}
	}
  
	if Config.EnablePlayerManagement and PlayerData.job.grade_name == 'boss' then
	  table.insert(elements, {label = _U('boss_actions'), value = 'boss_actions'})
	end
  
	ESX.UI.Menu.CloseAll()
  
	ESX.UI.Menu.Open(
	  'default', GetCurrentResourceName(), 'ambulance_actions',
	  {
		title    = _U('ambulance'),
		align    = 'top-right',
		elements = elements
	  },
	  function(data, menu)
  
		if data.current.value == 'cloakroom' then
		  OpenCloakroomMenu()
		end
  
		if data.current.value == 'boss_actions' then
		  TriggerEvent('esx_society:openBossMenu', 'ambulance', function(data, menu)
			menu.close()
		  end, {wash = false})
		end
  
	  end,
	  function(data, menu)
  
		menu.close()
  
		CurrentAction     = 'ambulance_actions_menu'
		CurrentActionMsg  = _U('open_menu')
		CurrentActionData = {}
  
	  end
	)
  
  end

  DrawScriptMarker = function(markerData)
    DrawMarker(markerData["type"] or 1, markerData["pos"] or vector3(0.0, 0.0, 0.0), 0.0, 0.0, 0.0, (markerData["type"] == 6 and -90.0 or markerData["rotate"] and -180.0) or 0.0, 0.0, 0.0, markerData["sizeX"] or 1.0, markerData["sizeY"] or 1.0, markerData["sizeZ"] or 1.0, markerData["r"] or 1.0, markerData["g"] or 1.0, markerData["b"] or 1.0, 100, markerData["bob"] and true or false, true, 2, false, false, false, false)
end
  
  function OpenMobileAmbulanceActionsMenu()
  
	  ESX.UI.Menu.CloseAll()
  
	  ESX.UI.Menu.Open(
	  'default', GetCurrentResourceName(), 'mobile_ambulance_actions',
	  {
		  title    = _U('ambulance'),
		  align    = 'top-right',
		  elements = {
			  {label = _U('ems_menu'), value = 'citizen_interaction'},
		  }
	  }, function(data, menu)
		  if data.current.value == 'citizen_interaction' then
			Citizen.CreateThread(function()
				while ESX.UI.Menu.IsOpen("default", GetCurrentResourceName(), "citizen_interaction") do
					Citizen.Wait(5)
			
					local player, distance = ESX.Game.GetClosestPlayer()
					if distance ~= -1 and distance <= 3.0 then
			
					--if DoesEntityExist(player) then
					local cPlayerPed = GetPlayerPed(player)
						DrawScriptMarker({
							["type"] = 2,
							["pos"] = GetEntityCoords(cPlayerPed) + vector3(0.0, 0.0, 1.2),
							["r"] = 0,
							["g"] = 0,
							["b"] = 255,
							["sizeX"] = 0.3,
							["sizeY"] = 0.3,
							["sizeZ"] = 0.3,
							["rotate"] = true,
							["bob"] = true
						})
					--end
				end
				end
			end)	
			  ESX.UI.Menu.Open(
			  'default', GetCurrentResourceName(), 'citizen_interaction',
			  {
				  title    = _U('ems_menu_title'),
				  align    = 'top-right',
				  elements = {
					  {label = _U('ems_menu_revive'),     value = 'revive'},
					  {label = _U('ems_menu_small'),      value = 'small'},
					  {label = _U('ems_menu_big'),        value = 'big'},
					  --{label = ('Lyft upp/Sätt ner'),     value = 'drag'},
						{label = _U('billing'),       value = 'billing'},
						{label = ('Lås / Låsupp Tjänstefordon'), value = 'lock'},
			
				  }
			  }, function(data, menu)
		  if IsBusy then return end

		if data.current.value == 'billing' then
			exports["t0sic_billing"]:SendBilling()
		end
		  
		  --[[if data.current.value == 'billing' then
					  ESX.UI.Menu.Open(
						'dialog', GetCurrentResourceName(), 'billing',
						{
						  title = _U('invoice_amount')
						},
						function(data, menu)
						  local amount = tonumber(data.value)
						  if amount == nil or amount < 0 then
							ESX.ShowNotification(_U('amount_invalid'))
						  else
							
							local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
							if closestPlayer == -1 or closestDistance > 3.0 then
							  ESX.ShowNotification(_U('no_players_nearby'))
					  else
					  menu.close()
							  TriggerServerEvent('esx_billing:sendBill', GetPlayerServerId(closestPlayer), 'society_ambulance', _U('ambulance'), amount)
							end
						  end
						end,
					  function(data, menu)
						menu.close()
					  end
					  )
					end]]

					if data.current.value == 'lock' then
						TriggerEvent('esx_tjanste:openMenu')
					end
  
  
					  if data.current.value == 'revive' then -- revive
					  
						  local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
						  
						  if closestPlayer == -1 or closestDistance > 3.0 then
							  ESX.ShowNotification(_U('no_players'))
						  else
							  ESX.TriggerServerCallback('esx_ambulancejob:getItemAmount', function(qtty)
								  if qtty > 0 then
									  local closestPlayerPed = GetPlayerPed(closestPlayer)
									  local health = GetEntityHealth(closestPlayerPed)
									  
									  if health == 0 then
										  local playerPed = GetPlayerPed(-1)
	  
										  IsBusy = true
										  TaskStartScenarioInPlace(playerPed, 'CODE_HUMAN_MEDIC_TEND_TO_DEAD', 0, true)
										  exports['progressBars']:startUI(10000, "Hjälper personen")
										  Citizen.Wait(10000)
										  ClearPedTasks(playerPed)
										  
										  TriggerServerEvent('esx_ambulancejob:removeItem', 'medikit')
										  TriggerServerEvent('esx_ambulancejob:revive', GetPlayerServerId(closestPlayer))
										  IsBusy = false
										  -- Show revive award?
										  if Config.ReviveReward > 0 then
											  ESX.ShowNotification(_U('revive_complete_award', GetPlayerName(closestPlayer), Config.ReviveReward))
										  else
											  ESX.ShowNotification(_U('revive_complete', GetPlayerName(closestPlayer)))
										  end
									  else
										  ESX.ShowNotification(_U('player_not_unconscious'))
									  end
								  else
									  ESX.ShowNotification(_U('not_enough_medikit'))
								  end
							  end, 'medikit')
						  end
				  elseif data.current.value == 'small' then
				  
					  local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
					  if closestPlayer == -1 or closestDistance > 3.0 then
						  ESX.ShowNotification(_U('no_players'))
					  else
						  ESX.TriggerServerCallback('esx_ambulancejob:getItemAmount', function(qtty)
							  if qtty > 0 then
								  local closestPlayerPed = GetPlayerPed(closestPlayer)
								  local health = GetEntityHealth(closestPlayerPed)
								  
								  if health > 0 then
									  local playerPed = GetPlayerPed(-1)
  
									  IsBusy = true
									  TaskStartScenarioInPlace(playerPed, 'CODE_HUMAN_MEDIC_TEND_TO_DEAD', 0, true)
									  exports['progressBars']:startUI(10000, "Lindrar skador")
									  Citizen.Wait(10000)
									  ClearPedTasks(playerPed)
									  
									  TriggerServerEvent('esx_ambulancejob:removeItem', 'bandage')
									  TriggerServerEvent('esx_ambulancejob:heal', GetPlayerServerId(closestPlayer), 'small')
									  ESX.ShowNotification(_U('heal_complete', GetPlayerName(closestPlayer)))
									  IsBusy = false
								  else
									  ESX.ShowNotification(_U('player_not_conscious'))
								  end
							  else
								  ESX.ShowNotification(_U('not_enough_bandage'))
							  end
						  end, 'bandage')
					  end
  
				  elseif data.current.value == 'big' then
					  
					  local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
					  if closestPlayer == -1 or closestDistance > 3.0 then
						  ESX.ShowNotification(_U('no_players'))
					  else
						  ESX.TriggerServerCallback('esx_ambulancejob:getItemAmount', function(qtty)
							  if qtty > 0 then
								  local closestPlayerPed = GetPlayerPed(closestPlayer)
								  local health = GetEntityHealth(closestPlayerPed)
								  
								  if health > 0 then
									  local playerPed = GetPlayerPed(-1)
  
									  IsBusy = true
									  TaskStartScenarioInPlace(playerPed, 'CODE_HUMAN_MEDIC_TEND_TO_DEAD', 0, true)
									  exports['progressBars']:startUI(10000, "Hjälper personen")
									  Citizen.Wait(10000)
									  ClearPedTasks(playerPed)
									  
						  	 		  TriggerServerEvent('esx_ambulancejob:removeItem', 'medikit')
									  TriggerServerEvent('esx_ambulancejob:heal', GetPlayerServerId(closestPlayer), 'big')
									  ESX.ShowNotification(_U('heal_complete', GetPlayerName(closestPlayer)))
									  IsBusy = false
								  else
									  ESX.ShowNotification(_U('player_not_conscious'))
								  end
							  else
								  ESX.ShowNotification(_U('not_enough_medikit'))
							  end
						  end, 'medikit')
					  end
				  elseif data.current.value == 'drag' then
					  TriggerEvent('esx_barbie_lyftupp:Menu')
				  elseif data.current.value == 'put_in_vehicle' then
				TriggerServerEvent('esx_ambulancejob:putInVehicle', GetPlayerServerId(closestPlayer))
				elseif data.current.value ==  'out_the_vehicle' then
						  TriggerServerEvent('esx_ambulancejob:OutVehicle', GetPlayerServerId(closestPlayer))
			  end
			  
			  local player, distance = ESX.Game.GetClosestPlayer()
			  
			  if distance ~= -1 and distance <= 3.0 then	
			  else
				  
			  end
  
			end,
			function(data, menu)
			  menu.close()
			end
		  )
  
		end
  
	  end,
	  function(data, menu)
		menu.close()
	  end
	)
  
  end
  
  function OpenCloakroomMenu()
  
	  ESX.UI.Menu.Open(
		'default', GetCurrentResourceName(), 'cloakroom',
		{
		  title    = _U('cloakroom'),
		  align    = 'top-right',
		  elements = {
			{label = _U('ems_clothes_civil'), value = 'citizen_wear'},
			{label = _U('ems_clothes_ems'), value = 'ambulance_wear'},
			{label = 'Skyddsoverall', value = 'virus_wear'},
			{label = _U('glasses2_wear'), value = 'glasses2_wear'},
			{label = _U('glasses_wear'), value = 'glasses_wear'},
			{label = _U('steto_wear'), value = 'steto_wear'},
			--{label = _U('handskar_wear'), value = 'handskar_wear'},
			--{label = _U('radio_wear'), value = 'radio_wear'},
			
		  },
		},
		function(data, menu)
	
		  menu.close()
	
		  if data.current.value == 'citizen_wear' then
			ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
			  local model = nil
	
			  if skin.sex == 0 then
				model = GetHashKey("mp_m_freemode_01")
			  else
				model = GetHashKey("mp_f_freemode_01")
			  end
	
			  RequestModel(model)
			  while not HasModelLoaded(model) do
				RequestModel(model)
				Citizen.Wait(1)
			  end
	
			  SetPlayerModel(PlayerId(), model)
			  SetModelAsNoLongerNeeded(model)
	
			  TriggerEvent('skinchanger:loadSkin', skin)
			  TriggerEvent('esx:restoreLoadout')
			  local playerPed = GetPlayerPed(-1)
			  SetPedArmour(playerPed, 0)
			  ClearPedBloodDamage(playerPed)
			  ResetPedVisibleDamage(playerPed)
			  ClearPedLastWeaponDamage(playerPed)
			end)
		  end
	
	
		  if data.current.value == 'virus_wear' then
			TriggerEvent('skinchanger:getSkin', function(skin)
			  if skin.sex == 0 then
				TriggerEvent('skinchanger:loadClothes', skin, Config.VirusWear.male)
			  else
				TriggerEvent('skinchanger:loadClothes', skin, Config.VirusWear.female)
			  end
			end)
		  end
	
		if data.current.value == 'ambulance_wear' then
	
			ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
			  local model = nil
	
				if skin.sex == 0 then
	
					local clothesSkin = {
						['tshirt_1'] = 76, ['tshirt_2'] = 1,
						['torso_1'] = 216, ['torso_2'] = 0,
						['decals_1'] = 0, ['decals_2'] = 0,
						['arms'] = 86,
						['pants_1'] = 53, ['pants_2'] = 0,
						['shoes_1'] = 24, ['shoes_2'] = 0,
						['helmet_1'] = -1, ['helmet_2'] = 0,
						['chain_1'] = 0, ['chain_2'] = 0
					}
					TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)
	
				else
	
					local clothesSkin = {
						['tshirt_1'] = 14, ['tshirt_2'] = 0,
						['torso_1'] = 221, ['torso_2'] = 0,
						['decals_1'] = 0, ['decals_2'] = 0,
						['arms'] = 99,
						['pants_1'] = 49, ['pants_2'] = 1,
						['shoes_1'] = 24, ['shoes_2'] = 0,
						['helmet_1'] = -1, ['helmet_2'] = 0,
						['chain_1'] = 0, ['chain_2'] = 0
					}
					TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)
	
				end
	
				local playerPed = GetPlayerPed(-1)
				SetPedArmour(playerPed, 0)
				ClearPedBloodDamage(playerPed)
				ResetPedVisibleDamage(playerPed)
				ClearPedLastWeaponDamage(playerPed)
				
			end)
		  end
		  
		  
		if data.current.value == 'glasses_wear' then
			TriggerEvent('skinchanger:getSkin', function(skin)
			
				if skin.sex == 0 then
	
					local clothesSkin = {
						['glasses_1'] = 1, ['glasses_2'] = 1
					}
					TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)
	
				else
	
					local clothesSkin = {
						['glasses_1'] = 25, ['glasses_2'] = 6
					}
					TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)
	
				end
	
				local playerPed = GetPlayerPed(-1)
				SetPedArmour(playerPed, 0)
				ClearPedBloodDamage(playerPed)
				ResetPedVisibleDamage(playerPed)
				ClearPedLastWeaponDamage(playerPed)
				
			end)
		  end
		  
		if data.current.value == 'glasses2_wear' then
			TriggerEvent('skinchanger:getSkin', function(skin)
			
				if skin.sex == 0 then
	
					local clothesSkin = {
						['glasses_1'] = 5, ['glasses_2'] = 6
					}
					TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)
	
				else
	
					local clothesSkin = {
						['glasses_1'] = 11, ['glasses_2'] = 0
					}
					TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)
	
				end
	
				local playerPed = GetPlayerPed(-1)
				SetPedArmour(playerPed, 0)
				ClearPedBloodDamage(playerPed)
				ResetPedVisibleDamage(playerPed)
				ClearPedLastWeaponDamage(playerPed)
				
			end)
		  end
		  
	
		if data.current.value == 'steto_wear' then
			TriggerEvent('skinchanger:getSkin', function(skin)
			
				if skin.sex == 0 then
	
					local clothesSkin = {
						['chain_1'] = 126, ['chain_2'] = 0,
					}
					TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)
	
				else
	
					local clothesSkin = {
						['chain_1'] = 96, ['chain_2'] = 0,
					}
					TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)
	
				end
	
				local playerPed = GetPlayerPed(-1)
				SetPedArmour(playerPed, 0)
				ClearPedBloodDamage(playerPed)
				ResetPedVisibleDamage(playerPed)
				ClearPedLastWeaponDamage(playerPed)
				
			end)
		  end
	
		if data.current.value == 'handskar_wear' then
			TriggerEvent('skinchanger:getSkin', function(skin)
			
				if skin.sex == 0 then
	
					local clothesSkin = {
						['arms'] = 85,
					}
					TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)
	
				else
	
					local clothesSkin = {
						['arms'] = 109,
					}
					TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)
	
				end
	
				local playerPed = GetPlayerPed(-1)
				SetPedArmour(playerPed, 0)
				ClearPedBloodDamage(playerPed)
				ResetPedVisibleDamage(playerPed)
				ClearPedLastWeaponDamage(playerPed)
				
			end)
		  end	  
	
			  if data.current.value == 'radio_wear' then
			TriggerEvent('skinchanger:getSkin', function(skin)
			
				if skin.sex == 0 then
	
					local clothesSkin = {
						['tshirt_1'] = 87, ['tshirt_2'] = 0,
					}
					TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)
	
				else
	
					local clothesSkin = {
						
					}
					TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)
	
				end
	
				local playerPed = GetPlayerPed(-1)
				SetPedArmour(playerPed, 0)
				ClearPedBloodDamage(playerPed)
				ResetPedVisibleDamage(playerPed)
				ClearPedLastWeaponDamage(playerPed)
				
			end)
		  end
	
		  CurrentAction     = 'ambulance_actions_menu'
		  CurrentActionMsg  = _U('open_menu')
		  CurrentActionData = {}
	
		end,
		function(data, menu)
		  menu.close()
		end
	  )
	
	end
  
  function OpenVehicleSpawnerMenu()
  
	  ESX.UI.Menu.CloseAll()
  
	  if Config.EnableSocietyOwnedVehicles then
  
		  local elements = {}
  
		  ESX.TriggerServerCallback('esx_society:getVehiclesInGarage', function(vehicles)
  
			  for i=1, #vehicles, 1 do
				  table.insert(elements, {label = GetDisplayNameFromVehicleModel(vehicles[i].model) .. ' [' .. vehicles[i].plate .. ']', value = vehicles[i]})
			  end
  
			  ESX.UI.Menu.Open(
			  'default', GetCurrentResourceName(), 'vehicle_spawner',
			  {
				  title    = _U('veh_menu'),
				  align    = 'top-right',
				  elements = elements,
			  }, function(data, menu)
				  menu.close()
  
				  local vehicleProps = data.current.value
				  ESX.Game.SpawnVehicle(vehicleProps.model, Config.Zones.VehicleSpawnPoint.Pos, 342.0, function(vehicle)
					  ESX.Game.SetVehicleProperties(vehicle, vehicleProps)
					  local playerVeh = GetVehiclePedIsIn(playerPed, false)
					  local playerPed = GetPlayerPed(-1)
					  SetEntityAsMissionEntity(playerVeh, true, true)
					  TaskWarpPedIntoVehicle(playerPed,  vehicle,  -1)
				  end)
				  TriggerServerEvent('esx_society:removeVehicleFromGarage', 'ambulance', vehicleProps)
			  
			  end, function(data, menu)
				  menu.close()
				  CurrentAction     = 'vehicle_spawner_menu'
				  CurrentActionMsg  = _U('veh_spawn')
				  CurrentActionData = {}
			  end
			  )
		  end, 'ambulance')
		  
	  else -- not society vehicles
  
		  ESX.UI.Menu.Open(
		  'default', GetCurrentResourceName(), 'vehicle_spawner',
		  {
			  title    = _U('veh_menu'),
			  align    = 'top-right',
			  elements = Config.AuthorizedVehicles
		  }, function(data, menu)
			  menu.close()
			  ESX.Game.SpawnVehicle(data.current.model, Config.Zones.VehicleSpawnPoint.Pos, 342.0, function(vehicle)
				SetVehicleNumberPlateText(vehicle, "AMBULANS")
				local playerPed = GetPlayerPed(-1)
				local playerVeh = GetVehiclePedIsIn(playerPed, false)
				SetEntityAsMissionEntity(playerVeh, true, true)
				TaskWarpPedIntoVehicle(playerPed, vehicle, -1)
			  end)
		  end, function(data, menu)
			  menu.close()
			  CurrentAction     = 'vehicle_spawner_menu'
			  CurrentActionMsg  = _U('veh_spawn')
			  CurrentActionData = {}
		  end
		  )
	  end
  end
  
  function OpenPharmacyMenu()
	local elements = {
		{ ["label"] = "Förråd", ["action"] = "hjalp" },
		{ ["label"] = "Lägg in/ta ut", ["action"] = "bevis" }
	}

	ESX.UI.Menu.Open('default', GetCurrentResourceName(), "police_armory_menu",
		{
			title    = "Ambulansen | Förråd",
			align    = "right",
			elements = elements
		},
	function(data, menu)
		local action = data.current["action"]

		if action == "hjalp" then
			keys()
		end
		if action == "bevis" then
			TriggerEvent('chezz-inventory:openAmbInventory')
		end					
	end, function(data, menu)

		menu.close()
	end, function(data, menu)
	end)
end

function keys()
    ESX.UI.Menu.CloseAll()

    ESX.UI.Menu.Open(
        'default', GetCurrentResourceName(), 'hello_menu',
        {
            title    = 'Ambulansen | Förråd',
            align = 'right',
            elements = {
            	{label = '[--- Nycklar/Radio ---]', value = 'kejss'},
				{label = 'Nyckel - Ambulansen', value = 'kontorr'},
				{label = 'Komradio', value = 'rakell'},
				{label = '[--- Redskap ---]', value = 'kejs2'},
				{label = 'Förstahjälpen', value = 'kit'},
				{label = 'Bandage', value = 'bandage'},
				{label = '[--- Mediciner ---]', value = 'kejs3'},
				{label = 'Tramadol', value = 'tram'},
				{label = 'COVID 19 Vaccin', value = 'vaccin'},
            }
        },
        function(data, menu)
            if data.current.value == 'kontorr' then
            	local inventory = ESX.GetPlayerData().inventory
                local kontorKeys = nil
                    for i=1, #inventory, 1 do                          
                    	if inventory[i].name == "ambcard" then
                            kontorKeys = inventory[i].count
                        end
                    end

                    if kontorKeys == 0 then
						TriggerServerEvent('kontorr')
					else
						ESX.ShowNotification('Du har redan en nyckel på dig')
                    end

			elseif data.current.value == 'rakell' then
				local inventory = ESX.GetPlayerData().inventory
                local rakels = nil
                    for i=1, #inventory, 1 do                          
                    	if inventory[i].name == "radio" then
                            rakels = inventory[i].count
                        end
                    end

                    if rakels == 0 then
						TriggerServerEvent('rakell')
					else
						ESX.ShowNotification('Du har redan en komradio på dig')
					end

				elseif data.current.value == 'kit' then
							TriggerServerEvent('kit')
							ESX.ShowNotification('Du tog ut 5 stycken förstahjälpen')

						elseif data.current.value == 'tram' then
							TriggerServerEvent('tram')
							ESX.ShowNotification('Du tog ut 5 stycken Tramadol')

						elseif data.current.value == 'vaccin' then
							TriggerServerEvent('vaccin')
							ESX.ShowNotification('Du tog ut 5 stycken COVID 19 Vaccin')

					elseif data.current.value == 'bandage' then
							TriggerServerEvent('bandage')
							ESX.ShowNotification('Du tog ut 10 stycken bandage')
					end
        end,
        function(data, menu)
            menu.close()
        end
    )
end


function OpenPutStocksMenu()

	ESX.TriggerServerCallback('esx_ambulancejob:getPlayerInventory', function(inventory)
  
	  local elements = {}
  
	  for i=1, #inventory.items, 1 do
  
		local item = inventory.items[i]
  
		if item.count > 0 then
		  table.insert(elements, {label = item.label .. ' x' .. item.count, type = 'item_standard', value = item.name})
		end
  
	  end
  
	  ESX.UI.Menu.Open(
		'default', GetCurrentResourceName(), 'stocks_menu',
		{
		  title    = ('Ambulansen | Förråd'),
		  align = 'right',
		  elements = elements
		},
		function(data, menu)
  
		  local itemName = data.current.value
  
		  ESX.UI.Menu.Open(
			'dialog', GetCurrentResourceName(), 'stocks_menu_put_item_count',
			{
			  title = ('Hur många?')
			},
			function(data2, menu2)
  
			  local count = tonumber(data2.value)
  
			  if count == nil then
				 ESX.ShowNotification('Fel summa', 2)
			  else
				menu2.close()
				menu.close()
				OpenPutStocksMenu()
  
				TriggerServerEvent('esx_ambulancejob:putStockItems', itemName, count)
			  end
  
			end,
			function(data2, menu2)
			  menu2.close()
			end
		  )
  
		end,
		function(data, menu)
		  menu.close()
		end
	  )
  
	end)
  
  end

  function OpenGetStocksMenu()

	ESX.TriggerServerCallback('esx_ambulancejob:getStockItems', function(items)
  
	  print(json.encode(items))
  
	  local elements = {}
  
	  for i=1, #items, 1 do
		table.insert(elements, {label = 'x' .. items[i].count .. ' ' .. items[i].label, value = items[i].name})
	  end
  
	  ESX.UI.Menu.Open(
		'default', GetCurrentResourceName(), 'stocks_menu',
		{
		  title    = ('Ta ut föremål'),
		  align = 'right',
		  elements = elements
		},
		function(data, menu)
  
		  local itemName = data.current.value
  
		  ESX.UI.Menu.Open(
			'dialog', GetCurrentResourceName(), 'stocks_menu_get_item_count',
			{
			  title = ('Hur många?')
			},
			function(data2, menu2)
  
			  local count = tonumber(data2.value)
  
			  if count == nil then
				ESX.ShowNotification('Fel summa', 2)
			  else
				menu2.close()
				menu.close()
				OpenGetStocksMenu()
  
				TriggerServerEvent('esx_ambulancejob:getStockItem', itemName, count)
			  end
  
			end,
			function(data2, menu2)
			  menu2.close()
			end
		  )
  
		end,
		function(data, menu)
		  menu.close()
		end
	  )
  
	end)
  
  end
  
  AddEventHandler('playerSpawned', function()
	  IsDead = false
  
	  if FirstSpawn then
		  TriggerServerEvent('esx_ambulancejob:firstSpawn')
		  exports.spawnmanager:setAutoSpawn(false) -- disable respawn
		  FirstSpawn = false
	  end
  end)
  
  RegisterNetEvent('esx_ambulancejob:multicharacter')
  AddEventHandler('esx_ambulancejob:multicharacter', function()
	  IsDead = false
  
	  if FirstSpawn then
		  exports.spawnmanager:setAutoSpawn(false) -- disable respawn
		  FirstSpawn = false
  
		  ESX.TriggerServerCallback('esx_ambulancejob:getDeathStatus', function(isDead)
			  if isDead and Config.AntiCombatLog then
				  while not PlayerLoaded do
					  Citizen.Wait(1000)
				  end
  
				  ESX.ShowNotification(_U('combatlog_message'))
				  RemoveItemsAfterRPDeath()
			  end
		  end)
	  end
  end)
  
  RegisterNetEvent('esx:playerLoaded')
  AddEventHandler('esx:playerLoaded', function(xPlayer)
	PlayerData = xPlayer
  end)
  
  RegisterNetEvent('esx:setJob')
  AddEventHandler('esx:setJob', function(job)
	PlayerData.job = job
  end)
  
  RegisterNetEvent('esx_phone:loaded')
  AddEventHandler('esx_phone:loaded', function(phoneNumber, contacts)
  
	local specialContact = {
	  name       = 'Ambulance',
	  number     = 'ambulance',
	  base64Icon = 'data:image/png;base64,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'
	}
  
	TriggerEvent('esx_phone:addSpecialContact', specialContact.name, specialContact.number, specialContact.base64Icon)
  
  end)
  
  AddEventHandler('esx:onPlayerDeath', function(reason)
	  OnPlayerDeath()
  end)
  

  RegisterNetEvent('esx_ambulancejob:revive')
  AddEventHandler('esx_ambulancejob:revive', function()

	  local playerPed = GetPlayerPed(-1)
	  local coords    = GetEntityCoords(playerPed)
  
	  Citizen.CreateThread(function()
  
		  DoScreenFadeOut(500)
  
		  while not IsScreenFadedOut() do
			  Citizen.Wait(0)
		  end
  
		  ESX.SetPlayerData('lastPosition', {
			  x = coords.x,
			  y = coords.y,
			  z = coords.z
		  })
  
		  TriggerServerEvent('esx:updateLastPosition', {
			  x = coords.x,
			  y = coords.y,
			  z = coords.z
		  })
  
		  RespawnPed(playerPed, {
			  x = coords.x,
			  y = coords.y,
			  z = coords.z
		  })
  
		  StopScreenEffect('DeathFailOut')
  
		  DoScreenFadeIn(500)
  
	  end)
  end)
  
  AddEventHandler('esx_ambulancejob:hasEnteredMarker', function(zone)
  
	if zone == 'HospitalInteriorEntering1' then
	  TeleportFadeEffect(GetPlayerPed(-1), Config.Zones.HospitalInteriorInside1.Pos)
	end
  
	if zone == 'HospitalInteriorExit1' then
	  TeleportFadeEffect(GetPlayerPed(-1), Config.Zones.HospitalInteriorOutside1.Pos)
	end
  
	if zone == 'HospitalInteriorEntering2' then
		  local heli = Config.HelicopterSpawner
  
		  if not IsAnyVehicleNearPoint(heli.SpawnPoint.x, heli.SpawnPoint.y, heli.SpawnPoint.z, 3.0)
			  and PlayerData.job ~= nil and PlayerData.job.name == 'ambulance' then
			  ESX.Game.SpawnVehicle('supervolito', {
				  x = heli.SpawnPoint.x,
				  y = heli.SpawnPoint.y,
				  z = heli.SpawnPoint.z
			  }, heli.Heading, function(vehicle)
				  SetVehicleModKit(vehicle, 0)
				  SetVehicleLivery(vehicle, 1)
			  end)
  
		  end
	  TeleportFadeEffect(GetPlayerPed(-1), Config.Zones.HospitalInteriorInside2.Pos)
	end
  
	if zone == 'HospitalInteriorExit2' then
	  TeleportFadeEffect(GetPlayerPed(-1), Config.Zones.HospitalInteriorOutside2.Pos)
	end
  
	if zone == 'ParkingDoorGoOutInside' then
	  TeleportFadeEffect(GetPlayerPed(-1), Config.Zones.ParkingDoorGoOutOutside.Pos)
	end
  
	if zone == 'ParkingDoorGoInOutside' then
	  TeleportFadeEffect(GetPlayerPed(-1), Config.Zones.ParkingDoorGoInInside.Pos)
	end
  
	if zone == 'StairsGoTopBottom' then
	  CurrentAction     = 'fast_travel_goto_top'
	  CurrentActionMsg  = _U('fast_travel')
	  CurrentActionData = {pos = Config.Zones.StairsGoTopTop.Pos}
	end
  
	if zone == 'StairsGoBottomTop' then
	  CurrentAction     = 'fast_travel_goto_bottom'
	  CurrentActionMsg  = _U('fast_travel')
	  CurrentActionData = {pos = Config.Zones.StairsGoBottomBottom.Pos}
	end
  
	if zone == 'AmbulanceActions' then
	  CurrentAction     = 'ambulance_actions_menu'
	  CurrentActionMsg  = _U('open_menu')
	  CurrentActionData = {}
	end
  
	if zone == 'VehicleSpawner' then
	  CurrentAction     = 'vehicle_spawner_menu'
	  CurrentActionMsg  = _U('veh_spawn')
	  CurrentActionData = {}
	end
  
	if zone == 'Pharmacy' then
	  CurrentAction     = 'pharmacy'
	  CurrentActionMsg  = _U('open_pharmacy')
	  CurrentActionData = {}
	end
  
	if zone == 'VehicleDeleter' then
  
	  local playerPed = GetPlayerPed(-1)
	  local coords    = GetEntityCoords(playerPed)
  
	  if IsPedInAnyVehicle(playerPed,  false) then
  
		local vehicle, distance = ESX.Game.GetClosestVehicle({
		  x = coords.x,
		  y = coords.y,
		  z = coords.z
		})
  
		if distance ~= -1 and distance <= 1.0 then
  
		  CurrentAction     = 'delete_vehicle'
		  CurrentActionMsg  = _U('store_veh')
		  CurrentActionData = {vehicle = vehicle}
  
		end
  
	  end
  
	end
  
  end)
  
  function FastTravel(pos)
	  TeleportFadeEffect(GetPlayerPed(-1), pos)
  end
  
  AddEventHandler('esx_ambulancejob:hasExitedMarker', function(zone)
	ESX.UI.Menu.CloseAll()
	CurrentAction = nil
  end)
  
  -- Create blips
  Citizen.CreateThread(function()
  
	local blip = AddBlipForCoord(Config.Blip.Pos.x, Config.Blip.Pos.y, Config.Blip.Pos.z)
  
	SetBlipSprite (blip, Config.Blip.Sprite)
	SetBlipDisplay(blip, Config.Blip.Display)
	SetBlipScale  (blip, Config.Blip.Scale)
	SetBlipColour (blip, Config.Blip.Colour)
	SetBlipAsShortRange(blip, true)
  
	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString(_U('hospital'))
	EndTextCommandSetBlipName(blip)
  
  end)
  
  -- Display markers
  Citizen.CreateThread(function()
	while true do
	  Citizen.Wait(0)
  
	  local coords = GetEntityCoords(GetPlayerPed(-1))
	  for k,v in pairs(Config.Zones) do
		if(v.Type ~= -1 and GetDistanceBetweenCoords(coords, v.Pos.x, v.Pos.y, v.Pos.z, true) < Config.DrawDistance) then
				  if PlayerData.job ~= nil and PlayerData.job.name == 'ambulance' then
					  DrawMarker(v.Type, v.Pos.x, v.Pos.y, v.Pos.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, Config.MarkerSize.x, Config.MarkerSize.y, Config.MarkerSize.z, Config.MarkerColor.r, Config.MarkerColor.g, Config.MarkerColor.b, 100, false, true, 2, false, false, false, false)
				  elseif k ~= 'AmbulanceActions' and k ~= 'VehicleSpawner' and k ~= 'VehicleDeleter'
					  and k ~= 'Pharmacy' and k ~= 'StairsGoTopBottom' and k ~= 'StairsGoBottomTop' then
					  DrawMarker(v.Type, v.Pos.x, v.Pos.y, v.Pos.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, Config.MarkerSize.x, Config.MarkerSize.y, Config.MarkerSize.z, Config.MarkerColor.r, Config.MarkerColor.g, Config.MarkerColor.b, 100, false, true, 2, false, false, false, false)
				  end
		end
	  end
	end
  end)
  
  local working
  
  
  
  -- Activate menu when player is inside marker
  Citizen.CreateThread(function()
	  while true do
		  Citizen.Wait(0)
		  
		  local coords      = GetEntityCoords(GetPlayerPed(-1))
		  local isInMarker  = false
		  local currentZone = nil
		  for k,v in pairs(Config.Zones) do
			  if PlayerData.job ~= nil and PlayerData.job.name == 'ambulance' then
				  if(GetDistanceBetweenCoords(coords, v.Pos.x, v.Pos.y, v.Pos.z, true) < Config.MarkerSize.x) then
					  isInMarker  = true
					  currentZone = k
				  end
			  elseif k ~= 'AmbulanceActions' and k ~= 'VehicleSpawner' and k ~= 'VehicleDeleter' and k ~= 'Pharmacy' and k ~= 'StairsGoTopBottom' and k ~= 'StairsGoBottomTop' then
				  if(GetDistanceBetweenCoords(coords, v.Pos.x, v.Pos.y, v.Pos.z, true) < Config.MarkerSize.x) then
					  isInMarker  = true
					  currentZone = k
				  end
			  end
		  end
		  if isInMarker and not hasAlreadyEnteredMarker then
			  hasAlreadyEnteredMarker = true
			  lastZone                = currentZone
			  TriggerEvent('esx_ambulancejob:hasEnteredMarker', currentZone)
		  end
		  
		  if not isInMarker and hasAlreadyEnteredMarker then
			  hasAlreadyEnteredMarker = false
			  TriggerEvent('esx_ambulancejob:hasExitedMarker', lastZone)
		  end
	  end
  end)
  
  -- Key Controls
  Citizen.CreateThread(function()
	while true do
  
	  Citizen.Wait(0)
  
	  if CurrentAction ~= nil then
  
		SetTextComponentFormat('STRING')
		AddTextComponentString(CurrentActionMsg)
		DisplayHelpTextFromStringLabel(0, 0, 1, -1)
  
		if IsControlJustReleased(0, 38) and PlayerData.job ~= nil and PlayerData.job.name == 'ambulance' then
  
		  if CurrentAction == 'ambulance_actions_menu' then
			OpenAmbulanceActionsMenu()
		  end
  
		  if CurrentAction == 'vehicle_spawner_menu' then
			OpenVehicleSpawnerMenu()
		  end
  
		  if CurrentAction == 'pharmacy' then
			OpenPharmacyMenu()
		  end
  
		  if CurrentAction == 'fast_travel_goto_top' or CurrentAction == 'fast_travel_goto_bottom' then
			 FastTravel(CurrentActionData.pos)
		  end
  
		  if CurrentAction == 'delete_vehicle' then
			if Config.EnableSocietyOwnedVehicles then
			  local vehicleProps = ESX.Game.GetVehicleProperties(CurrentActionData.vehicle)
			  TriggerServerEvent('esx_society:putVehicleInGarage', 'ambulance', vehicleProps)
			end
			ESX.Game.DeleteVehicle(CurrentActionData.vehicle)
		  end
  
		  CurrentAction = nil
  
		end
  
	  end
  
	  if IsControlJustReleased(0, 167) and PlayerData.job ~= nil and PlayerData.job.name == 'ambulance' and not IsDead then
		OpenMobileAmbulanceActionsMenu()
	  end
  
	end
  end)
  
  RegisterNetEvent('esx_ambulancejob:requestDeath')
  AddEventHandler('esx_ambulancejob:requestDeath', function()
	  if Config.AntiCombatLog then
		  Citizen.Wait(5000)
		  SetEntityHealth(GetPlayerPed(-1), 0)
	  end
  end)
  
  
  RegisterNetEvent('esx_policejob:putInVehicle')
  AddEventHandler('esx_policejob:putInVehicle', function()
	  local playerPed = PlayerPedId()
	  local coords    = GetEntityCoords(playerPed)
  
	  if IsAnyVehicleNearPoint(coords.x, coords.y, coords.z, 5.0) then
  
		  local vehicle = GetClosestVehicle(coords.x, coords.y, coords.z, 5.0, 0, 71)
  
		  if DoesEntityExist(vehicle) then
  
			  local maxSeats = GetVehicleMaxNumberOfPassengers(vehicle)
			  local freeSeat = nil
  
			  for i=maxSeats - 1, 0, -1 do
				  if IsVehicleSeatFree(vehicle, i) then
					  freeSeat = i
					  break
				  end
			  end
  
			  if freeSeat ~= nil then
				  TaskWarpPedIntoVehicle(playerPed, vehicle, freeSeat)
				  DragStatus.IsDragged = false
			  end
  
		  end
  
	  end
  end)
  
  RegisterNetEvent('esx_policejob:OutVehicle')
  AddEventHandler('esx_policejob:OutVehicle', function()
	  local playerPed = PlayerPedId()
  
	  if not IsPedSittingInAnyVehicle(playerPed) then
		  return
	  end
  
	  local vehicle = GetVehiclePedIsIn(playerPed, false)
	  TaskLeaveVehicle(playerPed, vehicle, 16)
  end)
  
  -- Load unloaded IPLs
  if Config.LoadIpl then
	  Citizen.CreateThread(function()
		  LoadMpDlcMaps()
		  EnableMpDlcMaps(true)
		  RequestIpl('Coroner_Int_on') -- Morgue
	  end)
  end
  
  -- String string
  function stringsplit(inputstr, sep)
	if sep == nil then
		sep = "%s"
	end
	local t={} ; i=1
	for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
		t[i] = str
		i = i + 1
	end
	return t
  end
  