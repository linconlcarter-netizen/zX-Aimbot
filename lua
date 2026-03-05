local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local CoreGui = game:GetService("CoreGui")
local LocalPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera
local StarterGui = game:GetService("StarterGui")
local VirtualUser = game:GetService("VirtualUser")
local Lighting = game:GetService("Lighting")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TweenService = game:GetService("TweenService")

local function clamp(v, mi, ma)
    if v < mi then return mi end
    if v > ma then return ma end
    return v
end

local KEY_VALIDA = "zX_eht3n7c72juwby"
local vipNames = {"Huskylion10", "LcsezxTest", "LCSEZINN7", "kauanghwy", "7menorzin_22", "Lcsezx", "Lcsezin", "xXProGamerXx", "nnfm45"}
local isVip = false
local keyValidada = false

for _, name in ipairs(vipNames) do
    if LocalPlayer.Name == name then
        isVip = true
        keyValidada = true
        break
    end
end

local keyScreen = Instance.new("ScreenGui")
keyScreen.Name = "KeySystem"
keyScreen.Parent = CoreGui
keyScreen.IgnoreGuiInset = true
keyScreen.Enabled = not isVip

local keyFrame = Instance.new("Frame")
keyFrame.Size = UDim2.new(0, 400, 0, 300)
keyFrame.Position = UDim2.new(0.5, -200, 0.5, -150)
keyFrame.BackgroundColor3 = Color3.fromRGB(10, 10, 15)
keyFrame.BackgroundTransparency = 0
keyFrame.Parent = keyScreen
keyFrame.Active = true
keyFrame.Draggable = true
Instance.new("UICorner", keyFrame).CornerRadius = UDim.new(0, 20)

local keyTitle = Instance.new("TextLabel")
keyTitle.Size = UDim2.new(1, 0, 0, 50)
keyTitle.Position = UDim2.new(0, 0, 0, 10)
keyTitle.BackgroundTransparency = 1
keyTitle.Text = "zX Aimbot"
keyTitle.TextColor3 = Color3.fromRGB(0, 230, 255)
keyTitle.TextSize = 30
keyTitle.Font = Enum.Font.GothamBold
keyTitle.Parent = keyFrame

local keySub = Instance.new("TextLabel")
keySub.Size = UDim2.new(1, 0, 0, 30)
keySub.Position = UDim2.new(0, 0, 0, 70)
keySub.BackgroundTransparency = 1
keySub.Text = "Insira a chave de acesso"
keySub.TextColor3 = Color3.fromRGB(200, 200, 200)
keySub.TextSize = 16
keySub.Font = Enum.Font.Gotham
keySub.Parent = keyFrame

local keyBox = Instance.new("TextBox")
keyBox.Size = UDim2.new(0.8, 0, 0, 40)
keyBox.Position = UDim2.new(0.1, 0, 0, 120)
keyBox.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
keyBox.TextColor3 = Color3.fromRGB(0, 230, 255)
keyBox.PlaceholderText = "Digite a key"
keyBox.PlaceholderColor3 = Color3.fromRGB(100, 100, 100)
keyBox.TextSize = 16
keyBox.Font = Enum.Font.Gotham
keyBox.Parent = keyFrame
Instance.new("UICorner", keyBox).CornerRadius = UDim.new(0, 10)

local keyButton = Instance.new("TextButton")
keyButton.Size = UDim2.new(0.4, 0, 0, 40)
keyButton.Position = UDim2.new(0.3, 0, 0, 180)
keyButton.BackgroundColor3 = Color3.fromRGB(0, 120, 180)
keyButton.Text = "Confirmar"
keyButton.TextColor3 = Color3.new(1, 1, 1)
keyButton.TextSize = 18
keyButton.Font = Enum.Font.GothamBold
keyButton.Parent = keyFrame
Instance.new("UICorner", keyButton).CornerRadius = UDim.new(0, 10)

local keyClose = Instance.new("TextButton")
keyClose.Size = UDim2.new(0, 30, 0, 30)
keyClose.Position = UDim2.new(1, -40, 0, 10)
keyClose.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
keyClose.Text = "X"
keyClose.TextColor3 = Color3.new(1, 1, 1)
keyClose.TextSize = 18
keyClose.Font = Enum.Font.GothamBold
keyClose.Parent = keyFrame
Instance.new("UICorner", keyClose).CornerRadius = UDim.new(0, 10)

local keyStatus = Instance.new("TextLabel")
keyStatus.Size = UDim2.new(1, 0, 0, 30)
keyStatus.Position = UDim2.new(0, 0, 0, 230)
keyStatus.BackgroundTransparency = 1
keyStatus.Text = ""
keyStatus.TextColor3 = Color3.fromRGB(255, 100, 100)
keyStatus.TextSize = 14
keyStatus.Font = Enum.Font.Gotham
keyStatus.Parent = keyFrame

keyButton.MouseButton1Click:Connect(function()
    local keyDigitada = keyBox.Text
    if keyDigitada == KEY_VALIDA then
        keyValidada = true
        keyStatus.Text = "Key válida! Carregando..."
        keyStatus.TextColor3 = Color3.fromRGB(0, 255, 0)
        
        task.wait(1)
        keyStatus.Text = "Verificando dados do script..."
        task.wait(1)
        keyStatus.Text = "Procurando atualizações..."
        task.wait(1)
        keyStatus.Text = "Otimizando..."
        task.wait(1)
        
        keyScreen.Enabled = false
        keyScreen:Destroy()
    else
        keyStatus.Text = "Key inválida!"
        keyStatus.TextColor3 = Color3.fromRGB(255, 0, 0)
    end
end)

keyClose.MouseButton1Click:Connect(function()
    keyScreen.Enabled = false
    keyScreen:Destroy()
    return
end)

if isVip then
    keyScreen.Enabled = false
    keyScreen:Destroy()
    
    StarterGui:SetCore("SendNotification", {
        Title = "VIP",
        Text = "Bypass na key ativado!",
        Duration = 3
    })
end

if not keyValidada then
    repeat
        task.wait(1)
    until keyValidada or not keyScreen
end

local usuariosZX = {LocalPlayer.Name}
local temMultiplosZX = false

local function detectarOutrosZX()
    temMultiplosZX = false
    usuariosZX = {LocalPlayer.Name}
    
    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= LocalPlayer then
            local temZX = false
            pcall(function()
                if player:FindFirstChild("PlayerGui") then
                    if player.PlayerGui:FindFirstChild("zXAimbot") or 
                       player.PlayerGui:FindFirstChild("KeySystem") or
                       player.PlayerGui:FindFirstChild("FlyGui") then
                        temZX = true
                    end
                end
                
                local core = game:GetService("CoreGui")
                for _, v in ipairs(core:GetChildren()) do
                    if v.Name == "zXAimbot" or v.Name:find("zX") then
                        temZX = true
                    end
                end
            end)
            
            if temZX then
                table.insert(usuariosZX, player.Name)
                temMultiplosZX = true
            end
        end
    end
    
    return temMultiplosZX
end

local function kickarOutrosZX()
    local kikados = 0
    
    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= LocalPlayer then
            local podeKickar = false
            pcall(function()
                if player:FindFirstChild("PlayerGui") and player.PlayerGui:FindFirstChild("zXAimbot") then
                    podeKickar = true
                end
                if game:GetService("CoreGui"):FindFirstChild("zXAimbot") then
                    podeKickar = true
                end
            end)
            
            if podeKickar then
                pcall(function()
                    if player.Character then
                        local hum = player.Character:FindFirstChildOfClass("Humanoid")
                        if hum then hum.Health = 0 end
                        
                        for _, v in ipairs(player.Character:GetDescendants()) do
                            if v:IsA("RemoteEvent") or v:IsA("RemoteFunction") then
                                v:FireServer("Kick", "Outro usuário zX detectado")
                            end
                        end
                    end
                end)
                kikados = kikados + 1
            end
        end
    end
    
    StarterGui:SetCore("SendNotification", {
        Title = "zX Detector",
        Text = string.format("%d usuários zX removidos!", kikados),
        Duration = 3
    })
end

Players.PlayerAdded:Connect(function(player)
    task.wait(2)
    detectarOutrosZX()
end)

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "zXAimbot"
screenGui.Parent = CoreGui
screenGui.IgnoreGuiInset = true
screenGui.Enabled = false

