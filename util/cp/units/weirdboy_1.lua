multiplayer.assets.grp_weirdboy = nil
multiplayer.assets.weirdboyTable = {}
multiplayer.assets.weirdboyDeathTable = {}

function Weirdboy_TeleportToPoint(arg0, arg1, arg2, arg3)
	local var0 = Group_IsStunned(arg0, ANY)
	if var0 == false then
		local var1 = Group_IsAnimAttached(arg0, ANY)
		if var1 == false then
			local var2 = Group_Create("")
			Group_SpawnEntities(var2, "ebps\\race_ork\\fx\\weirdboy_teleport_in_proxy", arg1, 1.0)
			multiplayer.assets.weirdboyTable.deco = arg2
			multiplayer.assets.weirdboyTable.group = arg0
			multiplayer.assets.weirdboyTable.location = arg1
			multiplayer.assets.weirdboyTable.invLogic = arg3
			multiplayer.assets.currentWave.tele2Evt = Event_AddTimerWithData(networkFunctions.Weirdboy_TeleportToPoint_Part2, 1.2000000476837158, ONESHOT, multiplayer.assets.weirdboyTable)
		end
	end
end

networkFunctions.WeirdboyDamaged = function (arg0, arg1, arg2, arg3, arg4, arg5)
	multiplayer.assets.currentWave.wbCurHp = multiplayer.assets.currentWave.wbCurHp - math.floor(arg4)
	if multiplayer.assets.currentWave.wbCurHp < 15 then
		multiplayer.assets.currentWave.wbCurHp = 15
	end
	Hud_SetWaveSize(multiplayer.assets.currentWave.wbMaxHp, multiplayer.assets.currentWave.wbCurHp, multiplayer.assets.currentWave.index)	
end

networkFunctions.EnemiesKilled = function (arg0, arg1, arg2, arg3, arg4, arg5)
	if multiplayer.assets.currentWave.wbCurHp < 15 then
		multiplayer.assets.currentWave.wbCurHp = 15
	end
	Hud_SetWaveSize(multiplayer.assets.currentWave.wbMaxHp, multiplayer.assets.currentWave.wbCurHp, multiplayer.assets.currentWave.index)
end

--! ФАЗА 1

networkFunctions.WeirdboyFirstActSpawnIn = function ()
	multiplayer.assets.currentWave.wbState = ""
	multiplayer.assets.currentWave.wbMaxHp = 3000
	multiplayer.assets.currentWave.wbCurHp = multiplayer.assets.currentWave.wbMaxHp
	Hud_SetWaveSize(multiplayer.assets.currentWave.wbMaxHp, multiplayer.assets.currentWave.wbCurHp, multiplayer.assets.currentWave.index)

	Event_AddTimer(networkFunctions.TeleportWeirdboyAround, 20.0, false)
	Event_AddGroupHealthPct(networkFunctions.WeirdboyFirstActNoArmor, multiplayer.assets.grp_weirdboy, 0.95)
	Event_AddEntityDamaged(networkFunctions.WeirdboyDamaged, multiplayer.assets.grp_weirdboy)
	multiplayer.assets.currentWave.wbHudEvt = Event_AddEntityCoopDeath(networkFunctions.EnemiesKilled, multiplayer.assets.grp_currentWave)
end

networkFunctions.WeirdboyFirstActNoArmor = function (arg0)
	if multiplayer.assets.currentWave.wbState ~= "killed" then
		--Hud_ShowText(LOCAL, "First act no armor", "", 5.0)
		-- multiplayer.assets.currentWave.wbCurHp = multiplayer.assets.currentWave.wbMaxHp
		-- Hud_SetWaveSize(multiplayer.assets.currentWave.wbMaxHp, multiplayer.assets.currentWave.wbCurHp, multiplayer.assets.currentWave.index)

		if arg0 ~= nil then
			Event_RemoveImmediate(arg0)
		end

		multiplayer.assets.currentWave.wbState = "firstNoArmor"
		--SpawnAoEs()
		SpawnRandomGroup("orks")
		SpawnRandomGroup("orks")
		Event_AddTimer(networkFunctions.WeirdboyHealthBarRestore, 1.0, false)
		Event_AddTimer(networkFunctions.WeirdboyFirstActSummonBegin, 1.0, false)
		Event_AddTimer(networkFunctions.WeirdboySecondActSpawnIn, 30.0, false)
	end
end

