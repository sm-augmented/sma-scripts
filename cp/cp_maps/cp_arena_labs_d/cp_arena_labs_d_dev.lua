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
--arenaExit = "mkr_labs_d_exit"
--nextArena = "cp_arena_labs_a"
--nextArenaEnter = "mkr_labs_a_entrance"

local OnStartOriginal = OnStart
OnStart = function (arg0)
	print("testeeeee")
	--Event_AddTimer(testFunc, 3.0, true)
	--Event_AddPlayerCreated(testFunc2331)
	OnStartOriginal(arg0)
	print("doneOnStart")
end

local OnNetworkInitOriginal = OnNetworkInit
OnNetworkInit = function (arg0)
	OnNetworkInitOriginal(arg0)
	print("doneOnNetworkInit")
	local luafunc = package.loadlib("SMA.dll", "Function1")
	luafunc()
end

-- Server and client
function MissionStartNetwork() --f_0
		print("MissionStartNetwork")
    SpeechManager_Setup("s040")
    sp_north_01 = {sp_wave1_04}
    sp_north_02 = {sp_wave1_03}
    sp_wave1 = COOP_GetSpawnPointGroup("sp_wave1_01")
    sp_wave1_near = COOP_GetSpawnPointGroup("sp_wave1_02")
    sp_wave1_far = COOP_GetSpawnPointGroup("sp_wave1_04")
    sp_wave_after = COOP_GetSpawnPointGroup("sp_wave1_03")
    sp_wave_after_02 = COOP_GetSpawnPointGroup("sp_wave1_05")
    sp_wave2 = COOP_GetSpawnPointGroup("sp_wave2_05")
    sp_wave2_01 = COOP_GetSpawnPointGroup("sp_wave2_06")
    sp_wave2_mid = COOP_GetSpawnPointGroup("sp_wave2_04")
    sp_wave2_back = COOP_GetSpawnPointGroup("sp_wave2_03")
    sp_wave2_back_02 = COOP_GetSpawnPointGroup("sp_wave2_07")
    sp_wave3 = COOP_GetSpawnPointGroup("sp_wave3_02")
    sp_wave3_02 = COOP_GetSpawnPointGroup("sp_wave3_01")
    sp_wave3_03 = COOP_GetSpawnPointGroup("sp_wave3_03")
    sp_wave4 = COOP_GetSpawnPointGroup("sp_wave4_01")
    sp_wave4_02 = COOP_GetSpawnPointGroup("sp_wave4_02")
    sp_wave4_03 = COOP_GetSpawnPointGroup("sp_wave4_03")
    sp_wave4_04 = COOP_GetSpawnPointGroup("sp_wave4_04")
    sp_wave5 = COOP_GetSpawnPointGroup("sp_wave5_01")
    sp_wave5_02 = COOP_GetSpawnPointGroup("sp_wave5_02")
    sp_wave5_03 = COOP_GetSpawnPointGroup("sp_wave5_03")
    sp_wave5_04 = COOP_GetSpawnPointGroup("sp_wave5_04")
    sp_wave5_05 = COOP_GetSpawnPointGroup("sp_wave5_05")
    sp_wave5_06 = COOP_GetSpawnPointGroup("sp_wave5_06")

    -- wave3loop = {
        
    -- }

    -- wave5loop = {
        
    -- }

    -- wave5loopCenter = {
        
	-- }
	
		print("MissionStartNetwork")
		local player = Player_GetLocal()
		local playerID = Player_GetID(player)
		local uniqueUpg = "upgrade_pl_" .. playerID
		print("Current player:")
		print(playerID)
		--sharedVariablesRoot.assets.playerUpgrades = NetworkFriendly({})
		sharedVariablesRoot.assets.playerUpgrades[playerID] = uniqueUpg
		--Network_RegisterStaticVarByRef(sharedVariablesRoot.assets.playerUpgradesSsss, uniqueUpg)
		local playersList = sharedVariablesRoot--.assets.teamList[1]--[1].players
		save_table_deep(playersList, "playersList.txt")
		--Event_AddPlayerSpawned(camLook)
		
		--Event_AddTimer(testFunc, 3.0, true)
	
    wave1 = {
        5.0,
        {
            ebp = cp_ork_nob_melee_pro,
            unitAmount = 1.0,
            spawnPoints = sp_north_01,
            aware = true,
            spawnFX = true
				}--,
				-- 5.0,
				-- {
						-- ebp = cp_ork_boy_ranged_pro,
						-- unitAmount = 20.0,
						-- spawnPoints = sp_north_01,
						-- aware = true,
						-- spawnFX = true
				-- },
				-- 5.0,
				-- {
						-- ebp = cp_ork_boy_ranged_pro,
						-- unitAmount = 20.0,
						-- spawnPoints = sp_north_02,
						-- aware = true,
						-- spawnFX = true
				-- },
				-- 5.0,
				-- {
						-- ebp = cp_ork_boy_ranged_pro,
						-- unitAmount = 20.0,
						-- spawnPoints = sp_north_02,
						-- aware = true,
						-- spawnFX = true
				-- }
    }
	
    wave2 = {
        
	}
	
    wave3 = {
        
    }
    
    wave4 = {
        
    }
    
    wave5 = {
        
    }
		
		--Event_AddButtonPressed(BtnPressTest, BUTTON_ABILITY_SET_RANGED_FOURTH)
    
		--print("bef camlook")
    -- local status, err = pcall(camLook)
    -- if (status) then
    -- else
        -- --print(err)
        -- Hud_ShowText(LOCAL, err, "", 5.0) --os == nil and 'true' or 'false'
    -- end
    
    --Hud_ShowText(LOCAL, networkFunctions.setTanksInvulnerable == nil and 'true' or 'false', "", 5.0)
    -- local status, err = pcall()
    -- if (status) then
    -- else
    --     Hud_ShowText(LOCAL, err, "", 2.0)
    -- end
    networkFunctions.setTanksInvulnerable()
		
    COOP_RegisterWaves(wave1, wave1, wave1, wave1, wave1, wave1, wave1, wave1, wave1, wave1, wave1, wave1, wave1, wave1)
