require("Util/CP/Endless/Defs/cp_endless_random_defs_ork")
require("Util/CP/Endless/Defs/cp_endless_random_defs_imp")
require("Util/CP/Endless/Defs/cp_endless_random_defs_cha")
require("Util/CP/Endless/Defs/cp_endless_random_defs_nec")

orkUnits = {
	cp_ork_gretchin,
	cp_ork_boy_melee,
	cp_ork_boy_melee,
	cp_ork_boy_ranged_grenade,
	cp_ork_boy_ranged_pro,
	cp_ork_nob_shoota,
	cp_ork_boy_melee_pro,
	cp_ork_hardboy,
	cp_ork_nob_melee,
	cp_ork_squig_bomb,
	cp_ork_nob_shoota_pro,
	cp_ork_nob_melee_pro,
	cp_ork_killa_kan
}

chaosUnits = {
	chaos_coop_renegade_ig,
	chaos_coop_renegade_ig_glauncher,
	chaos_coop_renegade_ig_melta,
	chaos_coop_renegade_ig_melee,
	chaos_coop_renegade_ig,
	--chaos_coop_renegade_ig_spawn_bl,
	cp_chaos_bloodletter,
	cp_chaos_tainted_psyker,
	cp_chaos_marine_bolter,
	cp_chaos_marine_havok_pc,
	chaos_coop_marine_havok_lc,
	chaos_coop_marine_chainsword,
	cp_chaos_marine_melee,
	chaos_coop_renegade_ig
}

loyalUnits = {
	cp_guard_guardsman,
	cp_guard_guardsman_grenade_launcher,
	cp_guard_guardsman_shotgun,
	cp_guard_guardsman_chainsword,
	cp_guard_psyker,
	cp_sm_bolter,
	cp_sm_dev_pc,
	cp_sm_dev_lc,
	cp_sm_chainsword,
	cp_sm_melee,
	cp_guard_guardsman
}

necronUnits = {
	necron_warrior,
	necron_melee,
	necron_immortal,
	necron_scarab--,
	--necron_destroyer
}

factionsAvailable = {
	"orks"
}

spawnPoints = {

}

maxWaveMultiplier = 15

ls_waveCompleteLoyalsVsMixed = 1898224.0
ls_waveCompleteLoyalsVsOrks = 122322.0
ls_waveCompleteLoyalsVsChaos = 1898222.0
ls_waveCompleteLoyalsVsNecrons = 1898226.0
ls_waveCompleteLoyalsVsBoss = 1898227.0
ls_waveCompleteChaosVsMixed = 122516.0
ls_waveCompleteChaosVsOrks = 1898223.0
ls_waveCompleteChaosVsLoyals = 1898225.0
ls_waveCompleteChaosVsNecrons = 1898226.0
ls_waveCompleteChaosVsBoss = 1898228.0