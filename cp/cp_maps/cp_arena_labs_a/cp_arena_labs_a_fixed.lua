require("Util/Common")
require("Util/Scarutil")
require("Util/MissionTask")
require("Util/CP/CP_Common")
require("Util/CP/CP_Func")

multiplayer.assets.csp_alarm = nil
multiplayer.objectiveData = {
}
arenaNum = 2.0
thisArena = "cp_arena_labs_a"
arenaExit = "mkr_labs_a_exit"
nextArena = "cp_arena_labs_e"
nextArenaEnter = "mkr_labs_e_entrance"

function MissionStartNetwork() --f_0
	InitLuaSafe()
	
	sp_low = {sp_low_01}
	sp_lowSet2 = {sp_low_03}
	sp_lowAll = {sp_low_01,
sp_low_02,
sp_low_03}
	sp_high = {sp_high_01}
	sp_highSet2 = {sp_high_03}
	sp_highAll = {sp_high_01,
sp_high_02,
sp_high_03}
	sp_door = {sp_door_01}
	sp_doorSet2 = {sp_door_03}
	sp_pipe = {sp_pipe_01}
	sp_pipeSet2 = {sp_pipe_03}
	sp_mid = {sp_mid_01}
	sp_east = {sp_door_02,
sp_mid_02}
	sp_west = {sp_door_01,
sp_mid_01}

	challengeSet1 = {{["challengeType"] = ch_speedKill,
["timeLimit"] = 25.0,
["targetAmount"] = 15.0},
{["challengeType"] = ch_selectiveKill,
["timeLimit"] = 15.0,
["targetAmount"] = 4.0,
["unitType"] = cp_ork_boy_melee},
{["challengeType"] = ch_selectiveKill,
["timeLimit"] = 20.0,
["targetAmount"] = 10.0,
["unitType"] = cp_ork_gretchin},
{["challengeType"] = ch_ballHog,
["timeLimit"] = 20.0,
["targetAmount"] = 5.0},
{["challengeType"] = ch_sychronizedKill,
["timeLimit"] = 15.0,
["targetAmount"] = 5.0}}
	challengeSet2 = {{["challengeType"] = ch_speedKill,
["timeLimit"] = 25.0,
["targetAmount"] = 15.0},
{["challengeType"] = ch_selectiveKill,
["timeLimit"] = 20.0,
["targetAmount"] = 10.0,
["unitType"] = cp_ork_boy_melee},
{["challengeType"] = ch_selectiveKill,
["timeLimit"] = 15.0,
["targetAmount"] = 5.0,
["unitType"] = cp_ork_boy_melee_pro},
{["challengeType"] = ch_ballHog,
["timeLimit"] = 25.0,
["targetAmount"] = 6.0},
{["challengeType"] = ch_sychronizedKill,
["timeLimit"] = 20.0,
["targetAmount"] = 10.0}}
	challengeSet3 = {{["challengeType"] = ch_speedKill,
["timeLimit"] = 25.0,
["targetAmount"] = 10.0},
{["challengeType"] = ch_selectiveKill,
["timeLimit"] = 20.0,
["targetAmount"] = 5.0,
["unitType"] = cp_ork_squig_bomb},
{["challengeType"] = ch_selectiveKill,
["timeLimit"] = 15.0,
["targetAmount"] = 3.0,
["unitType"] = cp_ork_boy_ranged},
{["challengeType"] = ch_ballHog,
["timeLimit"] = 20.0,
["targetAmount"] = 6.0}}

	--sp_highAll = 10.0
	--sp_lowAll = 10.0
	--sp_highAll = 15.0
	--sp_highAll = 25.0
	Wave4_Loop = {{["ebp"] = cp_ork_boy_melee,
["unitAmount"] = 10.0,
["spawnPoints"] = sp_highAll,
["aware"] = true,
["playSoundFX"] = true},
{["ebp"] = cp_ork_boy_melee_pro,
["unitAmount"] = 3.0,
["spawnPoints"] = sp_highAll,
["aware"] = true},
10.0,
{["ebp"] = cp_ork_boy_melee,
["unitAmount"] = 10.0,
["spawnPoints"] = sp_lowAll,
["aware"] = true},
{["ebp"] = cp_ork_boy_melee_pro,
["unitAmount"] = 3.0,
["spawnPoints"] = sp_lowAll,
["aware"] = true},
10.0,
{["ebp"] = cp_ork_boy_melee,
["unitAmount"] = 10.0,
["spawnPoints"] = sp_highAll,
["aware"] = true},
{["ebp"] = cp_ork_boy_melee_pro,
["unitAmount"] = 3.0,
["spawnPoints"] = sp_highAll,
["aware"] = true},
15.0,
{["ebp"] = cp_ork_boy_melee_pro,
["unitAmount"] = 3.0,
["spawnPoints"] = sp_high_01,
["aware"] = true},
{["ebp"] = cp_ork_boy_melee_pro,
["unitAmount"] = 3.0,
["spawnPoints"] = sp_high_02,
["aware"] = true},
{["ebp"] = cp_ork_boy_melee_pro,
["unitAmount"] = 3.0,
["spawnPoints"] = sp_high_03,
["aware"] = true},
{["ebp"] = cp_ork_boy_melee_pro,
["unitAmount"] = 3.0,
["spawnPoints"] = sp_high_04,
["aware"] = true},
{["ebp"] = cp_ork_boy_melee,
["unitAmount"] = 3.0,
["spawnPoints"] = sp_high_01,
["aware"] = true},
{["ebp"] = cp_ork_boy_melee,
["unitAmount"] = 3.0,
["spawnPoints"] = sp_high_02,
["aware"] = true},
{["ebp"] = cp_ork_boy_melee,
["unitAmount"] = 3.0,
["spawnPoints"] = sp_high_03,
["aware"] = true},
{["ebp"] = cp_ork_boy_melee,
["unitAmount"] = 3.0,
["spawnPoints"] = sp_high_04,
["aware"] = true},
{["ebp"] = cp_ork_boy_ranged,
["unitAmount"] = 4.0,
["spawnPoints"] = sp_highAll,
["aware"] = true},
25.0}
	--sp_low_01 = 2.0
	--challengeSet1 = 3.0
	--sp_low_02 = 2.0
	--sp_low_02 = 8.0
	--sp_low = 2.0
	--sp_low = 3.0
	--sp_low = 2.0
	--sp_low = 3.0
	--sp_high = 3.0
	--sp_high = 2.0
	wave1 = {8.0,
{["ebp"] = cp_ork_gretchin,
["unitAmount"] = 8.0,
["spawnPoints"] = sp_low_01,
["aware"] = true},
{["ebp"] = cp_ork_boy_melee,
["unitAmount"] = 4.0,
["spawnPoints"] = sp_low_01,
["aware"] = true,
["playSoundFX"] = true},
2.0,
{["challenge"] = challengeSet1,
["bonusPoints"] = 2500.0},
3.0,
{["ebp"] = cp_ork_gretchin,
["unitAmount"] = 8.0,
["spawnPoints"] = sp_low_02,
["aware"] = true},
2.0,
{["ebp"] = cp_ork_boy_melee,
["unitAmount"] = 4.0,
["spawnPoints"] = sp_low_02,
["aware"] = true},
8.0,
{["ebp"] = cp_ork_gretchin,
["unitAmount"] = 10.0,
["spawnPoints"] = sp_low,
["aware"] = true},
2.0,
{["ebp"] = cp_ork_boy_melee,
["unitAmount"] = 6.0,
["spawnPoints"] = sp_low,
["aware"] = true},
3.0,
{["ebp"] = cp_ork_boy_melee,
["unitAmount"] = 6.0,
["spawnPoints"] = sp_low,
["aware"] = true},
{["leftAlive"] = 4.0},
{["ebp"] = cp_ork_gretchin,
["unitAmount"] = 15.0,
["spawnPoints"] = sp_low,
["aware"] = true},
2.0,
{["ebp"] = cp_ork_boy_melee,
["unitAmount"] = 8.0,
["spawnPoints"] = sp_low,
["aware"] = true},
3.0,
{["ebp"] = cp_ork_boy_melee,
["unitAmount"] = 15.0,
["spawnPoints"] = sp_high,
["aware"] = true},
3.0,
{["ebp"] = cp_ork_boy_melee,
["unitAmount"] = 10.0,
["spawnPoints"] = sp_mid_01,
["aware"] = true},
{["leftAlive"] = 4.0},
{["ebp"] = cp_ork_gretchin,
["unitAmount"] = 8.0,
["spawnPoints"] = sp_low,
["aware"] = true},
{["ebp"] = cp_ork_gretchin,
["unitAmount"] = 8.0,
["spawnPoints"] = sp_high,
["aware"] = true},
2.0,
{["ebp"] = cp_ork_boy_melee,
["unitAmount"] = 7.0,
["spawnPoints"] = sp_low,
["aware"] = true},
{["ebp"] = cp_ork_boy_melee,
["unitAmount"] = 7.0,
["spawnPoints"] = sp_low,
["aware"] = true}}
	--sp_high = 5.0
	--sp_high = 2.0
	--mkr_north_hold_02 = 3.0
	--sp_high = 8.0
	--sp_door = 8.0
	--sp_highSet2 = 5.0
	--sp_highSet2 = 2.0
	--mkr_south_hold_02 = 3.0
	--sp_highSet2 = 8.0
	--sp_doorSet2 = 8.0
	wave2 = {5.0,
{["ebp"] = cp_ork_boy_ranged,
["unitAmount"] = 4.0,
["spawnPoints"] = sp_high,
["aware"] = true,
["playSoundFX"] = true},
5.0,
{["ebp"] = cp_ork_boy_ranged_grenade,
["unitAmount"] = 4.0,
["spawnPoints"] = sp_high,
["aware"] = true},
2.0,
{["ebp"] = cp_ork_boy_ranged_pro,
["unitAmount"] = 1.0,
["spawnPoints"] = sp_high_01,
["hold"] = mkr_north_hold_01,
["aware"] = true},
{["ebp"] = cp_ork_boy_ranged_pro,
["unitAmount"] = 1.0,
["spawnPoints"] = sp_high_02,
["hold"] = mkr_north_hold_02,
["aware"] = true},
3.0,
{["ebp"] = cp_ork_boy_ranged,
["unitAmount"] = 6.0,
["spawnPoints"] = sp_high,
["aware"] = true},
8.0,
{["ebp"] = cp_ork_boy_ranged_grenade,
["unitAmount"] = 4.0,
["spawnPoints"] = sp_door,
["aware"] = true},
8.0,
{["ebp"] = cp_ork_boy_ranged_pro,
["unitAmount"] = 2.0,
["spawnPoints"] = sp_door_01,
["aware"] = true},
{["ebp"] = cp_ork_boy_ranged_pro,
["unitAmount"] = 2.0,
["spawnPoints"] = sp_door_02,
["aware"] = true},
{["leftAlive"] = 4.0},
5.0,
{["ebp"] = cp_ork_boy_ranged,
["unitAmount"] = 6.0,
["spawnPoints"] = sp_highSet2,
["aware"] = true},
5.0,
{["ebp"] = cp_ork_boy_ranged_grenade,
["unitAmount"] = 4.0,
["spawnPoints"] = sp_highSet2,
["aware"] = true},
2.0,
{["ebp"] = cp_ork_boy_ranged_pro,
["unitAmount"] = 2.0,
["spawnPoints"] = sp_high_03,
["hold"] = mkr_south_hold_01,
["aware"] = true},
{["ebp"] = cp_ork_boy_ranged_pro,
["unitAmount"] = 2.0,
["spawnPoints"] = sp_high_04,
["hold"] = mkr_south_hold_02,
["aware"] = true},
3.0,
{["ebp"] = cp_ork_boy_ranged,
["unitAmount"] = 6.0,
["spawnPoints"] = sp_highSet2,
["aware"] = true},
8.0,
{["ebp"] = cp_ork_boy_ranged_grenade,
["unitAmount"] = 4.0,
["spawnPoints"] = sp_doorSet2,
["aware"] = true},
8.0,
{["ebp"] = cp_ork_boy_ranged_pro,
["unitAmount"] = 2.0,
["spawnPoints"] = sp_door_03,
["aware"] = true},
{["ebp"] = cp_ork_boy_ranged_pro,
["unitAmount"] = 2.0,
["spawnPoints"] = sp_door_04,
["aware"] = true}}
	--Wave4_Loop = 1.0

	wave3 = {5.0,
{["capturePoint"] = mkr_cp_01,
["awardPoints"] = 2000.0,
["waveBlocker"] = true,
["loopingSpawns"] = Wave4_Loop,
["duration"] = 90.0,
["timeLimit"] = 180.0,
["loseAfterTimeOut"] = true},
1.0,
{["ebp"] = cp_ork_boy_melee,
["unitAmount"] = 1.0,
["spawnPoints"] = sp_highAll,
["aware"] = true,
["playSoundFX"] = true}}

	--sp_high = 5.0
	--sp_pipeSet2 = 15.0
	--sp_lowSet2 = 5.0
	--mkr_north_hold_03 = 5.0
	--sp_highAll = 15.0
	--mkr_south_hold_03 = 5.0
	--sp_mid_02 = 2.0
	wave4 = {5.0,
{["ebp"] = cp_ork_boy_melee,
["unitAmount"] = 6.0,
["spawnPoints"] = sp_pipe,
["aware"] = true},
{["ebp"] = cp_ork_boy_melee,
["unitAmount"] = 6.0,
["spawnPoints"] = sp_pipeSet2,
["aware"] = true},
{["ebp"] = cp_ork_boy_melee_pro,
["unitAmount"] = 2.0,
["spawnPoints"] = sp_high,
["aware"] = true},
{["ebp"] = cp_ork_boy_melee_pro,
["unitAmount"] = 2.0,
["spawnPoints"] = sp_highSet2,
["aware"] = true},
{["leftAlive"] = 4.0},
2.0,
{["challenge"] = challengeSet2,
["bonusPoints"] = 2500.0},
{["ebp"] = cp_ork_boy_melee,
["unitAmount"] = 8.0,
["spawnPoints"] = sp_low,
["aware"] = true},
{["ebp"] = cp_ork_boy_melee,
["unitAmount"] = 8.0,
["spawnPoints"] = sp_high,
["aware"] = true},
{["ebp"] = cp_ork_boy_melee_pro,
["unitAmount"] = 4.0,
["spawnPoints"] = sp_low,
["aware"] = true},
{["ebp"] = cp_ork_boy_melee_pro,
["unitAmount"] = 4.0,
["spawnPoints"] = sp_high,
["aware"] = true},
5.0,
{["ebp"] = cp_ork_boy_ranged_pro,
["unitAmount"] = 3.0,
["spawnPoints"] = sp_pipe,
["aware"] = true},
{["ebp"] = cp_ork_boy_ranged_pro,
["unitAmount"] = 3.0,
["spawnPoints"] = sp_pipeSet2,
["aware"] = true},
15.0,
{["ebp"] = cp_ork_boy_melee,
["unitAmount"] = 6.0,
["spawnPoints"] = sp_low,
["aware"] = true},
{["ebp"] = cp_ork_boy_melee,
["unitAmount"] = 6.0,
["spawnPoints"] = sp_lowSet2,
["aware"] = true},
{["ebp"] = cp_ork_boy_melee_pro,
["unitAmount"] = 4.0,
["spawnPoints"] = sp_low,
["aware"] = true},
{["ebp"] = cp_ork_boy_melee_pro,
["unitAmount"] = 4.0,
["spawnPoints"] = sp_lowSet2,
["aware"] = true},
5.0,
{["ebp"] = cp_ork_boy_ranged_pro,
["unitAmount"] = 3.0,
["spawnPoints"] = sp_pipe,
["aware"] = true},
{["ebp"] = cp_ork_boy_ranged_pro,
["unitAmount"] = 3.0,
["spawnPoints"] = sp_pipeSet2,
["aware"] = true},
{["leftAlive"] = 4.0},
{["ebp"] = cp_ork_nob_shoota,
["unitAmount"] = 2.0,
["spawnPoints"] = sp_high,
["hold"] = mkr_north_hold_03,
["aware"] = true},
5.0,
{["ebp"] = cp_ork_boy_ranged_grenade,
["unitAmount"] = 6.0,
["spawnPoints"] = sp_high,
["aware"] = true},
{["ebp"] = cp_ork_boy_ranged_pro,
["unitAmount"] = 4.0,
["spawnPoints"] = sp_high,
["aware"] = true},
{["ebp"] = cp_ork_boy_ranged_pro,
["unitAmount"] = 2.0,
["spawnPoints"] = sp_low,
["aware"] = true},
{["ebp"] = cp_ork_boy_melee,
["unitAmount"] = 6.0,
["spawnPoints"] = sp_lowAll,
["aware"] = true},
{["ebp"] = cp_ork_boy_melee_pro,
["unitAmount"] = 4.0,
["spawnPoints"] = sp_highAll,
["aware"] = true},
15.0,
{["ebp"] = cp_ork_nob_shoota,
["unitAmount"] = 2.0,
["spawnPoints"] = sp_highSet2,
["hold"] = mkr_south_hold_03,
["aware"] = true},
5.0,
{["ebp"] = cp_ork_boy_ranged_grenade,
["unitAmount"] = 6.0,
["spawnPoints"] = sp_highSet2,
["aware"] = true},
{["ebp"] = cp_ork_boy_ranged_pro,
["unitAmount"] = 4.0,
["spawnPoints"] = sp_highSet2,
["aware"] = true},
{["ebp"] = cp_ork_boy_melee,
["unitAmount"] = 6.0,
["spawnPoints"] = sp_highAll,
["aware"] = true},
{["leftAlive"] = 4.0},
{["ebp"] = cp_ork_boy_melee_pro,
["unitAmount"] = 6.0,
["spawnPoints"] = sp_highAll,
["aware"] = true},
{["ebp"] = cp_ork_boy_melee_pro,
["unitAmount"] = 3.0,
["spawnPoints"] = sp_low_01,
["aware"] = true},
{["ebp"] = cp_ork_boy_melee_pro,
["unitAmount"] = 3.0,
["spawnPoints"] = sp_low_02,
["aware"] = true},
{["ebp"] = cp_ork_boy_melee_pro,
["unitAmount"] = 3.0,
["spawnPoints"] = sp_mid_01,
["aware"] = true},
{["ebp"] = cp_ork_boy_melee_pro,
["unitAmount"] = 3.0,
["spawnPoints"] = sp_mid_02,
["aware"] = true},
2.0,
{["ebp"] = cp_ork_nob_melee,
["unitAmount"] = 1.0,
["spawnPoints"] = sp_low_01,
["aware"] = true},
{["ebp"] = cp_ork_nob_melee,
["unitAmount"] = 1.0,
["spawnPoints"] = sp_low_02,
["aware"] = true},
{["ebp"] = cp_ork_nob_melee,
["unitAmount"] = 1.0,
["spawnPoints"] = sp_mid_01,
["aware"] = true},
{["ebp"] = cp_ork_nob_melee,
["unitAmount"] = 1.0,
["spawnPoints"] = sp_mid_02,
["aware"] = true}}
	--sp_cont_06 = 0.5
	--sp_pipeSet2 = 0.5
	--sp_cont_04 = 0.5
	--sp_cont_09 = 0.10000000149011612
	--sp_cont_13 = 0.5
	--mkr_north_hold_03 = 0.5
	--sp_cont_05 = 0.10000000149011612
	--sp_cont_04 = 0.15000000596046448
	--sp_cont_04 = 0.25
	--sp_cont_06 = 0.5
	--sp_cont_05 = 1.0
	--sp_cont_09 = 6.0
	--sp_cont_04 = 3.0
	--sp_cont_04 = 3.0
	--sp_cont_06 = 3.0
	--sp_high = 3.0
	--sp_highSet2 = 3.0
	--sp_high_04 = 4.0
	--sp_high_03 = 4.0
	--sp_high_04 = 3.0
	--sp_cont_01 = 1.0
	--sp_highAll = 1.0
	--sp_high_02 = 5.0
	--sp_high_02 = 8.0
	--sp_highAll = 3.0
	--cp_ork_squig_bomb = 1.0
	--cp_ork_squig_bomb = 1.0
	--cp_ork_squig_bomb = 1.0
	--cp_ork_squig_bomb = 1.0
	--cp_ork_squig_bomb = 1.0
	--cp_ork_squig_bomb = 1.0
	--cp_ork_squig_bomb = 3.0
	--sp_high = "squigCont_08"
	--sp_high = 0.5
	--cp_ork_squig_bomb = 1.0
	--sp_high_04 = "squigCont_07"
	--sp_high_04 = 0.5
	--cp_ork_squig_bomb = 1.0
	--cp_ork_squig_bomb = 1.0
	--cp_ork_squig_bomb = 1.0
	--cp_ork_squig_bomb = 1.0
	--cp_ork_squig_bomb = 1.0
	--cp_ork_squig_bomb = 1.0
	--cp_ork_squig_bomb = 1.0
	--cp_ork_squig_bomb = 1.0
	--cp_ork_squig_bomb = 1.0
	--cp_ork_squig_bomb = 1.0
	--cp_ork_squig_bomb = 1.0
	--sp_high_02 = 0.5
	--cp_ork_squig_bomb = 1.0
	--cp_ork_squig_bomb = 1.0
	--cp_ork_squig_bomb = 1.0
	--cp_ork_squig_bomb = 1.0
	--cp_ork_squig_bomb = 1.0
	--cp_ork_squig_bomb = 1.0
	wave5 = {5.0,
networkFunctions.startFog,
3.0,
networkFunctions.speechAlarm,
3.0,
networkFunctions.squigCont_09,
0.25,
networkFunctions.squigCont_04,
0.10000000149011612,
networkFunctions.squigCont_06,
0.20000000298023224,
networkFunctions.squigCont_11,
{["ebp"] = cp_ork_squig_bomb,
["unitAmount"] = 1.0,
["spawnPoints"] = sp_cont_06,
["aware"] = true},
0.5,
networkFunctions.squigCont_13,
0.5,
{["ebp"] = cp_ork_squig_bomb,
["unitAmount"] = 1.0,
["spawnPoints"] = sp_cont_13,
["aware"] = true},
{["ebp"] = cp_ork_squig_bomb,
["unitAmount"] = 1.0,
["spawnPoints"] = sp_cont_11,
["aware"] = true},
{["ebp"] = cp_ork_squig_bomb,
["unitAmount"] = 1.0,
["spawnPoints"] = sp_cont_04,
["aware"] = true},
0.5,
{["ebp"] = cp_ork_squig_bomb,
["unitAmount"] = 1.0,
["spawnPoints"] = sp_cont_09,
["aware"] = true},
0.10000000149011612,
{["ebp"] = cp_ork_squig_bomb,
["unitAmount"] = 1.0,
["spawnPoints"] = sp_cont_13,
["aware"] = true},
0.5,
networkFunctions.squigCont_05,
0.5,
{["ebp"] = cp_ork_squig_bomb,
["unitAmount"] = 1.0,
["spawnPoints"] = sp_cont_05,
["aware"] = true},
0.10000000149011612,
{["ebp"] = cp_ork_squig_bomb,
["unitAmount"] = 1.0,
["spawnPoints"] = sp_cont_11,
["aware"] = true},
{["ebp"] = cp_ork_squig_bomb,
["unitAmount"] = 1.0,
["spawnPoints"] = sp_cont_04,
["aware"] = true},
0.15000000596046448,
{["ebp"] = cp_ork_squig_bomb,
["unitAmount"] = 1.0,
["spawnPoints"] = sp_cont_04,
["aware"] = true},
0.25,
{["ebp"] = cp_ork_squig_bomb,
["unitAmount"] = 1.0,
["spawnPoints"] = sp_cont_06,
["aware"] = true},
0.5,
1.0,
{["ebp"] = cp_ork_squig_bomb,
["unitAmount"] = 1.0,
["spawnPoints"] = sp_cont_05,
["aware"] = true},
1.0,
{["ebp"] = cp_ork_squig_bomb,
["unitAmount"] = 1.0,
["spawnPoints"] = sp_cont_09,
["aware"] = true},
6.0,
{["ebp"] = cp_ork_squig_bomb,
["unitAmount"] = 1.0,
["spawnPoints"] = sp_cont_04,
["aware"] = true},
3.0,
{["ebp"] = cp_ork_squig_bomb,
["unitAmount"] = 1.0,
["spawnPoints"] = sp_cont_04,
["aware"] = true},
3.0,
{["ebp"] = cp_ork_squig_bomb,
["unitAmount"] = 1.0,
["spawnPoints"] = sp_cont_06,
["aware"] = true},
3.0,
{["ebp"] = cp_ork_boy_ranged,
["unitAmount"] = 6.0,
["spawnPoints"] = sp_high,
["aware"] = true},
3.0,
{["ebp"] = cp_ork_boy_ranged,
["unitAmount"] = 6.0,
["spawnPoints"] = sp_highSet2,
["aware"] = true},
--nil,
{["ebp"] = cp_ork_squig_bomb,
["unitAmount"] = 2.0,
["spawnPoints"] = sp_high_04,
["aware"] = true},
4.0,
{["ebp"] = cp_ork_squig_bomb,
["unitAmount"] = 2.0,
["spawnPoints"] = sp_high_03,
["aware"] = true},
4.0,
{["ebp"] = cp_ork_squig_bomb,
["unitAmount"] = 1.0,
["spawnPoints"] = sp_high_04,
["aware"] = true},
3.0,
networkFunctions.squigCont_01,
0.5,
{["ebp"] = cp_ork_squig_bomb,
["unitAmount"] = 1.0,
["spawnPoints"] = sp_cont_01,
["aware"] = true},
1.0,
{["ebp"] = cp_ork_squig_bomb,
["unitAmount"] = 1.0,
["spawnPoints"] = sp_cont_01,
["aware"] = true},
{["leftAlive"] = 2.0},
8.0,
{["ebp"] = cp_ork_boy_ranged,
["unitAmount"] = 3.0,
["spawnPoints"] = sp_highAll,
["aware"] = true},
1.0,
{["challenge"] = challengeSet3,
["bonusPoints"] = 2500.0},
{["ebp"] = cp_ork_squig_bomb,
["unitAmount"] = 3.0,
["spawnPoints"] = sp_high_03,
["aware"] = true},
{["ebp"] = cp_ork_squig_bomb,
["unitAmount"] = 3.0,
["spawnPoints"] = sp_high_04,
["aware"] = true},
{["ebp"] = cp_ork_squig_bomb,
["unitAmount"] = 3.0,
["spawnPoints"] = sp_high_01,
["aware"] = true},
{["ebp"] = cp_ork_squig_bomb,
["unitAmount"] = 3.0,
["spawnPoints"] = sp_high_02,
["aware"] = true},
5.0,
{["ebp"] = cp_ork_squig_bomb,
["unitAmount"] = 3.0,
["spawnPoints"] = sp_high_03,
["aware"] = true},
{["ebp"] = cp_ork_squig_bomb,
["unitAmount"] = 3.0,
["spawnPoints"] = sp_high_04,
["aware"] = true},
{["ebp"] = cp_ork_squig_bomb,
["unitAmount"] = 3.0,
["spawnPoints"] = sp_high_01,
["aware"] = true},
{["ebp"] = cp_ork_squig_bomb,
["unitAmount"] = 3.0,
["spawnPoints"] = sp_high_02,
["aware"] = true},
8.0,
{["ebp"] = cp_ork_boy_ranged_grenade,
["unitAmount"] = 3.0,
["spawnPoints"] = sp_highAll,
["aware"] = true},
3.0,
networkFunctions.squigCont_03,
0.5,
{["ebp"] = cp_ork_squig_bomb,
["unitAmount"] = 1.0,
["spawnPoints"] = sp_cont_03,
["aware"] = true},
1.0,
{["ebp"] = cp_ork_squig_bomb,
["unitAmount"] = 1.0,
["spawnPoints"] = sp_cont_03,
["aware"] = true},
{["ebp"] = cp_ork_squig_bomb,
["unitAmount"] = 1.0,
["spawnPoints"] = sp_cont_05,
["aware"] = true},
1.0,
{["ebp"] = cp_ork_squig_bomb,
["unitAmount"] = 1.0,
["spawnPoints"] = sp_cont_03,
["aware"] = true},
3.0,
networkFunctions.squigCont_02,
0.5,
{["ebp"] = cp_ork_squig_bomb,
["unitAmount"] = 1.0,
["spawnPoints"] = sp_cont_02,
["aware"] = true},
1.0,
{["ebp"] = cp_ork_squig_bomb,
["unitAmount"] = 1.0,
["spawnPoints"] = sp_cont_02,
["aware"] = true},
1.0,
{["ebp"] = cp_ork_squig_bomb,
["unitAmount"] = 1.0,
["spawnPoints"] = sp_cont_02,
["aware"] = true},
{["ebp"] = cp_ork_squig_bomb,
["unitAmount"] = 3.0,
["spawnPoints"] = sp_low_05,
["aware"] = true},
6.0,
networkFunctions.squigCont_08,
0.5,
{["ebp"] = cp_ork_squig_bomb,
["unitAmount"] = 1.0,
["spawnPoints"] = sp_cont_08,
["aware"] = true},
--nil,
networkFunctions.squigCont_07,
0.5,
{["ebp"] = cp_ork_squig_bomb,
["unitAmount"] = 1.0,
["spawnPoints"] = sp_cont_07,
["aware"] = true},
{["ebp"] = cp_ork_squig_bomb,
["unitAmount"] = 1.0,
["spawnPoints"] = sp_cont_08,
["aware"] = true},
1.0,
{["ebp"] = cp_ork_squig_bomb,
["unitAmount"] = 1.0,
["spawnPoints"] = sp_cont_07,
["aware"] = true},
{["ebp"] = cp_ork_squig_bomb,
["unitAmount"] = 1.0,
["spawnPoints"] = sp_cont_08,
["aware"] = true},
1.0,
{["ebp"] = cp_ork_squig_bomb,
["unitAmount"] = 1.0,
["spawnPoints"] = sp_cont_07,
["aware"] = true},
2.0,
networkFunctions.squigCont_14,
0.5,
{["ebp"] = cp_ork_squig_bomb,
["unitAmount"] = 1.0,
["spawnPoints"] = sp_cont_14,
["aware"] = true},
1.0,
networkFunctions.squigCont_12,
0.5,
{["ebp"] = cp_ork_squig_bomb,
["unitAmount"] = 1.0,
["spawnPoints"] = sp_cont_12,
["aware"] = true},
1.0,
{["ebp"] = cp_ork_squig_bomb,
["unitAmount"] = 1.0,
["spawnPoints"] = sp_cont_14,
["aware"] = true},
{["ebp"] = cp_ork_squig_bomb,
["unitAmount"] = 1.0,
["spawnPoints"] = sp_cont_12,
["aware"] = true},
1.0,
{["ebp"] = cp_ork_squig_bomb,
["unitAmount"] = 1.0,
["spawnPoints"] = sp_cont_14,
["aware"] = true},
{["ebp"] = cp_ork_squig_bomb,
["unitAmount"] = 1.0,
["spawnPoints"] = sp_cont_12,
["aware"] = true},
6.0,
networkFunctions.squigCont_09,
0.5,
{["ebp"] = cp_ork_squig_bomb,
["unitAmount"] = 1.0,
["spawnPoints"] = sp_cont_09,
["aware"] = true},
1.0,
{["ebp"] = cp_ork_squig_bomb,
["unitAmount"] = 1.0,
["spawnPoints"] = sp_cont_09,
["aware"] = true},
1.0,
{["ebp"] = cp_ork_squig_bomb,
["unitAmount"] = 1.0,
["spawnPoints"] = sp_cont_09,
["aware"] = true},
networkFunctions.squigCont_19,
0.5,
{["ebp"] = cp_ork_squig_bomb,
["unitAmount"] = 1.0,
["spawnPoints"] = sp_cont_19,
["aware"] = true},
1.0,
{["ebp"] = cp_ork_squig_bomb,
["unitAmount"] = 1.0,
["spawnPoints"] = sp_cont_19,
["aware"] = true},
1.0,
{["ebp"] = cp_ork_squig_bomb,
["unitAmount"] = 1.0,
["spawnPoints"] = sp_cont_19,
["aware"] = true}}
	networkFunctions.setTanksInvulnerable()
	COOP_RegisterWaves(wave1, wave2, wave3, wave4, wave5)
