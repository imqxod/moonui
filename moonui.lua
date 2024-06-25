local MoonUI = {}

function MoonUI:Notify(text)
	local existingGui = game.Players.LocalPlayer.PlayerGui:FindFirstChild("NotificationLib")
	if existingGui then
		existingGui:Destroy()
	end

	local screenGui = Instance.new("ScreenGui")
	screenGui.Name = "NotificationLib"
	screenGui.Parent = game.Players.LocalPlayer.PlayerGui

	local notification = Instance.new("Frame")
	notification.Name = "Notification"
	notification.AnchorPoint = Vector2.new(1, 0)
	notification.BackgroundColor3 = Color3.fromRGB(3, 134, 235)
	notification.BorderColor3 = Color3.fromRGB(0, 0, 0)
	notification.BorderSizePixel = 0
	notification.Position = UDim2.new(1, 10, 0, 10)
	notification.Size = UDim2.new(0, 305, 0, 97)
	notification.ZIndex = 10
	notification.Parent = screenGui

	local outline = Instance.new("Frame")
	outline.Name = "Outline"
	outline.BackgroundColor3 = Color3.fromRGB(65, 65, 65)
	outline.BorderColor3 = Color3.fromRGB(0, 0, 0)
	outline.BorderSizePixel = 0
	outline.Position = UDim2.new(0, 5, 0, 5)
	outline.Size = UDim2.new(0, 295, 0, 87)
	outline.Parent = notification

	local textLabel = Instance.new("TextLabel")
	textLabel.Name = "TextLabel"
	textLabel.BackgroundTransparency = 1
	textLabel.Font = Enum.Font.SourceSans
	textLabel.Text = text or "Notification"
	textLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
	textLabel.TextSize = 24
	textLabel.Size = UDim2.new(1, 0, 1, 0)
	textLabel.Parent = outline

	local function slideIn()
		notification:TweenPosition(UDim2.new(1, -315, 0, 10), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.3, true)
	end

	local function slideOut()
		notification:TweenPosition(UDim2.new(1, 10, 0, 10), Enum.EasingDirection.In, Enum.EasingStyle.Quad, 0.3, true, function()
			screenGui:Destroy()
		end)
	end

	slideIn()

	wait(3)
	slideOut()
end

return MoonUI
