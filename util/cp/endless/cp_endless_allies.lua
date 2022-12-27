alliesAmountMap = {
	{ wave = 5, count = 5 },
	{ wave = 10, count = 5 },
	{ wave = 15, count = 5 },
	{ wave = 9999, count = 5 }
}

allies = false
addAlliesToEbpString = false

function SetAlliesFaction()
	if chaosMission then	
		multiplayer.assets.currentWave.alliesFaction = "chaos"
	else
		multiplayer.assets.currentWave.alliesFaction = "loyals"
	end
end

function AlterAlliesEbpStrings()
  if addAlliesToEbpString then
    if chaosMission then
      chaos_coop_renegade_ig.bp = "ebps\\multiplayer\\race_chaos\\allies\\chaos_coop_renegade_ig"
      chaos_coop_renegade_ig_melta.bp = "ebps\\multiplayer\\race_chaos\\allies\\chaos_coop_renegade_ig_melta"
      chaos_coop_renegade_ig_glauncher.bp = "ebps\\multiplayer\\race_chaos\\allies\\chaos_coop_renegade_ig_glauncher"
      chaos_coop_renegade_ig_spawn_bl.bp = "ebps\\multiplayer\\race_chaos\\allies\\chaos_coop_renegade_ig_spawn_bl"
      chaos_coop_renegade_ig_melee.bp = "ebps\\multiplayer\\race_chaos\\allies\\chaos_coop_renegade_ig_melee"
      chaos_coop_marine_havok_lc.bp = "ebps\\multiplayer\\race_chaos\\allies\\chaos_coop_marine_havok_lc"
      cp_chaos_bloodletter.bp = "ebps\\multiplayer\\race_chaos\\allies\\chaos_coop_bloodletter"
      cp_chaos_tainted_psyker.bp = "ebps\\multiplayer\\race_chaos\\allies\\chaos_coop_tainted_psyker"
      cp_chaos_marine_bolter.bp = "ebps\\multiplayer\\race_chaos\\allies\\chaos_coop_marine_bolter"
      cp_chaos_marine_havok_pc.bp = "ebps\\multiplayer\\race_chaos\\allies\\chaos_coop_marine_havok_pc"
      chaos_coop_marine_chainsword.bp = "ebps\\multiplayer\\race_chaos\\allies\\chaos_coop_marine_chainsword"
      cp_chaos_marine_melee.bp = "ebps\\multiplayer\\race_chaos\\allies\\chaos_coop_marine_melee"
    end    
  end
end

function MaxAmountAlliesInWave()
	local waveIndex = multiplayer.assets.currentWave.index
	local amountAllies = 5

	local i, v
	for i = 1, table.getn(alliesAmountMap) do
		v = alliesAmountMap[i]
		if waveIndex <= v.wave then
			amountAllies = v.count
			break
		end
	end

	return amountAllies
end

function RandomizeAllyGroup(oFaction)
	local faction = oFaction
	if faction == nil then
		local r = math.random(1, table.getn(factionsAvailable))
		faction = factionsAvailable[r]
	end
	local units, minMap, maxMap, multMap = GetFactionInfo(faction)
	local enMin, enMax = GetMinMaxEnemy(minMap, maxMap)
	local spawnPoint = RandomizeSpawnPoint(spawnPoints)
	local enemyType = RandomizeEnemy(units, enMin, enMax)
	local unitAmount = 1
	return {
		ebp = enemyType,
		unitAmount = unitAmount,
		spawnPoints = spawnPoint,
		aware = true,
		spawnFX = true
	}
end

function SpawnRandomAlliesGroup(faction)
		local newGroup = RandomizeAllyGroup(faction)
		local spawnedAllied = Group_Count(multiplayer.assets.grp_allies)
		local spawned = World_GetAnimatingNPCCount()
		if spawnedAllied + newGroup.unitAmount <= MaxAmountAlliesInWave() and spawned + newGroup.unitAmount <= World_GetCharacterCap() then
			multiplayer.assets.currentWave.currentSpawn = multiplayer.assets.currentWave.currentSpawn + 1	
			if multiplayer.assets.currentWave.spawnedUnits[newGroup.ebp.bp] ~= nil then
				multiplayer.assets.currentWave.spawnedUnits[newGroup.ebp.bp] = multiplayer.assets.currentWave.spawnedUnits[newGroup.ebp.bp] + newGroup.unitAmount
			else
				multiplayer.assets.currentWave.spawnedUnits[newGroup.ebp.bp] = newGroup.unitAmount
			end
			local showFX = true
			local it
			for it = 1, newGroup.unitAmount, 1 do
				local spawnPoint = newGroup.spawnPoints
				local isSpawnTable = scartype(newGroup.spawnPoints)
				if isSpawnTable == ST_TABLE then
					local spawnIdx = Util_GetRandomNumber(1.0, TableCount(newGroup.spawnPoints))
					spawnPoint = newGroup.spawnPoints[spawnIdx]
				end
				
        COOP_RequestSpawn(newGroup.ebp, spawnPoint, newGroup.goto, newGroup.hold, newGroup.aware, multiplayer.assets.grp_allies, showFX, multiplayer.assets.currentWave.soundFX)

        for jt = 1, Group_Count(multiplayer.assets.grp_allies), 1 do
          local allEnt = Group_GetEntityAt(multiplayer.assets.grp_allies, jt)
          Group_RemoveEntity(multiplayer.assets._coop_spawnedUnits, allEnt)
        end
		
				if newGroup.ebp.decloakFX == true then
					local spawnedEnt = Group_GetEntityAt(multiplayer.assets._coop_spawnRequest, 1.0)
					Coop_SetVisibility(spawnedEnt, true)
				end
				--Coop_StartAction(var7, "ACTN_decloak")
				multiplayer.assets.currentWave.soundFX = false
				showFX = false
			end
		end
end	