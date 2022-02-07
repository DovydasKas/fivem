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
        MySQL.Async.fetchScalar('SELECT 1 FROM user_identifiers WHERE steamid = @steamid',{
            ['@steamid'] = steamid
        }, function(result)
            if not result then
              print('Steamid not found, inserting identifiers into database')  
            
              MySQL.Async.execute('INSERT INTO user_identifiers (steamname, steamid, license, discord, fivem, ip) VALUES (@steamname, @steamid, @license, @discord, @fivem, @ip)',
            {['@steamname'] = GetPlayerName(source), ['@steamid'] = steamid, ['@license'] = license, ['@discord'] = discord, ['@fivem'] = fivem, ['@ip'] = ip})
                print('Identifiers inserted into DB')
            else
                print('steamid found, connecting player to server')
            end
        end)
    end
       
end)