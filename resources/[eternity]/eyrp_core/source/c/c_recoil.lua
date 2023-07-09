local recoils = {
	[453432689] = 2.5, -- PISTOL
	[-1076751822] = 2.5, -- PISTOL
	[1593441988] = 2.5, -- COMBAT PISTOL
	[324215364] = 2.0, -- MICRO SMG
	[736523883] = 2.4, -- SMG
	[2210333304] = 3.5, -- CARBINE RIFLE
	[487013001] = 4.5, -- PUMP SHOTGUN
	[2017895192] = 4.4, -- PUMP SHOTGUN 2
	[0x42BF8A85] = 4.4, -- MINIGUN
	[911657153] = 0.1, -- STUN GUN
	[205991906] = 0.7, -- HEAVY SNIPER
	[0x05FC3C11] = 0.5, -- SNIPER
	[3231910285] = 3.2, -- SPECIAL CARBINE
	[-771403250] = 2.8, -- HEAVY PISTOL
	[1198879012] = 0.9, -- FLARE GUN
	[-619010992] = 3.1, -- tec - 9
	[584646201] = 0.7, -- AP PISTOL
	[-1074790547] = 2.9, -- AK
	[0x624FE830] = 3.2, -- AK
	[-2084633992] = 0.9, -- M4A4
	[-1063057011] = 0.9, -- G36
	[100416529] = 0.9, -- sniper
	[0x7FD62962] = 1.0, -- combat mg
	[0x9D07F764] = 0.9, -- mg
	[-1716589765] = 3.8, -- pistol.50
	[-1121678507] = 55.8, -- minismg
}

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		if IsPedShooting(PlayerPedId()) then
			local _,wep = GetCurrentPedWeapon(PlayerPedId())
			_,cAmmo = GetAmmoInClip(PlayerPedId(), wep)
			if recoils[wep] and recoils[wep] ~= 0 then
				tv = 0
				if GetFollowPedCamViewMode() ~= 4 then
					repeat 
						Wait(0)
						p = GetGameplayCamRelativePitch()
						SetGameplayCamRelativePitch(p+0.67, 0.3)
						tv = tv+0.17
					until tv >= recoils[wep]
				else
					repeat 
						Wait(0)
						p = GetGameplayCamRelativePitch()
						if recoils[wep] > 0.1 then
							SetGameplayCamRelativePitch(p+0.67, 0.3)
							tv = tv+0.17
						else
							SetGameplayCamRelativePitch(p+0.67, 0.3)
							tv = tv+0.17
						end
					until tv >= recoils[wep]
				end
			end
		end
	end
end)

Citizen.CreateThread(function() 
	while true do
		Citizen.Wait(0)
        local ped = PlayerPedId()
		local status = GetPedConfigFlag(ped, 78, 1)
		local getwidthrecoil = GetGameplayCamRelativeHeading()
		local widthrecoil = 0.01 + 0.02 - 0.01 - 0.15

        if status and not IsPedInAnyVehicle(PlayerPedId(), false) then
			SetGameplayCamRelativeHeading(getwidthrecoil + widthrecoil * -0.055)

			local getheightrecoil = GetGameplayCamRelativePitch()
			local heightrecoil = math.random() + math.random()
			SetGameplayCamRelativePitch(getheightrecoil + heightrecoil * -0.01, 0.8)
        end
    end
end)

Citizen.CreateThread( function()
    while true do
      Citizen.Wait(0)
      local ped = GetPlayerPed(-1)
      if not GetPedConfigFlag(ped,78,1) then
        SetPedUsingActionMode(GetPlayerPed(-1), false, -1, 0)
      end
    end
end)
