local TUNING = GLOBAL.TUNING

--------------------------------------------------------------------------
--[[ TUNING设置 ]]
--------------------------------------------------------------------------

-- 冰箱保鲜
TUNING.PERISH_FRIDGE_MULT = 0
-- 盐盒保鲜
TUNING.PERISH_SALTBOX_MULT = -0.1

-- 鸟笼保鲜
TUNING.PERISH_CAGE_MULT = 0

-- 熊罐保鲜
TUNING.BEARGERFUR_SACK_PRESERVER_RATE = 0

-- 种子袋保鲜
TUNING.SEEDPOUCH_PRESERVER_RATE = 0

-- 烹饪提速
-- TUNING.BASE_COOK_TIME = TUNING.BASE_COOK_TIME * 0.5

-- 作物成熟后不腐烂
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


--炮塔可解除部署
AddPrefabPostInit("eyeturret", function(inst)
	local function turnon(inst)
		inst.on = true
		inst:Remove()
		GLOBAL.SpawnPrefab("eyeturret_item").Transform:SetPosition(inst.Transform:GetWorldPosition())
	end
	inst:AddComponent("machine")
	inst.components.machine.turnonfn = turnon
end)

-- 嚎弹炮无限容量
AddPrefabPostInit("houndstooth_blowpipe", function(inst)
	if inst.components.container then
		inst.components.container:EnableInfiniteStackSize(true)
	end
end)

-- 熊罐无限容量
AddPrefabPostInit("beargerfur_sack", function(inst)
	if inst.components.container then
		inst.components.container:EnableInfiniteStackSize(true)
	end
end)
