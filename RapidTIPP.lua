local Rapid = Instance.new("ScreenGui")
local Grabber = Instance.new("Frame")
local ScrollFrame = Instance.new("ScrollingFrame")
local Refresh = Instance.new("TextButton")
local TopBar = Instance.new("Frame")
local Close = Instance.new("TextButton")
local Info = Instance.new("TextLabel")

Rapid.Name = "Rapid"
Rapid.Parent = game.CoreGui
Rapid.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Grabber.Name = "Grabber"
Grabber.Parent = Rapid
Grabber.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Grabber.BackgroundTransparency = 1.000
Grabber.BorderSizePixel = 0
Grabber.Position = UDim2.new(0.5, -283, 0.5, -223)
Grabber.Size = UDim2.new(0, 567, 0, 400)
Grabber.Draggable = true
Grabber.Active = true


ScrollFrame.Name = "ScrollFrame"
ScrollFrame.Parent = Grabber
ScrollFrame.Active = true
ScrollFrame.BackgroundColor3 = Color3.fromRGB(36, 36, 36)
ScrollFrame.BorderSizePixel = 0
ScrollFrame.Position = UDim2.new(0, 0, 0.0577777773, 0)
ScrollFrame.Size = UDim2.new(0, 567, 0, 374)
ScrollFrame.ScrollBarThickness = 8

Refresh.Name = "Refresh"
Refresh.Parent = Grabber
Refresh.BackgroundColor3 = Color3.fromRGB(17, 17, 17)
Refresh.BorderSizePixel = 0
Refresh.Position = UDim2.new(1, -130, 1, -44)
Refresh.Size = UDim2.new(0, 130, 0, 40)
Refresh.Style = Enum.ButtonStyle.RobloxButton
Refresh.Font = Enum.Font.Ubuntu
Refresh.Text = "Refresh Information"
Refresh.TextColor3 = Color3.fromRGB(209, 209, 209)
Refresh.TextSize = 12.000

TopBar.Name = "TopBar"
TopBar.Parent = Grabber
TopBar.BackgroundColor3 = Color3.fromRGB(17, 17, 17)
TopBar.BorderSizePixel = 0
TopBar.Position = UDim2.new(0.5, -283, 0, 0)
TopBar.Size = UDim2.new(0, 567, 0, 25)

Close.Name = "Close"
Close.Parent = TopBar
Close.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Close.BackgroundTransparency = 1.000
Close.Position = UDim2.new(1, -20, 0.5, -10)
Close.Size = UDim2.new(0, 20, 0, 20)
Close.Font = Enum.Font.SourceSans
Close.Text = "X"
Close.TextColor3 = Color3.fromRGB(255, 255, 255)
Close.TextSize = 14.000

Info.Name = "Info"
Info.Parent = TopBar
Info.BackgroundColor3 = Color3.fromRGB(17, 17, 17)
Info.BackgroundTransparency = 1.000
Info.BorderSizePixel = 0
Info.Position = UDim2.new(0, 0, 0.5, -12)
Info.Size = UDim2.new(0, 416, 0, 25)
Info.Font = Enum.Font.Ubuntu
Info.Text = "Rapid 'TouchInterest' and 'ProximityPrompt' Grabber | Made By: 7e57"
Info.TextColor3 = Color3.fromRGB(209, 209, 209)
Info.TextSize = 13.000

-- Close GUI
Close.MouseButton1Click:Connect(function()
    if Rapid.Enabled == true then
	    Rapid:Destroy()
    end
end)

-- Function to print the TouchInterest and ProximityPrompt instances
local function PrintTouchAndPrompt()
	local objects = {}

	-- Collecting TouchInterest instances
	for _, part in ipairs(game:GetService("Workspace"):GetDescendants()) do
		if part:IsA("BasePart") and part:IsA("TouchTransmitter") then
			table.insert(objects, part)
		end
	end

	-- Collecting ProximityPrompt instances
	for _, prompt in ipairs(game:GetService("Workspace"):GetDescendants()) do
		if prompt:IsA("ProximityPrompt") then
			table.insert(objects, prompt)
		end
	end
	
	-- Printing the objects in the ScrollFrame
	for _, object in ipairs(objects) do
		local textLabel = Instance.new("TextLabel")
		textLabel.Size = UDim2.new(1, 0, 0, 20)
        textLabel.Font = Enum.Font.Ubuntu
		textLabel.Position = UDim2.new(0, 0, 0, #ScrollFrame:GetChildren() * 20)
		textLabel.BackgroundColor3 = Color3.new(0.17, 0.17, 0.17)
        textLabel.BorderColor3 = Color3.new(0, 0, 0)
		textLabel.TextColor3 = Color3.new(0.90, 0.90, 0.90)
		textLabel.Font = Enum.Font.SourceSans
		textLabel.TextSize = 14
		textLabel.Text = object.ClassName.."   |   "..object:GetFullName()
		textLabel.Parent = ScrollFrame
	end
end
	
-- Call the function initially and set up a button to refresh the list
PrintTouchAndPrompt()
	
Refresh.MouseButton1Click:Connect(function()
	-- Clear the existing list and print the updated list
	for _, child in ipairs(ScrollFrame:GetChildren()) do
		if child:IsA("TextLabel") then
			child:Destroy()
		end
	end
	PrintTouchAndPrompt()
end)
