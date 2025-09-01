local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Vcsk/UI-Library/main/Source/MyUILib(Unamed).lua"))();
local Window = Library:Create("🐷 Piggy Season 8 👑")

local function ShowNotification(title, text, duration)
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = title,
        Text = text,
        Duration = duration or 5
    })
end

local ToggleGui = Instance.new("ScreenGui")
local Toggle = Instance.new("TextButton")

ToggleGui.Name = "ToggleGui_HE"
ToggleGui.Parent = game.CoreGui

Toggle.Name = "Toggle"
Toggle.Parent = ToggleGui
Toggle.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Toggle.BackgroundTransparency = 0.660
Toggle.Position = UDim2.new(0, 0, 0.454706937, 0)
Toggle.Size = UDim2.new(0.0650164187, 0, 0.0888099447, 0)
Toggle.Font = Enum.Font.SourceSans
Toggle.Text = "Toggle"
Toggle.TextScaled = true
Toggle.TextColor3 = Color3.fromRGB(248, 248, 248)
Toggle.TextSize = 24.000
Toggle.TextXAlignment = Enum.TextXAlignment.Left
Toggle.Active = true
Toggle.Draggable = true
Toggle.MouseButton1Click:connect(function()
    Library:ToggleUI()
end)

local MainTab = Window:Tab("🏠 Main", "rbxassetid://10888331510")
local PlayerTab = Window:Tab("🏃‍♂️ Players", "rbxassetid://12296135476")
local VisualTab = Window:Tab("👁️ Visuals", "rbxassetid://12308581351")
local ExtraTab = Window:Tab("⚙️ Extra", "rbxassetid://7734042071")
local EventTab = Window:Tab("🎉 Events", "rbxassetid://12308581351")
local InfoTab = Window:Tab("ℹ️ Info", "rbxassetid://9405926389")

MainTab:Section("🔥 God Mode")
MainTab:InfoLabel("Prevents bots from killing you. ( BETA )")

MainTab:Toggle("Enable God Mode", function(state)
    _G.GodMode = state
end)

spawn(function()
    while wait(0.1) do
        pcall(function()
            local character = game.Players.LocalPlayer.Character
            if character then
                local isEnabled = _G.GodMode
                local canTouchValue = not isEnabled

                character.Head.CanTouch = canTouchValue
                character.UpperTorso.CanTouch = canTouchValue
                character.LowerTorso.CanTouch = canTouchValue
                character.LeftFoot.CanTouch = canTouchValue
                character.RightFoot.CanTouch = canTouchValue
                character.LeftHand.CanTouch = canTouchValue
                character.RightHand.CanTouch = canTouchValue
                character.LeftLowerArm.CanTouch = canTouchValue
                character.RightLowerArm.CanTouch = canTouchValue
                character.LeftUpperArm.CanTouch = canTouchValue
                character.RightUpperArm.CanTouch = canTouchValue
                character.LeftLowerLeg.CanTouch = canTouchValue
                character.RightLowerLeg.CanTouch = canTouchValue
                character.LeftUpperLeg.CanTouch = canTouchValue
                character.RightUpperLeg.CanTouch = canTouchValue
                
                character.HumanoidRootPart.CanTouch = true
            end
        end)
    end
end)

