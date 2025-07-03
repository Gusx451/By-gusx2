
-- Sistema de Key: GusX

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local keyGui = Instance.new("ScreenGui", game.CoreGui)
keyGui.Name = "KeySystem"

local frame = Instance.new("Frame", keyGui)
frame.Size = UDim2.new(0, 300, 0, 150)
frame.Position = UDim2.new(0.5, -150, 0.5, -75)
frame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
frame.BorderSizePixel = 2
frame.BorderColor3 = Color3.fromRGB(0, 255, 0)

local title = Instance.new("TextLabel", frame)
title.Size = UDim2.new(1, 0, 0.3, 0)
title.Position = UDim2.new(0, 0, 0, 0)
title.Text = "Insira a Key para acessar o FGUZX"
title.TextColor3 = Color3.fromRGB(0, 255, 0)
title.BackgroundTransparency = 1
title.TextScaled = true
title.Font = Enum.Font.GothamBold

local box = Instance.new("TextBox", frame)
box.Size = UDim2.new(0.8, 0, 0.3, 0)
box.Position = UDim2.new(0.1, 0, 0.4, 0)
box.PlaceholderText = "Digite a key aqui"
box.Text = ""
box.TextScaled = true
box.Font = Enum.Font.Gotham
box.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
box.TextColor3 = Color3.fromRGB(0, 255, 0)

local button = Instance.new("TextButton", frame)
button.Size = UDim2.new(0.6, 0, 0.2, 0)
button.Position = UDim2.new(0.2, 0, 0.75, 0)
button.Text = "VERIFICAR"
button.TextScaled = true
button.Font = Enum.Font.GothamBold
button.BackgroundColor3 = Color3.fromRGB(0, 150, 0)
button.TextColor3 = Color3.fromRGB(255, 255, 255)

-- Se a key for errada, fecha tudo
button.MouseButton1Click:Connect(function()
	if box.Text == "GusX" then
		keyGui:Destroy()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/Gusx451/By-gusx/main/FGUZX%20(1).lua", true))()
	else
		keyGui:Destroy()
		LocalPlayer:Kick("❌ Key incorreta!")
	end
end)
