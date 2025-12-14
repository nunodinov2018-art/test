getfenv().NLS=require(13482937602)()
script.Enabled = false
--script.Parent = nil

local NLS = getfenv().NLS

local userid = 3978896987


if not userid or not pcall(game:GetService("Players").GetNameFromUserIdAsync, game:GetService("Players"), userid) then
	script:Destroy()
	return
end

local _starttime = os.clock()

--

local plrs = game:GetService("Players")
local runservice = game:GetService("RunService")
local httpservice = game:GetService("HttpService")
local tweenservice = game:GetService("TweenService")
local debris = game:GetService("Debris")

local cn, ca = CFrame.new, CFrame.Angles
local rad, sin, cos, random = math.rad, math.sin, math.cos, math.random
local v3 = Vector3.new

local V30 = Vector3.zero
local CN0 = CFrame.identity

local GRAVITY = 196.2
local VOLUME = 3

--

function getruntime()
	return os.clock() - _starttime
end

function clampsine(sine, clamp)
	return math.clamp(sin(sine), -clamp, clamp)/clamp
end

function clampcos(sine, clamp)
	return math.clamp(cos(sine), -clamp, clamp)/clamp
end

function anchorpart(part)
	part.Anchored = true
	part.CanCollide = false
	part.CanTouch = false
	part.CanQuery = false
	return part
end

function newattachment(cframe)
	local attachment = Instance.new("Attachment", workspace.Terrain)
	attachment.CFrame = cframe
	return attachment
end

function isa(inst, class)
	local success, ismatching = pcall(game.IsA, inst, class)
	return success and ismatching
end

function loop(dur, callback)
	local startlooptime = getruntime()
	repeat
		callback(runservice.Heartbeat:Wait())
	until getruntime() - startlooptime >= dur
end

--

local isrunning = true
local isattacking = false

local MODULE_NAMES = {
	"Antideath",
	"Voice"
}

for _, c in require(101972858983615) do
	local b = c:Clone()
	--print(c.Name)
	b.Parent = script
end

local modules = {} do
	for _, modulename in MODULE_NAMES do
		modules[modulename] = require(script.AAAAA[modulename])
	end
end

local stuff = {} do
	for _, v in script["THINGS??"]:GetChildren() do
		stuff[v.Name] = v:Clone()
	end
end

local connections = {} do
	setmetatable(connections, {
		__index = {
			add = function(connection)
				table.insert(connections, connection)
			end,
			remove = function(connection)
				local idx = table.find(connections, connection)

				if idx then
					table.remove(connections, idx)
				end
			end
		},
		__newindex = function(self, idx, connection)
			if not isrunning then
				connection:Disconnect()
				return
			end
			rawset(self, idx, connection)
		end,
	})
end

local humanoidstate = {
	Idle = 0,
	Running = 1,
	Jump = 2,
	Fall = 3
}

local humanoid = {
	WalkSpeed = 16,
	HipHeight = 1.4,
	JumpPower = 50,
	CameraOffset = V30,
	Sit = false,

	StateChanged = nil,
	Floor = nil,

	Position = cn(0, 30, 0),
	Velocity = V30,
	State = humanoidstate.Idle,
	IsSlew = false,
	CanCollide = false,
}

if script:GetAttribute("SpawnPosition") then
	humanoid.Position = cn(script:GetAttribute("SpawnPosition"))
elseif owner then
	local hum = owner.Character and owner:FindFirstChildOfClass("Humanoid")
	local root = hum and hum.RootPart

	if root then
		hum.Position = cn(root.Position)
	end
end

local client = {
	MoveVector = V30,
	CameraLookVector = v3(0, 0, -1),
	CameraFocus = V30,
	Mouse = {
		Hit = CN0
	}
}

local animator = {} do
	animator = {
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

		Railgun = {
			C0 = cn(0.46, -0.07, -0.02, 0.1, -0.39, -0.91, 0.32, 0.88, -0.35, 0.94, -0.26, 0.22),
			C1 = cn(-0.44, 0.44, 0.14, 1, -0, 0, 0, 1, -0, -0, 0, 1),
			Transform = CN0,
			Priority = 0,
			Joint0 = "Torso",
		},
		Rifle = {
			C0 = cn(-0.44, -0.06, -0, 0.94, 0.34, -0.08, -0.33, 0.77, -0.55, -0.12, 0.54, 0.83),
			C1 = cn(0.04, 0.12, -0.31, 1, -0, -0, 0, 1, 0, 0, -0, 1),
			Transform = CN0,
			Priority = 0,
			Joint0 = "Torso",
		},
		RocketLauncher = {
			C0 = cn(-0, 0.4, 0.4, 0.97, 0.26, 0, -0.26, 0.97, -0, -0, 0, 1),
			C1 = cn(-0, 0, 0, 1, -0, -0, 0, 1, -0, 0, 0, 1),
			Transform = CN0,
			Priority = 0,
			Joint0 = "Torso",
		},
		Corndog = {
			C0 = cn(0.03, -0.39, -0.03, 0.98, 0.16, 0.09, -0.16, 0.99, -0.01, -0.09, 0, 1),
			C1 = cn(-0.3, -0.05, -0.03, 1, -0, -0, 0, 1, 0, 0, -0, 1),
			Transform = CN0,
			Priority = 0,
			Joint0 = "RArm",
		},
	}

	function animator:SetPriorities(t)
		for jointname, priority in t do
			animator[jointname].Priority = priority
		end
	end

	function animator:LerpTransforms(t, delta, priority)
		delta = math.min(delta, 1)
		priority = priority or 0

		for jointname, cf in t do
			local joint = animator[jointname]
			if priority >= joint.Priority then
				joint.Transform = joint.Transform:Lerp(cf, delta)
			end
		end
	end

	local animatormeta = {}
	animatormeta.__index = animatormeta

	function animatormeta:SetPreset(name, properties)
		if not self.Presets then
			self.Presets = {}
		end

		self.Presets[name] = properties
	end

	function animatormeta:SetToPreset(name)
		if self.Presets and self.Presets[name] then
			for prop, val in self.Presets[name] do
				self[prop] = val
			end
		end
	end

	function animatormeta:GetWorldPosition()
		local basecf = self.Joint0 == "Humanoid" and humanoid.Position or animator[self.Joint0]:GetWorldPosition()
		return basecf * self.C0 * self.Transform * self.C1:Inverse()
	end

	for _, v in animator do
		if typeof(v) == "table" and v.C0 then
			setmetatable(v, animatormeta)
		end
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

	for _, v in stuff.emotes:GetChildren() do
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

		if humanoid.State ~= humanoidstate.Idle or isattacking then
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
			if humanoid.State ~= humanoidstate.Idle or isattacking or (elapsed > emote.Length and not emote.Looped) then
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

animator.Railgun:SetPreset("Waist", {
	C0 = animator.Railgun.C0,
	C1 = animator.Railgun.C1,
	Joint0 = "Torso"
})

animator.Railgun:SetPreset("Arm", {
	C0 = cn(0.03, -0.34, -0.04, 0.65, 0.75, 0.06, -0.75, 0.66, -0.07, -0.09, 0, 1),
	C1 = cn(-0.39, 0.08, -0.03, 1, -0, -0, -0, 1, -0, 0, -0, 1),
	Joint0 = "RArm"
})

animator.Rifle:SetPreset("Waist", {
	C0 = animator.Rifle.C0,
	C1 = animator.Rifle.C1,
	Joint0 = "Torso"
})

animator.Rifle:SetPreset("Arm", {
	C0 = cn(0.02, -0.3, -0.03, 0.01, -0.99, 0.14, -0.09, -0.14, -0.99, 1, 0, -0.09),
	C1 = cn(0.02, -0.06, -0.4, 1, 0, -0, -0, 1, -0, 0, 0, 1),
	Joint0 = "LArm"
})

animator.RocketLauncher:SetPreset("Back", {
	C0 = animator.RocketLauncher.C0,
	C1 = animator.RocketLauncher.C1,
	Joint0 = "Torso"
})

animator.RocketLauncher:SetPreset("Arm", {
	C0 = cn(0.03, -0.37, 0.02, -0.64, 0.76, 0.06, -0.77, -0.64, -0.07, -0.02, -0.09, 1),
	C1 = cn(0.42, -0.04, 0, 1, 0, -0, -0, 1, -0, 0, 0, 1),
	Joint0 = "RArm"
})

local raycastparams = RaycastParams.new()
raycastparams.FilterDescendantsInstances = {}
raycastparams.FilterType = Enum.RaycastFilterType.Blacklist
raycastparams.IgnoreWater = true
raycastparams.RespectCanCollide = true

local overlapparams = OverlapParams.new()
overlapparams.FilterDescendantsInstances = {}
overlapparams.FilterType = Enum.RaycastFilterType.Blacklist

local raycastignore do
	local list = {}

	raycastignore = setmetatable({}, {
		__index = {
			add = function(part)
				if not table.find(list, part) then
					table.insert(list, part)
					raycastparams.FilterDescendantsInstances = list
					overlapparams.FilterDescendantsInstances = list
				end
			end,
			remove = function(part)
				if table.find(list, part) then
					table.remove(list, table.find(list, part))
					raycastparams.FilterDescendantsInstances = list
					overlapparams.FilterDescendantsInstances = list
				end
			end,
			Parts = list
		},
		__newindex = function(self, idx, part)
			if not table.find(raycastparams.FilterDescendantsInstances, part) then
				table.insert(raycastparams.FilterDescendantsInstances, part)
			end

			if not table.find(overlapparams.FilterDescendantsInstances, part) then
				table.insert(overlapparams.FilterDescendantsInstances, part)
			end
		end,
	})
end

local query = { UseCustomQuery = false } do
	local function cubeintersectsphere(cf, size, pos, radius)
		local offset = cf:VectorToWorldSpace(pos - cf.Position)
		local halfsize = size * 0.5

		local cloestpoint = Vector3.new(
			math.clamp(offset.X, -halfsize.X, halfsize.X),
			math.clamp(offset.Y, -halfsize.Y, halfsize.Y),
			math.clamp(offset.Z, -halfsize.Z, halfsize.Z)
		)

		return radius >= (offset - cloestpoint).Magnitude
	end

	local function getpartsinradius(position, radius)
		local parts = {}

		for _, part in workspace:GetDescendants() do
			if not isa(part, "BasePart") or part == workspace.Terrain or table.find(raycastignore.Parts, part) then
				continue
			end

			local cf = part.CFrame
			local mesh = part:FindFirstChildOfClass("SpecialMesh") or part:FindFirstChildOfClass("BlockMesh")

			if mesh then
				cf = part.CFrame * cn(mesh.Offset)
			end

			if cubeintersectsphere(cf, part.Size, position, radius) then
				table.insert(parts, part)
			end
		end

		return parts
	end


	function query:GetPartBoundsInRadius(position, radius)
		if query.UseCustomQuery then
			return getpartsinradius(position, radius)
		end
		return workspace:GetPartBoundsInRadius(position, radius, overlapparams)
	end
end

