if not game:IsLoaded() then
    game.Loaded:Wait()
end

local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")
local StarterGui = game:GetService("StarterGui")
local TweenService = game:GetService("TweenService")
local CoreGUI = game:GetService("CoreGui")
local frameCount = 0
local elapsedTime = 0
local direction = 1
local highestFPS = 0
local rainbowT = 0
local lerpT = 0
local var = false
local espval = false
local localPlayer = Players.LocalPlayer

if CoreGUI:FindFirstChild("53637265656e4775690d0a") then
    StarterGui:SetCore("SendNotification", {
        Title = "Interface",
        Text = "script already loaded",
        Duration = 5,
    })
	return
else
end

local UI = Instance.new("ScreenGui")
UI.Name = "53637265656e4775690d0a"
UI.Parent = CoreGUI
UI.ResetOnSpawn = false

local version = Instance.new("IntValue")
version.Name = "version"
version.Value = 102
print(version.Value)

local UITOGGLE = Instance.new("TextButton")
UITOGGLE.Name = "&#85;&#73;&#84;&#79;&#71;&#71;&#76;&#69;"
UITOGGLE.Parent = UI
UITOGGLE.Text = "Toggle UI"
UITOGGLE.TextColor3 = Color3.new(255, 255, 255)
UITOGGLE.Size = UDim2.new(0, 110, 0, 50)
UITOGGLE.Position = UDim2.new(0, 9, 0, 127)
UITOGGLE.BackgroundColor3 = Color3.new(0.211765, 0.192157, 0.223529)
UITOGGLE.AutoButtonColor = false
UITOGGLE.Font = Enum.Font.RobotoMono

local LABEL = Instance.new("TextButton")
LABEL.Name = "54657874427574746f6e"
LABEL.BackgroundColor3 = Color3.new(0.211765, 0.192157, 0.223529)
LABEL.Parent = UI
LABEL.Size = UDim2.new(0, 130, 0, 60)
LABEL.Position = UDim2.new(0, 150, 0, 100)
LABEL.Font = Enum.Font.RobotoMono
LABEL.TextScaled = true
LABEL.Text = "placeholder"
LABEL.TextColor3 = Color3.new(255, 255, 255)
LABEL.AutoButtonColor = false

local toolbar = Instance.new("Frame")
toolbar.Name = "4672616d650d0a"
toolbar.Parent = LABEL
toolbar.Size = UDim2.new(0, 150, 0, 25)
toolbar.Position = UDim2.new(0, 128, 0, -10)
toolbar.BackgroundColor3 = Color3.new(0.211765, 0.192157, 0.223529)
toolbar.Visible = false
toolbar.Transparency = 0.5

local close = Instance.new("TextButton")
close.Name = "54657874427574746f6e 1"
close.Parent = toolbar
close.Text = "X"
close.TextColor3 = Color3.new(255, 255, 255)
close.Size = UDim2.new(0, 15, 0, 15)
close.BackgroundTransparency = 1
close.Position = UDim2.new(0, 130, 0, 5)
close.Visible = false
close.Font = Enum.Font.RobotoMono
close.TextScaled = true

local DragDetector = Instance.new("UIDragDetector")
DragDetector.Name = "44726167204465746563746f7"
DragDetector.Parent = LABEL

local RGB = Instance.new("TextButton")
RGB.Name = "54657874427574746f6e 3"
RGB.Parent = toolbar
RGB.Text = "R"
RGB.TextColor3 = Color3.new(255, 255, 255)
RGB.Size = UDim2.new(0, 15, 0, 15)
RGB.BackgroundTransparency = 1
RGB.Position = UDim2.new(0, 110, 0, 5)
RGB.Visible = false
RGB.Font = Enum.Font.RobotoMono
RGB.TextScaled = true

local IY = Instance.new("TextButton")
IY.Name = "54657874427574746f6e 2"
IY.Parent = toolbar
IY.Text = "IY"
IY.TextColor3 = Color3.fromRGB(245, 99, 66)
IY.Size = UDim2.new(0, 15, 0, 15)
IY.BackgroundTransparency = 1
IY.Position = UDim2.new(0, 90, 0, 5)
IY.Visible = false
IY.Font = Enum.Font.RobotoMono
IY.TextScaled = true

local ESP = Instance.new("TextButton")
ESP.Name = "54657874427574746f6e 4"
ESP.Parent = toolbar
ESP.Text = "ESP"
ESP.TextColor3 = Color3.new(255, 255, 255)
ESP.Size = UDim2.new(0, 15, 0, 15)
ESP.BackgroundTransparency = 1
ESP.Position = UDim2.new(0, 65, 0, 5)
ESP.Visible = false
ESP.Font = Enum.Font.RobotoMono
ESP.TextScaled = true

