require("Util/Common")
require("Util/Scarutil")
require("Util/CP/CP_Common")
require("Util/CP/CP_AutomatedTurrets")
require("Util/CP/CP_Func")

multiplayer.objectiveData = {}
arenaNum = 2.0
thisArena = "cp_arena_habs_a"
arenaExit = "mkr_habs_a_exit"
nextArena = "cp_arena_habs_b"
nextArenaEnter = "mkr_habs_b_entrance"

function MissionStartNetwork() --f_0
	InitLuaSafe()
	
	sp_wave1 = COOP_GetSpawnPointGroup("sp_wave1")
	sp_wave2 = COOP_GetSpawnPointGroup("sp_wave2")
	sp_wave3 = COOP_GetSpawnPointGroup("sp_wave3")
	sp_wave4 = COOP_GetSpawnPointGroup("sp_wave4")
	sp_wave5 = COOP_GetSpawnPointGroup("sp_wave5")

	challengeSet1 = {{["challengeType"] = ch_speedKill,
["timeLimit"] = 20.0,
["targetAmount"] = 12.0},
{["challengeType"] = ch_selectiveKill,
["timeLimit"] = 20.0,
["targetAmount"] = 6.0,
["unitType"] = cp_ork_boy_melee},
{["challengeType"] = ch_ballHog,
["timeLimit"] = 20.0,
["targetAmount"] = 8.0},
{["challengeType"] = ch_sychronizedKill,
["timeLimit"] = 20.0,
["targetAmount"] = 10.0}}
	challengeSet2 = {{["challengeType"] = ch_selectiveKill,
["timeLimit"] = 25.0,
["targetAmount"] = 5.0,
["unitType"] = cp_ork_boy_ranged_pro},
{["challengeType"] = ch_ballHog,
["timeLimit"] = 20.0,
["targetAmount"] = 10.0},
{["challengeType"] = ch_sychronizedKill,
["timeLimit"] = 20.0,
["targetAmount"] = 15.0},
{["challengeType"] = ch_selectiveKill,
["timeLimit"] = 20.0,
["targetAmount"] = 8.0,
["unitType"] = cp_ork_boy_melee},
{["challengeType"] = ch_multiMegaKill,
["timeLimit"] = 25.0,
["targetAmount"] = 4.0}}
	challengeSet3 = {{["challengeType"] = ch_selectiveKill,
["timeLimit"] = 20.0,
["targetAmount"] = 10.0,
["unitType"] = cp_ork_boy_melee},
{["challengeType"] = ch_speedKill,
["timeLimit"] = 20.0,
["targetAmount"] = 10.0},
{["challengeType"] = ch_multiMegaKill,
["timeLimit"] = 25.0,
["targetAmount"] = 5.0},
{["challengeType"] = ch_ballHog,
["timeLimit"] = 20.0,
["targetAmount"] = 8.0}}
-- 	--sp_wave1_01 = 10.0
-- 	--sp_wave1_06 = 10.0
-- 	--sp_wave1_08 = 10.0
-- 	--sp_wave1_05 = 2.0
-- 	--sp_wave1_10 = 10.0
-- 	--sp_wave3_05 = 2.0
	wave1 = {1.0,
{["ebp"] = cp_ork_hardboy,
["unitAmount"] = 2.0,
["spawnPoints"] = sp_wave1_03,
["aware"] = true,
["spawnFX"] = true},
{["ebp"] = cp_ork_boy_melee,
["unitAmount"] = 6.0,
["spawnPoints"] = sp_wave1_03,
["aware"] = true,
["spawnFX"] = true},
networkFunctions.ShowWayFront,
{["ebp"] = cp_ork_boy_melee,
["unitAmount"] = 6.0,
["spawnPoints"] = sp_wave3_05,
["aware"] = true,
["spawnFX"] = true},
{["ebp"] = cp_ork_boy_melee,
["unitAmount"] = 6.0,
["spawnPoints"] = sp_wave1_01,
["aware"] = true,
["spawnFX"] = true},
10.0,
networkFunctions.StopShowWayFront,
networkFunctions.ShowWayFrontLeft,
networkFunctions.ShowWayFrontRight,
{["ebp"] = cp_ork_boy_melee,
["unitAmount"] = 5.0,
["spawnPoints"] = sp_wave5_03,
["aware"] = true},
{["ebp"] = cp_ork_boy_melee,
["unitAmount"] = 5.0,
["spawnPoints"] = sp_wave4_01,
["aware"] = true,
["spawnFX"] = true},
{["ebp"] = cp_ork_boy_melee,
["unitAmount"] = 3.0,
["spawnPoints"] = sp_wave1_06,
["aware"] = true,
["spawnFX"] = true},
10.0,
networkFunctions.StopShowWayFrontLeft,
networkFunctions.StopShowWayFrontRight,
networkFunctions.ShowWayLeft,
{["ebp"] = cp_ork_boy_ranged_grenade,
["unitAmount"] = 1.0,
["spawnPoints"] = sp_wave1_06,
["aware"] = true,
["spawnFX"] = true},
{["ebp"] = cp_ork_boy_ranged_grenade,
["unitAmount"] = 2.0,
["spawnPoints"] = sp_wave1_07,
["aware"] = true,
["spawnFX"] = true},
{["ebp"] = cp_ork_boy_ranged_grenade,
["unitAmount"] = 2.0,
["spawnPoints"] = sp_wave1_08,
["aware"] = true,
["spawnFX"] = true},
10.0,
networkFunctions.StopShowWayLeft,
networkFunctions.ShowWayFrontRight,
{["ebp"] = cp_ork_boy_melee,
["unitAmount"] = 8.0,
["spawnPoints"] = sp_wave1_09,
["aware"] = true,
["spawnFX"] = true},
{["ebp"] = cp_ork_boy_melee,
["unitAmount"] = 6.0,
["spawnPoints"] = sp_wave1_05,
["aware"] = true},
2.0,
{["challenge"] = challengeSet1,
["bonusPoints"] = 2500.0},
{["ebp"] = cp_ork_boy_melee,
["unitAmount"] = 8.0,
["spawnPoints"] = sp_wave1_09,
["aware"] = true,
["spawnFX"] = true},
{["ebp"] = cp_ork_boy_melee,
["unitAmount"] = 6.0,
["spawnPoints"] = sp_wave1_05,
["aware"] = true},
{["ebp"] = cp_ork_boy_melee,
["unitAmount"] = 4.0,
["spawnPoints"] = sp_wave1_10,
["aware"] = true,
["spawnFX"] = true},
10.0,
networkFunctions.StopShowWayFrontRight,
networkFunctions.ShowWayLeft,
{["ebp"] = cp_ork_boy_ranged_grenade,
["unitAmount"] = 3.0,
["spawnPoints"] = sp_wave1_06,
["aware"] = true,
["spawnFX"] = true},
{["ebp"] = cp_ork_boy_ranged_grenade,
["unitAmount"] = 3.0,
["spawnPoints"] = sp_wave1_07,
["aware"] = true,
["spawnFX"] = true},
{["ebp"] = cp_ork_boy_ranged_grenade,
["unitAmount"] = 3.0,
["spawnPoints"] = sp_wave1_03,
["aware"] = true,
["spawnFX"] = true},
{["ebp"] = cp_ork_hardboy,
["unitAmount"] = 2.0,
["spawnPoints"] = sp_wave1_01,
["aware"] = true,
["spawnFX"] = true},
{["ebp"] = cp_ork_hardboy,
["unitAmount"] = 2.0,
["spawnPoints"] = sp_wave3_05,
["aware"] = true,
["spawnFX"] = true},
2.0,
networkFunctions.StopShowWayLeft}
-- 	--mkr_dest_04 = 8.0
-- 	--mkr_dest_04 = 1.0
-- 	--mkr_dest_04 = 2.0
-- 	--mkr_dest_04 = 6.0
-- 	--mkr_dest_04 = 5.0
-- 	--mkr_dest_04 = 8.0
-- 	--mkr_dest_04 = 3.0
-- 	--mkr_dest_04 = 2.0
-- 	--challengeSet2 = 2.0
	wave2 = {5.0,
networkFunctions.ShowWayLeft,
{["ebp"] = cp_ork_boy_ranged_pro,
["unitAmount"] = 3.0,
["spawnPoints"] = sp_wave2_01,
["goto"] = mkr_dest_04,
["aware"] = true},
{["ebp"] = cp_ork_boy_ranged_pro,
["unitAmount"] = 3.0,
["spawnPoints"] = sp_wave2_02,
["goto"] = mkr_dest_03,
["aware"] = true},
{["ebp"] = cp_ork_boy_melee,
["unitAmount"] = 8.0,
["spawnPoints"] = sp_wave2_03,
["goto"] = mkr_dest_04,
["aware"] = true},
{["ebp"] = cp_ork_boy_melee,
["unitAmount"] = 8.0,
["spawnPoints"] = sp_wave2_04,
["goto"] = mkr_dest_04,
["aware"] = true},
8.0,
networkFunctions.StopShowWayLeft,
1.0,
networkFunctions.ShowWayFrontLeft,
{["ebp"] = cp_ork_boy_ranged_pro,
["unitAmount"] = 2.0,
["spawnPoints"] = sp_wave2_05,
["goto"] = mkr_dest_03,
["aware"] = true,
["spawnFX"] = true},
{["ebp"] = cp_ork_boy_ranged_grenade,
["unitAmount"] = 4.0,
["spawnPoints"] = sp_wave2_05,
["goto"] = mkr_dest_03,
["aware"] = true,
["spawnFX"] = true},
{["ebp"] = cp_ork_boy_ranged_pro,
["unitAmount"] = 2.0,
["spawnPoints"] = sp_wave2_06,
["goto"] = mkr_dest_04,
["aware"] = true,
["spawnFX"] = true},
{["ebp"] = cp_ork_boy_ranged_grenade,
["unitAmount"] = 4.0,
["spawnPoints"] = sp_wave2_06,
["goto"] = mkr_dest_04,
["aware"] = true,
["spawnFX"] = true},
1.0,
networkFunctions.StopShowWayFrontLeft,
{["ebp"] = cp_ork_boy_ranged_grenade,
["unitAmount"] = 2.0,
["spawnPoints"] = sp_wave2_01,
["goto"] = mkr_dest_04,
["aware"] = true},
{["ebp"] = cp_ork_boy_ranged_grenade,
["unitAmount"] = 3.0,
["spawnPoints"] = sp_wave2_05,
["goto"] = mkr_dest_04,
["aware"] = true},
2.0,
{["leftAlive"] = 20.0},
{["ebp"] = cp_ork_boy_ranged_pro,
["unitAmount"] = 1.0,
["spawnPoints"] = sp_wave2_05,
["goto"] = mkr_dest_03,
["aware"] = true},
{["ebp"] = cp_ork_boy_ranged_pro,
["unitAmount"] = 1.0,
["spawnPoints"] = sp_wave2_06,
["goto"] = mkr_dest_04,
["aware"] = true,
["spawnFX"] = true},
6.0,
networkFunctions.ShowWayLeft,
{["ebp"] = cp_ork_boy_melee,
["unitAmount"] = 8.0,
["spawnPoints"] = sp_wave2_03,
["goto"] = mkr_dest_04,
["aware"] = true},
{["ebp"] = cp_ork_boy_melee,
["unitAmount"] = 8.0,
["spawnPoints"] = sp_wave2_04,
["goto"] = mkr_dest_04,
["aware"] = true},
5.0,
networkFunctions.StopShowWayLeft,
{["ebp"] = cp_ork_boy_melee,
["unitAmount"] = 8.0,
["spawnPoints"] = sp_wave2_05,
["goto"] = mkr_dest_03,
["aware"] = true},
{["ebp"] = cp_ork_boy_ranged_pro,
["unitAmount"] = 1.0,
["spawnPoints"] = sp_wave2_03,
["goto"] = mkr_dest_04,
["aware"] = true},
{["ebp"] = cp_ork_boy_melee,
["unitAmount"] = 8.0,
["spawnPoints"] = sp_wave2_04,
["goto"] = mkr_dest_04,
["aware"] = true},
8.0,
{["ebp"] = cp_ork_boy_ranged_pro,
["unitAmount"] = 2.0,
["spawnPoints"] = sp_wave2_05,
["goto"] = mkr_dest_03,
["aware"] = true},
{["ebp"] = cp_ork_boy_ranged_grenade,
["unitAmount"] = 3.0,
["spawnPoints"] = sp_wave2_05,
["goto"] = mkr_dest_03,
["aware"] = true},
{["ebp"] = cp_ork_boy_ranged_pro,
["unitAmount"] = 2.0,
["spawnPoints"] = sp_wave2_06,
["goto"] = mkr_dest_04,
["aware"] = true,
["spawnFX"] = true},
{["ebp"] = cp_ork_boy_ranged_grenade,
["unitAmount"] = 3.0,
["spawnPoints"] = sp_wave2_06,
["goto"] = mkr_dest_04,
["aware"] = true,
["spawnFX"] = true},
3.0,
{["ebp"] = cp_ork_boy_melee,
["unitAmount"] = 7.0,
["spawnPoints"] = sp_wave2_03,
["goto"] = mkr_dest_04,
["aware"] = true},
{["ebp"] = cp_ork_boy_melee,
["unitAmount"] = 7.0,
["spawnPoints"] = sp_wave2_04,
["goto"] = mkr_dest_04,
["aware"] = true},
{["ebp"] = cp_ork_boy_melee_pro,
["unitAmount"] = 3.0,
["spawnPoints"] = sp_wave2_03,
["goto"] = mkr_dest_04,
["aware"] = true},
{["ebp"] = cp_ork_boy_melee_pro,
["unitAmount"] = 3.0,
["spawnPoints"] = sp_wave2_04,
["goto"] = mkr_dest_04,
["aware"] = true},
2.0,
{["challenge"] = challengeSet2,
["bonusPoints"] = 2500.0},
2.0,
{["ebp"] = cp_ork_boy_ranged_pro,
["unitAmount"] = 3.0,
["spawnPoints"] = sp_wave2_03,
["goto"] = mkr_dest_04,
["aware"] = true},
{["ebp"] = cp_ork_boy_ranged_pro,
["unitAmount"] = 3.0,
["spawnPoints"] = sp_wave2_04,
["goto"] = mkr_dest_04,
["aware"] = true}}
-- 	--???sp_wave5_04 = 8.0
-- 	--sp_wave3_01 = 8.0
-- 	--sp_wave2_01 = 8.0
-- 	--sp_wave4_01 = 10.0
-- 	--sp_wave2_06 = 10.0
	Wave3_Loop = {2.0,
{["ebp"] = cp_ork_hardboy,
["unitAmount"] = 1.0,
["spawnPoints"] = sp_wave3_01,
["aware"] = true},
{["ebp"] = cp_ork_hardboy,
["unitAmount"] = 1.0,
["spawnPoints"] = sp_wave5_04,
["aware"] = true},
{["ebp"] = cp_ork_boy_melee,
["unitAmount"] = 8.0,
["spawnPoints"] = sp_wave3_01,
["aware"] = true},
{["ebp"] = cp_ork_boy_melee,
["unitAmount"] = 8.0,
["spawnPoints"] = sp_wave5_04,
["aware"] = true},
8.0,
{["ebp"] = cp_ork_boy_melee,
["unitAmount"] = 10.0,
["spawnPoints"] = sp_wave3_04,
["aware"] = true},
{["ebp"] = cp_ork_boy_ranged_pro,
["unitAmount"] = 3.0,
["spawnPoints"] = sp_wave3_01,
["aware"] = true},
8.0,
{["ebp"] = cp_ork_boy_melee,
["unitAmount"] = 7.0,
["spawnPoints"] = sp_wave3_02,
["aware"] = true},
{["ebp"] = cp_ork_boy_melee,
["unitAmount"] = 7.0,
["spawnPoints"] = sp_wave2_01,
["aware"] = true},
{["ebp"] = cp_ork_boy_melee_pro,
["unitAmount"] = 3.0,
["spawnPoints"] = sp_wave3_02,
["aware"] = true},
{["ebp"] = cp_ork_boy_melee_pro,
["unitAmount"] = 3.0,
["spawnPoints"] = sp_wave2_01,
["aware"] = true},
8.0,
{["ebp"] = cp_ork_boy_ranged_grenade,
["unitAmount"] = 4.0,
["spawnPoints"] = sp_wave2_01,
["aware"] = true},
{["ebp"] = cp_ork_boy_ranged_grenade,
["unitAmount"] = 4.0,
["spawnPoints"] = sp_wave4_01,
["aware"] = true,
["spawnFX"] = true},
10.0,
{["ebp"] = cp_ork_nob_shoota,
["unitAmount"] = 1.0,
["spawnPoints"] = sp_wave3_05,
["aware"] = true,
["spawnFX"] = true},
{["ebp"] = cp_ork_nob_shoota,
["unitAmount"] = 1.0,
["spawnPoints"] = sp_wave2_01,
["aware"] = true},
{["ebp"] = cp_ork_nob_shoota,
["unitAmount"] = 1.0,
["spawnPoints"] = sp_wave2_06,
["aware"] = true,
["spawnFX"] = true},
10.0}
	wave3 = {5.0,
{["capturePoint"] = mkr_capturePoint_01,
["awardPoints"] = 2000.0,
["waveBlocker"] = true,
["loopingSpawns"] = Wave3_Loop,
["duration"] = 60.0,
["timeLimit"] = 120.0,
["loseAfterTimeOut"] = true},
1.0,
{["ebp"] = cp_ork_boy_melee,
["unitAmount"] = 1.0,
["spawnPoints"] = sp_wave1_05,
["aware"] = true}}
-- 	--mkr_dest_02 = 5.0
-- 	--sp_wave3_05 = 1.0
-- 	--sp_wave4_03 = 15.0
-- 	--sp_wave4_01 = 10.0
-- 	--sp_wave3_05 = 10.0
	wave4 = {5.0,
networkFunctions.ShowWayFrontRight,
networkFunctions.ShowWayRight,
{["ebp"] = cp_ork_boy_melee,
["unitAmount"] = 10.0,
["spawnPoints"] = sp_wave4_01,
["goto"] = mkr_dest_05,
["aware"] = true,
["spawnFX"] = true},
{["ebp"] = cp_ork_squig_bomb,
["unitAmount"] = 4.0,
["spawnPoints"] = sp_wave4_02,
["goto"] = mkr_dest_02,
["aware"] = true},
{["ebp"] = cp_ork_squig_bomb,
["unitAmount"] = 4.0,
["spawnPoints"] = sp_wave4_03,
["goto"] = mkr_dest_02,
["aware"] = true,
["spawnFX"] = true},
5.0,
networkFunctions.StopShowWayFrontRight,
networkFunctions.StopShowWayRight,
1.0,
{["ebp"] = cp_ork_boy_melee,
["unitAmount"] = 5.0,
["spawnPoints"] = sp_wave4_01,
["goto"] = mkr_dest_05,
["aware"] = true,
["spawnFX"] = true},
{["ebp"] = cp_ork_boy_ranged_grenade,
["unitAmount"] = 3.0,
["spawnPoints"] = sp_wave3_04,
["goto"] = mkr_dest_02,
["aware"] = true},
{["ebp"] = cp_ork_boy_ranged_grenade,
["unitAmount"] = 4.0,
["spawnPoints"] = sp_wave2_05,
["goto"] = mkr_dest_03,
["aware"] = true},
{["ebp"] = cp_ork_boy_melee,
["unitAmount"] = 8.0,
["spawnPoints"] = sp_wave2_06,
["aware"] = true,
["spawnFX"] = true},
networkFunctions.ShowWayFront,
{["ebp"] = cp_ork_boy_melee,
["unitAmount"] = 8.0,
["spawnPoints"] = sp_wave3_05,
["aware"] = true,
["spawnFX"] = true},
1.0,
networkFunctions.StopShowWayFront,
10.0,
{["ebp"] = cp_ork_squig_bomb,
["unitAmount"] = 2.0,
["spawnPoints"] = sp_wave4_01,
["aware"] = true,
["spawnFX"] = true},
{["ebp"] = cp_ork_squig_bomb,
["unitAmount"] = 2.0,
["spawnPoints"] = sp_wave4_02,
["aware"] = true},
{["ebp"] = cp_ork_squig_bomb,
["unitAmount"] = 2.0,
["spawnPoints"] = sp_wave4_03,
["aware"] = true,
["spawnFX"] = true},
15.0,
networkFunctions.ShowWayFrontRight,
{["ebp"] = cp_ork_squig_bomb,
["unitAmount"] = 3.0,
["spawnPoints"] = sp_wave4_01,
["aware"] = true,
["spawnFX"] = true},
10.0,
networkFunctions.StopShowWayFrontRight,
{["ebp"] = cp_ork_boy_melee_pro,
["unitAmount"] = 8.0,
["spawnPoints"] = sp_wave4_01,
["aware"] = true,
["spawnFX"] = true},
{["ebp"] = cp_ork_squig_bomb,
["unitAmount"] = 8.0,
["spawnPoints"] = sp_wave4_02,
["aware"] = true},
{["ebp"] = cp_ork_boy_melee_pro,
["unitAmount"] = 8.0,
["spawnPoints"] = sp_wave5_03,
["aware"] = true},
{["ebp"] = cp_ork_hardboy,
["unitAmount"] = 2.0,
["spawnPoints"] = sp_wave3_05,
["aware"] = true},
10.0,
{["ebp"] = cp_ork_squig_bomb,
["unitAmount"] = 2.0,
["spawnPoints"] = sp_wave4_01,
["aware"] = true,
["spawnFX"] = true},
{["ebp"] = cp_ork_squig_bomb,
["unitAmount"] = 3.0,
["spawnPoints"] = sp_wave4_03,
["aware"] = true,
["spawnFX"] = true}}
-- 	--mkr_dest_02 = 0.5
-- 	--sp_wave3_02 = 1.0
-- 	--sp_wave3_01 = 1.0
-- 	--mkr_dest_02 = 1.0
-- 	--challengeSet3 = 1.0
-- 	--mkr_dest_05 = 10.0
-- 	--sp_wave5_01 = 10.0
-- 	--mkr_dest_05 = 10.0
-- 	--mkr_dest_05 = 10.0
-- 	--cp_ork_hardboy = 2.0
-- 	--cp_ork_boy_melee = 8.0
-- 	--cp_ork_boy_ranged_pro = 2.0
-- 	--cp_ork_boy_ranged_pro = 1.0
-- 	--cp_ork_boy_ranged_pro = 2.0
-- 	--cp_ork_boy_ranged_pro = 1.0
-- 	--cp_ork_boy_melee_pro = 8.0
	wave5 = {10.0,
networkFunctions.initDiggas,
networkFunctions.coop_startDigga_01,
networkFunctions.coop_startDigga_03,
2.5,
networkFunctions.coop_startDigga_02,
0.5,
networkFunctions.coop_startDigga_04,
{["unitAmount"] = 42.0},
5.5,
networkFunctions.coop_diggaSpawn_01,
networkFunctions.coop_diggaSpawn_024,
networkFunctions.coop_diggaSpawn_034,
networkFunctions.coop_diggaSpawn_044,
1.0,
networkFunctions.coop_diggaSpawn_02,
networkFunctions.coop_diggaSpawn_03,
networkFunctions.coop_diggaSpawn_04,
2.0,
networkFunctions.coop_diggaSpawn_012,
networkFunctions.coop_diggaSpawn_025,
networkFunctions.coop_diggaSpawn_035,
networkFunctions.coop_diggaSpawn_045,
networkFunctions.ShowWayLeft,
{["ebp"] = cp_ork_boy_ranged_pro,
["unitAmount"] = 1.0,
["spawnPoints"] = sp_wave3_01,
["aware"] = true},
{["ebp"] = cp_ork_boy_ranged_pro,
["unitAmount"] = 1.0,
["spawnPoints"] = sp_wave3_02,
["aware"] = true},
1.0,
networkFunctions.coop_diggaSpawn_022,
networkFunctions.coop_diggaSpawn_032,
networkFunctions.coop_diggaSpawn_042,
2.0,
networkFunctions.coop_diggaSpawn_013,
networkFunctions.coop_diggaSpawn_026,
networkFunctions.coop_diggaSpawn_036,
networkFunctions.coop_diggaSpawn_046,
1.0,
networkFunctions.coop_diggaSpawn_023,
networkFunctions.coop_diggaSpawn_033,
networkFunctions.coop_diggaSpawn_043,
2.0,
networkFunctions.coop_diggaSpawn_01,
networkFunctions.coop_diggaSpawn_024,
networkFunctions.coop_diggaSpawn_034,
networkFunctions.coop_diggaSpawn_044,
{["ebp"] = cp_ork_boy_ranged_pro,
["unitAmount"] = 1.0,
["spawnPoints"] = sp_wave2_01,
["aware"] = true},
{["ebp"] = cp_ork_boy_ranged_pro,
["unitAmount"] = 1.0,
["spawnPoints"] = sp_wave5_04,
["aware"] = true},
{["ebp"] = cp_ork_boy_ranged_grenade,
["unitAmount"] = 2.0,
["spawnPoints"] = sp_wave3_01,
["aware"] = true},
1.0,
networkFunctions.coop_diggaSpawn_02,
networkFunctions.coop_diggaSpawn_03,
networkFunctions.coop_diggaSpawn_04,
2.0,
networkFunctions.coop_diggaSpawn_012,
networkFunctions.coop_diggaSpawn_025,
networkFunctions.coop_diggaSpawn_035,
networkFunctions.coop_diggaSpawn_045,
1.0,
networkFunctions.coop_diggaSpawn_022,
networkFunctions.coop_diggaSpawn_032,
networkFunctions.coop_diggaSpawn_042,
2.0,
networkFunctions.coop_diggaSpawn_013,
networkFunctions.coop_diggaSpawn_026,
networkFunctions.coop_diggaSpawn_036,
networkFunctions.coop_diggaSpawn_046,
1.0,
networkFunctions.coop_diggaSpawn_023,
networkFunctions.coop_diggaSpawn_033,
networkFunctions.coop_diggaSpawn_043,
{["ebp"] = cp_ork_boy_ranged_grenade,
["unitAmount"] = 2.0,
["spawnPoints"] = sp_wave3_02,
["aware"] = true},
{["ebp"] = cp_ork_boy_ranged_grenade,
["unitAmount"] = 2.0,
["spawnPoints"] = sp_wave2_01,
["aware"] = true},
{["ebp"] = cp_ork_boy_ranged_grenade,
["unitAmount"] = 2.0,
["spawnPoints"] = sp_wave5_04,
["aware"] = true},
{["ebp"] = cp_ork_boy_melee,
["unitAmount"] = 10.0,
["spawnPoints"] = sp_wave3_04,
["aware"] = true,
["spawnFX"] = true},
{["challenge"] = challengeSet3,
["bonusPoints"] = 2500.0},
1.0,
networkFunctions.StopShowWayLeft,
{["leftAlive"] = 15.0},
{["ebp"] = cp_ork_boy_ranged_grenade,
["unitAmount"] = 3.0,
["spawnPoints"] = sp_wave5_03,
["aware"] = true},
{["ebp"] = cp_ork_boy_ranged_pro,
["unitAmount"] = 2.0,
["spawnPoints"] = sp_wave5_04,
["goto"] = mkr_dest_04,
["aware"] = true},
{["ebp"] = cp_ork_boy_ranged_pro,
["unitAmount"] = 1.0,
["spawnPoints"] = sp_wave5_02,
["goto"] = mkr_dest_05,
["aware"] = true},
10.0,
{["ebp"] = cp_ork_boy_melee,
["unitAmount"] = 5.0,
["spawnPoints"] = sp_wave5_01,
["aware"] = true,
["spawnFX"] = true},
{["ebp"] = cp_ork_boy_melee,
["unitAmount"] = 5.0,
["spawnPoints"] = sp_wave5_02,
["aware"] = true},
{["ebp"] = cp_ork_boy_melee,
["unitAmount"] = 5.0,
["spawnPoints"] = sp_wave1_03,
["aware"] = true,
["spawnFX"] = true},
{["ebp"] = cp_ork_boy_melee_pro,
["unitAmount"] = 3.0,
["spawnPoints"] = sp_wave5_01,
["aware"] = true,
["spawnFX"] = true},
{["ebp"] = cp_ork_boy_melee_pro,
["unitAmount"] = 3.0,
["spawnPoints"] = sp_wave5_02,
["aware"] = true},
{["ebp"] = cp_ork_boy_melee_pro,
["unitAmount"] = 3.0,
["spawnPoints"] = sp_wave1_03,
["aware"] = true,
["spawnFX"] = true},
{["leftAlive"] = 15.0},
{["ebp"] = cp_ork_hardboy,
["unitAmount"] = 2.0,
["spawnPoints"] = sp_wave5_01,
["aware"] = true,
["spawnFX"] = true},
{["ebp"] = cp_ork_boy_melee,
["unitAmount"] = 6.0,
["spawnPoints"] = sp_wave5_01,
["aware"] = true,
["spawnFX"] = true},
10.0,
{["ebp"] = cp_ork_boy_ranged_grenade,
["unitAmount"] = 5.0,
["spawnPoints"] = sp_wave5_03,
["aware"] = true},
{["ebp"] = cp_ork_boy_ranged_pro,
["unitAmount"] = 2.0,
["spawnPoints"] = sp_wave5_02,
["goto"] = mkr_dest_05,
["aware"] = true},
10.0,
{["ebp"] = cp_ork_hardboy,
["unitAmount"] = 2.0,
["spawnPoints"] = sp_wave5_01,
["goto"] = mkr_dest_05,
["aware"] = true,
["spawnFX"] = true},
{["ebp"] = cp_ork_hardboy,
["unitAmount"] = 2.0,
["spawnPoints"] = sp_wave5_05,
["goto"] = mkr_dest_05,
["aware"] = true},
10.0,
{["ebp"] = cp_ork_hardboy,
["unitAmount"] = 2.0,
["spawnPoints"] = sp_wave5_06,
["goto"] = mkr_dest_05,
["aware"] = true,
["spawnFX"] = true},
{["ebp"] = cp_ork_boy_melee,
["unitAmount"] = 8.0,
["spawnPoints"] = sp_wave5_06,
["goto"] = mkr_dest_05,
["aware"] = true,
["spawnFX"] = true},
{["leftAlive"] = 15.0},
6.0,
{["ebp"] = cp_ork_hardboy,
["unitAmount"] = 2.0,
["spawnPoints"] = sp_wave5_07,
["goto"] = mkr_dest_05,
["aware"] = true,
["spawnFX"] = true},
{["ebp"] = cp_ork_hardboy,
["unitAmount"] = 2.0,
["spawnPoints"] = sp_wave5_01,
["goto"] = mkr_dest_05,
["aware"] = true,
["spawnFX"] = true},
{["ebp"] = cp_ork_boy_melee,
["unitAmount"] = 8.0,
["spawnPoints"] = sp_wave5_01,
["goto"] = mkr_dest_05,
["aware"] = true,
["spawnFX"] = true},
4.0,
{["ebp"] = cp_ork_boy_ranged_pro,
["unitAmount"] = 2.0,
["spawnPoints"] = sp_wave1_01,
["aware"] = true,
["spawnFX"] = true},
{["ebp"] = cp_ork_boy_ranged_pro,
["unitAmount"] = 1.0,
["spawnPoints"] = sp_wave1_06,
["aware"] = true,
["spawnFX"] = true},
{["ebp"] = cp_ork_boy_ranged_pro,
["unitAmount"] = 2.0,
["spawnPoints"] = sp_wave1_05,
["aware"] = true,
["spawnFX"] = true},
{["ebp"] = cp_ork_boy_ranged_pro,
["unitAmount"] = 1.0,
["spawnPoints"] = sp_wave4_03,
["aware"] = true,
["spawnFX"] = true},
{["ebp"] = cp_ork_boy_melee_pro,
["unitAmount"] = 8.0,
["spawnPoints"] = sp_wave5_06,
["goto"] = mkr_dest_05,
["aware"] = true,
["spawnFX"] = true}}
	COOP_RegisterWaves(wave1, wave2, wave3, wave4, wave5)
	networkFunctions.setDiggasInvisible()
