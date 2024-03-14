
local RSGCore = exports['rsg-core']:GetCoreObject()

-- Command to lock the car of the player for everyone.
RegisterCommand("lockwagon", function()
    local playerPed = PlayerPedId() -- Get the player ped
    local vehicle = RSGCore.Functions.GetClosestVehicle()
    if (vehicle == 0) then return end -- If the player is not in a vehicle, return
    SetVehicleDoorsLocked(vehicle, 2) -- Lock the doors of the vehicle
	TriggerEvent('rNotify:NotifyLeft', "WAGON!", "LOCKED", "generic_textures", "tick", 4000)
end, false)

-- Command to unlock the car of the player for everyone.
RegisterCommand("unlockwagon", function()
    local playerPed = PlayerPedId() -- Get the player ped
    local vehicle = RSGCore.Functions.GetClosestVehicle()
    if (vehicle == 0) then return end -- If the player is not in a vehicle, return
    SetVehicleDoorsLocked(vehicle, 1) -- Unlock the doors of the vehicle
	TriggerEvent('rNotify:NotifyLeft', "WAGON!", "UNLOCKED", "generic_textures", "tick", 4000)
end, false)

RegisterCommand("washwagon", function()
    local playerPed = PlayerPedId() -- Get the player ped
    local vehicle = RSGCore.Functions.GetClosestVehicle()
    if (vehicle == 0) then return end -- If the player is not in a vehicle, return
    SetVehicleDirtLevel(vehicle, 0)
	TriggerEvent('rNotify:NotifyLeft', "WAGON!", "WASHED", "generic_textures", "tick", 4000)
end, false)


-- Check if the vehicle exists in the game world.
if not DoesEntityExist(vehicle) then 
    -- If the vehicle does not exist, end the execution of the code here.
    return 
end