end

networkFunctions.startFog = function ()
	World_EnvironmentRegionSetEnabled("_GlobEnvReg_Lab_Fog", true)
	World_EnvironmentRegionSetEnabled("_GlobEnvReg_Lab", false)
end

networkFunctions.speechAlarm = function ()
	multiplayer.assets.csp_alarm = Coop_Audio2D(csp_alarm)
	Event_AddTimer(networkFunctions.playNextSpeech, 1.0, true)
end

networkFunctions.playNextSpeech = function (arg0)
	local var0 = Audio_IsPlaying(multiplayer.assets.csp_alarm)
	if not var0 then
		Coop_Audio2D(csp_containment_breach)
		Event_Remove(arg0)
	end
end

networkFunctions.endFog = function ()
	World_EnvironmentRegionSetEnabled("_GlobEnvReg_Lab_Fog", false)
	World_EnvironmentRegionSetEnabled("_GlobEnvReg_Lab", true)
end

networkFunctions.squigCont_01 = function ()
	Coop_SetInvulnerable(grp_container_01, false)
	Coop_GroupKill(grp_container_01)
end

networkFunctions.squigCont_02 = function ()
	Coop_SetInvulnerable(grp_container_02, false)
	Coop_GroupKill(grp_container_02)
end

networkFunctions.squigCont_03 = function ()
	Coop_SetInvulnerable(grp_container_03, false)
	Coop_GroupKill(grp_container_03)
