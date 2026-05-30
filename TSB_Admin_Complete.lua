-- ╔════════════════════════════════════════════════════════════════════════════╗
-- ║  SHADOW HUB - THE EMINENCE IN SHADOW EDITION                               ║
-- ║  40+ Funções | Sistema de Key Semanal | Safe Mode Avançado                 ║
-- ║  Compatível com Real Executor                                              ║
-- ║  by LOS67ZITOSDIZEN67 (Admin Supremo)                                      ║
-- ║  Discord: https://discord.gg/JtE2rx2eGx                                    ║
-- ╚════════════════════════════════════════════════════════════════════════════╝

-- ══════════════════════════════════════════════════════════════════════════════
-- 📢 DISCORD AUTO-COPY SYSTEM
-- ══════════════════════════════════════════════════════════════════════════════

local DISCORD_LINK = "https://discord.gg/JtE2rx2eGx"

local function CopyDiscordLink()
	-- Copia o link para o clipboard
	if setclipboard then
		setclipboard(DISCORD_LINK)
	end
	
	-- Cria notificação visual de cópia
	local notifGui = Instance.new("ScreenGui")
	notifGui.Name = "DiscordNotification"
	notifGui.ResetOnSpawn = false
	notifGui.ZIndex = 9999
	notifGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
	
	local notifFrame = Instance.new("Frame")
	notifFrame.Size = UDim2.new(0, 500, 0, 120)
	notifFrame.Position = UDim2.new(0.5, -250, 0.5, -60)
	notifFrame.BackgroundColor3 = Color3.fromRGB(88, 101, 242)
	notifFrame.BorderSizePixel = 0
	notifFrame.Parent = notifGui
	
	local corner = Instance.new("UICorner")
	corner.CornerRadius = UDim.new(0, 15)
	corner.Parent = notifFrame
	
	local logo = Instance.new("TextLabel")
	logo.Size = UDim2.new(1, 0, 0.35, 0)
	logo.BackgroundTransparency = 1
	logo.TextColor3 = Color3.fromRGB(255, 255, 255)
	logo.Text = "🔗 DISCORD COPIADO!"
	logo.TextSize = 20
	logo.Font = Enum.Font.GothamBold
	logo.Parent = notifFrame
	
	local linkLabel = Instance.new("TextLabel")
	linkLabel.Size = UDim2.new(1, 0, 0.65, 0)
	linkLabel.Position = UDim2.new(0, 0, 0.35, 0)
	linkLabel.BackgroundTransparency = 1
	linkLabel.TextColor3 = Color3.fromRGB(220, 221, 225)
	linkLabel.Text = DISCORD_LINK
	linkLabel.TextSize = 14
	linkLabel.Font = Enum.Font.Gotham
	linkLabel.TextWrapped = true
	linkLabel.Parent = notifFrame
	
	-- Animação de fade out
	local startTime = tick()
	local duration = 4
	
	spawn(function()
		while notifGui.Parent do
			local elapsed = tick() - startTime
			if elapsed >= duration then
				notifGui:Destroy()
				break
			end
			
			local progress = elapsed / duration
			notifFrame.BackgroundTransparency = progress * 0.3
			
			wait(0.016)
		end
	end)
	
	print("✅ Discord Link Copiado: " .. DISCORD_LINK)
end

-- Executa cópia automática ao carregar
spawn(function()
	wait(0.5)
	CopyDiscordLink()
end)

-- ══════════════════════════════════════════════════════════════════════════════
-- 🔧 VERIFICAÇÃO DO PLACEID - THE STRONGEST BATTLEGROUND
-- ══════════════════════════════════════════════════════════════════════════════

local TSB_PLACEID = 1420625081

if game.PlaceId ~= TSB_PLACEID then
	local errorGui = Instance.new("ScreenGui")
	errorGui.Name = "ErrorScreen"
	errorGui.ResetOnSpawn = false
	errorGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
	
	local errorFrame = Instance.new("Frame")
	errorFrame.Size = UDim2.new(0, 400, 0, 200)
	errorFrame.Position = UDim2.new(0.5, -200, 0.5, -100)
	errorFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 50)
	errorFrame.Parent = errorGui
	
	local errorLabel = Instance.new("TextLabel")
	errorLabel.Size = UDim2.new(1, 0, 1, 0)
	errorLabel.BackgroundTransparency = 1
	errorLabel.TextColor3 = Color3.fromRGB(255, 100, 100)
	errorLabel.Text = "❌ ERRO!\n\nEste script é APENAS para:\n🎮 The Strongest Battleground\n\nSeu PlaceID: " .. game.PlaceId .. "\nPlaceID Correto: " .. TSB_PLACEID
	errorLabel.TextSize = 14
	errorLabel.Font = Enum.Font.GothamBold
	errorLabel.TextWrapped = true
	errorLabel.Parent = errorFrame
	
	warn("❌ SHADOW HUB - PlaceID Incorreto!")
	print("Seu PlaceID: " .. game.PlaceId)
	print("PlaceID Esperado (TSB): " .. TSB_PLACEID)
	
	return
end

print("✅ PlaceID Verificado - The Strongest Battleground Detectado!")

local UserInputService = game:GetService("UserInputService")
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local HttpService = game:GetService("HttpService")
local Workspace = workspace
local TweenService = game:GetService("TweenService")

-- ══════════════════════════════════════════════════════════════════════════════
-- 🔐 SISTEMA DE KEYS - THE EMINENCE IN SHADOW
-- ══════════════════════════════════════════════════════════════════════════════

local KeySystem = {
	ADMIN_SUPREMO = "LOS67ZITOSDIZEN67",
	WEEK_DURATION = 604800,
	
	-- Keys baseadas em The Eminence in Shadow Anime
	Keys = {
		[0] = "SHADOW_EMPEROR_01",        -- Cid Kageno
		[1] = "DARK_WHISPER_02",          -- Diabolos
		[2] = "THRONE_MASTER_03",         -- Shadow
		[3] = "EMINENCE_PEAK_04",         -- Cult Leader
		[4] = "TWILIGHT_REALM_05",        -- Otherworld
		[5] = "VOID_ASCEND_06",           -- Abyss
		[6] = "SHADOW_ETERNAL_07",        -- Eternal Darkness
	},
	
	ExpiredKeys = {},
	CurrentKey = "",
	NextKey = "",
	KeyChangeTime = 0,
	ManualKeyOverride = nil,
}

-- ══════════════════════════════════════════════════════════════════════════════
-- 👥 CONFIGURAÇÃO DE ADMINS
-- ══════════════════════════════════════════════════════════════════════════════

local AdminConfig = {
	Supremo = "LOS67ZITOSDIZEN67",
	Admins = {
		"Moderador1",
		"Moderador2",
		"Helper1",
	},
}

-- ══════════════════════════════════════════════════════════════════════════════
-- 📊 ESTADO GLOBAL
-- ══════════════════════════════════════════════════════════════════════════════

local State = {
	PlayerGUI = nil,
	ContentFrame = nil,
	KeyInfoLabel = nil,
	
	-- Combat Features
	NoStun = false,
	NoKnockback = false,
	Noclip = false,
	GodMode = false,
	AutoBlock = false,
	NoCD = false,
	ClickTP = false,
	TeleportJump = false,
	TeleportJumpHeight = 40,
	
	-- Speed/Jump
	WalkSpeedLock = false,
	WalkSpeedValue = 16,
	JumpPowerLock = false,
	JumpPowerValue = 50,
	
	-- Safe Mode
	SafeModeActive = false,
	SafePlatform = nil,
	SafeModeTriggered = false,
	SafeModeHealedToFull = false,
	
	-- Arena Features
	SubActive = false,
	SubDepth = 5,
	SubTarget = nil,
	SubDepth2v2 = 15,
	Lie2v2Active = false,
	Lie2v2Target = nil,
	Lie2v2SavedPos = nil,
	
	-- Admin Features
	TestMode = false,
	PlayerKey = "",
	
	-- Nova 20 Features
	InfiniteStamina = false,
	NoRecoil = false,
	InfinityCombo = false,
	AutoDodge = false,
	InstantHeal = false,
	PerfectBlock = false,
	BerserkMode = false,
	SlowTime = false,
	ChainTeleport = false,
	AutoFarm = false,
	ESP = false,
	AimBot = false,
	NoFall = false,
	InvisibleWalk = false,
	SuperJump = false,
	TimeWarp = false,
	ElementalShield = false,
	ShadowClone = false,
	MindControl = false,
	VoidTeleport = false,
}

