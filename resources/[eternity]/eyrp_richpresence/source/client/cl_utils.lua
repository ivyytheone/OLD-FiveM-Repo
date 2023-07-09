Utils = {
    CountPlayers = function()
        local count = 0
    
        for i = 0, 255 do
            if NetworkIsPlayerActive(i) then
                count = count + 1
            end
        end
    
        return count
    end
}; 