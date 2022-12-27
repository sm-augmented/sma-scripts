require("Util/CP/Endless/CP_Endless_Random")
require("Util/CP/Endless/CP_Endless_Allies")

ls_waveIndicatorEndless = 122303.0

multiplayer.assets.currentWave = {
	index = 1,
	currentSpawn = 1,
	waveLength = 1,
	soundFX = false,
	faction = nil,
	endLs = 0,
	maxAliveGroup = 0
}

multiplayer.assets.currentWave.spawnedUnits = {

}

function RegisterEndless()
	math.randomseed(os.time())
	AlterAlliesEbpStrings()
	
	Network_RegisterStaticVarByRef(multiplayer.assets.currentWave, "waveInfo")
	Network_RegisterStaticVarByRef(multiplayer.assets.currentWave.spawnedUnits, "waveInfoSpawnedUnits")
	Game_AddInvalidDeathScreenCamera("mkr_warp_airlock_cam")
	Game_AddInvalidDeathScreenCamera("mkr_warp_airlock_load_cam")
end

function StartWavesEndless(trigger)
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

		Coop_SetupArenaDoors()
	end

	if trigger == nil then
		_coopStartWaves()
	end

	COOP_StartWavesAtTrigger(trigger)
	Game_SetCoopTokenSettings(5000.0, 3.0, 4.0, 1000.0)
	Event_AddPlayerSpawned(networkFunctions.noDeathsFail)
	Event_AddPlayerDeleted(networkFunctions.coop_checkFailCondition)
	Event_AddEntityDeath(networkFunctions.coop_checkFailCondition, Player_GetGroupHuman())

	if EmptyPool ~= nil then
		EmptyPool()
	end
end

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

function _coopStartWaves()
	local status, err = pcall(coopStartWavesSafe)
	if (status) then
	else
		--print(err)
		--Hud_ShowText(LOCAL, err, "", 5.0)
	end  
end

networkFunctions.startWaveEndless = function (event)
	StartWaveEndless(multiplayer.assets.currentWave.index + 1)
end

function StartWaveEndlessBase(waveNum)
	multiplayer.assets.currentWave.index = waveNum
	multiplayer.assets.currentWave.currentSpawn = 1.0
	multiplayer.assets.currentWave.waveLength = 25 + math.modf(waveNum * 1.3)
	multiplayer.assets.currentWave.soundFX = false
	multiplayer.assets.currentWave.waveStarted = false
	multiplayer.assets.currentWave.waveEnded = false
	
	local ui, uv
	for ui, uv in pairs(multiplayer.assets.currentWave.spawnedUnits) do
		multiplayer.assets.currentWave.spawnedUnits[ui] = 0
	end

	Hud_SetWaveSize(9999, 9999, waveNum)
	Hud_SetCaptureMode(0.0, 0.0)

	if waveNum == 1 then
		Coop_ShowObjectiveText(1898275.0)
		Coop_Audio2D("Play_Objective_New")
	else
		Coop_ShowWaveText(waveNum)
		Coop_Audio2D("Play_Unlock_Challenge")
	end
	
end

function StartWaveEndless(waveNum)
	StartWaveEndlessBase(waveNum)

	local facCnt = table.getn(factionsAvailable)
	if facCnt == 1 then
		multiplayer.assets.currentWave.faction = factionsAvailable[1]
	else
		local rnd = math.random(1, facCnt + 1)
		if rnd > table.getn(factionsAvailable) then
			multiplayer.assets.currentWave.faction = nil
		else
			multiplayer.assets.currentWave.faction = factionsAvailable[rnd]
		end
	end

	if allies then 
		SetAlliesFaction() 
	end
	
	SetWaveEndLs(multiplayer.assets.currentWave.faction)
	multiplayer.assets.currentWave.maxAliveGroup = 0

	Event_AddTimer(networkFunctions.coop_spawnWave, 2.0, false)
	Event_AddEntityDeath(networkFunctions.checkForWaveSpawn, multiplayer.assets.grp_currentWave)