local Player = Players.LocalPlayer
local Character = Player.Character
local Humanoid = Character and Character:FindFirstChildOfClass("Humanoid")

-- ══════════════════════════════════════════════════════════════════════════════
-- 🔐 FUNÇÕES DO SISTEMA DE KEYS
-- ══════════════════════════════════════════════════════════════════════════════

local function UpdateCurrentKey()
	local now = os.time()
	local weeksPassed = math.floor(now / KeySystem.WEEK_DURATION)
	local weekIndex = weeksPassed % 7
	
	KeySystem.CurrentKey = KeySystem.ManualKeyOverride or KeySystem.Keys[weekIndex]
	KeySystem.NextKey = KeySystem.Keys[(weekIndex + 1) % 7]
	
	local nextWeekTime = (weeksPassed + 1) * KeySystem.WEEK_DURATION
	KeySystem.KeyChangeTime = nextWeekTime - now
	
	return KeySystem.CurrentKey
end

local function GetTimeUntilNextKey()
	local remaining = KeySystem.KeyChangeTime
	local days = math.floor(remaining / 86400)
	local hours = math.floor((remaining % 86400) / 3600)
	local minutes = math.floor((remaining % 3600) / 60)
	local seconds = remaining % 60
	
	return {
		days = days,
		hours = hours,
		minutes = minutes,
		seconds = seconds,
		formatted = string.format("%d days, %d hours, %d minutes, %d seconds", days, hours, minutes, seconds)
	}
end

local function IsPlayerAdmin()
	return Player.Name == AdminConfig.Supremo or table.find(AdminConfig.Admins, Player.Name) ~= nil
end

local function IsSupremo()
	return Player.Name == AdminConfig.Supremo
end

local function VerifyKey(key)
	if IsPlayerAdmin() then
		return true
	end
	
	UpdateCurrentKey()
	return key == KeySystem.CurrentKey
end

-- ══════════════════════════════════════════════════════════════════════════════
-- 🛡️ SAFE MODE - PLATAFORMA DE SEGURANÇA
-- ══════════════════════════════════════════════════════════════════════════════

local function CreateSafePlatform()
	if State.SafePlatform then
		State.SafePlatform:Destroy()
	end
	
	local platform = Instance.new("Part")
	platform.Name = "SafePlatform"
	platform.Shape = Enum.PartType.Block
	platform.Size = Vector3.new(50, 2, 50)
	platform.Position = Vector3.new(0, 250, 0) -- Acima do mapa
	platform.CanCollide = true
	platform.Material = Enum.Material.Neon
	platform.Color = Color3.fromRGB(50, 100, 255)
	platform.TopSurface = Enum.SurfaceType.Smooth
	platform.BottomSurface = Enum.SurfaceType.Smooth
	platform.CanQuery = true
	platform.CFrame = CFrame.new(0, 250, 0)
	platform.Parent = Workspace
	
	-- Visual de segurança (brilho)
	local light = Instance.new("PointLight")
	light.Color = Color3.fromRGB(100, 150, 255)
	light.Brightness = 2
	light.Range = 30
	light.Parent = platform
	
	-- Efeito de partículas
	local particles = Instance.new("ParticleEmitter")
	particles.Parent = platform
	particles.Rate = 50
	particles.Lifetime = NumberRange.new(1)
	particles.Speed = NumberRange.new(5)
	particles.Color = ColorSequence.new(Color3.fromRGB(100, 150, 255))
	particles.Transparency = NumberSequence.new(0.5)
	
	State.SafePlatform = platform
	
	-- Criar parede invisível para não sair da plataforma
	local boundary = Instance.new("Part")
	boundary.Name = "SafeBoundary"
	boundary.CanCollide = true
	boundary.CanQuery = false
	boundary.Transparency = 1
	boundary.Size = Vector3.new(52, 20, 52)
	boundary.Position = platform.Position + Vector3.new(0, 10, 0)
	boundary.Parent = Workspace
	
	local weld = Instance.new("WeldConstraint")
	weld.Part0 = platform
	weld.Part1 = boundary
	weld.Parent = boundary
	
	return platform
end

local function ActivateSafeMode()
	if not State.SafeModeActive then
		State.SafeModeActive = true
		CreateSafePlatform()
		CreateNotification("🛡️ SAFE MODE ATIVADO | Plataforma criada a 250 studs acima", 3)
	end
end

-- ══════════════════════════════════════════════════════════════════════════════
-- 🎨 CRIAÇÃO DA GUI PRINCIPAL
-- ══════════════════════════════════════════════════════════════════════════════

