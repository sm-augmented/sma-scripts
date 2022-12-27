require("Util/Common")
require("Util/MissionTask")
require("Util/CP/CP_Common")
require("Util/CP/Endless/CP_Endless")
require("Util/CP/CP_Func")

multiplayer.objectiveData = {}
arenaNum = 1.0
thisArena = "cp_arena_desert_b"
arenaExit = "mkr_desert_b_exit"

spawnPoints = {
	sp_wave1_01,
	sp_wave1_02,
	sp_wave1_03,
	sp_wave1_04,
	sp_wave1_05,
	sp_wave1_06,
	sp_wave3_01,
	sp_wave3_02,
	sp_wave3_03,
	sp_wave3_04,
	sp_wave4_01,
	sp_wave4_02,
	sp_wave4_03,
	sp_wave4_04,
	sp_wave5_01,
	sp_wave5_02,
	sp_wave5_03,
	sp_wave5_04,
	sp_wave5_05,
	sp_wave5_06,
	sp_wave5_07,
	sp_wave5_08,
	sp_wave5_09,
	sp_wave5_10
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
	OrkRocks()
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
	StartWavesEndless(trig_start)
	RegisterPlayerEvents()
end

function OrkRocks()
	networkFunctions.coop_startRock_01()
	networkFunctions.coop_startRock_06()
	networkFunctions.coop_startRock_07()
	networkFunctions.coop_startRock_05()
	networkFunctions.coop_startRock_04()
	networkFunctions.coop_startRock_03()
	networkFunctions.coop_startRock_08()
	networkFunctions.coop_startRock_09()
	networkFunctions.coop_startRock_02()
end

networkFunctions.startFog = function () --f_17
	World_EnvironmentRegionSetEnabled("SandStorm_EnvRegion", true)
	World_EnvironmentRegionSetEnabled("globalEnvReg_Main", false)
end

networkFunctions.endFog = function () --f_18
	World_EnvironmentRegionSetEnabled("SandStorm_EnvRegion", false)
	World_EnvironmentRegionSetEnabled("globalEnvReg_Main", true)
end

networkFunctions.coop_startRock_01 = function () --f_2
	Coop_SetVisibility(grp_ork_rock_01, true)
	Group_TriggerAnimationEvent(grp_ork_rock_01, "OR_start_crash")
	Event_AddTimer(networkFunctions.coop_finishRock_01, 3.5, false)
end

networkFunctions.coop_finishRock_01 = function () --f_3
	Marker_PlayFX(ork_rock_01_landfx)
end

networkFunctions.coop_startRock_02 = function () --f_4
	Coop_SetVisibility(grp_ork_rock_02, true)
	Group_TriggerAnimationEvent(grp_ork_rock_02, "OR_start_crash")
	Event_AddTimer(networkFunctions.coop_finishRock_02, 3.5, false)
end

networkFunctions.coop_finishRock_02 = function () --f_5
	Marker_PlayFX(ork_rock_02_landfx)
end

networkFunctions.coop_startRock_03 = function () --f_6
	Coop_SetVisibility(grp_ork_rock_03, true)
	Group_TriggerAnimationEvent(grp_ork_rock_03, "OR_start_crash")
	Event_AddTimer(networkFunctions.coop_finishRock_03, 3.5, false)
end

networkFunctions.coop_finishRock_03 = function () --f_7
	Marker_PlayFX(ork_rock_03_landfx)
end

networkFunctions.coop_startRock_04 = function () --f_8
	Coop_SetVisibility(grp_ork_rock_04, true)
	Group_TriggerAnimationEvent(grp_ork_rock_04, "OR_start_crash")
	Event_AddTimer(networkFunctions.coop_finishRock_04, 3.5, false)
end

networkFunctions.coop_finishRock_04 = function () --f_9
	Marker_PlayFX(ork_rock_04_landfX)
end
networkFunctions.coop_startRock_05 = function () --f_10
	Coop_SetVisibility(grp_ork_rock_05, true)
	Group_TriggerAnimationEvent(grp_ork_rock_05, "OR_start_crash")
	Event_AddTimer(networkFunctions.coop_finishRock_04, 3.5, false)
end

networkFunctions.coop_finishRock_05 = function () --f_11
	Marker_PlayFX(ork_rock_05_landfX)
end

networkFunctions.coop_startRock_06 = function () --f_12
	Coop_SetVisibility(grp_ork_rock_06, true)
	Group_TriggerAnimationEvent(grp_ork_rock_06, "OR_start_crash")
end

networkFunctions.coop_startRock_07 = function () --f_13
	Coop_SetVisibility(grp_ork_rock_07, true)
	Group_TriggerAnimationEvent(grp_ork_rock_07, "OR_start_crash")
end

networkFunctions.coop_startRock_08 = function () --f_14
	Coop_SetVisibility(grp_ork_rock_08, true)
	Group_TriggerAnimationEvent(grp_ork_rock_08, "OR_start_crash")
end

networkFunctions.coop_startRock_09 = function () --f_15
	Coop_SetVisibility(grp_ork_rock_09, true)
	Group_TriggerAnimationEvent(grp_ork_rock_09, "OR_start_crash")
end