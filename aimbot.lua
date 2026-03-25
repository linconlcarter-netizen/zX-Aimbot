local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local TextLabel = Instance.new("TextLabel")
local Button = Instance.new("TextButton")
local UIStroke = Instance.new("UIStroke")

ScreenGui.Parent = game.CoreGui

Frame.Parent = ScreenGui
Frame.Size = UDim2.new(0, 300, 0, 150)
Frame.Position = UDim2.new(0.5, -150, 0.5, -75)
Frame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
Frame.Active = true
Frame.Draggable = true

UIStroke.Parent = Frame
UIStroke.Thickness = 1.5
UIStroke.Color = Color3.fromRGB(255,255,255)

TextLabel.Parent = Frame
TextLabel.Size = UDim2.new(1, 0, 0.6, 0)
TextLabel.BackgroundTransparency = 1
TextLabel.Text = "Este script foi desativado.\nEntre no Discord para saber quando será ativado."
TextLabel.TextColor3 = Color3.fromRGB(255,255,255)
TextLabel.TextScaled = true
TextLabel.Font = Enum.Font.GothamBold

Button.Parent = Frame
Button.Size = UDim2.new(0.8, 0, 0.25, 0)
Button.Position = UDim2.new(0.1, 0, 0.7, 0)
Button.Text = "Copiar link do Discord"
Button.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
Button.TextColor3 = Color3.fromRGB(255,255,255)
Button.TextScaled = true
Button.Font = Enum.Font.GothamBold

local link = "https://discord.gg/bDBX8GuZuy"

Button.MouseButton1Click:Connect(function()
    if setclipboard then
        setclipboard(link)
        Button.Text = "Copiado!"
    else
        Button.Text = "Erro ao copiar"
    end
end)
