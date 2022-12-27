require("Util/Common")
require("Util/Scarutil")
require("Util/CP/CP_Common")
require("Util/CP/CP_AutomatedTurrets")
require("Util/CP/CP_Func")

multiplayer.objectiveData = {}
arenaNum = 1.0
thisArena = "cp_arena_desert_b"
arenaExit = "mkr_desert_b_exit"
nextArena = "cp_arena_habs_a"
nextArenaEnter = "mkr_habs_a_entrance"

function MissionStartNetwork()
	InitLuaSafe()
	
	sp_wave1 = COOP_GetSpawnPointGroup("sp_wave1")
	sp_wave2 = COOP_GetSpawnPointGroup("sp_wave2")
	sp_wave3 = COOP_GetSpawnPointGroup("sp_wave3")
	sp_wave4 = COOP_GetSpawnPointGroup("sp_wave4")
	sp_wave5 = COOP_GetSpawnPointGroup("sp_wave5")
	sp_lowAll = {sp_wave1_02, sp_wave1_03}
	sp_highAll = {sp_wave1_01, sp_wave1_04}
	challengeSet1 = {{["challengeType"] = ch_speedKill,
["timeLimit"] = 20.0,
["targetAmount"] = 10.0},
{["challengeType"] = ch_kingOfTheHill,
["timeLimit"] = 15.0,
["markers"] = {mkr_challengeCP_01},
["captureTime"] = 2.0},
{["challengeType"] = ch_ballHog,
["timeLimit"] = 30.0,
["targetAmount"] = 10.0},
{["challengeType"] = ch_sychronizedKill,
["timeLimit"] = 20.0,
["targetAmount"] = 10.0}}
	challengeSet2 = {{["challengeType"] = ch_speedKill,
["timeLimit"] = 30.0,
["targetAmount"] = 10.0},
{["challengeType"] = ch_selectiveKill,
["timeLimit"] = 25.0,
["targetAmount"] = 8.0,
["unitType"] = cp_ork_gretchin},
{["challengeType"] = ch_ballHog,
["timeLimit"] = 30.0,
["targetAmount"] = 10.0},
{["challengeType"] = ch_sychronizedKill,
["timeLimit"] = 30.0,
["targetAmount"] = 10.0}}
	challengeSet3 = {{["challengeType"] = ch_speedKill,
["timeLimit"] = 30.0,
["targetAmount"] = 15.0},
{["challengeType"] = ch_selectiveKill,
["timeLimit"] = 30.0,
["targetAmount"] = 15.0,
["unitType"] = cp_ork_boy_melee},
{["challengeType"] = ch_ballHog,
["timeLimit"] = 30.0,
["targetAmount"] = 10.0},
{["challengeType"] = ch_sychronizedKill,
["timeLimit"] = 30.0,
["targetAmount"] = 8.0}}
	--sp_wave1_06 = 5.0
	--mkr_dest_02 = 1.0
	--mkr_dest_02 = 1.0
	--mkr_dest_03 = 1.0
	--mkr_dest_04 = 2.0
	wave1 = {8.0,
1.0,
networkFunctions.coop_startRock_01,
3.5,
{["ebp"] = cp_ork_boy_melee,
["unitAmount"] = 8.0,
["spawnPoints"] = sp_wave1_05,
["aware"] = true,
["playSoundFX"] = true},
{["ebp"] = cp_ork_gretchin,
["unitAmount"] = 8.0,
["spawnPoints"] = sp_wave1_05,
["aware"] = true},
{["ebp"] = cp_ork_boy_melee,
["unitAmount"] = 8.0,
["spawnPoints"] = sp_wave1_06,
["aware"] = true},
{["ebp"] = cp_ork_gretchin,
["unitAmount"] = 8.0,
["spawnPoints"] = sp_wave1_06,
["aware"] = true},
5.0,
networkFunctions.coop_startRock_06,
networkFunctions.ShowWayLeft,
networkFunctions.ShowWayRight,
{["ebp"] = cp_ork_gretchin,
["unitAmount"] = 6.0,
["spawnPoints"] = sp_wave1_01,
["goto"] = mkr_dest_01,
["aware"] = true},
{["ebp"] = cp_ork_gretchin,
["unitAmount"] = 6.0,
["spawnPoints"] = sp_wave1_02,
["goto"] = mkr_dest_02,
["aware"] = true},
1.0,
networkFunctions.StopShowWayLeft,
networkFunctions.StopShowWayRight,
networkFunctions.coop_startRock_07,
4.0,
networkFunctions.ShowWayBack02,
networkFunctions.ShowWayBack01,
{["ebp"] = cp_ork_gretchin,
["unitAmount"] = 6.0,
["spawnPoints"] = sp_wave1_03,
["goto"] = mkr_dest_03,
["aware"] = true,
["playSoundFX"] = true},
{["ebp"] = cp_ork_boy_melee,
["unitAmount"] = 6.0,
["spawnPoints"] = sp_wave1_04,
["goto"] = mkr_dest_04,
["aware"] = true,
["playSoundFX"] = true},
{["ebp"] = cp_ork_gretchin,
["unitAmount"] = 6.0,
["spawnPoints"] = sp_wave1_01,
["goto"] = mkr_dest_01,
["aware"] = true},
networkFunctions.ShowWayLeft,
3.0,
networkFunctions.StopShowWayBack02,
networkFunctions.StopShowWayBack01,
networkFunctions.StopShowWayLeft,
3.0,
networkFunctions.ShowWayRight,
{["ebp"] = cp_ork_gretchin,
["unitAmount"] = 5.0,
["spawnPoints"] = sp_wave1_03,
["goto"] = mkr_dest_03,
["aware"] = true},
{["ebp"] = cp_ork_boy_melee,
["unitAmount"] = 2.0,
["spawnPoints"] = sp_wave1_02,
["goto"] = mkr_dest_02,
["aware"] = true},
{["ebp"] = cp_ork_boy_melee,
["unitAmount"] = 2.0,
["spawnPoints"] = sp_wave1_04,
["goto"] = mkr_dest_04,
["aware"] = true},
{["leftAlive"] = 5.0},
networkFunctions.StopShowWayBack01,
networkFunctions.StopShowWayRight,
networkFunctions.ShowWayLeft,
networkFunctions.ShowWayRight,
{["ebp"] = cp_ork_boy_melee,
["unitAmount"] = 4.0,
["spawnPoints"] = sp_wave1_01,
["goto"] = mkr_dest_01,
["aware"] = true,
["playSoundFX"] = true},
{["ebp"] = cp_ork_boy_melee,
["unitAmount"] = 6.0,
["spawnPoints"] = sp_wave1_01,
["goto"] = mkr_dest_01,
["aware"] = true},
{["ebp"] = cp_ork_gretchin,
["unitAmount"] = 4.0,
["spawnPoints"] = sp_wave1_02,
["goto"] = mkr_dest_02,
["aware"] = true},
1.0,
networkFunctions.StopShowWayLeft,
networkFunctions.StopShowWayRight,
networkFunctions.ShowWayBack01,
{["ebp"] = cp_ork_boy_melee,
["unitAmount"] = 5.0,
["spawnPoints"] = sp_wave1_01,
["goto"] = mkr_dest_01,
["aware"] = true},
{["ebp"] = cp_ork_boy_melee,
["unitAmount"] = 5.0,
["spawnPoints"] = sp_wave1_01,
["goto"] = mkr_dest_01,
["aware"] = true},
{["ebp"] = cp_ork_gretchin,
["unitAmount"] = 4.0,
["spawnPoints"] = sp_wave1_03,
["goto"] = mkr_dest_03,
["aware"] = true},
1.0,
networkFunctions.StopShowWayBack01,
1.0,
networkFunctions.ShowWayLeft,
networkFunctions.ShowWayRight,
networkFunctions.ShowWayBack01,
networkFunctions.ShowWayBack02,
{["ebp"] = cp_ork_boy_melee,
["unitAmount"] = 3.0,
["spawnPoints"] = sp_wave1_01,
["goto"] = mkr_dest_01,
["aware"] = true},
{["ebp"] = cp_ork_boy_melee,
["unitAmount"] = 3.0,
["spawnPoints"] = sp_wave1_02,
["goto"] = mkr_dest_02,
["aware"] = true},
{["ebp"] = cp_ork_boy_melee,
["unitAmount"] = 3.0,
["spawnPoints"] = sp_wave1_03,
["goto"] = mkr_dest_03,
["aware"] = true},
{["ebp"] = cp_ork_boy_melee,
["unitAmount"] = 3.0,
["spawnPoints"] = sp_wave1_04,
["goto"] = mkr_dest_04,
["aware"] = true},
2.0,
networkFunctions.StopShowWayLeft,
networkFunctions.StopShowWayBack01,
networkFunctions.StopShowWayBack02,
networkFunctions.StopShowWayRight}
	--mkr_dest_01 = 2.0
	--mkr_dest_04 = 1.0
	--challengeSet2 = 2.0
	--mkr_dest_04 = 6.0
	--mkr_dest_01 = 1.0
	--mkr_dest_02 = 5.0
	--mkr_dest_01 = 7.0
	--mkr_dest_04 = 3.0
	--mkr_dest_02 = 5.0
	--mkr_dest_02 = 2.0
	--mkr_dest_04 = 1.0
	wave2 = {3.0,
3.0,
networkFunctions.ShowWayLeft,
{["ebp"] = cp_ork_boy_melee,
["unitAmount"] = 5.0,
["spawnPoints"] = sp_wave3_01,
["goto"] = mkr_dest_01,
["aware"] = true,
["playSoundFX"] = true},
{["ebp"] = cp_ork_gretchin,
["unitAmount"] = 10.0,
["spawnPoints"] = sp_wave3_01,
["goto"] = mkr_dest_01,
["aware"] = true},
2.0,
networkFunctions.StopShowWayLeft,
1.0,
{["ebp"] = cp_ork_boy_ranged,
["unitAmount"] = 2.0,
["spawnPoints"] = sp_wave3_01,
["goto"] = mkr_dest_01,
["aware"] = true},
{["ebp"] = cp_ork_boy_ranged,
["unitAmount"] = 2.0,
["spawnPoints"] = sp_wave3_02,
["goto"] = mkr_dest_02,
["aware"] = true},
{["ebp"] = cp_ork_boy_melee,
["unitAmount"] = 5.0,
["spawnPoints"] = sp_wave3_03,
["goto"] = mkr_dest_03,
["aware"] = true,
["playSoundFX"] = true},
{["ebp"] = cp_ork_boy_melee,
["unitAmount"] = 5.0,
["spawnPoints"] = sp_wave3_04,
["goto"] = mkr_dest_04,
["aware"] = true},
1.0,
networkFunctions.ShowWayBack02,
{["ebp"] = cp_ork_gretchin,
["unitAmount"] = 10.0,
["spawnPoints"] = sp_wave3_04,
["goto"] = mkr_dest_04,
["aware"] = true},
{["ebp"] = cp_ork_boy_ranged,
["unitAmount"] = 2.0,
["spawnPoints"] = sp_wave3_04,
["goto"] = mkr_dest_04,
["aware"] = true},
{["challenge"] = challengeSet2,
["bonusPoints"] = 2500.0},
2.0,
networkFunctions.StopShowWayBack02,
{["leftAlive"] = 5.0},
networkFunctions.ShowWayLeft,
{["ebp"] = cp_ork_boy_ranged,
["unitAmount"] = 3.0,
["spawnPoints"] = sp_wave3_01,
["goto"] = mkr_dest_01,
["aware"] = true,
["playSoundFX"] = true},
{["ebp"] = cp_ork_boy_ranged,
["unitAmount"] = 3.0,
["spawnPoints"] = sp_wave3_04,
["goto"] = mkr_dest_04,
["aware"] = true},
6.0,
networkFunctions.StopShowWayLeft,
{["ebp"] = cp_ork_gretchin,
["unitAmount"] = 4.0,
["spawnPoints"] = sp_wave3_01,
["goto"] = mkr_dest_01,
["aware"] = true},
1.0,
{["ebp"] = cp_ork_boy_melee,
["unitAmount"] = 4.0,
["spawnPoints"] = sp_wave3_01,
["goto"] = mkr_dest_01,
["aware"] = true},
{["ebp"] = cp_ork_boy_melee,
["unitAmount"] = 4.0,
["spawnPoints"] = sp_wave3_02,
["goto"] = mkr_dest_02,
["aware"] = true},
5.0,
networkFunctions.ShowWayBack01,
networkFunctions.ShowWayRight,
{["ebp"] = cp_ork_boy_melee,
["unitAmount"] = 5.0,
["spawnPoints"] = sp_wave3_03,
["goto"] = mkr_dest_03,
["aware"] = true},
{["ebp"] = cp_ork_boy_melee,
["unitAmount"] = 5.0,
["spawnPoints"] = sp_wave3_02,
["goto"] = mkr_dest_02,
["aware"] = true},
{["ebp"] = cp_ork_boy_ranged,
["unitAmount"] = 1.0,
["spawnPoints"] = sp_wave3_01,
["goto"] = mkr_dest_01,
["aware"] = true},
7.0,
networkFunctions.StopShowWayRight,
networkFunctions.StopShowWayBack01,
1.0,
networkFunctions.ShowWayBack02,
1.0,
networkFunctions.ShowWayBack01,
{["ebp"] = cp_ork_boy_ranged,
["unitAmount"] = 2.0,
["spawnPoints"] = sp_wave3_04,
["goto"] = mkr_dest_04,
["aware"] = true},
{["ebp"] = cp_ork_boy_ranged,
["unitAmount"] = 2.0,
["spawnPoints"] = sp_wave3_03,
["goto"] = mkr_dest_03,
["aware"] = true},
{["ebp"] = cp_ork_boy_melee,
["unitAmount"] = 3.0,
["spawnPoints"] = sp_wave3_02,
["goto"] = mkr_dest_02,
["aware"] = true},
{["ebp"] = cp_ork_boy_ranged,
["unitAmount"] = 2.0,
["spawnPoints"] = sp_wave3_04,
["goto"] = mkr_dest_04,
["aware"] = true},
3.0,
networkFunctions.StopShowWayBack01,
networkFunctions.StopShowWayBack02,
networkFunctions.ShowWayRight,
networkFunctions.ShowWayLeft,
{["ebp"] = cp_ork_boy_melee,
["unitAmount"] = 3.0,
["spawnPoints"] = sp_wave3_01,
["goto"] = mkr_dest_01,
["aware"] = true},
{["ebp"] = cp_ork_boy_melee,
["unitAmount"] = 6.0,
["spawnPoints"] = sp_wave3_02,
["goto"] = mkr_dest_02,
["aware"] = true},
5.0,
networkFunctions.StopShowWayRight,
networkFunctions.StopShowWayLeft,
{["ebp"] = cp_ork_boy_melee,
["unitAmount"] = 4.0,
["spawnPoints"] = sp_wave3_01,
["goto"] = mkr_dest_01,
["aware"] = true,
["playSoundFX"] = true},
{["ebp"] = cp_ork_boy_melee,
["unitAmount"] = 4.0,
["spawnPoints"] = sp_wave3_02,
["goto"] = mkr_dest_02,
["aware"] = true,
["playSoundFX"] = true},
2.0,
{["ebp"] = cp_ork_boy_ranged,
["unitAmount"] = 3.0,
["spawnPoints"] = sp_wave3_04,
["goto"] = mkr_dest_04,
["aware"] = true,
["playSoundFX"] = true},
{["ebp"] = cp_ork_boy_ranged,
["unitAmount"] = 3.0,
["spawnPoints"] = sp_wave3_03,
["goto"] = mkr_dest_03,
["aware"] = true,
["playSoundFX"] = true},
networkFunctions.ShowWayBack01,
1.0,
networkFunctions.ShowWayBack02,
1.0,
networkFunctions.StopShowWayBack01,
networkFunctions.StopShowWayBack02}
	--sp_highAll = 8.0
	--mkr_dest_01 = 10.0
	--sp_lowAll = 15.0
	Wave3_Loop = {2.0,
{["ebp"] = cp_ork_boy_melee,
["unitAmount"] = 8.0,
["spawnPoints"] = sp_lowAll,
["aware"] = true},
{["ebp"] = cp_ork_boy_melee,
["unitAmount"] = 8.0,
["spawnPoints"] = sp_highAll,
["aware"] = true},
8.0,
{["ebp"] = cp_ork_boy_melee,
["unitAmount"] = 6.0,
["spawnPoints"] = sp_highAll,
["aware"] = true},
{["ebp"] = cp_ork_boy_melee,
["unitAmount"] = 8.0,
["spawnPoints"] = sp_lowAll,
["aware"] = true},
{["ebp"] = cp_ork_boy_ranged,
["unitAmount"] = 3.0,
["spawnPoints"] = sp_wave3_01,
["goto"] = mkr_dest_01,
["aware"] = true},
10.0,
{["ebp"] = cp_ork_boy_melee,
["unitAmount"] = 5.0,
["spawnPoints"] = sp_lowAll,
["aware"] = true},
{["ebp"] = cp_ork_boy_melee,
["unitAmount"] = 5.0,
["spawnPoints"] = sp_lowAll,
["aware"] = true},
{["ebp"] = cp_ork_boy_melee,
["unitAmount"] = 5.0,
["spawnPoints"] = sp_lowAll,
["aware"] = true},
{["ebp"] = cp_ork_boy_melee,
["unitAmount"] = 5.0,
["spawnPoints"] = sp_lowAll,
["aware"] = true},
15.0,
{["ebp"] = cp_ork_boy_ranged,
["unitAmount"] = 3.0,
["spawnPoints"] = sp_wave3_01,
["goto"] = mkr_dest_01,
["aware"] = true},
{["ebp"] = cp_ork_boy_ranged,
["unitAmount"] = 3.0,
["spawnPoints"] = sp_wave3_02,
["goto"] = mkr_dest_02,
["aware"] = true}}
	--Wave3_Loop = 1.0
	wave3 = {5.0,
{["capturePoint"] = mkr_cp2_player,
["awardPoints"] = 2000.0,
["waveBlocker"] = true,
["loopingSpawns"] = Wave3_Loop,
["duration"] = 60.0,
["timeLimit"] = 120.0,
["loseAfterTimeOut"] = true},
1.0,
{["ebp"] = cp_ork_boy_melee,
["unitAmount"] = 1.0,
["spawnPoints"] = sp_wave1_01,
["aware"] = true}}
	--mkr_dest_04 = 3.0
	--mkr_dest_04 = 3.0
	--mkr_dest_04 = 10.0
	--mkr_dest_04 = 6.0
	--mkr_dest_04 = 2.0
	--challengeSet3 = 5.0
	--mkr_dest_04 = 5.0
	--mkr_dest_03 = 4.0
	--mkr_dest_04 = 1.0
	wave4 = {5.0,
{["ebp"] = cp_ork_boy_melee,
["unitAmount"] = 4.0,
["spawnPoints"] = sp_wave4_01,
["goto"] = mkr_dest_01,
["aware"] = true},
{["ebp"] = cp_ork_boy_melee,
["unitAmount"] = 4.0,
["spawnPoints"] = sp_wave4_02,
["goto"] = mkr_dest_02,
["aware"] = true},
{["ebp"] = cp_ork_boy_melee,
["unitAmount"] = 4.0,
["spawnPoints"] = sp_wave4_03,
["goto"] = mkr_dest_03,
["aware"] = true},
{["ebp"] = cp_ork_boy_melee,
["unitAmount"] = 4.0,
["spawnPoints"] = sp_wave4_04,
["goto"] = mkr_dest_04,
["aware"] = true},
3.0,
{["ebp"] = cp_ork_boy_ranged,
["unitAmount"] = 2.0,
["spawnPoints"] = sp_wave4_01,
["goto"] = mkr_dest_01,
["aware"] = true},
{["ebp"] = cp_ork_boy_ranged,
["unitAmount"] = 2.0,
["spawnPoints"] = sp_wave4_02,
["goto"] = mkr_dest_02,
["aware"] = true},
{["ebp"] = cp_ork_boy_ranged,
["unitAmount"] = 2.0,
["spawnPoints"] = sp_wave4_03,
["goto"] = mkr_dest_03,
["aware"] = true},
{["ebp"] = cp_ork_boy_ranged,
["unitAmount"] = 2.0,
["spawnPoints"] = sp_wave4_04,
["goto"] = mkr_dest_04,
["aware"] = true},
3.0,
{["ebp"] = cp_ork_boy_melee,
["unitAmount"] = 6.0,
["spawnPoints"] = sp_wave4_01,
["goto"] = mkr_dest_01,
["aware"] = true},
{["leftAlive"] = 5.0},
networkFunctions.ShowWayLeft,
1.0,
networkFunctions.ShowWayBack02,
{["ebp"] = cp_ork_boy_ranged,
["unitAmount"] = 3.0,
["spawnPoints"] = sp_wave4_01,
["goto"] = mkr_dest_01,
["aware"] = true},
{["ebp"] = cp_ork_boy_ranged,
["unitAmount"] = 3.0,
["spawnPoints"] = sp_wave4_04,
["goto"] = mkr_dest_04,
["aware"] = true},
10.0,
networkFunctions.StopShowWayBack02,
networkFunctions.StopShowWayLeft,
{["ebp"] = cp_ork_gretchin,
["unitAmount"] = 8.0,
["spawnPoints"] = sp_wave4_01,
["goto"] = mkr_dest_01,
["aware"] = true},
{["ebp"] = cp_ork_boy_melee,
["unitAmount"] = 6.0,
["spawnPoints"] = sp_wave4_01,
["goto"] = mkr_dest_01,
["aware"] = true},
{["ebp"] = cp_ork_boy_melee,
["unitAmount"] = 6.0,
["spawnPoints"] = sp_wave4_02,
["goto"] = mkr_dest_02,
["aware"] = true},
{["ebp"] = cp_ork_boy_melee,
["unitAmount"] = 6.0,
["spawnPoints"] = sp_wave4_03,
["goto"] = mkr_dest_03,
["aware"] = true},
{["ebp"] = cp_ork_boy_melee,
["unitAmount"] = 6.0,
["spawnPoints"] = sp_wave4_04,
["goto"] = mkr_dest_04,
["aware"] = true},
{["ebp"] = cp_ork_gretchin,
["unitAmount"] = 8.0,
["spawnPoints"] = sp_wave4_04,
["goto"] = mkr_dest_04,
["aware"] = true},
6.0,
{["leftAlive"] = 15.0},
networkFunctions.ShowWayLeft,
networkFunctions.ShowWayRight,
networkFunctions.ShowWayBack01,
networkFunctions.ShowWayBack02,
{["ebp"] = cp_ork_gretchin,
["unitAmount"] = 10.0,
["spawnPoints"] = sp_wave4_01,
["goto"] = mkr_dest_01,
["aware"] = true},
{["ebp"] = cp_ork_boy_melee,
["unitAmount"] = 6.0,
["spawnPoints"] = sp_wave4_01,
["goto"] = mkr_dest_01,
["aware"] = true},
{["ebp"] = cp_ork_boy_melee,
["unitAmount"] = 8.0,
["spawnPoints"] = sp_wave4_02,
["goto"] = mkr_dest_02,
["aware"] = true},
{["ebp"] = cp_ork_boy_melee,
["unitAmount"] = 8.0,
["spawnPoints"] = sp_wave4_03,
["goto"] = mkr_dest_03,
["aware"] = true},
{["ebp"] = cp_ork_boy_melee,
["unitAmount"] = 6.0,
["spawnPoints"] = sp_wave4_04,
["goto"] = mkr_dest_04,
["aware"] = true},
{["ebp"] = cp_ork_gretchin,
["unitAmount"] = 10.0,
["spawnPoints"] = sp_wave4_04,
["goto"] = mkr_dest_04,
["aware"] = true},
2.0,
{["challenge"] = challengeSet3,
["bonusPoints"] = 2500.0},
5.0,
networkFunctions.StopShowWayLeft,
networkFunctions.StopShowWayBack01,
networkFunctions.StopShowWayBack02,
networkFunctions.StopShowWayRight,
{["ebp"] = cp_ork_boy_melee,
["unitAmount"] = 8.0,
["spawnPoints"] = sp_wave4_02,
["goto"] = mkr_dest_02,
["aware"] = true},
{["ebp"] = cp_ork_boy_melee,
["unitAmount"] = 8.0,
["spawnPoints"] = sp_wave4_04,
["goto"] = mkr_dest_04,
["aware"] = true},
5.0,
{["ebp"] = cp_ork_boy_melee,
["unitAmount"] = 8.0,
["spawnPoints"] = sp_wave4_01,
["goto"] = mkr_dest_01,
["aware"] = true},
{["ebp"] = cp_ork_boy_melee,
["unitAmount"] = 6.0,
["spawnPoints"] = sp_wave4_02,
["goto"] = mkr_dest_02,
["aware"] = true},
{["ebp"] = cp_ork_boy_melee,
["unitAmount"] = 6.0,
["spawnPoints"] = sp_wave4_03,
["goto"] = mkr_dest_03,
["aware"] = true},
4.0,
{["leftAlive"] = 15.0},
networkFunctions.ShowWayLeft,
networkFunctions.ShowWayRight,
networkFunctions.ShowWayBack01,
networkFunctions.ShowWayBack02,
{["ebp"] = cp_ork_boy_melee,
["unitAmount"] = 5.0,
["spawnPoints"] = sp_wave4_01,
["goto"] = mkr_dest_01,
["aware"] = true},
{["ebp"] = cp_ork_boy_melee,
["unitAmount"] = 5.0,
["spawnPoints"] = sp_wave4_02,
["goto"] = mkr_dest_02,
["aware"] = true},
{["ebp"] = cp_ork_boy_melee,
["unitAmount"] = 5.0,
["spawnPoints"] = sp_wave4_03,
["goto"] = mkr_dest_03,
["aware"] = true},
{["ebp"] = cp_ork_boy_melee,
["unitAmount"] = 5.0,
["spawnPoints"] = sp_wave4_04,
["goto"] = mkr_dest_04,
["aware"] = true},
{["ebp"] = cp_ork_boy_ranged,
["unitAmount"] = 4.0,
["spawnPoints"] = sp_wave4_01,
["goto"] = mkr_dest_01,
["aware"] = true},
{["ebp"] = cp_ork_boy_ranged,
["unitAmount"] = 4.0,
["spawnPoints"] = sp_wave4_04,
["goto"] = mkr_dest_04,
["aware"] = true},
1.0,
networkFunctions.StopShowWayLeft,
networkFunctions.StopShowWayBack01,
networkFunctions.StopShowWayBack02,
networkFunctions.StopShowWayRight}
	--mkr_dest_03 = 1.0
	--sp_wave5_10 = 1.0
	--sp_wave5_07 = 0.5
	--mkr_dest_04 = 2.0
	--mkr_dest_04 = 2.0
	--sp_wave5_10 = 2.0
	--sp_wave5_10 = 5.0
	--mkr_dest_02 = 5.0
	--mkr_dest_04 = 1.0
	--mkr_dest_04 = 2.0
	--mkr_dest_03 = 8.0
	--mkr_dest_02 = 5.0
	--mkr_dest_03 = 10.0
	--sp_wave5_05 = 4.0
	--sp_wave5_09 = 2.0
	--sp_wave1_02 = 2.0
	--mkr_dest_04 = 2.0
	wave5 = {5.0,
networkFunctions.coop_startRock_05,
1.0,
networkFunctions.coop_startRock_04,
networkFunctions.startFog,
2.0,
networkFunctions.coop_startRock_03,
2.5,
{["ebp"] = cp_ork_boy_ranged_grenade,
["unitAmount"] = 2.0,
["spawnPoints"] = sp_wave5_01,
["aware"] = true,
["playSoundFX"] = true},
{["ebp"] = cp_ork_boy_melee,
["unitAmount"] = 8.0,
["spawnPoints"] = sp_wave5_10,
["aware"] = true},
1.0,
{["ebp"] = cp_ork_boy_melee,
["unitAmount"] = 7.0,
["spawnPoints"] = sp_wave5_01,
["aware"] = true,
["playSoundFX"] = true},
{["ebp"] = cp_ork_boy_ranged_grenade,
["unitAmount"] = 2.0,
["spawnPoints"] = sp_wave5_07,
["aware"] = true},
0.5,
{["ebp"] = cp_ork_boy_ranged_grenade,
["unitAmount"] = 2.0,
["spawnPoints"] = sp_wave5_04,
["goto"] = mkr_dest_04,
["aware"] = true},
2.0,
{["ebp"] = cp_ork_boy_melee,
["unitAmount"] = 6.0,
["spawnPoints"] = sp_wave5_04,
["goto"] = mkr_dest_04,
["aware"] = true,
["playSoundFX"] = true},
2.0,
{["ebp"] = cp_ork_boy_melee,
["unitAmount"] = 6.0,
["spawnPoints"] = sp_wave5_10,
["aware"] = true},
2.0,
{["ebp"] = cp_ork_boy_melee,
["unitAmount"] = 6.0,
["spawnPoints"] = sp_wave5_10,
["aware"] = true},
5.0,
{["ebp"] = cp_ork_boy_ranged_grenade,
["unitAmount"] = 2.0,
["spawnPoints"] = sp_wave5_01,
["goto"] = mkr_dest_01,
["aware"] = true},
{["ebp"] = cp_ork_boy_ranged_grenade,
["unitAmount"] = 2.0,
["spawnPoints"] = sp_wave5_02,
["goto"] = mkr_dest_01,
["aware"] = true},
{["ebp"] = cp_ork_boy_ranged_grenade,
["unitAmount"] = 2.0,
["spawnPoints"] = sp_wave5_03,
["goto"] = mkr_dest_01,
["aware"] = true},
{["ebp"] = cp_ork_boy_ranged_grenade,
["unitAmount"] = 2.0,
["spawnPoints"] = sp_wave5_04,
["goto"] = mkr_dest_02,
["aware"] = true},
5.0,
{["ebp"] = cp_ork_gretchin,
["unitAmount"] = 4.0,
["spawnPoints"] = sp_wave5_01,
["goto"] = mkr_dest_01,
["aware"] = true},
{["ebp"] = cp_ork_boy_melee,
["unitAmount"] = 4.0,
["spawnPoints"] = sp_wave5_02,
["goto"] = mkr_dest_02,
["aware"] = true},
{["ebp"] = cp_ork_boy_melee,
["unitAmount"] = 4.0,
["spawnPoints"] = sp_wave5_03,
["goto"] = mkr_dest_03,
["aware"] = true},
{["ebp"] = cp_ork_boy_ranged_grenade,
["unitAmount"] = 2.0,
["spawnPoints"] = sp_wave5_04,
["goto"] = mkr_dest_04,
["aware"] = true},
1.0,
{["ebp"] = cp_ork_boy_ranged_grenade,
["unitAmount"] = 2.0,
["spawnPoints"] = sp_wave5_01,
["goto"] = mkr_dest_01,
["aware"] = true},
{["ebp"] = cp_ork_boy_melee,
["unitAmount"] = 4.0,
["spawnPoints"] = sp_wave5_02,
["goto"] = mkr_dest_02,
["aware"] = true},
{["ebp"] = cp_ork_boy_melee,
["unitAmount"] = 4.0,
["spawnPoints"] = sp_wave5_03,
["goto"] = mkr_dest_03,
["aware"] = true},
{["ebp"] = cp_ork_boy_melee,
["unitAmount"] = 4.0,
["spawnPoints"] = sp_wave5_04,
["goto"] = mkr_dest_04,
["aware"] = true},
2.0,
{["leftAlive"] = 15.0},
{["ebp"] = cp_ork_boy_melee,
["unitAmount"] = 6.0,
["spawnPoints"] = sp_wave5_01,
["goto"] = mkr_dest_03,
["aware"] = true},
{["ebp"] = cp_ork_boy_melee,
["unitAmount"] = 6.0,
["spawnPoints"] = sp_wave5_03,
["goto"] = mkr_dest_03,
["aware"] = true},
8.0,
{["ebp"] = cp_ork_boy_ranged_grenade,
["unitAmount"] = 2.0,
["spawnPoints"] = sp_wave5_02,
["goto"] = mkr_dest_02,
["aware"] = true},
{["ebp"] = cp_ork_boy_ranged,
["unitAmount"] = 2.0,
["spawnPoints"] = sp_wave5_02,
["goto"] = mkr_dest_02,
["aware"] = true},
5.0,
{["ebp"] = cp_ork_gretchin,
["unitAmount"] = 3.0,
["spawnPoints"] = sp_wave5_02,
["goto"] = mkr_dest_02,
["aware"] = true},
{["ebp"] = cp_ork_boy_melee,
["unitAmount"] = 3.0,
["spawnPoints"] = sp_wave5_02,
["goto"] = mkr_dest_02,
["aware"] = true},
{["ebp"] = cp_ork_boy_melee,
["unitAmount"] = 5.0,
["spawnPoints"] = sp_wave5_04,
["goto"] = mkr_dest_04,
["aware"] = true},
{["ebp"] = cp_ork_boy_melee,
["unitAmount"] = 5.0,
["spawnPoints"] = sp_wave5_03,
["goto"] = mkr_dest_03,
["aware"] = true},
{["ebp"] = cp_ork_boy_ranged_grenade,
["unitAmount"] = 2.0,
["spawnPoints"] = sp_wave5_03,
["goto"] = mkr_dest_03,
["aware"] = true},
{["ebp"] = cp_ork_boy_ranged,
["unitAmount"] = 2.0,
["spawnPoints"] = sp_wave5_01,
["goto"] = mkr_dest_01,
["aware"] = true},
1.0,
{["leftAlive"] = 20.0},
{["ebp"] = cp_ork_boy_ranged_grenade,
["unitAmount"] = 2.0,
["spawnPoints"] = sp_wave5_02,
["goto"] = mkr_dest_02,
["aware"] = true},
{["ebp"] = cp_ork_boy_ranged_grenade,
["unitAmount"] = 2.0,
["spawnPoints"] = sp_wave5_03,
["goto"] = mkr_dest_03,
["aware"] = true},
10.0,
{["ebp"] = cp_ork_gretchin,
["unitAmount"] = 5.0,
["spawnPoints"] = sp_wave5_01,
["goto"] = mkr_dest_01,
["aware"] = true},
{["ebp"] = cp_ork_boy_ranged_grenade,
["unitAmount"] = 2.0,
["spawnPoints"] = sp_wave5_02,
["goto"] = mkr_dest_02,
["aware"] = true},
{["ebp"] = cp_ork_boy_ranged_grenade,
["unitAmount"] = 2.0,
["spawnPoints"] = sp_wave5_03,
["goto"] = mkr_dest_03,
["aware"] = true},
{["ebp"] = cp_ork_gretchin,
["unitAmount"] = 5.0,
["spawnPoints"] = sp_wave5_04,
["goto"] = mkr_dest_04,
["aware"] = true},
{["ebp"] = cp_ork_boy_melee,
["unitAmount"] = 6.0,
["spawnPoints"] = sp_wave5_01,
["goto"] = mkr_dest_01,
["aware"] = true},
{["ebp"] = cp_ork_boy_melee,
["unitAmount"] = 6.0,
["spawnPoints"] = sp_wave5_03,
["goto"] = mkr_dest_02,
["aware"] = true},
{["ebp"] = cp_ork_boy_melee,
["unitAmount"] = 6.0,
["spawnPoints"] = sp_wave5_04,
["goto"] = mkr_dest_03,
["aware"] = true},
{["ebp"] = cp_ork_boy_melee,
["unitAmount"] = 6.0,
["spawnPoints"] = sp_wave5_02,
["goto"] = mkr_dest_04,
["aware"] = true},
{["leftAlive"] = 1.0},
3.0,
{["ebp"] = cp_ork_boy_ranged_grenade,
["unitAmount"] = 3.0,
["spawnPoints"] = sp_wave5_05,
["aware"] = true,
["spawnFX"] = true},
4.0,
networkFunctions.coop_startRock_08,
1.0,
networkFunctions.coop_startRock_09,
0.5,
networkFunctions.coop_startRock_02,
4.0,
{["ebp"] = cp_ork_nob_shoota,
["unitAmount"] = 2.0,
["spawnPoints"] = sp_wave5_08,
["aware"] = true,
["playSoundFX"] = true},
{["ebp"] = cp_ork_nob_shoota,
["unitAmount"] = 1.0,
["spawnPoints"] = sp_wave5_10,
["goto"] = sp_wave5_10,
["aware"] = true},
{["ebp"] = cp_ork_boy_ranged_grenade,
["unitAmount"] = 2.0,
["spawnPoints"] = sp_wave5_09,
["aware"] = true},
2.0,
{["ebp"] = cp_ork_boy_ranged_grenade,
["unitAmount"] = 2.0,
["spawnPoints"] = sp_wave5_02,
["aware"] = true},
{["ebp"] = cp_ork_boy_melee,
["unitAmount"] = 8.0,
["spawnPoints"] = sp_wave5_01,
["aware"] = true},
{["ebp"] = cp_ork_boy_melee,
["unitAmount"] = 8.0,
["spawnPoints"] = sp_wave5_04,
["aware"] = true},
{["ebp"] = cp_ork_boy_melee,
["unitAmount"] = 8.0,
["spawnPoints"] = sp_wave1_02,
["aware"] = true},
2.0,
{["ebp"] = cp_ork_boy_melee,
["unitAmount"] = 5.0,
["spawnPoints"] = sp_wave5_01,
["goto"] = mkr_dest_01,
["aware"] = true},
{["ebp"] = cp_ork_boy_melee,
["unitAmount"] = 5.0,
["spawnPoints"] = sp_wave5_04,
["goto"] = mkr_dest_04,
["aware"] = true},
2.0,
{["leftAlive"] = 5.0},
{["ebp"] = cp_ork_nob_shoota,
["unitAmount"] = 1.0,
["spawnPoints"] = sp_wave5_01,
["goto"] = mkr_dest_01,
["aware"] = true,
["playSoundFX"] = true},
{["ebp"] = cp_ork_nob_shoota,
["unitAmount"] = 1.0,
["spawnPoints"] = sp_wave5_02,
["goto"] = mkr_dest_02,
["aware"] = true,
["playSoundFX"] = true},
{["ebp"] = cp_ork_nob_shoota,
["unitAmount"] = 1.0,
["spawnPoints"] = sp_wave5_03,
["goto"] = mkr_dest_03,
["aware"] = true,
["playSoundFX"] = true},
{["ebp"] = cp_ork_nob_shoota,
["unitAmount"] = 1.0,
["spawnPoints"] = sp_wave5_04,
["goto"] = mkr_dest_04,
["aware"] = true,
["playSoundFX"] = true},
{["leftAlive"] = 1.0}}
	networkFunctions.setRocksInvisible()
	COOP_RegisterWaves(wave1, wave2, wave3, wave4, wave5)