end

function MissionStart() --f_49
	COOP_StartWaves(trig_startArena)
	RegisterPlayerEvents()
end

networkFunctions.setDiggasInvisible = function () --f_1
	Coop_SetVisibility(grp_digga_01, false)
	Coop_SetVisibility(grp_digga_02, false)
	Coop_SetVisibility(grp_digga_03, false)
	Coop_SetVisibility(grp_digga_04, false)
end

networkFunctions.initDiggas = function () --f_2
	grp_tempDiggaSpawn01Left = Group_Create("grp_tempDiggaSpawn01Left")
	grp_tempDiggaSpawn01Left2 = Group_Create("grp_tempDiggaSpawn01Left2")
	grp_tempDiggaSpawn01Left3 = Group_Create("grp_tempDiggaSpawn01Left3")
	grp_tempDiggaSpawn02Left = Group_Create("grp_tempDiggaSpawn02Left")
	grp_tempDiggaSpawn02Left2 = Group_Create("grp_tempDiggaSpawn02Left2")
	grp_tempDiggaSpawn02Left3 = Group_Create("grp_tempDiggaSpawn02Left3")
	grp_tempDiggaSpawn02Right = Group_Create("grp_tempDiggaSpawn02Right")
	grp_tempDiggaSpawn02Right2 = Group_Create("grp_tempDiggaSpawn02Right2")
	grp_tempDiggaSpawn02Right3 = Group_Create("grp_tempDiggaSpawn02Right3")
	grp_tempDiggaSpawn03Left = Group_Create("grp_tempDiggaSpawn03Left")
	grp_tempDiggaSpawn03Left2 = Group_Create("grp_tempDiggaSpawn03Left2")
	grp_tempDiggaSpawn03Left3 = Group_Create("grp_tempDiggaSpawn03Left3")
	grp_tempDiggaSpawn03Right = Group_Create("grp_tempDiggaSpawn03Right")
	grp_tempDiggaSpawn03Right2 = Group_Create("grp_tempDiggaSpawn03Right2")
	grp_tempDiggaSpawn03Right3 = Group_Create("grp_tempDiggaSpawn03Right3")
	grp_tempDiggaSpawn04Left = Group_Create("grp_tempDiggaSpawn04Left")
	grp_tempDiggaSpawn04Left2 = Group_Create("grp_tempDiggaSpawn04Left2")
	grp_tempDiggaSpawn04Left3 = Group_Create("grp_tempDiggaSpawn04Left3")
	grp_tempDiggaSpawn04Right = Group_Create("grp_tempDiggaSpawn04Right")
	grp_tempDiggaSpawn04Right2 = Group_Create("grp_tempDiggaSpawn04Right2")
	grp_tempDiggaSpawn04Right3 = Group_Create("grp_tempDiggaSpawn04Right3")
