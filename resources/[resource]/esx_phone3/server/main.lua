ESX = nil
local DisptachRequestId = 0
local onCalls = {}
local PhoneNumbers = {
	["ambulance"] = {
		["type"] = "SOS Alarm",
		["sharePos"] = true,
		["hasDispatch"] = true,
		["hideNumber"] = false,
		["hidePosIfAnon"] = true,
		["sources"] = {}
	},
	["cardealer"] = {
		["type"] = "Kund",
		["sharePos"] = false,
		["hasDispatch"] = true,
		["hideNumber"] = false,
		["hidePosIfAnon"] = true,
		["sources"] = {}
	},
	["police"] = {
		["type"] = "SOS Alarm",
		["sharePos"] = true,
		["hasDispatch"] = true,
		["hideNumber"] = false,
		["hidePosIfAnon"] = true,
		["sources"] = {}
	},
	["vianor"] = {
		["type"] = "Kund",
		["sharePos"] = false,
		["hasDispatch"] = true,
		["hideNumber"] = false,
		["hidePosIfAnon"] = true,
		["sources"] = {}
	},
	["taxi"] = {
		["type"] = "Kund",
		["sharePos"] = true,
		["hasDispatch"] = true,
		["hideNumber"] = false,
		["hidePosIfAnon"] = true,
		["sources"] = {}
	},
	["mekonomen"] = {
		["type"] = "Kund",
		["sharePos"] = true,
		["hasDispatch"] = true,
		["hideNumber"] = false,
		["hidePosIfAnon"] = true,
		["sources"] = {}
	},
	["trygghansa"] = {
		["type"] = "Kund",
		["sharePos"] = true,
		["hasDispatch"] = false,
		["hideNumber"] = false,
		["hidePosIfAnon"] = true,
		["sources"] = {}
	},
	["boatdealer"] = {
		["type"] = "Kund",
		["sharePos"] = true,
		["hasDispatch"] = true,
		["hideNumber"] = false,
		["hidePosIfAnon"] = true,
		["sources"] = {}
	},
	["karaoke"] = {
		["type"] = "Kund",
		["sharePos"] = false,
		["hasDispatch"] = false,
		["hideNumber"] = false,
		["hidePosIfAnon"] = true,
		["sources"] = {}
	},
	["bahamas"] = {
		["type"] = "Kund",
		["sharePos"] = false,
		["hasDispatch"] = false,
		["hideNumber"] = false,
		["hidePosIfAnon"] = true,
		["sources"] = {}
	}
}

TriggerEvent('esx:getSharedObject', function(obj)
  	ESX = obj
end)

function onCallsChanged()
	TriggerClientEvent("sendOnCalls", -1, onCalls)
end

function GenerateUniquePhoneNumber()
	local foundNumber, phoneNumber = false, nil

	while not foundNumber do
		Citizen.Wait(100)

		math.randomseed(GetGameTimer())
		phoneNumber = "07" .. math.random(9) .. math.random(9) .. math.random(9) .. math.random(9) .. math.random(9) .. math.random(9) .. math.random(9) .. math.random(9)

		local result = MySQL.Sync.fetchAll('SELECT COUNT(*) as count FROM users WHERE phone_number = @phoneNumber', { ['@phoneNumber'] = phoneNumber })

		if tonumber(result[1]["count"]) == 0 then
			foundNumber = true
		end
	end

	return phoneNumber
end

function EndCall(source, channel, target)
	onCalls[source] = nil
	TriggerClientEvent('esx_phone:endCall', source)

	if target then

		local targetPlayer = ESX.GetPlayerFromId(target)

		if targetPlayer then
			onCalls[target] = nil
			TriggerClientEvent('esx_phone:endCall', target)
		end
	end

	onCallsChanged()
end

RegisterServerEvent('esx_phone:tryOpenPhoneCalling')
AddEventHandler('esx_phone:tryOpenPhoneCalling', function(target, channel, number, emergency)
	local xPlayer = ESX.GetPlayerFromId(source)
	local targetPlayer = ESX.GetPlayerFromId(target)

	if xPlayer["getInventoryItem"]('phone')["count"] > 0 then
		TriggerClientEvent('esx_phone:openPhoneCalling', source, target, channel, number, emergency)
	else
		TriggerClientEvent('esx_phone:endCall', targetPlayer["source"], 'Kontakten är ej tillgänglig.')
	end

	onCallsChanged()
end)

