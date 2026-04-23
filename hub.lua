-- CRIMSON HUB (FINAL COMPLETO)

local UIS = game:GetService("UserInputService")

local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local TopBar = Instance.new("TextButton")
local Scroll = Instance.new("ScrollingFrame")
local UIListLayout = Instance.new("UIListLayout")

ScreenGui.Parent = game.CoreGui

-- 🔴 BOLINHA
local Circle = Instance.new("ImageButton")
Circle.Parent = ScreenGui
Circle.Size = UDim2.new(0,50,0,50)
Circle.Position = UDim2.new(0.1,0,0.2,0)
Circle.BackgroundColor3 = Color3.fromRGB(25,25,25)
Circle.Image = "rbxassetid://96002544221425"
Circle.Visible = false

local CircleCorner = Instance.new("UICorner")
CircleCorner.CornerRadius = UDim.new(1,0)
CircleCorner.Parent = Circle

-- Frame principal
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(15,15,15)
MainFrame.Position = UDim2.new(0.1,0,0.2,0)
MainFrame.Size = UDim2.new(0,250,0,300)

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0,10)
MainCorner.Parent = MainFrame

-- Topo
TopBar.Parent = MainFrame
TopBar.BackgroundColor3 = Color3.fromRGB(25,25,25)
TopBar.Size = UDim2.new(1,0,0,30)
TopBar.Text = "CRIMSON HUB"
TopBar.TextColor3 = Color3.fromRGB(255,255,255)

local TopCorner = Instance.new("UICorner")
TopCorner.CornerRadius = UDim.new(0,10)
TopCorner.Parent = TopBar

-- Scroll
Scroll.Parent = MainFrame
Scroll.Position = UDim2.new(0,0,0,30)
Scroll.Size = UDim2.new(1,0,1,-30)
Scroll.BackgroundTransparency = 1
Scroll.ScrollBarThickness = 4

UIListLayout.Parent = Scroll
UIListLayout.Padding = UDim.new(0,5)

UIListLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
Scroll.CanvasSize = UDim2.new(0,0,0,UIListLayout.AbsoluteContentSize.Y + 10)
end)

-- DRAG HUB
local dragging = false
local dragInput, dragStart, startPos

local function update(input)
local delta = input.Position - dragStart
MainFrame.Position = UDim2.new(
startPos.X.Scale,
startPos.X.Offset + delta.X,
startPos.Y.Scale,
startPos.Y.Offset + delta.Y
)
end

TopBar.InputBegan:Connect(function(input)
if input.UserInputType == Enum.UserInputType.MouseButton1
or input.UserInputType == Enum.UserInputType.Touch then

dragging = true  
	dragStart = input.Position  
	startPos = MainFrame.Position  

	input.Changed:Connect(function()  
		if input.UserInputState == Enum.UserInputState.End then  
			dragging = false  
		end  
	end)  
end

end)

TopBar.InputChanged:Connect(function(input)
if input.UserInputType == Enum.UserInputType.MouseMovement
or input.UserInputType == Enum.UserInputType.Touch then
dragInput = input
end
end)

UIS.InputChanged:Connect(function(input)
if input == dragInput and dragging then
update(input)
end
end)

-- DRAG BOLINHA
local draggingCircle = false
local dragStartCircle, startPosCircle

Circle.InputBegan:Connect(function(input)
if input.UserInputType == Enum.UserInputType.MouseButton1
or input.UserInputType == Enum.UserInputType.Touch then

draggingCircle = true  
	dragStartCircle = input.Position  
	startPosCircle = Circle.Position  

	input.Changed:Connect(function()  
		if input.UserInputState == Enum.UserInputState.End then  
			draggingCircle = false  
		end  
	end)  
end

end)

UIS.InputChanged:Connect(function(input)
if draggingCircle then
local delta = input.Position - dragStartCircle
Circle.Position = UDim2.new(
startPosCircle.X.Scale,
startPosCircle.X.Offset + delta.X,
startPosCircle.Y.Scale,
startPosCircle.Y.Offset + delta.Y
)
end
end)

-- BOTÕES
local function criarBotao(nome, callback)
local Button = Instance.new("TextButton")
Button.Parent = Scroll
Button.Size = UDim2.new(1, -5, 0, 40)
Button.BackgroundColor3 = Color3.fromRGB(35,35,35)
Button.Text = nome
Button.TextColor3 = Color3.fromRGB(255,255,255)

local Corner = Instance.new("UICorner")  
Corner.CornerRadius = UDim.new(0,8)  
Corner.Parent = Button  

Button.MouseButton1Click:Connect(callback)

end

-- TOGGLE (bolinha)
local aberto = true

TopBar.MouseButton1Click:Connect(function()
aberto = not aberto

if aberto then  
	MainFrame.Visible = true  
	Circle.Visible = false  
else  
	MainFrame.Visible = false  
	Circle.Visible = true  
end

end)

Circle.MouseButton1Click:Connect(function()
MainFrame.Visible = true
Circle.Visible = false
aberto = true
end)

-- =========================
-- TEUS SCRIPTS
-- =========================

criarBotao("🏠 Break In Story", function()
loadstring(game:HttpGet("https://pastebin.com/raw/JCWALTth"))()
end)

criarBotao("🕊️ Fly GUI", function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/XNEOFF/FlyGuiV3/main/FlyGuiV3.txt"))()
end)

-- 🔥 HITBOX (FINAL)
local hitboxAtivo = false

criarBotao("🎯 Hitbox", function()
hitboxAtivo = not hitboxAtivo
_G.Disabled = hitboxAtivo

if hitboxAtivo then  
	_G.HeadSize = 20  
	  
	game:GetService("RunService").RenderStepped:Connect(function()  
		if _G.Disabled then  
			for i,v in next, game:GetService("Players"):GetPlayers() do  
				if v.Name ~= game:GetService("Players").LocalPlayer.Name then  
					pcall(function()  
						v.Character.HumanoidRootPart.Size = Vector3.new(_G.HeadSize,_G.HeadSize,_G.HeadSize)  
						v.Character.HumanoidRootPart.Transparency = 0.7  
						v.Character.HumanoidRootPart.BrickColor = BrickColor.new("Really black")  
						v.Character.HumanoidRootPart.Material = "Neon"  
						v.Character.HumanoidRootPart.CanCollide = false  
					end)  
				end  
			end  
		end  
	end)  
end

end)

Esse e meu hub
