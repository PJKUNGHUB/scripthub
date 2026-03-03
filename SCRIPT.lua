-- PJKUNG HUB 🤡 (Official GitHub Version)

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

-- MAIN FRAME
local Main = Instance.new("Frame", ScreenGui)
Main.Size = UDim2.new(0,600,0,380)
Main.Position = UDim2.new(0.5,-300,0.5,-190)
Main.BackgroundColor3 = Color3.fromRGB(20,20,20)
Main.BorderSizePixel = 0
Main.Active = true
Main.Draggable = true
Instance.new("UICorner", Main).CornerRadius = UDim.new(0,18)

-- SIDEBAR
local Sidebar = Instance.new("Frame", Main)
Sidebar.Size = UDim2.new(0,170,1,0)
Sidebar.BackgroundColor3 = Color3.fromRGB(25,25,25)
Sidebar.BorderSizePixel = 0
Instance.new("UICorner", Sidebar).CornerRadius = UDim.new(0,18)

-- ICON IN GUI
local Icon = Instance.new("ImageLabel", Sidebar)
Icon.Size = UDim2.new(0,65,0,65)
Icon.Position = UDim2.new(0.5,-32,0,20)
Icon.BackgroundTransparency = 1
Icon.Image = iconURL

-- TITLE
local Title = Instance.new("TextLabel", Sidebar)
Title.Size = UDim2.new(1,0,0,40)
Title.Position = UDim2.new(0,0,0,90)
Title.BackgroundTransparency = 1
Title.Text = "PJKUNG HUB"
Title.Font = Enum.Font.GothamBold
Title.TextSize = 18
Title.TextColor3 = Color3.fromRGB(255,255,255)

-- CONTENT AREA
local Content = Instance.new("Frame", Main)
Content.Position = UDim2.new(0,185,0,30)
Content.Size = UDim2.new(1,-205,1,-60)
Content.BackgroundTransparency = 1

local Layout = Instance.new("UIListLayout", Content)
Layout.Padding = UDim.new(0,15)

-- TOGGLE FUNCTION
local function CreateToggle(text)
    local Holder = Instance.new("Frame", Content)
    Holder.Size = UDim2.new(1,0,0,60)
    Holder.BackgroundColor3 = Color3.fromRGB(30,30,30)
    Holder.BorderSizePixel = 0
    Instance.new("UICorner", Holder).CornerRadius = UDim.new(0,14)

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
    Instance.new("UICorner", Toggle).CornerRadius = UDim.new(1,0)

    local Circle = Instance.new("Frame", Toggle)
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
local Open = Instance.new("ImageButton", ScreenGui)
Open.Size = UDim2.new(0,90,0,90)
Open.Position = UDim2.new(0,25,0.5,-45)
Open.BackgroundColor3 = Color3.fromRGB(28,28,28)
Open.Image = iconURL
Open.Active = true
Open.Draggable = true
Open.BorderSizePixel = 0
Instance.new("UICorner", Open).CornerRadius = UDim.new(0,22)

local visible = true
Open.MouseButton1Click:Connect(function()
    visible = not visible
    Main.Visible = visible
end)