end

function ioTest()
    save_table_deep(_G, "global.txt")
end

function camLook()
    print("spawned")
end

function BtnPressTestSafe1(arg0)
		--print("in BtnPressTestSafe1")
    local status, err = pcall(BtnPressTest1)
    if (status) then
    else
        --print(err)
        Hud_ShowText(LOCAL, err, "", 5.0) --os == nil and 'true' or 'false'
    end
end

ammoSwitched = false

function BtnPressTest1()
		--print("in BtnPressTest1")
    local player = Player_GetEntity(Player_GetLocal())
    local wargear = Entity_GetWargearEquipped(player, WargearSlot_Ranged1)
    --Hud_ShowText(LOCAL, wargear, "", 5.0)
    if (ammoSwitched) then
        Entity_RemoveStringModifier(player, "ammo_switch_test")
        Hud_ShowText(LOCAL, "Switched to Frag missiles", "", 5.0)
        ammoSwitched = false
    else
        Entity_AddStringModifier(player, "ammo_switch_test")
        Hud_ShowText(LOCAL, "Switched to Krak missiles", "", 5.0)
        ammoSwitched = true
    end
    --local pos = Entity_GetPosition(var3)
    --pos.x = pos.x + 10
    --Entity_SetPosition(var3, pos)
    --SpeechManager_PlayAmbient("s050", "e170", "S005_DESTROY_BATTERY")
    --SpeechManager_PlayCinematicSpeech("s180", "e500", "s180_e500_t1_chaosemrgs")
    --SpeechManager_PlayAmbient("s040", "E100")
	--Group_SetInvulnerable(var2, 1)
    --Audio_PostEvent2D("Play_vogr_scri_anyy_anyy_s000_e370_l008_1480480")
end

function BtnPressTestSafe(arg0)
		--print("in BtnPressTestSafe")
    local status, err = pcall(BtnPressTest)
    if (status) then
    else
        --print(err)
        Hud_ShowText(LOCAL, err, "", 5.0) --os == nil and 'true' or 'false'
    end
end

function BtnPressTest()
		--print("in BtnPressTest")
    --local var2 = Player_GetGroupHuman()
    --local var3 = Group_GetEntityAt(var2, 1.0)
    --local pos = Entity_GetPosition(var3)
    --pos.x = pos.x + 10
    --Entity_SetPosition(var3, pos)
    --SpeechManager_PlayAmbient("s050", "e170", "S005_DESTROY_BATTERY")
    --SpeechManager_PlayCinematicSpeech("s180", "e500", "s180_e500_t1_chaosemrgs")
    --SpeechManager_PlayAmbient("s040", "E100")
		--Group_SetInvulnerable(var2, 1)
    --Audio_PostEvent2D("Play_vogr_scri_anyy_anyy_s000_e370_l008_1480480")
		
		local func_a = loadfile("quicklua.lua")
		func_a()
end

