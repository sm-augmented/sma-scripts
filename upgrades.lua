LocalCommand.Add({["command"] = LocalCommand.SendUpgradeString, ["playerId"] = playerId, ["upgrade"] = "death_company_set"})

-- ! Manual upgrade application
local player = Player_GetLocal()
local playerEnt = Player_GetEntity(player)
Entity_AddStringModifier(playerEnt, 'eac_weapon_bolter_godwyn_golden')
Entity_RemoveStringModifier(playerEnt, 'faction_csm')
Entity_AddStringModifier(playerEnt, 'faction_sm')
Entity_AddStringModifier(playerEnt, 'eac_helmet_visor_mk2_breacher')