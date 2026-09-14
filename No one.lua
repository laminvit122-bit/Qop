-- No One | Part 1/3
local CoreGui = game:GetService("CoreGui")
local TweenService = game:GetService("TweenService")
local SoundService = game:GetService("SoundService")

if CoreGui:FindFirstChild("NoOneUI") then CoreGui.NoOneUI:Destroy() end

local NEON = Color3.fromRGB(0, 255, 100)
local BG_DARK = Color3.fromRGB(8, 8, 10)
local BG_DARKER = Color3.fromRGB(5, 5, 7)

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "NoOneUI"
ScreenGui.ResetOnSpawn = false
ScreenGui.IgnoreGuiInset = true
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

local Shadow = Instance.new("Frame")
Shadow.Size = UDim2.new(0, 620, 0, 370)
Shadow.Position = UDim2.new(0.5, -300, 0.5, -165)
Shadow.BackgroundColor3 = Color3.new(0, 0, 0)
Shadow.BackgroundTransparency = 0.5
Shadow.BorderSizePixel = 0
Shadow.ZIndex = 0
Shadow.Parent = ScreenGui
local SC = Instance.new("UICorner")
SC.CornerRadius = UDim.new(0, 16)
SC.Parent = Shadow

local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 600, 0, 350)
MainFrame.Position = UDim2.new(0.5, -300, 0.5, -175)
MainFrame.BackgroundColor3 = BG_DARK
MainFrame.BorderSizePixel = 0
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.ZIndex = 1
MainFrame.Parent = ScreenGui

local MC = Instance.new("UICorner")
MC.CornerRadius = UDim.new(0, 14)
MC.Parent = MainFrame

local InnerStroke = Instance.new("UIStroke")
InnerStroke.Color = Color3.fromRGB(0, 80, 40)
InnerStroke.Thickness = 1
InnerStroke.Transparency = 0.3
InnerStroke.Parent = MainFrame

local MainStroke = Instance.new("UIStroke")
MainStroke.Color = NEON
MainStroke.Thickness = 1.5
MainStroke.Transparency = 0.15
MainStroke.Parent = MainFrame

local GlowStroke = Instance.new("UIStroke")
GlowStroke.Color = NEON
GlowStroke.Thickness = 6
GlowStroke.Transparency = 0.9
GlowStroke.Parent = MainFrame

task.spawn(function()
    while MainFrame.Parent do
        TweenService:Create(GlowStroke, TweenInfo.new(2), {Transparency = 0.75}):Play()
        TweenService:Create(MainStroke, TweenInfo.new(2), {Transparency = 0.05}):Play()
        task.wait(2)
        TweenService:Create(GlowStroke, TweenInfo.new(2), {Transparency = 0.95}):Play()
        TweenService:Create(MainStroke, TweenInfo.new(2), {Transparency = 0.3}):Play()
        task.wait(2)
    end
end)

local TopBar = Instance.new("Frame")
TopBar.Size = UDim2.new(1, 0, 0, 55)
TopBar.BackgroundColor3 = BG_DARKER
TopBar.BackgroundTransparency = 0.2
TopBar.BorderSizePixel = 0
TopBar.ZIndex = 2
TopBar.Parent = MainFrame

local TC = Instance.new("UICorner")
TC.CornerRadius = UDim.new(0, 14)
TC.Parent = TopBar

local Sep = Instance.new("Frame")
Sep.Size = UDim2.new(1, -20, 0, 1)
Sep.Position = UDim2.new(0, 10, 0, 55)
Sep.BackgroundColor3 = NEON
Sep.BorderSizePixel = 0
Sep.ZIndex = 3
Sep.Parent = MainFrame

local SepGrad = Instance.new("UIGradient")
SepGrad.Transparency = NumberSequence.new({
    NumberSequenceKeypoint.new(0, 1),
    NumberSequenceKeypoint.new(0.5, 0),
    NumberSequenceKeypoint.new(1, 1)
})
SepGrad.Parent = Sep

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(0, 300, 1, 0)
Title.Position = UDim2.new(0, 25, 0, 0)
Title.BackgroundTransparency = 1
Title.Text = "No One"
Title.TextColor3 = Color3.new(1, 1, 1)
Title.TextSize = 26
Title.Font = Enum.Font.GothamBlack
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.ZIndex = 3
Title.Parent = TopBar

