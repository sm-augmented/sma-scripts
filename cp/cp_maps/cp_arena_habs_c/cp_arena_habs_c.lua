require("Util/Common")
require("Util/MissionTask")
require("Util/CP/CP_Common")
require("Util/CP/CP_Func")
require("Util/CP/Endless/CP_Endless")

multiplayer.objectiveData = {}
arenaNum = 1.0
allies = true
thisArena = "cp_arena_habs_c"
arenaExit = "mkr_habs_c_exit"

chaSpawnPoints = {
	sp_middle_01,
	sp_middle_02,
	sp_middle_03,
	sp_orks_start_02,
	sp_top_right,
	sp_right_01,
	sp_right_02,
	sp_right_03,
}

orkSpawnPoints = {
	sp_middle_01,
	sp_middle_02,
	sp_middle_03,
	sp_orks_start_01,
	sp_top_left,
	sp_left_01,
	sp_left_02,
	sp_left_03,
}

allySpawnPoints = {
	sp_middle_01,
	sp_middle_02,
	sp_middle_03
}

orkUnits = {
	cp_ork_gretchin,
	cp_ork_boy_melee,
	cp_ork_boy_ranged_grenade,
	cp_ork_boy_ranged_pro,
	cp_ork_nob_shoota,
	cp_ork_boy_melee_pro,
	cp_ork_hardboy,
	cp_ork_nob_melee,
	cp_ork_squig_bomb,
	cp_ork_nob_shoota_pro,
	cp_ork_nob_melee_pro,
	cp_ork_killa_kan,
	cp_ork_boy_melee
}

orkMinEnemyMap = {
	{ wave = 5, enemy = 1 },
	{ wave = 10, enemy = 2 },
	{ wave = 15, enemy = 3 },
	{ wave = 9999, enemy = 4 }
}

orkMaxEnemyMap = {
	{ wave = 1, enemy = 4 },
	{ wave = 3, enemy = 5 },
	{ wave = 4, enemy = 6 },
	{ wave = 5, enemy = 8 },
	{ wave = 6, enemy = 9 },
	{ wave = 7, enemy = 10 },
	{ wave = 10, enemy = 11 },
	{ wave = 15, enemy = 12 },
	{ wave = 9999, enemy = 13 }
}

chaMaxEnemyMap = {
	{ wave = 2, enemy = 4 },
  { wave = 5, enemy = 6 },
  { wave = 7, enemy = 8 },
  { wave = 8, enemy = 9 },
  { wave = 9, enemy = 10 },
  { wave = 10, enemy = 10 },
  { wave = 15, enemy = 11 },
  { wave = 9999, enemy = 12 }
}

factionsAvailable = {
	"orks", "chaos"
}

orkSpawnedMultMap = {
	kan = {
		{ count = 7, mod = 0 },
		{ count = 9, mod = 2 },
		{ count = 11, mod = 3 },
		{ count = 13, mod = 5 },
		{ count = 16, mod = 7 },
		{ count = 20, mod = 10 },
		{ count = 24, mod = 15 },
		{ count = 28, mod = 20 },
		{ count = 32, mod = 25 },
		{ count = 36, mod = 30 },
		{ count = 40, mod = 35 },
		{ count = 48, mod = 43 },
		{ count = 60, mod = 60 },
		{ count = 9999, mod = 80 }
	},
	hardboy = {
		{ count = 7, mod = 2 },
		{ count = 10, mod = 4 },
		{ count = 12, mod = 6 },
		{ count = 15, mod = 8 },
		{ count = 20, mod = 12 },
		{ count = 25, mod = 17 },
		{ count = 30, mod = 24 },
		{ count = 9999, mod = 150 }
	},
	nob = {
		{ count = 9, mod = 1 },
		{ count = 11, mod = 2 },
		{ count = 13, mod = 3 },
		{ count = 15, mod = 5 },
		{ count = 20, mod = 8 },
		{ count = 25, mod = 11 },
		{ count = 30, mod = 20 },
		{ count = 60, mod = 60 },
		{ count = 9999, mod = 100 }
	},
	heavyNob = {
		{ count = 9, mod = 1 },
		{ count = 11, mod = 2 },
		{ count = 13, mod = 3 },
		{ count = 15, mod = 5 },
		{ count = 20, mod = 8 },
		{ count = 25, mod = 11 },
		{ count = 30, mod = 20 },
		{ count = 60, mod = 60 },
		{ count = 9999, mod = 100 }
	}
}

