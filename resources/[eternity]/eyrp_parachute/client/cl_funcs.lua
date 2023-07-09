Funcs = {
    StartParachuting = function()
        ESX.TriggerServerCallback("eyrp_core:payMoney", function(Response)
            if Response then 
                DoScreenFadeOut(400)

                Citizen.Wait(6000)
        
                ESX.Game.Teleport(PlayerPedId(), vector3(1250.7357177734375, 3155.439453125, 1492.42529296875), function()
                    exports['eyrp_inventory']:addInventoryItem({
                        item = "parachute",
                        data = {},
                        message = true
                    });
                end)
        
                DoScreenFadeIn(400)
            else
                ESX.ShowNotification("Du har inte tillräckligt med pengar", "error")
            end
        end, Config.Price)
    end
}