function toggleToolbar()
	local function fade(object, targetTransparency, duration)
		if object and object:IsA("TextButton") then
			TweenService:Create(object, TweenInfo.new(duration, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
				TextTransparency = targetTransparency
			}):Play()
		end
	end

	if not toolbar.Visible then
		toolbar.Size = UDim2.new(0, 0, 0, 25)
		toolbar.Visible = true

		local openTween = TweenService:Create(toolbar, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
			Size = UDim2.new(0, 150, 0, 25)
		})
		openTween:Play()

		close.Visible = true
		RGB.Visible = true
		IY.Visible = true
                ESP.Visible = true
		fade(close, 0, 1.5)
		fade(RGB, 0, 1.5)
		fade(IY, 0, 1.5)
		fade(ESP, 0, 1.5)
	else
		fade(close, 1, 0.3)
		fade(RGB, 1, 0.3)
		fade(IY, 1, 0.3)
		fade(ESP, 1, 0.3)
		local closeTween = TweenService:Create(toolbar, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
			Size = UDim2.new(0, 0, 0, 25)
		})
		closeTween:Play()

		closeTween.Completed:Connect(function()
			toolbar.Visible = false
			close.Visible = false
			RGB.Visible = false
			IY.Visible = false
			ESP.Visible = false
			anim = false
		end)
	end
end

LABEL.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton2 then
		toggleToolbar()
	elseif input.UserInputType == Enum.UserInputType.Touch then
		toggleToolbar()
	end
end)

close.MouseButton1Click:Connect(function()
	if toolbar.Visible then	
	toggleToolbar()
	end
	toggleLabelVisibility()
	wait(0.9)
	UI:Destroy()
end)

RGB.MouseButton1Click:Connect(function()
	var = not var
end)

IY.MouseButton1Click:Connect(function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
end)

ESP.MouseButton1Click:Connect(function()
espval = not espval 
end)

local UICORNER1 = Instance.new("UICorner")
UICORNER1.Name = "5549436f726e6572 1"
UICORNER1.Parent = LABEL
UICORNER1.CornerRadius = UDim.new(0, 10)

local UICORNER2 = Instance.new("UICorner")
UICORNER2.Name = "5549436f726e6572 2"
UICORNER2.Parent = toolbar
UICORNER2.CornerRadius = UDim.new(0, 10)

local UICORNER3 = Instance.new("UICorner")
UICORNER3.Name = "5549436f726e6572 3"
UICORNER3.Parent = UITOGGLE
UICORNER3.CornerRadius = UDim.new(0, 10)

local textSizeConstraint1 = Instance.new("UITextSizeConstraint")
textSizeConstraint1.Name = "55495465787453697a65436f6e73747261696e74 1"
textSizeConstraint1.Parent = LABEL
textSizeConstraint1.MaxTextSize = 18
textSizeConstraint1.MinTextSize = 16

local textSizeConstraint2 = Instance.new("UITextSizeConstraint")
textSizeConstraint2.Name = "55495465787453697a65436f6e73747261696e74 2"
textSizeConstraint2.Parent = UITOGGLE
textSizeConstraint2.MaxTextSize = 18
textSizeConstraint2.MinTextSize = 16

local textSizeConstraint3 = Instance.new("UITextSizeConstraint")
textSizeConstraint3.Name = "55495465787453697a65436f6e73747261696e74 3"
textSizeConstraint3.Parent = close
textSizeConstraint3.MaxTextSize = 18
textSizeConstraint3.MinTextSize = 16

local textSizeConstraint4 = Instance.new("UITextSizeConstraint")
textSizeConstraint4.Name = "55495465787453697a65436f6e73747261696e74 3"
textSizeConstraint4.Parent = RGB
textSizeConstraint4.MaxTextSize = 18
textSizeConstraint4.MinTextSize = 16

local textSizeConstraint5 = Instance.new("UITextSizeConstraint")
textSizeConstraint5.Name = "55495465787453697a65436f6e73747261696e74 3"
textSizeConstraint5.Parent = ESP
textSizeConstraint5.MaxTextSize = 18
textSizeConstraint5.MinTextSize = 16

local textSizeConstraint6 = Instance.new("UITextSizeConstraint")
textSizeConstraint6.Name = "55495465787453697a65436f6e73747261696e74 3"
textSizeConstraint6.Parent = IY
textSizeConstraint6.MaxTextSize = 18
textSizeConstraint6.MinTextSize = 16