local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 650, 0, 500)
mainFrame.Position = UDim2.new(0.5, -325, 0.5, -250)
mainFrame.BackgroundColor3 = Color3.fromRGB(10, 10, 15)
mainFrame.BorderSizePixel = 0
mainFrame.Parent = screenGui
mainFrame.Active = true
mainFrame.Draggable = true
Instance.new("UICorner", mainFrame).CornerRadius = UDim.new(0, 20)

local titleLabel = Instance.new("TextLabel")
titleLabel.Size = UDim2.new(0, 200, 0, 50)
titleLabel.Position = UDim2.new(0, 30, 0, 10)
titleLabel.BackgroundTransparency = 1
titleLabel.Text = "zX Aimbot"
titleLabel.TextColor3 = Color3.fromRGB(0, 230, 255)
titleLabel.TextSize = 30
titleLabel.Font = Enum.Font.GothamBold
titleLabel.Parent = mainFrame

local subLabel = Instance.new("TextLabel")
subLabel.Size = UDim2.new(0, 200, 0, 30)
subLabel.Position = UDim2.new(0, 44, 0, 64)
subLabel.BackgroundTransparency = 1
subLabel.Text = "by lcsezX"
subLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
subLabel.TextSize = 16
subLabel.Font = Enum.Font.Gotham
subLabel.Parent = mainFrame

local floatingIcon = Instance.new("TextButton")
floatingIcon.Name = "FloatingIcon"
floatingIcon.Size = UDim2.new(0, 50, 0, 50)
floatingIcon.Position = UDim2.new(0, 30, 0.5, -25)
floatingIcon.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
floatingIcon.BackgroundTransparency = 0
floatingIcon.Text = "🎯"
floatingIcon.TextColor3 = Color3.fromRGB(255, 100, 0)
floatingIcon.TextSize = 30
floatingIcon.Font = Enum.Font.GothamBlack
floatingIcon.Parent = CoreGui
floatingIcon.Active = true
floatingIcon.Draggable = true
floatingIcon.Visible = true
floatingIcon.ZIndex = 999

local iconCorner = Instance.new("UICorner")
iconCorner.CornerRadius = UDim.new(1, 0)
iconCorner.Parent = floatingIcon

local iconStroke = Instance.new("UIStroke")
iconStroke.Thickness = 2
iconStroke.Color = Color3.fromRGB(255, 255, 255)
iconStroke.Parent = floatingIcon

local config = {
    aimbotEnabled = false,
    showFovCircle = true,
    fovSize = 500,
    fovColor = Color3.fromRGB(0, 170, 255),
    aimbotStrength = 8,
    aimPart = "Head",
    wallCheckEnabled = true,
    teamCheckEnabled = false,
    
    espEnabled = true,
    espLine = false,
    espBox = true,
    espName = false,
    espHealth = false,
    espSkeleton = false,
    espHologram = false,
    fullRGB = false,
    espColor = Color3.fromRGB(255, 0, 0),
    lineType = "Cima",
    
    spinEnabled = false,
    spinSpeed = 20,
    walkSpeedEnabled = false,
    walkSpeedValue = 16,
    jumpPowerEnabled = false,
    jumpPowerValue = 50,
    noClipEnabled = false,
    infiniteJumpEnabled = false,
    invisibleEnabled = false,
    flyEnabled = false,
    godModeEnabled = false,
    
    ignoreFar = true,
    maxDistance = 150,
    
    teleportKillEnabled = false,
    speedKillEnabled = false,
    autoKillTouch = false,
    killAuraEnabled = false,
    antiKillEnabled = false,
    
    antiKickEnabled = false,
    notificationAntiKick = false,
    
    customCrosshair = false,
    crosshairRGB = false,
    crosshairCircle = false,
    crosshairCross = true,
    
    kickZxUsers = false,
    tagOwnerEnabled = false,
    cameraFovValue = 70,
    
    hideKey = "V",
    watermarkEnabled = true,
    notificationsEnabled = true,
}

local cores = {
    ["Vermelho"] = Color3.fromRGB(255, 0, 0),
    ["Verde"] = Color3.fromRGB(0, 255, 0),
    ["Azul"] = Color3.fromRGB(0, 170, 255),
    ["Amarelo"] = Color3.fromRGB(255, 255, 0),
    ["Roxo"] = Color3.fromRGB(255, 0, 255),
    ["Laranja"] = Color3.fromRGB(255, 128, 0),
    ["Rosa"] = Color3.fromRGB(255, 105, 180),
    ["Ciano"] = Color3.fromRGB(0, 255, 255),
    ["Branco"] = Color3.fromRGB(255, 255, 255),
    ["Preto"] = Color3.fromRGB(0, 0, 0),
}

local rainbowHue = 0
local flyGui = nil
local originalTransparency = {}
local tagOwnerBillboard = nil
local tagOwnerConnection = nil
local guiVisible = true
local miniMode = false
local selectedPlayer = nil
local playerListFrame = nil
local speedKillCount = 0
local spinning = false
local spinConnection = nil
local fpsPanel = nil
local crosshairGui = nil
local crosshair = nil
local crossVertical = nil
local crosshairCircle = nil
local watermark = nil
local fovCircle = nil
local ESP_Drawings = {}
local flingConnection = nil
local tpwalking = false
local flyUIActive = false

task.spawn(function()
    while true do
        for i = 0, 1, 0.01 do
            rainbowHue = i
            task.wait(0.02)
        end
    end
end)

local function createDrawingESP(player)
    if player == LocalPlayer then return end
    
    pcall(function()
        local boxTop = Drawing.new("Line")
        local boxBottom = Drawing.new("Line")
        local boxLeft = Drawing.new("Line")
        local boxRight = Drawing.new("Line")
        
        for _, line in ipairs({boxTop, boxBottom, boxLeft, boxRight}) do
            line.Thickness = 2
            line.Visible = false
        end
        
        local line = Drawing.new("Line")
        line.Thickness = 2
        line.Visible = false
        
        local nameText = Drawing.new("Text")
        nameText.Size = 14
        nameText.Center = true
        nameText.Outline = true
        nameText.Visible = false
        
        local healthText = Drawing.new("Text")
        healthText.Size = 12
        healthText.Center = true
        healthText.Outline = true
        healthText.Visible = false
        
        local headCircle = Drawing.new("Circle")
        headCircle.NumSides = 20
        headCircle.Thickness = 2
        headCircle.Filled = false
        headCircle.Visible = false
        
        local torsoLine = Drawing.new("Line")
        torsoLine.Thickness = 2
        torsoLine.Visible = false
        
        local leftArmLine = Drawing.new("Line")
        leftArmLine.Thickness = 2
        leftArmLine.Visible = false
        
        local rightArmLine = Drawing.new("Line")
        rightArmLine.Thickness = 2
        rightArmLine.Visible = false
        
        local leftLegLine = Drawing.new("Line")
        leftLegLine.Thickness = 2
        leftLegLine.Visible = false
        
        local rightLegLine = Drawing.new("Line")
        rightLegLine.Thickness = 2
        rightLegLine.Visible = false
        
        ESP_Drawings[player] = {
            Box = {Top = boxTop, Bottom = boxBottom, Left = boxLeft, Right = boxRight},
            Line = line,
            Name = nameText,
            Health = healthText,
            Skeleton = {
                Head = headCircle,
                Torso = torsoLine,
                LeftArm = leftArmLine,
                RightArm = rightArmLine,
                LeftLeg = leftLegLine,
                RightLeg = rightLegLine
            }
        }
    end)
end

local function removeDrawingESP(player)
    if ESP_Drawings[player] then
        pcall(function()
            for _, v in pairs(ESP_Drawings[player]) do
                if type(v) == "table" then
                    for _, obj in pairs(v) do
                        if obj and obj.Remove then obj:Remove() end
                    end
                else
                    if v and v.Remove then v:Remove() end
                end
            end
        end)
        ESP_Drawings[player] = nil
    end
end

for _, player in ipairs(Players:GetPlayers()) do
    createDrawingESP(player)
end

Players.PlayerAdded:Connect(createDrawingESP)
Players.PlayerRemoving:Connect(removeDrawingESP)

