Utils = {};

Utils.Draw3DText = function(Data)
    local onScreen, _x, _y = World3dToScreen2d(Data.Coords.x, Data.Coords.y, Data.Coords.z) 

    SetTextScale(0.38, 0.38)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 200)
    SetTextEntry("STRING")
    SetTextCentre(1)

    AddTextComponentString(Data.Text)
    DrawText(_x, _y)

    local factor = string.len(Data.Text) / 370
    DrawRect(_x, _y + 0.0125, 0.015 + factor, 0.03, 41, 11, 41, 68)
end 

Utils.GetPlayerMoney = function(Money) 
    PlayerMoney = ESX.GetPlayerData()["money"]

    if PlayerMoney >= Money then 
        return true
    else
        return false
    end
end

Utils.DrawScreenText = function(Data)
    SetTextFont(8)
    SetTextProportional(0)
    SetTextScale(0.4, 0.4)
    SetTextColour(255, 255, 255, 255)
    SetTextDropShadow(0, 0, 0, 0,255)
    SetTextEdge(1, 0, 0, 0, 255)
    SetTextDropShadow()
    if(outline)then
      SetTextOutline()
  end
    SetTextEntry("STRING")
    AddTextComponentString(Data.Text)
    DrawText(0.82 - 1.0/2, 0.604 - 1.0/2 + 0.005)
end

Utils.Notify = function(msg, flash, saveToBrief, hudColorIndex)
    if saveToBrief == nil then saveToBrief = true end
	AddTextEntry('esxNotification', msg)
	BeginTextCommandThefeedPost('esxNotification')
	if hudColorIndex then ThefeedNextPostBackgroundColor(hudColorIndex) end
	EndTextCommandThefeedPostTicker(flash or false, saveToBrief)
end