local TitleGrad = Instance.new("UIGradient")
TitleGrad.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0.00, Color3.fromRGB(120, 255, 160)),
    ColorSequenceKeypoint.new(0.25, Color3.fromRGB(0, 255, 100)),
    ColorSequenceKeypoint.new(0.50, Color3.fromRGB(0, 180, 70)),
    ColorSequenceKeypoint.new(0.75, Color3.fromRGB(0, 255, 100)),
    ColorSequenceKeypoint.new(1.00, Color3.fromRGB(120, 255, 160))
})
TitleGrad.Rotation = 45
TitleGrad.Parent = Title

task.spawn(function()
    while Title.Parent do
        TweenService:Create(TitleGrad, TweenInfo.new(3, Enum.EasingStyle.Linear), {Rotation = 405}):Play()
        task.wait(3)
    end
end)

local TIS = Instance.new("UIStroke")
TIS.Color = Color3.fromRGB(0, 60, 25)
TIS.Thickness = 2
TIS.Transparency = 0.2
TIS.Parent = Title

local TG = Instance.new("UIStroke")
TG.Color = NEON
TG.Thickness = 4
TG.Transparency = 0.7
TG.Parent = Title

task.spawn(function()
    while Title.Parent do
        TweenService:Create(TG, TweenInfo.new(1.5), {Transparency = 0.4, Thickness = 5}):Play()
        task.wait(1.5)
        TweenService:Create(TG, TweenInfo.new(1.5), {Transparency = 0.8, Thickness = 3}):Play()
        task.wait(1.5)
    end
end)

local Subtitle = Instance.new("TextLabel")
Subtitle.Size = UDim2.new(0, 300, 0, 14)
Subtitle.Position = UDim2.new(0, 27, 0, 38)
Subtitle.BackgroundTransparency = 1
Subtitle.Text = "by devscripts0"
Subtitle.TextColor3 = Color3.fromRGB(0, 130, 60)
Subtitle.TextSize = 11
Subtitle.Font = Enum.Font.GothamMedium
Subtitle.TextXAlignment = Enum.TextXAlignment.Left
Subtitle.ZIndex = 3
Subtitle.Parent = TopBar

_G.NoOneUI = {
    ScreenGui = ScreenGui,
    MainFrame = MainFrame,
    Shadow = Shadow,
    NEON = NEON,
    PlayClick = PlayClick,
}
print("Part 1/3 loaded.")
-- No One | Part 2/3
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")

if not _G.NoOneUI then warn("Сначала Part 1!") return end

local UI = _G.NoOneUI
local MainFrame = UI.MainFrame
local NEON = UI.NEON
local TEXT_DIM = Color3.fromRGB(160, 160, 170)
local TEXT_BRIGHT = Color3.fromRGB(240, 240, 245)

local SideBar = Instance.new("Frame")
SideBar.Size = UDim2.new(0, 170, 1, -56)
SideBar.Position = UDim2.new(0, 0, 0, 56)
SideBar.BackgroundColor3 = Color3.fromRGB(8, 8, 10)
SideBar.BackgroundTransparency = 0.4
SideBar.BorderSizePixel = 0
SideBar.ZIndex = 2
SideBar.Parent = MainFrame

local SideLine = Instance.new("Frame")
SideLine.Size = UDim2.new(0, 1, 1, -30)
SideLine.Position = UDim2.new(1, -1, 0, 15)
SideLine.BackgroundColor3 = NEON
SideLine.BackgroundTransparency = 0.7
SideLine.BorderSizePixel = 0
SideLine.ZIndex = 3
SideLine.Parent = SideBar