RegisterServerEvent('esx_phone:startCall')
AddEventHandler('esx_phone:startCall', function(number, ownNumber)
	local src = source
	local xPlayer = ESX.GetPlayerFromId(src)
	local channel = src + 1000
	local foundPlayer = 0
	local emergency = false

	if xPlayer["job"]["name"] == Config.NumberToJob[number] then
		TriggerClientEvent('esx_phone:endCall', xPlayer["source"], 'Ring inte till ditt egna företag är du snäll.')

		onCallsChanged()
		return
	end

	if Config.NumberToJob[number] then
		emergency = true

		local randomizedEmployee = calculatedEmployee(Config.NumberToJob[number])
		if randomizedEmployee == 0 then
			TriggerClientEvent('esx_phone:endCall', xPlayer["source"], 'Något gick snett, ring igen eller testa senare.')

			onCallsChanged()

			return
		else
			foundPlayer = randomizedEmployee
		end
	else
		for key, values in pairs(PhoneNumbers) do
			if number == key then
				foundPlayer = getFirstTableValue(values["sources"])
				break
			end
		end
	end

	if onCalls[foundPlayer] and foundPlayer ~= 0 then
		TriggerClientEvent('esx_phone:endCall', xPlayer["source"], 'Kontakten är redan ansluten i ett samtal.')

		onCallsChanged()

		return
	elseif not onCalls[foundPlayer] and foundPlayer == 0 then
		TriggerClientEvent('esx_phone:endCall', xPlayer["source"], 'Kontakten är ej ansluten.')

		onCallsChanged()
		return
	end

	onCalls[xPlayer["source"]] = { ["channel"] = channel, ["target"] = foundPlayer, ["number"] = ownNumber, ["targetNumber"] = number}
	onCalls[foundPlayer] = { ["channel"] = channel, ["target"] = xPlayer["source"], ["number"] = number, ["targetNumber"] =  ownNumber}

	onCallsChanged()

	if emergency then
		TriggerClientEvent('esx_phone:incomingCall', foundPlayer, xPlayer["source"], channel, ownNumber, true)
	else
		TriggerClientEvent('esx_phone:incomingCall', foundPlayer, xPlayer["source"], channel, ownNumber, false)
	end
end)

function getFirstTableValue(sources)
	for key, boolean in pairs(sources) do
		return key
	end
end

