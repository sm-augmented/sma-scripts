oldCoopStartWaves = COOP_StartWaves
oldCoopStartWave = COOP_StartWave

function COOP_StartWave(arg0)
	--Hud_ShowText(LOCAL, "Wave started!", "", 5.0)
	oldCoopStartWave(arg0)
	Event_AddEntityDamaged(EnemyDamagedSafe, multiplayer.assets.grp_currentWave)
end

function SetUpTesting()
	Event_AddButtonPressed(TestModeSwitchSafe, BUTTON_FURY_MODE)
	Event_AddButtonPressed(BtnPressTestSafe, BUTTON_ABILITY_SET_RANGED_FOURTH)
	local groupHuman = Player_GetGroupHuman()
	Event_AddEntityDamaged(PlayerDamagedSafe, groupHuman)
	Event_AddEntityDeath(PlayerDiedSafe, groupHuman)
	local preSpawned = Group_Create("preSpawnedEnemies")
	Group_Clear(preSpawned)
	Group_GetAllEntitiesOnTeam(preSpawned, TEAM_ORK)
	Group_GetAllEntitiesOnTeam(preSpawned, TEAM_CHAOS)
	Group_GetAllEntitiesOnTeam(preSpawned, TEAM_MARINE)
	Event_AddEntityDamaged(EnemyDamagedSafe, preSpawned)
end

function EmptyPool()
	SetUpTesting()
end

function COOP_StartWaves(arg0)
	SetUpTesting()
	oldCoopStartWaves(arg0)
	
	-- local var0, var1, var2, var3
	-- var0 = Player_Count()
	-- for i0 = 1.0, var0, 1.0 do
	-- 	var1 = Player_GetID(Player_GetAt(i0))
	-- 	multiplayer.assets.playersSpawned[var1] = false
	-- end
	-- if thisArena ~= nil then
	-- 	if chaosMission == true then
	-- 		Coop_SetupChaosPortal()
	-- 		if not multiplayer.assets._coop_spawnedUnits then
	-- 			var2 = Group_Create("_coop_spawnedUnits")
	-- 		end
	-- 		multiplayer.assets._coop_spawnedUnits = var2
	-- 		Event_AddEntityDeath(networkFunctions.coop_CheckForTeamScoreAch, multiplayer.assets._coop_spawnedUnits)
	-- 	end
	-- 	Coop_SetupArenaDoors()
	-- end
	-- if arg0 == nil then
	-- 	_coopStartWaves()
	-- end
	-- COOP_StartWavesAtTrigger(arg0)
	-- var3 = Game_GetCoopArenaIndex()
	-- if var3 == 0.0 then
	-- 	Game_SetCoopTokenSettings(5000.0, 3.0, 4.0, 1000.0)
	-- end
	-- Event_AddPlayerSpawned(networkFunctions.noDeathsFail)
	-- Event_AddPlayerDeleted(networkFunctions.coop_checkFailCondition)
	-- Event_AddEntityDeath(networkFunctions.coop_checkFailCondition, Player_GetGroupHuman())
end

testMode = 0

function PlayerDiedSafe(arg0, arg1, arg2, arg3, arg4)
	local status, err = pcall(PlayerDied)
    if (status) then
    else
        print(err)
        Hud_ShowText(LOCAL, err, "", 5.0) --os == nil and 'true' or 'false'
    end
end

function PlayerDied()
	local groupHuman = Player_GetTeam(Player_GetLocal())
	Game_AddCoopXP(groupHuman, 5000.0)
end

function EnemyDamagedSafe(arg0, arg1, arg2, arg3, arg4)
		local status, err = pcall(EnemyDamaged, arg0, arg1, arg2, arg3, arg4)
    if (status) then
    else
        print(err)
        Hud_ShowText(LOCAL, err, "", 5.0) --os == nil and 'true' or 'false'
    end
end

function EnemyDamaged(arg0, arg1, arg2, arg3, arg4)
		if (testMode == 2) then
			local player = Player_GetLocal()
			local playerEntity = Player_GetEntity(player)
			local isPlayerSource = Entity_HasAttackedEntity(playerEntity, arg1, 5.0)
			if (isPlayerSource == true) then			
				Hud_ShowText(LOCAL, "OUT: " .. tostring(arg4), "", 5.0)
			end
		end
end

function PlayerDamagedSafe(arg0, arg1, arg2, arg3, arg4)
		local status, err = pcall(PlayerDamaged, arg4)
    if (status) then
    else
        print(err)
        Hud_ShowText(LOCAL, err, "", 5.0) --os == nil and 'true' or 'false'
    end
end

function PlayerDamaged(arg0)
		if (testMode == 2) then
			Hud_ShowText(LOCAL, "IN: " .. tostring(arg0), "", 5.0)
		end
end

function TestModeSwitchSafe(arg0)
    local status, err = pcall(TestModeSwitch)
    if (status) then
    else
        print(err)
        Hud_ShowText(LOCAL, err, "", 5.0) --os == nil and 'true' or 'false'
    end
end

function TestModeSwitch()
    local player = Player_GetEntity(Player_GetLocal())
    if (testMode == 0) then
				Entity_StopEntityAction(player, "test_mode_2")
				Entity_StartEntityAction(player, "test_mode_1")
				Entity_SetInvulnerable(player, 1)
        Hud_ShowText(LOCAL, "Switched to Invul + Instakill", "", 5.0)
        testMode = 1
    elseif (testMode == 1) then
        Entity_StartEntityAction(player, "test_mode_2")
				Entity_StopEntityAction(player, "test_mode_1")
				Entity_SetInvulnerable(player, 0)
        Hud_ShowText(LOCAL, "Switched to Damage Check", "", 5.0)
        testMode = 2
		elseif (testMode == 2) then
				Entity_StopEntityAction(player, "test_mode_1")
				Entity_StopEntityAction(player, "test_mode_2")
				Entity_SetInvulnerable(player, 0)
        Hud_ShowText(LOCAL, "Switched to Normal", "", 5.0)
				testMode = 0
		end
end

function BtnPressTestSafe()
	local status, err = pcall(BtnPressTest)
	if (status) then
	else
			print(err)
			Hud_ShowText(LOCAL, err, "", 5.0)
	end
end

function BtnPressTest()
		local func_a = loadfile("quicklua.lua")
		func_a()
end