local ContentFrame = Instance.new("Frame")
ContentFrame.Size = UDim2.new(1, -170, 1, -56)
ContentFrame.Position = UDim2.new(0, 170, 0, 56)
ContentFrame.BackgroundTransparency = 1
ContentFrame.ClipsDescendants = true
ContentFrame.ZIndex = 2
ContentFrame.Parent = MainFrame

-- ============ 3 СТРАНИЦЫ ============
local Pages = {}

local function MakePage(name)
    local page = Instance.new("Frame")
    page.Name = name .. "Page"
    page.Size = UDim2.new(1, 0, 1, 0)
    page.Position = UDim2.new(0, 0, 0, 0)
    page.BackgroundTransparency = 1
    page.Visible = false
    page.ZIndex = 3
    page.Parent = ContentFrame
    Pages[name] = page
    return page
end

local MainPage = MakePage("Main")
local VisualPage = MakePage("Visual")
local SkinPage = MakePage("SkinChanger")

-- Заголовки для каждой страницы
local function MakeHeader(page, title, sub)
    local h = Instance.new("TextLabel")
    h.Size = UDim2.new(1, -40, 0, 20)
    h.Position = UDim2.new(0, 20, 0, 15)
    h.BackgroundTransparency = 1
    h.Text = title
    h.TextColor3 = TEXT_BRIGHT
    h.TextSize = 18
    h.Font = Enum.Font.GothamBold
    h.TextXAlignment = Enum.TextXAlignment.Left
    h.ZIndex = 3
    h.Parent = page

    local s = Instance.new("TextLabel")
    s.Size = UDim2.new(1, -40, 0, 16)
    s.Position = UDim2.new(0, 20, 0, 36)
    s.BackgroundTransparency = 1
    s.Text = sub
    s.TextColor3 = TEXT_DIM
    s.TextSize = 12
    s.Font = Enum.Font.Gotham
    s.TextXAlignment = Enum.TextXAlignment.Left
    s.ZIndex = 3
    s.Parent = page

    local line = Instance.new("Frame")
    line.Size = UDim2.new(1, -40, 0, 1)
    line.Position = UDim2.new(0, 20, 0, 65)
    line.BackgroundColor3 = Color3.fromRGB(30, 40, 32)
    line.BorderSizePixel = 0
    line.ZIndex = 3
    line.Parent = page
end

MakeHeader(MainPage, "Main", "Aim, weapons and movement")
MakeHeader(VisualPage, "Visual", "ESP, tracers and outlines")
MakeHeader(SkinPage, "Skin Changer", "Skins, knives and cosmetics")

-- ============ ФУНКЦИЯ СОЗДАНИЯ КНОПКИ-ТУМБЛЕРА ============
local function MakeToggle(parent, text, pos)
    local Btn = Instance.new("TextButton")
    Btn.Size = UDim2.new(0, 110, 0, 110)
    Btn.Position = pos
    Btn.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
    Btn.BorderSizePixel = 0
    Btn.Text = text
    Btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    Btn.TextSize = 15
    Btn.Font = Enum.Font.GothamBold
    Btn.AutoButtonColor = false
    Btn.ZIndex = 5
    Btn.Parent = parent

    local C = Instance.new("UICorner")
    C.CornerRadius = UDim.new(0, 10)
    C.Parent = Btn

    local S = Instance.new("UIStroke")
    S.Color = Color3.fromRGB(60, 60, 60)
    S.Thickness = 1
    S.Transparency = 0.3
    S.Parent = Btn

    Btn.MouseEnter:Connect(function()
        TweenService:Create(S, TweenInfo.new(0.3), {Color = NEON, Transparency = 0}):Play()
    end)
    Btn.MouseLeave:Connect(function()
        if not Btn:GetAttribute("On") then
            TweenService:Create(S, TweenInfo.new(0.3), {Color = Color3.fromRGB(60, 60, 60), Transparency = 0.3}):Play()
        end
    end)

    return Btn, S
end

