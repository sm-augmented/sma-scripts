require("Util/Common")
require("Util/Scarutil")
require("Util/CP/CP_Common")
require("Util/CP/CP_AutomatedTurrets")
require("Util/CP/Endless/CP_Endless")
require("Util/CP/Units/Weirdboy_1")
require("Util/CP/CP_Func")

multiplayer.objectiveData = {}
arenaNum = 1.0
thisArena = "cp_arena_habs_b_endless"
arenaExit = "mkr_habs_b_exit"

spawnPoints = {
	sp_pipe_01,
	sp_pipe_02,
	sp_pipe_03,
	sp_pipe_04,
	sp_pipe_05,
  sp_pipe_06,
	sp_pipe_07,
	sp_pipe_08,
	sp_wave1_01,
	sp_wave1_02,
	sp_wave1_03,
	sp_wave1_04,
	sp_wave1_05,
	sp_ground_03,
	sp_ground_04,
	sp_ground_16,
	sp_ground_17,
	sp_ground_18,
	sp_ground_19,
	sp_ledge_03,
	sp_ledge_15,
	sp_ledge_16,
	sp_entrance_pipe
}

factionsAvailable = {
	"orks", "chaos"
}

function MissionStartNetwork()
	InitLuaSafe()

	sp_pipe = COOP_GetSpawnPointGroup("sp_pipe")
	spawnPoints.insert(sp_pipe)
	sp_ground = COOP_GetSpawnPointGroup("sp_ground")
	spawnPoints.insert(sp_ground)
	sp_ledge = COOP_GetSpawnPointGroup("sp_ledge")
	spawnPoints.insert(sp_ledge)

	RegisterEndless()	
end

function MissionStart()
	multiplayer.assets.grp_dropship = Group_Create("grp_dropship")
	grp_weirdboyHelp = Group_Create("grp_weirdboyHelp")
	multiplayer.assets.grp_weirdboy = Group_Create("grp_weirdboy")
	StartWavesEndless(trig_startArena)
	RegisterPlayerEvents()
end

function MissionComplete()

end

function OnCleanup() --f_26

end