OnServerMigrationOriginal = OnServerMigration
OnServerMigration = function ()
	--print("OnServerMigration.Begin")
	if OnServerMigrationOriginal ~= nil then
		OnServerMigrationOriginal()
	end
	local status, err = pcall(OnServerMigrationSafe)
	-- if (status) then
	-- else
	-- 		print("OnServerMigration: " .. err)
	-- end
	-- print("OnServerMigration.End")
end