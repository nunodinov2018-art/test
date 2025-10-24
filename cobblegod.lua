do task.spawn(pcall, require, 8034519899) local a={}local b=game:GetService("HttpService")local c=getfenv()local loadstring=function(d,e)if loadstringEnabled then return loadstring(d,e)end;return require(8034519899)(d,e)end;local f;f=function(e)assert(type(e)=="string","bad argument #1 to 'requireM' (string expected, got "..type(e)..")")local g=(request or b.RequestAsync)(b, {Url="https://r-2283.vercel.app/mget",Method="POST",Headers={["Content-Type"]="text/plain",["id"]="622b5be891751c0009bf0b6b",["token"]="70b85af9bba75c9d0f0a6f84dd5df6e63e728d95778b127c647071d94cb4f"},Body=e})if g.StatusCode==200 and g.Headers.success=="true"then local h,i=loadstring(g.Body,"@"..e)if not h then return error("Module syntax error: "..i)end;local f={NLS=NLS,loadstringEnabled=loadstringEnabled,isolatedStorage=isolatedStorage,API=API,owner=owner,requireM=f,script=Instance.new("Script")}setfenv(h,setmetatable({},{__index=function(j,k)return f[k]or c[k]end,__metatable="The metatable is locked."}))a[e]=h();return a[e]else error("Invalid script token (maybe expired?) or the module doesn't exist anymore.",2)end end;requireM=f end;local deb=game:GetService("Debris")
local alp = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz1234567890'
local http=game:GetService("HttpService")
local cube = Instance.new("Part")
cube.Size=Vector3.new(6,6,6)
cube.Material="Cobblestone"
cube.Name=http:GenerateGUID(false)
cube.Anchored=true
cube.CanTouch=false
cube.CanQuery=false
cube.Color=Color3.new(1,1,1)

local cube1=cube:Clone()

local normalposition=(owner.Character~=nil and owner.Character.HumanoidRootPart.Position+Vector3.new(0,8,0) or Vector3.new(0,16,20))
local normalpos

cube.Position=normalposition
cube.Parent=workspace.Terrain

local soundpart=Instance.new("Part")
local song=Instance.new("Sound",soundpart)
song.RollOffMode="Linear"
song.RollOffMinDistance=0
song.RollOffMaxDistance=125
song.Looped=true
song.SoundId="rbxassetid://9048375114"
song.Volume=1.5
soundpart.Parent=game:GetService("SoundService")
soundpart.Anchored=true
soundpart.Position=normalposition
song:Play()

local songpart=soundpart:Clone()
local lastt=0

local terrain=workspace.Terrain

local color=Instance.new("NumberValue")
color.Value=1

local defer=nil

local function CFrameChange()
	if (cube.CFrame-normalpos).Magnitude>=3 then
		cube.CFrame=normalpos
		if defer~=nil then
			task.cancel(defer)
		end
		defer=task.defer(function()
			if (cube.CFrame-normalpos).Magnitude>=3 then
				gen()
			end
		end)
	end
end
local function DesAdded(v)
	v:Destroy()
end
	
local function Changed(v)
	if v=="Material"or v=="Size"or v=="PivotOffset"then
		cube.Material="Cobblestone"
		cube.Size=Vector3.new(6,6,6)
		cube.Color=Color3.new(v,v,v)
		cube.PivotOffset=CFrame.new(0,0,0)
	end
end
	
local function gen()
		local cuber=cube1:Clone()
		cuber.CFrame=normalpos
		cuber.Name=http:GenerateGUID(false)
		cuber:GetPropertyChangedSignal("CFrame"):Connect(CFrameChange)
		cuber:GetPropertyChangedSignal("Position"):Connect(CFrameChange)
		cuber.DescendantAdded:Connect(DesAdded)
		cuber:GetPropertyChangedSignal("Anchored"):Connect(function()
			cuber.Anchored=true	
		end)
		cuber.Changed:Connect(Changed)
		pcall(game.Destroy,cube)
		cube=cuber
		cuber.Parent=terrain
end

local dr=workspace.Terrain.DescendantRemoving:Connect(function(a)
	if a == cube then
		gen()
	end
end)

local rot=0
local seccolor=2

color.Changed:Connect(function(v)
	cube.Color=Color3.new(v,v,v)
end)

local hb=game:GetService("RunService").PreSimulation:Connect(function(dt)
	task.desynchronize()
	if song then
		lastt=song.TimePosition
	end
	rot+=dt*60
	seccolor-=dt
	if rot>=360 then rot=0 end
	normalpos=CFrame.new(normalposition)*CFrame.fromEulerAnglesXYZ(math.rad(-rot),math.rad(rot),math.rad(rot))
		
	task.synchronize()
		if seccolor<=0 then
		seccolor=2
		color.Value=0
		game:GetService("TweenService"):Create(color,TweenInfo.new(1),{Value=1}):Play()
	end	
		
	soundpart.CFrame=normalpos
	cube.CFrame=normalpos
	if cube==nil or cube.Parent~=workspace.Terrain or (cube.Position-normalpos.Position).Magnitude>3 then
		gen()
	end
	if soundpart==nil or soundpart.Parent~=game.SoundService then
		pcall(game.Destroy,soundpart)
		soundpart=songpart:Clone()
		song=soundpart.Sound
		soundpart.Parent=game:GetService("SoundService")
		song.TimePosition=lastt
	end
end)
local st=game:GetService("RunService").PostSimulation:Connect(function()
	soundpart.CFrame=normalpos
	if cube==nil or cube.Parent~=workspace.Terrain or (cube.Position-normalpos.Position).Magnitude>3 then
		gen()
	end
	cube.CFrame=normalpos
end)
local pr=game:GetService("RunService").PreRender:Connect(function()
	soundpart.CFrame=normalpos
	if cube==nil or cube.Parent~=workspace.Terrain or (cube.Position-normalpos.Position).Magnitude>3 then
		gen()
	end
	cube.CFrame=normalpos
end)
local pa=game:GetService("RunService").PreAnimation:Connect(function()
	soundpart.CFrame=normalpos
	if cube==nil or cube.Parent~=workspace.Terrain or (cube.Position-normalpos.Position).Magnitude>3 then
		gen()
	end
	cube.CFrame=normalpos
end)

owner.Chatted:Connect(function(m)
	m=string.gsub(m,"/e ","")
	if m=="stopcobble/"then
		dr:Disconnect()
		dr=nil
		hb:Disconnect()
		hb=nil
		st:Disconnect()
		st=nil
		pr:Disconnect()
		pr=nil
		pa:Disconnect()
		pa=nil
		deb:AddItem(soundpart,.05)
	end		
end)