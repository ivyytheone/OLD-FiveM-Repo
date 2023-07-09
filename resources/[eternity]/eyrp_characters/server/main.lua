ESX = {}
TriggerEvent('esx:getSharedObject', function(obj) 
    ESX = obj 
end)

local IdentifierTables = {
    {table = "users", column = "identifier"},
    {table = "characters", column = "identifier"},
    {table = "datastore_data", column = "owner"},
}

local Position = {
    ["motel"] = vector3(335.58517456055, -203.35450744629, 54.226383209229),
    ["torget"] = vector3(241.64018249512, -890.30487060547, 30.492111206055),
    ["police"] = vector3(442.91351318359, -964.26770019531, 28.926193237305),
    ["hospital"] = vector3(301.32321166992, -616.60418701172, 43.450344085693)
}

RegisterServerEvent("esx_kashacters:SetupCharacters")
AddEventHandler('esx_kashacters:SetupCharacters', function()
    local src = source
    local LastCharId = GetLastCharacter(src)
    SetIdentifierToChar(GetPlayerIdentifiers(src)[1], LastCharId)
    local Characters = GetPlayerCharacters(src)
    TriggerClientEvent('esx_kashacters:SetupUI', src, Characters)
end)

RegisterServerEvent("esx_kashacters:CharacterChosen")
AddEventHandler('esx_kashacters:CharacterChosen', function(charid, ischar, location)
    local src = source
    local spawn = {}
    SetLastCharacter(src, tonumber(charid))
    SetCharToIdentifier(GetPlayerIdentifiers(src)[1], tonumber(charid))
    if ischar == "true" then
        local spawn = ""
        if location == "latest-position" then
            local getpos = GetSpawnPos(src)
            spawn = vector3(getpos["x"], getpos["y"], getpos["z"])
        else
            spawn = Position[location] - vector3(0.0, 0.0, 0.985)
        end

		TriggerClientEvent("esx_kashacters:SpawnCharacter2", src, spawn, location)
    else
		TriggerClientEvent('eyrp_register:open', src)
        TriggerClientEvent('esx_kashacters:SpawnCharacter', src)
    end
end)

RegisterServerEvent("esx_kashacters:DeleteCharacter")
AddEventHandler('esx_kashacters:DeleteCharacter', function(charid)
    local src = source
    DeleteCharacter(GetPlayerIdentifiers(src)[1], charid)
    TriggerClientEvent("esx_kashacters:ReloadCharacters", src)
end)

function GetPlayerCharacters(source)
    local identifier = GetIdentifierWithoutSteam(GetPlayerIdentifiers(source)[1])
    local Chars = MySQLAsyncExecute("SELECT * FROM `users` WHERE identifier LIKE '%"..identifier.."%'")
    for i=1, #Chars, 1 do
        charJob = MySQLAsyncExecute("SELECT * FROM `jobs` WHERE `name` = '"..Chars[i].job.."'")
        charRank = MySQLAsyncExecute("SELECT * FROM `job_grades` WHERE `job_name` = '"..Chars[i].job.."' and `grade` = '"..Chars[i].job_grade.."'")
        Chars[i].job_grade = charRank[1].label
        Chars[i].job = charJob[1].label
    end
        
    return Chars
end

function GetLastCharacter(source)
    local LastChar = MySQLAsyncExecute("SELECT `charid` FROM `user_lastcharacter` WHERE `steamid` = '"..GetPlayerIdentifiers(source)[1].."'")
    if LastChar[1] ~= nil and LastChar[1].charid ~= nil then
        return tonumber(LastChar[1].charid)
    else
        MySQLAsyncExecute("INSERT INTO `user_lastcharacter` (`steamid`, `charid`) VALUES('"..GetPlayerIdentifiers(source)[1].."', 1)")
        return 1
    end
end

function SetLastCharacter(source, charid)
    MySQLAsyncExecute("UPDATE `user_lastcharacter` SET `charid` = '"..charid.."' WHERE `steamid` = '"..GetPlayerIdentifiers(source)[1].."'")
end

function SetIdentifierToChar(identifier, charid)
    for _, itable in pairs(IdentifierTables) do
        MySQLAsyncExecute("UPDATE `"..itable.table.."` SET `"..itable.column.."` = 'Char"..charid..GetIdentifierWithoutSteam(identifier).."' WHERE `"..itable.column.."` = '"..identifier.."'")
    end
end

function SetCharToIdentifier(identifier, charid)
    for _, itable in pairs(IdentifierTables) do
        MySQLAsyncExecute("UPDATE `"..itable.table.."` SET `"..itable.column.."` = '"..identifier.."' WHERE `"..itable.column.."` = 'Char"..charid..GetIdentifierWithoutSteam(identifier).."'")
    end
end

function DeleteCharacter(identifier, charid)
    for _, itable in pairs(IdentifierTables) do
        MySQLAsyncExecute("DELETE FROM `"..itable.table.."` WHERE `"..itable.column.."` = 'Char"..charid..GetIdentifierWithoutSteam(identifier).."'")
    end
end

function GetSpawnPos(source)
    local SpawnPos = MySQLAsyncExecute("SELECT `position` FROM `users` WHERE `identifier` = '"..GetPlayerIdentifiers(source)[1].."'")
    return json.decode(SpawnPos[1].position)
end

function GetIdentifierWithoutSteam(Identifier)
    return string.gsub(Identifier, "steam", "")
end

function MySQLAsyncExecute(query)
    local IsBusy = true
    local result = nil
    MySQL.Async.fetchAll(query, {}, function(data)
        result = data
        IsBusy = false
    end)
    while IsBusy do
        Citizen.Wait(0)
    end
    return result
end

RegisterServerEvent("esx_kashacters:changeCharacterSave")
AddEventHandler("esx_kashacters:changeCharacterSave", function()
    local xPlayer = ESX.GetPlayerFromId(source)

    if xPlayer ~= nil then
        ESX.SavePlayer(xPlayer)

        TriggerClientEvent("esx_kashacters:changeCharacterSave", source)
    end
end)

ESX.RegisterServerCallback("esx_kashacters:createCharacters", function(Source, Cb, charId)
    local identifier = GetPlayerIdentifiers(Source)[1]
    local lastdigits = math.random(9) .. math.random(9) .. math.random(9) .. math.random(9)
    local personalnumber = (charId.Dob .. '-' .. lastdigits)
    MySQL.Async.execute("UPDATE `users` SET `firstname` = @firstname, `lastname` = @lastname, `dateofbirth` = @dateofbirth, `sex` = @sex, `height` = @height WHERE identifier = @identifier",
    {
      ['@identifier']   = identifier,
      ['@firstname']    = charId.Firstname,
      ['@lastname']     = charId.Lastname,
      ['@dateofbirth']  = personalnumber,
      ['@sex']          = charId.Sex,
      ['@height']       = charId.Height
    },
    function(result)
      MySQL.Async.execute('INSERT INTO characters (identifier, firstname, lastname, dateofbirth, sex, height) VALUES (@identifier, @firstname, @lastname, @dateofbirth, @sex, @height)',
      {
        ['@identifier']   = identifier,
        ['@firstname']    = charId.Firstname,
        ['@lastname']     = charId.Lastname,
        ['@dateofbirth']  = personalnumber,
        ['@sex']          = charId.Sex,
        ['@height']       = charId.Height
      },
      function(result)
        Cb(true)
      end)
    end)
end)