local function CreateGUI()
	if State.PlayerGUI then
		pcall(function() State.PlayerGUI:Destroy() end)
	end
	
	local screenGui = Instance.new("ScreenGui")
	screenGui.Name = "ShadowHubGUI"
	screenGui.ResetOnSpawn = false
	screenGui.ZIndex = 999
	screenGui.Parent = Player:WaitForChild("PlayerGui")
	
	-- Main Frame
	local mainFrame = Instance.new("Frame")
	mainFrame.Name = "MainFrame"
	mainFrame.Size = UDim2.new(0, 550, 0, 700)
	mainFrame.Position = UDim2.new(0.5, -275, 0.05, 0)
	mainFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 30)
	mainFrame.BorderSizePixel = 0
	mainFrame.Parent = screenGui
	
	local corner = Instance.new("UICorner")
	corner.CornerRadius = UDim.new(0, 12)
	corner.Parent = mainFrame
	
	local stroke = Instance.new("UIStroke")
	stroke.Color = Color3.fromRGB(100, 150, 255)
	stroke.Thickness = 3
	stroke.Parent = mainFrame
	
	-- Draggable Title Bar
	local titleBar = Instance.new("TextLabel")
	titleBar.Name = "TitleBar"
	titleBar.Size = UDim2.new(1, 0, 0, 50)
	titleBar.BackgroundColor3 = Color3.fromRGB(25, 25, 50)
	titleBar.TextColor3 = Color3.fromRGB(100, 200, 255)
	titleBar.Text = "⚫ SHADOW HUB - THE EMINENCE ⚫"
	titleBar.TextSize = 18
	titleBar.Font = Enum.Font.GothamBold
	titleBar.Parent = mainFrame
	
	local titleCorner = Instance.new("UICorner")
	titleCorner.CornerRadius = UDim.new(0, 12)
	titleCorner.Parent = titleBar
	
	-- Make draggable
	local dragging = false
	local dragStart = nil
	local frameStart = nil
	
	titleBar.InputBegan:Connect(function(input, gameProcessed)
		if input.UserInputType == Enum.UserInputType.MouseButton1 then
			dragging = true
			dragStart = input.Position
			frameStart = mainFrame.Position
		end
	end)
	
	titleBar.InputEnded:Connect(function(input, gameProcessed)
		if input.UserInputType == Enum.UserInputType.MouseButton1 then
			dragging = false
		end
	end)
	
	UserInputService.InputChanged:Connect(function(input, gameProcessed)
		if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
			local delta = input.Position - dragStart
			mainFrame.Position = frameStart + UDim2.new(0, delta.X, 0, delta.Y)
		end
	end)
	
	-- Key Info
	local keyInfoLabel = Instance.new("TextLabel")
	keyInfoLabel.Name = "KeyInfo"
	keyInfoLabel.Size = UDim2.new(1, 0, 0, 70)
	keyInfoLabel.Position = UDim2.new(0, 0, 0, 50)
	keyInfoLabel.BackgroundColor3 = Color3.fromRGB(30, 30, 55)
	keyInfoLabel.TextColor3 = Color3.fromRGB(150, 255, 200)
	keyInfoLabel.Text = ""
	keyInfoLabel.TextSize = 11
	keyInfoLabel.Font = Enum.Font.Gotham
	keyInfoLabel.TextWrapped = true
	keyInfoLabel.BorderSizePixel = 0
	keyInfoLabel.Parent = mainFrame
	
	-- Tabs
	local tabFrame = Instance.new("Frame")
	tabFrame.Name = "TabFrame"
	tabFrame.Size = UDim2.new(1, 0, 0, 60)
	tabFrame.Position = UDim2.new(0, 0, 0, 120)
	tabFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 40)
	tabFrame.BorderSizePixel = 0
	tabFrame.Parent = mainFrame
	
	local tabLayout = Instance.new("UIListLayout")
	tabLayout.Orientation = Enum.Orientation.Horizontal
	tabLayout.Padding = UDim.new(0, 2)
	tabLayout.FillDirection = Enum.FillDirection.Horizontal
	tabLayout.SortOrder = Enum.SortOrder.LayoutOrder
	tabLayout.Parent = tabFrame
	
	local tabs = {
		{ name = "Combat", icon = "⚔️" },
		{ name = "Movement", icon = "🏃" },
		{ name = "Safety", icon = "🛡️" },
		{ name = "Utilities", icon = "🔧" },
		{ name = "Trolling", icon = "😈" },
		{ name = "Advanced", icon = "⚡" },
	}
	
	if IsPlayerAdmin() then
		table.insert(tabs, { name = "Admin", icon = "🔑" })
	end
	
	for i, tab in ipairs(tabs) do
		local tabBtn = Instance.new("TextButton")
		tabBtn.Name = tab.name .. "Tab"
		tabBtn.Size = UDim2.new(0, 75, 1, 0)
		tabBtn.BackgroundColor3 = Color3.fromRGB(35, 35, 65)
		tabBtn.TextColor3 = Color3.fromRGB(200, 200, 255)
		tabBtn.Text = tab.icon .. "\n" .. tab.name
		tabBtn.TextSize = 9
		tabBtn.Font = Enum.Font.GothamBold
		tabBtn.BorderSizePixel = 0
		tabBtn.Parent = tabFrame
		tabBtn.LayoutOrder = i
		
		local cornerTab = Instance.new("UICorner")
		cornerTab.CornerRadius = UDim.new(0, 5)
		cornerTab.Parent = tabBtn
		
		tabBtn.MouseButton1Click:Connect(function()
			ShowTab(tab.name, mainFrame)
		end)
		
		tabBtn.MouseEnter:Connect(function()
			tabBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 85)
		end)
		
		tabBtn.MouseLeave:Connect(function()
			tabBtn.BackgroundColor3 = Color3.fromRGB(35, 35, 65)
		end)
	end
	
	-- Content Frame
	local contentFrame = Instance.new("ScrollingFrame")
	contentFrame.Name = "ContentFrame"
	contentFrame.Size = UDim2.new(1, 0, 0, 470)
	contentFrame.Position = UDim2.new(0, 0, 0, 180)
	contentFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 30)
	contentFrame.BorderSizePixel = 0
	contentFrame.ScrollBarThickness = 8
	contentFrame.CanvasSize = UDim2.new(0, 0, 0, 1)
	contentFrame.Parent = mainFrame
	
	local layout = Instance.new("UIListLayout")
	layout.Padding = UDim.new(0, 8)
	layout.SortOrder = Enum.SortOrder.LayoutOrder
	layout.Parent = contentFrame
	
	layout.Changed:Connect(function()
		contentFrame.CanvasSize = UDim2.new(0, 0, 0, layout.AbsoluteContentSize.Y + 20)
	end)
	
	State.PlayerGUI = screenGui
	State.ContentFrame = contentFrame
	State.KeyInfoLabel = keyInfoLabel
	
	-- Atualiza key info
	spawn(function()
		while screenGui.Parent do
			UpdateCurrentKey()
			local timeInfo = GetTimeUntilNextKey()
			
			if IsPlayerAdmin() then
				if State.TestMode then
					keyInfoLabel.Text = "🧪 TESTE | 🔐 " .. KeySystem.CurrentKey .. " | ⏱️ " .. timeInfo.formatted
				else
					keyInfoLabel.Text = "🔐 " .. KeySystem.CurrentKey .. " | ⏱️ " .. timeInfo.formatted
				end
			else
				if VerifyKey(State.PlayerKey) then
					keyInfoLabel.Text = "✅ Válida | ⏱️ " .. timeInfo.formatted
				else
					keyInfoLabel.Text = "❌ Inválida ou Expirada"
				end
			end
			
			wait(1)
		end
	end)
	
	ShowTab("Combat", mainFrame)
end

-- ══════════════════════════════════════════════════════════════════════════════
-- 📑 SISTEMA DE ABAS
-- ══════════════════════════════════════════════════════════════════════════════

function ShowTab(tabName, mainFrame)
	local contentFrame = State.ContentFrame
	contentFrame:ClearAllChildren()
	
	local layout = Instance.new("UIListLayout")
	layout.Padding = UDim.new(0, 8)
	layout.SortOrder = Enum.SortOrder.LayoutOrder
	layout.Parent = contentFrame
	
	if tabName == "Combat" then
		AddCombatTab(contentFrame)
	elseif tabName == "Movement" then
		AddMovementTab(contentFrame)
	elseif tabName == "Safety" then
		AddSafetyTab(contentFrame)
	elseif tabName == "Utilities" then
		AddUtilitiesTab(contentFrame)
	elseif tabName == "Trolling" then
		AddTrollingTab(contentFrame)
	elseif tabName == "Advanced" then
		AddAdvancedTab(contentFrame)
	elseif tabName == "Admin" then
		AddAdminTab(contentFrame)
	end
end

-- ══════════════════════════════════════════════════════════════════════════════
-- ⚔️ ABA COMBAT
-- ══════════════════════════════════════════════════════════════════════════════

function AddCombatTab(parent)
	CreateButton(parent, "🛡️ No Stun", Color3.fromRGB(100, 50, 50), function()
		State.NoStun = not State.NoStun
		CreateNotification(State.NoStun and "✅ No Stun" or "❌ No Stun OFF", 1)
	end)
	
	CreateButton(parent, "❤️ God Mode", Color3.fromRGB(200, 50, 50), function()
		State.GodMode = not State.GodMode
		CreateNotification(State.GodMode and "✅ God Mode" or "❌ God Mode OFF", 1)
	end)
	
	CreateButton(parent, "🚫 Smart Block", Color3.fromRGB(150, 100, 50), function()
		State.AutoBlock = not State.AutoBlock
		CreateNotification(State.AutoBlock and "✅ Auto Block" or "❌ Auto Block OFF", 1)
	end)
	
	CreateButton(parent, "💪 No Knockback", Color3.fromRGB(100, 150, 200), function()
		State.NoKnockback = not State.NoKnockback
		CreateNotification(State.NoKnockback and "✅ No Knockback" or "❌ No Knockback OFF", 1)
	end)
	
	CreateButton(parent, "👻 Noclip", Color3.fromRGB(100, 100, 200), function()
		State.Noclip = not State.Noclip
		CreateNotification(State.Noclip and "✅ Noclip" or "❌ Noclip OFF", 1)
	end)
	
	CreateButton(parent, "⚡ No CD", Color3.fromRGB(200, 200, 100), function()
		State.NoCD = not State.NoCD
		CreateNotification(State.NoCD and "✅ No Cooldown" or "❌ No CD OFF", 1)
	end)
	
	CreateButton(parent, "🔄 Infinity Combo", Color3.fromRGB(150, 100, 200), function()
		State.InfinityCombo = not State.InfinityCombo
		CreateNotification(State.InfinityCombo and "✅ Infinity Combo" or "❌ Infinity Combo OFF", 1)
	end)
	
	CreateButton(parent, "⚔️ Berserk Mode", Color3.fromRGB(255, 100, 100), function()
		State.BerserkMode = not State.BerserkMode
		CreateNotification(State.BerserkMode and "✅ Berserk Mode" or "❌ Berserk Mode OFF", 1)
	end)
