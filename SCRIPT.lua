--// PJKUNG HUB 🤡 FINAL BIG ICON VERSION

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local player = Players.LocalPlayer

local defaultSpeed = 16
local fastSpeed = 50

-- rbxthumb icon
local thumbIcon = "rbxthumb://type=Asset&id=108063034683152&w=420&h=420"

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

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0,18)
MainCorner.Parent = Main

-- SIDEBAR
local Sidebar = Instance.new("Frame")
Sidebar.Parent = Main
Sidebar.Size = UDim2.new(0,170,1,0)
Sidebar.BackgroundColor3 = Color3.fromRGB(25,25,25)
Sidebar.BorderSizePixel = 0

local SideCorner = Instance.new("UICorner")
SideCorner.CornerRadius = UDim.new(0,18)
SideCorner.Parent = Sidebar

-- ICON (ใหญ่ 110x110)
local Icon = Instance.new("ImageLabel")
Icon.Parent = Sidebar
Icon.Size = UDim2.new(0,110,0,110)
Icon.Position = UDim2.new(0.5,-55,0,20)
Icon.BackgroundTransparency = 1
Icon.Image = thumbIcon
Icon.ScaleType = Enum.ScaleType.Crop

local IconCorner = Instance.new("UICorner")
IconCorner.CornerRadius = UDim.new(0,20)
IconCorner.Parent = Icon

local Stroke = Instance.new("UIStroke")
Stroke.Thickness = 2
Stroke.Color = Color3.fromRGB(80,80,80)
Stroke.Parent = Icon

-- TITLE (ขยับลง)
local Title = Instance.new("TextLabel")
Title.Parent = Sidebar
Title.Size = UDim2.new(1,0,0,40)
Title.Position = UDim2.new(0,0,0,150)
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
    local Holder = Instance.new("Frame", Content)
    Holder.Size = UDim2.new(1,0,0,60)
    Holder.BackgroundColor3 = Color3.fromRGB(30,30,30)
    Holder.BorderSizePixel = 0

    local HolderCorner = Instance.new("UICorner")
    HolderCorner.CornerRadius = UDim.new(0,14)
    HolderCorner.Parent = Holder

    local Label = Instance.new("TextLabel", Holder)
    Label.Size = UDim2.new(0.7,0,1,0)
    Label.Position = UDim2.new(0,20,0,0)
    Label.BackgroundTransparency = 1
    Label.Text = text
    Label.Font = Enum.Font.Gotham
    Label.TextSize = 16
    Label.TextColor3 = Color3.fromRGB(230,230,230)
    Label.TextXAlignment = Enum.TextXAlignment.Left

    local Toggle = Instance.new("TextButton", Holder)
    Toggle.Size = UDim2.new(0,55,0,28)
    Toggle.Position = UDim2.new(1,-75,0.5,-14)
    Toggle.BackgroundColor3 = Color3.fromRGB(45,45,45)
    Toggle.Text = ""
    Toggle.BorderSizePixel = 0

    local ToggleCorner = Instance.new("UICorner")
    ToggleCorner.CornerRadius = UDim.new(1,0)
    ToggleCorner.Parent = Toggle

    local Circle = Instance.new("Frame", Toggle)
    Circle.Size = UDim2.new(0,24,0,24)
    Circle.Position = UDim2.new(0,2,0.5,-12)
    Circle.BackgroundColor3 = Color3.fromRGB(200,200,200)

    local CircleCorner = Instance.new("UICorner")
    CircleCorner.CornerRadius = UDim.new(1,0)
    CircleCorner.Parent = Circle

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

-- OPEN / CLOSE BUTTON (60x60 โค้งมน)
local Open = Instance.new("ImageButton")
Open.Parent = ScreenGui
Open.Size = UDim2.new(0,60,0,60)
Open.Position = UDim2.new(0,20,0.5,-30)
Open.BackgroundColor3 = Color3.fromRGB(28,28,28)
Open.BorderSizePixel = 0
Open.Image = thumbIcon
Open.ScaleType = Enum.ScaleType.Crop
Open.Active = true
Open.Draggable = true

local OpenCorner = Instance.new("UICorner")
OpenCorner.CornerRadius = UDim.new(0,14)
OpenCorner.Parent = Open

local visible = true
Open.MouseButton1Click:Connect(function()
    visible = not visible
    Main.Visible = visible
end)