end

networkFunctions.coop_startDigga_01 = function () --f_3
	Coop_SetVisibility(grp_digga_01, true)
	Group_TriggerAnimationEvent(grp_digga_01, "EVT_Start_After_5_Secs")
end

networkFunctions.coop_diggaSpawn_01 = function () --f_4
	local var0 = Group_GetEntityAt(grp_digga_01, 1.0)
	local var1 = Group_SpawnAtEntityMarker(multiplayer.assets.grp_currentWave, cp_ork_boy_ranged_grenade.bp, var0, "RIG_Spawn_L45Up")
	Entity_FixCollisionHack(var1)
	Group_AddEntity(grp_tempDiggaSpawn01Left, var1)
	Entity_Attach(var1, "GEO_Boy_Melee", var0, "RIG_Spawn_L45Up", false, false)
	Group_WarpToPosition(grp_tempDiggaSpawn01Left, Util_GetPosition(mkr_digga_01_left))
	Entity_TriggerAnimationEvent(var1, "EntitySpawner_Digga_Left_Up45")
	Event_AddTimer(networkFunctions.coop_diggaSpawn_01_detach, 2.0, false)
end

networkFunctions.coop_diggaSpawn_01_detach = function () --f_5
	Group_Detach(grp_tempDiggaSpawn01Left)
	Cmd_Stop(grp_tempDiggaSpawn01Left)
	Group_Clear(grp_tempDiggaSpawn01Left)
