local TUNING = GLOBAL.TUNING
local TheNet = GLOBAL.TheNet

local IsServer = TheNet:GetIsServer() or TheNet:IsDedicated()
if IsServer then
    -- 冰箱冰切 保鲜 
    if GetModConfigData("fridge_preserver") then
        TUNING.PERISH_FRIDGE_MULT = 0
    end
    

    -- 盐盒保鲜
    if GetModConfigData("saltbox_preserver") then
        TUNING.PERISH_SALTBOX_MULT = 0
    end
    

    -- 鸟笼保鲜
    if GetModConfigData("cage_preserver") then
        TUNING.PERISH_CAGE_MULT = 0
    end

    -- 熊罐保鲜
    if GetModConfigData("beargerfur_sack_preserver") then
        TUNING.BEARGERFUR_SACK_PRESERVER_RATE = 0
    end

    -- 种子袋保鲜
    if GetModConfigData("seedpouch_preserver") then
        TUNING.SEEDPOUCH_PRESERVER_RATE = 0
    end

    -- 烹饪提速
    TUNING.BASE_COOK_TIME = TUNING.BASE_COOK_TIME * GetModConfigData("cook_rate")

    -- 作物成熟后不腐烂
    if GetModConfigData("crops_preserve") then
        AddComponentPostInit("growable", function(self)
            local old_StartGrowing = self.StartGrowing
            function self:StartGrowing(time)
                if self.stages and self.stages[self.stage] and self.stages[self.stage].name ~= nil and 
                    self.stages[self.stage].name == "full" then
                    self:StopGrowing()
                    return
                end
                return old_StartGrowing(self,time)
            end
            self.inst:DoTaskInTime(0,function()
                if self.stages ~= nil and self.stages[self.stage] and self.stages[self.stage].name ~= nil and self.stages[self.stage].name == "full" then
                    self:StopGrowing()
                end	
            end)
        end)
    end

    --炮塔可解除部署
    if GetModConfigData("eyeturret_recover") then
        AddPrefabPostInit("eyeturret", function(inst)
            local function turnon(inst)
                inst.on = true
                inst:Remove()
                GLOBAL.SpawnPrefab("eyeturret_item").Transform:SetPosition(inst.Transform:GetWorldPosition())
            end
            inst:AddComponent("machine")
            inst.components.machine.turnonfn = turnon
        end)
    end

    -- 嚎弹炮无限容量
    if GetModConfigData("houndstooth_blowpipe_infinite") then
        AddPrefabPostInit("houndstooth_blowpipe", function(inst)
            if inst.components.container then
                inst.components.container:EnableInfiniteStackSize(true)
            end
        end)
    end

    -- 熊罐无限容量
    if GetModConfigData("beargerfur_sack_infinite") then
        AddPrefabPostInit("beargerfur_sack", function(inst)
            if inst.components.container then
                inst.components.container:EnableInfiniteStackSize(true)
            end
        end)
    end
end