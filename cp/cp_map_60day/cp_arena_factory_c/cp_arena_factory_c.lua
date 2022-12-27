require("Util/Common")
require("Util/MissionTask")
require("Util/CP/CP_Common")
require("Util/CP/CP_Func")
require("Util/CP/Endless/CP_Endless")

multiplayer.objectiveData = {}
chaosMission = true
arenaNum = 1.0
thisArena = "CP_Arena_factory_c"
arenaExit = "mkr_factory_c_exit"

spawnPoints = {
	sp_midFloor_01,
	sp_midFloor_02,
	sp_back_02,
	sp_back_03, 
	sp_back_04,
	sp_hallway_02,
	sp_front_05,
	sp_front_03,
	sp_hallway_03, 
	sp_front_06,
	sp_basement_01,
	sp_midFloor_03,
	sp_midFloor_04,
	sp_middle_03,
}

factionsAvailable = {
	"loyals", "orks" 
}

function coopStartWavesSafe()
	multiplayer.assets.grp_currentWave = Group_Create("grp_currentWave")
	multiplayer.assets.currentWave.fog = false

	if chaosMission == true then
		Marker_StopFX(portal_enter)
		local var4 = Util_GetRandomNumber(1.0, table.getn(sp_chaos_startOfArena))
		Coop_Audio2D(sp_chaos_startOfArena[var4])
	else
		Coop_Audio2D(sp_graia_startOfArena[1.0])
	end

	if multiplayer.assets.entranceData.event ~= nil then
		multiplayer.assets.entranceData.event2 = Event_AddTimer(networkFunctions.coop_enterArenaFailsafe, 15.0, false)
	end

	multiplayer.assets.enemyStuckFailsafe = Event_AddTimer(networkFunctions.coop_enemyStuckFailsafe, 30.0, true)
	
	table.remove(factionsAvailable,math.random(1,2))

	StartWaveEndless(1.0)
end

function MissionStartNetwork() 
	InitLuaSafe()
	RegisterEndless()
end

function MissionStart() 
	StartWavesEndless(trig_start_arena)
	RegisterPlayerEvents()
end