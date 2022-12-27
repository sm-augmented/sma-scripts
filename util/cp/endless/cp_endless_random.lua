require("Util/CP/Endless/Defs/CP_Endless_Random_Defs")

function GetFactionInfo(faction)
	if faction == "orks" then
		return orkUnits, orkMinEnemyMap, orkMaxEnemyMap, orkSpawnedMultMap
	elseif faction == "chaos" then
		return chaosUnits, chaMinEnemyMap, chaMaxEnemyMap, chaSpawnedMultMap
	elseif faction == "loyals" then
		return loyalUnits, impMinEnemyMap, impMaxEnemyMap, impSpawnedMultMap
	elseif faction == "necrons" then
		return necronUnits, orkMinEnemyMap, orkMaxEnemyMap, orkSpawnedMultMap
	end
end

function RandomizeEnemy(unitList, enMin, enMax)
	local r = math.random(enMin, enMax)
	local unit = unitList[1]
	if r <= table.getn(unitList) then
		unit = unitList[r]
	end
	return unit
end

function RandomizeGroup(oFaction, spawns)
	local faction = oFaction
	if faction == nil then
		local r = math.random(1, table.getn(factionsAvailable))
		faction = factionsAvailable[r]
	end
	local units, minMap, maxMap, multMap = GetFactionInfo(faction)
	local enMin, enMax = GetMinMaxEnemy(minMap, maxMap)
	local spawnPoint = RandomizeSpawnPoint(spawns)
	local enemyType = RandomizeEnemy(units, enMin, enMax)
	enemyType = AmountEnemyCopies(units, enemyType, enMin, enMax, multMap)
	local minAmount, maxAmount = RandomizeAmount(enemyType)
	local unitAmount = math.random(minAmount, maxAmount)
	return {
		ebp = enemyType,
		unitAmount = unitAmount,
		spawnPoints = spawnPoint,
		aware = true,
		spawnFX = true
	}
end

function AmountEnemyCopies(unitList, enemyType, minPorog, maxPorog, multMap)
	local waveIndex = multiplayer.assets.currentWave.index
	local newEnemyType = enemyType
	local category = enemyType.category
	local ui
	
	if category then
		for ui = 1, table.getn(multMap[category]) do
			if waveIndex <= multMap[category][ui].count 
			and multiplayer.assets.currentWave.spawnedUnits[enemyType.bp] ~= nil 
			and multiplayer.assets.currentWave.spawnedUnits[enemyType.bp] > multMap[category][ui].mod then 
				while newEnemyType.category do
					newEnemyType = RandomizeEnemy(unitList, minPorog, maxPorog)
				end
			break
			end
		end
	end
	
	return newEnemyType
end

function RandomizeAmount(enemyType)
	local waveIdx = multiplayer.assets.currentWave.index
	local waveMultiplier = waveIdx

	if waveIdx > maxWaveMultiplier then 
		waveMultiplier = maxWaveMultiplier 
	end

	local minAmount = enemyType.minAmount.initVal
	local maxAmount = enemyType.maxAmount.initVal

	if enemyType.minAmount.useMod == true then
		minAmount = minAmount + math.modf(waveMultiplier / enemyType.minAmount.modVal)
	end

	if enemyType.maxAmount.useMod == true then
		maxAmount = maxAmount + math.modf(waveMultiplier / enemyType.maxAmount.modVal)
	end

	return minAmount, maxAmount
end

function RandomizeSpawnPoint(spawns)
	local r = math.random(1, table.getn(spawns))
	return spawns[r]
end

function GetMinMaxEnemy(minMap, maxMap)
	local waveIdx = multiplayer.assets.currentWave.index
	local minP = 1
	local maxP = 1

	local ui, uv
	for ui = 1, table.getn(minMap) do
		uv = minMap[ui]
		if waveIdx <= uv.wave then
			minP = uv.enemy
			break
		end
	end

	for ui = 1, table.getn(maxMap) do
		uv = maxMap[ui]
		if waveIdx <= uv.wave then
			maxP = uv.enemy
			break
		end
	end

	return minP, maxP
end