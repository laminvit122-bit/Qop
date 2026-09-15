-- No One | Part 1/3
local CoreGui = game:GetService("CoreGui")
local TweenService = game:GetService("TweenService")
local SoundService = game:GetService("SoundService")

if CoreGui:FindFirstChild("NoOneUI") then CoreGui.NoOneUI:Destroy() end

local NEON = Color3.fromRGB(0, 255, 100)
local BG_DARK = Color3.fromRGB(8, 8, 10)
local TEXT_DIM = Color3.fromRGB(160, 160, 170)
local TEXT_BRIGHT = Color3.fromRGB(240, 240, 245)

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "NoOneUI"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = CoreGui

local ClickSound = Instance.new("Sound")
ClickSound.SoundId = "rbxassetid://127105730240202"
ClickSound.Volume = 0.5
ClickSound.Parent = SoundService

local function PlayClick()
    ClickSound:Stop()
    ClickSound.TimePosition = 0
    ClickSound:Play()
end

-- ОКНО
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 600, 0, 350)
MainFrame.Position = UDim2.new(0.5, -300, 0.5, -175)
MainFrame.BackgroundColor3 = BG_DARK
MainFrame.BorderSizePixel = 0
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Parent = ScreenGui

local MC = Instance.new("UICorner")
MC.CornerRadius = UDim.new(0, 14)
MC.Parent = MainFrame

local MainStroke = Instance.new("UIStroke")
MainStroke.Color = NEON
MainStroke.Thickness = 1.5
MainStroke.Transparency = 0.3
MainStroke.Parent = MainFrame

-- ТОПБАР
local TopBar = Instance.new("Frame")
TopBar.Size = UDim2.new(1, 0, 0, 55)
TopBar.BackgroundColor3 = Color3.fromRGB(5, 5, 7)
TopBar.BorderSizePixel = 0
TopBar.Parent = MainFrame

local TC = Instance.new("UICorner")
TC.CornerRadius = UDim.new(0, 14)
TC.Parent = TopBar

local TopFix = Instance.new("Frame")
TopFix.Size = UDim2.new(1, 0, 0, 14)
TopFix.Position = UDim2.new(0, 0, 1, -14)
TopFix.BackgroundColor3 = Color3.fromRGB(5, 5, 7)
TopFix.BorderSizePixel = 0
TopFix.Parent = TopBar

local Sep = Instance.new("Frame")
Sep.Size = UDim2.new(1, -20, 0, 1)
Sep.Position = UDim2.new(0, 10, 0, 55)
Sep.BackgroundColor3 = NEON
Sep.BorderSizePixel = 0
Sep.Parent = MainFrame

local SepGrad = Instance.new("UIGradient")
SepGrad.Transparency = NumberSequence.new({
    NumberSequenceKeypoint.new(0, 1),
    NumberSequenceKeypoint.new(0.5, 0),
    NumberSequenceKeypoint.new(1, 1)
})
SepGrad.Parent = Sep

-- ЗАГОЛОВОК
local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(0, 300, 0, 30)
Title.Position = UDim2.new(0, 25, 0, 5)
Title.BackgroundTransparency = 1
Title.Text = "No One"
Title.TextColor3 = NEON
Title.TextSize = 26
Title.Font = Enum.Font.GothamBlack
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.Parent = TopBar

local Subtitle = Instance.new("TextLabel")
Subtitle.Size = UDim2.new(0, 300, 0, 14)
Subtitle.Position = UDim2.new(0, 27, 0, 35)
Subtitle.BackgroundTransparency = 1
Subtitle.Text = "by devscripts0"
Subtitle.TextColor3 = Color3.fromRGB(0, 130, 60)
Subtitle.TextSize = 11
Subtitle.Font = Enum.Font.GothamMedium
Subtitle.TextXAlignment = Enum.TextXAlignment.Left
Subtitle.Parent = TopBar

-- SIDEBAR
local SideBar = Instance.new("Frame")
SideBar.Size = UDim2.new(0, 170, 1, -56)
SideBar.Position = UDim2.new(0, 0, 0, 56)
SideBar.BackgroundColor3 = Color3.fromRGB(8, 8, 10)
SideBar.BorderSizePixel = 0
SideBar.Parent = MainFrame

