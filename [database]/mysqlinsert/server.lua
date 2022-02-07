function ExtractIdentifiers()
    local identifiers = {
        steam = "",
        ip = "",
        discord = "",
        license = "",
        xbl = "",
        live = ""
    }

    --Loop over all identifiers
    for i = 0, GetNumPlayerIdentifiers(source) - 1 do
        local id = GetPlayerIdentifier(source, i)

        --Convert it to a nice table.
        if string.find(id, "steam") then
            identifiers.steam = id
        elseif string.find(id, "ip") then
            identifiers.ip = id
        elseif string.find(id, "discord") then
            identifiers.discord = id
        elseif string.find(id, "license") then
            identifiers.license = id
        elseif string.find(id, "xbl") then
            identifiers.xbl = id
        elseif string.find(id, "live") then
            identifiers.live = id
        end
    end

    return identifiers
end

-- Usage:

local identifiers = ExtractIdentifiers()
local steam = identifiers.steam


--RegisterCommand('send', function(source, args)
--    local argString = table.concat( args, " ")
--    MySQL.Async.fetchAll("INSERT INTO users (Steamid, name, surname, cash, bank) VALUES (@steam, @args[1], @args[2], @cash, @bank)",
--    {["@steam"] = GetPlayerIdentifiers(source)[2], ["@args[1]"] = args[1], ["@args[2]"] = argString[2]},
--        function(result)
--            TriggerClientEvent("display", source, "^3" ..argString.. "^0")
--    end)
--end)
--
--RegisterCommand('update', function(source)
--    MySQL.Async.fetchAll("UPDATE users (SteamName, data) VALUES (@source, @name, @args)",
--    {["@source"] = GetPlayerIdentifiers(source)[1], ["@name"] = GetPlayerName(source), ["@args"] = argString},
--        function(result)
--            TriggerClientEvent("display", source, "^3" ..argString.. "^0")
--    end)
--end)


RegisterNetEvent("PlayerJoining")
AddEventHandler("PlayerJoining", function()
    TriggerEvent('chat:addMessage', {
        color = { 255, 0, 0},
        multiline = true,
        args = {"steam", "Is joining the server!"}
      })
      
end)

MySQL.ready(function ()
    print("Database loaded and ready!")
  end)