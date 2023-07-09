-- ESX
ESX               = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
    PlayerData = xPlayer
end)

-- Locals
local cuffed = false
local dict = "mp_arresting"
local anim = "idle"
local flags = 49
local ped = PlayerPedId()
local changed = false
local prevMaleVariation = 0
local prevFemaleVariation = 0
local femaleHash = GetHashKey("mp_f_freemode_01")
local maleHash = GetHashKey("mp_m_freemode_01")
local IsLockpicking    = false

function getHandcuffed()
    return IsPedCuffed(GetPlayerPed(-1))
end

-- Sätt på handklovar
RegisterNetEvent('esx_handcuffs:cuff')
AddEventHandler('esx_handcuffs:cuff', function(originalsource)
    ped = GetPlayerPed(-1)
    RequestAnimDict(dict)

    while not HasAnimDictLoaded(dict) do
        Citizen.Wait(0)
    end

    if GetEntityModel(ped) == femaleHash then
        prevFemaleVariation = GetPedDrawableVariation(ped, 7)
        SetPedComponentVariation(ped, 7, 25, 0, 0)
    elseif GetEntityModel(ped) == maleHash then
        prevMaleVariation = GetPedDrawableVariation(ped, 7)
        SetPedComponentVariation(ped, 7, 41, 0, 0)
    end

    SetEnableHandcuffs(ped, true)
    TaskPlayAnim(ped, dict, anim, 8.0, -8, -1, flags, 0, 0, 0, 0)

    -- -- Remove item
    -- TriggerServerEvent('esx_handcuffs:removeItem', originalsource, 'handcuffs')

    cuffed = not cuffed
    changed = true
end)

-- Ta av handklovar
RegisterNetEvent('esx_handcuffs:uncuff')
AddEventHandler('esx_handcuffs:uncuff', function()
    ped = GetPlayerPed(-1)
    RequestAnimDict(dict)

    while not HasAnimDictLoaded(dict) do
        Citizen.Wait(0)
    end

    ClearPedTasks(ped)
    SetEnableHandcuffs(ped, false)
    UncuffPed(ped)

    if GetEntityModel(ped) == femaleHash then -- mp female
        SetPedComponentVariation(ped, 7, prevFemaleVariation, 0, 0)
    elseif GetEntityModel(ped) == maleHash then -- mp male
        SetPedComponentVariation(ped, 7, prevMaleVariation, 0, 0)
    end

    cuffed = not cuffed

    changed = true
end)

RegisterNetEvent('esx_handcuffs:cuffcheck')
AddEventHandler('esx_handcuffs:cuffcheck', function(source)
    local player, distance = ESX.Game.GetClosestPlayer()

    if not IsPedCuffed(GetPlayerPed(player)) and not IsPedCuffed(GetPlayerPed(-1)) then
        if distance ~= -1 and distance <= 3.0 then
            -- TaskPlayAnim(GetPlayerPed(-1), 'mp_arresting', 'a_uncuff', 8.0, -8,-1, 2, 0, 0, 0, 0)
            TriggerServerEvent('InteractSound_SV:PlayWithinDistance', 3.0, 'cuffs', 0.7)
            Wait(7000)
            ClearPedTasksImmediately(GetPlayerPed(-1))
            TriggerServerEvent('esx_handcuffs:cuffing', GetPlayerServerId(player), source)
        end
    elseif IsPedCuffed(GetPlayerPed(-1)) then
        ESX.ShowNotification("Du har handfängsel på dig!")
    else
        ESX.ShowNotification('Personen har redan handfängsel på sig!')
    end
end)

RegisterNetEvent('esx_handcuffs:nyckelcheck')
AddEventHandler('esx_handcuffs:nyckelcheck', function()
    local player, distance = ESX.Game.GetClosestPlayer()

    if distance ~= -1 and distance <= 3.0 and not IsPedCuffed(GetPlayerPed(-1)) then
        TriggerServerEvent('esx_handcuffs:unlocking', GetPlayerServerId(player))
    elseif IsPedCuffed(GetPlayerPed(-1)) then
        ESX.ShowNotification("Du har handfängsel på dig!")
    else
        ESX.ShowNotification('Inga spelare i närheten')
    end
end)

