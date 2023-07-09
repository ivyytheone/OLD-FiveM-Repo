Funcs = {
    AddTextEntry = function(key, value)
        Citizen.InvokeNative(GetHashKey("ADD_TEXT_ENTRY"), key, value)
    end,

    CountPlayers = function()
        local count = 0

        for i = 0, 255 do
            if NetworkIsPlayerActive(i) then
                count = count + 1
            end
        end
    
        return count
    end,

    RemoveInventoryItem = function(item)
        TriggerServerEvent('eyrp_core:RemoveItem', item)
    end,

    DrawScreenText = function(text)
        SetTextFont(4)
        SetTextProportional(0)
        SetTextScale(0.2, 0.35)
        SetTextColour(255, 255, 255, 255)
        SetTextDropShadow(0, 0, 0, 0,255)
        SetTextEdge(1, 0, 0, 0, 255)
        SetTextDropShadow()
        if(outline)then
          SetTextOutline()
      end
        SetTextEntry("STRING")
        AddTextComponentString(text)
        DrawText(0.4, 0.9)
    end,
    
    DrawTxt = function(x,y ,width,height,scale, text, r,g,b,a, outline)
        SetTextFont(0)
        SetTextProportional(0)
        SetTextScale(scale, scale)
        SetTextColour(r, g, b, a)
        SetTextDropShadow(0, 0, 0, 0,255)
        SetTextEdge(1, 0, 0, 0, 255)
        SetTextDropShadow()
        if outline then SetTextOutline() end
        SetTextEntry("STRING")
        AddTextComponentString(text)
        DrawText(x - width/2, y - height/2 + 0.005)
    end

};