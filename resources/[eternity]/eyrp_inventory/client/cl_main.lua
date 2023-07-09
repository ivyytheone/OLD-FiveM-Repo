Inventory = {}
ESX = {}

TriggerEvent('esx:getSharedObject', function(library) 
	ESX = library 
end)

Inventory.LoadPlayer = function()
	SetNuiFocus(false, false)
	SetNuiFocusKeepInput(false)

	ESX.TriggerServerCallback('eyrp_inventory:GetPublicData', function(data)
		Inventory.Public = data.Public;
		Inventory.GroundItems = data.GroundItems;
		Inventory.NearItems = {}
		Inventory.PlayerInv = data.PlayerInventories
	end)

	Citizen.Wait(500);

	local Items = {};

	for i=1, #ESX.PlayerData.inventory, 1 do
		if ESX.PlayerData.inventory[i].count > 0 then
			if Config.Items[ESX.PlayerData.inventory[i].name] and Config.Items[ESX.PlayerData.inventory[i].name].weapon then
				table.insert(Items, {
					name = ESX.PlayerData.inventory[i].name,
					uuid = Inventory.GenerateUUID()
				})
			else
				for a = 1, ESX.PlayerData.inventory[i].count or 1 do
					table.insert(Items, {
						name = ESX.PlayerData.inventory[i].name,
						uuid = Inventory.GenerateUUID()
					})
				end
			end
		end
	end

	Inventory.Player = {};
	Inventory.PlayerInventories = {};

	for i = 1, #Config.Inventory.Defaults do
        local data = Config.Inventory.Defaults[i];
		local name = (data.name..'-%s'):format(Inventory.GenerateUUID())
		
		table.insert(Inventory.PlayerInventories, name);
		TriggerServerEvent('eyrp_inventory:eventHandler', 'AddPlayerInventory', name);

		if not Inventory.DoesTabExist(name) then
			Inventory.CreateTab({
				name = name,
				inventory = data.inventory,
				data = data.data,
				items = (Inventory.PlayerInv and Inventory.PlayerInv[data.name]) and Inventory.PlayerInv[data.name] or {}
			})
		end

		table.insert(Inventory.Player, name)
	end
end

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(d)
	TriggerEvent('esx:getSharedObject', function(library) 
		ESX = library 
	end)

	ESX.PlayerData = d

	Inventory.LoadPlayer()
end)

AddEventHandler('onResourceStart', function(res)
	if res == GetCurrentResourceName() then
		Inventory.LoadPlayer()
	end
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	ESX.PlayerData['job'] = job
end)

RegisterNetEvent('closeallui')
AddEventHandler('closeallui', function()
	SendNUIMessage({
		event = 'CloseInventory'
	})
end)

RegisterNetEvent('eyrp_inventory:eventHandler')
AddEventHandler('eyrp_inventory:eventHandler', function(event, data)
	if event == 'CreateTab' then
		if not Inventory.Public then Inventory.Public = {} end;

		if Inventory.DoesTabExist(data.name) then return end;

		table.insert(Inventory.Public, data)
	elseif event == 'RemoveTab' then

	elseif event == 'AddItem' then
		local Tab = Inventory.GetTab(data.name);

		if not Tab.items then Tab.items = {} end;

		table.insert(Tab.items, data.item)

		if Inventory.IsTabOpened(data.name) then
			data.insert = true;

			SendNUIMessage({
				event = 'AddItem',
				data = data
			})
		end

	elseif event == 'RemoveItem' then
		local Tab = Inventory.GetTab(data.name);

		if not Tab.items then Tab.items = {} end;

		for i = 1, #Tab.items do
			if Tab.items[i].uuid == data.item.uuid then
				table.remove(Tab.items, i)
				break
			end
		end

		if Inventory.IsTabOpened(data.name) then
			data.remove = true;
			
			SendNUIMessage({
				event = 'RemoveItem',
				data = data
			})
		end

	elseif event == 'UpdateItem' then
		local Tab = Inventory.GetTab(data.name);

		if not Tab.items then Tab.items = {} end;

		for i = 1, #Tab.items do
			if Tab.items[i].uuid == data.item.uuid then
				Tab.items[i].data = data.item.data
				break
			end
		end

		if Inventory.IsTabOpened(data.name) then
			SendNUIMessage({
				event = 'UpdateItem',
				data = data
			})
		end

	elseif event == 'AddGround' then
		table.insert(Inventory.GroundItems, data)
	elseif event == 'RemoveGround' then
		for i = 1, #Inventory.GroundItems do
			if (Inventory.GroundItems[i].item['uuid'] == data.uuid) then
				DeleteObject(NetToObj(Inventory.GroundItems[i].NetId));
				table.remove(Inventory.GroundItems, i)

				for item = 1, #Inventory.NearItems do
					if (Inventory.NearItems[item].uuid == data.uuid) then
						if Inventory.Opened then
                            SendNUIMessage({
                                event = 'RemoveGround',
                                data = Inventory.NearItems[item]
                            })
						end
						
                        table.remove(Inventory.NearItems, item)

                        break
                    end
				end
				
				break
			end
		end
	elseif event == 'CloseInventory' then
		SendNUIMessage({
			event = 'CloseInventory'
		})
	end
end)