RunService.RenderStepped:Connect(function()
    local espColor = config.espColor
    if config.fullRGB then
        espColor = Color3.fromHSV(rainbowHue, 1, 1)
    end
    
    for player, drawings in pairs(ESP_Drawings) do
        local char = player.Character
        if char and char:FindFirstChild("HumanoidRootPart") and char:FindFirstChild("Humanoid") then
            local hrp = char.HumanoidRootPart
            local humanoid = char.Humanoid
            local head = char:FindFirstChild("Head")
            local pos, onScreen = Camera:WorldToViewportPoint(hrp.Position)
            
            if onScreen then
                local topPos = Camera:WorldToViewportPoint(hrp.Position + Vector3.new(0, 3, 0)).Y
                local bottomPos = Camera:WorldToViewportPoint(hrp.Position - Vector3.new(0, 3, 0)).Y
                local height = math.abs(topPos - bottomPos)
                local width = height * 0.8
                
                if config.espBox then
                    local box = drawings.Box
                    box.Top.From = Vector2.new(pos.X - width/2, pos.Y - height/2)
                    box.Top.To = Vector2.new(pos.X + width/2, pos.Y - height/2)
                    box.Top.Color = espColor
                    box.Top.Visible = true
                    
                    box.Bottom.From = Vector2.new(pos.X - width/2, pos.Y + height/2)
                    box.Bottom.To = Vector2.new(pos.X + width/2, pos.Y + height/2)
                    box.Bottom.Color = espColor
                    box.Bottom.Visible = true
                    
                    box.Left.From = Vector2.new(pos.X - width/2, pos.Y - height/2)
                    box.Left.To = Vector2.new(pos.X - width/2, pos.Y + height/2)
                    box.Left.Color = espColor
                    box.Left.Visible = true
                    
                    box.Right.From = Vector2.new(pos.X + width/2, pos.Y - height/2)
                    box.Right.To = Vector2.new(pos.X + width/2, pos.Y + height/2)
                    box.Right.Color = espColor
                    box.Right.Visible = true
                else
                    for _, line in pairs(drawings.Box) do
                        line.Visible = false
                    end
                end
                
                if config.espLine then
                    drawings.Line.Color = espColor
                    if config.lineType == "Cima" then
                        drawings.Line.From = Vector2.new(Camera.ViewportSize.X/2, 0)
                    elseif config.lineType == "Baixo" then
                        drawings.Line.From = Vector2.new(Camera.ViewportSize.X/2, Camera.ViewportSize.Y)
                    else
                        drawings.Line.From = Vector2.new(Camera.ViewportSize.X/2, Camera.ViewportSize.Y/2)
                    end
                    drawings.Line.To = Vector2.new(pos.X, pos.Y - height/2)
                    drawings.Line.Visible = true
                else
                    drawings.Line.Visible = false
                end
                
                if config.espName then
                    drawings.Name.Text = player.Name
                    drawings.Name.Position = Vector2.new(pos.X, pos.Y - height/2 - 25)
                    drawings.Name.Color = espColor
                    drawings.Name.Visible = true
                else
                    drawings.Name.Visible = false
                end
                
                if config.espHealth then
                    local hp = math.floor(humanoid.Health)
                    drawings.Health.Text = "❤️ " .. hp
                    drawings.Health.Position = Vector2.new(pos.X, pos.Y - height/2 - 10)
                    drawings.Health.Color = espColor
                    drawings.Health.Visible = true
                else
                    drawings.Health.Visible = false
                end
                
                if config.espSkeleton and head then
                    local sk = drawings.Skeleton
                    
                    local headPos = Camera:WorldToViewportPoint(head.Position)
                    local torsoTop = Camera:WorldToViewportPoint(hrp.Position + Vector3.new(0, 1, 0))
                    local torsoBottom = Camera:WorldToViewportPoint(hrp.Position - Vector3.new(0, 1, 0))
                    local leftArm = Camera:WorldToViewportPoint(hrp.Position + Vector3.new(-1, 0.5, 0))
                    local rightArm = Camera:WorldToViewportPoint(hrp.Position + Vector3.new(1, 0.5, 0))
                    local leftLeg = Camera:WorldToViewportPoint(hrp.Position + Vector3.new(-0.5, -2, 0))
                    local rightLeg = Camera:WorldToViewportPoint(hrp.Position + Vector3.new(0.5, -2, 0))
                    
                    sk.Head.Position = Vector2.new(headPos.X, headPos.Y)
                    sk.Head.Radius = 8
                    sk.Head.Color = espColor
                    sk.Head.Visible = true
                    
                    sk.Torso.From = Vector2.new(torsoTop.X, torsoTop.Y)
                    sk.Torso.To = Vector2.new(torsoBottom.X, torsoBottom.Y)
                    sk.Torso.Color = espColor
                    sk.Torso.Visible = true
                    
                    sk.LeftArm.From = Vector2.new(torsoTop.X, torsoTop.Y)
                    sk.LeftArm.To = Vector2.new(leftArm.X, leftArm.Y)
                    sk.LeftArm.Color = espColor
                    sk.LeftArm.Visible = true
                    
                    sk.RightArm.From = Vector2.new(torsoTop.X, torsoTop.Y)
                    sk.RightArm.To = Vector2.new(rightArm.X, rightArm.Y)
                    sk.RightArm.Color = espColor
                    sk.RightArm.Visible = true
                    
                    sk.LeftLeg.From = Vector2.new(torsoBottom.X, torsoBottom.Y)
                    sk.LeftLeg.To = Vector2.new(leftLeg.X, leftLeg.Y)
                    sk.LeftLeg.Color = espColor
                    sk.LeftLeg.Visible = true
                    
                    sk.RightLeg.From = Vector2.new(torsoBottom.X, torsoBottom.Y)
                    sk.RightLeg.To = Vector2.new(rightLeg.X, rightLeg.Y)
                    sk.RightLeg.Color = espColor
                    sk.RightLeg.Visible = true
                elseif drawings.Skeleton then
                    for _, v in pairs(drawings.Skeleton) do
                        v.Visible = false
                    end
                end
            else
                for _, v in pairs(drawings) do
                    if type(v) == "table" then
                        for _, obj in pairs(v) do
                            if obj and obj.Visible ~= nil then
                                obj.Visible = false
                            end
                        end
                    else
                        if v and v.Visible ~= nil then
                            v.Visible = false
                        end
                    end
                end
            end
        else
            for _, v in pairs(drawings) do
                if type(v) == "table" then
                    for _, obj in pairs(v) do
                        if obj and obj.Visible ~= nil then
                            obj.Visible = false
                        end
                    end
                else
                    if v and v.Visible ~= nil then
                        v.Visible = false
                    end
                end
            end
        end
    end
end)

