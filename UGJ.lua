local mewt = Instance.new("ScreenGui", game.CoreGui)
local teleportFrame = Instance.new("Frame")
local teleportText = Instance.new("TextBox")
local teleportImage = Instance.new("ImageButton")
local teleportTextButton = Instance.new("TextButton")
local itemFrame = Instance.new("Frame")
local itemText = Instance.new("TextBox")
local itemImage = Instance.new("ImageButton")
local itemTextButton = Instance.new("TextButton")

mewt.Name = "mewt"
mewt.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

teleportFrame.Name = "teleportFrame"
teleportFrame.Parent = mewt
teleportFrame.BackgroundColor3 = Color3.fromRGB(43, 43, 43)
teleportFrame.Position = UDim2.new(0, -317, 1, -125)
teleportFrame.Size = UDim2.new(0, 363, 0, 55)

teleportText.Name = "teleportText"
teleportText.Parent = teleportFrame
teleportText.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
teleportText.BorderColor3 = Color3.fromRGB(53, 53, 53)
teleportText.BorderSizePixel = 0
teleportText.Position = UDim2.new(0, 5, 0.5, -17)
teleportText.Size = UDim2.new(0, 200, 0, 35)
teleportText.Font = Enum.Font.SourceSans
teleportText.PlaceholderColor3 = Color3.fromRGB(207, 207, 207)
teleportText.PlaceholderText = "Mewt In-Game UGC Sniper"
teleportText.Text = "Paste the 'game' URL"
teleportText.TextColor3 = Color3.fromRGB(207, 207, 207)
teleportText.TextScaled = true
teleportText.TextSize = 13.000
teleportText.TextStrokeColor3 = Color3.fromRGB(207, 207, 207)
teleportText.TextWrapped = true

teleportImage.Name = "teleportImage"
teleportImage.Parent = teleportFrame
teleportImage.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
teleportImage.BackgroundTransparency = 1.000
teleportImage.Position = UDim2.new(1, -43, 0.5, -19)
teleportImage.Size = UDim2.new(0, 38, 0, 38)
teleportImage.Image = "rbxassetid://12941020168"

teleportTextButton.Name = "teleportTextButton"
teleportTextButton.Parent = teleportFrame
teleportTextButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
teleportTextButton.BorderSizePixel = 0
teleportTextButton.Position = UDim2.new(0, 213, 0, 11)
teleportTextButton.Size = UDim2.new(0, 102, 0, 35)
teleportTextButton.Font = Enum.Font.SourceSans
teleportTextButton.Text = "Click to Join"
teleportTextButton.TextColor3 = Color3.fromRGB(207, 207, 207)
teleportTextButton.TextSize = 16.000
teleportTextButton.TextStrokeColor3 = Color3.fromRGB(207, 207, 207)

itemFrame.Name = "itemFrame"
itemFrame.Parent = mewt
itemFrame.BackgroundColor3 = Color3.fromRGB(43, 43, 43)
itemFrame.Position = UDim2.new(0, -317, 1, -62)
itemFrame.Size = UDim2.new(0, 363, 0, 55)

itemText.Name = "itemText"
itemText.Parent = itemFrame
itemText.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
itemText.BorderColor3 = Color3.fromRGB(53, 53, 53)
itemText.BorderSizePixel = 0
itemText.Position = UDim2.new(0, 5, 0.5, -17)
itemText.Size = UDim2.new(0, 200, 0, 35)
itemText.Font = Enum.Font.SourceSans
itemText.PlaceholderColor3 = Color3.fromRGB(207, 207, 207)
itemText.PlaceholderText = "Made By: Caleb N' Ash#5117"
itemText.Text = "Paste the 'item' URL"
itemText.TextColor3 = Color3.fromRGB(207, 207, 207)
itemText.TextScaled = true
itemText.TextSize = 13.000
itemText.TextStrokeColor3 = Color3.fromRGB(207, 207, 207)
itemText.TextWrapped = true

itemImage.Name = "itemImage"
itemImage.Parent = itemFrame
itemImage.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
itemImage.BackgroundTransparency = 1.000
itemImage.Position = UDim2.new(0.975699365, -43, 0.0487859547, -19)
itemImage.Rotation = 315.000
itemImage.Size = UDim2.new(0, 59, 0, 88)
itemImage.Image = "rbxassetid://3033751341"

itemTextButton.Name = "itemTextButton"
itemTextButton.Parent = itemFrame
itemTextButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
itemTextButton.BorderSizePixel = 0
itemTextButton.Position = UDim2.new(0, 213, 0, 11)
itemTextButton.Size = UDim2.new(0, 102, 0, 35)
itemTextButton.Font = Enum.Font.SourceSans
itemTextButton.Text = "Click to Buy"
itemTextButton.TextColor3 = Color3.fromRGB(207, 207, 207)
itemTextButton.TextSize = 16.000
itemTextButton.TextStrokeColor3 = Color3.fromRGB(207, 207, 207)

local teleport = false
teleportImage.MouseButton1Click:Connect(function()
	if teleport == false then
		teleportFrame:TweenPosition(UDim2.new(0, 7,1, -125),"Out","Quad",0.5)
		teleport = true
	elseif teleport == true then
		teleportFrame:TweenPosition(UDim2.new(0, -317,1, -125),"In","Quad",0.5)
		teleport = false
	end
end)

local item = false
itemImage.MouseButton1Click:Connect(function()
	if item == false then
		itemFrame:TweenPosition(UDim2.new(0, 7,1, -62),"Out","Quad",0.5)
		item = true
	elseif item == true then
		itemFrame:TweenPosition(UDim2.new(0, -317,1, -62),"In","Quad",0.5)
		item = false
	end
end)

teleportTextButton.MouseButton1Click:Connect(function()
	local player = game:GetService("Players").LocalPlayer
	local TeleportService = game:GetService("TeleportService")

	local function getPlaceIDFromURL(url)
		local placeID = string.match(url, "roblox.com/games/(%d+)/")
		return placeID
	end

	local url = teleportText.Text
	local placeID = getPlaceIDFromURL(url)

	TeleportService:Teleport(placeID, player)
end)

itemTextButton.MouseButton1Click:Connect(function()
	local player = game:GetService("Players").LocalPlayer
	local market = game:GetService("MarketplaceService")
	local vim = game:GetService("VirtualInputManager")

	local function getItemIDFromURL(url)
		local itemID = string.match(url, "roblox.com/catalog/(%d+)/")
		return itemID
	end

	local url = itemText.Text
	local itemID = getItemIDFromURL(url)

	market:PromptPurchase(player, itemID) task.wait(5.75)
	for i = 2,0,-1 do
		vim:SendMouseButtonEvent(1055,600, 0, true, game, 0)
		vim:SendMouseButtonEvent(1055,600, 0, false, game, 0)
		task.wait(0.25)
	end
end)
