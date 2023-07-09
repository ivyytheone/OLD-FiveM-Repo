
local BONES = {
	[11816] = true,
	[58271] = true,
	[63931] = true,
	[14201] = true,
	[2108] = true,
	[65245] = true,
	[57717] = true,
	[46078] = true,
	[51826] = true,
	[36864] = true,
	[52301] = true,
	[20781] = true,
	[35502] = true,
	[24806] = true,
	[16335] = true,
	[23639] = true,
	[6442] = true,
}



Citizen.CreateThread(function() 
	Citizen.Wait(100); 

	while true do  

		local ped = GetPlayerPed(-1); 
		local sleepThread = 750; 

		if HasEntityBeenDamagedByAnyPed(ped) then 
			Disarm(ped)
		end

		ClearEntityLastDamageEntity(ped)

		Citizen.Wait(sleepThread); 
	end
end)

function Bool(num) return num == 1 or num == true end

-- WEAPON DROP OFFSETS
local function GetDisarmOffsetsForPed (ped)
	local v

	if IsPedWalking(ped) then v = { 0.6, 4.7, -0.1 }
	elseif IsPedSprinting(ped) then v = { 0.6, 5.7, -0.1 }
	elseif IsPedRunning(ped) then v = { 0.6, 4.7, -0.1 }
	else v = { 0.4, 4.7, -0.1 } end

	return v
end

function Disarm(ped)
	if IsEntityDead(ped) then return false end

	local boneCoords
	local hit, bone = GetPedLastDamageBone(ped)

	hit = Bool(hit)

	if hit then
		if BONES[bone] then
			boneCoords = GetWorldPositionOfEntityBone(ped, GetPedBoneIndex(ped, bone))
			SetPedToRagdoll(GetPlayerPed(-1), 20000, 20000, 0, 0, 0, 0)
			
			return true
		end
	end

	return false
end

	