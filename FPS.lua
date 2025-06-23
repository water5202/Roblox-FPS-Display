-- script made by water.5202
if not game:IsLoaded()
    game.Loaded:Wait()
end
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local StarterGui = game:GetService("StarterGui")
local frameCount = 0
local elapsedTime = 0
local highestFPS = 0
local t = 0
local PLAYER = Players.LocalPlayer
local PLAYERGUI = PLAYER:WaitForChild("PlayerGui")
-- UI ELEMENTS
local UI = Instance.new("ScreenGui")
UI.Name = "55 49"
UI.Parent = PLAYERGUI
UI.ResetOnSpawn = false

local LABEL = Instance.new("TextLabel")
LABEL.Name = "54 45 58 54 20 4c 41 42 45 4c "
LABEL.Parent = UI
LABEL.Size = UDim2.new(0, 130, 0, 60)
LABEL.Position = UDim2.new(0, 0, 0, 0)
LABEL.BackgroundTransparency = 1
LABEL.Font = Enum.Font.Roboto
LABEL.TextScaled = true
LABEL.Text = "???/???"
LABEL.TextColor3 = Color3.new(0, 0, 0)
LABEL.Active = true
LABEL.Draggable = true

local textSizeConstraint = Instance.new("UITextSizeConstraint")
textSizeConstraint.Name =  "74 65 78 74 53 69 7a 65 43 6f 6e 73 74 72 61 69 6e 74"
textSizeConstraint.Parent = LABEL
textSizeConstraint.MaxTextSize = 18
textSizeConstraint.MinTextSize = 16

--
UserInputService.InputBegan:Connect(function(input, gameProcessedEvent)
	if not gameProcessedEvent then
		if input.KeyCode == Enum.KeyCode.LeftBracket then
			if not LABEL.Visible then
				LABEL.Visible = true
			else
				LABEL.Visible = false
			end
		end
	end
end)
--
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
--
while true do
	t = t + 0.1
	local r = math.sin(t) * 127 + 128
	local g = math.sin(t + 2) * 127 + 128
	local b = math.sin(t + 4) * 127 + 128
	LABEL.TextColor3 = Color3.fromRGB(r, g, b)
	wait(0.000000000000005)
end
--
StarterGui:SetCore("SendNotification", {
	Title = "water.5202";
	Text = "thanks for using the script!";
	Duration = 5;
})
--