RegisterCommand("ooc", function(source,args)

    local message = args
    local name = GetPlayerName(PlayerId())

    TriggerServerEvent('chat:serverAdd', name, message)
 
 end,false)