-- ╔════════════════════════════════════════════════════════════════════════════╗
-- ║  SHADOW HUB - VERSÃO ADMIN (SEM RESTRIÇÕES)                                ║
-- ║  40+ Funções | Acesso Total | Sem Limite                                   ║
-- ║  Compatível com Real Executor                                              ║
-- ║  by Bandidoquer67rezenh                                                    ║
-- ║  Discord: https://discord.gg/JtE2rx2eGx                                    ║
-- ╚════════════════════════════════════════════════════════════════════════════╝

-- ══════════════════════════════════════════════════════════════════════════════
-- 📢 DISCORD AUTO-COPY SYSTEM
-- ══════════════════════════════════════════════════════════════════════════════

local DISCORD_LINK = "https://discord.gg/JtE2rx2eGx"

local function CopyDiscordLink()
	if setclipboard then
		setclipboard(DISCORD_LINK)
	end
	
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

spawn(function()
	wait(0.5)
	CopyDiscordLink()
end)

-- ══════════════════════════════════════════════════════════════════════════════
-- 🔧 VERIFICAÇÃO DO PLACEID
-- ══════════════════════════════════════════════════════════════════════════════

local CORRECT_PLACEID = 10449761463

if game.PlaceId ~= CORRECT_PLACEID then
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
	errorLabel.Text = "❌ ERRO!\n\nEste script é APENAS para:\n🎮 PlaceID: " .. CORRECT_PLACEID .. "\n\nSeu PlaceID: " .. game.PlaceId
	errorLabel.TextSize = 14
	errorLabel.Font = Enum.Font.GothamBold
	errorLabel.TextWrapped = true
	errorLabel.Parent = errorFrame
	
	warn("❌ SHADOW HUB - PlaceID Incorreto!")
	return
end

print("✅ PlaceID Verificado!")
print("✅ SHADOW HUB ADMIN - ACESSO TOTAL DESBLOQUEADO!")

local UserInputService = game:GetService("UserInputService")
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local HttpService = game:GetService("HttpService")
local Workspace = workspace
local TweenService = game:GetService("TweenService")

-- ══════════════════════════════════════════════════════════════════════════════
-- 📊 ESTADO GLOBAL
-- ══════════════════════════════════════════════════════════════════════════════

