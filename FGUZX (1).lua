-- FGUZX Hub com Tanjiro (base FTFHAX modificada por GusX)

-- Remove GUI antiga
pcall(function()
	if game.CoreGui:FindFirstChild("FGUZX_Loading") then
		game.CoreGui.FGUZX_Loading:Destroy()
	end
end)

-- Tela de Carregamento
local gui = Instance.new("ScreenGui", game.CoreGui)
gui.Name = "FGUZX_Loading"

local frame = Instance.new("Frame", gui)
frame.Size = UDim2.new(0, 450, 0, 270)
frame.Position = UDim2.new(0.5, -225, 0.5, -135)
frame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)

local img = Instance.new("ImageLabel", frame)
img.Size = UDim2.new(1, 0, 1, 0)
img.BackgroundTransparency = 1
img.Image = "rbxthumb://type=Asset&id=10884052272&w=420&h=420" -- imagem Tanjiro

local text = Instance.new("TextLabel", frame)
text.Size = UDim2.new(1, 0, 0.2, 0)
text.Position = UDim2.new(0, 0, 0.8, 0)
text.BackgroundTransparency = 1
text.TextColor3 = Color3.fromRGB(0, 255, 0)
text.TextScaled = true
text.Font = Enum.Font.GothamBold
text.Text = "⚡ FTFHAX carregando By the_GusX..."

local dots = 0
local running = true
coroutine.wrap(function()
	while running do
		dots = (dots % 3) + 1
		text.Text = "⚡ FTFHAX carregando By the_GusX" .. string.rep(".", dots)
		wait(0.4)
	end
end)()

-- Função para teleportar para jogador
local function teleportToPlayer(targetName)
	local lp = game.Players.LocalPlayer
	if not lp.Character or not lp.Character:FindFirstChild("HumanoidRootPart") then return end

	targetName = targetName:lower()
	for _, p in pairs(game.Players:GetPlayers()) do
		if p.Name:lower():find(targetName) then
			if p.Character and p.Character:FindFirstChild("HumanoidRootPart") then
				lp.Character.HumanoidRootPart.CFrame = p.Character.HumanoidRootPart.CFrame + Vector3.new(0, 3, 0)
			end
		end
	end
end

-- Função para adicionar imagem do Tanjiro na GUI principal
local function adicionarImagemTanjiro(gui)
	local img = Instance.new("ImageLabel")
	img.Name = "TanjiroImage"
	img.Image = "rbxthumb://type=Asset&id=10884052272&w=420&h=420"
	img.Size = UDim2.new(0, 100, 0, 100)
	img.Position = UDim2.new(1, -110, 0, 10)
	img.BackgroundTransparency = 1
	img.Parent = gui
end

-- Carrega o FTFHAX modificado (verde)
local success, err = pcall(function()
	local source = game:HttpGet("https://raw.githubusercontent.com/LeviTheOtaku/roblox-scripts/main/FTFHAX.lua")
	local modified = source:gsub("Color3.fromRGB%(%s*%d+,%s*%d+,%s*%d+%)", "Color3.fromRGB(0,255,0)")
	loadstring(modified)()
end)

if success then
	wait(2)

	-- Corrige cor para "innocent" (branco)
	for _, gui in pairs(game.CoreGui:GetChildren()) do
		if gui:IsA("ScreenGui") and gui.Name == "FGUZX" then
			for _, obj in pairs(gui:GetDescendants()) do
				if obj:IsA("TextLabel") then
					local txt = obj.Text:lower()
					if txt == "innocent" then
						obj.TextColor3 = Color3.new(1,1,1) -- branco
					end
				end
			end
		end
	end

	-- Renomeia GUI para FGUZX e muda título
	for _, gui in pairs(game.CoreGui:GetChildren()) do
		if gui:IsA("ScreenGui") and gui.Name == "FTFHAX" then
			gui.Name = "FGUZX"
			for _, el in pairs(gui:GetDescendants()) do
				if el:IsA("TextLabel") and el.Text == "FTFHAX" then
					el.Text = "FGUZX By GusX"
					el.TextColor3 = Color3.fromRGB(0, 255, 0)
				end
			end

			-- Adiciona imagem do Tanjiro na GUI
			adicionarImagemTanjiro(gui)
		end
	end

	-- Textos vermelhos (exceto setas ↑)
	for _, g in pairs({game.CoreGui, game.Players.LocalPlayer:FindFirstChild("PlayerGui")}) do
		if g then
			for _, gui in pairs(g:GetChildren()) do
				for _, obj in pairs(gui:GetDescendants()) do
					if (obj:IsA("TextLabel") or obj:IsA("TextButton")) and not obj.Text:find("↑") then
						obj.TextColor3 = Color3.fromRGB(255, 0, 0)
					end
				end
			end
		end
	end

	-- Botão TP Jogadores
	local tpGui = Instance.new("ScreenGui", game.CoreGui)
	tpGui.Name = "TP_FGUZX"

	local frame = Instance.new("Frame", tpGui)
	frame.Size = UDim2.new(0, 150, 0, 40)
	frame.Position = UDim2.new(0, 10, 0.9, -50)
	frame.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
	frame.AnchorPoint = Vector2.new(0, 1)
	frame.BackgroundTransparency = 0.3

	local button = Instance.new("TextButton", frame)
	button.Size = UDim2.new(1, -10, 1, -10)
	button.Position = UDim2.new(0, 5, 0, 5)
	button.BackgroundColor3 = Color3.fromRGB(0, 150, 0)
	button.Font = Enum.Font.GothamBold
	button.TextColor3 = Color3.fromRGB(255, 255, 255)
	button.TextScaled = true
	button.Text = "TP Jogadores"

	local input = Instance.new("TextBox", frame)
	input.Size = UDim2.new(1, -10, 0, 30)
	input.Position = UDim2.new(0, 5, 0, -35)
	input.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
	input.TextColor3 = Color3.fromRGB(0, 255, 0)
	input.PlaceholderText = "Nome do jogador"
	input.Visible = false
	input.TextScaled = true
	input.Font = Enum.Font.GothamBold

	button.MouseButton1Click:Connect(function()
		if input.Visible then
			if input.Text ~= "" then
				teleportToPlayer(input.Text)
				input.Text = ""
			end
			input.Visible = false
		else
			input.Visible = true
			input:CaptureFocus()
		end
	end)

	-- Final do carregamento
	running = false
	text.Text = "✅ FTFHAX iniciado!"
	wait(1)
	gui:Destroy()
else
	running = false
	warn("Erro ao carregar FGUZX: " .. tostring(err))
end