require("Util/Common")
require("Util/Scarutil")
require("Util/CP/CP_Common")
require("Util/CP/CP_Const")
require("Util/CP/CP_util_new")
require("Util/CP/CP_AutomatedTurrets")
require("Util/CP/Endless/CP_Endless")

multiplayer.assets.csp_firing = nil
multiplayer.objectiveData = {
}
arenaNum = 1.0
thisArena = "s_027_r500_bridges"
arenaExit = "mkr_labs_d_exit"

factionsAvailable = {
	"orks", "chaos"
}

spawnPoints = {
	Sp_chaosFirstLine_01,
	Sp_chaosFirstLine_02,
	Sp_chaosFirstLine_03,
	Sp_chaosFirstLine_04,
	Sp_chaosFirstLine_05
}

local OnStartOriginal = OnStart
OnStart = function (arg0)
	print('QQQQQQQQQQQQQQQQQQQQQQQQQQQQ')
	OnStartOriginal(arg0)
	World_Load_Region("s_027_wrld", "", false)
	World_Load_Region("s_027_sky", "", false)
	--World_Load_Region("s_027_r600_airlock_ride", "", false)
end

-- Server and client
function MissionStartNetwork()
	multiplayer.NetworkRegisterList(LocalCommand)
	RegisterEndless()
end

-- Server only
function MissionStart()	
	SetUpTesting()

  local var0, var1, var2, var3

	var0 = Player_Count()
	for i0 = 1.0, var0, 1.0 do
		multiplayer.assets.playersSpawned[Player_GetID(Player_GetAt(i0))] = false
	end
	
	if thisArena ~= nil then
		if chaosMission == true then
			Coop_SetupChaosPortal()			
		end

		if not multiplayer.assets._coop_spawnedUnits then
			multiplayer.assets._coop_spawnedUnits = Group_Create("_coop_spawnedUnits")
		end

		--Coop_SetupArenaDoors()
	end

	_coopStartWaves()

	--COOP_StartWavesAtTrigger(trigger)
	Game_SetCoopTokenSettings(5000.0, 3.0, 4.0, 1000.0)
	Event_AddPlayerSpawned(networkFunctions.noDeathsFail)
	Event_AddPlayerDeleted(networkFunctions.coop_checkFailCondition)
	Event_AddEntityDeath(networkFunctions.coop_checkFailCondition, Player_GetGroupHuman())
end

function MissionComplete() --f_2

end

function OnCleanup() --f_3
end