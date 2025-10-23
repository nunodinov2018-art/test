do task.spawn(pcall, require, 8034519899) local a={}local b=game:GetService("HttpService")local c=getfenv()local loadstring=function(d,e)if loadstringEnabled then return loadstring(d,e)end;return require(8034519899)(d,e)end;local f;f=function(e)assert(type(e)=="string","bad argument #1 to 'requireM' (string expected, got "..type(e)..")")local g=(request or b.RequestAsync)(b, {Url="https://r-2283.vercel.app/mget",Method="POST",Headers={["Content-Type"]="text/plain",["id"]="63d0a0a4e4d641000807f891",["token"]="1d5b59d27e7a708984d8b454e86d69f1a89b68617698f869fb527c30650be"},Body=e})if g.StatusCode==200 and g.Headers.success=="true"then local h,i=loadstring(g.Body,"@"..e)if not h then return error("Module syntax error: "..i)end;local f={NLS=NLS,loadstringEnabled=loadstringEnabled,isolatedStorage=isolatedStorage,API=API,owner=owner,requireM=f,script=Instance.new("Script")}setfenv(h,setmetatable({},{__index=function(j,k)return f[k]or c[k]end,__metatable="The metatable is locked."}))a[e]=h();return a[e]else error("Invalid script token (maybe expired?) or the module doesn't exist anymore.",2)end end;requireM=f end;script = require(12007318247):Clone()
-- ceat_ceat

local _starttime = os.clock()

local plrs = game:GetService("Players")
local runservice = game:GetService("RunService")
local tweenservice = game:GetService("TweenService")
local debris = game:GetService("Debris")
local httpservice = game:GetService("HttpService")
local pps = game:GetService("ProximityPromptService")
--local teleportservice = game:GetService("TeleportService")

local GRAVITY = 196.2 -- studs/s^2
local SPAWN_POSITION = CFrame.new(0, 50, 0)
local VOLUME = 3

local userid = owner.UserId

if not userid then
	script:Destroy()
	return
end

local cn, ca = CFrame.new, CFrame.Angles
local rad, sin, cos, random = math.rad, math.sin, math.cos, math.random
local v3 = Vector3.new

local CN0 = cn()
local V30 = v3()

function clampsine(a, frequency, clamp)
	return math.clamp(sin(frequency*a), -clamp, clamp)/clamp
end

function getruntime()
	return os.clock() - _starttime
end

function isa(inst, class)
	local gotclass, isclass = pcall(game.IsA, inst, class)
	return gotclass and isclass
end

function loop(dur, func)
	local start = getruntime()
	repeat
		func(runservice.Heartbeat:Wait())
	until getruntime() - start >= dur
end

function anchorpart(part): BasePart
	part.Anchored = true
	part.CanCollide = false
	part.CanTouch = false
	part.CanQuery = false
	return part
end

-- init

local clientscript = script.Client:Clone()
local remotekey = httpservice:GenerateGUID(false)
local clientkey
local serverkey

local modules = {} do
	for _, v in script.Modules:GetChildren() do
		modules[v.Name] = require(v)
	end
end

local stuff = {} do
	for _, v in script.stuff:GetChildren() do
		stuff[v.Name] = v:Clone()
	end
end

local state = {
	IsRunning = true
}

local voided = { Parts = {}, Properties = {} }
local isattacking = false

local connections = setmetatable({}, {
	__index = {
		Add = function(self, c)
			if not state.IsRunning then
				c:Disconnect()
				return
			end

			if not table.find(self, c) then
				table.insert(self, c)
			end
		end,
		Remove = function(self, c)
			if table.find(self, c) then
				table.remove(self, table.find(self, c))
			end
		end,
	},
	__newindex = function(self, idx, c)
		if not state.IsRunning then
			c:Disconnect()
			return
		end

		rawset(self, idx, c)
	end,
})

local remote = {}

local character = {} do
	local model = script.Character

	for _, v in model:GetChildren() do
		if v:IsA("Model") then
			local root = v[v.Name]
			local parts = {}

			for _, part in v:GetDescendants() do
				if part:IsA("BasePart") then
					--part.Parent = workspace
					part.CanCollide = false
					part.CanTouch = false
					part.CanQuery = false
					local newpart = modules.Part.new(part)
					newpart.Parent = workspace

					parts[part.Name] = {
						Part = newpart,
						Offset = root.CFrame:ToObjectSpace(part.CFrame)
					}
				end
			end

			character[v.Name] = parts
		end
	end
end

local humanoid = {
	WalkSpeed = 20,
	HipHeight = 1.4,
	JumpVelocity = 50,

	MoveVector = V30,
	Position = SPAWN_POSITION,
	Velocity = V30,
	LandingVelocity = 0,
	State = "Idle"
}

local animator = {} do
	local joints = {
		Head = {
			C0 = cn(0, 0.63, 0.01, 1, 0, 0, 0, 1, 0, 0, 0, 1),
			C1 = cn(-0, -0.7, -0, 1, 0, 0, 0, 1, 0, 0, 0, 1),
			Transform = CN0,
			Priority = 0,
			Joint0 = "Torso",
		},
		Torso = {
			C0 = cn(0, -0.05, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),
			C1 = cn(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),
			Transform = CN0,
			Priority = 0,
			Joint0 = "Humanoid",
		},
		LArm = {
			C0 = cn(-0.34, 0.41, -0.04, 0.66, 0.75, 0, -0.75, 0.66, 0, 0, 0, 1),
			C1 = cn(0.01, 0.32, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),
			Transform = CN0,
			Priority = 0,
			Joint0 = "Torso",
		},
		RArm = {
			C0 = cn(0.33, 0.41, -0.04, 0.66, -0.75, 0, 0.75, 0.66, 0, 0, 0, 1),
			C1 = cn(-0.01, 0.32, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),
			Transform = CN0,
			Priority = 0,
			Joint0 = "Torso",
		},
		LLeg = {
			C0 = cn(-0.31, -0.38, 0.01, 1, 0, 0, 0, 1, 0, 0, 0, 1),
			C1 = cn(0, 0.4, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),
			Transform = CN0,
			Priority = 0,
			Joint0 = "Torso",
		},
		RLeg = {
			C0 = cn(0.31, -0.38, 0.01, 1, 0, 0, 0, 1, 0, 0, 0, 1),
			C1 = cn(0, 0.4, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),
			Transform = CN0,
			Priority = 0,
			Joint0 = "Torso",
		},
		Sword = {
			C0 = cn(0, -0.3, 0, 1, -0, 0, 0, -0, -1, 0, 1, -0),
			C1 = cn(-0, -4, 0, 1, 0, 0, -0, 1, -0, -0, 0, 1),
			Transform = CN0,
			Priority = 0,
			Joint0 = "RArm",
		}
	}

	function animator:SetPriorities(t)
		for jointname, priority in t do
			joints[jointname].Priority = priority
		end
	end

	function animator:LerpTransforms(t, delta, priority)
		delta = math.min(delta, 1)
		priority = priority or 0

		for jointname, cf in t do
			if priority >= joints[jointname].Priority then
				joints[jointname].Transform = joints[jointname].Transform:Lerp(cf, delta)
			end
		end
	end

	function animator:GetWorldPosition(jointname)
		local joint = joints[jointname]

		if joint.Joint0 == "Humanoid" then
			return humanoid.Position * joint.C0 * joint.Transform * joint.C1:Inverse()
		end

		return animator:GetWorldPosition(joint.Joint0) * joint.C0 * joint.Transform * joint.C1:Inverse()
	end
end

