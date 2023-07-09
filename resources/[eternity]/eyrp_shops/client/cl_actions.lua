Action = {}; 

Action.BuyProduct = function() 
    if Utils.GetPlayerMoney(Config.Products[Stores["amount"]]["price"] * Stores["count"]) then  
        exports['eyrp_inventory']:addInventoryItem({
            item = Config.Products[Stores["amount"]]["item"],
            count = Stores["count"],
        });

        TriggerServerEvent("eyrp_shops:removePlayerCash", Config.Products[Stores["amount"]]["price"] * Stores["count"])
    else
        ESX.ShowNotification("Du har inte tillräckligt med pengar")
    end
end