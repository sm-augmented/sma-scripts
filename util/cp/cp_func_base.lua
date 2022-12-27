playerUpgrades = {
}

onSacredDutyHitEvent = nil
onPlayerSpawnedEvent = nil
onPlayerLeftEvent = nil
onPlayerDeathEvents = {

}
onPlayerInteractEvents = {

}

pickup_mp_drop_ammo_coop = 'ebps\\props\\pickup_mp_drop_ammo_coop'
ammoStoresPerk = 'wargear\\wargear\\multiplayer\\common\\perks\\mp_perk_starting_ammo'
apothecaryClass = 'wargear\\wargear\\multiplayer\\wargear_new\\new_wargear_90'
sacredDutyPerk = 'wargear\\wargear\\multiplayer\\wargear_new\\new_wargear_60'
apoAoEAbility = 'wargear\\wargear\\multiplayer\\wargear_new\\new_wargear_51'
commemorationPerk = 'wargear\\wargear\\multiplayer\\wargear_new\\new_wargear_63'

function OnServerMigrationSafe()
	ClearEvents()
	RegisterPlayerEventsAll()
	RegisterAliveEvents()
end

function ClearEvents()
	if onPlayerSpawnedEvent ~= nil then
		Event_RemoveImmediate(onPlayerSpawnedEvent)
	end
	if onPlayerLeftEvent ~= nil then
		Event_RemoveImmediate(onPlayerLeftEvent)
	end
	if onSacredDutyHitEvent ~= nil then
		Event_RemoveImmediate(onSacredDutyHitEvent)
	end
	for plId, evt in pairs(onPlayerInteractEvents) do
		Event_RemoveImmediate(evt)
		onPlayerInteractEvents[plId] = nil
	end
	for plId, evt in pairs(onPlayerDeathEvents) do
		Event_RemoveImmediate(evt)
		onPlayerDeathEvents[plId] = nil
	end
end

function RegisterAliveEvents()
	local it
	for it = 1, Player_Count(), 1 do
		local player = Player_GetAt(it)
		local hasEnt = Player_HasEntity(player)
		if hasEnt then
			RegisterInteractEvent(player)
			RegisterDeathEvent(player)
		end
	end
end

function InitLua()
	local pl = Player_GetLocal()
	local id = Player_GetID(pl)
	local team = Player_GetTeam(pl)
	--print("InitLua.Begin: " .. tostring(id))
	local luafunc = package.loadlib("SMA.dll", "ProxyCall")
	luafunc(id, team)
	--print("InitLua.End")
end

function InitLuaSafe()
	local status, err = pcall(InitLua)
end

function AcceptUpgradeStringSafe(id, str)
	--print("AcceptUpgradeString.Begin: " .. tostring(id))

	playerUpgrades[id] = str
	SendUpgradeSafe({playerId = id})
	--print("AcceptUpgradeString.End: " .. tostring(id))
end

function AcceptUpgradeString(id, str)
	local status, err = pcall(AcceptUpgradeStringSafe, id, str)
	-- if (status) then
	-- else
	-- 		print("AcceptUpgradeString: " .. err)
	-- end
end

function RegisterPlayerEventsSafe()
	onPlayerSpawnedEvent = Event_AddPlayerSpawned(OnPlayerSpawned)
	onPlayerLeftEvent = Event_AddPlayerDeleted(OnPlayerLeft)
	onSacredDutyHitEvent = Event_AddEntityDamaged(OnSacredDutyHit, Player_GetGroupAll())
end

function OnSacredDutyHit(evt, target, maybeSource, wargear, dmg)
	--print(tostring(target) .. " :: " .. tostring(wargear) .. " :: " .. tostring(dmg))
	if wargear == apoAoEAbility then
		local hasApo = Entity_HasWargearEquipped(target, apothecaryClass)
		local hasSacred = Entity_HasWargearEquipped(target, sacredDutyPerk)
		--print(tostring(hasApo) .. " :: " .. tostring(hasSacred))
		if hasApo and hasSacred then
			local closestSacredToken = Group_GetClosestEntity(multiplayer.assets.grp_sacredDuty, target)
			--print(tostring(closestSacredToken))
			if closestSacredToken ~= nil then
				local targPos = Util_GetPosition(target)
				local tokenPos = Util_GetPosition(closestSacredToken)
				local dist = Util_GetDistance(targPos, tokenPos)
				--print(tostring(dist) .. " :: " .. tostring(dist <= 5))
				if dist <= 7.5 then
					Coop_GrantXP(5000)
					Group_RemoveEntity(multiplayer.assets.grp_sacredDuty, closestSacredToken)
					Entity_Kill(closestSacredToken)
					--print("yay gave XP")
				end
			end
		end
	end
