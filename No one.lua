-- No One | Ultimate Neon UI + Click Sound
-- Design inspired by screenshot
-- Telegram: https://t.me/devscripts0
-- Click Sound ID: 127105730240202

local CoreGui = game:GetService("CoreGui")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local SoundService = game:GetService("SoundService")

if CoreGui:FindFirstChild("NoOneUI") then
    CoreGui.NoOneUI:Destroy()
end

-- ============ НАСТРОЙКИ ЦВЕТА ============
local NEON = Color3.fromRGB(0, 255, 100)
local NEON_DARK = Color3.fromRGB(0, 150, 60)
local BG_DARK = Color3.fromRGB(8, 8, 10)
local BG_DARKER = Color3.fromRGB(5, 5, 7)
local BG_LIGHT = Color3.fromRGB(15, 15, 18)
local TEXT_DIM = Color3.fromRGB(160, 160, 170)
local TEXT_BRIGHT = Color3.fromRGB(240, 240, 245)

-- ============ SCREEN GUI ============
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "NoOneUI"
ScreenGui.ResetOnSpawn = false
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.IgnoreGuiInset = true
ScreenGui.Parent = CoreGui

-- ============ ЗВУК КЛИКА ============
local ClickSound = Instance.new("Sound")
ClickSound.SoundId = "rbxassetid://127105730240202"
ClickSound.Volume = 0.5
ClickSound.PlaybackSpeed = 1
ClickSound.Parent = SoundService

local function PlayClick()
    local s = ClickSound:Clone()
    s.Parent = SoundService
    s:Play()
    game:GetService("Debris"):AddItem(s, 2)
end

-- ============ ТЕНЬ ПОД ОКНОМ ============
local Shadow = Instance.new("Frame")
Shadow.Name = "Shadow"
Shadow.Size = UDim2.new(0, 620, 0, 370)
Shadow.Position = UDim2.new(0.5, -300, 0.5, -165)
Shadow.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Shadow.BackgroundTransparency = 0.5
Shadow.BorderSizePixel = 0
Shadow.ZIndex = 0
Shadow.Parent = ScreenGui

local ShadowCorner = Instance.new("UICorner")
ShadowCorner.CornerRadius = UDim.new(0, 16)
ShadowCorner.Parent = Shadow

-- ============ ГЛАВНОЕ ОКНО ============
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 600, 0, 350)
MainFrame.Position = UDim2.new(0.5, -300, 0.5, -175)
MainFrame.BackgroundColor3 = BG_DARK
MainFrame.BorderSizePixel = 0
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.ClipsDescendants = false
MainFrame.ZIndex = 1
MainFrame.Parent = ScreenGui

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 14)
MainCorner.Parent = MainFrame

-- Внутренний градиент
local BgGradient = Instance.new("UIGradient")
BgGradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(12, 25, 14)),
    ColorSequenceKeypoint.new(0.4, BG_DARK),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(6, 18, 9))
})
BgGradient.Rotation = 135
BgGradient.Parent = MainFrame

-- Внутренняя обводка (мягкая)
local InnerStroke = Instance.new("UIStroke")
InnerStroke.Color = Color3.fromRGB(0, 80, 40)
InnerStroke.Thickness = 1
InnerStroke.Transparency = 0.3
InnerStroke.Parent = MainFrame

-- Внешняя неоновая обводка
local MainStroke = Instance.new("UIStroke")
MainStroke.Color = NEON
MainStroke.Thickness = 1.5
MainStroke.Transparency = 0.15
MainStroke.Parent = MainFrame

-- Мягкое свечение снаружи
local GlowStroke = Instance.new("UIStroke")
GlowStroke.Color = NEON
GlowStroke.Thickness = 6
GlowStroke.Transparency = 0.9
GlowStroke.Parent = MainFrame

-- ============ АНИМАЦИЯ СВЕЧЕНИЯ РАМКИ ============
task.spawn(function()
    while MainFrame.Parent do
        TweenService:Create(GlowStroke, TweenInfo.new(2, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {Transparency = 0.75}):Play()
        TweenService:Create(MainStroke, TweenInfo.new(2, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {Transparency = 0.05}):Play()
        task.wait(2)
        TweenService:Create(GlowStroke, TweenInfo.new(2, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {Transparency = 0.95}):Play()
        TweenService:Create(MainStroke, TweenInfo.new(2, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {Transparency = 0.3}):Play()
        task.wait(2)
    end
end)

-- ============ ТОПБАР ============
local TopBar = Instance.new("Frame")
TopBar.Name = "TopBar"
TopBar.Size = UDim2.new(1, 0, 0, 55)
TopBar.BackgroundColor3 = BG_DARKER
TopBar.BackgroundTransparency = 0.2
TopBar.BorderSizePixel = 0
TopBar.ZIndex = 2
TopBar.Parent = MainFrame

local TopCorner = Instance.new("UICorner")
TopCorner.CornerRadius = UDim.new(0, 14)
TopCorner.Parent = TopBar

local TopGradient = Instance.new("UIGradient")
TopGradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 45, 20)),
    ColorSequenceKeypoint.new(0.6, Color3.fromRGB(8, 8, 10)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 30, 12))
})
TopGradient.Rotation = 0
TopGradient.Parent = TopBar

