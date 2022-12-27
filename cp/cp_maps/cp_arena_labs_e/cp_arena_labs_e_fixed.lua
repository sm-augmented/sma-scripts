require("Util/Common")
require("Util/Scarutil")
require("Util/MissionTask")
require("Util/CP/CP_Common")
require("Util/CP/CP_Func")

multiplayer.assets.csp_prepare = nil
multiplayer.assets.csp_alarm = nil
multiplayer.assets.grp_spawn = nil
multiplayer.objectiveData = {
}
arenaNum = 3.0
thisArena = "cp_arena_labs_e"
arenaExit = "mkr_labs_e_exit"
nextArena = "cp_arena_desert_a"
nextArenaEnter = "mkr_desert_a_entrance"

function MissionStartNetwork()
	InitLuaSafe()
	
	sp_wave1 = COOP_GetSpawnPointGroup("sp_wave1_01")
	sp_wave1_sec = COOP_GetSpawnPointGroup("sp_wave1_02")
	sp_wave1_third = COOP_GetSpawnPointGroup("sp_wave1_03")
	sp_wave2 = COOP_GetSpawnPointGroup("sp_wave2_01")
	sp_wave2_sec = COOP_GetSpawnPointGroup("sp_wave2_02")
	sp_wave2_third = COOP_GetSpawnPointGroup("sp_wave2_03")
	sp_wave2_fourth = COOP_GetSpawnPointGroup("sp_wave2_04")
	sp_wave4 = COOP_GetSpawnPointGroup("sp_wave3_01")
	sp_wave4_sec = COOP_GetSpawnPointGroup("sp_wave3_02")
	sp_wave4_third = COOP_GetSpawnPointGroup("sp_wave3_03")
	sp_wave4_fourth = COOP_GetSpawnPointGroup("sp_wave3_04")
	sp_wave4_fifth = COOP_GetSpawnPointGroup("sp_wave3_05")
	sp_wave5 = COOP_GetSpawnPointGroup("sp_wave5_01")
	sp_wave5_sec = COOP_GetSpawnPointGroup("sp_wave5_02")
	sp_wave5_third = COOP_GetSpawnPointGroup("sp_wave5_03")
	sp_wave5_fourth = COOP_GetSpawnPointGroup("sp_wave5_04")
	sp_wave5_fifth = COOP_GetSpawnPointGroup("sp_wave5_05")
	sp_loop = COOP_GetSpawnPointGroup("sp_loop_01")
	sp_loop_sec = COOP_GetSpawnPointGroup("sp_loop_02")
	sp_loop_third = COOP_GetSpawnPointGroup("sp_loop_03")
	sp_loop_fourth = COOP_GetSpawnPointGroup("sp_loop_05")
	sp_loop_fifth = COOP_GetSpawnPointGroup("sp_loop_07")

	challengeSet1 = {{["challengeType"] = ch_speedKill,
["timeLimit"] = 20.0,
["targetAmount"] = 15.0},
{["challengeType"] = ch_kingOfTheHill,
["timeLimit"] = 20.0,
["markers"] = {mkr_challengeCP_01},
["captureTime"] = 2.0},
{["challengeType"] = ch_ballHog,
["timeLimit"] = 20.0,
["targetAmount"] = 10.0},
{["challengeType"] = ch_sychronizedKill,
["timeLimit"] = 20.0,
["targetAmount"] = 8.0}}
	challengeSet2 = {{["challengeType"] = ch_speedKill,
["timeLimit"] = 20.0,
["targetAmount"] = 10.0},
{["challengeType"] = ch_selectiveKill,
["timeLimit"] = 20.0,
["targetAmount"] = 2.0,
["unitType"] = cp_ork_nob_shoota_pro},
{["challengeType"] = ch_selectiveKill,
["timeLimit"] = 25.0,
["targetAmount"] = 2.0,
["unitType"] = cp_ork_nob_melee},
{["challengeType"] = ch_kingOfTheHill,
["timeLimit"] = 15.0,
["markers"] = {mkr_challengeCP_03},
["captureTime"] = 2.0}}
	challengeSet3 = {{["challengeType"] = ch_speedKill,
["timeLimit"] = 20.0,
["targetAmount"] = 10.0},
{["challengeType"] = ch_selectiveKill,
["timeLimit"] = 15.0,
["targetAmount"] = 8.0,
["unitType"] = cp_ork_boy_melee_pro},
{["challengeType"] = ch_selectiveKill,
["timeLimit"] = 20.0,
["targetAmount"] = 3.0,
["unitType"] = cp_ork_hardboy},
{["challengeType"] = ch_ballHog,
["timeLimit"] = 20.0,
["targetAmount"] = 10.0}}
	sp_surround = {sp_loop_01,
sp_loop_02,
sp_loop_03}
	sp_surround02 = {sp_loop_01,
sp_loop_02,
sp_loop_03,
sp_loop_04,
sp_loop_06}

	-- sp_loop_03 = "grp_spawn"
	-- sp_loop_04 = "grp_spawn"
	-- sp_loop_07 = "grp_spawn"
	-- mkr_challengeCP_04 = "grp_spawn"
	spawnLoop = {{["ebp"] = cp_ork_boy_melee_pro,
["unitAmount"] = 4.0,
["spawnPoints"] = sp_surround,
["aware"] = true,
["groups"] = {},
["spawnFX"] = true},
{["ebp"] = cp_ork_squig_bomb,
["unitAmount"] = 2.0,
["spawnPoints"] = sp_surround,
["aware"] = true,
["groups"] = {"grp_spawn"},
["spawnFX"] = true},
5.0,
{["ebp"] = cp_ork_boy_melee_pro,
["unitAmount"] = 4.0,
["spawnPoints"] = sp_surround,
["aware"] = true,
["groups"] = {},
["spawnFX"] = true},
{["ebp"] = cp_ork_squig_bomb,
["unitAmount"] = 2.0,
["spawnPoints"] = sp_surround,
["aware"] = true,
["groups"] = {"grp_spawn"},
["spawnFX"] = true},
5.0,
{["ebp"] = cp_ork_boy_melee_pro,
["unitAmount"] = 2.0,
["spawnPoints"] = sp_wave5,
["aware"] = true,
["spawnFX"] = true,
["groups"] = {"grp_spawn"}},
{["ebp"] = cp_ork_nob_shoota_pro,
["unitAmount"] = 1.0,
["spawnPoints"] = sp_loop_sec,
["aware"] = true,
["spawnFX"] = true,
["groups"] = {}},
{["ebp"] = cp_ork_boy_ranged_grenade,
["unitAmount"] = 2.0,
["spawnPoints"] = sp_wave5_fourth,
["aware"] = true,
["spawnFX"] = true,
["groups"] = {"grp_spawn"}},
{["ebp"] = cp_ork_boy_ranged_grenade,
["unitAmount"] = 2.0,
["spawnPoints"] = sp_loop_third,
["aware"] = true,
["groups"] = {"grp_spawn"},
["spawnFX"] = true}}
	spawnLoop02 = {{["ebp"] = cp_ork_hardboy,
["unitAmount"] = 2.0,
["spawnPoints"] = sp_surround,
["aware"] = true,
["groups"] = {},
["spawnFX"] = true},
2.0,
{["ebp"] = cp_ork_boy_melee,
["unitAmount"] = 8.0,
["spawnPoints"] = sp_surround,
["aware"] = true,
["groups"] = {"grp_spawn"},
["spawnFX"] = true},
10.0,
{["ebp"] = cp_ork_hardboy,
["unitAmount"] = 3.0,
["spawnPoints"] = sp_surround02,
["aware"] = true,
["groups"] = {"grp_spawn"},
["spawnFX"] = true},
2.0,
{["ebp"] = cp_ork_boy_melee_pro,
["unitAmount"] = 5.0,
["spawnPoints"] = sp_surround02,
["aware"] = true,
["groups"] = {"grp_spawn"},
["spawnFX"] = true},
10.0,
{["ebp"] = cp_ork_hardboy,
["unitAmount"] = 3.0,
["spawnPoints"] = sp_surround02,
["aware"] = true,
["groups"] = {"grp_spawn"},
["spawnFX"] = true},
2.0,
{["ebp"] = cp_ork_boy_melee_pro,
["unitAmount"] = 5.0,
["spawnPoints"] = sp_surround02,
["aware"] = true,
["groups"] = {"grp_spawn"},
["spawnFX"] = true},
5.0,
{["ebp"] = cp_ork_nob_shoota,
["unitAmount"] = 1.0,
["spawnPoints"] = sp_loop_third,
["aware"] = true,
["spawnFX"] = true,
["groups"] = {"grp_spawn"}},
{["ebp"] = cp_ork_boy_ranged_pro,
["unitAmount"] = 4.0,
["spawnPoints"] = sp_loop_fourth,
["aware"] = true,
["spawnFX"] = true,
["groups"] = {"grp_spawn"}},
3.0,
{["ebp"] = cp_ork_nob_shoota,
["unitAmount"] = 1.0,
["spawnPoints"] = sp_loop,
["aware"] = true,
["spawnFX"] = true,
["groups"] = {"grp_spawn"}},
{["ebp"] = cp_ork_boy_ranged_pro,
["unitAmount"] = 4.0,
["spawnPoints"] = sp_loop_third,
["aware"] = true,
["groups"] = {"grp_spawn"},
["spawnFX"] = true}}
	--sp_wave1_third = 3.0
	--sp_wave1_sec = 8.0
	--sp_wave1_third = 3.0
	wave1 = {networkFunctions.GunAnimate,
8.0,
{["ebp"] = cp_ork_boy_melee,
["unitAmount"] = 8.0,
["spawnPoints"] = sp_wave1_sec,
["aware"] = true,
["spawnFX"] = true},
{["ebp"] = cp_ork_boy_ranged_grenade,
["unitAmount"] = 5.0,
["spawnPoints"] = sp_wave1,
["aware"] = true,
["spawnFX"] = true},
{["ebp"] = cp_ork_boy_ranged_pro,
["unitAmount"] = 2.0,
["spawnPoints"] = sp_wave1,
["aware"] = true,
["spawnFX"] = true},
{["ebp"] = cp_ork_boy_ranged_grenade,
["unitAmount"] = 5.0,
["spawnPoints"] = sp_wave1_third,
["aware"] = true,
["spawnFX"] = true},
3.0,
{["challenge"] = challengeSet1,
["bonusPoints"] = 2500.0},
{["ebp"] = cp_ork_boy_ranged_pro,
["unitAmount"] = 2.0,
["spawnPoints"] = sp_wave1_third,
["aware"] = true,
["spawnFX"] = true},
{["ebp"] = cp_ork_boy_melee_pro,
["unitAmount"] = 2.0,
["spawnPoints"] = sp_wave1_sec,
["aware"] = true,
["spawnFX"] = true},
8.0,
{["ebp"] = cp_ork_boy_melee,
["unitAmount"] = 8.0,
["spawnPoints"] = sp_wave1,
["aware"] = true,
["spawnFX"] = true},
{["ebp"] = cp_ork_boy_melee_pro,
["unitAmount"] = 2.0,
["spawnPoints"] = sp_wave1,
["aware"] = true,
["spawnFX"] = true},
{["ebp"] = cp_ork_boy_melee,
["unitAmount"] = 8.0,
["spawnPoints"] = sp_wave1_third,
["aware"] = true,
["spawnFX"] = true},
{["ebp"] = cp_ork_boy_melee_pro,
["unitAmount"] = 2.0,
["spawnPoints"] = sp_wave1_third,
["aware"] = true,
["spawnFX"] = true},
{["leftAlive"] = 4.0},
3.0,
{["ebp"] = cp_ork_boy_ranged_pro,
["unitAmount"] = 4.0,
["spawnPoints"] = sp_wave1_third,
["aware"] = true,
["spawnFX"] = true},
{["ebp"] = cp_ork_nob_shoota,
["unitAmount"] = 2.0,
["spawnPoints"] = sp_wave1_third,
["aware"] = true,
["spawnFX"] = true},
3.0,
{["ebp"] = cp_ork_boy_melee,
["unitAmount"] = 8.0,
["spawnPoints"] = sp_wave1,
["aware"] = true,
["spawnFX"] = true},
{["ebp"] = cp_ork_boy_melee_pro,
["unitAmount"] = 2.0,
["spawnPoints"] = sp_wave1,
["aware"] = true,
["spawnFX"] = true},
{["ebp"] = cp_ork_boy_melee,
["unitAmount"] = 8.0,
["spawnPoints"] = sp_wave1_third,
["aware"] = true,
["spawnFX"] = true},
{["ebp"] = cp_ork_boy_melee_pro,
["unitAmount"] = 2.0,
["spawnPoints"] = sp_wave1_third,
["aware"] = true,
["spawnFX"] = true}}
	--spawnLoop02 = 2.0

	wave2 = {5.0,
networkFunctions.OpenDome,
{["capturePoint"] = mkr_cp_02,
["awardPoints"] = 2000.0,
["waveBlocker"] = true,
["loopingSpawns"] = spawnLoop02,
["duration"] = 90.0,
["timeLimit"] = 240.0,
["loseAfterTimeOut"] = true},
1.0,
{["ebp"] = cp_ork_boy_melee,
["unitAmount"] = 1.0,
["spawnPoints"] = sp_wave1,
["aware"] = true,
["spawnFX"] = false}}

	--sp_surround = 6.0
	--sp_surround = 3.0
	--sp_surround = 2.0
	--sp_surround = 2.0
	--sp_surround = 8.0
	--sp_surround = 4.0
	wave3 = {5.0,
{["ebp"] = cp_ork_squig_bomb,
["unitAmount"] = 3.0,
["spawnPoints"] = sp_surround,
["aware"] = true,
["spawnFX"] = true},
{["ebp"] = cp_ork_squig_bomb,
["unitAmount"] = 3.0,
["spawnPoints"] = sp_surround,
["aware"] = true,
["spawnFX"] = true},
6.0,
{["ebp"] = cp_ork_boy_melee,
["unitAmount"] = 6.0,
["spawnPoints"] = sp_surround,
["spawnFX"] = true},
{["ebp"] = cp_ork_boy_melee,
["unitAmount"] = 6.0,
["spawnPoints"] = sp_surround,
["spawnFX"] = true},
3.0,
{["ebp"] = cp_ork_hardboy,
["unitAmount"] = 2.0,
["spawnPoints"] = sp_surround,
["spawnFX"] = true},
{["ebp"] = cp_ork_hardboy,
["unitAmount"] = 2.0,
["spawnPoints"] = sp_surround,
["spawnFX"] = true},
2.0,
{["ebp"] = cp_ork_squig_bomb,
["unitAmount"] = 2.0,
["spawnPoints"] = sp_surround,
["aware"] = true,
["spawnFX"] = true},
{["ebp"] = cp_ork_squig_bomb,
["unitAmount"] = 2.0,
["spawnPoints"] = sp_surround,
["aware"] = true,
["spawnFX"] = true},
{["leftAlive"] = 6.0},
{["ebp"] = cp_ork_boy_melee_pro,
["unitAmount"] = 6.0,
["spawnPoints"] = sp_surround,
["spawnFX"] = true},
{["ebp"] = cp_ork_boy_melee_pro,
["unitAmount"] = 6.0,
["spawnPoints"] = sp_surround,
["spawnFX"] = true},
2.0,
{["challenge"] = challengeSet3,
["bonusPoints"] = 2500.0},
{["ebp"] = cp_ork_hardboy,
["unitAmount"] = 2.0,
["spawnPoints"] = sp_surround,
["spawnFX"] = true},
{["ebp"] = cp_ork_hardboy,
["unitAmount"] = 2.0,
["spawnPoints"] = sp_surround,
["spawnFX"] = true},
8.0,
{["ebp"] = cp_ork_squig_bomb,
["unitAmount"] = 3.0,
["spawnPoints"] = sp_surround,
["aware"] = true,
["spawnFX"] = true},
{["ebp"] = cp_ork_squig_bomb,
["unitAmount"] = 3.0,
["spawnPoints"] = sp_surround,
["aware"] = true,
["spawnFX"] = true},
4.0,
{["ebp"] = cp_ork_nob_melee,
["unitAmount"] = 1.0,
["spawnPoints"] = sp_surround,
["spawnFX"] = true},
{["ebp"] = cp_ork_nob_melee,
["unitAmount"] = 1.0,
["spawnPoints"] = sp_surround,
["spawnFX"] = true},
{["ebp"] = cp_ork_nob_melee,
["unitAmount"] = 1.0,
["spawnPoints"] = sp_surround,
["spawnFX"] = true}}
	--sp_wave4_sec = 10.0
	--sp_wave4_sec = 3.0
	--sp_wave4_fourth = 2.0
	--ls_captureScourgeFire = 2.0
	--sp_surround = "grp_spawn"
	--sp_surround = 2.0
	wave4 = {5.0,
{["ebp"] = cp_ork_boy_ranged_pro,
["unitAmount"] = 4.0,
["spawnPoints"] = sp_wave4,
["aware"] = true,
["spawnFX"] = true},
{["ebp"] = cp_ork_hardboy,
["unitAmount"] = 3.0,
["spawnPoints"] = sp_wave4_fifth,
["aware"] = true,
["spawnFX"] = true},
{["ebp"] = cp_ork_squig_bomb,
["unitAmount"] = 2.0,
["spawnPoints"] = sp_wave4_third,
["spawnFX"] = true},
{["ebp"] = cp_ork_squig_bomb,
["unitAmount"] = 2.0,
["spawnPoints"] = sp_wave4_sec,
["spawnFX"] = true},
10.0,
{["ebp"] = cp_ork_nob_melee,
["unitAmount"] = 2.0,
["spawnPoints"] = sp_wave4_third,
["spawnFX"] = true},
{["ebp"] = cp_ork_nob_melee,
["unitAmount"] = 2.0,
["spawnPoints"] = sp_wave4_sec,
["spawnFX"] = true},
3.0,
{["ebp"] = cp_ork_squig_bomb,
["unitAmount"] = 2.0,
["spawnPoints"] = sp_wave4_third,
["spawnFX"] = true},
{["ebp"] = cp_ork_squig_bomb,
["unitAmount"] = 2.0,
["spawnPoints"] = sp_wave4_sec,
["spawnFX"] = true},
{["leftAlive"] = 4.0},
{["ebp"] = cp_ork_nob_shoota_pro,
["unitAmount"] = 2.0,
["spawnPoints"] = sp_wave4_fifth,
["spawnFX"] = true},
{["ebp"] = cp_ork_nob_shoota_pro,
["unitAmount"] = 2.0,
["spawnPoints"] = sp_wave4_fourth,
["spawnFX"] = true},
2.0,
{["ebp"] = cp_ork_hardboy,
["unitAmount"] = 3.0,
["spawnPoints"] = sp_wave4_fifth,
["aware"] = true,
["spawnFX"] = true},
{["leftAlive"] = 1.0},
{["capturePoint"] = mkr_cp_01,
["awardPoints"] = 2000.0,
["waveBlocker"] = true,
["loopingSpawns"] = spawnLoop,
["duration"] = 90.0,
["timeLimit"] = 240.0,
["loseAfterTimeOut"] = true,
["objectiveText"] = ls_captureScourgeFire},
2.0,
networkFunctions.Prepare,
{["ebp"] = cp_ork_boy_melee,
["unitAmount"] = 6.0,
["spawnPoints"] = sp_surround,
["spawnFX"] = true,
["aware"] = true,
["groups"] = {"grp_spawn"}},
{["ebp"] = cp_ork_boy_melee,
["unitAmount"] = 6.0,
["spawnPoints"] = sp_surround,
["spawnFX"] = true,
["aware"] = true,
["groups"] = {"grp_spawn"}},
{["ebp"] = cp_ork_boy_melee_pro,
["unitAmount"] = 4.0,
["spawnPoints"] = sp_surround,
["spawnFX"] = true,
["aware"] = true,
["groups"] = {"grp_spawn"}},
{["ebp"] = cp_ork_boy_ranged_grenade,
["unitAmount"] = 2.0,
["spawnPoints"] = sp_surround,
["spawnFX"] = true,
["aware"] = true,
["groups"] = {"grp_spawn"}},
18.0,
networkFunctions.FireGun,
2.0,
networkFunctions.alarmSpeech,
4.0,
networkFunctions.DestroyGun,
1.0,
{["ebp"] = cp_ork_boy_melee,
["unitAmount"] = 1.0,
["spawnPoints"] = sp_surround,
["spawnFX"] = false,
["aware"] = true,
["groups"] = {"grp_spawn"}}}
	--sp_wave5_fifth = 2.0
	--sp_wave5_fifth = 5.0
	--sp_wave5_fifth = 5.0
	--sp_wave5 = 8.0
	--sp_wave5_fourth = 2.0
	--sp_wave5_fourth = 1.0
	wave5 = {3.0,
{["ebp"] = cp_ork_hardboy,
["unitAmount"] = 3.0,
["spawnPoints"] = sp_wave5,
["spawnFX"] = true},
{["ebp"] = cp_ork_hardboy,
["unitAmount"] = 3.0,
["spawnPoints"] = sp_wave5_fifth,
["spawnFX"] = true},
2.0,
{["ebp"] = cp_ork_nob_melee,
["unitAmount"] = 1.0,
["spawnPoints"] = sp_wave5,
["aware"] = true,
["spawnFX"] = true},
{["ebp"] = cp_ork_nob_melee,
["unitAmount"] = 1.0,
["spawnPoints"] = sp_wave5_fifth,
["aware"] = true,
["spawnFX"] = true},
5.0,
{["ebp"] = cp_ork_hardboy,
["unitAmount"] = 3.0,
["spawnPoints"] = sp_wave5_third,
["spawnFX"] = true},
{["ebp"] = cp_ork_hardboy,
["unitAmount"] = 3.0,
["spawnPoints"] = sp_wave5_sec,
["spawnFX"] = true},
{["ebp"] = cp_ork_boy_melee_pro,
["unitAmount"] = 5.0,
["spawnPoints"] = sp_wave5,
["spawnFX"] = true},
{["ebp"] = cp_ork_boy_melee_pro,
["unitAmount"] = 5.0,
["spawnPoints"] = sp_wave5_fifth,
["spawnFX"] = true},
5.0,
{["ebp"] = cp_ork_nob_shoota_pro,
["unitAmount"] = 2.0,
["spawnPoints"] = sp_wave5,
["spawnFX"] = true},
{["ebp"] = cp_ork_nob_shoota_pro,
["unitAmount"] = 2.0,
["spawnPoints"] = sp_wave5_fourth,
["spawnFX"] = true},
{["leftAlive"] = 4.0},
{["ebp"] = cp_ork_squig_bomb,
["unitAmount"] = 3.0,
["spawnPoints"] = sp_wave5_third,
["spawnFX"] = true},
{["ebp"] = cp_ork_squig_bomb,
["unitAmount"] = 3.0,
["spawnPoints"] = sp_wave5_sec,
["spawnFX"] = true},
{["ebp"] = cp_ork_squig_bomb,
["unitAmount"] = 3.0,
["spawnPoints"] = sp_wave5,
["spawnFX"] = true},
8.0,
{["ebp"] = cp_ork_nob_shoota_pro,
["unitAmount"] = 2.0,
["spawnPoints"] = sp_wave5_fifth,
["spawnFX"] = true},
{["ebp"] = cp_ork_nob_shoota_pro,
["unitAmount"] = 2.0,
["spawnPoints"] = sp_wave5_fourth,
["spawnFX"] = true},
2.0,
{["challenge"] = challengeSet2,
["bonusPoints"] = 2500.0},
{["ebp"] = cp_ork_boy_melee_pro,
["unitAmount"] = 5.0,
["spawnPoints"] = sp_wave5,
["spawnFX"] = true},
{["ebp"] = cp_ork_boy_melee_pro,
["unitAmount"] = 5.0,
["spawnPoints"] = sp_wave5_fifth,
["spawnFX"] = true},
{["ebp"] = cp_ork_nob_melee,
["unitAmount"] = 2.0,
["spawnPoints"] = sp_wave5_fifth,
["spawnFX"] = true},
{["ebp"] = cp_ork_nob_melee,
["unitAmount"] = 2.0,
["spawnPoints"] = sp_wave5_fourth,
["spawnFX"] = true},
1.0,
networkFunctions.setDoorsInvisible}

	COOP_RegisterWaves(wave1, wave2, wave3, wave4, wave5)