local SideLine = Instance.new("Frame")
SideLine.Size = UDim2.new(0, 1, 1, -30)
SideLine.Position = UDim2.new(1, -1, 0, 15)
SideLine.BackgroundColor3 = NEON
SideLine.BackgroundTransparency = 0.7
SideLine.BorderSizePixel = 0
SideLine.Parent = SideBar

-- CONTENT
local ContentFrame = Instance.new("Frame")
ContentFrame.Size = UDim2.new(1, -170, 1, -56)
ContentFrame.Position = UDim2.new(0, 170, 0, 56)
ContentFrame.BackgroundTransparency = 1
ContentFrame.ClipsDescendants = true
ContentFrame.Parent = MainFrame

-- СТРАНИЦЫ
local Pages = {}
local function MakePage(name)
    local page = Instance.new("Frame")
    page.Name = name .. "Page"
    page.Size = UDim2.new(1, 0, 1, 0)
    page.BackgroundTransparency = 1
    page.Visible = false
    page.Parent = ContentFrame
    Pages[name] = page
    return page
end

local MainPage = MakePage("Main")
local VisualPage = MakePage("Visual")
local SkinPage = MakePage("SkinChanger")

-- ЗАГОЛОВКИ СТРАНИЦ
local function MakeHeader(page, title, sub, icon)
    local iconBg = Instance.new("Frame")
    iconBg.Size = UDim2.new(0, 28, 0, 28)
    iconBg.Position = UDim2.new(0, 20, 0, 18)
    iconBg.BackgroundColor3 = Color3.fromRGB(0, 40, 20)
    iconBg.BorderSizePixel = 0
    iconBg.Parent = page
    local ibc = Instance.new("UICorner")
    ibc.CornerRadius = UDim.new(1, 0)
    ibc.Parent = iconBg
    local il = Instance.new("TextLabel")
    il.Size = UDim2.new(1, 0, 1, 0)
    il.BackgroundTransparency = 1
    il.Text = icon
    il.TextColor3 = NEON
    il.TextSize = 14
    il.Font = Enum.Font.GothamBold
    il.Parent = iconBg

    local h = Instance.new("TextLabel")
    h.Size = UDim2.new(1, -60, 0, 20)
    h.Position = UDim2.new(0, 60, 0, 16)
    h.BackgroundTransparency = 1
    h.Text = title
    h.TextColor3 = TEXT_BRIGHT
    h.TextSize = 18
    h.Font = Enum.Font.GothamBold
    h.TextXAlignment = Enum.TextXAlignment.Left
    h.Parent = page

    local s = Instance.new("TextLabel")
    s.Size = UDim2.new(1, -60, 0, 16)
    s.Position = UDim2.new(0, 60, 0, 36)
    s.BackgroundTransparency = 1
    s.Text = sub
    s.TextColor3 = TEXT_DIM
    s.TextSize = 11
    s.Font = Enum.Font.Gotham
    s.TextXAlignment = Enum.TextXAlignment.Left
    s.Parent = page

    local line = Instance.new("Frame")
    line.Size = UDim2.new(1, -40, 0, 1)
    line.Position = UDim2.new(0, 20, 0, 62)
    line.BackgroundColor3 = Color3.fromRGB(30, 40, 32)
    line.BorderSizePixel = 0
    line.Parent = page
end

MakeHeader(MainPage, "Main", "Aim, weapons and movement", "⚙")
MakeHeader(VisualPage, "Visual", "ESP, tracers and outlines", "👁")
MakeHeader(SkinPage, "Skin Changer", "Skins, knives and cosmetics", "🎨")

-- ФУТЕР
local Footer = Instance.new("TextLabel")
Footer.Size = UDim2.new(1, -20, 0, 20)
Footer.Position = UDim2.new(0, 10, 1, -24)
Footer.BackgroundTransparency = 1
Footer.Text = "No One  |  https://t.me/devscripts0"
Footer.TextColor3 = Color3.fromRGB(0, 150, 60)
Footer.TextSize = 11
Footer.Font = Enum.Font.GothamMedium
Footer.TextXAlignment = Enum.TextXAlignment.Right
Footer.Parent = MainFrame