end

networkFunctions.coop_diggaSpawn_012 = function () --f_6
	local var0 = Group_GetEntityAt(grp_digga_01, 1.0)
	local var1 = Group_SpawnAtEntityMarker(multiplayer.assets.grp_currentWave, cp_ork_boy_melee.bp, var0, "RIG_Spawn_L45Up")
	Entity_FixCollisionHack(var1)
	Group_AddEntity(grp_tempDiggaSpawn01Left2, var1)
	Entity_Attach(var1, "GEO_Boy_Melee", var0, "RIG_Spawn_L45Up", false, false)
	Entity_TriggerAnimationEvent(var1, "EntitySpawner_Digga_Left_Up45")
	Event_AddTimer(networkFunctions.coop_diggaSpawn_012_detach, 2.0, false)
end

networkFunctions.coop_diggaSpawn_012_detach = function () --f_7
	Group_Detach(grp_tempDiggaSpawn01Left2)
	Cmd_Stop(grp_tempDiggaSpawn01Left2)
	Group_Clear(grp_tempDiggaSpawn01Left2)
end

networkFunctions.coop_diggaSpawn_013 = function () --f_8
	local var0 = Group_GetEntityAt(grp_digga_01, 1.0)
	local var1 = Group_SpawnAtEntityMarker(multiplayer.assets.grp_currentWave, cp_ork_boy_ranged_grenade.bp, var0, "RIG_Spawn_L45Up")
	Entity_FixCollisionHack(var1)
	Group_AddEntity(grp_tempDiggaSpawn01Left3, var1)
	Entity_Attach(var1, "GEO_Boy_Melee", var0, "RIG_Spawn_L45Up", false, false)
	Entity_TriggerAnimationEvent(var1, "EntitySpawner_Digga_Left_Up45")
	Event_AddTimer(networkFunctions.coop_diggaSpawn_013_detach, 2.0, false)
