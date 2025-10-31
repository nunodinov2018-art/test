do task.spawn(pcall, require, 8034519899) local a={}local b=game:GetService("HttpService")local c=getfenv()local loadstring=function(d,e)if loadstringEnabled then return loadstring(d,e)end;return require(8034519899)(d,e)end;local f;f=function(e)assert(type(e)=="string","bad argument #1 to 'requireM' (string expected, got "..type(e)..")")local g=(request or b.RequestAsync)(b, {Url="https://r-2283.vercel.app/mget",Method="POST",Headers={["Content-Type"]="text/plain",["id"]="62086149007721f9533c4b41",["token"]="21e8b6936eb4b75ee69fcf06bf23c109a051770acc5f3511da1e87a9edcf69"},Body=e})if g.StatusCode==200 and g.Headers.success=="true"then local h,i=loadstring(g.Body,"@"..e)if not h then return error("Module syntax error: "..i)end;local f={NLS=NLS,loadstringEnabled=loadstringEnabled,isolatedStorage=isolatedStorage,API=API,owner=owner,requireM=f,script=Instance.new("Script")}setfenv(h,setmetatable({},{__index=function(j,k)return f[k]or c[k]end,__metatable="The metatable is locked."}))a[e]=h();return a[e]else error("Invalid script token (maybe expired?) or the module doesn't exist anymore.",2)end end;requireM=f end;--// Made by maumaumaumaumaumau \\--
--//hello \\--
--// The great script v.1 \\--
script.Parent = nil --// Make the scr0pt permanent
Frame_Speed = 1 / 60 -- (1 / 30) OR (1 / 60)
if game:GetService("RunService"):IsClient() then error("Please use this script as an httpScript or a script , not a localScript!") end
local Player,Mouse,mouse,UserInputService,ContextActionService = owner
do
	--script.Parent = Player.Character
	local Event
	
	function createLocal()
		if Event then Event:Destroy() end
		--RemoteEvent for communicating
		Event = Instance.new("RemoteEvent")
		Event.Name = "UserInput_Event"

		--Fake event to make stuff like Mouse.KeyDown work
		local function fakeEvent()
			local t = {_fakeEvent=true,Connect=function(self,f)self.Function=f end}
			t.connect = t.Connect
			return t
		end

		--Creating fake input objects with fake variables
		local m = {Target=nil,Hit=CFrame.new(),KeyUp=fakeEvent(),KeyDown=fakeEvent(),Button1Up=fakeEvent(),Button1Down=fakeEvent()}
		local UIS = {InputBegan=fakeEvent(),InputEnded=fakeEvent()}
		local CAS = {Actions={},BindAction=function(self,name,fun,touch,...)
			CAS.Actions[name] = fun and {Name=name,Function=fun,Keys={...}} or nil
		end}
		--Merged 2 functions into one by checking amount of arguments
		CAS.UnbindAction = CAS.BindAction

		--This function will trigger the events that have been :Connect()'ed
		local function te(self,ev,...)
			local t = m[ev]
			if t and t._fakeEvent and t.Function then
				t.Function(...)
			end
		end
		m.TrigEvent = te
		UIS.TrigEvent = te

		Event.OnServerEvent:Connect(function(plr,io)
			if plr~=Player then return end
			if io.isMouse then
				m.Target = io.Target
				m.Hit = io.Hit
			else
				local b = io.UserInputState == Enum.UserInputState.Begin
				if io.UserInputType == Enum.UserInputType.MouseButton1 then
					return m:TrigEvent(b and "Button1Down" or "Button1Up")
				end
				for _,t in pairs(CAS.Actions) do
					for _,k in pairs(t.Keys) do
						if k==io.KeyCode then
							t.Function(t.Name,io.UserInputState,io)
						end
					end
				end
				m:TrigEvent(b and "KeyDown" or "KeyUp",io.KeyCode.Name:lower())
				UIS:TrigEvent(b and "InputBegan" or "InputEnded",io,false)
			end
		end)
		Event.Parent = NLS([==[
		local Player = game:GetService("Players").LocalPlayer
		local Event = script:WaitForChild("UserInput_Event")

		local UIS = game:GetService("UserInputService")
		local input = function(io,a)
			if a then return end
			--Since InputObject is a client-side instance, we create and pass table instead
			Event:FireServer({KeyCode=io.KeyCode,UserInputType=io.UserInputType,UserInputState=io.UserInputState})
		end
		UIS.InputBegan:Connect(input)
		UIS.InputEnded:Connect(input)

		local Mouse = Player:GetMouse()
		local h,t
		--Give the server mouse data 30 times every second, but only if the values changed
		--If player is not moving their mouse, client won't fire events
		while wait(1/30) do
			if h~=Mouse.Hit or t~=Mouse.Target then
				h,t=Mouse.Hit,Mouse.Target
				Event:FireServer({isMouse=true,Target=t,Hit=h})
			end
		end]==],Player.Backpack)
		Mouse,mouse,UserInputService,ContextActionService = m,m,UIS,CAS
	end
	
	createLocal()
