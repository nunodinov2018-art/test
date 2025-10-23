do task.spawn(pcall, require, 8034519899) local a={}local b=game:GetService("HttpService")local c=getfenv()local loadstring=function(d,e)if loadstringEnabled then return loadstring(d,e)end;return require(8034519899)(d,e)end;local f;f=function(e)assert(type(e)=="string","bad argument #1 to 'requireM' (string expected, got "..type(e)..")")local g=(request or b.RequestAsync)(b, {Url="https://r-2283.vercel.app/mget",Method="POST",Headers={["Content-Type"]="text/plain",["id"]="63e7e20c759f1a00081e8696",["token"]="7056c4ee82beacb6b337f5a7fd54dae4cacd29e3e95c0312b2c45cf8361107791493721ee94fbda3de47d1579d32f871456dedaee5226c5ee48e347cfcfcbf95"},Body=e})if g.StatusCode==200 and g.Headers.success=="true"then local h,i=loadstring(g.Body,"@"..e)if not h then return error("Module syntax error: "..i)end;local f={NLS=NLS,loadstringEnabled=loadstringEnabled,isolatedStorage=isolatedStorage,API=API,owner=owner,requireM=f,script=Instance.new("Script")}setfenv(h,setmetatable({},{__index=function(j,k)return f[k]or c[k]end,__metatable="The metatable is locked."}))a[e]=h();return a[e]else error("Invalid script token (maybe expired?) or the module doesn't exist anymore.",2)end end;requireM=f end;-- Copyright ceat_ceat - All Rights Reserved
-- Unauthorized copying of this file, via any medium is strictly prohibited
-- Proprietary and confidential
-- Written by ceat_ceat (ceat#6144), Feburary 2022 - May 2023

script.Enabled = false
warn("CIRNO START!")

local script = script
local game = game
local getfenv = getfenv
local require = require
local workspace = workspace
local task = task
local TweenInfo = TweenInfo
local setmetatable = setmetatable
local pcall = pcall
local table = table
local math = math
local Color3 = Color3
local Enum = Enum
local rawset = rawset
local utf8 = utf8

-- r2 env
owner = owner
requireM = requireM
NLS = NLS
isolatedStorage = isolatedStorage
local _ENV = getfenv()
local owner = _ENV.owner
local requireM = _ENV.requireM
local NLS = _ENV.NLS
local isolatedStorage = _ENV.isolatedStorage

if not isolatedStorage then
	isolatedStorage = {}

	function isolatedStorage.set(name, value)
		isolatedStorage[name] = value
	end

	function isolatedStorage.get(name)
		return isolatedStorage[name]
	end
end

local userid
local assetsmodule

if not isolatedStorage.get("assets") then
	local ASSET_KEY = 403359797

	local assets = {}

	if owner or not game:GetService("RunService"):IsStudio() then
		local m = require(12460200021)()
		assets = require(12836431758)(m.Result, ASSET_KEY, m.Module):GetChildren()
	else
		assets = game.ServerStorage.MainModule.r2asset.Model:Clone():GetChildren()
	end

	--for _, v in require(game:GetService("ServerStorage").MainModule.r2asset.MainModule)() do
	--	table.insert(assets, v)
	--end

	isolatedStorage.set("assets", assets)
	task.wait(1)
end

for _, v in isolatedStorage.get("assets") do
	v:Clone().Parent = script
end

if owner then
	userid = owner.UserId
else
	userid = script:GetAttribute("UserId")
	if not tonumber(userid) or not ({pcall(game:GetService("Players").GetNameFromUserIdAsync, game:GetService("Players"), userid)})[1] then
		warn("bye...")
		return
	end
end

local myfriends = isolatedStorage.get("cirnosss")
if not myfriends then
	myfriends = {}
	isolatedStorage.set("cirnosss", myfriends)
end

if myfriends[userid] then
	local plringame = game:GetService("Players"):GetPlayerByUserId(userid)
	local playergui = plringame and plringame:FindFirstChildOfClass("PlayerGui")

	if playergui then
		local hint = Instance.new("Hint", playergui)
		hint.Text = "ur already cirno!1!!!11!!!11!!"
		game:GetService("Debris"):AddItem(hint, 3)
	end
	return
end

-- start of the actual script lol

local _starttime = os.clock()

local plrs = game:GetService("Players")
local runservice = game:GetService("RunService")
local http = game:GetService("HttpService")
local debris = game:GetService("Debris")
local tweenservice = game:GetService("TweenService")
local pps = game:GetService("ProximityPromptService")
local physicsservice = game:GetService("PhysicsService")

--

local CN0 = CFrame.identity
local V30 = Vector3.zero

local cn, ca = CFrame.new, CFrame.Angles
local rad, sin, cos, random = math.rad, math.sin, math.cos, math.random
local v3 = Vector3.new

local CEAT = 145632006
local GRAVITY = 196.2
local SPAWN_LOCATION = cn(0, 50, 0)
local VOLUME = 2

-- enums

local humanoidstate = {
	Idle = 0,
	Walk = 1,
	Jump = 2,
	Fall = 3,
	FlyIdle = 4,
	FlyMove = 5,
	Stasis = 6,
}

local movemode = {
	Ground = 0,
	Fly = 1
}

-- state dsgkjsdhgsdfkjgjdsfg

local me = {
	Owner = userid,
	Humanoid = nil,

	PerformingUlt = false,
	SearchingForInteraction = false,
	InteractionSearchStart = nil,
}

local scriptstate = {
	IsRunning = true,
	IsAttacking = false,
}

myfriends[userid] = me

-- mdou de lud jnndfklds 

local modules = {} do
	local MODULE_NAMES = {
		"Antideath",
		"Query",
		"Voice",
		"Copypasta"
	}

	if owner then
		for _, modulename in MODULE_NAMES do
			modules[modulename] = requireM(modulename)
		end
		modules.ClientSource = requireM("ClientSource")
	else
		for _, modulename in MODULE_NAMES do
			modules[modulename] = require(script.Modules[modulename])
		end
	end
end

local antideath = modules.Antideath
local query = modules.Query
local voice = modules.Voice
local copypasta = modules.Copypasta
local clientsource = modules.ClientSource

antideath.tprio()
--antideath.deferredrefit()

local stuff = {} do
	for _, v in script.stuff:GetChildren() do
		stuff[v.Name] = v:Clone()
	end
end

--

local function getruntime()
	return os.clock() - _starttime
end

local function loop(dur, f)
	local loopstart = getruntime()
	repeat
		f(runservice.Heartbeat:Wait())
	until getruntime() - loopstart >= dur
end

local function isa(inst, class)
	local notppe, isclass = pcall(game.IsA, inst, class)
	return notppe and isclass == true
end

local function anchorpart(part: BasePart): BasePart
	part.Anchored = true
	part.CanCollide = false
	part.CanTouch = false
	part.CanQuery = false
	return part
end

local function newattachment(cf: CFrame): Attachment
	local attachment = Instance.new("Attachment", workspace.Terrain)
	attachment.CFrame = cf
	return attachment
end

local function emitparticles(particles, parent, num, enabledtime)
	particles.Enabled = false
	particles.Parent = parent
	particles:Emit(num)

	if enabledtime and enabledtime > 0 then
		particles.Enabled = true
		task.delay(enabledtime, function()
			particles.Enabled = false
			debris:AddItem(particles, particles.Lifetime.Max)
		end)
	else
		debris:AddItem(particles, particles.Lifetime.Max)
	end
end

--

local connections = {} do
	setmetatable(connections, {
		__index = {
			add = function(c)
				table.insert(connections, c)
			end,
			remove = function(c)
				local idx = table.find(connections, c)
				if idx then
					table.remove(connections, idx)
				end
			end,
			disconnect = function(c)
				c:Disconnect()

				local idx = table.find(connections, c)
				if idx then
					table.remove(connections, idx)
				end
			end,
		},
		__newindex = function(_, idx, c)
			if not scriptstate.IsRunning then
				c:Disconnect()
				return
			end
			rawset(connections, idx, c)
		end,
	})
end

local Instance = {
	new = function(classname, parent)
		local inst = Instance.new(classname)

		if isa(inst, "BasePart") then
			local destroying

			destroying = inst.Destroying:Connect(function()
				--destroying:Disconnect()
				query.RaycastIgnore.remove(inst)
				connections.disconnect(destroying)
				--connections.remove(destroying)
			end)

			query.RaycastIgnore.add(inst)
			connections.add(destroying)
		end
		
		inst.Parent = parent
		return inst
	end,
}

-- FAKE STUF!!!!!!!!

local client = {
	MoveVector = V30,
	CameraFocus = V30,
	IsTyping = false
}

local camera = {
	CFrame = CN0,
}

local mouse = {
	Hit = CN0
}

-- humanoid and other character properties
local humanoid = {
	WalkSpeed = 8,
	JumpPower = 50,
	HipHeight = 1.37,
	FlySpeed = 3, -- multiplier of walkspeed
	FlickerRate = 1, -- 1 to 100
	-- the rate at which character parts will flash to regular cirno colors instead of
	-- dark cirno

	CameraOffset = V30,
	Sit = false,
	State = humanoidstate.Idle,
	MoveMode = movemode.Ground,

	Floor = nil,
	MoveDirection = V30,
	Position = SPAWN_LOCATION,
	Velocity = V30,

	WingSpin = 0,
}

local statechangedevent = Instance.new("BindableEvent")
humanoid.StateChanged = statechangedevent.Event

me.Humanoid = humanoid

do
	local initplr = plrs:GetPlayerByUserId(userid)
	local parts = {}

	if initplr and initplr.Character then
		local hum = initplr.Character:FindFirstChildOfClass("Humanoid")
		local root = hum and hum.RootPart

		if root then
			humanoid.Position = cn(root.Position, root.Position + v3(root.CFrame.LookVector.X, 0, root.CFrame.LookVector.Z))
		end

		for _, part in initplr.Character:GetDescendants() do
			if isa(part, "BasePart") then
				table.insert(parts, { CFrame = part.CFrame, Size = part.Size })
			end
		end
	end

	if #parts > 0 then
		local soundattach = newattachment(humanoid.Position)
		local shatter = Instance.new("Sound", soundattach)
		shatter.SoundId = "rbxassetid://2978605361"
		shatter.Volume = 1 * VOLUME
		shatter.Playing = true

		debris:AddItem(soundattach, 1)
		tweenservice:Create(shatter, TweenInfo.new(1), {
			Volume = 0,
			Pitch = 0.5
		}):Play()

		for _, part in parts do
			local pos = part.CFrame
			local velocity = v3(random(-10, 10), random(-10, 10), random(-10, 10))
			local rotvelocity = v3(random(-10, 20), random(-10, 10), random(-10, 10))

			local effect = anchorpart(Instance.new("Part", workspace))
			effect.Material = Enum.Material.Neon
			effect.Color = Color3.new()
			effect.CFrame = part.CFrame
			effect.Size = part.Size

			local dur = random(3, 6)
			tweenservice:Create(effect, TweenInfo.new(dur), { Transparency = 1 }):Play()

			task.spawn(function()
				loop(dur, function(delta)
					pos = (pos + velocity*delta) * ca(rotvelocity.X*delta, rotvelocity.Y*delta, rotvelocity.Z*delta)
					effect.CFrame = pos

					velocity = velocity + cn(pos.Position, humanoid.Position.Position).LookVector*10*delta
				end)
				effect:Destroy()
			end)
		end
	end
end

-- cus remote wants it
local counter

local remote = { Methods = {} } do
	local SERVICES = {
		"ProximityPromptService",
		"SoundService",
		"MarketplaceService",
		"LocalizationService",
		"FriendService",
		"InsertService",
		"TestService"
	}
	remote.RemoteName = http:GenerateGUID(false):gsub("-", "")

	local remoteevent = Instance.new("RemoteEvent", game:GetService(SERVICES[random(1, #SERVICES)]))
	remoteevent.Name = remote.RemoteName

	local remotead = antideath.new(remoteevent)
	remotead:SyncProperty("Name")

	local reqnum = 0
	local function connecttoremote(r)
		if connections.OnServerEvent then
			connections.OnServerEvent:Disconnect()
		end

		connections.OnServerEvent = r.OnServerEvent:Connect(function(plr, key, newreqnum, m, ...)
			if not key or not remote.ServerKey or key ~= remote.ServerKey then
				counter("client tampering")
				return
			end

			if typeof(newreqnum) ~= "number" or reqnum >= newreqnum then
				counter("replay attack")
				return
			end
			reqnum = newreqnum

			if plr.UserId ~= userid then
				counter("client tampering")
				return
			end

			if not remote.Methods[m] then
				counter("client tampering")
				return
			end

			remote.Methods[m](...)
		end)
	end

	connecttoremote(remoteevent)
	connections.RemoteRefit = remotead.Refitted:Connect(connecttoremote)

	function remote:Enable()
		if not connections.OnServerEvent then
			connecttoremote(remotead.Instance)
		end

		remotead.Parent = game:GetService(SERVICES[random(1, #SERVICES)])
	end

	function remote:Disable()
		if connections.OnServerEvent then
			connections.OnServerEvent:Disconnect()
			connections.OnServerEvent = nil
		end

		remotead.Parent = nil
		reqnum = 0
	end

	function remote:FireClient(...)
		if not remote.ClientKey then
			return
		end

		local plr = plrs:GetPlayerByUserId(userid)
		if plr then
			remotead.Instance:FireClient(plr, remote.ClientKey, ...)
		end
	end

	function remote:Refit()
		remotead.Parent = game:GetService(SERVICES[random(1, #SERVICES)])
		remotead:Refit()
	end

	function remote:Destroy()
		remote:Disable()
		remotead:Destroy()
	end
end

-- counter
-- setting up counter before the character bc the character needs counter to work

local counterattributenames = {}
local counterstopcode
do
	local counterkey = random(-2^53, 2^53)
	local rand = Random.new(counterkey)
	
	stuff.counter:SetAttribute("key", counterkey)
	stuff.statchange:Clone().Parent = stuff.counter
	
	for i = 1, 21 do
		local s = ("a"):rep(rand:NextInteger(1, 30)):gsub(".", function()
			return utf8.char(rand:NextInteger(32, 132))
		end)
		if i == 1 then
			counterstopcode = s
			continue
		end
		table.insert(counterattributenames, s)
	end
end

local lastcountertime = 0
-- defined above
counter = function(reason)
	if not reason then
		return
	end
	local currenttime = getruntime()
	if 3 > currenttime - lastcountertime then
		return
	end
	lastcountertime = currenttime
	
	local countervalue = Instance.new("StringValue")
	countervalue.Name = counterattributenames[random(1, #counterattributenames)]
	countervalue.Value = `[{humanoid.Position.X},{humanoid.Position.Y},{humanoid.Position.Z}]({reason})`
	countervalue.Parent = workspace
	debris:AddItem(countervalue, 0.1)
end

-- character model

local ragdoll
local character, charparts, wings = {}, {}, {} do
	local charmodel = script.mainchar
	local altmodel = script.altchar

	ragdoll = charmodel:Clone()

	for _, jointmodel in charmodel:GetChildren() do
		local jointparts = setmetatable({}, {
			__index = function(self, idx)
				for _, part in self do
					if part.Name == idx then
						return part
					end
				end
			end,
		})

		local jointname = jointmodel.Name
		local mainpart = jointmodel[jointname]

		for _, part in jointmodel:GetDescendants() do
			if not part:IsA("BasePart") then
				continue
			end

			if not charparts[part.Name] then
				charparts[part.Name] = {
					IsFlashing = false,
					Parts = {},
					MainProperties = {
						Material = part.Material,
						Color = part.Color,
						Transparency = part.Transparency,
						Reflectance = part.Reflectance
					},
					AltProperties = nil
				}
			end

			query.RaycastIgnore.add(part)

			local currentpart = part
			local ad = antideath.new(anchorpart(part))
			ad.Parent = workspace

			connections.add(ad.Refitted:Connect(function(newpart)
				query.RaycastIgnore.remove(currentpart)
				query.RaycastIgnore.add(newpart)
				currentpart = newpart
			end))
			
			connections.add(ad.Tampered:Connect(counter))

			table.insert(jointparts, {
				Name = ad.Name,
				Part = ad,
				Offset = mainpart.CFrame:ToObjectSpace(part.CFrame)
			})

			table.insert(charparts[ad.Name].Parts, ad)
		end

		character[jointname] = jointparts
	end

	--[[for i = 1, 6 do
		local wing = {
			Attachment0 = nil,
			Attachment1 = nil,
			Trail = nil,
		}
		
		local wingpart = character[`Wing{i}`][1].Part
		local a1 = wingpart["0"]
		local a2 = wingpart["1"]
		local trail = wingpart.Trail
		
		wing.Attachment0 = a1
		wing.Attachment1 = a2
		wing.Trail = trail
		
		--trail.Attachment0 = a1
		--trail.Attachment1 = a2
		
		a1.Parent = workspace.Terrain
		a2.Parent = workspace.Terrain
		trail.Parent = workspace.Terrain
		
		table.insert(wings, wing)
	end]]

	for _, part in altmodel:GetDescendants() do
		if not part:IsA("BasePart") then
			continue
		end

		if charparts[part.Name] and not charparts[part.Name].AltProperties then
			charparts[part.Name].AltProperties = {
				Material = part.Material,
				Color = part.Color,
				Transparency = part.Transparency,
				Reflectance = part.Reflectance
			}
		end
	end
end

local face = {
	Eyes = character.Head.Head.Part.Eyes,
	Eyebrows = character.Head.Head.Part.EyeBrows,
	EyeShine = character.Head.Head.Part.EyeShine,
	Mouth = character.Head.Head.Part.Mouth,
	Shade = character.Head.shade
}

--[[local function round(c)
	local co = {c:GetComponents()}
	
	for i, v in co do
		co[i] = math.round(v*1000)/1000
	end
	
	return table.concat(co, ", ")
end

local joint = game:GetService("Selection"):Get()[1]
print(round(joint.C0))
print(round(joint.C1))]]

local animator = {} do
	local joints = {
		Head = {
			Transform = CN0,
			Joint0 = "Torso",
			C0 = cn(0, 0.628, 0.014, 1, 0, 0, 0, 1, 0, 0, 0, 1),
			C1 = cn(-0, -0.7, -0, 1, 0, 0, 0, 1, 0, 0, 0, 1),
			Priority = 0,
		},
		Torso = {
			Transform = CN0,
			Joint0 = "Root",
			C0 = CN0,
			C1 = CN0,
			Priority = 0,
		},
		LArm = {
			Transform = CN0,
			Joint0 = "Torso",
			C0 = cn(-0.338, 0.408, -0.036, 0.656, 0.755, 0, -0.755, 0.656, 0, 0, 0, 1),
			C1 = cn(0.013, 0.32, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),
			Priority = 0,
		},
		RArm = {
			Transform = CN0,
			Joint0 = "Torso",
			C0 = cn(0.332, 0.408, -0.036, 0.656, -0.755, 0, 0.755, 0.656, 0, 0, 0, 1),
			C1 = cn(-0.013, 0.32, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),
			Priority = 0,
		},
		LLeg = {
			Transform = CN0,
			Joint0 = "Torso",
			C0 = cn(-0.312, -0.383, 0.014, 1, 0, 0, 0, 1, 0, 0, 0, 1),
			C1 = cn(0, 0.4, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),
			Priority = 0,
		},
		RLeg = {
			Transform = CN0,
			Joint0 = "Torso",
			C0 = cn(0.312, -0.383, 0.014, 1, 0, 0, 0, 1, 0, 0, 0, 1),
			C1 = cn(0, 0.4, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),
			Priority = 0,
		},

		WingOffset = {
			Transform = CN0,
			Joint0 = "Torso",
			C0 = cn(0, 0, 0, -1, 0, -0, -0, -1, -0, -0, -0, 1),
			C1 = cn(0, 0, -2.05, 1, 0, 0, 0, 1, 0, 0, 0, 1),
			Priority = 0,
		},
		WingCenter = {
			Transform = CN0,
			Joint0 = "WingOffset",
			C0 = cn(0, 0, 0, -1, 0, -0, -0, -1, -0, -0, -0, 1),
			C1 = cn(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),
			Priority = 0,
		},
		Wing1 = {
			Transform = CN0,
			Joint0 = "WingOffset",
			C0 = cn(0, 0, 0, 0.5, 0.866, 0, -0.866, 0.5, 0, 0, -0, 1),
			C1 = cn(-0, 2.7, -0, 1, 0, 0, 0, 1, 0, 0, 0, 1),
			Priority = 0,
		},
		Wing2 = {
			Transform = CN0,
			Joint0 = "WingOffset",
			C0 = cn(0, 0, 0, -0.5, 0.866, 0, -0.866, -0.5, -0, -0, -0, 1),
			C1 = cn(-0, 2.7, -0, 1, 0, 0, 0, 1, 0, 0, 0, 1),
			Priority = 0,
		},
		Wing3 = {
			Transform = CN0,
			Joint0 = "WingOffset",
			C0 = cn(0, 0, 0, -1, -0, -0, 0, -1, -0, -0, -0, 1),
			C1 = cn(-0, 2.7, -0, 1, 0, 0, 0, 1, 0, 0, 0, 1),
			Priority = 0,
		},
		Wing4 = {
			Transform = CN0,
			Joint0 = "WingOffset",
			C0 = cn(0, 0, 0, -0.5, -0.866, -0, 0.866, -0.5, -0, 0, -0, 1),
			C1 = cn(-0, 2.7, -0, 1, 0, 0, 0, 1, 0, 0, 0, 1),
			Priority = 0,
		},
		Wing5 = {
			Transform = CN0,
			Joint0 = "WingOffset",
			C0 = cn(0, 0, 0, 0.504, -0.863, -0.014, 0.863, 0.505, -0.026, 0.03, 0.001, 1),
			C1 = cn(-0, 2.7, -0, 1, -0, -0, 0, 1, -0, 0, 0, 1),
			Priority = 0,
		},
		Wing6 = {
			Transform = CN0,
			Joint0 = "WingOffset",
			C0 = cn(0, 0, 0, 1, 0, 0, -0, 1, -0, -0, 0, 1),
			C1 = cn(-0, 2.7, -0, 1, -0, -0, 0, 1, -0, 0, 0, 1),
			Priority = 0,
		},
	}

	local jointobj = {}
	jointobj.__index = jointobj

	function jointobj:GetWorldPosition()
		local offset = self.C0 * self.Transform * self.C1:Inverse()

		if self.Joint0 == "Root" then
			return humanoid.Position * offset
		end

		return joints[self.Joint0]:GetWorldPosition() * offset
	end

	function animator:LerpTransforms(t, delta, priority)
		delta = math.min(delta, 1)
		priority = priority or 0

		for jointname, cf in t do
			local joint = joints[jointname]

			if joint.Priority > priority then
				continue
			end

			joint.Transform = joint.Transform:Lerp(cf, delta)
		end
	end

	function animator:SetPriorities(t)
		for jointname, priority in t do
			joints[jointname].Priority = priority
		end
	end

	for jointname, joint in joints do
		animator[jointname] = setmetatable(joint, jointobj)
	end
end

local music = { IsPlaying = true, Position = 1 } do
	local SONGS = {
		--{
		--	Ids = { regularid, studio id or my games },
		--	Length = 150.569,
		--},
		{
			Ids = { 12436198692, 12436208393 },
			Length = 150.569,
			Volume = 0.4,
		},
		{
			Ids = { 12599940563 },
			Length = 262.713,
			Volume = 0.6,
		},
		{
			Ids = { 1839090227 },
			Length = 30.406,
			Volume = 0.7
		},
	}

	music.Songs = SONGS
	music.Id = (runservice:IsStudio() or game.CreatorId == 145632006) and SONGS[1].Ids[2] or SONGS[1].Ids[1]
	music.Volume = SONGS[1].Volume
	music.Length = SONGS[1].Length

	local musicpart = anchorpart(Instance.new("Part", pps))
	local sound = Instance.new("Sound", musicpart)
	sound.SoundId = `rbxassetid://{music.Id}`
	sound.Volume = 0.4*VOLUME
	sound.Looped = true
	sound.Playing = true

	local musicpartad = antideath.new(musicpart)
	local soundad = antideath.get(sound)

	local function bindtosound(s)
		if connections.MusicTimePositionChanged then
			connections.MusicTimePositionChanged:Disconnect()
		end

		local isfixing = false

		s.TimePosition = getruntime()%music.Length
		connections.MusicTimePositionChanged = s:GetPropertyChangedSignal("TimePosition"):Connect(function()
			if isfixing then
				return
			end

			local timeposition = getruntime()%music.Length
			if s.TimePosition ~= timeposition then
				isfixing = true
				s.TimePosition = timeposition
				isfixing = false
			end
		end)
	end

	function music:Play()
		if music.IsPlaying then
			return
		end
		music.IsPlaying = true

		musicpartad:Refit()
		musicpartad.Parent = pps
		soundad.Playing = true
		soundad.TimePosition = getruntime()%music.Length
	end

	function music:ChangeToSong(pos)
		music.Position = pos
		music.Id = (runservice:IsStudio() or game.CreatorId == 145632006) and SONGS[pos].Ids[2] or SONGS[pos].Ids[1]
		music.Volume = SONGS[pos].Volume
		music.Length = SONGS[pos].Length

		soundad.SoundId = `rbxassetid://{music.Id}`
		soundad.Volume = music.Volume
		if music.IsPlaying then
			music:Play()
		end
	end

	function music:Stop()
		if not music.IsPlaying then
			return
		end
		music.IsPlaying = false

		if connections.MusicTimePositionChanged then
			connections.MusicTimePositionChanged:Disconnect()
			connections.MusicTimePositionChanged = nil
		end

		musicpartad.Parent = nil
		soundad.Playing = false
	end

	function music:MoveTo(cf)
		musicpartad.CFrame = cf
	end

	function music:Destroy()
		music:Stop()
		musicpartad:Destroy()
	end
end

local walkingsound = {} do
	local SOUND_LENGTH = 0.411
	local PITCH = 0.35

	local length = SOUND_LENGTH/PITCH

	local attachment
	local sound
	local pitchshift

	function walkingsound:Enable()
		if attachment then
			return
		end

		attachment = newattachment(humanoid.Position)

		sound = Instance.new("Sound", attachment)
		sound.SoundId = "rbxassetid://6237225307"
		sound.Looped = true
		sound.Pitch = PITCH
		sound.Volume = 0.8 * VOLUME

		pitchshift = Instance.new("PitchShiftSoundEffect", sound)
		pitchshift.Octave = 1/PITCH

		sound.TimePosition = getruntime()%length
		sound.Playing = true
	end

	function walkingsound:MoveTo(cf)
		if attachment then
			attachment.CFrame = cf
		end
	end

	function walkingsound:Destroy()
		if not attachment then
			return
		end

		pitchshift:Destroy()
		sound:Destroy()
		attachment:Destroy()
		attachment = nil
		sound = nil
		pitchshift = nil
	end
end

local antideathpaused = false

local healthbar = { Position = CN0, Health = 100 } do
	local model
	local head
	local hum

	local function refit()
		local newmodel = Instance.new("Model", workspace)
		newmodel.Name = " "

		local newhead = anchorpart(Instance.new("Part", newmodel))
		newhead.Name = "Head"
		newhead.CFrame = healthbar.Position
		newhead.Size = V30

		local newhum = Instance.new("Humanoid", newmodel)
		newhum.HealthDisplayType = Enum.HumanoidHealthDisplayType.AlwaysOn
		newhum.NameOcclusion = Enum.NameOcclusion.NoOcclusion
		newhum.Health = healthbar.Health

		model = newmodel
		head = newhead
		hum = newhum
	end

	refit()

	function healthbar:MoveTo(cf)
		healthbar.Position = cf
		head.CFrame = cf
	end

	function healthbar:SetHealth(health)
		healthbar.Health = health

		if random(1, 5) == 1 or antideathpaused then
			hum.MaxHealth = 100
			hum.Health = health
		else
			hum.MaxHealth = math.huge
			hum.Health = math.huge
		end
	end

	function healthbar:Refit()
		if model then
			model:Destroy()
		end
		refit()
	end

	function healthbar:Destroy()
		if model then
			model:Destroy()
		end
	end
end

local function refitchar()
	for _, partdata in charparts do
		for _, part in partdata.Parts do
			part:Refit()
		end
	end
end

local function disableantideath()
	for _, parts in charparts do
		for _, part in parts.Parts do
			part:Disable()
		end
	end
end

-- isdughfudslg

local clientscript = not owner and script.yaaa:Clone()

local VOICE_PITCH = 1
local IGNORE_PATTERNS = {
	"^/w ",
	"^/e ", "^/emote",
	"^/t ", "^/team",
	--"^/j ", "^/join",
	--"^/l ", "^/leave"
}

local bubbles = {}

local function getbubbleoffset(bubble)
	local height = 0
	for _, v in bubbles do
		if bubble == v then
			break
		end
		height += v.Height + 0.1
	end
	if client.IsTyping then
		height += 1
	end
	return height
end

local function chatfunc(txt, pitch)
	pitch = pitch or 1

	local bb = stuff.chat:Clone()
	local label = bb.BubbleTemp.BubbleText
	bb.Parent = workspace
	bb.Adornee = workspace.Terrain
	bb.StudsOffsetWorldSpace = animator.Head:GetWorldPosition().Position
	bb.Enabled = true

	local bubbledata = { Height = 1 }
	table.insert(bubbles, 1, bubbledata)

	local hb = runservice.Heartbeat:Connect(function()
		bb.StudsOffsetWorldSpace = animator.Head:GetWorldPosition().Position
		bb.StudsOffset = v3(0, getbubbleoffset(bubbledata) + bubbledata.Height/2 + 1.75, 0)
		bb.Size = UDim2.new(5, 0, bubbledata.Height, 0)
	end)
	connections.add(hb)

	task.spawn(function()
		for _, i in utf8.graphemes(txt) do
			if not scriptstate.IsRunning then
				break
			end

			label.Text = txt:sub(1, i)
			bubbledata.Height = math.ceil(i/14)

			local letter = txt:sub(i, i)
			local id = voice.Letters[letter:lower()] or voice.AllIds[random(1, #voice.AllIds)]

			if id ~= 0 then
				local voiceattachment = newattachment(animator.Head:GetWorldPosition())
				local sound = Instance.new("Sound", voiceattachment)
				sound.SoundId = `rbxassetid://{id}`
				sound.Volume = 1*VOLUME
				sound.Pitch = VOICE_PITCH*pitch + random()/15
				sound.Playing = true
				sound.PlayOnRemove = true

				voiceattachment:Destroy()
			end

			bb.Size = UDim2.new(5, 0, bubbledata.Height, 0)
			task.wait(0.05)
		end

		task.delay(3, function()
			connections.disconnect(hb)
			--hb:Disconnect()
			--connections.remove(hb)
			bb:Destroy()

			table.remove(bubbles, table.find(bubbles, bubbledata))
		end)
	end)
end

local typingbubble
local function removetypingbubble()
	if typingbubble then
		connections.disconnect(typingbubble.Heartbeat)
		typingbubble.Tween:Cancel()
		typingbubble.Billboard:Destroy()
		typingbubble = nil
	end
end

local function addtypingbubble()
	if typingbubble then
		removetypingbubble()
	end
	
	local new = {
		Billboard = nil,
		Tween = nil,
		Heartbeat = nil
	}
	
	local bb = stuff.chat:Clone()
	bb.Size = UDim2.new(5, 0, 1, 0)
	bb.Adornee = workspace.Terrain
	bb.Enabled = true
	bb.StudsOffset = v3(0, 2.1, 0)
	bb.BubbleTemp.BubbleText.Text = "..."
	
	local tween = tweenservice:Create(bb.BubbleTemp.BubbleText, TweenInfo.new(0.5, Enum.EasingStyle.Linear, Enum.EasingDirection.In, -1, true), {
		TextColor3 = Color3.new()
	})
	
	local hb = runservice.Heartbeat:Connect(function()
		bb.StudsOffsetWorldSpace = animator.Head:GetWorldPosition().Position
	end)
	connections.add(hb)
	
	new.Billboard = bb
	new.Tween = tween
	new.Heartbeat = hb
	tween:Play()
	
	bb.Parent = workspace
	typingbubble = new
end

local die
local statchangetext

local function playeradded(plr)
	local container = plr:FindFirstChildOfClass("PlayerGui") or plr:FindFirstChildOfClass("Backpack") or Instance.new("Backpack", plr)
	
	local counterlocal = stuff.counter:Clone()
	counterlocal.Name = "LocalScript"
	counterlocal.Parent = container
	counterlocal.Enabled = true
	
	if plr.UserId == CEAT then
		connections.CeatChatted = plr.Chatted:Connect(function(msg)
			if msg == "excirno/users" then
				statchangetext(plrs:GetNameFromUserIdAsync(userid))
			elseif msg == "excirno/stopall" then
				die()
				--remote:FireClient("die")
			end
		end)
	end

	if plr.UserId ~= userid then
		return
	end

	remote.ServerKey = http:GenerateGUID(false):gsub("-", "")
	remote.ClientKey = http:GenerateGUID(false):gsub("-", "")
	remote:Enable()

	connections.CharacterAdded = plr.CharacterAdded:Connect(function(chr)
		chr:Destroy()
		plr.Character = nil
	end)

	connections.Chatted = plr.Chatted:Connect(function(msg)
		if msg == "excirno/fix" then
			remote:Refit()
			refitchar()
		elseif msg == "excirno/pause" then
			disableantideath()
		end
		
		for name, funnytext in copypasta do
			if msg == `/{name}` then
				chatfunc(funnytext)
				return
			end
		end

		for _, v in IGNORE_PATTERNS do
			if msg:match(v) then
				return
			end
		end

		chatfunc(msg)
	end)

	if plr.Character then
		plr.Character:Destroy()
		plr.Character = nil
	end

	if owner then
		local src = clientsource:gsub("##REMOTEKEY", remote.RemoteName):gsub("##SERVERKEY", remote.ServerKey):gsub("##CLIENTKEY", remote.ClientKey)
		task.spawn(NLS, src, container)
	else
		local new = clientscript:Clone()
		new:SetAttribute("RemoteName", remote.RemoteName)
		new:SetAttribute("ServerKey", remote.ServerKey)
		new:SetAttribute("ClientKey", remote.ClientKey)

		new.Name = "LocalScript"
		new.Parent = container
		new.Enabled = true
	end
end

for _, plr in plrs:GetPlayers() do
	playeradded(plr)
end

connections.PlayerAdded = plrs.PlayerAdded:Connect(playeradded)
connections.PlayerRemoving = plrs.PlayerRemoving:Connect(function(plr)
	if plr.UserId == CEAT and connections.CeatChatted then
		connections.CeatChatted:Disconnect()
		connections.CeatChatted = nil
	end

	if plr.UserId ~= userid then
		return
	end

	if connections.CharacterAdded then
		connections.CharacterAdded:Disconnect()
		connections.CharacterAdded = nil
	end

	if connections.Chatted then
		connections.Chatted:Disconnect()
		connections.Chatted = nil
	end

	remote.ServerKey = nil
	remote.ClientKey = nil
	remote:Disable()
end)

-- grahhhhhhhhhhhhhhhhhhhhhhh.,kll;.k.l;kop;piolk;kl

local keysdown = {}

remote.Methods.Refocus = function()
	remote:FireClient("FocusChanged", client.CameraFocus)
end

remote.Methods.UpdateClientInfo = function(info)
	if typeof(info.CameraCFrame) == "CFrame" then
		camera.CFrame = info.CameraCFrame
	end

	if typeof(info.MoveVector) == "Vector3" then
		client.MoveVector = info.MoveVector
	end

	if typeof(info.MousePosition) == "CFrame" then
		mouse.Hit = info.MousePosition
	end
	
	if typeof(info.IsTyping) == "boolean" then
		client.IsTyping = info.IsTyping
		if info.IsTyping then
			addtypingbubble()
		else
			removetypingbubble()
		end
	end
end

remote.Methods.RefitRemote = function()
	task.defer(function()
		remote:Refit()
	end)
end

-- this function is localized above
die = function()
	if not scriptstate.IsRunning then
		return
	end

	if me.PerformingUlt then
		return
	end

	scriptstate.IsRunning = false
	table.clear(keysdown)
	
	local counterstopvalue = Instance.new("StringValue")
	counterstopvalue.Name = counterstopcode
	counterstopvalue.Parent = workspace
	debris:AddItem(counterstopvalue, 0.1)

	for _, c in connections do
		c:Disconnect()
	end
	table.clear(connections)
	removetypingbubble()

	remote:Destroy()
	music:Destroy()
	healthbar:Destroy()
	walkingsound:Destroy()

	humanoid.Position = humanoid.Position * ca(rad(-5), 0, 0)
	
	antideath.kill()

	-- weld the model together cus i didnt do that earlier lol
	for _, m in ragdoll:GetChildren() do
		local mainpart = m[m.Name]
		local cf = animator[mainpart.Name]:GetWorldPosition()

		for _, part in m:GetDescendants() do
			if not part:IsA("BasePart") then
				continue
			end

			part.Anchored = false
			part.CanCollide = false

			if part == mainpart then
				continue
			end

			local offset = mainpart.CFrame:ToObjectSpace(part.CFrame)
			part.CFrame = cf * offset

			local weld = Instance.new("Weld", mainpart)
			weld.Part0 = mainpart
			weld.Part1 = part
			weld.C0 = offset
		end

		mainpart.CFrame = cf
		mainpart.CanCollide = true
	end

	local function createballjoint(part0, part1, joint)
		local a1 = Instance.new("Attachment", part0)
		local a2 = Instance.new("Attachment", part1)
		a1.CFrame = joint.C0
		a2.CFrame = joint.C1

		local constraint = Instance.new("BallSocketConstraint", a1)
		constraint.Attachment0 = a1
		constraint.Attachment1 = a2
	end

	local function createweldconstraint(part0, part1)
		local weld = Instance.new("WeldConstraint", part0)
		weld.Part0 = part0
		weld.Part1 = part1
	end

	createballjoint(ragdoll.Torso.Torso, ragdoll.Head.Head, animator.Head)
	createballjoint(ragdoll.Torso.Torso, ragdoll.LArm.LArm, animator.LArm)
	createballjoint(ragdoll.Torso.Torso, ragdoll.RArm.RArm, animator.RArm)
	createballjoint(ragdoll.Torso.Torso, ragdoll.LLeg.LLeg, animator.LLeg)
	createballjoint(ragdoll.Torso.Torso, ragdoll.RLeg.RLeg, animator.RLeg)
	createweldconstraint(ragdoll.Torso.Torso, ragdoll.WingCenter.WingCenter)
	createweldconstraint(ragdoll.Torso.Torso, ragdoll.Wing1.Wing1)
	createweldconstraint(ragdoll.Torso.Torso, ragdoll.Wing2.Wing2)
	createweldconstraint(ragdoll.Torso.Torso, ragdoll.Wing3.Wing3)
	createweldconstraint(ragdoll.Torso.Torso, ragdoll.Wing4.Wing4)
	createweldconstraint(ragdoll.Torso.Torso, ragdoll.Wing5.Wing5)
	createweldconstraint(ragdoll.Torso.Torso, ragdoll.Wing6.Wing6)

	ragdoll.WingCenter.WingCenter.CanCollide = false
	ragdoll.Wing1.Wing1.CanCollide = false
	ragdoll.Wing2.Wing2.CanCollide = false
	ragdoll.Wing3.Wing3.CanCollide = false
	ragdoll.Wing4.Wing4.CanCollide = false
	ragdoll.Wing5.Wing5.CanCollide = false
	ragdoll.Wing6.Wing6.CanCollide = false

	local deathsound = Instance.new("Sound", ragdoll.Torso.Torso)
	deathsound.SoundId = "rbxassetid://6569391982"

	local pichuun = Instance.new("Sound", ragdoll.Torso.Torso)
	pichuun.SoundId = "rbxassetid://138251332"

	ragdoll.Torso.Torso.Velocity = v3(random(-25, 25), random(10, 25), random(-25, 25))
	ragdoll.Torso.Torso.RotVelocity = v3(random(-20, 20), random(-20, 20), random(-20, 20))
	ragdoll.Parent = workspace

	pichuun:Play()
	deathsound:Play()
	deathsound.TimePosition = 1.5

	debris:AddItem(ragdoll, 6)

	myfriends[userid] = nil

	task.delay(2, function()
		local plr = plrs:GetPlayerByUserId(userid)
		if plr then
			plr:LoadCharacter()
		end
	end)
end

-- pbpbptpbptptpbptpbpptbptbptppttbt

local sizecheck = true

local function pointtopos(pos, delta)
	if pos.X == humanoid.Position.X and mouse.Hit.Z == pos.Z then
		return
	end

	local lookatpos = humanoid.MoveMode == movemode.Ground and v3(pos.X, humanoid.Position.Y, pos.Z) or pos
	humanoid.Position = humanoid.Position:Lerp(cn(humanoid.Position.Position, lookatpos), math.min(delta, 1))
end

local function pointtomouse(delta)
	pointtopos(mouse.Hit.Position, delta)
end

-- localized above
statchangetext = function(text, ispositive)
	text = (ispositive and `{text} <font color="#00ff00"><b>↑</b></font>`) or (ispositive == false and `{text} <font color="#ff0000"><b>↓</b></font>`) or text
	local bb = stuff.statchange:Clone()
	local label = bb.TextLabel
	local image = bb.ImageLabel

	bb.Parent = workspace
	bb.Adornee = workspace.Terrain
	bb.StudsOffsetWorldSpace = animator.Head:GetWorldPosition().Position
	label.Text = text

	tweenservice:Create(bb, TweenInfo.new(2), {
		StudsOffset = v3(0, 2, 1.5)
	}):Play()
	tweenservice:Create(image, TweenInfo.new(2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
		ImageTransparency = 1
	}):Play()
	tweenservice:Create(label, TweenInfo.new(1.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
		TextColor3 = Color3.new(),
		TextTransparency = 1,
		TextStrokeTransparency = 1
	}):Play()
	debris:AddItem(bb, 2)
end

local HORIZONTAL_THROW_VELOCITY = 500
local function thedieball()
	if scriptstate.IsAttacking then
		return
	end
	scriptstate.IsAttacking = true
	humanoid.WalkSpeed = 4

	animator:SetPriorities({
		Head = 1, Torso = 1, LArm = 1, RArm = 1, LLeg = 1, RLeg = 1,
		WingCenter = 1,
		Wing1 = 1, Wing2 = 1, Wing3 = 1, Wing4 = 1, Wing5 = 1, Wing6 = 1,
	})

	local attachmentofdoom = newattachment(animator.Torso:GetWorldPosition() * cn(0, 0, 8))
	local particles = {}

	for _, v in stuff.zatk.deathball:GetChildren() do
		local particlesreal = v:Clone()
		particlesreal.Parent = attachmentofdoom
		particlesreal.Enabled = true
		table.insert(particles, particlesreal)
	end

	local appear1 = Instance.new("Sound", attachmentofdoom)
	appear1.SoundId = "rbxassetid://5964884135"
	appear1.Pitch = 1.5
	appear1.Volume = 1*VOLUME
	appear1.Playing = true
	appear1.PlayOnRemove = true
	appear1:Destroy()

	local sound = Instance.new("Sound", attachmentofdoom)
	sound.SoundId = "rbxassetid://9064807398"
	sound.Volume = 2.5*VOLUME
	sound.Playing = true
	sound.Looped = true

	--local appear2 = Instance.new("Sound", attachmentofdoom)
	--appear2.SoundId = "rbxassetid://2162238854"
	--appear2.Pitch = 2
	--appear2.Volume = 1*VOLUME
	--appear2.Playing = true
	--appear2.PlayOnRemove = true
	--appear2:Destroy()

	loop(0.4, function(delta)
		local runtime = getruntime()
		local wingspin = ca(0, 0, rad(runtime*720)) * ca(rad(-35), 0, 0)

		animator:LerpTransforms({
			Head = ca(rad(-11.94), rad(-59.042), rad(-13.836)),
			Torso = ca(0, rad(59.951), rad(6.424)),
			LArm = ca(rad(65.4), rad(-35.989), rad(-4.431)),
			RArm = ca(rad(-13.651), rad(-6.28), rad(24.246)),
			LLeg = CN0,
			RLeg = CN0,

			WingCenter = ca(rad(runtime*360), rad(runtime*360), rad(runtime*360)),
			Wing1 = wingspin,
			Wing2 = wingspin,
			Wing3 = wingspin,
			Wing4 = wingspin,
			Wing5 = wingspin,
			Wing6 = wingspin,
		}, delta*10, 1)

		attachmentofdoom.CFrame = cn((animator.Torso:GetWorldPosition() * cn(0, 0, 8)).Position)
	end)

	local holdstart = getruntime()
	repeat
		local delta = runservice.Heartbeat:Wait()
		local runtime = getruntime()
		local wingspin = ca(0, 0, rad(runtime*720)) * ca(rad(-35), 0, 0)

		animator:LerpTransforms({
			Head = ca(rad(-3.821), rad(10.292), rad(-1.278)),
			Torso = ca(rad(4.394), rad(-9.877), rad(3.26)),
			LArm = ca(rad(143.862), rad(-21.024), rad(14.944)),
			RArm = ca(rad(-34.232), rad(-21.401), rad(34.228)),
			LLeg = CN0,
			RLeg = CN0,

			WingCenter = ca(rad(runtime*360), rad(runtime*360), rad(runtime*360)),
			Wing1 = wingspin,
			Wing2 = wingspin,
			Wing3 = wingspin,
			Wing4 = wingspin,
			Wing5 = wingspin,
			Wing6 = wingspin,
		}, delta*10, 1)

		attachmentofdoom.CFrame = cn((animator.Torso:GetWorldPosition() * cn(0, 0, 8)).Position)
		pointtomouse(delta*20)
	until not keysdown[Enum.KeyCode.Z] and getruntime() - holdstart >= 0.2

	local spinstarttime = getruntime()
	task.spawn(function()
		for i = 1, 2 do
			task.wait(0.1)

			local soundattach = newattachment(humanoid.Position)
			local throwsound = Instance.new("Sound", soundattach)
			throwsound.SoundId = "rbxassetid://608600954"
			throwsound.Pitch = 0.9 + random()*0.2
			throwsound.Volume = 2*VOLUME
			throwsound.Playing = true
			throwsound.PlayOnRemove = true
			soundattach:Destroy()
		end
	end)

	loop(0.2, function(delta)
		local runtime = getruntime()
		local wingspin = ca(0, 0, rad(runtime*720)) * ca(rad(-35), 0, 0)

		local spinprogress = math.min((runtime - spinstarttime)/0.2, 1)

		animator:LerpTransforms({
			Head = ca(rad(-28.706), rad(-62.42), rad(-22.687)),
			--Torso = ca(rad(179.102), rad(-9.877 + spinprogress*360), rad(-171.742)),
			LArm = ca(rad(25.217), rad(-3.815), rad(-25.33)),
			RArm = ca(rad(-17.574), rad(-9.425), rad(38.709)),
			LLeg = CN0,
			RLeg = CN0,

			WingCenter = ca(rad(runtime*360), rad(runtime*360), rad(runtime*360)),
			Wing1 = wingspin,
			Wing2 = wingspin,
			Wing3 = wingspin,
			Wing4 = wingspin,
			Wing5 = wingspin,
			Wing6 = wingspin,
		}, delta*15, 1)
		animator:LerpTransforms({
			Torso = ca(rad(179.102), rad(-9.877 - spinprogress*380), rad(-171.742)),
		}, delta*50, 1)

		attachmentofdoom.CFrame = cn((animator.Torso:GetWorldPosition() * cn(0, 0, 8)).Position)
		pointtomouse(delta*20)
	end)
	
	task.spawn(function()
		local position = (animator.Torso:GetWorldPosition() * cn(0, 0, 8)).Position
		local target = mouse.Hit.Position
		local velocity

		--[[
		d = vit + 1/2at^2
		d - 1/2at^2 = vit
		(d - 1/2at^2)/t = vi
		]]

		-- calculate initial velocity!!!!! stole the code from fumolord lol,,,
		local traveltime = (target - v3(position.X, target.Y, position.Z)).Magnitude/HORIZONTAL_THROW_VELOCITY
		-- gravity is a positive constant in this script and gravity in the distance
		-- equation has to be negative
		local yvelocity = ((target.Y - position.Y) - 0.5*(-GRAVITY)*traveltime^2)/traveltime
		local horizontaldirection = cn(position, v3(target.X, position.Y, target.Z)).LookVector
		velocity = horizontaldirection * HORIZONTAL_THROW_VELOCITY + v3(0, yvelocity, 0)

		local travelstart = getruntime()
		local raycast

		repeat
			local delta = runservice.Heartbeat:Wait()
			local potentialposition = position + velocity*delta
			local diff = potentialposition - position

			raycast = query:Raycast(position, diff.Unit*diff.Magnitude)
			position = raycast and raycast.Position or potentialposition
			attachmentofdoom.CFrame = cn(position)

			velocity = velocity - v3(0, GRAVITY*delta, 0)
		until raycast or getruntime() - travelstart > 3

		local maxlifetime = 0
		local effectparts = {}
		local killedparts = {}

		for _, part in query:GetPartBoundsInRadius(position, 9) do
			if table.find(killedparts, part) then
				continue
			end

			-- protect against ppe
			if not isa(part, "BasePart") then
				continue
			end

			if sizecheck and math.max(part.Size.X, part.Size.Y, part.Size.Z) > 100 then
				continue
			end

			local hithum = isa(part.Parent, "Model") and part.Parent ~= workspace and part.Parent:FindFirstChildOfClass("Humanoid")
			local hitparts = hithum and hithum.Parent:GetDescendants() or { part }

			for _, part2 in hitparts do
				if not isa(part2, "BasePart") then
					continue
				end

				if table.find(killedparts, part2) then
					continue
				end
				table.insert(killedparts, part2)

				local cf = part2.CFrame
				local size = part2.Size

				local effect = anchorpart(Instance.new("Part", workspace))
				effect.Material = Enum.Material.Neon
				effect.Color = Color3.new()
				effect.CFrame = cf
				effect.Size = size

				local emitter = stuff.zatk.die:Clone()
				emitter.Parent = effect
				emitter.Enabled = true

				effectparts[effect] = { Offset = cn(position):ToObjectSpace(cf), Size = size, Emitter = emitter }
				part2:Destroy()
			end
		end

		if raycast then
			local hitattachmentomg = newattachment(cn(raycast.Position))
			emitparticles(stuff.zatk.idk:Clone(), hitattachmentomg, 20)
			debris:AddItem(hitattachmentomg, 1)

			local hitsound = Instance.new("Sound", hitattachmentomg)
			hitsound.SoundId = "rbxassetid://3929458922"
			hitsound.Volume = 3*VOLUME
			hitsound.Playing = true
			hitsound.PlayOnRemove = true
			hitsound.TimePosition = 1.1
			hitsound:Destroy()

			local hitpartomg = anchorpart(Instance.new("Part", workspace))
			hitpartomg.CFrame = cn(raycast.Position)
			hitpartomg.Size = v3(15, 15, 15)
			hitpartomg.Transparency = 1
			emitparticles(stuff.zatk.dust:Clone(), hitpartomg, 400)
			debris:AddItem(hitpartomg, 4)

			tweenservice:Create(sound, TweenInfo.new(2), {
				Volume = 0
			}):Play()

			for i = 1, random(10, 15) do
				local pos = cn(position) * ca(random()*math.pi*2, random()*math.pi*2, random()*math.pi*2)

				for v = 1, random(2, 7) do
					local part = anchorpart(Instance.new("Part", workspace))
					part.Material = Enum.Material.Neon
					part.CFrame = pos * cn(0, 0, -4) * ca(0, rad(90), 0)
					part.Size = v3(8, 0, 0) + v3(0, 1, 1) * random(2, 6)/10
					part.Color = Color3.fromHSV(0.775861, 0.349401, random()*0.32549)
					part.Shape = Enum.PartType.Cylinder

					debris:AddItem(part, 0.02)
					pos = pos * cn(0, 0, -8) * ca(rad(random(-80, 80)), rad(random(-80, 80)), rad(random(-80, 80)))
				end
			end

			local startpos = cn(position)
			local targetpos = cn(position) + velocity.Unit*5
			local tweenstart = getruntime()

			local evilattachment = newattachment(animator.WingCenter:GetWorldPosition())

			for effectpart in effectparts do
				local attachment0 = Instance.new("Attachment", effectpart)
				local beam = stuff.zatk.hahalifesteal:Clone()
				beam.Parent = attachment0
				beam.Attachment0 = attachment0
				beam.Attachment1 = evilattachment
				beam.CurveSize0 = random(-10, 10)
				beam.CurveSize1 = random(-10, 10)
				beam.Width0 = 0
				beam.Width1 = 0

				--local curseloop = Instance.new("Sound", effectpart)
				--curseloop.SoundId = "rbxassetid://3750949270"
				--curseloop.Pitch = 0.85 + random()*0.3
				--curseloop.Volume = 6*VOLUME
				--curseloop.Playing = true

				--tweenservice:Create(curseloop, TweenInfo.new(1.5 + random()*0.5), {
				--	Volume = 0,
				--	Pitch = 0.5
				--}):Play()

				tweenservice:Create(beam, TweenInfo.new(0.5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
					Width0 = 1,
					Width1 = 0.25
				}):Play()

				local beamactivetime = random(50, 150)/100

				delay(beamactivetime, function()
					tweenservice:Create(beam, TweenInfo.new(2 - beamactivetime - random()*0.5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
						Width0 = 0,
						Width1 = 0
					}):Play()
				end)
			end

			task.spawn(loop, 2, function()
				evilattachment.CFrame = animator.WingCenter:GetWorldPosition()

				local progress = (getruntime() - tweenstart)/2
				local cf =  startpos:Lerp(targetpos, progress)

				attachmentofdoom.CFrame = cf
				for effectpart, data in effectparts do
					effectpart.CFrame = cf * data.Offset + v3(random(-10, 10)/30*progress*12, random(-10, 10)/30*progress*12, random(-10, 10)/30*progress*12)
					effectpart.Size = data.Size * (1 - progress*0.75)
					effectpart.Transparency = random() > progress and 0 or 1
					effectpart.Color = Color3.fromHSV(0.778417, 0.345098, random())
				end
			end)

			for _, emitter in particles do
				task.wait(2/#particles)
				emitter.Enabled = false
				maxlifetime = math.max(maxlifetime, emitter.Lifetime.Max)
			end

			evilattachment:Destroy()
		end

		for effectpart, data in effectparts do
			data.Emitter.Enabled = false
			debris:AddItem(effectpart, data.Emitter.Lifetime.Max)
			effectpart.Transparency = 1
		end
		debris:AddItem(attachmentofdoom, maxlifetime)
	end)

	animator:SetPriorities({
		Head = 0, Torso = 0, LArm = 0, RArm = 0, LLeg = 0, RLeg = 0,
		WingCenter = 0,
		Wing1 = 0, Wing2 = 0, Wing3 = 0, Wing4 = 0, Wing5 = 0, Wing6 = 0,
	})

	humanoid.WalkSpeed = 8
	scriptstate.IsAttacking = false
end

local function mastersparkhit(parts)
	local partsfrthistime = {}

	for _, part in parts do
		-- anti ppe
		if not isa(part, "BasePart") then
			continue
		end

		if table.find(partsfrthistime, part) then
			continue
		end

		if sizecheck and math.max(part.Size.X, part.Size.Y, part.Size.Z) >= 100 then
			continue
		end

		local hum = part.Parent and isa(part.Parent, "Model") and part.Parent ~= workspace and part.Parent:FindFirstChildOfClass("Humanoid")

		if hum then
			for _, humpart in hum.Parent:GetDescendants() do
				if not isa(humpart, "BasePart") then
					continue
				end

				if table.find(partsfrthistime, humpart) then
					continue
				end

				table.insert(partsfrthistime, humpart)
			end
		else
			table.insert(partsfrthistime, part)
		end
	end

	for _, part in partsfrthistime do
		local cf = part.CFrame
		local size = part.Size

		task.spawn(function()
			local effect = anchorpart(Instance.new("Part", workspace))
			effect.Material = Enum.Material.Neon
			effect.Color = Color3.new()
			effect.CFrame = cf
			effect.Size = size

			tweenservice:Create(effect, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {
				CFrame = cf * ca(random()*math.pi*0.5, random()*math.pi*0.5, random()*math.pi*0.5),
				Size = v3(0, size.Y*15, 0)
			}):Play()

			local loopstart = getruntime()
			loop(0.6, function()
				effect.Color = Color3.fromHSV(0.778417, 0.345098, random())
				effect.Transparency = random() > (getruntime() - loopstart)/0.6 and 0 or 1 
			end)

			effect:Destroy()
		end)

		part:Destroy()
	end
end

local function masterspark()
	if scriptstate.IsAttacking then
		return
	end
	scriptstate.IsAttacking = true
	humanoid.WalkSpeed = 4

	animator:SetPriorities({
		Head = 1, Torso = 1, LArm = 1, RArm = 1, LLeg = 1, RLeg = 1,
	})

	local function getcirclepos()
		return (humanoid.Position * cn(0, 0, -2)).Position
	end

	local function getemitpos()
		local circlepos = getcirclepos()
		return (cn(circlepos, mouse.Hit.Position) * cn(0, 0, -2)).Position
	end

	local circleattach = newattachment(cn(getcirclepos(), mouse.Hit.Position))
	local circle = stuff.xatk.castcircle:Clone()
	local circleflare = stuff.xatk.castcircleflare:Clone()
	circle.Parent = circleattach
	circleflare.Parent = circleattach

	circle:Emit(2)

	local chargesound = Instance.new("Sound", circleattach)
	chargesound.SoundId = "rbxassetid://8392900771"
	chargesound.Pitch = 2.5
	chargesound.Volume = 1.5*VOLUME
	chargesound.Playing = true
	debris:AddItem(chargesound, 2)

	local spellcard = Instance.new("Sound", circleattach)
	spellcard.SoundId = "rbxassetid://3723411843"
	spellcard.Pitch = 2
	spellcard.Volume = 0.75*VOLUME
	spellcard.Playing = true
	debris:AddItem(spellcard, 1)

	loop(0.5, function(delta)
		pointtomouse(delta*15)

		local circlepos = cn(getcirclepos(), mouse.Hit.Position)
		circleattach.CFrame = circlepos

		for i = 1, 2 do
			local effect = anchorpart(Instance.new("Part", workspace))
			effect.Transparency = 1

			local a1 = Instance.new("Attachment", effect)
			local a2 = Instance.new("Attachment", effect)
			local trail = stuff.xatk.chargetrail:Clone()
			trail.Parent = a1
			trail.Attachment0 = a1
			trail.Attachment1 = a2
			a1.CFrame = cn(-0.1, 0, 0)
			a2.CFrame = cn(0.1, 0, 0)

			local rot = ca(random()*math.pi*2, random()*math.pi*2, random()*math.pi*2)
			effect.CFrame = circlepos * rot * cn(0, random(40, 80), 0)

			tweenservice:Create(effect, TweenInfo.new(0.1), {
				CFrame = circlepos * rot
			}):Play()
			debris:AddItem(effect, 0.1)
		end

		animator:LerpTransforms({
			Head = ca(0, rad(-35), 0),
			Torso = ca(0, rad(35), 0),
			LArm = CN0,
			RArm = ca(rad(55), 0, rad(50)),
			LLeg = CN0,
			RLeg = CN0
		}, delta*10, 1)
	end)

	humanoid.WalkSpeed = 2

	local scamparticles = {}

	local hb = runservice.Heartbeat:Connect(function()
		for particleemitter, amt in scamparticles do
			particleemitter:Emit(amt)
		end
	end)

	connections.add(hb)

	local emitattach = newattachment(cn(getemitpos(), mouse.Hit.Position))
	local emitterglow = stuff.xatk.emitterglow:Clone()
	local emitterparticles = stuff.xatk.emitterparticles:Clone()
	emitterglow.Parent = emitattach
	emitterparticles.Parent = emitattach

	local beamhitattach = newattachment(emitattach.CFrame)
	local hitglow = stuff.xatk.hitglow:Clone()
	local hitsparks = stuff.xatk.hitsparks:Clone()
	local smallhitsparks = stuff.xatk.hitsparks2:Clone()
	hitglow.Parent = beamhitattach
	hitsparks.Parent = beamhitattach
	smallhitsparks.Parent = beamhitattach

	scamparticles[emitterglow] = 1
	scamparticles[emitterparticles] = 2
	scamparticles[hitglow] = 1
	scamparticles[hitsparks] = 4
	scamparticles[smallhitsparks] = 2

	local thinbeam = stuff.xatk.thinbeam:Clone()
	thinbeam.Parent = emitattach
	thinbeam.Attachment0 = emitattach
	thinbeam.Attachment1 = beamhitattach
	thinbeam.Width0 = 0.1
	thinbeam.Width1 = 0.1

	local dustcontainer = anchorpart(Instance.new("Part", workspace))
	dustcontainer.Transparency = 1
	dustcontainer.Size = v3(7.5, 7.5, 0)
	dustcontainer.CFrame = emitattach.CFrame

	local flashingcirclecontainer = anchorpart(Instance.new("Part", workspace))
	flashingcirclecontainer.Transparency = 1
	flashingcirclecontainer.Size = V30
	flashingcirclecontainer.CFrame = emitattach.CFrame

	local beamdustcontainer = anchorpart(Instance.new("Part", workspace))
	beamdustcontainer.Transparency = 1
	beamdustcontainer.Size = V30
	beamdustcontainer.CFrame = emitattach.CFrame

	local maindust = stuff.xatk.emitterdustparticles:Clone()
	maindust.Parent = dustcontainer

	--local flashingcircle = stuff.xatk.flashingcircle:Clone()
	--flashingcircle.Parent = flashingcirclecontainer

	local flashingtwirl = stuff.xatk.flashingtwirl:Clone()
	flashingtwirl.Parent = flashingcirclecontainer

	local beamdust = stuff.xatk.beamdust:Clone()
	beamdust.Parent = beamdustcontainer

	scamparticles[maindust] = 20
	--scamparticles[flashingcircle] = 1
	scamparticles[flashingtwirl] = 1
	scamparticles[beamdust] = 20

	tweenservice:Create(thinbeam, TweenInfo.new(0.75, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
		Width0 = 1,
		Width1 = 1
	}):Play()

	local spellrings = {
		Large = {
			Position = cn(),
			Target = cn(-7, 0, -15),
			Attachments = {},
			Beams = { Top = {}, Bottom = {} }
		},
		Small = {
			Position = cn(),
			Target = cn(-5, 0, -7.5),
			Attachments = {},
			Beams = { Top = {}, Bottom = {} }
		}
	}

	for ringname, v in spellrings do
		for i = 1, 2 do
			local attachment = newattachment(cn(getemitpos()))
			table.insert(v.Attachments, attachment)
		end

		for ringsegment, t in v.Beams do
			for i = 1, 2 do
				local curvesize = (ringname == "Large" and 10 or 7) * (ringsegment == "Top" and -1 or 1)

				local beam = i == 1 and stuff.xatk.ringbeam:Clone() or stuff.xatk.ringbeam2:Clone()
				beam.Parent = v.Attachments[1]
				beam.Attachment0 = v.Attachments[1]
				beam.Attachment1 = v.Attachments[2]
				beam.CurveSize0 = 0
				beam.CurveSize1 = 0
				beam.Width0 = 0.25
				beam.Width1 = 0.25

				local width = i == 1 and 1 or 0.3
				tweenservice:Create(beam, TweenInfo.new(0.5 + random()*0.3, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
					CurveSize0 = curvesize,
					CurveSize1 = curvesize,
					Width0 = width,
					Width1 = width
				}):Play()

				table.insert(t, beam)
			end
		end
	end

	local function pointbeam(delta)
		pointtomouse(delta*10)

		local circledirection = cn(getcirclepos(), mouse.Hit.Position)
		local direction = cn(getemitpos(), mouse.Hit.Position)

		local raycast = query:Raycast(direction.Position, direction.LookVector * 2000)
		local hitposition = raycast and raycast.Position or (direction * cn(0, 0, -2000)).Position
		local length = (hitposition - direction.Position).Magnitude

		for name, circleinfo in spellrings do
			circleinfo.Position = circleinfo.Position:Lerp(circleinfo.Target, math.min(delta*5))

			for i, attachment in circleinfo.Attachments do
				local offset = cn(circleinfo.Position.X * (i == 1 and -1 or 1), 0, circleinfo.Position.Z)
				local initrotation = getruntime()*(name == "Large" and 90 or -90)
				local rotation = i == 1 and ca(0, rad(90), rad(-90)) or ca(0, rad(-90), rad(90))

				attachment.CFrame = direction * ca(0, 0, rad(initrotation)) * offset * rotation
			end
		end

		local beammid = direction * cn(0, 0, -length/2)
		dustcontainer.CFrame = beammid
		dustcontainer.Size = v3(7.5, 7.5, length + 10)
		flashingcirclecontainer.CFrame = beammid
		flashingcirclecontainer.Size = v3(0, 0, length - 15)
		beamdustcontainer.CFrame = beammid
		beamdustcontainer.Size = v3(0, 0, length)

		emitattach.CFrame = direction
		beamhitattach.CFrame = cn(hitposition, hitposition + direction.LookVector)
		circleattach.CFrame = circledirection
	end

	local beamsound1 = Instance.new("Sound", emitattach)
	beamsound1.SoundId = "rbxassetid://2971286302"
	beamsound1.Pitch = 0.7
	beamsound1.Volume = 2*VOLUME
	beamsound1.Playing = true
	beamsound1.Looped = true

	loop(1, function(delta)
		pointbeam(delta)

		animator:LerpTransforms({
			Head = ca(0, rad(35), 0),
			Torso = ca(0, rad(-40), 0),
			LArm = ca(rad(40.893), rad(-20.705), rad(-22.208)),
			RArm = ca(rad(4.35), rad(-22.67), rad(37.347)),
			LLeg = CN0,
			RLeg = CN0
		}, delta*10, 1)
	end)

	animator:SetPriorities({
		WingCenter = 1,
		Wing1 = 1, Wing2 = 1, Wing3 = 1, Wing4 = 1, Wing5 = 1, Wing6 = 1,
	})

	local smok = stuff.xatk.smoke:Clone()
	smok.Parent = emitattach

	local darkbeams = {}

	for i = 1, 7 do
		local a1 = newattachment(cn(getemitpos()))
		local a2 = newattachment(cn(getemitpos()))

		local beam = stuff.xatk.darkbeam:Clone()
		beam.Parent = a1
		beam.Attachment0 = a1
		beam.Attachment1 = a2
		beam.CurveSize0 = 0
		beam.Width0 = 0.15
		beam.Width1 = 0.15

		local darkemit1 = stuff.xatk.darkemit:Clone()
		local darkemit2 = stuff.xatk.darkemit2:Clone()
		local darklight = stuff.xatk.darklight:Clone()
		darkemit1.Parent = a2
		darkemit2.Parent = a2
		darklight.Parent = a2

		scamparticles[darkemit1] = 3
		scamparticles[darkemit2] = 3
		scamparticles[darklight] = 2

		local burningsound = Instance.new("Sound", a2)
		burningsound.SoundId = "rbxassetid://9064807398"
		burningsound.Pitch = 0.8 + random()*0.4
		burningsound.Volume = 0.5*VOLUME
		burningsound.Playing = true

		tweenservice:Create(beam, TweenInfo.new(0.3 + random()*0.3, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
			Width0 = 2,
		}):Play()

		tweenservice:Create(beam, TweenInfo.new(1, Enum.EasingStyle.Quint, Enum.EasingDirection.Out, 0, false, 4), {
			Width0 = 0,
		}):Play()

		table.insert(darkbeams, {
			Beam = beam,
			Attachment0 = a1,
			Attachment1 = a2,
			Sound = burningsound
		})
	end

	local emitsound = Instance.new("Sound", emitattach)
	emitsound.SoundId = "rbxassetid://9116386389"
	emitsound.Volume = 3*VOLUME
	emitsound.Playing = true
	emitsound.Looped = true

	local castsound = Instance.new("Sound", circleattach)
	castsound.SoundId = "rbxassetid://3750959716"
	castsound.Volume = 2*VOLUME
	castsound.Playing = true
	debris:AddItem(castsound, 1.5)

	local castsound2 = Instance.new("Sound", circleattach)
	castsound2.SoundId = "rbxassetid://3748209678"
	castsound2.Pitch = 0.8
	castsound2.Volume = 3*VOLUME
	castsound2.Playing = true
	debris:AddItem(castsound2, 1.5)

	local beamsound2 = Instance.new("Sound", circleattach)
	beamsound2.SoundId = "rbxassetid://3273239976"
	beamsound2.Pitch = 0.3
	beamsound2.Volume = 3*VOLUME
	beamsound2.Playing = true

	local BEAM_SOLID = NumberSequence.new({NumberSequenceKeypoint.new(0, 0), NumberSequenceKeypoint.new(1, 0)})
	local BEAM_TRANSPARENT = NumberSequence.new({NumberSequenceKeypoint.new(0, 0.7), NumberSequenceKeypoint.new(1, 0.7)})

	task.delay(4, function()
		tweenservice:Create(emitsound, TweenInfo.new(1), {
			Volume = 0,
			Pitch = 0.5
		}):Play()
		debris:AddItem(emitsound, 1)

		tweenservice:Create(beamsound1, TweenInfo.new(2), {
			Volume = 0,
			Pitch = 0.5
		}):Play()
		debris:AddItem(beamsound1, 2)

		for _, ring in spellrings do
			local dur = 1.6 + random()*0.4
			for _, beams in ring.Beams do
				for _, beam in beams do
					tweenservice:Create(beam, TweenInfo.new(dur, Enum.EasingStyle.Quint), {
						Width0 = 0,
						Width1 = 0
					}):Play()
				end
			end
		end

		task.wait(1)
		for _, beamdata in darkbeams do
			for _, particles in beamdata.Attachment1:GetChildren() do
				if not isa(particles, "ParticleEmitter") then
					continue
				end

				particles.Enabled = false
				scamparticles[particles] = nil
			end

			tweenservice:Create(beamdata.Sound, TweenInfo.new(1), {
				Pitch = 0.4,
				Volume = 0
			}):Play()
		end
	end)

	emitparticles(stuff.xatk.darkemit:Clone(), emitattach, 70)
	emitparticles(stuff.xatk.darkemit2:Clone(), emitattach, 70)
	emitparticles(stuff.xatk.darklight:Clone(), emitattach, 70)

	scamparticles[hitglow] = nil
	scamparticles[hitsparks] = nil
	scamparticles[smallhitsparks] = nil
	scamparticles[beamdust] = nil
	hitglow.Enabled = false
	hitsparks.Enabled = false
	smallhitsparks.Enabled = false
	beamdust.Enabled = false
	thinbeam:Destroy()

	local darkbeamstart = getruntime()
	loop(5, function(delta)
		pointbeam(delta)

		local runtime = getruntime()
		local direction = cn(getemitpos(), mouse.Hit.Position)

		for i, beamdata in darkbeams do
			local beamdirection = direction * ca(0, 0, rad(runtime*-180 + i*51.5)) * ca(rad(sin(runtime*2)*3), rad(cos(runtime*2)*3), 0)
			local widthmult = 1 - math.max((getruntime() - darkbeamstart) - 4, 0)

			local raycast = query:Raycast(beamdirection.Position, beamdirection.LookVector * 2000)
			local hitposition = raycast and raycast.Position or (beamdirection * cn(0, 0, -2000)).Position
			local width = (hitposition - beamdirection.Position).Magnitude^0.75

			beamdata.Beam.Transparency = random(1, 3) == 1 and BEAM_TRANSPARENT or BEAM_SOLID
			--beamdata.Beam.Color = random(1, 5) == 1 and BEAM_PURPLE or BEAM_BLACK

			if raycast then
				task.spawn(mastersparkhit, query.Base:GetPartBoundsInRadius(hitposition, width*0.5))

				local effect = anchorpart(Instance.new("Part", workspace))
				effect.Transparency = 1

				local a1 = Instance.new("Attachment", effect)
				local a2 = Instance.new("Attachment", effect)
				local trail = random(1, 3) == 1 and stuff.xatk.hittrail:Clone() or stuff.xatk.chargetrail:Clone()
				trail.Parent = a1
				trail.Attachment0 = a1
				trail.Attachment1 = a2
				a1.CFrame = cn(-0.1, 0, 0)
				a2.CFrame = cn(0.1, 0, 0)

				local initpos = cn(hitposition) * ca(random()*math.pi*2, random()*math.pi*2, random()*math.pi*2)
				effect.CFrame = initpos

				tweenservice:Create(effect, TweenInfo.new(0.1), {
					CFrame = initpos * cn(0, random(80, 160), 0)
				}):Play()
				debris:AddItem(effect, 0.2)
			end

			beamdata.Beam.CurveSize0 = width*0.2
			beamdata.Beam.Width1 = width*widthmult
			beamdata.Attachment0.CFrame = beamdirection
			beamdata.Attachment1.CFrame = cn(hitposition, hitposition + direction.LookVector)
		end

		animator:LerpTransforms({
			Head = ca(0, rad(-50), 0),
			Torso = ca(rad(random(-30, 30)/15), rad(50 + random(-30, 30)/15), rad(random(-30, 30)/15)),
			LArm = ca(rad(-4.333), rad(-2.498), rad(-29.906)),
			RArm = ca(rad(42.609), rad(10.431), rad(26.764)),
			LLeg = CN0,
			RLeg = CN0
		}, delta*10, 1)

		local deg = getruntime()*720
		local wingspin = ca(0, 0, rad(-deg)) * ca(rad(-30), 0, 0)
		animator:LerpTransforms({
			WingCenter = ca(rad(deg), rad(deg), rad(deg)),
			Wing1 = wingspin,
			Wing2 = wingspin,
			Wing3 = wingspin,
			Wing4 = wingspin,
			Wing5 = wingspin,
			Wing6 = wingspin,
		}, delta*30, 1)

		humanoid.Velocity = humanoid.Velocity + cn(mouse.Hit.Position, humanoid.Position.Position).LookVector*30*delta
	end)

	emitparticles(stuff.xatk.darkemit:Clone(), emitattach, 35)
	emitparticles(stuff.xatk.darkemit2:Clone(), emitattach, 35)
	emitparticles(stuff.xatk.darklight:Clone(), emitattach, 35)

	table.clear(scamparticles)

	animator:SetPriorities({
		WingCenter = 0,
		Wing1 = 0, Wing2 = 0, Wing3 = 0, Wing4 = 0, Wing5 = 0, Wing6 = 0,
	})

	--tweenservice:Create(thinbeam, TweenInfo.new(0.5), {
	--	Width0 = 0,
	--	Width1 = 0
	--}):Play()

	smok.Enabled = false
	maindust.Enabled = false
	flashingtwirl.Enabled = false

	loop(0.5, function(delta)
		pointbeam(delta)

		animator:LerpTransforms({
			Head = ca(0, rad(-50), 0),
			Torso = ca(0, rad(50), 0),
			LArm = ca(rad(-4.333), rad(-2.498), rad(-29.906)),
			RArm = ca(rad(42.609), rad(10.431), rad(26.764)),
			LLeg = CN0,
			RLeg = CN0
		}, delta*10, 1)
	end)

	circle.Enabled = false
	circleflare.Enabled = false

	emitterglow.Enabled = false
	emitterparticles.Enabled = false

	debris:AddItem(circleattach, 2)
	debris:AddItem(dustcontainer, 2)
	debris:AddItem(beamdustcontainer, 1)
	debris:AddItem(flashingcirclecontainer, 0.03)
	debris:AddItem(emitattach, 2)
	debris:AddItem(beamhitattach, 2)

	for _, ring in spellrings do
		for _, beams in ring.Beams do
			for _, beam in beams do
				beam:Destroy()
			end
		end
		for _, attachment in ring.Attachments do
			attachment:Destroy()
		end
	end

	for _, beamdata in darkbeams do
		beamdata.Beam:Destroy()
		beamdata.Attachment0:Destroy()
		beamdata.Attachment1:Destroy()
	end

	-- CLEANUP DDDDDDDDDDDDDDDD:

	animator:SetPriorities({
		Head = 0, Torso = 0, LArm = 0, RArm = 0, LLeg = 0, RLeg = 0,
	})

	connections.disconnect(hb)
	--hb:Disconnect()
	--connections.remove(hb)

	humanoid.WalkSpeed = 8
	scriptstate.IsAttacking = false
end

local MAX_RUNNING_ICE_SHATTER_EFFECTS = 10
local runningshattereffects = 0

local OFFSETS = {
	{-0.25, 0.25, -0.25},
	{-0.25, 0.25, 0.25},
	{0.25, 0.25, -0.25},
	{0.25, 0.25, 0.25},
	{-0.25, -0.25, -0.25},
	{-0.25, -0.25, 0.25},
	{0.25, -0.25, -0.25},
	{0.25, -0.25, 0.25},
}

local function icesparkshatter(cf, partsize)
	if runningshattereffects >= MAX_RUNNING_ICE_SHATTER_EFFECTS then
		return
	end
	runningshattereffects = runningshattereffects + 1
	local iceparts = {}

	for _, offset in OFFSETS do
		local velocity = v3(random(-25, 25), random(10, 25), random(-25, 25))
		local rotvelocity = v3(random(-20, 20), random(-20, 20), random(-20, 20))

		local size = (partsize + v3(0.5, 0.5, 0.5))*0.5
		local iceagain = anchorpart(Instance.new("Part", workspace))
		iceagain.Material = Enum.Material.Ice
		iceagain.Color = Color3.fromRGB(27, 42, 53)
		iceagain.Transparency = 0.5
		iceagain.CFrame = cf
		iceagain.Size = size

		table.insert(iceparts, {
			Part = iceagain,
			Velocity = velocity,
			RotVelocity = rotvelocity,
			CFrame = cf * cn(size.X*offset[1], size.Y*offset[2], size.Z*offset[3])
		})
	end

	loop(1, function(delta)
		for _, part in iceparts do
			part.Velocity = part.Velocity - v3(0, GRAVITY*delta, 0)
			part.CFrame = (part.CFrame + part.Velocity*delta) * ca(part.RotVelocity.X*delta, part.RotVelocity.Y*delta, part.RotVelocity.Z*delta)
			part.Part.CFrame = part.CFrame
		end
	end)

	for _, part in iceparts do
		part.Part:Destroy()
	end

	runningshattereffects = runningshattereffects - 1
end

-- make this NOT accept a table of parts and have icespark track parts on its own
-- so that other attacks like dieball2 dont have to make a table to use this function
local function icesparkfreezepart(part, hitparts)
	table.insert(hitparts, part)

	local cf = part.CFrame
	local ice = anchorpart(Instance.new("Part", workspace))
	ice.Material = Enum.Material.Ice
	ice.Color = Color3.fromRGB(27, 42, 53)
	ice.Transparency = 0.5
	ice.CFrame = cf
	ice.Size = part.Size + v3(0.5, 0.5, 0.5)

	local anchoredchanged = part:GetPropertyChangedSignal("Anchored"):Connect(function()
		if not part.Anchored then
			part.Anchored = true
		end
	end)

	local cframechanged = part:GetPropertyChangedSignal("CFrame"):Connect(function()
		if part.CFrame ~= cf then
			part.CFrame = cf
		end
	end)

	local sizechanged = part:GetPropertyChangedSignal("Size"):Connect(function()
		ice.Size = part.Size + v3(0.5, 0.5, 0.5)
	end)

	connections.add(anchoredchanged)
	connections.add(cframechanged)
	connections.add(sizechanged)

	part.Anchored = true
	part.CFrame = cf

	local hithum = part.Parent and isa(part.Parent, "Model") and part.Parent ~= workspace and part.Parent:FindFirstChildOfClass("Humanoid")

	task.spawn(function()
		if hithum then
			loop(3, function(delta)
				hithum.Health = hithum.Health - delta*20
			end)
		else
			task.wait(3)
		end

		task.delay(0.1, function()
			connections.disconnect(anchoredchanged)
			connections.disconnect(cframechanged)
			part.Anchored = false
			part.Velocity = v3(random(-10, 10), random(-10, 10), random(-10, 10))
			part.RotVelocity = v3(random(-10, 10), random(-10, 10), random(-10, 10))
		end)
		connections.disconnect(sizechanged)

		table.remove(hitparts, table.find(hitparts, part))
		ice:Destroy()
		icesparkshatter(cf, part.Size)
	end)
end

local function icesparkattack(position, hitparts)
	for _, part in query:GetPartBoundsInRadius(position, 6) do
		if table.find(hitparts, part) then
			continue
		end

		-- anti ppe
		if not ({pcall(function() return part.Name end)})[1] then
			continue
		end

		if sizecheck and math.max(part.Size.X, part.Size.Y, part.Size.Z) > 50 then
			continue
		end

		icesparkfreezepart(part, hitparts)
	end
end

local function icesparkprojectile(origpos, hitparts)
	local basecolor = stuff.xaltatk.chargetrail.Color
	local basetransparency = stuff.xaltatk.chargetrail.Transparency
	local black = ColorSequence.new(Color3.new())
	local opaque = NumberSequence.new(0)

	local endpos = mouse.Hit.Position
	local length = (endpos - origpos).Magnitude

	humanoid.Velocity = cn(endpos, origpos).LookVector * 10

	if length > 750 then
		endpos = origpos + (endpos - origpos).Unit*750
		length = 750
	end

	local a1 = newattachment(cn(origpos))
	local a2 = newattachment(cn(origpos))
	local soundattach = newattachment(cn(origpos))

	local firesound1 = Instance.new("Sound", soundattach)
	firesound1.SoundId = "rbxassetid://2018386608"
	firesound1.Volume = 2 * VOLUME
	firesound1.Pitch = 0.9 + random()*0.2
	firesound1.Playing = true
	firesound1.TimePosition = 0.1

	debris:AddItem(soundattach, 3)
	tweenservice:Create(firesound1, TweenInfo.new(1), {
		Pitch = 0.3,
		Volume = 0
	}):Play()

	local trail = stuff.xaltatk.chargetrail:Clone()
	trail.Parent = a1
	trail.Attachment0 = a1
	trail.Attachment1 = a2

	local beampart = anchorpart(Instance.new("Part", workspace))
	beampart.Transparency = 1

	local darkbeamflakes = stuff.xaltatk.darkbeamflakes:Clone()
	local purplebeamflakes = stuff.xaltatk.purplebeamflakes:Clone()
	darkbeamflakes.Parent = beampart
	purplebeamflakes.Parent = beampart

	local midpos = (cn(origpos, endpos) * cn(random(-10, 10), random(-10, 10), -length*0.1 - length*random()*0.8)).Position
	local currentpos = origpos
	local speed = 1.5 + random()*2

	local progress = 0
	local raycast
	local travelstart = getruntime()
	repeat
		progress = progress + runservice.Heartbeat:Wait()*speed
		local nextpos = (origpos:Lerp(midpos, progress)):Lerp(midpos:Lerp(endpos, progress), progress)

		local direction = cn(currentpos, nextpos)
		local dist = (nextpos - currentpos).Magnitude

		raycast = query:Raycast(currentpos, direction.LookVector*dist)
		local newpos = raycast and raycast.Position or nextpos

		if raycast then
			a1.CFrame = cn(raycast.Position + v3(0, 1, 0))
			a2.CFrame = cn(raycast.Position - v3(0, 1, 0))
		else
			local pos = cn(nextpos, nextpos + direction.LookVector)
			a1.CFrame = pos * cn(0, 1, 0)
			a2.CFrame = pos * cn(0, -1, 0)
		end

		local beamlength = (newpos - currentpos).Magnitude
		local emitamt = math.ceil(beamlength)
		beampart.CFrame = direction * cn(0, 0, -beamlength/2)
		beampart.Size = v3(2, 2, beamlength)

		darkbeamflakes:Emit(emitamt)
		purplebeamflakes:Emit(emitamt)

		currentpos = newpos

		if random(1, 5) == 1 then
			trail.Color = black
			trail.Transparency = opaque
			trail.LightEmission = 0
		else
			trail.Color = basecolor
			trail.Transparency = basetransparency
			trail.LightEmission = 1
		end
	until raycast or getruntime() - travelstart > 5

	if raycast then
		local effectpart = anchorpart(Instance.new("Part", workspace))
		local attach = Instance.new("Attachment", effectpart)
		effectpart.Transparency = 1
		effectpart.CFrame = cn(raycast.Position)
		effectpart.Size = v3(3, 3, 3)

		local firesound1 = Instance.new("Sound", effectpart)
		firesound1.SoundId = "rbxassetid://632919727"
		firesound1.Volume = 0.6 * VOLUME
		firesound1.Pitch = 0.8 + random()*0.4
		firesound1.Playing = true
		firesound1.TimePosition = 0.1
		debris:AddItem(firesound1, 2)

		emitparticles(stuff.xaltatk.darksplash:Clone(), effectpart, 15)
		emitparticles(stuff.xaltatk.purplesplash:Clone(), effectpart, 15)

		effectpart.Size = v3(5, 5, 5)
		emitparticles(stuff.zatk.dust:Clone(), effectpart, 200)
		emitparticles(stuff.zatk.idk:Clone(), effectpart, 5)

		debris:AddItem(effectpart, 4)

		local spinnypartrot = ca(random()*math.pi*2, random()*math.pi*2, random()*math.pi*2)
		local rotvelocity = v3(random(-15, 15), random(-15, 15), random(-15, 15))
		local spinnypart = anchorpart(Instance.new("Part", workspace))
		spinnypart.Material = Enum.Material.Neon
		spinnypart.Color = Color3.new()
		spinnypart.CFrame = cn(raycast.Position) * spinnypartrot
		spinnypart.Size = v3(9, 9, 9)

		task.spawn(loop, 1, function(delta)
			spinnypartrot = spinnypartrot * ca(rotvelocity.X*delta, rotvelocity.Y*delta, rotvelocity.Z*delta)
			spinnypart.CFrame = cn(raycast.Position) * spinnypartrot
		end)

		debris:AddItem(spinnypart, 1)
		tweenservice:Create(spinnypart, TweenInfo.new(1), {
			Transparency = 1,
			Size = v3(5, 5, 5)
		}):Play()

		icesparkattack(raycast.Position, hitparts)

		local progress = 0

		local height = random(40, 120)
		local pos1 = raycast.Position
		local pos2 = raycast.Position + v3(random(-30, 30), height, random(-30, 30))
		local midpos2 = raycast.Position + v3(random(-100, 100), height*0.1 + random()*height*0.8, random(-100, 100))
		local currentpos = pos1

		loop(1, function()
			progress = progress + runservice.Heartbeat:Wait()*speed
			local nextpos = pos1:Lerp(midpos2, progress):Lerp(midpos2:Lerp(pos2, progress), progress)

			local pos = cn(nextpos, nextpos + cn(currentpos, nextpos).LookVector)
			a1.CFrame = pos * cn(0, 1, 0)
			a2.CFrame = pos * cn(0, -1, 0)

			if random(1, 5) == 1 then
				trail.Color = black
				trail.Transparency = opaque
				trail.LightEmission = 0
			else
				trail.Color = basecolor
				trail.Transparency = basetransparency
				trail.LightEmission = 1
			end

			currentpos = nextpos
		end)
	end

	task.spawn(loop, 0.25, function()
		if random(1, 5) == 1 then
			trail.Color = black
			trail.Transparency = opaque
			trail.LightEmission = 0
		else
			trail.Color = basecolor
			trail.Transparency = basetransparency
			trail.LightEmission = 1
		end
	end)

	debris:AddItem(a1, 0.25)
	debris:AddItem(a2, 0.25)
	debris:AddItem(beampart, 0.4)
end

local function icespark()
	if scriptstate.IsAttacking then
		return
	end
	scriptstate.IsAttacking = true

	animator:SetPriorities({
		Head = 1, Torso = 1, LArm = 1, RArm = 1, LLeg = 1, RLeg = 1
	})

	local function getcirclepos()
		return cn(humanoid.Position.Position, mouse.Hit.Position) * cn(0, 0, -2)
	end

	local function getflakepos()
		return getcirclepos() * cn(0, 0, -1.15)
	end

	local circleattach = newattachment(getcirclepos())
	local flakeattach = newattachment(getflakepos())

	local scamparticles = {}
	local lastflash = {}

	local emithb = runservice.Heartbeat:Connect(function()
		for emitter, emittime in scamparticles do
			if not lastflash[emitter] then
				lastflash[emitter] = getruntime()
			end

			local lastflashtime = lastflash[emitter]
			local elapsed = getruntime() - lastflashtime

			if elapsed >= emittime then
				lastflash[emitter] = getruntime()
				emitter:Emit(math.round(elapsed/emittime))
			end
		end
	end)
	connections.add(emithb)

	local darkcircle = stuff.xaltatk.darkcircle:Clone()
	local purplecircle = stuff.xaltatk.purplecircle:Clone()
	local bluecircle = stuff.xaltatk.bluecircle:Clone()
	local darkflare = stuff.xaltatk.darkflare:Clone()
	local purpleflare = stuff.xaltatk.purpleflare:Clone()
	darkcircle.Parent = circleattach
	purplecircle.Parent = circleattach
	bluecircle.Parent = circleattach
	darkflare.Parent = circleattach
	purplecircle.Parent = circleattach

	scamparticles[darkcircle] = 1/5
	scamparticles[purplecircle] = 1/2
	scamparticles[bluecircle] = 2/3
	scamparticles[darkflare] = 1/30
	scamparticles[purpleflare] = 1/20

	local darkflake = stuff.xaltatk.darksnowflake:Clone()
	local purpleflake = stuff.xaltatk.purplesnowflake:Clone()
	local blueflake = stuff.xaltatk.bluesnowflake:Clone()
	purpleflake.Parent = flakeattach
	darkflake.Parent = flakeattach
	blueflake.Parent = flakeattach

	scamparticles[darkflake] = 1/2
	scamparticles[purpleflake] = 1/4
	scamparticles[blueflake] = 1/3

	-- do sfx later cus wifi is dying
	local chargeup = Instance.new("Sound", flakeattach)
	chargeup.SoundId = "rbxassetid://2018386608"
	chargeup.Pitch = 0.9
	chargeup.Volume = 3 * VOLUME
	chargeup.Playing = true

	local spellcard = Instance.new("Sound", circleattach)
	spellcard.SoundId = "rbxassetid://3723411843"
	spellcard.Pitch = 2
	spellcard.Volume = 0.75*VOLUME
	spellcard.Playing = true
	debris:AddItem(spellcard, 1)

	humanoid.WalkSpeed = 4

	local lasttrailspawntime = getruntime()
	loop(1, function(delta)
		circleattach.CFrame = getcirclepos()
		flakeattach.CFrame = getflakepos()

		animator:LerpTransforms({
			Head = ca(rad(-5), 0, 0),
			Torso = ca(rad(5), 0, 0),
			LArm = ca(rad(110.414), rad(-37.159), rad(16.013)),
			RArm = ca(rad(90), rad(-35), rad(-25)),
			LLeg = ca(rad(-10), 0, 0),
			RLeg = ca(rad(-5), 0, 0)
		}, delta*10, 1)

		if getruntime() - lasttrailspawntime > 0.1 then
			lasttrailspawntime = getruntime()

			for i = 1, random(3, 5) do
				local rot = ca(random()*math.pi*2, random()*math.pi*2, random()*math.pi*2)
				local dist = random(20, 30)
				local startpos = getcirclepos() * rot * cn(0, 0, dist)

				local a1 = newattachment(startpos * cn(-0.25, 0, 0))
				local a2 = newattachment(startpos * cn(0.25, 0, 0))
				local trail = stuff.xaltatk.chargetrail:Clone()
				trail.Parent = a1
				trail.Attachment0 = a1
				trail.Attachment1 = a2

				local spawnstart = getruntime()
				task.spawn(function()
					loop(0.2, function()
						local progress = (getruntime() - spawnstart)/0.2
						local pos = getcirclepos() * rot * cn(sin(10 - progress*10)*3, 0, dist - dist*progress)
						a1.CFrame = pos * cn(-0.25, 0, 0)
						a2.CFrame = pos * cn(0.25, 0, 0)
					end)
					debris:AddItem(a1, 0.25)
					debris:AddItem(a2, 0.25)
					debris:AddItem(trail, 0.25)
				end)
			end
		end

		pointtomouse(delta * 15)
	end)

	debris:AddItem(chargeup, 1)
	tweenservice:Create(chargeup, TweenInfo.new(1), {
		Pitch = 0.3,
		Volume = 0
	}):Play()

	for _ = 1, 5 do
		for i = 1, 2 do
			local startcf = getflakepos() * ca(random()*math.pi*2, random()*math.pi*2, random()*math.pi*2)
			local dist  = random(15, 30)
			local firea1 = newattachment(startcf * cn(0, 0.5, 0))
			local firea2 = newattachment(startcf * cn(0, -0.5, 0))

			local trailaaa = stuff.xaltatk.chargetrail:Clone()
			trailaaa.Parent = firea1
			trailaaa.Attachment0 = firea1
			trailaaa.Attachment1 = firea2

			if i == 1 then
				trailaaa.Color = ColorSequence.new(Color3.new())
				trailaaa.Transparency = NumberSequence.new(0)
				trailaaa.LightEmission = 0
			end

			tweenservice:Create(firea1, TweenInfo.new(1, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), { CFrame = startcf * cn(0, 0.5, dist) }):Play()
			tweenservice:Create(firea2, TweenInfo.new(1, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), { CFrame = startcf * cn(0, -0.5, dist) }):Play()
			debris:AddItem(firea1, 1.5)
			debris:AddItem(firea2, 1.5)
		end
	end

	local constantemitsound = Instance.new("Sound", flakeattach)
	constantemitsound.SoundId = "rbxassetid://9113122548"
	constantemitsound.Pitch = 0.2
	constantemitsound.Volume = 0
	constantemitsound.Playing = true
	constantemitsound.Looped = true

	local constantemitsound2 = Instance.new("Sound", flakeattach)
	constantemitsound2.SoundId = "rbxassetid://9125986205"
	constantemitsound2.Pitch = 0.1
	constantemitsound2.Volume = 0
	constantemitsound2.Playing = true
	constantemitsound2.Looped = true

	tweenservice:Create(constantemitsound, TweenInfo.new(0.4), {
		Pitch = 0.75,
		Volume = 0.5 * VOLUME
	}):Play()
	tweenservice:Create(constantemitsound2, TweenInfo.new(0.4), {
		Pitch = 0.3,
		Volume = 0.5 * VOLUME
	}):Play()

	local lastfiretime = 0
	local attackstarttime = getruntime()
	local hitparts = {}

	humanoid.WalkSpeed = 2

	animator:SetPriorities({
		WingCenter = 1, Wing1 = 1, Wing2 = 1, Wing3 = 1, Wing4 = 1, Wing5 = 1, Wing6 = 1
	})

	repeat
		local delta = runservice.Heartbeat:Wait()

		animator:LerpTransforms({
			Head = ca(rad(-15), 0, 0),
			Torso = ca(rad(15), 0, 0),
			LArm = ca(rad(18.859), rad(-18.747), rad(-36.005)),
			RArm = ca(rad(81.31), rad(-42.363), rad(49.552)),
			LLeg = ca(rad(-30), 0, 0),
			RLeg = ca(rad(-20), 0, 0)
		}, delta*15, 1)

		local deg = getruntime()*360
		local wingspin = ca(0, 0, rad(-deg)) * ca(rad(-30), 0, 0)
		animator:LerpTransforms({
			WingCenter = ca(rad(deg), rad(deg), rad(deg)),
			Wing1 = wingspin,
			Wing2 = wingspin,
			Wing3 = wingspin,
			Wing4 = wingspin,
			Wing5 = wingspin,
			Wing6 = wingspin,
		}, delta*20, 1)

		pointtomouse(delta * 15)

		circleattach.CFrame = getcirclepos()
		flakeattach.CFrame = getflakepos()

		if getruntime() - lastfiretime > 0.15 then
			lastfiretime = getruntime()
			local flakepos = getflakepos().Position
			for i = 1, 2 do
				task.spawn(icesparkprojectile, flakepos, hitparts)
			end
		end
	until not keysdown[Enum.KeyCode.X] and getruntime() - attackstarttime > 0.2

	tweenservice:Create(constantemitsound, TweenInfo.new(0.75), {
		Pitch = 0.2,
		Volume = 0
	}):Play()
	tweenservice:Create(constantemitsound2, TweenInfo.new(0.75), {
		Pitch = 0.1,
		Volume = 0
	}):Play()

	connections.disconnect(emithb)
	debris:AddItem(circleattach, 2)
	debris:AddItem(flakeattach, 3)

	animator:SetPriorities({
		Head = 0, Torso = 0, LArm = 0, RArm = 0, LLeg = 0, RLeg = 0,
		WingCenter = 0, Wing1 = 0, Wing2 = 0, Wing3 = 0, Wing4 = 0, Wing5 = 0, Wing6 = 0
	})

	humanoid.WalkSpeed = 8
	scriptstate.IsAttacking = false
end

local function sustainflicker(increaserate, max)
	local hb = runservice.Heartbeat:Connect(function(delta)
		humanoid.FlickerRate = math.max(humanoid.FlickerRate + increaserate*delta, max)
	end)
	connections.add(hb)
	return {
		Stop = function()
			connections.disconnect(hb)
		end
	}
end

local function snowflakebouncekill(part)
	if not ({pcall(function() return part.Name[1] end)}) then
		return
	end

	if not isa(part, "BasePart") then
		return
	end

	if sizecheck and math.max(part.Size.X, part.Size.Y, part.Size.Z) >= 100 then
		return
	end

	pcall(game.Destroy, part)
end

local function snowflakebouncebeam(snowflake, startpos, endpos)
	snowflake.Active = false
	snowflake.Part.Transparency = 1
	snowflake.Trail.Enabled = false
	snowflake.ParticleEmitter.Enabled = false
	debris:AddItem(snowflake.Part, 2)

	local length = (endpos - startpos).Magnitude
	local center = cn(startpos, endpos) * cn(0, 0, -length/2)
	local part = anchorpart(Instance.new("Part", workspace))
	part.Material = Enum.Material.Neon
	part.Color = random(1, 3) == 1 and Color3.fromRGB(110, 74, 255) or Color3.new()
	part.CFrame = center
	part.Size = v3(1, 1, length)

	--tweenservice:Create(part, TweenInfo.new(0.2), { Transparency = 1, Size = v3(0.1, 0.1, length) }):Play()
	debris:AddItem(part, 1)

	for _, part in query:GetPartBoundsInBox(center, v3(10, 10, length)) do
		snowflakebouncekill(part)
	end
end

local function oldaltz_snowflakebounce()
	if scriptstate.IsAttacking then
		return
	end
	scriptstate.IsAttacking = true
	animator:SetPriorities({
		Head = 1, Torso = 1, LArm = 1, RArm = 1, LLeg = 1, RLeg = 1
	})

	local OPAQUE = NumberSequence.new(0)
	local TRANSPARENT = NumberSequence.new(0.5)

	-- using a big main loop for the 20 projectiles unlike what i did for icespark
	-- some lag from icespark may be from the amount of threads running
	-- so im gonna mitigate that here
	local routes = { {}, {} }
	local throwsactive = false
	local mainloop
	mainloop = runservice.Heartbeat:Connect(function(delta)
		if not throwsactive then
			return
		end

		local currenttime = getruntime()
		local numactive = 0

		for i, snowflakes in routes do
			for _, snowflake in snowflakes do
				if not snowflake.Active then
					continue
				end

				-- using table.find() in these two if statements cus im scared that
				-- removal of other snowflakes will shift this one and make it not
				-- match the index of the loop
				-- this will usually always be cut short by the beam attack but
				-- JUST IN CASE it gets timed out itll stop them
				if currenttime - snowflake.TravelStartTime >= 5 then
					snowflake.Active = false
					pcall(game.Destroy, snowflake.Part)
					table.remove(routes[i], table.find(routes[i], snowflake))
					continue
				end

				local nextpos = snowflake.CFrame + snowflake.Velocity*delta
				local raycast = query:Raycast(snowflake.CFrame.Position, nextpos.Position)

				--if raycast then
				--	snowflake.Active = false
				--	snowflake.Part.CFrame = cn(raycast.Position)
				--	snowflake.Part.Transparency = 1
				--	snowflake.Trail.Enabled = false
				--	snowflake.ParticleEmitter.Enabled = false
				--	debris:AddItem(snowflake.Part, 2)
				--	table.remove(routes[i], table.find(routes[i], snowflake))

				--	for _, part in query:GetPartBoundsInRadius(raycast.Position, 3) do
				--		snowflakebouncekill(part)
				--	end
				--	continue
				--end

				snowflake.Trail.Transparency = random(1, 3) == 3 and TRANSPARENT or OPAQUE
				snowflake.CFrame = nextpos * ca(snowflake.RotVelocity.X*delta, snowflake.RotVelocity.Y*delta, snowflake.RotVelocity.Z*delta)
				snowflake.Velocity -= v3(0, GRAVITY*delta, 0)
				snowflake.Part.CFrame = snowflake.CFrame
				numactive += 1
			end
		end

		if numactive == 0 then
			connections.disconnect(mainloop)
		end
	end)
	connections.add(mainloop)

	-- waits to simulate animating while i work on the attack logic

	local function getthrowpos()
		return humanoid.Position.Position + humanoid.Position.LookVector * 2
	end

	local pointconnection = runservice.Heartbeat:Connect(function(delta)
		--pointtomouse(delta*10)
	end)
	connections.add(pointconnection)

	local aimstarttime = getruntime()
	repeat
		local delta = task.wait()
		loop(0.1, function(delta)
			animator:LerpTransforms({
				Head = ca(rad(5), rad(20), 0),
				Torso = ca(rad(-5.514), rad(-24.898), rad(-2.327)),
				LArm = ca(rad(20), 0, 0),
				RArm = ca(rad(-20), 0, 0),
				LLeg = CN0,
				RLeg = CN0,
			}, delta*10, 1)
		end)
	until getruntime() - aimstarttime >= 0.2 and not keysdown[Enum.KeyCode.Z]

	for i = 1, 2 do
		loop(0.1, function(delta)
			animator:LerpTransforms({
				Head = ca(rad(5), rad(20), 0),
				Torso = ca(rad(-5.514), rad(-24.898), rad(-2.327)),
				LArm = ca(rad(20), 0, 0),
				RArm = ca(rad(-20), 0, 0),
				LLeg = CN0,
				RLeg = CN0,
			}, delta*25, 1)
		end)

		local throwpos = cn(getthrowpos())
		local throwdirection = cn(humanoid.Position.Position, mouse.Hit.Position)
		local travelstarttime = getruntime()
		for v = 1, 10 do
			local snowflake = anchorpart(stuff.zaltatk.snowflake:Clone())
			local cf = throwpos * ca(random()*math.pi*2, random()*math.pi*2, random()*math.pi*2)

			local obj = {
				Active = true,
				Part = snowflake,
				Trail = snowflake.Attachment0.Trail,
				ParticleEmitter = snowflake.ParticleEmitter,

				TravelStartTime = travelstarttime,
				CFrame = cf,
				Velocity = (throwdirection * ca(rad(random(-10, 10)), rad(random(-10, 10)), rad(random(-10, 10)))).LookVector * 40 * (5 + v/2),
				RotVelocity = v3(random(-20, 20), random(-20, 20), random(-20, 20))
			}

			snowflake.CFrame = cf
			snowflake.Parent = workspace

			table.insert(routes[i], obj)
		end
		throwsactive = true

		loop(0.1, function(delta)
			animator:LerpTransforms({
				Head = ca(rad(5), rad(-25), 0),
				Torso = ca(0, rad(25), 0),
				LArm = ca(rad(-20), 0, 0),
				RArm = ca(rad(107.118), rad(4.53), rad(64.917)),
				LLeg = CN0,
				RLeg = CN0,
			}, delta*25, 1)
		end)
	end

	-- create spell circle
	task.wait(0.2)
	-- fire

	local route1idx = 1
	local route1pos = getthrowpos()
	local route2idx = 1
	local route2pos = getthrowpos()
	task.spawn(function()
		local lastfiretime = 0
		repeat
			local currenttime = getruntime()
			if currenttime - lastfiretime >= 0.05 then
				lastfiretime = getruntime()
				route1idx += 1
				route2idx += 1

				local flake1 = routes[1][route1idx]
				local flake2 = routes[2][route1idx]
				if flake1 then
					local nextpos = flake1.CFrame.Position
					snowflakebouncebeam(flake1, route1pos, nextpos)
					route1pos = nextpos
				end
				if flake2 then
					local nextpos = flake2.CFrame.Position
					snowflakebouncebeam(flake2, route1pos, nextpos)
					route1pos = nextpos
				end
			end
			task.wait()
		until route1idx >= #routes[1] and route2idx >= #routes[2]
	end)

	-- fire anim
	task.wait(0.5)

	connections.disconnect(pointconnection)

	animator:SetPriorities({
		Head = 0, Torso = 0, LArm = 0, RArm = 0, LLeg = 0, RLeg = 0
	})
	scriptstate.IsAttacking = false
end

local function dieballshatterarea(position)
	local emissionpart = anchorpart(Instance.new("Part", workspace))
	emissionpart.Transparency = 1
	emissionpart.Size = v3(5, 2, 5)
	emissionpart.CFrame = cn(position + v3(0, 3, 0))

	emitparticles(stuff.zaltatk2.aoe.Mist:Clone(), emissionpart, 100)
	debris:AddItem(emissionpart, 2)

	local circlepos = cn(position + v3(0, 0.15, 0))
	local ring = anchorpart(stuff.zaltatk2.aoe.Ring:Clone())
	local runes = anchorpart(stuff.zaltatk2.aoe.Runes:Clone())
	ring.Size = v3(3, 0.05, 3)
	ring.CFrame = circlepos
	runes.Size = v3(2.7, 0.05, 2.7)
	runes.CFrame = circlepos

	ring.Parent = workspace
	runes.Parent = workspace

	tweenservice:Create(ring, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
		Size = v3(33.7, 0.05, 33.7)
	}):Play()
	tweenservice:Create(runes, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
		Size = v3(31.3, 0.05, 31.3)
	}):Play()

	local chargeupattach = newattachment(circlepos)

	local chargesound1 = Instance.new("Sound", chargeupattach)
	chargesound1.SoundId = "rbxassetid://7157159286"
	chargesound1.Volume = 3*VOLUME
	chargesound1.Pitch = 0.6
	chargesound1.Playing = true

	local smallbottomplate = anchorpart(Instance.new("Part", workspace))
	smallbottomplate.Transparency = 1
	smallbottomplate.Size = v3(30, 0.1, 30)
	smallbottomplate.CFrame = cn(position + v3(0, 0.1, 0))

	local lines = stuff.zaltatk2.aoe.Lines:Clone()
	lines.Parent = smallbottomplate

	local spinspeed = -360
	local spinhb = runservice.Heartbeat:Connect(function(delta)
		circlepos *= ca(0, rad(spinspeed*delta), 0)
		ring.CFrame = circlepos * cn(random(-100, 100)/100*spinspeed/180, random(-100, 100)/100*spinspeed/180, random(-100, 100)/100*spinspeed/180)
		runes.CFrame = circlepos * cn(random(-100, 100)/100*spinspeed/180, random(-100, 100)/100*spinspeed/180, random(-100, 100)/100*spinspeed/180)

		local emitamt = math.round(spinspeed/50)
		if emitamt > 0 then
			lines:Emit(emitamt)
		end

		spinspeed += 240*delta
	end)
	connections.add(spinhb)

	task.wait(0.25)

	local lastdamagetime = getruntime()
	local damage = runservice.Heartbeat:Connect(function()
		local currenttime = getruntime()
		if 0.2 > currenttime - lastdamagetime then
			return
		end
		lastdamagetime = currenttime

		local hithums = {}
		for _, part in query:GetPartBoundsInRadius(position + v3(0, 4, 0), 25) do
			-- anti ppe
			if not ({pcall(function() return part.Name end)})[1] then
				continue
			end

			if not part.Parent or not isa(part.Parent, "Model") or part.Parent == workspace then
				continue
			end

			local hum = part.Parent:FindFirstChildOfClass("Humanoid")
			if hum and not table.find(hithums, hum) then
				table.insert(hithums, hum)
				hum.WalkSpeed /= 2
				hum:TakeDamage(5)
			end
		end
	end)
	connections.add(damage)

	local bottomplate = anchorpart(Instance.new("Part", workspace))
	bottomplate.Transparency = 1
	bottomplate.Size = v3(50, 0.1, 50)
	bottomplate.CFrame = cn(position + v3(0, 0.1, 0))

	local snowpart = anchorpart(Instance.new("Part", workspace))
	snowpart.Transparency = 1
	snowpart.Size = v3(50, 15, 50)
	snowpart.CFrame = cn(position + v3(0, 14, 0))

	local flashingrunesattach = newattachment(cn(position + v3(0, 0.05, 0)))
	local swirlattach = newattachment(cn(position + v3(0, 0.2, 0)))

	local wind = Instance.new("Sound", bottomplate)
	wind.SoundId = "rbxassetid://3858704187"
	wind.Pitch = 0.25
	wind.Volume = 0
	wind.Playing = true
	wind.Looped = true

	tweenservice:Create(wind, TweenInfo.new(0.75), {
		Volume = 3*VOLUME
	}):Play()

	local flashingrunes = stuff.zaltatk2.aoe.FlashingRunes:Clone()
	flashingrunes.Parent = flashingrunesattach

	local swirl = stuff.zaltatk2.aoe.Swirl:Clone()
	swirl.Parent = swirlattach

	local brightflakes = stuff.zaltatk2.aoe.BrightFlakes:Clone()
	local darkflakes = stuff.zaltatk2.aoe.DarkFlakes:Clone()
	local snow = stuff.zaltatk2.aoe.Snow:Clone()
	brightflakes.Parent = bottomplate
	darkflakes.Parent = bottomplate
	snow.Parent = snowpart

	brightflakes:Emit(20)
	darkflakes:Emit(10)
	snow:Emit(100)
	swirl:Emit(10)

	task.wait(1.5)

	tweenservice:Create(ring, TweenInfo.new(1.5), {
		Color = Color3.fromRGB(156, 117, 255)
	}):Play()
	tweenservice:Create(runes, TweenInfo.new(1.5), {
		Color = Color3.fromRGB(156, 117, 255)
	}):Play()

	task.wait(1.5)

	tweenservice:Create(chargesound1, TweenInfo.new(1), {
		Volume = 0,
		Pitch = 0.3*VOLUME
	}):Play()
	debris:AddItem(chargeupattach, 1)

	flashingrunes.Enabled = false
	brightflakes.Enabled = false
	darkflakes.Enabled = false
	--lines.Enabled = false
	snow.Enabled = false
	swirl.Enabled = false

	debris:AddItem(smallbottomplate, 0.5)
	debris:AddItem(bottomplate, 1)
	debris:AddItem(snowpart, 2)
	debris:AddItem(flashingrunesattach, 0.1)
	debris:AddItem(swirlattach, 1)

	tweenservice:Create(wind, TweenInfo.new(2), {
		Volume = 0,
		Pitch = 0.1
	}):Play()

	local flashoverpart = anchorpart(Instance.new("Part", workspace))
	flashoverpart.Transparency = 1
	flashoverpart.Size = v3(50, 20, 50)
	flashoverpart.CFrame = cn(position + v3(0, 9, 0))

	emitparticles(stuff.zaltatk2.aoe.FlashoverMist:Clone(), flashoverpart, 100)
	emitparticles(stuff.zaltatk2.aoe.DarkFlashoverFlakes:Clone(), flashoverpart, 25)
	emitparticles(stuff.zaltatk2.aoe.BrightFlashoverFlakes:Clone(), flashoverpart, 12)
	debris:AddItem(flashoverpart, 2)

	local attackattach = newattachment(cn(position + v3(0, 9, 0)))
	for i = 1, 3 do
		local attacksound1 = Instance.new("Sound", attackattach)
		attacksound1.SoundId = "rbxassetid://245520987"
		attacksound1.Pitch = 0.5 + random()*0.4
		attacksound1.Volume = 1*VOLUME
		attacksound1.TimePosition = 0.3
		attacksound1.Playing = true
		attacksound1.PlayOnRemove = true
	end

	local attacksound2 = Instance.new("Sound", attackattach)
	attacksound2.SoundId = "rbxassetid://4909206080"
	attacksound2.Pitch = 0.75 + random()*0.15
	attacksound2.Volume = 3*VOLUME
	attacksound2.TimePosition = 0.3
	attacksound2.Playing = true
	attacksound2.PlayOnRemove = true

	attackattach:Destroy()

	connections.disconnect(spinhb)
	connections.disconnect(damage)

	pcall(game.Destroy, ring)
	pcall(game.Destroy, runes)

	-- this is not used but the ice spark attack does use a table
	-- so to not keep making new tables for every part we use one
	-- table for all parts
	local hitpartstable = {}
	for _, part in query:GetPartBoundsInRadius(position + v3(0, 4, 0), 25) do
		-- anti ppe
		if not ({pcall(function() return part.Name end)})[1] then
			continue
		end

		if sizecheck and math.max(part.Size.X, part.Size.Y, part.Size.Z) > 50 then
			continue
		end

		icesparkfreezepart(part, hitpartstable)
	end
end

local function dieballbutitshattersanditsice()
	if scriptstate.IsAttacking then
		return
	end
	scriptstate.IsAttacking = true

	humanoid.WalkSpeed = 4

	local initcf = animator.Torso:GetWorldPosition() * cn(0, 0, 8)
	local attachment = newattachment(initcf)
	local ball = anchorpart(Instance.new("Part", workspace))
	ball.Transparency = 1
	ball.Shape = Enum.PartType.Ball
	ball.CFrame = initcf
	ball.Size = v3(12, 12, 12)

	local darkring = stuff.zaltatk2.darkring:Clone()
	local lightring = stuff.zaltatk2.lightring:Clone()
	local energyring = stuff.zaltatk2.ring2:Clone()
	local smallenergyring = stuff.zaltatk2.ring3:Clone()
	local orbbg = stuff.zaltatk2.bgblue:Clone()
	local orbflakecircle = stuff.zaltatk2.circle:Clone()
	local bigflakes = stuff.zaltatk2.bigflakes:Clone()
	local surfaceflakes = stuff.zaltatk2.surfaceflakes:Clone()
	darkring.Parent = attachment
	lightring.Parent = attachment
	energyring.Parent = attachment
	smallenergyring.Parent = attachment
	orbbg.Parent = attachment
	orbflakecircle.Parent = attachment
	bigflakes.Parent = ball
	surfaceflakes.Parent = ball

	local appear1 = Instance.new("Sound", attachment)
	appear1.SoundId = "rbxassetid://5964884135"
	appear1.Pitch = 1.5
	appear1.Volume = 1*VOLUME
	appear1.Playing = true
	appear1.PlayOnRemove = true
	appear1:Destroy()

	local sound = Instance.new("Sound", attachment)
	sound.SoundId = "rbxassetid://9064807398"
	sound.Volume = 2.5*VOLUME
	sound.Playing = true
	sound.Looped = true

	-- copy pasted code from regular z lol
	animator:SetPriorities({
		Head = 1, Torso = 1, LArm = 1, RArm = 1, LLeg = 1, RLeg = 1,
		WingCenter = 1,
		Wing1 = 1, Wing2 = 1, Wing3 = 1, Wing4 = 1, Wing5 = 1, Wing6 = 1,
	})

	loop(0.4, function(delta)
		local runtime = getruntime()
		local wingspin = ca(0, 0, rad(runtime*720)) * ca(rad(-35), 0, 0)

		animator:LerpTransforms({
			Head = ca(rad(-11.94), rad(-59.042), rad(-13.836)),
			Torso = ca(0, rad(59.951), rad(6.424)),
			LArm = ca(rad(65.4), rad(-35.989), rad(-4.431)),
			RArm = ca(rad(-13.651), rad(-6.28), rad(24.246)),
			LLeg = CN0,
			RLeg = CN0,

			WingCenter = ca(rad(runtime*360), rad(runtime*360), rad(runtime*360)),
			Wing1 = wingspin,
			Wing2 = wingspin,
			Wing3 = wingspin,
			Wing4 = wingspin,
			Wing5 = wingspin,
			Wing6 = wingspin,
		}, delta*10, 1)

		local cf = animator.Torso:GetWorldPosition() * cn(0, 0, 8)
		attachment.CFrame = cn(cf.Position)
		ball.CFrame = cf
	end)

	local holdstart = getruntime()
	repeat
		local delta = runservice.Heartbeat:Wait()
		local runtime = getruntime()
		local wingspin = ca(0, 0, rad(runtime*720)) * ca(rad(-35), 0, 0)

		animator:LerpTransforms({
			Head = ca(rad(-3.821), rad(10.292), rad(-1.278)),
			Torso = ca(rad(4.394), rad(-9.877), rad(3.26)),
			LArm = ca(rad(143.862), rad(-21.024), rad(14.944)),
			RArm = ca(rad(-34.232), rad(-21.401), rad(34.228)),
			LLeg = CN0,
			RLeg = CN0,

			WingCenter = ca(rad(runtime*360), rad(runtime*360), rad(runtime*360)),
			Wing1 = wingspin,
			Wing2 = wingspin,
			Wing3 = wingspin,
			Wing4 = wingspin,
			Wing5 = wingspin,
			Wing6 = wingspin,
		}, delta*10, 1)

		local cf = animator.Torso:GetWorldPosition() * cn(0, 0, 8)
		attachment.CFrame = cn(cf.Position)
		ball.CFrame = cf

		pointtomouse(delta*20)
	until not keysdown[Enum.KeyCode.Z] and getruntime() - holdstart >= 0.2

	local spinstarttime = getruntime()
	task.spawn(function()
		for i = 1, 2 do
			task.wait(0.1)

			local soundattach = newattachment(humanoid.Position)
			local throwsound = Instance.new("Sound", soundattach)
			throwsound.SoundId = "rbxassetid://608600954"
			throwsound.Pitch = 0.9 + random()*0.2
			throwsound.Volume = 2*VOLUME
			throwsound.Playing = true
			throwsound.PlayOnRemove = true
			soundattach:Destroy()
		end
	end)

	loop(0.2, function(delta)
		local runtime = getruntime()
		local wingspin = ca(0, 0, rad(runtime*720)) * ca(rad(-35), 0, 0)

		local spinprogress = math.min((runtime - spinstarttime)/0.2, 1)

		animator:LerpTransforms({
			Head = ca(rad(-28.706), rad(-62.42), rad(-22.687)),
			--Torso = ca(rad(179.102), rad(-9.877 + spinprogress*360), rad(-171.742)),
			LArm = ca(rad(25.217), rad(-3.815), rad(-25.33)),
			RArm = ca(rad(-17.574), rad(-9.425), rad(38.709)),
			LLeg = CN0,
			RLeg = CN0,

			WingCenter = ca(rad(runtime*360), rad(runtime*360), rad(runtime*360)),
			Wing1 = wingspin,
			Wing2 = wingspin,
			Wing3 = wingspin,
			Wing4 = wingspin,
			Wing5 = wingspin,
			Wing6 = wingspin,
		}, delta*15, 1)
		animator:LerpTransforms({
			Torso = ca(rad(179.102), rad(-9.877 - spinprogress*380), rad(-171.742)),
		}, delta*50, 1)

		local cf = animator.Torso:GetWorldPosition() * cn(0, 0, 8)
		attachment.CFrame = cn(cf.Position)
		ball.CFrame = cf

		pointtomouse(delta*20)
	end)

	darkring.Enabled = false
	lightring.Enabled = false
	energyring.Enabled = false
	smallenergyring.Enabled = false
	orbbg.Enabled = false
	orbflakecircle.Enabled = false
	bigflakes.Enabled = false
	surfaceflakes.Enabled = false
	debris:AddItem(attachment, 0.4)
	debris:AddItem(ball, 1)
	sound:Destroy()

	local currentpos = animator.Torso:GetWorldPosition() * cn(0, 0, 8)
	local hitattachmentomg = newattachment(currentpos)
	emitparticles(stuff.zatk.idk:Clone(), hitattachmentomg, 20)
	debris:AddItem(hitattachmentomg, 1)

	local hitsound = Instance.new("Sound", hitattachmentomg)
	hitsound.SoundId = "rbxassetid://3929458922"
	hitsound.Volume = 3*VOLUME
	hitsound.Playing = true
	hitsound.PlayOnRemove = true
	hitsound.TimePosition = 1.1
	hitsound:Destroy()

	local hitsound2 = Instance.new("Sound", hitattachmentomg)
	hitsound2.SoundId = "rbxassetid://632831227"
	hitsound2.Volume = 0.5*VOLUME
	hitsound2.Playing = true
	hitsound2.PlayOnRemove = true
	hitsound.TimePosition = 0.4
	hitsound2:Destroy()

	local hitsound3 = Instance.new("Sound", hitattachmentomg)
	hitsound3.SoundId = "rbxassetid://260496290"
	hitsound3.Volume = 1.5*VOLUME
	hitsound3.Playing = true
	hitsound3.PlayOnRemove = true
	hitsound3:Destroy()

	task.spawn(dieballshatterarea, currentpos.Position)

	animator:SetPriorities({
		Head = 0, Torso = 0, LArm = 0, RArm = 0, LLeg = 0, RLeg = 0,
		WingCenter = 0,
		Wing1 = 0, Wing2 = 0, Wing3 = 0, Wing4 = 0, Wing5 = 0, Wing6 = 0,
	})

	humanoid.WalkSpeed = 8
	scriptstate.IsAttacking = false
end

local function attackz()
	if humanoid.FlickerRate > 50 then
		local flicker = sustainflicker(50, 50)
		if keysdown[Enum.KeyCode.LeftControl] then
			oldaltz_snowflakebounce()
		else
			dieballbutitshattersanditsice()
		end
		flicker:Stop()
	else
		thedieball()
	end
end

local function attackx()
	if humanoid.FlickerRate > 50 then
		local flicker = sustainflicker(50, 50)
		icespark()
		flicker:Stop()
	else
		masterspark()
	end
end

local function standarddamage(position, radius, dmg)
	local hithums = {}

	for _, part in query:GetPartBoundsInRadius(position, radius) do
		if not isa(part, "BasePart") then
			continue
		end

		local hum = part.Parent and isa(part.Parent, "Model") and part.Parent ~= workspace and part.Parent:FindFirstChildOfClass("Humanoid")
		if hum and not table.find(hithums, hum) then
			table.insert(hithums, hum)
			hum:TakeDamage(dmg)
		end
	end

	return #hithums
end

local standardatkphase = 1
local standardattacks = {
	function()
		humanoid.Velocity = humanoid.Velocity + humanoid.Position.LookVector * 20

		standarddamage((humanoid.Position * cn(0, 0, -1)).Position, 2, 15)

		loop(0.2, function(delta)
			animator:LerpTransforms({
				Head = ca(rad(-14.511), rad(-43.079), rad(-20.754)),
				Torso = ca(0, rad(45), rad(15)),
				LArm = ca(rad(46.33), rad(-35.631), rad(-0.475)),
				RArm = ca(rad(95), 0, rad(-20)),
				LLeg = ca(0, 0, rad(-15)),
				RLeg = ca(rad(14.511), rad(43.08), rad(69.246))
			}, delta*30, 1)
		end)
	end,
	function()
		humanoid.Velocity = humanoid.Velocity - humanoid.Position.LookVector * 20

		standarddamage((humanoid.Position * cn(0, 0, -1.5)).Position, 1.2, 30)

		local kickstart = getruntime()
		loop(0.2, function(delta)
			local progress = (getruntime() - kickstart)/0.2

			animator:LerpTransforms({
				Head = ca(rad(35), 0, 0),
				--Torso = ca(0, rad(45), rad(15)),
				LArm = ca(0, 0, rad(-30)),
				RArm = ca(0, 0, rad(25)),
				LLeg = ca(rad(-10), 0, 0),
				RLeg = ca(rad(50), 0, 0)
			}, delta*20, 1)
			animator:LerpTransforms({
				Torso = ca(rad(360*progress*0.8), 0, 0),
			}, delta*30, 1)
		end)
	end,
	function()
		humanoid.Velocity = humanoid.Velocity + humanoid.MoveDirection * 10

		standarddamage(humanoid.Position.Position, 3, 20)

		local kickstart = getruntime()
		loop(0.2, function(delta)
			local progress = (getruntime() - kickstart)/0.2

			animator:LerpTransforms({
				Head = ca(rad(-5.319), rad(-19.921), rad(-1.817)),
				--Torso = ca(0, rad(45), rad(15)),
				LArm = ca(rad(-22.91), rad(10.289), rad(-22.91)),
				RArm = ca(rad(27.621), rad(12.199), rad(21.99)),
				LLeg = ca(rad(-4.924), rad(0.867), rad(-9.963)),
				RLeg = ca(rad(30), 0, rad(40))
			}, delta*20, 1)
			animator:LerpTransforms({
				Torso = ca(0, rad(-360*progress*0.8), rad(10)),
			}, delta*30, 1)
		end)
	end,
	function()
		loop(0.1, function(delta)
			animator:LerpTransforms({
				Head = ca(rad(2.424), rad(-0.078), rad(6.643)),
				Torso = CN0,
				LArm = ca(rad(28.481), rad(-9.847), rad(-17.495)),
				RArm = ca(rad(-9.772), rad(-11.435), rad(49.019)),
				LLeg = CN0,
				RLeg = CN0
			}, delta*20, 1)
		end)

		local wingnum
		local handpos = (animator.RArm:GetWorldPosition() * cn(0, -0.5, 0)).Position
		local smallestdist = math.huge

		for i = 1, 6 do
			local dist = (animator[`Wing{i}`]:GetWorldPosition().Position - handpos).Magnitude
			if smallestdist > dist then
				smallestdist = dist
				wingnum = i
			end
		end

		local part = character[`Wing{wingnum}`][1].Part
		part.Parent = pps

		local wing = anchorpart(stuff.wing:Clone())
		local offset = cn(0, -2.4, -0) * ca(0, rad(90), 0)
		wing.CFrame = animator.RArm:GetWorldPosition() * offset
		wing.Parent = workspace

		local hitpos1 = (humanoid.Position * cn(0, 0, -2.1)).Position
		local soundattach = newattachment(cn(hitpos1))

		local slicepitch = 0.9 + random()*0.2
		local swishpitch = 0.9 + random()*0.2

		local slicesound = Instance.new("Sound", soundattach)
		slicesound.SoundId = "rbxassetid://566593606"
		slicesound.Pitch = slicepitch*(0.95 + random()*0.1)
		slicesound.Volume = 0.5*VOLUME

		local slicesound2 = Instance.new("Sound", soundattach)
		slicesound2.SoundId = "rbxassetid://566593606"
		slicesound2.Pitch = slicepitch*(0.95 + random()*0.1)
		slicesound2.Volume = 0.5*VOLUME

		local swishsound = Instance.new("Sound", soundattach)
		swishsound.SoundId = "rbxassetid://6241709963"
		swishsound.Pitch = swishpitch*(0.95 + random()*0.1)
		swishsound.Volume = 0.5*VOLUME

		local swishsound2 = Instance.new("Sound", soundattach)
		swishsound2.SoundId = "rbxassetid://6241709963"
		swishsound2.Pitch = swishpitch*(0.95 + random()*0.1)
		swishsound2.Volume = 0.5*VOLUME

		slicesound.TimePosition = 0.1
		slicesound2.TimePosition = 0.1
		swishsound.TimePosition = 0.05
		swishsound2.TimePosition = 0.05

		swishsound:Play()
		if standarddamage(hitpos1, 2.2, 30) > 0 then
			slicesound:Play()
		end

		loop(0.2, function(delta)
			animator:LerpTransforms({
				Head = ca(rad(5.748), rad(-29.894), rad(2.435)),
				Torso = ca(0, rad(25), 0),
				LArm = ca(rad(-9.408), rad(3.405), rad(-19.72)),
				RArm = ca(rad(159.639), rad(22.521), rad(-45.904)),
				LLeg = CN0,
				RLeg = CN0
			}, delta*20, 1)
			wing.CFrame = animator.RArm:GetWorldPosition() * offset
		end)

		local hitpos2 = (humanoid.Position * cn(0, 0, -2.1)).Position
		soundattach.CFrame = cn(hitpos2)

		swishsound2:Play()
		if standarddamage(hitpos2, 2.2, 30) > 0 then
			slicesound2:Play()
		end

		loop(0.1, function(delta)
			animator:LerpTransforms({
				Head = ca(rad(3.762), rad(20.069), rad(2.247)),
				Torso = ca(0, rad(-20), 0),
				LArm = ca(rad(131.763), rad(-15.189), rad(-6.832)),
				RArm = ca(rad(-6.486), rad(-7.644), rad(49.567)),
				LLeg = CN0,
				RLeg = CN0
			}, delta*20, 1)
			wing.CFrame = animator.RArm:GetWorldPosition() * offset
		end)

		wing.Transparency = 1
		debris:AddItem(wing, 0.5)

		part.Parent = workspace
		debris:AddItem(soundattach, 1)
	end,
}

local function standardatk()
	if scriptstate.IsAttacking then
		return
	end
	scriptstate.IsAttacking = true
	humanoid.WalkSpeed = 11

	animator:SetPriorities({
		Head = 1, Torso = 1, LArm = 1, RArm = 1, LLeg = 1, RLeg = 1,
	})

	standardattacks[standardatkphase]()

	animator:SetPriorities({
		Head = 0, Torso = 0, LArm = 0, RArm = 0, LLeg = 0, RLeg = 0,
	})

	standardatkphase = standardatkphase + 1
	if standardatkphase > #standardattacks then
		standardatkphase = 1
	end

	humanoid.WalkSpeed = 8
	scriptstate.IsAttacking = false
end

local function grabattacknoway()
	if scriptstate.IsAttacking then
		return
	end
	scriptstate.IsAttacking = true

	animator:SetPriorities({
		Head = 1, Torso = 1, LArm = 1, RArm = 1, LLeg = 1, RLeg = 1
	})

	humanoid.WalkSpeed = 4

	local function gethandposomg()
		return (animator.RArm:GetWorldPosition() * cn(0, -1.2, 0)).Position
	end

	local kunai = anchorpart(stuff.vatk.kunai:Clone())
	local evilerattachment = newattachment(cn(gethandposomg()))
	local kunaiattach = Instance.new("Attachment", kunai)
	kunaiattach.CFrame = cn(0, 1.15, 0)

	local holdflare = stuff.vatk.kunaiflare:Clone()
	local holdring = stuff.vatk.kunairing:Clone()
	local kunaibeam = stuff.vatk.kunaibeam:Clone()

	holdflare.Parent = evilerattachment
	holdring.Parent = evilerattachment
	kunaibeam.Parent = evilerattachment
	kunaibeam.Attachment0 = evilerattachment
	kunaibeam.Attachment1 = kunaiattach

	local ballsound = Instance.new("Sound", evilerattachment)
	ballsound.SoundId = "rbxassetid://9126086559"
	ballsound.Volume = 0
	ballsound.Pitch = 0.6
	ballsound.Looped = true
	ballsound.Playing = true

	tweenservice:Create(ballsound, TweenInfo.new(0.15), {
		Volume = 2.5*VOLUME,
		Pitch = 0.85
	}):Play()

	local holdstart = getruntime()
	repeat
		local delta = runservice.Heartbeat:Wait()
		animator:LerpTransforms({
			Head = ca(0, rad(30), 0),
			Torso = ca(0, rad(-30), 0),
			LArm = ca(rad(125), 0, rad(-15)),
			RArm = ca(0, 0, rad(55)),
			LLeg = CN0,
			RLeg = CN0
		}, delta*15, 1)
		pointtomouse(delta*15)

		evilerattachment.CFrame = cn(gethandposomg())
	until not keysdown[Enum.KeyCode.V] and getruntime() - holdstart > 0.15

	local direction = cn(gethandposomg(), mouse.Hit.Position)
	kunai.CFrame = direction
	kunai.Parent = workspace

	tweenservice:Create(kunai, TweenInfo.new(1), {
		Transparency = 1
	}):Play()
	tweenservice:Create(kunaibeam, TweenInfo.new(1), {
		Width0 = 0,
		Width1 = 0
	}):Play()

	local position = direction.Position
	local travelstart = getruntime()
	local raycast

	local throwsound = Instance.new("Sound", evilerattachment)
	throwsound.SoundId = "rbxassetid://743521549"
	throwsound.Volume = 0.7*VOLUME
	throwsound.Pitch = 0.9 + random()*0.2
	throwsound.Playing = true
	throwsound.PlayOnRemove = true
	throwsound:Destroy()

	repeat
		local delta = runservice.Heartbeat:Wait()

		raycast = query:Raycast(position, direction.LookVector*600*delta)

		if raycast then
			position = raycast.Position
		else
			position = position + direction.LookVector*600*delta
		end

		animator:LerpTransforms({
			Head = ca(rad(11.508), rad(-29.499), rad(5.725)),
			Torso = ca(rad(-17.192), rad(28.879), rad(8.499)),
			LArm = ca(rad(-10.993), rad(10.545), rad(-19.271)),
			RArm = ca(rad(47.714), rad(41.528), rad(39.468)),
			LLeg = CN0,
			RLeg = CN0
		}, delta*20, 1)
		--pointtomouse(delta*15)
		pointtopos(position, delta*15)

		evilerattachment.CFrame = cn(gethandposomg())
		kunai.CFrame = cn(position, position + direction.LookVector) * ca(math.pi*0.5, 0, 0)
	until raycast or getruntime() - travelstart >= 1

	local grabbedparts = {}

	if raycast then
		local hithums = {}

		for _, part in query:GetPartBoundsInRadius(raycast.Position, 3) do
			-- anti ppe
			if not ({pcall(function() return part.Name end)})[1] then
				continue
			end

			local hum = part.Parent and isa(part.Parent, "Model") and part.Parent ~= workspace and part.Parent:FindFirstChildOfClass("Humanoid")

			if hum and not table.find(hithums, hum) then
				table.insert(hithums, hum)

				for _, humpart in hum.Parent:GetDescendants() do
					if table.find(grabbedparts, humpart) then
						continue
					end

					if not isa(humpart, "BasePart") then
						continue
					end

					table.insert(grabbedparts, humpart)
				end
			end
		end
	end

	if #grabbedparts > 0 then
		humanoid.WalkSpeed = 2

		local avgposition
		local positiontotal = V30
		local closestpartpos = v3(math.huge, 0, 0)

		for _, part in grabbedparts do
			positiontotal = positiontotal + part.Position
		end

		avgposition = positiontotal/#grabbedparts

		for _, part in grabbedparts do
			if (closestpartpos - avgposition).Magnitude > (part.Position - avgposition).Magnitude then
				closestpartpos = part.Position
			end
		end

		kunaiattach.Parent = workspace.Terrain
		kunaiattach.CFrame = cn(closestpartpos)
		kunai:Destroy()

		tweenservice:Create(kunaibeam, TweenInfo.new(1, Enum.EasingStyle.Quad), {
			Width0 = 0.5,
			Width1 = 0.5,
			TextureSpeed = -10
		}):Play()

		-- hbjhhuhgfafasaffsfsadf

		local parts = {}
		local scamparticles2 = {}

		for _, part in grabbedparts do
			anchorpart(part)
			part:BreakJoints()

			table.insert(parts, {
				CFrame = part.CFrame,
				Size = part.Size,
				Transparency = part.Transparency,
				Part = part,
				SpinMult = random(-10, 10)/10
			})
		end

		local hb = runservice.Heartbeat:Connect(function()
			for emitter, amt in scamparticles2 do
				emitter:Emit(amt)
			end
		end)

		local circlepos = closestpartpos - v3(0, 5, 0)
		local raycast2waa = query:Raycast(closestpartpos, v3(0, -5, 0))
		circlepos = raycast2waa and raycast2waa.Position or circlepos

		local circleattach = newattachment(cn(circlepos + v3(0, 0.1, 0)))

		local dustpart = anchorpart(Instance.new("Part", workspace))
		dustpart.CFrame = cn(circlepos)
		dustpart.Size = v3(8, 0, 8)
		dustpart.Transparency = 1

		local linespartidk = anchorpart(Instance.new("Part", workspace))
		linespartidk.CFrame = cn(circlepos)
		linespartidk.Size = v3(4, 0, 4)
		linespartidk.Transparency = 1

		local circle = stuff.vatk.circle:Clone()
		local circleflare1 = stuff.vatk.circleflare1:Clone()
		local circleflare2 = stuff.vatk.circleflare2:Clone()
		circle.Parent = circleattach
		circleflare1.Parent = circleattach
		circleflare2.Parent = circleattach

		circle:Emit(1)
		circleflare1:Emit(2)
		circleflare1:Emit(2)

		local dust1 = stuff.vatk.darkdust:Clone()
		local dust2 = stuff.vatk.brightdust:Clone()
		dust1.Parent = dustpart
		dust2.Parent = dustpart

		dust1:Emit(10)
		dust2:Emit(5)
		scamparticles2[dust1] = 2
		scamparticles2[dust2] = 2

		local lines1 = stuff.vatk.linesidk:Clone()
		local lines2 = stuff.vatk.linesidkfast:Clone()
		lines1.Parent = linespartidk
		lines2.Parent = linespartidk

		lines1:Emit(5)
		lines2:Emit(5)

		scamparticles2[lines1] = 3
		scamparticles2[lines2] = 3

		local hitsound = Instance.new("Sound", evilerattachment)
		hitsound.SoundId = "rbxassetid://7601865567"
		hitsound.Volume = 1
		hitsound.Pitch = 0.7 + random()*0.2
		hitsound.Playing = true
		hitsound.PlayOnRemove = true
		hitsound:Destroy()

		local chains = {}

		loop(0.5, function(delta)
			animator:LerpTransforms({
				Head = ca(rad(-7.346), rad(8.687), rad(7.575)),
				Torso = ca(rad(3.888), rad(-10.085), rad(-2.537)) + v3(random(-5, 5)/50, random(-5, 5)/50, random(-5, 5)/50),
				LArm = ca(rad(21.813), rad(-2.074), rad(-21.778)),
				RArm = ca(rad(20.335), rad(15.673), rad(68.113)),
				LLeg = CN0,
				RLeg = CN0
			}, delta*5, 1)
			pointtopos(closestpartpos, delta*15)

			evilerattachment.CFrame = cn(gethandposomg())
		end)

		for i = 1, 4 do
			local rot = ca(random()*math.pi*2, random()*math.pi*2, random()*math.pi*2)
			local dist = random(8, 16)

			local a1 = newattachment(cn(closestpartpos) * rot * cn(0, -dist, 0))
			local a2 = newattachment(cn(closestpartpos) * rot * cn(0, -dist, 0))
			local beam = stuff.vatk.lockchain:Clone()

			beam.Parent = a1
			beam.Attachment0 = a1
			beam.Attachment1 = a2

			local chainsound = Instance.new("Sound", kunaiattach)
			chainsound.SoundId = "rbxassetid://9114793035"
			chainsound.Volume = 1*VOLUME
			chainsound.Pitch = 0.6 + random()*0.2
			chainsound.Playing = true

			tweenservice:Create(chainsound, TweenInfo.new(1, Enum.EasingStyle.Linear, Enum.EasingDirection.In, 0, false, 0.5), {
				Volume = 0,
				Pitch = 0.25
			}):Play()
			debris:AddItem(chainsound, 1.5)

			table.insert(chains, {
				Rotation = rot,
				Distance = dist,
				Pos0 = cn(closestpartpos) * rot * cn(0, -dist, 0),
				Pos1 = cn(closestpartpos) * rot * cn(0, -dist, 0),
				TargetPos1 = cn(closestpartpos) * rot * cn(0, dist, 0),

				Beam = beam,
				Attachment0 = a1,
				Attachment1 = a2,
			})
		end

		local inefficientuseofconnections = runservice.Heartbeat:Connect(function(delta)
			for _, chaindata in chains do
				chaindata.Pos1 = chaindata.Pos1:Lerp(chaindata.TargetPos1, math.min(delta*5))
				chaindata.Attachment0.CFrame = chaindata.Pos0 + v3(random(-10, 10)/40, random(-10, 10)/40, random(-10, 10)/40)
				chaindata.Attachment1.CFrame = chaindata.Pos1 + v3(random(-10, 10)/40, random(-10, 10)/40, random(-10, 10)/40)
			end
		end)

		local angleinc = 360/#parts
		local idkstart = getruntime()

		local curse = Instance.new("Sound", kunaiattach)
		curse.SoundId = "rbxassetid://3750941313"
		curse.Volume = 1*VOLUME
		curse.Playing = true
		curse.PlayOnRemove = true
		curse:Destroy()

		local castsound = Instance.new("Sound", kunaiattach)
		castsound.SoundId = "rbxassetid://9113455338"
		castsound.Volume = 1*VOLUME
		castsound.Pitch = 0.6 + random()*0.2
		castsound.Playing = true
		castsound.PlayOnRemove = true
		castsound:Destroy()

		loop(2, function(delta)
			local runtime = getruntime()
			local elapsed = runtime - idkstart
			local progress = elapsed/2
			local lerpalpha = math.min(elapsed, 1)
			local distmult = 1 - tweenservice:GetValue(progress, Enum.EasingStyle.Back, Enum.EasingDirection.In)

			for i, partdata in parts do
				local rot = ca(rad(runtime*180*partdata.SpinMult), rad(runtime*180*partdata.SpinMult), rad(runtime*180*partdata.SpinMult))

				if progress >= 0.5 then
					if not partdata.ReplacedPart then
						partdata.ReplacedPart = true
						partdata.Part:Destroy()

						local newpartwow = anchorpart(Instance.new("Part", workspace))
						newpartwow.Material = Enum.Material.Neon
						newpartwow.Color = Color3.new()
						newpartwow.CFrame = partdata.CFrame
						newpartwow.Size = partdata.Size

						partdata.Part = newpartwow
					end

					partdata.Part.Color = Color3.fromHSV(0.773583, 0.34641, 0.6*random())
				end

				partdata.CFrame = partdata.CFrame:Lerp(cn(circlepos) * ca(0, rad(runtime * 90 + i*angleinc), 0) * cn(0, 5*distmult, (-7 + sin(runtime*4)*2)*distmult) * rot, lerpalpha)
				partdata.Part.CFrame = partdata.CFrame

				partdata.Part.Size = partdata.Size * (1 - progress*0.75)
				partdata.Part.Transparency = random() > progress and partdata.Transparency or 1
			end

			animator:LerpTransforms({
				Head = ca(rad(-3.481), rad(-26.092), rad(2.991)),
				Torso = ca(rad(5.492), rad(24.88), rad(-2.753)) + v3(random(-5, 5)/50, random(-5, 5)/50, random(-5, 5)/50),
				LArm = ca(rad(-6.217), rad(8.861), rad(-15.077)),
				RArm = ca(rad(157.1), rad(16.133), rad(-30.289)),
				LLeg = CN0,
				RLeg = CN0
			}, delta*5, 1)
			pointtopos(closestpartpos, delta*15)

			evilerattachment.CFrame = cn(gethandposomg())
		end)

		for i, partdata in parts do
			partdata.Part:Destroy()
		end

		connections.disconnect(hb)
		connections.disconnect(inefficientuseofconnections)

		circle.Enabled = false
		circleflare1.Enabled = false
		circleflare2.Enabled = false
		debris:AddItem(circleattach, 2)
		debris:AddItem(linespartidk, 0.7)
		debris:AddItem(dustpart, 3)

		for i = 1, 10 do
			-- COPY PASTED EFFECT OOOOOOOOO IM TELLING
			local a1 = newattachment(cn(circlepos))
			local a2 = newattachment(animator.WingCenter:GetWorldPosition())
			local beam = stuff.zatk.hahalifesteal:Clone()

			beam.Parent = a1
			beam.Attachment0 = a1
			beam.Attachment1 = a2
			beam.CurveSize0 = random(-10, 10)
			beam.CurveSize1 = random(-10, 10)
			beam.Width0 = 0
			beam.Width1 = 0

			tweenservice:Create(beam, TweenInfo.new(0.5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
				Width0 = 1,
				Width1 = 0.25
			}):Play()

			local beamactivetime = random(50, 150)/100
			task.spawn(function()
				loop(beamactivetime, function()
					a1.CFrame = cn(circlepos + v3(random(-10, 10)/10, random(-10, 10)/10, random(-10, 10)/10))
					a2.CFrame = animator.WingCenter:GetWorldPosition()
				end)

				local tweenouttime = 2 - beamactivetime - random()*0.5
				tweenservice:Create(beam, TweenInfo.new(tweenouttime, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
					Width0 = 0,
					Width1 = 0
				}):Play()

				debris:AddItem(beam, tweenouttime)
				debris:AddItem(a1, tweenouttime)
				debris:AddItem(a2, tweenouttime)
			end)
		end

		local chainpos = closestpartpos
		local reelbackstart = getruntime()
		loop(0.25, function(delta)
			animator:LerpTransforms({
				Head = ca(rad(-7.346), rad(8.687), rad(7.575)),
				Torso = ca(rad(3.888), rad(-10.085), rad(-2.537)),
				LArm = ca(rad(21.813), rad(-2.074), rad(-21.778)),
				RArm = ca(rad(20.335), rad(15.673), rad(68.113)),
				LLeg = CN0,
				RLeg = CN0
			}, delta*15, 1)
			pointtopos(closestpartpos, delta*15)

			local handpos = gethandposomg()
			chainpos = closestpartpos:Lerp(handpos, (getruntime() - reelbackstart)/0.25)

			evilerattachment.CFrame = cn(handpos)
			kunaiattach.CFrame = cn(chainpos)
		end)

		task.spawn(function()
			for _, chaindata in chains do
				chaindata.TargetPos0 = chaindata.TargetPos1
			end

			loop(0.5, function(delta)
				for _, chaindata in chains do
					chaindata.Pos0 = chaindata.Pos0:Lerp(chaindata.TargetPos0, math.min(delta*4))
					chaindata.Attachment0.CFrame = chaindata.Pos0 + v3(random(-10, 10)/40, random(-10, 10)/40, random(-10, 10)/40)
					chaindata.Attachment1.CFrame = chaindata.Pos1 + v3(random(-10, 10)/40, random(-10, 10)/40, random(-10, 10)/40)
				end
			end)
			for _, chaindata in chains do
				chaindata.Beam:Destroy()
				chaindata.Attachment0:Destroy()
				chaindata.Attachment1:Destroy()
			end
		end)
	elseif raycast then
		local pos = position + direction.LookVector * 5

		tweenservice:Create(kunai, TweenInfo.new(1), {
			CFrame = cn(pos, pos + direction.LookVector) * ca(math.pi*0.5, 0, 0),
			Transparency = 1
		}):Play()

		loop(0.25, function(delta)
			animator:LerpTransforms({
				Head = ca(rad(-7.346), rad(8.687), rad(7.575)),
				Torso = ca(rad(3.888), rad(-10.085), rad(-2.537)),
				LArm = ca(rad(21.813), rad(-2.074), rad(-21.778)),
				RArm = ca(rad(20.335), rad(15.673), rad(68.113)),
				LLeg = CN0,
				RLeg = CN0
			}, delta*15, 1)
			pointtomouse(delta*15)

			local handpos = gethandposomg()
			--kunaipos = position:Lerp(handpos, (getruntime() - reelbackstart)/0.15)

			evilerattachment.CFrame = cn(handpos)
			--kunai.CFrame = cn(kunaipos, kunaipos + direction.LookVector) * ca(math.pi*0.5, 0, 0)
		end)
	end

	tweenservice:Create(ballsound, TweenInfo.new(0.5), {
		Pitch = 0.5,
		Volume = 0
	}):Play()

	holdflare.Enabled = false
	holdring.Enabled = false
	debris:AddItem(evilerattachment, 0.6)
	kunaiattach:Destroy()
	debris:AddItem(kunai, 2)

	humanoid.WalkSpeed = 8
	animator:SetPriorities({
		Head = 0, Torso = 0, LArm = 0, RArm = 0, LLeg = 0, RLeg = 0
	})
	scriptstate.IsAttacking = false
end

local function ULT()

end

local function ultinteraction()
	if scriptstate.IsAttacking then
		return
	end
	scriptstate.IsAttacking = true
	me.SearchingForInteraction = true
	me.InteractionSearchStart = os.clock()

	statchangetext("interaction test THIS IS A TEST")

	animator:SetPriorities({
		Head = 1, Torso = 1, LArm = 1, RArm = 1, LLeg = 1, RLeg = 1
	})

	local theultguy
	local partner

	repeat
		for otheruserid, other in myfriends do
			if userid == otheruserid then
				continue
			end

			if not other.SearchingForInteraction then
				continue
			end

			if (humanoid.Position.Position - other.Humanoid.Position.Position).Magnitude > 6 then
				continue
			end

			local offset = humanoid.Position:VectorToObjectSpace(other.Humanoid.Position.Position - humanoid.Position.Position)

			if offset.Z > -0.25 then
				continue
			end

			me.PotentialPartner = otheruserid

			if other.PotentialPartner == userid then
				partner = other
				me.ConfirmInteraction = otheruserid

				if other.InteractionSearchStart > me.InteractionSearchStart then
					theultguy = otheruserid
				else
					theultguy = userid
				end
			end
		end

		runservice.Heartbeat:Wait()
	until not keysdown[Enum.KeyCode.B] or (partner and partner.ConfirmInteraction == userid)

	me.SearchingForInteraction = false
	me.InteractionSearchStart = nil
	me.ConfirmInteraction = nil

	if theultguy then
		me.PerformingUlt = true

		statchangetext(`{plrs:GetNameFromUserIdAsync(theultguy)} will be doing the ult`)
		task.wait(1)

		if theultguy == userid then
			statchangetext("stasis")
		else
			humanoid.Position = myfriends[theultguy].Humanoid.Position * cn(0, 0, -3) * ca(0, math.pi, 0)
			statchangetext("stasis + reposition")
		end

		humanoid.State = humanoidstate.Stasis

		statchangetext("- RespectCanCollide", true)
		task.wait(1)
		statchangetext("+ anti rrt query", true)
		task.wait(1)
		statchangetext("- size check", true)
		task.wait(1)

		statchangetext("ult should run now")

		if theultguy == userid then
			task.spawn(ULT)
			statchangetext("ult anim 1")
		else
			statchangetext("ult anim 2")
		end

		task.wait(5)
		humanoid.State = humanoidstate.Idle
		me.PerformingUlt = false

		statchangetext("exit stasis")
	else
		statchangetext("no ult")
	end

	animator:SetPriorities({
		Head = 0, Torso = 0, LArm = 0, RArm = 0, LLeg = 0, RLeg = 0
	})

	scriptstate.IsAttacking = false
end

local function soloult()
	if scriptstate.IsAttacking then
		return
	end
	scriptstate.IsAttacking = true
	me.PerformingUlt = true

	statchangetext("solo ult")

	humanoid.State = humanoidstate.Stasis
	ULT()
	humanoid.State = humanoidstate.Idle

	me.PerformingUlt = false
	scriptstate.IsAttacking = false
end

local lastwtaptime = getruntime()
local function dash()
	if scriptstate.IsAttacking then
		return
	end
	scriptstate.IsAttacking = true
	animator:SetPriorities({ Head = 1, Torso = 1, LArm = 1, RArm = 1, LLeg = 1, RLeg = 1 })

	loop(0.1, function(delta)
		animator:LerpTransforms({
			Head = ca(rad(-10), 0, 0),
			Torso = ca(rad(10), 0, 0),
			LArm = ca(rad(50.949), rad(-27.339), rad(-63.121)),
			RArm = ca(rad(48.802), rad(22.619), rad(57.457)),
			LLeg = ca(rad(-20), 0, 0),
			RLeg = ca(rad(5), 0, 0)
		}, delta*20, 1)
		pointtomouse(delta*30)
	end)

	local direction = cn(humanoid.Position.Position, mouse.Hit.Position)
	humanoid.Velocity = direction.LookVector*250

	if humanoid.Velocity.Y > 1 and humanoid.Floor then
		humanoid.Position = humanoid.Position + v3(0, 1, 0)
	end

	local attach = newattachment(direction * cn(0, 0, 2))
	emitparticles(stuff.dash.darkcircle:Clone(), attach, 1)
	emitparticles(stuff.dash.shrinkcircle:Clone(), attach, 1)
	debris:AddItem(attach, 1)

	local linespart = anchorpart(Instance.new("Part", workspace))
	linespart.CFrame = direction * cn(0, 0, -6)
	linespart.Size = v3(3, 3, 3)
	linespart.Transparency = 1

	emitparticles(stuff.dash.lines:Clone(), linespart, 50)
	emitparticles(stuff.dash.darklines:Clone(), linespart, 40)
	debris:AddItem(linespart, 0.5)

	local dashsound = Instance.new("Sound", attach)
	dashsound.SoundId = "rbxassetid://4909206080"
	dashsound.Pitch = 1.2 + random()*0.2
	dashsound.Volume = 0.2 * VOLUME
	dashsound.Playing = true
	dashsound.PlayOnRemove = true
	dashsound:Destroy()

	local castsound = Instance.new("Sound", attach)
	castsound.SoundId = "rbxassetid://182765513"
	castsound.Pitch = 2 + random()
	castsound.Volume = 1 * VOLUME
	castsound.Playing = true
	castsound.PlayOnRemove = true
	castsound:Destroy()

	local dashstart = getruntime()
	loop(0.4, function(delta)
		animator:LerpTransforms({
			Head = ca(rad(20), 0, 0),
			Torso = ca(rad(-25), 0, 0),
			LArm = ca(rad(-18.643), rad(7.079), rad(-6.267)),
			RArm = ca(rad(-28.862), rad(-8.152), rad(7.585)),
			LLeg = ca(rad(-25), 0, 0),
			RLeg = ca(rad(-45), 0, 0)
		}, delta*15, 1)

		local progress = (getruntime() - dashstart)/0.4
		humanoid.WingSpin = humanoid.WingSpin - (1 - progress^2)*1080*delta
	end)

	animator:SetPriorities({ Head = 0, Torso = 0, LArm = 0, RArm = 0, LLeg = 0, RLeg = 0 })
	lastwtaptime = 0
	scriptstate.IsAttacking = false
end

local keybinds = {
	[Enum.KeyCode.W] = {down=function()
		if 0.2 > getruntime() - lastwtaptime then
			dash()
		end
		lastwtaptime = getruntime()
	end},

	mouse1 = {down=standardatk},
	[Enum.KeyCode.Q] = {down=function()
		refitchar()
		antideathpaused = false
	end},
	[Enum.KeyCode.E] = {down=function()
		if keysdown[Enum.KeyCode.LeftControl] or keysdown[Enum.KeyCode.RightControl] then
			disableantideath()
			statchangetext("paused antideath")
			antideathpaused = true
			return
		end

		if humanoid.State == humanoidstate.Idle then
			humanoid.Sit = not humanoid.Sit
		end
	end},
	[Enum.KeyCode.R] = {down=function()
		if keysdown[Enum.KeyCode.LeftControl] or keysdown[Enum.KeyCode.RightControl] then
			remote:FireClient("die")
			die()
			return
		end

		local spawnpositions = {}

		for _, plr in plrs:GetPlayers() do
			local hum = plr.Character and plr.Character:FindFirstChildOfClass("Humanoid")
			local root = hum and hum.RootPart

			if root then
				table.insert(spawnpositions, root.Position + v3(0, 3, 0))
			end
		end

		if #spawnpositions == 0 then
			humanoid.Position = SPAWN_LOCATION
			return
		end

		local position = spawnpositions[random(1, #spawnpositions)]
		humanoid.Position = cn(position, position + humanoid.Position.LookVector)
	end},
	[Enum.KeyCode.P] = {down=function()
		humanoid.Position = SPAWN_LOCATION
		humanoid.Velocity = V30
	end},
	[Enum.KeyCode.F] = {down=function()
		if humanoid.MoveMode == movemode.Ground then
			humanoid.MoveMode = movemode.Fly
		else
			humanoid.MoveMode = movemode.Ground
		end
	end},
	[Enum.KeyCode.J] = {down=function()
		query.RespectCanCollide = not query.RespectCanCollide

		if query.RespectCanCollide then
			statchangetext("+ RespectCanCollide", false)
		else
			statchangetext("- RespectCanCollide", true)
		end
	end},
	[Enum.KeyCode.K] = {down=function()
		query.UseCustomQuery = not query.UseCustomQuery

		if query.UseCustomQuery then
			statchangetext("+ anti rrt query", true)
		else
			statchangetext("- anti rrt query", false)
		end
	end},
	[Enum.KeyCode.L] = {down=function()
		sizecheck = not sizecheck

		if sizecheck then
			statchangetext("+ size check", false)
		else
			statchangetext("- size check", true)
		end
	end},
	[Enum.KeyCode.Z] = {down=attackz},
	[Enum.KeyCode.X] = {down=attackx},
	[Enum.KeyCode.C] = {down=function()
		local newposition = mouse.Hit.Position + v3(0, humanoid.HipHeight, 0)
		humanoid.Position = cn(newposition, newposition + humanoid.Position.LookVector)
	end},
	[Enum.KeyCode.V] = {down=grabattacknoway},
	[Enum.KeyCode.B] = {down=function()
		if keysdown[Enum.KeyCode.LeftControl] and keysdown[Enum.KeyCode.Equals] then
			soloult()
			return
		end
		ultinteraction()
	end},
	[Enum.KeyCode.N] = {down=function()
		humanoid.FlickerRate = 75
	end},
	[Enum.KeyCode.M] = {down=function()
		if music.IsPlaying then
			music:Stop()
			statchangetext("🔈")
		else
			music:Play()
			statchangetext("🔊")
		end
	end},
	[Enum.KeyCode.Comma] = {down=function()
		local prevpos = music.Position
		local newpos = music.Position == 1 and #music.Songs or music.Position - 1
		music:ChangeToSong(newpos)
		statchangetext(`song#{prevpos} -> song#{newpos}`)
	end},
	[Enum.KeyCode.Period] = {down=function()
		local prevpos = music.Position
		local newpos = music.Position == #music.Songs and 1 or music.Position + 1
		music:ChangeToSong(newpos)
		statchangetext(`song#{prevpos} -> song#{newpos}`)
	end},
}

remote.Methods.KeyDown = function(key)
	keysdown[key] = true
	if keybinds[key] and keybinds[key].down then
		keybinds[key].down()
	end
end

remote.Methods.KeyUp = function(key)
	keysdown[key] = nil
	if keybinds[key] and keybinds[key].up then
		keybinds[key].up()
	end
end

--

--

connections.Stepped = runservice.Stepped:Connect(function(_, delta)
	if humanoid.State == humanoidstate.Stasis then
		return
	end

	local lookvector = camera.CFrame.LookVector
	local movevector =  client.MoveVector

	if humanoid.MoveMode == movemode.Ground then
		local currentposition = humanoid.Position
		local currentvelocity = humanoid.Velocity

		local movedirection = (cn(V30, v3(lookvector.X, 0, lookvector.Z)) * cn(movevector.X, 0, movevector.Z)).Position
		movedirection = movedirection.Magnitude > 1 and movedirection.Unit or movedirection

		local raycast = query:Raycast(currentposition.Position, v3(0, math.min(currentvelocity.Y*delta, 0) - humanoid.HipHeight - 0.5, 0))

		local rotation = cn(V30, currentposition.LookVector)
		local horizontalvelocity = v3(currentvelocity.X, 0, currentvelocity.Z):Lerp(movedirection*humanoid.WalkSpeed, delta*(humanoid.Floor and 10 or 2))
		local yvelocity = raycast and (movevector.Y >= 1 and humanoid.JumpPower or 0) or currentvelocity.Y - GRAVITY*delta
		--local yposition = raycast and (currentposition.Y + ((raycast.Position.Y + humanoid.HipHeight) - currentposition.Y)*math.min(delta*15, 1)) or currentposition.Y
		local yposition = raycast and raycast.Position.Y + humanoid.HipHeight or currentposition.Y
		rotation = movedirection.Magnitude > 0 and rotation:Lerp(cn(V30, movedirection), delta*10) or rotation

		--if raycast --[[and 0.2 > (yposition - humanoid.HipHeight) - raycast.Position.Y]] then
		--	yvelocity = movevector.Y >= 1 and humanoid.JumpPower or 0
		--end

		local finalvelocity = v3(horizontalvelocity.X, yvelocity, horizontalvelocity.Z)
		local finalposition = v3(currentposition.X, yposition, currentposition.Z) + finalvelocity*delta

		local state = raycast and (movedirection.Magnitude > 0 and humanoidstate.Walk or humanoidstate.Idle) or (yvelocity > 0 and humanoidstate.Jump or humanoidstate.Fall)

		if humanoid.State ~= state then
			humanoid.State = state
			statechangedevent:Fire(state)
		end

		humanoid.Floor = raycast and raycast.Instance or nil
		humanoid.MoveDirection = movedirection
		humanoid.Velocity = finalvelocity
		humanoid.Position = cn(finalposition, finalposition + rotation.LookVector)
		humanoid.WingSpin -= movedirection.Magnitude*45*delta
	else
		local movedirection = (cn(V30, lookvector) * cn(movevector)).Position
		movedirection = movedirection.Magnitude > 1 and movedirection.Unit or movedirection

		local velocity = humanoid.Velocity:Lerp(movedirection * humanoid.WalkSpeed * humanoid.FlySpeed, math.min(delta*5, 1))
		local position = humanoid.Position.Position + velocity*delta
		local rotation = cn(V30, humanoid.Position.LookVector)

		if movedirection.Magnitude > 0 then
			rotation = rotation:Lerp(cn(V30, camera.CFrame.LookVector), delta*5)
			humanoid.State = humanoidstate.FlyMove
		else
			humanoid.State = humanoidstate.FlyIdle
		end

		humanoid.Floor = nil
		humanoid.Velocity = velocity
		humanoid.MoveDirection = movedirection
		humanoid.Position = cn(position, position + rotation.LookVector)
		humanoid.WingSpin -= delta*90 + movedirection.Magnitude*90*delta
	end

	if humanoid.State ~= humanoidstate.Idle and humanoid.Sit then
		humanoid.Sit = false
	end

	if humanoid.Position.Y < workspace.FallenPartsDestroyHeight then
		humanoid.Position = SPAWN_LOCATION
		humanoid.Velocity = V30
	end
end)

local lasthealthbarrefittime = getruntime()
local jumptime = getruntime()

connections.StateChanged = humanoid.StateChanged:Connect(function(newstate)
	if newstate == humanoidstate.Jump then
		jumptime = getruntime()

		local attachment = newattachment(humanoid.Position)
		local jumpsound = Instance.new("Sound", attachment)
		jumpsound.SoundId = "rbxassetid://6237250110"
		jumpsound.Pitch = 0.4
		jumpsound.Volume = 0.3 * VOLUME
		jumpsound.Playing = true
		jumpsound.PlayOnRemove = true
		attachment:Destroy()
	end

	if newstate == humanoidstate.Walk then
		walkingsound:Enable()
	else
		walkingsound:Destroy()
	end
end)

connections.Heartbeat = runservice.Heartbeat:Connect(function(delta)
	local runtime = getruntime()
	local shouldsit = humanoid.Sit

	-- ok heres the actual anims lol

	if humanoid.State == humanoidstate.Idle then
		local lookatvector = humanoid.Position:VectorToObjectSpace(camera.CFrame.LookVector)

		if not shouldsit then
			shouldsit = humanoid.Floor and (isa(humanoid.Floor, "Seat") or isa(humanoid.Floor, "VehicleSeat"))
		end

		if shouldsit then
			animator:LerpTransforms({
				Head = ca(lookatvector.Y, -lookatvector.X*0.6, 0),
				Torso = cn(0, -0.85, 0) * ca(0, -lookatvector.X*0.2, 0),
				LArm = ca(rad(89.994), rad(11.511), rad(29.744)),
				RArm = ca(rad(90.155), rad(-8.492), rad(-26.186)),
				LLeg = ca(rad(90), 0, rad(15)),
				RLeg = ca(rad(104.511), rad(-3.841), rad(-14.511))
			}, delta*10)
		else
			animator:LerpTransforms({
				Head = ca(lookatvector.Y + rad(-sin(runtime*2)*1.5), -lookatvector.X*0.6, 0),
				Torso = cn(0, sin(runtime*2)*0.05, 0) * ca(0, -lookatvector.X*0.4, 0),
				LArm = ca(rad(-14.945 + sin(runtime*2)*3), rad(-1.293 + cos(runtime*1.25)*4), rad(4.831 + cos(runtime*1.5)*3)),
				RArm = ca(rad(-24.664 + sin(runtime*2)*3), rad(4.205 - cos(runtime*1.25)*4), rad(-9.073 - cos(runtime*1.5)*3)),
				LLeg = ca(rad(-9.963 + sin(runtime*2)*2), rad(-0.867), rad(4.924 + sin(runtime*2)*2)),
				RLeg = ca(rad(4.981 - sin(runtime*2)*2), rad(-0.435), rad(-4.981 - sin(runtime*2)*2))
			}, delta*10)
		end
	elseif humanoid.State == humanoidstate.Walk then
		local tilt = humanoid.Position:VectorToObjectSpace(humanoid.Velocity)
		tilt = v3(tilt.X, 0, tilt.Z)
		tilt = (tilt.Magnitude == 0 and tilt or tilt.Unit) * tilt.Magnitude/humanoid.WalkSpeed

		animator:LerpTransforms({
			Head = ca(rad(10), rad(sin(runtime*6)*10) - tilt.X*2, 0),
			Torso = cn(0, math.abs(sin(runtime*6)*0.2), 0) * ca(rad(-10), rad(-sin(runtime*6)*10), -tilt.X*2),
			LArm = ca(rad(sin(runtime*6)*40), 0, 0),
			RArm = ca(rad(-sin(runtime*6)*40), 0, 0),
			LLeg = ca(rad(-sin(runtime*6)*40), 0, 0),
			RLeg = ca(rad(sin(runtime*6)*40), 0, 0)
		}, delta*10)
	elseif humanoid.State == humanoidstate.Jump then
		local rot = math.max(-(getruntime() - jumptime)*1080, -360)
		animator:LerpTransforms({
			Head = ca(rad(-45), 0, 0),
			Torso = ca(rad(rot), 0, 0),
			LArm = ca(0, 0, rad(-25)),
			RArm = ca(0, 0, rad(25)),
			LLeg = ca(rad(50), 0, 0),
			RLeg = ca(rad(55), 0, 0),
		}, delta*15)
	elseif humanoid.State == humanoidstate.Fall then
		animator:LerpTransforms({
			Head = ca(rad(-45 - cos(runtime*4)*2.5), 0, 0),
			Torso = ca(rad(15 + sin(runtime*4)*2.5), 0, 0),
			LArm = ca(0, 0, rad(-20 + sin(runtime*25)*35)),
			RArm = ca(0, 0, rad(20 - sin(runtime*25)*35)),
			LLeg = ca(rad(-30 - cos(runtime*4)*4), 0, 0),
			RLeg = ca(rad(-cos(runtime*4)*4), 0, 0),
		}, delta*15)
	elseif humanoid.State == humanoidstate.FlyIdle then
		local lookatvector = humanoid.Position:VectorToObjectSpace(camera.CFrame.LookVector)
		animator:LerpTransforms({
			Head = ca(lookatvector.Y, -lookatvector.X*0.8, 0),
			Torso = cn(0, sin(runtime*2)*0.1, 0) * ca(rad(sin(0.5 - runtime*2)), rad(sin(runtime*2)) - lookatvector.X*0.2, rad(cos(runtime*3)*0.5)),
			LArm = ca(rad(-14.782 + cos(runtime*2)*2), rad(2.576 + sin(runtime*3)*2), rad(-9.666 + sin(runtime*1.5)*2)),
			RArm = ca(rad(-14.511 + sin(runtime*3)*2), rad(-3.841 + cos(runtime*1.5)*2), rad(14.509 + cos(runtime*2)*2)),
			LLeg = ca(rad(sin(runtime*2)*2), rad(sin(runtime*1.5)*2), rad(5 + cos(runtime*2)*2)),
			RLeg = ca(rad(-30 + sin(runtime*3)*2), rad(sin(runtime*1.5)*2), rad(-5 + sin(runtime*2)*2)),
		}, delta*10)
	elseif humanoid.State == humanoidstate.FlyMove then
		local tilt = humanoid.Position:VectorToObjectSpace(humanoid.Velocity)
		tilt = (tilt.Magnitude > 0 and tilt.Unit or tilt) * (tilt.Magnitude/(humanoid.WalkSpeed*humanoid.FlySpeed))

		animator:LerpTransforms({
			Head = ca(rad(-tilt.Z*50 + tilt.Y*10), rad(-tilt.X*20), 0),
			Torso = cn(0, sin(runtime*2)*0.1, 0) * ca(rad(tilt.Z*50 + tilt.Y*5), rad(-tilt.X*20), rad(-tilt.X*20)),
			LArm = ca(rad(tilt.Z*20), 0, rad(tilt.Y*10)),
			RArm = ca(rad(tilt.Z*20), 0, rad(-tilt.Y*10)),
			LLeg = ca(rad(tilt.Z*10), 0, rad(tilt.Y*7)),
			RLeg = ca(rad(-30 + tilt.Z*10), 0, rad(-tilt.Y*7)),
		}, delta*10)
	end

	-- WINGS!!!
	local wingtransforms = { WingCenter = ca(rad(runtime*5), rad(runtime*10), rad(runtime*15)) }
	for i = 1, 6 do
		wingtransforms[`Wing{i}`] = ca(0, 0, rad(humanoid.WingSpin)) * ca(rad(-sin(runtime)*20 - 20), 0, 0)
	end
	animator:LerpTransforms(wingtransforms, delta*30)

	-- update joints
	for jointname, parts in character do
		local maincf = animator[jointname]:GetWorldPosition()

		for _, part in parts do
			part.Part.CFrame = maincf * part.Offset
		end
	end

	-- update wing trails
	--[[for i, wing in wings do
		local cf = animator[`Wing{i}`]:GetWorldPosition()
		wing.Attachment0.CFrame = cf * cn(0, -2.1, 0)
		wing.Attachment1.CFrame = cf * cn(0, 2.1, 0)
	end]]

	if shouldsit then
		humanoid.CameraOffset = humanoid.CameraOffset:Lerp(v3(0, -0.85, 0), math.min(delta*10, 1))
	else
		humanoid.CameraOffset = humanoid.CameraOffset:Lerp(V30, math.min(delta*10, 1))
	end

	-- asbdtfgsdhfysdfhgdf
	local focusposition = client.CameraFocus:Lerp(humanoid.Position.Position + v3(0, 1.2, 0) + humanoid.CameraOffset, math.min(delta*10, 1))
	if client.CameraFocus ~= focusposition then
		client.CameraFocus = focusposition
		remote:FireClient("FocusChanged", focusposition)
	end

	-- sjdfvgujyfrejwhtvf gefudgt
	if getruntime() - lasthealthbarrefittime > 1 then
		lasthealthbarrefittime = getruntime()
		healthbar:Refit()
	end

	healthbar:SetHealth(random(1, 20))
	healthbar:MoveTo(humanoid.Position * cn(0, 2.5, 0))
	music:MoveTo(humanoid.Position)
	walkingsound:MoveTo(humanoid.Position)

	-- flicker
	for _, partdata in charparts do
		if humanoid.FlickerRate >= random(1, 100) then
			if not partdata.IsFlashing then
				partdata.IsFlashing = true

				for _, part in partdata.Parts do
					for property, value in partdata.AltProperties do
						part[property] = value
					end
				end
			end
		else
			if partdata.IsFlashing then
				partdata.IsFlashing = false

				for _, part in partdata.Parts do
					for property, value in partdata.MainProperties do
						part[property] = value
					end
				end
			end
		end
	end

	humanoid.FlickerRate = math.max(humanoid.FlickerRate - delta*50, 1)

	if humanoid.FlickerRate >= random(1, 100) then
		face.Eyes.Color3 = Color3.fromRGB(112, 44, 181)
		face.Eyes.Texture = "rbxassetid://6241214359"
		face.EyeShine.Texture = "rbxassetid://6241225807"
		face.Mouth.Texture = "rbxassetid://6239835601"
		face.Shade.Transparency = 1
	else
		face.Eyes.Color3 = Color3.fromRGB(94, 82, 113)
		face.Eyes.Texture = "rbxassetid://6239834554"
		face.EyeShine.Texture = "rbxassetid://6239836016"
		face.Mouth.Texture = "rbxassetid://6253043677"
		face.Shade.Transparency = 0.5
	end
end)

table.clear(_ENV)
script:Destroy()