chaos_coop_renegade_ig = {["bp"] = "ebps\\multiplayer\\race_chaos\\chaos_coop_renegade_ig",
["readableName"] = 122342.0}
chaos_coop_renegade_ig_melta = {["bp"] = "ebps\\multiplayer\\race_chaos\\chaos_coop_renegade_ig_melta",
["readableName"] = 122342.0}
chaos_coop_renegade_ig_glauncher = {["bp"] = "ebps\\multiplayer\\race_chaos\\chaos_coop_renegade_ig_glauncher",
["readableName"] = 122342.0}
chaos_coop_renegade_ig_spawn_bl = {["bp"] = "ebps\\multiplayer\\race_chaos\\chaos_coop_renegade_ig_spawn_bl",
["readableName"] = 122342.0}
chaos_coop_renegade_ig_melee = {["bp"] = "ebps\\multiplayer\\race_chaos\\chaos_coop_renegade_ig_melee",
["readableName"] = 122342.0}
chaos_coop_marine_chainsword = {["bp"] = "ebps\\multiplayer\\race_chaos\\chaos_coop_marine_chainsword",
["readableName"] = 122342.0}
chaos_coop_marine_havok_lc = {["bp"] = "ebps\\multiplayer\\race_chaos\\chaos_coop_marine_havok_lc",
["readableName"] = 122342.0}

-- ALLIES
chaos_coop_renegade_ig_ally = {["bp"] = "ebps\\multiplayer\\race_chaos\\allies\\chaos_coop_renegade_ig",
["readableName"] = 122342.0}
chaos_coop_renegade_ig_melta_ally = {["bp"] = "ebps\\multiplayer\\race_chaos\\allies\\chaos_coop_renegade_ig_melta",
["readableName"] = 122342.0}
chaos_coop_renegade_ig_glauncher_ally = {["bp"] = "ebps\\multiplayer\\race_chaos\\allies\\chaos_coop_renegade_ig_glauncher",
["readableName"] = 122342.0}
chaos_coop_renegade_ig_spawn_bl_ally = {["bp"] = "ebps\\multiplayer\\race_chaos\\allies\\chaos_coop_renegade_ig_spawn_bl",
["readableName"] = 122342.0}
chaos_coop_renegade_ig_melee_ally = {["bp"] = "ebps\\multiplayer\\race_chaos\\allies\\chaos_coop_renegade_ig_melee",
["readableName"] = 122342.0}
chaos_coop_marine_havok_lc_ally = {["bp"] = "ebps\\multiplayer\\race_chaos\\allies\\chaos_coop_marine_havok_lc",
["readableName"] = 122342.0}
cp_chaos_bloodletter_ally = {["bp"] = "ebps\\multiplayer\\race_chaos\\allies\\chaos_coop_bloodletter",
["readableName"] = 122342.0}
cp_chaos_tainted_psyker_ally = {["bp"] = "ebps\\multiplayer\\race_chaos\\allies\\chaos_coop_tainted_psyker",
["readableName"] = 122342.0}
cp_chaos_marine_bolter_ally = {["bp"] = "ebps\\multiplayer\\race_chaos\\allies\\chaos_coop_marine_bolter",
["readableName"] = 122342.0}
cp_chaos_marine_havok_pc_ally = {["bp"] = "ebps\\multiplayer\\race_chaos\\allies\\chaos_coop_marine_havok_pc",
["readableName"] = 122342.0}
chaos_coop_marine_chainsword_ally = {["bp"] = "ebps\\multiplayer\\race_chaos\\allies\\chaos_coop_marine_chainsword",
["readableName"] = 122342.0}
cp_chaos_marine_melee_ally = {["bp"] = "ebps\\multiplayer\\race_chaos\\allies\\chaos_coop_marine_melee",
["readableName"] = 122342.0}

chaMinEnemyMap = {
	{ wave = 28, enemy = 1 },
  { wave = 9999, enemy = 6 }
}

chaMaxEnemyMap = {
	{ wave = 1, enemy = 3 },
  { wave = 3, enemy = 4 },
  { wave = 4, enemy = 6 },
  { wave = 6, enemy = 7 },
  { wave = 8, enemy = 8 },
  { wave = 10, enemy = 9 },
  { wave = 15, enemy = 11 },
  { wave = 9999, enemy = 12 }
}

