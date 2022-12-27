if Network_IsCoop() then
	require("Util/Common")
	require("Util/Scarutil")
	require("Util/CP/CP_Common")
	require("Util/CP/CP_AutomatedTurrets")
	require("Util/CP/Endless/CP_Endless")

	multiplayer.assets.csp_firing = nil
	arenaNum = 1.0
	thisArena = "s_027_r500_bridges"
	arenaExit = "mkr_labs_d_exit"
	multiplayer.objectiveData = {
	}
	multiplayer.blockerMarkersMarine = {
	"marine_blocker_03", "marine_blocker_04"}
	multiplayer.blockerMarkersChaos = {}
	multiplayer.shieldMarkersMarine = {"marine_shield_01",
	"marine_shield_02",
	"marine_shield_03",
	"marine_shield_04",
	"marine_shield_05"}
	multiplayer.shieldMarkersChaos = {}
	
	factionsAvailable = {
		"loyals"
	}
	
	--mkr_objective_1 - SM bunker
	--mkr_objective_2 - Building center
	--mkr_objective_3 - CSM bunker
	--mkr_dread_01 - SM start
	--mkr_dread_02 - Building center
	--mkr_dread_03 - CSM start
	--mkr_dread_04 - Open center
	--tdm_mkr_spawn_01 - SM near spawn left
	--tdm_mkr_spawn_02 - SM bunker left
	--tdm_mkr_spawn_03 - SM near spawn right
	--tdm_mkr_spawn_04 - Building SM enter stair corner
	--tdm_mkr_spawn_05 - Building SM side pre-center
	--tdm_mkr_spawn_06 - Near Building SM side enter from SM bunker
	--tdm_mkr_spawn_07 - SM side near-building trench
	--tdm_mkr_spawn_08 - SM near spawn under
	--tdm_mkr_spawn_09 - SM bunker corner
	--tdm_mkr_spawn_10 - CSM near spawn right
	--tdm_mkr_spawn_11 - CSM bunker right
	--tdm_mkr_spawn_12 - CSM bunker corner
	--tdm_mkr_spawn_13 - CSM near spawn under
	--tdm_mkr_spawn_14 - CSM near spawn left
	--tdm_mkr_spawn_15 - Near Building CSM side enter from CSM bunker
	--tdm_mkr_spawn_16 - CSM side near-building trench
	--tdm_mkr_spawn_17 - Building CSM side pre-center
	--tdm_mkr_spawn_18 - Building CSM enter stair corner
	--marine_flag - SM center spawn flag
	--chaos_flag - CSM center spawn flag	
	--ctf_1_mkr_spawn_08 - SM after bunker corner
	--ctf_1_mkr_spawn_09 - SM building center under bridge
	--ctf_2_mkr_spawn_09 - CSM building center under bridge
	--ctf_2_mkr_spawn_08 - CSM after bunker corner
	--sm_dread_spawn - SM spawn near front-right to tdm_mkr_spawn_01
	--csm_dread_spawn - SM spawn near front-right to tdm_mkr_spawn_10
	--mkr_dread_cp_01 - Center of the map closer to mkr_dread_04
	--mkr_dread_cp_02 - Balcony
	--mkr_start_marine
	--mkr_Start_Ork

	spawnPoints = {
	}

	apothSpawnPoint = marine_flag

	function MissionStartNetwork()
		InitLuaSafe()
	end

	-- Server only
	function MissionStart()
		math.randomseed(os.time())
		RegisterPlayerEvents()
		
		if EmptyPool ~= nil then
			EmptyPool()
		end

		InitVariables()
		SetupCoop()
		SpawnTitans()
		SpawnApoth()
		SpawnBackgroundEnemiesStart()
			
		Game_SetCoopTokenSettings(5000.0, 3.0, 4.0, 1000.0)
		Event_AddPlayerSpawned(networkFunctions.noDeathsFail)
		multiplayer.assets.evtPlayerSpawned = Event_AddPlayerSpawned(networkFunctions.PlayerSpawned)
		multiplayer.assets.evtApoInitMarker = Event_AddPlayerSpawned(networkFunctions.ApoInitMarker)
		Event_AddPlayerDeleted(networkFunctions.coop_checkFailCondition)
		Event_AddEntityDeath(networkFunctions.coop_checkFailCondition, Player_GetGroupHuman())
	end

	function InitVariables()
		multiplayer.assets.apothFirstSpawned = false
		multiplayer.assets.playersAndAllies = Group_Create("playersAndAllies")
		multiplayer.assets.mainEnemies = Group_Create("mainEnemies")
		multiplayer.assets.mainEnemiesRequest = Group_Create("mainEnemiesRequest")
	end

	networkFunctions.PlayerSpawned = function(arg0, arg1)
		Group_AddGroupEntities(multiplayer.assets.playersAndAllies, Player_GetGroupHuman())
		Group_IgnoreGroup(multiplayer.assets.backgroundEnemiesStartOutside, multiplayer.assets.playersAndAllies)
		Group_IgnoreGroup(multiplayer.assets.playersAndAllies, multiplayer.assets.backgroundEnemiesStartOutside)
		Group_IgnoreGroup(multiplayer.assets.backgroundEnemiesStartInside, multiplayer.assets.playersAndAllies)
		Group_IgnoreGroup(multiplayer.assets.playersAndAllies, multiplayer.assets.backgroundEnemiesStartInside)
	end

	networkFunctions.ApoInitMarker = function(arg0, arg1)
		Event_Remove(multiplayer.assets.evtApoInitMarker)
		ShowDecoratorApothInit()
		Hud_ShowTitleCard(1898417, 1898418)
		multiplayer.assets.evtReachMarker = 
			Event_AddProximityEnter(networkFunctions.ApoStartFollowingInit, 
				Player_GetGroupHuman(), 
				apothSpawnPoint, 
				false, 10.0)
	end

	-- Сделать одного титана на фоне постоянно идущим
	-- Остальные идут или перестреливаются
	networkFunctions.TitanStep = function(evt)
		multiplayer.assets.titanIdx = math.random(1, Group_Count(multiplayer.assets.grp_titan))
		local titan = Group_GetEntityAt(multiplayer.assets.grp_titan, multiplayer.assets.titanIdx)
		local action = math.random(1, 3)
		if action == 1 or action == 2 then
			local grTitan = Group_Create("ere")
			Group_Clear(grTitan)
			Group_AddEntity(grTitan, titan)
			Group_TriggerAnimationEvent(grTitan, "TIT_Walk")
			multiplayer.assets.evtTitanAction = 
				Event_AddTimer(networkFunctions.TitanWalkStop, 10, false)
				Event_AddTimer(networkFunctions.TitanWalkStop, 11, false)
				Event_AddTimer(networkFunctions.TitanWalkStop, 12, false)
				--Hud_ShowText(LOCAL, "TitanWalkStart", "", 5.0)
		elseif action == 3 then
			Entity_StartEntityAction(titan, "cin_cannon_raise_end")
			multiplayer.assets.evtTitanAction = 
				Event_AddTimer(networkFunctions.TitanShoot1, 2, false)
				--Hud_ShowText(LOCAL, "TitanShootStart", "", 5.0)
		end
	end

	networkFunctions.TitanShoot1 = function(evt)
		--Hud_ShowText(LOCAL, "TitanShoot1", "", 5.0)
		local titan = Group_GetEntityAt(multiplayer.assets.grp_titan, multiplayer.assets.titanIdx)
		Entity_StartEntityAction(titan, "cin_titanfires_bodyzap")
		multiplayer.assets.evtTitanAction = 
				Event_AddTimer(networkFunctions.TitanShoot2, 2, false)
	end

	networkFunctions.TitanShoot2 = function(evt)
		--Hud_ShowText(LOCAL, "TitanShoot2", "", 5.0)
		local titan = Group_GetEntityAt(multiplayer.assets.grp_titan, multiplayer.assets.titanIdx)
		Entity_StartEntityAction(titan, "cin_cannon_fire")
	end

	networkFunctions.TitanWalkStop = function(evt)
		--Hud_ShowText(LOCAL, "TitanWalkStop", "", 5.0)
		local titan = Group_GetEntityAt(multiplayer.assets.grp_titan, multiplayer.assets.titanIdx)
		local grTitan = Group_Create("ere")
		Group_Clear(grTitan)
		Group_AddEntity(grTitan, titan)
		Group_TriggerAnimationEvent(grTitan, "TIT_Stop")
	end

	networkFunctions.ApoStartFollowingInit = function(arg0, arg1)
		Event_Remove(multiplayer.assets.evtReachMarker)
		ApothFollow()
		--Hud_ShowTitleCard(1898416, 1898418)
		UI_RemoveDecorator(multiplayer.assets.missionDeco)
		ShowDecoratorFirstFrontSpawn()

		multiplayer.assets.evtReachMarker = 
			Event_AddProximityEnter(networkFunctions.FirstMarkerReached, 
				multiplayer.assets.grp_apoth, 
				tdm_mkr_spawn_08, 
				false, 5.0)

		multiplayer.assets.evtTitanStep =
			Event_AddTimer(networkFunctions.TitanStep, 120, true)
		networkFunctions.TitanStep()
	end

	networkFunctions.FirstMarkerReached = function(arg0, arg1)
		Event_Remove(multiplayer.assets.evtReachMarker)
		UI_RemoveDecorator(multiplayer.assets.missionDeco)
		ApothStop()
		Group_IgnoreGroup(multiplayer.assets.grp_apoth, multiplayer.assets.mainEnemies)
		Hud_SetCaptureMode(1.0, 121.0)
		ApothIdle()

		-- networkFunctions.ApothRandomMove(nil, tdm_mkr_spawn_08)
		-- multiplayer.assets.evtApothRandomMove = 
		-- 	Event_AddTimerWithData(networkFunctions.ApothRandomMove,
		-- 	2, false, tdm_mkr_spawn_08)

		multiplayer.assets.evtMissionSpawnTimer = 
			Event_AddTimer(networkFunctions.FirstMarkerDefenseTick,
			3, true)
		networkFunctions.FirstMarkerDefenseTick()

		multiplayer.assets.evtMissionTimer = 
			Event_AddTimer(networkFunctions.FirstMarkerAfterDefense,
			121, false)
	end

	networkFunctions.FirstMarkerDefenseTick = function(arg0, arg1)
		if Group_Count(multiplayer.assets.mainEnemies) < 11 then
			local unit = RandomizeAttackUnit({
				{unit = cp_ork_boy_melee.bp, cnt = 4},
				{unit = cp_ork_boy_melee.bp, cnt = 4},
				{unit = cp_ork_boy_melee.bp, cnt = 4},
				{unit = cp_ork_boy_melee.bp, cnt = 4},
				{unit = cp_ork_boy_melee.bp, cnt = 4},
				{unit = cp_ork_boy_ranged_grenade.bp, cnt = 4},
				{unit = cp_ork_boy_ranged_grenade.bp, cnt = 4},
				{unit = cp_ork_boy_ranged_grenade.bp, cnt = 4},
				{unit = cp_ork_boy_ranged_grenade.bp, cnt = 4},
				{unit = cp_ork_boy_melee_pro.bp, cnt = 2},
				{unit = cp_ork_boy_melee_pro.bp, cnt = 2},
				{unit = cp_ork_boy_melee_pro.bp, cnt = 2},
				{unit = cp_ork_nob_shoota.bp, cnt = 1},
				{unit = cp_ork_nob_melee.bp, cnt = 1}
			})
			local spawn = RandomizeAttackSpawn({
				mkr_objective_1, tdm_mkr_spawn_02, tdm_mkr_spawn_04, 
				tdm_mkr_spawn_07, tdm_mkr_spawn_12, tdm_mkr_spawn_06, 
				tdm_mkr_spawn_09, tdm_mkr_spawn_03})
			local playerGr = Player_GetGroupHuman()
			local target = RandomizeAttackTarget({playerGr, playerGr, multiplayer.assets.grp_apoth})
			Group_Clear(multiplayer.assets.mainEnemiesRequest)
			Group_SpawnEntities(multiplayer.assets.mainEnemiesRequest, unit.unit, spawn, unit.cnt)
			Cmd_Attack(multiplayer.assets.mainEnemiesRequest, target, 1.0)
			Group_AddGroupEntities(multiplayer.assets.mainEnemies, multiplayer.assets.mainEnemiesRequest)
			if target ~= playerGr then
				Group_IgnoreGroup(multiplayer.assets.mainEnemies, playerGr)
			end
		end

		-- +Добавить нападения и вне моментов защиты

		ApothIdle()
		Group_IgnoreGroup(multiplayer.assets.grp_apoth, multiplayer.assets.mainEnemies)

		Group_IgnoreGroup(multiplayer.assets.mainEnemies, multiplayer.assets.backgroundEnemiesStartOutside)
		Group_IgnoreGroup(multiplayer.assets.mainEnemies, multiplayer.assets.backgroundEnemiesStartInside)
		Group_IgnoreGroup(multiplayer.assets.backgroundEnemiesStartOutside, multiplayer.assets.mainEnemies)
		Group_IgnoreGroup(multiplayer.assets.backgroundEnemiesStartInside, multiplayer.assets.mainEnemies)
	end

	networkFunctions.FirstMarkerAfterDefense = function(arg0, arg1)
		Event_Remove(multiplayer.assets.evtMissionTimer)
		Event_Remove(multiplayer.assets.evtMissionSpawnTimer)
		--Event_Remove(multiplayer.assets.evtApothRandomMove)
		Hud_SetCaptureMode(0.0, 0.0)

		ApothFollow()
		ShowDecoratorFirstBunker()
		multiplayer.assets.evtReachMarker = 
			Event_AddProximityEnter(networkFunctions.SecondMarkerReached, 
				multiplayer.assets.grp_apoth, 
				mkr_objective_1, 
				false, 5.0)
	end

	networkFunctions.SecondMarkerReached = function(arg0, arg1)
		Event_Remove(multiplayer.assets.evtReachMarker)
		UI_RemoveDecorator(multiplayer.assets.missionDeco)
		ApothStop()
		Group_IgnoreGroup(multiplayer.assets.grp_apoth, multiplayer.assets.mainEnemies)
		Hud_SetCaptureMode(1.0, 121.0)
		ApothIdle()

		multiplayer.assets.evtMissionSpawnTimer = 
			Event_AddTimer(networkFunctions.SecondMarkerDefenseTick,
			3, true)
		networkFunctions.SecondMarkerDefenseTick()

		multiplayer.assets.evtMissionTimer = 
			Event_AddTimer(networkFunctions.SecondMarkerAfterDefense,
			121, false)
	end

	networkFunctions.SecondMarkerDefenseTick = function(arg0, arg1)
		if Group_Count(multiplayer.assets.mainEnemies) < 11 then
			local unit = RandomizeAttackUnit({
				{unit = cp_ork_boy_melee.bp, cnt = 4},
				{unit = cp_ork_boy_melee.bp, cnt = 4},
				{unit = cp_ork_boy_ranged_grenade.bp, cnt = 4},
				{unit = cp_ork_boy_ranged_grenade.bp, cnt = 4},
				{unit = cp_ork_boy_ranged_pro.bp, cnt = 2},
				{unit = cp_ork_hardboy.bp, cnt = 2},
				{unit = cp_ork_boy_melee_pro.bp, cnt = 2},
				{unit = cp_ork_nob_shoota.bp, cnt = 1},
				{unit = cp_ork_nob_melee.bp, cnt = 1}
			})
			local spawn = RandomizeAttackSpawn({
				mkr_dread_cp_01, tdm_mkr_spawn_06, tdm_mkr_spawn_08,
				mkr_dread_04, tdm_mkr_spawn_03, marine_flag})
			local playerGr = Player_GetGroupHuman()
			local target = RandomizeAttackTarget({playerGr, playerGr, multiplayer.assets.grp_apoth})
			Group_Clear(multiplayer.assets.mainEnemiesRequest)
			Group_SpawnEntities(multiplayer.assets.mainEnemiesRequest, unit.unit, spawn, unit.cnt)
			Cmd_Attack(multiplayer.assets.mainEnemiesRequest, target, 1.0)
			Group_AddGroupEntities(multiplayer.assets.mainEnemies, multiplayer.assets.mainEnemiesRequest)
			if target ~= playerGr then
				Group_IgnoreGroup(multiplayer.assets.mainEnemies, playerGr)
			end
		end

		-- +Добавить нападения и вне моментов защиты

		ApothIdle()
		Group_IgnoreGroup(multiplayer.assets.grp_apoth, multiplayer.assets.mainEnemies)

		Group_IgnoreGroup(multiplayer.assets.mainEnemies, multiplayer.assets.backgroundEnemiesStartOutside)
		Group_IgnoreGroup(multiplayer.assets.mainEnemies, multiplayer.assets.backgroundEnemiesStartInside)
		Group_IgnoreGroup(multiplayer.assets.backgroundEnemiesStartOutside, multiplayer.assets.mainEnemies)
		Group_IgnoreGroup(multiplayer.assets.backgroundEnemiesStartInside, multiplayer.assets.mainEnemies)
	end

	networkFunctions.SecondMarkerAfterDefense = function(arg0, arg1)
		Event_Remove(multiplayer.assets.evtMissionTimer)
		Event_Remove(multiplayer.assets.evtMissionSpawnTimer)
		--Event_Remove(multiplayer.assets.evtApothRandomMove)
		Hud_SetCaptureMode(0.0, 0.0)

		ApothFollow()
		ShowDecoratorThirdPrebuild()
		multiplayer.assets.evtReachMarker = 
			Event_AddProximityEnter(networkFunctions.ThirdMarkerReached, 
				multiplayer.assets.grp_apoth, 
				tdm_mkr_spawn_06, 
				false, 5.0)
	end

	networkFunctions.ThirdMarkerReached = function(arg0, arg1)
		Event_Remove(multiplayer.assets.evtReachMarker)
		UI_RemoveDecorator(multiplayer.assets.missionDeco)
		ApothStop()
		Group_IgnoreGroup(multiplayer.assets.grp_apoth, multiplayer.assets.mainEnemies)
		Hud_SetCaptureMode(1.0, 121.0)
		ApothIdle()

		multiplayer.assets.evtMissionSpawnTimer = 
			Event_AddTimer(networkFunctions.ThirdMarkerDefenseTick,
			3, true)
		networkFunctions.ThirdMarkerDefenseTick()

		multiplayer.assets.evtMissionTimer = 
			Event_AddTimer(networkFunctions.ThirdMarkerAfterDefense,
			121, false)
	end

	networkFunctions.ThirdMarkerDefenseTick = function(arg0, arg1)
		if Group_Count(multiplayer.assets.mainEnemies) < 13 then
			local unit = RandomizeAttackUnit({
				{unit = cp_ork_boy_melee.bp, cnt = 4},
				{unit = cp_ork_boy_melee.bp, cnt = 4},
				{unit = cp_ork_boy_ranged_grenade.bp, cnt = 4},
				{unit = cp_ork_boy_ranged_grenade.bp, cnt = 4},
				{unit = cp_ork_boy_ranged_pro.bp, cnt = 2},
				{unit = cp_ork_hardboy.bp, cnt = 2},
				{unit = cp_ork_boy_melee_pro.bp, cnt = 2},
				{unit = cp_ork_nob_shoota.bp, cnt = 1},
				{unit = cp_ork_nob_melee.bp, cnt = 1}
			})
			local spawn = RandomizeAttackSpawn({
				mkr_dread_cp_01, tdm_mkr_spawn_08,
				mkr_dread_04, tdm_mkr_spawn_03, marine_flag})
			local playerGr = Player_GetGroupHuman()
			local target = RandomizeAttackTarget({playerGr, playerGr, multiplayer.assets.grp_apoth})
			Group_Clear(multiplayer.assets.mainEnemiesRequest)
			Group_SpawnEntities(multiplayer.assets.mainEnemiesRequest, unit.unit, spawn, unit.cnt)
			Cmd_Attack(multiplayer.assets.mainEnemiesRequest, target, 1.0)
			Group_AddGroupEntities(multiplayer.assets.mainEnemies, multiplayer.assets.mainEnemiesRequest)
			if target ~= playerGr then
				Group_IgnoreGroup(multiplayer.assets.mainEnemies, playerGr)
			end
		end

		-- +Добавить нападения и вне моментов защиты

		ApothIdle()
		Group_IgnoreGroup(multiplayer.assets.grp_apoth, multiplayer.assets.mainEnemies)

		Group_IgnoreGroup(multiplayer.assets.mainEnemies, multiplayer.assets.backgroundEnemiesStartOutside)
		Group_IgnoreGroup(multiplayer.assets.mainEnemies, multiplayer.assets.backgroundEnemiesStartInside)
		Group_IgnoreGroup(multiplayer.assets.backgroundEnemiesStartOutside, multiplayer.assets.mainEnemies)
		Group_IgnoreGroup(multiplayer.assets.backgroundEnemiesStartInside, multiplayer.assets.mainEnemies)
	end

	networkFunctions.ThirdMarkerAfterDefense = function(arg0, arg1)
		Event_Remove(multiplayer.assets.evtMissionTimer)
		Event_Remove(multiplayer.assets.evtMissionSpawnTimer)
		--Event_Remove(multiplayer.assets.evtApothRandomMove)
		Hud_SetCaptureMode(0.0, 0.0)

		ApothFollow()
		ShowDecoratorFourMarker()
		multiplayer.assets.evtReachMarker = 
			Event_AddProximityEnter(networkFunctions.FourMarkerReached, 
				multiplayer.assets.grp_apoth, 
				mkr_dread_04, 
				false, 5.0)
	end

	networkFunctions.FourMarkerReached = function(arg0, arg1)
		Event_Remove(multiplayer.assets.evtReachMarker)
		UI_RemoveDecorator(multiplayer.assets.missionDeco)
		ApothStop()
		Group_IgnoreGroup(multiplayer.assets.grp_apoth, multiplayer.assets.mainEnemies)
		Hud_SetCaptureMode(1.0, 121.0)
		ApothIdle()

		multiplayer.assets.evtMissionSpawnTimer = 
			Event_AddTimer(networkFunctions.FourMarkerDefenseTick,
			3, true)
		networkFunctions.FourMarkerDefenseTick()

		multiplayer.assets.evtMissionTimer = 
			Event_AddTimer(networkFunctions.FourMarkerAfterDefense,
			121, false)
	end

	networkFunctions.FourMarkerDefenseTick = function(arg0, arg1)
		if Group_Count(multiplayer.assets.mainEnemies) < 13 then
			local unit = RandomizeAttackUnit({
				{unit = cp_ork_boy_melee.bp, cnt = 4},
				{unit = cp_ork_boy_ranged_grenade.bp, cnt = 4},
				{unit = cp_ork_boy_ranged_pro.bp, cnt = 4},
				{unit = cp_ork_hardboy.bp, cnt = 4},
				{unit = cp_ork_boy_melee_pro.bp, cnt = 2},
				{unit = cp_ork_nob_shoota.bp, cnt = 2},
				{unit = cp_ork_nob_melee.bp, cnt = 2}
			})
			local spawn = RandomizeAttackSpawn({
				mkr_dread_cp_01, tdm_mkr_spawn_08,
				mkr_dread_04, tdm_mkr_spawn_03, marine_flag})
			local playerGr = Player_GetGroupHuman()
			local target = RandomizeAttackTarget({playerGr, playerGr, multiplayer.assets.grp_apoth})
			Group_Clear(multiplayer.assets.mainEnemiesRequest)
			Group_SpawnEntities(multiplayer.assets.mainEnemiesRequest, unit.unit, spawn, unit.cnt)
			Cmd_Attack(multiplayer.assets.mainEnemiesRequest, target, 1.0)
			Group_AddGroupEntities(multiplayer.assets.mainEnemies, multiplayer.assets.mainEnemiesRequest)
			if target ~= playerGr then
				Group_IgnoreGroup(multiplayer.assets.mainEnemies, playerGr)
			end
		end

		-- +Добавить нападения и вне моментов защиты

		ApothIdle()
		Group_IgnoreGroup(multiplayer.assets.grp_apoth, multiplayer.assets.mainEnemies)

		Group_IgnoreGroup(multiplayer.assets.mainEnemies, multiplayer.assets.backgroundEnemiesStartOutside)
		Group_IgnoreGroup(multiplayer.assets.mainEnemies, multiplayer.assets.backgroundEnemiesStartInside)
		Group_IgnoreGroup(multiplayer.assets.backgroundEnemiesStartOutside, multiplayer.assets.mainEnemies)
		Group_IgnoreGroup(multiplayer.assets.backgroundEnemiesStartInside, multiplayer.assets.mainEnemies)
	end

	networkFunctions.FourMarkerAfterDefense = function(arg0, arg1)
		Event_Remove(multiplayer.assets.evtMissionTimer)
		Event_Remove(multiplayer.assets.evtMissionSpawnTimer)
		--Event_Remove(multiplayer.assets.evtApothRandomMove)
		Hud_SetCaptureMode(0.0, 0.0)

		--Group_SetEscortEntity
		ApothFollow()
		Event_Remove(multiplayer.assets.evtBackgroundEnemiesTickFirst)
		Group_AddGroupEntities(multiplayer.assets.mainEnemies, multiplayer.assets.backgroundEnemiesStartOutside)
		Cmd_Attack(multiplayer.assets.mainEnemies, multiplayer.assets.playersAndAllies, 1.0)
	end

	function SetupCoop()
		local var0, var1, var2, var3

		var0 = Player_Count()
		for i0 = 1.0, var0, 1.0 do
			multiplayer.assets.playersSpawned[Player_GetID(Player_GetAt(i0))] = false
		end
		
		if thisArena ~= nil then
			if chaosMission == true then
				Coop_SetupChaosPortal()			
			end

			if not multiplayer.assets._coop_spawnedUnits then
				multiplayer.assets._coop_spawnedUnits = Group_Create("_coop_spawnedUnits")
			end
		end

		_coopStartWaves()
	end

	function SpawnApoth()
		multiplayer.assets.grp_apoth = Group_Create("grp_apoth")
		Group_SpawnEntities(multiplayer.assets.grp_apoth, cp_sm_chainsword.bp, apothSpawnPoint, 1.0)
		Group_AddGroupEntities(multiplayer.assets.playersAndAllies, multiplayer.assets.grp_apoth)
		multiplayer.assets.evtApothDied = Event_AddEntityDeath(networkFunctions.ApothDied, multiplayer.assets.grp_apoth)
	end

	networkFunctions.ApothDied = function(arg0, arg1)
		Network_EndRound(TEAM_ANY, 0.0, 0.0)
		Event_Remove(multiplayer.assets.evtApothDied)
	end

	function SpawnTitans()
		local var3 = Util_GetPosition(mkr_dread_04)
		multiplayer.assets.grp_titan = Group_Create("grp_titan")
		Group_SpawnEntities(multiplayer.assets.grp_titan, "ebps\\props\\titan_scale_vista", mkr_dread_04, 1.0)
		Group_SpawnEntities(multiplayer.assets.grp_titan, "ebps\\props\\titan_scale_vista", mkr_dread_04, 1.0)
		Group_SpawnEntities(multiplayer.assets.grp_titan, "ebps\\props\\titan_scale_vista", mkr_dread_04, 1.0)
		Group_SpawnEntities(multiplayer.assets.grp_titan, "ebps\\props\\titan_scale_vista", mkr_dread_04, 1.0)
		Group_SpawnEntities(multiplayer.assets.grp_titan, "ebps\\props\\titan_scale_vista", mkr_dread_04, 1.0)

		local titanEnt = Group_GetEntityAt(multiplayer.assets.grp_titan, 1)
		local pos = POS(var3.x - 150, var3.y - 350, var3.z)
		Entity_SetPosition(titanEnt, pos)

		titanEnt = Group_GetEntityAt(multiplayer.assets.grp_titan, 2)
		pos = POS(var3.x - 150, var3.y + 700, var3.z)
		Entity_SetPosition(titanEnt, pos)
		Entity_SetRotation(titanEnt, POS(0, 0, 180))

		titanEnt = Group_GetEntityAt(multiplayer.assets.grp_titan, 3)
		pos = POS(var3.x - 350, var3.y - 450, var3.z)
		Entity_SetPosition(titanEnt, pos)

		titanEnt = Group_GetEntityAt(multiplayer.assets.grp_titan, 4)
		pos = POS(var3.x - 450, var3.y + 650, var3.z)
		Entity_SetPosition(titanEnt, pos)
		Entity_SetRotation(titanEnt, POS(0, 0, 180))

		titanEnt = Group_GetEntityAt(multiplayer.assets.grp_titan, 5)
		pos = POS(var3.x - 550, var3.y - 100, var3.z)
		Entity_SetPosition(titanEnt, pos)

		Group_TriggerAnimationEvent(multiplayer.assets.grp_titan, "TIT_Activate")
	end

	function ApothFollow() --f_3
		Cmd_Follow(multiplayer.assets.grp_apoth, Player_GetGroupHuman(), false, 0.0, 5.0, false)
	end

	function ApothStop() --f_3
		Cmd_Stop(multiplayer.assets.grp_apoth)
	end

	function ApothIdle() --f_3
		Cmd_Idle(multiplayer.assets.grp_apoth)
	end

	function ShowDecoratorApothInit()
		local apoth = Group_GetEntityAt(multiplayer.assets.grp_apoth, 1)
		local apothPos = Util_GetPosition(apoth)
		local decoPos = POS(apothPos.x, apothPos.y, apothPos.z + 3)
		multiplayer.assets.missionDeco = UI_ShowDecorator(decoPos, POI_MOVETO)
	end

	function ShowDecoratorFirstFrontSpawn()
		local bunkerPos = Util_GetPosition(tdm_mkr_spawn_08)
		local decoPos = POS(bunkerPos.x, bunkerPos.y, bunkerPos.z + 2)
		multiplayer.assets.missionDeco = UI_ShowDecorator(decoPos, POI_ATTACK)
	end

	function ShowDecoratorFirstBunker()
		local bunkerPos = Util_GetPosition(mkr_objective_1)
		local decoPos = POS(bunkerPos.x, bunkerPos.y, bunkerPos.z + 2)
		multiplayer.assets.missionDeco = UI_ShowDecorator(decoPos, POI_ATTACK)
	end

	function ShowDecoratorThirdPrebuild()
		local bunkerPos = Util_GetPosition(tdm_mkr_spawn_06)
		local decoPos = POS(bunkerPos.x, bunkerPos.y, bunkerPos.z + 2)
		multiplayer.assets.missionDeco = UI_ShowDecorator(decoPos, POI_ATTACK)
	end

	function ShowDecoratorFourMarker()
		local bunkerPos = Util_GetPosition(mkr_dread_04)
		local decoPos = POS(bunkerPos.x, bunkerPos.y, bunkerPos.z + 2)
		multiplayer.assets.missionDeco = UI_ShowDecorator(decoPos, POI_ATTACK)
	end

	function SpawnBackgroundEnemiesStart()
		multiplayer.assets.backgroundEnemiesStartOutside = Group_Create("backgroundEnemiesStartOutside")
		multiplayer.assets.backgroundEnemiesStartOutsideOrks = Group_Create("backgroundEnemiesStartOutsideOrks")
		multiplayer.assets.backgroundEnemiesStartOutsideChaos = Group_Create("backgroundEnemiesStartOutsideChaos")
		multiplayer.assets.backgroundEnemiesStartInside = Group_Create("backgroundEnemiesStartInside")
		multiplayer.assets.backgroundEnemiesStartInsideOrks = Group_Create("backgroundEnemiesStartInsideOrks")
		multiplayer.assets.backgroundEnemiesStartInsideChaos = Group_Create("backgroundEnemiesStartInsideChaos")
		multiplayer.assets.evtBackgroundEnemiesTickFirst = Event_AddTimer(networkFunctions.BackgroundEnemiesTickFirst, 4.0, true)
		networkFunctions.BackgroundEnemiesTickFirst()
	end

	networkFunctions.BackgroundEnemiesTickFirst = function(evt, arg1)
		if Group_Count(multiplayer.assets.backgroundEnemiesStartOutsideChaos) < 4 then
			local r = math.random(1, 6)
			if r == 1 then
				Group_SpawnEntities(multiplayer.assets.backgroundEnemiesStartOutsideChaos, chaos_coop_renegade_ig.bp, tdm_mkr_spawn_10, 2.0)
			elseif r == 2 then
				Group_SpawnEntities(multiplayer.assets.backgroundEnemiesStartOutsideChaos, chaos_coop_renegade_ig_melee.bp, tdm_mkr_spawn_13, 2.0)
			elseif r == 3 then
				Group_SpawnEntities(multiplayer.assets.backgroundEnemiesStartOutsideChaos, cp_chaos_bloodletter.bp, tdm_mkr_spawn_14, 2.0)
			elseif r == 4 then
				Group_SpawnEntities(multiplayer.assets.backgroundEnemiesStartOutsideChaos, chaos_coop_renegade_ig_melta.bp, chaos_flag, 2.0)
			elseif r == 5 then
				Group_SpawnEntities(multiplayer.assets.backgroundEnemiesStartOutsideChaos, chaos_coop_renegade_ig.bp, tdm_mkr_spawn_15, 2.0)
			elseif r == 6 then
				Group_SpawnEntities(multiplayer.assets.backgroundEnemiesStartOutsideChaos, chaos_coop_renegade_ig_melee.bp, tdm_mkr_spawn_11, 2.0)
			end
		end
		
		if Group_Count(multiplayer.assets.backgroundEnemiesStartOutsideOrks) < 4 then
			local r = math.random(1, 6)
			if r == 1 then
				Group_SpawnEntities(multiplayer.assets.backgroundEnemiesStartOutsideOrks, cp_ork_boy_ranged_grenade.bp, tdm_mkr_spawn_15, 2.0)
			elseif r == 2 then
				Group_SpawnEntities(multiplayer.assets.backgroundEnemiesStartOutsideOrks, cp_ork_boy_melee.bp, tdm_mkr_spawn_11, 2.0)
			elseif r == 3 then
				Group_SpawnEntities(multiplayer.assets.backgroundEnemiesStartOutsideOrks, cp_ork_boy_melee_pro.bp, ctf_2_mkr_spawn_08, 2.0)
			elseif r == 4 then
				Group_SpawnEntities(multiplayer.assets.backgroundEnemiesStartOutsideOrks, cp_ork_boy_ranged_pro.bp, tdm_mkr_spawn_12, 2.0)
			elseif r == 5 then
				Group_SpawnEntities(multiplayer.assets.backgroundEnemiesStartOutsideOrks, cp_ork_boy_ranged_pro.bp, mkr_dread_cp_01, 2.0)
			elseif r == 6 then
				Group_SpawnEntities(multiplayer.assets.backgroundEnemiesStartOutsideOrks, cp_ork_boy_ranged_pro.bp, mkr_dread_04, 2.0)
			end
		end

		if Group_Count(multiplayer.assets.backgroundEnemiesStartInsideChaos) < 4 then
			local r = math.random(1, 6)
			if r == 1 then
				Group_SpawnEntities(multiplayer.assets.backgroundEnemiesStartInsideChaos, chaos_coop_renegade_ig.bp, tdm_mkr_spawn_18, 2.0)
			elseif r == 2 then
				Group_SpawnEntities(multiplayer.assets.backgroundEnemiesStartInsideChaos, chaos_coop_renegade_ig_melee.bp, tdm_mkr_spawn_15, 2.0)
			elseif r == 3 then
				Group_SpawnEntities(multiplayer.assets.backgroundEnemiesStartInsideChaos, cp_chaos_bloodletter.bp, tdm_mkr_spawn_18, 2.0)
			elseif r == 4 then
				Group_SpawnEntities(multiplayer.assets.backgroundEnemiesStartInsideChaos, chaos_coop_renegade_ig_melta.bp, ctf_2_mkr_spawn_09, 2.0)
			elseif r == 5 then
				Group_SpawnEntities(multiplayer.assets.backgroundEnemiesStartInsideChaos, chaos_coop_renegade_ig_melta.bp, tdm_mkr_spawn_17, 2.0)
			elseif r == 6 then
				Group_SpawnEntities(multiplayer.assets.backgroundEnemiesStartInsideChaos, chaos_coop_renegade_ig_melta.bp, mkr_dread_cp_02, 2.0)
			end
		end
		
		if Group_Count(multiplayer.assets.backgroundEnemiesStartInsideOrks) < 4 then
			local r = math.random(1, 6)
			if r == 1 then
				Group_SpawnEntities(multiplayer.assets.backgroundEnemiesStartInsideOrks, cp_ork_boy_ranged_grenade.bp, mkr_objective_2, 2.0)
			elseif r == 2 then
				Group_SpawnEntities(multiplayer.assets.backgroundEnemiesStartInsideOrks, cp_ork_boy_melee.bp, mkr_dread_02, 2.0)
			elseif r == 3 then
				Group_SpawnEntities(multiplayer.assets.backgroundEnemiesStartInsideOrks, cp_ork_boy_melee_pro.bp, tdm_mkr_spawn_04, 2.0)
			elseif r == 4 then
				Group_SpawnEntities(multiplayer.assets.backgroundEnemiesStartInsideOrks, cp_ork_boy_ranged_pro.bp, mkr_dread_cp_02, 2.0)
			elseif r == 5 then
				Group_SpawnEntities(multiplayer.assets.backgroundEnemiesStartInsideOrks, cp_ork_boy_ranged_pro.bp, tdm_mkr_spawn_05, 2.0)
			elseif r == 6 then
				Group_SpawnEntities(multiplayer.assets.backgroundEnemiesStartInsideOrks, cp_ork_boy_ranged_pro.bp, ctf_1_mkr_spawn_09, 2.0)
			end
		end
		
		Group_AddGroupEntities(multiplayer.assets.backgroundEnemiesStartOutside, multiplayer.assets.backgroundEnemiesStartOutsideOrks)
		Group_AddGroupEntities(multiplayer.assets.backgroundEnemiesStartOutside, multiplayer.assets.backgroundEnemiesStartOutsideChaos)
		Group_IgnoreGroup(multiplayer.assets.backgroundEnemiesStartOutside, multiplayer.assets.playersAndAllies)
		Group_IgnoreGroup(multiplayer.assets.playersAndAllies, multiplayer.assets.backgroundEnemiesStartOutside)
		
		Group_AddGroupEntities(multiplayer.assets.backgroundEnemiesStartInside, multiplayer.assets.backgroundEnemiesStartInsideOrks)
		Group_AddGroupEntities(multiplayer.assets.backgroundEnemiesStartInside, multiplayer.assets.backgroundEnemiesStartInsideChaos)
		Group_IgnoreGroup(multiplayer.assets.backgroundEnemiesStartInside, multiplayer.assets.playersAndAllies)
		Group_IgnoreGroup(multiplayer.assets.playersAndAllies, multiplayer.assets.backgroundEnemiesStartInside)
		
		Group_IgnoreGroup(multiplayer.assets.backgroundEnemiesStartOutside, multiplayer.assets.backgroundEnemiesStartInside)
		Group_IgnoreGroup(multiplayer.assets.backgroundEnemiesStartInside, multiplayer.assets.backgroundEnemiesStartOutside)
	end

	function SpawnBackgroundEnemiesSecond()
		multiplayer.assets.backgroundEnemiesStartOutside = Group_Create("backgroundEnemiesStartOutside")
		multiplayer.assets.backgroundEnemiesStartOutsideOrks = Group_Create("backgroundEnemiesStartOutsideOrks")
		multiplayer.assets.backgroundEnemiesStartOutsideChaos = Group_Create("backgroundEnemiesStartOutsideChaos")
		multiplayer.assets.backgroundEnemiesStartInside = Group_Create("backgroundEnemiesStartInside")
		multiplayer.assets.backgroundEnemiesStartInsideOrks = Group_Create("backgroundEnemiesStartInsideOrks")
		multiplayer.assets.backgroundEnemiesStartInsideChaos = Group_Create("backgroundEnemiesStartInsideChaos")
		multiplayer.assets.evtBackgroundEnemiesTickFirst = Event_AddTimer(networkFunctions.BackgroundEnemiesTickFirst, 4.0, true)
		networkFunctions.BackgroundEnemiesTickFirst()
	end

	function RandomizeAttackUnit(units)
		local r = math.random(1, table.getn(units))
		return units[r]
	end

	function RandomizeAttackSpawn(spawns)
		local r = math.random(1, table.getn(spawns))
		return spawns[r]
	end

	function RandomizeAttackTarget(groups)
		local r = math.random(1, table.getn(groups))
		return groups[r]
	end

	function MissionComplete() --f_2

	end

	function OnCleanup() --f_3
	end
else
	require("MP/mp_dlc2_map3/wrld/wrld_o")
end