spawn(function()
    while true do
        task.wait(0.1)
        if espval then
            for _, player in pairs(Players:GetPlayers()) do
                if player ~= localPlayer then
                    local character = player.Character
                    if character and not character:FindFirstChild("ESP") then
                        local highlight = Instance.new("Highlight")
                        highlight.Name = "ESP"
                        highlight.Adornee = character
                        highlight.FillTransparency = 1
                        highlight.OutlineColor = Color3.new(1, 1, 1)
                        highlight.Parent = character
                    end
                end
            end
        else
            for _, player in pairs(Players:GetPlayers()) do
                local character = player.Character
                if character then
                    local highlight = character:FindFirstChild("ESP")
                    if highlight then
                        highlight:Destroy()
                    end
                end
            end
        end
    end
end)
		
local isVisible = true
local originalSize = LABEL.Size

function toggleLabelVisibility()
	if isVisible then
		LABEL.TextTransparency = 1

		local shrinkHoriz = TweenService:Create(LABEL, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {
			Size = UDim2.new(0, originalSize.X.Offset * 0.05, originalSize.Y.Scale, originalSize.Y.Offset)
		})
		shrinkHoriz:Play()
		shrinkHoriz.Completed:Wait()

		local shrinkVert = TweenService:Create(LABEL, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {
			Size = UDim2.new(0, originalSize.X.Offset * 0.05, 0, 0)
		})
		shrinkVert:Play()
		shrinkVert.Completed:Wait()

		LABEL.Visible = false
		isVisible = false
	else
		LABEL.Visible = true

		local growVert = TweenService:Create(LABEL, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {
			Size = UDim2.new(0, originalSize.X.Offset * 0.05, originalSize.Y.Scale, originalSize.Y.Offset)
		})
		growVert:Play()
		growVert.Completed:Wait()

		local growHoriz = TweenService:Create(LABEL, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {
			Size = originalSize
		})
		growHoriz:Play()
		growHoriz.Completed:Wait()

		LABEL.TextTransparency = 0
		isVisible = true
		anim = false
	end
end

UIS.InputBegan:Connect(function(input, gameProcessedEvent)
	if not gameProcessedEvent and input.KeyCode == Enum.KeyCode.LeftBracket then
if toolbar.Visible then
toggleToolbar()
end
toggleLabelVisibility()
end
end)

UITOGGLE.MouseButton1Click:Connect(function()
if toolbar.Visible then	
toggleToolbar()
end
toggleLabelVisibility()
end)

UIS.InputBegan:Connect(function(input, gameProcessedEvent)
	if not gameProcessedEvent then
		if input.KeyCode == Enum.KeyCode.RightBracket then
			var = not var
		end
	end
end)

RunService.RenderStepped:Connect(function(dt)
	frameCount += 1
	elapsedTime += dt

	if elapsedTime >= 1 then
		local currentFPS = math.floor(frameCount / elapsedTime)
		if currentFPS > highestFPS then
			highestFPS = currentFPS
		end
		LABEL.Text = tostring(currentFPS) .. " / " .. tostring(highestFPS)
		frameCount = 0
		elapsedTime = 0
	end
end)

spawn(function()
	while true do
		if var then
			rainbowT = rainbowT + 0.1
			local r = math.sin(rainbowT) * 127 + 128
			local g = math.sin(rainbowT + 2) * 127 + 128
			local b = math.sin(rainbowT + 4) * 127 + 128
			LABEL.TextColor3 = Color3.fromRGB(r, g, b)
			RGB.TextColor3 = Color3.fromRGB(r, g, b)
		else
			LABEL.TextColor3 = Color3.fromRGB(255, 255, 255)
			RGB.TextColor3 = Color3.fromRGB(255, 255, 255)
		end
		wait(0.05)
	end
end)

local reddishiy = Color3.fromRGB(245, 99, 66)
local whiteiy = Color3.fromRGB(255, 255, 255)

spawn(function()
	while true do
		lerpT = lerpT + direction * 0.1

		if lerpT >= 1 then
			lerpT = 1
			direction = -1
		elseif lerpT <= 0 then
			lerpT = 0
			direction = 1
		end

		local interpolated = reddishiy:lerp(whiteiy, lerpT)
		IY.TextColor3 = interpolated
		wait(0.1)
	end
end)

StarterGui:SetCore("SendNotification", {
	Title = "water.5202",
	Text = "thanks for using the script!",
	Duration = 5,
})

StarterGui:SetCore("SendNotification", {
	Title = "Interface",
	Text = "Press ] to toggle RGB and [ for UI!",
	Duration = 5,
})
