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
	Cmd_Attack(preSpawnedOrk, groupHuman, 0.0)
	Cmd_Attack(preSpawnedChaos, groupHuman, 0.0)
	Group_SetTargetToGroup(preSpawnedOrk, groupHuman, 0.0)
	Group_SetTargetToGroup(preSpawnedChaos, groupHuman, 0.0)
	--Group_SetTargetToGroup(var1, grp_player, 10.0)
end

function MissionStart()
	Event_AddTimer(UpdateTargets, 0.5, true)	
	COOP_StartWaves(trig_start)
	Game_AddCoopXP(TEAM_MARINE, 500000.0)
	RegisterPlayerEvents()
end

function MissionComplete() --f_2
end

function OnCleanup() --f_3
end