-- Кнопки в VisualPage
local ESPBtn, ESPStroke = MakeToggle(VisualPage, "ESP", UDim2.new(0, 20, 0, 90))
local TracersBtn, TracersStroke = MakeToggle(VisualPage, "TRACERS", UDim2.new(0, 150, 0, 90))

-- ============ ВКЛАДКИ SIDEBAR ============
local function CreateTabButton(name, icon, yOffset, pageName)
    local Btn = Instance.new("TextButton")
    Btn.Name = name .. "Tab"
    Btn.Size = UDim2.new(1, -20, 0, 44)
    Btn.Position = UDim2.new(0, 10, 0, yOffset)
    Btn.BackgroundColor3 = Color3.fromRGB(0, 70, 30)
    Btn.BackgroundTransparency = 1
    Btn.BorderSizePixel = 0
    Btn.Text = ""
    Btn.AutoButtonColor = false
    Btn.ZIndex = 4
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
    Ind.ZIndex = 5
    Ind.Parent = Btn
    local IC = Instance.new("UICorner")
    IC.CornerRadius = UDim.new(1, 0)
    IC.Parent = Ind

    local IconBg = Instance.new("Frame")
    IconBg.Size = UDim2.new(0, 30, 0, 30)
    IconBg.Position = UDim2.new(0, 15, 0.5, -15)
    IconBg.BackgroundColor3 = Color3.fromRGB(20, 20, 24)
    IconBg.BorderSizePixel = 0
    IconBg.ZIndex = 4
    IconBg.Parent = Btn
    local IBC = Instance.new("UICorner")
    IBC.CornerRadius = UDim.new(1, 0)
    IBC.Parent = IconBg

    local IBS = Instance.new("UIStroke")
    IBS.Color = Color3.fromRGB(40, 50, 42)
    IBS.Thickness = 1
    IBS.Transparency = 0.3
    IBS.Parent = IconBg

    local IL = Instance.new("TextLabel")
    IL.Size = UDim2.new(1, 0, 1, 0)
    IL.BackgroundTransparency = 1
    IL.Text = icon
    IL.TextColor3 = Color3.fromRGB(0, 200, 90)
    IL.TextSize = 16
    IL.Font = Enum.Font.Gotham
    IL.ZIndex = 5
    IL.Parent = IconBg

    local TL = Instance.new("TextLabel")
    TL.Size = UDim2.new(0, 110, 1, 0)
    TL.Position = UDim2.new(0, 58, 0, 0)
    TL.BackgroundTransparency = 1
    TL.Text = name
    TL.TextColor3 = TEXT_DIM
    TL.TextSize = 15
    TL.Font = Enum.Font.GothamMedium
    TL.TextXAlignment = Enum.TextXAlignment.Left
    TL.ZIndex = 5
    TL.Parent = Btn

    Btn.MouseEnter:Connect(function()
        if Btn.BackgroundTransparency == 1 then
            TweenService:Create(Btn, TweenInfo.new(0.25), {BackgroundTransparency = 0.85, BackgroundColor3 = Color3.fromRGB(0, 90, 40)}):Play()
            TweenService:Create(TL, TweenInfo.new(0.25), {TextColor3 = Color3.fromRGB(0, 255, 110)}):Play()
            TweenService:Create(IBS, TweenInfo.new(0.25), {Color = NEON, Transparency = 0}):Play()
        end
    end)

    Btn.MouseLeave:Connect(function()
        if Ind.BackgroundTransparency == 1 then
            TweenService:Create(Btn, TweenInfo.new(0.25), {BackgroundTransparency = 1}):Play()
            TweenService:Create(TL, TweenInfo.new(0.25), {TextColor3 = TEXT_DIM}):Play()
            TweenService:Create(IBS, TweenInfo.new(0.25), {Color = Color3.fromRGB(40, 50, 42), Transparency = 0.3}):Play()
        end
    end)

    Btn.MouseButton1Click:Connect(function()
        UI.PlayClick()
    end)

    return Btn, TL, Ind, IL, IBS, IconBg
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
        TweenService:Create(data.IconLabel, TweenInfo.new(0.3), {
            TextColor3 = act and Color3.fromRGB(0, 255, 110) or Color3.fromRGB(0, 180, 80)
        }):Play()
        TweenService:Create(data.IconBg, TweenInfo.new(0.3), {
            BackgroundColor3 = act and Color3.fromRGB(0, 35, 18) or Color3.fromRGB(20, 20, 24)
        }):Play()
        TweenService:Create(data.IconBgStroke, TweenInfo.new(0.3), {
            Color = act and NEON or Color3.fromRGB(40, 50, 42),
            Transparency = act and 0 or 0.3
        }):Play()

        -- Показываем только активную страницу
        if data.Page and Pages[data.Page] then
            Pages[data.Page].Visible = act
        end
    end
