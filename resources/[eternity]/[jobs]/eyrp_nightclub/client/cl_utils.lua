Utils = {};

Utils.EventHandler = function(Event) 
    TriggerEvent('eyrp_nightclub:eventHandler', Event)
end

Utils.CreateBlip = function() 
    local Blip = AddBlipForCoord(Config["Locations"]["EnterInterior"]["Coords"])

	SetBlipSprite(Blip, 93)
	SetBlipScale(Blip, 0.7)
	SetBlipColour(Blip, 0)
	SetBlipAsShortRange(Blip, true)

	BeginTextCommandSetBlipName('STRING')
	AddTextComponentSubstringPlayerName("Nattklubben")
	EndTextCommandSetBlipName(Blip)
end