function EnemyDamaged(arg0, arg1, arg2, arg3, arg4) --f_6
	print(arg0)
    print(arg1)
    print(arg2)
    print(arg3)
    print(arg4)
    
    local status, err = pcall(SafeDamage)
    if (status) then
    else
        --print(err)
        --Hud_ShowText(LOCAL, err, "", 5.0) --os == nil and 'true' or 'false'
    end

    -- local var0
	-- var0 = Group_GetHealthFraction(grp_dropship)
	-- if var0 < 0.05000000074505806 then
	-- 	Group_SetInvulnerable(grp_dropship, true)
	-- 	flg_car04Over = true
	-- 	Event_Remove(arg0)
	-- end
end

function SafeDamage()
    local var2 = Player_GetGroupHuman()
		Group_SetInvulnerable(var2, 0)
    --local hp = Group_GetHealthFraction(var2)
    --Group_SetHealthFraction(var2, 0.1)
end

-- Server only
function MissionStart() --f_1   
		print("MissionStart") 
    --local status, err = pcall(ioTest)
    --if (status) then
    --else
        --print(err)
        --Hud_ShowText(LOCAL, err, "", 5.0) --os == nil and 'true' or 'false'
    --end
    
    COOP_StartWaves(trig_start)
    --Hud_SetHudVisibility(false, 0.5)
    --Hud_ShowText(LOCAL, math.abs(-1.0) == 1.0 and 'true' or 'false', "", 5.0) --os == nil and 'true' or 'false'
		networkFunctions.AutomatedTurret_Disable01()
    COOP_SetOrkIgnoreGroup(grp_turret1)
    COOP_SetOrkIgnoreGroup(grp_turret2)
    COOP_SetOrkIgnoreGroup(grp_turret3)
    COOP_SetOrkIgnoreGroup(grp_turret4)
    COOP_SetOrkIgnoreGroup(grp_turret5)
		
		local player = Player_GetLocal()
		local playerID = Player_GetID(player)
		print("Current player:")
		print(playerID)

    Game_SetCoopTokenSettings(1000.0, 1.0, 8.0, 10000.0)
end

function MissionComplete() --f_2
end

function OnCleanup() --f_3
end

networkFunctions.AutomatedTurret_Shoot01 = function ()
    local var0
    var0 = Coop_Audio2D(csp_turrets_firing)
    multiplayer.assets.csp_firing = var0
    csp_turrets_firing = 1.0
    Event_AddTimer(
		networkFunctions.playNextSpeech,
		csp_turrets_firing, true)
end

networkFunctions.AutomatedTurret_Enable01 = function ()
    Coop_Audio2D(csp_turrets_activated)
    AutomatedTurret_Enable(grp_turret1)
    AutomatedTurret_Enable(grp_turret2)
    AutomatedTurret_Enable(grp_turret3)
    AutomatedTurret_Enable(grp_turret4)
    AutomatedTurret_Enable(grp_turret5)
end

networkFunctions.AutomatedTurret_Disable01 = function ()
		print("AutomatedTurret_Disable01")
    AutomatedTurret_Disable(grp_turret1)
    AutomatedTurret_Disable(grp_turret2)
    AutomatedTurret_Disable(grp_turret3)
    AutomatedTurret_Disable(grp_turret4)
    AutomatedTurret_Disable(grp_turret5)
end

networkFunctions.playNextSpeech = function (arg0)
    local var0
    var0 = Audio_IsPlaying(multiplayer.assets.csp_firing)
    if not var0 then
        Coop_Audio2D(csp_turrets_firing_now)
        AutomatedTurret_Shoot(grp_turret1)
        AutomatedTurret_Shoot(grp_turret2)
        AutomatedTurret_Shoot(grp_turret3)
        AutomatedTurret_Shoot(grp_turret4)
        AutomatedTurret_Shoot(grp_turret5)
        Event_Remove(arg0)
    end
end

networkFunctions.ShowWayLeft = function () Marker_PlayFX(mkr_explosionWay_01_Left) end
networkFunctions.StopShowWayLeft = function () Marker_StopFX(mkr_explosionWay_01_Left) end
networkFunctions.ShowWayRight = function () Marker_PlayFX(mkr_explosionWay_01_Right) end
networkFunctions.StopShowWayRight = function () Marker_StopFX(mkr_explosionWay_01_Right) end
networkFunctions.ShowWayFront = function () Marker_PlayFX(mkr_explosionWay_01_Front) end
networkFunctions.StopShowWayFront = function () Marker_StopFX(mkr_explosionWay_01_Front) end
networkFunctions.ShowWayDownRight = function () Marker_PlayFX(mkr_explosionWay_01_DownRight) end
networkFunctions.StopShowWayDownRight = function () Marker_StopFX(mkr_explosionWay_01_DownRight) end
networkFunctions.setTanksInvulnerable = function () 
	print("setTanksInvulnerable")
	Coop_SetInvulnerable(grp_tanks, true) 
end