MainTab:Section("📦 Item GUI")
MainTab:Button("🎒 Item GUI (Book 1)", function()
local PiggyGui = Instance.new("ScreenGui")
PiggyGui.Name = "PiggyGui"
PiggyGui.Parent = game.CoreGui

local ScrollingFrame = Instance.new("ScrollingFrame", PiggyGui)
ScrollingFrame.BackgroundColor3 = Color3.new(0.15, 0.15, 0.15)
ScrollingFrame.Position = UDim2.new(0.18, 0, 0.42, 0)
ScrollingFrame.Size = UDim2.new(0, 300, 0, 400)
ScrollingFrame.Visible = false

local ToggleButton = Instance.new("TextButton", PiggyGui)
ToggleButton.Name = "ToggleButton"
ToggleButton.Size = UDim2.new(0, 50, 0, 50)
ToggleButton.Position = UDim2.new(0.85, 0,0.133, 0)
ToggleButton.Text = "IG"
ToggleButton.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
ToggleButton.TextColor3 = Color3.new(1, 1, 1)
ToggleButton.Active = true
ToggleButton.BorderSizePixel = 0
ToggleButton.BackgroundTransparency = 0.5
ToggleButton.ClipsDescendants = true

local draggingToggle
local dragInputToggle
local dragStartToggle
local startPosToggle

local function updateToggle(input)
    local delta = input.Position - dragStartToggle
    ToggleButton.Position = UDim2.new(startPosToggle.X.Scale, startPosToggle.X.Offset + delta.X, startPosToggle.Y.Scale, startPosToggle.Y.Offset + delta.Y)
end

ToggleButton.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        draggingToggle = true
        dragStartToggle = input.Position
        startPosToggle = ToggleButton.Position

        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                draggingToggle = false
            end
        end)
    end
end)

ToggleButton.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
        dragInputToggle = input
    end
end)

game:GetService("UserInputService").InputChanged:Connect(function(input)
    if input == dragInputToggle and draggingToggle then
        updateToggle(input)
    end
end)

ToggleButton.MouseButton1Click:Connect(function()
    ScrollingFrame.Visible = not ScrollingFrame.Visible
end)

local UIGridLayout = Instance.new("UIGridLayout", ScrollingFrame)
UIGridLayout.CellSize = UDim2.new(0, 90, 0, 90)

while wait(1) do
    if ScrollingFrame.Visible then
        local a = workspace:GetDescendants()
        local items = {}
        local itemframes = ScrollingFrame:GetChildren()

        for _, frame in ipairs(itemframes) do
            if frame.ClassName == "TextButton" then
                frame:Destroy()
            end
        end

        for _, obj in ipairs(a) do
            if obj.Name == "ItemPickupScript" and obj.Parent:FindFirstChild("ClickDetector") then
                table.insert(items, obj.Parent)
            end
        end

        for _, item in ipairs(items) do
            local ItemFrame = Instance.new("TextButton", ScrollingFrame)
            ItemFrame.Name = "ItemFrame"
            ItemFrame.BackgroundColor3 = Color3.new(1, 1, 1)
            ItemFrame.BackgroundTransparency = 0.95
            ItemFrame.Size = UDim2.new(0, 100, 0, 100)
            ItemFrame.Text = ""

            local View = Instance.new("ViewportFrame", ItemFrame)
            View.Name = "View"
            View.Size = UDim2.new(1, 0, 1, 0)
            View.BackgroundTransparency = 1
            View.BorderSizePixel = 0

            local viewportclone = item:Clone()
            viewportclone.Parent = View

            local cam = Instance.new("Camera", View)
            cam.CameraType = Enum.CameraType.Fixed
            local objectPosition = item.Position
            local cameraPosition = objectPosition + Vector3.new(0, 3, 0)
            cam.CFrame = CFrame.new(cameraPosition, objectPosition)
            View.CurrentCamera = cam

            ItemFrame.MouseButton1Down:Connect(function()
                if item:FindFirstChild("ClickDetector") then
                    local player = game.Players.LocalPlayer
                    local character = player.Character
                    if character and character:FindFirstChild("HumanoidRootPart") then
                        local cpos = character.HumanoidRootPart.CFrame
                        wait(0.05)
                        character.HumanoidRootPart.CFrame = item.CFrame
                        wait(0.1)
                        fireclickdetector(item.ClickDetector)
                        wait(0.3)
                        character.HumanoidRootPart.CFrame = cpos
                    end
                end
            end)
        end
    end
end
end)

MainTab:Button("✈️ Item GUI & Fly (Book 2)", function()
    loadstring(game:HttpGet("https://encurtador.com.br/fiyFJ"))();
end)

