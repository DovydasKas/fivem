RegisterCommand("weapon", function(source, args)
    local ped = GetPlayerPed(source) -- Get player  
    local label = args[1]
    local ammo = tonumber(args[2])
    MySQL.Async.fetchAll('SELECT * FROM items WHERE label = @label',{
    ['@label'] = label
}, function(result) 
        local wep = result[1].name
        GiveWeaponToPed(ped, wep, ammo, false, true) -- Gives weapon
    end)

end, false)
        

