Changehairstyle = function(type, amount)
	local playerPed = GetPlayerPed(-1)

	if type == 'hair' then
		SetPedComponentVariation(playerPed, 2, amount, 0)
		TriggerEvent('skinchanger:change', "hair_1", amount)
	elseif type == 'haircolor' then
		SetPedHairColor(playerPed, amount, 0)
		TriggerEvent('skinchanger:change', "hair_color_1", amount)
	elseif type == 'beard' then
		SetPedHeadOverlay(playerPed, 1, amount, (10 / 10) + 0.0)
		TriggerEvent('skinchanger:change', "beard_1", amount)
	elseif type == 'beardcolor' then
		SetPedHeadOverlayColor(playerPed, 1, 1,	amount, 0)
		TriggerEvent('skinchanger:change', "beard_3", amount)
	elseif type == 'beardsize' then
		TriggerEvent('skinchanger:getSkin', function(skin)
			SetPedHeadOverlay(playerPed, 1, skin["beard_1"], (amount / 10) + 0.0)
		end)
		TriggerEvent('skinchanger:change', "beard_2", amount)
	elseif type == 'eyebrow' then
		SetPedHeadOverlay(playerPed, 2, amount,	(10 / 10) + 0.0)
		TriggerEvent('skinchanger:change', "eyebrows_1", amount)
	elseif type == 'eyebrowsize' then
		TriggerEvent('skinchanger:getSkin', function(skin)
			SetPedHeadOverlay(playerPed, 2, skin["eyebrows_1"], (amount / 10) + 0.0)
		end)
		TriggerEvent('skinchanger:change', "eyebrows_2", amount)
	elseif type == 'eyebrowcolor' then
		SetPedHeadOverlayColor(playerPed, 2, 1,	amount,	0)
		TriggerEvent('skinchanger:change', "eyebrows_3", amount)
	end
end

SpawnPed = function()
    local model = 's_f_m_fembarber'
	RequestModel(model)
  
	while not HasModelLoaded(model) do
		Wait(1)
	end
	ped = CreatePed(5, model, Config["barberShops"][currentlyBarbershop]["chairs"][currentlyChair]["ped"]["pos"] - vector3(0, 0, 0.98), Config["barberShops"][currentlyBarbershop]["chairs"][currentlyChair]["ped"]["heading"], false, false)
	FreezeEntityPosition(ped, true)
	SetEntityInvincible(ped, true)
    SetBlockingOfNonTemporaryEvents(ped, true)
    loadDict("misshair_shop@hair_dressers")
    TaskPlayAnim(ped, "misshair_shop@hair_dressers", "keeper_base", 3.5, -8, -1, 2, 0, 0, 0, 0, 0)
end

DrawAdvancedMarker = function(markerData)
    DrawMarker(markerData["type"] or 1, markerData["pos"] or vector3(0.0, 0.0, 0.0), 0.0, 0.0, 0.0, (markerData["type"] == 6 and -90.0 or markerData["rotate"] and -180.0) or 0.0, 0.0, 0.0, markerData["sizeX"] or 1.0, markerData["sizeY"] or 1.0, markerData["sizeZ"] or 1.0, markerData["r"] or 1.0, markerData["g"] or 1.0, markerData["b"] or 1.0, 100, false, true, 2, false, false, false, false)
end

loadDict = function(dict)
	while not HasAnimDictLoaded(dict) do
	  RequestAnimDict(dict)
	  Wait(10)
	end
end

help = function(msg)
	SetTextComponentFormat('STRING')
	AddTextComponentString(msg)
	DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end

LongHelpText = function(text)
    AddTextEntry("klf_long_help_text", text)
    DisplayHelpTextThisFrame("klf_long_help_text", false)
end