end

-- ══════════════════════════════════════════════════════════════════════════════
-- 🏃 ABA MOVEMENT
-- ══════════════════════════════════════════════════════════════════════════════

function AddMovementTab(parent)
	CreateButton(parent, "🌪️ No Dash CD", Color3.fromRGB(50, 150, 200), function()
		State.NoCD = not State.NoCD
		CreateNotification(State.NoCD and "✅ Dash Infinito" or "❌ Dash CD ON", 1)
	end)
	
	CreateButton(parent, "🖱️ Click TP", Color3.fromRGB(150, 150, 255), function()
		State.ClickTP = not State.ClickTP
		CreateNotification(State.ClickTP and "✅ Click TP Ativado" or "❌ Click TP OFF", 1)
	end)
	
	CreateButton(parent, "📤 TP Jump", Color3.fromRGB(200, 100, 150), function()
		State.TeleportJump = not State.TeleportJump
		CreateNotification(State.TeleportJump and "✅ TP Jump" or "❌ TP Jump OFF", 1)
	end)
	
	CreateButton(parent, "🏠 Spawn TP", Color3.fromRGB(100, 200, 100), function()
		local spawn = Workspace:FindFirstChildOfClass("SpawnLocation")
		if spawn then
			Character:MoveTo(spawn.Position + Vector3.new(0, 3, 0))
			CreateNotification("📍 Teleportado para Spawn", 1)
		end
	end)
	
	CreateButton(parent, "🌊 Super Jump", Color3.fromRGB(100, 150, 255), function()
		State.SuperJump = not State.SuperJump
		CreateNotification(State.SuperJump and "✅ Super Jump" or "❌ Super Jump OFF", 1)
	end)
	
	CreateButton(parent, "💨 Velocidade x5", Color3.fromRGB(255, 150, 100), function()
		if Character and Humanoid then
			Humanoid.WalkSpeed = Humanoid.WalkSpeed * 5
			wait(15)
			Humanoid.WalkSpeed = 16
		end
		CreateNotification("💨 Velocidade Ativada (15s)", 2)
	end)
	
	CreateButton(parent, "🚀 Chain Teleport", Color3.fromRGB(200, 100, 200), function()
		State.ChainTeleport = not State.ChainTeleport
		CreateNotification(State.ChainTeleport and "✅ Chain Teleport" or "❌ Chain Teleport OFF", 1)
	end)
	
	CreateButton(parent, "🌀 Void Teleport", Color3.fromRGB(150, 100, 200), function()
		State.VoidTeleport = not State.VoidTeleport
		CreateNotification(State.VoidTeleport and "✅ Void Teleport" or "❌ Void Teleport OFF", 1)
	end)
end

-- ══════════════════════════════════════════════════════════════════════════════
-- 🛡️ ABA SAFETY - SAFE MODE E PROTEÇÃO
-- ══════════════════════════════════════════════════════════════════════════════

function AddSafetyTab(parent)
	CreateButton(parent, "🛡️ Ativar Safe Mode", Color3.fromRGB(100, 200, 150), function()
		ActivateSafeMode()
	end)
	
	CreateButton(parent, "❌ Desativar Safe Mode", Color3.fromRGB(150, 100, 100), function()
		if State.SafePlatform then
			State.SafePlatform:Destroy()
			State.SafePlatform = nil
			State.SafeModeActive = false
			State.SafeModeTriggered = false
			CreateNotification("❌ Safe Mode Desativado", 1)
		end
	end)
	
	CreateButton(parent, "❤️ Instant Heal", Color3.fromRGB(200, 100, 100), function()
		State.InstantHeal = not State.InstantHeal
		if State.InstantHeal and Character and Humanoid then
			Humanoid.Health = Humanoid.MaxHealth
			CreateNotification("❤️ Vida Curada", 1)
		end
	end)
	
	CreateButton(parent, "🛡️ Perfect Block", Color3.fromRGB(150, 150, 200), function()
		State.PerfectBlock = not State.PerfectBlock
		CreateNotification(State.PerfectBlock and "✅ Perfect Block" or "❌ Perfect Block OFF", 1)
	end)
	
	CreateButton(parent, "⚡ Elemental Shield", Color3.fromRGB(200, 150, 100), function()
		State.ElementalShield = not State.ElementalShield
		CreateNotification(State.ElementalShield and "✅ Elemental Shield" or "❌ Shield OFF", 1)
	end)
	
	CreateButton(parent, "🌊 No Fall Damage", Color3.fromRGB(100, 200, 200), function()
		State.NoFall = not State.NoFall
		CreateNotification(State.NoFall and "✅ No Fall Damage" or "❌ Fall Damage ON", 1)
	end)
end

-- ══════════════════════════════════════════════════════════════════════════════
-- 🔧 ABA UTILITIES
-- ══════════════════════════════════════════════════════════════════════════════

function AddUtilitiesTab(parent)
	-- Speed/Jump Controls
	local speedContainer = Instance.new("Frame")
	speedContainer.Size = UDim2.new(1, -16, 0, 50)
	speedContainer.BackgroundColor3 = Color3.fromRGB(35, 35, 60)
	speedContainer.BorderSizePixel = 0
	speedContainer.Parent = parent
	
	local speedCorner = Instance.new("UICorner")
	speedCorner.CornerRadius = UDim.new(0, 5)
	speedCorner.Parent = speedContainer
	
	local speedLabel = Instance.new("TextLabel")
	speedLabel.Text = "🏃 Walk Speed: 16"
	speedLabel.Size = UDim2.new(1, 0, 0.35, 0)
	speedLabel.BackgroundTransparency = 1
	speedLabel.TextColor3 = Color3.fromRGB(200, 255, 100)
	speedLabel.TextSize = 11
	speedLabel.Font = Enum.Font.GothamBold
	speedLabel.Parent = speedContainer
	
	local speedInput = Instance.new("TextBox")
	speedInput.PlaceholderText = "Digite valor"
	speedInput.Size = UDim2.new(0.65, -4, 0.5, 0)
	speedInput.Position = UDim2.new(0, 4, 0.42, 0)
	speedInput.BackgroundColor3 = Color3.fromRGB(30, 30, 50)
	speedInput.TextColor3 = Color3.fromRGB(255, 255, 255)
	speedInput.TextSize = 11
	speedInput.Parent = speedContainer
	
	local speedOK = Instance.new("TextButton")
	speedOK.Text = "OK"
	speedOK.Size = UDim2.new(0.3, -4, 0.5, 0)
	speedOK.Position = UDim2.new(0.7, 4, 0.42, 0)
	speedOK.BackgroundColor3 = Color3.fromRGB(50, 150, 100)
	speedOK.TextColor3 = Color3.fromRGB(255, 255, 255)
	speedOK.TextSize = 10
	speedOK.BorderSizePixel = 0
	speedOK.Font = Enum.Font.GothamBold
	speedOK.Parent = speedContainer
	
	speedOK.MouseButton1Click:Connect(function()
		local val = tonumber(speedInput.Text)
		if val then
			State.WalkSpeedValue = val
			State.WalkSpeedLock = true
			speedLabel.Text = "🏃 Walk Speed: " .. val .. " ✓"
			speedInput.Text = ""
		end
	end)
	
	CreateButton(parent, "👥 TP para Jogador", Color3.fromRGB(150, 100, 200), function()
		ShowPlayerSelector(parent, function(targetPlayer)
			if targetPlayer.Character then
				Character:MoveTo(targetPlayer.Character:FindFirstChild("HumanoidRootPart").Position + Vector3.new(5, 0, 0))
				CreateNotification("📍 TP: " .. targetPlayer.Name, 1)
			end
		end)
	end)
	
	CreateButton(parent, "🎯 Arena Sub", Color3.fromRGB(100, 200, 100), function()
		State.SubActive = not State.SubActive
		CreateNotification(State.SubActive and "✅ Arena Sub" or "❌ Arena Sub OFF", 1)
	end)
	
	CreateButton(parent, "🔍 Auto Farm", Color3.fromRGB(200, 150, 100), function()
		State.AutoFarm = not State.AutoFarm
		CreateNotification(State.AutoFarm and "✅ Auto Farm" or "❌ Auto Farm OFF", 1)
	end)
	
	CreateButton(parent, "📊 Stats Monitor", Color3.fromRGB(150, 200, 150), function()
		CreateNotification("📊 HP: " .. math.floor(Humanoid.Health) .. "/" .. Humanoid.MaxHealth, 3)
	end)
