require("Util/Common")
require("Util/Scarutil")
require("Util/MissionTask")
require("Util/CP/CP_Common")
require("Util/CP/CP_Func")

multiplayer.objectiveData = {}
arenaNum = 4.0
thisArena = "cp_arena_desert_a"
arenaExit = "mkr_desert_a_exit"

function MissionStartNetwork()
	InitLuaSafe()
	
	sp_wave1 = COOP_GetSpawnPointGroup("sp_wave1")
	sp_wave2 = COOP_GetSpawnPointGroup("sp_wave2")
	sp_wave3 = COOP_GetSpawnPointGroup("sp_wave3")
	sp_wave4 = COOP_GetSpawnPointGroup("sp_wave4")
	sp_wave5 = COOP_GetSpawnPointGroup("sp_wave5")

	challengeSet1 = {{["challengeType"] = ch_speedKill,
["timeLimit"] = 20.0,
["targetAmount"] = 15.0},
{["challengeType"] = ch_selectiveKill,
["timeLimit"] = 20.0,
["targetAmount"] = 10.0,
["unitType"] = cp_ork_boy_melee_pro},
{["challengeType"] = ch_ballHog,
["timeLimit"] = 20.0,
["targetAmount"] = 10.0}}
	challengeSet2 = {{["challengeType"] = ch_speedKill,
["timeLimit"] = 15.0,
["targetAmount"] = 9.0},
{["challengeType"] = ch_selectiveKill,
["timeLimit"] = 20.0,
["targetAmount"] = 6.0,
["unitType"] = cp_ork_boy_ranged_pro},
{["challengeType"] = ch_ballHog,
["timeLimit"] = 25.0,
["targetAmount"] = 12.0},
{["challengeType"] = ch_sychronizedKill,
["timeLimit"] = 20.0,
["targetAmount"] = 9.0}}
	challengeSet3 = {{["challengeType"] = ch_speedKill,
["timeLimit"] = 25.0,
["targetAmount"] = 15.0},
{["challengeType"] = ch_selectiveKill,
["timeLimit"] = 20.0,
["targetAmount"] = 10.0,
["unitType"] = cp_ork_boy_melee_pro},
{["challengeType"] = ch_ballHog,
["timeLimit"] = 20.0,
["targetAmount"] = 8.0},
{["challengeType"] = ch_sychronizedKill,
["timeLimit"] = 25.0,
["targetAmount"] = 10.0}}

	sp_lowAll = {sp_wave1_01,
sp_wave1_04,
sp_wave1_back_01,
sp_wave1_back_02}
	sp_highAll = {sp_wave1_02,
sp_wave1_03}

	--sp_lowAll = 10.0
	--sp_highAll = 10.0
	--sp_lowAll = 10.0
	--sp_wave1_back_02 = 12.0
	--sp_lowAll = 10.0
	--sp_highAll = 10.0
	--sp_lowAll = 10.0
	--sp_wave1_back_02 = 15.0

	wave2_loop = {{["ebp"] = cp_ork_boy_melee,
["unitAmount"] = 8.0,
["spawnPoints"] = sp_lowAll,
["aware"] = true},
{["ebp"] = cp_ork_boy_melee_pro,
["unitAmount"] = 8.0,
["spawnPoints"] = sp_lowAll,
["aware"] = true},
10.0,
{["ebp"] = cp_ork_boy_melee,
["unitAmount"] = 10.0,
["spawnPoints"] = sp_highAll,
["aware"] = true},
{["ebp"] = cp_ork_squig_bomb,
["unitAmount"] = 2.0,
["spawnPoints"] = sp_highAll,
["aware"] = true},
10.0,
{["ebp"] = cp_ork_boy_melee,
["unitAmount"] = 8.0,
["spawnPoints"] = sp_lowAll,
["aware"] = true},
{["ebp"] = cp_ork_boy_melee_pro,
["unitAmount"] = 8.0,
["spawnPoints"] = sp_lowAll,
["aware"] = true},
10.0,
{["ebp"] = cp_ork_nob_melee,
["unitAmount"] = 1.0,
["spawnPoints"] = sp_wave1_01,
["aware"] = true},
{["ebp"] = cp_ork_nob_shoota,
["unitAmount"] = 1.0,
["spawnPoints"] = sp_wave1_01,
["aware"] = true},
{["ebp"] = cp_ork_nob_melee,
["unitAmount"] = 1.0,
["spawnPoints"] = sp_wave1_back_01,
["aware"] = true},
{["ebp"] = cp_ork_nob_melee,
["unitAmount"] = 1.0,
["spawnPoints"] = sp_wave1_back_02,
["aware"] = true},
12.0,
{["ebp"] = cp_ork_boy_melee,
["unitAmount"] = 8.0,
["spawnPoints"] = sp_lowAll,
["aware"] = true},
{["ebp"] = cp_ork_boy_melee_pro,
["unitAmount"] = 8.0,
["spawnPoints"] = sp_lowAll,
["aware"] = true},
10.0,
{["ebp"] = cp_ork_boy_melee,
["unitAmount"] = 15.0,
["spawnPoints"] = sp_highAll,
["aware"] = true},
{["ebp"] = cp_ork_squig_bomb,
["unitAmount"] = 2.0,
["spawnPoints"] = sp_highAll,
["aware"] = true},
10.0,
{["ebp"] = cp_ork_boy_melee,
["unitAmount"] = 10.0,
["spawnPoints"] = sp_lowAll,
["aware"] = true},
{["ebp"] = cp_ork_hardboy,
["unitAmount"] = 2.0,
["spawnPoints"] = sp_lowAll,
["aware"] = true},
10.0,
{["ebp"] = cp_ork_nob_melee,
["unitAmount"] = 1.0,
["spawnPoints"] = sp_wave1_01,
["aware"] = true},
{["ebp"] = cp_ork_nob_shoota,
["unitAmount"] = 1.0,
["spawnPoints"] = sp_wave1_01,
["aware"] = true},
{["ebp"] = cp_ork_nob_shoota,
["unitAmount"] = 1.0,
["spawnPoints"] = sp_wave1_back_01,
["aware"] = true},
{["ebp"] = cp_ork_nob_melee,
["unitAmount"] = 1.0,
["spawnPoints"] = sp_wave1_back_02,
["aware"] = true},
15.0}

	--mkr_back_02 = 8.0
	--mkr_back_02 = 2.0
	--mkr_dest_03 = 1.0
	--mkr_wave2_bridge = 2.0
	--mkr_dest_01 = 2.0
	--mkr_dest_01 = 10.0
	--mkr_wave2_bridge = 6.0
	--mkr_back_02 = 5.0
	--mkr_back_02 = 5.0
	--sp_wave3_03 = 8.0
	--mkr_back_02 = 6.0
	--mkr_back_02 = 3.0
	--mkr_back_02 = 10.0
	wave3_loop = {{["ebp"] = cp_ork_boy_ranged_grenade,
["unitAmount"] = 2.0,
["spawnPoints"] = sp_wave3_back_01,
["goto"] = mkr_back_01,
["aware"] = true},
{["ebp"] = cp_ork_boy_ranged_grenade,
["unitAmount"] = 2.0,
["spawnPoints"] = sp_wave3_back_02,
["goto"] = mkr_back_02,
["aware"] = true},
{["ebp"] = cp_ork_boy_melee,
["unitAmount"] = 5.0,
["spawnPoints"] = sp_wave3_back_01,
["goto"] = mkr_back_01,
["aware"] = true},
{["ebp"] = cp_ork_boy_melee,
["unitAmount"] = 5.0,
["spawnPoints"] = sp_wave3_back_02,
["goto"] = mkr_back_02,
["aware"] = true},
{["ebp"] = cp_ork_boy_melee_pro,
["unitAmount"] = 5.0,
["spawnPoints"] = sp_wave3_back_01,
["goto"] = mkr_back_01,
["aware"] = true},
{["ebp"] = cp_ork_boy_melee_pro,
["unitAmount"] = 5.0,
["spawnPoints"] = sp_wave3_back_02,
["goto"] = mkr_back_02,
["aware"] = true},
8.0,
{["ebp"] = cp_ork_boy_ranged_pro,
["unitAmount"] = 2.0,
["spawnPoints"] = sp_wave3_back_01,
["goto"] = mkr_back_01,
["aware"] = true},
{["ebp"] = cp_ork_boy_ranged_pro,
["unitAmount"] = 2.0,
["spawnPoints"] = sp_wave3_back_02,
["goto"] = mkr_back_02,
["aware"] = true},
2.0,
{["ebp"] = cp_ork_squig_bomb,
["unitAmount"] = 2.0,
["spawnPoints"] = sp_wave3_04,
["goto"] = mkr_dest_03,
["aware"] = true},
1.0,
{["ebp"] = cp_ork_boy_ranged_grenade,
["unitAmount"] = 5.0,
["spawnPoints"] = sp_wave3_04,
["goto"] = mkr_wave2_bridge,
["aware"] = true},
{["ebp"] = cp_ork_nob_shoota_pro,
["unitAmount"] = 1.0,
["spawnPoints"] = sp_wave3_04,
["goto"] = mkr_wave2_bridge,
["aware"] = true},
2.0,
{["ebp"] = cp_ork_nob_melee,
["unitAmount"] = 2.0,
["spawnPoints"] = sp_wave3_01,
["goto"] = mkr_dest_01,
["aware"] = true},
2.0,
{["ebp"] = cp_ork_squig_bomb,
["unitAmount"] = 2.0,
["spawnPoints"] = sp_wave3_01,
["goto"] = mkr_dest_01,
["aware"] = true},
10.0,
{["ebp"] = cp_ork_boy_ranged_pro,
["unitAmount"] = 2.0,
["spawnPoints"] = sp_wave3_01,
["goto"] = mkr_dest_01,
["hold"] = mkr_wave2_bridge,
["aware"] = true},
{["ebp"] = cp_ork_boy_ranged_pro,
["unitAmount"] = 2.0,
["spawnPoints"] = sp_wave3_04,
["hold"] = mkr_wave2_bridge,
["aware"] = true},
6.0,
{["ebp"] = cp_ork_nob_shoota,
["unitAmount"] = 3.0,
["spawnPoints"] = sp_wave3_back_01,
["goto"] = mkr_back_01,
["aware"] = true},
{["ebp"] = cp_ork_nob_shoota,
["unitAmount"] = 3.0,
["spawnPoints"] = sp_wave3_back_02,
["goto"] = mkr_back_02,
["aware"] = true},
{["ebp"] = cp_ork_boy_melee,
["unitAmount"] = 8.0,
["spawnPoints"] = sp_wave3_back_01,
["goto"] = mkr_back_01,
["aware"] = true},
{["ebp"] = cp_ork_boy_melee,
["unitAmount"] = 8.0,
["spawnPoints"] = sp_wave3_back_02,
["goto"] = mkr_back_02,
["aware"] = true},
5.0,
{["ebp"] = cp_ork_squig_bomb,
["unitAmount"] = 1.0,
["spawnPoints"] = sp_wave3_back_01,
["goto"] = mkr_back_01,
["aware"] = true},
{["ebp"] = cp_ork_squig_bomb,
["unitAmount"] = 1.0,
["spawnPoints"] = sp_wave3_back_02,
["goto"] = mkr_back_02,
["aware"] = true},
5.0,
{["ebp"] = cp_ork_nob_shoota,
["unitAmount"] = 1.0,
["spawnPoints"] = sp_chaos_09,
["aware"] = true,
["spawnFX"] = true},
{["ebp"] = cp_ork_nob_shoota,
["unitAmount"] = 1.0,
["spawnPoints"] = sp_chaos_08,
["aware"] = true,
["spawnFX"] = true},
{["ebp"] = cp_ork_boy_melee_pro,
["unitAmount"] = 10.0,
["spawnPoints"] = sp_wave3_03,
["aware"] = true,
["spawnFX"] = true},
{["ebp"] = cp_ork_nob_melee,
["unitAmount"] = 1.0,
["spawnPoints"] = sp_wave3_03,
["aware"] = true,
["spawnFX"] = true},
8.0,
{["ebp"] = cp_ork_hardboy,
["unitAmount"] = 3.0,
["spawnPoints"] = sp_wave3_back_01,
["goto"] = mkr_back_01,
["aware"] = true},
{["ebp"] = cp_ork_nob_shoota_pro,
["unitAmount"] = 1.0,
["spawnPoints"] = sp_wave3_back_01,
["goto"] = mkr_back_01,
["aware"] = true},
{["ebp"] = cp_ork_hardboy,
["unitAmount"] = 3.0,
["spawnPoints"] = sp_wave3_back_02,
["goto"] = mkr_back_02,
["aware"] = true},
{["ebp"] = cp_ork_nob_shoota_pro,
["unitAmount"] = 1.0,
["spawnPoints"] = sp_wave3_back_02,
["goto"] = mkr_back_02,
["aware"] = true},
6.0,
{["ebp"] = cp_ork_squig_bomb,
["unitAmount"] = 2.0,
["spawnPoints"] = sp_wave3_back_01,
["goto"] = mkr_back_01,
["aware"] = true},
{["ebp"] = cp_ork_squig_bomb,
["unitAmount"] = 2.0,
["spawnPoints"] = sp_wave3_back_02,
["goto"] = mkr_back_02,
["aware"] = true},
3.0,
{["ebp"] = cp_ork_boy_melee_pro,
["unitAmount"] = 8.0,
["spawnPoints"] = sp_wave3_back_01,
["goto"] = mkr_back_01,
["aware"] = true},
{["ebp"] = cp_ork_boy_melee_pro,
["unitAmount"] = 8.0,
["spawnPoints"] = sp_wave3_back_02,
["goto"] = mkr_back_02,
["aware"] = true},
10.0,
{["ebp"] = cp_ork_nob_melee_pro,
["unitAmount"] = 1.0,
["spawnPoints"] = sp_wave1_01,
["aware"] = true},
{["ebp"] = cp_ork_nob_melee_pro,
["unitAmount"] = 1.0,
["spawnPoints"] = sp_wave1_02,
["aware"] = true},
{["ebp"] = cp_ork_nob_melee_pro,
["unitAmount"] = 1.0,
["spawnPoints"] = sp_wave1_back_01,
["aware"] = true},
15.0}
	--mkr_back_02 = 3.0
	--mkr_back_02 = 8.0
	--mkr_wave2_bridge = 8.0
	--sp_wave4_03 = 10.0
	--mkr_back_02 = 8.0
	--sp_wave4_03 = 8.0
	--sp_wave4_03 = 15.0
	wave4_loop = {{["ebp"] = cp_ork_boy_melee_pro,
["unitAmount"] = 8.0,
["spawnPoints"] = sp_wave4_01,
["goto"] = mkr_dest_01,
["aware"] = true},
{["ebp"] = cp_ork_boy_melee_pro,
["unitAmount"] = 8.0,
["spawnPoints"] = sp_wave4_02,
["goto"] = mkr_dest_02,
["aware"] = true},
{["ebp"] = cp_ork_boy_melee_pro,
["unitAmount"] = 8.0,
["spawnPoints"] = sp_wave4_back_02,
["goto"] = mkr_back_02,
["aware"] = true},
3.0,
{["ebp"] = cp_ork_boy_melee_pro,
["unitAmount"] = 4.0,
["spawnPoints"] = sp_wave4_01,
["goto"] = mkr_dest_01,
["aware"] = true},
{["ebp"] = cp_ork_boy_melee_pro,
["unitAmount"] = 4.0,
["spawnPoints"] = sp_wave4_02,
["goto"] = mkr_dest_02,
["aware"] = true},
{["ebp"] = cp_ork_boy_melee_pro,
["unitAmount"] = 4.0,
["spawnPoints"] = sp_wave4_back_02,
["goto"] = mkr_back_02,
["aware"] = true},
8.0,
{["ebp"] = cp_ork_boy_ranged_grenade,
["unitAmount"] = 3.0,
["spawnPoints"] = sp_wave4_01,
["goto"] = mkr_wave2_bridge,
["aware"] = true},
{["ebp"] = cp_ork_boy_ranged_grenade,
["unitAmount"] = 4.0,
["spawnPoints"] = sp_wave4_04,
["goto"] = mkr_wave2_bridge,
["aware"] = true},
{["ebp"] = cp_ork_boy_ranged_pro,
["unitAmount"] = 2.0,
["spawnPoints"] = sp_wave4_01,
["goto"] = mkr_wave2_bridge,
["aware"] = true},
{["ebp"] = cp_ork_boy_ranged_pro,
["unitAmount"] = 2.0,
["spawnPoints"] = sp_wave4_04,
["goto"] = mkr_wave2_bridge,
["aware"] = true},
8.0,
{["ebp"] = cp_ork_squig_bomb,
["unitAmount"] = 2.0,
["spawnPoints"] = sp_wave4_01,
["goto"] = mkr_dest_01,
["aware"] = true},
{["ebp"] = cp_ork_squig_bomb,
["unitAmount"] = 2.0,
["spawnPoints"] = sp_wave4_02,
["goto"] = mkr_dest_02,
["aware"] = true},
{["ebp"] = cp_ork_squig_bomb,
["unitAmount"] = 2.0,
["spawnPoints"] = sp_wave4_03,
["aware"] = true,
["spawnFX"] = true},
10.0,
{["ebp"] = cp_ork_boy_melee_pro,
["unitAmount"] = 4.0,
["spawnPoints"] = sp_wave4_01,
["goto"] = mkr_dest_01,
["aware"] = true},
{["ebp"] = cp_ork_boy_melee_pro,
["unitAmount"] = 4.0,
["spawnPoints"] = sp_wave4_02,
["goto"] = mkr_dest_02,
["aware"] = true},
{["ebp"] = cp_ork_boy_melee_pro,
["unitAmount"] = 4.0,
["spawnPoints"] = sp_wave4_back_02,
["goto"] = mkr_back_02,
["aware"] = true},
8.0,
{["ebp"] = cp_ork_nob_melee_pro,
["unitAmount"] = 1.0,
["spawnPoints"] = sp_wave4_back_01,
["goto"] = mkr_back_01,
["aware"] = true},
{["ebp"] = cp_ork_nob_melee_pro,
["unitAmount"] = 1.0,
["spawnPoints"] = sp_wave4_back_02,
["goto"] = mkr_back_02,
["aware"] = true},
{["ebp"] = cp_ork_hardboy,
["unitAmount"] = 3.0,
["spawnPoints"] = sp_wave1_01,
["aware"] = true},
{["ebp"] = cp_ork_hardboy,
["unitAmount"] = 3.0,
["spawnPoints"] = sp_wave1_back_02,
["aware"] = true},
{["ebp"] = cp_ork_boy_melee_pro,
["unitAmount"] = 8.0,
["spawnPoints"] = sp_wave4_back_01,
["goto"] = mkr_back_01,
["aware"] = true},
{["ebp"] = cp_ork_boy_melee_pro,
["unitAmount"] = 8.0,
["spawnPoints"] = sp_wave4_back_02,
["goto"] = mkr_back_02,
["aware"] = true},
{["ebp"] = cp_ork_boy_melee_pro,
["unitAmount"] = 6.0,
["spawnPoints"] = sp_wave4_03,
["aware"] = true,
["spawnFX"] = true},
8.0,
{["ebp"] = cp_ork_squig_bomb,
["unitAmount"] = 2.0,
["spawnPoints"] = sp_wave4_01,
["goto"] = mkr_dest_01,
["aware"] = true},
{["ebp"] = cp_ork_squig_bomb,
["unitAmount"] = 2.0,
["spawnPoints"] = sp_wave4_03,
["aware"] = true,
["spawnFX"] = true},
15.0}
	--mkr_dest_02 = 1.0
	--mkr_back_02 = 8.0
	wave1 = {2.0,
networkFunctions.ShowWayLeft,
{["ebp"] = cp_ork_boy_melee,
["unitAmount"] = 8.0,
["spawnPoints"] = sp_wave1_01,
["goto"] = mkr_dest_01,
["aware"] = true},
{["ebp"] = cp_ork_boy_melee,
["unitAmount"] = 6.0,
["spawnPoints"] = sp_wave1_02,
["goto"] = mkr_dest_02,
["aware"] = true},
1.0,
networkFunctions.ShowWayRight,
8.0,
networkFunctions.StopShowWayLeft,
networkFunctions.StopShowWayRight,
networkFunctions.ShowWayBackLeft,
1.0,
networkFunctions.ShowWayBackRight,
{["ebp"] = cp_ork_boy_melee,
["unitAmount"] = 8.0,
["spawnPoints"] = sp_wave1_back_01,
["goto"] = mkr_back_01,
["aware"] = true},
{["ebp"] = cp_ork_boy_melee,
["unitAmount"] = 8.0,
["spawnPoints"] = sp_wave1_back_02,
["goto"] = mkr_back_02,
["aware"] = true},
8.0,
networkFunctions.StopShowWayBackLeft,
networkFunctions.StopShowWayBackRight,
{["ebp"] = cp_ork_boy_ranged_grenade,
["unitAmount"] = 3.0,
["spawnPoints"] = sp_wave1_back_01,
["goto"] = mkr_back_01,
["aware"] = true},
{["ebp"] = cp_ork_boy_ranged_grenade,
["unitAmount"] = 3.0,
["spawnPoints"] = sp_wave1_back_02,
["goto"] = mkr_back_02,
["aware"] = true},
{["ebp"] = cp_ork_boy_ranged_grenade,
["unitAmount"] = 2.0,
["spawnPoints"] = sp_wave1,
["aware"] = true},
{["leftAlive"] = 25.0},
{["ebp"] = cp_ork_boy_melee_pro,
["unitAmount"] = 6.0,
["spawnPoints"] = sp_wave1_back_01,
["goto"] = mkr_back_01,
["aware"] = true},
{["ebp"] = cp_ork_boy_melee,
["unitAmount"] = 8.0,
["spawnPoints"] = sp_wave1_back_01,
["goto"] = mkr_back_01,
["aware"] = true},
{["ebp"] = cp_ork_boy_melee,
["unitAmount"] = 8.0,
["spawnPoints"] = sp_wave1_back_02,
["goto"] = mkr_back_02,
["aware"] = true},
{["ebp"] = cp_ork_boy_melee_pro,
["unitAmount"] = 6.0,
["spawnPoints"] = sp_wave1_back_02,
["goto"] = mkr_back_02,
["aware"] = true},
{["ebp"] = cp_ork_boy_melee_pro,
["unitAmount"] = 4.0,
["spawnPoints"] = sp_wave1,
["goto"] = mkr_back_01,
["aware"] = true},
networkFunctions.ShowWayBackLeft,
1.0,
{["challenge"] = challengeSet1,
["bonusPoints"] = 2500.0},
networkFunctions.ShowWayBackRight,
10.0,
networkFunctions.StopShowWayBackLeft,
networkFunctions.StopShowWayBackRight,
{["ebp"] = cp_ork_boy_ranged_grenade,
["unitAmount"] = 4.0,
["spawnPoints"] = sp_wave1_back_01,
["goto"] = mkr_back_01,
["aware"] = true},
{["ebp"] = cp_ork_boy_ranged_pro,
["unitAmount"] = 4.0,
["spawnPoints"] = sp_wave1_back_02,
["goto"] = mkr_back_02,
["aware"] = true},
{["ebp"] = cp_ork_boy_ranged_pro,
["unitAmount"] = 3.0,
["spawnPoints"] = sp_wave1,
["aware"] = true}}

	wave2 = {5.0,
	{["capturePoint"] = mkr_cp_01,
	["awardPoints"] = 2500.0,
	["waveBlocker"] = true,
	["loopingSpawns"] = wave2_loop,
	["duration"] = 120.0,
	["timeLimit"] = 180.0,
	["loseAfterTimeOut"] = true},
1.0,
{["ebp"] = cp_ork_boy_melee,
["unitAmount"] = 1.0,
["spawnPoints"] = sp_wave1_back_01,
["aware"] = true}}

	wave3 = {5.0,
	{["capturePoint"] = mkr_cp_02,
	["awardPoints"] = 2500.0,
	["waveBlocker"] = true,
	["loopingSpawns"] = wave3_loop,
	["duration"] = 120.0,
	["timeLimit"] = 180.0,
	["loseAfterTimeOut"] = true},
1.0,
{["ebp"] = cp_ork_boy_melee,
["unitAmount"] = 1.0,
["spawnPoints"] = sp_wave1_back_01,
["aware"] = true}}

	wave4 = {networkFunctions.startFog,
5.0,
{["capturePoint"] = mkr_cp_03,
	["awardPoints"] = 2500.0,
	["waveBlocker"] = true,
	["loopingSpawns"] = wave4_loop,
	["duration"] = 120.0,
	["timeLimit"] = 180.0,
	["loseAfterTimeOut"] = true},
1.0,
{["ebp"] = cp_ork_boy_melee,
["unitAmount"] = 1.0,
["spawnPoints"] = sp_wave1_back_01,
["aware"] = true}}

	--sp_wave5 = 8.0
	--mkr_wave2_bridge = 1.0
	--mkr_dest_02 = 2.0
	--mkr_dest_02 = 1.0
	--mkr_dest_03 = 1.0
	--mkr_back_01 = 1.0
	--sp_wave5_04 = 12.0
	--mkr_back_01 = 1.0
	--mkr_back_02 = 2.0
	--mkr_back_01 = 2.0
	--challengeSet3 = 3.0
	--mkr_back_02 = 2.0
	wave5 = {5.0,
networkFunctions.endFog,
5.0,
{["ebp"] = cp_ork_boy_melee_pro,
["unitAmount"] = 12.0,
["spawnPoints"] = sp_wave5,
["aware"] = true},
8.0,
networkFunctions.ShowWayLeft,
{["ebp"] = cp_ork_boy_ranged_pro,
["unitAmount"] = 3.0,
["spawnPoints"] = sp_wave5_01,
["goto"] = mkr_wave2_bridge,
["aware"] = true},
{["ebp"] = cp_ork_boy_ranged_pro,
["unitAmount"] = 3.0,
["spawnPoints"] = sp_wave4_04,
["goto"] = mkr_wave2_bridge,
["aware"] = true},
{["ebp"] = cp_ork_boy_ranged_pro,
["unitAmount"] = 3.0,
["spawnPoints"] = sp_chaos_09,
["goto"] = mkr_wave2_bridge,
["aware"] = true,
["spawnFX"] = true},
1.0,
{["challenge"] = challengeSet2,
["bonusPoints"] = 2500.0},
networkFunctions.StopShowWayLeft,
12.0,
networkFunctions.ShowWayRight,
{["ebp"] = cp_ork_boy_melee_pro,
["unitAmount"] = 8.0,
["spawnPoints"] = sp_wave5_02,
["goto"] = mkr_dest_02,
["aware"] = true},
2.0,
{["ebp"] = cp_ork_boy_melee_pro,
["unitAmount"] = 8.0,
["spawnPoints"] = sp_wave5_02,
["goto"] = mkr_dest_02,
["aware"] = true},
1.0,
networkFunctions.StopShowWayRight,
{["leftAlive"] = 8.0},
networkFunctions.ShowWayMiddle,
{["ebp"] = cp_ork_boy_melee_pro,
["unitAmount"] = 6.0,
["spawnPoints"] = sp_wave5_03,
["goto"] = mkr_dest_03,
["aware"] = true},
{["ebp"] = cp_ork_boy_melee_pro,
["unitAmount"] = 6.0,
["spawnPoints"] = sp_wave5_03,
["goto"] = mkr_dest_03,
["aware"] = true},
1.0,
networkFunctions.StopShowWayMiddle,
15.0,
networkFunctions.ShowWayRight,
{["ebp"] = cp_ork_boy_ranged_pro,
["unitAmount"] = 4.0,
["spawnPoints"] = sp_wave3_01,
["goto"] = mkr_wave2_bridge,
["aware"] = true},
{["ebp"] = cp_ork_boy_ranged,
["unitAmount"] = 2.0,
["spawnPoints"] = sp_wave5_02,
["goto"] = mkr_wave2_rangepro,
["aware"] = true},
{["ebp"] = cp_ork_boy_ranged,
["unitAmount"] = 2.0,
["spawnPoints"] = sp_wave3_back_01,
["goto"] = mkr_back_01,
["aware"] = true},
1.0,
networkFunctions.StopShowWayRight,
12.0,
{["ebp"] = cp_ork_hardboy,
["unitAmount"] = 4.0,
["spawnPoints"] = sp_wave5_04,
["aware"] = true},
{["ebp"] = cp_ork_boy_melee_pro,
["unitAmount"] = 8.0,
["spawnPoints"] = sp_wave5_04,
["aware"] = true},
12.0,
networkFunctions.ShowWayBackLeft,
{["ebp"] = cp_ork_boy_melee_pro,
["unitAmount"] = 8.0,
["spawnPoints"] = sp_wave5_back_01,
["goto"] = mkr_back_01,
["aware"] = true},
{["ebp"] = cp_ork_nob_melee_pro,
["unitAmount"] = 2.0,
["spawnPoints"] = sp_wave5_back_01,
["goto"] = mkr_back_01,
["aware"] = true},
1.0,
networkFunctions.StopShowWayBackLeft,
12.0,
networkFunctions.ShowWayBackRight,
{["ebp"] = cp_ork_hardboy,
["unitAmount"] = 4.0,
["spawnPoints"] = sp_wave5_back_02,
["goto"] = mkr_back_02,
["aware"] = true},
{["ebp"] = cp_ork_nob_shoota,
["unitAmount"] = 3.0,
["spawnPoints"] = sp_wave5_back_02,
["goto"] = mkr_back_02,
["aware"] = true},
2.0,
networkFunctions.StopShowWayBackRight,
10.0,
--{["leftAlive"] = 20.0},
networkFunctions.ShowWayBackLeft,
{["ebp"] = cp_ork_nob_shoota_pro,
["unitAmount"] = 3.0,
["spawnPoints"] = sp_wave1_03,
["goto"] = mkr_wave2_bridge,
["aware"] = true},
{["ebp"] = cp_ork_boy_melee_pro,
["unitAmount"] = 12.0,
["spawnPoints"] = sp_wave5_back_01,
["goto"] = mkr_back_01,
["aware"] = true},
{["ebp"] = cp_ork_nob_melee_pro,
["unitAmount"] = 3.0,
["spawnPoints"] = sp_wave5_back_01,
["goto"] = mkr_back_01,
["aware"] = true},
2.0,
{["challenge"] = challengeSet3,
["bonusPoints"] = 2500.0},
3.0,
networkFunctions.StopShowWayBackLeft,
networkFunctions.ShowWayBackRight,
{["ebp"] = cp_ork_nob_shoota,
["unitAmount"] = 2.0,
["spawnPoints"] = sp_highAll,
["aware"] = true},
{["ebp"] = cp_ork_nob_shoota,
["unitAmount"] = 2.0,
["spawnPoints"] = sp_highAll,
["aware"] = true},
{["ebp"] = cp_ork_boy_melee_pro,
["unitAmount"] = 12.0,
["spawnPoints"] = sp_wave5_back_02,
["goto"] = mkr_back_02,
["aware"] = true},
{["ebp"] = cp_ork_nob_melee_pro,
["unitAmount"] = 4.0,
["spawnPoints"] = sp_wave5_back_02,
["goto"] = mkr_back_02,
["aware"] = true},
2.0,
networkFunctions.StopShowWayBackRight}
	--mkr_back_01 = 5.0
	--challengeSet3 = 3.0
	--cp_chaos_bloodletter = 5.0
	--cp_chaos_bloodletter = 4.0
	--cp_chaos_bloodletter = 4.0
	--cp_chaos_marine_bolter = 2.0
	--cp_chaos_marine_bolter = 2.0
	--mkr_dest_02 = 5.0
	--cp_chaos_marine_havok_pc = 1.0
	--cp_chaos_marine_havok_pc = 1.0
	--cp_chaos_bloodletter = 6.0
	--cp_chaos_bloodletter = 6.0
	--cp_chaos_bloodletter = 5.0
	--cp_chaos_bloodletter = 5.0
	--cp_chaos_tainted_psyker = 1.0
	--cp_chaos_marine_bolter = 2.0
	--cp_chaos_marine_bolter = 2.0
	--cp_chaos_marine_melee = 1.0
	--cp_chaos_marine_melee = 1.0
	--cp_chaos_marine_melee = 1.0
	--cp_chaos_marine_melee = 1.0
	--mkr_back_02 = 2.0
	--cp_chaos_marine_bolter = 4.0
	--cp_chaos_marine_bolter = 4.0
	--cp_chaos_marine_bolter = 4.0
	--cp_chaos_marine_bolter = 4.0
	--cp_chaos_marine_havok_pc = 1.0
	--cp_chaos_marine_havok_pc = 1.0
	--cp_chaos_marine_havok_pc = 1.0
	--cp_chaos_marine_havok_pc = 1.0
	--cp_chaos_bloodletter = 6.0
	--cp_chaos_bloodletter = 6.0
	--cp_chaos_bloodletter = 6.0
	--cp_chaos_bloodletter = 6.0
	--cp_chaos_marine_bolter = 4.0
	--cp_chaos_marine_bolter = 4.0
	--cp_chaos_marine_bolter = 4.0
	--cp_chaos_marine_bolter = 4.0
	--cp_chaos_marine_melee = 1.0
	--cp_chaos_marine_melee = 1.0
	--cp_chaos_marine_melee = 1.0
	--cp_chaos_marine_melee = 1.0
	--cp_chaos_bloodletter = 7.0
	--cp_chaos_bloodletter = 7.0
	--cp_chaos_bloodletter = 7.0
	--cp_chaos_bloodletter = 7.0
	--cp_chaos_marine_bolter = 5.0
	--cp_chaos_marine_bolter = 5.0
	--cp_chaos_marine_bolter = 5.0
	--cp_chaos_marine_bolter = 5.0
	--cp_chaos_marine_havok_pc = 3.0
	--cp_chaos_marine_havok_pc = 3.0
	--cp_chaos_marine_havok_pc = 3.0
	--cp_chaos_marine_havok_pc = 3.0
	wave6 = {networkFunctions.ChaosFX,
5.0,
networkFunctions.startChaos,
5.0,
networkFunctions.ChaosWave1,
3.0,
{["ebp"] = cp_chaos_bloodletter,
["unitAmount"] = 5.0,
["spawnPoints"] = sp_chaos_01,
["aware"] = true},
{["ebp"] = cp_chaos_bloodletter,
["unitAmount"] = 5.0,
["spawnPoints"] = sp_chaos_02,
["aware"] = true},
8.0,
{["ebp"] = cp_chaos_bloodletter,
["unitAmount"] = 4.0,
["spawnPoints"] = sp_chaos_01,
["aware"] = true},
{["ebp"] = cp_chaos_bloodletter,
["unitAmount"] = 4.0,
["spawnPoints"] = sp_chaos_02,
["aware"] = true},
5.0,
{["ebp"] = cp_chaos_marine_bolter,
["unitAmount"] = 2.0,
["spawnPoints"] = sp_chaos_01,
["aware"] = true},
{["ebp"] = cp_chaos_marine_bolter,
["unitAmount"] = 2.0,
["spawnPoints"] = sp_chaos_02,
["aware"] = true},
{["leftAlive"] = 5.0},
networkFunctions.ChaosWave2,
5.0,
{["ebp"] = cp_chaos_marine_havok_pc,
["unitAmount"] = 1.0,
["spawnPoints"] = sp_chaos_06,
["goto"] = mkr_wave2_bridge,
["aware"] = true},
{["ebp"] = cp_chaos_marine_havok_pc,
["unitAmount"] = 1.0,
["spawnPoints"] = sp_chaos_07,
["goto"] = mkr_wave2_bridge,
["aware"] = true},
5.0,
{["ebp"] = cp_chaos_bloodletter,
["unitAmount"] = 6.0,
["spawnPoints"] = sp_chaos_06,
["aware"] = true},
{["ebp"] = cp_chaos_bloodletter,
["unitAmount"] = 6.0,
["spawnPoints"] = sp_chaos_07,
["aware"] = true},
8.0,
{["ebp"] = cp_chaos_bloodletter,
["unitAmount"] = 5.0,
["spawnPoints"] = sp_chaos_06,
["aware"] = true},
{["ebp"] = cp_chaos_bloodletter,
["unitAmount"] = 5.0,
["spawnPoints"] = sp_chaos_07,
["aware"] = true},
{["leftAlive"] = 5.0},
networkFunctions.ChaosEnd,
3.0,
{["ebp"] = cp_chaos_tainted_psyker,
["unitAmount"] = 1.0,
["spawnPoints"] = mkr_psyker_01,
["aware"] = true,
["spawnFX"] = true,
["groups"] = {"grp_psyker"}},
1.0,
networkFunctions.TeleportPsyker,
1.0,
networkFunctions.ChaosWave3,
1.0,
{["ebp"] = cp_chaos_marine_bolter,
["unitAmount"] = 2.0,
["spawnPoints"] = sp_chaos_08,
["aware"] = true},
{["ebp"] = cp_chaos_marine_bolter,
["unitAmount"] = 2.0,
["spawnPoints"] = sp_chaos_09,
["aware"] = true},
2.0,
networkFunctions.ChaosEnd3,
5.0,
{["ebp"] = cp_chaos_marine_melee,
["unitAmount"] = 1.0,
["spawnPoints"] = sp_chaos_02,
["aware"] = true},
{["ebp"] = cp_chaos_marine_melee,
["unitAmount"] = 1.0,
["spawnPoints"] = sp_chaos_03,
["aware"] = true},
8.0,
{["ebp"] = cp_chaos_marine_melee,
["unitAmount"] = 1.0,
["spawnPoints"] = sp_chaos_04,
["aware"] = true},
{["ebp"] = cp_chaos_marine_melee,
["unitAmount"] = 1.0,
["spawnPoints"] = sp_chaos_05,
["aware"] = true},
{["leftAlive"] = 2.0},
{["ebp"] = cp_chaos_marine_bolter,
["unitAmount"] = 4.0,
["spawnPoints"] = sp_chaos_02,
["aware"] = true},
{["ebp"] = cp_chaos_marine_bolter,
["unitAmount"] = 4.0,
["spawnPoints"] = sp_chaos_03,
["aware"] = true},
10.0,
{["ebp"] = cp_chaos_marine_bolter,
["unitAmount"] = 4.0,
["spawnPoints"] = sp_chaos_04,
["aware"] = true},
{["ebp"] = cp_chaos_marine_bolter,
["unitAmount"] = 4.0,
["spawnPoints"] = sp_chaos_05,
["aware"] = true},
15.0,
{["ebp"] = cp_chaos_marine_havok_pc,
["unitAmount"] = 1.0,
["spawnPoints"] = sp_chaos_02,
["aware"] = true},
{["ebp"] = cp_chaos_marine_havok_pc,
["unitAmount"] = 1.0,
["spawnPoints"] = sp_chaos_03,
["aware"] = true},
{["ebp"] = cp_chaos_marine_havok_pc,
["unitAmount"] = 1.0,
["spawnPoints"] = sp_chaos_04,
["aware"] = true},
{["ebp"] = cp_chaos_marine_havok_pc,
["unitAmount"] = 1.0,
["spawnPoints"] = sp_chaos_05,
["aware"] = true},
{["leftAlive"] = 5.0},
{["ebp"] = cp_chaos_bloodletter,
["unitAmount"] = 6.0,
["spawnPoints"] = sp_chaos_02,
["aware"] = true},
{["ebp"] = cp_chaos_bloodletter,
["unitAmount"] = 6.0,
["spawnPoints"] = sp_chaos_03,
["aware"] = true},
{["ebp"] = cp_chaos_bloodletter,
["unitAmount"] = 6.0,
["spawnPoints"] = sp_chaos_04,
["aware"] = true},
{["ebp"] = cp_chaos_bloodletter,
["unitAmount"] = 6.0,
["spawnPoints"] = sp_chaos_05,
["aware"] = true},
10.0,
{["ebp"] = cp_chaos_marine_bolter,
["unitAmount"] = 4.0,
["spawnPoints"] = sp_chaos_02,
["aware"] = true},
{["ebp"] = cp_chaos_marine_bolter,
["unitAmount"] = 4.0,
["spawnPoints"] = sp_chaos_03,
["aware"] = true},
{["ebp"] = cp_chaos_marine_bolter,
["unitAmount"] = 4.0,
["spawnPoints"] = sp_chaos_04,
["aware"] = true},
{["ebp"] = cp_chaos_marine_bolter,
["unitAmount"] = 4.0,
["spawnPoints"] = sp_chaos_05,
["aware"] = true},
{["leftAlive"] = 2.0},
{["ebp"] = cp_chaos_marine_melee,
["unitAmount"] = 1.0,
["spawnPoints"] = sp_chaos_02,
["aware"] = true},
{["ebp"] = cp_chaos_marine_melee,
["unitAmount"] = 1.0,
["spawnPoints"] = sp_chaos_03,
["aware"] = true},
{["ebp"] = cp_chaos_marine_melee,
["unitAmount"] = 1.0,
["spawnPoints"] = sp_chaos_04,
["aware"] = true},
{["ebp"] = cp_chaos_marine_melee,
["unitAmount"] = 1.0,
["spawnPoints"] = sp_chaos_05,
["aware"] = true},
{["ebp"] = cp_chaos_bloodletter,
["unitAmount"] = 7.0,
["spawnPoints"] = sp_chaos_02,
["aware"] = true},
{["ebp"] = cp_chaos_bloodletter,
["unitAmount"] = 7.0,
["spawnPoints"] = sp_chaos_03,
["aware"] = true},
{["ebp"] = cp_chaos_bloodletter,
["unitAmount"] = 7.0,
["spawnPoints"] = sp_chaos_04,
["aware"] = true},
{["ebp"] = cp_chaos_bloodletter,
["unitAmount"] = 7.0,
["spawnPoints"] = sp_chaos_05,
["aware"] = true},
15.0,
{["ebp"] = cp_chaos_marine_bolter,
["unitAmount"] = 5.0,
["spawnPoints"] = sp_chaos_02,
["aware"] = true},
{["ebp"] = cp_chaos_marine_bolter,
["unitAmount"] = 5.0,
["spawnPoints"] = sp_chaos_03,
["aware"] = true},
{["ebp"] = cp_chaos_marine_bolter,
["unitAmount"] = 5.0,
["spawnPoints"] = sp_chaos_04,
["aware"] = true},
{["ebp"] = cp_chaos_marine_bolter,
["unitAmount"] = 5.0,
["spawnPoints"] = sp_chaos_05,
["aware"] = true},
15.0,
{["ebp"] = cp_chaos_marine_havok_pc,
["unitAmount"] = 3.0,
["spawnPoints"] = sp_chaos_02,
["aware"] = true},
{["ebp"] = cp_chaos_marine_havok_pc,
["unitAmount"] = 3.0,
["spawnPoints"] = sp_chaos_03,
["aware"] = true},
10.0,
{["ebp"] = cp_chaos_marine_havok_pc,
["unitAmount"] = 3.0,
["spawnPoints"] = sp_chaos_04,
["aware"] = true},
{["ebp"] = cp_chaos_marine_havok_pc,
["unitAmount"] = 3.0,
["spawnPoints"] = sp_chaos_05,
["aware"] = true}}

	COOP_RegisterWaves(wave1, wave2, wave3, wave4, wave5, wave6)
