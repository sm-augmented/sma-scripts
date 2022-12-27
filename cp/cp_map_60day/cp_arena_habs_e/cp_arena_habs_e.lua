require("Util/Common")
require("Util/MissionTask")
require("Util/CP/CP_Common")
require("Util/CP/CP_Func")
require("Util/CP/Endless/CP_Endless")

multiplayer.objectiveData = {}
chaosMission = true
allies = true
arenaNum = 1.0
thisArena = "cp_arena_habs_e"
arenaExit = "mkr_habs_e_exit"

spawnPoints = {
	sp_wave01_orks_01,
	sp_wave01_orks_02,
	sp_wave01_ig_01, 
	sp_wave01_ig_02,
	sp_wave01_ig_03,
	sp_wave01_ig_04,
	sp_wave01_ig_05,
	sp_wave01_ig_06,
	sp_wave01_ig_07,
	sp_wave01_ig_08,
	sp_wave01_ig_09,
	sp_wave01_ig_10,
	sp_wave01_ig_11,
	sp_wave04_low_01,
	sp_wave04_low_02,
	sp_wave04_low_03,
	sp_wave04_low_04,
	sp_wave04_high_04,
	sp_wave04_high_05,
}

orkMaxEnemyMap = {
	{ wave = 1, enemy = 4 },
	{ wave = 2, enemy = 5 },
	{ wave = 4, enemy = 6 },
	{ wave = 5, enemy = 8 },
	{ wave = 7, enemy = 9 },
	{ wave = 8, enemy = 10 },
	{ wave = 12, enemy = 11 },
	{ wave = 15, enemy = 12 },
	{ wave = 9999, enemy = 13 }
}

impMaxEnemyMap = {
	{ wave = 1, enemy = 4 },
  { wave = 6, enemy = 5 },
  { wave = 8, enemy = 6 },
  { wave = 10, enemy = 8 },
  { wave = 15, enemy = 9 },
  { wave = 9999, enemy = 10 }
}

orkSpawnedMultMap = {
	kan = {
		{ count = 16, mod = 0 },
		{ count = 18, mod = 1 },
		{ count = 19, mod = 2 },
		{ count = 20, mod = 3 },
		{ count = 22, mod = 5 },
		{ count = 26, mod = 7 },
		{ count = 30, mod = 10 },
		{ count = 40, mod = 15 },
		{ count = 60, mod = 25 },
		{ count = 9999, mod = 9999 }
	},
	hardboy = {
		{ count = 7, mod = 1 },
		{ count = 10, mod = 3 },
		{ count = 12, mod = 5 },
		{ count = 15, mod = 7 },
		{ count = 20, mod = 11 },
		{ count = 25, mod = 17 },
		{ count = 30, mod = 24 },
		{ count = 9999, mod = 9999 }
	},
	nob = {
		{ count = 7, mod = 0 },
		{ count = 8, mod = 1 },
		{ count = 10, mod = 2 },
		{ count = 12, mod = 4 },
		{ count = 15, mod = 7 },
		{ count = 20, mod = 11 },
		{ count = 25, mod = 19 },
		{ count = 60, mod = 60 },
		{ count = 9999, mod = 9999 }
	},
	heavyNob = {
		{ count = 13, mod = 0 },
		{ count = 14, mod = 1 },
		{ count = 15, mod = 3 },
		{ count = 20, mod = 6 },
		{ count = 30, mod = 10 },
		{ count = 35, mod = 15 },
		{ count = 40, mod = 20 },
		{ count = 60, mod = 40 },
		{ count = 9999, mod = 9999 }
	}
}

factionsAvailable = {
	"orks", "loyals"
}

function MissionStartNetwork() 
	InitLuaSafe()
	RegisterEndless()
end

function MissionStart() 
	RegisterPlayerEvents()
	StartWavesEndless(trig_start)
end