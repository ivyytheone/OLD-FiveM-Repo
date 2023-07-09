local ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

math.randomseed(math.floor(os.time() + math.random(100)))

-- Player loaded
AddEventHandler('es:playerLoaded', function( source )
  getIdentity(source, function(data)
    if data.firstname == '' or data.firstname == nil or data.firstname == 0 or data.firstname == '0' then
      TriggerClientEvent('eyrp_register:open', source)
    else
      Citizen.Wait(1000)
    end
  end)
end)

-- Register the player
ESX.RegisterServerCallback('eyrp_register:register', function(source, cb, data)
  local identifier = GetPlayerIdentifiers(source)[1]
  local lastdigits = math.random(9) .. math.random(9) .. math.random(9) .. math.random(9)
  local personalnumber = (data.dateofbirth .. '-' .. lastdigits)
  MySQL.Async.execute("UPDATE `users` SET `firstname` = @firstname, `lastname` = @lastname, `dateofbirth` = @dateofbirth, `sex` = @sex, `height` = @height, `lastdigits` = @lastdigits WHERE identifier = @identifier",
  {
    ['@identifier']   = identifier,
    ['@firstname']    = data.firstname,
    ['@lastname']     = data.lastname,
    ['@dateofbirth']  = personalnumber,
    ['@sex']          = data.sex,
    ['@height']       = data.height
  },
  function( result )
    MySQL.Async.execute('INSERT INTO characters (identifier, firstname, lastname, dateofbirth, sex, height, lastdigits) VALUES (@identifier, @firstname, @lastname, @dateofbirth, @sex, @height, @lastdigits)',
    {
      ['@identifier']   = identifier,
      ['@firstname']    = data.firstname,
      ['@lastname']     = data.lastname,
      ['@dateofbirth']  = personalnumber,
      ['@sex']          = data.sex,
      ['@height']       = data.height
    },
    function( result )
      -- Done
      cb(true)
    end)
  end)
end)

-- Get Identity
function getIdentity(source, callback)
  local identifier = GetPlayerIdentifiers(source)[1]
  MySQL.Async.fetchAll("SELECT identifier, firstname, lastname, dateofbirth, sex, height, lastdigits FROM `users` WHERE `identifier` = @identifier",
  {
    ['@identifier'] = identifier
  },
  function(result)
    if result[1].firstname ~= nil then
      local data = {
        identifier  = result[1].identifier,
        firstname  = result[1].firstname,
        lastname  = result[1].lastname,
        dateofbirth  = result[1].dateofbirth,
        sex      = result[1].sex,
        height    = result[1].height,
      }
      callback(data)
    else
      local data = {
        identifier   = '',
        firstname   = '',
        lastname   = '',
        dateofbirth = '',
        sex     = '',
        height     = ''
      }
      callback(data)
    end
  end)
end