end

for _, t in ipairs(Tabs) do
    local b, l, i, il, ibs, ibg = CreateTabButton(t.Name, t.Icon, t.Offset, t.Page)
    TabButtons[t.Name] = {
        Button=b, Label=l, Indicator=i, IconLabel=il,
        IconBgStroke=ibs, IconBg=ibg, Page=t.Page
    }
    b.MouseButton1Click:Connect(function()
        ActivateTab(t.Name)
    end)
end

ActivateTab("Main")

-- Скрываем частицы внутри окна (убираем баг с прозрачной хренью)
UI.TabButtons = TabButtons
UI.ActivateTab = ActivateTab
UI.Pages = Pages
UI.ContentFrame = ContentFrame
UI.RunService = RunService
UI.TweenService = TweenService
UI.ESPButton = ESPBtn
UI.ESPStroke = ESPStroke
UI.TracersButton = TracersBtn
UI.TracersStroke = TracersStroke

print("Part 2/3 loaded.")
-- No One | Part 3/3
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local LocalPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera

if not _G.NoOneUI then warn("Сначала Part 1 и 2!") return end

local UI = _G.NoOneUI
local MainFrame = UI.MainFrame
local Shadow = UI.Shadow
local NEON = UI.NEON
local ESPBtn = UI.ESPButton
local ESPStroke = UI.ESPStroke
local TracersBtn = UI.TracersButton
local TracersStroke = UI.TracersStroke

-- ============ ФУТЕР ============
local Footer = Instance.new("TextLabel")
Footer.Size = UDim2.new(1, -20, 0, 20)
Footer.Position = UDim2.new(0, 10, 1, -24)
Footer.BackgroundTransparency = 1
Footer.Text = "No One  |  https://t.me/devscripts0"
Footer.TextColor3 = Color3.fromRGB(0, 150, 60)
Footer.TextSize = 11
Footer.Font = Enum.Font.GothamMedium
Footer.TextXAlignment = Enum.TextXAlignment.Right
Footer.ZIndex = 10
Footer.Parent = MainFrame

-- ============ АНИМАЦИЯ ОКНА ============
MainFrame.Size = UDim2.new(0, 0, 0, 0)
MainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
Shadow.Size = UDim2.new(0, 0, 0, 0)
Shadow.Position = UDim2.new(0.5, 0, 0.5, 0)

TweenService:Create(MainFrame, TweenInfo.new(0.45, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
    Size = UDim2.new(0, 600, 0, 350),
    Position = UDim2.new(0.5, -300, 0.5, -175)
}):Play()
TweenService:Create(Shadow, TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
    Size = UDim2.new(0, 620, 0, 370),
    Position = UDim2.new(0.5, -300, 0.5, -165)
}):Play()

-- ============ НАСТРОЙКИ ESP ============
local ESPColor_Team = Color3.fromRGB(0, 120, 255)   -- синий
local ESPColor_Enemy = Color3.fromRGB(255, 40, 40)  -- красный
local ActiveESP = {}
local Tracers = {}
local ESPEnabled = false
local TracersEnabled = false

local function IsTeammate(p)
    if p == LocalPlayer then return true end
    if p.Team == nil or LocalPlayer.Team == nil then return false end
    return p.Team == LocalPlayer.Team
end