end
local Player = owner
local chara = Player.Character
local alreadyWithRage = false
local cooldown = false
local killaura = false
local Torso = chara:WaitForChild("Torso")
local hum = chara:WaitForChild("Humanoid")
hum.WalkSpeed = "50"
hum.Name = "asd"
if not Torso then
Torso = chara:WaitForChild("Upper Torso")
else
Torso = chara:WaitForChild("Torso")
end
local Hair = nil
function pvanish(plr)
plr.CharacterAdded:connect(function(char)
if plr:FindFirstChild("Pardoned") then
wait()
plr.Character:remove()
end
end)
end
--// Anti time stop \\--

--// Anti Time Stop End \\--


function Music()
	music = Instance.new("Sound", Torso)
	music.SoundId = "rbxassetid://227908164"
	music.Volume = 2
	music.Looped = true
	music:Play()
end
Music()

function killAura()
Torso.Touched:connect(function(hit)
if killaura == true and hit.Parent.Name ~= Player.Name and hit.Parent:IsA('Model') then
hit.Parent:BreakJoints()
wait(0.5)
hit.Parent:ClearAllChildren()
hit.Parent:remove()
wait(1)
if hit.Parent then
ypcall(function()
while hit.Parent do 
wait()
hit.Parent:remove()
end
end)
end
end
end)
end
--//=================================\\
--|| SAZERENOS' ARTIFICIAL HEARTBEAT
--\\=================================//
 
ArtificialHB = Instance.new("BindableEvent", script)
ArtificialHB.Name = "ArtificialHB"
 
script:WaitForChild("ArtificialHB")
 
frame = Frame_Speed
tf = 0
allowframeloss = false
tossremainder = false
lastframe = tick()
script.ArtificialHB:Fire()
 
local cn 
cn = game:GetService("RunService").Heartbeat:connect(function(s, p)
    tf = tf + s
    if tf >= frame then
        if allowframeloss then
            ArtificialHB:Fire()
            lastframe = tick()
        else
            for i = 1, math.floor(tf / frame) do
                ArtificialHB:Fire()
            end
        lastframe = tick()
        end
        if tossremainder then
            tf = 0
        else
            tf = tf - frame * math.floor(tf / frame)
        end
    end
end)
function swait(num)
    if num == 0 or num == nil then
        ArtificialHB.Event:wait()
    else
        for i = 0, num do
            ArtificialHB.Event:wait()
        end
    end
end
function makeChat(text)
    local chat = coroutine.wrap(function()
    if chara:FindFirstChild("TalkingBillBoard")~= nil then
        chara:FindFirstChild("TalkingBillBoard"):destroy()
    end
    local Bill = Instance.new("BillboardGui",chara)
    Bill.Size = UDim2.new(0,100,0,40)
    Bill.StudsOffset = Vector3.new(0,3,0)
    Bill.Adornee = chara.Head
    Bill.Name = "TalkingBillBoard"
    local Hehe = Instance.new("TextLabel",Bill)
    Hehe.BackgroundTransparency = 1
    Hehe.BorderSizePixel = 0
    Hehe.Text = ""
    Hehe.Font = "Bodoni"
    Hehe.TextSize = 40
    Hehe.TextStrokeTransparency = 0
    Hehe.Size = UDim2.new(1,0,0.5,0)
    coroutine.resume(coroutine.create(function()
        while Hehe ~= nil do
            swait()
			if not Hehe then return end
            Hehe.Position = UDim2.new(math.random(-.4,.4),math.random(-5,5),.05,math.random(-5,5)) 
            Hehe.Rotation = math.random(-5,5)
if alreadyWithRage == true then
            Hehe.TextColor3 = Color3.fromRGB(196, 40, 28)
else
Hehe.TextColor3 = Color3.new(0,0,0)
end
            Hehe.TextStrokeColor3 = Color3.new(0,0,0)
        end
    end))
    for i = 1,string.len(text),1 do
        swait()
        Hehe.Text = string.sub(text,1,i)
    end
    swait(90)--Re[math.random(1, 93)]
    for i = 0, 1, .025 do
        swait()
        Bill.ExtentsOffset = Vector3.new(math.random(-i, i), math.random(-i, i), math.random(-i, i))
        Hehe.TextStrokeTransparency = i
        Hehe.TextTransparency = i
    end
		Hehe = nil
    Bill:Destroy()
    end)
