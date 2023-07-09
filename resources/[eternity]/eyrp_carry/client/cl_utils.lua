Utils = {};

Utils.OpenMenu = function()
	local menuElements = {
        { 
            label = "Lyft som en bebis", 
            event = "normal"
        },
		{
			label = 'Lyft över axeln',
			event = 'shoulder'
		} 
    }
    ESX.UI.Menu.Open('default', GetCurrentResourceName(), "carry_options",
    {
        title = 'Individåtgärder (Lyft)',
        align = "top-right",
        elements = menuElements
    }, function(data, menu)
        local action = data.current.event 

		if action == 'normal' then
			Utils.CarryNormal()
        end

		if action == 'shoulder' then
			Utils.CarryShoulder()
		end
    end, function(data, menu)
        menu.close() 
    end)
end

Utils.CarryShoulder = function()
    local Player = PlayerPedId()

    if IsPedDeadOrDying(Player) or IsPedDeadOrDying(Player) or IsEntityPlayingAnim(Player, 'missfinale_c2mcs_1', 'fin_c2_mcs_1_camman', 3) then return end

    local Distance, ClosestPlayer = ESX.Game.GetClosestPlayer()

    if Distance == -1 or ClosestPlayer > 1.0 then
        exports['eyrp_notify']:LoadNotification('Det finns ingen spelare i närheten', 'error', true)
    else
        TriggerServerEvent('eyrp_carry:SyncShoulder', GetPlayerServerId(ClosestPlayer), GetPlayerServerId(PlayerId()))

        exports['eyrp_core']:PlayAnimation({
            Dict = 'missfinale_c2mcs_1',
            Lib = 'fin_c2_mcs_1_camman'
        })
    end
end



exports('OpenMenu', Utils.OpenMenu)