-- ============ ESP ============
local function CreateESP(player)
    if player == LocalPlayer then return end
    if ActiveESP[player] then return end
    local char = player.Character
    if not char then return end
    local h = Instance.new("Highlight")
    h.Adornee = char
    h.FillTransparency = 1
    h.OutlineTransparency = 0.15
    h.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
    if IsTeammate(player) then
        h.FillColor = ESPColor_Team
        h.OutlineColor = ESPColor_Team
    else
        h.FillColor = ESPColor_Enemy
        h.OutlineColor = ESPColor_Enemy
    end
    h.Parent = char
    ActiveESP[player] = h
end

local function RemoveESP(p)
    if ActiveESP[p] then ActiveESP[p]:Destroy() ActiveESP[p] = nil end
end

-- ============ TRACERS ============
local function CreateTracer(player)
    if player == LocalPlayer then return end
    if Tracers[player] then return end
    local l = Drawing.new("Line")
    l.Thickness = 1
    l.Transparency = 0.85
    l.Visible = false
    l.Color = IsTeammate(player) and ESPColor_Team or ESPColor_Enemy
    Tracers[player] = l
end

local function RemoveTracer(p)
    if Tracers[p] then Tracers[p]:Remove() Tracers[p] = nil end
end

-- ============ ОБНОВЛЕНИЕ ============
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
        task.wait(0.4)
        if ESPEnabled then RemoveESP(p) CreateESP(p) end
    end)
    p.CharacterRemoving:Connect(function() RemoveESP(p) end)
    p:GetPropertyChangedSignal("Team"):Connect(function()
        task.wait(0.1)
        if ESPEnabled then
            RemoveESP(p)
            if p.Character then CreateESP(p) end
        end
        if Tracers[p] then
            Tracers[p].Color = IsTeammate(p) and ESPColor_Team or ESPColor_Enemy
        end
    end)
end

for _, p in ipairs(Players:GetPlayers()) do Setup(p) end
Players.PlayerAdded:Connect(Setup)
Players.PlayerRemoving:Connect(function(p)
    RemoveESP(p)
    RemoveTracer(p)
end)

LocalPlayer:GetPropertyChangedSignal("Team"):Connect(function()
    task.wait(0.2)
    UpdateAll()
    for p, l in pairs(Tracers) do
        l.Color = IsTeammate(p) and ESPColor_Team or ESPColor_Enemy
    end
end)

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

-- ============ ТУМБЛЕРЫ ============
local twInfo = TweenInfo.new(0.8, Enum.EasingStyle.Quart, Enum.EasingDirection.Out)

local function SetToggle(Btn, Stroke, on)
    Btn:SetAttribute("On", on)
    TweenService:Create(Btn, twInfo, {
        BackgroundColor3 = on and NEON or Color3.fromRGB(15, 15, 15)
    }):Play()
    TweenService:Create(Btn, twInfo, {
        TextColor3 = on and Color3.fromRGB(0, 30, 10) or Color3.fromRGB(255, 255, 255)
    }):Play()
    TweenService:Create(Stroke, twInfo, {
        Color = on and NEON or Color3.fromRGB(60, 60, 60),
        Transparency = on and 0 or 0.3
    }):Play()
end

ESPBtn.MouseButton1Click:Connect(function()
    UI.PlayClick()
    ESPEnabled = not ESPEnabled
    SetToggle(ESPBtn, ESPStroke, ESPEnabled)
    UpdateAll()
end)

TracersBtn.MouseButton1Click:Connect(function()
    UI.PlayClick()
    TracersEnabled = not TracersEnabled
    SetToggle(TracersBtn, TracersStroke, TracersEnabled)
    if not TracersEnabled then
        for _, l in pairs(Tracers) do l.Visible = false end
    end
    UpdateAll()
end)

SetToggle(ESPBtn, ESPStroke, false)
SetToggle(TracersBtn, TracersStroke, false)

print("Part 3/3 loaded. ESP + Tracers ready.")
print("Telegram: https://t.me/devscripts0")
