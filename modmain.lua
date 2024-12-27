local _G = GLOBAL
local TheNet = _G.TheNet

local IsServer = TheNet:GetIsServer() or TheNet:IsDedicated()
if IsServer then
    modimport("scripts/settings.lua")
end