_G.NoOneUI = {
    ScreenGui = ScreenGui,
    MainFrame = MainFrame,
    SideBar = SideBar,
    ContentFrame = ContentFrame,
    Pages = Pages,
    NEON = NEON,
    TEXT_DIM = TEXT_DIM,
    TEXT_BRIGHT = TEXT_BRIGHT,
    PlayClick = PlayClick,
    TweenService = TweenService,
    VisualPage = VisualPage,
}
print("Part 1/3 loaded.")
-- No One | Part 2/3
local TweenService = game:GetService("TweenService")

if not _G.NoOneUI then warn("Сначала Part 1!") return end

local UI = _G.NoOneUI
local SideBar = UI.SideBar
local Pages = UI.Pages
local NEON = UI.NEON
local TEXT_DIM = UI.TEXT_DIM
local PlayClick = UI.PlayClick
local VisualPage = UI.VisualPage

-- ФУНКЦИЯ КНОПКИ-ТУМБЛЕРА
local function MakeToggle(parent, text, yPos, iconText)
    local Btn = Instance.new("TextButton")
    Btn.Size = UDim2.new(1, -40, 0, 50)
    Btn.Position = UDim2.new(0, 20, 0, yPos)
    Btn.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
    Btn.BorderSizePixel = 0
    Btn.Text = ""
    Btn.AutoButtonColor = false
    Btn.Parent = parent

    local C = Instance.new("UICorner")
    C.CornerRadius = UDim.new(0, 10)
    C.Parent = Btn

    local S = Instance.new("UIStroke")
    S.Color = Color3.fromRGB(60, 60, 60)
    S.Thickness = 1
    S.Transparency = 0.3
    S.Parent = Btn

    local IconBg = Instance.new("Frame")
    IconBg.Size = UDim2.new(0, 32, 0, 32)
    IconBg.Position = UDim2.new(0, 10, 0.5, -16)
    IconBg.BackgroundColor3 = Color3.fromRGB(30, 30, 35)
    IconBg.BorderSizePixel = 0
    IconBg.Parent = Btn
    local ibc = Instance.new("UICorner")
    ibc.CornerRadius = UDim.new(1, 0)
    ibc.Parent = IconBg

    local IL = Instance.new("TextLabel")
    IL.Size = UDim2.new(1, 0, 1, 0)
    IL.BackgroundTransparency = 1
    IL.Text = iconText
    IL.TextColor3 = Color3.fromRGB(200, 200, 200)
    IL.TextSize = 16
    IL.Font = Enum.Font.Gotham
    IL.Parent = IconBg

    local TL = Instance.new("TextLabel")
    TL.Size = UDim2.new(1, -100, 1, 0)
    TL.Position = UDim2.new(0, 52, 0, 0)
    TL.BackgroundTransparency = 1
    TL.Text = text
    TL.TextColor3 = Color3.fromRGB(255, 255, 255)
    TL.TextSize = 15
    TL.Font = Enum.Font.GothamBold
    TL.TextXAlignment = Enum.TextXAlignment.Left
    TL.Parent = Btn

    local StateDot = Instance.new("Frame")
    StateDot.Size = UDim2.new(0, 10, 0, 10)
    StateDot.Position = UDim2.new(1, -25, 0.5, -5)
    StateDot.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
    StateDot.BorderSizePixel = 0
    StateDot.Parent = Btn
    local sdc = Instance.new("UICorner")
    sdc.CornerRadius = UDim.new(1, 0)
    sdc.Parent = StateDot

    Btn.MouseEnter:Connect(function()
        TweenService:Create(S, TweenInfo.new(0.3), {Color = NEON, Transparency = 0}):Play()
    end)
    Btn.MouseLeave:Connect(function()
        if not Btn:GetAttribute("On") then
            TweenService:Create(S, TweenInfo.new(0.3), {Color = Color3.fromRGB(60, 60, 60), Transparency = 0.3}):Play()
        end
    end)

    return Btn, S, StateDot, IL, IconBg
