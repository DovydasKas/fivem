RegisterCommand("weapon", function(source, args)
    local ped = GetPlayerPed(source) -- Get player
    local wep = args[1] -- Get weapon id arg (/weapon [weapID] [ammo])
    local ammo = tonumber(args[2]) -- Get ammo arg
    GiveWeaponToPed(ped, wep, ammo, false, true) -- Gives weapon
end, false)