networkFunctions.WeirdboyFirstActSummonBegin = function (arg0)
	--Hud_ShowText(LOCAL, "Summoning begin", "", 5.0)
	Cmd_Idle(multiplayer.assets.grp_weirdboy)
	Group_StartEntityAction(multiplayer.assets.grp_weirdboy, "summon")
	Group_TriggerAnimationEvent(multiplayer.assets.grp_weirdboy, "evt_summonbegin")
	Event_AddTimer(networkFunctions.WeirdboyFirstActSummon, 1.0, false)
end

networkFunctions.WeirdboyFirstActSummon = function (arg0)
	if multiplayer.assets.currentWave.wbState == "firstNoArmor" then
		--Hud_ShowText(LOCAL, "Summoning", "", 5.0)
		SpawnRandomGroup("orks")
		Event_AddTimer(networkFunctions.WeirdboyFirstActSummon, 4.0, false)
	elseif arg0 ~= nil then
		Event_RemoveImmediate(arg0)
	end	
end

--! ФАЗА 2

networkFunctions.WeirdboySecondActSpawnIn = function ()
	multiplayer.assets.currentWave.wbState = ""
	multiplayer.assets.currentWave.wbCurHp = multiplayer.assets.currentWave.wbMaxHp
	Hud_SetWaveSize(multiplayer.assets.currentWave.wbMaxHp, multiplayer.assets.currentWave.wbCurHp, multiplayer.assets.currentWave.index)

	Group_StartEntityAction(multiplayer.assets.grp_weirdboy, "heal_to_full")
	Group_StopEntityAction(multiplayer.assets.grp_weirdboy, "summon")
	Entity_AddStringModifier(Group_GetEntityAt(multiplayer.assets.grp_weirdboy, 1.0), "third_mode_enabled")
	Weirdboy_TeleportToPoint(multiplayer.assets.grp_weirdboy, mkr_stairs_floor_middle, true)

	Event_AddTimer(networkFunctions.TeleportWeirdboyAround, 20.0, false)
	Event_AddGroupHealthPct(networkFunctions.WeirdboySecondActNoArmor, multiplayer.assets.grp_weirdboy, 0.95)
end

networkFunctions.WeirdboySecondActNoArmor = function ()
	if multiplayer.assets.currentWave.wbState ~= "killed" then
		--Hud_ShowText(LOCAL, "Second act no armor", "", 5.0)
		-- multiplayer.assets.currentWave.wbCurHp = multiplayer.assets.currentWave.wbMaxHp
		-- Hud_SetWaveSize(multiplayer.assets.currentWave.wbMaxHp, multiplayer.assets.currentWave.wbCurHp, multiplayer.assets.currentWave.index)
		
		if arg0 ~= nil then
			Event_RemoveImmediate(arg0)
		end

		multiplayer.assets.currentWave.wbState = "secondNoArmor"
		--SpawnAoEs()
		SpawnRandomGroup("orks")
		SpawnRandomGroup("orks")
		
		Event_AddTimer(networkFunctions.WeirdboyHealthBarRestore, 1.0, false)
		Event_AddTimer(networkFunctions.WeirdboySecondActSummonBegin, 1.0, false)
		Event_AddTimer(networkFunctions.WeirdboyThirdActSpawnIn, 30.0, false)
	end
end

networkFunctions.WeirdboyHealthBarRestore = function (arg0)
	if multiplayer.assets.currentWave.wbState ~= "" then
		multiplayer.assets.currentWave.wbCurHp = multiplayer.assets.currentWave.wbCurHp + 100
		if multiplayer.assets.currentWave.wbCurHp > multiplayer.assets.currentWave.wbMaxHp then
			multiplayer.assets.currentWave.wbCurHp = multiplayer.assets.currentWave.wbMaxHp
		end
		Hud_SetWaveSize(multiplayer.assets.currentWave.wbMaxHp, multiplayer.assets.currentWave.wbCurHp, multiplayer.assets.currentWave.index)

		Event_AddTimer(networkFunctions.WeirdboyHealthBarRestore, 1.0, false)
	end
end

networkFunctions.WeirdboySecondActSummonBegin = function (arg0)
	--Hud_ShowText(LOCAL, "Summoning AoEs begin", "", 5.0)
	Cmd_Idle(multiplayer.assets.grp_weirdboy)
	Group_StartEntityAction(multiplayer.assets.grp_weirdboy, "summon")
	Group_TriggerAnimationEvent(multiplayer.assets.grp_weirdboy, "evt_summonbegin")
	Event_AddTimer(networkFunctions.WeirdboySecondActSummon, 1.0, false)
