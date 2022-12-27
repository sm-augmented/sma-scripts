require("Util/Common")
require("Util/MissionTask")
require("Util/CP/CP_Common")
require("Util/CP/Endless/CP_Endless")
require("Util/CP/CP_Func")

multiplayer.objectiveData = {}
arenaNum = 1.0
thisArena = "cp_arena_desert_a"
arenaExit = "mkr_desert_a_exit"

spawnPoints = {
	sp_wave1_01,
	sp_wave1_02,
	sp_wave1_03,
	sp_wave1_04,
	sp_wave1_back_01,
	sp_wave1_back_02,
	sp_wave3_04,
	sp_wave4_03,
	sp_chaos_02,
	sp_chaos_08,
	sp_chaos_09
}

factionsAvailable = {
	"orks"
}

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

	local rnd = math.random(1, 3)
	if rnd == 1 and fog == false then
		multiplayer.assets.currentWave.fog = true
		networkFunctions.startFog()
	elseif fog == true then
		multiplayer.assets.currentWave.fog = false
		networkFunctions.endFog()
	end
end

function MissionStartNetwork()
	RegisterEndless()
	InitLuaSafe()
end

function MissionStart()
	Coop_SetWorldObjectVisible("chaos_sky", false)
	Coop_SetLayerLightsEnabled("L_Lights_Chaos", false)
	StartWavesEndless(trig_start)
	RegisterPlayerEvents()
end

networkFunctions.startFog = function ()
	World_EnvironmentRegionSetEnabled("SandStorm_EnvRegion", true)
	World_EnvironmentRegionSetEnabled("globalEnvReg_Main", false)
end

networkFunctions.endFog = function ()
	World_EnvironmentRegionSetEnabled("SandStorm_EnvRegion", false)
	World_EnvironmentRegionSetEnabled("globalEnvReg_Main", true)
end