function calculatedEmployee(job)
	local xPlayers = ESX.GetPlayers()
	local employeeList = {}

	for i=1, #xPlayers do
		local employee = ESX.GetPlayerFromId(xPlayers[i])

		if employee["job"]["name"] == job then
			table.insert(employeeList, {["source"] = xPlayers[i]})
		end
	end

	if #employeeList == 0 then
		return 0
	else

		math.randomseed(GetGameTimer())
		local randomIndex = math.random(1, #employeeList)

		return employeeList[randomIndex]["source"]
	end
end

RegisterServerEvent('esx_phone:acceptCall')
AddEventHandler('esx_phone:acceptCall', function(target, channel)
	TriggerClientEvent('esx_phone:onAcceptCall', target, channel, source)
end)

RegisterServerEvent("esx_phone:removeCall")
AddEventHandler("esx_phone:removeCall", function(target)
	onCalls[source] = nil
	onCalls[target] = nil

	onCallsChanged()

	TriggerClientEvent("esx_phone:endCall", target, "Kontakten parkerade samtalet.")
end)

RegisterServerEvent('esx_phone:endCall')
AddEventHandler('esx_phone:endCall', function(channel, target)
  	EndCall(source, channel, target)

  	onCallsChanged()
end)

AddEventHandler('esx:playerDropped', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	local onCall = onCalls[xPlayer["source"]]

	PhoneNumbers[hasPhoneNumber(source)] = nil
	
	if PhoneNumbers[xPlayer["job"]["name"]] then
		PhoneNumbers[xPlayer["job"]["name"]]["sources"][tostring(source)] = nil
	end

	if onCall then
		EndCall(source, onCall["channel"], onCall["target"])

		onCallsChanged()
	end
end)

AddEventHandler('esx:setJob', function(source, job, lastJob)
	if PhoneNumbers[lastJob["name"]] then
		PhoneNumbers[lastJob["name"]]["sources"][tostring(source)] = nil
	end

	if PhoneNumbers[job["name"]] then
		PhoneNumbers[job["name"]]["sources"][tostring(source)] = true
	end
end)

RegisterServerEvent('esx_phone:removePlayerContact')
AddEventHandler('esx_phone:removePlayerContact', function(phoneNumber)
	MySQL.Async.execute('DELETE FROM user_contacts WHERE identifier=@identifier AND number=@number', {['@identifier'] = GetPlayerIdentifiers(source)[1], ['@number'] = phoneNumber})
end)

RegisterServerEvent('esx_phone:send')
AddEventHandler('esx_phone:send', function(phoneNumber, message, anon, position, isAutomaticAlarm)
	local src = source

	Citizen.Trace('MESSAGE => ' .. GetPlayerName(src) .. ' @' .. phoneNumber .. ' : ' .. message)
	
	if PhoneNumbers[phoneNumber] then

		for k,v in pairs(PhoneNumbers[phoneNumber]["sources"]) do

			local numType = PhoneNumbers[phoneNumber]["type"]
			local numHasDispatch = PhoneNumbers[phoneNumber]["hasDispatch"]
			local numHide = PhoneNumbers[phoneNumber]["hideNumber"]
			local numHidePosIfAnon = PhoneNumbers[phoneNumber]["hidePosIfAnon"]
			local numPosition = PhoneNumbers[phoneNumber]["sharePos"] and position or false
			local numSource = tonumber(k)

			if numHidePosIfAnon and anon and not isAutomaticAlarm then
				numPosition = false
			end
			
			if numHasDispatch then
				TriggerClientEvent('esx_phone:onMessage', numSource, hasPhoneNumber(src), message, numPosition, (numHide and true or anon), numType, true)
			else
				TriggerClientEvent('esx_phone:onMessage', numSource, hasPhoneNumber(src), message, numPosition, (numHide and true or anon), numType, false)
			end
		end
	end
end)

RegisterServerEvent('esx_phone:tweet')
AddEventHandler('esx_phone:tweet', function(msg, date)
	local src = source
	local xPlayers = ESX.GetPlayers()

	Citizen.Trace('TWEET => ' .. date .. ' ' .. msg)

	MySQL.Async.execute('INSERT INTO phone_tweets (message, date) VALUES (@msg, @date)', { ['@msg'] = msg, ['@date'] = date })

	for i=1, #xPlayers do
		if xPlayers[i] ~= src then
			TriggerClientEvent('esx_phone:tweet', xPlayers[i], msg)
		end
	end
end)

AddEventHandler('esx_phone:registerNumber', function(number, type, sharePos, hasDispatch, hideNumber, hidePosIfAnon)
	local hideNumber = hideNumber or false
	local hidePosIfAnon = hidePosIfAnon or false

	if not PhoneNumbers[number] then
		PhoneNumbers[number] = {
			["type"] = type,
			["sharePos"] = sharePos,
			["hasDispatch"] = (hasDispatch or false),
			["hideNumber"] = hideNumber,
			["hidePosIfAnon"] = hidePosIfAnon,
			["sources"] = {}
		}
	end
end)

RegisterServerEvent('esx_phone:addPlayerContact')
AddEventHandler('esx_phone:addPlayerContact', function(contactNumber, contactName)
	local src = source
	local foundNumber = false

	MySQL.Async.fetchAll('SELECT phone_number FROM users WHERE phone_number = @number LIMIT 1',
	{
		['@number'] = tostring(contactNumber)
	},
	function(result)

		if result[1] or Config.NumberToJob[contactNumber] then
			foundNumber = true
		end

		if foundNumber then

			if contactNumber == hasPhoneNumber(src) then
				TriggerClientEvent('esx:showNotification', src, "Du kan inte lägga till dig själv")
			else

				local hasAlreadyAdded = false
				local contacts = getContacts(src)

				for i=1, #contacts, 1 do
					if contacts[i]["number"] == contactNumber then
						hasAlreadyAdded = true
					end
				end

				if hasAlreadyAdded then
					TriggerClientEvent('esx:showNotification', src, "numret finns redan i din kontaktlisa")
				else

					MySQL.Async.execute('INSERT INTO user_contacts (identifier, name, number) VALUES (@identifier, @name, @number)',
					{
						['@identifier'] = GetPlayerIdentifiers(src)[1],
						['@name'] = contactName,
						['@number'] = contactNumber
					},
					function(rowsChanged)
				
						TriggerClientEvent('esx:showNotification', src, "Kontakt tillagd")
						TriggerClientEvent('esx_phone:refreshContacts', src, getContacts(src))
					end)
				end
			end
		else
			TriggerClientEvent('esx:showNotification', src, "Detta nummer är ogiltigt")
		end
	end)
end)

RegisterServerEvent('esx_phone:stopDispatch')
AddEventHandler('esx_phone:stopDispatch', function(dispatchRequestId)
  	TriggerClientEvent('esx_phone:stopDispatch', -1, dispatchRequestId)
end)

RegisterServerEvent("esx_phone:alertEmployees")
AddEventHandler("esx_phone:alertEmployees", function(job, message)
	local xPlayers = ESX.GetPlayers()

	for i=1, #xPlayers do
		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])

		if xPlayer["job"]["name"] == job then
			TriggerClientEvent("esx:showNotification", xPlayers[i], message)
		end
	end