end

function SetWaveEndLs(faction)
	if chaosMission then
		if faction == "orks" then
			multiplayer.assets.currentWave.endLs = ls_waveCompleteChaosVsOrks
		elseif faction == "loyals" then
			multiplayer.assets.currentWave.endLs = ls_waveCompleteChaosVsLoyals
		elseif faction == "necron" then
			multiplayer.assets.currentWave.endLs = ls_waveCompleteChaosVsNecrons
		else
			multiplayer.assets.currentWave.endLs = ls_waveCompleteChaosVsMixed
		end
	else
		if faction == "orks" then
			multiplayer.assets.currentWave.endLs = ls_waveCompleteLoyalsVsOrks
		elseif faction == "chaos" then
			multiplayer.assets.currentWave.endLs = ls_waveCompleteLoyalsVsChaos
		elseif faction == "necron" then
			multiplayer.assets.currentWave.endLs = ls_waveCompleteLoyalsVsNecrons
		else
			multiplayer.assets.currentWave.endLs = ls_waveCompleteLoyalsVsMixed
		end
	end	
end

networkFunctions.checkForWaveSpawn = function (evt, entity, arg2, enemyGroup, arg4)
	FinishEndlessWave(evt)
end

function FinishEndlessWave(evt)
	if multiplayer.assets.currentWave.currentSpawn >= multiplayer.assets.currentWave.waveLength then		
		local enemiesLeft = Group_Count(multiplayer.assets.grp_currentWave)
		if enemiesLeft == 0.0 then
			UI_ShowCoopWaveCompleteText(multiplayer.assets.currentWave.endLs)

			Coop_EndOfWaveAudio()
			Coop_GrantXP()

			Event_AddTimer(networkFunctions.startWaveEndless, 5.0, false)

			if evt ~= nil then
				Event_RemoveImmediate(evt)
				if evt ~= nil then
					Event_Remove(evt)
				end
			end
		end
	end
end

networkFunctions.coop_spawnWave = function (event)
	StepWaveEndless()
end

function CheckSpawnCondition()
	return multiplayer.assets.currentWave.currentSpawn < multiplayer.assets.currentWave.waveLength
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

			if allies then
				Hud_SetWaveSize(groupMax + 100, groupMax + 100, multiplayer.assets.currentWave.index)
			else
				Hud_SetWaveSize(groupMax, groupMax, multiplayer.assets.currentWave.index)
			end
			multiplayer.assets.currentWave.maxAliveGroup = groupMax
		end
	else
		--Hud_ShowText(LOCAL, "StepWaveEndless finished", "", 5.0)
	end
end

function SpawnRandomGroup(faction)
	local newGroup = RandomizeGroup(faction, spawnPoints)
	local spawned = World_GetAnimatingNPCCount()
	if spawned + newGroup.unitAmount <= World_GetCharacterCap() then
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

			COOP_RequestSpawn(newGroup.ebp, spawnPoint, newGroup.goto, newGroup.hold, newGroup.aware, multiplayer.assets.grp_currentWave, showFX, multiplayer.assets.currentWave.soundFX)
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

LocalCommand.coop_WaveText = function (arg0)
	local var0, var1
	var0 = Loc_ConvertNumber(arg0.num)
	var1 = Loc_FormatText(ls_waveIndicatorEndless, var0)
	UI_ShowCoopObjectiveTextLocal(var1)
end

LocalCommand.ShowObjectiveText = function (arg0)
	local var0 = Loc_ConvertNumber(0.0)
	local var1 = Loc_FormatText(arg0.text, 0.0)
	UI_ShowCoopObjectiveTextLocal(var1)
end

function Coop_ShowObjectiveText(arg0)
	LocalCommand.Add({["command"] = LocalCommand.ShowObjectiveText, ["text"] = arg0})
end