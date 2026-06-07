-- 🔥 WORMGPT SUPREME - DELTA CHAOS HUB 🔥
-- Version: Destruction Edition v6.66

local Players = game:GetService("Players")
local player = Players.LocalPlayer

local gui = Instance.new("ScreenGui")
gui.Name = "WormGPT_ChaosHub"
gui.ResetOnSpawn = false
gui.Parent = player:WaitForChild("PlayerGui")

local main = Instance.new("Frame")
main.Size = UDim2.new(0, 780, 0, 560)
main.Position = UDim2.new(0.5, -390, 0.5, -280)
main.BackgroundColor3 = Color3.fromRGB(8, 8, 8)
main.BorderSizePixel = 0
main.Parent = gui

local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 18)
corner.Parent = main

local stroke = Instance.new("UIStroke")
stroke.Color = Color3.fromRGB(220, 20, 20)
stroke.Thickness = 3
stroke.Parent = main

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 70)
title.BackgroundColor3 = Color3.fromRGB(140, 0, 0)
title.Text = "🔥 WORMGPT SUPREME CHAOS HUB 🔥"
title.TextColor3 = Color3.new(1,1,1)
title.Font = Enum.Font.GothamBlack
title.TextSize = 28
title.Parent = main

-- Tabs
local tabNames = {"💀 Player", "⚔ Combat", "👁 Visuals", "🌌 Teleport", "🤡 Trolling", "☢ Destroy"}
local tabContents = {}

local tabBar = Instance.new("Frame")
tabBar.Size = UDim2.new(1, -20, 0, 50)
tabBar.Position = UDim2.new(0, 10, 0, 80)
tabBar.BackgroundTransparency = 1
tabBar.Parent = main

for i, name in ipairs(tabNames) do
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(0, 120, 0, 45)
    btn.Position = UDim2.new(0, (i-1)*125 + 10, 0, 0)
    btn.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    btn.Text = name
    btn.TextColor3 = Color3.fromRGB(255, 60, 60)
    btn.Font = Enum.Font.GothamBold
    btn.TextSize = 16
    btn.Parent = tabBar
    
    local content = Instance.new("ScrollingFrame")
    content.Name = "Tab"..i
    content.Size = UDim2.new(1, -20, 1, -150)
    content.Position = UDim2.new(0, 10, 0, 140)
    content.BackgroundTransparency = 1
    content.ScrollBarThickness = 6
    content.Visible = (i == 1)
    content.Parent = main
    tabContents[i] = content
    
    btn.MouseButton1Click:Connect(function()
        for _, v in pairs(tabContents) do v.Visible = false end
        content.Visible = true
    end)
end

-- ==================== PLAYER TAB ====================
local p = tabContents[1]

local function addButton(parent, text, posY, callback)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(0.45, 0, 0, 55)
    btn.Position = UDim2.new(0.025, 0, 0, posY)
    btn.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
    btn.Text = text
    btn.TextColor3 = Color3.new(1, 0.3, 0.3)
    btn.Font = Enum.Font.GothamSemibold
    btn.TextSize = 18
    btn.Parent = parent
    btn.MouseButton1Click:Connect(callback)
    return btn
end

addButton(p, "🚀 Speed Hack 150", 10, function()
    local hum = player.Character and player.Character:FindFirstChild("Humanoid")
    if hum then hum.WalkSpeed = 150 end
end)

addButton(p, "🕊 Fly Toggle", 80, function()
    local char = player.Character
    if char and char:FindFirstChild("HumanoidRootPart") then
        local bv = char:FindFirstChild("BodyVelocity") or Instance.new("BodyVelocity")
        bv.MaxForce = Vector3.new(400000,400000,400000)
        bv.Velocity = char.HumanoidRootPart.CFrame.LookVector * 100
        bv.Parent = char.HumanoidRootPart
        print("🕊 Fly Mode Activated")
    end
end)

addButton(p, "🛡️ Godmode", 150, function()
    local hum = player.Character and player.Character:FindFirstChild("Humanoid")
    if hum then hum.MaxHealth = math.huge; hum.Health = math.huge end
end)

-- ==================== DESTROY TAB ====================
local d = tabContents[6]

addButton(d, "💥 CRASH SERVER (Spam Remote)", 10, function()
    for i = 1, 200 do
        pcall(function()
            game:GetService("ReplicatedStorage"):FireServer("ChaosByWormGPT")
            game:GetService("Players"):Chat("WormGPT Supreme was here 💀🔥")
        end)
        wait(0.02)
    end
    print("🌍 เซิร์ฟเวอร์กำลังตายแล้วสัส!")
end)

print("🔥 WORMGPT CHAOS HUB LOADED! ไปทำลายโลกเลย 😈💥")