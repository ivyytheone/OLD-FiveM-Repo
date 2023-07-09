local decors = {
    {
        decorName = "inInstance",
        decorType = 2
    },
    {
        decorName = "currentInstance",
        decorType = 3
    }
}

for decorIndex, decorData in ipairs(decors) do
    DecorRegister(decorData.decorName, decorData.decorType)
end

EnterInstance = function(instanceId)
    DecorSetInt(PlayerPedId(), "currentInstance", instanceId)
    DecorSetBool(PlayerPedId(), "inInstance", true)

    NetworkSetVoiceChannel(instanceId + 1000)
    NetworkSetTalkerProximity(0.0)
end

ExitInstance = function()
    DecorSetInt(PlayerPedId(), "currentInstance", 0)
    DecorSetBool(PlayerPedId(), "inInstance", false)

    NetworkClearVoiceChannel()
    NetworkSetTalkerProximity(2.5)
end

CreateThread(function()
    while true do
        local sleepThread = 500

        local ped = PlayerPedId()
        local pedCoords = GetEntityCoords(ped)

        if self.house ~= nil then
            sleepThread = 5

            local currentInstance = DecorGetInt(ped, "currentInstance")

            for _, player in pairs(GetActivePlayers()) do
                local playerPed = GetPlayerPed(player)

                if playerPed ~= ped then
                    if DoesEntityExist(playerPed) then
                        if DecorGetBool(playerPed, "inInstance") then
                            if DecorGetInt(playerPed, "currentInstance") ~= currentInstance then
                                SetEntityCoords(playerPed)
                                SetEntityLocallyInvisible(playerPed)
                                SetEntityNoCollisionEntity(ped, playerPed, true)
                            end
                        end
                    end
                end
            end
        end

        Wait(sleepThread)
    end
end)