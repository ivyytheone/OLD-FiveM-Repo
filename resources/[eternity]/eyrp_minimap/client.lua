posX = -0.015
posY = -0.004

width = 0.174
height = 0.28

RectWidth = 0.174
RectHeight = 0.28

CreateThread(function()
	RequestStreamedTextureDict("circlemap", false)
	while not HasStreamedTextureDictLoaded("circlemap") do
		Wait(100)
	end
    SetBlipAlpha(GetNorthRadarBlip(),0)
	AddReplaceTexture("platform:/textures/graphics", "radarmasksm", "circlemap", "radarmasksm")

	SetMinimapClipType(1)
	SetMinimapComponentPosition('minimap', 'L', 'B', posX, posY, width, height)
	SetMinimapComponentPosition('minimap_mask', "I", "I", 0.15, 0.85, 0.09, 0.15)
	SetMinimapComponentPosition('minimap_blur', 'L', 'B', -0.018, 0.030, 0.256, 0.337)

    local minimap = RequestScaleformMovie("minimap")
    SetRadarBigmapEnabled(true, false)
    Wait(0)
    SetRadarBigmapEnabled(false, false)

    while true do
        Wait(0)
        BeginScaleformMovieMethod(minimap, "SETUP_HEALTH_ARMOUR")
        ScaleformMovieMethodAddParamInt(3)
        EndScaleformMovieMethod()
        BeginScaleformMovieMethod(minimap, 'HIDE_SATNAV')
        EndScaleformMovieMethod()
    end
end)

CreateThread(function()
	while true do
		Wait(0)

		SetScriptGfxAlign(string.byte('L'), string.byte('B'))
		SetScriptGfxAlignParams(posX + (RectWidth / 2), posY + (RectHeight / 2), RectWidth, RectHeight)
		ResetScriptGfxAlign()
	end
end)

function CalculateTimeToDisplay()
	hour = GetClockHours()
    minute = GetClockMinutes()
    
    local obj = {}
    local clockSTR = nil
    
	if minute <= 9 then
		minute = "0" .. minute
    end
    
	if hour <= 9 then
		hour = "0" .. hour
    end
    
    obj.hour = hour
    obj.minute = minute

    clockSTR = tostring(obj.hour..":"..obj.minute)

    return clockSTR
end

CreateThread(function()
    while true do
        Wait(0)
        HideMinimapInteriorMapThisFrame()
        --SetRadarZoom(1000)
        SetRadarBigmapEnabled(false, false)

        if not IsPedInAnyVehicle(PlayerPedId()) or IsPauseMenuActive() then
            SendNUIMessage({
                action = "hideUI",
                waypointActive = false,
                showCompass = false
            })
            DisplayRadar(false)
        else
            DisplayRadar(true)
            SendNUIMessage({
                action = "displayUI",
            })
            if IsWaypointActive() then
                local dist = (#(GetEntityCoords(PlayerPedId()) - GetBlipCoords(GetFirstBlipInfoId(8)))) * 0.001 --//* 0.000621 = mi || * 0.001 = km
                --[[if (ShouldUseMetricMeasurements()) {
                    dist = ((dist) * 0.001); --* 0.000621 = mi || * 0.001 = km
                } else {
                    dist = ((dist) * 0.000621); --* 0.000621 = mi || * 0.001 = km
                }]]
                local roundDist = string.format("%.2f", dist)
                SendNUIMessage({
                    waypointActive = true,
                    distance = roundDist
                })
            else
                SendNUIMessage({
                    waypointActive = false
                })
            end
        end
    end
end)