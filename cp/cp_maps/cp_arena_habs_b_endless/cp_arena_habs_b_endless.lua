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

function StartWaveEndless(waveNum)
	if multiplayer.assets.currentWave.wbHudEvt ~= nil then
		Event_RemoveImmediate(multiplayer.assets.currentWave.wbHudEvt)
		multiplayer.assets.currentWave.wbHudEvt = nil
	end

	StartWaveEndlessBase(waveNum)	

	if waveNum == 10 then
		multiplayer.assets.currentWave.waveLength = 1
		multiplayer.assets.currentWave.endLs = ls_waveCompleteLoyalsVsBoss
		Event_AddTimer(networkFunctions.spawnWeirdboy, 2.0, false)
	else
		local rnd = math.random(1, table.getn(factionsAvailable) + 1)
		if rnd > table.getn(factionsAvailable) then
			multiplayer.assets.currentWave.faction = nil
		else
			multiplayer.assets.currentWave.faction = factionsAvailable[rnd]
		end
		SetWaveEndLs(multiplayer.assets.currentWave.faction)
		Event_AddTimer(networkFunctions.coop_spawnWave, 2.0, false)
	end
	
	Event_AddEntityDeath(networkFunctions.checkForWaveSpawn, multiplayer.assets.grp_currentWave)
end

networkFunctions.spawnWeirdboy = function (event)
	SpawnWeirdboy()
end

function SpawnWeirdboy()
	COOP_RequestSpawn(ork_coop_weirdboy_boss, sp_ledge_15, nil, nil, true, multiplayer.assets.grp_currentWave, true, true)
	Group_Add(multiplayer.assets.grp_weirdboy, Group_GetEntityAt(multiplayer.assets._coop_spawnRequest, 1.0))
	networkFunctions.WeirdboyFirstActSpawnIn()
end

function PlayerJoined(evt, arg0)
	print(arg0)
	Hud_ShowText(LOCAL, tostring(arg0), "", 5.0)
end

function MissionStartNetwork()
	print("MissionStartNetwork")
	InitLuaSafe()

	sp_pipe = COOP_GetSpawnPointGroup("sp_pipe")
	spawnPoints.insert(sp_pipe)
	sp_ground = COOP_GetSpawnPointGroup("sp_ground")
	spawnPoints.insert(sp_ground)
	sp_ledge = COOP_GetSpawnPointGroup("sp_ledge")
	spawnPoints.insert(sp_ledge)

	Network_RegisterStaticVarByRef(multiplayer.assets.upgrades, "regUpgrades")

	RegisterEndless()	
end

function MissionStart()
	multiplayer.assets.grp_dropship = Group_Create("grp_dropship")
	grp_weirdboyHelp = Group_Create("grp_weirdboyHelp")
	multiplayer.assets.grp_weirdboy = Group_Create("grp_weirdboy")
	--Group_SetInvulnerable(grp_dropship, true)
	StartWavesEndless(trig_startArena)

	Event_AddPlayerCreated(PlayerJoined)
	Event_AddPlayerSpawned(OnPlayerSpawned)
end

function MissionComplete()

end

function OnCleanup() --f_26

end

function OnPlayerSpawned(evt, player)
	local playerId = Player_GetID(player)
	local strs = multiplayer.assets.upgrades[playerId]
	if strs ~= nil then
		LocalCommand.Add({["command"] = LocalCommand.SendUpgradeString, ["playerId"] = playerId, ["upgrade"] = strs})
	end
end

LocalCommand.SendUpgradeString = function (arg0)
	local player = Player_GetLocal()
	Hud_ShowText(LOCAL, tostring(Player_GetID(player)), "", 5.0)
	local it
	for it = 1, Player_Count(), 1 do
		local player = Player_GetAt(it)
		if Player_GetID(player) == arg0.playerId and Player_HasEntity(player) then
			local playerEnt = Player_GetEntity(player)
			Entity_AddStringModifier(playerEnt, arg0.upgrade)
		end
	end	
end