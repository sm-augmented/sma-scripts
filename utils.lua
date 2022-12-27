save_table_deep(multiplayer.Unit, "munit.txt")
save_table_deep(multiplayer.assets, "massets.txt")
save_table_deep(multiplayer, "multiplayer.txt")
save_table_deep(networkFunctions, "netF.txt")
Game_AddCoopXP(TEAM_MARINE, 50000.0)
multiplayer.assets.currentWave.index = 20
World_DestroyDeadEntities()

--! POS
local var2 = Group_GetEntityAt(Player_GetGroupHuman(), 1)
local var3 = Util_GetPosition(var2)
local var4 = POS(var3.x, var3.y, var3.z + 4.0)
local var5 = Entity_GetID(var2)
local var6 = UI_ShowDecorator(var4, PDT_Coop2)

--! Regions
World_Load_Region("s_027_wrld", "", true)
World_Load_Region("s_027_sky", "", true)
World_Load_Region("s_027_r600_airlock_ride", "", true)

--! Blockers
MovementBlocker_SetGroupCategory(mkr_portal_blocker_01, COLLISION_ENTITY_GROUP_CATEGORY_NONE)
MovementBlocker_SetGroupCategory(mkr_portal_blocker_02, COLLISION_ENTITY_GROUP_CATEGORY_NONE)
MovementBlocker_SetGroupCategory(mb_droppod, COLLISION_ENTITY_GROUP_CATEGORY_NONE)

--! Droppod
Group_SetVisible(grp_DropPod, false)
Group_TriggerAnimationEvent(grp_DropPod, "START_Sky")
Group_SetVisible(grp_DropPod, true)
Group_TriggerAnimationEvent(grp_DropPod, "ACTN_DropPod")

--! Wave len
multiplayer.assets.currentWave.waveLength = 1000
multiplayer.assets.currentWave.index = 20

--! Camera
Camera_LookAtEntity(Group_GetEntityAt(playergroup, 1), 10, 0.0, 0.0, POS(10.0, 0.0, 0.0), POS(10.0, 0.0, 0.0))
Camera_LookAt(mkr_lookAtTrain, 6.0, 0.0, 2.0, POS(30.0, 50.0, 1.5))