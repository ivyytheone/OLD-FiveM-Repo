ESX = nil

currentlyBarbershop = 0
currentlyChair = 0
choosing = false
sitting = false
pricetoPay = 0
cam = nil

Citizen.CreateThread(function()
	while not ESX do

		TriggerEvent("esx:getSharedObject", function(library) 
			ESX = library 
		end)

		Citizen.Wait(0)
	end

	for k,v in pairs(Config["barberShops"]) do
		local blip = AddBlipForCoord(v["markerPos"])

		SetBlipSprite (blip, 71)
		SetBlipColour (blip, 4)
		SetBlipScale  (blip, 0.6)
		SetBlipAsShortRange(blip, true)

		BeginTextCommandSetBlipName('STRING')
		AddTextComponentSubstringPlayerName(Strings["blipName"])
		EndTextCommandSetBlipName(blip)
	end

	while true do
		local sleep = 1000

		local playerPed = PlayerPedId()
		local coords = GetEntityCoords(playerPed)
		for place,v in pairs(Config["barberShops"]) do
			local dst = GetDistanceBetweenCoords(coords, v["markerPos"])
			if dst <= 10 then
				sleep = 5
				DrawAdvancedMarker({
					["type"] = 6,
					["pos"] = v["markerPos"] - vector3(0.0, 0.0, 0.985),
					["r"] = 55,
					["g"] = 255,
					["b"] = 55,
					["sizeX"] = 0.8,
					["sizeY"] = 0.8,
					["sizeZ"] = 0.8,
					["rotate"] = true
				})
				if dst <= 0.7 then
					help(Strings["press_e"]:format(Config["price"]))
					if IsControlJustReleased(0, 38) then
						for k,v in ipairs(Config["barberShops"][place]["chairs"]) do
							if not v["active"] then
								currentlyChair = k
							end
						end
						TriggerServerEvent('nxrp-barbershop:active', place, currentlyChair, true)
						currentlyBarbershop = place
						DoScreenFadeOut(1000)
						Wait(1000)
						FreezeEntityPosition(playerPed, true)
						SetEntityCoords(playerPed, Config["barberShops"][place]["chairs"][currentlyChair]["pos"] - vector3(0, 0, 0.3))
						SetEntityHeading(playerPed, Config["barberShops"][place]["chairs"][currentlyChair]["heading"])
						SpawnPed()
						Wait(1200)
						DoScreenFadeIn(1500)
						sitting = true
						choosing = true
						while sitting do Wait(0)
							loadDict("amb@code_human_in_bus_passenger_idles@male@sit@base")
							TaskPlayAnim(playerPed, "amb@code_human_in_bus_passenger_idles@male@sit@base", "base", 3.5, -8, -1, 2, 0, 0, 0, 0, 0)
							if not DoesCamExist(cam) then
								cam = CreateCam('DEFAULT_SCRIPTED_CAMERA', true)
							end
							SetCamActive(cam,  true)
							RenderScriptCams(true,  false,  0,  true,  true)
							local coords = GetEntityCoords(playerPed)
							local heading = GetEntityHeading(playerPed)
							local rotation = GetEntityRotation(playerPed)
							SetCamCoord(cam, (GetEntityForwardX(playerPed) * 1.0) + coords.x, (GetEntityForwardY(playerPed) * 1.0) +  coords.y, coords.z + 0.6)
							PointCamAtCoord(cam, coords + vector3(0, 0, 0.5))
							while choosing do Wait(0)
								for i = 0, 31 do
									DisableAllControlActions(i)
								end
								LongHelpText(Strings["inBarber"]:format(Config["prices"]["hair"], Config["prices"]["beard"], Config["prices"]["eyebrows"], pricetoPay))
								if IsDisabledControlJustReleased(0, 173) then
									local elements = {}
									TriggerEvent('skinchanger:getSkin', function(skin)
										table.insert(elements, 
										{
										["label"] = "Hår",
										["usage"] = "hair",
										["value"] = skin["hair_1"],
										["type"] = 'slider',
										["min"] = 0,
										["max"] = GetNumberOfPedDrawableVariations(playerPed, 2) -1
										})
										table.insert(elements,
										{
										["label"] = "Hårfärg",
										["usage"] = "haircolor",
										["value"] = skin["hair_color_1"],
										["type"] = 'slider',
										["min"] = 0,
										["max"] = GetNumHairColors() -1
										})
									end)
									ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'changehairstyle', 
									{
										["title"] = "Ändra frisyr",
										["align"] = "right",
										["elements"] = elements
									}, function(data, menu)
										TriggerEvent('skinchanger:getSkin', function(skin)
											TriggerEvent('skinchanger:loadSkin', skin)
											TriggerServerEvent('esx_skin:save', skin)
										end)
										FreezeEntityPosition(ped, false)
										loadDict("misshair_shop@hair_dressers")
										TaskPlayAnim(ped, "misshair_shop@hair_dressers", "keeper_hair_cut_a", 3.5, -8, -1, 2, 0, 0, 0, 0, 0)
										menu.close()
										Wait(1000)
										Changehairstyle(data.current.usage, data.current.value)
										Wait(10000)
										pricetoPay = pricetoPay + Config["prices"]["hair"]
										choosing = true
									end, function(data, menu)
										menu.close()
										ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
											TriggerEvent('skinchanger:loadSkin', skin) 
										end)
										choosing = true
									end, function(data, menu)
										Changehairstyle(data.current.usage, data.current.value)
									end
									)
									choosing = false
								elseif IsDisabledControlJustReleased(0, 172) then
									local elements = {}
									TriggerEvent('skinchanger:getSkin', function(skin)
										table.insert(elements, 
										{
										["label"] = "Skäggtyp",
										["usage"] = "beard",
										["value"] = skin["beard_1"],
										["type"] = 'slider',
										["min"] = 0,
										["max"] = GetNumHeadOverlayValues(1)-1,
										})
										table.insert(elements,
										{
										["label"] = "Skägg tjocklek",
										["usage"] = "beardsize",
										["value"] = skin["beard_2"],
										["type"] = 'slider',
										["min"] = 0,
										["max"] = 10
										})
										table.insert(elements,
										{
										["label"] = "Skäggfärg",
										["usage"] = "beardcolor",
										["value"] = skin["beard_3"],
										["type"] = 'slider',
										["min"] = 0,
										["max"] = GetNumHairColors()-1,
										})
									end)
									ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'changebeard', 
									{
										["title"] = "Ändra skägg",
										["align"] = "right",
										["elements"] = elements
									}, function(data, menu)
										TriggerEvent('skinchanger:getSkin', function(skin)
											TriggerEvent('skinchanger:loadSkin', skin)
											TriggerServerEvent('esx_skin:save', skin)
										end)
										FreezeEntityPosition(ped, false)
										loadDict("misshair_shop@hair_dressers")
										TaskPlayAnim(ped, "misshair_shop@hair_dressers", "keeper_hair_cut_a", 3.5, -8, -1, 2, 0, 0, 0, 0, 0)
										menu.close()
										Wait(1000)
										Changehairstyle(data.current.usage, data.current.value)
										Wait(10000)
										pricetoPay = pricetoPay + Config["prices"]["beard"]
										choosing = true
									end, function(data, menu)
										menu.close()
										ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
											TriggerEvent('skinchanger:loadSkin', skin) 
										end)
										choosing = true
									end, function(data, menu)
										Changehairstyle(data.current.usage, data.current.value)
									end
									)
									choosing = false
								elseif IsDisabledControlJustReleased(0, 174) then
									local elements = {}
									TriggerEvent('skinchanger:getSkin', function(skin)
										table.insert(elements, 
										{
										["label"] = "Ögonbryn",
										["usage"] = "eyebrow",
										["value"] = skin["eyebrows_1"],
										["type"] = 'slider',
										["min"] = 0,
										["max"] = GetNumHeadOverlayValues(2)-1,
										})
										table.insert(elements,
										{
										["label"] = "Ögonbryn tjocklek",
										["usage"] = "eyebrowsize",
										["value"] = skin["eyebrows_2"],
										["type"] = 'slider',
										["min"] = 0,
										["max"] = 10
										})
										table.insert(elements,
										{
										["label"] = "Ögonbrynfärg",
										["usage"] = "eyebrowcolor",
										["value"] = skin["eyebrows_3"],
										["type"] = 'slider',
										["min"] = 0,
										["max"] = GetNumHairColors()-1,
										})
									end)
									ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'changeeyebrows', 
									{
										["title"] = "Ändra ögonbryn",
										["align"] = "right",
										["elements"] = elements
									}, function(data, menu)
										TriggerEvent('skinchanger:getSkin', function(skin)
											TriggerEvent('skinchanger:loadSkin', skin)
											TriggerServerEvent('esx_skin:save', skin)
										end)
										FreezeEntityPosition(ped, false)
										loadDict("misshair_shop@hair_dressers")
										TaskPlayAnim(ped, "misshair_shop@hair_dressers", "keeper_hair_cut_a", 3.5, -8, -1, 2, 0, 0, 0, 0, 0)
										menu.close()
										Wait(1000)
										Changehairstyle(data.current.usage, data.current.value)
										Wait(10000)
										pricetoPay = pricetoPay + Config["prices"]["eyebrows"]
										choosing = true
									end, function(data, menu)
										menu.close()
										ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
											TriggerEvent('skinchanger:loadSkin', skin) 
										end)
										choosing = true
									end, function(data, menu)
										Changehairstyle(data.current.usage, data.current.value)
									end
									)
									choosing = false
								elseif IsDisabledControlJustReleased(0, 191) then
									ESX.UI.Menu.CloseAll()
									ESX.ShowNotification(Strings["paid"]:format(pricetoPay))
									TriggerServerEvent('nxrp-barbershop:pay', pricetoPay)
									TriggerServerEvent('nxrp-barbershop:active', currentlyBarbershop, currentlyChair, false)
									SetEntityCoords(playerPed, Config["barberShops"][currentlyBarbershop]["markerPos"] - vector3(0, 0, 0.98))
									FreezeEntityPosition(playerPed, false)
									DeleteEntity(ped)
									SetCamActive(cam, false)
									RenderScriptCams(false,  false,  0,  true,  true)
									pricetoPay = 0
									sitting = false
									choosing = false
								end
							end
						end
					end
				end
			end
		end

		Wait(sleep)
	end

end)

RegisterNetEvent("nxrp-barbershop:active")
AddEventHandler("nxrp-barbershop:active", function(barber, chair, status)
	Config["barberShops"][barber]["chairs"][chair]["active"] = status
end)

RegisterNetEvent("esx:playerLoaded")
AddEventHandler("esx:playerLoaded", function(playerData)
	ESX.PlayerData = playerData
end)

RegisterNetEvent("esx:setJob")
AddEventHandler("esx:setJob", function(newJob)
	ESX.PlayerData["job"] = newJob
end)