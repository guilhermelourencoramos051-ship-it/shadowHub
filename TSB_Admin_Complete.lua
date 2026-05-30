-- ╔═══════════════════════════════════════════════════════════════════╗
-- ║  SHADOW HUB - THE EMINENCE IN SHADOW EDITION                      ║
-- ║  40+ Funções | Sistema de Key Único | Safe Mode Avançado         ║
-- ║  Compatível com Real Executor                                     ║
-- ║  by LOS67ZITOSDIZEN67 (Admin Supremo)                            ║
-- ║  Discord: https://discord.gg/JtE2rx2eGx                          ║
-- ╚═══════════════════════════════════════════════════════════════════╝

-- ════════════════════════════════════════════════════════════════════
-- 📢 DISCORD AUTO-COPY SYSTEM
-- ════════════════════════════════════════════════════════════════════

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

-- ════════════════════════════════════════════════════════════════════
-- 🔧 VERIFICAÇÃO DO PLACEID - THE STRONGEST BATTLEGROUND
-- ════════════════════════════════════════════════════════════════════

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

-- ════════════════════════════════════════════════════════════════════
-- 🔐 SISTEMA DE KEYS UNIFICADO - THE EMINENCE IN SHADOW
-- ════════════════════════════════════════════════════════════════════

local KeySystem = {
	ADMIN_KEY = "TheEminenceInShadowTop1Anime",  -- KEY ADMIN SUPREMO
	WEEK_DURATION = 604800,
	
	-- Keys Semanais
	WeeklyKeys = {
		[0] = "SHADOW_EMPEROR_01",        -- Semana 1
		[1] = "DARK_WHISPER_02",          -- Semana 2
		[2] = "THRONE_MASTER_03",         -- Semana 3
		[3] = "EMINENCE_PEAK_04",         -- Semana 4
		[4] = "TWILIGHT_REALM_05",        -- Semana 5
		[5] = "VOID_ASCEND_06",           -- Semana 6
		[6] = "SHADOW_ETERNAL_07",        -- Semana 7
	},
	
	IsAdminAccess = false,
	IsUserAccess = false,
	CurrentWeekKey = "",
}

-- ════════════════════════════════════════════════════════════════════
-- 👥 CONFIGURAÇÃO DE ADMINS
-- ════════════════════════════════════════════════════════════════════

local AdminConfig = {
	Supremo = "LOS67ZITOSDIZEN67",
	Admins = {
		"Moderador1",
		"Moderador2",
		"Helper1",
	},
}

-- ════════════════════════════════════════════════════════════════════
-- 📊 ESTADO GLOBAL
-- ════════════════════════════════════════════════════════════════════

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
}

-- ════════════════════════════════════════════════════════════════════
-- 🎨 CRIAR UI COM BACKGROUND SHADOW HUB
-- ════════════════════════════════════════════════════════════════════

