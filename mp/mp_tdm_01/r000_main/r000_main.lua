require("mp/mp_tdm_01/r000_main/r000_main_o")
require("Util/CP/CP_Const")
--require("Util/MP/scripts/mp_override")

MissionStartNetworkOrig = MissionStartNetwork
MissionStartNetwork = function ()
  local status, err = pcall(MissionStartNetworkSafePvP)
end

function MissionStartNetworkSafePvP()
  if MissionStartNetworkOrig ~= nil then
		MissionStartNetworkOrig()
	end

  --Group_SpawnEntities(Group_Create('eee'), cp_sm_bolter.bp, mkr_Start_Ork, 1.0)
  --Group_SpawnEntities(Group_Create('eee'), cp_chaos_marine_bolter.bp, mkr_Start_Ork, 1.0)

  --EmptyPool()
end

OnStartOrig = OnStart
OnStart = function (arg0)
  local status, err = pcall(OnStartSafePvP)
end

function OnStartSafePvP()
  if OnStartOrig ~= nil then
		OnStartOrig()
	end
end