local function getClosestPlayer()
    local closest = nil
    local shortestDist = config.fovSize
    local center = Vector2.new(Camera.ViewportSize.X/2, Camera.ViewportSize.Y/2)
    
    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("Head") then
            if config.teamCheckEnabled and LocalPlayer.Team and player.Team and LocalPlayer.Team == player.Team then
                goto continue
            end
            
            local head = player.Character.Head
            local screenPos, onScreen = Camera:WorldToViewportPoint(head.Position)
            
            if onScreen then
                local dist = (Vector2.new(screenPos.X, screenPos.Y) - center).Magnitude
                
                if dist < shortestDist then
                    if config.wallCheckEnabled then
                        local ray = Ray.new(Camera.CFrame.Position, (head.Position - Camera.CFrame.Position).Unit * 1000)
                        local hit = workspace:FindPartOnRay(ray, LocalPlayer.Character)
                        if hit and not hit:IsDescendantOf(player.Character) then
                            goto continue
                        end
                    end
                    
                    if config.ignoreFar then
                        local worldDist = (head.Position - LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
                        if worldDist > config.maxDistance then
                            goto continue
                        end
                    end
                    
                    shortestDist = dist
                    closest = player
                end
            end
            
            ::continue::
        end
    end
    return closest
end

fovCircle = Instance.new("Frame", CoreGui)
fovCircle.Name = "FovCircle"
fovCircle.Size = UDim2.new(0, config.fovSize*2, 0, config.fovSize*2)
fovCircle.Position = UDim2.new(0.5, -config.fovSize, 0.5, -config.fovSize)
fovCircle.BackgroundTransparency = 1
fovCircle.Visible = config.showFovCircle
Instance.new("UICorner", fovCircle).CornerRadius = UDim.new(0.5, 0)
local circleStroke = Instance.new("UIStroke", fovCircle)
circleStroke.Thickness = 2.5
circleStroke.Color = config.fovColor

RunService.RenderStepped:Connect(function()
    if config.aimbotEnabled and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
        local target = getClosestPlayer()
        if target and target.Character and target.Character:FindFirstChild("Head") then
            local targetPos = target.Character.Head.Position
            local currentPos = Camera.CFrame.Position
            local lookAt = CFrame.lookAt(currentPos, targetPos)
            local smoothed = Camera.CFrame:Lerp(lookAt, config.aimbotStrength / 10)
            Camera.CFrame = smoothed
        end
    end
end)

local function createFlyGui()
    if flyGui then flyGui:Destroy() end
    
    flyGui = Instance.new("ScreenGui")
    flyGui.Name = "FlyGui"
    flyGui.Parent = CoreGui
    flyGui.Enabled = config.flyEnabled
    
    local main = Instance.new("Frame")
    main.Size = UDim2.new(0, 200, 0, 250)
    main.Position = UDim2.new(0.5, -100, 0.8, -125)
    main.BackgroundColor3 = Color3.fromRGB(20, 20, 25)
    main.BorderSizePixel = 0
    main.Active = true
    main.Draggable = true
    main.Parent = flyGui
    Instance.new("UICorner", main).CornerRadius = UDim.new(0, 10)
    
    local frame = Instance.new("Frame", main)
    frame.Size = UDim2.new(1, 0, 1, 0)
    frame.BackgroundColor3 = Color3.fromRGB(30, 30, 35)
    frame.BackgroundTransparency = 0.2
    Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 10)
    
    local title = Instance.new("TextLabel", frame)
    title.Size = UDim2.new(1, 0, 0, 30)
    title.BackgroundColor3 = Color3.fromRGB(0, 120, 180)
    title.Text = "Fly Mode"
    title.TextColor3 = Color3.new(1, 1, 1)
    title.Font = Enum.Font.GothamBold
    title.TextSize = 16
    Instance.new("UICorner", title).CornerRadius = UDim.new(0, 10)
    
    local up = Instance.new("TextButton", frame)
    up.Size = UDim2.new(0.8, 0, 0, 35)
    up.Position = UDim2.new(0.1, 0, 0, 40)
    up.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
    up.Text = "SUBIR"
    up.TextColor3 = Color3.new(1, 1, 1)
    up.Font = Enum.Font.GothamBold
    Instance.new("UICorner", up).CornerRadius = UDim.new(0, 8)
    
    local down = Instance.new("TextButton", frame)
    down.Size = UDim2.new(0.8, 0, 0, 35)
    down.Position = UDim2.new(0.1, 0, 0, 85)
    down.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
    down.Text = "DESCER"
    down.TextColor3 = Color3.new(1, 1, 1)
    down.Font = Enum.Font.GothamBold
    Instance.new("UICorner", down).CornerRadius = UDim.new(0, 8)
    
    local speedLabel = Instance.new("TextLabel", frame)
    speedLabel.Size = UDim2.new(0.4, 0, 0, 30)
    speedLabel.Position = UDim2.new(0.1, 0, 0, 130)
    speedLabel.BackgroundTransparency = 1
    speedLabel.Text = "Vel: 1"
    speedLabel.TextColor3 = Color3.fromRGB(0, 230, 255)
    speedLabel.Font = Enum.Font.GothamBold
    speedLabel.TextSize = 16
    
    local plus = Instance.new("TextButton", frame)
    plus.Size = UDim2.new(0.2, 0, 0, 30)
    plus.Position = UDim2.new(0.55, 0, 0, 130)
    plus.BackgroundColor3 = Color3.fromRGB(0, 120, 180)
    plus.Text = "+"
    plus.TextColor3 = Color3.new(1, 1, 1)
    plus.TextSize = 20
    plus.Font = Enum.Font.GothamBold
    Instance.new("UICorner", plus).CornerRadius = UDim.new(0, 8)
    
    local mine = Instance.new("TextButton", frame)
    mine.Size = UDim2.new(0.2, 0, 0, 30)
    mine.Position = UDim2.new(0.8, 0, 0, 130)
    mine.BackgroundColor3 = Color3.fromRGB(180, 0, 0)
    mine.Text = "-"
    mine.TextColor3 = Color3.new(1, 1, 1)
    mine.TextSize = 20
    mine.Font = Enum.Font.GothamBold
    Instance.new("UICorner", mine).CornerRadius = UDim.new(0, 8)
    
    local onof = Instance.new("TextButton", frame)
    onof.Size = UDim2.new(0.8, 0, 0, 35)
    onof.Position = UDim2.new(0.1, 0, 0, 170)
    onof.BackgroundColor3 = Color3.fromRGB(0, 180, 0)
    onof.Text = "ATIVADO"
    onof.TextColor3 = Color3.new(1, 1, 1)
    onof.Font = Enum.Font.GothamBold
    Instance.new("UICorner", onof).CornerRadius = UDim.new(0, 8)
    
    local mini = Instance.new("TextButton", frame)
    mini.Size = UDim2.new(0.3, 0, 0, 30)
    mini.Position = UDim2.new(0.1, 0, 0, 215)
    mini.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
    mini.Text = "-"
    mini.TextColor3 = Color3.new(1, 1, 1)
    mini.TextSize = 20
    mini.Font = Enum.Font.GothamBold
    Instance.new("UICorner", mini).CornerRadius = UDim.new(0, 8)
    
    local mini2 = Instance.new("TextButton", frame)
    mini2.Size = UDim2.new(0.3, 0, 0, 30)
    mini2.Position = UDim2.new(0.5, 0, 0, 215)
    mini2.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
    mini2.Text = "+"
    mini2.TextColor3 = Color3.new(1, 1, 1)
    mini2.TextSize = 20
    mini2.Font = Enum.Font.GothamBold
    mini2.Visible = false
    Instance.new("UICorner", mini2).CornerRadius = UDim.new(0, 8)
    
    local closebutton = Instance.new("TextButton", frame)
    closebutton.Size = UDim2.new(0, 30, 0, 30)
    closebutton.Position = UDim2.new(0.9, 0, 0, 5)
    closebutton.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
    closebutton.Text = "X"
    closebutton.TextColor3 = Color3.new(1, 1, 1)
    closebutton.Font = Enum.Font.GothamBold
    Instance.new("UICorner", closebutton).CornerRadius = UDim.new(0, 8)
    
    local speeds = 1
    local flyActive = false
    local tis, dis
    
    up.MouseButton1Down:Connect(function()
        tis = up.MouseEnter:Connect(function()
            while tis do
                task.wait()
                if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                    LocalPlayer.Character.HumanoidRootPart.CFrame = LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0, speeds/5, 0)
                end
            end
        end)
    end)
    
    up.MouseLeave:Connect(function()
        if tis then
            tis:Disconnect()
            tis = nil
        end
    end)
    
    down.MouseButton1Down:Connect(function()
        dis = down.MouseEnter:Connect(function()
            while dis do
                task.wait()
                if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                    LocalPlayer.Character.HumanoidRootPart.CFrame = LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0, -speeds/5, 0)
                end
            end
        end)
    end)
    
    down.MouseLeave:Connect(function()
        if dis then
            dis:Disconnect()
            dis = nil
        end
    end)
    
    plus.MouseButton1Click:Connect(function()
        speeds = speeds + 1
        speedLabel.Text = "Vel: " .. speeds
    end)
    
    mine.MouseButton1Click:Connect(function()
        if speeds > 1 then
            speeds = speeds - 1
            speedLabel.Text = "Vel: " .. speeds
        end
    end)
    
    onof.MouseButton1Click:Connect(function()
        flyActive = not flyActive
        if flyActive then
            onof.BackgroundColor3 = Color3.fromRGB(0, 180, 0)
            onof.Text = "ATIVADO"
        else
            onof.BackgroundColor3 = Color3.fromRGB(180, 0, 0)
            onof.Text = "DESATIVADO"
        end
    end)
    
    mini.MouseButton1Click:Connect(function()
        up.Visible = false
        down.Visible = false
        onof.Visible = false
        plus.Visible = false
        speedLabel.Visible = false
        mine.Visible = false
        mini.Visible = false
        mini2.Visible = true
        title.Text = "[MINI]"
    end)
    
    mini2.MouseButton1Click:Connect(function()
        up.Visible = true
        down.Visible = true
        onof.Visible = true
        plus.Visible = true
        speedLabel.Visible = true
        mine.Visible = true
        mini.Visible = true
        mini2.Visible = false
        title.Text = "Fly Mode"
    end)
    
    closebutton.MouseButton1Click:Connect(function()
        flyGui:Destroy()
        config.flyEnabled = false
    end)
    
    RunService.Heartbeat:Connect(function()
        if flyActive and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
            local hrp = LocalPlayer.Character.HumanoidRootPart
            local moveDir = Vector3.new()
            
            if UserInputService:IsKeyDown(Enum.KeyCode.W) then
                moveDir = moveDir + Camera.CFrame.LookVector
            end
            if UserInputService:IsKeyDown(Enum.KeyCode.S) then
                moveDir = moveDir - Camera.CFrame.LookVector
            end
            if UserInputService:IsKeyDown(Enum.KeyCode.A) then
                moveDir = moveDir - Camera.CFrame.RightVector
            end
            if UserInputService:IsKeyDown(Enum.KeyCode.D) then
                moveDir = moveDir + Camera.CFrame.RightVector
            end
            
            if moveDir.Magnitude > 0 then
                hrp.CFrame = hrp.CFrame + moveDir.Unit * speeds / 5
            end
        end
    end)