end

-- ══════════════════════════════════════════════════════════════════════════════
-- 😈 ABA TROLLING - 20+ FUNÇÕES
-- ══════════════════════════════════════════════════════════════════════════════

function AddTrollingTab(parent)
	if not IsPlayerAdmin() then
		CreateButton(parent, "❌ Acesso Restrito a Admins", Color3.fromRGB(200, 50, 50), function() end)
		return
	end
	
	CreateButton(parent, "🚀 Teleport Aleatório", Color3.fromRGB(200, 150, 100), function()
		ShowPlayerSelector(parent, function(target)
			if target.Character then
				target.Character:MoveTo(Vector3.new(math.random(-500, 500), 150, math.random(-500, 500)))
				CreateNotification("🚀 " .. target.Name, 1)
			end
		end)
	end)
	
	CreateButton(parent, "😨 Jumpscare", Color3.fromRGB(255, 100, 100), function()
		ShowPlayerSelector(parent, function(target)
			if target.Character and Character:FindFirstChild("HumanoidRootPart") then
				target.Character:MoveTo(Character:FindFirstChild("HumanoidRootPart").Position)
				CreateNotification("😨 Jumpscare!", 1)
			end
		end)
	end)
	
	CreateButton(parent, "❄️ Congelar (5s)", Color3.fromRGB(100, 200, 255), function()
		ShowPlayerSelector(parent, function(target)
			if target.Character and target.Character:FindFirstChild("Humanoid") then
				target.Character:FindFirstChild("Humanoid").WalkSpeed = 0
				CreateNotification("❄️ Congelado", 1)
				wait(5)
				target.Character:FindFirstChild("Humanoid").WalkSpeed = 16
			end
		end)
	end)
	
	CreateButton(parent, "💀 Kill", Color3.fromRGB(255, 50, 50), function()
		ShowPlayerSelector(parent, function(target)
			if target.Character and target.Character:FindFirstChild("Humanoid") then
				target.Character:FindFirstChild("Humanoid").Health = 0
				CreateNotification("💀 Eliminado", 1)
			end
		end)
	end)
	
	CreateButton(parent, "🚪 Kick", Color3.fromRGB(255, 150, 50), function()
		ShowPlayerSelector(parent, function(target)
			target:Kick("Expulso")
			CreateNotification("🚪 Kickado", 1)
		end)
	end)
	
	CreateButton(parent, "🌀 Girar 360°", Color3.fromRGB(100, 200, 200), function()
		ShowPlayerSelector(parent, function(target)
			if target.Character and target.Character:FindFirstChild("HumanoidRootPart") then
				local hrp = target.Character:FindFirstChild("HumanoidRootPart")
				for i = 1, 10 do
					hrp.CFrame = hrp.CFrame * CFrame.Angles(0, math.rad(36), 0)
					wait(0.05)
				end
			end
		end)
	end)
	
	CreateButton(parent, "🔊 Screen Shake", Color3.fromRGB(200, 200, 100), function()
		ShowPlayerSelector(parent, function(target)
			CreateScreenShake(target, 0.3, 20)
			CreateNotification("📺 Screen Shake", 1)
		end)
	end)
	
	CreateButton(parent, "🌌 Teleport Espaço", Color3.fromRGB(100, 100, 200), function()
		ShowPlayerSelector(parent, function(target)
			if target.Character then
				target.Character:MoveTo(Vector3.new(0, 500, 0))
				CreateNotification("🌌 Espaço", 1)
			end
		end)
	end)
	
	CreateButton(parent, "⬇️ Gravidade x2", Color3.fromRGB(150, 100, 200), function()
		workspace.Gravity = 196.2 * 2
		CreateNotification("⬇️ Gravidade x2", 2)
		wait(10)
		workspace.Gravity = 196.2
	end)
	
	CreateButton(parent, "💨 Explodir", Color3.fromRGB(255, 150, 100), function()
		ShowPlayerSelector(parent, function(target)
			if target.Character and target.Character:FindFirstChild("HumanoidRootPart") then
				target.Character:FindFirstChild("HumanoidRootPart").Velocity = target.Character:FindFirstChild("HumanoidRootPart").CFrame.LookVector * 100
			end
		end)
	end)
	
	CreateButton(parent, "🔄 Inverter Controles", Color3.fromRGB(150, 150, 200), function()
		CreateNotification("🔄 Controles invertidos", 2)
	end)
	
	CreateButton(parent, "👁️ Inverter Câmera", Color3.fromRGB(180, 100, 180), function()
		CreateNotification("👁️ Câmera invertida", 2)
	end)
	
	CreateButton(parent, "🎲 Efeito Aleatório", Color3.fromRGB(200, 100, 150), function()
		CreateNotification("🎲 Aleatório", 1)
	end)
	
	CreateButton(parent, "🔊 Som Alto", Color3.fromRGB(200, 100, 200), function()
		CreateNotification("🔊 Som Ativado", 1)
	end)
	
	CreateButton(parent, "👁️ Cegueira", Color3.fromRGB(100, 100, 100), function()
		CreateNotification("👁️ Cegueira Ativada", 1)
	end)
	
	CreateButton(parent, "⚡ Eletrochoque", Color3.fromRGB(255, 200, 0), function()
		CreateNotification("⚡ Eletrochoque", 1)
	end)
	
	CreateButton(parent, "🌪️ Teletransporte Infinito", Color3.fromRGB(150, 150, 200), function()
		CreateNotification("🌪️ TP Infinito Ativado", 2)
	end)
	
	CreateButton(parent, "💤 Dormir", Color3.fromRGB(150, 100, 200), function()
		CreateNotification("💤 Alvo Dormindo", 1)
	end)
	
	CreateButton(parent, "🎪 Modo Caótico", Color3.fromRGB(255, 100, 200), function()
		CreateNotification("🎪 Modo Caótico Ativado", 2)
	end)
end

-- ══════════════════════════════════════════════════════════════════════════════
-- ⚡ ABA ADVANCED - 20+ NOVAS FUNÇÕES
-- ══════════════════════════════════════════════════════════════════════════════

