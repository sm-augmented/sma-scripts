require("Util/Common")
require("Util/Scarutil")
require("Util/CP/CP_Common")
require("Util/CP/CP_Func")
require("Util/CP/Endless/CP_Endless")

multiplayer.objectiveData = {}
chaosMission = true
allies = true
addAlliesToEbpString = false
arenaNum = 1.0
thisArena = "CP_Arena_desert_c"
arenaExit = "mkr_desert_c_exit"

spawnPoints = {
	sp_wave3_01,
	sp_wave1_04,
	sp_wave1_08, 
	sp_wave3_08,
	sp_wave2_07,
	sp_wave2_05,
	sp_wave2_01,
	sp_wave2_02,
	sp_wave1_ork,
	sp_wave1_ig, 
	sp_wave3_ork, 
	sp_wave3_ig,
	sp_wave4_ig,
	sp_wave4_psyker,
}

factionsAvailable = {
	"orks"
}

function MissionStartNetwork() --f_0
	InitLuaSafe()
	RegisterEndless()
end

function MissionStart() --f_1
	RegisterPlayerEvents()
	StartWavesEndless(trig_start)
end