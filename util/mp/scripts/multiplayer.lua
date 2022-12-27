require("Util/mp/scripts/multiplayer_o")
require("Util/CP/CP_Func_Base")

MissionStartNetworkO = MissionStartNetwork
MissionStartNetwork = function () --f_0
  --print('freestylo')
	InitLuaSafe()
	
	if MissionStartNetworkO ~= nil then
		MissionStartNetworkO()
	end
end

OnStartO = OnStart
OnStart = function (arg0)
	--print('rakamakafoStart')
	RegisterPlayerEvents()
	
	if OnStartO ~= nil then
		OnStartO(arg0)
	end
end

OnServerMigration = function ()
	--print("OnServerMigration.Begin")
	local status, err = pcall(OnServerMigrationSafe)
	-- if (status) then
	-- else
	-- 		print("OnServerMigration: " .. err)
	-- end
	-- print("OnServerMigration.End")
end