end

function MissionStart()
	grp_psyker = Group_Create("grp_psyker")
	Coop_SetWorldObjectVisible("chaos_sky", false)
	Coop_SetLayerLightsEnabled("L_Lights_Chaos", false)
	COOP_StartWaves(trig_start)
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

networkFunctions.startChaos = function ()
	Coop_SetWorldObjectVisible("chaos_sky", true)
	Coop_SetWorldObjectVisible("day_sky", false)
	World_EnvironmentRegionSetEnabled("_globalEnvReg_Chaos", true)
	World_EnvironmentRegionSetEnabled("globalEnvReg_Main", false)
	Coop_SetLayerLightsEnabled("L_Lights", false)
	Coop_SetLayerLightsEnabled("L_Lights_Chaos", true)
	Coop_SetLayerFXEnabled("L_Lights", false)
	Marker_StopFX(amb_god_ray_thick_05)
	Marker_StopFX(amb_god_ray_thick_06)
	Marker_StopFX(amb_god_ray_thick_07)
	Marker_StopFX(amb_god_ray_thick_08)
	Marker_StopFX(amb_god_ray_thick_09)
	Marker_StopFX(amb_god_ray_thick_10)
	Marker_StopFX(amb_god_ray_thick_11)
	Marker_StopFX(amb_god_ray_thick_12)
	Marker_StopFX(amb_god_ray_thick_14)
	Marker_StopFX(amb_god_ray_thick_15)
	Marker_StopFX(amb_god_ray_thick_16)
	Marker_PlayFX(warp_gate_huge)
	Marker_PlayFX(amb_sand_ground_05)
	Marker_PlayFX(amb_sand_ground_06)
	Marker_PlayFX(amb_sand_ground_07)
	Marker_PlayFX(amb_sand_ground_08)
	Marker_PlayFX(amb_sand_ground_09)
