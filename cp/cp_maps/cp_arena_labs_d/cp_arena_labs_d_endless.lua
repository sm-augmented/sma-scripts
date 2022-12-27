require("Util/Common")
require("Util/Scarutil")
require("Util/CP/CP_Common")
require("Util/CP/CP_AutomatedTurrets")
require("Util/CP/Endless/CP_Endless")
require("Util/CP/CP_Func")

multiplayer.assets.csp_firing = nil
multiplayer.objectiveData = {}
arenaNum = 1.0
thisArena = "cp_arena_labs_d"
arenaExit = "mkr_labs_d_exit"

spawnPoints = {
	sp_mid_01,
	sp_mid_02,
	sp_wave1_03,
	sp_wave1_04,
	sp_wave1_05,
	sp_wave2_06,
	sp_wave3_01,
	sp_wave4_03,
	sp_wave4_04,
	sp_wave5_01
}

-- Server and client
function MissionStartNetwork()
	InitLuaSafe()
	RegisterEndless()
end

-- Server only
function MissionStart()
	StartWavesEndless(trig_start)
	RegisterPlayerEvents()

	networkFunctions.AutomatedTurret_Disable01()
	COOP_SetOrkIgnoreGroup(grp_turret1)
	COOP_SetOrkIgnoreGroup(grp_turret2)
	COOP_SetOrkIgnoreGroup(grp_turret3)
	COOP_SetOrkIgnoreGroup(grp_turret4)
	COOP_SetOrkIgnoreGroup(grp_turret5)
end

function MissionComplete() --f_2

end

function OnCleanup() --f_3

end

networkFunctions.AutomatedTurret_Disable01 = function ()
	print("AutomatedTurret_Disable01")
	AutomatedTurret_Disable(grp_turret1)
	AutomatedTurret_Disable(grp_turret2)
	AutomatedTurret_Disable(grp_turret3)
	AutomatedTurret_Disable(grp_turret4)
	AutomatedTurret_Disable(grp_turret5)
end