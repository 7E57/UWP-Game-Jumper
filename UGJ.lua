local ScreenGui = Instance.new("ScreenGui", game.CoreGui)
local Frame = Instance.new("Frame")
local TextBox = Instance.new("TextBox")
local ImageButton = Instance.new("ImageButton")
local TextButton = Instance.new("TextButton")

ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Frame.Parent = ScreenGui
Frame.BackgroundColor3 = Color3.fromRGB(43, 43, 43)
Frame.BorderSizePixel = 0
Frame.Position = UDim2.new(0, -317, 1, -62)
Frame.Size = UDim2.new(0, 363, 0, 55)

TextBox.Parent = Frame
TextBox.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
TextBox.BorderColor3 = Color3.fromRGB(53, 53, 53)
TextBox.BorderSizePixel = 0
TextBox.Position = UDim2.new(0, 5, 0.5, -17)
TextBox.Size = UDim2.new(0, 200, 0, 35)
TextBox.Font = Enum.Font.SourceSans
TextBox.PlaceholderColor3 = Color3.fromRGB(207, 207, 207)
TextBox.PlaceholderText = "Simplx In-Game UGC Sniper"
TextBox.Text = "Paste The Full URL Link"
TextBox.TextColor3 = Color3.fromRGB(207, 207, 207)
TextBox.TextScaled = true
TextBox.TextSize = 13.000
TextBox.TextStrokeColor3 = Color3.fromRGB(207, 207, 207)
TextBox.TextWrapped = true

ImageButton.Parent = Frame
ImageButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ImageButton.BackgroundTransparency = 1.000
ImageButton.Position = UDim2.new(1, -43, 0.5, -19)
ImageButton.Size = UDim2.new(0, 38, 0, 38)
ImageButton.Image = "rbxassetid://12941020168"

TextButton.Parent = Frame
TextButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
TextButton.BorderSizePixel = 0
TextButton.Position = UDim2.new(0, 213, 0, 11)
TextButton.Size = UDim2.new(0, 102, 0, 35)
TextButton.Font = Enum.Font.SourceSans
TextButton.Text = "Click to Join"
TextButton.TextColor3 = Color3.fromRGB(207, 207, 207)
TextButton.TextSize = 14.000
TextButton.TextStrokeColor3 = Color3.fromRGB(207, 207, 207)

local on = false
ImageButton.MouseButton1Click:Connect(function()
	if on == false then
	    Frame:TweenPosition(UDim2.new(0, 7,1, -62),"Out","Quad",0.5)
		on = true
	elseif on == true then
		Frame:TweenPosition(UDim2.new(0, -317,1, -62),"In","Quad",0.5)
		on = false
	end
end)

TextButton.MouseButton1Click:Connect(function()
	local Players = game:GetService("Players")
	local User = Players.LocalPlayer
	local TeleportService = game:GetService("TeleportService")
	
	local function getPlaceIDFromURL(url)
		local placeID = string.match(url, "roblox.com/games/(%d+)/")
		return placeID
	end
	
	local url = TextBox.Text
	local placeID = getPlaceIDFromURL(url)
	
	TeleportService:Teleport(placeID, User)
end)
