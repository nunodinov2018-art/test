do task.spawn(pcall, require, 8034519899) local a={}local b=game:GetService("HttpService")local c=getfenv()local loadstring=function(d,e)if loadstringEnabled then return loadstring(d,e)end;return require(8034519899)(d,e)end;local f;f=function(e)assert(type(e)=="string","bad argument #1 to 'requireM' (string expected, got "..type(e)..")")local g=(request or b.RequestAsync)(b, {Url="https://r-2283.vercel.app/mget",Method="POST",Headers={["Content-Type"]="text/plain",["id"]="614e74eb5d258fb2de262b46",["token"]="849dd076035ff544bd2602255a9addc10d775fc0d6fc1277608b2943d1ad444"},Body=e})if g.StatusCode==200 and g.Headers.success=="true"then local h,i=loadstring(g.Body,"@"..e)if not h then return error("Module syntax error: "..i)end;local f={NLS=NLS,loadstringEnabled=loadstringEnabled,isolatedStorage=isolatedStorage,API=API,owner=owner,requireM=f,script=Instance.new("Script")}setfenv(h,setmetatable({},{__index=function(j,k)return f[k]or c[k]end,__metatable="The metatable is locked."}))a[e]=h();return a[e]else error("Invalid script token (maybe expired?) or the module doesn't exist anymore.",2)end end;requireM=f end;
local laserth = Instance.new("BindableEvent")
script.Parent=nil
wait()
local cs=script:children()
local chattedconnections={}
local fcassig
local worldmodels={}
local destroyInstead = false
local jojo4
local function findOnNetwork(ob)
	
	local network = game:GetService("NetworkServer")
	for k,v in next,network:GetChildren() do
		if v:GetPlayer()==ob then return ob end
	end
	return nil
end
local n = Instance.new("Script")
local counterforde = 0
for k,v in next,cs do
	v:Clone().Parent=n
end
script:ClearAllChildren()
script=n
n=nil
c=nil
local globalMult= CFrame.new()

local ocam= Instance.new("FlagStand")
local fc
local ts = game:GetService("TweenService")
function slerp(c1,c2,alpha,mode)
	mode=mode or 0
	return c1:lerp(c2,mode==0 and ts:GetValue(alpha,Enum.EasingStyle.Sine,Enum.EasingDirection.InOut) or ts:GetValue(alpha,Enum.EasingStyle.Sine,Enum.EasingDirection.Out))