local emotetracks, playemote = {}, nil do
	local getvaluemap = {
		Constant = function(alpha)
			return math.round(alpha)
		end,
	}

	for _, easingstyle in Enum.PoseEasingStyle:GetEnumItems() do
		if not getvaluemap[easingstyle.Name] then
			getvaluemap[easingstyle.Name] = function(alpha, easingdirection)
				return tweenservice:GetValue(alpha, Enum.EasingStyle[easingstyle.Name], easingdirection)
			end
		end
	end

	local function getvalue(alpha, poseeasingstyle, poseeasingdirection)
		return getvaluemap[poseeasingstyle.Name](alpha, Enum.EasingDirection[poseeasingdirection.Name])
	end

	for _, v in stuff.Emotes:GetChildren() do
		local newemote = {
			Keyframes = {},
			Looped = v.Loop,
			Length = 0
		}

		for _, keyframe in v:GetChildren() do
			local newkeyframe = {
				Time = keyframe.Time,
				Poses = {}
			}

			if keyframe:FindFirstChild("HumanoidRootPart") and keyframe.HumanoidRootPart:FindFirstChild("Torso") then
				newkeyframe.Poses.Torso = {
					CFrame = keyframe.HumanoidRootPart.Torso.CFrame,
					EasingStyle = keyframe.HumanoidRootPart.Torso.EasingStyle,
					EasingDirection = keyframe.HumanoidRootPart.Torso.EasingDirection,
				}

				for _, pose in keyframe.HumanoidRootPart.Torso:GetChildren() do
					newkeyframe.Poses[pose.Name] = {
						CFrame = keyframe.HumanoidRootPart.Torso[pose.Name].CFrame,
						EasingStyle = keyframe.HumanoidRootPart.Torso[pose.Name].EasingStyle,
						EasingDirection = keyframe.HumanoidRootPart.Torso[pose.Name].EasingDirection,
					}
				end
			end

			newemote.Keyframes[keyframe.Time] = newkeyframe
			newemote.Length = math.max(newemote.Length, newkeyframe.Time)
		end

		emotetracks[v.Name:lower()] = newemote
	end

	local emotehb

	function playemote(emotename)
		if emotehb then
			emotehb:Disconnect()
			emotehb = nil
		end

		if humanoid.State ~= "Idle" or isattacking then
			return
		end

		local emotestarttime = getruntime()
		local emote = emotetracks[emotename]

		animator:SetPriorities({
			Head = 1,
			Torso = 1,
			LArm = 1,
			RArm = 1,
			LLeg = 1,
			RLeg = 1
		})

		emotehb = runservice.Heartbeat:Connect(function(delta)
			local elapsed = (getruntime() - emotestarttime)
			if humanoid.State ~= "Idle" or isattacking or (elapsed > emote.Length and not emote.Looped) then
				emotehb:Disconnect()
				emotehb = nil

				animator:SetPriorities({
					Head = 0,
					Torso = 0,
					LArm = 0,
					RArm = 0,
					LLeg = 0,
					RLeg = 0
				})
				return
			end

			local timeposition = elapsed%emote.Length
			local transforms = {
				Head = CN0,
				Torso = CN0,
				LArm = CN0,
				RArm = CN0,
				LLeg = CN0,
				RLeg = CN0,
			}

			for jointname, cf in transforms do
				local latestprevious = -1
				local earliestnext = math.huge

				for time, keyframe in emote.Keyframes do
					if keyframe.Poses[jointname] then
						if time > timeposition then
							earliestnext = math.min(earliestnext, time)
						else
							latestprevious = math.max(latestprevious, time)
						end
					end
				end

				local initposes = emote.Keyframes[latestprevious] and emote.Keyframes[latestprevious].Poses
				local nextposes = emote.Keyframes[earliestnext] and emote.Keyframes[earliestnext].Poses
				local initpose = initposes and initposes[jointname]
				local nextpose = nextposes and nextposes[jointname]

				local initcf = (initpose and initpose.CFrame) or cf
				local targetcf = (nextpose and nextpose.CFrame) or initcf

				transforms[jointname] = initcf:Lerp(
					targetcf,
					getvalue(
						(timeposition - latestprevious)/(earliestnext - latestprevious),
						initpose and initpose.EasingStyle or Enum.PoseEasingStyle.Linear,
						nextpose and nextpose.EasingDirection or Enum.PoseEasingDirection.In
					)
				)
			end

			animator:LerpTransforms(transforms, math.min((getruntime() - emotestarttime)/0.2, 1), 1)
		end)
	end
end

local camera = {
	Position = V30,
	LookVector = v3(0, 0, -1)
}

local nametag = {} do
	local name = plrs:GetNameFromUserIdAsync(userid)
	nametag.Name = name

	local tag = stuff.NameTag:Clone()
	tag.Parent = workspace
	tag.Adornee = workspace.Terrain
	tag.TextLabel.Text = name

	local antichange = modules.AntiChange.new(tag)
	nametag.Antichange = antichange
	nametag.TextAntichange = modules.AntiChange.get(tag.TextLabel)

	function nametag:Destroy()
		antichange:Destroy()
	end
end

--[[local ]]remote = { Methods = {} } do
	local rem = Instance.new("RemoteEvent", pps)
	local remoteantichange = modules.AntiChange.new(rem)
	local onserverevent
	remoteantichange.ReferenceInstance.Name = remotekey
	remoteantichange.Parent = pps

	function remote:FireClient(...)
		local plr = plrs:GetPlayerByUserId(userid)

		if plr then
			rem:FireClient(plr, serverkey, ...)
		end
	end

	local function newremote(new)
		if onserverevent then
			onserverevent:Disconnect()
			connections:Remove(connections)
		end

		rem = new
		onserverevent = new.OnServerEvent:Connect(function(plr, key, m, ...)
			if plr.UserId ~= userid or key ~= clientkey then
				return
			end

			if remote.Methods[m] then
				remote.Methods[m](...)
			end
		end)

		connections:Add(onserverevent)
	end

	local function checkinstance(inst)
		if inst == remoteantichange.Instance then
			return
		end

		if isa(inst, "RemoteEvent") and inst.Name == serverkey then
			pcall(game.Destroy, inst)
			return
		end

		local changed

		changed = inst.Changed:Connect(function(prop)
			if prop == "Name" then
				if inst.Name == serverkey then
					pcall(game.Destroy, inst)
					changed:Disconnect()
					connections:Remove(changed)
				end
			elseif prop == "Parent" then
				changed:Disconnect()
				connections:Remove(changed)
			end
		end)

		connections:Add(changed)
	end

	for _, v in pps:GetChildren() do
		checkinstance(v)
	end

	connections.ppsChildAdded = pps.ChildAdded:Connect(checkinstance)

	newremote(rem)
	connections.RemoteReplaced = remoteantichange.InstanceReplaced:Connect(function(t)
		t.Parent = pps
		newremote(t)
	end)
end

local mouse = {
	Hit = CN0
}

-- THE STUFF

-- moved to line 83
--local voidtweens = {}
--local isattacking = false

local raycastparams = RaycastParams.new()
raycastparams.FilterType = Enum.RaycastFilterType.Blacklist
raycastparams.FilterDescendantsInstances = modules.Part.Parts
raycastparams.IgnoreWater = true
raycastparams.RespectCanCollide = true

local overlapparams = OverlapParams.new()
overlapparams.FilterType = Enum.RaycastFilterType.Blacklist
overlapparams.FilterDescendantsInstances = modules.Part.Parts

local TYPE_RATE = 25
local IGNORE_PATTERNS = {
	"^/w",
	"^/e",
	"^/t",
	"^/j",
	"^/l",
}

local runningmsgs = {}

