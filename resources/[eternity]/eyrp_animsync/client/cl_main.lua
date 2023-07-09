ESX              = nil
local PlayerData = {}

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(10)
	end
end)

local lastSlap = 0

RegisterCommand('slap', function()
    local closestPlayer, closestPlayerDistance = ESX.Game.GetClosestPlayer()
    local target, ped = GetPlayerPed(closestPlayer), PlayerPedId()

    if closestPlayer == -1 or closestPlayerDistance > 1.0 then
        ESX.ShowNotification('Det finns ingen spelare i närheten', 'error')
	elseif IsPedInAnyVehicle(ped) or IsPedInAnyVehicle(target) then
		ESX.ShowNotification('Du kan inte göra detta i bilen', 'error')
	elseif GetGameTimer() - lastSlap < 60 * 1000 then
		ESX.ShowNotification('Du är för trött för att slå igen', 'error')
	elseif not HasEntityClearLosToEntityInFront(ped, target) or not HasEntityClearLosToEntityInFront(target, ped) then
		ESX.ShowNotification('Du måste titta på personen, dumme fan	', 'error')
    else
		TriggerServerEvent('eyrp:slapSync', GetPlayerServerId(closestPlayer))
		TriggerEvent('eyrp:slapAnim')
		lastSlap = GetGameTimer()
    end
end)

RegisterNetEvent('eyrp:slapAnim')
AddEventHandler('eyrp:slapAnim', function()
	local ped = PlayerPedId()
        Animation = {
            Dict = 'melee@unarmed@streamed_variations',
            Lib = 'plyr_takedown_front_slap'
          }

    Funcs.LoadAnimDict(Animation.Dict)

	TaskPlayAnim(ped, Animation.Dict, Animation.Lib, 2.0, -1.0, -1, 0, 0, false, false, false)
	Citizen.Wait(3000)
end)

RegisterNetEvent('eyrp:getSlapped')
AddEventHandler('eyrp:getSlapped', function(target)
	local playerPed, targetPed = PlayerPedId(), GetPlayerPed(GetPlayerFromServerId(target))

    Animation = {
        Dict = 'melee@unarmed@streamed_variations',
        Lib = 'victim_takedown_front_slap'
    }

    Funcs.LoadAnimDict(Animation.Dict)

	TaskPlayAnim(targetPed, Animation.Dict, Animation.Lib, 2.0, -1.0, -1, 0, 0, false, false, false)
	Citizen.Wait(2000)

	SetPedToRagdoll(targetPed, 5000, 5000, 0, true, true, false)
end)


RegisterNetEvent('eyrp:shakeCam')
AddEventHandler('eyrp:shakeCam', function(value)
	ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', value)
end)

local lastHead = 0

RegisterCommand('skalla', function()
    local closestPlayer, closestPlayerDistance = ESX.Game.GetClosestPlayer()
    local target, ped = GetPlayerPed(closestPlayer), PlayerPedId()

    if closestPlayer == -1 or closestPlayerDistance > 1.0 then
        ESX.ShowNotification('Det finns ingen spelare i närheten', 'error')
	elseif IsPedInAnyVehicle(ped) or IsPedInAnyVehicle(target) then
		ESX.ShowNotification('Du kan inte göra detta i bilen', 'error')
	elseif GetGameTimer() - lastHead < 60 * 1000 then
		ESX.ShowNotification('Du har för ont i pannan för att skalla', 'error')
	elseif not HasEntityClearLosToEntityInFront(ped, target) or not HasEntityClearLosToEntityInFront(target, ped) then
		ESX.ShowNotification('Du måste titta på personen, dumme fan	', 'error')
    else
		TriggerServerEvent('eyrp:headSync', GetPlayerServerId(closestPlayer))
		TriggerEvent('eyrp:headAnim')
		lastHead = GetGameTimer()
    end
end)