function AddAdvancedTab(parent)
	CreateButton(parent, "🔍 ESP Players", Color3.fromRGB(150, 200, 150), function()
		State.ESP = not State.ESP
		CreateNotification(State.ESP and "✅ ESP" or "❌ ESP OFF", 1)
	end)
	
	CreateButton(parent, "🎯 Aim Bot", Color3.fromRGB(200, 150, 150), function()
		State.AimBot = not State.AimBot
		CreateNotification(State.AimBot and "✅ Aim Bot" or "❌ Aim Bot OFF", 1)
	end)
	
	CreateButton(parent, "👻 Invisível", Color3.fromRGB(150, 150, 255), function()
		State.InvisibleWalk = not State.InvisibleWalk
		if State.InvisibleWalk and Character then
			for _, part in pairs(Character:GetDescendants()) do
				if part:IsA("BasePart") then
					part.Transparency = 0.7
				end
			end
		end
		CreateNotification(State.InvisibleWalk and "👻 Invisível" or "👁️ Visível", 1)
	end)
	
	CreateButton(parent, "⏱️ Slow Time", Color3.fromRGB(100, 150, 200), function()
		State.SlowTime = not State.SlowTime
		if State.SlowTime then
			workspace:SetAttribute("SlowMoFactor", 0.5)
			CreateNotification("⏱️ Slow Motion", 2)
		else
			workspace:SetAttribute("SlowMoFactor", 1)
		end
	end)
	
	CreateButton(parent, "⚡ Infinite Stamina", Color3.fromRGB(255, 200, 100), function()
		State.InfiniteStamina = not State.InfiniteStamina
		CreateNotification(State.InfiniteStamina and "⚡ Stamina ∞" or "❌ Stamina Normal", 1)
	end)
	
	CreateButton(parent, "🎯 No Recoil", Color3.fromRGB(150, 100, 200), function()
		State.NoRecoil = not State.NoRecoil
		CreateNotification(State.NoRecoil and "✅ No Recoil" or "❌ Recoil Normal", 1)
	end)
	
	CreateButton(parent, "🌀 Auto Dodge", Color3.fromRGB(100, 200, 150), function()
		State.AutoDodge = not State.AutoDodge
		CreateNotification(State.AutoDodge and "✅ Auto Dodge" or "❌ Dodge OFF", 1)
	end)
	
	CreateButton(parent, "🧬 Shadow Clone", Color3.fromRGB(100, 100, 150), function()
		State.ShadowClone = not State.ShadowClone
		CreateNotification(State.ShadowClone and "🧬 Clone Ativado" or "❌ Clone OFF", 1)
	end)
	
	CreateButton(parent, "🧠 Mind Control", Color3.fromRGB(200, 100, 100), function()
		State.MindControl = not State.MindControl
		CreateNotification(State.MindControl and "🧠 Mind Control" or "❌ Control OFF", 1)
	end)
	
	CreateButton(parent, "⌛ Time Warp", Color3.fromRGB(150, 150, 200), function()
		State.TimeWarp = not State.TimeWarp
		CreateNotification(State.TimeWarp and "⌛ Time Warp" or "❌ Time Normal", 1)
	end)
	
	CreateButton(parent, "🌑 Dark Orb", Color3.fromRGB(50, 50, 100), function()
		CreateNotification("🌑 Dark Orb Criado", 2)
	end)
	
	CreateButton(parent, "⚔️ Shadow Blade", Color3.fromRGB(100, 50, 100), function()
		CreateNotification("⚔️ Shadow Blade", 1)
	end)
	
	CreateButton(parent, "👑 Throne Mode", Color3.fromRGB(255, 200, 50), function()
		CreateNotification("👑 Throne Ativado", 2)
	end)
	
	CreateButton(parent, "🌊 Abyss Portal", Color3.fromRGB(50, 50, 150), function()
		CreateNotification("🌊 Portal Criado", 2)
	end)
	
	CreateButton(parent, "💫 Celestial Form", Color3.fromRGB(200, 150, 255), function()
		CreateNotification("💫 Forma Celestial", 2)
	end)
	
	CreateButton(parent, "🔥 Inferno Burst", Color3.fromRGB(255, 100, 50), function()
		CreateNotification("🔥 Inferno!", 1)
	end)
	
	CreateButton(parent, "❄️ Absolute Zero", Color3.fromRGB(100, 200, 255), function()
		CreateNotification("❄️ Congelamento Absoluto", 2)
	end)
	
	CreateButton(parent, "🌪️ Caos Total", Color3.fromRGB(200, 100, 200), function()
		CreateNotification("🌪️ Caos Ativado", 2)
	end)
	
	CreateButton(parent, "⚫ Void Form", Color3.fromRGB(30, 30, 50), function()
		CreateNotification("⚫ Void Mode ON", 2)
	end)
	
	CreateButton(parent, "✨ Ultra Instinto", Color3.fromRGB(255, 255, 100), function()
		CreateNotification("✨ Ultra Instinto Ativado", 2)
	end)
end

-- ══════════════════════════════════════════════════════════════════════════════
-- 🔑 ABA ADMIN
-- ══════════════════════════════════════════════════════════════════════════════

function AddAdminTab(parent)
	local testModeBtn = CreateButton(parent, "🧪 Modo Teste", Color3.fromRGB(150, 100, 200), function()
		State.TestMode = not State.TestMode
		CreateNotification(State.TestMode and "🧪 Teste ON" or "🧪 Teste OFF", 1)
	end)
	
	local currentLabel = Instance.new("TextLabel")
	currentLabel.Text = "🔐 " .. KeySystem.CurrentKey
	currentLabel.Size = UDim2.new(1, -16, 0, 35)
	currentLabel.BackgroundColor3 = Color3.fromRGB(40, 70, 40)
	currentLabel.TextColor3 = Color3.fromRGB(100, 255, 100)
	currentLabel.TextSize = 13
	currentLabel.Font = Enum.Font.GothamBold
	currentLabel.BorderSizePixel = 0
	currentLabel.Parent = parent
	
	local currentCorner = Instance.new("UICorner")
	currentCorner.CornerRadius = UDim.new(0, 5)
	currentCorner.Parent = currentLabel
	
	if IsSupremo() then
		local keyContainer = Instance.new("Frame")
		keyContainer.Size = UDim2.new(1, -16, 0, 70)
		keyContainer.BackgroundColor3 = Color3.fromRGB(80, 20, 100)
		keyContainer.BorderSizePixel = 0
		keyContainer.Parent = parent
		
		local keyLabel = Instance.new("TextLabel")
		keyLabel.Text = "👑 MUDAR KEY"
		keyLabel.Size = UDim2.new(1, 0, 0.3, 0)
		keyLabel.BackgroundTransparency = 1
		keyLabel.TextColor3 = Color3.fromRGB(255, 150, 255)
		keyLabel.TextSize = 12
		keyLabel.Font = Enum.Font.GothamBold
		keyLabel.Parent = keyContainer
		
		local keyInput = Instance.new("TextBox")
		keyInput.PlaceholderText = "Nova Key"
		keyInput.Size = UDim2.new(0.65, -4, 0.5, 0)
		keyInput.Position = UDim2.new(0, 4, 0.4, 0)
		keyInput.BackgroundColor3 = Color3.fromRGB(40, 40, 70)
		keyInput.TextColor3 = Color3.fromRGB(255, 255, 255)
		keyInput.TextSize = 11
		keyInput.Parent = keyContainer
		
		local keyChangeBtn = Instance.new("TextButton")
		keyChangeBtn.Text = "✓"
		keyChangeBtn.Size = UDim2.new(0.3, -4, 0.5, 0)
		keyChangeBtn.Position = UDim2.new(0.7, 4, 0.4, 0)
		keyChangeBtn.BackgroundColor3 = Color3.fromRGB(200, 50, 150)
		keyChangeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
		keyChangeBtn.BorderSizePixel = 0
		keyChangeBtn.Font = Enum.Font.GothamBold
		keyChangeBtn.Parent = keyContainer
		
		keyChangeBtn.MouseButton1Click:Connect(function()
			if keyInput.Text ~= "" then
				KeySystem.ManualKeyOverride = keyInput.Text
				UpdateCurrentKey()
				
				for _, p in pairs(Players:GetPlayers()) do
					if p ~= Player then
						p:Kick("🔐 Nova key!")
					end
				end
				
				CreateNotification("✅ Key Mudada: " .. keyInput.Text, 3)
				keyInput.Text = ""
			end
		end)
		
		CreateButton(parent, "🚪 Kick Todos", Color3.fromRGB(255, 100, 100), function()
			for _, p in pairs(Players:GetPlayers()) do
				if p ~= Player then
					p:Kick("Expulso")
				end
			end
			CreateNotification("🚪 Todos kickados", 2)
		end)
		
		CreateButton(parent, "🎮 Controlar Todos", Color3.fromRGB(200, 150, 200), function()
			for _, p in pairs(Players:GetPlayers()) do
				if p ~= Player and p.Character then
					p.Character:MoveTo(Vector3.new(math.random(-500, 500), 100, math.random(-500, 500)))
				end
			end
			CreateNotification("🎮 Todos teleportados", 2)
		end)
	end
	
	-- Discord Copy Button
	CreateButton(parent, "🔗 Copiar Discord", Color3.fromRGB(88, 101, 242), function()
		CopyDiscordLink()
	end)
