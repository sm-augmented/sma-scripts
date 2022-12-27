require("Util/Common")
require("Util/MissionTask")
require("Util/CP/CP_Common")
require("Util/CP/Endless/CP_Endless")
require("Util/CP/CP_Func")

multiplayer.objectiveData = {}
arenaNum = 1.0
thisArena = "cp_arena_labs_e"
arenaExit = "mkr_labs_e_exit"

spawnPoints = {
	sp_wave1_01,
	sp_wave1_02,
	sp_wave1_03,
	sp_wave2_01,
	sp_wave2_02,
	sp_wave2_03,
	sp_wave2_04,
	sp_wave3_01,
	sp_wave3_02,
	sp_wave3_03,
	sp_wave3_04,
	sp_wave3_05,
	sp_wave4,
	sp_wave4_sec,
	sp_wave4_third,
	sp_wave4_fourth,
	sp_wave4_fifth,
	sp_wave5_01,
	sp_wave5_02,
	sp_wave5_03,
	sp_wave5_04,
	sp_wave5_05,
	sp_loop_01,
	sp_loop_02,
	sp_loop_03,
	sp_loop_04,
	sp_loop_05,
	sp_loop_06,
	sp_loop_07,	
}

factionsAvailable = {
	"chaos"
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
	networkFunctions.GunAnimate()
	networkFunctions.OpenDome()
end

function MissionStartNetwork()
	RegisterEndless()
	InitLuaSafe()
end

function MissionStart()
	StartWavesEndless(trig_start)
	RegisterPlayerEvents()
end

networkFunctions.OpenDome = function ()
	Bezier_StartAnimation(bez_DoorLeft)
	Bezier_StartAnimation(bez_DoorRight)
	Coop_StartAction(grp_bigdoor_left, "Door_Open", false)
	Coop_StartAction(grp_bigdoor_right, "Door_Open", false)
	Event_AddTimer(networkFunctions.stopSound, 25.0, false)
end

networkFunctions.GunAnimate = function ()
	Coop_Audio2D(csp_scourge_rising)
	Group_TriggerAnimationEvent(grp_weapon, "ACTN_SetupWeapon")
end

networkFunctions.stopSound = function ()
	Coop_StopAction(grp_bigdoor_left, "Door_Open", false)
	Coop_StopAction(grp_bigdoor_right, "Door_Open", false)
end