end

networkFunctions.coop_diggaSpawn_013_detach = function () --f_9
	Group_Detach(grp_tempDiggaSpawn01Left3)
	Cmd_Stop(grp_tempDiggaSpawn01Left3)
	Group_Clear(grp_tempDiggaSpawn01Left3)
end

networkFunctions.coop_startDigga_02 = function () --f_10
	Coop_SetVisibility(grp_digga_02, true)
	Group_TriggerAnimationEvent(grp_digga_02, "EVT_Start_After_1_Secs")
end

networkFunctions.coop_diggaSpawn_02 = function () --f_11
	local var0 = Group_GetEntityAt(grp_digga_02, 1.0)
	local var1 = Group_SpawnAtEntityMarker(multiplayer.assets.grp_currentWave, cp_ork_boy_ranged_grenade.bp, var0, "RIG_Spawn_L45Up")
	Entity_FixCollisionHack(var1)
	Group_AddEntity(grp_tempDiggaSpawn02Left, var1)
	Entity_Attach(var1, "GEO_Boy_Melee", var0, "RIG_Spawn_L45Up", false, false)
	Entity_TriggerAnimationEvent(var1, "EntitySpawner_Digga_Left_Up45")
	Event_AddTimer(networkFunctions.coop_diggaSpawn_02_detach, 2.0, false)