function coopStartWavesSafe()
	multiplayer.assets.grp_currentWave = Group_Create("grp_currentWave")
	multiplayer.assets.grp_allies = Group_Create("grp_allies")

	if chaosMission == true then
		Marker_StopFX(portal_enter)
		local var4 = Util_GetRandomNumber(1.0, table.getn(sp_chaos_startOfArena))
		Coop_Audio2D(sp_chaos_startOfArena[var4])
	else
		Coop_Audio2D(sp_graia_startOfArena[1.0])
	end

	if multiplayer.assets.entranceData.event ~= nil then
		multiplayer.assets.entranceData.event2 = Event_AddTimer(networkFunctions.coop_enterArenaFailsafe, 15.0, false)
	end

	multiplayer.assets.enemyStuckFailsafe = Event_AddTimer(networkFunctions.coop_enemyStuckFailsafe, 30.0, true)

	StartWaveEndless(1.0)
end

alliesAmountMap = {
	{ playersCount = 1, alliesCount = 10 },
	{ playersCount = 2, alliesCount = 6 },
	{ playersCount = 3, alliesCount = 5 },
	{ playersCount = 4, alliesCount = 4 },
}

function MaxAmountAlliesInWave()
	local amountAllies = 5

	local i, v
	for i = 1, table.getn(alliesAmountMap) do
		v = alliesAmountMap[i]
		if Player_Count() == v.playersCount then
			amountAllies = v.alliesCount
			break
		end
	end

	return amountAllies
end

function RandomizeGroup(oFaction)
	local faction = oFaction
	if faction == nil then
		local r = math.random(1, table.getn(factionsAvailable))
		faction = factionsAvailable[r]
	end
	local units, minMap, maxMap, multMap = GetFactionInfo(faction)
	local enMin, enMax = GetMinMaxEnemy(minMap, maxMap)
	local spawnPoint
	if faction == "orks" then
		spawnPoint = RandomizeSpawnPoint(orkSpawnPoints)
	else
		spawnPoint = RandomizeSpawnPoint(chaSpawnPoints)
	end
	local enemyType = RandomizeEnemy(units, enMin, enMax)
	enemyType = AmountEnemyCopies(units, enemyType, enMin, enMax, multMap)
	if enemyType == cp_ork_killa_kan then
		spawnPoint = RandomizeAllySpawnPoint()
	end
	local minAmount, maxAmount = RandomizeAmount(enemyType)
	local unitAmount = math.random(minAmount, maxAmount)
	return {
		ebp = enemyType,
		unitAmount = unitAmount,
		spawnPoints = spawnPoint,
		aware = true,
		spawnFX = true
	}
end

function RandomizeAllyGroup(oFaction)
	local faction = oFaction
	if faction == nil then
		local r = math.random(1, table.getn(factionsAvailable))
		faction = factionsAvailable[r]
	end
	local units, minMap, maxMap, multMap = GetFactionInfo(faction)
	local enMin, enMax = GetMinMaxEnemy(minMap, maxMap)
	local spawnPoint = RandomizeAllySpawnPoint()
	local enemyType = RandomizeEnemy(units, enMin, enMax)
	local unitAmount = 1
	return {
		ebp = enemyType,
		unitAmount = unitAmount,
		spawnPoints = spawnPoint,
		aware = true,
		spawnFX = true
	}
end

function RandomizeSpawnPoint(spawnTable)
	local r = math.random(1, table.getn(spawnTable))
	return spawnTable[r]
end

function RandomizeAllySpawnPoint()
	local r = math.random(1, table.getn(allySpawnPoints))
	return allySpawnPoints[r]
end

