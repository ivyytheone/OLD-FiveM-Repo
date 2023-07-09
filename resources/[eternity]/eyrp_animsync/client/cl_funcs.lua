Funcs = {}

Funcs.LoadAnimDict = function(dict)
    while not HasAnimDictLoaded(dict) do
        RequestAnimDict(dict)
        Wait(100)
    end
end

Funcs.LoadNamedPtfxAsset = function(asset)
    while not HasNamedPtfxAssetLoaded(asset) do
        RequestNamedPtfxAsset(asset)
    Wait(100)
end
end