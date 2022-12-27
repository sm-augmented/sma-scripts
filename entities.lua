Entity_SetInvulnerable(playerEnt, 1)
Entity_StartEntityAction(playerEnt, "kill_all")
Hud_ShowText(LOCAL, tostring(pos.x + rx) .. " " .. tostring(pos.y + ry) .. " " .. tostring(pos.z), "", 5.0)
local playergroup = Player_GetGroupHuman()
Group_SetInvulnerable(playergroup, 1)
Entity_SetRotation(Group_GetEntityAt(grp_dropship, 1.0), POS(0, 0, 0))
Group_AddModifier(testGr, MT_CanBeInteractedWith, MOT_Enable, -1.0, -1.0)
Group_SetVisible(testGr, false)
Group_SetInteractionState(testGr, "off")
Group_EnableWargearAbilities(playergroup, true)
Entity_SetWargearAbilitiesEnabled

--! Get player
local player = Player_GetLocal()
local playerEnt = Player_GetEntity(player)

--! Prespawned
local preSpawned = Group_Create("")
Group_Clear(preSpawned)
Group_GetAllEntitiesOnTeam(preSpawned, 1)

local groupHuman = Player_GetGroupHuman()
local preSpawnedOrk = Group_Create("preSpawnedEnemiesOrk")
Group_Clear(preSpawnedOrk)
Group_GetAllEntitiesOnTeam(preSpawnedOrk, TEAM_ORK)
local preSpawnedChaos = Group_Create("preSpawnedEnemiesChaos")
Group_Clear(preSpawnedChaos)
Group_GetAllEntitiesOnTeam(preSpawnedChaos, TEAM_CHAOS)
Group_IgnoreGroup(preSpawnedOrk, preSpawnedChaos)
Group_IgnoreGroup(preSpawnedChaos, preSpawnedOrk)
Group_IgnoreGroup(preSpawnedOrk, groupHuman)
Group_IgnoreGroup(preSpawnedChaos, groupHuman)
Cmd_Idle(preSpawnedOrk)
Cmd_Idle(preSpawnedChaos)
Group_IgnoreAllTargets(preSpawnedOrk)
Group_IgnoreAllTargets(preSpawnedChaos)

--! Alive/Cap
World_SetCharacterCap(100)
Hud_ShowText(LOCAL, tostring(World_GetAnimatingNPCCount()) .. " " .. tostring(Group_Count(multiplayer.assets.grp_currentWave)) .. " " .. tostring(Group_Count(multiplayer.assets.grp_allies)), "", 5.0)
Hud_ShowText(LOCAL, tostring(Entity_GetBlueprintName(Group_GetEntityAt(multiplayer.assets.grp_currentWave, 1))), "", 5.0)

--! Kill
Group_Kill(multiplayer.assets.grp_currentWave)
Group_Kill(multiplayer.assets.grp_allies)
Group_Kill(grp_weirdboy)

--! Eternal Warrior
local playerEnt = Player_GetEntity(Player_GetLocal())
local hasEternalWarrior = Entity_HasWargearEquipped(playerEnt, "wargear\\wargear\\multiplayer\\common\\abilities\\mp_ability_area_healing")
if hasEternalWarrior then
  ApothEternalLessThanRestart(nil, playerEnt)
end