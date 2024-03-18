
local RSGCore = exports['rsg-core']:GetCoreObject()


-- ped crouch
function CrouchAnim()
    local dict = "script_mp@player@unlockdoor"
    RequestAnimDict(dict)
    while not HasAnimDictLoaded(dict) do
        Wait(10)
    end
    local ped = PlayerPedId()
    local coords = GetEntityCoords(ped)
    TaskPlayAnim(ped, dict, "unlockdoorl_male", 0.2, 4.0, -1, 1, 0, false, false, false)
end

-- ped crouch
function washAnim()
    local dict = "script_common@other@unapproved"
    RequestAnimDict(dict)
    while not HasAnimDictLoaded(dict) do
        Wait(10)
    end
    local ped = PlayerPedId()
    local coords = GetEntityCoords(ped)
    TaskPlayAnim(ped, dict, "windowwasher_wash_loop", 0.5, 8.0, -1, 1, 0, false, false, false)
end

RegisterNetEvent("rsg-wagonkeys:lockUnlock")
AddEventHandler("rsg-wagonkeys:lockUnlock", function(itemName)
    local playerPed = PlayerPedId()
    local vehicle = RSGCore.Functions.GetClosestVehicle()
	CrouchAnim()
	Wait(6000)
    ClearPedTasks(PlayerPedId())

    if vehicle ~= 0 then
        -- Play animation or sound effects here if needed
        
        -- Lock or unlock the vehicle based on the item name
        if itemName == "wagonkeys" then
            local isVehicleLocked = GetVehicleDoorLockStatus(vehicle)
            if isVehicleLocked == 1 then
                SetVehicleDoorsLocked(vehicle, 2) -- Lock the vehicle
				TriggerEvent('rNotify:NotifyLeft', "WAGON!", "LOCKED", "generic_textures", "tick", 4000)
            else
                SetVehicleDoorsLocked(vehicle, 1) -- Unlock the vehicle
				TriggerEvent('rNotify:NotifyLeft', "WAGON!", "UNLOCKED", "generic_textures", "tick", 4000)
            end
        end
    else
        -- Notify the player if no vehicle is found nearby
        RSGCore.Functions.Notify("No vehicle found nearby.", "error")
    end
end)


RegisterNetEvent("rsg-wagonkeys:wash", function()
    local playerPed = PlayerPedId() -- Get the player ped
    local vehicle = RSGCore.Functions.GetClosestVehicle()
	washAnim()
	Wait(6000)
    ClearPedTasks(PlayerPedId())
    if (vehicle == 0) then return end -- If the player is not in a vehicle, return
    SetVehicleDirtLevel(vehicle, 0)
	TriggerEvent('rNotify:NotifyLeft', "WAGON!", "WASHED", "generic_textures", "tick", 4000)
end, false)


-- Check if the vehicle exists in the game world.
if not DoesEntityExist(vehicle) then 
    -- If the vehicle does not exist, end the execution of the code here.
    return 
end