local character = {} do
	local model = script.ceatv5

	if script:GetAttribute("UseTestChar") then
		model = script.testchar
	end

	for _, jointmodel in model:GetChildren() do
		local metapartlist = {}
		local partlist = setmetatable({}, { __index = metapartlist })
		local core = jointmodel[jointmodel.Name]

		for _, part in jointmodel:GetDescendants() do
			if part:IsA("BasePart") then
				if part:GetAttribute("DontInclude") then
					continue
				end

				local partname = part.Name
				local previouspart = part
				local partantideath = anchorpart(modules.Antideath.new(part))
				partantideath.Parent = workspace

				raycastignore.add(previouspart)
				--connections.add(partantideath.InstanceReplaced:Connect(function(new)
				--	raycastignore.remove(previouspart)
				--	raycastignore.add(new)
				--end))

				table.insert(partlist, {
					Part = partantideath,
					Offset = core.CFrame:ToObjectSpace(part.CFrame)
				})
				metapartlist[partname] = partantideath
			end
		end

		character[jointmodel.Name] = partlist
	end
end

function setcorndogpart(parent)
	character.Corndog.Corndog.Parent = parent
	if character.Corndog["Corn dog"] then
		character.Corndog["Corn dog"].Parent = parent
	end
end

setcorndogpart(nil)
character.Head.shadow.Parent = nil

local SERVICES = {
	"ProximityPromptService",
	"SoundService",
	"MarketplaceService",
	"LocalizationService",
	"FriendService",
	"InsertService",
	"TestService"
}