end

function RegisterPlayerEventsAll()
	local status, err = pcall(RegisterPlayerEventsSafe)
	-- if (status) then
	-- else
	-- 		print("RegisterPlayerEvents: " .. err)
	-- end
end

function RegisterPlayerEvents()
	multiplayer.assets.grp_sacredDuty = Group_Create("grp_sacredDuty")
	RegisterPlayerEventsAll()
end

function OnPlayerLeft(evt, player)
	--print('LEFT!!! ' .. tostring(player))
	local playerId = Player_GetID(player)
	if onPlayerInteractEvents[playerId] ~= nil then
		Event_RemoveImmediate(onPlayerInteractEvents[playerId])
		onPlayerInteractEvents[playerId] = nil
	end
	if onPlayerDeathEvents[playerId] ~= nil then
		Event_RemoveImmediate(onPlayerDeathEvents[playerId])
		onPlayerDeathEvents[playerId] = nil
	end
end

function OnPlayerDied(evt, entity)
	--print('DIED!!! ' .. tostring(entity))
	local player = Entity_GetPlayer(entity)
	local playerId = Player_GetID(player)
	if onPlayerInteractEvents[playerId] ~= nil then
		Event_RemoveImmediate(onPlayerInteractEvents[playerId])
		onPlayerInteractEvents[playerId] = nil
	end
	if onPlayerDeathEvents[playerId] ~= nil then
		Event_RemoveImmediate(onPlayerDeathEvents[playerId])
		onPlayerDeathEvents[playerId] = nil
	end

	SpawnSacredDutyToken(entity)
	GiveCommemorationEffect()
end

sacred_duty_token = {["bp"] = "ebps\\sacred_duty_token",
["readableName"] = 122342.0}

function SpawnSacredDutyToken(entity)
	local pos = Entity_GetPosition(entity)
	COOP_RequestSpawn(sacred_duty_token, POS(pos.x, pos.y, pos.z + 1), nil, nil, true, multiplayer.assets.grp_sacredDuty, false, false)
end

function GiveCommemorationEffect()
	local hasCommPlayer = false
	local it
	for it = 1, Player_Count(), 1 do
		local player = Player_GetAt(it)
		local hasEnt = Player_HasEntity(player)
		if hasEnt then
			local target = Player_GetEntity(player)
			local hasApo = Entity_HasWargearEquipped(target, apothecaryClass)
			local hasComm = Entity_HasWargearEquipped(target, commemorationPerk)
			if hasApo and hasComm then
				hasCommPlayer = true
				break
			end
		end
	end

	if hasCommPlayer then
		for it = 1, Player_Count(), 1 do
			local player = Player_GetAt(it)
			local hasEnt = Player_HasEntity(player)
			if hasEnt then
				local target = Player_GetEntity(player)
				Entity_AddPersistentModifier(target, "rwdho", MT_ReceivedWorldDamageHealthOnly, MOT_Multiplication, 0.001, 10)
				Entity_AddPersistentModifier(target, "rmdho", MT_ReceivedMeleeDamageHealthOnly, MOT_Multiplication, 0.001, 10)
				Entity_AddPersistentModifier(target, "rrdho", MT_ReceivedRangedDamageHealthOnly, MOT_Multiplication, 0.001, 10)
				Entity_AddPersistentModifier(target, "redho", MT_ReceivedExplosiveDamageHealthOnly, MOT_Multiplication, 0.001, 10)
			end
		end
	end
end

function RegisterDeathEvent(player)
	local playerId = Player_GetID(player)
	local playerEntity = Player_GetEntity(player)
	local playerGr = Group_Create("grAmmoPl_" .. tostring(playerId))
	Group_AddEntity(playerGr, playerEntity)
	local evt = Event_AddEntityDeath(OnPlayerDied, playerGr)
	onPlayerDeathEvents[playerId] = evt
