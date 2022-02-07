Citizen.CreateThread(function()

    for i = 1, 14 do -- Loop through dispatch types
        Citizen.InvokeNative(0xDC0F817884CDD856, i, false) -- Disables dispatch types that we loop through
    end
end)