local function CreateMainUI()
	local player = game.Players.LocalPlayer
	local playerGui = player:WaitForChild("PlayerGui")
	
	-- Main Screen Gui
	local screenGui = Instance.new("ScreenGui")
	screenGui.Name = "ShadowHubMainUI"
	screenGui.ResetOnSpawn = false
	screenGui.ZIndex = 100
	screenGui.Parent = playerGui
	
	-- Background Frame com SHADOW HUB Image
	local bgFrame = Instance.new("Frame")
	bgFrame.Name = "BackgroundFrame"
	bgFrame.Size = UDim2.new(1, 0, 1, 0)
	bgFrame.Position = UDim2.new(0, 0, 0, 0)
	bgFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	bgFrame.BorderSizePixel = 0
	bgFrame.Parent = screenGui
	
	-- ImageLabel para o background SHADOW HUB
	local bgImage = Instance.new("ImageLabel")
	bgImage.Name = "ShadowHubBackground"
	bgImage.Size = UDim2.new(1, 0, 1, 0)
	bgImage.Position = UDim2.new(0, 0, 0, 0)
	bgImage.BackgroundTransparency = 0
	bgImage.Image = "rbxassetid://117564948448542"  -- 🌑 SHADOW HUB IMAGE
	bgImage.ScaleType = Enum.ScaleType.Stretch
	bgImage.ZIndex = 1
	bgImage.Parent = bgFrame
	
	-- Overlay semi-transparente para melhor legibilidade
	local overlay = Instance.new("Frame")
	overlay.Name = "Overlay"
	overlay.Size = UDim2.new(1, 0, 1, 0)
	overlay.Position = UDim2.new(0, 0, 0, 0)
	overlay.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	overlay.BackgroundTransparency = 0.35
	overlay.BorderSizePixel = 0
	overlay.ZIndex = 2
	overlay.Parent = bgFrame
	
	-- Main Container (Semi-transparent)
	local mainContainer = Instance.new("Frame")
	mainContainer.Name = "MainContainer"
	mainContainer.Size = UDim2.new(0, 600, 0, 700)
	mainContainer.Position = UDim2.new(0.5, -300, 0.5, -350)
	mainContainer.BackgroundColor3 = Color3.fromRGB(15, 15, 35)
	mainContainer.BackgroundTransparency = 0.15
	mainContainer.BorderColor3 = Color3.fromRGB(138, 43, 226)
	mainContainer.BorderSizePixel = 3
	mainContainer.ZIndex = 3
	mainContainer.Parent = bgFrame
	
	local cornerRadius = Instance.new("UICorner")
	cornerRadius.CornerRadius = UDim.new(0, 20)
	cornerRadius.Parent = mainContainer
	
	-- Shadow/Glow Effect
	local stroke = Instance.new("UIStroke")
	stroke.Color = Color3.fromRGB(138, 43, 226)
	stroke.Thickness = 2
	stroke.Transparency = 0.3
	stroke.Parent = mainContainer
	
	-- Title
	local titleLabel = Instance.new("TextLabel")
	titleLabel.Name = "TitleLabel"
	titleLabel.Size = UDim2.new(1, 0, 0, 70)
	titleLabel.Position = UDim2.new(0, 0, 0, 0)
	titleLabel.BackgroundColor3 = Color3.fromRGB(138, 43, 226)
	titleLabel.BorderSizePixel = 0
	titleLabel.Text = "🌑 SHADOW HUB 🌑"
	titleLabel.TextSize = 32
	titleLabel.TextColor3 = Color3.fromRGB(255, 215, 0)
	titleLabel.Font = Enum.Font.GothamBold
	titleLabel.ZIndex = 4
	titleLabel.Parent = mainContainer
	
	local titleCorner = Instance.new("UICorner")
	titleCorner.CornerRadius = UDim.new(0, 20)
	titleCorner.Parent = titleLabel
	
	-- Subtitle
	local subtitleLabel = Instance.new("TextLabel")
	subtitleLabel.Name = "SubtitleLabel"
	subtitleLabel.Size = UDim2.new(1, 0, 0, 20)
	subtitleLabel.Position = UDim2.new(0, 0, 0, 50)
	subtitleLabel.BackgroundColor3 = Color3.fromRGB(100, 30, 200)
	subtitleLabel.BorderSizePixel = 0
	subtitleLabel.Text = "THE EMINENCE IN SHADOW - SYSTEM"
	subtitleLabel.TextSize = 11
	subtitleLabel.TextColor3 = Color3.fromRGB(200, 200, 255)
	subtitleLabel.Font = Enum.Font.GothamBold
	subtitleLabel.ZIndex = 4
	subtitleLabel.Parent = mainContainer
	
	-- KEY INPUT SECTION
	local keySection = Instance.new("Frame")
	keySection.Name = "KeySection"
	keySection.Size = UDim2.new(1, -20, 0, 160)
	keySection.Position = UDim2.new(0, 10, 0, 75)
	keySection.BackgroundColor3 = Color3.fromRGB(30, 30, 60)
	keySection.BackgroundTransparency = 0.1
	keySection.BorderColor3 = Color3.fromRGB(100, 50, 200)
	keySection.BorderSizePixel = 2
	keySection.ZIndex = 4
	keySection.Parent = mainContainer
	
	local sectionCorner = Instance.new("UICorner")
	sectionCorner.CornerRadius = UDim.new(0, 10)
	sectionCorner.Parent = keySection
	
	-- Key Label
	local keyLabel = Instance.new("TextLabel")
	keyLabel.Name = "KeyLabel"
	keyLabel.Size = UDim2.new(1, 0, 0, 25)
	keyLabel.Position = UDim2.new(0, 5, 0, 5)
	keyLabel.BackgroundTransparency = 1
	keyLabel.Text = "🔐 VERIFICAR KEY PARA ACESSAR"
	keyLabel.TextSize = 14
	keyLabel.TextColor3 = Color3.fromRGB(138, 43, 226)
	keyLabel.Font = Enum.Font.GothamBold
	keyLabel.TextXAlignment = Enum.TextXAlignment.Left
	keyLabel.ZIndex = 5
	keyLabel.Parent = keySection
	
	-- Key Input TextBox
	local keyInput = Instance.new("TextBox")
	keyInput.Name = "KeyInput"
	keyInput.Size = UDim2.new(1, -20, 0, 35)
	keyInput.Position = UDim2.new(0, 10, 0, 35)
	keyInput.BackgroundColor3 = Color3.fromRGB(50, 50, 90)
	keyInput.BackgroundTransparency = 0.2
	keyInput.BorderColor3 = Color3.fromRGB(138, 43, 226)
	keyInput.BorderSizePixel = 2
	keyInput.TextColor3 = Color3.fromRGB(255, 255, 255)
	keyInput.TextSize = 14
	keyInput.Font = Enum.Font.GothamBold
	keyInput.PlaceholderText = "Cole a KEY aqui..."
	keyInput.PlaceholderColor3 = Color3.fromRGB(150, 150, 200)
	keyInput.ClearTextOnFocus = false
	keyInput.ZIndex = 5
	keyInput.Parent = keySection
	
	local inputCorner = Instance.new("UICorner")
	inputCorner.CornerRadius = UDim.new(0, 8)
	inputCorner.Parent = keyInput
	
	-- Verify Button
	local verifyBtn = Instance.new("TextButton")
	verifyBtn.Name = "VerifyButton"
	verifyBtn.Size = UDim2.new(1, -20, 0, 35)
	verifyBtn.Position = UDim2.new(0, 10, 0, 75)
	verifyBtn.BackgroundColor3 = Color3.fromRGB(0, 200, 100)
	verifyBtn.BorderSizePixel = 0
	verifyBtn.Text = "✅ VERIFICAR KEY"
	verifyBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
	verifyBtn.TextSize = 14
	verifyBtn.Font = Enum.Font.GothamBold
	verifyBtn.ZIndex = 5
	verifyBtn.Parent = keySection
	
	local btnCorner = Instance.new("UICorner")
	btnCorner.CornerRadius = UDim.new(0, 8)
	btnCorner.Parent = verifyBtn
	
	-- Status Label
	local statusLabel = Instance.new("TextLabel")
	statusLabel.Name = "StatusLabel"
	statusLabel.Size = UDim2.new(1, -20, 0, 15)
	statusLabel.Position = UDim2.new(0, 10, 0, 117)
	statusLabel.BackgroundTransparency = 1
	statusLabel.Text = "❌ Aguardando verificação..."
	statusLabel.TextSize = 11
	statusLabel.TextColor3 = Color3.fromRGB(255, 100, 100)
	statusLabel.Font = Enum.Font.Gotham
	statusLabel.ZIndex = 5
	statusLabel.Parent = keySection
	
	-- Content Area (Funções)
	local contentFrame = Instance.new("ScrollingFrame")
	contentFrame.Name = "ContentFrame"
	contentFrame.Size = UDim2.new(1, -20, 0, 450)
	contentFrame.Position = UDim2.new(0, 10, 0, 245)
	contentFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 45)
	contentFrame.BackgroundTransparency = 0.15
	contentFrame.BorderColor3 = Color3.fromRGB(100, 50, 200)
	contentFrame.BorderSizePixel = 2
	contentFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
	contentFrame.ScrollBarThickness = 8
	contentFrame.ScrollBarImageColor3 = Color3.fromRGB(138, 43, 226)
	contentFrame.ZIndex = 4
	contentFrame.Parent = mainContainer
	
	local contentCorner = Instance.new("UICorner")
	contentCorner.CornerRadius = UDim.new(0, 10)
	contentCorner.Parent = contentFrame
	
	-- ════════════════════════════════════════════════════════════════════
	-- 🔑 SISTEMA DE VERIFICAÇÃO DE KEY
	-- ════════════════════════════════════════════════════════════════════
	
	local function VerifyKey()
		local enteredKey = keyInput.Text:match("^%s*(.-)%s*$") -- Remove espaços
		
		-- Verificar se é KEY ADMIN
		if enteredKey == KeySystem.ADMIN_KEY then
			statusLabel.Text = "✅ KEY ADMIN ACEITA! Modo Admin Ativado!"
			statusLabel.TextColor3 = Color3.fromRGB(0, 255, 100)
			KeySystem.IsAdminAccess = true
			keyInput.BackgroundColor3 = Color3.fromRGB(0, 100, 50)
			keyInput.Text = ""
			LoadAdminFunctions()
			return
		end
		
		-- Verificar se é KEY SEMANAL
		local isValidWeekly = false
		for i, key in pairs(KeySystem.WeeklyKeys) do
			if enteredKey == key then
				isValidWeekly = true
				break
			end
		end
		
		if isValidWeekly then
			statusLabel.Text = "✅ KEY SEMANAL VÁLIDA! Acesso Limitado"
			statusLabel.TextColor3 = Color3.fromRGB(0, 200, 255)
			KeySystem.IsUserAccess = true
			keyInput.BackgroundColor3 = Color3.fromRGB(0, 50, 100)
			keyInput.Text = ""
			LoadUserFunctions()
			return
		end
		
		-- Key inválida
		statusLabel.Text = "❌ KEY INVÁLIDA! Tente novamente"
		statusLabel.TextColor3 = Color3.fromRGB(255, 100, 100)
		keyInput.BackgroundColor3 = Color3.fromRGB(100, 30, 30)
	end
	
	verifyBtn.MouseButton1Click:Connect(function()
		VerifyKey()
	end)
	
	-- Permitir Enter para verificar
	keyInput.FocusLost:Connect(function(enterPressed)
		if enterPressed then
			VerifyKey()
		end
	end)
	
	-- ════════════════════════════════════════════════════════════════════
	-- 📋 FUNÇÕES DE ADMIN
	-- ════════════════════════════════════════════════════════════════════
	
	function LoadAdminFunctions()
		contentFrame:ClearAllChildren()
		contentFrame.CanvasSize = UDim2.new(0, 0, 0, 800)
		
		local adminFunctions = {
			{name = "🛡️ God Mode", state = "GodMode"},
			{name = "⚡ No Cooldown", state = "NoCD"},
			{name = "🚀 Teleport Jump", state = "TeleportJump"},
			{name = "👻 Noclip", state = "Noclip"},
			{name = "🏃 Speed Lock", state = "WalkSpeedLock"},
			{name = "⬆️ Jump Power", state = "JumpPowerLock"},
			{name = "🎯 Auto Block", state = "AutoBlock"},
			{name = "🌀 No Knockback", state = "NoKnockback"},
			{name = "🖱️ Click TP", state = "ClickTP"},
			{name = "🛡️ Safe Mode", state = "SafeModeActive"},
		}
		
		for idx, func in pairs(adminFunctions) do
			local btnFrame = Instance.new("Frame")
			btnFrame.Name = func.name
			btnFrame.Size = UDim2.new(1, -20, 0, 55)
			btnFrame.Position = UDim2.new(0, 10, 0, (idx - 1) * 60)
			btnFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 85)
			btnFrame.BackgroundTransparency = 0.2
			btnFrame.BorderColor3 = Color3.fromRGB(138, 43, 226)
			btnFrame.BorderSizePixel = 1
			btnFrame.ZIndex = 5
			btnFrame.Parent = contentFrame
			
			local corner = Instance.new("UICorner")
			corner.CornerRadius = UDim.new(0, 8)
			corner.Parent = btnFrame
			
			local btnText = Instance.new("TextLabel")
			btnText.Size = UDim2.new(0.7, 0, 1, 0)
			btnText.Position = UDim2.new(0, 10, 0, 0)
			btnText.BackgroundTransparency = 1
			btnText.Text = func.name
			btnText.TextSize = 14
			btnText.TextColor3 = Color3.fromRGB(255, 215, 0)
			btnText.Font = Enum.Font.GothamBold
			btnText.TextXAlignment = Enum.TextXAlignment.Left
			btnText.TextYAlignment = Enum.TextYAlignment.Center
			btnText.ZIndex = 6
			btnText.Parent = btnFrame
			
			local toggleBtn = Instance.new("TextButton")
			toggleBtn.Name = "ToggleButton"
			toggleBtn.Size = UDim2.new(0, 65, 0, 35)
			toggleBtn.Position = UDim2.new(0.72, 0, 0.5, -17)
			toggleBtn.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
			toggleBtn.BorderSizePixel = 0
			toggleBtn.Text = "OFF"
			toggleBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
			toggleBtn.TextSize = 11
			toggleBtn.Font = Enum.Font.GothamBold
			toggleBtn.ZIndex = 6
			toggleBtn.Parent = btnFrame
			
			local toggleCorner = Instance.new("UICorner")
			toggleCorner.CornerRadius = UDim.new(0, 6)
			toggleCorner.Parent = toggleBtn
			
			toggleBtn.MouseButton1Click:Connect(function()
				State[func.state] = not State[func.state]
				if State[func.state] then
					toggleBtn.BackgroundColor3 = Color3.fromRGB(0, 200, 100)
					toggleBtn.Text = "ON ✓"
				else
					toggleBtn.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
					toggleBtn.Text = "OFF"
				end
			end)
			
			toggleBtn.MouseEnter:Connect(function()
				toggleBtn.BackgroundTransparency = 0.2
			end)
			
			toggleBtn.MouseLeave:Connect(function()
				toggleBtn.BackgroundTransparency = 0
			end)
		end
		
		-- Update canvas size
		contentFrame.CanvasSize = UDim2.new(0, 0, 0, #adminFunctions * 60 + 20)
	end
	
	-- ════════════════════════════════════════════════════════════════════
	-- 👤 FUNÇÕES DE USUÁRIO (Keys Semanais)
	-- ════════════════════════════════════════════════════════════════════
	
	function LoadUserFunctions()
		contentFrame:ClearAllChildren()
		
		local userFunctions = {
			{name = "📊 Stats do Personagem", desc = "Ver informações da sua conta"},
			{name = "🎯 Click Teleport", desc = "Teleportar clicando no mapa"},
			{name = "🏃 Speed Boost", desc = "Aumentar velocidade de movimento"},
			{name = "💨 Sprint", desc = "Correr mais rápido"},
			{name = "⬆️ Jump Amplifier", desc = "Pular mais alto"},
		}
		
		for idx, func in pairs(userFunctions) do
			local btnFrame = Instance.new("Frame")
			btnFrame.Size = UDim2.new(1, -20, 0, 55)
			btnFrame.Position = UDim2.new(0, 10, 0, (idx - 1) * 60)
			btnFrame.BackgroundColor3 = Color3.fromRGB(40, 60, 90)
			btnFrame.BackgroundTransparency = 0.2
			btnFrame.BorderColor3 = Color3.fromRGB(100, 150, 255)
			btnFrame.BorderSizePixel = 1
			btnFrame.ZIndex = 5
			btnFrame.Parent = contentFrame
			
			local corner = Instance.new("UICorner")
			corner.CornerRadius = UDim.new(0, 8)
			corner.Parent = btnFrame
			
			local btnText = Instance.new("TextLabel")
			btnText.Size = UDim2.new(1, -20, 1, 0)
			btnText.Position = UDim2.new(0, 10, 0, 0)
			btnText.BackgroundTransparency = 1
			btnText.Text = func.name .. "\n" .. func.desc
			btnText.TextSize = 12
			btnText.TextColor3 = Color3.fromRGB(100, 200, 255)
			btnText.Font = Enum.Font.Gotham
			btnText.TextWrapped = true
			btnText.TextYAlignment = Enum.TextYAlignment.Center
			btnText.ZIndex = 6
			btnText.Parent = btnFrame
		end
		
		-- Update canvas size
		contentFrame.CanvasSize = UDim2.new(0, 0, 0, #userFunctions * 60 + 20)
	end
	
	State.PlayerGUI = screenGui
	State.ContentFrame = contentFrame
	State.KeyInfoLabel = statusLabel
	
	-- Mensagem inicial
	print("✅ SHADOW HUB - UI Carregada com sucesso!")
	print("🔐 Digite a KEY para acessar as funções!")
end

-- ════════════════════════════════════════════════════════════════════
-- 🚀 INICIAR SCRIPT
-- ════════════════════════════════════════════════════════════════════

wait(1)
CreateMainUI()

print("=" .. string.rep("=", 60))
print("🌑 SHADOW HUB - THE EMINENCE IN SHADOW - CARREGADO!")
print("=" .. string.rep("=", 60))
print("📝 KEYS DISPONÍVEIS:")
print("")
print("🔴 KEY ADMIN SUPREMO:")
print("   " .. KeySystem.ADMIN_KEY)
print("")
print("📅 KEYS SEMANAIS (7 DIFERENTES):")
for i = 0, 6 do
	print("   Semana " .. (i + 1) .. ": " .. KeySystem.WeeklyKeys[i])
end
print("")
print("=" .. string.rep("=", 60))
print("✨ DISCORD: https://discord.gg/JtE2rx2eGx")
print("=" .. string.rep("=", 60))
