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

CreateThread(function()
    local player = PlayerPedId()

    while true do
        if IsPedShooting(player) and not IsPedCurrentWeaponSilenced(player) and not ESX.PlayerData.job.name == "police" then

            if math.random(5 * 5) == 1 then
                exports['eyrp_phone']:CreateAlarm({
                    Coords = GetEntityCoords(player),
                    Title = 'Skottlossning',
                    Description = 'Ett vittne har rapporterat en skottlossning, Skynda er dit!',
                    Priority = '1'
                })
            end
        end

        Wait(7)
    end
end)

local ragdoll = false
local shownHelp = false

CreateThread(function()
    while true do
        Wait(0)
		if IsControlJustPressed(0, 303) and not IsPedInAnyVehicle(PlayerPedId(), false) then
			if ragdoll then
				ragdoll = false
			else
				ragdoll = true
			end
		end

        if IsPlayerDead(PlayerId()) and ragdoll == true then
            ragdoll = false
		end

		if ragdoll then
            SetPedToRagdoll(PlayerPedId(), 1000, 1000, 0, 0, 0, 0)
        end
    end
end)

CreateThread(function()
    Wait(100)

    local minimap = exports['eyrp_tools']:LoadScaleForm("minimap")
    SetRadarBigmapEnabled(false, false)

    while true do
        Wait(0)

        if IsPedInAnyVehicle(PlayerPedId(), false) then
            DisplayRadar(true)
            BeginScaleformMovieMethod(minimap, "SETUP_HEALTH_ARMOUR")
            ScaleformMovieMethodAddParamInt(3)
            EndScaleformMovieMethod()
        else
            DisplayRadar(false)
        end
    end
end)