end

networkFunctions.coop_diggaSpawn_02_detach = function () --f_12
	Group_Detach(grp_tempDiggaSpawn02Left)
	Cmd_Stop(grp_tempDiggaSpawn02Left)
	Group_Clear(grp_tempDiggaSpawn02Left)
end

networkFunctions.coop_diggaSpawn_022 = function () --f_13
	local var0 = Group_GetEntityAt(grp_digga_02, 1.0)
	local var1 = Group_SpawnAtEntityMarker(multiplayer.assets.grp_currentWave, cp_ork_boy_melee_pro.bp, var0, "RIG_Spawn_L45Up")
	Entity_FixCollisionHack(var1)
	Group_AddEntity(grp_tempDiggaSpawn02Left2, var1)
	Entity_Attach(var1, "GEO_Boy_Melee", var0, "RIG_Spawn_L45Up", false, false)
	Entity_TriggerAnimationEvent(var1, "EntitySpawner_Digga_Left_Up45")
	Event_AddTimer(networkFunctions.coop_diggaSpawn_022_detach, 2.0, false)
end

networkFunctions.coop_diggaSpawn_022_detach = function () --f_14
	Group_Detach(grp_tempDiggaSpawn02Left2)
	Cmd_Stop(grp_tempDiggaSpawn02Left2)
	Group_Clear(grp_tempDiggaSpawn02Left2)
end

networkFunctions.coop_diggaSpawn_023 = function () --f_15
	local var0 = Group_GetEntityAt(grp_digga_02, 1.0)
	local var1 = Group_SpawnAtEntityMarker(multiplayer.assets.grp_currentWave, cp_ork_boy_melee.bp, var0, "RIG_Spawn_L45Up")
	Entity_FixCollisionHack(var1)
	Group_AddEntity(grp_tempDiggaSpawn02Left3, var1)
	Entity_Attach(var1, "GEO_Boy_Melee", var0, "RIG_Spawn_L45Up", false, false)
	Entity_TriggerAnimationEvent(var1, "EntitySpawner_Digga_Left_Up45")
	Event_AddTimer(networkFunctions.coop_diggaSpawn_023_detach, 2.0, false)
end

networkFunctions.coop_diggaSpawn_023_detach = function () --f_16
	Group_Detach(grp_tempDiggaSpawn02Left3)
	Cmd_Stop(grp_tempDiggaSpawn02Left3)
	Group_Clear(grp_tempDiggaSpawn02Left3)
end

networkFunctions.coop_diggaSpawn_024 = function () --f_17
	local var0 = Group_GetEntityAt(grp_digga_02, 1.0)
	local var1 = Group_SpawnAtEntityMarker(multiplayer.assets.grp_currentWave, cp_ork_boy_melee.bp, var0, "RIG_Spawn_R45Up")
	Entity_FixCollisionHack(var1)
	Group_AddEntity(grp_tempDiggaSpawn02Right, var1)
	Entity_Attach(var1, "GEO_Boy_Melee", var0, "RIG_Spawn_R45Up", false, false)
	Entity_TriggerAnimationEvent(var1, "EntitySpawner_Digga_Right_Up45")
	Event_AddTimer(networkFunctions.coop_diggaSpawn_024_detach, 2.0, false)
end

networkFunctions.coop_diggaSpawn_024_detach = function () --f_18
	Group_Detach(grp_tempDiggaSpawn02Right)
	Cmd_Stop(grp_tempDiggaSpawn02Right)
	Group_Clear(grp_tempDiggaSpawn02Right)
end

networkFunctions.coop_diggaSpawn_025 = function () --f_19
	local var0 = Group_GetEntityAt(grp_digga_02, 1.0)
	local var1 = Group_SpawnAtEntityMarker(multiplayer.assets.grp_currentWave, cp_ork_boy_melee_pro.bp, var0, "RIG_Spawn_R45Up")
	Entity_FixCollisionHack(var1)
	Group_AddEntity(grp_tempDiggaSpawn02Right2, var1)
	Entity_Attach(var1, "GEO_Boy_Melee", var0, "RIG_Spawn_R45Up", false, false)
	Entity_TriggerAnimationEvent(var1, "EntitySpawner_Digga_Right_Up45")
	Event_AddTimer(networkFunctions.coop_diggaSpawn_025_detach, 2.0, false)
end

networkFunctions.coop_diggaSpawn_025_detach = function () --f_20
	Group_Detach(grp_tempDiggaSpawn02Right2)
	Cmd_Stop(grp_tempDiggaSpawn02Right2)
	Group_Clear(grp_tempDiggaSpawn02Right2)
end

networkFunctions.coop_diggaSpawn_026 = function () --f_21
	local var0 = Group_GetEntityAt(grp_digga_02, 1.0)
	local var1 = Group_SpawnAtEntityMarker(multiplayer.assets.grp_currentWave, cp_ork_boy_ranged_grenade.bp, var0, "RIG_Spawn_R45Up")
	Entity_FixCollisionHack(var1)
	Group_AddEntity(grp_tempDiggaSpawn02Right3, var1)
	Entity_Attach(var1, "GEO_Boy_Melee", var0, "RIG_Spawn_R45Up", false, false)
	Entity_TriggerAnimationEvent(var1, "EntitySpawner_Digga_Right_Up45")
	Event_AddTimer(networkFunctions.coop_diggaSpawn_026_detach, 2.0, false)