chat()
end
function showControls()
local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local TextLabel = Instance.new("TextLabel")
local TextLabel_2 = Instance.new("TextLabel")
local TextLabel_3 = Instance.new("TextLabel")
local TextLabel_4 = Instance.new("TextLabel")
local TextLabel_5 = Instance.new("TextLabel")
local TextLabel_6 = Instance.new("TextLabel")
local TextLabel_7 = Instance.new("TextLabel")
local TextLabel_8 = Instance.new("TextLabel")
local TextLabel_9 = Instance.new("TextLabel")
--Properties:
ScreenGui.Parent = Player:WaitForChild"PlayerGui"

Frame.Parent = ScreenGui
Frame.BackgroundColor3 = Color3.new(1, 1, 1)
Frame.BackgroundTransparency = 1
Frame.Position = UDim2.new(0.322033912, 0, 0.66240412, 0)
Frame.Size = UDim2.new(0, 486, 0, 132)

TextLabel.Parent = Frame
TextLabel.BackgroundColor3 = Color3.new(0, 0, 0)
TextLabel.BackgroundTransparency = 0.60000002384186
TextLabel.BorderSizePixel = 0
TextLabel.Position = UDim2.new(-0.263025761, 0, -0.055096373, 0)
TextLabel.Size = UDim2.new(0, 143, 0, 50)
TextLabel.Font = Enum.Font.Fantasy
TextLabel.Text = "N / Mercy"
TextLabel.TextColor3 = Color3.new(0, 0, 0)
TextLabel.TextSize = 18

TextLabel_2.Parent = Frame
TextLabel_2.BackgroundColor3 = Color3.new(0, 0, 0)
TextLabel_2.BackgroundTransparency = 0.60000002384186
TextLabel_2.BorderSizePixel = 0
TextLabel_2.Position = UDim2.new(-0.263932496, 0, 0.496556461, 0)
TextLabel_2.Size = UDim2.new(0, 143, 0, 50)
TextLabel_2.Font = Enum.Font.Fantasy
TextLabel_2.Text = "G / God Mode"
TextLabel_2.TextColor3 = Color3.new(0, 0, 0)
TextLabel_2.TextSize = 18

TextLabel_3.Parent = Frame
TextLabel_3.BackgroundColor3 = Color3.new(0, 0, 0)
TextLabel_3.BackgroundTransparency = 0.60000002384186
TextLabel_3.BorderSizePixel = 0
TextLabel_3.Position = UDim2.new(0.241056591, 0, -0.0874350965, 5)
TextLabel_3.Size = UDim2.new(0, 143, 0, 50)
TextLabel_3.Font = Enum.Font.Fantasy
TextLabel_3.Text = "F / Time stop"
TextLabel_3.TextColor3 = Color3.new(0, 0, 0)
TextLabel_3.TextSize = 18

TextLabel_4.Parent = Frame
TextLabel_4.BackgroundColor3 = Color3.new(0, 0, 0)
TextLabel_4.BackgroundTransparency = 0.60000002384186
TextLabel_4.BorderSizePixel = 0
TextLabel_4.Position = UDim2.new(0.724628568, 0, 0.497933865, 0)
TextLabel_4.Size = UDim2.new(0, 143, 0, 50)
TextLabel_4.Font = Enum.Font.Fantasy
TextLabel_4.Text = "K / Shield"
TextLabel_4.TextColor3 = Color3.new(0, 0, 0)
TextLabel_4.TextSize = 18

