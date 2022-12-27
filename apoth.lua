

-- function ApothEternalLessThanDelay(evt, entity)
-- 	Hud_ShowText(LOCAL, "TIME TO CHOOSE", "", 5.0)
-- 	local pct = Entity_GetHealthFraction(entity)
-- 	Hud_ShowText(LOCAL, "TIME TO CHOOSE" .. tostring(entity) .. tostring(pct), "", 5.0)
-- 	if pct <= 0.1 then
-- 		Entity_Kill(entity)
-- 	else
-- 		Entity_SetInvulnerable(entity, 0)
-- 		Event_AddTimerWithData(ApothEternalLessThanRestart, 60.0, false, entity)
-- 	end
-- end

-- function ApothEternalLessThanRestart(evt, entity)
-- 	Entity_SetInvulnerable(entity, 0.001)
-- 	Hud_ShowText(LOCAL, "BOOM DONE", "", 5.0)

-- 	function ApothEternalLessThan()
-- 		Hud_ShowText(LOCAL, "FUCK", "", 5.0)
-- 		Event_AddTimerWithData(ApothEternalLessThanDelay, 10.0, false, entity)
-- 	end

-- 	Event_AddEntityHealthPct(ApothEternalLessThan, entity, 0.1)
-- end