end

networkFunctions.ChaosFX = function ()
	Marker_PlayFX(amb_chaos_lightning_whip_01)
	Marker_PlayFX(amb_chaos_lightning_whip_02)
	Marker_PlayFX(amb_chaos_lightning_whip_03)
	Marker_PlayFX(amb_chaos_lightning_whip_04)
	Marker_PlayFX(amb_chaos_lightning_whip_05)
	Marker_PlayFX(amb_chaos_lightning_whip_06)
	Marker_PlayFX(amb_chaos_lightning_whip_07)
end

networkFunctions.ChaosWave1 = function ()
	Marker_PlayFX(fx_portal_01)
	Marker_PlayFX(fx_portal_02)
end

networkFunctions.ChaosWave2 = function ()
	Marker_StopFX(fx_portal_01)
	Marker_StopFX(fx_portal_02)
	Marker_PlayFX(fx_portal_06)
	Marker_PlayFX(fx_portal_07)
end

networkFunctions.ChaosEnd = function ()
	Marker_StopFX(fx_portal_06)
	Marker_StopFX(fx_portal_07)
	Marker_PlayFX(fx_portal_02)
	Marker_PlayFX(fx_portal_03)
	Marker_PlayFX(fx_portal_04)
	Marker_PlayFX(fx_portal_05)