-- Закрывающий нижний угол топбара
local TopFix = Instance.new("Frame")
TopFix.Size = UDim2.new(1, 0, 0, 14)
TopFix.Position = UDim2.new(0, 0, 1, -14)
TopFix.BackgroundColor3 = BG_DARKER
TopFix.BackgroundTransparency = 1
TopFix.BorderSizePixel = 0
TopFix.ZIndex = 2
TopFix.Parent = TopBar

-- Неоновая линия-разделитель под топбаром
local Separator = Instance.new("Frame")
Separator.Size = UDim2.new(1, -20, 0, 1)
Separator.Position = UDim2.new(0, 10, 0, 55)
Separator.BackgroundColor3 = NEON
Separator.BorderSizePixel = 0
Separator.ZIndex = 3
Separator.Parent = MainFrame

local SeparatorGradient = Instance.new("UIGradient")
SeparatorGradient.Transparency = NumberSequence.new({
    NumberSequenceKeypoint.new(0, 1),
    NumberSequenceKeypoint.new(0.5, 0),
    NumberSequenceKeypoint.new(1, 1)
})
SeparatorGradient.Parent = Separator

-- ============ ЗАГОЛОВОК ============
local Title = Instance.new("TextLabel")
Title.Name = "Title"
Title.Size = UDim2.new(0, 300, 1, 0)
Title.Position = UDim2.new(0, 25, 0, 0)
Title.BackgroundTransparency = 1
Title.Text = "No One"
Title.TextColor3 = NEON
Title.TextSize = 26
Title.Font = Enum.Font.GothamBlack
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.ZIndex = 3
Title.Parent = TopBar

local TitleGradient = Instance.new("UIGradient")
TitleGradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 255, 120)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 170, 70))
})
TitleGradient.Rotation = 90
TitleGradient.Parent = Title

local TitleStroke = Instance.new("UIStroke")
TitleStroke.Color = NEON
TitleStroke.Thickness = 1.5
TitleStroke.Transparency = 0.4
TitleStroke.Parent = Title

-- Подзаголовок
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

-- Точка-индикатор
local Dot = Instance.new("Frame")
Dot.Size = UDim2.new(0, 9, 0, 9)
Dot.Position = UDim2.new(0, 220, 0.5, -4)
Dot.BackgroundColor3 = NEON
Dot.BorderSizePixel = 0
Dot.ZIndex = 3
Dot.Parent = TopBar

local DotCorner = Instance.new("UICorner")
DotCorner.CornerRadius = UDim.new(1, 0)
DotCorner.Parent = Dot

task.spawn(function()
    while Dot.Parent do
        TweenService:Create(Dot, TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {BackgroundTransparency = 0.8, Size = UDim2.new(0, 7, 0, 7)}):Play()
        task.wait(1)
        TweenService:Create(Dot, TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {BackgroundTransparency = 0, Size = UDim2.new(0, 9, 0, 9)}):Play()
        task.wait(1)
    end
end)

-- ============ SIDEBAR ============
local SideBar = Instance.new("Frame")
SideBar.Name = "SideBar"
SideBar.Size = UDim2.new(0, 170, 1, -56)
SideBar.Position = UDim2.new(0, 0, 0, 56)
SideBar.BackgroundColor3 = Color3.fromRGB(8, 8, 10)
SideBar.BackgroundTransparency = 0.4
SideBar.BorderSizePixel = 0
SideBar.ZIndex = 2
SideBar.Parent = MainFrame

local SideGradient = Instance.new("UIGradient")
SideGradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(10, 18, 12)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(5, 5, 7))
})
SideGradient.Rotation = 90
SideGradient.Parent = SideBar

-- Вертикальная неоновая линия справа от sidebar
local SideLine = Instance.new("Frame")
SideLine.Size = UDim2.new(0, 1, 1, -30)
SideLine.Position = UDim2.new(1, -1, 0, 15)
SideLine.BackgroundColor3 = NEON
SideLine.BackgroundTransparency = 0.7
SideLine.BorderSizePixel = 0
SideLine.ZIndex = 3
SideLine.Parent = SideBar