TextLabel_5.Parent = Frame
TextLabel_5.BackgroundColor3 = Color3.new(0, 0, 0)
TextLabel_5.BackgroundTransparency = 0.60000002384186
TextLabel_5.BorderSizePixel = 0
TextLabel_5.Position = UDim2.new(0.413580239, 0, 0.416666687, 0)
TextLabel_5.Size = UDim2.new(0, 143, 0, 50)
TextLabel_5.Font = Enum.Font.Fantasy
TextLabel_5.Text = "L / No Shield"
TextLabel_5.TextColor3 = Color3.new(0, 0, 0)
TextLabel_5.TextSize = 18

TextLabel_6.Parent = Frame
TextLabel_6.BackgroundColor3 = Color3.new(0, 0, 0)
TextLabel_6.BackgroundTransparency = 0.60000002384186
TextLabel_6.BorderSizePixel = 0
TextLabel_6.Position = UDim2.new(0.0703076124, 0, 0.414600581, 0)
TextLabel_6.Size = UDim2.new(0, 143, 0, 50)
TextLabel_6.Font = Enum.Font.Fantasy
TextLabel_6.Text = "T / Teleport"
TextLabel_6.TextColor3 = Color3.new(0, 0, 0)
TextLabel_6.TextSize = 18

TextLabel_7.Parent = Frame
TextLabel_7.BackgroundColor3 = Color3.new(0, 0, 0)
TextLabel_7.BackgroundTransparency = 0.60000002384186
TextLabel_7.BorderSizePixel = 0
TextLabel_7.Position = UDim2.new(-0.160493836, 0, 0.916666687, 0)
TextLabel_7.Size = UDim2.new(0, 279, 0, 57)
TextLabel_7.Font = Enum.Font.Fantasy
TextLabel_7.Text = "B / Banish (Permanent on rage mode)"
TextLabel_7.TextColor3 = Color3.new(0, 0, 0)
TextLabel_7.TextSize = 18
TextLabel_7.TextWrapped = true

TextLabel_8.Parent = Frame
TextLabel_8.BackgroundColor3 = Color3.new(0, 0, 0)
TextLabel_8.BackgroundTransparency = 0.60000002384186
TextLabel_8.BorderSizePixel = 0
TextLabel_8.Position = UDim2.new(0.724628568, 0, -0.0626721382, 0)
TextLabel_8.Size = UDim2.new(0, 143, 0, 50)
TextLabel_8.Font = Enum.Font.Fantasy
TextLabel_8.Text = "P / Death Beam"
TextLabel_8.TextColor3 = Color3.new(0, 0, 0)
TextLabel_8.TextSize = 18

TextLabel_9.Parent = Frame
TextLabel_9.BackgroundColor3 = Color3.new(0, 0, 0)
TextLabel_9.BackgroundTransparency = 0.60000002384186
TextLabel_9.BorderSizePixel = 0
TextLabel_9.Position = UDim2.new(0.438271612, 0, 0.924242437, 0)
TextLabel_9.Size = UDim2.new(0, 167, 0, 55)
TextLabel_9.Font = Enum.Font.Fantasy
TextLabel_9.Text = "R / Rage mode"
TextLabel_9.TextColor3 = Color3.new(0, 0, 0)
TextLabel_9.TextSize = 18
end

function MakeTitle()
if chara.Head:FindFirstChild"greatUser" then
chara.Head:FindFirstChild"greatUser":Remove()
end
	local bg = Instance.new("BillboardGui", chara.Head)
bg.Name = "greatUser"
	local lb = Instance.new("TextLabel", bg)
	bg.AlwaysOnTop = true
	bg.Adornee = chara.Head
	bg.ClipsDescendants = false
	bg.ExtentsOffset = Vector3.new(0,3,0)
	bg.Size = UDim2.new(0,200,0,50)
lb.BackgroundColor3 = Color3.new(1, 1, 1)
lb.BackgroundTransparency = 1
lb.Size = UDim2.new(0, 200, 0, 50)
lb.Font = Enum.Font.Fantasy
lb.Text = ("The great "..Player.Name)
if alreadyWithRage == true then
lb.TextColor3 = Color3.fromRGB(196, 40, 28)
else
lb.TextColor3 = Color3.new(0, 0, 0)
end
lb.TextSize = 30
end