end

networkFunctions.squigCont_04 = function ()
	Coop_SetInvulnerable(grp_container_04, false)
	Coop_GroupKill(grp_container_04)
end

networkFunctions.squigCont_05 = function ()
	Coop_SetInvulnerable(grp_container_05, false)
	Coop_GroupKill(grp_container_05)
end

networkFunctions.squigCont_06 = function ()
	Coop_SetInvulnerable(grp_container_06, false)
	Coop_GroupKill(grp_container_06)
end

networkFunctions.squigCont_07 = function ()
	Coop_SetInvulnerable(grp_container_07, false)
	Coop_GroupKill(grp_container_07)
end

networkFunctions.squigCont_08 = function ()
	Coop_SetInvulnerable(grp_container_08, false)
	Coop_GroupKill(grp_container_08)
end

networkFunctions.squigCont_09 = function ()
	Coop_SetInvulnerable(grp_container_09, false)
	Coop_GroupKill(grp_container_09)
end

networkFunctions.squigCont_11 = function ()
	Coop_SetInvulnerable(grp_container_11, false)
	Coop_GroupKill(grp_container_11)
end

networkFunctions.squigCont_12 = function ()
	Coop_SetInvulnerable(grp_container_12, false)
	Coop_GroupKill(grp_container_12)