function SpawnRandomAlliesGroup(faction)
		local newGroup = RandomizeAllyGroup(faction)
		local spawnedAllied = Group_Count(multiplayer.assets.grp_allies)
		local spawned = World_GetAnimatingNPCCount()
		if spawnedAllied + newGroup.unitAmount <= MaxAmountAlliesInWave() and spawned + newGroup.unitAmount <= World_GetCharacterCap() then
			multiplayer.assets.currentWave.currentSpawn = multiplayer.assets.currentWave.currentSpawn + 1	
			if multiplayer.assets.currentWave.spawnedUnits[newGroup.ebp.bp] ~= nil then
				multiplayer.assets.currentWave.spawnedUnits[newGroup.ebp.bp] = multiplayer.assets.currentWave.spawnedUnits[newGroup.ebp.bp] + newGroup.unitAmount
			else
				multiplayer.assets.currentWave.spawnedUnits[newGroup.ebp.bp] = newGroup.unitAmount
			end
			local showFX = true
			local it
			for it = 1, newGroup.unitAmount, 1 do
				--newGroup.ebp.decloakFX = false

				local spawnPoint = newGroup.spawnPoints
				local isSpawnTable = scartype(newGroup.spawnPoints)
				if isSpawnTable == ST_TABLE then
					local spawnIdx = Util_GetRandomNumber(1.0, TableCount(newGroup.spawnPoints))
					spawnPoint = newGroup.spawnPoints[spawnIdx]
				end
				
					COOP_RequestSpawn(newGroup.ebp, spawnPoint, newGroup.goto, newGroup.hold, newGroup.aware, multiplayer.assets.grp_allies, showFX, multiplayer.assets.currentWave.soundFX)

					for jt = 1, Group_Count(multiplayer.assets.grp_allies), 1 do
						local allEnt = Group_GetEntityAt(multiplayer.assets.grp_allies, jt)
						Group_RemoveEntity(multiplayer.assets._coop_spawnedUnits, allEnt)
					end
		
				if newGroup.ebp.decloakFX == true then
					local spawnedEnt = Group_GetEntityAt(multiplayer.assets._coop_spawnRequest, 1.0)
					Coop_SetVisibility(spawnedEnt, true)
				end
				--Coop_StartAction(var7, "ACTN_decloak")
				multiplayer.assets.currentWave.soundFX = false
				showFX = false
			end
		end
end	

function StepWaveEndless()
	if CheckSpawnCondition() then
		--Hud_ShowText(LOCAL, "StepWaveEndless: " .. tostring(multiplayer.assets.currentWave.currentSpawn), "", 5.0)
		Event_AddTimer(networkFunctions.coop_spawnWave, 2.0, false)
		
		if allies then
			SpawnRandomAlliesGroup(multiplayer.assets.currentWave.alliesFaction)
		end
		
		SpawnRandomGroup(multiplayer.assets.currentWave.faction)

		if CheckSpawnCondition() ~= true then
			local preSpawned = Group_Create("")
			Group_Clear(preSpawned)

			if chaosMission ~= true then
				Group_GetAllEntitiesOnTeam(preSpawned, 2)
				Group_Add(multiplayer.assets.grp_currentWave, preSpawned)
			end

			Group_Add(preSpawned, multiplayer.assets.grp_currentWave)			

			local groupCnt = Group_Count(preSpawned)
			local groupMax = groupCnt;

			local it
			for it = 1, groupCnt, 1 do
				local ent = Group_GetEntityAt(preSpawned, it)
				if Entity_GetBlueprintName(ent) == chaos_coop_renegade_ig_spawn_bl.bp then
					groupMax = groupMax + 1
				end
			end

			Hud_SetWaveSize(groupMax + 100, groupMax + 100, multiplayer.assets.currentWave.index)
			multiplayer.assets.currentWave.maxAliveGroup = groupMax
		end
	else
		--Hud_ShowText(LOCAL, "StepWaveEndless finished", "", 5.0)
	end
end

function StartWaveEndless(waveNum)
	StartWaveEndlessBase(waveNum)

	local rnd = math.random(1, table.getn(factionsAvailable) + 3)
	if rnd > table.getn(factionsAvailable) then
		multiplayer.assets.currentWave.faction = nil
	else
		multiplayer.assets.currentWave.faction = factionsAvailable[rnd]
	end
	
	if allies then 
		SetAlliesFaction() 
	end
	
	SetWaveEndLs(multiplayer.assets.currentWave.faction)
	multiplayer.assets.currentWave.maxAliveGroup = 0

	Event_AddTimer(networkFunctions.coop_spawnWave, 2.0, false)
	Event_AddEntityDeath(networkFunctions.checkForWaveSpawn, multiplayer.assets.grp_currentWave)
end

function SetAlliesFaction()
	if chaosMission then	
		multiplayer.assets.currentWave.alliesFaction = "chaos"
	else
		multiplayer.assets.currentWave.alliesFaction = "loyals"
	end
end

function MissionStartNetwork() --f_0
	InitLuaSafe()
	RegisterEndless()
end

function MissionStart() --f_1
	RegisterPlayerEvents()
	Coop_SetWorldObjectVisible("sky_chaos", false)
	Coop_SetLayerLightsEnabled("L_Lights_Chaos", false)
	StartWavesEndless(trig_start)
end