end

RunService.Heartbeat:Connect(function()
    pcall(function()
        if LocalPlayer.Character then
            local humanoid = LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
            if humanoid then
                if config.walkSpeedEnabled then
                    humanoid.WalkSpeed = config.walkSpeedValue
                else
                    humanoid.WalkSpeed = 16
                end
                if config.jumpPowerEnabled then
                    humanoid.JumpPower = config.jumpPowerValue
                else
                    humanoid.JumpPower = 50
                end
            end
        end
    end)
end)

RunService.Stepped:Connect(function()
    pcall(function()
        if config.noClipEnabled and LocalPlayer.Character then
            for _, v in ipairs(LocalPlayer.Character:GetDescendants()) do
                if v:IsA("BasePart") then
                    v.CanCollide = false
                end
            end
        end
    end)
end)

UserInputService.JumpRequest:Connect(function()
    pcall(function()
        if config.infiniteJumpEnabled and LocalPlayer.Character then
            local humanoid = LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
            if humanoid then
                humanoid:ChangeState("Jumping")
            end
        end
    end)
end)

local function toggleSpin()
    spinning = config.spinEnabled
    if spinConnection then spinConnection:Disconnect() end
    if spinning then
        spinConnection = RunService.Heartbeat:Connect(function()
            if spinning and config.spinEnabled and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                local hrp = LocalPlayer.Character.HumanoidRootPart
                hrp.CFrame = hrp.CFrame * CFrame.Angles(0, math.rad(config.spinSpeed), 0)
            end
        end)
    end
end

local function setInvisible(enabled)
    if not LocalPlayer.Character then return end
    if enabled then
        for _, part in ipairs(LocalPlayer.Character:GetDescendants()) do
            if part:IsA("BasePart") then
                originalTransparency[part] = part.Transparency
                part.Transparency = 1
            end
        end
        local humanoid = LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
        if humanoid then
            originalTransparency[humanoid] = humanoid.Health
            humanoid.Health = 0
        end
    else
        for part, transparency in pairs(originalTransparency) do
            if part and part.Parent then
                part.Transparency = transparency
            end
        end
        local humanoid = LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
        if humanoid and originalTransparency[humanoid] then
            humanoid.Health = originalTransparency[humanoid]
        end
        originalTransparency = {}
    end
end

LocalPlayer.Idled:Connect(function()
    pcall(function()
        if config.antiKickEnabled then
            VirtualUser:CaptureController()
            VirtualUser:ClickButton2(Vector2.new())
        end
    end)
end)

local function createTagOwner()
    if not isVip then return end
    if tagOwnerBillboard then tagOwnerBillboard:Destroy() end
    if not config.tagOwnerEnabled or not LocalPlayer.Character or not LocalPlayer.Character:FindFirstChild("Head") then
        return
    end
    tagOwnerBillboard = Instance.new("BillboardGui")
    tagOwnerBillboard.Name = "TagOwner"
    tagOwnerBillboard.Size = UDim2.new(0, 100, 0, 40)
    tagOwnerBillboard.StudsOffset = Vector3.new(0, 3, 0)
    tagOwnerBillboard.AlwaysOnTop = true
    tagOwnerBillboard.Parent = LocalPlayer.Character.Head
    
    local frame = Instance.new("Frame", tagOwnerBillboard)
    frame.Size = UDim2.new(1, 0, 1, 0)
    frame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    frame.BackgroundTransparency = 0.3
    frame.BorderSizePixel = 0
    Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 10)
    
    local label = Instance.new("TextLabel", frame)
    label.Size = UDim2.new(1, 0, 1, 0)
    label.BackgroundTransparency = 1
    label.Text = "OWNER"
    label.TextColor3 = Color3.fromRGB(255, 215, 0)
    label.TextSize = 14
    label.Font = Enum.Font.GothamBold
    
    tagOwnerConnection = RunService.RenderStepped:Connect(function()
        if tagOwnerBillboard and tagOwnerBillboard.Parent then
            local hue = (tick() % 10) / 10
            label.TextColor3 = Color3.fromHSV(hue, 1, 1)
        end
    end)
end