PlayerTab:TextBox("📲 TP to Player", function(name)
    pcall(function()
        if name == "" then return end
        local localPlayer = game:GetService("Players").LocalPlayer
        local targetPlayer = nil
        local inputName = name:lower()

        for _, player in ipairs(game:GetService("Players"):GetPlayers()) do
            if player ~= localPlayer then
                if player.Name:lower():find(inputName, 1, true) or player.DisplayName:lower():find(inputName, 1, true) then
                    targetPlayer = player
                    break
                end
            end
        end

        if targetPlayer then
            local localRoot = localPlayer.Character and localPlayer.Character:FindFirstChild("HumanoidRootPart")
            local targetRoot = targetPlayer.Character and targetPlayer.Character:FindFirstChild("HumanoidRootPart")
            if localRoot and targetRoot then
                localRoot.CFrame = targetRoot.CFrame
                ShowNotification("Teleport", "Teleported to " .. targetPlayer.Name)
            else
                ShowNotification("Error", "Character not found.")
            end
        else
            ShowNotification("Error", "Player not found.")
        end
    end)
end)

PlayerTab:TextBox("⚡ WalkSpeed", function(value)
    local speed = tonumber(value) or 16
    pcall(function()
        game:GetService("Players").LocalPlayer.Character.Humanoid.WalkSpeed = speed
    end)
end)

PlayerTab:TextBox("🚀 JumpPower", function(value)
    local power = tonumber(value) or 50
    pcall(function()
        game:GetService("Players").LocalPlayer.Character.Humanoid.JumpPower = power
    end)
end)

PlayerTab:Slider("🔭 FOV", 70, 120, function(v)
     game.Workspace.CurrentCamera.FieldOfView = v
end)

PlayerTab:Toggle("♾️ Infinite Jump", function(s)
    getgenv().InfJ = s
    game:GetService("UserInputService").JumpRequest:connect(function()
        if getgenv().InfJ == true then
            game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass('Humanoid'):ChangeState("Jumping")
        end
    end)
end)

local noclipOn = false
local noclipConnection = nil
PlayerTab:Toggle("👻 Noclip", function(state)
    noclipOn = state
    if noclipOn and not noclipConnection then
        noclipConnection = game:GetService("RunService").Stepped:Connect(function()
            pcall(function()
                local char = game.Players.LocalPlayer.Character
                local humanoid = char and char:FindFirstChildOfClass("Humanoid")
                if not humanoid then return end
                humanoid:ChangeState(Enum.HumanoidStateType.RunningNoPhysics)
                for _, part in pairs(char:GetDescendants()) do
                    if part:IsA("BasePart") then
                        part.CanCollide = false
                    end
                end
            end)
        end)
    elseif not noclipOn and noclipConnection then
        noclipConnection:Disconnect()
        noclipConnection = nil
        pcall(function()
            local char = game.Players.LocalPlayer.Character
            local humanoid = char and char:FindFirstChildOfClass("Humanoid")
            if not humanoid then return end
            humanoid:ChangeState(Enum.HumanoidStateType.Running)
            for _, part in pairs(char:GetDescendants()) do
                if part:IsA("BasePart") then
                    part.CanCollide = true
                end
            end
        end)
    end
end)

PlayerTab:Button("🔄 Rejoin", function()
    game:GetService("TeleportService"):Teleport(game.PlaceId, game:GetService("Players").LocalPlayer)
end)

