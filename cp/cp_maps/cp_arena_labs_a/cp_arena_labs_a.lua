require("Util/Common")
require("Util/MissionTask")
require("Util/CP/CP_Common")
require("Util/CP/CP_Func")
require("Util/CP/Endless/CP_Endless")

multiplayer.objectiveData = {}
arenaNum = 1.0
thisArena = "cp_arena_labs_a"
arenaExit = "mkr_labs_a_exit"

spawnPoints = {
	sp_low_01,
	sp_low_02,
	sp_low_03,
	sp_low_05,
	sp_door_01,
	sp_door_02,
	sp_door_03,
	sp_door_04,
	sp_high_01,
	sp_high_02,
	sp_high_03,
	sp_high_04,
	sp_mid_01,
	sp_mid_02,
	sp_pipe_01,
	sp_pipe_03,
}

squigContainers = {
	{ sp = sp_cont_01, grp = grp_container_01 },
	{ sp = sp_cont_02, grp = grp_container_02 },
	{ sp = sp_cont_03, grp = grp_container_03 },
	{ sp = sp_cont_04, grp = grp_container_04 },
	{ sp = sp_cont_05, grp = grp_container_05 },
	{ sp = sp_cont_06, grp = grp_container_06 },
	{ sp = sp_cont_07, grp = grp_container_07 },
	{ sp = sp_cont_08, grp = grp_container_08 },
	{ sp = sp_cont_09, grp = grp_container_09 },
	{ sp = sp_cont_11, grp = grp_container_11 },
	{ sp = sp_cont_12, grp = grp_container_12 },
	{ sp = sp_cont_13, grp = grp_container_13 },
	{ sp = sp_cont_14, grp = grp_container_14 },
	{ sp = sp_cont_19, grp = grp_container_19 },
}

factionsAvailable = {
	"orks"
}

function RandomizeGroup(oFaction)
	local faction = oFaction
	if faction == nil then
		local r = math.random(1, table.getn(factionsAvailable))
		faction = factionsAvailable[r]
	end
	local units, minMap, maxMap, multMap = GetFactionInfo(faction)
	local enMin, enMax = GetMinMaxEnemy(minMap, maxMap)
	local spawnPoint = RandomizeSpawnPoint()
	local enemyType = RandomizeEnemy(units, enMin, enMax)
	enemyType = AmountEnemyCopies(units, enemyType, enMin, enMax, multMap)
	if enemyType == cp_ork_squig_bomb then
		spawnPoint = RandomizeSquigSpawnPoint()
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

function RandomizeSquigSpawnPoint()
	local r = math.random(1, table.getn(squigContainers))
	local cont = squigContainers[r].sp

	local ui, uv
	for ui = 1, table.getn(squigContainers) do
		uv = squigContainers[ui]
		if cont == uv.sp then
			KillContainer(uv.grp)
			break
		end
	end

	return cont
end

function KillContainer(grp)
	local var0 = Group_Count(grp)
	if var0 > 0.0 then
		Coop_GroupKill(grp)
	end
end

function coopStartWavesSafe()
	multiplayer.assets.grp_currentWave = Group_Create("grp_currentWave")
	multiplayer.assets.currentWave.fog = false

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

function StartWaveEndless(waveNum)
	StartWaveEndlessBase(waveNum)

	local rnd = math.random(1, table.getn(factionsAvailable) + 1)
	if rnd > table.getn(factionsAvailable) then
		multiplayer.assets.currentWave.faction = nil
	else
		multiplayer.assets.currentWave.faction = factionsAvailable[rnd]
	end
	SetWaveEndLs(multiplayer.assets.currentWave.faction)
	multiplayer.assets.currentWave.maxAliveGroup = 0
	
	SetWaveFog()

	Event_AddTimer(networkFunctions.coop_spawnWave, 2.0, false)
	Event_AddEntityDeath(networkFunctions.checkForWaveSpawn, multiplayer.assets.grp_currentWave)
end

function SetWaveFog()
	local fog = multiplayer.assets.currentWave.fog

	if math.random(1, 10) <= 3 and fog == false then
		multiplayer.assets.currentWave.fog = true
		networkFunctions.startFog()
	elseif fog == true then
		multiplayer.assets.currentWave.fog = false
		networkFunctions.endFog()
	end
end

function MissionStartNetwork() --f_0
	InitLuaSafe()
	RegisterEndless()
end

function MissionStart()
	RegisterPlayerEvents()
	StartWavesEndless(trig_wave_01)
end

networkFunctions.startFog = function ()
	World_EnvironmentRegionSetEnabled("_GlobEnvReg_Lab_Fog", true)
	World_EnvironmentRegionSetEnabled("_GlobEnvReg_Lab", false)
end

networkFunctions.endFog = function ()
	World_EnvironmentRegionSetEnabled("_GlobEnvReg_Lab_Fog", false)
	World_EnvironmentRegionSetEnabled("_GlobEnvReg_Lab", true)
end