RegisterNetEvent('eyrp:headAnim')
AddEventHandler('eyrp:headAnim', function()
	local ped = PlayerPedId()
        Animation = {
            Dict = 'melee@unarmed@streamed_variations',
            Lib = 'plyr_takedown_front_headbutt'
          }

    Funcs.LoadAnimDict(Animation.Dict)

	TaskPlayAnim(ped, Animation.Dict, Animation.Lib, 2.0, -1.0, -1, 0, 0, false, false, false)
	Citizen.Wait(3000)
end)

RegisterNetEvent('eyrp:getHead')
AddEventHandler('eyrp:getHead', function(target)
	local playerPed, targetPed = PlayerPedId(), GetPlayerPed(GetPlayerFromServerId(target))

    Animation = {
        Dict = 'melee@pistol@streamed_core',
        Lib = 'victim_takedown_front_pistol'
    }

    Funcs.LoadAnimDict(Animation.Dict)

	TaskPlayAnim(targetPed, Animation.Dict, Animation.Lib, 2.0, -1.0, -1, 0, 0, false, false, false)
	Citizen.Wait(2000)

	SetPedToRagdoll(targetPed, 5000, 5000, 0, true, true, false)
end)

local krok = 0

RegisterCommand('krok', function()
    local closestPlayer, closestPlayerDistance = ESX.Game.GetClosestPlayer()
    local target, ped = GetPlayerPed(closestPlayer), PlayerPedId()

    if closestPlayer == -1 or closestPlayerDistance > 1.0 then
        ESX.ShowNotification('Det finns ingen spelare i närheten', 'error')
	elseif IsPedInAnyVehicle(ped) or IsPedInAnyVehicle(target) then
		ESX.ShowNotification('Du kan inte göra detta i bilen', 'error')
	elseif GetGameTimer() - krok < 60 * 1000 then
		ESX.ShowNotification('Du har för ont i knogen för att slå igen', 'error')
	elseif not HasEntityClearLosToEntityInFront(ped, target) or not HasEntityClearLosToEntityInFront(target, ped) then
		ESX.ShowNotification('Du måste titta på personen, dumme fan	', 'error')
    else
		TriggerServerEvent('eyrp:krokSync', GetPlayerServerId(closestPlayer))
		TriggerEvent('eyrp:krokAnim')
		krok = GetGameTimer()
    end
end)

RegisterNetEvent('eyrp:krokAnim')
AddEventHandler('eyrp:krokAnim', function()
	local ped = PlayerPedId()
        Animation = {
            Dict = 'melee@unarmed@streamed_variations',
            Lib = 'plyr_stealth_kill_unarmed_hook_r'
          }

    Funcs.LoadAnimDict(Animation.Dict)

	TaskPlayAnim(ped, Animation.Dict, Animation.Lib, 2.0, -1.0, -1, 0, 0, false, false, false)
	Citizen.Wait(3000)
end)

RegisterNetEvent('eyrp:getKrok')
AddEventHandler('eyrp:getKrok', function(target)
	local playerPed, targetPed = PlayerPedId(), GetPlayerPed(GetPlayerFromServerId(target))

    Animation = {
        Dict = 'melee@unarmed@streamed_variations',
        Lib = 'victim_takedown_front_slap'
    }

    Funcs.LoadAnimDict(Animation.Dict)

	TaskPlayAnim(targetPed, Animation.Dict, Animation.Lib, 2.0, -1.0, -1, 0, 0, false, false, false)
	Citizen.Wait(2000)

	SetPedToRagdoll(targetPed, 5000, 5000, 0, true, true, false)
end)

pee = false