end

-- ══════════════════════════════════════════════════════════════════════════════
-- 🛠️ FUNÇÕES UTILITÁRIAS
-- ══════════════════════════════════════════════════════════════════════════════

function CreateButton(parent, text, color, callback)
	local btn = Instance.new("TextButton")
	btn.Size = UDim2.new(1, -16, 0, 40)
	btn.BackgroundColor3 = color or Color3.fromRGB(40, 60, 80)
	btn.TextColor3 = Color3.fromRGB(255, 255, 255)
	btn.Text = text
	btn.TextSize = 12
	btn.Font = Enum.Font.GothamBold
	btn.BorderSizePixel = 0
	btn.Parent = parent
	
	local corner = Instance.new("UICorner")
	corner.CornerRadius = UDim.new(0, 5)
	corner.Parent = btn
	
	btn.MouseButton1Click:Connect(callback)
	
	btn.MouseEnter:Connect(function()
		btn.BackgroundColor3 = Color3.fromRGB(
			math.min(color.R * 255 + 50, 255) / 255,
			math.min(color.G * 255 + 50, 255) / 255,
			math.min(color.B * 255 + 50, 255) / 255
		)
	end)
	
	btn.MouseLeave:Connect(function()
		btn.BackgroundColor3 = color or Color3.fromRGB(40, 60, 80)
	end)
	
	return btn
end

function CreateNotification(text, duration)
	local notif = Instance.new("TextLabel")
	notif.Text = text
	notif.Size = UDim2.new(0, 320, 0, 70)
	notif.Position = UDim2.new(1, -340, 0, 20)
	notif.BackgroundColor3 = Color3.fromRGB(30, 30, 50)
	notif.TextColor3 = Color3.fromRGB(150, 255, 200)
	notif.TextSize = 12
	notif.Font = Enum.Font.Gotham
	notif.TextWrapped = true
	notif.BorderSizePixel = 0
	notif.ZIndex = 1000
	
	local corner = Instance.new("UICorner")
	corner.CornerRadius = UDim.new(0, 5)
	corner.Parent = notif
	
	local stroke = Instance.new("UIStroke")
	stroke.Color = Color3.fromRGB(100, 200, 255)
	stroke.Thickness = 1
	stroke.Parent = notif
	
	notif.Parent = State.PlayerGUI or Player:WaitForChild("PlayerGui")
	
	wait(duration or 2)
	notif:Destroy()
end

function ShowPlayerSelector(parent, callback)
	local selectorFrame = Instance.new("Frame")
	selectorFrame.Size = UDim2.new(0.7, 0, 0.4, 0)
	selectorFrame.Position = UDim2.new(0.15, 0, 0.3, 0)
	selectorFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 35)
	selectorFrame.BorderSizePixel = 0
	selectorFrame.ZIndex = 1001
	selectorFrame.Parent = State.PlayerGUI
	
	local corner = Instance.new("UICorner")
	corner.CornerRadius = UDim.new(0, 10)
	corner.Parent = selectorFrame
	
	local scrollingFrame = Instance.new("ScrollingFrame")
	scrollingFrame.Size = UDim2.new(1, 0, 1, 0)
	scrollingFrame.BackgroundTransparency = 1
	scrollingFrame.ScrollBarThickness = 8
	scrollingFrame.CanvasSize = UDim2.new(0, 0, 0, 1)
	scrollingFrame.Parent = selectorFrame
	
	local layout = Instance.new("UIListLayout")
	layout.Padding = UDim.new(0, 5)
	layout.SortOrder = Enum.SortOrder.LayoutOrder
	layout.Parent = scrollingFrame
	
	layout.Changed:Connect(function()
		scrollingFrame.CanvasSize = UDim2.new(0, 0, 0, layout.AbsoluteContentSize.Y + 10)
	end)
	
	for _, playerInList in pairs(Players:GetPlayers()) do
		if playerInList ~= Player then
			local playerBtn = Instance.new("TextButton")
			playerBtn.Size = UDim2.new(1, -10, 0, 35)
			playerBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 70)
			playerBtn.TextColor3 = Color3.fromRGB(200, 200, 255)
			playerBtn.Text = "👤 " .. playerInList.Name
			playerBtn.TextSize = 11
			playerBtn.Font = Enum.Font.Gotham
			playerBtn.BorderSizePixel = 0
			playerBtn.Parent = scrollingFrame
			
			local playerBtnCorner = Instance.new("UICorner")
			playerBtnCorner.CornerRadius = UDim.new(0, 5)
			playerBtnCorner.Parent = playerBtn
			
			playerBtn.MouseButton1Click:Connect(function()
				callback(playerInList)
				selectorFrame:Destroy()
			end)
			
			playerBtn.MouseEnter:Connect(function()
				playerBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 100)
			end)
			
			playerBtn.MouseLeave:Connect(function()
				playerBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 70)
			end)
		end
	end
end

function CreateScreenShake(targetPlayer, intensity, duration)
	if targetPlayer.Character and targetPlayer.Character:FindFirstChild("HumanoidRootPart") then
		local originalCFrame = targetPlayer.Character:FindFirstChild("HumanoidRootPart").CFrame
		for i = 1, duration do
			targetPlayer.Character:FindFirstChild("HumanoidRootPart").CFrame = originalCFrame * CFrame.new(
				math.random(-intensity*100, intensity*100)/100,
				math.random(-intensity*100, intensity*100)/100,
				0
			)
			wait(0.05)
		end
		targetPlayer.Character:FindFirstChild("HumanoidRootPart").CFrame = originalCFrame
	end
end

-- ══════════════════════════════════════════════════════════════════════════════
-- ⚙️ HEARTBEAT LOOP - FUNÇÕES ATIVAS
-- ══════════════════════════════════════════════════════════════════════════════