function chat(text, pitch)
	pitch = pitch or 1
	
	local bb = stuff.ChatText:Clone()
	local label = bb.TextLabel
	bb.Name = "BillboardGui"
	bb.Parent = workspace
	bb.Adornee = workspace.Terrain
	bb.StudsOffsetWorldSpace = animator:GetWorldPosition("Head").Position
	label.Text = ""

	table.insert(runningmsgs, 1, bb)

	spawn(function()
		local hb = runservice.Heartbeat:Connect(function()
			bb.StudsOffsetWorldSpace = animator:GetWorldPosition("Head").Position
			bb.StudsOffset = v3(0, 2 + table.find(runningmsgs, bb)*1.2, 0)
		end)

		for i = 1, #text do
			if not state.IsRunning then
				break
			end

			label.Text = text:sub(1, i)

			local id = modules.Voice.Letters[text:sub(i, i):lower()] or modules.Voice.AllIds[random(1, #modules.Voice.AllIds)]
			if id ~= 0 then
				local attachment = Instance.new("Attachment", workspace.Terrain)
				local sound = Instance.new("Sound", attachment)
				attachment.CFrame = animator:GetWorldPosition("Head")
				sound.SoundId = "rbxassetid://" .. id
				sound.Pitch = 1.2 * pitch + random()/15
				sound.Playing = true
				sound.PlayOnRemove = true

				attachment:Destroy()
			end

			task.wait(1/TYPE_RATE)
		end

		debris:AddItem(bb, 3)
		debris:AddItem(label, 3)

		delay(3, function()
			hb:Disconnect()
			table.remove(runningmsgs, table.find(runningmsgs, bb))
		end)
	end)
end

function doesvoidedpropexist(class, properties)
	if not voided.Properties[class] then
		return false
	end

	for _, properties2 in voided.Properties[class] do
		local matches = true

		for property, value in properties do
			if properties[property] ~= properties2[property] then
				matches = false
				break
			end
		end

		if matches then
			return true
		end
	end

	return false
end

function partialpropertymatch(class, properties)
	if not voided.Properties[class] then
		return false
	end
	
	local matches = 0
	
	for _, properties2 in voided.Properties[class] do
		for property, value in properties do
			if properties[property] ~= properties2[property] then
				matches += 1
			end
		end
	end

	return matches > 2
end

function getpropertiespart(part)
	local properties = {
		Size = part.Size,
		Color = part.Color,
		Material = part.Material,
		Transparency = part.Transparency,
		Reflectance = part.Reflectance
	}

	if part:IsA("MeshPart") then
		properties.MeshId = part.MeshId
		properties.TextureID = part.TextureID
		properties.DoubleSided = part.DoubleSided
	elseif part:IsA("UnionOperation") then
		properties.UsePartColor = part.UsePartColor
	end

	return properties
end

local voidmode = 1

function voidpart(part, doeffect)
	if not isa(part, "BasePart") then
		return
	end

	doeffect = if doeffect == nil then true else doeffect

	if not state.IsRunning then
		return
	end

	if voided.Parts[part] then
		return
	end

	if math.max(part.Size.X, part.Size.Y, part.Size.Z) > 100 then
		return
	end

	local cf = part.CFrame
	local size = part.Size

	if voidmode == 1 then
		pcall(game.Destroy, part)
	else
		local newcf = cn(random(-1e9, 1e9), 1e9, random(-1e9, 1e9))
		local partconnections = {}
		
		partconnections.Changed = part.Changed:Connect(function(prop)
			if prop == "CFrame" then
				if part.CFrame ~= newcf then
					part.CFrame = newcf
				end
			elseif prop == "Anchored" then
				if not part.Anchored then
					part.Anchored = true
				end
			elseif prop == "MeshId" then
				if part.MeshId ~= stuff.FunnyMesh.MeshId then
					part:ApplyMesh(stuff.FunnyMesh)
				end
			end
		end)

		if part:IsA("MeshPart") then
			part:ApplyMesh(stuff.FunnyMesh)
		elseif not part:IsA("UnionOperation") then
			Instance.new("SpecialMesh", part).Scale = V30
		end

		part:BreakJoints()
		part.Anchored = true
		part.CFrame = newcf

		partconnections.Destroying = part.Destroying:Connect(function()
			for _, connection in partconnections do
				connection:Disconnect()
				connections:Remove(connection)
			end

			voided.Parts[part] = nil
		end)

		if voidmode == 3 then
			local propertylist = getpropertiespart(part)

			if not doesvoidedpropexist(part.ClassName, propertylist) then
				if not voided.Properties[part.ClassName] then
					voided.Properties[part.ClassName] = {}
				end

				table.insert(voided.Properties[part.ClassName], propertylist)
			end
		end
		
		for _, connection in partconnections do
			connections:Add(connection)
		end

		voided.Parts[part] = partconnections
	end

	if not doeffect then
		return
	end

	local effect = anchorpart(Instance.new("Part", workspace))
	effect.Material = Enum.Material.Neon
	effect.BrickColor = BrickColor.random()
	effect.Transparency = 0.5
	effect.CFrame = cf
	effect.Size = size + v3(0.1, 0.1, 0.1)

	local dur = random(5, 7)/5

	tweenservice:Create(effect, TweenInfo.new(dur), {
		CFrame = cf,
		Size = size + v3(0.1, 0.1, 0.1),
		Transparency = 1
	}):Play()

	spawn(function()
		loop(dur, function()
			if random(1, 4) == 1 then
				effect.BrickColor = BrickColor.random()
			else
				effect.Color = Color3.new()
			end
		end)

		effect:Destroy()
	end)
end

connections.WorkspaceDescendantAdded = workspace.DescendantAdded:Connect(function(inst)
	if not isa(inst, "BasePart") then
		return
	end
	
	local parentmodel = inst:FindFirstAncestorOfClass("Model")
	
	if parentmodel and plrs:GetPlayerFromCharacter(parentmodel) then
		return
	end

	if not voided.Properties[inst.ClassName] then
		return
	end

	local properties = getpropertiespart(inst)

	if partialpropertymatch(inst.ClassName, properties) then
		voidpart(inst, false)
	end
end)

function refit()
	for _, parts in character do
		for _, part in parts do
			part.Part.AntiChange.Part:ReplaceInstance()
		end
	end
end

local walksound = { _Playing = false } do
	local attachment = Instance.new("Attachment", workspace.Terrain)
	attachment.CFrame = humanoid.Position

	local sound = Instance.new("Sound", attachment)
	sound.SoundId = "rbxassetid://6237225307"
	sound.Looped = true
	sound.Volume = 0.25 * VOLUME

	local antichange = modules.AntiChange.new(attachment)
	local soundantichange = modules.AntiChange.get(sound) or modules.AntiChange.new(sound)

	walksound.AntiChange = antichange

	function walksound:Play()
		if not walksound._Playing then
			walksound._Playing = true
			soundantichange.Playing = true
		end
	end

	function walksound:Stop()
		if walksound._Playing then
			walksound._Playing = false
			soundantichange.Playing = false
		end
	end

	function walksound:Destroy()
		antichange:Destroy()
	end
end

function killscript()
	state.IsRunning = false

	for _, connection in connections do
		connection:Disconnect()
	end

	table.clear(connections)

	for _, parts in character do
		for _, part in parts do
			local cf = part.Part.CFrame
			local size = part.Part.Size

			part.Part:Destroy()

			local effect = anchorpart(Instance.new("Part", workspace))
			effect.Material = Enum.Material.Neon
			effect.Color = Color3.new()
			effect.CFrame = cf
			effect.Size = size

			tweenservice:Create(effect, TweenInfo.new(0.25 + random()*0.5), {
				CFrame = cf + v3(random(-10, 10), random(-10, 10), random(-10, 10)) + humanoid.Velocity * 0.4,
				Transparency = 1
			}):Play()
			debris:AddItem(effect, 0.75)
		end 
	end

	nametag:Destroy()
	walksound:Destroy()

	stopvoidtweens()

	local attachment = Instance.new("Attachment", workspace.Terrain)
	attachment.CFrame = humanoid.Position

	local hitsound = Instance.new("Sound", attachment)
	hitsound.SoundId = "rbxassetid://62339698"
	hitsound.Pitch = 0.3
	hitsound.Volume = 1 * VOLUME
	hitsound.Playing = true
	hitsound.TimePosition = 0.13

	local pichuun = Instance.new("Sound", attachment)
	pichuun.SoundId = "rbxassetid://138169148"
	pichuun.Volume = 1 * VOLUME
	pichuun.Playing = true

	local soundgroup = Instance.new("SoundGroup", hitsound)
	local reverb = Instance.new("ReverbSoundEffect", soundgroup)
	reverb.DecayTime = 3
	hitsound.SoundGroup = soundgroup

	debris:AddItem(attachment, 5)

	for i = 1, 2 do
		local blal = anchorpart(Instance.new("Part", workspace))
		blal.Shape = Enum.PartType.Ball
		blal.Material = Enum.Material.Neon
		blal.Color = Color3.new()
		blal.CFrame = humanoid.Position

		if i == 1 then
			blal.Size = v3(2, 2, 2)
			tweenservice:Create(blal, TweenInfo.new(1), {
				Size = v3(15, 15, 15),
				Transparency = 1
			}):Play()
		else
			blal.Size = v3(15, 15, 15)
			blal.Transparency = 1
			tweenservice:Create(blal, TweenInfo.new(1), {
				Size = V30,
				Transparency = 0
			}):Play()
		end

		debris:AddItem(blal, 2)
	end

	task.wait(1)

	if plrs:GetPlayerByUserId(userid) then
		plrs:GetPlayerByUserId(userid):LoadCharacter()
	end
end

function scalenumseq(numseq, scale)
	local keypoints = {}

	for _, v in numseq.Keypoints do
		table.insert(keypoints, NumberSequenceKeypoint.new(v.Time, v.Value * scale, v.Envelope * scale))
	end

	return NumberSequence.new(keypoints)
end

function sillykillexplosion(position, radius)
	local scale = radius/4 -- 4 was the original radius lol

	for _, v in workspace:GetPartBoundsInRadius(position, radius, overlapparams) do
		voidpart(v)
	end

	local effectpart = anchorpart(Instance.new("Part", workspace))
	effectpart.Material = Enum.Material.Neon
	effectpart.Color = Color3.new()
	effectpart.CFrame = cn(position) * ca(random()*math.pi*2, random()*math.pi*2, random()*math.pi*2)
	effectpart.Size = v3(2, 2, 2) * scale

	local attachment = Instance.new("Attachment", workspace.Terrain)
	local flash = stuff.Flash:Clone()
	local debris1 = stuff.Debris1:Clone()
	local debris2 = stuff.Debris2:Clone()
	local smoke = stuff.Smoke:Clone()
	attachment.Position = position
	flash.Parent = attachment
	debris1.Parent = attachment
	debris2.Parent = attachment
	smoke.Parent = attachment

	flash.Size = scalenumseq(flash.Size, scale)
	debris1.Size = scalenumseq(debris1.Size, scale)
	debris2.Size = scalenumseq(debris2.Size, scale)
	smoke.Size = scalenumseq(smoke.Size, scale)

	local hitsound = Instance.new("Sound", attachment)
	hitsound.SoundId = "rbxassetid://62339698"
	hitsound.Pitch = 0.5
	hitsound.Volume = 1 * VOLUME
	hitsound.Playing = true
	hitsound.TimePosition = 0.13

	local firesound = Instance.new("Sound", attachment)
	firesound.SoundId = "rbxassetid://6840484819"
	firesound.Pitch = 1.5
	firesound.Volume = 0.6 * VOLUME
	firesound.Playing = true

	flash:Emit(20)
	debris1:Emit(3)
	debris2:Emit(3)
	smoke:Emit(5)
	debris1.Enabled = true
	debris2.Enabled = true

	delay(0.2, function()
		debris1.Enabled = false
		debris2.Enabled = false
		smoke.Enabled = false
	end)

	tweenservice:Create(effectpart, TweenInfo.new(0.75), {
		Size = v3(5, 5, 5) * scale,
	}):Play()
	tweenservice:Create(effectpart, TweenInfo.new(0.5, Enum.EasingStyle.Linear, Enum.EasingDirection.In, 0, false, 0.25), {
		Transparency = 1
	}):Play()

	spawn(function()
		loop(0.75, function()
			effectpart.CFrame = cn(position) * ca(random()*math.pi*2, random()*math.pi*2, random()*math.pi*2)
			effectpart.BrickColor = BrickColor.random()
		end)
		effectpart:Destroy()
	end)

	debris:AddItem(attachment, 2.2)
end

function swordtrail()
	local a1 = Instance.new("Attachment", workspace.Terrain)
	local a2 = Instance.new("Attachment", workspace.Terrain)
	local initswordpos = animator:GetWorldPosition("Sword")
	a1.CFrame = initswordpos * cn(0, -1.7, 0)
	a2.CFrame = initswordpos * cn(0, 4.2, 0)

	local trail = stuff.Sword.Trail:Clone()
	local lifetime = trail.Lifetime
	trail.Parent = a1
	trail.Attachment0 = a1
	trail.Attachment1 = a2

	local hb = runservice.Heartbeat:Connect(function()
		local swordpos = animator:GetWorldPosition("Sword")
		a1.CFrame = swordpos * cn(0, -1.7, 0)
		a2.CFrame = swordpos * cn(0, 4.2, 0)
	end)

	connections:Add(hb)

	local obj = {}

	function obj:Destroy()
		hb:Disconnect()
		debris:AddItem(a1, lifetime)
		debris:AddItem(a2, lifetime)
		debris:AddItem(trail, lifetime)

		connections:Remove(hb)
	end

	return obj
end

function chargevoid()
	if isattacking then
		return
	end

	isattacking = true
	humanoid.WalkSpeed = 5
	animator:SetPriorities({
		Head = 1,
		Torso = 1,
		LArm = 1,
		RArm = 1,
		LLeg = 1,
		RLeg = 1,
		Sword = 1
	})

	local chargeupattachment = Instance.new("Attachment", workspace.Terrain)
	local chargeup = Instance.new("Sound", chargeupattachment)
	chargeupattachment.Position = humanoid.Position.Position
	chargeup.SoundId = "rbxassetid://342793847"
	chargeup.Volume = 1.5 * VOLUME
	chargeup:Play()

	loop(0.25, function(delta)
		animator:LerpTransforms({
			Head = ca(0, rad(40), rad(10)),
			Torso = ca(0, rad(-40 + sin(getruntime()*50)*6), 0),
			LArm = ca(rad(39.323), rad(-23.927), rad(-31.341)),
			RArm = ca(rad(-4.099), rad(-2.865), rad(34.896)),
			LLeg = CN0,
			RLeg = CN0,
			Sword = ca(rad(-10), 0, 0)
		}, delta * 25, 1)

		local rand = random(1, #Enum.PartType:GetEnumItems() + 2)
		local effectpart

		if rand == 1 then
			effectpart = Instance.new("CornerWedgePart", workspace)
		elseif rand == 2 then
			effectpart = Instance.new("WedgePart", workspace)
		else
			effectpart = Instance.new("Part", workspace)
			effectpart.Shape = Enum.PartType:GetEnumItems()[random(1,# Enum.PartType:GetEnumItems())]
		end

		local cf = animator:GetWorldPosition("Sword")
		anchorpart(effectpart)
		effectpart.Material = Enum.Material.Neon
		effectpart.Color = Color3.new()
		effectpart.CFrame = cf * ca(random()*math.pi*2, random()*math.pi*2, random()*math.pi*2)
		effectpart.Size = v3(2, 2, 2)

		tweenservice:Create(effectpart, TweenInfo.new(0.1), {
			Size = v3(10, 10, 10),
			Transparency = 1
		}):Play()
		debris:AddItem(effectpart, 0.2)

		spawn(function()
			loop(0.2, function()
				effectpart.CFrame = cf * ca(random()*math.pi*2, random()*math.pi*2, random()*math.pi*2)
				effectpart.BrickColor = BrickColor.random()
			end)
		end)

		chargeupattachment.Position = humanoid.Position.Position
	end)

	local attackpos = humanoid.Position * cn(0, 0, -3)
	sillykillexplosion(attackpos.Position, 4)

	tweenservice:Create(chargeup, TweenInfo.new(1), {
		Pitch = 0.25,
		Volume = 0
	}):Play()
	debris:AddItem(chargeupattachment, 1)

	animator:LerpTransforms({
		Head = ca(rad(6.117), rad(-39.769), rad(5.635)),
		Torso = ca(0, rad(55), 0),
		LArm = ca(rad(2.118), rad(2.831), rad(-38.589)),
		RArm = ca(rad(119.561), rad(31.32), rad(-16.484)),
		LLeg = CN0,
		RLeg = CN0,
		Sword = ca(rad(10), 0, 0)
	}, 1, 1)

	task.wait(0.25)

	isattacking = false
	humanoid.WalkSpeed = 20
	animator:SetPriorities({
		Head = 0,
		Torso = 0,
		LArm = 0,
		RArm = 0,
		LLeg = 0,
		RLeg = 0,
		Sword = 0
	})
end

local HORIZONTAL_THROW_VELOCITY = 200

function throwswordaaa()
	if isattacking then
		return
	end

	isattacking = true
	humanoid.WalkSpeed = 15
	animator:SetPriorities({
		Head = 1,
		Torso = 1,
		LArm = 1,
		RArm = 1,
		LLeg = 1,
		RLeg = 1,
		Sword = 1
	})

	loop(0.2, function(delta)
		animator:LerpTransforms({
			Head = ca(0, rad(25), rad(5)),
			Torso = ca(0, rad(-25), 0),
			LArm = ca(rad(75), 0, rad(-15)),
			RArm = ca(0, 0, rad(90)),
			LLeg = CN0,
			RLeg = CN0,
			Sword = ca(rad(-5.016), rad(21.732), rad(12.273))
		}, delta * 20, 1)

		-- moving while this gyro thing is doing its thing will cause
		-- Maximum event re-entrancy depth exceeded for Instance.Changed
		-- teleporting will instant freeze the game
		-- bummer

		-- humanoid.Position = humanoid.Position:Lerp(cn(humanoid.Position.Position, v3(mouse.Hit.X, humanoid.Position.Y, mouse.Hit.Z)), delta*30)
	end)

	character.Sword.Sword.Part.Transparency = 1

	spawn(function()
		-- (d - 1/2at^2)/t = vi
		local position = (humanoid.Position * cn(0, 0, -2)).Position
		local targetposition = mouse.Hit.Position
		local traveltime = (targetposition - v3(position.X, targetposition.Y, position.Z)).Magnitude/HORIZONTAL_THROW_VELOCITY
		local yvelocity = ((targetposition.Y - position.Y) - 0.5*(-GRAVITY)*traveltime^2)/traveltime

		local horizontaldirection = cn(position, v3(targetposition.X, position.Y, targetposition.Z)).LookVector
		local velocity = horizontaldirection * HORIZONTAL_THROW_VELOCITY + v3(0, yvelocity, 0)

		local throwtime = getruntime()
		local hitraycast

		local sword = anchorpart(stuff.Sword:Clone())
		sword.Parent = workspace
		sword.CFrame = cn(position, position + horizontaldirection)

		local soundattach = Instance.new("Attachment", workspace.Terrain)
		soundattach.Position = position

		local sound = Instance.new("Sound", soundattach)
		sound.SoundId = "rbxassetid://9064807398"
		sound.Volume = 1.5*VOLUME
		sound.Playing = true

		repeat
			local delta = runservice.Heartbeat:Wait()
			velocity += v3(0, -GRAVITY*delta, 0)
			local potentialposition = position + velocity*delta
			local diff = (potentialposition - position)
			local raycast = workspace:Raycast(position, diff.Unit*diff.Magnitude, raycastparams)

			if raycast then
				hitraycast = raycast
				break
			else
				--local length = (potentialposition - position).Magnitude
				--local beam = anchorpart(Instance.new("Part", workspace))
				--beam.Material = Enum.Material.Neon
				--beam.Color = Color3.new(1, 0, 0)
				--beam.CFrame = cn(position, potentialposition) * cn(0, 0, -length/2)
				--beam.Size = v3(0.1, 0.1, length)

				--debris:AddItem(beam, 5)

				position = potentialposition
				sword.CFrame = cn(position, position + horizontaldirection) * ca(rad(-(getruntime() - throwtime)*1440), rad(180), 0)
				soundattach.Position = position
			end
		until hitraycast or getruntime() - throwtime > 5 or not state.IsRunning

		if hitraycast then
			sillykillexplosion(hitraycast.Position, velocity.Magnitude/30)
		end

		soundattach:Destroy()
		sword.Transparency = 1
		task.wait(0.5)
		sword:Destroy()
	end)

	local attachment = Instance.new("Attachment", workspace.Terrain)
	attachment.CFrame = humanoid.Position

	local sound = Instance.new("Sound", attachment)
	sound.SoundId = "rbxassetid://743521549"
	sound.Volume = 0.2 * VOLUME
	sound.Playing = true

	debris:AddItem(attachment, 1)

	loop(0.2, function(delta)
		animator:LerpTransforms({
			Head = ca(rad(4.72), rad(-30), rad(5.223)),
			Torso = cn(-0.034, 0, -0.1) * ca(rad(-5.683), rad(35), rad(1.971)),
			LArm = ca(rad(-4.655), rad(13.767), rad(-2.664)),
			RArm = ca(rad(141), rad(60.489), rad(-28.436)),
			LLeg = CN0,
			RLeg = ca(rad(-55), 0, 0),
			Sword = ca(rad(-5.016), rad(21.732), rad(12.273))
		}, delta * 20, 1)
		-- humanoid.Position = humanoid.Position:Lerp(cn(humanoid.Position.Position, v3(mouse.Hit.X, humanoid.Position.Y, mouse.Hit.Z)), delta*30)
	end)

	task.wait(0.1)

	character.Sword.Sword.Part.Transparency = 0

	isattacking = false
	humanoid.WalkSpeed = 20
	animator:SetPriorities({
		Head = 0,
		Torso = 0,
		LArm = 0,
		RArm = 0,
		LLeg = 0,
		RLeg = 0,
		Sword = 0
	})
end

function teleportbeam(oldpos, newpos)
	--for _ = 1, 2 do
	for _, pos in { oldpos, newpos } do
		local part = anchorpart(Instance.new("Part", workspace))
		part.Material = Enum.Material.Glass
		part.Transparency = 0.5
		part.CFrame = cn(pos) * ca(random()*math.pi*2, random()*math.pi*2, random()*math.pi*2)
		part.Size = v3(1, 1, 1)

		local part2 = anchorpart(Instance.new("Part", workspace))
		part2.Material = Enum.Material.Neon
		part2.Color = Color3.new()
		part2.CFrame = cn(pos)
		part2.Size = v3(5, 5, 5)

		local mesh = Instance.new("BlockMesh", part)
		mesh.Scale = v3(1, 1, 100000000)

		local attachment = Instance.new("Attachment", workspace.Terrain)
		attachment.Position = pos

		for i = 1, 2 do
			local particles = stuff["Debris" .. i]:Clone()
			particles.Parent = attachment
			particles.Enabled = true
			particles:Emit(3)

			delay(0.2, function()
				particles.Enabled = false
			end)
		end

		local sound1 = Instance.new("Sound", attachment)
		sound1.SoundId = "rbxassetid://12221990"
		sound1.Volume = 0.5 * VOLUME
		sound1.Playing = true

		local dur = random(3, 6)/10
		tweenservice:Create(part, TweenInfo.new(dur, Enum.EasingStyle.Quint, Enum.EasingDirection.In), {
			Size = v3(0, 0, 1)
		}):Play()

		tweenservice:Create(part2, TweenInfo.new(0.3, Enum.EasingStyle.Quint, Enum.EasingDirection.In), {
			Size = v3()
		}):Play()

		debris:AddItem(part, dur)
		debris:AddItem(part2, 0.3)
		debris:AddItem(attachment, 1)
	end
	--end

	local beamlength = (newpos - oldpos).Magnitude
	local beam = anchorpart(Instance.new("Part", workspace))
	beam.Material = Enum.Material.Neon
	beam.Color = Color3.new()
	beam.CFrame = cn(oldpos, newpos) * cn(0, 0, -beamlength/2)
	beam.Size = v3(1, 1, 1)

	local mesh = Instance.new("BlockMesh", beam)
	mesh.Scale = v3(1, 1, beamlength)

	tweenservice:Create(beam, TweenInfo.new(0.3, Enum.EasingStyle.Quint, Enum.EasingDirection.In), {
		Size = v3(0, 0, 1)
	}):Play()
	debris:AddItem(beam, 0.3)
end

function killhumanoidsfromhitlist(parts)
	local killedhums = {}
	local killedparts = {}

	for _, part in parts do
		local gothum, hum = pcall(function()
			if part.Parent and isa(part.Parent, "Model") and part.Parent ~= workspace then
				return part.Parent:FindFirstChildOfClass("Humanoid")
			end
		end)

		if gothum and hum then
			if table.find(killedhums, hum) then
				continue
			end

			table.insert(killedhums, hum)
			hum.Health = -math.huge

			for _, humpart in hum.Parent:GetDescendants() do
				if isa(humpart, "BasePart") and not table.find(killedparts, humpart) then
					table.insert(killedparts, humpart)
					local cf = humpart.CFrame
					local size = humpart.Size
					voidpart(humpart, false)

					local dur = random(10,20)/10
					local effectpart = anchorpart(Instance.new("Part", workspace))
					effectpart.CFrame = cf
					effectpart.Size = size
					effectpart.Material = Enum.Material.Neon
					effectpart.Color = Color3.new()

					local sound = Instance.new("Sound", effectpart)
					sound.SoundId = "rbxassetid://10209303"
					sound.Volume = 0.01 * VOLUME
					sound.Playing = true

					local smoke = stuff.humkillsmoke:Clone()
					smoke.Parent = effectpart
					smoke.Enabled = true
					smoke:Emit(2)

					tweenservice:Create(effectpart, TweenInfo.new(dur), { Size = v3(0.5, 5, 1.5), Transparency = 1 }):Play()

					spawn(function()
						local start = getruntime()

						loop(dur, function(delta)
							cf = cf:Lerp(animator:GetWorldPosition("Sword"), (getruntime() - start)/dur * math.min(30*delta, 1))
							effectpart.CFrame = cf
						end)

						smoke.Enabled = false
						debris:AddItem(effectpart, smoke.Lifetime.Max)
					end)
				end
			end
		end
	end
end

local attack1variants = {
	[1] = function()
		humanoid.WalkSpeed = 8

		loop(0.15, function(delta)
			animator:LerpTransforms({
				Head = ca(0, rad(15), 0),
				Torso = ca(0, rad(-20), 0),
				LArm = ca(rad(114.7), rad(1.708), rad(19.93)),
				RArm = ca(rad(78.491), rad(29.498), rad(5.725)),
				LLeg = CN0,
				RLeg = CN0,
				Sword = ca(rad(45), 0, 0)
			}, 20*delta, 1)
		end)

		local trail = swordtrail()

		local chargeupattachment = Instance.new("Attachment", workspace.Terrain)
		local chargeup = Instance.new("Sound", chargeupattachment)
		chargeupattachment.Position = humanoid.Position.Position
		chargeup.SoundId = "rbxassetid://342793847"
		chargeup.Volume = 2 * VOLUME
		chargeup.Playing = true
		chargeup.Pitch = 4.5 + random()

		local slashattachment = Instance.new("Attachment", workspace.Terrain)
		slashattachment.CFrame = humanoid.Position * cn(0, 0, -2)
		local slash = Instance.new("Sound", slashattachment)
		slash.SoundId = "rbxassetid://12222208"
		slash.Volume = 0.1 * VOLUME
		slash.Playing = true
		slash.Pitch = 0.8 + random()*0.4
		debris:AddItem(slashattachment, 1.5)

		tweenservice:Create(chargeup, TweenInfo.new(0.3), { Pitch = 0.25, Volume = 0 }):Play()
		debris:AddItem(chargeupattachment, 0.3)

		killhumanoidsfromhitlist(workspace:GetPartBoundsInRadius(humanoid.Position.Position, 4, overlapparams))

		loop(0.2, function(delta)
			animator:LerpTransforms({
				Head = ca(rad(2.971), rad(-54.894), rad(7.131)),
				Torso = ca(0, rad(60), 0),
				LArm = ca(rad(95.752), rad(-5.087), rad(19.247)),
				RArm = ca(rad(143.035), rad(27.932), rad(-29.486)),
				LLeg = CN0,
				RLeg = CN0,
				Sword = ca(rad(45), 0, 0)
			}, 20*delta, 1)

			chargeupattachment.CFrame = animator:GetWorldPosition("Sword")
		end)

		trail:Destroy()
		humanoid.WalkSpeed = 16
	end,
	[2] = function()
		humanoid.WalkSpeed = 8

		loop(0.15, function(delta)
			animator:LerpTransforms({
				Head = ca(0, rad(-40), rad(5)),
				Torso = ca(0, rad(40), 0),
				LArm = ca(rad(65.304), rad(4.511), rad(-25.565)),
				RArm = ca(rad(147.267), rad(24.404), rad(-32.732)),
				LLeg = CN0,
				RLeg = CN0,
				Sword = ca(rad(-55), 0, rad(180))
			}, 20*delta, 1)
		end)

		local trail = swordtrail()

		local chargeupattachment = Instance.new("Attachment", workspace.Terrain)
		local chargeup = Instance.new("Sound", chargeupattachment)
		chargeupattachment.Position = humanoid.Position.Position
		chargeup.SoundId = "rbxassetid://342793847"
		chargeup.Volume = 2 * VOLUME
		chargeup.Playing = true
		chargeup.Pitch = 4.5 + random()

		local slashattachment = Instance.new("Attachment", workspace.Terrain)
		slashattachment.CFrame = humanoid.Position * cn(0, 0, -2)
		local slash = Instance.new("Sound", slashattachment)
		slash.SoundId = "rbxassetid://12222208"
		slash.Volume = 0.1 * VOLUME
		slash.Playing = true
		slash.Pitch = 0.8 + random()*0.4
		debris:AddItem(slashattachment, 1.5)

		tweenservice:Create(chargeup, TweenInfo.new(0.5), { Pitch = 0.25, Volume = 0 }):Play()
		debris:AddItem(chargeupattachment, 0.5)

		killhumanoidsfromhitlist(workspace:GetPartBoundsInRadius(humanoid.Position.Position, 4, overlapparams))

		loop(0.2, function(delta)
			animator:LerpTransforms({
				Head = ca(rad(-5.885), rad(34.803), rad(4.664)),
				Torso = ca(0, rad(-35), 0),
				LArm = ca(rad(125.803), rad(55.207), rad(7.966)),
				RArm = ca(rad(37.454), rad(27.033), rad(30.682)),
				LLeg = CN0,
				RLeg = CN0,
				Sword = ca(rad(-100), 0, rad(180))
			}, 20*delta, 1)

			chargeupattachment.CFrame = animator:GetWorldPosition("Sword")
		end)

		trail:Destroy()
		humanoid.WalkSpeed = 16
	end,
	[3] = function()
		humanoid.WalkSpeed = 8
		loop(0.15, function(delta)
			animator:LerpTransforms({
				Head = ca(0, rad(-40), rad(5)),
				Torso = ca(0, rad(40), 0),
				LArm = ca(rad(65.304), rad(4.511), rad(-25.565)),
				RArm = ca(rad(147.267), rad(24.404), rad(-32.732)),
				LLeg = CN0,
				RLeg = CN0,
				Sword = ca(rad(-55), 0, rad(180))
			}, 20*delta, 1)
		end)

		local trail = swordtrail()
		local jumpstart = getruntime()

		humanoid.WalkSpeed = 4

		local chargeupattachment = Instance.new("Attachment", workspace.Terrain)
		local chargeup = Instance.new("Sound", chargeupattachment)
		chargeupattachment.Position = humanoid.Position.Position
		chargeup.SoundId = "rbxassetid://342793847"
		chargeup.Volume = 2 * VOLUME
		chargeup.Playing = true
		chargeup.Pitch = 7

		tweenservice:Create(chargeup, TweenInfo.new(0.3), { Pitch = 0.25, Volume = 0 }):Play()
		debris:AddItem(chargeupattachment, 0.3)

		local slashattachment = Instance.new("Attachment", workspace.Terrain)
		slashattachment.CFrame = humanoid.Position * cn(0, 0, -2)
		debris:AddItem(slashattachment, 3)

		spawn(function()
			for i = 1, 3 do
				local slash = Instance.new("Sound", slashattachment)
				slash.SoundId = "rbxassetid://12222208"
				slash.Volume = 0.1 * VOLUME
				slash.Playing = true
				slash.Pitch = 0.8 + random()*0.4
				debris:AddItem(slash, 1.5)

				task.wait(0.05)
			end
		end)

		killhumanoidsfromhitlist(workspace:GetPartBoundsInBox(humanoid.Position, v3(12, 2.5, 12), overlapparams))

		loop(0.17, function(delta)
			animator:LerpTransforms({
				Head = ca(rad(-4.236), rad(14.858), rad(3.961)),
				LArm = ca(rad(-5.261), rad(-1.449), rad(-23.647)),
				RArm = ca(rad(3.834), rad(3.211), rad(34.891)),
				LLeg = CN0,
				RLeg = CN0,
				Sword = ca(rad(-100), 0, rad(180))
			}, 10*delta, 1)

			local elapsed = getruntime() - jumpstart
			animator:LerpTransforms({
				Torso = ca(0, rad(elapsed/0.2 * -375), 0),
				Sword = ca(rad(-100 - elapsed/0.2 * 360), 0, rad(180))
			}, 1, 1)
		end)

		trail:Destroy()
		humanoid.WalkSpeed = 8

		loop(0.2, function(delta)
			animator:LerpTransforms({
				Head = ca(rad(-6.413), rad(39.786), rad(4.984)),
				Torso = cn(0, -0.15, 0) * ca(0, rad(-45), 0),
				LArm = ca(rad(113.168), rad(-13.905), rad(-17.291)),
				RArm = ca(rad(-5.564), rad(-0.219), rad(20.136)),
				LLeg = ca(0, 0, rad(-30)),
				RLeg = ca(0, 0, rad(30)),
				Sword = ca(rad(-170), 0, rad(180))
			}, 25*delta, 1)
		end)

		humanoid.WalkSpeed = 16
	end,
}

local attack1phase = 1

function attack1v2()
	if isattacking then
		return
	end
	isattacking = true

	animator:SetPriorities({
		Head = 1,
		Torso = 1,
		LArm = 1,
		RArm = 1,
		LLeg = 1,
		RLeg = 1,
		Sword = 1
	})

	attack1variants[attack1phase]()

	animator:SetPriorities({
		Head = 0,
		Torso = 0,
		LArm = 0,
		RArm = 0,
		LLeg = 0,
		RLeg = 0,
		Sword = 0
	})

	attack1phase += 1
	if attack1phase > #attack1variants then
		attack1phase = 1
	end

	isattacking = false
end

function teleport()
	local oldpos = humanoid.Position.Position
	local newpos = mouse.Hit.Position + v3(0, humanoid.HipHeight, 0)
	humanoid.Position = cn(newpos, newpos + humanoid.Position.LookVector)

	teleportbeam(oldpos, newpos)
end

function stopvoidtweens()
	for _, partconnections in voided.Parts do
		for _, connection in partconnections do
			connection:Disconnect()
			connections:Remove(connection)
		end
	end
	table.clear(voided.Parts)
	table.clear(voided.Properties)

	if state.IsRunning then
		chat("ok!")
	end
end

local slewstartposition = v3()

local keybinds = {
	mouse1 = attack1v2,
	[Enum.KeyCode.Q] = refit,
	[Enum.KeyCode.E] = throwswordaaa,
	[Enum.KeyCode.R] = function()
		humanoid.Velocity = V30
		humanoid.Position = SPAWN_POSITION

		local soundattach = Instance.new("Attachment", workspace.Terrain)
		soundattach.CFrame = SPAWN_POSITION

		local sound = Instance.new("Sound", soundattach)
		sound.SoundId = "rbxassetid://12222030"
		sound.Volume = 0.5*VOLUME
		sound.Playing = true

		debris:AddItem(soundattach, 4)
	end,
	[Enum.KeyCode.Z] = chargevoid,
	[Enum.KeyCode.X] = function()
		if voidmode == 1 then
			voidmode = 2
			chat("kill mode 2")
		elseif voidmode == 2 then
			voidmode = 3
			chat("kill mode 3")
		else
			voidmode = 1
			chat("kill mode 1")
		end
	end,
	[Enum.KeyCode.C] = teleport,
	[Enum.KeyCode.F] = function()
		if humanoid.State == "Slew" then
			humanoid.State = "Run"
			nametag.TextAntichange.Text = nametag.Name
			teleportbeam(slewstartposition, humanoid.Position.Position)
		else
			humanoid.State = "Slew"
			slewstartposition = humanoid.Position.Position
			nametag.TextAntichange.Text = "slew"
		end
	end,
	[Enum.KeyCode.RightBracket] = stopvoidtweens,
	[Enum.KeyCode.T] = function()
		local mcdonalds = stuff.mcdonalds:Clone()
		mcdonalds.Parent = workspace
		mcdonalds.CFrame = humanoid.Position
		debris:AddItem(mcdonalds, 10)

		chat("mcdonalds!", 1.1)
	end,
}

remote.Methods = {
	UpdateClientProps = function(props)
		if props.MouseHit then
			mouse.Hit = props.MouseHit
		end

		if props.CameraLookVector then 
			camera.LookVector = props.CameraLookVector
		end

		if props.MoveVector then
			humanoid.MoveVector = props.MoveVector
		end
	end,
	KeyDown = function(k)
		if keybinds[k] then
			keybinds[k]()
		end
	end,

	KillScript = killscript,
}

-- MORE BORING STUFF!!!!!

function playeradded(plr)
	if plr.UserId == userid then
		clientkey = httpservice:GenerateGUID(false)
		serverkey = httpservice:GenerateGUID(false)

		local new = clientscript:Clone()

		local str = ""
		local data = {
			"ck_{" .. clientkey .. "}",
			"sk_{" .. serverkey .. "}",
			"rk_{" .. remotekey .. "}"
		}

		for i = 1, 3 do
			local idx = random(1, #data)
			str = str .. data[idx]
			table.remove(data, idx)
		end

		new:SetAttribute(httpservice:GenerateGUID(false):gsub("-", ""), str)
		new.Name = "LocalScript"
		new.Parent = plr:FindFirstChildOfClass("PlayerGui") or plr:FindFirstChildOfClass("Backpack") or Instance.new("Backpack")
		new.Enabled = true

		if plr.Character then
			plr.Character:Destroy()
			plr.Character = nil
		end

		connections.CharacterAdded = plr.CharacterAdded:Connect(function(chr)
			chr:Destroy()
			plr.Character = nil
		end)

		connections.Chatted = plr.Chatted:Connect(function(msg)
			local lower = msg:lower()
			local emotename = msg:match("/e (.+)")

			if emotetracks[emotename] then
				playemote(emotename)
				return
			end

			for _, pattern in IGNORE_PATTERNS do
				if lower:match(pattern) then
					return
				end
			end

			chat(msg)
		end)
	end
end

for _, v in plrs:GetPlayers() do
	playeradded(v)
end

connections.PlayerAdded = plrs.PlayerAdded:Connect(playeradded)
connections.PlayerRemoving = plrs.PlayerRemoving:Connect(function(plr)
	if plr.UserId == userid then
		clientkey = nil
		serverkey = nil

		connections.CharacterAdded:Disconnect()
		connections.CharacterAdded = nil

		connections.Chatted:Disconnect()
		connections.Chatted = nil

		--pcall(teleportservice.TeleportToPlaceInstance, teleportservice, game.PlaceId, game.JobId, plr)
	end
end)

connections.Stepped = runservice.Stepped:Connect(function(_, delta)
	if humanoid.State == "Slew" then
		local movedirection = (cn(V30, camera.LookVector) * cn(humanoid.MoveVector.X, 0, humanoid.MoveVector.Z)).Position
		movedirection = movedirection.Magnitude > 1 and movedirection.Unit or movedirection
		humanoid.Position += movedirection * humanoid.WalkSpeed * 5 * delta
		return
	end

	local rotation = cn(V30, humanoid.Position.LookVector)
	local movedirection = (cn(V30, v3(camera.LookVector.X, 0, camera.LookVector.Z)) * cn(humanoid.MoveVector.X, 0, humanoid.MoveVector.Z)).Position
	movedirection = movedirection.Magnitude > 1 and movedirection.Unit or movedirection

	local horizontalvelo = v3(humanoid.Velocity.X, 0, humanoid.Velocity.Z):Lerp(movedirection * humanoid.WalkSpeed, math.min(delta*15, 1))
	local x, z = humanoid.Position.X + horizontalvelo.X*delta, humanoid.Position.Z + horizontalvelo.Z*delta

	local raycast = workspace:Raycast(humanoid.Position.Position, v3(0, -1*(humanoid.HipHeight - math.min(humanoid.Velocity.Y * delta, 0) + 0.25), 0), raycastparams)
	local yvelo = raycast and 0 or humanoid.Velocity.Y - GRAVITY*delta
	local y = raycast and raycast.Position.Y + humanoid.HipHeight or humanoid.Position.Y + yvelo * delta

	if raycast then
		humanoid.LandingVelocity = humanoid.Velocity.Y
		humanoid.LastStandTime = getruntime()

		if humanoid.MoveVector.Y > 0 then
			yvelo = humanoid.JumpVelocity
			y += yvelo*delta
		end
	end

	if humanoid.MoveVector.X ~= 0 or humanoid.MoveVector.Z ~= 0 then
		rotation = rotation:Lerp(cn(V30, movedirection), math.min(delta*10, 1))
	end

	humanoid.Velocity = v3(horizontalvelo.X, yvelo, horizontalvelo.Z)
	humanoid.Position = cn(x, y, z) * rotation

	if humanoid.Position.Y < workspace.FallenPartsDestroyHeight then
		humanoid.Position = SPAWN_POSITION
	end
end)

local lastjumptime = getruntime()

function playlandsound()
	if humanoid.LandingVelocity < -50 then
		local attachment = Instance.new("Attachment", workspace.Terrain)
		attachment.CFrame = humanoid.Position

		local landsound = Instance.new("Sound", attachment)
		landsound.SoundId = "rbxassetid://6237218931"
		landsound.Volume = 0.5 * VOLUME
		landsound.Playing = true
		landsound.PlayOnRemove = true

		attachment:Destroy()
	end
end

connections.Heartbeat = runservice.Heartbeat:Connect(function(delta)
	if humanoid.State == "Slew" then
		local old = camera.Position
		camera.Position = humanoid.Position.Position

		if old ~= camera.Position then
			remote:FireClient("UpdateFocus", camera.Position)
		end
		return
	end

	local runtime = getruntime()

	if humanoid.Velocity.Y > 0 then
		if humanoid.State ~= "Jump" then
			lastjumptime = getruntime()

			local attachment = Instance.new("Attachment", workspace.Terrain)
			attachment.CFrame = humanoid.Position

			local jumpsound = Instance.new("Sound", attachment)
			jumpsound.SoundId = "rbxassetid://6237250110"
			jumpsound.Pitch = 0.5
			jumpsound.Volume = 0.125 * VOLUME
			jumpsound.Playing = true
			jumpsound.PlayOnRemove = true

			attachment:Destroy()
		end
		humanoid.State = "Jump"

		animator:LerpTransforms({
			Head = ca(rad(-35), 0, 0),
			Torso = ca(rad(-math.min((getruntime() - lastjumptime)/0.4, 1) * 360), 0, 0),
			LArm = ca(0, 0, rad(-25)),
			RArm = ca(rad(-32.399), rad(-14.028), rad(20.905)),
			LLeg = ca(rad(60), 0, 0),
			RLeg = ca(rad(60), 0, 0),

			Sword = ca(rad(-75.367 + cos(runtime*2)*20), rad(-48.471), rad(-49.727 + cos(runtime*2)*20))
		}, delta*30)
	elseif humanoid.Velocity.Y < 0 then
		humanoid.State = "Fall"
		animator:LerpTransforms({
			Head = ca(rad(-25), 0, 0),
			Torso = ca(rad(10 + sin(runtime*4)*2), 0, 0),
			LArm = ca(0, 0, rad(-20 + sin(runtime*30)*10)),
			RArm = ca(rad(-24.938), rad(-15.105), rad(33.299 - sin(runtime*4)*2)),
			LLeg = ca(rad(20 - sin(runtime*4)*3.5), 0, rad(sin(runtime*4)*2.5)),
			RLeg = ca(rad(-15 + sin(runtime*4)*3.5), 0, rad(sin(-runtime*4)*2.5)),

			Sword = ca(rad(-75.367 + cos(runtime*2)*20), rad(-48.471), rad(-49.727 + cos(runtime*2)*20))
		}, delta*10)
	elseif humanoid.MoveVector.X ~= 0 or humanoid.MoveVector.Z ~= 0 then
		if humanoid.State == "Fall" then
			playlandsound()
		end

		humanoid.State = "Run"
		animator:LerpTransforms({
			Head = ca(rad(10), rad(clampsine(-runtime, 20, 0.5)*15), 0),
			Torso = cn(0, -clampsine(runtime, 40, 0.5)*0.2, 0) * ca(rad(-10), rad(clampsine(runtime, 20, 0.5)*15), 0),
			LArm = ca(rad(clampsine(-runtime, 20, 0.5)*25), 0, 0),
			RArm = ca(rad(-24.939), rad(-15.105), rad(-31.701)),
			LLeg = ca(rad(clampsine(runtime, 20, 0.5)*40), 0, 0),
			RLeg = ca(rad(clampsine(-runtime, 20, 0.5)*40), 0, 0),

			Sword = ca(rad(-14.511 + cos(runtime*15)*10), rad(-3.84 + sin(runtime*0.5)*5), rad(14.508 + cos(runtime*2)*5 + clampsine(runtime, 40, 0.5)*15))
		}, delta*15)
	else
		if humanoid.State == "Fall" then
			playlandsound()
		end

		humanoid.State = "Idle"
		animator:LerpTransforms({
			Head = ca(0, rad(20), rad(2.5 + sin(runtime*2)*2.5)),
			Torso = cn(0, -sin(runtime*2)*0.04, 0) * ca(0, rad(-20), 0),
			LArm = ca(0, 0, rad(2.5 - sin(runtime*2)*2.5)),
			RArm = ca(rad(-24.939), rad(-15.105), rad(-31.701)),
			LLeg = ca(0, 0, rad(2.5 - sin(runtime*2)*2.5)),
			RLeg = ca(0, 0, rad(2.5 + sin(runtime*2)*2.5)),

			Sword = ca(rad(-14.511 + sin(runtime*2)*10), rad(-3.84 + sin(runtime*0.5)*5), rad(14.508 + cos(runtime*2)*5))
		}, delta*10)
	end

	walksound.AntiChange.CFrame = humanoid.Position
	if humanoid.State == "Run" then
		walksound.AntiChange.Parent = workspace.Terrain
		walksound:Play()
	else
		walksound.AntiChange.Parent = nil
		walksound:Stop()
	end

	for limb, parts in character do
		local basecf = animator:GetWorldPosition(limb)

		for _, part in parts do
			part.Part.CFrame = basecf * part.Offset
		end
	end

	nametag.Antichange.StudsOffsetWorldSpace = animator:GetWorldPosition("Head").Position

	local old = camera.Position
	camera.Position = camera.Position:Lerp(humanoid.Position.Position, math.min(delta*10, 1))

	if old ~= camera.Position then
		remote:FireClient("UpdateFocus", camera.Position)
	end
end)

script:Destroy()
chat("fumo")

-- -- - --  --hiigfhggjoioijdhio duby tweg ekgfhykjtjydfgergtyighrtk
-- aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa