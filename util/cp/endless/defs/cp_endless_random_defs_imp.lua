impMinEnemyMap = {
	{ wave = 28, enemy = 1 },
  { wave = 9999, enemy = 6 }
}

impMaxEnemyMap = {
	{ wave = 1, enemy = 3 },
  { wave = 3, enemy = 4 },
  { wave = 6, enemy = 5 },
  { wave = 8, enemy = 6 },
  { wave = 10, enemy = 7 },
  { wave = 15, enemy = 9 },
  { wave = 9999, enemy = 10 }
}

impSpawnedMultMap = {
	psyker = {
		{ count = 5, mod = 0 },
		{ count = 7, mod = 1 },
		{ count = 10, mod = 2 },
		{ count = 14, mod = 4 },
		{ count = 16, mod = 7 },
		{ count = 20, mod = 10 },
		{ count = 25, mod = 14 },
		{ count = 30, mod = 24 },
		{ count = 80, mod = 100 },
		{ count = 9999, mod = 9999 }
	},
	heavyLoyals = {
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
	championLoyals = {
		{ count = 16, mod = 0 },
		{ count = 18, mod = 1 },
		{ count = 21, mod = 3 },
		{ count = 25, mod = 6 },
		{ count = 30, mod = 10 },
		{ count = 40, mod = 25 }, 
		{ count = 80, mod = 60 },
		{ count = 9999, mod = 9999 }
	}
}

cp_guard_guardsman.minAmount = {
  useMod = true,
  initVal = 2,
  modVal = 2
}

cp_guard_guardsman.maxAmount = {
  useMod = true,
  initVal = 7,
  modVal = 2
}

cp_guard_guardsman_grenade_launcher.minAmount = {
  useMod = true,
  initVal = 1,
  modVal = 3
}

cp_guard_guardsman_grenade_launcher.maxAmount = {
  useMod = true,
  initVal = 2,
  modVal = 3
}

cp_guard_guardsman_shotgun.minAmount = {
  useMod = true,
  initVal = 2,
  modVal = 3
}

cp_guard_guardsman_shotgun.maxAmount = {
  useMod = true,
  initVal = 3,
  modVal = 3
}

cp_guard_guardsman_chainsword.minAmount = {
  useMod = true,
  initVal = 1,
  modVal = 3
}

cp_guard_guardsman_chainsword.maxAmount = {
  useMod = true,
  initVal = 2,
  modVal = 3
}

cp_guard_psyker.category = "psyker"

cp_guard_psyker.minAmount = {
  useMod = false,
  initVal = 1
}

cp_guard_psyker.maxAmount = {
  useMod = false,
  initVal = 1
}

cp_sm_bolter.minAmount = {
  useMod = false,
  initVal = 1
}

cp_sm_bolter.maxAmount = {
  useMod = true,
  initVal = 1,
	modVal = 15
}

cp_sm_dev_pc.minAmount = {
  useMod = false,
  initVal = 1
}

cp_sm_dev_pc.maxAmount = {
  useMod = false,
  initVal = 1
}

cp_sm_dev_lc.category = "heavyLoyals"

cp_sm_dev_lc.minAmount = {
  useMod = false,
  initVal = 1
}

cp_sm_dev_lc.maxAmount = {
  useMod = false,
  initVal = 1
}

cp_sm_chainsword.category = "heavyLoyals"

cp_sm_chainsword.minAmount = {
  useMod = false,
  initVal = 1
}

cp_sm_chainsword.maxAmount = {
  useMod = false,
  initVal = 1
}

cp_sm_melee.category = "championLoyals"

cp_sm_melee.minAmount = {
  useMod = false,
  initVal = 1
}

cp_sm_melee.maxAmount = {
  useMod = true,
  initVal = 1,
	modVal = 15
}