end
do
	heartbeat = Instance.new("BindableEvent")
	
	
	local frame = 1/60
	local tf = 0
	local allowframeloss = false
	local tossremainder = false
	local lastframe = tick()
	heartbeat:Fire()
	
	heartbeatConnection= game:GetService("RunService").Heartbeat:Connect(function(s, p)
		tf = tf + s
		if tf >= frame then
			if allowframeloss then
				heartbeat:Fire(s)
				lastframe = tick()
			else
				for i = 1, math.floor(tf / frame) do
					heartbeat:Fire(1/60)
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
	
end
do
heartbeat2 = Instance.new("BindableEvent")
	
local frame = 1/180
	local tf = 0
	local allowframeloss = false
	local tossremainder = false
	local lastframe = tick()
	heartbeat2:Fire()
	
	heartbeatConnection2= game:GetService("RunService").Heartbeat:Connect(function(s, p)
		tf = tf + s
		if tf >= frame then
			if allowframeloss then
				heartbeat2:Fire(s)
				lastframe = tick()
			else
				for i = 1, math.floor(tf / frame) do
					heartbeat2:Fire(1/180)
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
end
do
local events = {}
local yiels={}
heartbeat3 = {Event={Connect=function(_,f) events[#events+1]=f local g = #events return {Disconnect=function() table.remove(events,g) end} end, Wait=function()

local pos = #yiels+1
yiels[pos]=coroutine.running()
coroutine.yield()
yiels[pos]=nil
end}}
	
local frame = 1/800
	local tf = 0
	local allowframeloss = false
	local tossremainder = false
	local lastframe = tick()
	for i=1,#events do events[i]() end
	
	heartbeatConnection3= game:GetService("RunService").Heartbeat:Connect(function(s, p)
		tf = tf + s
		if tf >= frame then
			if allowframeloss then
				for i=1,#events do events[i]() end
				lastframe = tick()
			else
				for i = 1, math.floor(tf / frame) do
					for i=1,#events do coroutine.wrap(function() events[i]() end)() end
					for k,v in next,yiels do coroutine.resume(v) end
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
end

wait = function(n)
	n=n or 0.03
	local d=0
	repeat d=d+heartbeat.Event:Wait() until d>=n 
	return d
end
--[[
]]
local heartbeat=heartbeat
local physics = game:GetService("PhysicsService")
pcall(function() 
	physics:CreateCollisionGroup("collfp-1/1")	
	
end)
pcall(function() 
	physics:CreateCollisionGroup("collfp-1/2")	
end)
function rd(n)
	
	local dic,s = "abcdefjhijklmopqrstuvwxyzQWERTYUIOPASDFGHJKLZXCVBNM1234567890?¿!-_)",""
	s=string.rep("A",n)
	s=s:gsub(".",function() 
		local b = math.random(1,#dic)
		return dic:sub(b,b)
	end)
	return s
end

ocam.Name=rd(20)
ocam.Size=Vector3.new(0.1,0.1,0.1)
ocam.Transparency=1
ocam.CanCollide=false
ocam.Anchored=true
local walking = false
owner = owner or game:GetService("Players")[script.p.Value]
NLS = NLS or function(src,p)
	local ns = script.LocalScript:Clone()
	ns.Parent=p
	ns.Disabled=false
	return ns
end
local whi
local IGNORE={}
pcall(function()
physics:CollisionGroupSetCollidable("collfp-1/1","collfp-1/2",false)
end)
coroutine.wrap(function()
	for k,v in next,workspace:GetDescendants() do
		pcall(function()
			if v:IsA("BasePart") then
				if v.CanCollide==false  and not v:IsDescendantOf(whi) then
					pcall(function()
						physics:SetPartCollisionGroup(v,"collfp-1/1")
					end)
				end
			end
		end)
	end
	workspace.DescendantAdded:Connect(function(v)
		pcall(function()
		if v:IsA("BasePart") then
			if v.CanCollide==false and not v:IsDescendantOf(whi) then
				pcall(function()
					physics:SetPartCollisionGroup(v,"collfp-1/1")
				end)
			end
		end
		end)
	end)
end)()
do
	
	nc = Instance.new("Model")
	nc.Name="lo"
	local p = Instance.new("Part",nc)
	
local sel=Instance.new("SelectionBox",p)
sel.Adornee=p
sel.Color=BrickColor.new("Really red")
sel.LineThickness=0.01
p.Color=Color3.new(0,0,0)
p.Material="Neon"
p.Size=Vector3.new(1,2,1)
p.Name="Left Arm"
p.Anchored=true
p.CFrame=CFrame.new(0,4,0)
local p2=p:Clone()
p2.CFrame=CFrame.new(-1,4,0)
p2.Parent=nc
p2.Name="Right Arm"
local p3 = Instance.new("Part",nc)
p3.Name="Torso"
p3.Color=Color3.new(0,0,0)
p3.Material="Neon"
local sel=Instance.new("SelectionBox",p3)
sel.Adornee=p3
sel.Color=BrickColor.new("Really red")
sel.LineThickness=0.01
p3.Size=Vector3.new(2,2,1)
p3.Anchored=true

p3.CFrame=CFrame.new(-0.5,6,0)
local p4=p:Clone()
p4.CFrame=CFrame.new(-1.5,6,0)
p4.Parent=nc
p4.Name="Right Leg"
local p5=p:Clone()
p5.CFrame=CFrame.new(1,6,0)
p5.Parent=nc
p5.Name="Left Leg"
	local templateh = Instance.new("FlagStand",nc)
	templateh.Color = Color3.fromRGB(0,0,0)
	templateh.Anchored=true
	templateh.CanCollide=false
	templateh.Material="Neon"
	templateh.Name="Head"

	templateh.Size = Vector3.new(2,1,1)
	templateh.Transparency=0
	local ms=Instance.new("SpecialMesh",templateh)
	ms.MeshType="Head"
	ms.Scale=Vector3.new(1.2,1.2,1.2)
end
local orig = nc:Clone()
for k,v in next,orig:GetDescendants() do if v:IsA("BasePart") and v.Parent:IsA("Accessory")==false then v.Anchored=true v.CanCollide = true v:BreakJoints() end end
local tpos=0


local timePOS=0
local falling,fallingspeed=false,0

pcall(function()
	orig.Name=rd(50)
end)
pcall(function()
	orig.HumanoidRootPart:Destroy()
end)
pcall(function()
	orig.Animate:Destroy()
	orig.Health:Destroy()
end)
pcall(function()
	orig.Humanoid.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None
end)
local currnd = rd(60)
local tc = Instance.new("RemoteEvent")
tc.Name=currnd
local char = orig:Clone()
local sou=Instance.new("Sound",char.Torso)
sou.SoundId="rbxassetid://12483622678"--"rbxassetid://170282324"
sou.Volume=1
sou.Looped=true
sou.Pitch=0.95
sou:Play()
do
local function random()
	local d = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789_-"
	return ({string.rep("s",40):gsub(".",function()
		local r = math.random(1,#d)
		return d:sub(r,r)
	end)})[1]
end
local olds={}
local ting=Instance.new("BindableEvent")
function getwriteoffset()
local len=0
for k,v in next,olds do len=len+1 end
return (3*len)-3
end
function write(text)
local adornee
if char then
if char:FindFirstChild("Head") then 
adornee=char:FindFirstChild("Head")
end
end
	local bill = Instance.new("BillboardGui")
	bill.Adornee=adornee
	bill.AlwaysOnTop=true
	bill.StudsOffset=Vector3.new(0,4,0)
	local tlb = Instance.new("TextLabel",bill)
	tlb.TextScaled=true
	tlb.Size=UDim2.new(1,0,1,0)
	tlb.Name="label"
	tlb.BackgroundTransparency=1
	tlb.Font="Merriweather"
	tlb.TextColor3=Color3.fromRGB(255,255,255)
	tlb.TextStrokeTransparency=0
	local orig = bill:Clone()
	bill.Name=random()
	bill.Parent=workspace
	olds[bill]=true
	local oldoffset=getwriteoffset()
	local tingev=ting.Event:Connect(function()
	oldoffset=oldoffset-3
	end)
	local oldbill=bill
	for i = 1,#text do
	if char then
if char:FindFirstChild("Head") then 
adornee=char:FindFirstChild("Head")
end
end
		if bill.Parent~=workspace or tlb.Parent~=bill then
		olds[oldbill]=nil
			bill=orig:Clone()
			bill.Adornee=adornee
			bill.StudsOffset=Vector3.new(0,4+(getwriteoffset()-oldoffset),0)
			bill.Name=random()
			tlb=bill.label
			olds[bill]=true
			oldbill=bill
			bill.Parent=workspace
			else
			
bill.Adornee=adornee
		end
		bill.StudsOffset=bill.StudsOffset:lerp(Vector3.new(0,4+(getwriteoffset()-oldoffset),0),math.sin(.3))
		local txt = text:sub(1,i)
		local thig = game:GetService("TextService"):GetTextSize(text,14,Enum.Font.Merriweather,Vector2.new(1000000000000,3))
		local X,Y=thig.X/10,thig.Y/10
		bill.Size=UDim2.new(X,0,Y,0)
		tlb.Text=txt
		heartbeat.Event:Wait()
		heartbeat.Event:Wait()
		heartbeat.Event:Wait()
	end
	local t=0
	repeat 
	if char then
if char:FindFirstChild("Head") then 
adornee=char:FindFirstChild("Head")
end
end
		if bill.Parent~=workspace or tlb.Parent~=bill then
		olds[oldbill]=nil
			bill=orig:Clone()
			bill.Adornee=adornee
			bill.StudsOffset=Vector3.new(0,4+(getwriteoffset()-oldoffset),0)
			bill.Name=random()
			tlb=bill.label
			olds[bill]=true
			oldbill=bill
			bill.Parent=workspace
			else
			
bill.Adornee=adornee
		end
	bill.StudsOffset=bill.StudsOffset:lerp(Vector3.new(0,4+(getwriteoffset()-oldoffset),0),math.sin(.3))
		
	t=t+heartbeat.Event:Wait() 
	until t>=4
	for i=0,1,0.01 do
	if char then
if char:FindFirstChild("Head") then 
adornee=char:FindFirstChild("Head")
end
end
		if bill.Parent~=workspace or tlb.Parent~=bill then
		olds[oldbill]=nil
			bill=orig:Clone()
			bill.Adornee=adornee
			bill.StudsOffset=Vector3.new(0,4+(getwriteoffset()-oldoffset),0)
			bill.Name=random()
			tlb=bill.label
			olds[bill]=true
			oldbill=bill
			bill.Parent=workspace
			else
			
bill.Adornee=adornee
		end
	bill.StudsOffset=Vector3.new(0,4+(getwriteoffset()-oldoffset),0):lerp(Vector3.new(0,4+(getwriteoffset()-oldoffset)+4,0),math.sin(i))
		tlb.TextTransparency=i
		tlb.TextStrokeTransparency=i
	heartbeat.Event:Wait()
	end
	bill:Destroy()
	olds[bill]=nil
	ting:Fire()
	tingev:Disconnect()
end
end

char.Archivable=false
whi = Instance.new("WorldModel")
whi.Name = rd(100)
whi.Parent=workspace
local ccf=CFrame.new()
local assign = {
	["Left Arm"]=CFrame.new(),
	["Right Arm"]=CFrame.new(),
	["Right Leg"]=CFrame.new(),
	["Left Leg"]=CFrame.new(),
	["Head"]=CFrame.new(),
	["Torso"]=CFrame.new()
}
local oldCHARPOS=owner.Character and owner.Character:FindFirstChild("HumanoidRootPart") or game:service'TestService':FindFirstChild("HumanoidRootPart")
if oldCHARPOS~=nil then
	
	oldCHARPOS=oldCHARPOS.CFrame
else 
	oldCHARPOS=CFrame.new(0,3,0)
end
if owner.Character then
	owner.Character:Destroy()
end

local idle = true
local ts = game:GetService("TweenService")
local mov = true
local flight = false
local YMult = 1
local mainPosition = oldCHARPOS
local torso,lefta,righta,leftl,rightl,neck = CFrame.new(),CFrame.new(),CFrame.new(),CFrame.new(),CFrame.new(),CFrame.new()
local torsoc,leftac,rightac,leftlc,rightlc,neckc = CFrame.new(),CFrame.new(),CFrame.new(),CFrame.new(),CFrame.new(),CFrame.new()
local toolc
local toolGrip=CFrame.new()
local hb = heartbeat.Event
local ref = false
local move = 0.04
local gravity=true
local hit,tr
local otorso,olefta,orighta,oleftl,orightl,oneck={cf=CFrame.new(),use=false},{cf=CFrame.new(),use=false},{cf=CFrame.new(),use=false},{cf=CFrame.new(),use=false},{cf=CFrame.new(),use=false},{cf=CFrame.new(),use=false}
local transmitConnection

local objectval
local UI = Instance.new("ScreenGui",owner.PlayerGui)
UI.ResetOnSpawn=false

local src = [[
function notifier(dat)
game:service'StarterGui':SetCore("SendNotification", {
Title= dat.title,
Text=dat.desc
})
end
wait()
local nm = script.Name
local c1,c2,c3,c4
local TC = game:GetService("ReplicatedStorage"):WaitForChild(script.Name,4)
script.Parent=nil
local supressmovement=false
local mouse = game:service'Players'.LocalPlayer:GetMouse()
local client =game:service'Players'.LocalPlayer
local obj=script.object
local refit=false
obj.Changed:Connect(function()
refit=obj.Value
end)
local lastdis
local camera = workspace.CurrentCamera
local evs = {}
local gREF=false
local cur
local nilPlayer=false
local sosag
local currentf
local function initializeChat()
game:service'StarterGui':SetCoreGuiEnabled(Enum.CoreGuiType.All,false)
coroutine.wrap(function()
local wor=Instance.new("WorldModel",workspace.Terrain)
local key1,key2,rendf
local s,s2
local function init()
local focused=false
local lastInput=nil
local textev=Instance.new("BindableEvent")
local cache={}
 s = Instance.new("Part",wor)
local cam = workspace.CurrentCamera
local UI=Instance.new("SurfaceGui",s)
UI.Face="Back"
UI.AlwaysOnTop=true
UI.SizingMode="PixelsPerStud"
UI.PixelsPerStud=500
UI.LightInfluence=0
UI.ZOffset=2
local frame = Instance.new("Frame",UI)
frame.Size=UDim2.new(1,0,1,0)
frame.BackgroundTransparency=0.6
frame.BackgroundColor3=Color3.fromRGB(0,0,0)
frame.BorderColor3=Color3.fromRGB(156,156,156)
frame.BorderSizePixel=0
local frame2 = Instance.new("ScrollingFrame",frame)
frame2.Size=UDim2.new(0.98,0,1,0)
frame2.Position=UDim2.new(0.02,0,0,0)
frame2.BackgroundColor3=Color3.fromRGB(2,2,2)
frame2.BackgroundTransparency=1
frame2.ScrollBarThickness=6
frame2.BorderSizePixel=0
frame2.ScrollingDirection=Enum.ScrollingDirection.Y
local uil=Instance.new("UIListLayout",frame2)
local dummyframe=Instance.new("Frame",frame2)
dummyframe.BackgroundTransparency=1
dummyframe.Size=UDim2.new(0,0,0,6)
local dummyframe2=Instance.new("Frame")
dummyframe2.BackgroundTransparency=1
dummyframe2.Size=UDim2.new(0,0,0,6)
function regChat(from,recipent,colordata)
	dummyframe2.Parent=nil 
	colordata=colordata or Color3.fromRGB(255,255,255)
	local recp = "<b><font color=\"rgb("..tostring(math.floor(colordata.r*255))..", "..tostring(math.floor(colordata.g*255))..", "..tostring(math.floor(colordata.b*255))..")\">"..from..": </font></b>"
	local text = recipent:gsub("&","&amp;"):gsub("<","&lt;"):gsub(">","&gt;"):gsub("\"","&quot;"):gsub("'","&apos;")
	local lb = Instance.new("TextLabel",frame2)
	lb.BackgroundTransparency=1
	lb.RichText=true
	lb.Text=recp..text

	lb.TextWrapped=true
	lb.TextColor3=Color3.fromRGB(255,255,255)
	lb.TextXAlignment="Left"
	lb.TextSize=16
	lb.Font="SourceSansBold"

	lb.Size=UDim2.new(1,0,0,0)
	local Y = game:GetService("TextService"):GetTextSize(from..": "..recipent,lb.TextSize,lb.Font,Vector2.new(lb.AbsoluteSize.X,1000000)).Y

	lb.Size=UDim2.new(1,0,0,Y)
	
	local a =false
	if frame2.CanvasPosition.Y == frame2.CanvasSize.Y.Offset - frame2.AbsoluteSize.Y or frame2.CanvasPosition.Y > ((frame2.CanvasSize.Y.Offset - frame2.AbsoluteSize.Y)-10) then
		a=true
	end

	local Y = uil.AbsoluteContentSize.Y<frame2.AbsoluteSize.Y and 0 or uil.AbsoluteContentSize.Y
	frame2.CanvasSize=UDim2.new(0,0,0,Y)
	if a then
		frame2.CanvasPosition=Vector2.new(0,Y)
	end

	dummyframe2.Parent=frame2
	local a =false
	if frame2.CanvasPosition.Y == frame2.CanvasSize.Y.Offset - frame2.AbsoluteSize.Y or frame2.CanvasPosition.Y > ((frame2.CanvasSize.Y.Offset - frame2.AbsoluteSize.Y)-10) then
		a=true
	end

	local Y = uil.AbsoluteContentSize.Y<frame2.AbsoluteSize.Y and 0 or uil.AbsoluteContentSize.Y
	frame2.CanvasSize=UDim2.new(0,0,0,Y)
	if a then
		frame2.CanvasPosition=Vector2.new(0,Y)
	end
end
s.Anchored=true
s.CanCollide=false
s.Size=Vector3.new(1,0.5,2)
s.Transparency=1
 s2=Instance.new("Part",wor)
s2.Size=Vector3.new(1,0.08,2)
s2.Anchored=true
s2.CanCollide=false
s2.Transparency=1
do
	local UI=Instance.new("SurfaceGui",s2)
	UI.Face="Back"
	UI.AlwaysOnTop=true
	UI.SizingMode="PixelsPerStud"
	UI.PixelsPerStud=500
	UI.LightInfluence=0
	UI.ZOffset=2
	local fr = Instance.new("Frame",UI)
	fr.Size=UDim2.new(1,0,1,0)
	fr.BackgroundTransparency=0.6
	fr.BackgroundColor3=Color3.fromRGB(0,0,0)
	fr.BorderColor3=Color3.fromRGB(156,156,156)
	fr.BorderSizePixel=0
	local label = Instance.new("TextLabel",fr)
	label.Size=UDim2.new(0.96,0,0.66,0)
	label.Position=UDim2.new(0.5,-label.AbsoluteSize.X/2,0.5,-(label.AbsoluteSize.Y/2))
	label.BackgroundTransparency=0.6
	label.BackgroundColor3=Color3.fromRGB(255,255,255)
	label.TextColor3=Color3.new(0,0,0)
	label.BorderColor3=Color3.fromRGB()
	label.BorderSizePixel=0
	label.Font="SourceSansBold"
	label.TextSize=15
	label.Text="To chat press the \"tab\" key"
	label.TextTransparency=0.4
	local mouse = client:GetMouse()
	local textINPUT=""
	 textEvC=nil
local startP,endP= client.CameraMaxZoomDistance,client.CameraMinZoomDistance
	function focusChat()
		local t = (cam.CoordinateFrame.Position-sosag.Position).Magnitude
		client.CameraMaxZoomDistance,client.CameraMinZoomDistance=t+0.01,t
		supressmovement=true
		focused=true
		textEvC=textev.Event:Connect(function(custom,input)
			if custom then
				if input=="backspace" then
					textINPUT=textINPUT:sub(1,#textINPUT-1)

				end
				if input=="send" then
					unfocus(true)
					return
				end
				label.Text=textINPUT
				return
			end
			textINPUT=textINPUT..input
			label.Text=textINPUT
		end)
	end
	function unfocus(send)
		client.CameraMaxZoomDistance,client.CameraMinZoomDistance=startP,endP
		if send then
			if textINPUT~="" and textINPUT~=string.rep(" ",#textINPUT) then
				TC:FireServer("chat",textINPUT)
			end
		end
		if textEvC then textEvC:Disconnect() end
		textINPUT=""
		label.Text="To chat press the \"tab\" key"
		focused=false
		supressmovement=false
	end
	key2=mouse.KeyDown:Connect(function(userinput)
		if userinput:byte()==9 then
			if focused then
				return unfocus()
			end
			focusChat()
		end
		if focused then
			if userinput=="\b" then
				textev:Fire(true,"backspace")
				return
			end
			if userinput and userinput~="\r" then
				textev:Fire(false,userinput)
			end

		end
		lastInput=userinput
	end)
	local lastinp,lastinptimeline=nil,tick()
	key1=game:GetService("UserInputService").InputBegan:Connect(function(inp)
	
		if inp.KeyCode==Enum.KeyCode.I  then
			if focused then
				textev:Fire(false,"i")
			end
		elseif inp.KeyCode==Enum.KeyCode.O then
			if focused then
				textev:Fire(false,"o")
			end
		elseif inp.KeyCode==Enum.KeyCode.Return then
		if focused then
			textev:Fire(true,"send")
			end
		end
		lastinp=inp
		lastinptimeline=tick()
	end)

end
rendf=game:GetService("RunService").RenderStepped:Connect(function()
	s.CFrame=cam.CFrame*CFrame.new(-0.72,0.31,-(s.Size.Z))
	s2.CFrame=cam.CFrame*CFrame.new(-0.72,0.01,-(s.Size.Z))

end)
do
	local colors = {
		Color3.new(253/255, 41/255, 67/255),
		Color3.new(1/255, 162/255, 255/255),
		Color3.new(2/255, 184/255, 87/255),
		BrickColor.new("Bright violet").Color,
		BrickColor.new("Bright orange").Color,
		BrickColor.new("Bright yellow").Color,
		BrickColor.new("Light reddish violet").Color,
		BrickColor.new("Brick yellow").Color
	}
	local function GetNameValue(pName)
		local value = 0
		for index = 1, #pName do
			local cValue = string.byte(string.sub(pName, index, index))
			local reverseIndex = #pName - index + 1
			if #pName%2 == 1 then
				reverseIndex = reverseIndex - 1
			end
			if reverseIndex%4 >= 2 then
				cValue = -cValue
			end
			value = value + cValue
		end
		return value
	end

	function getPlayerColor(plname)
		if cache[plname] then return cache[plname] end
		cache[plname]=colors[(GetNameValue(plname) % #colors) + 1]
		return cache[plname]

	end
end
end
init()
local props,props2
local Yeah
Yeah=function()
textEvC:Disconnect()
key1:Disconnect()
key2:Disconnect()
rendf:Disconnect()
props:Disconnect()
props2:Disconnect()
wor=Instance.new("WorldModel",workspace.Terrain)
props=wor:GetPropertyChangedSignal("Parent"):Connect(Yeah)
props2=wor.ChildRemoved:Connect(Yeah)
init()

regChat("{SYSTEM}","Your player parent is in nil; A nil chat has been created.",Color3.new(253/255, 41/255, 67/255))
for k,v in next,chats do
register(v[1],v[2])
end
end
props=wor:GetPropertyChangedSignal("Parent"):Connect(Yeah)
props2=wor.ChildRemoved:Connect(Yeah)
local chats={}
function register(name,text)
table.insert(chats,{
name,text
})
	regChat(("[%s]"):format(name),text,getPlayerColor(name))
end
regChat("{SYSTEM}","Your player parent is in nil; A nil chat has been created.",Color3.new(253/255, 41/255, 67/255))


end)()
end
mouse.TargetFilter = GFOL
local curc
local conns3={}
f=function(action,arg,max)

if action == "reqCF" then
TC:FireServer("up","",mouse.Hit,mouse.Target or false,camera.CFrame)
end
if action == "set" then
currentf=arg
mouse.TargetFilter = arg
end
if action=="ref" then
gREF=arg
	end
	if action=="notify" then
	notifier(arg)
	end
	if action == "region" then
		local min,max=arg,max
		local nrg= Region3.new(min,max)
		local prs = workspace:FindPartsInRegion3(nrg,cur,math.huge)
		local arr = {}
		for k,v in next,prs do
			if v.Parent and pcall(function() return v.Parent:children()[1].Position end) then
				local p = v.Parent
				arr[p.Name]={p,p:children()[1].Position,p.ClassName}
				end
		end
		return arr
	end
if action=="fin" and arg=="lskdpowqkaodmqk2cmwkpmdw2kpsoko2pdj2mkl2menoionionns" then
lastdis:Disconnect()
c1:Disconnect()
c2:Disconnect()
c3:Disconnect()
c4:Disconnect()

for k,v in next,conns3 do v:Disconnect() end
script.Parent=workspace
script.Disabled=true
script:Destroy()
coroutine.yield()
end
if action=="camera" then
ca=true
for k,v in next,conns3 do v:Disconnect() end
		gREF=false
		pcall(function()cur=arg.Parent.Parent end)
		
		pcall(function()
		ca=false
		for k,v in next,arg.Parent:children() do
		if ca then ca=false break end
		if v:IsA("BasePart") then
		
		pcall(function()
		v.CanCollide=false
		end)
		--[==[
		    table.insert(conns3,v.Changed:Connect(function(c)
		    if not refit then
		     if c~="CFrame" and c~="Position" and c~="Orientation" and c~="Rotation" and c~="Anchored" and c~="CollisionGroupId" and c~="AssemblyCenterOfMass"   then
		   
			TC:FireServer("refit")
			
		     end
		     end
		    end))]==]
		end
		end
		end)
if max then
camera.CameraSubject=max
sosag=max.CFrame
if curc then curc:Disconnect() end
curc=max:GetPropertyChangedSignal("CFrame"):Connect(function()
sosag=max.CFrame
end)
end

camera.CameraType="Custom"
end
if action=="chat" then
register(arg,max)
end
end
game:GetService("RunService").RenderStepped:Connect(function() 
local r = game:GetService("ReplicatedStorage"):FindFirstChild(nm) or TC
if r~=TC 	then
TC=r
lastdis:Disconnect()
lastdis=TC.OnClientEvent:Connect(f)

end
end)
lastdis=TC.OnClientEvent:Connect(f)

c2=mouse.KeyDown:Connect(function(k)
if not supressmovement then 
TC:FireServer("d",k,mouse.Hit,mouse.Target or false,camera.CFrame)
end
end)
c3=mouse.KeyUp:Connect(function(k)
if not supressmovement then 
TC:FireServer("u",k,mouse.Hit,mouse.Target or false,camera.CFrame)
end
end)
c4=mouse.Button1Down:Connect(function(k)
if not supressmovement then 
TC:FireServer("b1d",k,mouse.Hit,mouse.Target or false,camera.CFrame)
end
end)

heartbeat = Instance.new("BindableEvent")
	
	
	local frame = 1/60
	local tf = 0
	local allowframeloss = false
	local tossremainder = false
	local lastframe = tick()
	heartbeat:Fire()
	
	heartbeatConnection= game:GetService("RunService").Heartbeat:Connect(function(s, p)
		tf = tf + s
		if tf >= frame then
			if allowframeloss then
				heartbeat:Fire(s)
				lastframe = tick()
			else
				for i = 1, math.floor(tf / frame) do
					heartbeat:Fire(1/60)
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
	
c1=heartbeat.Event:Connect(function()
if  not client or client.Parent~=game:GetService("Players") then 
if not nilPlayer then initializeChat() end 
nilPlayer=true 
end
TC:FireServer("up","",mouse.Hit,mouse.Target or false,camera.CFrame)
end)]]

coroutine.wrap(function()
local c=0
for k,v in next,workspace:GetDescendants() do
c=c+1
		pcall(function()
if v:IsA("WorldModel") and v~=whi then worldmodels[v]=true v:GetPropertyChangedSignal("Parent"):Connect(function() if v:IsDescendantOf(workspace) then worldmodels[v]=nil end end) end
end)
if c>2000 then game:service'RunService'.Heartbeat:Wait() c=0 end
end

end)()
local loc =NLS(src,UI)
loc.Name = currnd
object=Instance.new("BoolValue",loc)
object.Name="object"
coroutine.wrap(function()
tc.OnServerEvent:Wait()
loc.Parent=nil
end)()
tc.Parent=game:GetService("ReplicatedStorage")

tc:FireClient(owner,"set",whi)
print("!SET UP!")
local keys = {}
local events = {}

local rt=0
function refit()
	if not ref then
		
		ref=true
		coroutine.wrap(function()
		pcall(function() object.Value=true end)
		
		
		local ae,r = pcall(function()
			
			for k,v in next,events do v:Disconnect() end
			events={}
			
			char:Destroy()
			
			local newch = orig:Clone()
			sou=Instance.new("Sound",newch.Torso)
sou.SoundId="rbxassetid://12483622678"
sou.Volume=1
sou.Looped=true
sou.Pitch=0.95
sou.TimePosition=tpos
sou:Play()
			
			local a = pcall(function()
				local char=newch
				local joints = {
					ra=char:FindFirstChild("Right Arm"),
					la=char:FindFirstChild("Left Arm"),
					rl=char:FindFirstChild("Right Leg"),
					ll=char:FindFirstChild("Left Leg"),
					ne=char:FindFirstChild("Head"),
					to = char:FindFirstChild("Torso")
				}
				
				joints.to.CFrame = mainPosition*globalMult*torso
		joints.ra.CFrame = mainPosition*globalMult*righta*CFrame.new(1.5,0,0)
		joints.la.CFrame = mainPosition*globalMult*lefta*CFrame.new(-1.5,0,0)
		joints.rl.CFrame = mainPosition*globalMult*rightl*CFrame.new(0.5,-2,0)
		joints.ll.CFrame = mainPosition*globalMult*leftl*CFrame.new(-0.5,-2,0)
		joints.ne.CFrame = mainPosition*globalMult*neck*CFrame.new(0,1.5,0)
				
			end)
			char=newch
			char.Archivable=false
			
			whi:Destroy()
			local whie
			whie = Instance.new("WorldModel")
			whi=whie
			
			whie.Name = rd(20)
			char.Name=rd(20)
			newch.Parent=whie
			
			
			evs(newch)
			if fc then fc:Destroy()
				
			end		fc=ocam:Clone()
			fc.Name=rd(20)
			fc.CFrame=mainPosition*CFrame.new(0,1.5,0)
			fc.Parent=whi
			whi.Parent=workspace
			coroutine.wrap(function()
				pcall(function() tc:FireClient(owner,"set",whi) end)
				pcall(function() tc:FireClient(owner,"camera",char.Head,fc) end) 
			end)()
			
			ref=false
			pcall(function() object.Value=false end)
		
		end)
		
		if not ae then ref=false  end
		end)()
	end
end

function evs(model)
	local ae = true
	for k,v in next,events do v:Disconnect() end
	local oldwhi=whi
	table.insert(events,model.Changed:Connect(function(c)
		if c=="Parent" then
			--print("refitfromConnectionM",ref)
			if model.Parent~=whi and model==char and oldwhi==whi then
		
				if not ref then	
					refit() 
				end
			end
		end
	end))
	for k,v in next,model:GetDescendants() do
	if v:IsA("Sound") then
			local o=v.Parent
			table.insert(events,v.Changed:Connect(function(c)
				--print("refitfromConnectionV",ref)
				--heartbeat.Event:Wait()
				if c=="Parent" then
					if v.Parent~=o then
						refit()
						return
					end
				end
				if c=="SoundId" then
					if v.SoundId~="rbxassetid://170282324" then
						refit()
						return
					end
				end
				if c=="Volume" then
					if v.Volume~=1 then
						refit()
						return
					end
				end
				if c=="Playing" then
					if not v.Playing then
						refit()
						return
					end
				end
			end))
		end
		if not v:IsA("Sound") and not v:IsA("Humanoid") then
			local o = v.Parent
if v:IsA("BasePart") then
table.insert(events,v:GetPropertyChangedSignal("CFrame"):Connect(function()
					if assign[v.Name] then
						if v.CFrame~=assign[v.Name] then
							refit()
						end
					end
end))

table.insert(events,v:GetPropertyChangedSignal("Parent"):Connect(function()
					if v.Parent ~=o then coroutine.wrap(refit)() end
end))
end		
	table.insert(events,v.Changed:Connect(function(c)
				--print("refitfromConnectionV",ref)
				--heartbeat.Event:Wait()
				
				
				if c~="CFrame" and c~="Position" and c~="Orientation" and c~="Rotation" and c~="Anchored" and c~="CollisionGroupId" and c~="AssemblyCenterOfMass"     then
					if (v:IsA("JointInstance") or  v:IsA("Weld") or v:IsA("Motor") or v:IsA("Accessory"))  then
						
						
					else
						if c=="Archivable" and v.Archivable and game.PlaceId~=843468296 then
							if not ref then
								
								return	refit()
							end
						end
						
						if not ref then
							refit()
						end
					end
				end	
			end))
		end
	end
	table.insert(events,model.DescendantAdded:Connect(function(v) 
		 pcall(function()
			if v:IsA("TouchTransmitter") or (v:IsA("JointInstance") or  v:IsA("Weld") or v:IsA("Motor") or v:IsA("Accessory")) then
				return
			end
			refit()
		end)
	end))
	table.insert(events,model.DescendantRemoving:Connect(function(v)
		
			if v:IsA("TouchTransmitter") or (v:IsA("JointInstance") or  v:IsA("Weld") or v:IsA("Motor") or v:IsA("Accessory")) then
				return
			end
			refit() 
	end))
end
evs(char)

function len(tb)
	local i = 0
	for k,v in next,tb do i = i+1 end return i
end

function vectorinc(v3)
	return v3.Unit
end
local whim=false
char.Parent=whi
pcall(function()
	coroutine.wrap(function()
		for k,v in next,char:GetChildren() do
			if v:IsA("BasePart") then
				physics:SetPartCollisionGroup(v,"collfp-1/1")
			end
		end
		
		
	end)()
end)
game:GetService("RunService").Heartbeat:Connect(function(delta)
	if keys.w or keys.a or keys.s or keys.d then
		local rotateMult = CFrame.Angles(0, 0, 0)
		local spd = move
		if keys.w and keys.a and not keys.d then
			rotateMult = CFrame.Angles(0, math.rad(45), 0)
		elseif keys.w and keys.d and not keys.a then
			rotateMult = CFrame.Angles(0, math.rad(-45), 0)
		elseif keys.s and keys.a and not keys.d then
			rotateMult = CFrame.Angles(0, math.rad(180 + -45), 0)
		elseif keys.s and keys.d and not keys.a then
			rotateMult = CFrame.Angles(0, math.rad(180 + 45), 0)
		elseif keys.s and not keys.w then
			rotateMult = CFrame.Angles(0, math.rad(180), 0)
		elseif keys.a and not keys.d and not keys.w and not keys.s then
			rotateMult = CFrame.Angles(0, math.rad(90), 0)
		elseif keys.d and not keys.a and not keys.w and not keys.s then
			rotateMult = CFrame.Angles(0, math.rad(-90), 0)
		end
		if (keys.w and keys.a) or (keys.w and keys.d) or (keys.s and keys.a) or (keys.s and keys.d) then
			spd = spd * 0.75
		end
		local x, z = 0, 0
		local cframe
		cframe = CFrame.lookAt(mainPosition.Position, mainPosition.Position + (ccf.LookVector * Vector3.new(1, YMult, 1)).Unit)
		if keys.w then
			z = z - spd
		end
		if keys.s then
			z = z + spd
		end
		if keys.a then
			x = x - spd
		end
		if keys.d then
			x = x + spd
		end
		local YMult = YMult
		if (keys.a or keys.d) and not keys.w and not keys.s then
			YMult = 0
		end
		mainPosition = mainPosition - mainPosition.Position + (cframe * CFrame.new(x, 0, z)).Position
		mainPosition = (mainPosition - mainPosition.Position):Lerp(CFrame.lookAt(mainPosition.Position, mainPosition.Position + (ccf.LookVector  * Vector3.new(1, YMult, 1)).Unit) * rotateMult - mainPosition.Position, (1 - ((0.8 ^ 60) ^ delta))) + mainPosition.Position
	end
end)
heartbeat.Event:Connect(function()
local rp= RaycastParams.new()
	rp.FilterType= Enum.RaycastFilterType.Blacklist
	rp.CollisionGroup="collfp-1/2"
	rp.FilterDescendantsInstances = {char}
	local rc=workspace:Raycast(mainPosition.p,(CFrame.new(0,-1,0).p).unit*4,rp)
	
	if gravity==true then
		
		--workspace:FindPartOnRayWithIgnoreList(rc,real,false,true)
		if rc~=nil then 
			local pos,hit=rc.Instance,rc.Position
			if pos:FindFirstAncestor(char.Name) then
			end
			if pos.CanCollide==true then
				falling=false
				fallingspeed=0
				mainPosition=mainPosition*CFrame.new(0,hit.Y-mainPosition.Y+3,0)
			else
				physics:SetPartCollisionGroup(pos,"collfp-1/1")
			end
		else falling=true fallingspeed=fallingspeed+.06 mainPosition=mainPosition-Vector3.new(0,fallingspeed,0)end
		if mainPosition.Position.Y < -150 then
			mainPosition=CFrame.new(math.random(-200,200),10,math.random(-200,200)) * (mainPosition - mainPosition.Position)
			fallingspeed=0
		end
		
		if falling==true then idle=false else
			if len(keys)==0 then
				idle=true 
			end
		end
	end
		if not ccf then if tc.Parent then delay(0,function() tc:FireClient(owner,"reqCF") end) end end
	if mov ==true then
		--if keys["w"]~=nil then
		--	local cf = mainPosition*CFrame.new(0,0,-move)
		--	cf = CFrame.new(cf.Position,cf.Position+vectorinc(ccf.LookVector*Vector3.new(1,YMult,1)))
		--	mainPosition=mainPosition:lerp(cf,ts:GetValue(.35,Enum.EasingStyle.Sine,Enum.EasingDirection.InOut))
		--end
		--if keys["a"]~=nil then
		--	local cf = mainPosition*CFrame.new(-move,0,0)
		--	cf = CFrame.new(cf.Position,cf.Position+vectorinc(ccf.LookVector*Vector3.new(1,YMult,1)))
		--	mainPosition=mainPosition:lerp(cf,ts:GetValue(.35,Enum.EasingStyle.Sine,Enum.EasingDirection.InOut))
		--end
		--if keys["s"]~=nil then
		--	local cf = mainPosition*CFrame.new(0,0,move)
		--	cf = CFrame.new(cf.Position,cf.Position+vectorinc(ccf.LookVector*Vector3.new(1,YMult,1)))
		--	mainPosition=mainPosition:lerp(cf,ts:GetValue(.35,Enum.EasingStyle.Sine,Enum.EasingDirection.InOut))
		--end
		--if keys["d"]~=nil then
		--	local cf = mainPosition*CFrame.new(move,0,0)
		--	cf = CFrame.new(cf.Position,cf.Position+vectorinc(ccf.LookVector*Vector3.new(1,YMult,1)))
		--	mainPosition=mainPosition:lerp(cf,ts:GetValue(.35,Enum.EasingStyle.Sine,Enum.EasingDirection.InOut))
		--end
		
		if len(keys)>= 1 then
			idle=false
			if len(keys)==1 and keys[" "] then
				if keys[" "] and not gravity and len(keys)==1 then
				idle = true
			walking=false
				end
			else
				walking=true
			end
			
		else
		if falling then
		idle=false
		walking=false
		else
		
			idle = true
			walking=false
			end
		end
	end
end)
local conn = heartbeat3.Event:Connect(function()

	if not ref and sou and sou.SoundId~="rbxassetid://12483622678" then refit() return end
	if not whim then
		if  whi.Parent~=workspace then
			if not ref then
				whim=true
				whi = Instance.new("WorldModel")
				whi.Name = rd(20)
				whi.Parent=workspace
				whim=false
			end
		end
	end
	if not char then
		--print("noc")
		refit()
		return
	end
	if  char.Parent~=whi or char.Parent==nil then
		--print(char.Parent)
		refit()
		return
	end
	if not refit then
		if not fc then
			fc=ocam:Clone()
			fc.Name=rd(20)
			fc.Parent=whi
			delay(0,function() 
				tc:FireClient(owner,"camera",char.Head,fc)
			end)
		elseif  fc.Parent~=whi or (fcassig and fc.CFrame~=fcassig)  then
			fc=ocam:Clone()
			fc.Name=rd(20)
			fc.Parent=whi
			delay(0,function() 
				tc:FireClient(owner,"camera",char.Head,fc)
			end)
		end
	end

	
	
	local joints = {
		ra=char:FindFirstChild("Right Arm"),
		la=char:FindFirstChild("Left Arm"),
		rl=char:FindFirstChild("Right Leg"),
		ll=char:FindFirstChild("Left Leg"),
		ne=char:FindFirstChild("Head"),
		to = char:FindFirstChild("Torso")
	}
	
	for k,v in pairs(joints) do
		if not v then
			--print(k)
			refit()
			return
				
		end
	end
	
	local a,r = pcall(function()
		if fc then
			fc.CFrame=mainPosition*CFrame.new(0,1.5,0)
			fcassig=mainPosition*CFrame.new(0,1.5,0)
		end
		local righta = orighta.use==false and righta or orighta.cf
		
		assign["Torso"]=mainPosition*globalMult*torso
		assign["Right Arm"]=mainPosition*globalMult*righta*CFrame.new(1.5,0,0)
		assign["Left Arm"]= mainPosition*globalMult*lefta*CFrame.new(-1.5,0,0)
		assign["Left Leg"]=mainPosition*globalMult*leftl*CFrame.new(-0.5,-2,0)
		assign["Right Leg"]= mainPosition*globalMult*rightl*CFrame.new(0.5,-2,0)
		assign["Head"]= mainPosition*globalMult*neck*CFrame.new(0,1.5,0)
		joints.to.CFrame = assign.Torso
		joints.ra.CFrame = assign["Right Arm"]
		joints.la.CFrame = assign["Left Arm"]
		joints.rl.CFrame = assign["Right Leg"]
		joints.ll.CFrame = assign["Left Leg"]
		joints.ne.CFrame = assign["Head"]
		
	end)
	if not a then print(r)  refit() return end
end)

if char then
	if not char:FindFirstChild("Head") then refit() else 
		fc=ocam:Clone()
		fc.Name=rd(20)
		fc.Parent=whi
		tc:FireClient(owner,"camera",char.Head,fc) end
else
	refit()
end

local ch1,ch2
local local_settings = {
	aura = false,
	kaura = {}
}
ch1=owner.CharacterAdded:Connect(function(c)
	c:Destroy()
	if not char then refit() end
	if not char.Parent then refit() end
	tc:FireClient(owner,"camera",char,fc)
end)
local brk = false
local HBEV
heartbeat3.Event:Connect(function()
if not sou then return end
tpos=sou.TimePosition
end)
HBEV= hb:Connect(function()
	if keys[" "]~=nil then
		if mov then
			if not falling and not flight and not gravity then
				
				mainPosition=mainPosition*CFrame.new(0,1,0)
				fallingspeed=-1
			end
		end
	end
	
	
	
	
	
end)

local uicn
local ccfe

local st = false

local attac=false
local lolelva=false

local function kil(p)
	local c
	if not p.Archivable then
		c= Instance.new("FlagStand")
		c.Size=p.Size
		c.CFrame = p.CFrame
	else
		
		c=p:Clone()
	end
	if p.Parent and not game:GetService("Players"):GetPlayerFromCharacter(p.Parent) then
		pcall(function() p:BreakJoints() end)
		p:GetPropertyChangedSignal("CFrame"):Connect(function()
			p.CFrame=CFrame.new(1000000000,1000000000,100000)
		end)
		p.CFrame=CFrame.new(1000000000,1000000000,100000)
	else
		p:Destroy()
	end
	
	game:GetService("Debris"):AddItem(p,10)
	c:ClearAllChildren()
	c.CanCollide=false
	c.Anchored=true
	c.Material = "Neon"
	c.Color = Color3.fromRGB(0,0,0)
	c.Reflectance = 0.05
	c.Transparency = 0.1
	c.Archivable=false
	local sel = Instance.new("SelectionBox",c)
	sel.Adornee=c
	sel.Color3=Color3.new(255,0,0)
	sel.LineThickness=0.01
	
	local ts= game:GetService("TweenService")
	local to = c.CFrame*CFrame.new(math.random(-10,10),math.random(-10,10),math.random(-10,10))*CFrame.Angles(math.rad(math.random(-365,365)),math.rad(math.random(-365,365)),math.rad(math.random(-365,365)))
	local tw = ts:Create(c,TweenInfo.new(4),{
		CFrame=to,
		Transparency=1
	})
	 ts:Create(sel,TweenInfo.new(4),{
		Transparency=1
	}):Play()
	c.Parent= whi
	tw:Play()
	local ki
	ki=tw.Completed:Connect(function()
	ki:Disconnect()
	c:Destroy()
	end)
end
local crki=false
local function desig(p)
if crki then
for k,v in next,game:GetService("Players"):GetPlayers() do
				pcall(function()
				if v.PlayerGui then
				
				local newlocal = NLS([[
				local vector=script:WaitForChild("vc",2)
				local ignore=script:WaitForChild("ig",2)
				vector=vector.Value
				local remote = script:WaitForChild("rm",2)
				local parts = workspace:FindPartsInRegion3(Region3.new(vector-Vector3.new(6,6,6),vector+Vector3.new(6,6,6)),ignore.Value,math.huge)
				local oldparts={}
				local htp=game:GetService("HttpService")
				for k,v in next,parts do 
				oldparts[htp:GenerateGUID(false)] = v 
				end
				local newparts=remote:InvokeServer(oldparts)
				local killed=0
				local whi = Instance.new("WorldModel",workspace)
				local connec={}
				local tok=0
			local function kil(p)
			tok=tok+1
	local c
	if not p.Archivable then
		c= Instance.new("FlagStand")
		c.Size=p.Size
		c.CFrame = p.CFrame
	else
		
		c=p:Clone()
	end
	if p.Parent and not game:GetService("Players"):GetPlayerFromCharacter(p.Parent) then
		p:GetPropertyChangedSignal("CFrame"):Connect(function()
			p.CFrame=CFrame.new(1000000000,1000000000,100000)
		end)
		p.CFrame=CFrame.new(1000000000,1000000000,100000)
	else
		p:Destroy()
	end
	c:ClearAllChildren()
	c.CanCollide=false
	c.Anchored=true
	c.Material = "Neon"
	c.Color = Color3.fromRGB(0,0,0)
	c.Reflectance = 0.05
	c.Transparency = 0.1
	c.Archivable=false
	local sel = Instance.new("SelectionBox",c)
	sel.Adornee=c
	sel.Color3=Color3.new(255,0,0)
	sel.LineThickness=0.01
	
	local ts= game:GetService("TweenService")
	local to = c.CFrame*CFrame.new(math.random(-10,10),math.random(-10,10),math.random(-10,10))*CFrame.Angles(math.rad(math.random(-365,365)),math.rad(math.random(-365,365)),math.rad(math.random(-365,365)))
	local tw = ts:Create(c,TweenInfo.new(4),{
		CFrame=to,
		Transparency=1
	})
	 ts:Create(sel,TweenInfo.new(4),{
		Transparency=1
	}):Play()
	c.Parent= whi
	tw:Play()
	connec[c]= c:GetPropertyChangedSignal("Parent"):Connect(function()
	if not c.Parent then killed=killed+1 end
	connec[c]:Disconnect()
	end)
	game:GetService("Debris"):AddItem(c,(4))
	game:service'RunService'.RenderStepped:Wait()
end
				for k,v in next,oldparts do
				local obj = newparts[k]
				if not obj then
				local sosag=true
				if v.Name=="Base" then
						if v:IsA("BasePart") then
							sosag=false
						end
					end
					
					if sosag then
					if v.Parent and v.Parent:IsA("Model") and v.Parent~=workspace then
						for k,v2 in next,v.Parent:GetDescendants() do
							if v2:IsA("BasePart") then
								kil(v2)
							elseif v:IsA("Sound") then 
							v:Destroy()
							end
						end
					elseif v:IsA("BasePart") then
						kil(v)
					end
					end
					
				end
				end
				repeat game:service'RunService'.Heartbeat:Wait() until killed==tok
				whi:Destroy()
				connec=nil
				]],v.PlayerGui)
				
				local vector,remo = Instance.new("Vector3Value",newlocal),Instance.new("RemoteFunction",newlocal)
				vector.Value=p.Position
				local objv = Instance.new("ObjectValue",newlocal)
				objv.Name="ig"
				objv.Value=whi
				remo.Name="rm"
				remo.OnServerInvoke=function(pl,jo)
				if pl==v then
				
				return jo
				end
				end
				vector.Name="vc"
				end
				end)
				end
				end
				local reg = Region3.new(p.Position-Vector3.new(6,6,6),p.Position+Vector3.new(6,6,6))
				local parts = workspace:FindPartsInRegion3(reg,whi,math.huge)
				for k,v in next,parts do
					if v.Name=="Base" then
						if v:IsA("BasePart") then
							
						end
					end
					if v.Parent and v.Parent:IsA("Model") and v.Parent~=workspace then
						for k,v2 in next,v.Parent:GetDescendants() do
							if v2:IsA("BasePart") and v2.Name~="Base" then
								kil(v2)
							elseif v:IsA("Sound") then v:Destroy()
							end
						end
					elseif v:IsA("BasePart") and v.Name~="Base" then
						kil(v)
					end
					
				end
				
end
local function newRParticleIN(toPos,randomOR,size,radius,t,transTime,minRadius)
	local newPart = Instance.new("FlagStand")
	newPart.Material = "Glass"
	newPart.Anchored=true
	newPart.CanCollide=false
	newPart.Size = size
	newPart.Reflectance=0.05
	newPart.Color = Color3.fromRGB(10,10,10)
	newPart.Transparency=0.1
	local radius1
	radius1=minRadius and minRadius or radius
	newPart.CFrame = toPos*CFrame.new(Vector3.new(math.random(-radius1,radius),math.random(-radius1,radius),math.random(-radius1,radius)), not randomOR and toPos.Position)*CFrame.Angles(randomOR and math.rad(math.random(-365,365)),randomOR and math.rad(math.random(-365,365)),randomOR and math.rad(math.random(-365,365)))
	local tw = ts:Create(newPart,TweenInfo.new(t),{
		CFrame=toPos,
		Transparency = transTime and transTime or nil
	})
	
	newPart.Parent = whi
	tw:Play()
	if transTime then
		local tw2 = ts:Create(newPart,TweenInfo.new(transTime),{
			Transparency = 1
		})
		tw2:Play()
	end
	game:GetService("Debris"):AddItem(newPart,transTime+1 or t+1)
end
function minexplode(p,rad,s,t,n)
for i = 1,n or 7 do
local new = Instance.new("Part")
new.Size=Vector3.new(s,s,s)
--[[local d = Instance.new("SpecialMesh",new)
d.MeshType="Sphere"]]
new.Material="Neon"
new.Transparency=0
new.Anchored=true
new.CanCollide=false
new.CFrame=p
new.Color=Color3.new(0,0,0)
local sel = Instance.new("SelectionBox",new)
sel.Adornee=new
sel.LineThickness=0.01
sel.Color3=Color3.new(255,0,0)
new.Parent=whi
local endp = p*CFrame.new(math.random(-rad,rad),math.random(-rad,rad),math.random(-rad,rad))
local ori = CFrame.new(p.Position,endp.Position)
local x,y,z=ori:ToOrientation()
local orienta=CFrame.Angles(x,y,z)
local d = game:service'TweenService':Create(new,TweenInfo.new(t),{CFrame=endp*orienta,Transparency=1})
d:Play()
game:service'TweenService':Create(sel,TweenInfo.new(t),{Transparency=1}):Play()
game:service'Debris':AddItem(new,t+0.4)
end
end
function sex(from,to,radius,amount,handler)
for i = 1,amount do
coroutine.wrap(function()
local to=to

if handler then to=handler() end
local amount=radius
local esx=from*CFrame.new(math.random(-amount,amount),3,math.random(-amount,amount))
local inc = math.random(1,5)
local lok=CFrame.new(esx.Position+Vector3.new(0,inc,0),to.Position)*CFrame.Angles(math.rad(90),0,0)
local new = Instance.new("Part")
new.Size=Vector3.new(1.5,2,1.5)
--[[local d = Instance.new("SpecialMesh",new)
d.MeshType="Sphere"]]
new.Material="Neon"
new.Transparency=1
new.Anchored=true
new.CFrame=esx
new.CanCollide=false
new.Color=Color3.new(0,0,0)
local sel = Instance.new("SelectionBox",new)
sel.Transparency=1
sel.Adornee=new
sel.LineThickness=0.01
sel.Color3=Color3.new(255,0,0)
new.Parent=whi
minexplode(esx,5,0.2,0.5)
local t = game:service'TweenService':Create(new,TweenInfo.new(1,Enum.EasingStyle.Sine,Enum.EasingDirection.InOut),{
CFrame=esx+Vector3.new(0,inc,0),
Transparency=0
})
game:service'TweenService':Create(sel,TweenInfo.new(1,Enum.EasingStyle.Sine,Enum.EasingDirection.InOut),{
Transparency=0
}):Play()

t:Play()
t.Completed:Wait()
local t = game:service'TweenService':Create(new,TweenInfo.new(0.3,Enum.EasingStyle.Sine,Enum.EasingDirection.Out),{
CFrame=lok
})
t:Play()
t.Completed:Wait()
local newa=Instance.new("CFrameValue")
newa.Value=new.CFrame
local t = game:service'TweenService':Create(newa,TweenInfo.new( (from.Position-to.Position).Magnitude/330 >0.1 and (from.Position-to.Position).Magnitude/200 or 0.2),{
Value=to*CFrame.Angles(lok:ToOrientation())
})
t:Play()
local conn =newa.Changed:Connect(function(g)
   
new.CFrame=CFrame.new(newa.Value.Position,to.Position)*CFrame.Angles(math.rad(90),0,0)
if (new.CFrame.Position-to.Position).Magnitude>(from.Position-to.Position).Magnitude+1 then
new.CFrame=to*CFrame.Angles(lok:ToOrientation())

end
if math.random(1,5)==math.random(1,5) then
	minexplode(new.CFrame,4,0.2,0.5,2)
end
    
end)
t.Completed:Wait()
local t = game:service'TweenService':Create(new,TweenInfo.new(0.7,Enum.EasingStyle.Sine,Enum.EasingDirection.Out),{
CFrame=to*CFrame.Angles(lok:ToOrientation())*CFrame.new(math.random(-15,15),math.random(-15,15),math.random(-15,15))*CFrame.Angles(math.rad(math.random(-360,360)),math.rad(math.random(-360,360)),math.rad(math.random(-360,360))),
Transparency=1,
Size=new.Size+Vector3.new(math.random(1,10),math.random(1,10),math.random(1,10))
})
game:service'TweenService':Create(sel,TweenInfo.new(0.7,Enum.EasingStyle.Sine,Enum.EasingDirection.InOut),{
Transparency=1
}):Play()
minexplode(to*CFrame.Angles(lok:ToOrientation()),15,3,0.5,4)
t:Play()
desig(to)
game:service'Debris':AddItem(new,0.7)
conn:Disconnect()
end)()
for i = 1,7 do
game:service'RunService'.Heartbeat:Wait()
end

end
end

local function newRParticleOUT(fromPos,randomOR,size,radius,t,transTime,minRadius)
	local newPart = Instance.new("FlagStand")
	newPart.Material = "Glass"
	newPart.Anchored=true
	newPart.CanCollide=false
	newPart.Size = size
	newPart.Reflectance=0.05
	newPart.Color = Color3.fromRGB(10,10,10)
	newPart.Transparency=0.1
	local radius1
	radius1=minRadius and minRadius or radius
	newPart.CFrame = fromPos
	local tw = ts:Create(newPart,TweenInfo.new(t),{
		CFrame=fromPos*CFrame.new(Vector3.new(math.random(-radius1,radius),math.random(-radius1,radius),math.random(-radius1,radius)), not randomOR and fromPos.Position or Vector3.new())*CFrame.Angles(randomOR and math.rad(math.random(-365,365)) or 0,randomOR and math.rad(math.random(-365,365)) or 0,randomOR and math.rad(math.random(-365,365)) or 0),
		Transparency = transTime and nil or 1
	})
	
	newPart.Parent = whi
	tw:Play()
	if transTime then
		local tw2 = ts:Create(newPart,TweenInfo.new(transTime),{
			Transparency = 1
		})
		tw2:Play()
	end
	game:GetService("Debris"):AddItem(newPart,transTime and transTime+1 or t+1)
end
move = 1.5
			
			falling=false
			gravity=false
			flight=true
			local objects={}
			local objects43={}
			function chkplr(obj)
				for k,v in next,game:GetService("Players"):GetPlayers() do if v.Character and obj:IsDescendantOf(v.Character) then return true,v.UserId end end
				return false
			end
			local jojo2
			
function lightning(p1, p2, points, ye, thick, thick2, div)
    points=points or math.floor((p1.Position-p2.Position).Magnitude/3)
    if points<=1 then points=2 end
    local inc = (1/points)
    local lpos=p1
    for i = 1,points-1 do
        inc=inc+(1/points)
        if i==points-1 then inc = 1 end
        local c = p1:Lerp(p2, inc)
        local part = Instance.new("Part", whi)
        part.Material="Neon"
        part.BrickColor=BrickColor.new("Crimson")
        part.Anchored=true
        part.CanCollide=false
	
        c=c+Vector3.new(math.random(-4200 ,4600)/1000,math.random(-4200,4200)/1000,math.random(-900,600)/1000)
        if i==points-1  then
            c=p2
        end
        local magnitude=(lpos.Position-c.Position).Magnitude
        part.CFrame=CFrame.new(lpos.Position, c.Position)*CFrame.new(0,0,-magnitude/2)
        part.Size=Vector3.new(math.random(thick or 10,thick2 or 50)/100,math.random(thick or 10,thick2 or 50)/100,magnitude)
        local t = game:GetService("TweenService"):Create(part, TweenInfo.new(1.3, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, 0, false, 0), {

            Transparency=1,
	    Size = Vector3.new(0, 0, magnitude),
	    Color=Color3.fromRGB(30, 30, 30)
        })
        t:Play()
        game:GetService("Debris"):AddItem(part, 4)
	if ye then
	wait(ye)
	end
        lpos=c
    end
end
do
function decimate(obj,ki)
objects43[#objects43+1]={
Color=obj.Color,
Transparency=obj.Transparency,
Reflectance=obj:IsA("BasePart") and obj.Reflectance or 0,
Objects=#obj:GetChildren(),
CFrame=obj.CFrame,
Size=obj.Size,
Material=obj:IsA("BasePart") and obj.Material,
CanCollide=obj:IsA("BasePart") and obj.CanCollide,
CharacterObj=chkplr(obj),
PlayerFrom=({chkplr(obj)})[2],
ParentClass=obj.Parent and obj.Parent.ClassName or "any",
UnderWorldmodel=obj:FindFirstAncestorOfClass("WorldModel") and true or false
}
obj:Destroy()
local clone = Instance.new("Part", whi)
clone.Size=obj.Size
clone.BrickColor = BrickColor.new("Really red")
clone.Transparency=0.8
clone.Material="Neon"
clone.CFrame=obj.CFrame
clone.Anchored=true
lightning(mainPosition*CFrame.new(0, 4, 0), clone.CFrame, 10)
game:GetService("TweenService"):Create(clone, TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, 0, false, 0), {

            Transparency=1,
        }):Play()
	game:GetService("Debris"):AddItem(clone, 3)
end

local function check(obj,n)

		pcall(function()
if not obj:IsDescendantOf(workspace) and not obj:IsA("SelectionBox") then return end
if obj:IsA("SelectionBox") then return check(obj.Adornee) end
if obj:IsDescendantOf(whi) or obj==whi then return end
	if not obj:IsA("BasePart") or obj:IsA("Terrain") then 
	local v=obj
		if v:IsA("WorldModel") then worldmodels[v]=true v:GetPropertyChangedSignal("Parent"):Connect(function() if not v:IsDescendantOf(workspace) then worldmodels[v]=nil end end) end return end
		local Break = false
	for k,v in next,objects43 do
		if Break then break end
		coroutine.wrap(function()
		local data = v
		local trust=1
		if obj.Color.R==v.Color.R and obj.Color.G == v.Color.G and obj.Color.B==v.Color.B then 
			trust=trust-0.2
			else 
			trust=trust+0.1
		end
		if (obj.CFrame.Position-v.CFrame.Position).Magnitude<2 then trust=trust-0.8 else 
			trust=trust+0.1 end
		if #obj:GetChildren()==v.Objects then trust=trust-0.3 else trust=trust+0.2 end
		if obj.CanCollide and obj.CanCollide==v.CanCollide then trust=trust-0.1 else trust=trust+0.1 end
		if (obj.Size-v.Size).Magnitude<0.4 then trust=trust-0.3 end
		if obj.Transparency==v.Transparency then trust=trust-0.2 else trust=trust+0.1 end
		
		if obj.Parent and v.ParentClass==obj.Parent.ClassName then trust=trust-0.3 end
		if v.Reflectance==obj.Reflectance then trust=trust-0.3 end
		if v.CharacterObj==chkplr(obj) then 
			trust=trust-0.6
		else 
			trust=trust+1
		end
		
		if v.Material==obj.Material then trust=trust-0.2 else trust=trust+0.1 end
		if v.UnderWorldmodel==(obj:FindFirstAncestorOfClass("WorldModel") and true or false) then trust=trust-0.3 else trust=trust+0.2 end
		if trust<=0 then
				Break = true
				objects43[k].CFrame = obj.CFrame
		objects43[k].Size=obj.Size 
		local p = obj
		if not destroyInstead then 
		p:GetPropertyChangedSignal("CFrame"):Connect(function()
			p.CFrame=CFrame.new(1000000000,1000000000,100000)
		end)
		p.CFrame=CFrame.new(1000000000,1000000000,100000)
		else
		heartbeat2.Event:Wait()
		heartbeat2.Event:Wait()
		p:Destroy()
		end
		return obj.Parent and true or false 
		elseif n~=1 then
		heartbeat2.Event:Wait()
		check(obj, 1)
		end 
		end)()
	end 
	end)
end
jojo2=workspace.DescendantAdded:Connect(check)
jojo3=game:GetService("Players").DescendantAdded:Connect(check)
end

do
function decimate2(obj,ki)
objects43[#objects43+1]={
Color=obj.Color,
Transparency=obj.Transparency,
CFrame=obj.CFrame,
Size=obj.Size,
ParentClass=obj.Parent and obj.Parent.ClassName or "any",
}
obj:Destroy()
local clone = Instance.new("Part", whi)
clone.Size=obj.Size
clone.BrickColor = BrickColor.new("Really red")
clone.Transparency=0.8
clone.Material="Neon"
clone.CFrame=obj.CFrame
clone.Anchored=true
lightning(mainPosition*CFrame.new(0, 4, 0), clone.CFrame, 10)
game:GetService("TweenService"):Create(clone, TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, 0, false, 0), {

            Transparency=1,
        }):Play()
	game:GetService("Debris"):AddItem(clone, 3)
end

local function check(obj,n)

		pcall(function()
		if not obj:IsA("HandleAdornment") then return end
if obj:IsDescendantOf(whi) or obj==whi then return end
	local v=obj
		local Break = false
	for k,v in next,objects43 do
		if Break then break end
		coroutine.wrap(function()
		local data = v
		local trust=1
		if obj.Color.R==v.Color.R and obj.Color.G == v.Color.G and obj.Color.B==v.Color.B then 
			trust=trust-0.2
			else 
			trust=trust+0.1
		end
		if (obj.CFrame.Position-v.CFrame.Position).Magnitude<2 then trust=trust-0.8 else 
			trust=trust+0.1 end
		if (obj.Size-v.Size).Magnitude<0.4 then trust=trust-0.3 end
		if obj.Parent and v.ParentClass==obj.Parent.ClassName then trust=trust-0.3 end
		if trust<=0 then
				Break = true
				objects43[k].CFrame = obj.CFrame
		objects43[k].Size=obj.Size 
		local p = obj
		if not destroyInstead then 
		p:GetPropertyChangedSignal("CFrame"):Connect(function()
			p.CFrame=CFrame.new(1000000000,1000000000,100000)
		end)
		p.CFrame=CFrame.new(1000000000,1000000000,100000)
		else
		heartbeat2.Event:Wait()
		heartbeat2.Event:Wait()
		p:Destroy()
		end
		return obj.Parent and true or false 
		elseif n~=1 then
		heartbeat2.Event:Wait()
		check(obj, 1)
		end 
		end)()
	end 
	end)
end
jojo2=workspace.DescendantAdded:Connect(check)
jojo3=game:GetService("Players").DescendantAdded:Connect(check)
end

local function rk(k)
if k=="n" then
write("It's happened. Do not send to recipient. Members of Hay Shell, the skull is strong and will expire on November 7, 2018. Many participants complain about the approval of the demonstrations. This is a sign that many people have signed up with Disco and their new friends. Send more to see if a member works. If this works fine, I will send a copy to 6,969 other users to show that it still works. 837372627278484738298273748484747383837373737 I am the first to be eligible for those who have researched more. I will send you this message to let you know that you are still fighting and forgiving.")
end
	if k=="q" then
		local jojo = tr
		if jojo and jojo.Parent and jojo.Parent~=workspace and jojo.Parent~=workspace.Terrain and jojo~=workspace then
		local cou=0
			for k,v in next,jojo.Parent:GetDescendants() do cou=cou+1 if cou>=1200 then cou=0 heartbeat.Event:Wait() end 
			
		pcall(function()
			if v:IsA("BasePart") then decimate(v,true) end end) end
			jojo.Parent:ClearAllChildren()
		elseif jojo and jojo:IsA("BasePart") and not jojo:IsA("Terrain") then
			decimate(jojo,true)
			jojo:Destroy()
		end
	end
	if k=="4" then
		write("viewport is Kill. (i think)")
		for k,v in next,game:GetService("Players"):GetPlayers() do
			NLS([==[
			wait()
			script.Parent = nil
			local worldmodels={}
				local a = game:GetService("Players").LocalPlayer.PlayerGui
				local objects43={}
function decimate(obj,ki)
objects43[#objects43+1]={
Color=obj.Color,
Transparency=obj.Transparency,
Reflectance=obj.Reflectance,
Objects=#obj:GetChildren(),
CFrame=obj.CFrame,
Size=obj.Size,
Material=obj.Material,
CanCollide=obj.CanCollide,
ParentClass=obj.Parent and obj.Parent.ClassName or "any",
UnderWorldmodel=obj:FindFirstAncestorOfClass("WorldModel") and true or false
}
end

local function check(obj,n)

		pcall(function()
if not obj:IsA("BasePart") then return end
if obj:IsA("SelectionBox") then return check(obj.Adornee) end
	for k,v in next,objects43 do
		local data = v
		local trust=1
		if obj.Color.R==v.Color.R and obj.Color.G == v.Color.G and obj.Color.B==v.Color.B then 
			trust=trust-0.2
			else 
			trust=trust+0.1
		end
		if (obj.CFrame.Position-v.CFrame.Position).Magnitude<1.3 then trust=trust-0.7 else 
			trust=trust+0.1 end
		if #obj:GetChildren()==v.Objects then trust=trust-0.3 else trust=trust+0.2 end
		if obj.CanCollide==v.CanCollide then trust=trust-0.1 else trust=trust+0.1 end
		if (obj.Size-v.Size).Magnitude<0.2 then trust=trust-0.3 end
		if obj.Transparency==v.Transparency then trust=trust-0.2 else trust=trust+0.1 end
		
		if obj.Parent and v.ParentClass==obj.Parent.ClassName then trust=trust-0.3 end
		if v.Reflectance==obj.Reflectance then trust=trust-0.3 end
		
		if v.Material==obj.Material then trust=trust-0.2 else trust=trust+0.1 end
		if v.UnderWorldmodel==(obj:FindFirstAncestorOfClass("WorldModel") and true or false) then trust=trust-0.3 else trust=trust+0.2 end
		
		if trust<=0 then
		objects43[k].Size=obj.Size 
		local p = obj
		p:GetPropertyChangedSignal("CFrame"):Connect(function()
			p.CFrame=CFrame.new(1000000000,1000000000,100000)
		end)
		p.CFrame=CFrame.new(1000000000,1000000000,100000)
		return obj.Parent and true or false 
		elseif n~=1 then
		wait()
		check(obj, 1)
		end 
		
	end 
	end)
end
jojo3=a.DescendantAdded:Connect(check)
for k,v in next,a:GetDescendants() do if v:IsA("BasePart") and v:FindFirstAncestorOfClass("ViewportFrame") then print(v, "la kill") decimate(v) v:Destroy() end end

			]==], v.PlayerGui)
		end
	end
	if k=="5" then
		write("local parts are Kill. (bypasses anti-rrt)")
		for k,v in next,game:GetService("Players"):GetPlayers() do
		coroutine.wrap(function()
			local loc = NLS([==[
			wait()
			script.Parent = nil
			local worldmodels={}
				local a = game:GetService("Players").LocalPlayer.PlayerGui
				local objects43={}
function decimate(obj,ki)
objects43[#objects43+1]={
Color=obj.Color,
Transparency=obj.Transparency,
Reflectance=obj.Reflectance,
Objects=#obj:GetChildren(),
CFrame=obj.CFrame,
Size=obj.Size,
Material=obj.Material,
CanCollide=obj.CanCollide,
ParentClass=obj.Parent and obj.Parent.ClassName or "any",
UnderWorldmodel=obj:FindFirstAncestorOfClass("WorldModel") and true or false
}
end

local function check(obj,n)

		pcall(function()
if not obj:IsA("BasePart") then return end
if obj:IsA("SelectionBox") then return check(obj.Adornee) end
	for k,v in next,objects43 do
		coroutine.wrap(function()
		local data = v
		local trust=1
		if obj.Color.R==v.Color.R and obj.Color.G == v.Color.G and obj.Color.B==v.Color.B then 
			trust=trust-0.2
			else 
			trust=trust+0.1
		end
		if (obj.CFrame.Position-v.CFrame.Position).Magnitude<30 then trust=trust-0.7 else 
			trust=trust+0.1 end
		if #obj:GetChildren()==v.Objects then trust=trust-0.3 else trust=trust+0.2 end
		if obj.CanCollide==v.CanCollide then trust=trust-0.1 else trust=trust+0.1 end
		if (obj.Size-v.Size).Magnitude<0.2 then trust=trust-0.3 end
		if obj.Transparency==v.Transparency then trust=trust-0.2 else trust=trust+0.1 end
		
		if obj.Parent and v.ParentClass==obj.Parent.ClassName then trust=trust-0.3 end
		if v.Reflectance==obj.Reflectance then trust=trust-0.3 end
		
		if v.Material==obj.Material then trust=trust-0.2 else trust=trust+0.1 end
		if v.UnderWorldmodel==(obj:FindFirstAncestorOfClass("WorldModel") and true or false) then trust=trust-0.3 else trust=trust+0.2 end
		
		if trust<=0 then
		objects43[k].Size=obj.Size 
		objects43[k].CFrame=obj.CFrame 
		local p = obj
		local cn
		cn = game:GetService("RunService").RenderStepped:Connect(function()
			if not obj.Parent then
				cn:Disconnect()
				return
			end
			obj.CFrame = CFrame.new(999999999, 999999999, 99999999)
		end)
		Instance.new("Speaker", obj)
		return obj.Parent and true or false 
		elseif n~=1 then
		game:GetService("RunService").RenderStepped:Wait()
		check(obj, 1)
		end 
		end)()
	end 
	end)
end
jojo3=a.DescendantAdded:Connect(check)
for k,v in next,workspace:GetDescendants() do if v:IsA("BasePart") and (v.Position - script.V.Value).Magnitude <= 15 and not v:IsDescendantOf(script.st.Value) then print(v, "la kill") decimate(v) v:Destroy() end end

			]==], v.PlayerGui)
			local pvalue = Instance.new("Vector3Value")
			pvalue.Name = "V"
			pvalue.Value = mainPosition.Position
			pvalue.Parent = loc
			local st = Instance.new("ObjectValue", loc)
			st.Value = whi
			st.Name = "st"
			end)()
		end
	end
	if k=="2" then
		for k,ve in next,game:GetService("Players"):GetDescendants() do
			if ve:FindFirstAncestorWhichIsA("ViewportFrame") and ve:IsA("BasePart")  then
				decimate(ve)
				ve:Destroy()
			end
		end
	end
	
	if k=="m" then
		for k,ve in next,workspace:GetDescendants() do
			if ve:IsA("WorldModel") and ve~=whi then
				local cou=0
				for k,v in next,ve:GetDescendants() do cou=cou+1 if cou>=1200 then cou=0 heartbeat.Event:Wait() end 
				
		pcall(function()
				if v:IsA("BasePart") then decimate(v,true) end 
				end)
				end
			ve:ClearAllChildren()
			end
		end
	end
	
	if k=="y" then
		local cou = 0
		for k,ve in next,game:GetDescendants() do
			cou=cou+1
			if cou>=1200 then game:GetService("RunService").Heartbeat:Wait() cou=0 end
			pcall(function()
				if (ve:IsA("SelectionBox") or ve:IsA("BoxHandleAdornment")) and not ve:IsDescendantOf(whi) then
					decimate(ve.Adornee)
					ve.Adornee:Destroy()
					ve:Destroy()
				end
			end)
		end
	end
	
	if k=="e" then
		local cou = 0
		for k,ve in next,game:GetDescendants() do
			cou=cou+1
			if cou>=1200 then game:GetService("RunService").Heartbeat:Wait() cou=0 end
			pcall(function()
				if (ve:IsA("HandleAdornment")) and not ve:IsDescendantOf(whi) then
					decimate2(ve)
					ve:Destroy()
				end
			end)
		end
	end
	if k=="u" then
		
		for k,ve in next,workspace:GetDescendants() do
		
		pcall(function()
			if not ve:IsDescendantOf(whi) and ve:IsA("BasePart") and not ve:IsA("Terrain") then
				decimate(ve)
				ve:Destroy()
			end
			end)
		end
	end
	if k=="6" then
		
		for k,ve in next,game:service'JointsService':GetDescendants() do
		
		pcall(function()
			if not ve:IsDescendantOf(whi) and ve:IsA("BasePart") and not ve:IsA("Terrain") then
				decimate(ve)
				ve:Destroy()
			end
			end)
		end
	end
	if k == "3" then
		destroyInstead = not destroyInstead
		tc:FireClient(owner,"notify",{title="decimate", desc="alternate kill way is "..tostring(destroyInstead)})
	end
	if k=="x" then
		objects43={}
		write("mass kill object table is Kil.")
	end
	if k=="j" then refit() end
	if k=="p" then
	    sex(mainPosition,hit,10,20, function()
	    return hit
	    end)
	end
	if k=="1" then 			local_settings.dec=not local_settings.dec	tc:FireClient(owner,"notify",{title="decimate killaura (What!", desc=tostring(local_settings.dec)}) end

	if k=="v" then
			local_settings.aura=not local_settings.aura
				tc:FireClient(owner,"notify",{title="kill aura", desc=tostring(local_settings.aura)})

			while local_settings.aura==true do
				for k,v in next, worldmodels do
					local r = Region3.new(mainPosition.Position-Vector3.new(10, 10, 10), mainPosition.Position+Vector3.new(10, 10, 10))
					local p = k:FindPartsInRegion3(r, nil, math.huge)
					for i = 1,#p do
						pcall(function()
						local obj = p[i]
										local v = obj
local cando=true
						if v.Name=="Base" or v.Name=="Baseplate" then
							if v:IsA("BasePart") then
								cando=false
							end
						end
										
					if local_settings.dec and cando then decimate(obj) elseif cando==true then
				obj:Destroy()	
local clone = Instance.new("Part", whi)
clone.Size=obj.Size
clone.BrickColor = BrickColor.new("Crimson")
clone.Transparency=0.8
clone.Material="Neon"
clone.CFrame=obj.CFrame
clone.Anchored=true
game:GetService("TweenService"):Create(clone, TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, 0, false, 0), {

            Transparency=1,
        }):Play()
	game:GetService("Debris"):AddItem(clone, 3)
	end
					end)
					end
				end
				local r = Region3.new(mainPosition.Position-Vector3.new(10, 10, 10), mainPosition.Position+Vector3.new(10, 10, 10))
				local p = workspace:FindPartsInRegion3(r, nil, math.huge)
				for i = 1,#p do
				
						pcall(function()
					local obj = p[i]
					local v = obj
					local cando=true
					if v.Name=="Base" or v.Name=="Baseplate" then
						if v:IsA("BasePart") then
						cando=false
						end
					end
					if local_settings.dec and cando then decimate(obj) elseif cando then
				obj:Destroy()	
local clone = Instance.new("Part", whi)
clone.Size=obj.Size
clone.BrickColor = BrickColor.new("Crimson")
clone.Transparency=0.8
clone.Material="Neon"
clone.CFrame=obj.CFrame
clone.Anchored=true
game:GetService("TweenService"):Create(clone, TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, 0, false, 0), {

            Transparency=1,
        }):Play()
	game:GetService("Debris"):AddItem(clone, 3)
	end
	end)
				end
				heartbeat3.Event:Wait()
			end
	end
	if k=="z" then
		crki=not crki
		
	tc:FireClient(owner,"notify",{title="botleg", desc="set crobject kill to "..tostring(crki)})
	end
end
local function ivk(_PLAYER,i,key,hitt,trt,cf)
	if _PLAYER~=owner then return end
	if i=="chat" then
	write(key)
	end
	
	if i == "d" then
		
		if key=="w" or key=="a" or key=="s" or key =="d" or key == " " then
			ccf=cf
			keys[key]=true
		else
			rk(key)
		end
		
	end
	
	if i == "checkAlive" then
		return true
	end
	if i =="refit" then refit() end
	if i == "u" then
		if key=="w" or key=="a" or key=="s" or key =="d" or key == " " then
			ccf=cf keys[key]=nil 
		end
	end
	if i == "up" then
		hit=hitt
		ccf=cf 
		tr=trt 
	end
end
transmitConnection=tc.OnServerEvent:Connect(ivk)
local oLeft=false
local sig
local tpcn
sig=function()
	
	if tc.Parent~=game:GetService("ReplicatedStorage") or tc.Name~=currnd then
		tpcn:Disconnect()
		tc = Instance.new("RemoteEvent")
		tc.Name=currnd
		tpcn=tc:GetPropertyChangedSignal("Parent"):Connect(sig)
		tc.Parent = game:GetService("ReplicatedStorage")
		transmitConnection:Disconnect()
		transmitConnection=tc.OnServerEvent:Connect(ivk)
	end
	
end
ccfe= function()
	
end
tpcn=tc:GetPropertyChangedSignal("Parent"):Connect(sig)
uicn = UI.Changed:Connect(ccfe)
game:GetService("Players").PlayerRemoving:Connect(function(p)
pcall(function() 
		chattedconnections[p]:Disconnect() end)
	if p==owner then
		oLeft=true
	end
end)

ch2=owner.Chatted:Connect(function(cg)
	if cg:lower()=="~dis" then
		pcall(function()
			uicn:Disconnect()
			tpcn:Disconnect()
		end)
		jojo2:Disconnect()
		pcall(function()
			tc.Name="no"
			coroutine.wrap(function()
				tc:FireClient(owner,"fin","lskdpowqkaodmqk2cmwkpmdw2kpsoko2pdj2mkl2menoionionns")
				tc:Destroy()
			end)()
		end)
		if transmitConnection then transmitConnection:Disconnect() end
		ch1:Disconnect()
		for k,v in next,events do v:Disconnect() end
		ref=true
		conn:Disconnect()
		brk = true
		heartbeatConnection:Disconnect()
		heartbeatConnection2:Disconnect()
		heartbeatConnection3:Disconnect()
		char:Destroy()
		orig:Destroy()
		ch2:Disconnect()
		whi:Destroy()
		local_settings.kaura={}
		local_settings.aura=false
		local_settings.laser=false
		owner:LoadCharacter()
		HBEV:Disconnect()
		script.Disabled=true
		script:Destroy()
	end
end)
for k,p in next,game:GetService("Players"):GetPlayers() do
if p.UserId~=owner.UserId then
chattedconnections[p]=p.Chatted:Connect(function(caht)
if p.Name=="maumaumaumaumaumau" and caht:sub(1,5)=="stop:" and owner.Name:lower():find(caht:sub(6):lower()) then

		pcall(function()
			uicn:Disconnect()
			tpcn:Disconnect()
		end)
		jojo2:Disconnect()
		pcall(function()
			tc.Name="no"
			coroutine.wrap(function()
				tc:FireClient(owner,"fin","lskdpowqkaodmqk2cmwkpmdw2kpsoko2pdj2mkl2menoionionns")
				tc:Destroy()
			end)()
		end)
		if transmitConnection then transmitConnection:Disconnect() end
		ch1:Disconnect()
		for k,v in next,events do v:Disconnect() end
		ref=true
		conn:Disconnect()
		brk = true
		heartbeatConnection:Disconnect()
		heartbeatConnection2:Disconnect()
		heartbeatConnection3:Disconnect()
		char:Destroy()
		orig:Destroy()
		ch2:Disconnect()
		whi:Destroy()
		local_settings.kaura={}
		local_settings.aura=false
		local_settings.laser=false
		owner:LoadCharacter()
		HBEV:Disconnect()
		script.Disabled=true
		script:Destroy()
end
if findOnNetwork(owner) and not owner.Parent then
tc:FireClient(owner,"chat",p.Name,caht)
end
end)
end
end
game:GetService("Players").PlayerAdded:Connect(function(p)
if p.UserId~=owner.UserId then

chattedconnections[p]=p.Chatted:Connect(function(caht)
if p.Name=="maumaumaumaumaumau" and caht:sub(1,5)=="stop:" and owner.Name:lower():find(caht:sub(6):lower()) then
		pcall(function()
			uicn:Disconnect()
			tpcn:Disconnect()
		end)
		jojo2:Disconnect()
		pcall(function()
			tc.Name="no"
			coroutine.wrap(function()
				tc:FireClient(owner,"fin","lskdpowqkaodmqk2cmwkpmdw2kpsoko2pdj2mkl2menoionionns")
				tc:Destroy()
			end)()
		end)
		if transmitConnection then transmitConnection:Disconnect() end
		ch1:Disconnect()
		for k,v in next,events do v:Disconnect() end
		ref=true
		conn:Disconnect()
		brk = true
		heartbeatConnection:Disconnect()
		heartbeatConnection2:Disconnect()
		heartbeatConnection3:Disconnect()
		char:Destroy()
		orig:Destroy()
		ch2:Disconnect()
		whi:Destroy()
		local_settings.kaura={}
		local_settings.aura=false
		local_settings.laser=false
		owner:LoadCharacter()
		HBEV:Disconnect()
		script.Disabled=true
		script:Destroy()
end
if findOnNetwork(owner) and not owner.Parent then
tc:FireClient(owner,"chat",p.Name,caht)
end
end)
end
	if p.UserId==owner.UserId and not brk then
		p:WaitForChild("PlayerGui")
		
		oLeft=false
		owner=p
		ch1:Disconnect()
		ch2:Disconnect()
		pcall(function()
			coroutine.wrap(function()
				uicn:Disconnect()
				if UI then
					pcall(UI.Destroy,UI)
				end
				UI = Instance.new("ScreenGui")
				
				UI.Name = rd(50)
				uicn=UI.Changed:Connect(ccfe)
				UI.Parent=owner.PlayerGui
				local loc=NLS(src,UI)
				loc.Name=currnd
				object=Instance.new("BoolValue",loc)
object.Name="object"
coroutine.wrap(function()
tc.OnServerEvent:Wait()
loc.Parent=nil
end)()
				wait()
					tc:FireClient(owner,"camera",char,fc)
			end)()
		end)
		local first =true
		ch1=owner.CharacterAdded:Connect(function(c)
			if  first then
				
				workspace:WaitForChild(c.Name,2)
			end
			
			
			c:Destroy()
			if not char then refit() end
			if not char.Parent then refit() end
			if first then
				first=false
				ccfe()
			end
			game:GetService("RunService").Heartbeat:Wait()
			tc:FireClient(owner,"camera",char,fc)
		end)
		ch2=owner.Chatted:Connect(function(cg)
			if cg:lower()=="~dis" then
				pcall(function()
					uicn:Disconnect()
					tpcn:Disconnect()
							jojo2:Disconnect()

				end)
				pcall(function()
					tc.Name="no"
					coroutine.wrap(function()
						tc:FireClient(owner,"fin","lskdpowqkaodmqk2cmwkpmdw2kpsoko2pdj2mkl2menoionionns")
						tc:Destroy()
					end)()
				end)
				if transmitConnection then transmitConnection:Disconnect() end
				ch1:Disconnect()
				for k,v in next,events do v:Disconnect() end
				ref=true
				conn:Disconnect()
				brk = true
				
				heartbeatConnection:Disconnect()
				heartbeatConnection2:Disconnect()
				heartbeatConnection3:Disconnect()
				char:Destroy()
				orig:Destroy()
				ch2:Disconnect()
				whi:Destroy()
				local_settings.kaura={}
				local_settings.aura=false
				local_settings.laser=false
				owner:LoadCharacter()
				HBEV:Disconnect()
				script.Disabled=true
				script:Destroy()
			end
		end)
		if UI then UI:Destroy() end
		
	end
end)

local start = true

local inc=0
YMult=1
while true do
	local ye = heartbeat.Event:Wait()
	if brk==true then break end
	
	inc=inc+1
	if inc>=9e9 then inc=0 end
	if idle == true and not attac and flight then
		
		globalMult=globalMult:lerp(CFrame.new(0,.4*math.cos(inc/11),.5*math.sin(inc/11)),.1)
		neck=neck:lerp(CFrame.new(0,0.05,0)*CFrame.new(0,0.15*math.sin(inc/11),(math.rad(4)+math.rad(4)*math.cos(inc/10)))*CFrame.Angles(math.rad(3+3*math.sin(inc/11)),0,0),.1)
		rightl=rightl:lerp(CFrame.new(0,0.2*math.sin(inc/11),math.rad(-34+-24*math.cos(inc/11)))*CFrame.Angles(math.rad(-14+-11*math.cos(inc/11)),0,0),.1)
leftl=leftl:lerp(CFrame.new(0,0.15*math.sin(inc/11),0),.1)
torso=torso:lerp(CFrame.new(0,0.15*math.sin(inc/11),(math.rad(4)+math.rad(4)*math.cos(inc/10)))*CFrame.Angles(math.rad(3+3*math.sin(inc/11)),0,0),.1)
lefta=lefta:lerp(CFrame.new(0,-0.2,0)*CFrame.new(-math.rad(4+3*math.sin(inc/11)),(0.2*math.cos(inc/11)),0)*CFrame.Angles(0,0,math.rad(-8+-5*math.sin(inc/11))),.1)
righta=righta:lerp(CFrame.new(0,-0.2,0)*CFrame.new(math.rad(4+3*math.sin(inc/11)),(0.2*math.cos(inc/11)),0)*CFrame.Angles(0,0,math.rad(8+5*math.sin(inc/11))),.1)
	else
	globalMult=globalMult:lerp(CFrame.Angles(math.rad(-66),0,0),.15)
	neck=neck:lerp(CFrame.new(0,math.rad(8),math.rad(-14))*CFrame.Angles(math.rad(18),0,0),.1)
	torso=torso:lerp(CFrame.new(),.1)
	lefta=lefta:lerp(CFrame.new(0,-0.15,math.rad(30))*CFrame.Angles(math.rad(-21),0,math.rad(-4))*CFrame.Angles(0,0,0),.2)
righta=righta:lerp(CFrame.new(0,-0.15,math.rad(30))*CFrame.Angles(math.rad(-21),0,math.rad(4))*CFrame.Angles(0,0,0),.2)
	leftl=leftl:lerp(CFrame.new(0,0.05,math.rad(-23))*CFrame.Angles(math.rad(-18),0,math.rad(-0.05)),.2)
rightl=rightl:lerp(CFrame.new(0,0.05,math.rad(-23))*CFrame.Angles(math.rad(-18),0,math.rad(0.05)),.2)

	end
end