end

local ESPBtn, ESPStroke, ESPDot, ESPIcon, ESPIconBg = MakeToggle(VisualPage, "ESP", 85, "🎯")
local TracersBtn, TracersStroke, TracersDot, TracersIcon, TracersIconBg = MakeToggle(VisualPage, "TRACERS", 145, "📡")

-- ВКЛАДКИ
local function CreateTabButton(name, icon, yOffset)
    local Btn = Instance.new("TextButton")
    Btn.Size = UDim2.new(1, -20, 0, 44)
    Btn.Position = UDim2.new(0, 10, 0, yOffset)
    Btn.BackgroundColor3 = Color3.fromRGB(0, 70, 30)
    Btn.BackgroundTransparency = 1
    Btn.BorderSizePixel = 0
    Btn.Text = ""
    Btn.AutoButtonColor = false
    Btn.Parent = SideBar

    local C = Instance.new("UICorner")
    C.CornerRadius = UDim.new(0, 8)
    C.Parent = Btn

    local Ind = Instance.new("Frame")
    Ind.Size = UDim2.new(0, 3, 0, 22)
    Ind.Position = UDim2.new(0, -10, 0.5, -11)
    Ind.BackgroundColor3 = NEON
    Ind.BackgroundTransparency = 1
    Ind.BorderSizePixel = 0
    Ind.Parent = Btn
    local IC = Instance.new("UICorner")
    IC.CornerRadius = UDim.new(1, 0)
    IC.Parent = Ind

    local IL = Instance.new("TextLabel")
    IL.Size = UDim2.new(0, 30, 1, 0)
    IL.Position = UDim2.new(0, 15, 0, 0)
    IL.BackgroundTransparency = 1
    IL.Text = icon
    IL.TextColor3 = Color3.fromRGB(0, 200, 90)
    IL.TextSize = 16
    IL.Font = Enum.Font.Gotham
    IL.Parent = Btn

    local TL = Instance.new("TextLabel")
    TL.Size = UDim2.new(0, 110, 1, 0)
    TL.Position = UDim2.new(0, 50, 0, 0)
    TL.BackgroundTransparency = 1
    TL.Text = name
    TL.TextColor3 = TEXT_DIM
    TL.TextSize = 15
    TL.Font = Enum.Font.GothamMedium
    TL.TextXAlignment = Enum.TextXAlignment.Left
    TL.Parent = Btn

    Btn.MouseEnter:Connect(function()
        if Btn.BackgroundTransparency == 1 then
            TweenService:Create(Btn, TweenInfo.new(0.25), {BackgroundTransparency = 0.85, BackgroundColor3 = Color3.fromRGB(0, 90, 40)}):Play()
            TweenService:Create(TL, TweenInfo.new(0.25), {TextColor3 = Color3.fromRGB(0, 255, 110)}):Play()
        end
    end)

    Btn.MouseLeave:Connect(function()
        if Ind.BackgroundTransparency == 1 then
            TweenService:Create(Btn, TweenInfo.new(0.25), {BackgroundTransparency = 1}):Play()
            TweenService:Create(TL, TweenInfo.new(0.25), {TextColor3 = TEXT_DIM}):Play()
        end
    end)

    Btn.MouseButton1Click:Connect(function()
        PlayClick()
    end)

    return Btn, TL, Ind
end

local Tabs = {
    {Name = "Main", Icon = "🔧", Offset = 15, Page = "Main"},
    {Name = "Visual", Icon = "👁", Offset = 65, Page = "Visual"},
    {Name = "Skin Changer", Icon = "🎨", Offset = 115, Page = "SkinChanger"}
}

local TabButtons = {}

