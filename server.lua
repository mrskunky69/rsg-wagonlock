local RSGCore = exports['rsg-core']:GetCoreObject()

-- Register the useable item "wagonkeys"
RSGCore.Functions.CreateUseableItem("wagonkeys", function(source, item)
    local _source = source
    local Player = RSGCore.Functions.GetPlayer(_source)
    local firstname = Player.PlayerData.charinfo.firstname
    local lastname = Player.PlayerData.charinfo.lastname
    
    -- Trigger client event to lock/unlock the vehicle
    TriggerClientEvent("rsg-wagonkeys:lockUnlock", _source, item.name)
end)

RSGCore.Functions.CreateUseableItem("oldrag", function(source, item)
    local _source = source
    local Player = RSGCore.Functions.GetPlayer(_source)
    local firstname = Player.PlayerData.charinfo.firstname
    local lastname = Player.PlayerData.charinfo.lastname
    
    -- Trigger client event to lock/unlock the vehicle
    TriggerClientEvent("rsg-wagonkeys:wash", _source, item.name)
end)












	






