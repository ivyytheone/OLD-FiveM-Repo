ESX = nil

Citizen.CreateThread(function()
    while ESX == nil do
        Citizen.Wait(5)

        ESX = exports["es_extended"]:getSharedObject()
    end

    if ESX.IsPlayerLoaded() then
		ESX.PlayerData = ESX.GetPlayerData()

		LoadSkills()
    end
end)

RegisterNetEvent("eyrp_skillsystem:openMenu")
AddEventHandler("eyrp_skillsystem:openMenu", function()
    OpenSkillsMenu()
end)

RegisterNetEvent("esx:playerLoaded")
AddEventHandler("esx:playerLoaded", function(response)
	ESX.PlayerData = response

	LoadSkills()
end)