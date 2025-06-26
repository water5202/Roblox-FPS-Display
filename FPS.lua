-- script made by water.5202
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")
local StarterGui = game:GetService("StarterGui")
local TweenService = game:GetService("TweenService")
local PLAYER = Players.LocalPlayer
local PLAYERGUI = PLAYER:WaitForChild("PlayerGui")

local frameCount = 0
local elapsedTime = 0
local highestFPS = 0
local t = 0
local var = true

-- UI ELEMENTS
local UI = Instance.new("ScreenGui")
UI.Name = "55 49"
UI.Parent = PLAYERGUI
UI.ResetOnSpawn = false

local LABEL = Instance.new("TextButton")
LABEL.Name = "54 45 58 54 20 4c 41 42 45 4c"
LABEL.BackgroundColor3 = Color3.new(0.211765, 0.192157, 0.223529)
LABEL.Parent = UI
LABEL.Size = UDim2.new(0, 130, 0, 60)
LABEL.Position = UDim2.new(0, 150, 0, 100)
LABEL.BackgroundTransparency = 0
LABEL.Font = Enum.Font.RobotoMono
LABEL.TextScaled = true
LABEL.Text = "nul/nul"
LABEL.TextColor3 = Color3.new(255, 255, 255)
LABEL.AutoButtonColor = false

local toolbar = Instance.new("Frame")
toolbar.Name = "54 45 58 54 20 4c 41 42 45 4c 01"
toolbar.Parent = LABEL
toolbar.Size = UDim2.new(0, 150, 0, 25)
toolbar.Position = UDim2.new(0, 120, 0, -15)
toolbar.BackgroundColor3 = Color3.new(0.211765, 0.192157, 0.223529)
toolbar.Visible = false
toolbar.Transparency = 0.5

local close = Instance.new("TextButton")
close.Name = "54 45 58 54 20 4c 41 42 45 4c 02"
close.Parent = toolbar
close.Text = "X"
close.TextColor3 = Color3.new(255, 255, 255)
close.Size = UDim2.new(0, 15, 0, 15)
close.BackgroundTransparency = 1
close.Position = UDim2.new(0, 130, 0, 5)
close.Visible = false

local RGB = Instance.new("TextButton")
RGB.Name = "54 45 58 54 20 4c 41 42 45 4c 03"
RGB.Parent = toolbar
RGB.Text = "R"
RGB.TextColor3 = Color3.new(255, 255, 255)
RGB.Size = UDim2.new(0, 15, 0, 15)
RGB.BackgroundTransparency = 1
RGB.Position = UDim2.new(0, 110, 0, 5)
RGB.Visible = false

------------------------------------ exclude this in studio
local IY = Instance.new("TextButton")
IY.Name = "54 45 58 54 20 4c 41 42 45 4c 04"
IY.Parent = toolbar
IY.Text = "IY"
IY.TextColor3 = Color3.fromRGB(245, 99, 66)
IY.Size = UDim2.new(0, 15, 0, 15)
IY.BackgroundTransparency = 1
IY.Position = UDim2.new(0, 90, 0, 5)
IY.Visible = false
------------------------------------
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

		fade(close, 0, 1.5)
		fade(RGB, 0, 1.5)
		fade(IY, 0, 1.5)
	else
		fade(close, 1, 0.3)
		fade(RGB, 1, 0.3)
		fade(IY, 1, 0.3)

		local closeTween = TweenService:Create(toolbar, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
			Size = UDim2.new(0, 0, 0, 25)
		})
		closeTween:Play()

		closeTween.Completed:Connect(function()
			toolbar.Visible = false
			close.Visible = false
			RGB.Visible = false
			IY.Visible = false
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
-----------------------------
close.MouseButton1Click:Connect(function()
	UI:Destroy()
end)

RGB.MouseButton1Click:Connect(function()
	var = not var
end)

IY.MouseButton1Click:Connect(function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
end)

local UICORNER = Instance.new("UICorner")
UICORNER.Name = "55 49 43 75 72 65 6e 6f 72"
UICORNER.Parent = LABEL
UICORNER.CornerRadius = UDim.new(0, 10)

local UICORNER2 = Instance.new("UICorner")
UICORNER2.Name = "55 49 43 75 72 65 6e 6f 72 1"
UICORNER2.Parent = toolbar
UICORNER2.CornerRadius = UDim.new(0, 10)

local textSizeConstraint = Instance.new("UITextSizeConstraint")
textSizeConstraint.Name = "74 65 78 74 53 69 7a 65 43 6f 6e 73 74 72 61 69 6e 74"
textSizeConstraint.Parent = LABEL
textSizeConstraint.MaxTextSize = 18
textSizeConstraint.MinTextSize = 16

UIS.InputBegan:Connect(function(input, gameProcessedEvent)
	if not gameProcessedEvent then
		if input.KeyCode == Enum.KeyCode.LeftBracket then
			if LABEL.Visible then
				local tween = TweenService:Create(LABEL, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
					BackgroundTransparency = 1,
					TextTransparency = 1,
				})
				tween:Play()
				tween.Completed:Connect(function()
					LABEL.Visible = false
					LABEL.BackgroundTransparency = 0
					LABEL.TextTransparency = 0
				end)
			else
				LABEL.BackgroundTransparency = 1
				LABEL.TextTransparency = 1
				LABEL.Visible = true
				local tween = TweenService:Create(LABEL, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
					BackgroundTransparency = 0,
					TextTransparency = 0,
				})
				tween:Play()
			end
		end
	end
end)

-- Toggle RGB effect with Insert key
UIS.InputBegan:Connect(function(input, gameProcessedEvent)
	if not gameProcessedEvent then
		if input.KeyCode == Enum.KeyCode.Insert then
			var = not var
		end
	end
end)

-- FPS Counter
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

-- RGB color animation loop
spawn(function()
	while true do
		if var == true then
			t = t + 0.1
			local r = math.sin(t) * 127 + 128
			local g = math.sin(t + 2) * 127 + 128
			local b = math.sin(t + 4) * 127 + 128
			LABEL.TextColor3 = Color3.fromRGB(r, g, b)
			RGB.TextColor3 = Color3.fromRGB(r, g, b)
		else
			LABEL.TextColor3 = Color3.fromRGB(255, 255, 255)
			RGB.TextColor3 = Color3.fromRGB(255, 255, 255)
		end
		wait(0.0001)
	end
end)
-- drag

-- Notifications
StarterGui:SetCore("SendNotification", {
	Title = "water.5202",
	Text = "thanks for using the script!",
	Duration = 5,
})

StarterGui:SetCore("SendNotification", {
	Title = "water.5202",
	Text = "Toggling UI or RGB does not work on mobile!",
	Duration = 5,
})
StarterGui:SetCore("SendNotification", {
	Title = "water.5202",
	Text = "Press Insert to toggle RGB and [ for UI!",
	Duration = 5,
})