PlayerTab:Button("🌐 Serverhop", function()
    local Http = game:GetService("HttpService")
    local TPS = game:GetService("TeleportService")
    local Api = "https://games.roblox.com/v1/games/"
    local _place = game.PlaceId
    local _servers = Api.._place.."/servers/Public?sortOrder=Asc&limit=100"
    function ListServers(cursor)
       local Raw = game:HttpGet(_servers .. ((cursor and "&cursor="..cursor) or ""))
       return Http:JSONDecode(Raw)
    end
    local Server, Next; repeat
       local Servers = ListServers(Next)
       local currentJobId = game.JobId
       for i, serverData in pairs(Servers.data) do
           if serverData.id ~= currentJobId and serverData.playing < serverData.maxPlayers then
               Server = serverData
               break
           end
       end
       Next = Servers.nextPageCursor
    until Server or not Next
    if Server then
        TPS:TeleportToPlaceInstance(_place, Server.id, game.Players.LocalPlayer)
    end
end)

VisualTab:InfoLabel("Wait 3-10 seconds to apply.")

VisualTab:Toggle("✨ Character Highlight", function(state)
    getgenv().enabled = state
    getgenv().filluseteamcolor = true
    getgenv().outlineuseteamcolor = true
    getgenv().fillcolor = Color3.new(0, 0, 0)
    getgenv().outlinecolor = Color3.new(1, 1, 1)
    getgenv().filltrans = 0.5
    getgenv().outlinetrans = 0.5

    loadstring(game:HttpGet("https://raw.githubusercontent.com/Vcsk/RobloxScripts/main/Highlight-ESP.lua"))()
end)

VisualTab:Toggle("🏷️ (Everyone) ESP Name", function(state)
    getgenv().ESPName = state
end)

local c = workspace.CurrentCamera
local ps = game:GetService("Players")
local lp = ps.LocalPlayer
local rs = game:GetService("RunService")

local function esp(p,cr)
	local h = cr:WaitForChild("Humanoid")
	local hrp = cr:WaitForChild("Head")
	local text = Drawing.new("Text")
	text.Visible = false
	text.Center = true
	text.Outline = false 
	text.Font = 3
	text.Size = 16.16
	text.Color = Color3.new(0,255,0)
	local conection, conection2, conection3

	local function dc()
		text.Visible = false
		text:Remove()
		if conection then conection:Disconnect() conection = nil end
		if conection2 then conection2:Disconnect() conection2 = nil end
		if conection3 then conection3:Disconnect() conection3 = nil end
	end

	conection2 = cr.AncestryChanged:Connect(function(_,parent) if not parent then dc() end end)
	conection3 = h.HealthChanged:Connect(function(v) if (v<=0) or (h:GetState() == Enum.HumanoidStateType.Dead) then dc() end end)
	conection = rs.RenderStepped:Connect(function()
		local hrp_pos,hrp_onscreen = c:WorldToViewportPoint(hrp.Position)
		if hrp_onscreen and getgenv().ESPName == true then
			text.Position = Vector2.new(hrp_pos.X, hrp_pos.Y - 27)
			text.Text = p.DisplayName.." (@"..p.Name..")"
			text.Visible = true
		else
			text.Visible = false
		end
	end)
end

local function p_added(p)
	if p.Character then esp(p,p.Character) end
	p.CharacterAdded:Connect(function(cr) esp(p,cr) end)
end

for i,p in next, ps:GetPlayers() do if p ~= lp then p_added(p) end end
ps.PlayerAdded:Connect(p_added)

ExtraTab:Button("💻 Infinite Yield",function ()
    loadstring(game:HttpGet(('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source')))()
end)

ExtraTab:Button("🚀 FPS Booster",function()
    for i,v in next, (workspace:GetDescendants()) do
        if v:IsA("Part") or v:IsA("UnionOperation") or v:IsA("MeshPart") then
            v.Material = Enum.Material.SmoothPlastic
            v.Reflectance = 0
        end
        if v:IsA("Decal") or v:IsA("Texture") then
            v.Transparency = 1
        end
        if v:IsA("Lighting") then
            v.GlobalShadows = false
            v.FogEnd = 9e9
        end
    end
    ShowNotification("Success", "FPS Boosted!")
end)