end

networkFunctions.ChaosWave3 = function ()
	Marker_PlayFX(fx_portal_08)
	Marker_PlayFX(fx_portal_09)
end

networkFunctions.ChaosEnd3 = function ()
	Marker_StopFX(fx_portal_08)
	Marker_StopFX(fx_portal_09)
end

networkFunctions.PsykerFirstActSpawnIn = function ()
	Group_SpawnEntities(grp_psyker, cp_chaos_tainted_psyker.bp, mkr_psyker_01, 1.0)
	Weirdboy_TeleportToPoint(grp_psyker, mkr_psyker_01, true)
	Event_AddTimer(networkFunctions.PsykerFirstActDisappear, 4.0, false)
end

networkFunctions.PsykerFirstActDisappear = function ()
	Weirdboy_TeleportToPoint(grp_psyker, mkr_psyker_02, false)
	Event_AddTimer(networkFunctions.PsykerFirstActKill, 4.0, false)
end

networkFunctions.PsykerSecondActSpawnIn = function ()
	Group_SpawnEntities(grp_psyker, cp_chaos_tainted_psyker.bp, mkr_weirdboy_06, 1.0)
	Weirdboy_TeleportToPoint(grp_psyker, mkr_psyker_03, true)
	Event_AddTimer(networkFunctions.PsykerFirstActDisappear, 3.0, false)