local SideLineGradient = Instance.new("UIGradient")
SideLineGradient.Transparency = NumberSequence.new({
    NumberSequenceKeypoint.new(0, 1),
    NumberSequenceKeypoint.new(0.5, 0.2),
    NumberSequenceKeypoint.new(1, 1)
})
SideLineGradient.Rotation = 90
SideLineGradient.Parent = SideLine

-- ============ CONTENT ============
local ContentFrame = Instance.new("Frame")
ContentFrame.Name = "ContentFrame"
ContentFrame.Size = UDim2.new(1, -170, 1, -56)
ContentFrame.Position = UDim2.new(0, 170, 0, 56)
ContentFrame.BackgroundTransparency = 1
ContentFrame.BorderSizePixel = 0
ContentFrame.ZIndex = 2
ContentFrame.Parent = MainFrame

-- Заголовок контента
local ContentHeader = Instance.new("TextLabel")
ContentHeader.Size = UDim2.new(0, 200, 0, 20)
ContentHeader.Position = UDim2.new(0, 20, 0, 15)
ContentHeader.BackgroundTransparency = 1
ContentHeader.Text = "Main"
ContentHeader.TextColor3 = TEXT_BRIGHT
ContentHeader.TextSize = 18
ContentHeader.Font = Enum.Font.GothamBold
ContentHeader.TextXAlignment = Enum.TextXAlignment.Left
ContentHeader.ZIndex = 3
ContentHeader.Parent = ContentFrame

local ContentSub = Instance.new("TextLabel")
ContentSub.Size = UDim2.new(0, 300, 0, 16)
ContentSub.Position = UDim2.new(0, 20, 0, 36)
ContentSub.BackgroundTransparency = 1
ContentSub.Text = "Aim, weapons and movement"
ContentSub.TextColor3 = TEXT_DIM
ContentSub.TextSize = 12
ContentSub.Font = Enum.Font.Gotham
ContentSub.TextXAlignment = Enum.TextXAlignment.Left
ContentSub.ZIndex = 3
ContentSub.Parent = ContentFrame

-- Декоративная неоновая скобка
local function CreateBracket(posX, posY, w, h)
    local b = Instance.new("Frame")
    b.Size = UDim2.new(0, w, 0, h)
    b.Position = UDim2.new(1, posX, 0, posY)
    b.BackgroundColor3 = NEON
    b.BackgroundTransparency = 0.3
    b.BorderSizePixel = 0
    b.ZIndex = 3
    b.Parent = ContentFrame
    return b
end
CreateBracket(-25, 20, 14, 2)
CreateBracket(-25, 20, 2, 14)

-- Тонкая внутренняя сетка / декор
local GridLine1 = Instance.new("Frame")
GridLine1.Size = UDim2.new(1, -40, 0, 1)
GridLine1.Position = UDim2.new(0, 20, 0, 65)
GridLine1.BackgroundColor3 = Color3.fromRGB(30, 40, 32)
GridLine1.BorderSizePixel = 0
GridLine1.ZIndex = 3
GridLine1.Parent = ContentFrame

