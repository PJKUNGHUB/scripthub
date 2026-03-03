-- PJKUNG HUB 🤡 (GitHub Version)

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local player = Players.LocalPlayer

local defaultSpeed = 16
local fastSpeed = 50

local iconURL = "https://raw.githubusercontent.com/PJKUNGHUB/scripthub/main/icon.png"

-- GUI
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "PJKUNG_HUB"
ScreenGui.Parent = game.CoreGui

-- MAIN
local Main = Instance.new("Frame", ScreenGui)
Main.Size = UDim2.new(0,620,0,400)
Main.Position = UDim2.new(0.5,-310,0.5,-200)
Main.BackgroundColor3 = Color3.fromRGB(18,18,18)
Main.BorderSizePixel = 0
Main.Active = true
Main.Draggable = true
Instance.new("UICorner", Main).CornerRadius = UDim.new(0,16)

-- SIDEBAR
local Sidebar = Instance.new("Frame", Main)
Sidebar.Size = UDim2.new(0,160,1,0)
Sidebar.BackgroundColor3 = Color3.fromRGB(22,22,22)
Sidebar.BorderSizePixel = 0
Instance.new("UICorner", Sidebar).CornerRadius = UDim.new(0,16)

-- ICON
local Icon = Instance.new("ImageLabel", Sidebar)
Icon.Size = UDim2.new(0,60,0,60)
Icon.Position = UDim2.new(0.5,-30,0,20)
Icon.BackgroundTransparency = 1
Icon.Image = iconURL

-- TITLE
local Title = Instance.new("TextLabel", Sidebar)
Title.Size = UDim2.new(1,0,0,40)
Title.Position = UDim2.new(0,0,0,85)
Title.BackgroundTransparency = 1
Title.Text = "PJKUNG HUB"
Title.Font = Enum.Font.GothamBold
Title.TextSize = 18
Title.TextColor3 = Color3.fromRGB(255,255,255)

-- CONTENT
local Content = Instance.new("Frame", Main)
Content.Position = UDim2.new(0,170,0,20)
Content.Size = UDim2.new(1,-190,1,-40)
Content.BackgroundTransparency = 1

local Layout = Instance.new("UIListLayout", Content)
Layout.Padding = UDim.new(0,15)

-- TOGGLE
local function CreateToggle(text)
    local Holder = Instance.new("Frame", Content)
    Holder.Size = UDim2.new(1,0,0,55)
    Holder.BackgroundColor3 = Color3.fromRGB(28,28,28)
    Holder.BorderSizePixel = 0
    Instance.new("UICorner", Holder).CornerRadius = UDim.new(0,12)

    local Label = Instance.new("TextLabel", Holder)
    Label.Size = UDim2.new(0.7,0,1,0)
    Label.Position = UDim2.new(0,15,0,0)
    Label.BackgroundTransparency = 1
    Label.Text = text
    Label.Font = Enum.Font.Gotham
    Label.TextSize = 15
    Label.TextColor3 = Color3.fromRGB(230,230,230)
    Label.TextXAlignment = Enum.TextXAlignment.Left

    local Toggle = Instance.new("TextButton", Holder)
    Toggle.Size = UDim2.new(0,50,0,26)
    Toggle.Position = UDim2.new(1,-70,0.5,-13)
    Toggle.BackgroundColor3 = Color3.fromRGB(40,40,40)
    Toggle.Text = ""
    Toggle.BorderSizePixel = 0
    Instance.new("UICorner", Toggle).CornerRadius = UDim.new(1,0)

    local Circle = Instance.new("Frame", Toggle)
    Circle.Size = UDim2.new(0,22,0,22)
    Circle.Position = UDim2.new(0,2,0.5,-11)
    Circle.BackgroundColor3 = Color3.fromRGB(200,200,200)
    Instance.new("UICorner", Circle).CornerRadius = UDim.new(1,0)

    local enabled = false

    Toggle.MouseButton1Click:Connect(function()
        enabled = not enabled

        TweenService:Create(Circle, TweenInfo.new(0.2), {
            Position = enabled and UDim2.new(1,-24,0.5,-11) or UDim2.new(0,2,0.5,-11)
        }):Play()

        if player.Character and player.Character:FindFirstChild("Humanoid") then
            player.Character.Humanoid.WalkSpeed = enabled and fastSpeed or defaultSpeed
        end
    end)
end

CreateToggle("Fast Run 🤡")

-- OPEN BUTTON (Rounded Square)
local Open = Instance.new("ImageButton", ScreenGui)
Open.Size = UDim2.new(0,90,0,90)
Open.Position = UDim2.new(0,30,0.5,-45)
Open.BackgroundColor3 = Color3.fromRGB(25,25,25)
Open.Image = iconURL
Open.Active = true
Open.Draggable = true
Instance.new("UICorner", Open).CornerRadius = UDim.new(0,20)

local visible = true
Open.MouseButton1Click:Connect(function()
    visible = not visible
    Main.Visible = visible
end)