end

function RegisterInteractEvent(player)
	local playerId = Player_GetID(player)
	local playerEntity = Player_GetEntity(player)
	local playerGr = Group_Create("grAmmoPl_" .. tostring(playerId))
	Group_AddEntity(playerGr, playerEntity)

	local onPlayerInteracted = function (evt, unk, interactEntity, stateAction, stateName)
		--print('INTERACTED!!! ' .. tostring(playerId))
		local hasAmmos = Entity_HasWargearEquipped(playerEntity, ammoStoresPerk)
		--print('hasAmmos and stateAction == IE_EnterState and stateName == "collected": ' .. tostring(hasAmmos and stateAction == IE_EnterState and stateName == "collected"))
		if hasAmmos and stateAction == IE_EnterState and stateName == "collected" then
			local interactBlueprint = Entity_GetBlueprintName(interactEntity)
			--print('interactBlueprint: ' .. tostring(interactBlueprint))
			if interactBlueprint == pickup_mp_drop_ammo_coop then
				GiveAmmoToPlayersExcept(playerId)
			end
		end
	end

	local evt = Event_AddEntityInteraction(onPlayerInteracted, playerGr)
	onPlayerInteractEvents[playerId] = evt
end

function GiveAmmoToPlayersExcept(playerId)
	local it
	for it = 1, Player_Count(), 1 do
		local player = Player_GetAt(it)
		local plId = Player_GetID(player)
		local hasEnt = Player_HasEntity(player)
		--print('plId: ' .. tostring(plId) .. ':: hasEnt: ' .. tostring(hasEnt))
		if playerId ~= plId and hasEnt then
			local entity = Player_GetEntity(player)
			Entity_StartEntityAction(entity, "give_ammo_ammos")
			--print('gaveAmmo')
		end
	end
end

function OnPlayerSpawnedSafe(player)
	local playerId = Player_GetID(player)
	--print("OnPlayerSpawned.Begin: " .. tostring(playerId))
	LocalCommand.Add({["command"] = LocalCommand.SendUpgradeString, ["playerId"] = playerId})
	RegisterInteractEvent(player)
	RegisterDeathEvent(player)
	--print("OnPlayerSpawned.End: " .. tostring(playerId))
end

function OnPlayerSpawned(evt, player)
	local status, err = pcall(OnPlayerSpawnedSafe, player)
	if (status) then
	else
			print("OnPlayerSpawned: " .. err)
	end
end

function SendUpgradeSafe(arg0)
	--print("SendUpgradeString.Begin: " .. tostring(arg0.playerId))
	local it
	for it = 1, Player_Count(), 1 do
		local player = Player_GetAt(it)
		if Player_GetID(player) == arg0.playerId then
			local hasEnt = Player_HasEntity(player)
			local hasUpgrs = playerUpgrades[arg0.playerId] ~= nil
			--print("SendUpgradeString.Found: " .. tostring(arg0.playerId) .. ". Has entity: " .. tostring(hasEnt) .. ". Has upgrades: " .. tostring(hasUpgrs))
			if hasEnt and hasUpgrs then
				--print("SendUpgradeString.Applying: " .. tostring(arg0.playerId))
				local playerEnt = Player_GetEntity(player)
				local team = Player_GetTeam(player)
				if team == 1 then
					Entity_AddStringModifier(playerEnt, "faction_sm")
				else
					Entity_AddStringModifier(playerEnt, "faction_csm")
				end
				for k, upg in pairs(playerUpgrades[arg0.playerId]) do
					Entity_AddStringModifier(playerEnt, upg)
				end
				--print("SendUpgradeString.DoneApplying: " .. tostring(arg0.playerId))
			--else
			--	print("SendUpgradeString.CantApply: " .. tostring(arg0.playerId))
			end
		end
	end
	--print("SendUpgradeString.End: " .. tostring(arg0.playerId))
end

LocalCommand.SendUpgradeString = function (arg0)
	local status, err = pcall(SendUpgradeSafe, arg0)
	-- if (status) then
	-- else
	-- 		print("SendUpgradeString: " .. err)
	-- end
end