Citizen.CreateThread(function()
	while true do
		local player = PlayerPedId();

		HideHudComponentThisFrame(19)
        HideHudComponentThisFrame(20)
        HideHudComponentThisFrame(21)
        HideHudComponentThisFrame(22)
		DisableControlAction(0, 37, true)

		while not Inventory.Player do
			Citizen.Wait(0)
		end

		if Inventory.Opened then
			DisableControlAction(1, 1, true) -- Disable looking horizontally
			DisableControlAction(1, 2, true) -- Disable looking vertically
			DisablePlayerFiring(player, true) -- Disable weapon firing
			DisableControlAction(1, 142, true) -- Disable aiming
			DisableControlAction(1, 106, true) -- Disable in-game mouse controls
			DisableControlAction(0, 81, true) -- Disabling next radio with scrollwheel
			DisableControlAction(0, 82, true) -- Disabling previous radio with scrollwheel

			DisableControlAction(1, Config.OpenInventoryKey, true)
			DisableControlAction(1, 200, true) --pause
			DisableControlAction(1, 288, true)
			DisableControlAction(1, 38, true)
		-- else
			-- if not IsPedDeadOrDying(player) and IsDisabledControlJustReleased(0, Config.OpenInventoryKey) then
			-- 	Inventory.OpenInventory()
			-- end
		end

		for id = 1, #Config.Hotbars do
			if IsDisabledControlJustReleased(0, Config.Hotbars[id]) then
				if Inventory.Holding == id then
					RemoveAllPedWeapons(player, false);

					if DoesEntityExist(Inventory.HoldingObject) then
						DeleteObject(Inventory.HoldingObject)
					end

					TriggerEvent('Inventory:Hotkey', Inventory.GetHotbarItem(Inventory.Holding - 1), false)

					Inventory.Holding = nil;
				else
					Inventory.Holding = id;

					RemoveAllPedWeapons(player, false);

					if DoesEntityExist(Inventory.HoldingObject) then
						DeleteObject(Inventory.HoldingObject)
					end

					local Item = Inventory.GetHotbarItem(id - 1);

					if Item then
						local Data = Config.Items[Item.name];

						if Data.weapon then
							GiveWeaponToPed(player, GetHashKey(Data.weapon), Item.data['ammo'] and tonumber(Item.data['ammo']) or 0, false, true);
						else
							Inventory.HoldingObject = CreateObject(GetHashKey(Data.prop), GetEntityCoords(player) + vector3(0.0, 0.0, 0.2), true, true, true);

							AttachEntityToEntity(Inventory.HoldingObject, player, GetPedBoneIndex(player, 18905), 0.13, 0.05, 0.02, -180.0, 16.0, 60.0, true, true, false, true, 1, true);
							SetModelAsNoLongerNeeded(Data.prop);

							TriggerEvent('Inventory:Hotkey', Inventory.GetHotbarItem(Inventory.Holding - 1), true, function()
								if DoesEntityExist(Inventory.HoldingObject) then
									DeleteObject(Inventory.HoldingObject)
								end
							end)
						end
					end
				end
			end
		end

		if Inventory.Holding then
			local Item = Inventory.GetHotbarItem(Inventory.Holding - 1);

			if Item then
				local Data = Config.Items[Item.name];

				if Data.weapon then
					if Item.data['ammo'] then
						-- local ammo = GetAmmoInPedWeapon(player, GetHashKey(Data.weapon))
						-- local retval, clip = GetAmmoInClip(player, GetHashKey(Data.weapon))

						-- if tonumber(Item.data['ammo']) ~= (ammo + clip) then
						-- 	Item.data['ammo'] = tostring(ammo + clip)
						-- end

						if IsPedShooting(PlayerPedId()) and not Inventory.IsShooting then
							Inventory.IsShooting = true;
						elseif Inventory.IsShooting and IsControlJustReleased(0, 24) then
							Inventory.IsShooting = false;
							
							local CurrentAmmo = GetAmmoInPedWeapon(PlayerPedId(), GetHashKey(Data.weapon));

							if CurrentAmmo ~= Item.data['ammo'] then
								Item.data['ammo'] = CurrentAmmo

								for i = 1, #Inventory.PlayerInventories do
									if string.find(Inventory.PlayerInventories[i], 'pocket') then 
										TriggerServerEvent('eyrp_inventory:eventHandler', 'UpdateItem', {
											name = Inventory.PlayerInventories[i],
											item = {
												uuid = Item.uuid,
												data = Item.data
											}
										})
										break
									end
								end
							end
						end
					end
				else
					if Inventory.CurrentWeapon then
						Inventory.CurrentWeapon = nil;
						Inventory.IsShooting = false 
					end
				end
			else
				RemoveAllPedWeapons(player, false);

				if DoesEntityExist(Inventory.HoldingObject) then
					DeleteObject(Inventory.HoldingObject)
				end

				Inventory.Holding = nil;
			end
		end

		Citizen.Wait(0)
	end
end)

