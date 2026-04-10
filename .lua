-- Script disabled notice
local Players = game:GetService("Players")
local CoreGui = game:GetService("CoreGui")
local TweenService = game:GetService("TweenService")

local DISCORD_LINK = "https://discord.gg/fzfKYgPH3Q"

local player = Players.LocalPlayer
local parentGui = (gethui and gethui()) or CoreGui

pcall(function()
    local old = parentGui:FindFirstChild("ScriptDisabledByOwner")
    if old then old:Destroy() end
end)

local gui = Instance.new("ScreenGui")
gui.Name = "ScriptDisabledByOwner"
gui.ResetOnSpawn = false
gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
gui.Parent = parentGui

local dim = Instance.new("Frame")
dim.Size = UDim2.new(1, 0, 1, 0)
dim.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
dim.BackgroundTransparency = 0.35
dim.BorderSizePixel = 0
dim.Parent = gui

local card = Instance.new("Frame")
card.Size = UDim2.new(0, 360, 0, 190)
card.Position = UDim2.new(0.5, -180, 0.5, -95)
card.BackgroundColor3 = Color3.fromRGB(12, 14, 18)
card.BorderSizePixel = 0
card.Parent = gui

Instance.new("UICorner", card).CornerRadius = UDim.new(0, 18)

local stroke = Instance.new("UIStroke")
stroke.Color = Color3.fromRGB(0, 255, 150)
stroke.Thickness = 2
stroke.Parent = card

local title = Instance.new("TextLabel")
title.BackgroundTransparency = 1
title.Size = UDim2.new(1, -30, 0, 38)
title.Position = UDim2.new(0, 15, 0, 16)
title.Font = Enum.Font.GothamBlack
title.Text = "SCRIPT DISABLED"
title.TextColor3 = Color3.fromRGB(0, 255, 150)
title.TextSize = 22
title.Parent = card

local msg = Instance.new("TextLabel")
msg.BackgroundTransparency = 1
msg.Size = UDim2.new(1, -34, 0, 58)
msg.Position = UDim2.new(0, 17, 0, 58)
msg.Font = Enum.Font.GothamBold
msg.Text = "This script is disabled by owner.\nJoin this Discord server for the working script."
msg.TextColor3 = Color3.fromRGB(230, 240, 235)
msg.TextSize = 14
msg.TextWrapped = true
msg.Parent = card

local button = Instance.new("TextButton")
button.Size = UDim2.new(1, -44, 0, 42)
button.Position = UDim2.new(0, 22, 1, -58)
button.BackgroundColor3 = Color3.fromRGB(0, 190, 110)
button.BorderSizePixel = 0
button.Font = Enum.Font.GothamBlack
button.Text = "COPY DISCORD LINK"
button.TextColor3 = Color3.fromRGB(255, 255, 255)
button.TextSize = 14
button.AutoButtonColor = false
button.Parent = card

Instance.new("UICorner", button).CornerRadius = UDim.new(0, 12)

button.MouseButton1Click:Connect(function()
    local copied = false

    pcall(function()
        if setclipboard then
            setclipboard(DISCORD_LINK)
            copied = true
        elseif toclipboard then
            toclipboard(DISCORD_LINK)
            copied = true
        end
    end)

    if copied then
        button.Text = "COPIED!"
        TweenService:Create(button, TweenInfo.new(0.15), {
            BackgroundColor3 = Color3.fromRGB(0, 230, 135)
        }):Play()
    else
        button.Text = DISCORD_LINK
    end
end)