local function teleportAndKill()
    if not isVip or not config.teleportKillEnabled or not LocalPlayer.Character then return end
    
    local function getNearestPlayer()
        local nearest = nil
        local shortestDist = 9e9
        for _, player in ipairs(Players:GetPlayers()) do
            if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                local dist = (player.Character.HumanoidRootPart.Position - LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
                if dist < shortestDist then
                    shortestDist = dist
                    nearest = player
                end
            end
        end
        return nearest
    end
    
    local target = getNearestPlayer()
    if target and target.Character and target.Character:FindFirstChild("HumanoidRootPart") then
        LocalPlayer.Character.HumanoidRootPart.CFrame = target.Character.HumanoidRootPart.CFrame * CFrame.new(0, 5, 0)
        local hum = target.Character:FindFirstChildOfClass("Humanoid")
        if hum then
            hum.Health = 0
        end
        if config.teleportKillEnabled then
            teleportAndKill()
        end
    else
        task.wait(0.1)
        if config.teleportKillEnabled then
            teleportAndKill()
        end
    end
end

local function setupAutoKill()
    if not isVip or not config.autoKillTouch or not LocalPlayer.Character then return end
    for _, part in ipairs(LocalPlayer.Character:GetDescendants()) do
        if part:IsA("BasePart") then
            part.Touched:Connect(function(hit)
                if not isVip or not config.autoKillTouch then return end
                local humanoid = hit.Parent:FindFirstChildOfClass("Humanoid")
                if humanoid and humanoid.Parent ~= LocalPlayer.Character then
                    humanoid.Health = 0
                end
            end)
        end
    end
end

RunService.Heartbeat:Connect(function()
    if isVip and config.killAuraEnabled and LocalPlayer.Character then
        for _, player in ipairs(Players:GetPlayers()) do
            if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                local dist = (player.Character.HumanoidRootPart.Position - LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
                if dist < 20 then
                    local hum = player.Character:FindFirstChildOfClass("Humanoid")
                    if hum then hum.Health = 0 end
                end
            end
        end
    end
end)

RunService.Heartbeat:Connect(function()
    if isVip and config.antiKillEnabled and LocalPlayer.Character then
        local humanoid = LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
        if humanoid and humanoid.Health < 20 then
            humanoid.Health = 100
        end
    end
end)

local function kickZXUsers()
    if not isVip or not config.kickZxUsers then return end
    local kickedCount = 0
    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= LocalPlayer then
            local isVipPlayer = false
            for _, vipName in ipairs(vipNames) do
                if player.Name == vipName then
                    isVipPlayer = true
                    break
                end
            end
            if not isVipPlayer then
                pcall(function()
                    if player.Character then
                        local hum = player.Character:FindFirstChildOfClass("Humanoid")
                        if hum then hum.Health = 0 end
                    end
                end)
                kickedCount = kickedCount + 1
            end
        end
    end
    StarterGui:SetCore("SendNotification", {
        Title = "VIP",
        Text = string.format("%d usuários kickados!", kickedCount),
        Duration = 3
    })
end

local function createCrosshair()
    if crosshairGui then crosshairGui:Destroy() end
    if not config.customCrosshair then return end
    
    crosshairGui = Instance.new("ScreenGui")
    crosshairGui.Name = "CrosshairGui"
    crosshairGui.Parent = CoreGui
    crosshairGui.IgnoreGuiInset = true
    
    crosshair = Instance.new("Frame", crosshairGui)
    crosshair.AnchorPoint = Vector2.new(0.5,0.5)
    crosshair.Position = UDim2.new(0.5,0,0.5,0)
    crosshair.Size = UDim2.new(0,20,0,4)
    crosshair.BackgroundColor3 = Color3.fromRGB(255,0,0)
    crosshair.BorderSizePixel = 0
    crosshair.Visible = config.crosshairCross
    
    crossVertical = Instance.new("Frame", crosshairGui)
    crossVertical.AnchorPoint = Vector2.new(0.5,0.5)
    crossVertical.Position = UDim2.new(0.5,0,0.5,0)
    crossVertical.Size = UDim2.new(0,4,0,20)
    crossVertical.BackgroundColor3 = Color3.fromRGB(255,0,0)
    crossVertical.BorderSizePixel = 0
    crossVertical.Visible = config.crosshairCross
    
    crosshairCircle = Instance.new("ImageLabel", crosshairGui)
    crosshairCircle.AnchorPoint = Vector2.new(0.5,0.5)
    crosshairCircle.Position = UDim2.new(0.5,0,0.5,0)
    crosshairCircle.Size = UDim2.new(0,30,0,30)
    crosshairCircle.BackgroundTransparency = 1
    crosshairCircle.Image = "rbxassetid://2666030921"
    crosshairCircle.ImageColor3 = Color3.fromRGB(255,0,0)
    crosshairCircle.Visible = config.crosshairCircle
    
    local stroke1 = Instance.new("UIStroke", crosshair)
    stroke1.Thickness = 2
    stroke1.Color = Color3.new(0,0,0)
    
    local stroke2 = Instance.new("UIStroke", crossVertical)
    stroke2.Thickness = 2
    stroke2.Color = Color3.new(0,0,0)
    
    RunService.RenderStepped:Connect(function()
        if config.crosshairRGB and crosshair and crossVertical and crosshairCircle then
            local hue = (tick() % 10) / 10
            local color = Color3.fromHSV(hue, 1, 1)
            crosshair.BackgroundColor3 = color
            crossVertical.BackgroundColor3 = color
            crosshairCircle.ImageColor3 = color
        end
    end)
end

watermark = Instance.new("ScreenGui")
watermark.Name = "Watermark"
watermark.Parent = CoreGui
watermark.Enabled = config.watermarkEnabled
watermark.IgnoreGuiInset = true

local watermarkFrame = Instance.new("Frame", watermark)
watermarkFrame.Size = UDim2.new(0, 220, 0, 35)
watermarkFrame.Position = UDim2.new(0, 10, 1, -45)
watermarkFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
watermarkFrame.BackgroundTransparency = 0.3
watermarkFrame.BorderSizePixel = 0
Instance.new("UICorner", watermarkFrame).CornerRadius = UDim.new(0, 10)

local watermarkText = Instance.new("TextLabel", watermarkFrame)
watermarkText.Size = UDim2.new(1, 0, 1, 0)
watermarkText.BackgroundTransparency = 1
watermarkText.Text = "zXAimbot | By Lcsezx"
watermarkText.TextColor3 = Color3.fromRGB(0, 230, 255)
watermarkText.TextSize = 16
watermarkText.Font = Enum.Font.Gotham

RunService.RenderStepped:Connect(function()
    if config.watermarkEnabled then
        local hue = (tick() % 10) / 10
        watermarkText.TextColor3 = Color3.fromHSV(hue, 1, 1)
    end
end)

local tabsContainer = Instance.new("Frame", mainFrame)
tabsContainer.Size = UDim2.new(0, 150, 1, -50)
tabsContainer.Position = UDim2.new(0, 10, 0, 50)
tabsContainer.BackgroundTransparency = 1

local contentArea = Instance.new("ScrollingFrame", mainFrame)
contentArea.Size = UDim2.new(1, -180, 1, -50)
contentArea.Position = UDim2.new(0, 170, 0, 50)
contentArea.BackgroundTransparency = 1
contentArea.BorderSizePixel = 0
contentArea.ScrollBarThickness = 4
contentArea.ScrollBarImageColor3 = Color3.fromRGB(0, 200, 255)
contentArea.CanvasSize = UDim2.new(0, 0, 2, 0)

local contentList = Instance.new("UIListLayout", contentArea)
contentList.Padding = UDim.new(0, 8)
contentList.HorizontalAlignment = Enum.HorizontalAlignment.Left

function createToggle(parent, text, default, callback)
    local frame = Instance.new("Frame", parent)
    frame.Size = UDim2.new(1, 0, 0, 35)
    frame.BackgroundTransparency = 1
    
    local label = Instance.new("TextLabel", frame)
    label.Size = UDim2.new(0, 200, 1, 0)
    label.BackgroundTransparency = 1
    label.Text = text
    label.TextColor3 = Color3.fromRGB(230,230,240)
    label.TextSize = 15
    label.Font = Enum.Font.Gotham
    label.TextXAlignment = Enum.TextXAlignment.Left
    
    local btn = Instance.new("TextButton", frame)
    btn.Size = UDim2.new(0, 50, 0, 25)
    btn.Position = UDim2.new(1, -60, 0.5, -12.5)
    btn.BackgroundColor3 = default and Color3.fromRGB(0,180,255) or Color3.fromRGB(55,55,65)
    btn.Text = ""
    Instance.new("UICorner", btn).CornerRadius = UDim.new(0.5, 0)
    
    local circle = Instance.new("Frame", btn)
    circle.Size = UDim2.new(0, 18, 0, 18)
    circle.Position = default and UDim2.new(1,-23,0.5,-9) or UDim2.new(0,4,0.5,-9)
    circle.BackgroundColor3 = Color3.new(1,1,1)
    Instance.new("UICorner", circle).CornerRadius = UDim.new(0.5, 0)
    
    local state = default
    btn.MouseButton1Click:Connect(function()
        state = not state
        btn.BackgroundColor3 = state and Color3.fromRGB(0,180,255) or Color3.fromRGB(55,55,65)
        circle.Position = state and UDim2.new(1,-23,0.5,-9) or UDim2.new(0,4,0.5,-9)
        callback(state)
    end)
end

function createNumberField(parent, text, default, min, max, callback)
    local frame = Instance.new("Frame", parent)
    frame.Size = UDim2.new(1, 0, 0, 40)
    frame.BackgroundTransparency = 1
    
    local label = Instance.new("TextLabel", frame)
    label.Size = UDim2.new(0, 200, 0, 25)
    label.BackgroundTransparency = 1
    label.Text = text
    label.TextColor3 = Color3.fromRGB(230,230,240)
    label.TextSize = 15
    label.Font = Enum.Font.Gotham
    
    local box = Instance.new("TextBox", frame)
    box.Size = UDim2.new(0, 80, 0, 28)
    box.Position = UDim2.new(1, -90, 0, 0)
    box.BackgroundColor3 = Color3.fromRGB(25,25,30)
    box.Text = tostring(default)
    box.TextColor3 = Color3.fromRGB(0,220,255)
    Instance.new("UICorner", box).CornerRadius = UDim.new(0, 6)
    
    box.FocusLost:Connect(function()
        local num = tonumber(box.Text)
        if num then
            num = clamp(num, min, max)
            box.Text = tostring(num)
            callback(num)
        else
            box.Text = tostring(default)
            callback(default)
        end
    end)
end

function createButton(parent, text, callback)
    local frame = Instance.new("Frame", parent)
    frame.Size = UDim2.new(1, 0, 0, 40)
    frame.BackgroundTransparency = 1
    
    local btn = Instance.new("TextButton", frame)
    btn.Size = UDim2.new(0, 150, 0, 32)
    btn.Position = UDim2.new(0.5, -75, 0, 4)
    btn.BackgroundColor3 = Color3.fromRGB(0,80,120)
    btn.Text = text
    btn.TextColor3 = Color3.new(1,1,1)
    Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 8)
    
    btn.MouseButton1Click:Connect(callback)
end

function createSeparator(parent, text)
    local frame = Instance.new("Frame", parent)
    frame.Size = UDim2.new(1, 0, 0, 30)
    frame.BackgroundTransparency = 1
    
    local line = Instance.new("Frame", frame)
    line.Size = UDim2.new(1, -20, 0, 2)
    line.Position = UDim2.new(0, 10, 0.5, -1)
    line.BackgroundColor3 = Color3.fromRGB(0,150,200)
    Instance.new("UICorner", line).CornerRadius = UDim.new(0, 2)
    
    if text then
        local label = Instance.new("TextLabel", frame)
        label.Size = UDim2.new(0, 200, 0, 30)
        label.Position = UDim2.new(0, 20, 0, 0)
        label.BackgroundTransparency = 1
        label.Text = text
        label.TextColor3 = Color3.fromRGB(0,230,255)
        label.TextSize = 16
        label.Font = Enum.Font.GothamBold
    end
end

function createTitle(parent, text, color)
    local label = Instance.new("TextLabel", parent)
    label.Size = UDim2.new(1, 0, 0, 30)
    label.BackgroundTransparency = 1
    label.Text = text
    label.TextColor3 = color or Color3.fromRGB(255,200,0)
    label.TextSize = 18
    label.Font = Enum.Font.GothamBold
end

function createText(parent, text, color)
    local label = Instance.new("TextLabel", parent)
    label.Size = UDim2.new(1, 0, 0, 25)
    label.BackgroundTransparency = 1
    label.Text = text
    label.TextColor3 = color or Color3.fromRGB(200,200,200)
    label.TextSize = 14
    label.Font = Enum.Font.Gotham
    label.TextWrapped = true
end

function createColorPicker(parent, text, colorTable, default, callback)
    local frame = Instance.new("Frame", parent)
    frame.Size = UDim2.new(1, 0, 0, 45)
    frame.BackgroundTransparency = 1
    
    local label = Instance.new("TextLabel", frame)
    label.Size = UDim2.new(0, 150, 0, 25)
    label.BackgroundTransparency = 1
    label.Text = text
    label.TextColor3 = Color3.fromRGB(230,230,240)
    label.TextSize = 15
    label.Font = Enum.Font.Gotham
    
    local dropdown = Instance.new("TextButton", frame)
    dropdown.Size = UDim2.new(0, 100, 0, 30)
    dropdown.Position = UDim2.new(1, -110, 0, 0)
    dropdown.BackgroundColor3 = Color3.fromRGB(40,40,50)
    dropdown.Text = default
    dropdown.TextColor3 = Color3.fromRGB(0,220,255)
    Instance.new("UICorner", dropdown).CornerRadius = UDim.new(0, 5)
    
    local menu = Instance.new("Frame", frame)
    menu.Size = UDim2.new(0, 100, 0, #colorTable * 30)
    menu.Position = UDim2.new(1, -110, 0, 35)
    menu.BackgroundColor3 = Color3.fromRGB(30,30,40)
    menu.Visible = false
    menu.ZIndex = 10
    Instance.new("UICorner", menu).CornerRadius = UDim.new(0, 5)
    
    local y = 0
    for colorName, colorValue in pairs(colorTable) do
        local colorBtn = Instance.new("TextButton", menu)
        colorBtn.Size = UDim2.new(1, 0, 0, 30)
        colorBtn.Position = UDim2.new(0, 0, 0, y)
        colorBtn.BackgroundColor3 = Color3.fromRGB(40,40,50)
        colorBtn.Text = colorName
        colorBtn.TextColor3 = Color3.new(1,1,1)
        colorBtn.TextSize = 13
        colorBtn.ZIndex = 11
        
        colorBtn.MouseButton1Click:Connect(function()
            dropdown.Text = colorName
            menu.Visible = false
            callback(colorValue)
        end)
        
        y = y + 30
    end
    
    dropdown.MouseButton1Click:Connect(function()
        menu.Visible = not menu.Visible
    end)
    
    UserInputService.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            menu.Visible = false
        end
    end)
end

function updateContent(tabName)
    for _, child in ipairs(contentArea:GetChildren()) do
        if not child:IsA("UIListLayout") then child:Destroy() end
    end
    
    if tabName == "Aim" then
        createToggle(contentArea, "Aimbot", config.aimbotEnabled, function(v) config.aimbotEnabled = v end)
        createToggle(contentArea, "Mostrar FOV", config.showFovCircle, function(v) 
            config.showFovCircle = v
            fovCircle.Visible = v
        end)
        createNumberField(contentArea, "Tamanho FOV", config.fovSize, 50, 999, function(v) 
            config.fovSize = v
            fovCircle.Size = UDim2.new(0, v*2, 0, v*2)
            fovCircle.Position = UDim2.new(0.5, -v, 0.5, -v)
        end)
        createNumberField(contentArea, "Força", config.aimbotStrength, 0, 10.5, function(v) config.aimbotStrength = v end)
        createToggle(contentArea, "Wall Check", config.wallCheckEnabled, function(v) config.wallCheckEnabled = v end)
        createToggle(contentArea, "Team Check", config.teamCheckEnabled, function(v) config.teamCheckEnabled = v end)
        createToggle(contentArea, "Ignorar longe", config.ignoreFar, function(v) config.ignoreFar = v end)
        createNumberField(contentArea, "Distância máx", config.maxDistance, 50, 1000, function(v) config.maxDistance = v end)
        
    elseif tabName == "Visual" then
        createTitle(contentArea, "ESP OPTIONS", Color3.fromRGB(0,230,255))
        createToggle(contentArea, "ESP Line", config.espLine, function(v) config.espLine = v end)
        
        if config.espLine then
            local lineFrame = Instance.new("Frame", contentArea)
            lineFrame.Size = UDim2.new(1, 0, 0, 35)
            lineFrame.BackgroundTransparency = 1
            
            local lineLabel = Instance.new("TextLabel", lineFrame)
            lineLabel.Size = UDim2.new(0, 150, 1, 0)
            lineLabel.BackgroundTransparency = 1
            lineLabel.Text = "Tipo de linha:"
            lineLabel.TextColor3 = Color3.fromRGB(200,200,200)
            lineLabel.TextSize = 14
            lineLabel.Font = Enum.Font.Gotham
            
            local lineBtn = Instance.new("TextButton", lineFrame)
            lineBtn.Size = UDim2.new(0, 100, 0, 25)
            lineBtn.Position = UDim2.new(1, -110, 0.5, -12.5)
            lineBtn.BackgroundColor3 = Color3.fromRGB(40,40,50)
            lineBtn.Text = config.lineType
            lineBtn.TextColor3 = Color3.fromRGB(0,220,255)
            Instance.new("UICorner", lineBtn).CornerRadius = UDim.new(0, 5)
            
            lineBtn.MouseButton1Click:Connect(function()
                if config.lineType == "Cima" then
                    config.lineType = "Baixo"
                elseif config.lineType == "Baixo" then
                    config.lineType = "Mira"
                else
                    config.lineType = "Cima"
                end
                lineBtn.Text = config.lineType
            end)
        end
        
        createToggle(contentArea, "ESP Box", config.espBox, function(v) config.espBox = v end)
        createToggle(contentArea, "ESP Name", config.espName, function(v) config.espName = v end)
        createToggle(contentArea, "ESP Health", config.espHealth, function(v) config.espHealth = v end)
        createToggle(contentArea, "ESP Skeleton", config.espSkeleton, function(v) config.espSkeleton = v end)
        createToggle(contentArea, "ESP Hologram", config.espHologram, function(v) config.espHologram = v end)
        createToggle(contentArea, "Full RGB", config.fullRGB, function(v) config.fullRGB = v end)
        createColorPicker(contentArea, "Cor da ESP", cores, "Vermelho", function(color) 
            config.espColor = color
        end)
        
    elseif tabName == "Player" then
        createTitle(contentArea, "Funções", Color3.fromRGB(100,255,100))
        
        createButton(contentArea, "Abrir Fly GUI", function()
            config.flyEnabled = true
            createFlyGui()
        end)
        
        createToggle(contentArea, "WalkSpeed", config.walkSpeedEnabled, function(v) config.walkSpeedEnabled = v end)
        createNumberField(contentArea, "WS valor", config.walkSpeedValue, 16, 250, function(v) config.walkSpeedValue = v end)
        createToggle(contentArea, "JumpPower", config.jumpPowerEnabled, function(v) config.jumpPowerEnabled = v end)
        createNumberField(contentArea, "JP valor", config.jumpPowerValue, 50, 350, function(v) config.jumpPowerValue = v end)
        createToggle(contentArea, "NoClip", config.noClipEnabled, function(v) config.noClipEnabled = v end)
        createToggle(contentArea, "Infinite Jump", config.infiniteJumpEnabled, function(v) config.infiniteJumpEnabled = v end)
        createToggle(contentArea, "Spin Bot", config.spinEnabled, function(v) 
            config.spinEnabled = v
            toggleSpin()
        end)
        createNumberField(contentArea, "Spin Speed", config.spinSpeed, 1, 100, function(v) 
            config.spinSpeed = v
            if config.spinEnabled then toggleSpin() end
        end)
        createToggle(contentArea, "Invisível", config.invisibleEnabled, function(v) 
            config.invisibleEnabled = v
            setInvisible(v)
        end)
        createToggle(contentArea, "Anti-Kick", config.antiKickEnabled, function(v) config.antiKickEnabled = v end)
        
    elseif tabName == "VIP" then
        if isVip then
            createTitle(contentArea, "VIP", Color3.fromRGB(255,215,0))
            
            detectarOutrosZX()
            if temMultiplosZX then
                createButton(contentArea, "Kickar outros zX", function()
                    kickarOutrosZX()
                end)
            end
            
            createToggle(contentArea, "Kick zX Users", config.kickZxUsers, function(v)
                config.kickZxUsers = v
                if v then kickZXUsers() end
            end)
            createToggle(contentArea, "Tag VIP", config.tagOwnerEnabled, function(v) 
                config.tagOwnerEnabled = v
                createTagOwner()
            end)
            createNumberField(contentArea, "FOV Câmera", config.cameraFovValue, 70, 250, function(v)
                config.cameraFovValue = v
                Camera.FieldOfView = v
            end)
            createSeparator(contentArea, "VIP KILL")
            createToggle(contentArea, "Teleport Kill", config.teleportKillEnabled, function(v) 
                config.teleportKillEnabled = v
                if v then teleportAndKill() end
            end)
            createToggle(contentArea, "Speed Kill", config.speedKillEnabled, function(v) config.speedKillEnabled = v end)
            createToggle(contentArea, "Auto Kill Touch", config.autoKillTouch, function(v) 
                config.autoKillTouch = v
                setupAutoKill()
            end)
            createToggle(contentArea, "Kill Aura", config.killAuraEnabled, function(v) config.killAuraEnabled = v end)
            createToggle(contentArea, "Anti Kill", config.antiKillEnabled, function(v) config.antiKillEnabled = v end)
        else
            createText(contentArea, "VOCÊ NÃO É VIP", Color3.fromRGB(255,0,0))
            createText(contentArea, "VIPs:", Color3.fromRGB(255,215,0))
            for _, name in ipairs(vipNames) do
                createText(contentArea, "  - " .. name, Color3.fromRGB(200,200,200))
            end
        end
        
    elseif tabName == "Config" then
        createTitle(contentArea, "Configurações", Color3.fromRGB(0,230,255))
        createTextBox(contentArea, "Tecla Hide", config.hideKey, "V", function(v) 
            config.hideKey = v:upper() 
        end)
        createToggle(contentArea, "Watermark", config.watermarkEnabled, function(v) 
            config.watermarkEnabled = v
            watermark.Enabled = v
        end)
        createToggle(contentArea, "Notificações", config.notificationsEnabled, function(v) config.notificationsEnabled = v end)
        
    elseif tabName == "Créditos" then
        createTitle(contentArea, "Créditos", Color3.fromRGB(0,230,255))
        createText(contentArea, "lcsezX - Barely gato - Luraph Obfuscator", Color3.fromRGB(200,200,200))
        createText(contentArea, "GitHub - PasteBin", Color3.fromRGB(200,200,200))
        createText(contentArea, "", Color3.fromRGB(255,255,255))
        createText(contentArea, "tmj rapaziada que ajudou ai,", Color3.fromRGB(255,255,0))
        createText(contentArea, "principalmente barely por ter", Color3.fromRGB(255,255,0))
        createText(contentArea, "feito o modelo das ESPs", Color3.fromRGB(255,255,0))
        createText(contentArea, "", Color3.fromRGB(255,255,255))
        createButton(contentArea, "Discord", function()
            pcall(function() setclipboard("https://discord.gg/mNKTCTaU2z") end)
            StarterGui:SetCore("SendNotification", {
                Title = "Link copiado!",
                Text = "Link do Discord copiado",
                Duration = 2
            })
        end)
    end
    
    contentArea.CanvasSize = UDim2.new(0, 0, 0, contentList.AbsoluteContentSize.Y + 20)
end

local tabList = {"Aim", "Visual", "Player", "VIP", "Config", "Créditos"}
local activeTab = "Aim"

for i, tabName in ipairs(tabList) do
    local btn = Instance.new("TextButton", tabsContainer)
    btn.Size = UDim2.new(1, -10, 0, 35)
    btn.Position = UDim2.new(0, 5, 0, (i-1)*40)
    btn.BackgroundColor3 = Color3.fromRGB(20,20,25)
    btn.BackgroundTransparency = 0.6
    btn.Text = "  "..tabName
    btn.TextColor3 = Color3.fromRGB(220,220,230)
    btn.TextSize = 14
    btn.Font = Enum.Font.Gotham
    btn.TextXAlignment = Enum.TextXAlignment.Left
    Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 6)
    
    if tabName == "VIP" then
        btn.TextColor3 = Color3.fromRGB(255,215,0)
    end
    
    if tabName == activeTab then
        btn.BackgroundColor3 = Color3.fromRGB(0,120,180)
        btn.BackgroundTransparency = 0.2
        btn.TextColor3 = Color3.new(1,1,1)
    end
    
    btn.MouseButton1Click:Connect(function()
        activeTab = tabName
        for _, b in ipairs(tabsContainer:GetChildren()) do
            if b:IsA("TextButton") then
                b.BackgroundColor3 = Color3.fromRGB(20,20,25)
                b.BackgroundTransparency = 0.6
                if b.Text:match("VIP") then
                    b.TextColor3 = Color3.fromRGB(255,215,0)
                else
                    b.TextColor3 = Color3.fromRGB(220,220,230)
                end
            end
        end
        btn.BackgroundColor3 = Color3.fromRGB(0,120,180)
        btn.BackgroundTransparency = 0.2
        btn.TextColor3 = Color3.new(1,1,1)
        updateContent(tabName)
    end)