end)

RegisterServerEvent('esx_phone:swish')
AddEventHandler('esx_phone:swish', function(amount, phoneNumber)
	local src = source
	local xPlayer = ESX.GetPlayerFromId(src)
	local identifier = nil

	if amount > 0 then
		if amount <= xPlayer.getAccount('bank')["money"] then
			if amount <= 10000 then
				if Config.NumberToLabel[phoneNumber] then
					TriggerClientEvent('esx:showNotification', src, "Du skickade in ett bidrag på " .. amount .. "kr till " .. Config.NumberToLabel[phoneNumber])

					TriggerEvent('esx_addonaccount:getSharedAccount', 'society_' .. Config.NumberToJob[phoneNumber], function(account)
						account.addMoney(amount)
						xPlayer.removeAccountMoney('bank', amount)
					end)

					return
				elseif not doesCharacterExist(phoneNumber) then
					TriggerClientEvent('esx:showNotification', src, "Telefonnumret tillhör inte någon.")
					return
				else
					identifier = doesCharacterExist(phoneNumber)
				end

				if not ESX.GetPlayerFromIdentifier(identifier) then
					TriggerClientEvent('esx:showNotification', src, "Du har fört över " .. amount .. "kr till " .. phoneNumber)

					local rows = MySQL.Sync.fetchAll("SELECT bank FROM users WHERE identifier = @identifier LIMIT 1", {['@identifier'] = identifier})
					MySQL.Async.execute('UPDATE users SET bank = @bank WHERE identifier = @identifier', { ['@identifier'] = identifier, ['@bank'] = rows[1]["bank"] + amount })

					return
				end

				local targetPlayer = ESX.GetPlayerFromIdentifier(identifier)
				xPlayer.removeAccountMoney('bank', amount)
				targetPlayer.addAccountMoney('bank', amount)
				
				TriggerClientEvent('esx:showNotification', src, "Du har fört över " .. amount .. "kr till " .. phoneNumber)
				TriggerClientEvent('esx:showNotification', targetPlayer["source"], "Du mottog en swish på " .. amount .. "kr")
			else
				TriggerClientEvent('esx:showNotification', src, "Swish är spärrat på 10.000 per överföring")
			end
		else
			TriggerClientEvent('esx:showNotification', src, "Du har inte råd med detta")
		end
	else
		TriggerClientEvent('esx:showNotification', src, "Ogiltigt belopp")
	end
end)