end

networkFunctions.squigCont_13 = function ()
	Coop_SetInvulnerable(grp_container_13, false)
	Coop_GroupKill(grp_container_13)
end

networkFunctions.squigCont_14 = function ()
	Coop_SetInvulnerable(grp_container_14, false)
	Coop_GroupKill(grp_container_14)
end

networkFunctions.squigCont_19 = function ()
	Coop_SetInvulnerable(grp_container_19, false)
	Coop_GroupKill(grp_container_19)
end

networkFunctions.setTanksInvulnerable = function ()
	Coop_SetInvulnerable(grp_container_01, true)
	Coop_SetInvulnerable(grp_container_02, true)
	Coop_SetInvulnerable(grp_container_03, true)
	Coop_SetInvulnerable(grp_container_04, true)
	Coop_SetInvulnerable(grp_container_05, true)
	Coop_SetInvulnerable(grp_container_06, true)
	Coop_SetInvulnerable(grp_container_07, true)
	Coop_SetInvulnerable(grp_container_08, true)
	Coop_SetInvulnerable(grp_container_09, true)
	Coop_SetInvulnerable(grp_container_11, true)
	Coop_SetInvulnerable(grp_container_12, true)
	Coop_SetInvulnerable(grp_container_13, true)
	Coop_SetInvulnerable(grp_container_14, true)
	Coop_SetInvulnerable(grp_container_19, true)
	Coop_SetInvulnerable(grp_LeftOverTanks, true)
end

function MissionStart()
	local var0 = GetMissionTaskData("missiontask")
	local var1 = multiplayer.Team:GetFromID(multiplayer.Team, TEAM_MARINE)
	CreateMissionTasks(var0, {})
	COOP_StartWaves(trig_wave_01)
	RegisterPlayerEvents()
end

function GetMissionTaskData(arg0)
	local var0 = Marker_FindList(arg0)
	for var1, var2 in ipairs(var0) do
		local var3 = Marker_FromName(var2)
		table.insert({}, {["my_mission_marker"] = var3,
["minimum_guys"] = 1.0,
["maximum_guys"] = 2.0,
["extra_melee_engage_buffer"] = 30.0,
["maximum_melee_guys"] = 0.0,
["rating_modifier"] = 0.0,
["team"] = teams[2.0],
["debug_string"] = var2,
["tasktype"] = MISSIONTASK_OCCUPY,
["task"] = nil,
["taskgroups"] = {}})
	end
	return {}
end