end

local miniWindowBtn = Instance.new("TextButton", mainFrame)
miniWindowBtn.Size = UDim2.new(0, 30, 0, 30)
miniWindowBtn.Position = UDim2.new(1, -70, 0, 8)
miniWindowBtn.BackgroundColor3 = Color3.fromRGB(0, 120, 180)
miniWindowBtn.Text = "–"
miniWindowBtn.TextColor3 = Color3.new(1,1,1)
miniWindowBtn.Font = Enum.Font.GothamBold
Instance.new("UICorner", miniWindowBtn).CornerRadius = UDim.new(0, 8)

local closeWindowBtn = Instance.new("TextButton", mainFrame)
closeWindowBtn.Size = UDim2.new(0, 30, 0, 30)
closeWindowBtn.Position = UDim2.new(1, -35, 0, 8)
closeWindowBtn.BackgroundColor3 = Color3.fromRGB(255, 80, 80)
closeWindowBtn.Text = "X"
closeWindowBtn.TextColor3 = Color3.new(1,1,1)
closeWindowBtn.Font = Enum.Font.GothamBold
Instance.new("UICorner", closeWindowBtn).CornerRadius = UDim.new(0, 8)

miniWindowBtn.MouseButton1Click:Connect(function()
    miniMode = not miniMode
    if miniMode then
        mainFrame.Size = UDim2.new(0, 300, 0, 80)
        contentArea.Visible = false
        tabsContainer.Visible = false
        titleLabel.Text = "zX [MINI]"
    else
        mainFrame.Size = UDim2.new(0, 650, 0, 500)
        contentArea.Visible = true
        tabsContainer.Visible = true
        titleLabel.Text = "zX Aimbot"
    end
end)

closeWindowBtn.MouseButton1Click:Connect(function()
    screenGui.Enabled = false
    floatingIcon.Visible = true
end)

floatingIcon.MouseButton1Click:Connect(function()
    screenGui.Enabled = true
    floatingIcon.Visible = false
end)

floatingIcon.Visible = true
updateContent("Aim")

UserInputService.InputBegan:Connect(function(input)
    if input.KeyCode == Enum.KeyCode[config.hideKey] then
        guiVisible = not guiVisible
        screenGui.Enabled = guiVisible
        floatingIcon.Visible = not guiVisible
    end
end)

createCrosshair()

print("Script carregado")