end

networkFunctions.WeirdboySecondActSummon = function (arg0)
	if multiplayer.assets.currentWave.wbState == "secondNoArmor" then
		--Hud_ShowText(LOCAL, "Summoning AoEs", "", 5.0)
		SpawnRandomGroup("orks")
		Event_AddTimer(networkFunctions.WeirdboySecondActSummon, 4, false)
	elseif arg0 ~= nil then
		Event_RemoveImmediate(arg0)
	end
end

--! ФАЗА 3

networkFunctions.WeirdboyThirdActSpawnIn = function ()
	multiplayer.assets.currentWave.wbState = ""
	multiplayer.assets.currentWave.wbCurHp = multiplayer.assets.currentWave.wbMaxHp
	Hud_SetWaveSize(multiplayer.assets.currentWave.wbMaxHp, multiplayer.assets.currentWave.wbCurHp, multiplayer.assets.currentWave.index)

	Group_StartEntityAction(multiplayer.assets.grp_weirdboy, "heal_to_full")
	Group_StopEntityAction(multiplayer.assets.grp_weirdboy, "summon")
	--Entity_AddStringModifier(Group_GetEntityAt(multiplayer.assets.grp_weirdboy, 1.0), "third_mode_enabled")
	Weirdboy_TeleportToPoint(multiplayer.assets.grp_weirdboy, mkr_stairs_floor_middle, true)

	Event_AddTimer(networkFunctions.TeleportWeirdboyAround, 20.0, false)
	Event_AddGroupHealthPct(networkFunctions.WeirdboyThirdActNoArmor, multiplayer.assets.grp_weirdboy, 0.95)
end

networkFunctions.WeirdboyThirdActNoArmor = function ()
	if multiplayer.assets.currentWave.wbState ~= "killed" then
		--Hud_ShowText(LOCAL, "Third act no armor", "", 5.0)
		-- multiplayer.assets.currentWave.wbCurHp = multiplayer.assets.currentWave.wbMaxHp
		-- Hud_SetWaveSize(multiplayer.assets.currentWave.wbMaxHp, multiplayer.assets.currentWave.wbCurHp, multiplayer.assets.currentWave.index)
		
		if arg0 ~= nil then
			Event_RemoveImmediate(arg0)
		end

		multiplayer.assets.currentWave.wbState = "thirdNoArmor"
		--SpawnAoEs()
		SpawnRandomGroup("orks")

		Event_AddTimer(networkFunctions.WeirdboyThirdActSummonBegin, 1.0, false)
	end	
end

networkFunctions.WeirdboyThirdActSummonBegin = function (arg0)
	--Hud_ShowText(LOCAL, "Summoning clones begin", "", 5.0)
	Cmd_Idle(multiplayer.assets.grp_weirdboy)
	Group_StartEntityAction(multiplayer.assets.grp_weirdboy, "summon")
	Group_TriggerAnimationEvent(multiplayer.assets.grp_weirdboy, "evt_summonbegin")
	--Event_AddTimer(networkFunctions.WeirdboyThirdActSummon, 1.0, false)

	Group_SpawnEntities(multiplayer.assets.grp_dropship, "ebps\\multiplayer\\race_ork\\ork_coop_weirdboy_clone", mkr_weirdboy_01, 1.0)
	Group_SpawnEntities(multiplayer.assets.grp_dropship, "ebps\\multiplayer\\race_ork\\ork_coop_weirdboy_clone", mkr_weirdboy_02, 1.0)
	Group_SpawnEntities(multiplayer.assets.grp_dropship, "ebps\\multiplayer\\race_ork\\ork_coop_weirdboy_clone", mkr_weirdboy_03, 1.0)
	Group_SpawnEntities(multiplayer.assets.grp_dropship, "ebps\\multiplayer\\race_ork\\ork_coop_weirdboy_clone", mkr_weirdboy_04, 1.0)
	Group_SpawnEntities(multiplayer.assets.grp_dropship, "ebps\\multiplayer\\race_ork\\ork_coop_weirdboy_clone", mkr_weirdboy_05, 1.0)
	Event_AddEntityDeath(networkFunctions.WeirdboyFourthActSpawnIn, multiplayer.assets.grp_dropship)
end

--! ФАЗА 4