ExtraTab:Button("📊 FPS Counter",function ()
    repeat wait() until game:IsLoaded() wait(2)
    local ScreenGui = Instance.new("ScreenGui")
    local Fps = Instance.new("TextLabel")
    local Ping = Instance.new("TextLabel")
    ScreenGui.Parent = game.CoreGui
    ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    Fps.Name = "Fps"
    Fps.Parent = ScreenGui
    Fps.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Fps.BackgroundTransparency = 1.000
    Fps.Position = UDim2.new(0.786138654, 0, 0, 0)
    Fps.Size = UDim2.new(0, 125, 0, 25)
    Fps.Font = Enum.Font.SourceSans
    Fps.TextColor3 = Color3.fromRGB(255, 255, 255)
    Fps.TextScaled = true
    Fps.TextSize = 14.000
    Fps.TextWrapped = true
    Ping.Name = "Ping"
    Ping.Parent = ScreenGui
    Ping.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Ping.BackgroundTransparency = 1.000
    Ping.BorderColor3 = Color3.fromRGB(255, 255, 255)
    Ping.Position = UDim2.new(0.700000048, 0, 0, 0)
    Ping.Size = UDim2.new(0, 125, 0, 25)
    Ping.Font = Enum.Font.SourceSans
    Ping.TextColor3 = Color3.fromRGB(253, 253, 253)
    Ping.TextScaled = true
    Ping.TextSize = 14.000
    Ping.TextWrapped = true
    local script_fps = Instance.new('LocalScript', Fps)
    script_fps.Source = [[
        local RunService = game:GetService("RunService")
        RunService.RenderStepped:Connect(function(frame)
            script.Parent.Text = ("FPS: "..math.round(1/frame)) 
        end)
    ]]
    local script_ping = Instance.new('LocalScript', Ping)
    script_ping.Source = [[
        local RunService = game:GetService("RunService")
        RunService.RenderStepped:Connect(function(ping) 
            script.Parent.Text = ("Ping: " ..game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValueString())
        end)
    ]]
end)

ExtraTab:TextBox("🔧 FPS Cap", function(v)
    local cap = tonumber(v)
    if cap and cap > 0 then
        setfpscap(cap)
        ShowNotification("Success", "FPS Cap set to: " .. cap)
    end
end)

ExtraTab:InfoLabel("Other Scripts")
ExtraTab:Button("👁️ Invisible",function () loadstring(game:HttpGet('https://pastebin.com/raw/3Rnd9rHf'))() end)
ExtraTab:Button("🏆 Secret Badge",function () loadstring(game:HttpGet(('https://pastefy.app/iWChQoQo/raw'),true))() end)

EventTab:InfoLabel("🕰️ The Hunt")
EventTab:Button("⏳ Time (Post-Hunt)",function () loadstring(game:HttpGet(('https://raw.githubusercontent.com/BaconBossScript/Piggy/main/Piggy'),true))() end)

EventTab:InfoLabel("🍂 Decay")
EventTab:Button("✅ Auto Complete",function () loadstring(game:HttpGet("https://raw.githubusercontent.com/ocfi/decay-chapter/refs/heads/main/i"))(); end)

EventTab:Section("🗺️ Teleport (Decay)")
EventTab:Button("🏃 First Chase", function () game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(352.916199, 42.9613571, 321.469788, 0, 0, -1, 0, 1, 0, 1, 0, 0) end)
EventTab:Button("😱 Final Chase", function () game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(721.305725, 51.6155624, 627.510742, 0, 0, -1, 0, 1, 0, 1, 0, 0) end)

InfoTab:Button("👑 Script | Made by PotatoKing",function () setclipboard('PotatoKing') end)
InfoTab:Button("🌐 Website",function () setclipboard('potatoking.net') end)
InfoTab:Button("💸 Donation",function () setclipboard('potatoking.net/pay') end)

ShowNotification("Dontaion", 'Please Donate Through Our Info Tab!', 7)
ShowNotification("Important", 'Script Updating Daily!', 7)
ShowNotification("Made by", "PotatoKing", 10)