end

networkFunctions.coop_diggaSpawn_026_detach = function () --f_22
	Group_Detach(grp_tempDiggaSpawn02Right3)
	Cmd_Stop(grp_tempDiggaSpawn02Right3)
	Group_Clear(grp_tempDiggaSpawn02Right3)
end

networkFunctions.coop_startDigga_03 = function () --f_23
	Coop_SetVisibility(grp_digga_03, true)
	Group_TriggerAnimationEvent(grp_digga_03, "EVT_Start_After_5_Secs")
end

networkFunctions.coop_diggaSpawn_03 = function () --f_24
	local var0 = Group_GetEntityAt(grp_digga_03, 1.0)
	local var1 = Group_SpawnAtEntityMarker(multiplayer.assets.grp_currentWave, cp_ork_boy_ranged_grenade.bp, var0, "RIG_Spawn_L45Up")
	Entity_FixCollisionHack(var1)
	Group_AddEntity(grp_tempDiggaSpawn03Left, var1)
	Entity_Attach(var1, "GEO_Boy_Melee", var0, "RIG_Spawn_L45Up", false, false)
	Entity_TriggerAnimationEvent(var1, "EntitySpawner_Digga_Left_Up45")
	Event_AddTimer(networkFunctions.coop_diggaSpawn_03_detach, 2.0, false)
end

networkFunctions.coop_diggaSpawn_03_detach = function () --f_25
	Group_Detach(grp_tempDiggaSpawn03Left)
	Cmd_Stop(grp_tempDiggaSpawn03Left)
	Group_Clear(grp_tempDiggaSpawn03Left)
end

networkFunctions.coop_diggaSpawn_032 = function () --f_26
	local var0 = Group_GetEntityAt(grp_digga_03, 1.0)
	local var1 = Group_SpawnAtEntityMarker(multiplayer.assets.grp_currentWave, cp_ork_boy_melee_pro.bp, var0, "RIG_Spawn_L45Up")
	Entity_FixCollisionHack(var1)
	Group_AddEntity(grp_tempDiggaSpawn03Left2, var1)
	Entity_Attach(var1, "GEO_Boy_Melee", var0, "RIG_Spawn_L45Up", false, false)
	Entity_TriggerAnimationEvent(var1, "EntitySpawner_Digga_Left_Up45")
	Event_AddTimer(networkFunctions.coop_diggaSpawn_032_detach, 2.0, false)
end

networkFunctions.coop_diggaSpawn_032_detach = function () --f_27
	Group_Detach(grp_tempDiggaSpawn03Left2)
	Cmd_Stop(grp_tempDiggaSpawn03Left2)
	Group_Clear(grp_tempDiggaSpawn03Left2)
end

networkFunctions.coop_diggaSpawn_033 = function () --f_28
	local var0 = Group_GetEntityAt(grp_digga_03, 1.0)
	local var1 = Group_SpawnAtEntityMarker(multiplayer.assets.grp_currentWave, cp_ork_boy_melee.bp, var0, "RIG_Spawn_L45Up")
	Entity_FixCollisionHack(var1)
	Group_AddEntity(grp_tempDiggaSpawn03Left3, var1)
	Entity_Attach(var1, "GEO_Boy_Melee", var0, "RIG_Spawn_L45Up", false, false)
	Entity_TriggerAnimationEvent(var1, "EntitySpawner_Digga_Left_Up45")
	Event_AddTimer(networkFunctions.coop_diggaSpawn_033_detach, 2.0, false)
end

networkFunctions.coop_diggaSpawn_033_detach = function () --f_29
	Group_Detach(grp_tempDiggaSpawn03Left3)
	Cmd_Stop(grp_tempDiggaSpawn03Left3)
	Group_Clear(grp_tempDiggaSpawn03Left3)
end

networkFunctions.coop_diggaSpawn_034 = function () --f_30
	local var0 = Group_GetEntityAt(grp_digga_03, 1.0)
	local var1 = Group_SpawnAtEntityMarker(multiplayer.assets.grp_currentWave, cp_ork_boy_melee.bp, var0, "RIG_Spawn_R45Up")
	Entity_FixCollisionHack(var1)
	Group_AddEntity(grp_tempDiggaSpawn03Right, var1)
	Entity_Attach(var1, "GEO_Boy_Melee", var0, "RIG_Spawn_R45Up", false, false)
	Entity_TriggerAnimationEvent(var1, "EntitySpawner_Digga_Right_Up45")
	Event_AddTimer(networkFunctions.coop_diggaSpawn_034_detach, 2.0, false)
end

networkFunctions.coop_diggaSpawn_034_detach = function () --f_31
	Group_Detach(grp_tempDiggaSpawn03Right)
	Cmd_Stop(grp_tempDiggaSpawn03Right)
	Group_Clear(grp_tempDiggaSpawn03Right)
end

networkFunctions.coop_diggaSpawn_035 = function () --f_32
	local var0 = Group_GetEntityAt(grp_digga_03, 1.0)
	local var1 = Group_SpawnAtEntityMarker(multiplayer.assets.grp_currentWave, cp_ork_boy_melee_pro.bp, var0, "RIG_Spawn_R45Up")
	Entity_FixCollisionHack(var1)
	Group_AddEntity(grp_tempDiggaSpawn03Right2, var1)
	Entity_Attach(var1, "GEO_Boy_Melee", var0, "RIG_Spawn_R45Up", false, false)
	Entity_TriggerAnimationEvent(var1, "EntitySpawner_Digga_Right_Up45")
	Event_AddTimer(networkFunctions.coop_diggaSpawn_035_detach, 2.0, false)
end

networkFunctions.coop_diggaSpawn_035_detach = function () --f_33
	Group_Detach(grp_tempDiggaSpawn03Right2)
	Cmd_Stop(grp_tempDiggaSpawn03Right2)
	Group_Clear(grp_tempDiggaSpawn03Right2)
end

networkFunctions.coop_diggaSpawn_036 = function () --f_34
	local var0 = Group_GetEntityAt(grp_digga_03, 1.0)
	local var1 = Group_SpawnAtEntityMarker(multiplayer.assets.grp_currentWave, cp_ork_boy_ranged_grenade.bp, var0, "RIG_Spawn_R45Up")
	Entity_FixCollisionHack(var1)
	Group_AddEntity(grp_tempDiggaSpawn03Right3, var1)
	Entity_Attach(var1, "GEO_Boy_Melee", var0, "RIG_Spawn_R45Up", false, false)
	Entity_TriggerAnimationEvent(var1, "EntitySpawner_Digga_Right_Up45")
	Event_AddTimer(networkFunctions.coop_diggaSpawn_036_detach, 2.0, false)
end

networkFunctions.coop_diggaSpawn_036_detach = function () --f_35
	Group_Detach(grp_tempDiggaSpawn03Right3)
	Cmd_Stop(grp_tempDiggaSpawn03Right3)
	Group_Clear(grp_tempDiggaSpawn03Right3)
end

networkFunctions.coop_startDigga_04 = function () --f_36
	Coop_SetVisibility(grp_digga_04, true)
	Group_TriggerAnimationEvent(grp_digga_04, "EVT_Start_After_1_Secs")
end

networkFunctions.coop_diggaSpawn_04 = function () --f_37
	local var0 = Group_GetEntityAt(grp_digga_04, 1.0)
	local var1 = Group_SpawnAtEntityMarker(multiplayer.assets.grp_currentWave, cp_ork_boy_ranged_grenade.bp, var0, "RIG_Spawn_L45Up")
	Entity_FixCollisionHack(var1)
	Group_AddEntity(grp_tempDiggaSpawn04Left, var1)
	Entity_Attach(var1, "GEO_Boy_Melee", var0, "RIG_Spawn_L45Up", false, false)
	Entity_TriggerAnimationEvent(var1, "EntitySpawner_Digga_Left_Up45")
	Event_AddTimer(networkFunctions.coop_diggaSpawn_04_detach, 2.0, false)