-- ============ ФУНКЦИЯ СОЗДАНИЯ ВКЛАДКИ ============
local function CreateTabButton(name, icon, yOffset)
    local Button = Instance.new("TextButton")
    Button.Name = name .. "Tab"
    Button.Size = UDim2.new(1, -20, 0, 44)
    Button.Position = UDim2.new(0, 10, 0, yOffset)
    Button.BackgroundColor3 = Color3.fromRGB(0, 70, 30)
    Button.BackgroundTransparency = 1
    Button.BorderSizePixel = 0
    Button.Text = ""
    Button.AutoButtonColor = false
    Button.ZIndex = 4
    Button.Parent = SideBar

    local Corner = Instance.new("UICorner")
    Corner.CornerRadius = UDim.new(0, 8)
    Corner.Parent = Button

    -- Левая неоновая полоска-индикатор
    local Indicator = Instance.new("Frame")
    Indicator.Name = "Indicator"
    Indicator.Size = UDim2.new(0, 3, 0, 22)
    Indicator.Position = UDim2.new(0, -10, 0.5, -11)
    Indicator.BackgroundColor3 = NEON
    Indicator.BorderSizePixel = 0
    Indicator.BackgroundTransparency = 1
    Indicator.ZIndex = 5
    Indicator.Parent = Button

    local IndCorner = Instance.new("UICorner")
    IndCorner.CornerRadius = UDim.new(1, 0)
    IndCorner.Parent = Indicator

    -- Иконка в кружке
    local IconBg = Instance.new("Frame")
    IconBg.Size = UDim2.new(0, 30, 0, 30)
    IconBg.Position = UDim2.new(0, 15, 0.5, -15)
    IconBg.BackgroundColor3 = Color3.fromRGB(20, 20, 24)
    IconBg.BorderSizePixel = 0
    IconBg.ZIndex = 4
    IconBg.Parent = Button

    local IconBgCorner = Instance.new("UICorner")
    IconBgCorner.CornerRadius = UDim.new(1, 0)
    IconBgCorner.Parent = IconBg

    local IconBgStroke = Instance.new("UIStroke")
    IconBgStroke.Color = Color3.fromRGB(40, 50, 42)
    IconBgStroke.Thickness = 1
    IconBgStroke.Transparency = 0.3
    IconBgStroke.Parent = IconBg

    -- Сама иконка
    local IconLabel = Instance.new("TextLabel")
    IconLabel.Size = UDim2.new(1, 0, 1, 0)
    IconLabel.Position = UDim2.new(0, 0, 0, 0)
    IconLabel.BackgroundTransparency = 1
    IconLabel.Text = icon
    IconLabel.TextColor3 = Color3.fromRGB(0, 200, 90)
    IconLabel.TextSize = 16
    IconLabel.Font = Enum.Font.Gotham
    IconLabel.ZIndex = 5
    IconLabel.Parent = IconBg

    -- Название вкладки
    local TextLabel = Instance.new("TextLabel")
    TextLabel.Size = UDim2.new(0, 100, 1, 0)
    TextLabel.Position = UDim2.new(0, 58, 0, 0)
    TextLabel.BackgroundTransparency = 1
    TextLabel.Text = name
    TextLabel.TextColor3 = TEXT_DIM
    TextLabel.TextSize = 15
    TextLabel.Font = Enum.Font.GothamMedium
    TextLabel.TextXAlignment = Enum.TextXAlignment.Left
    TextLabel.ZIndex = 5
    TextLabel.Parent = Button

    -- Hover-эффект
    Button.MouseEnter:Connect(function()
        if Button.BackgroundTransparency == 1 then
            TweenService:Create(Button, TweenInfo.new(0.25), {BackgroundTransparency = 0.85, BackgroundColor3 = Color3.fromRGB(0, 90, 40)}):Play()
            TweenService:Create(TextLabel, TweenInfo.new(0.25), {TextColor3 = Color3.fromRGB(0, 255, 110)}):Play()
            TweenService:Create(IconBgStroke, TweenInfo.new(0.25), {Color = NEON, Transparency = 0}):Play()
        end
    end)

    Button.MouseLeave:Connect(function()
        if Indicator.BackgroundTransparency == 1 then
            TweenService:Create(Button, TweenInfo.new(0.25), {BackgroundTransparency = 1}):Play()
            TweenService:Create(TextLabel, TweenInfo.new(0.25), {TextColor3 = TEXT_DIM}):Play()
            TweenService:Create(IconBgStroke, TweenInfo.new(0.25), {Color = Color3.fromRGB(40, 50, 42), Transparency = 0.3}):Play()
        end
    end)

    -- ЗВУК ПРИ КЛИКЕ
    Button.MouseButton1Click:Connect(function()
        PlayClick()
    end)

    return Button, TextLabel, Indicator, IconLabel, IconBgStroke, IconBg
end

-- ============ ВКЛАДКИ ============
local Tabs = {
    {Name = "Main", Icon = "🔧", Offset = 15},
    {Name = "ESP", Icon = "🎯", Offset = 65},
    {Name = "Style", Icon = "🎨", Offset = 115},
    {Name = "Grenades", Icon = "💣", Offset = 165},
    {Name = "Viewmodel", Icon = "👁", Offset = 215}
}

local TabButtons = {}
local ActiveTabName = "Main"

