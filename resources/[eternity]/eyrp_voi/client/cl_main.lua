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

self = {}
self.StartTime = 0
self.TotalPrice = 0

Citizen.CreateThread(function()
    Citizen.Wait(100)

    for index, value in pairs(Config.Locations) do
        Funcs.SpawnVehicle(Config.Model, value)
    end

    while true do
        local Player, sleepThread = PlayerPedId(), 250;

        for index, value in pairs(Config.Locations) do
            local ClosestVoi = ESX.Game.GetClosestVehicle(value, Config.Model)

            if DoesEntityExist(ClosestVoi) and IsEntityAVehicle(ClosestVoi) and IsPedOnFoot(Player) and not IsPedDeadOrDying(Player) then

                local Distance = #(GetEntityCoords(Player) - GetEntityCoords(ClosestVoi))

                if Distance <= 2.0 and GetEntityModel(ClosestVoi) == GetHashKey(Config.Model) then
                    sleepThread = 7;

                    exports['eyrp_core']:DrawText3D(GetEntityCoords(ClosestVoi), '[~g~F~s~] - Hyr Voi (Upplåsning~g~ ' .. Config.UnlockPrice .. 'kr~s~)')

                    if IsControlJustReleased(0, 23) then
                        StartVoi(ClosestVoi)
                    end
                end
            end
        end

        local Vehicle = GetVehiclePedIsIn(PlayerPedId(), false)

        if IsPedInAnyVehicle(Player, true) and GetEntityModel(Vehicle) == GetHashKey(Config.Model) then 
            self.UsingVoi = true 
        else 
            self.UsingVoi = false and self.StartTime == 0 
        end

        if self.UsingVoi then
            sleepThread = 7;
            Funcs.DrawText2D(0.11, 0.090, 0.30, 'Tryck ~r~G~s~ för att avbryta\nTid: ~g~' .. self.StartTime .. '~w~ minuter\nKostnad: ~g~' .. self.TotalPrice .. 'kr') 

            if IsControlJustReleased(0, 47) or IsControlJustReleased(0, 23) then
                StopVoi(GetVehiclePedIsIn(Player, false))
            end
        end

        Citizen.Wait(sleepThread)
    end
end)

AddBlips = function()
    local blip = AddBlipForCoord(GetEntityCoords(ClosestVoi))

	SetBlipSprite(blip, 137)
	SetBlipScale(blip, 0.7)
	SetBlipColour(blip, 0)
	SetBlipAsShortRange(blip, true)

	BeginTextCommandSetBlipName('STRING')
	AddTextComponentSubstringPlayerName("Voi")
	EndTextCommandSetBlipName(blip)
end

Citizen.CreateThread(function()
    Citizen.Wait(100)
    
    while true do
        sleepThread = 250

        if self.UsingVoi then
            sleepThread = 60000

            if self.StartTime == 0 then 
                self.StartTime = 1
            else
                self.StartTime = self.StartTime + 1
            end

            if self.TotalPrice == 0 then
                self.TotalPrice = Config.PricePerMinute
            else
                self.TotalPrice = self.TotalPrice + Config.PricePerMinute
            end
        end

        Citizen.Wait(sleepThread)
    end
end)

StartVoi = function(Vehicle)
    if not GetEntityModel(Vehicle) == GetHashKey(Config.Model) then return end

    ESX.TriggerServerCallback('eyrp_voi:Pay', function(Response)
        if Response then
            exports['eyrp_notify']:LoadNotification('Du betalade ' .. Config.UnlockPrice .. 'kr', 'success', true)

            self.StartTime = 0
            TaskEnterVehicle(PlayerPedId(), Vehicle, 1, -1, 1.0, 1, 0)
            FreezeEntityPosition(PlayerPedId(), true)
        else
            exports['eyrp_notify']:LoadNotification('Du har inte med detta', 'error', true)
        end
    end, Config.UnlockPrice)
end

StopVoi = function(Vehicle)

    if GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), Config.Zones['City'], false) > GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), Config.Zones['Sandy'], false) then
        return exports['eyrp_notify']:LoadNotification('Du är för långt från stan för att parkera din voi', 'error', true)
    end

    TaskLeaveVehicle(PlayerPedId(), Vehicle, 256)
    FreezeEntityPosition(PlayerPedId(), false)

    if self.TotalPrice == 0 then return end

    ESX.TriggerServerCallback('eyrp_voi:Pay', function(Response)

        if Response then
            exports['eyrp_notify']:LoadNotification('Du betalade ' .. self.TotalPrice .. 'kr för åkturen', 'success')
            self.TotalPrice = 0
            self.StartTime = 0
        else
            exports['eyrp_notify']:LoadNotification('Du hade in råd med åkturen, du ligger nu minus på kontot', 'error', true)
            self.TotalPrice = 0
            self.StartTime = 0
        end

    end, self.TotalPrice)

end

RegisterCommand('unfreeze', function()
    FreezeEntityPosition(PlayerPedId(), false)
end)