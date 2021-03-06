AddEventHandler('playerConnecting', function(name, setKickReason, defferals)
    local source = source
    local identifiers = GetPlayerIdentifiers(source)
    local steamid
    local license
    local discord
    local fivem
    local ip
    

    for k, v in ipairs(identifiers) do
        if string.match(v, 'steam') then
            steamid = v
            print('steamid:', v)
        elseif string.match(v,'license:') then
            license = v
        elseif string.match(v, 'discord') then 
            discord = v
        elseif string.match(v, 'fivem') then
            fivem = v
        elseif string.match(v, 'ip') then
            ip = v
        end
    end

    if not steamid then
        defferals.done('You need to open Steam')
    else
        defferals.done()
        print('Steamid is being fetched')
        -- Checking if player data is already in DB
        MySQL.Async.fetchScalar('SELECT 1 FROM user_identifiers WHERE steamid = @steamid',{
            ['@steamid'] = steamid
        }, function(result)
            if not result then
              print('Steamid not found, inserting identifiers into database')  -- Player not registered in DB
            
                MySQL.Async.execute('INSERT INTO user_identifiers (steamname, steamid, license, discord, fivem, ip) VALUES (@steamname, @steamid, @license, @discord, @fivem, @ip)',
            {['@steamname'] = GetPlayerName(source), ['@steamid'] = steamid, ['@license'] = license, ['@discord'] = discord, ['@fivem'] = fivem, ['@ip'] = ip})
                MySQL.Async.execute('INSERT INTO user_info (steamname, steamid) VALUES (@steamname, @steamid)', {['@steamname'] = GetPlayerName(source), ['@steamid'] = steamid})
               -- MySQL.Async.execute('INSERT INTO user_weapons (steamname, steamid) VALUES (@steamname, @steamid)', {['@steamname'] = GetPlayerName(source), ['@steamid'] = steamid})
                print('Identifiers inserted into DB')
            else
                print('Steamid found, connecting player to server') -- Player data already in DB
            end
        end)
    end
       
end)



RegisterServerEvent('framework:SpawnPlayer')
AddEventHandler('framework:SpawnPlayer', function()
    local source = source
    local identifiers = GetPlayerIdentifiers(source)
    for k, v in ipairs(identifiers) do
        if string.match(v, 'steam') then
            steamid = v
            break
        end
    end
    MySQL.Async.fetchAll('SELECT * FROM user_info WHERE steamid = @steamid',{
        ['@steamid'] = steamid
    }, function(result)
    local SpawnPos = json.decode(result[1].position)
    local model = json.decode(result[1].model)

    TriggerClientEvent('framework:LastPosition', source, SpawnPos[1], SpawnPos[2], SpawnPos[3], model)
    SetPlayerModel(source, model)
    print('Player position loaded')

    end)
end)

RegisterServerEvent('framework:SavePlayerPosition')
AddEventHandler('framework:SavePlayerPosition', function(PosX, PosY, PosZ, model)
    local source = source
    local identifiers = GetPlayerIdentifiers(source)
    for k, v in ipairs(identifiers) do
        if string.match(v, 'steam') then
            steamid = v
            break
        end
    end
    MySQL.Async.execute('UPDATE user_info SET position = @position, model = @model WHERE steamid = @steamid', {
        ['@steamid'] = steamid,
        ['@position'] = '{ ' .. PosX .. ', ' .. PosY .. ',' .. PosZ .. '}',
        ['@model'] = model
    })
end)