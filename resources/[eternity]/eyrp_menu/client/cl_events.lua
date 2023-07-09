local Lyfter		 = false
local bliLyft		 = false
local LyftLib		 = "anim@heists@box_carry@"
local LyftAnim 		 = 'idle'
local LyftTargetLib	 = 'amb@world_human_bum_slumped@male@laying_on_right_side@base'
local LyftTargetAnim = 'base' 

RegisterNetEvent('eyrp_menu:bliLyft')
AddEventHandler('eyrp_menu:bliLyft', function(target)
	local playerPed = GetPlayerPed(-1)
	local targetPed = GetPlayerPed(GetPlayerFromServerId(target))

	RequestAnimDict(LyftTargetLib)

	while not HasAnimDictLoaded(LyftTargetLib) do
		Citizen.Wait(10)
	end

	if bliLyft then
		bliLyft = false
		DetachEntity(GetPlayerPed(-1), true, false)
		Citizen.Wait(80)
		ClearPedTasks(GetPlayerPed(-1))
	else
		bliLyft = true	
    	Citizen.Wait(25)
		AttachEntityToEntity(GetPlayerPed(-1), targetPed, GetPedBoneIndex(playerPed, 57005), -0.32, -0.6, -0.35, 240.0, 35.0, 149.0, true, true, false, true, 1, true)
	    Citizen.Wait(50)
		TaskPlayAnim(playerPed, LyftTargetLib, LyftTargetAnim, 8.0, 8.0, -1, 9, 0, false, false, false)
	end
end)

RegisterNetEvent('eyrp_menu:lyftPerson')
AddEventHandler('eyrp_menu:lyftPerson', function(target)
	local playerPed = GetPlayerPed(-1)
	local targetPed = GetPlayerPed(GetPlayerFromServerId(target))

	RequestAnimDict(LyftLib)

	while not HasAnimDictLoaded(LyftLib) do
		Citizen.Wait(10)
	end
	
	if Lyfter then
		Lyfter = false
		Citizen.Wait(50)
		ClearPedTasks(GetPlayerPed(-1))
	else
		TaskPlayAnim(playerPed, LyftLib, LyftAnim, 8.0, 8.0, -1, 50, 0, false, false, false )
		Lyfter = true
	end
end)

local searching = false;
local searchingInventories = {};

RegisterNetEvent('searchPlayer')
AddEventHandler('searchPlayer', function(inventories, target)
    if searching then return end;

    searching = true;
    searchingInventories = inventories;

    for k,v in pairs(inventories) do
        exports['eyrp_inventory']:OpenUniqueTab({
            name = v,
            inventory = 'other'
        })
    end

    Citizen.Wait(350);

    exports['eyrp_inventory']:OpenInventory()
end)

RegisterNetEvent('CloseInventory')
AddEventHandler('CloseInventory', function()
    if searching and searchingInventories then
        for k,v in pairs(searchingInventories) do
            exports['eyrp_inventory']:CloseUniqueTab(v);
        end

        searching = false;
        searchingInventories = {}
    end
end)