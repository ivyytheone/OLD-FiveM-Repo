Utils = {
    HelpText = function(Message)
        BeginTextCommandDisplayHelp('STRING')
        AddTextComponentSubstringPlayerName(Message)
        EndTextCommandDisplayHelp(0, false, true, -1)
    end
}