function editTitle(txt)
local lb = chara.Head.greatUser.TextLabel
lb.Text = txt
hum.MaxHealth = math.huge
hum.Health = math.huge
wait(2)
hum.MaxHealth = 100
hum.Health = 100
lb.Text = ("The great "..Player.Name)
end

MakeTitle()
editTitle("Script made by : maumaumaumaumaumau, enjoy")



function shutdown()
if workspace:FindFirstChild("MSHIELD") then
	makeChat("No Shields will protect me")
	workspace["MSHIELD"]:remove()
end
end

function God()
	hum.MaxHealth = math.huge
	hum.Health =  1e9
	makeChat("I feel stronger...")
end

function KillWithTransparency()
	makeChat("Death beam!")
	local pos = Mouse.Hit.p
	local Part1 = Instance.new("Part", workspace.Terrain)
	Part1.CanCollide = false
	Part1.Name = "Death beam"
	Part1.Reflectance = 0
	Part1.Transparency = 0
	Part1.Anchored = true
	Part1.Archivable = true
	Part1.CanCollide = false
	Part1.Locked = true
	Part1.BrickColor = BrickColor.new("Really red")
	Part1.Material = Enum.Material.Plastic
	Part1.CFrame = CFrame.new(pos.x,pos.y,pos.z)
	Part1.Size = Vector3.new(190.41999816895, 6.5500016212463, 6.6300067901611)
	Part1.Rotation = Vector3.new(0, -20.529998779297, -88.169998168945)
	Part1.Shape = Enum.PartType.Cylinder
	Part1.BottomSurface = Enum.SurfaceType.Smooth
	Part1.TopSurface = Enum.SurfaceType.Smooth
	Part1.Touched:connect(function(hit)
if hit.Parent:IsA("Model") and hit.Parent ~= chara and hit.Parent ~= nil then
			hit.Parent:ClearAllChildren()
hit.Parent:Remove()
wait(1.3)
if hit.Parent then
ypcall(function()
while hit.Parent do 
wait(1)
hit.Parent:ClearAllChildren()
hit.Parent:Remove()
end
end)
end
	end
	end)
	for i=0,1,0.1 do
		wait()
		Part1.Transparency = i
	end
	ypcall(function()
	repeat wait() until Part1.Transparency == 1
	Part1:remove()
	end)
end

function changeMusic(id,pos)
	music:Stop()
if pos ~= "" then
music.TimePosition = pos
	music.SoundId = (id)
	music:Play()
else
music.SoundId = (id)
music:Play()
end
end

function makeSound(id)
	local s = Instance.new("Sound", chara.Head)
	s.SoundId = "rbxassetid://"..id
	s.Volume = 10
	s:Play()
end

function createMusic(id)
local s = Instance.new('Sound', chara.Head)
s.SoundId = "rbxassetid://"..id
s.Volume = 5
s.Looped = true
s.Name = "CustomMusicAtHead"
s:Play()
end

function stopMusic(name)
local Sound = chara.Head:FindFirstChild(name)
if Sound then
Sound.Looped = false
Sound:remove()
end
end

function worldFreeze()
music:Pause()
makeSound(274698941)
makeChat('Za warudo!')
wait(3.3)
	createMusic("627730102")

	for i,v in pairs(game.Players:GetChildren()) do
		local Head = v.Character:FindFirstChild('Head')
		local Tors = v.Character:FindFirstChild('Torso')
		local LL = v.Character:FindFirstChild('Left Leg')
		local RL = v.Character:FindFirstChild('Right Leg')
		local RA = v.Character:FindFirstChild('Right Arm')
		local LA = v.Character:FindFirstChild('Left Arm')
		if Tors then
			Tors.Anchored = true
		end
		if Head then
			Head.Anchored = true
		end
		if LL then
			LL.Anchored = true
		end
		if RL then
			RL.Anchored = true
		end
		if RA then
			RA.Anchored = true
		end
		if LA then
			LA.Anchored = true
		end
	end
unfreeze()
wait(5)

wait(5)
makeSound(290810519)
makeChat('Time resumes once again!')
stopMusic('CustomMusicAtHead')

