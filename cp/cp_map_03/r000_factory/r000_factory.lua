require("Util/Common")
require("Util/Scarutil")
require("Util/CP/CP_Common")
require("Util/CP/CP_AutomatedTurrets")

multiplayer.assets.playerUpgrades = NetworkFriendly({})
multiplayer.assets.csp_firing = nil
multiplayer.objectiveData = {
    presetObjectives.TeamDeathmatchTimer
}
arenaNum = 1.0
thisArena = "cp_arena_labs_d"

function MissionStartNetworkReal()
		sp_north_01 = {sp_wave1_04}
    sp_north_02 = {sp_wave1_03}
	
    wave1 = {
        5.0,
        {
            ebp = cp_ork_nob_melee_pro,
            unitAmount = 1.0,
            spawnPoints = sp_north_01,
            aware = true,
            spawnFX = true
				}
    }
		
    networkFunctions.setTanksInvulnerable()		
    COOP_RegisterWaves(wave1, wave1, wave1, wave1, wave1, wave1, wave1, wave1, wave1, wave1, wave1, wave1, wave1, wave1)
end

function MissionStartNetwork()
	InitLuaSafe()
		local status, err = pcall(MissionStartNetworkReal)
		if (status) then
		else
				--print(err)
				Hud_ShowText(LOCAL, err, "", 5.0) --os == nil and 'true' or 'false'
		end
end

function UpdateTargets()
	local groupHuman = Player_GetGroupHuman()
	local preSpawnedOrk = Group_Create("preSpawnedEnemiesOrk")
	Group_Clear(preSpawnedOrk)
	Group_GetAllEntitiesOnTeam(preSpawnedOrk, TEAM_ORK)
	local preSpawnedChaos = Group_Create("preSpawnedEnemiesChaos")
	Group_Clear(preSpawnedChaos)
	Group_GetAllEntitiesOnTeam(preSpawnedChaos, TEAM_CHAOS)
	--Group_GetAllEntitiesOnTeam(preSpawned, TEAM_MARINE)
	Group_IgnoreGroup(preSpawnedOrk, preSpawnedChaos)
	Group_IgnoreGroup(preSpawnedChaos, preSpawnedOrk)
	Group_IgnoreGroup(preSpawnedOrk, groupHuman)
	Group_IgnoreGroup(preSpawnedChaos, groupHuman)
	Cmd_Idle(preSpawnedOrk)
	Cmd_Idle(preSpawnedChaos)
	-- Cmd_Pause(preSpawnedOrk)
	-- Cmd_Pause(preSpawnedChaos)
	Group_IgnoreAllTargets(preSpawnedOrk)
	Group_IgnoreAllTargets(preSpawnedChaos)
	--Cmd_Attack(preSpawnedOrk, groupHuman, 0.0)
	--Cmd_Attack(preSpawnedChaos, groupHuman, 0.0)
	--Group_SetTargetToGroup(preSpawnedOrk, groupHuman, 0.0)
	--Group_SetTargetToGroup(preSpawnedChaos, groupHuman, 0.0)
end

function SetRespawn()
	local groupHuman = Player_GetGroupHuman()
	local preSpawnedOrk = Group_Create("preSpawnedEnemiesOrk")
	Group_Clear(preSpawnedOrk)
	Group_GetAllEntitiesOnTeam(preSpawnedOrk, TEAM_ORK)
	local preSpawnedChaos = Group_Create("preSpawnedEnemiesChaos")
	Group_Clear(preSpawnedChaos)
	Group_GetAllEntitiesOnTeam(preSpawnedChaos, TEAM_CHAOS)
	Event_AddEntityDeath(RespawnEntitySafe, preSpawnedOrk)
	Event_AddEntityDeath(RespawnEntitySafe, preSpawnedChaos)
end

function RespawnEntitySafe(arg0, killed, arg2, arg3, arg4)
	local status, err = pcall(RespawnEntity, killed)
	if (status) then
	else
			print(err)
			Hud_ShowText(LOCAL, err, "", 5.0) --os == nil and 'true' or 'false'
	end
end

function RespawnEntity(killed)
	local groupHuman = Player_GetGroupHuman()
	local killedName = Entity_GetBlueprintName(killed)
	local spawnedGr = Group_Create("spawnedGr")
	Group_Clear(spawnedGr)
	local spawned = Group_SpawnAtEntityMarker(spawnedGr, killedName, killed, "RIG_Root")
	Group_Detach(spawnedGr)
	Entity_SetRotation(spawned, Util_GetOrientation(killed))
	Entity_SetPosition(spawned, Util_GetPosition(killed))
	--Entity_FixCollisionHack(spawned)
	Group_IgnoreGroup(spawnedGr, groupHuman)
	Cmd_Idle(spawnedGr)
	Cmd_Pause(spawnedGr)
	Group_IgnoreAllTargets(spawnedGr)
end

function MissionStart()
	Event_AddTimer(UpdateTargets, 0.5, true)
	Event_AddTimer(SetRespawn, 0.5, false)
	COOP_StartWaves(trig_start)
	RegisterPlayerEvents()
end

function MissionComplete() --f_2
end

function OnCleanup() --f_3
end