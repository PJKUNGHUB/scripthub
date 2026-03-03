--// PJKUNG HUB 🤡 FINAL FIX ICON

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local player = Players.LocalPlayer

local defaultSpeed = 16
local fastSpeed = 50

-- ใช้ rbxassetid แบบเสถียร
local iconID = "rbxassetid://108063034683152"

-- GUI
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "PJKUNG_HUB"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = game.CoreGui

-- MAIN FRAME
local Main = Instance.new("Frame")
Main.Parent = ScreenGui
Main.Size = UDim2.new(0,600,0,380)
Main.Position = UDim2.new(0.5,-300,0.5,-190)
Main.BackgroundColor3 = Color3.fromRGB(20,20,20)
Main.BorderSizePixel = 0
Main.Active = true
Main.Draggable = true
Instance.new("UICorner", Main).CornerRadius = UDim.new(0,18)

-- SIDEBAR
local Sidebar = Instance.new("Frame")
Sidebar.Parent = Main
Sidebar.Size = UDim2.new(0,170,1,0)
Sidebar.BackgroundColor3 = Color3.fromRGB(25,25,25)
Sidebar.BorderSizePixel = 0
Instance.new("UICorner", Sidebar).CornerRadius = UDim.new(0,18)

-- ICON (ใน GUI)
local Icon = Instance.new("ImageLabel")
Icon.Parent = Sidebar
Icon.Size = UDim2.new(0,70,0,70)
Icon.Position = UDim2.new(0.5,-35,0,20)
Icon.BackgroundTransparency = 1
Icon.Image = iconID
Icon.ScaleType = Enum.ScaleType.Fit

-- TITLE
local Title = Instance.new("TextLabel")
Title.Parent = Sidebar
Title.Size = UDim2.new(1,0,0,40)
Title.Position = UDim2.new(0,0,0,100)
Title.BackgroundTransparency = 1
Title.Text = "PJKUNG HUB"
Title.Font = Enum.Font.GothamBold
Title.TextSize = 18
Title.TextColor3 = Color3.fromRGB(255,255,255)

-- CONTENT
local Content = Instance.new("Frame")
Content.Parent = Main
Content.Position = UDim2.new(0,190,0,30)
Content.Size = UDim2.new(1,-210,1,-60)
Content.BackgroundTransparency = 1

local Layout = Instance.new("UIListLayout")
Layout.Parent = Content
Layout.Padding = UDim.new(0,15)

-- TOGGLE
local function CreateToggle(text)
    local Holder = Instance.new("Frame")
    Holder.Parent = Content
    Holder.Size = UDim2.new(1,0,0,60)
    Holder.BackgroundColor3 = Color3.fromRGB(30,30,30)
    Holder.BorderSizePixel = 0
    Instance.new("UICorner", Holder).CornerRadius = UDim.new(0,14)

    local Label = Instance.new("TextLabel")
    Label.Parent = Holder
    Label.Size = UDim2.new(0.7,0,1,0)
    Label.Position = UDim2.new(0,20,0,0)
    Label.BackgroundTransparency = 1
    Label.Text = text
    Label.Font = Enum.Font.Gotham
    Label.TextSize = 16
    Label.TextColor3 = Color3.fromRGB(230,230,230)
    Label.TextXAlignment = Enum.TextXAlignment.Left

    local Toggle = Instance.new("TextButton")
    Toggle.Parent = Holder
    Toggle.Size = UDim2.new(0,55,0,28)
    Toggle.Position = UDim2.new(1,-75,0.5,-14)
    Toggle.BackgroundColor3 = Color3.fromRGB(45,45,45)
    Toggle.Text = ""
    Toggle.BorderSizePixel = 0
    Instance.new("UICorner", Toggle).CornerRadius = UDim.new(1,0)

    local Circle = Instance.new("Frame")
    Circle.Parent = Toggle
    Circle.Size = UDim2.new(0,24,0,24)
    Circle.Position = UDim2.new(0,2,0.5,-12)
    Circle.BackgroundColor3 = Color3.fromRGB(200,200,200)
    Instance.new("UICorner", Circle).CornerRadius = UDim.new(1,0)

    local enabled = false

    Toggle.MouseButton1Click:Connect(function()
        enabled = not enabled

        TweenService:Create(Circle, TweenInfo.new(0.2), {
            Position = enabled and UDim2.new(1,-26,0.5,-12) or UDim2.new(0,2,0.5,-12)
        }):Play()

        if player.Character and player.Character:FindFirstChild("Humanoid") then
            player.Character.Humanoid.WalkSpeed = enabled and fastSpeed or defaultSpeed
        end
    end)
end

CreateToggle("Fast Run 🤡")

-- OPEN / CLOSE BUTTON
local Open = Instance.new("ImageButton")
Open.Parent = ScreenGui
Open.Size = UDim2.new(0,90,0,90)
Open.Position = UDim2.new(0,25,0.5,-45)
Open.BackgroundColor3 = Color3.fromRGB(28,28,28)
Open.BorderSizePixel = 0
Open.Image = iconID
Open.ScaleType = Enum.ScaleType.Fit
Open.Active = true
Open.Draggable = true
Instance.new("UICorner", Open).CornerRadius = UDim.new(0,22)

local visible = true
Open.MouseButton1Click:Connect(function()
    visible = not visible
    Main.Visible = visible
end)