end

function MissionStart()
	COOP_StartWaves(trig_start)
	RegisterPlayerEvents()
end

networkFunctions.setRocksInvisible = function () --f_1
	Coop_SetVisibility(grp_ork_rock_01, false)
	Coop_SetVisibility(grp_ork_rock_02, false)
	Coop_SetVisibility(grp_ork_rock_03, false)
	Coop_SetVisibility(grp_ork_rock_04, false)
	Coop_SetVisibility(grp_ork_rock_05, false)
	Coop_SetVisibility(grp_ork_rock_06, false)
	Coop_SetVisibility(grp_ork_rock_07, false)
	Coop_SetVisibility(grp_ork_rock_08, false)
	Coop_SetVisibility(grp_ork_rock_09, false)
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

networkFunctions.startFog = function () --f_17
	World_EnvironmentRegionSetEnabled("SandStorm_EnvRegion", true)
	World_EnvironmentRegionSetEnabled("globalEnvReg_Main", false)
end

networkFunctions.endFog = function () --f_18
	World_EnvironmentRegionSetEnabled("SandStorm_EnvRegion", false)
	World_EnvironmentRegionSetEnabled("globalEnvReg_Main", true)
end

networkFunctions.ShowWayLeft = function () --f_19
	Marker_PlayFX(mkr_explosionWay_01_Left)
end

networkFunctions.StopShowWayLeft = function () --f_20
	Marker_StopFX(mkr_explosionWay_01_Left)
end

networkFunctions.ShowWayRight = function () --f_21
	Marker_PlayFX(mkr_explosionWay_01_Right)
end

networkFunctions.StopShowWayRight = function () --f_22
	Marker_StopFX(mkr_explosionWay_01_Right)
end

networkFunctions.ShowWayBack02 = function () --f_23
	Marker_PlayFX(mkr_explosionWay_02_Back)
end

networkFunctions.StopShowWayBack02 = function () --f_24
	Marker_StopFX(mkr_explosionWay_02_Back)
end

networkFunctions.ShowWayBack01 = function () --f_25
	Marker_PlayFX(mkr_explosionWay_01_Back)
end

networkFunctions.StopShowWayBack01 = function ()
	Marker_StopFX(mkr_explosionWay_01_Back)
end