networkFunctions.WeirdboyFourthActSpawnIn = function ()
	if Group_Count(multiplayer.assets.grp_dropship) == 0 then
		multiplayer.assets.currentWave.wbState = ""
		multiplayer.assets.currentWave.wbCurHp = multiplayer.assets.currentWave.wbMaxHp
		Hud_SetWaveSize(multiplayer.assets.currentWave.wbMaxHp, multiplayer.assets.currentWave.wbCurHp, multiplayer.assets.currentWave.index)

		Group_StartEntityAction(multiplayer.assets.grp_weirdboy, "heal_to_full")
		Group_StopEntityAction(multiplayer.assets.grp_weirdboy, "summon")
		--Entity_AddStringModifier(Group_GetEntityAt(multiplayer.assets.grp_weirdboy, 1.0), "third_mode_enabled")
		Weirdboy_TeleportToPoint(multiplayer.assets.grp_weirdboy, mkr_stairs_floor_middle, true)
		Group_SetInvulnerable(multiplayer.assets.grp_weirdboy, false)

		Event_AddTimer(networkFunctions.TeleportWeirdboyAround, 20.0, false)
		Event_AddEntityDeath(networkFunctions.WeirdboyKilled, multiplayer.assets.grp_weirdboy)
		SpawnRandomGroup("orks")
		SpawnRandomGroup("orks")
		SpawnRandomGroup("orks")
		SpawnRandomGroup("orks")
		SpawnRandomGroup("orks")
		SpawnRandomGroup("orks")
	end
end

networkFunctions.WeirdboyKilled = function (arg0)
	multiplayer.assets.currentWave.wbState = "killed"
end

networkFunctions.TeleportWeirdboyAround = function (arg0)
	if multiplayer.assets.currentWave.wbState == '' then
		local mkrArr = {
			mkr_weirdboy_01,
			mkr_weirdboy_02,
			mkr_weirdboy_03,
			mkr_weirdboy_04,
			mkr_weirdboy_05
			--mkr_Dropship_Destination,
			--MKR_Ork_bottom_01,
			--mkr_stairs_floor_middle
			-- mkr_explosionWay_01_Left,
			-- mkr_explosionWay_01_Right,
			-- mkr_explosionWay_01_Back,
			-- mkr_explosionWay_01_BackLeft,
			-- mkr_explosionWay_01_BackRight,
			-- mkr_explosionWay_01_DownLeft
		}
		local var0 = Group_Count(multiplayer.assets.grp_weirdboy)
		if 0.0 < var0 then
			local var1 = math.random(1, 5)
			Weirdboy_TeleportToPoint(multiplayer.assets.grp_weirdboy, mkrArr[var1], false)
		end
	
		--SpawnAoEs()
		SpawnRandomGroup("orks")
		--SpawnRandomGroup("orks")
	
		Event_AddTimer(networkFunctions.TeleportWeirdboyAround, 20.0, false)
	end	
end

networkFunctions.Weirdboy_TeleportToPoint_Part2 = function (arg0, arg1)
	if multiplayer.assets.currentWave.wbState == '' then
		local var0 = Group_IsStunned(arg1.group, ANY)
		if var0 == false then
			local var1 = Group_IsAnimAttached(arg1.group, ANY)
			if var1 == false then
				Group_TriggerAnimationEvent(arg1.group, "EVT_TeleportOut")
				Event_AddTimerWithData(networkFunctions.Weirdboy_PlayteleportAwayFX, 0.800000011920929, ONESHOT, arg1)
				Event_AddTimerWithData(networkFunctions.Weirdboy_TeleportToPoint_Part3, 0.8999999761581421, ONESHOT, arg1)
			end
		end
	end
end

networkFunctions.Weirdboy_TeleportToPoint_Part3 = function (arg0, arg1)
	if multiplayer.assets.currentWave.wbState == '' then
		local var2 = Group_GetHealthFraction(multiplayer.assets.grp_weirdboy)
		local var0 = Group_Count(arg1.group)
		local var1 = Group_IsAnimAttached(arg1.group, ANY)

		if 0.0 < var0 then				
			Entity_ResetAnimationGraph(Group_GetEntityAt(arg1.group, 1.0))
		end

		Group_WarpToPosition(arg1.group, arg1.location)
		Group_TriggerAnimationEvent(arg1.group, "EVT_TeleportIn")
	end
end

networkFunctions.Weirdboy_PlayteleportAwayFX = function (arg0, arg1)
	if multiplayer.assets.currentWave.wbState == '' then
		Group_StartEntityAction(arg1.group, "Teleport_Out")
	end
end