end

function MissionStart()
	multiplayer.assets.grp_spawn = Group_Create("grp_spawn")
	COOP_StartWaves(trig_start)
	RegisterPlayerEvents()
end

networkFunctions.setDoorsInvisible = function ()
	Coop_SetVisibility(grp_bigdoor_left, false)
	Coop_SetVisibility(grp_bigdoor_right, false)
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

networkFunctions.Prepare = function ()
	multiplayer.assets.csp_prepare = Coop_Audio2D(csp_weapon_prepare_1)
	Event_AddTimer(networkFunctions.playNextSpeech, 1.0, true)
	Group_TriggerAnimationEvent(grp_weapon, "ACTN_PrepareWeapon")
end

networkFunctions.playNextSpeech = function (arg0)
	local var0 = Audio_IsPlaying(multiplayer.assets.csp_prepare)
	if not var0 then
		Coop_Audio2D(csp_weapon_prepare_2)
		Event_Remove(arg0)
	end
end

networkFunctions.FireGun = function ()
	Coop_Audio2D(csp_weapon_firing)
	Group_TriggerAnimationEvent(grp_weapon, "ACTN_FireWeapon")
	--Group_Kill(multiplayer.assets.grp_spawn)
	Group_Kill(grp_sky)
end

networkFunctions.DestroyGun = function ()
	multiplayer.assets.csp_prepare = Coop_Audio2D(csp_weapon_prepare_1)
	Event_AddTimer(networkFunctions.playNextSpeech, 1.0, true)
	Group_TriggerAnimationEvent(grp_weapon, "START_Destroyed")
end

networkFunctions.alarmSpeech = function ()
	multiplayer.assets.csp_alarm = Coop_Audio2D(csp_weapon_alarm)
	Event_AddTimer(networkFunctions.playNextSpeech2, 1.0, true)
end

networkFunctions.playNextSpeech2 = function (arg0)
	local var0 = Audio_IsPlaying(multiplayer.assets.csp_alarm)
	if not var0 then
		Coop_Audio2D(csp_weapon_critical)
		Event_Remove(arg0)
	end
end