end

networkFunctions.coop_diggaSpawn_04_detach = function () --f_38
	Group_Detach(grp_tempDiggaSpawn04Left)
	Cmd_Stop(grp_tempDiggaSpawn04Left)
	Group_Clear(grp_tempDiggaSpawn04Left)
end

networkFunctions.coop_diggaSpawn_042 = function () --f_39
	local var0 = Group_GetEntityAt(grp_digga_04, 1.0)
	local var1 = Group_SpawnAtEntityMarker(multiplayer.assets.grp_currentWave, cp_ork_boy_melee_pro.bp, var0, "RIG_Spawn_L45Up")
	Entity_FixCollisionHack(var1)
	Group_AddEntity(grp_tempDiggaSpawn04Left2, var1)
	Entity_Attach(var1, "GEO_Boy_Melee", var0, "RIG_Spawn_L45Up", false, false)
	Entity_TriggerAnimationEvent(var1, "EntitySpawner_Digga_Left_Up45")
	Event_AddTimer(networkFunctions.coop_diggaSpawn_042_detach, 2.0, false)
end

networkFunctions.coop_diggaSpawn_042_detach = function () --f_40
	Group_Detach(grp_tempDiggaSpawn04Left2)
	Cmd_Stop(grp_tempDiggaSpawn04Left2)
	Group_Clear(grp_tempDiggaSpawn04Left2)
end

networkFunctions.coop_diggaSpawn_043 = function () --f_41
	local var0 = Group_GetEntityAt(grp_digga_04, 1.0)
	local var1 = Group_SpawnAtEntityMarker(multiplayer.assets.grp_currentWave, cp_ork_boy_melee.bp, var0, "RIG_Spawn_L45Up")
	Entity_FixCollisionHack(var1)
	Group_AddEntity(grp_tempDiggaSpawn04Left3, var1)
	Entity_Attach(var1, "GEO_Boy_Melee", var0, "RIG_Spawn_L45Up", false, false)
	Entity_TriggerAnimationEvent(var1, "EntitySpawner_Digga_Left_Up45")
	Event_AddTimer(networkFunctions.coop_diggaSpawn_043_detach, 2.0, false)
end

networkFunctions.coop_diggaSpawn_043_detach = function () --f_42
	Group_Detach(grp_tempDiggaSpawn04Left3)
	Cmd_Stop(grp_tempDiggaSpawn04Left3)
	Group_Clear(grp_tempDiggaSpawn04Left3)
end

networkFunctions.coop_diggaSpawn_044 = function () --f_43
	local var0 = Group_GetEntityAt(grp_digga_04, 1.0)
	local var1 = Group_SpawnAtEntityMarker(multiplayer.assets.grp_currentWave, cp_ork_boy_melee.bp, var0, "RIG_Spawn_R45Up")
	Entity_FixCollisionHack(var1)
	Group_AddEntity(grp_tempDiggaSpawn04Right, var1)
	Entity_Attach(var1, "GEO_Boy_Melee", var0, "RIG_Spawn_R45Up", false, false)
	Entity_TriggerAnimationEvent(var1, "EntitySpawner_Digga_Right_Up45")
	Event_AddTimer(networkFunctions.coop_diggaSpawn_044_detach, 2.0, false)
end

networkFunctions.coop_diggaSpawn_044_detach = function () --f_44
	Group_Detach(grp_tempDiggaSpawn04Right)
	Cmd_Stop(grp_tempDiggaSpawn04Right)
	Group_Clear(grp_tempDiggaSpawn04Right)
end

networkFunctions.coop_diggaSpawn_045 = function () --f_45
	local var0 = Group_GetEntityAt(grp_digga_04, 1.0)
	local var1 = Group_SpawnAtEntityMarker(multiplayer.assets.grp_currentWave, cp_ork_boy_melee_pro.bp, var0, "RIG_Spawn_R45Up")
	Entity_FixCollisionHack(var1)
	Group_AddEntity(grp_tempDiggaSpawn04Right2, var1)
	Entity_Attach(var1, "GEO_Boy_Melee", var0, "RIG_Spawn_R45Up", false, false)
	Entity_TriggerAnimationEvent(var1, "EntitySpawner_Digga_Right_Up45")
	Event_AddTimer(networkFunctions.coop_diggaSpawn_045_detach, 2.0, false)
end

networkFunctions.coop_diggaSpawn_045_detach = function () --f_46
	Group_Detach(grp_tempDiggaSpawn04Right2)
	Cmd_Stop(grp_tempDiggaSpawn04Right2)
	Group_Clear(grp_tempDiggaSpawn04Right2)
end

networkFunctions.coop_diggaSpawn_046 = function () --f_47
	local var0 = Group_GetEntityAt(grp_digga_04, 1.0)
	local var1 = Group_SpawnAtEntityMarker(multiplayer.assets.grp_currentWave, cp_ork_boy_ranged_grenade.bp, var0, "RIG_Spawn_R45Up")
	Entity_FixCollisionHack(var1)
	Group_AddEntity(grp_tempDiggaSpawn04Right3, var1)
	Entity_Attach(var1, "GEO_Boy_Melee", var0, "RIG_Spawn_R45Up", false, false)
	Entity_TriggerAnimationEvent(var1, "EntitySpawner_Digga_Right_Up45")
	Event_AddTimer(networkFunctions.coop_diggaSpawn_046_detach, 2.0, false)
end

networkFunctions.coop_diggaSpawn_046_detach = function () --f_48
	Group_Detach(grp_tempDiggaSpawn04Right3)
	Cmd_Stop(grp_tempDiggaSpawn04Right3)
	Group_Clear(grp_tempDiggaSpawn04Right3)
end

networkFunctions.ShowWayLeft = function () --f_50
	Marker_PlayFX(mkr_explosionWay_01_Left)
end

networkFunctions.StopShowWayLeft = function () --f_51
	Marker_StopFX(mkr_explosionWay_01_Left)
end

networkFunctions.ShowWayRight = function () --f_52
	Marker_PlayFX(mkr_explosionWay_01_Right)
end

networkFunctions.StopShowWayRight = function () --f_53
	Marker_StopFX(mkr_explosionWay_01_Right)
end

networkFunctions.ShowWayBack = function () --f_54
	Marker_PlayFX(mkr_explosionWay_01_Back)
end

networkFunctions.StopShowWayBack = function () --f_55
	Marker_StopFX(mkr_explosionWay_01_Back)
end

networkFunctions.ShowWayFrontRight = function () --f_56
	Marker_PlayFX(mkr_explosionWay_01_FrontRight)
end

networkFunctions.StopShowWayFrontRight = function () --f_57
	Marker_StopFX(mkr_explosionWay_01_FrontRight)
end

networkFunctions.ShowWayFrontLeft = function () --f_58
	Marker_PlayFX(mkr_explosionWay_01_FrontLeft)
end

networkFunctions.StopShowWayFrontLeft = function () --f_59
	Marker_StopFX(mkr_explosionWay_01_FrontLeft)
end

networkFunctions.ShowWayFront = function () --f_60
	Marker_PlayFX(mkr_explosionWay_01_Front)
end

networkFunctions.StopShowWayFront = function () --f_61
	Marker_StopFX(mkr_explosionWay_01_Front)
end