local function ActivateTab(tabName)
    for name, data in pairs(TabButtons) do
        local act = (name == tabName)
        TweenService:Create(data.Button, TweenInfo.new(0.3), {
            BackgroundTransparency = act and 0.8 or 1,
            BackgroundColor3 = Color3.fromRGB(0, 90, 35)
        }):Play()
        TweenService:Create(data.Label, TweenInfo.new(0.3), {
            TextColor3 = act and NEON or TEXT_DIM
        }):Play()
        TweenService:Create(data.Indicator, TweenInfo.new(0.3), {
            BackgroundTransparency = act and 0 or 1
        }):Play()

        if data.Page and Pages[data.Page] then
            Pages[data.Page].Visible = act
        end
    end
end

for _, t in ipairs(Tabs) do
    local b, l, i = CreateTabButton(t.Name, t.Icon, t.Offset)
    TabButtons[t.Name] = {
        Button=b, Label=l, Indicator=i, Page=t.Page
    }
    b.MouseButton1Click:Connect(function()
        ActivateTab(t.Name)
    end)
end

ActivateTab("Main")

UI.ESPBtn = ESPBtn
UI.ESPStroke = ESPStroke
UI.ESPDot = ESPDot
UI.ESPIcon = ESPIcon
UI.ESPIconBg = ESPIconBg
UI.TracersBtn = TracersBtn
UI.TracersStroke = TracersStroke
UI.TracersDot = TracersDot
UI.TracersIcon = TracersIcon
UI.TracersIconBg = TracersIconBg

print("Part 2/3 loaded.")
-- No One | Part 3/3
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local LocalPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera

if not _G.NoOneUI then warn("Сначала Part 1 и 2!") return end

local UI = _G.NoOneUI
local NEON = UI.NEON
local PlayClick = UI.PlayClick

local ESPBtn = UI.ESPBtn
local ESPStroke = UI.ESPStroke
local ESPDot = UI.ESPDot
local ESPIcon = UI.ESPIcon
local ESPIconBg = UI.ESPIconBg

local TracersBtn = UI.TracersBtn
local TracersStroke = UI.TracersStroke
local TracersDot = UI.TracersDot
local TracersIcon = UI.TracersIcon
local TracersIconBg = UI.TracersIconBg

-- ЦВЕТА
local ESPColor_Team = Color3.fromRGB(0, 120, 255)
local ESPColor_Enemy = Color3.fromRGB(255, 40, 40)

local ActiveESP = {}
local Tracers = {}
local ESPEnabled = false
local TracersEnabled = false

-- ОПРЕДЕЛЕНИЕ КОМАНДЫ ПО ПАПКЕ
local function GetTeamFolder(player)
    local char = player.Character
    if not char or not char.Parent then return nil end
    return char.Parent.Name
end

local function IsTeammate(player)
    if player == LocalPlayer then return true end
    local myFolder = GetTeamFolder(LocalPlayer)
    local hisFolder = GetTeamFolder(player)
    if not myFolder or not hisFolder then return false end
    return myFolder == hisFolder
end

local function GetESPColor(player)
    if IsTeammate(player) then
        return ESPColor_Team
    else
        return ESPColor_Enemy
    end
end

-- ESP
local function CreateESP(player)
    if player == LocalPlayer then return end
    if ActiveESP[player] then return end
    local char = player.Character
    if not char then return end

    local folder = Instance.new("Folder")
    folder.Name = "NoOne_ESP"
    folder.Parent = char

    local color = GetESPColor(player)
    local boxes = {}
    for _, part in ipairs(char:GetChildren()) do
        if part:IsA("BasePart") then
            local box = Instance.new("SelectionBox")
            box.Adornee = part
            box.LineThickness = 0.08
            box.Transparency = 0.1
            box.SurfaceTransparency = 1
            box.Color3 = color
            box.Parent = folder
            table.insert(boxes, box)
        end
    end

    ActiveESP[player] = {folder = folder, boxes = boxes}
end

local function RemoveESP(p)
    if ActiveESP[p] then
        ActiveESP[p].folder:Destroy()
        ActiveESP[p] = nil
    end
end

-- TRACERS
local function CreateTracer(player)
    if player == LocalPlayer then return end
    if Tracers[player] then return end
    local l = Drawing.new("Line")
    l.Thickness = 1
    l.Transparency = 0.85
    l.Visible = false
    l.Color = GetESPColor(player)
    Tracers[player] = l
