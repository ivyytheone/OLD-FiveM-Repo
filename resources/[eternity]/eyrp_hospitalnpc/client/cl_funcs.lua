Funcs = {}; 

function Funcs:HealthCare(HealthLost)  
    ESX.TriggerServerCallback("eyrp_hospital:fetchAmbulance", function(Response) 
        if (Response) then  
            DoScreenFadeOut(100)

            TriggerEvent("eyrp_death:revive")

            Citizen.Wait(1000)

            Hospital.BlockKeys = true

            SetEntityCoords(PlayerPedId(), Config.Settings.BedCoords)
            SetEntityHeading(PlayerPedId(), Config.Settings.BedHeading)

            TaskPlayAnim(PlayerPedId(), 'anim@gangops@morgue@table@', 'ko_front', 8.0, -8.0, -1, 1, 0, false, false, false)

            local Camera = CreateCam("DEFAULT_SCRIPTED_CAMERA", true)
            SetCamCoord(Camera, vector3(311.24462890625, -579.9727172851562, 44.2840576171875))
            SetCamRot(Camera, -10.0, 0.0, 283.27734375)
            SetCamActive(Camera, true)
        
            RenderScriptCams(true, false, 0, true, false)

            Citizen.Wait(500)

            DoScreenFadeIn(100)

            exports["eyrp_progressbar"]:StartProgressbar(Hospital.TimeCaring, "Får vård.. ", function()
                Hospital.BlockKeys = false

                DoScreenFadeOut(100)

                Citizen.Wait(2000) 

                TriggerServerEvent("eyrp_hospitalnpc:removeMoney", HealthLost)

                ESX.ShowNotification("Du betalade en faktura på ~r~" .. HealthLost .. " kr")

                DoScreenFadeIn(100)
            end)
        else
            ESX.ShowNotification("Jag har fika rast, prata med mina andra kollegor. Skickar alarm till dom nu.")  

            if (ESX.PlayerData['job'].name == 'ambulance') then  
                exports['eyrp_phone']:CreateAlarm({
                    Coords = GetEntityCoords(PlayerPedId()),
                    Title = 'Receptionen',
                    Description = 'Jag har en medvetlös person här, kom hit snabbt!',
                    Priority = '1'
                })
            end
        end
    end)
end 

RegisterCommand("funcs", function() 
    Funcs:HealthCare()
end)