end

networkFunctions.PsykerThirdActSpawnIn = function ()
	Group_SpawnEntities(grp_psyker, cp_chaos_tainted_psyker.bp, mkr_weirdboy_06, 1.0)
	Weirdboy_TeleportToPoint(grp_psyker, mkr_psyker_04, true)
	Event_AddTimer(networkFunctions.PsykerFirstActDisappear, 3.0, false)
end

networkFunctions.PsykerFourthActSpawnIn = function ()
	Group_SpawnEntities(grp_psyker, cp_chaos_tainted_psyker.bp, mkr_weirdboy_06, 1.0)
	Weirdboy_TeleportToPoint(grp_psyker, mkr_psyker_05, true)
	Event_AddTimer(networkFunctions.PsykerFirstActDisappear, 3.0, false)
end

networkFunctions.PsykerFirstActKill = function ()
	Group_Kill(grp_psyker)
end

networkFunctions.TeleportPsyker = function ()
	Event_AddTimer(networkFunctions.TeleportPsykerAround, 8.0, true)
end

networkFunctions.TeleportPsykerAround = function (arg0)
	local var0, var1
	var0 = Group_Count(grp_psyker)
	if 0.0 < var0 then
		grp_psyker = 1.0
		var1 = Util_GetRandomNumber(grp_psyker, 5.0)
		if var1 == 1.0 then
			Psyker_TeleportToPoint(grp_psyker, mkr_psyker_01, 8.0)
		end
		if var1 == 2.0 then
			Psyker_TeleportToPoint(grp_psyker, mkr_psyker_02, 8.0)
		end
		if var1 == 3.0 then
			Psyker_TeleportToPoint(grp_psyker, mkr_psyker_03, 8.0)
		end
		if var1 == 4.0 then
			Psyker_TeleportToPoint(grp_psyker, mkr_psyker_04, 8.0)
		end
		Psyker_TeleportToPoint(grp_psyker, mkr_psyker_05, 8.0)
	end
	Event_Remove(arg0)
