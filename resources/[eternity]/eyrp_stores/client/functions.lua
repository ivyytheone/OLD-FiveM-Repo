Stores = {}

Stores.Open = function() 
    SetNuiFocus(true, true)
    Citizen.Wait(100)
    SendNUIMessage({
        Event   = "show",
        Data    = { 
            Tabs = Config.Tabs, 
            Currency = Config.Currency,
            Character = ESX.PlayerData,
        }
    })
end


Stores.HelpNotification = function(text)
    AddTextEntry("skeexs_store", text)
	BeginTextCommandDisplayHelp('skeexs_store')
	EndTextCommandDisplayHelp(0, false, true, -1)
end

-- todo
Stores.SpawnPed = function(Data)
    RequestModel(Data.Model)
    while not HasModelLoaded(Data.Model) and not DoesEntityExist(Data.Model) do 
        Wait(100)
    end


    cachedD.Ped = CreatePed(4, Data.Model, Data.Coords, 44, true, true)

    FreezeEntityPosition(cachedD.Ped, true)
end


Stores.CreateMarker = function(coords)
    DrawScriptMarker({
        type = 6, r = 50, g = 150, b = 250, 
        sizeX = 1.0, sizeY = 1.0, sizeZ = 1.0, rotate = true,
        pos = coords - vector3(0.0, 0.0, 0.985)
    })
end 

DrawScriptMarker = function(markerData)
    DrawMarker(markerData["type"] or 1, markerData["pos"] or vector3(0.0, 0.0, 0.0), 0.0, 0.0, 0.0, (markerData["type"] == 6 and -90.0 or markerData["rotate"] and -180.0) or 0.0, 0.0, 0.0, markerData["sizeX"] or 1.0, markerData["sizeY"] or 1.0, markerData["sizeZ"] or 1.0, markerData["r"] or 1.0, markerData["g"] or 1.0, markerData["b"] or 1.0, 100, false, true, 2, false, false, false, false)
end

Stores.ShowFloatingHelpNotification = function(msg, coords) 
    AddTextEntry("floatingz", msg)
    SetFloatingHelpTextWorldPosition(1, coords)
    SetFloatingHelpTextStyle(1, 1, 2, -1, 3, 0)
    BeginTextCommandDisplayHelp('floatingz')
    EndTextCommandDisplayHelp(2, false, false, -1)
end

Stores.Notification = function(msg) 
	AddTextEntry('skeexs_stores', msg)
	BeginTextCommandThefeedPost('skeexs_stores')
	EndTextCommandThefeedPostTicker(flash or false, saveToBrief)
end