RegisterCommand('kissa', function()
 	TriggerServerEvent('eyrp:SyncPee', GetPlayerServerId(PlayerId()))
 end)

 RegisterNetEvent('eyrp:SyncPee')
 AddEventHandler('eyrp:SyncPee', function(targetId)
    local thePed = GetPlayerPed(GetPlayerFromServerId(targetId))
    Citizen.CreateThread(function()
		if not pee then
			StartPeeAnim(thePed)
			Particle = {
				Dict = 'scr_amb_chop',
				Lib = 'ent_anim_dog_peeing'
			 }
			local loopAmount = 5
			
			Funcs.LoadNamedPtfxAsset(Particle.Dict)
	
			local particleEffects = {}
	
				SetPtfxAssetNextCall(Particle.Dict)
				particle = StartParticleFxLoopedOnPedBone(Particle.Lib, thePed, 0.0, 0.0, -0.1, 90.0, 90.0, 20.0, GetPedBoneIndex(thePed, 11816), 2.0, false, false, false);
				table.insert(particleEffects, 1, particle)

			elseif pee then
				StopParticleFxLooped(particle, true)
				ClearPedTasks(thePed)
				pee = false
			
		end
    end)
end)


StartPeeAnim = function(ped)
	pee = true
	Animation = {
		Dict = 'missbigscore1switch_trevor_piss',	
		Lib = 'piss_loop'
	}
	Funcs.LoadAnimDict(Animation.Dict)
	TaskPlayAnim(ped, Animation.Dict, Animation.Lib, 2.0, -1.0, -1, 49, 0, false, false, false)
end


RegisterCommand('fart', function()
	TriggerServerEvent('eyrp:SyncFartParticles', GetPlayerServerId(PlayerId()))


	local fartSounds = {
		'fart1',
		'fart2',
		'fart3'
	}

	TriggerServerEvent('InteractSound_SV:PlayWithinDistance', 5.0, fartSounds[math.random(#fartSounds)], 0.4)
end)

RegisterNetEvent('eyrp:SyncFartParticles')
AddEventHandler('eyrp:SyncFartParticles', function(targetId)
	local thePed = GetPlayerPed(GetPlayerFromServerId(targetId))
    Citizen.CreateThread(function()

			Particle = {
				Dict = 'core',
				Lib = 'exp_grd_bzgas_smoke',
				Loop = 5
			 }

			 Funcs.LoadNamedPtfxAsset(Particle.Dict)
	 
			 local particleEffects = {}
	 
			 for x=0,Particle.Loop do
				 SetPtfxAssetNextCall(Particle.Dict)
				 local particle = StartParticleFxLoopedOnEntity(Particle.Lib, thePed, 0.0, 0.0, -0.3, 0.0, 0.0, 0.0, 0.1, false, false, false)
				 table.insert(particleEffects, 1, particle)
				 Citizen.Wait(0)
			 end
	 
			 Citizen.Wait(1000)

			 for _,particle in pairs(particleEffects) do
				 StopParticleFxLooped(particle, true)
			 end
			
	end)
end)


RegisterNetEvent('eyrp:startBurp')
AddEventHandler('eyrp:startBurp', function(target)
	local thePed = GetPlayerPed(GetPlayerFromServerId(target))
	TriggerServerEvent('InteractSound_SV:PlayWithinDistance', 5.0, 'burp', 0.4)
	Particle = {
		Dict = 'core',
		Lib = 'exp_grd_bzgas_smoke',
		Loop = 15
	}

	Funcs.LoadNamedPtfxAsset(Particle.Dict)

	local particleEffects = {}

	for x=0,Particle.Loop do
		SetPtfxAssetNextCall(Particle.Dict)
		local particle = StartParticleFxLoopedOnEntity(Particle.Lib, thePed, 0.0, 0.1, 0.6, 0.0, 0.0, 0.0, 0.1, false, false, false)
		table.insert(particleEffects, 1, particle)
		Citizen.Wait(0)
	end

	Animation = {
		Dict = 'facials@gen_male@base',
		Lib = 'smoking_exhale_1'
	}
	Funcs.LoadAnimDict(Animation.Dict)
	PlayFacialAnim(thePed, Animation.Lib, Animation.Dict)

	Citizen.Wait(1000)

	for _,particle in pairs(particleEffects) do
		StopParticleFxLooped(particle, true)
	end
end)

RegisterCommand('rapa', function()
	TriggerServerEvent('eyrp:SyncBurp', GetPlayerServerId(PlayerId()))
end)