end

function Psyker_TeleportToPoint(arg0, arg1, arg2)
	local var0 = Group_Create("")
	Group_TriggerAnimationEvent(arg0, "EVT_TeleportOut")
	Group_SpawnEntities(var0, "ebps\\race_chaos\\fx\\psyker_teleportin", arg1, 1.0)
	local var1 = Group_Count(arg0)
	if 0.0 < var1 then
		Entity_ResetAnimationGraph(Group_GetEntityAt(arg0, 1.0))
	end
	Group_WarpToPosition(arg0, arg1)
	Group_Dealloc(var0)
end

networkFunctions.Teleport = function (arg0, arg1)
	local var0
	var0 = Group_Create("")
	Group_TriggerAnimationEvent(arg1.group, "TeleportOut")
	Group_SpawnEntities(var0, "ebps\\race_chaos\\fx\\psyker_teleportin", arg1.location, 1.0)
	Group_WarpToPosition(arg1.group, arg1.location)
	Group_Dealloc(var0)
end

networkFunctions.ShowWayLeft = function ()
	Marker_PlayFX(mkr_explosionWay_01_Left)
end

networkFunctions.StopShowWayLeft = function ()
	Marker_StopFX(mkr_explosionWay_01_Left)
end

networkFunctions.ShowWayRight = function ()
	Marker_PlayFX(mkr_explosionWay_01_Right)
end

networkFunctions.StopShowWayRight = function ()
	Marker_StopFX(mkr_explosionWay_01_Right)
end

networkFunctions.ShowWayBackLeft = function ()
	Marker_PlayFX(mkr_explosionWay_01_BackLeft)
end

networkFunctions.StopShowWayBackLeft = function ()
	Marker_StopFX(mkr_explosionWay_01_BackLeft)
end

networkFunctions.ShowWayBackRight = function ()
	Marker_PlayFX(mkr_explosionWay_01_BackRight)
end

networkFunctions.StopShowWayBackRight = function ()
	Marker_StopFX(mkr_explosionWay_01_BackRight)
end

networkFunctions.ShowWayMiddle = function ()
	Marker_PlayFX(mkr_explosionWay_01_Middle)
end

networkFunctions.StopShowWayMiddle = function ()
	Marker_StopFX(mkr_explosionWay_01_Middle)
end