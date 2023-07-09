ESX = nil 

TriggerEvent('esx:getSharedObject', function(obj) 
	ESX = obj  
end)  


RegisterCommand('me', function(source, args)
    local Text = table.concat(args, " ")
	local Player = ESX.GetPlayerFromId(source) 
	local rows = MySQL.Sync.fetchAll("SELECT firstname, lastname FROM users WHERE identifier = @identifier", { ["@identifier"] = Player.identifier})

	if #args == 0 then 
		Text = "Inget värde" 
	end

    TriggerEvent("eyrp_me:eventHandler", "SendMessage", {
        Name    = string.format("%s %s", rows[1].firstname, rows[1].lastname),
        ID      = source,
        Message = Text
    })
end)

RegisterCommand('adminMe', function(src, args)
	local Target 	= ESX.GetPlayerFromId(args[1])
	local Text		= table.concat(args, " ") 
	local rows = MySQL.Sync.fetchAll("SELECT firstname, lastname FROM users WHERE identifier = @identifier", { ["@identifier"] = Target.identifier})
	
	TriggerEvent("eyrp_me:eventHandler", "SendMessage", {
		Name	= string.format('%s %s', rows[1].firstname, rows[1].lastname),
		ID		= tonumber(args[1]),
		Message = (Text):gsub(args[1], "")
	})
end)

RegisterServerEvent("eyrp_me:eventHandler")
AddEventHandler("eyrp_me:eventHandler", function(event, data)
	TriggerClientEvent("eyrp_me:eventHandler", -1, event, data)
end) 