RegisterNetEvent('esx_handcuffs:unlockingcuffs')
AddEventHandler('esx_handcuffs:unlockingcuffs', function(originalsource, item)
    local player, distance = ESX.Game.GetClosestPlayer()
    local ped = GetPlayerPed(-1)

	if not IsLockpicking and IsPedCuffed(GetPlayerPed(player)) then
		ESX.UI.Menu.CloseAll()
		FreezeEntityPosition(player,  true)
		FreezeEntityPosition(ped,  true)

        exports['eyrp_tools']:PlayAnimation({
            Ped = player,
            Dict = 'mp_arresting',
            Lib = 'a_uncuff',
            Flag = 1
        })

		IsLockpicking = true

		Wait(7000)

		IsLockpicking = false

		FreezeEntityPosition(player,  false)
		FreezeEntityPosition(ped,  false)

		ClearPedTasksImmediately(ped)

        TriggerServerEvent('esx_handcuffs:unhandcuff', GetPlayerServerId(player))
        
        if item == 'key' then
            ESX.ShowNotification('Du låste upp låset!')
        elseif item == 'dyrk' then
            ESX.ShowNotification('Du dyrkade upp låset!')
        end

        -- Remove item
        TriggerServerEvent('esx_handcuffs:removeItem', originalsource, item)
    elseif not IsPedCuffed(GetPlayerPed(player)) then
        ESX.ShowNotification('Det finns ingen spelare i närheten som har handfängsel på sig!')
	else
		ESX.ShowNotification('Du håller redan på med låset!')
	end
end)

RegisterNetEvent('esx_handcuffs:unlockingcuffspolice')
AddEventHandler('esx_handcuffs:unlockingcuffspolice', function()
    local player, distance = ESX.Game.GetClosestPlayer()
    local ped = GetPlayerPed(-1)

	if not IsLockpicking and IsPedCuffed(GetPlayerPed(player)) then
		ESX.UI.Menu.CloseAll()
		FreezeEntityPosition(player,  true)
		FreezeEntityPosition(ped,  true)

		TaskStartScenarioInPlace(ped, "PROP_HUMAN_PARKING_METER", 0, true)

		IsLockpicking = true

		Wait(7000)

		IsLockpicking = false

		FreezeEntityPosition(player,  false)
		FreezeEntityPosition(ped,  false)

		ClearPedTasksImmediately(ped)

        TriggerServerEvent('esx_policejob:unhandcuff', GetPlayerServerId(player))
        TriggerServerEvent('InteractSound_SV:PlayWithinDistance', 3.0, 'Uncuff', 0.7)
        
        ESX.ShowNotification('Du låste upp låset!')
    elseif not IsPedCuffed(GetPlayerPed(player)) then
        ESX.ShowNotification('Det finns ingen i närheten som har handfängsel på sig!')
	else
		ESX.ShowNotification('Du håller redan på med låset!')
	end
end)

-- ??
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if not changed then
            ped = PlayerPedId()
            local IsCuffed = IsPedCuffed(ped)
            if IsCuffed and not IsEntityPlayingAnim(PlayerPedId(), dict, anim, 3) then
                Citizen.Wait(0)
                TaskPlayAnim(ped, dict, anim, 8.0, -8, -1, flags, 0, 0, 0, 0)
            end
        else
            changed = false
        end
    end
end)

CreateThread(function()
    while true do
        if cuffed then
            DisableControlAction(0, 69, true) -- INPUT_VEH_ATTACK
            DisableControlAction(0, 92, true) -- INPUT_VEH_PASSENGER_ATTACK
            DisableControlAction(0, 114, true) -- INPUT_VEH_FLY_ATTACK
            DisableControlAction(0, 140, true) -- INPUT_MELEE_ATTACK_LIGHT
            DisableControlAction(0, 141, true) -- INPUT_MELEE_ATTACK_HEAVY
            DisableControlAction(0, 142, true) -- INPUT_MELEE_ATTACK_ALTERNATE
            DisableControlAction(0, 257, true) -- INPUT_ATTACK2
            DisableControlAction(0, 263, true) -- INPUT_MELEE_ATTACK1
            DisableControlAction(0, 264, true) -- INPUT_MELEE_ATTACK2
            DisableControlAction(0, 24, true) -- INPUT_ATTACK
            DisableControlAction(0, 25, true) -- INPUT_AIM
			DisableControlAction(0, 21, true) -- SHIFT
			DisableControlAction(0, 22, true) -- SPACE
			DisableControlAction(0, 288, true) -- F1
			DisableControlAction(0, 289, true) -- F2
			DisableControlAction(0, 170, true) -- F3
			DisableControlAction(0, 167, true) -- F6
			DisableControlAction(0, 168, true) -- F7
			DisableControlAction(0, 57, true) -- F10
			DisableControlAction(0, 73, true) -- X
        end

        Wait(7)
    end
end)