end

local function RemoveTracer(p)
    if Tracers[p] then Tracers[p]:Remove() Tracers[p] = nil end
end

-- ОБНОВЛЕНИЕ
local function UpdateAll()
    for _, p in ipairs(Players:GetPlayers()) do
        if p ~= LocalPlayer then
            if ESPEnabled then
                if p.Character then CreateESP(p) end
            else
                RemoveESP(p)
            end
            if TracersEnabled then
                CreateTracer(p)
            else
                RemoveTracer(p)
            end
        end
    end
end

local function Setup(p)
    if p == LocalPlayer then return end
    if ESPEnabled and p.Character then CreateESP(p) end
    if TracersEnabled then CreateTracer(p) end

    p.CharacterAdded:Connect(function()
        task.wait(0.5)
        if ESPEnabled then RemoveESP(p) CreateESP(p) end
    end)
    p.CharacterRemoving:Connect(function() RemoveESP(p) end)
end

for _, p in ipairs(Players:GetPlayers()) do Setup(p) end
Players.PlayerAdded:Connect(Setup)
Players.PlayerRemoving:Connect(function(p)
    RemoveESP(p)
    RemoveTracer(p)
end)

-- РЕНДЕР TRACERS
RunService.RenderStepped:Connect(function()
    if not TracersEnabled then return end
    local bottom = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y)
    for _, p in ipairs(Players:GetPlayers()) do
        if p ~= LocalPlayer then
            if not Tracers[p] then CreateTracer(p) end
            local char = p.Character
            local root = char and char:FindFirstChild("HumanoidRootPart")
            if root and Tracers[p] then
                local pos, onScreen = Camera:WorldToViewportPoint(root.Position)
                if onScreen then
                    Tracers[p].From = bottom
                    Tracers[p].To = Vector2.new(pos.X, pos.Y)
                    Tracers[p].Visible = true
                else
                    Tracers[p].Visible = false
                end
            elseif Tracers[p] then
                Tracers[p].Visible = false
            end
        end
    end
end)

-- ТУМБЛЕРЫ
local twInfo = TweenInfo.new(0.8, Enum.EasingStyle.Quart, Enum.EasingDirection.Out)

local function SetToggle(Btn, Stroke, Dot, IconLabel, IconBg, on)
    Btn:SetAttribute("On", on)
    TweenService:Create(Btn, twInfo, {
        BackgroundColor3 = on and NEON or Color3.fromRGB(15, 15, 15)
    }):Play()
    TweenService:Create(Stroke, twInfo, {
        Color = on and NEON or Color3.fromRGB(60, 60, 60),
        Transparency = on and 0 or 0.3
    }):Play()
    TweenService:Create(Dot, twInfo, {
        BackgroundColor3 = on and Color3.fromRGB(0, 40, 15) or Color3.fromRGB(80, 80, 80)
    }):Play()
    TweenService:Create(IconLabel, twInfo, {
        TextColor3 = on and Color3.fromRGB(0, 30, 10) or Color3.fromRGB(200, 200, 200)
    }):Play()
    TweenService:Create(IconBg, twInfo, {
        BackgroundColor3 = on and Color3.fromRGB(0, 60, 25) or Color3.fromRGB(30, 30, 35)
    }):Play()
end

ESPBtn.MouseButton1Click:Connect(function()
    PlayClick()
    ESPEnabled = not ESPEnabled
    SetToggle(ESPBtn, ESPStroke, ESPDot, ESPIcon, ESPIconBg, ESPEnabled)
    UpdateAll()
end)

TracersBtn.MouseButton1Click:Connect(function()
    PlayClick()
    TracersEnabled = not TracersEnabled
    SetToggle(TracersBtn, TracersStroke, TracersDot, TracersIcon, TracersIconBg, TracersEnabled)
    if not TracersEnabled then
        for _, l in pairs(Tracers) do l.Visible = false end
    end
    UpdateAll()
end)

print("Part 3/3 loaded. ESP + Tracers ready.")
print("Telegram: https://t.me/devscripts0")