Inventory.OpenInventory = function()
	Inventory.Opened = true;

	SetNuiFocus(true, true);
	SetNuiFocusKeepInput(true);

	local Tabs = {};
	local Cash;
	local Job;

	for i = 1, #Inventory.Player do
        table.insert(Tabs, Inventory.GetTab(Inventory.Player[i]))
	end;
	
	table.insert(Tabs, {
		name = 'ground',
		inventory = 'other',
		items = Inventory.NearItems or {},
		slots = Config.Inventory.Slots['ground'],
		title = Config.Inventory.Titles['ground'],
	});


	ESX.TriggerServerCallback('GetJobAndCash', function(Response)
		if Response then
			Cash = Response.Cash;
			Job = Response.Job
		end
	end)

	while not Cash or not Job do
		Citizen.Wait(1)
	end

	
    local Items = Config.Items

    for k, v in pairs(Items) do
        if v.buttons then
            for i=1, #v.buttons do
                v.buttons[i].func = nil
            end
        end
    end
    
    SendNUIMessage({
        event = 'OpenInventory',
        data = {
            Items = Items,
            Config = Config.Inventory,
            Tabs = Tabs,
            Cash = Cash,
            Job = Job
        }
    })
end

Inventory.CloseInventory = function()
	SetNuiFocus(false);
	SetNuiFocusKeepInput(false);
	
	TriggerEvent('CloseInventory');

	Citizen.Wait(550); 	Inventory.Opened = false;
end

Inventory.EventHandler = function(event, data)
	if event == 'AddGround' then
		while not HasAnimDictLoaded('random@domestic') do
			RequestAnimDict('random@domestic')

			Citizen.Wait(150)
		end

		TaskPlayAnim(PlayerPedId(), 'random@domestic', 'pickup_low', 3.0, -1, -1, 0, 0, false, false, false);

		local Coords = GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 0.6, 0.0);
		
		data = {
			coords = {Coords.x, Coords.y, Coords.z};
			item = data
		}

		Citizen.Wait(200)
	elseif event == 'RemoveGround' then
		while not HasAnimDictLoaded('random@domestic') do
			RequestAnimDict('random@domestic')

			Citizen.Wait(150)
		end

		TaskPlayAnim(PlayerPedId(), 'random@domestic', 'pickup_low', 3.0, -1, -1, 0, 0, false, false, false);

		Citizen.Wait(200)
	end

	if event == 'CloseInventory' then
		Inventory.CloseInventory()
		return
    end

    TriggerServerEvent('eyrp_inventory:eventHandler', event, data)
end

function RegisterChangableKey(type, description, key, cb)
    RegisterKeyMapping(type, description or "Ny key", "keyboard", key)
    
    RegisterCommand(type, cb)
end

RegisterChangableKey("inventory", "Öppna inventory", "F2", function()
    if IsPedDeadOrDying(PlayerPedId()) then return end
    
    Inventory.OpenInventory()
end)

RegisterCommand("closeinv", function() 
	SendNUIMessage({
        event = 'CloseInventory'
    })

	SetNuiFocus(false, false)
end)