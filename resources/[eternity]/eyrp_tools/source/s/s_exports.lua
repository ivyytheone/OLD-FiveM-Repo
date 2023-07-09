GetPlayerIdentifiers = function(source)
    local ids = GetPlayerIdentifiers(source)
    local fixed = {}

    for _, id in pairs(ids) do 
        fixed[id:match("(.+):")] = id
    end

    return fixed
end