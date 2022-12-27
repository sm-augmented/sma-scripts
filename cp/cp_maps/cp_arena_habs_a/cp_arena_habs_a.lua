require("Util/Common")
require("Util/MissionTask")
require("Util/CP/CP_Common")
require("Util/CP/Endless/CP_Endless")
require("Util/CP/CP_AutomatedTurrets")
require("Util/CP/CP_Func")

multiplayer.objectiveData = {}
arenaNum = 1.0
thisArena = "cp_arena_habs_a"
arenaExit = "mkr_habs_a_exit"

spawnPoints = {
	sp_wave1_01,
	sp_wave1_02,
	sp_wave1_03,
	sp_wave1_04,
	sp_wave1_05,
	sp_wave1_06,
	sp_wave1_07,
	sp_wave1_08,
	sp_wave1_09,
	sp_wave1_10,
	sp_wave2_01,
	sp_wave2_02,
	sp_wave2_03,
	sp_wave2_04,
	sp_wave2_05,
	sp_wave2_06,
	sp_wave3_01,
	sp_wave3_02,
	sp_wave3_03,
	sp_wave3_04,
	sp_wave3_05,
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
	sp_wave5_07
}

factionsAvailable = {
	"chaos"
}

function MissionStartNetwork() --f_0
	InitLuaSafe()
	RegisterEndless()
end

function MissionStart() --f_49
	networkFunctions.setDiggasInvisible()
	StartWavesEndless(trig_startArena)
	RegisterPlayerEvents()
end

networkFunctions.setDiggasInvisible = function () --f_1
	Coop_SetVisibility(grp_digga_01, false)
	Coop_SetVisibility(grp_digga_02, false)
	Coop_SetVisibility(grp_digga_03, false)
	Coop_SetVisibility(grp_digga_04, false)
end