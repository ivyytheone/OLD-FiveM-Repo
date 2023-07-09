CreateThread(function()
    Wait(100)

    while true do
        local sleepThread = 250;

        if ESX.IsPlayerLoaded() then
            ESX.TriggerServerCallback('eyrp_core:richPresence', function(data, maxplayers)
                    PushScaleformMovieFunctionParameterString(data.firstname)
                    N_0xb9449845f73f5e9c("SHIFT_CORONA_DESC")
                    PushScaleformMovieFunctionParameterBool(true)
                    PopScaleformMovieFunction()
                    N_0xb9449845f73f5e9c("SET_HEADER_TITLE")
                    PushScaleformMovieFunctionParameterString(("~b~Eternity - %s/%s"):format(Funcs.CountPlayers(), data.maxplayers))
                    PushScaleformMovieFunctionParameterBool(true)
                    PushScaleformMovieFunctionParameterString(("~b~Rollspelar som %s %s - ID %s"):format(data.firstname, data.lastname, GetPlayerServerId(PlayerId())))
                    PushScaleformMovieFunctionParameterBool(true)
                    PopScaleformMovieFunctionVoid()
            end)

        else
            PushScaleformMovieFunctionParameterString(data.firstname)
            N_0xb9449845f73f5e9c("SHIFT_CORONA_DESC")
            PushScaleformMovieFunctionParameterBool(true)
            PopScaleformMovieFunction()
            N_0xb9449845f73f5e9c("SET_HEADER_TITLE")
            PushScaleformMovieFunctionParameterString('Laddar...')
            PushScaleformMovieFunctionParameterBool(true)
            PushScaleformMovieFunctionParameterString('Laddar...')
            PushScaleformMovieFunctionParameterBool(true)
            PopScaleformMovieFunctionVoid()
        end

        Wait(sleepThread)
    end

    Funcs.AddTextEntry('PM_PANE_LEAVE', 'Lämna ~r~Eternity~s~')
    Funcs.AddTextEntry('PM_PANE_QUIT', '~r~Stäng av FiveM')
    Funcs.AddTextEntry('PM_SCR_MAP', '~b~GPS')
    Funcs.AddTextEntry('PM_SCR_GAM', '~r~Lämna spelet')
    Funcs.AddTextEntry('PM_SCR_INF', '~b~Logs')
    Funcs.AddTextEntry('PM_SCR_SET', '~b~Inställningar')
    Funcs.AddTextEntry('PM_SCR_STA', '~b~Statistik ')
    Funcs.AddTextEntry('PM_SCR_GAL', '~b~Galleri ')
    Funcs.AddTextEntry('PM_SCR_RPL', '~b~Rockstar Editor ∑')
end)