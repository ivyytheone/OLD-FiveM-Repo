Funcs = {};

Funcs.PoliceCard = function()
    ESX.TriggerServerCallback('eyrp_policearmory:PoliceCard', function(Response, PlayerRank)

        if Response and PlayerRank then
             if exports['eyrp_inventory']:HasSpecificItem({
                 item = 'policecard',
                  data = {
                     firstname = Response.firstname,
                     lastname = Response.lastname,
                     rakel = Response.rakel,
                     rank = PlayerRank
                  }
             }) then
                 exports['eyrp_notify']:LoadNotification('Du har redan en polisbricka på dig', 'error', true)
                 return
             end

            Utils.PlayAnimation('itap_policeid')

            exports['eyrp_inventory']:addInventoryItem({
                item = 'policecard',
                message = true,
                data = {
                    firstname = Response.firstname,
                    lastname = Response.lastname,
                    rakel = Response.rakel,
                    rank = PlayerRank
                }
            })
            
        end
    end)
end

Funcs.GiveKey = function()

    local PermLevel = Utils.Input('Skriv in behörighetsnivå 1-3', '', 30);

    if not PermLevel then 
        return exports['eyrp_notify']:LoadNotification('Detta fält är obligatoriskt', 'error', true)
    end

    if not tonumber(PermLevel) then
        return exports['eyrp_notify']:LoadNotification('Behörighetsnivån måste vara ett nummer', 'error', true)
    end

    if tonumber(PermLevel) < 1 then
        return exports['eyrp_notify']:LoadNotification('Behörighetsnivån måste vara minst 1', 'error', true)
    end

    if tonumber(PermLevel) > 3 then
        return exports['eyrp_notify']:LoadNotification('Behörighetsnivån får vara minst 3', 'error', true)
    end


    local Name = Utils.Input('Namn på nyckel', '', 30);

    if not Name then 
        return exports['eyrp_notify']:LoadNotification('Detta fält är obligatoriskt', 'error', true)
    end

    if tonumber(Name) then
        return exports['eyrp_notify']:LoadNotification('Namnet kan inte vara ett nummer', 'error', true)
    end

    Utils.PlayAnimation('prop_cs_swipe_card')

    exports['eyrp_inventory']:addInventoryItem({
        item = 'policekey',
        message = true,
        data = {
            name = Name,
            hiddendata = PermLevel,
            adress = 'Polisstationen (Misson Row 69)'
        }
    })

end