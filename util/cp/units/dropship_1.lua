networkFunctions.SpawnDropship = function () --f_19
	Group_SpawnEntities(grp_dropship, cp_ork_dropship.bp, mkr_Dropship_Destination, 1.0)
	Group_TriggerAnimationEvent(grp_dropship, "EVT_Dropship_Enter")
	Event_AddTimer(networkFunctions.DropshipPlayIdle, 9.0, ONESHOT)
end

networkFunctions.DropshipPlayIdle = function () --f_20
	Group_TriggerAnimationEvent(grp_dropship, "EVT_Dropship_Idle")
	multiplayer.assets.dropshipSpawn = Event_AddTimer(networkFunctions.DropshipSpawn, 1.5, true)
	Event_AddTimer(networkFunctions.DropshipPlayExit, 9.0, ONESHOT)
end

networkFunctions.DropshipSpawn = function () --f_21
	local var0 = Group_GetEntityAt(grp_dropship, 1.0)
	local entity = Group_SpawnAtEntityMarker(multiplayer.assets.grp_currentWave, cp_ork_boy_melee_pro.bp, var0, "MKR_Ork_bottom_01")
	Entity_TriggerAnimationEvent(entity, "MakeUpright")
end

networkFunctions.DropshipPlayExit = function () --f_22
	Event_Remove(multiplayer.assets.dropshipSpawn)
	Group_TriggerAnimationEvent(grp_dropship, "EVT_Dropship_Exit")
	Event_AddTimer(networkFunctions.DropshipDespawn, 10.0, ONESHOT)
end

networkFunctions.DropshipDespawn = function () --f_23
	Group_DespawnEntities(grp_dropship)
end