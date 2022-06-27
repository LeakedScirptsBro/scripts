-- init
local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/GreenDeno/Venyx-UI-Library/main/source.lua"))()
local venyx = library.new("UCA", 5013109572)
local HumanoidRootPart = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart

-- themes
local themes = {
	Background = Color3.fromRGB(24, 24, 24),
	Glow = Color3.fromRGB(0, 0, 0),
	Accent = Color3.fromRGB(10, 10, 10),
	LightContrast = Color3.fromRGB(20, 20, 20),
	DarkContrast = Color3.fromRGB(14, 14, 14),
	TextColor = Color3.fromRGB(255, 255, 255)
}

-- first page
local page = venyx:addPage("Game", 5012544693)
local page1 = venyx:addPage("Teleports", 5012544693)
local section1 = page:addSection("Autofarm")
local section2 = page:addSection("Keybind Loops")
local section1p2 = page1:addSection("Teleports")
local dptrigger = false

section1:addToggle("Autofarm (Slow, but efficient)", nil, function(value)
	-- safer autofarm
	getgenv().Loop = value

		local Mob = workspace.Entities["Regen Dummy"]
		local Mob1 = workspace.Entities["Blocking Dummy"]
		local Mob2 = workspace.Entities["Attacking Dummy"]

		local cd = 0.1
		local key = "LMB"

		local Body = Mob.PrimaryPart
		local BodyCFrame = Body.CFrame

		local Body1 = Mob1.PrimaryPart
		local BodyCFrame1 = Body1.CFrame

		local Body2 = Mob2.PrimaryPart
		local BodyCFrame2 = Body2.CFrame

		while Loop and wait() do
			game:GetService("ReplicatedStorage").Events.InputKey:FireServer(key)
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = BodyCFrame - BodyCFrame.LookVector * 3
			wait(cd1)
			game:GetService("ReplicatedStorage").Events.InputKey:FireServer(key)
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = BodyCFrame1 - BodyCFrame1.LookVector * 3
			wait(cd1)
			game:GetService("ReplicatedStorage").Events.InputKey:FireServer(key)
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = BodyCFrame1 - BodyCFrame1.LookVector * 3
			wait(cd1)
			game:GetService("ReplicatedStorage").Events.InputKey:FireServer(key)
		end
end)

section1:addToggle("OP Autofarm", nil, function(value)
	getgenv().Loop = value

	local PunchableCharacters = workspace.Entities
	local HumanoidRootPart = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart
	local key = "LMB"

	while Loop and wait() do
		for i,v in pairs(PunchableCharacters:GetChildren()) do
			if v:FindFirstChild("HumanoidRootPart") then
				local char = game.Players.LocalPlayer.Character

				local cPos = char.HumanoidRootPart.Position
				local fPos = cPos.Z + 2

				char.Humanoid:MoveTo(Vector3.new(cPos.X,cPos.Y,fPos))
				game:GetService("ReplicatedStorage").Events.InputKey:FireServer(key)
				v.HumanoidRootPart.CFrame = HumanoidRootPart.CFrame
			end
		end
	end
end)

section2:addToggle("M1", nil, function(value)
	getgenv().Loop = value
	while Loop and wait() do
		game:GetService("ReplicatedStorage").Events.InputKey:FireServer("LMB")
	end
end)

section2:addToggle("M2", nil, function(value)
	getgenv().Loop = value
	while Loop and wait() do
		game:GetService("ReplicatedStorage").Events.InputKey:FireServer("RMB")
	end
end)

section2:addToggle("E", nil, function(value)
	getgenv().Loop = value
	while Loop and wait() do
		game:GetService("ReplicatedStorage").Events.InputKey:FireServer("E")
	end
end)

section2:addToggle("R", nil, function(value)
	getgenv().Loop = value
	while Loop and wait() do
		game:GetService("ReplicatedStorage").Events.InputKey:FireServer("R")
	end
end)

section2:addToggle("T", nil, function(value)
	getgenv().Loop = value
	while Loop and wait() do
		game:GetService("ReplicatedStorage").Events.InputKey:FireServer("T")
	end
end)

section2:addToggle("G", nil, function(value)
	getgenv().Loop = value
	while Loop and wait() do
		game:GetService("ReplicatedStorage").Events.InputKey:FireServer("G")
	end
end)

section2:addToggle("H", nil, function(value)
	getgenv().Loop = value
	while Loop and wait() do
		game:GetService("ReplicatedStorage").Events.InputKey:FireServer("H")
	end
end)

section1p2:addButton("Hollow Maid", function()
	HumanoidRootPart.CFrame = workspace.Interactables["Hollow Maid"].Torso.CFrame
end)

section1p2:addButton("Bounty", function()
	HumanoidRootPart.CFrame = workspace.Interactables["Bounty Hunter"].Torso.CFrame
end)
