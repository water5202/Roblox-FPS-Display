-- script made by water.5202

local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")
local StarterGui = game:GetService("StarterGui")
local GuiService = game:GetService("GuiService")

local PLAYER = Players.LocalPlayer
local PLAYERGUI = PLAYER:WaitForChild("PlayerGui")

local frameCount = 0
local elapsedTime = 0
local highestFPS = 0
local t = 0
local var = nil

-- UI ELEMENTS
local UI = Instance.new("ScreenGui")
UI.Name = "55 49"
UI.Parent = PLAYERGUI
UI.ResetOnSpawn = false

local LABEL = Instance.new("TextLabel")
LABEL.Name = "54 45 58 54 20 4c 41 42 45 4c"
LABEL.BackgroundColor3 = Color3.new(0.211765, 0.192157, 0.223529)
LABEL.Parent = UI
LABEL.Size = UDim2.new(0, 130, 0, 60)
LABEL.Position = UDim2.new(0, 0, 0, 0)
LABEL.BackgroundTransparency = 0
LABEL.Font = Enum.Font.RobotoMono
LABEL.TextScaled = true
LABEL.Text = "nul/nul"
LABEL.TextColor3 = Color3.new(255, 255, 255)
LABEL.Active = true
LABEL.Draggable = true

local UICORNER = Instance.new("UICorner")
UICORNER.Name = "55 49 43 75 72 65 6e 6f 72"
UICORNER.Parent = LABEL
UICORNER.CornerRadius = UDim.new(0, 10)

local textSizeConstraint = Instance.new("UITextSizeConstraint")
textSizeConstraint.Name = "74 65 78 74 53 69 7a 65 43 6f 6e 73 74 72 61 69 6e 74"
textSizeConstraint.Parent = LABEL
textSizeConstraint.MaxTextSize = 18
textSizeConstraint.MinTextSize = 16

--
UIS.InputBegan:Connect(function(input, gameProcessedEvent)
	if not gameProcessedEvent then
		if input.KeyCode == Enum.KeyCode.LeftBracket then
			LABEL.Visible = not LABEL.Visible
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
		else
			LABEL.TextColor3 = Color3.fromRGB(255, 255, 255)
		end
		wait(0.0001)
	end
end)

-- Notifications
StarterGui:SetCore("SendNotification", {
	Title = "water.5202",
	Text = "thanks for using the script!",
	Duration = 5,
})

StarterGui:SetCore("SendNotification", {
	Title = "water.5202",
	Text = "Toggling UI does not work on mobile!",
	Duration = 5,
})
