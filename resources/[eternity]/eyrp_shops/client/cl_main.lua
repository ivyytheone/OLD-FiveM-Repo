Citizen.CreateThread(function()
    while ESX == nil do
        Citizen.Wait(1);

        ESX = exports["es_extended"]:getSharedObject()  
    end 

    if ESX.IsPlayerLoaded() then
        ESX.PlayerData = ESX.GetPlayerData()
    end
end)

Stores = {}

Citizen.CreateThread(function() 
    Citizen.Wait(100); 

    for shopIndex, shopData in pairs(Config.Shops) do
		Stores["blip"] = AddBlipForCoord(shopData["Coords"])
	
		SetBlipSprite (Stores["blip"], 52)
		SetBlipDisplay(Stores["blip"], 4)
		SetBlipScale  (Stores["blip"], 0.7)
		SetBlipColour (Stores["blip"], 0)
		SetBlipAsShortRange(Stores["blip"], true)
	
		BeginTextCommandSetBlipName('STRING')
		AddTextComponentString("Butik")
		EndTextCommandSetBlipName(Stores["blip"])	
	end

    while true do  

        local playerPed, sleepThread = PlayerPedId(), 850; 

        for shopIndex, shopData in pairs(Config.Shops) do 

            local Dst = #(GetEntityCoords(playerPed) - shopData["Coords"])

            if not (Stores["inShop"] or Stores["choose_amount"]) then
                if Dst <= 5.0 then  
                    sleepThread = 5; 

                    Utils.Draw3DText({
                        Coords = shopData["Coords"], 
                        Text = "[~g~E~s~] - Öppna butiken"
                    })

                    if Dst <= 1.0 then  
                        if IsControlJustReleased(0, 38) then 
                            Stores["amount"], Stores["inShop"], Stores["OpenShop"] = 1, true, true 
                            Stores["count"] = 1
                        end
                    end
                end 
            end
        end

        if (Stores["OpenShop"]) then 
            sleepThread = 5; 

            for i = 0, 31 do
                DisableAllControlActions(i)
            end

            for shopIndex, shopData in pairs(Config.Shops) do  
                Utils.DrawScreenText({
                    Text = "Produkt: " .. Config.Products[Stores["amount"]]["label"] .. " \nAntal: " .. Stores["count"] .. "\nPris: " .. Config.Products[Stores["amount"]]["price"] * Stores["count"] ..  " kr\n[~g~ENTER~s~] Köp [~g~SPACE~s~] Avbryt"
                })

                if IsDisabledControlJustReleased(0, 172) then  
                    Stores["count"] = Stores["count"] + 1

                    break
                end

                if IsDisabledControlJustReleased(0, 173) then  
                    Stores["count"] = Stores["count"] - 1 

                    break
                end

                if IsDisabledControlJustPressed(0, 175) then  
                    if Stores["amount"] < #Config.Products then  
                        Stores["amount"] = Stores["amount"] + 1 

                        break
                    end
                end

                if IsDisabledControlJustPressed(0, 174) then
                    if Stores["amount"] > 1 then
                        Stores["amount"] = Stores["amount"] - 1 

                        break
                    end
                 end

                if IsDisabledControlJustReleased(0, 203) then  
                    Stores["inShop"], Stores["OpenShop"] = false, false

                    break
                end

                if IsDisabledControlJustReleased(0, 191) then  
                    Stores["inShop"], Stores["OpenShop"] = false, false  

                    Action:BuyProduct(Config.Products[Stores["amount"]])

                    break
                end
            end
        end

        Citizen.Wait(sleepThread); 
    end
end)