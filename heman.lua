local repo = 'https://raw.githubusercontent.com/wally-rblx/LinoriaLib/main/'

local Library = loadstring(game:HttpGet(repo .. 'Library.lua'))()
local ThemeManager = loadstring(game:HttpGet(repo .. 'addons/ThemeManager.lua'))()
local SaveManager = loadstring(game:HttpGet(repo .. 'addons/SaveManager.lua'))()

local Window = Library:CreateWindow({
	Title = 'HE-MAN SIM + BATTLE ARENA',
	Center = true,
	AutoShow = true,
})

local Tabs = {
	Main = Window:AddTab('Main'), 
	['UI Settings'] = Window:AddTab('UI Settings'),
}

local LeftGroupBox = Tabs.Main:AddLeftGroupbox('XP')

LeftGroupBox:AddSlider('MySlider', {
	Text = '',

	Default = 0,
	Min = 0,
	Max = 99999,
	Rounding = 1,

	Compact = false, -- If set to true, then it will hide the label
})


local Number = Options.MySlider.Value
Options.MySlider:OnChanged(function()
	print('MySlider was changed! New value:', Options.MySlider.Value)
end)

Options.MySlider:SetValue(3)

local MyButton = LeftGroupBox:AddButton('Give XP', function()
	local button = game.Players.LocalPlayer.PlayerGui.RebirthGui.Dialogue.RebirthButton
	local ohNumber1 = Options.MySlider.Value

	game:GetService("ReplicatedStorage").Packages._Index["sleitnick_knit@1.4.4"].knit.Services.WeaponService.RE.WeaponUsed:FireServer(ohNumber1)
	local events = {"MouseButton1Click", "MouseButton1Down", "Activated"}
	for i,v in pairs(events) do
		for i,v in pairs(getconnections(button[v])) do
			v:Fire()
		end
	end
end)







Library:SetWatermarkVisibility(true)

Library:SetWatermark('Mags Hub')

Library.KeybindFrame.Visible = true;

Library:OnUnload(function()
	print('Unloaded!')
	Library.Unloaded = true
end)

local MenuGroup = Tabs['UI Settings']:AddLeftGroupbox('Menu')

MenuGroup:AddButton('Unload', function() Library:Unload() end)
MenuGroup:AddLabel('Menu bind'):AddKeyPicker('MenuKeybind', { Default = 'End', NoUI = true, Text = 'Menu keybind' })

Library.ToggleKeybind = Options.MenuKeybind -- Allows you to have a custom keybind for the menu


ThemeManager:SetLibrary(Library)
SaveManager:SetLibrary(Library)

SaveManager:IgnoreThemeSettings()

SaveManager:SetIgnoreIndexes({ 'MenuKeybind' })

-- use case for doing it this way:
-- a script hub could have themes in a global folder
-- and game configs in a separate folder per game
ThemeManager:SetFolder('MyScriptHub')
SaveManager:SetFolder('MyScriptHub/specific-game')

-- Builds our config menu on the right side of our tab
SaveManager:BuildConfigSection(Tabs['UI Settings'])

-- Builds our theme menu (with plenty of built in themes) on the left side
-- NOTE: you can also call ThemeManager:ApplyToGroupbox to add it to a specific groupbox
ThemeManager:ApplyToTab(Tabs['UI Settings'])
