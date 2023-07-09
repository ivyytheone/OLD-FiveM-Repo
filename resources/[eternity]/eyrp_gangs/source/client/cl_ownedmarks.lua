Citizen.CreateThread(function()
    Wait(100)
    self.InAciton = false

    while true do
        local player, sleepThread = PlayerPedId(), 500;

        for zoneIndex, zoneValue in pairs(Config.Marks) do

            local distance = #(GetEntityCoords(player) - zoneValue)

            if distance <= 7.0 then  
                sleepThread = 5; 

                ESX.DrawScriptMarker({
                    type = 27, 
                    pos = zoneValue - vector3(0.0, 0.0, 0.98),
                    sizeX = 10.0, sizeY = 10.0, sizeZ = 10.0, 
                    r = 50, g = 150, b = 250,
                })

                if distance <= 2.0 and not IsPedDeadOrDying(player) and IsPedOnFoot(player) then

                    exports['eyrp_tools']:DrawText3D(zoneValue, '[~g~E~s~] - Område ' .. zoneIndex)

                    if IsControlJustReleased(0, 38) then
                        self.OpenZone(zoneIndex)
                    end
                end
            end
        end

        Citizen.Wait(sleepThread)
    end
end)

self.OpenZone = function(ZoneName)
    menuElements = {}

    ESX.TriggerServerCallback('eyrp_gangs:GetZoneData', function(Zone)

            if Zone.State == 'NoGang' then
                exports['eyrp_notify']:LoadNotification('Du är inte med i ett gäng', 'error', true)
                return
            end

            if Zone.State == 'NoOwner' or Zone.State == 'IsInOtherGang' then
                menuElements = {
                    {
                        label = 'Ägare: ' .. "<span style='color: lightgreen'>" .. Zone.Data .. " </span>",
                        value = 'owner'
                    },
                    {
                        label = "Ta över område",
                        value = 'take_over'
                    }
                }
            end

            if Zone.State == 'IsInOwnerGang' then
                menuElements = {
                    {
                        label = 'Ägare: ' .. "<span style='color: lightgreen'>" .. Zone.Data .. " </span>",
                        value = 'owner'
                    },
                    {
                        label = "Lämna område",
                        value = 'giveup'
                    },
                    {
                        label = 'Ta ut belöning',
                        value = 'reward'
                    }
                }
            end 

                ESX.UI.Menu.Open("default", GetCurrentResourceName(), "ownedmarks", 
                {
                    title = "Område: " .. ZoneName, 
                    align = "right", 
                    elements = menuElements
                }, function(Data, Menu)
                    local Event = Data.current.value

                    if Event == 'owner' then return end

                    if Event == 'take_over' then
                        if self.InAction then
                            exports['eyrp_notify']:LoadNotification('Du förhandlar redan?', 'error', true)
                            return
                        end

                        self.InAction = true

                        --900000, 1200000

                        exports['eyrp_progressbar']:StartProgress('Förhandlar...', 1000, '#8c0000', function()

                            ESX.TriggerServerCallback('eyrp_gangs:TakeOverZone', function(Response)
                                if Response then
                                    exports['eyrp_notify']:LoadNotification('Området ' .. ZoneName .. ' tillhör nu ' .. Response, 'success', true)
                                else
                                    exports['eyrp_notify']:LoadNotification('Något gick fel', 'error', true)
                                end

                                self.InAction = false
                            end, ZoneName)
                        end)
                    end

                    if Event == 'giveup' then
                        ESX.TriggerServerCallback('eyrp_gangs:GiveUpZone', function(Response)
                            if Response then
                                exports['eyrp_notify']:LoadNotification('Du gav upp området ' .. ZoneName, 'success')
                            else
                                exports['eyrp_notify']:LoadNotification('Något gick fel', 'error', true)
                            end
                        end, ZoneName)
                    end

                end, function(Data, Menu)
                Menu.close()                         
            end)
    end, ZoneName)
end