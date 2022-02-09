RegisterCommand("ped", function(source, args)
    local ped = GetPlayerPed(source)
    local label = table.unpack(args)
    trim=function(str)
        return ({str:gsub(" +"," ")})[1] 
    end
   -- print(trim(table.unpack(args)))
    MySQL.Async.fetchAll('SELECT * FROM peds WHERE label = @label',{
    ['@label'] = label
}, function(result) 
        local model = result[1].name
        TriggerClientEvent('SetPedModel', model)
    end)

end, false)
        