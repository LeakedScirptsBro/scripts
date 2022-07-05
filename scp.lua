
--Made by : https://v3rmillion.net/member.php?action=profile&uid=244024
-- init
local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/zxciaz/VenyxUI/main/Reuploaded"))() --someone reuploaded it so I put it in place of the original back up so guy can get free credit.
local venyx = library.new("SCP: Site Roleplay", 5013109572)

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
local page = venyx:addPage("General", 5012544693)
local page1 = venyx:addPage("Game", 5012544693)
local section1 = page:addSection("General")
local section2 = page1:addSection("Game")


section1:addButton("Click TP", function()
local player = game:GetService("Players").LocalPlayer
local UIS = game:GetService("UserInputService")
local Mouse = player:GetMouse()

local mt = getrawmetatable(game)
setreadonly(mt, false)
local old = mt.__index

local deb = false  
local opos = player.Character.HumanoidRootPart.CFrame

mt.__index = newcclosure(function(self, key)
    if self == "HumanoidRootPart" and self.Parent == player.Character and key == "CFrame" and deb then
        return opos
    end
    return old(self, key)
end)

local function tp(newpos)
    if player.Character ~= nil and player.Character:FindFirstChild("HumanoidRootPart") ~= nil then
        opos = player.Character.HumanoidRootPart.CFrame
        deb = true
        player.Character.HumanoidRootPart.CFrame = CFrame.new(newpos)
        deb = false
    end
end

UIS.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 and UIS:IsKeyDown(Enum.KeyCode.LeftControl) then
        tp(Mouse.Hit.p + Vector3.new(0, 3, 0))
    end
end)

for useless, garbage in next,getgc() do
   if getfenv(garbage).script == game.Players.LocalPlayer.PlayerScripts.PlayerModule.CameraModule.ZoomController.Popper and typeof(garbage) == "function" then
       for number, value in next, getconstants(garbage) do
           if tonumber(value) == 0.25 then
               setconstant(garbage,number,0)
           elseif tonumber(value) == 0 then
               setconstant(garbage,number,0.25)
           end
       end
   end
end
end)



section1:addButton("Universal Aimbot/Esp", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Blissful4992/Miscellaneous/main/UNIVERSAL.lua"))()
end)

section2:addDropdown("Team", {"Class D", "MTF", "Science Depart", "Security Depart"}, function(text)
if text == "Class D" then
    local ohString1 = "mainmenu2"
    local ohString2 = "CD"
    game:GetService("ReplicatedStorage").Team:FireServer(ohString1, ohString2)
end
if text == "Security Depart" then
    local ohString1 = "mainmenu2"
    local ohString2 = "SD"
    game:GetService("ReplicatedStorage").Team:FireServer(ohString1, ohString2)
end
if text == "Science Depart" then
    local ohString1 = "mainmenu2"
    local ohString2 = "ScD"
    game:GetService("ReplicatedStorage").Team:FireServer(ohString1, ohString2)
end
if text == "MTF" then
    local ohString1 = "mainmenu2"
    local ohString2 = "MTF"
    game:GetService("ReplicatedStorage").Team:FireServer(ohString1, ohString2)
end
end)

section2:addDropdown("Item Giver", {"Crowbar", "SCP-1162 (random, but has a chance of getting gun)", "Grab Friendly SCP Items", "Grab SCP items"}, function(text)
if text == "Crowbar" then
    for i,v in pairs(workspace.InteriorBuild.Interactables:GetDescendants()) do
      if v.Name == "GetCrowbarChaos" then
          print(v.ClickDetector)
          fireclickdetector(v.ClickDetector)
      end
  end
end
if text == "Grab Friendly SCP Items" then
    for i,v in pairs(workspace.SCPs:GetDescendants()) do
      if v:IsA("ClickDetector") then
          fireclickdetector(v)
          print(v:GetFullName())
      end
  end       
end
if text == "Grab SCP items" then
    for i,v in pairs(workspace.InteriorBuild["SCP Items"]:GetDescendants()) do
      if v:IsA("ClickDetector") then
          fireclickdetector(v)
          print(v:GetFullName())
      end
  end            
end
if text == "SCP-1162 (random, but has a chance of getting gun)" then
    for i,v in pairs(workspace.InteriorBuild["SCP Items"]:GetDescendants()) do
          if v.Name == "SCP-1162" then
              print(v.ClickDetector)    
              fireclickdetector(v.ClickDetector)
          end
      end
end
end)


section2:addDropdown("TPs", {"Get Gun (spam e)"}, function(text)
if text == "Get Gun (spam e)" then
    local lp = game.Players.LocalPlayer
function tp(cframe)
   for i,v in ipairs(game.workspace:GetDescendants()) do
       if v.ClassName == "Seat" then
           local vpos = v.CFrame.p
           local distance_p = lp:DistanceFromCharacter(vpos)
           if distance_p < 70 then
               v:Sit(lp.Character.Humanoid)
               break
           end
       end
   end
   while not lp.Character.Humanoid.SeatPart do game:GetService("RunService").RenderStepped:Wait() end
   lp.Character.Humanoid.Jump = true
   wait()
   lp.Character.Humanoid.RootPart.CFrame = cframe
end
tp(CFrame.new(84.757019, 5.62586594, 459.973663, 0.999578893, -2.13604112e-09, -0.0290184636, 7.28933247e-10, 1, -4.85006701e-08, 0.0290184636, 4.84590927e-08, 0.999578893))
end
end)

section2:addButton("Respawn", function()
local ohNumber1 = 2
game:GetService("ReplicatedStorage").Died:FireServer(ohNumber1)
end)


-- load
venyx:SelectPage(venyx.pages[1], true) -- no default for more freedom
