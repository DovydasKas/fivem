---- Weapon spawner
RegisterCommand("weapon", function(source, args)
    local ped = GetPlayerPed(source)
    local wep = args[1]
    local ammo = tonumber(args[2])
    GiveWeaponToPed(ped, wep, ammo, false, true)
end, false)
    

-----------------------------------------------------------------