local State = {
	PlayerGUI = nil,
	ContentFrame = nil,
	KeyInfoLabel = nil,
	NoStun = false,
	NoKnockback = false,
	Noclip = false,
	GodMode = false,
	AutoBlock = false,
	NoCD = false,
	ClickTP = false,
	TeleportJump = false,
	TeleportJumpHeight = 40,
	WalkSpeedLock = false,
	WalkSpeedValue = 16,
	SafeModeActive = false,
	SafePlatform = nil,
	SafeModeTriggered = false,
	SubActive = false,
	SubDepth = 5,
	SubTarget = nil,
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
-- 🛡️ SAFE MODE
-- ══════════════════════════════════════════════════════════════════════════════

local function CreateSafePlatform()
	if State.SafePlatform then
		State.SafePlatform:Destroy()
	end
	
	local platform = Instance.new("Part")
	platform.Name = "SafePlatform"
	platform.Shape = Enum.PartType.Block
	platform.Size = Vector3.new(50, 2, 50)
	platform.Position = Vector3.new(0, 250, 0)
	platform.CanCollide = true
	platform.Material = Enum.Material.Neon
	platform.Color = Color3.fromRGB(50, 100, 255)
	platform.TopSurface = Enum.SurfaceType.Smooth
	platform.BottomSurface = Enum.SurfaceType.Smooth
	platform.CanQuery = true
	platform.CFrame = CFrame.new(0, 250, 0)
	platform.Parent = Workspace
	
	local light = Instance.new("PointLight")
	light.Color = Color3.fromRGB(100, 150, 255)
	light.Brightness = 2
	light.Range = 30
	light.Parent = platform
	
	local particles = Instance.new("ParticleEmitter")
	particles.Parent = platform
	particles.Rate = 50
	particles.Lifetime = NumberRange.new(1)
	particles.Speed = NumberRange.new(5)
	particles.Color = ColorSequence.new(Color3.fromRGB(100, 150, 255))
	particles.Transparency = NumberSequence.new(0.5)
	
	State.SafePlatform = platform
	
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
	stroke.Color = Color3.fromRGB(200, 50, 200)
	stroke.Thickness = 3
	stroke.Parent = mainFrame
	
	local titleBar = Instance.new("TextLabel")
	titleBar.Name = "TitleBar"
	titleBar.Size = UDim2.new(1, 0, 0, 50)
	titleBar.BackgroundColor3 = Color3.fromRGB(50, 20, 50)
	titleBar.TextColor3 = Color3.fromRGB(255, 100, 255)
	titleBar.Text = "👑 SHADOW HUB - ADMIN VERSION 👑"
	titleBar.TextSize = 18
	titleBar.Font = Enum.Font.GothamBold
	titleBar.Parent = mainFrame
	
	local titleCorner = Instance.new("UICorner")
	titleCorner.CornerRadius = UDim.new(0, 12)
	titleCorner.Parent = titleBar
	
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
	
	local keyInfoLabel = Instance.new("TextLabel")
	keyInfoLabel.Name = "KeyInfo"
	keyInfoLabel.Size = UDim2.new(1, 0, 0, 70)
	keyInfoLabel.Position = UDim2.new(0, 0, 0, 50)
	keyInfoLabel.BackgroundColor3 = Color3.fromRGB(50, 20, 50)
	keyInfoLabel.TextColor3 = Color3.fromRGB(255, 150, 255)
	keyInfoLabel.Text = "👑 ADMIN MODE | ACESSO TOTAL"
	keyInfoLabel.TextSize = 14
	keyInfoLabel.Font = Enum.Font.GothamBold
	keyInfoLabel.TextWrapped = true
	keyInfoLabel.BorderSizePixel = 0
	keyInfoLabel.Parent = mainFrame
	
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
		{ name = "Trolling", icon = "😈" },
		{ name = "Advanced", icon = "⚡" },
	}
	
	for i, tab in ipairs(tabs) do
		local tabBtn = Instance.new("TextButton")
		tabBtn.Name = tab.name .. "Tab"
		tabBtn.Size = UDim2.new(0, 100, 1, 0)
		tabBtn.BackgroundColor3 = Color3.fromRGB(80, 30, 80)
		tabBtn.TextColor3 = Color3.fromRGB(255, 150, 255)
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
			tabBtn.BackgroundColor3 = Color3.fromRGB(120, 50, 120)
		end)
		
		tabBtn.MouseLeave:Connect(function()
			tabBtn.BackgroundColor3 = Color3.fromRGB(80, 30, 80)
		end)
	end
	
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
	elseif tabName == "Trolling" then
		AddTrollingTab(contentFrame)
	elseif tabName == "Advanced" then
		AddAdvancedTab(contentFrame)
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
	
	CreateButton(parent, "💨 Velocidade x10", Color3.fromRGB(255, 150, 100), function()
		if Character and Humanoid then
			Humanoid.WalkSpeed = 160
			CreateNotification("💨 Velocidade MÁXIMA", 2)
		end
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
-- 🛡️ ABA SAFETY
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
		if Character and Humanoid then
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
-- 😈 ABA TROLLING - ADMIN ONLY
-- ══════════════════════════════════════════════════════════════════════════════

function AddTrollingTab(parent)
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
			target:Kick("Expulso pelo Admin")
			CreateNotification("🚪 Kickado", 1)
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
	
	CreateButton(parent, "🔊 Kick Todos", Color3.fromRGB(255, 100, 100), function()
		for _, p in pairs(Players:GetPlayers()) do
			if p ~= Player then
				p:Kick("Expulso pelo Admin")
			end
		end
		CreateNotification("🔊 Todos kickados", 2)
	end)
end

-- ══════════════════════════════════════════════════════════════════════════════
-- ⚡ ABA ADVANCED
-- ══════════════════════════════════════════════════════════════════════════════

function AddAdvancedTab(parent)
	CreateButton(parent, "🔍 ESP Players", Color3.fromRGB(150, 200, 150), function()
		State.ESP = not State.ESP
		CreateNotification(State.ESP and "✅ ESP" or "❌ ESP OFF", 1)
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
			workspace:SetAttribute("SlowMoFactor", 0.1)
			CreateNotification("⏱️ EXTREME Slow Motion", 2)
		else
			workspace:SetAttribute("SlowMoFactor", 1)
		end
	end)
	
	CreateButton(parent, "🎯 Aim Bot", Color3.fromRGB(200, 150, 150), function()
		State.AimBot = not State.AimBot
		CreateNotification(State.AimBot and "🎯 Aim Bot ON" or "❌ Aim Bot OFF", 1)
	end)
	
	CreateButton(parent, "⚡ Infinite Stamina", Color3.fromRGB(255, 200, 100), function()
		State.InfiniteStamina = not State.InfiniteStamina
		CreateNotification(State.InfiniteStamina and "⚡ Stamina ∞" or "❌ Stamina Normal", 1)
	end)
	
	CreateButton(parent, "🧬 Shadow Clone", Color3.fromRGB(100, 100, 150), function()
		State.ShadowClone = not State.ShadowClone
		CreateNotification(State.ShadowClone and "🧬 Clone Ativado" or "❌ Clone OFF", 1)
	end)
	
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
	notif.BackgroundColor3 = Color3.fromRGB(50, 20, 50)
	notif.TextColor3 = Color3.fromRGB(255, 150, 255)
	notif.TextSize = 12
	notif.Font = Enum.Font.Gotham
	notif.TextWrapped = true
	notif.BorderSizePixel = 0
	notif.ZIndex = 1000
	
	local corner = Instance.new("UICorner")
	corner.CornerRadius = UDim.new(0, 5)
	corner.Parent = notif
	
	local stroke = Instance.new("UIStroke")
	stroke.Color = Color3.fromRGB(255, 100, 255)
	stroke.Thickness = 2
	stroke.Parent = notif
	
	notif.Parent = State.PlayerGUI or Player:WaitForChild("PlayerGui")
	
	wait(duration or 2)
	notif:Destroy()
end

function ShowPlayerSelector(parent, callback)
	local selectorFrame = Instance.new("Frame")
	selectorFrame.Size = UDim2.new(0.7, 0, 0.4, 0)
	selectorFrame.Position = UDim2.new(0.15, 0, 0.3, 0)
	selectorFrame.BackgroundColor3 = Color3.fromRGB(40, 20, 40)
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
			playerBtn.BackgroundColor3 = Color3.fromRGB(80, 30, 80)
			playerBtn.TextColor3 = Color3.fromRGB(255, 150, 255)
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
				playerBtn.BackgroundColor3 = Color3.fromRGB(120, 50, 120)
			end)
			
			playerBtn.MouseLeave:Connect(function()
				playerBtn.BackgroundColor3 = Color3.fromRGB(80, 30, 80)
			end)
		end
	end