chaSpawnedMultMap = {
	psyker = {
		{ count = 6, mod = 0 },
		{ count = 8, mod = 1 },
		{ count = 10, mod = 3 },
		{ count = 14, mod = 5 },
		{ count = 17, mod = 8 },
		{ count = 20, mod = 12 },
		{ count = 25, mod = 18 },
		{ count = 30, mod = 27 },
		{ count = 35, mod = 37 },
		{ count = 80, mod = 100 },
		{ count = 9999, mod = 9999 }
	},
	heavyChaos = {
		{ count = 12, mod = 1 },
		{ count = 14, mod = 3 },
		{ count = 17, mod = 5 },
		{ count = 20, mod = 9 },
		{ count = 25, mod = 11 },
		{ count = 30, mod = 19 },
		{ count = 35, mod = 24 },
		{ count = 40, mod = 37 },
		{ count = 80, mod = 80 },
		{ count = 9999, mod = 9999 }
	},
	championChaos = {
		{ count = 16, mod = 0 },
		{ count = 18, mod = 2 },
		{ count = 19, mod = 4 },
		{ count = 20, mod = 6 },
		{ count = 25, mod = 7 },
		{ count = 30, mod = 11 },
		{ count = 35, mod = 15 },
		{ count = 40, mod = 25 }, 
		{ count = 80, mod = 60 },
		{ count = 9999, mod = 9999 }
	}
}

chaos_coop_renegade_ig.minAmount = {
  useMod = true,
  initVal = 2,
  modVal = 2
}

chaos_coop_renegade_ig.maxAmount = {
  useMod = true,
  initVal = 7,
  modVal = 2
}

chaos_coop_renegade_ig_glauncher.minAmount = {
  useMod = true,
  initVal = 1,
  modVal = 3
}

chaos_coop_renegade_ig_glauncher.maxAmount = {
  useMod = true,
  initVal = 2,
  modVal = 3
}

chaos_coop_renegade_ig_melta.minAmount = {
  useMod = true,
  initVal = 2,
  modVal = 3
}

chaos_coop_renegade_ig_melta.maxAmount = {
  useMod = true,
  initVal = 3,
  modVal = 3
}

chaos_coop_renegade_ig_melee.minAmount = {
  useMod = true,
  initVal = 1,
  modVal = 3
}

chaos_coop_renegade_ig_melee.maxAmount = {
  useMod = true,
  initVal = 2,
  modVal = 3
}

chaos_coop_renegade_ig_spawn_bl.minAmount = {
  useMod = true,
  initVal = 1,
  modVal = 5
}

chaos_coop_renegade_ig_spawn_bl.maxAmount = {
  useMod = true,
  initVal = 3,
  modVal = 5
}

cp_chaos_bloodletter.minAmount = {
  useMod = true,
  initVal = 1,
  modVal = 4
}

cp_chaos_bloodletter.maxAmount = {
  useMod = true,
  initVal = 5,
  modVal = 4
}

cp_chaos_tainted_psyker.category = "psyker"

cp_chaos_tainted_psyker.minAmount = {
  useMod = false,
  initVal = 1
}

cp_chaos_tainted_psyker.maxAmount = {
  useMod = false,
  initVal = 1
}

cp_chaos_marine_bolter.minAmount = {
  useMod = false,
  initVal = 1
}

cp_chaos_marine_bolter.maxAmount = {
  useMod = true,
  initVal = 1,
	modVal = 15
}

cp_chaos_marine_havok_pc.minAmount = {
  useMod = false,
  initVal = 1
}

cp_chaos_marine_havok_pc.maxAmount = {
  useMod = false,
  initVal = 1
}

chaos_coop_marine_havok_lc.category = "heavyChaos"

chaos_coop_marine_havok_lc.minAmount = {
  useMod = false,
  initVal = 1
}

chaos_coop_marine_havok_lc.maxAmount = {
  useMod = false,
  initVal = 1
}

chaos_coop_marine_chainsword.category = "heavyChaos"

chaos_coop_marine_chainsword.minAmount = {
  useMod = false,
  initVal = 1
}

chaos_coop_marine_chainsword.maxAmount = {
  useMod = false,
  initVal = 1
}

cp_chaos_marine_melee.category = "championChaos"

cp_chaos_marine_melee.minAmount = {
  useMod = false,
  initVal = 1
}

cp_chaos_marine_melee.maxAmount = {
  useMod = false,
  initVal = 1
}