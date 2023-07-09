ESX = {}

TriggerEvent("esx:getSharedObject", function(lib)
    ESX = lib
end)

ESX.RegisterServerCallback("buyItems", function(source, cb, Category, Item)
    local Player = ESX.GetPlayerFromId(source)
    if Player then
        if Config.Tabs[Category] then
            if Player.getMoney() >= Item.price then
                print(Item.price, Item.item)
                Player.addInventoryItem({
                    item = Item.item, 
                    count = 1
                })
                Player.removeMoney(Item.price)
                cb(true)
            else
                cb(false)
            end
        end
    else
        cb(false)
    end
end)

RegisterServerEvent("eventHandler")
AddEventHandler("eventHandler", function(Event, Data)
    TriggerClientEvent("eventHandler", -1, Event, Data)    
end)