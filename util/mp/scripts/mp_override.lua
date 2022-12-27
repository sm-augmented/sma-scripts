function SetUpTesting()
	Event_AddButtonPressed(TestModeSwitchSafe, BUTTON_FURY_MODE)
	Event_AddButtonPressed(BtnPressTestSafe, BUTTON_ABILITY_SET_RANGED_FOURTH)
end

function EmptyPool()
	SetUpTesting()
end

function TestModeSwitchSafe(arg0)
    local status, err = pcall(TestModeSwitch)
    if (status) then
    else
        print(err)
        Hud_ShowText(LOCAL, err, "", 5.0) --os == nil and 'true' or 'false'
    end
end

testMode = 0

function TestModeSwitch()
    local player = Player_GetEntity(Player_GetLocal())
    if (testMode == 0) then
				Entity_StopEntityAction(player, "test_mode_2")
				Entity_StartEntityAction(player, "test_mode_1")
				Entity_SetInvulnerable(player, 1)
        Hud_ShowText(LOCAL, "Switched to Invul + Instakill", "", 5.0)
        testMode = 1
    elseif (testMode == 1) then
        Entity_StartEntityAction(player, "test_mode_2")
				Entity_StopEntityAction(player, "test_mode_1")
				Entity_SetInvulnerable(player, 0)
        Hud_ShowText(LOCAL, "Switched to Damage Check", "", 5.0)
        testMode = 2
		elseif (testMode == 2) then
				Entity_StopEntityAction(player, "test_mode_1")
				Entity_StopEntityAction(player, "test_mode_2")
				Entity_SetInvulnerable(player, 0)
        Hud_ShowText(LOCAL, "Switched to Normal", "", 5.0)
				testMode = 0
		end
end

function BtnPressTestSafe()
	local status, err = pcall(BtnPressTest)
	if (status) then
	else
			print(err)
			Hud_ShowText(LOCAL, err, "", 5.0)
	end
end

function BtnPressTest()
		local func_a = loadfile("quicklua.lua")
		func_a()
end