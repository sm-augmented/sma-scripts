require("Util/Common")
require("Util/MissionTask")
require("Util/CP/CP_Common")
require("Util/CP/CP_Func")
require("Util/CP/Endless/CP_Endless")

multiplayer.objectiveData = {}
chaosMission = true
arenaNum = 1.0
thisArena = "CP_Arena_waterworks"
arenaExit = "mkr_waterworks_exit"

spawnPoints = {
	sp_wbWave_01,
	sp_wbWave_02,
	sp_wbWave_03,
	sp_wbWave_04,
	sp_wbWave_05,
  sp_wbWave_06,
	sp_wbWave_07,
	sp_wbWave_08,
	sp_wave1_01,
	sp_wave1_03,
	sp_wave1_ork,
	sp_wave3_01
}

factionsAvailable = {
	"loyals", "orks"
}

function MissionStartNetwork()
	InitLuaSafe()
	RegisterEndless()
end

function MissionStart()
	StartWavesEndless(trig_arenaStart)
	RegisterPlayerEvents()
end