local function ActivateTab(tabName)
    ActiveTabName = tabName
    for name, data in pairs(TabButtons) do
        local isActive = (name == tabName)
        TweenService:Create(data.Button, TweenInfo.new(0.3, Enum.EasingStyle.Quad), {
            BackgroundTransparency = isActive and 0.8 or 1,
            BackgroundColor3 = Color3.fromRGB(0, 90, 35)
        }):Play()
        TweenService:Create(data.Label, TweenInfo.new(0.3, Enum.EasingStyle.Quad), {
            TextColor3 = isActive and NEON or TEXT_DIM
        }):Play()
        TweenService:Create(data.Indicator, TweenInfo.new(0.3, Enum.EasingStyle.Quad), {
            BackgroundTransparency = isActive and 0 or 1
        }):Play()
        TweenService:Create(data.IconLabel, TweenInfo.new(0.3), {
            TextColor3 = isActive and Color3.fromRGB(0, 255, 110) or Color3.fromRGB(0, 180, 80)
        }):Play()
        TweenService:Create(data.IconBg, TweenInfo.new(0.3), {
            BackgroundColor3 = isActive and Color3.fromRGB(0, 35, 18) or Color3.fromRGB(20, 20, 24)
        }):Play()
        TweenService:Create(data.IconBgStroke, TweenInfo.new(0.3), {
            Color = isActive and NEON or Color3.fromRGB(40, 50, 42),
            Transparency = isActive and 0 or 0.3
        }):Play()
    end
end

for _, tabData in ipairs(Tabs) do
    local btn, lbl, ind, iconLbl, iconStroke, iconBg = CreateTabButton(tabData.Name, tabData.Icon, tabData.Offset)
    TabButtons[tabData.Name] = {
        Button = btn,
        Label = lbl,
        Indicator = ind,
        IconLabel = iconLbl,
        IconBgStroke = iconStroke,
        IconBg = iconBg
    }
    btn.MouseButton1Click:Connect(function()
        ActivateTab(tabData.Name)
        ContentHeader.Text = tabData.Name
        local subtitles = {
            Main = "Aim, weapons and movement",
            ESP = "Visuals and player tracking",
            Style = "Skins, themes and cosmetics",
            Grenades = "Throwables and utilities",
            Viewmodel = "Hands, camera and feel"
        }
        ContentSub.Text = subtitles[tabData.Name] or ""
        ContentHeader.TextTransparency = 1
        ContentSub.TextTransparency = 1
        TweenService:Create(ContentHeader, TweenInfo.new(0.3), {TextTransparency = 0}):Play()
        TweenService:Create(ContentSub, TweenInfo.new(0.3), {TextTransparency = 0}):Play()
    end)
end

ActivateTab("Main")

-- ============ ДЕКОРАТИВНЫЕ ЧАСТИЦЫ ============
local function CreateParticle(x, y, size)
    local p = Instance.new("Frame")
    p.Size = UDim2.new(0, size, 0, size)
    p.Position = UDim2.new(0, x, 0, y)
    p.BackgroundColor3 = NEON
    p.BackgroundTransparency = 0.6
    p.BorderSizePixel = 0
    p.ZIndex = 0
    p.Parent = MainFrame

    local c = Instance.new("UICorner")
    c.CornerRadius = UDim.new(1, 0)
    c.Parent = p

    task.spawn(function()
        while p.Parent do
            local targetY = p.Position.Y.Offset - math.random(8, 20)
            local targetX = p.Position.X.Offset + math.random(-8, 8)
            TweenService:Create(p, TweenInfo.new(math.random(3, 5), Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {
                Position = UDim2.new(0, targetX, 0, targetY),
                BackgroundTransparency = 0.9
            }):Play()
            task.wait(math.random(3, 5))
            TweenService:Create(p, TweenInfo.new(math.random(3, 5), Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {
                Position = UDim2.new(0, x, 0, y),
                BackgroundTransparency = 0.6
            }):Play()
            task.wait(math.random(3, 5))
        end
    end)
end

CreateParticle(60, 120, 4)
CreateParticle(140, 200, 3)
CreateParticle(280, 90, 5)
CreateParticle(400, 180, 3)
CreateParticle(480, 120, 4)
CreateParticle(520, 260, 3)
CreateParticle(200, 300, 4)
CreateParticle(350, 320, 3)

-- ============ ФУТЕР ============
local Footer = Instance.new("TextLabel")
Footer.Name = "Footer"
Footer.Size = UDim2.new(1, -20, 0, 20)
Footer.Position = UDim2.new(0, 10, 1, -24)
Footer.BackgroundTransparency = 1
Footer.Text = "No One  |  https://t.me/devscripts0"
Footer.TextColor3 = Color3.fromRGB(0, 150, 60)
Footer.TextSize = 11
Footer.Font = Enum.Font.GothamMedium
Footer.TextXAlignment = Enum.TextXAlignment.Right
Footer.ZIndex = 3
Footer.Parent = MainFrame

-- ============ АНИМАЦИЯ ПОЯВЛЕНИЯ ============
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

print("No One UI — Ultimate Neon Edition + Click Sound loaded.")
print("Telegram: https://t.me/devscripts0")