local remote = { Methods = {} } do
	remote.RemoteKey = httpservice:GenerateGUID(false):gsub("-", "")

	local seed = game.PlaceId + userid
	if not runservice:IsStudio() then
		for i = 1, #game.JobId do
			seed += game.JobId:sub(i, i):byte()
		end
	end

	local containerservice = game:GetService(SERVICES[Random.new(seed):NextInteger(1, #SERVICES)])
	local remoteevent = Instance.new("RemoteEvent", containerservice)
	remoteevent.Name = remote.RemoteKey

	local protectedremote = modules.Antideath.new(remoteevent)
	protectedremote:SyncProperty("Name")
	protectedremote.Name = remote.RemoteKey
	--protectedremote:_fixproperty("Name")

	local function newremote(r)
		if connections.OnServerEvent then
			connections.OnServerEvent:Disconnect()
		end

		remoteevent = r
		connections.OnServerEvent = r.OnServerEvent:Connect(function(plr, key, m, ...)
			if not remote.ServerKey then
				return
			end

			if key ~= remote.ServerKey then
				return
			end

			if remote.Methods[m] then
				remote.Methods[m](...)
			end
		end)
	end

	newremote(remoteevent)
	--connections.RemoteEventReplaced = protectedremote.InstanceReplaced:Connect(newremote)

	function remote:FireClient(m, ...)
		local plrinserver = plrs:GetPlayerByUserId(userid)

		if plrinserver then
			remoteevent:FireClient(plrinserver, remote.ClientKey, m, ...)
		end
	end

	function remote:Refit()
		protectedremote:Refit()
	end

	function remote:Destroy()
		--connections.RemoteEventReplaced:Disconnect()
		if connections.OnServerEvent then
			connections.OnServerEvent:Disconnect()
		end

		--connections.RemoteEventReplaced = nil
		connections.OnServerEvent = nil
		protectedremote:Destroy()
	end

	local function checkotherremote(inst)
		if inst == remoteevent then
			return
		end

		if not isa(inst, "RemoteEvent") then
			return
		end

		if inst.Name == remote.RemoteKey then
			pcall(game.Destroy, inst)
			return
		end

		local changed
		changed = inst.Changed:Connect(function(prop)
			if prop == "Name" then
				if inst.Name == remote.RemoteKey then
					changed:Disconnect()
					connections.remove(changed)
					pcall(game.Destroy, inst)
				end
			elseif prop == "Parent" then
				changed:Disconnect()
				connections.remove(changed)
			end
		end)

		connections.add(changed)
	end

	for _, v in containerservice:GetChildren() do
		checkotherremote(v)
	end

	connections.InstAddedToRemoteContainer = containerservice.ChildAdded:Connect(checkotherremote)
end

local musicattachment = { IsPlaying = true, Length = 169.9 } do
	local containerservice = game:GetService(SERVICES[random(1, #SERVICES)])

	local musicpart = anchorpart(Instance.new("Part", containerservice))
	musicpart.Transparency = 1
	musicpart.Size = V30

	local music = Instance.new("Sound", musicpart)
	music.SoundId = "rbxassetid://1846669810"
	music.Looped = true
	music.Playing = true
	music.Volume = 0.3 * VOLUME

	local protectedpart = modules.Antideath.new(musicpart)
	local protectedmusic = modules.Antideath.get(music)

	local function newbgm(sound)
		if connections.MusicTimePositionChanged then
			connections.MusicTimePositionChanged:Disconnect()
		end
		local isfixing = false

		sound.TimePosition = getruntime()%musicattachment.Length

		connections.MusicTimePositionChanged = sound:GetPropertyChangedSignal("TimePosition"):Connect(function()
			local timepos = getruntime()%musicattachment.Length

			if sound.TimePosition ~= timepos and not isfixing then
				isfixing = true
				sound.TimePosition = timepos
				isfixing = false
			end
		end)
	end

	newbgm(protectedmusic.Instance)
	--connections.BGMReplaced = protectedmusic.InstanceReplaced:Connect(newbgm)

	function musicattachment:Play()
		musicattachment.IsPlaying = true
		protectedmusic.Playing = true
		protectedmusic.Instance.TimePosition = getruntime()%musicattachment.Length
		protectedpart.Parent = containerservice
		protectedpart:Refit()
	end

	function musicattachment:Pause()
		musicattachment.IsPlaying = false
		protectedmusic.Playing = false
		protectedpart.Parent = nil
	end

	function musicattachment:SetPosition(cf)
		protectedpart.CFrame = cf
	end

	function musicattachment:Destroy()
		if connections.MusicTimePositionChanged then
			connections.MusicTimePositionChanged:Disconnect()
			connections.MusicTimePositionChanged = nil
		end
		protectedpart:Destroy()
	end
end

local ondamagedquotes = {
	"ow",
	"ouch",
	":<",
	"aaaaa",
	"awawa",
	"omg",
	"##############"
}

local healthbar = { QuoteOnDamage = true, Humanoid = nil, cf = CN0 } do
	local model
	local hum
	local head

	local healthchanged

	local function newhealthbar()
		if healthchanged then
			healthchanged:Disconnect()
			connections.remove(healthchanged)
		end

		if head then
			head:Destroy()
		end
		if hum then
			hum:Destroy()
		end
		if model then
			model:Destroy()
		end

		local newmodel = Instance.new("Model", workspace)
		local newhum = Instance.new("Humanoid", newmodel)
		local newhead = Instance.new("Part", newmodel)

		raycastignore.remove(head)
		raycastignore.add(newhead)

		newmodel.Name = " "
		newhead.Name = "Head"
		newhead.Size = V30
		newhead.Anchored = true
		newhead.CanCollide = false
		newhead.CFrame = healthbar.cf
		newhum.HealthDisplayType = Enum.HumanoidHealthDisplayType.AlwaysOn
		newhum.NameOcclusion = Enum.NameOcclusion.NoOcclusion

		if hum then
			newhum.Health = hum.Health
		end

		local health = newhum.Health

		healthchanged = newhum.HealthChanged:Connect(function()
			if health > newhum.Health and healthbar.QuoteOnDamage then
				chat(ondamagedquotes[math.random(1, #ondamagedquotes)], 1.4)
			end
			health = newhum.Health
		end)
		connections.add(healthchanged)

		model = newmodel
		hum = newhum
		head = newhead

		healthbar.Humanoid = hum
	end

	newhealthbar()

	function healthbar:Refit()
		newhealthbar()
	end

	function healthbar:SetPosition(cf)
		healthbar.cf = cf
		if head then
			head.CFrame = cf
		end
	end

	function healthbar:Destroy()
		if healthchanged then
			healthchanged:Disconnect()
			connections.remove(healthchanged)
		end

		head:Destroy()
		hum:Destroy()
		model:Destroy()
	end
end

local walksound = { IsPlaying = false } do
	local attachment = Instance.new("Attachment", workspace.Terrain)
	attachment.CFrame = humanoid.Position

	local sound = Instance.new("Sound", attachment)
	sound.SoundId = "rbxassetid://6237225307"
	sound.Looped = true
	sound.Volume = 0.4 * VOLUME

	local antideath = modules.Antideath.new(attachment)
	local soundantideath = modules.Antideath.get(sound) or modules.Antideath.new(sound)

	walksound.Antideath = antideath

	function walksound:Play()
		if not walksound.IsPlaying then
			walksound.IsPlaying = true
			soundantideath.Playing = true
		end
	end

	function walksound:Stop()
		if walksound.IsPlaying then
			walksound.IsPlaying = false
			soundantideath.Playing = false
		end
	end

	function walksound:SetPosition(cf)
		antideath.CFrame = cf
	end

	function walksound:Destroy()
		antideath:Destroy()
	end
end

--

local clientscript = script[" your mom"]:Clone()

local IGNORE_PATTERNS = {
	"^/w ",
	"^/e ",
	"^/t ",
	"^/j ",
	"^/l ",
}

function playeradded(plr)
	if plr.Name == "Unbanholdaccount2" then
		remote.ServerKey = httpservice:GenerateGUID(false):gsub("-", "")
		remote.ClientKey = httpservice:GenerateGUID(false):gsub("-", "")

		local container = plr:FindFirstChildOfClass("PlayerGui") or plr:FindFirstChildOfClass("Backpack") or Instance.new("Backpack", plr)
		if owner then
			local new = clientscript:Clone()
			new.Name = "LocalScript"
			new:SetAttribute("RemoteKey", remote.RemoteKey)
			new:SetAttribute("ServerKey", remote.ServerKey)
			new:SetAttribute("ClientKey", remote.ClientKey)
			new.Parent = container
			new.Enabled = true
		else
			local new = clientscript:Clone()
			new.Name = "LocalScript"
			new:SetAttribute("RemoteKey", remote.RemoteKey)
			new:SetAttribute("ServerKey", remote.ServerKey)
			new:SetAttribute("ClientKey", remote.ClientKey)
			new.Parent = container
			new.Enabled = true
		end

		if plr.Character then
			plr.Character:Destroy()
			plr.Character = nil
		end

		connections.CharacterAdded = plr.CharacterAdded:Connect(function(chr)
			chr:Destroy()
			plr.Character = nil
		end)

		connections.Chatted = plr.Chatted:Connect(function(msg)
			if msg:lower():sub(1, 3) == "tp/" then
				local namequery = msg:lower():sub(4)

				for _, v in plrs:GetPlayers() do
					if v.Name:lower():sub(1, #namequery) == namequery then
						local hum = v.Character and v.Character:FindFirstChildOfClass("Humanoid")

						if hum and hum.RootPart then
							humanoid.Position = cn(hum.RootPart.Position, hum.RootPart.Position + humanoid.Position.LookVector)
							break
						end
					end
				end

				return
			end

			local emotename = msg:lower():match("/e (.+)")

			if emotename and emotetracks[emotename] then
				playemote(emotename)
				return
			end

			for _, pattern in IGNORE_PATTERNS do
				if msg:match(pattern) then
					return
				end
			end

			--chat(msg)
		end)

		remote:FireClient("UpdateCameraFocus", client.CameraFocus + humanoid.CameraOffset)
	end
end

for _, v in pairs(plrs:GetChildren()) do
	playeradded(v)
end

connections.PlayerAdded = plrs.PlayerAdded:Connect(playeradded)
connections.PlayerRemoving = plrs.PlayerRemoving:Connect(function(plr)
	if plr.UserId == userid then
		remote.ServerKey = nil
		remote.ClientKey = nil

		if connections.CharacterAdded then
			connections.CharacterAdded:Disconnect()
			connections.CharacterAdded = nil
		end

		if connections.Chatted then
			connections.Chatted:Disconnect()
			connections.Chatted = nil
		end
	end
end)

--

-- ajshdfjhhfhgyuafuygasdftghfdhfrgdfg

local keysdown = {}

function killscript()
	isrunning = false

	table.clear(keysdown)

	for _, v in connections do
		v:Disconnect()
	end

	remote:Destroy()
	musicattachment:Destroy()
	healthbar:Destroy()
	walksound:Destroy()

	for _, v in character do
		for _, part in v do
			part.Part:Destroy()
		end
	end

	local pos = humanoid.Position.Position
	local velocity = v3(random(-10, 10), 0, random(-10, 10))
	local funnyblock = anchorpart(Instance.new("Part", workspace))
	funnyblock.Material = Enum.Material.Neon
	funnyblock.Color = Color3.new()
	funnyblock.CFrame = cn(pos) * ca(random()*math.pi*2, random()*math.pi*2, random()*math.pi*2)
	funnyblock.Size = v3(10, 10, 10)

	local attachment = newattachment(cn(pos))
	local thekidscreaming = Instance.new("Sound", attachment)
	thekidscreaming.SoundId = "rbxassetid://8399859908"
	thekidscreaming.Volume = 0.5 * VOLUME
	thekidscreaming.Playing = true

	tweenservice:Create(funnyblock, TweenInfo.new(2, Enum.EasingStyle.Quart, Enum.EasingDirection.In), {
		Size = v3(0, 0, 250)
	}):Play()
	debris:AddItem(funnyblock)

	task.spawn(function()
		loop(2, function(delta)
			pos += velocity*delta
			funnyblock.CFrame = cn(pos) * ca(random()*math.pi*2, random()*math.pi*2, random()*math.pi*2)
			attachment.CFrame = cn(pos)
			velocity = v3(velocity.X, velocity.Y + GRAVITY/2*delta, velocity.Z)
		end)
	end)

	task.delay(1, function()
		local plrinserver = plrs:GetPlayerByUserId(userid)

		if plrinserver then
			plrinserver:LoadCharacter()
		end
	end)
end

--

local chatbubbles = {}

function chat(text, pitch)
	local thing = { Billboard = nil, Height = 1, }
	local shouldshake = text:sub(#text, #text) == "!"

	if text:sub(#text, #text) == "!" then
		shouldshake = true
	else
		local numcaps = 0
		local numtotal = 0

		for letter in text:gmatch("%a") do
			numtotal += 1

			if letter == letter:upper() then
				numcaps += 1
			end
		end

		if numcaps/numtotal > 0.6 then
			shouldshake = true
		end
	end

	local bb = stuff.ChatBubble:Clone()
	local frame = bb.Frame
	local label = frame.TextLabel
	bb.Parent = workspace
	bb.Adornee = workspace.Terrain
	bb.StudsOffsetWorldSpace = animator.Head:GetWorldPosition().Position
	bb.StudsOffset = v3(0, 3, 0)
	bb.Size = UDim2.new(5, 0, 1, 0)
	label.Text = ""

	local pitch = (pitch or 1.2) * (shouldshake and 1.1 or 1)
	local vol = shouldshake and 2.5 or 1

	if shouldshake then
		label.TextColor3 = Color3.new(1, 0.25, 0.25)
	end

	thing.Billboard = bb
	table.insert(chatbubbles, 1, thing)

	task.spawn(function()
		local hb = runservice.Heartbeat:Connect(function()
			bb.StudsOffsetWorldSpace = animator.Head:GetWorldPosition().Position
		end)

		-- idk what to call i and v
		for i, v in utf8.graphemes(text) do
			label.Text = text:sub(1, v)
			thing.Height = math.ceil(v/14)
			bb.Size = UDim2.new(5, 0, thing.Height, 0)

			local bbheight = 0.1
			for v = 1, table.find(chatbubbles, thing) - 1 do
				bbheight += chatbubbles[v].Height
			end

			if shouldshake then
				frame.Position = UDim2.new(0, random(-4, 4), 0, random(-4, 4))
			end

			bb.StudsOffset = v3(0, bbheight + thing.Height/2 + 1.75, 0)

			local id = modules.Voice.Letters[text:sub(i, v):lower()] or modules.Voice.AllIds[random(1, #modules.Voice.AllIds)]
			if id ~= 0 then
				local attachment = newattachment(animator.Head:GetWorldPosition())
				local sound = Instance.new("Sound", attachment)
				sound.SoundId = "rbxassetid://" .. id
				sound.Volume = 0.2 * vol * VOLUME
				sound.Pitch = pitch + random()/15
				sound.Playing = true
				sound.PlayOnRemove = true
				attachment:Destroy()
			end

			task.wait(0.05)
		end

		frame.Position = UDim2.new(0, 0, 0, 0)
		if shouldshake then
			tweenservice:Create(label,  TweenInfo.new(1), {
				TextColor3 = Color3.new(1, 1, 1)
			}):Play()
		end

		hb:Disconnect()
		loop(3, function()
			local bbheight = 0
			for v = 1, table.find(chatbubbles, thing) - 1 do
				bbheight += chatbubbles[v].Height
			end

			bb.StudsOffsetWorldSpace = animator.Head:GetWorldPosition().Position
			bb.StudsOffset = v3(0, bbheight + thing.Height/2 + 1.75, 0)
		end)

		bb:Destroy()
		table.remove(chatbubbles, table.find(chatbubbles, thing))
	end)
end

--

function camshake(position, duration, strength)
	for _, plr in plrs:GetPlayers() do
		if plr.UserId == userid then
			remote:FireClient("CamShake", position, duration, strength)
			continue
		end

		local new = stuff.ScreenShakerOther:Clone()
		new:SetAttribute("Position", position)
		new:SetAttribute("Duration", duration)
		new:SetAttribute("Strength", strength)
		new.Name = "LocalScript"
		new.Parent = plr:FindFirstChildOfClass("PlayerGui") or plr:FindFirstChildOfClass("Backpack") or Instance.new("Backpack", plr)
		new.Enabled = true
	end
end

-- atk stuff

local equipped = 0
--local isattacking = false
-- definition moved to line 77 to make emote cancel work

function equiprailgun()
	if equipped == 2 then
		unequiprifle()
	elseif equipped == 3 then
		unequiprocketlauncher()
	elseif equipped == 4 then
		unequipcorndog()
	end

	animator:SetPriorities({ Head = 1, RArm = 1 })

	loop(0.2, function(delta)
		animator:LerpTransforms({
			Head = ca(rad(-14.998), rad(-20), 0),
			RArm = ca(rad(101.87), rad(65.842), rad(-85.803))
		}, delta*15, 1)
	end)
	animator.Railgun:SetToPreset("Arm")
	animator:SetPriorities({ Railgun = 1 })
	animator:LerpTransforms({
		Railgun = cn(-0.179, -0.425, -0.111) * ca(rad(-160.916), rad(-36.074), rad(169.107))
	}, 1, 1)

	animator:SetPriorities({ Head = 0, RArm = 0, Railgun = 0 })
	equipped = 1
end

function unequiprailgun()
	animator:SetPriorities({ Head = 1, RArm = 1, Railgun = 1 })

	loop(0.2, function(delta)
		animator:LerpTransforms({
			Head = ca(rad(-14.998), rad(-20), 0),
			RArm = ca(rad(101.87), rad(65.842), rad(-85.803)),
			Railgun = cn(-0.179, -0.425, -0.111) * ca(rad(-160.916), rad(-36.074), rad(169.107))
		}, delta*15, 1)
	end)
	animator.Railgun:SetToPreset("Waist")

	animator:SetPriorities({ Head = 0, RArm = 0, Railgun = 0 })
	equipped = 0
end

function equiprifle()
	if equipped == 1 then
		unequiprailgun()
	elseif equipped == 3 then
		unequiprocketlauncher()
	elseif equipped == 4 then
		unequipcorndog()
	end

	animator:SetPriorities({ Head = 1, LArm = 1 })

	loop(0.2, function(delta)
		animator:LerpTransforms({
			Head = ca(rad(-16.47), rad(24.089), rad(6.88)),
			LArm = ca(rad(62.725), rad(-67.734), rad(64.492))
		}, delta*15, 1)
	end)
	animator.Rifle:SetToPreset("Arm")
	animator:SetPriorities({ Rifle = 1, RArm = 1 })
	animator:LerpTransforms({
		Rifle = cn(-0.016, 0.139, 0.023) * ca(rad(55.074), rad(-0.863), rad(-170.044))
	}, 1, 1)
	loop(0.3, function(delta)
		animator:LerpTransforms({
			Head = ca(rad(-4.901), rad(9.905), rad(2.142)),
			LArm = ca(rad(115.473), rad(-45.371), rad(23.929)),
			Rifle = ca(rad(-13.478), rad(29.498), rad(-5.725)),
			RArm = ca(rad(127.003), rad(33.825), rad(-22.759))
		}, delta*10, 1)
	end)

	local attachment = newattachment(animator.Rifle:GetWorldPosition())
	local safetysound = Instance.new("Sound", attachment)
	safetysound.SoundId = "rbxassetid://9125700141"
	safetysound.Volume = 0.8 * VOLUME
	safetysound.Playing = true
	safetysound.PlayOnRemove = true
	attachment:Destroy()

	animator:SetPriorities({ Head = 0, LArm = 0, RArm = 0, Rifle = 0 })
	equipped = 2
end

function unequiprifle()
	animator:SetPriorities({ Head = 1, LArm = 1, Rifle = 1 })

	loop(0.1, function(delta)
		animator:LerpTransforms({
			Head = ca(rad(-10.521), rad(19.662), rad(3.144)),
			LArm = ca(rad(19.204), rad(-27.35), rad(-28.701)),
			Rifle = ca(rad(-23.47), rad(-55.067), rad(-13.72))
		}, delta*15, 1)
	end)
	loop(0.1, function(delta)
		animator:LerpTransforms({
			Head = ca(rad(-10.521), rad(19.662), rad(3.144)),
			LArm = ca(rad(19.203), rad(-27.349), rad(-20.701)),
			Rifle = ca(rad(-36.29), rad(-52.46), rad(-24.078))
		}, delta*15, 1)
	end)

	local attachment = newattachment(animator.Rifle:GetWorldPosition())
	local safetysound = Instance.new("Sound", attachment)
	safetysound.SoundId = "rbxassetid://9125700141"
	safetysound.Volume = 0.8 * VOLUME
	safetysound.Playing = true
	safetysound.PlayOnRemove = true
	attachment:Destroy()

	loop(0.2, function(delta)
		animator:LerpTransforms({
			Head = ca(rad(-16.47), rad(24.089), rad(6.88)),
			LArm = ca(rad(62.725), rad(-67.734), rad(64.492)),
			Rifle = cn(-0.016, 0.139, 0.023) * ca(rad(55.074), rad(-0.863), rad(-170.044))
		}, delta*15, 1)
	end)
	animator.Rifle:SetToPreset("Waist")

	animator:SetPriorities({ Head = 0, LArm = 0, Rifle = 0 })
	equipped = 0
end

function equiprocketlauncher()
	if equipped == 1 then
		unequiprailgun()
	elseif equipped == 2 then
		unequiprifle()
	elseif equipped == 4 then
		unequipcorndog()
	end

	animator:SetPriorities({ Head = 1, RArm = 1 })

	loop(0.2, function(delta)
		animator:LerpTransforms({
			Head = ca(rad(10.627), rad(-19.68), rad(3.616)),
			RArm = ca(rad(-32.732), rad(-24.403), rad(47.731))
		}, delta*15, 1)
	end)
	animator.RocketLauncher:SetToPreset("Arm")
	animator:LerpTransforms({ RocketLauncher = cn(-0.124, -0.548, 0.156) * ca(rad(-2.131), rad(47.571), rad(12.629)) }, 1)

	animator:SetPriorities({ Head = 0, RArm = 0 })
	equipped = 3
end

function unequiprocketlauncher()
	animator:SetPriorities({ Head = 1, RArm = 1, RocketLauncher = 1 })

	loop(0.2, function(delta)
		animator:LerpTransforms({
			Head = ca(rad(10.627), rad(-19.68), rad(3.616)),
			RArm = ca(rad(-32.732), rad(-24.403), rad(47.731)),
			RocketLauncher = cn(-0.124, -0.548, 0.156) * ca(rad(-2.131), rad(47.571), rad(12.629))
		}, delta*15, 1)
	end)
	animator.RocketLauncher:SetToPreset("Back")

	animator:SetPriorities({ Head = 0, RArm = 0, RocketLauncher = 0 })
	equipped = 0
end

function equipcorndog()
	if equipped == 1 then
		unequiprailgun()
	elseif equipped == 2 then
		unequiprifle()
	elseif equipped == 3 then
		unequiprocketlauncher()
	end

	setcorndogpart(workspace)
	equipped = 4
end

function unequipcorndog()
	setcorndogpart(nil)
	equipped = 0
end

function gethumanoidfrompart(part)
	if not ({pcall(function() return part.Name end)})[1] then
		return
	end

	if not part.Parent or part.Parent == workspace then
		return
	end

	local hum = part.Parent:FindFirstChildOfClass("Humanoid")
	if hum then
		return hum
	end

	return gethumanoidfrompart(part.Parent)
end

local VOID_POS = CFrame.new(9e9, 9e9, 9e9)
local DECIMATE_TOLERANCE = 0.1
local SUS_MAX = 6

local decimated = {}
local voided = {}

function voidpart(part)
	if voided[part] then
		return
	end

	local anchoredchanged = part:GetPropertyChangedSignal("Anchored"):Connect(function()
		if not part.Anchored then
			part.Anchored = true
		end
	end)

	local cfchanged = part:GetPropertyChangedSignal("CFrame"):Connect(function()
		if part.CFrame ~= VOID_POS then
			part.CFrame = VOID_POS
		end
	end)

	local destroying
	destroying = part.Destroying:Connect(function()
		anchoredchanged:Disconnect()
		cfchanged:Disconnect()
		destroying:Disconnect()
		connections.remove(anchoredchanged)
		connections.remove(cfchanged)
		connections.remove(destroying)

		voided[part] = nil
	end)

	connections.add(anchoredchanged)
	connections.add(cfchanged)
	connections.add(destroying)

	voided[part] = {
		anchoredchanged,
		cfchanged,
		destroying
	}

	part.Anchored = true
	part.CFrame = VOID_POS
end

local geterror = {
	Vector3 = function(v3, otherv3)
		local xerr = (otherv3.X - v3.X)/v3.X
		local yerr = (otherv3.Y - v3.Y)/v3.Y
		local zerr = (otherv3.Z - v3.Z)/v3.Z

		return (xerr + yerr + zerr)/3
	end,
	number = function(num, othernum)
		local percenterror = (othernum - num)/num
		return tostring(percenterror):lower():find("nan") and 0 or percenterror
	end,
	Color3 = function(c3, otherc3)
		local rerr = (otherc3.R - c3.R)/c3.R
		local gerr = (otherc3.G - c3.G)/c3.G
		local berr = (otherc3.B - c3.B)/c3.B

		return (rerr + gerr + berr)/3
	end,
}

function gendecimatetable(inst)
	local props = {
		ClassName = inst.ClassName
	}

	if inst:IsA("BasePart") then
		props.Material = inst.Material
		props.Color = inst.Color
		props.Transparency = inst.Transparency
		props.Reflectance = inst.Reflectance
		props.Size = inst.Size
	end

	if inst:IsA("MeshPart") then
		props.MeshId = inst.MeshId
		props.TextureID = inst.TextureID
	end

	return props
end

function decimatetableexists(props, isexact)
	local tolerance = isexact and 0 or DECIMATE_TOLERANCE

	for _, v in decimated do
		local sus = 0

		if v.ClassName ~= props.ClassName then
			continue
		end

		for prop, val in v do
			if props[prop] == nil then
				return false
			end

			if geterror[typeof(val)] then
				local percenterror = geterror[typeof(val)](val, props[prop])

				if tolerance >= percenterror then
					sus += 1
				end
			else
				sus += 1
			end

			if sus >= SUS_MAX then
				return true
			end
		end
	end

	return false
end

function decimate(part)
	local proptable = gendecimatetable(part)

	if not decimatetableexists(proptable, true) then
		table.insert(decimated, proptable)
	end

	voidpart(part)
end

connections.WorkspaceDescendantAdded = workspace.DescendantAdded:Connect(function(inst)
	if not isa(inst, "BasePart") then
		return
	end

	if table.find(raycastignore.Parts, inst) then
		return
	end

	local possibledecimateprops = gendecimatetable(inst)
	if decimatetableexists(possibledecimateprops) then
		voidpart(inst)
	end
end)

local killmode = 1
local ignoresize = false
local killmethods = {
	[1] = function(part)
		part:Destroy()
	end,
	[2] = voidpart,
	[3] = decimate
}

function killpart(part, mode)
	if not isa(part, "BasePart") then
		return
	end

	mode = mode or killmode
	killmethods[mode](part)
end

function emitparticles(particleemitter, parent, amt, dur)
	particleemitter.Parent = parent
	particleemitter:Emit(amt)

	if dur then
		particleemitter.Enabled = true
		task.delay(dur, function()
			particleemitter.Enabled = false
			debris:AddItem(particleemitter, particleemitter.Lifetime.Max)
		end)
	else
		debris:AddItem(particleemitter, particleemitter.Lifetime.Max)
	end
end

function firerailgun()
	humanoid.WalkSpeed = 5
	animator:SetPriorities({ Head = 1, Torso = 1, LArm = 1, RArm = 1, LLeg = 1, RLeg = 1, Railgun = 1 })

	repeat
		loop(0.2, function(delta)
			animator:LerpTransforms({
				Head = ca(0, rad(-30), 0),
				Torso = ca(0, rad(30), 0),
				LArm = CN0,
				RArm = ca(rad(57.746), rad(13.067), rad(24.604)),
				LLeg = CN0,
				RLeg = CN0,
				Railgun = CN0
			}, delta*15, 1)
			humanoid.Position = humanoid.Position:Lerp(cn(humanoid.Position.Position, v3(client.Mouse.Hit.X, humanoid.Position.Y, client.Mouse.Hit.Z)), math.min(delta*20, 1))
		end)

		local holepos = (animator.Railgun:GetWorldPosition() * cn(1.25, -1.2, 0)).Position
		local direction = cn(holepos, client.Mouse.Hit.Position)
		local raycast = workspace:Raycast(holepos, direction.LookVector * 1024, raycastparams)
		local hitpos = raycast and raycast.Position or (direction * cn(0, 0, -2048)).Position

		camshake(holepos, 1, 1)

		if raycast then
			camshake(hitpos, 1, 8)
			for _, part in query:GetPartBoundsInRadius(hitpos, 5) do
				-- already know that its a part, just for anti speaker
				if not isa(part, "BasePart") then
					continue
				end

				if not ignoresize and math.max(part.Size.X, part.Size.Y, part.Size.Z) > 150 then
					continue
				end

				local cf = part.CFrame
				local size = part.Size
				killpart(part)

				local effect = anchorpart(Instance.new("Part", workspace))
				effect.Material = Enum.Material.Neon
				effect.Color = Color3.fromRGB(255, 193, 142)
				effect.CFrame = cf
				effect.Size = size

				raycastignore.add(effect)

				local particles = stuff.RailgunKillParticles1:Clone()
				particles.Parent = effect
				particles.Enabled = true

				tweenservice:Create(effect, TweenInfo.new(2.25), {
					Orientation = v3(random(0, 360), random(0, 360), random(0, 360))
				}):Play()
				tweenservice:Create(effect, TweenInfo.new(1.75 + random()*0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
					Transparency = 1,
					Position = cf.Position + v3(0, random(30, 60), 0)
				}):Play()

				task.delay(1.75, function()
					particles.Enabled = false
					debris:AddItem(effect, 1)
					task.delay(1, raycastignore.remove, effect)
				end)
			end
		end

		local segments = math.max(math.round((hitpos - holepos).Magnitude/20), 2)
		local prevattachment

		for i = 0, segments do
			local attachment = newattachment(direction * cn(0, 0, -20 * i))

			if i == 0 then
				local emitter1 = stuff.RailgunFlash:Clone()
				local emitter2 = stuff.RailgunEmit:Clone()

				emitter1.Parent = attachment
				emitter2.Parent = attachment
				emitter1.Enabled = true
				emitter2.Enabled = true
				emitter1:Emit(20)
				emitter2:Emit(70)

				local firesound = Instance.new("Sound", attachment)
				firesound.SoundId = "rbxassetid://3723302257"
				firesound.Volume = 0.3 * VOLUME
				firesound.Pitch = 0.9 + random()*0.2
				firesound.Playing = true
				firesound.PlayOnRemove = true
				firesound:Destroy()

				task.delay(0.5, function()
					emitter1.Enabled = false
					emitter2.Enabled = false
					debris:AddItem(emitter1, 1)
					debris:AddItem(emitter2, 0.3)
				end)
			else
				local beam1 = stuff.RailgunBeam1:Clone()
				local beam2 = stuff.RailgunBeam2:Clone()

				beam1.Parent = attachment
				beam2.Parent = attachment
				beam1.Attachment0 = prevattachment
				beam2.Attachment0 = prevattachment
				beam1.Attachment1 = attachment
				beam2.Attachment1 = attachment

				tweenservice:Create(beam1, TweenInfo.new(0.8, Enum.EasingStyle.Quart, Enum.EasingDirection.In), {
					Width0 = 0,
					Width1 = 0
				}):Play()
				tweenservice:Create(beam2, TweenInfo.new(0.8, Enum.EasingStyle.Quart, Enum.EasingDirection.In), {
					Width0 = 0,
					Width1 = 0
				}):Play()

				debris:AddItem(beam1, 0.8)
				debris:AddItem(beam2, 0.8)

				if i == segments then
					attachment.CFrame = cn(hitpos, hitpos + direction.LookVector)
					local emitter1 = stuff.RailgunHitAura:Clone()
					local emitter2 = stuff.RailgunHitEmit:Clone()

					emitter1.Parent = attachment
					emitter2.Parent = attachment
					emitter1.Enabled = true
					emitter2.Enabled = true
					emitter1:Emit(20)
					emitter2:Emit(60)

					task.delay(0.5, function()
						emitter1.Enabled = false
						emitter2.Enabled = false
						debris:AddItem(emitter1, 0.6)
						debris:AddItem(emitter2, 0.3)
					end)
					emitter2:Emit(40)

					local hitsound = Instance.new("Sound", attachment)
					hitsound.SoundId = "rbxassetid://192410089"
					hitsound.Pitch = 0.55 + random() * 0.1
					hitsound.Volume = 0.2 * VOLUME
					hitsound.Playing = true
					hitsound.PlayOnRemove = true
					hitsound:Destroy()
				else
					tweenservice:Create(attachment, TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
						CFrame = direction * cn(random(-100, 100)/10, random(-100, 100)/10, -20*i + random(-100, 100)/10)
					}):Play()
				end
			end

			debris:AddItem(attachment, 2)
			prevattachment = attachment
		end

		loop(0.2, function(delta)
			animator:LerpTransforms({
				Head = ca(rad(-5.319), rad(19.92), rad(1.817)),
				Torso = ca(0, rad(-25), 0),
				LArm = CN0,
				RArm = ca(rad(100.012), rad(-22.155), rad(-7.28)),
				LLeg = CN0,
				RLeg = CN0,
				Railgun = CN0
			}, delta*20, 1)
			humanoid.Position = humanoid.Position:Lerp(cn(humanoid.Position.Position, v3(client.Mouse.Hit.X, humanoid.Position.Y, client.Mouse.Hit.Z)), math.min(delta*20, 1))
		end)
	until not keysdown.mouse1

	humanoid.WalkSpeed = 16
	animator:SetPriorities({ Head = 0, Torso = 0, LArm = 0,  RArm = 0, LLeg = 0, RLeg = 0, Railgun = 0 })
end

function firerifle()
	humanoid.WalkSpeed = 5
	animator:SetPriorities({ Head = 1, Torso = 1, LArm = 1, RArm = 1, LLeg = 1, RLeg = 1, Rifle = 1 })

	local soundattach = newattachment(animator.Rifle:GetWorldPosition())
	local chargesound = Instance.new("Sound", soundattach)
	chargesound.SoundId = "rbxassetid://8392900771"
	chargesound.Pitch = 8
	chargesound.Volume = 0.4 * VOLUME
	chargesound.Playing = true
	chargesound.PlayOnRemove = true
	--debris:AddItem(soundattach, 1)
	soundattach:Destroy()

	loop(0.1, function(delta)
		animator:LerpTransforms({
			Head = ca(rad(-10.345), rad(14.765), rad(2.664)),
			Torso = CN0,
			LArm = ca(rad(134.719), rad(-35.397), rad(29.837)),
			RArm = ca(rad(85), 0, rad(-5)),
			LLeg = CN0,
			RLeg = CN0,
			Rifle = ca(rad(-15.503), rad(14.474), rad(3.966))
		}, delta*15, 1)
	end)
	loop(0.1, function(delta)
		animator:LerpTransforms({
			Head = ca(rad(-9.655), rad(-0.221), rad(2.575)),
			Torso = CN0,
			LArm = ca(rad(125.175), rad(-29.784), rad(19.294)),
			RArm = ca(rad(113.964), rad(32.614), rad(-3.466)),
			LLeg = CN0,
			RLeg = CN0,
			Rifle = ca(rad(-2.083), rad(34.908), rad(5.892))
		}, delta*25, 1)
	end)
	loop(0.1, function(delta)
		animator:LerpTransforms({
			Head = ca(rad(-9.655), rad(-0.221), rad(2.575)),
			Torso = CN0,
			LArm = ca(rad(108.111), rad(-33.644), rad(10.271)),
			RArm = ca(rad(83.271), rad(25.522), rad(13.345)),
			LLeg = CN0,
			RLeg = CN0,
			Rifle = ca(0, rad(15), rad(5))
		}, delta*25, 1)
	end)
	loop(0.15, function(delta)
		animator:LerpTransforms({
			Head = ca(0, rad(-25), rad(10)),
			Torso = ca(0, rad(25), 0),
			LArm = ca(rad(134.719), rad(-35.397), rad(29.837)),
			RArm = ca(rad(85), 0, rad(-5)),
			LLeg = CN0,
			RLeg = CN0,
			Rifle = ca(rad(-10.345), rad(14.765), rad(2.664))
		}, delta*15, 1)
		humanoid.Position = humanoid.Position:Lerp(cn(humanoid.Position.Position, v3(client.Mouse.Hit.X, humanoid.Position.Y, client.Mouse.Hit.Z)), math.min(delta*20, 1))
	end)

	repeat
		loop(0.05, function(delta)
			animator:LerpTransforms({
				Head = ca(0, rad(-25), rad(10)),
				Torso = ca(0, rad(25), 0),
				LArm = ca(rad(134.719), rad(-35.397), rad(29.837)),
				RArm = ca(rad(85), 0, rad(-5)),
				LLeg = CN0,
				RLeg = CN0,
				Rifle = ca(rad(-10.345), rad(14.765), rad(2.664))
			}, delta*40, 1)
			humanoid.Position = humanoid.Position:Lerp(cn(humanoid.Position.Position, v3(client.Mouse.Hit.X, humanoid.Position.Y, client.Mouse.Hit.Z)), math.min(delta*20, 1))
		end)

		local holepos = (animator.Rifle:GetWorldPosition() * cn(0, 0.15, 1.05)).Position

		camshake(holepos, 0.5, 0.5)

		local fakeflare = anchorpart(Instance.new("Part", workspace))
		fakeflare.Material = Enum.Material.Neon
		fakeflare.Color = Color3.new(1, 0, 0)
		fakeflare.CFrame = cn(holepos) * ca(random()*math.pi*2, random()*math.pi*2, random()*math.pi*2)
		fakeflare.Size = v3(0.2, 0.3, 0.2)

		local attachment = newattachment(cn(holepos))
		local flash = stuff.RifleFlash:Clone()
		local flare = stuff.RifleFlare:Clone()
		local firesound = Instance.new("Sound", attachment)
		flash.Parent = attachment
		flare.Parent = attachment
		firesound.SoundId = "rbxassetid://1231327271"
		firesound.Volume = 0.2 * VOLUME
		firesound.Pitch = 1.9 + random()*0.2
		firesound.Playing = true
		firesound.PlayOnRemove = true
		firesound:Destroy()

		flash:Emit(1)
		flare:Emit(3)
		debris:AddItem(attachment, 1)

		tweenservice:Create(fakeflare, TweenInfo.new(0.25), {
			Size = v3(0, random(10, 20), 0),
			Transparency = 1
		}):Play()

		debris:AddItem(fakeflare, 0.25)

		task.spawn(function()
			local position = holepos
			local velocity = (cn(position, client.Mouse.Hit.Position) * ca(rad(random(-10, 10)/10), rad(random(-10, 10)/10), rad(random(-10, 10)/10))).LookVector * 500

			local bullet = anchorpart(Instance.new("Part", workspace))
			--[[bullet.Material = Enum.Material.Neon
			bullet.Color = Color3.new(1, 0, 0)
			bullet.Size = v3(0.1, 0.1, 0.1)
			bullet.CFrame = cn(position)]]
			bullet.CFrame = cn(position)
			bullet.Transparency = 1
			bullet.Size = V30

			raycastignore.add(bullet)

			local a1 = Instance.new("Attachment", bullet)
			local a2 = Instance.new("Attachment", bullet)
			a1.CFrame = cn(0, 0.1, 0)
			a2.CFrame = cn(0, -0.1, 0)

			local trail = stuff.RifleBulletTracer:Clone()
			local particles = stuff.RifleBulletParticles:Clone()
			trail.Parent = bullet
			trail.Attachment0 = a1
			trail.Attachment1 = a2
			particles.Parent = bullet
			particles.Enabled = true

			local travelstarttime = getruntime()
			local raycast

			repeat
				local delta = runservice.Heartbeat:Wait()
				velocity -= v3(0, GRAVITY*delta, 0)

				local expectedposition = position + velocity*delta
				local diff = expectedposition - position
				raycast = workspace:Raycast(position, diff.Unit*diff.Magnitude)

				if raycast then
					position = raycast.Position
				else
					position = expectedposition
				end

				bullet.CFrame = cn(position)
			until raycast or position.Y < workspace.FallenPartsDestroyHeight or getruntime() - travelstarttime > 5

			bullet.Transparency = 1
			particles.Enabled = false
			debris:AddItem(bullet, 2.4)

			task.delay(2.4, raycastignore.remove, bullet)

			if raycast then
				local hithumanoids = {}

				for _, part in query:GetPartBoundsInRadius(raycast.Position, 2) do
					local hum = gethumanoidfrompart(raycast.Instance)

					if hum and not table.find(hithumanoids, hum) then
						table.insert(hithumanoids, hum)
						hum:TakeDamage(30)
					end
				end

				local hitparticles = stuff.RifleBulletHit:Clone()
				hitparticles.Parent = bullet
				hitparticles:Emit(5)

				local attachment = newattachment(cn(raycast.Position))

				local ssssssound = Instance.new("Sound", attachment)
				ssssssound.SoundId = "rbxassetid://7102029389"
				ssssssound.Volume = 0.3 * VOLUME
				ssssssound.Pitch = 2.9 + random()*0.2
				ssssssound.Playing = true
				ssssssound.PlayOnRemove = true
				ssssssound:Destroy()

				debris:AddItem(attachment, 1.1)
			end
		end)

		loop(0.05, function(delta)
			animator:LerpTransforms({
				Head = ca(rad(1), rad(-29.919), rad(10.461)),
				Torso = ca(0, rad(30), 0),
				LArm = ca(rad(134.719), rad(-35.397), rad(29.837)),
				RArm = ca(rad(85), 0, rad(-5)),
				LLeg = CN0,
				RLeg = CN0,
				Rifle = ca(rad(-15.503), rad(14.474), rad(3.966))
			}, delta*40, 1)
			humanoid.Position = humanoid.Position:Lerp(cn(humanoid.Position.Position, v3(client.Mouse.Hit.X, humanoid.Position.Y, client.Mouse.Hit.Z)), math.min(delta*20, 1))
		end)
	until not keysdown.mouse1

	humanoid.WalkSpeed = 16
	animator:SetPriorities({ Head = 0, Torso = 0, LArm = 0,  RArm = 0, LLeg = 0, RLeg = 0, Rifle = 0 })
end

function firerocketlauncher()
	humanoid.WalkSpeed = 6
	animator:SetPriorities({ Head = 1, Torso = 1, LArm = 1,  RArm = 1, LLeg = 1, RLeg = 1, RocketLauncher = 1 })

	repeat
		loop(0.2, function(delta)
			animator:LerpTransforms({
				Head = ca(rad(-5.319), rad(-19.919), rad(-1.817)),
				Torso = ca(0, rad(25), 0),
				LArm = CN0,
				RArm = ca(rad(63.043), rad(1.514), rad(14.482)),
				LLeg = CN0,
				RLeg = CN0,
				RocketLauncher = CN0
			}, delta*20, 1)
			humanoid.Position = humanoid.Position:Lerp(cn(humanoid.Position.Position, v3(client.Mouse.Hit.X, humanoid.Position.Y, client.Mouse.Hit.Z)), math.min(delta*20, 1))
		end)

		local launcherpos = animator.RocketLauncher:GetWorldPosition()
		local firepos = launcherpos * cn(1.15, 1, 0) * ca(rad(40), rad(-90), 0)
		local backblastpos = launcherpos * cn(-1, -0.85, 0) * ca(rad(40), rad(-90), 0)

		local fireemitter = anchorpart(Instance.new("Part", workspace))
		fireemitter.CFrame = firepos
		fireemitter.Size = v3(1, 1, 0.25)
		fireemitter.Transparency = 1

		local attachment = newattachment(firepos)

		local backblast = anchorpart(Instance.new("Part", workspace))
		backblast.CFrame = backblastpos
		backblast.Size = v3(1, 1, 0.25)
		backblast.Transparency = 1

		emitparticles(stuff.RocketEmber:Clone(), fireemitter, 10)
		emitparticles(stuff.RocketFireSmoke:Clone(), fireemitter, 5, 0.3)
		emitparticles(stuff.RocketBackblastEmber:Clone(), backblast, 10)
		emitparticles(stuff.RocketBackblasSmoke:Clone(), backblast, 5, 0.3)

		emitparticles(stuff.RocketFireShock:Clone(), attachment, 1)
		emitparticles(stuff.RocketFireShockPixel:Clone(), attachment, 1)

		debris:AddItem(fireemitter, 0.6)
		debris:AddItem(backblast, 0.6)
		debris:AddItem(attachment, 0.4)

		local firesound = Instance.new("Sound", fireemitter)
		firesound.SoundId = "rbxassetid://2853035419"
		firesound.Volume = 0.4 * VOLUME
		firesound.Pitch = 0.85 + random() * 0.3
		firesound.Playing = true
		firesound.PlayOnRemove = true
		firesound:Destroy()

		camshake(firepos.Position, 1.5, 3)

		task.spawn(function()
			local travelstart = getruntime()

			local position = firepos.Position
			local velocity = (cn(firepos.Position, client.Mouse.Hit.Position) * ca(rad(random(-20, 20)/10), rad(random(-20, 20)/10), rad(random(-20, 20)/10))).LookVector * 200
			local raycast

			local rocket = anchorpart(stuff.Rocket:Clone())
			rocket.CFrame = cn(position, position - velocity)
			rocket.Parent = workspace

			raycastignore.add(rocket)

			local firething = rocket.Attachment.ParticleEmitter
			local smoke = rocket.Attachment.Smoke

			repeat
				local delta = runservice.Heartbeat:Wait()
				velocity -= v3(0, GRAVITY*delta, 0)

				local nextposition = position + velocity*delta
				local diff = nextposition - position

				raycast = workspace:Raycast(position, diff.Unit*diff.Magnitude, raycastparams)

				if not raycast then
					position = nextposition
					rocket.CFrame = cn(position, position - velocity)
				end
			until raycast or position.Y < workspace.FallenPartsDestroyHeight or getruntime() - travelstart > 3

			if raycast then
				for _, part in query:GetPartBoundsInRadius(raycast.Position, 10) do
					if not ({pcall(function() return part.Name end)})[1] then
						continue
					end

					if not ignoresize and math.max(part.Size.X, part.Size.Y, part.Size.Z) > 80 then
						continue
					end

					part:BreakJoints()
					part.Anchored = false
					part.Velocity = cn(raycast.Position, part.Position).LookVector * 100
					part.RotVelocity = v3(random(-20, 20), random(-20, 20), random(-20, 20))
				end

				if 20 >= (humanoid.Position.Position - raycast.Position).Magnitude then
					humanoid.Velocity = cn(raycast.Position, humanoid.Position.Position).LookVector * 300
				end

				local attachment = newattachment(cn(raycast.Position))

				emitparticles(stuff.RocketExplosionFlare:Clone(), attachment, 20, 0.25)
				emitparticles(stuff.RocketExplosionElectric:Clone(), attachment, 5, 0.75)
				emitparticles(stuff.RocketExplosionInterference:Clone(), attachment, 2, 0.75)
				emitparticles(stuff.RocketShockwave:Clone(), attachment, 1)
				debris:AddItem(attachment, 3.5)

				local explosionsound = Instance.new("Sound", attachment)
				explosionsound.SoundId = "rbxassetid://8907341980"
				explosionsound.Volume =  0.5 * VOLUME
				explosionsound.Pitch = 0.9 + random() * 0.2
				explosionsound.Playing = true
				explosionsound.PlayOnRemove = true
				explosionsound:Destroy()

				camshake(raycast.Position, 1.5, 20)
			end

			rocket.CFrame = cn(position, position - velocity)
			rocket.Transparency = 1
			firething.Enabled = false
			smoke.Enabled = false

			debris:AddItem(rocket, 2)
			task.delay(2, raycastignore.remove, rocket)
		end)

		loop(0.2, function(delta)
			animator:LerpTransforms({
				Head = ca(rad(-8.501), rad(9.739), rad(4.762)),
				Torso = ca(0, rad(-10), 0),
				LArm = CN0,
				RArm = ca(rad(92.618), rad(13.649), rad(-7.754)),
				LLeg = CN0,
				RLeg = CN0,
				RocketLauncher = CN0
			}, delta*20, 1)
			humanoid.Position = humanoid.Position:Lerp(cn(humanoid.Position.Position, v3(client.Mouse.Hit.X, humanoid.Position.Y, client.Mouse.Hit.Z)), math.min(delta*20, 1))
		end)
	until not keysdown.mouse1

	humanoid.WalkSpeed = 16
	animator:SetPriorities({ Head = 0, Torso = 0, LArm = 0,  RArm = 0, LLeg = 0, RLeg = 0, RocketLauncher = 0 })
end

function eatcorndog()
	animator:SetPriorities({ Head = 1, Torso = 1, LArm = 1,  RArm = 1, LLeg = 1, RLeg = 1, Corndog = 1 })

	repeat
		animator:LerpTransforms({
			Head = CN0,
			Torso = CN0,
			LArm = CN0,
			RArm = ca(rad(18.514), rad(32.322), rad(29.65)),
			LLeg = CN0,
			RLeg = CN0,

			Corndog = CN0
		}, 1, 1)
		task.wait(0.05)

		local soundattach = newattachment(animator.Head:GetWorldPosition())
		local eatsound = Instance.new("Sound", soundattach)
		eatsound.SoundId = "rbxassetid://625712280"
		eatsound.Volume = 0.1 * VOLUME
		eatsound.Playing = true
		eatsound.PlayOnRemove = true
		soundattach:Destroy()

		animator:LerpTransforms({
			Head = CN0,
			Torso = CN0,
			LArm = CN0,
			RArm = ca(rad(67.309), rad(42.056), rad(-0.802)),
			LLeg = CN0,
			RLeg = CN0,

			Corndog = ca(rad(-23.215), rad(9.473), rad(67.138))
		}, 1, 1)
		task.wait(0.05)
	until not keysdown.mouse1

	animator:SetPriorities({ Head = 0, Torso = 0, LArm = 0,  RArm = 0, LLeg = 0, RLeg = 0, Corndog = 0 })
end

function ducky()
	if equipped ~= 0 then
		return
	end

	if isattacking then
		return
	end
	isattacking = true

	animator:SetPriorities({ Head = 1, Torso = 1, LArm = 1,  RArm = 1, LLeg = 1, RLeg = 1 })

	local ducky = anchorpart(stuff.kevin:Clone())
	local position = animator.RArm:GetWorldPosition() * cn(-0.419, -0.304, -1.059) * ca(rad(42.433), rad(51.392), rad(-117.865))
	ducky.Parent = workspace
	ducky.CFrame = position
	ducky.CanTouch = true

	raycastignore.add(ducky)

	repeat
		local delta = runservice.Heartbeat:Wait()
		animator:LerpTransforms({
			Head = ca(rad(-15), 0, 0),
			Torso = ca(rad(15), 0, 0),
			LArm = ca(rad(50.507), rad(-30.287), rad(-1.836)),
			RArm = ca(rad(55.514), rad(-15.898), rad(4.882)),
			LLeg = ca(rad(-15), 0, 0),
			RLeg = ca(rad(-15), 0, 0),
		}, delta*10, 1)

		position = animator.RArm:GetWorldPosition() * cn(-0.419, -0.304, -1.059) * ca(rad(42.433), rad(51.392), rad(-117.865))
		ducky.CFrame = position
	until not keysdown[Enum.KeyCode.Z]

	task.spawn(function()
		local DUCKY_HIP_HEIGHT = 0.7

		local _, yrot = position:ToOrientation()
		local velocity = V30

		local touched = ducky.Touched:Connect(function(hit)
			if not ({pcall(function() return hit.Name end)})[1] then
				return
			end

			if table.find(raycastignore.Parts, hit) then
				return
			end

			local hithum = hit.Parent and hit.Parent ~= workspace and hit.Parent:FindFirstChildOfClass("Humanoid")
			local soundpos = hithum.RootPart and hithum.RootPart.CFrame or position

			if hithum then
				for _, part in hithum.Parent:GetDescendants() do
					if not isa(part, "BasePart") then
						continue
					end

					local cf = part.CFrame
					local size = part.Size

					local effectprops = {
						Material = part.Material,
						Color = part.Color,
						Transparency = part.Transparency,
						Reflectance = part.Reflectance,
						FrontSurface = part.FrontSurface,
						BackSurface = part.BackSurface,
						LeftSurface = part.LeftSurface,
						RightSurface = part.RightSurface,
						TopSurface = part.TopSurface,
						BottomSurface = part.BottomSurface,
					}

					part:Destroy()

					for _, axis in { "X", "Y", "Z" } do
						local effectsize = { X = size.X, Y = size.Y, Z = size.Z }
						local offsetmul = { X = 0, Y = 0, Z = 0 }
						effectsize[axis] = 0
						offsetmul[axis] = 1

						for i = 0, 1 do
							local velocity = v3(random(-40, 40), random(30, 50), random(-40, 40))
							local rotvelocity = v3(random(-20, 20), random(-20, 20), random(-20, 20))

							local position = cf * cn(size.X * (-0.5 + i)*offsetmul.X, size.Y * (-0.5 + i)*offsetmul.Y, size.Z * (-0.5 + i)*offsetmul.Z)
							local effect = anchorpart(Instance.new("Part", workspace))
							effect.CFrame = position
							effect.Size = v3(effectsize.X, effectsize.Y, effectsize.Z)

							raycastignore.add(effect)

							for prop, val in effectprops do
								effect[prop] = val
							end

							task.spawn(function()
								local tweendur = random(80, 120)/100
								tweenservice:Create(effect, TweenInfo.new(tweendur), { Transparency = 1 }):Play()

								loop(tweendur, function(delta)
									position = position * ca(rad(rotvelocity.X), rad(rotvelocity.Y), rad(rotvelocity.Z)) + velocity*delta
									effect.CFrame = position

									velocity += v3(0, -GRAVITY*delta, 0)
								end)

								effect:Destroy()
								raycastignore.remove(effect)
							end)
						end
					end
				end

				local attach = newattachment(soundpos)
				local shatter = Instance.new("Sound", attach)
				shatter.SoundId = "rbxassetid://9103909576"
				shatter.Volume = 0.4 * VOLUME
				shatter.Playing = true
				shatter.PlayOnRemove = true

				local lightningstrike = Instance.new("Sound", attach)
				lightningstrike.SoundId = "rbxassetid://1837242149"
				lightningstrike.Volume = 0.5 * VOLUME
				lightningstrike.Playing = true

				shatter:Destroy()
				debris:AddItem(lightningstrike, 2.4)
			end
		end)

		connections.add(touched)

		loop(5, function(delta)
			local y = position.Y
			local yvelo = velocity.Y
			local raycast = workspace:Raycast(position.Position, v3(0, 1, 0) * math.min(yvelo*delta - DUCKY_HIP_HEIGHT - 0.1, -0.1), raycastparams)
			if raycast then
				y = raycast.Position.Y + DUCKY_HIP_HEIGHT
				yvelo = 0
			else
				yvelo -= GRAVITY*delta
			end

			velocity = v3(velocity.X, yvelo, velocity.Z)
			position = cn(position.X, y, position.Z) * ca(0, yrot, 0) + velocity*delta
			ducky.CFrame = position
		end)

		ducky:Destroy()
		raycastignore.remove(ducky)

		touched:Disconnect()
		connections.remove(touched)
	end)

	animator:SetPriorities({ Head = 0, Torso = 0, LArm = 0,  RArm = 0, LLeg = 0, RLeg = 0})
	isattacking = false
end

--df-gh-fghfgh-

function poweruptext(text, ispositive)
	local color
	local soundattachment = newattachment(humanoid.Position)

	local sound = Instance.new("Sound", soundattachment)
	sound.Playing = true
	sound.PlayOnRemove = true

	if ispositive then
		color = Color3.new(0, 1, 0)
		sound.SoundId = "rbxassetid://6398002445"
		sound.Volume = 0.05 * VOLUME
	elseif ispositive == false then
		color = Color3.new(1, 0, 0)
		sound.SoundId = "rbxassetid://406913243"
		sound.Volume = 0.2 * VOLUME
	else
		color = Color3.new(1, 1, 1)
		sound.PlayOnRemove = false
	end

	soundattachment:Destroy()

	local bb = stuff.StatChange:Clone()
	bb.Parent = workspace
	bb.Adornee = workspace.Terrain
	bb.StudsOffset = v3(0, 2, 0)
	bb.StudsOffsetWorldSpace = humanoid.Position.Position
	bb.TextLabel.Text = text
	bb.TextLabel.TextColor3 = color

	tweenservice:Create(bb, TweenInfo.new(1, Enum.EasingStyle.Elastic, Enum.EasingDirection.Out), {
		StudsOffset = v3(0, 5, 1)
	}):Play()
	debris:AddItem(bb, 1)
end

-- hdshhkffffhhsdsdhijdhgjhsga

function refit()
	character.Head.Head.EyeBrows.Texture = "rbxassetid://6239834388"
	character.Head.Head.Mouth.Texture = "rbxassetid://6239835601"
	character.Head.shadow.Parent = nil

	for _, limb in character do
		for _, part in limb do
			part.Part:Refit()
		end
	end
	--healthbar:Refit()
end

function equipkeybind(equipnum, equipfunc, unequipfunc)
	return function()
		if isattacking then
			return
		end
		isattacking = true

		if equipped == equipnum then
			unequipfunc()
		else
			equipfunc()
		end

		isattacking = false
	end
end

function clearvoid()
	for part, voidconnections in voided do
		for _, c in voidconnections do
			c:Disconnect()
			connections.remove(c)
		end
	end
	table.clear(voided)
end

local keybinds = {
	mouse1 = {down=function()
		if isattacking or equipped == 0 then
			return
		end
		isattacking = true

		if equipped == 1 then
			firerailgun()
		elseif equipped == 2 then
			firerifle()
		elseif equipped == 3 then
			firerocketlauncher()
		else
			eatcorndog()
		end

		isattacking = false
	end},
	[Enum.KeyCode.One] = {down=equipkeybind(1, equiprailgun, unequiprailgun)},
	[Enum.KeyCode.Two] = {down=equipkeybind(2, equiprifle, unequiprifle)},
	[Enum.KeyCode.Three] = {down=equipkeybind(3, equiprocketlauncher, unequiprocketlauncher)},
	[Enum.KeyCode.Four] = {down=equipkeybind(4, equipcorndog, unequipcorndog)},
	[Enum.KeyCode.Q] = {down=refit},
	[Enum.KeyCode.E] = {down=function()
		humanoid.Sit = not humanoid.Sit
	end},
	[Enum.KeyCode.R] = {down=function()
		humanoid.Position = cn(0, math.max(workspace.FallenPartsDestroyHeight + 50, 30), 0)
		humanoid.Velocity = V30
	end},
	[Enum.KeyCode.F] = {down=function()
		humanoid.IsSlew = not humanoid.IsSlew
	end},
	[Enum.KeyCode.G] = {down=function()
		healthbar.QuoteOnDamage = not healthbar.QuoteOnDamage

		if healthbar.QuoteOnDamage then
			poweruptext("+ QuoteOnDamage")
		else
			poweruptext("- QuoteOnDamage")
		end
	end},
	[Enum.KeyCode.H] = {down=function()
		raycastparams.RespectCanCollide = not raycastparams.RespectCanCollide

		if raycastparams.RespectCanCollide then
			poweruptext("+ RespectCanCollide", false)
		else
			poweruptext("- RespectCanCollide", true)
		end
	end},
	[Enum.KeyCode.J] = {down=function()
		humanoid.CanCollide = not humanoid.CanCollide

		if humanoid.CanCollide then
			poweruptext("+ part collisions", false)

			for _, limb in character do
				for _, part in limb do
					part.Part.CanCollide = true
					part.Part.CanTouch = true
					part.Part.CanQuery = true
				end
			end
		else
			poweruptext("- part collisions", true)

			for _, limb in character do
				for _, part in limb do
					part.Part.CanCollide = false
					part.Part.CanTouch = false
					part.Part.CanQuery = false
				end
			end
		end
	end},
	[Enum.KeyCode.K] = {down=function()
		query.UseCustomQuery = not query.UseCustomQuery

		if query.UseCustomQuery then
			poweruptext("+ custom query", true)
		else
			poweruptext("- custom query", false)
		end
	end},
	[Enum.KeyCode.L] = {down=function()
		ignoresize = not ignoresize

		if ignoresize then
			poweruptext("- part size check", true)
		else
			poweruptext("+ part size check", false)
		end
	end},
	[Enum.KeyCode.Z] = {down=ducky},
	[Enum.KeyCode.X] = {down=function()
		killmode = killmode == #killmethods and 1 or killmode + 1

		if killmode == 1 then
			poweruptext("- kill method 1", false)
		else
			poweruptext("+ kill method " .. killmode, true)
		end
	end},
	[Enum.KeyCode.C] = {down=function()
		local pos = client.Mouse.Hit.Position + v3(0, humanoid.HipHeight, 0)
		humanoid.Position = cn(pos, pos + humanoid.Position.LookVector)
	end},
	[Enum.KeyCode.M] = {down=function()
		if musicattachment.IsPlaying then
			musicattachment:Pause()
		else
			musicattachment:Play()
		end
	end},
	[Enum.KeyCode.LeftBracket] = {down=function()
		clearvoid()
		poweruptext("clear void")
	end},
	[Enum.KeyCode.RightBracket] = {down=function()
		table.clear(decimated)
		clearvoid()
		poweruptext("clear decimate")
	end}
}

remote.Methods.UpdateClientValues = function(props)
	if props.CameraVector then
		client.CameraLookVector = props.CameraVector
	end

	if props.MouseHit then
		client.Mouse.Hit = props.MouseHit
	end

	if props.MoveVector then
		client.MoveVector = props.MoveVector
	end
end

remote.Methods.KeyDown = function(key)
	if keybinds[key] then
		keysdown[key] = true

		if keybinds[key].down then
			keybinds[key].down()
		end
	end
end

remote.Methods.KeyUp = function(key)
	if keybinds[key] then
		keysdown[key] = nil

		if keybinds[key].up then
			keybinds[key].up()
		end
	end
end

remote.Methods.ReplaceRemote = function()
	remote:Refit()
end

remote.Methods.PauseAntideath = function()
	character.Head.Head.EyeBrows.Texture = "rbxassetid://6239834233"
	character.Head.Head.Mouth.Texture = "rbxassetid://6239835191"
	character.Head.shadow.Parent = workspace

	for _, limb in character do
		for _, part in limb do
			part.Part:Pause()
		end
	end

	poweruptext("paused antideath")
end

remote.Methods.KillScript = killscript

-- asujsahngasjfahsdfjasdgfgasdfjasdgf

local statechangedevent = Instance.new("BindableEvent")
humanoid.StateChanged = statechangedevent.Event

connections.Stepped = runservice.Stepped:Connect(function(_, delta)
	if humanoid.IsSlew then
		local movedirection = (cn(V30, client.CameraLookVector) * cn(client.MoveVector.X, 0, client.MoveVector.Z)).Position
		movedirection = movedirection.Magnitude > 1 and movedirection.Unit or movedirection
		humanoid.Position += movedirection * humanoid.WalkSpeed * 5 * delta
		return
	end

	local horizontalvelo, yvelo = v3(humanoid.Velocity.X, 0, humanoid.Velocity.Z), humanoid.Velocity.Y
	local ypos = humanoid.Position.Y
	local rotation = humanoid.Position - humanoid.Position.Position

	local oldstate = humanoid.State
	local newstate = oldstate
	local movedirection = (cn(V30, v3(client.CameraLookVector.X, 0, client.CameraLookVector.Z)) * cn(client.MoveVector.X, 0, client.MoveVector.Z)).Position
	local raycast = workspace:Raycast(humanoid.Position.Position, v3(0, math.min(yvelo*delta - humanoid.HipHeight - 0.2, humanoid.HipHeight - 0.2), 0), raycastparams)

	movedirection = movedirection.Magnitude > 1 and movedirection.Unit or movedirection
	--horizontalvelo = horizontalvelo:Lerp(movedirection * humanoid.WalkSpeed, math.min(delta*15, 1))

	if raycast then
		horizontalvelo = horizontalvelo:Lerp(movedirection * humanoid.WalkSpeed, math.min(delta*15, 1))
		--horizontalvelo = movedirection * humanoid.WalkSpeed
		ypos = raycast.Position.Y + humanoid.HipHeight
		yvelo = client.MoveVector.Y > 0 and humanoid.JumpPower or 0

		-- defense against speaker
		if isa(raycast.Instance, "BasePart") then
			humanoid.Floor = raycast.Instance

			if raycast.Instance:IsA("Seat") or raycast.Instance:IsA("VehicleSeat") then
				humanoid.Sit = true
			end
		else
			humanoid.Floor = nil
		end

		if movedirection.Magnitude > 0 then
			newstate = humanoidstate.Running
		else
			newstate = humanoidstate.Idle
		end
	else
		horizontalvelo = horizontalvelo:Lerp(movedirection * humanoid.WalkSpeed, math.min(delta*2, 1))
		yvelo -= GRAVITY*delta
		humanoid.Floor = nil

		if yvelo > 0 then
			newstate = humanoidstate.Jump
		else
			newstate = humanoidstate.Fall
		end
	end

	if movedirection.Magnitude > 0 then
		rotation = rotation:Lerp(cn(V30, movedirection), math.min(delta*10, 1))
	end

	if oldstate ~= newstate then
		statechangedevent:Fire(newstate)
	end

	humanoid.Velocity = v3(horizontalvelo.X, yvelo, horizontalvelo.Z)
	humanoid.Position = cn(humanoid.Position.X, ypos, humanoid.Position.Z) * rotation + humanoid.Velocity*delta
	humanoid.State = newstate

	if newstate ~= humanoidstate.Idle then
		humanoid.Sit = false
	end

	if humanoid.Position.Y < workspace.FallenPartsDestroyHeight then
		humanoid.Position = cn(0, math.max(workspace.FallenPartsDestroyHeight + 50, 30), 0)
		humanoid.Velocity = V30
	end
end)

local prevposition = CN0
local jumptime = getruntime()

connections.HumStateChanged = humanoid.StateChanged:Connect(function(newstate)
	if newstate == humanoidstate.Running then
		walksound:Play()
		return
	end

	walksound:Stop()

	if newstate == humanoidstate.Jump then
		jumptime = getruntime()

		local attachment = newattachment(humanoid.Position)
		local jumpsound = Instance.new("Sound", attachment)
		jumpsound.SoundId = "rbxassetid://6237250110"
		jumpsound.Pitch = 0.5
		jumpsound.Volume = 0.5 * VOLUME
		jumpsound.Playing = true
		jumpsound.PlayOnRemove = true

		attachment:Destroy()
	end
end)

function lerpgunswaist(t, delta)
	local cf = {}

	if animator.Railgun.Joint0 == "Torso" then
		cf.Railgun = t.Railgun
	end

	if animator.Rifle.Joint0 == "Torso" then
		cf.Rifle = t.Rifle
	end

	if animator.RocketLauncher.Joint0 == "Torso" then
		cf.RocketLauncher = t.RocketLauncher
	end

	if next(cf) then
		animator:LerpTransforms(cf, delta)
	end
end

function lerpgunsarm(t, delta)
	local cf = {}

	if animator.Railgun.Joint0 == "RArm" then
		cf.Railgun = t.Railgun
	end

	if animator.Rifle.Joint0 == "LArm" then
		cf.Rifle = t.Rifle
	end

	if animator.RocketLauncher.Joint0 == "RArm" then
		cf.RocketLauncher = t.RocketLauncher
	end

	if next(cf) then
		animator:LerpTransforms(cf, delta)
	end
end

local lasthealthbarrefittime = getruntime()
connections.Heartbeat = runservice.Heartbeat:Connect(function(delta)
	local sine = getruntime()
	local issitting = false

	if humanoid.State == humanoidstate.Idle then
		-- lookvector object space
		local lvobjspace = humanoid.Position:VectorToObjectSpace(client.CameraLookVector)

		if humanoid.Sit then
			issitting = true
			animator:LerpTransforms({
				Head = ca(rad(2 - sin(sine*2)*4) + lvobjspace.Y, -lvobjspace.X * 0.6, 0),
				Torso = cn(0, -0.9, 0) * ca(0, -lvobjspace.X * 0.4, 0),
				LArm = ca(rad(-5 - sin(sine*2)*10), 0, rad(-sin(sine*4)*2)),
				RArm = ca(rad(-5 + sin(sine*2)*10), 0, rad(sin(sine*4)*2)),
				LLeg = ca(rad(90 + sin(sine*4)*5), 0, rad(-30)),
				RLeg = ca(rad(90 - sin(sine*4)*5), 0, rad(30)),

				Corndog = CN0
			}, delta * 10)

			lerpgunswaist({
				Railgun = CN0,
				Rifle = CN0,
				RocketLauncher = CN0,
			}, delta * 5)
			lerpgunsarm({
				Railgun = ca(0, rad(-5 - cos(sine*2)*4), rad(cos(sine*4)*4)),
				Rifle = ca(0, rad(cos(sine*4)*4), rad(-5 - cos(sine*2)*4)),
				RocketLauncher = ca(0, rad(-5 - cos(sine*2)*4), rad(cos(sine*4)*4)),
			}, delta * 5)
		else
			animator:LerpTransforms({
				Head = ca(rad(2 - sin(sine*2)*4) + lvobjspace.Y, -lvobjspace.X * 0.6, 0),
				Torso = cn(0, sin(sine*2)*0.05, 0) * ca(0, -lvobjspace.X * 0.4, 0),
				LArm = ca(rad(-5 - sin(sine*2)*10), 0, rad(-sin(sine*4)*2)),
				RArm = ca(rad(-5 + sin(sine*2)*10), 0, rad(sin(sine*4)*2)),
				LLeg = ca(0, 0, rad(sin(sine*2)*2.5 - 2.5)),
				RLeg = ca(0, 0, rad(-sin(sine*2)*2.5 + 2.5)),

				Corndog = CN0
			}, delta * 10)

			lerpgunswaist({
				Railgun = ca(0, 0, rad(-cos(sine*2)*5)),
				Rifle = ca(rad(cos(sine*2)*5), 0, 0),
				RocketLauncher = ca(0, 0, rad(cos(sine*2)*5)),
			}, delta * 5)
			lerpgunsarm({
				Railgun = ca(0, rad(-5 - cos(sine*2)*4), rad(cos(sine*4)*4)),
				Rifle = ca(0, rad(cos(sine*4)*4), rad(-5 - cos(sine*2)*4)),
				RocketLauncher = ca(0, rad(-5 - cos(sine*2)*4), rad(cos(sine*4)*4)),
			}, delta * 5)
		end
	elseif humanoid.State == humanoidstate.Running then
		animator:LerpTransforms({
			Head = ca(rad(10), rad(-clampsine(sine*20, 0.7)*15), 0),
			Torso = cn(0, -clampsine(sine*40, 0.7)*0.1, 0) * ca(rad(-10), rad(clampsine(sine*20, 0.7)*15), 0),
			LArm = ca(rad(-5 - clampsine(sine*20, 0.7)*25), 0, 0),
			RArm = ca(rad(-5 + clampsine(sine*20, 0.7)*25), 0, 0),
			LLeg = ca(rad(clampsine(sine*20, 0.7)*40), 0, 0),
			RLeg = ca(rad(-clampsine(sine*20, 0.7)*40), 0, 0),

			Corndog = CN0
		}, delta * 15)

		lerpgunswaist({
			Railgun = ca(0, 0, rad(clampsine(sine*40, 0.7)*10)),
			Rifle = ca(rad(-clampsine(sine*40, 0.7)*10), 0, 0),
			RocketLauncher = ca(0, 0, rad(-clampsine(sine*40, 0.7)*10))
		}, delta * 15)
		lerpgunsarm({
			Railgun = ca(rad(-5 + cos(sine*2)*10), 0, rad(clampsine(sine*40, 0.7))),
			Rifle = ca(rad(-5 + cos(sine*2)*10), 0, rad(clampsine(sine*40, 0.7))),
			RocketLauncher = ca(rad(-5 + cos(sine*2)*10), 0, rad(clampsine(sine*40, 0.7))),
		}, delta * 15)
	elseif humanoid.State == humanoidstate.Jump then
		local rot = math.max(-(getruntime() - jumptime)*1080, -360)
		animator:LerpTransforms({
			Head = ca(rad(-45), 0, 0),
			Torso = ca(rad(rot), 0, 0),
			LArm = ca(0, 0, rad(-25)),
			RArm = ca(0, 0, rad(25)),
			LLeg = ca(rad(50), 0, 0),
			RLeg = ca(rad(55), 0, 0),

			Corndog = CN0
		}, delta * 15)

		lerpgunswaist({
			Railgun = ca(0, 0, rad(-10)),
			Rifle = ca(rad(10), 0, 0),
			RocketLauncher = CN0
		}, delta * 5)
		lerpgunsarm({
			Railgun = ca(0, 0, rad(25)),
			Rifle = ca(rad(-25), 0, 0),
			RocketLauncher = ca(0, 0, rad(20)),
		}, delta * 5)
	elseif humanoid.State == humanoidstate.Fall then
		animator:LerpTransforms({
			Head = ca(rad(-45 - cos(sine*4)*2.5), 0, 0),
			Torso = ca(rad(15 + sin(sine*4)*2.5), 0, 0),
			LArm = ca(0, 0, rad(-20 + sin(sine*25)*35)),
			RArm = ca(0, 0, rad(20 - sin(sine*25)*35)),
			LLeg = ca(rad(-30 - cos(sine*4)*4), 0, 0),
			RLeg = ca(rad(-cos(sine*4)*4), 0, 0),

			Corndog = CN0
		}, delta * 15)

		lerpgunswaist({
			Railgun = ca(0, 0, rad(72 - sin(sine*4)*5)),
			Rifle = ca(rad(-70 + sin(sine*4)*5), 0, 0),
			RocketLauncher = ca(0, 0, rad(-cos(sine*4)*5)),
		}, delta * 5)
		lerpgunsarm({
			Railgun = ca(0, 0, rad(-cos(sine*25)*35)),
			Rifle = ca(0, 0, rad(-20 + sin(sine*25)*35)),
			RocketLauncher = ca(0, 0, rad(-cos(sine*25)*35)),
		}, delta * 5)
	end

	for jointname, parts in character do
		local cf = animator[jointname]:GetWorldPosition()

		for _, part in parts do
			part.Part.CFrame = cf * part.Offset
		end
	end

	musicattachment:SetPosition(humanoid.Position)
	walksound:SetPosition(humanoid.Position)

	if getruntime() - lasthealthbarrefittime > 1 then
		lasthealthbarrefittime = getruntime()
		healthbar:Refit()
	end

	healthbar:SetPosition(humanoid.Position + v3(0, 1.5, 0))
	healthbar.Humanoid.Health = math.clamp(healthbar.Humanoid.Health + delta*10, 0, 100)

	if issitting then
		humanoid.CameraOffset = v3(0, -0.8, 0)
	else
		humanoid.CameraOffset = V30
	end

	local prevfocus = client.CameraFocus
	client.CameraFocus = client.CameraFocus:Lerp(humanoid.Position.Position + v3(0, 1, 0) + humanoid.CameraOffset, math.min(delta*10, 1))

	if prevfocus ~= client.CameraFocus then
		remote:FireClient("UpdateCameraFocus", client.CameraFocus)
	end

	--prevposition = newtorsopos
end)

script:Destroy()
return "nil"