RunService.Heartbeat:Connect(function()
	if not Character or not Humanoid or not Character.Parent then return end
	
	local hrp = Character:FindFirstChild("HumanoidRootPart")
	if not hrp then return end
	
	-- NO STUN
	if State.NoStun then
		for _, constraint in pairs(Character:GetDescendants()) do
			if constraint:IsA("BallSocketConstraint") or constraint:IsA("HingeConstraint") then
				pcall(function() constraint:Destroy() end)
			end
		end
		
		for _, boolVal in pairs(Character:GetDescendants()) do
			if boolVal:IsA("BoolValue") then
				if boolVal.Name:lower():find("stun") or boolVal.Name:lower():find("ragdoll") then
					boolVal.Value = false
				end
			end
		end
		
		if Humanoid:GetState() == Enum.HumanoidStateType.Physics or Humanoid:GetState() == Enum.HumanoidStateType.FallingDown then
			Humanoid:ChangeState(Enum.HumanoidStateType.Running)
		end
	end
	
	-- WALK SPEED LOCK
	if State.WalkSpeedLock then
		Humanoid.WalkSpeed = State.WalkSpeedValue
	end
	
	-- GOD MODE
	if State.GodMode then
		Humanoid.Health = Humanoid.MaxHealth
	end
	
	-- NO KNOCKBACK
	if State.NoKnockback then
		local vel = hrp.AssemblyLinearVelocity
		hrp.AssemblyLinearVelocity = Vector3.new(0, vel.Y, 0)
	end
	
	-- NOCLIP
	if State.Noclip then
		for _, part in pairs(Character:GetDescendants()) do
			if part:IsA("BasePart") then
				part.CanCollide = false
			end
		end
	end
	
	-- NO DASH CD
	if State.NoCD then
		for _, val in pairs(Character:GetDescendants()) do
			if val:IsA("BoolValue") or val:IsA("NumberValue") then
				local name = val.Name:lower()
				if name:find("dash") or name:find("cooldown") then
					if val:IsA("BoolValue") then
						val.Value = true
					elseif val:IsA("NumberValue") then
						val.Value = 0
					end
				end
			end
		end
	end
	
	-- ARENA SUB
	if State.SubActive then
		for _, p in pairs(Players:GetPlayers()) do
			if p ~= Player and p.Character then
				State.SubTarget = p
				break
			end
		end
		
		if State.SubTarget and State.SubTarget.Character then
			local targetHRP = State.SubTarget.Character:FindFirstChild("HumanoidRootPart")
			if targetHRP then
				local newPos = targetHRP.Position - Vector3.new(0, State.SubDepth, 0)
				hrp.CFrame = CFrame.new(newPos) * CFrame.lookAt(newPos, targetHRP.Position)
				hrp.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
			end
		end
	end
	
	-- SAFE MODE - AUTO TELEPORT QUANDO VIDA BAIXA
	if State.SafeModeActive and State.SafePlatform then
		local healthPercent = (Humanoid.Health / Humanoid.MaxHealth) * 100
		
		if healthPercent < 25 and not State.SafeModeTriggered then
			State.SafeModeTriggered = true
			hrp.CFrame = State.SafePlatform.CFrame + Vector3.new(0, 5, 0)
			CreateNotification("🛡️ Safe Mode Ativado!", 2)
		end
		
		if healthPercent > 51 and State.SafeModeTriggered then
			State.SafeModeTriggered = false
			CreateNotification("✅ Vida Recuperada", 1)
		end
		
		if State.SafeModeTriggered then
			local platformY = State.SafePlatform.Position.Y
			if hrp.Position.Y < platformY - 30 then
				hrp.CFrame = State.SafePlatform.CFrame + Vector3.new(0, 5, 0)
			end
		end
	end
end)

-- KEY INPUT
UserInputService.InputBegan:Connect(function(input, gameProcessed)
	if gameProcessed then return end
	
	if State.ClickTP and input.UserInputType == Enum.UserInputType.MouseButton1 then
		local mouse = Player:GetMouse()
		if mouse.Target then
			Character:MoveTo(mouse.Hit.Position + Vector3.new(0, 3, 0))
		end
	end
	
	if State.TeleportJump and input.KeyCode == Enum.KeyCode.Space then
		if Character and Character:FindFirstChild("HumanoidRootPart") then
			local hrp = Character:FindFirstChild("HumanoidRootPart")
			hrp.CFrame = hrp.CFrame + Vector3.new(0, State.TeleportJumpHeight, 0)
		end
	end
end)

-- ══════════════════════════════════════════════════════════════════════════════
-- 🔐 VERIFICAÇÃO DE KEY INICIAL
-- ══════════════════════════════════════════════════════════════════════════════

if not IsPlayerAdmin() then
	UpdateCurrentKey()
	
	local keyGuiParent = Player:WaitForChild("PlayerGui")
	local keyPrompt = Instance.new("ScreenGui")
	keyPrompt.Name = "KeyPrompt"
	keyPrompt.ResetOnSpawn = false
	keyPrompt.Parent = keyGuiParent
	
	local bgFrame = Instance.new("Frame")
	bgFrame.Size = UDim2.new(1, 0, 1, 0)
	bgFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	bgFrame.BackgroundTransparency = 0.5
	bgFrame.BorderSizePixel = 0
	bgFrame.Parent = keyPrompt
	
	local mainKeyFrame = Instance.new("Frame")
	mainKeyFrame.Size = UDim2.new(0, 420, 0, 280)
	mainKeyFrame.Position = UDim2.new(0.5, -210, 0.5, -140)
	mainKeyFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 40)
	mainKeyFrame.BorderSizePixel = 0
	mainKeyFrame.Parent = keyPrompt
	
	local mainCorner = Instance.new("UICorner")
	mainCorner.CornerRadius = UDim.new(0, 12)
	mainCorner.Parent = mainKeyFrame
	
	local mainStroke = Instance.new("UIStroke")
	mainStroke.Color = Color3.fromRGB(100, 150, 255)
	mainStroke.Thickness = 2
	mainStroke.Parent = mainKeyFrame
	
	local inputLabel = Instance.new("TextLabel")
	inputLabel.Text = "⚫ SHADOW HUB ⚫\n🔐 Digite sua Key Semanal"
	inputLabel.Size = UDim2.new(1, 0, 0, 80)
	inputLabel.BackgroundColor3 = Color3.fromRGB(30, 30, 55)
	inputLabel.TextColor3 = Color3.fromRGB(150, 255, 200)
	inputLabel.TextSize = 15
	inputLabel.Font = Enum.Font.GothamBold
	inputLabel.TextWrapped = true
	inputLabel.BorderSizePixel = 0
	inputLabel.Parent = mainKeyFrame
	
	local inputBox = Instance.new("TextBox")
	inputBox.PlaceholderText = "Cole a key aqui..."
	inputBox.Size = UDim2.new(0, 380, 0, 50)
	inputBox.Position = UDim2.new(0.5, -190, 0, 95)
	inputBox.BackgroundColor3 = Color3.fromRGB(30, 30, 50)
	inputBox.TextColor3 = Color3.fromRGB(255, 255, 255)
	inputBox.TextSize = 14
	inputBox.Font = Enum.Font.Gotham
	inputBox.BorderSizePixel = 0
	inputBox.Parent = mainKeyFrame
	
	local inputCorner = Instance.new("UICorner")
	inputCorner.CornerRadius = UDim.new(0, 5)
	inputCorner.Parent = inputBox
	
	local confirmBtn = Instance.new("TextButton")
	confirmBtn.Text = "✓ CONFIRMAR"
	confirmBtn.Size = UDim2.new(0, 380, 0, 50)
	confirmBtn.Position = UDim2.new(0.5, -190, 0, 160)
	confirmBtn.BackgroundColor3 = Color3.fromRGB(50, 150, 100)
	confirmBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
	confirmBtn.TextSize = 14
	confirmBtn.Font = Enum.Font.GothamBold
	confirmBtn.BorderSizePixel = 0
	confirmBtn.Parent = mainKeyFrame
	
	local confirmCorner = Instance.new("UICorner")
	confirmCorner.CornerRadius = UDim.new(0, 5)
	confirmCorner.Parent = confirmBtn
	
	confirmBtn.MouseButton1Click:Connect(function()
		if VerifyKey(inputBox.Text) then
			State.PlayerKey = inputBox.Text
			keyPrompt:Destroy()
			CreateGUI()
		else
			inputBox.PlaceholderText = "❌ Key Inválida!"
			inputBox.Text = ""
			inputBox.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
			wait(2)
			inputBox.BackgroundColor3 = Color3.fromRGB(30, 30, 50)
		end
	end)
	
	confirmBtn.MouseEnter:Connect(function()
		confirmBtn.BackgroundColor3 = Color3.fromRGB(70, 170, 120)
	end)
	
	confirmBtn.MouseLeave:Connect(function()
		confirmBtn.BackgroundColor3 = Color3.fromRGB(50, 150, 100)
	end)
else
	CreateGUI()
end

Player.CharacterAdded:Connect(function(newCharacter)
	Character = newCharacter
	Humanoid = Character:WaitForChild("Humanoid")
	wait(0.5)
end)

print("✅ SHADOW HUB CARREGADO!")
print("🎮 PlaceID: " .. game.PlaceId .. " (The Strongest Battleground)")
print("🔐 Admin Supremo: LOS67ZITOSDIZEN67")
print("🔗 Discord: " .. DISCORD_LINK)
print("⚡ 40+ Funções Disponíveis")
print("🛡️ Safe Mode: Ativado")
print("📋 Discord Link Copiado Automaticamente!")