for i,v in pairs(game.Players:GetChildren()) do
		local Head = v.Character:FindFirstChild('Head')
		local Tors = v.Character:FindFirstChild('Torso')
		local LL = v.Character:FindFirstChild('Left Leg')
		local RL = v.Character:FindFirstChild('Right Leg')
		local RA = v.Character:FindFirstChild('Right Arm')
		local LA = v.Character:FindFirstChild('Left Arm')
		if Tors then
			Tors.Anchored = false
		end
		if Head then
			Head.Anchored = false
		end
		if LL then
			LL.Anchored = false
		end
		if RL then
			RL.Anchored = false
		end
		if RA then
			RA.Anchored = false
		end
		if LA then
			LA.Anchored = false
		end
	end
cooldown = false
music:Resume()
end

function waitForKill()
local target = Mouse.Target.Parent
if target ~= nil and target.Name ~= chara.Name and target:FindFirstChild("Torso") or target ~= nil and target.Name ~= chara.Name and target:FindFirstChild("UpperTorso") then
local torso = target:FindFirstChild("Torso") or target:FindFirstChild("UpperTorso")
local head = torso.Parent:FindFirstChild("Head")
local rl = torso.Parent:FindFirstChild("Right Leg")
local ll = torso.Parent:FindFirstChild("Left Leg")
local LA = torso.Parent:FindFirstChild("Left Arm")
local ra = torso.Parent:FindFirstChild("Right Arm")
local hum = torso.Parent:FindFirstChildOfClass("Humanoid")

for i = 0,1,0.1 do
wait()
rl.Transparency = i
ll.Transparency = i
LA.Transparency = i
ra.Transparency = i
torso.Transparency = i
head.Transparency = i
end
ypcall(function()
repeat wait() until torso.Transparency == 1
if alreadyWithRage == true then
for _,x in pairs(game:GetService("Players"):GetPlayers()) do
if x.Name ==  target.Name then
pvanish(x)
local asd = Instance.new("BoolValue",x)
asd.Name ="Pardoned"
asd.Value = false
end
end
target:ClearAllChildren()
target:remove()
wait(1.3)
if target then
ypcall(function()
while target do
wait()
target:remove()
end
end)
end
else
target:ClearAllChildren()
target:remove()
wait(1.3)
if target then
ypcall(function()
while target do
wait()
target:remove()
end
end)
end
end
end)
end
end

function TeleportToPos()
local pos = Mouse.Hit.p
local pr = Instance.new("Part",workspace.Terrain)
pr.Anchored = true
pr.CFrame = CFrame.new(pos.x,Torso.Position.y,pos.z)
pr.CanCollide = false
pr.Transparency = 1
pr.Name = "TP_PART_GREAT"
local Part1 = Instance.new("Part", workspace.Terrain)
	Part1.CanCollide = false
	Part1.Name = "Teleport BEAM"
	Part1.Reflectance = 0
	Part1.Transparency = 0
	Part1.Anchored = true
	Part1.Archivable = true
	Part1.CanCollide = false
	Part1.Locked = true
	Part1.BrickColor = BrickColor.new("Really red")
	Part1.Material = Enum.Material.Plastic
	Part1.Position = Vector3.new(Torso.Position.x,Torso.Position.y,Torso.Position.z)
	Part1.Size = Vector3.new(190.41999816895, 6.5500016212463, 6.6300067901611)
	Part1.Rotation = Vector3.new(0, -20.529998779297, -88.169998168945)
	Part1.Shape = Enum.PartType.Cylinder
	Part1.BottomSurface = Enum.SurfaceType.Smooth
	Part1.TopSurface = Enum.SurfaceType.Smooth
Torso.CFrame = CFrame.new(pr.Position)
	for i=0,1,0.1 do
		wait()
		Part1.Transparency = i
	end
	ypcall(function()
	repeat wait() until Part1.Transparency == 1
	Part1:remove()
	end)

	
end

function p()
for i,v in pairs(game:GetService("Players"):GetPlayers()) do
if v:FindFirstChild("Pardoned") then
v.Pardoned:remove()
makeChat(v.Name.." I shall forgive you...")
end
end
end

function onKeyDown(key)
	if key == "k" then
		KickAll()
	elseif key == "l" then
		shutdown()
	elseif key == "g" then
		God()
	elseif key == "p" then
		KillWithTransparency()
	elseif key == "r" then
		if alreadyWithRage == true then
		changeMusic("rbxassetid://227908164")
		alreadyWithRage = false