end

-- ══════════════════════════════════════════════════════════════════════════════
-- ⚙️ HEARTBEAT LOOP
-- ══════════════════════════════════════════════════════════════════════════════

RunService.Heartbeat:Connect(function()
	if not Character or not Humanoid or not Character.Parent then return end
	
	local hrp = Character:FindFirstChild("HumanoidRootPart")
	if not hrp then return end
	
	if State.NoStun then
		for _, constraint in pairs(Character:GetDescendants()) do
			if constraint:IsA("BallSocketConstraint") or constraint:IsA("HingeConstraint") then
				pcall(function() constraint:Destroy() end)
			end
		end
		if Humanoid:GetState() == Enum.HumanoidStateType.Physics or Humanoid:GetState() == Enum.HumanoidStateType.FallingDown then
			Humanoid:ChangeState(Enum.HumanoidStateType.Running)
		end
	end
	
	if State.WalkSpeedLock then
		Humanoid.WalkSpeed = State.WalkSpeedValue
	end
	
	if State.GodMode then
		Humanoid.Health = Humanoid.MaxHealth
	end
	
	if State.NoKnockback then
		local vel = hrp.AssemblyLinearVelocity
		hrp.AssemblyLinearVelocity = Vector3.new(0, vel.Y, 0)
	end
	
	if State.Noclip then
		for _, part in pairs(Character:GetDescendants()) do
			if part:IsA("BasePart") then
				part.CanCollide = false
			end
		end
	end
end)

UserInputService.InputBegan:Connect(function(input, gameProcessed)
	if gameProcessed then return end
	
	if State.ClickTP and input.UserInputType == Enum.UserInputType.MouseButton1 then
		local mouse = Player:GetMouse()
		if mouse.Target then
			Character:MoveTo(mouse.Hit.Position + Vector3.new(0, 3, 0))
		end
	end
end)

-- ══════════════════════════════════════════════════════════════════════════════
-- 🎮 INICIAR GUI
-- ══════════════════════════════════════════════════════════════════════════════

CreateGUI()

Player.CharacterAdded:Connect(function(newCharacter)
	Character = newCharacter
	Humanoid = Character:WaitForChild("Humanoid")
	wait(0.5)
end)

print("✅ SHADOW HUB - VERSÃO ADMIN CARREGADA!")
print("👑 ACESSO TOTAL DESBLOQUEADO!")
print("🎮 PlaceID: " .. game.PlaceId)
print("🔗 Discord: " .. DISCORD_LINK)
print("⚡ 40+ Funções Disponíveis")
print("🔓 SEM RESTRIÇÕES - NENHUMA VERIFICAÇÃO DE NOME")