RegisterServerEvent('esx_phone:firstLoad')
AddEventHandler('esx_phone:firstLoad', function()
	local src = source
	local xPlayer = ESX.GetPlayerFromId(src)
	local rows = MySQL.Sync.fetchAll("SELECT firstname, lastname FROM users WHERE identifier = @identifier LIMIT 1", {['@identifier'] = xPlayer["identifier"]})

	if not hasPhoneNumber(src) then

		local phoneNumber = GenerateUniquePhoneNumber()
		
		MySQL.Async.execute('UPDATE users SET phone_number = @phone_number WHERE identifier = @identifier',
			{
				['@identifier'] = xPlayer["identifier"],
				['@phone_number'] = phoneNumber
			}
		)

		PhoneNumbers[phoneNumber] = {
			["type"] = 'player',
			["hashDispatch"] = false,
			["sharePos"] = false,
			["hideNumber"] = false,
			["hidePosIfAnon"] = false,
			["sources"] = {[src] = true}
		}

		TriggerClientEvent("esx_phone:loadData", src, phoneNumber, getContacts(src), rows[1]["firstname"] .. " " .. rows[1]["lastname"], getTweets())
	else
		PhoneNumbers[hasPhoneNumber(src)] = {
			["type"] = 'player',
			["hashDispatch"] = false,
			["sharePos"] = false,
			["hideNumber"] = false,
			["hidePosIfAnon"] = false,
			["sources"] = {[src] = true}
		}

		TriggerClientEvent("esx_phone:loadData", src, hasPhoneNumber(src), getContacts(src), rows[1]["firstname"] .. " " .. rows[1]["lastname"], getTweets())
	end
	
	if PhoneNumbers[xPlayer["job"]["name"]] then
		PhoneNumbers[xPlayer["job"]["name"]]["sources"][tostring(src)] = true
	end
end)

ESX.RegisterServerCallback('esx_phone:getIdentity', function(source, cb)
	local identifier = GetPlayerIdentifiers(source)[1]
	local result = MySQL.Sync.fetchAll("SELECT firstname FROM users WHERE identifier = @identifier LIMIT 1", {['@identifier'] = identifier})

	cb(result[1]['firstname'])
end)


function doesCharacterExist(phonenumber)
	local rows = MySQL.Sync.fetchAll("SELECT identifier FROM users WHERE phone_number = @phone_number LIMIT 1", {['@phone_number'] = phonenumber})

	if not rows[1] then
		return false
	end

	return rows[1]["identifier"]
end

function hasPhoneNumber(source)
	local identifier = GetPlayerIdentifiers(source)[1]
	local rows = MySQL.Sync.fetchAll("SELECT phone_number FROM users WHERE identifier = @identifier LIMIT 1", {['@identifier'] = identifier})

	if not rows[1]["phone_number"] then
		return false
	end

	return 0 .. tonumber(rows[1]["phone_number"])
end

function getContacts(source)
	local rows = MySQL.Sync.fetchAll("SELECT * FROM user_contacts WHERE identifier = @identifier", {['@identifier'] = GetPlayerIdentifiers(source)[1]})
	local contacts = {
		{
			["number"] = "11414",
			["name"] = "Polisen"
		},
		{
			["number"] = "1177",
			["name"] = "Sjukvården"
		},
		{
			["number"] = "46400",
			["name"] = "Autoexperten"
		},
		{
			["number"] = "22020",
			["name"] = "Taxi"
		},
		{
			["number"] = "48900",
			["name"] = "Vianor"
		},
		{
			["number"] = "83200",
			["name"] = "Bilfirman"
		},
		{

			["number"] = "25091",
			["name"] = "Trygghansa"
		},

	
		
	}

	for i=1, #rows do
		table.insert(contacts, {
			["number"] = rows[i]["number"],
			["name"] = rows[i]["name"],
		})
	end

	return contacts
end

function getTweets()
	local tweets = MySQL.Sync.fetchAll("SELECT * FROM phone_tweets", {})
	local tweetTable = {}

	for i=1, #tweets do
		table.insert(tweetTable, {
			["date"] = tweets[i]["date"],
			["message"] = tweets[i]["message"]
		})
	end

	return tweetTable
end