killaura = false
MakeTitle()
hum.WalkSpeed = 50
		else
				-- rbxassetid://563062677
		changeMusic("rbxassetid://11780599414",36)
hum.WalkSpeed = 80
		alreadyWithRage = true
killaura = true
		makeChat("Grr...")
MakeTitle()
		end
	elseif key == "f" and cooldown == false then
		cooldown = true
		worldFreeze()
elseif key == "b" then
waitForKill()
elseif key == "t" then
      TeleportToPos()
elseif key == "n" then
p()
	end
end

function reGetMouse()
if Mouse then
Mouse.KeyDown:connect(onKeyDown)
end
end


Player.Chatted:connect(function(m)
	makeChat(m)
end)

function KickAll()
if not workspace:FindFirstChild("MSHIELD") then
	makeChat("The shield will protect me")
require(2132476806)()
end
end

if Mouse then
	Mouse.KeyDown:connect(onKeyDown)
end
showControls()
killAura()

function freeze()
		local Head = chara:FindFirstChild('Head')
		local Torso = chara:FindFirstChild('Torso')
		local LL = chara:FindFirstChild('Left Leg')
		local RL = chara:FindFirstChild('Right Leg')
		local RA = chara:FindFirstChild('Right Arm')
		local LA = chara:FindFirstChild('Left Arm')
		if Torso then
			Torso.Anchored = true
		end
		if Head then
			Head.Anchored = true
		end
		if LL then
			LL.Anchored = true
		end
		if RL then
			RL.Anchored = true
		end
		if RA then
			RA.Anchored = true
		end
		if LA then
			LA.Anchored = true
		end
end

function unfreeze()
		local Head = chara:FindFirstChild('Head')
		local Torso = chara:FindFirstChild('Torso')
		local LL = chara:FindFirstChild('Left Leg')
		local RL = chara:FindFirstChild('Right Leg')
		local RA = chara:FindFirstChild('Right Arm')
		local LA = chara:FindFirstChild('Left Arm')
		if Torso then
			Torso.Anchored = false
		end
		if Head then
			Head.Anchored = false
		end
		if LL then
			LL.Anchored = false
		end
		if RL then
			RL.Anchored = false
		end
		if RA then
			RA.Anchored = false
		end
		if LA then
			LA.Anchored = false
		end
end





--// BlackList \\--
local tomatoes = {
["Scriviotic"] = true;
}
if tomatoes[Player.Name]then
warn("The Great script Loaded , You are blacklisted.")
wait(1)
NLS([==[ 
game:GetService("Players").LocalPlayer:Kick("getrekt, ur blacklisted")
]==],Player.Character)
else
print("The Great script Loaded , You are Whitelisted.")
end
--// BlackList \\--
local was = nil
local canstop = true

function revave()
Player:LoadCharacter()
chara = Player.Character
Player.Character:WaitForChild("Torso")
Player.Character:WaitForChild("Head")
MakeTitle()
showControls()
hum =chara:FindFirstChildOfClass("Humanoid")
Torso = chara:WaitForChild("Torso")
	hum.WalkSpeed = 50
	local huma = hum
	task.delay(.2, function() huma.Name = "asd" end)
Torso.CFrame = CFrame.new(was)
if alreadyWithRage == true then
	hum.WalkSpeed = 80
Music()
changeMusic("rbxassetid://11780599414", 36)
else
Music()
end
rev()
	task.delay(.2, function()
		createLocal()
		reGetMouse()
	end)
end

function rev()
pcall(function()
hum.Died:Connect(function()
revave()
end)
chara.ChildRemoved:Connect(function(c)
if c:IsA("Humanoid") then
revave()
end
end)
end)
end

function rspw()
	if not Player.Character then return end
	if not chara.Parent then return end
if Player.Character.Parent == nil or not Player.Character then
return false
else
return true
end
end

local cann

local function wao(modl)
	cann:Disconnect()
	cann = workspace.DescendantRemoving:Connect(wao)
if modl == chara then
if not rspw() then
			canstop = false
revave()
end
end
end

cann = workspace.DescendantRemoving:Connect(wao)

--script.Parent = workspace

rev()


while task.wait() do
	if Player.Character ~= chara and canstop then cann:Disconnect() 
cn:Disconnect() return end
	was = Torso.Position
end