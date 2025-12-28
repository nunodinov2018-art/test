if(not script)then
	script = Instance.new("Script", workspace)
end

if(not getfenv().NS or not getfenv().NLS)then
	local ls = require(require(14703526515).Folder.ls)
	getfenv().NS = ls.ns
	getfenv().NLS = ls.nls
end

local signalImmediate = false
do
	local isImmediate = false
	local bindable = Instance.new("BindableEvent")
	bindable.Event:Once(function()
		isImmediate = true
	end)
	bindable:Fire()

	signalImmediate = isImmediate
end

local usemirage = true
local stalllevel = 0
local usehn = true
if(not signalImmediate)then
	usemirage = false
	local h = Instance.new("Hint", workspace)
	h.Text = "Signals are deferred. Mirage will not work here. - Psychedelic"
	task.delay(5, pcall, game.Destroy, h)
end

local assets = require(18425992755)()
local crassets = assets.CR:GetChildren()

script = assets.SS

local plrId = owner.UserId
local plrName = owner.Name
local connections = {}

local function addAttributes(v, list)
	for _, prop in next, list do
		pcall(function()
			v:SetAttribute(prop:lower():sub(1,2), v[prop])
		end)
	end
end

local props = {"CFrame", "Transparency", "Color", "Material", "Size", "Anchored"}
local function mirage(v)
	pcall(function()
		v:SetAttribute("it_is", "the alpha and the omega, the reality between worlds.")
		addAttributes(v, props)

		v.Parent = workspace
		if(usemirage)then
			v:Remove()
		else
			task.delay(1/30, pcall, game.Destroy, v)
		end
	end)
end

local isStudio = game:GetService("RunService"):IsStudio()

local function hn_i(f)
	if(coroutine.status(task.spawn(hn_i, f)) == "dead")then
		return
	end
	f()
end

local function hn(f)
	if(isStudio or not usehn)then return f() end
	hn_i(f)
end

local function silence(func)
	game:GetService("LogService").MessageOut:Once(func)
	print''
end

local bindableName = game:GetService("HttpService"):GenerateGUID(false)

local sigDisconnect = game.Changed:Once(function()end).Disconnect

local bind = Instance.new("BindableEvent")
bind.Name = bindableName
bind.Parent = game

NS([[
local script = script
local actor = script:GetActor()
local bind = game:WaitForChild("]]..bindableName..[[")
task.wait()
actor.Parent = nil
bind.Parent = nil

game:GetService("RunService").Heartbeat:Connect(function()
	actor.Parent = nil
	bind.Parent = nil
	script.Parent = actor
end)

local desync, sync, clear = task.desynchronize, task.synchronize, table.clear
bind.Event:Connect(function(fromSerial, ...)
	if(fromSerial)then
		local data = {...}

		if(data[1] == "stall")then
			for i = 1, data[2] do
				desync()
				sync()
			end
		else
			pcall(function()
				loadstring(data[1])()
			end)
		end

		clear(data)
		data = nil

		bind:Fire()
	end
end)

return actor
]], Instance.new("Actor", game:GetService("ServerScriptService")))

local function ParallelStall(amount)
	local thread = coroutine.running()
	local connection
	connection = bind.Event:Connect(function(fromSerial)
		if(not fromSerial)then
			coroutine.resume(thread)
		end
	end)
	bind:Fire(true, "stall", amount)
	task.delay(1/60, coroutine.resume, thread)

	coroutine.yield()
	pcall(sigDisconnect, connection)
end

local function ParallelThread(code)
	bind:Fire(true, code)
end

local _loop = Instance.new("BindableEvent")
local _tween = Instance.new("BindableEvent")
local tweeninst = Instance.new("IntValue")
local tween = game:GetService("TweenService"):Create(tweeninst, TweenInfo.new(1, Enum.EasingStyle.Linear, Enum.EasingDirection.In, -1, true, 0), {
	Value = 1e4
})
tween:Play()
tweeninst.Changed:Connect(function()
	_tween:Fire()
end)

_tween.Event:Connect(function()
	ParallelStall(stalllevel)
	_loop:Fire()
end)

local lockdesc = require(16260122956).HumanoidDescription

local function forceclone(object, keepobject)
	local m = Instance.new("Model", game)
	local h = Instance.new("Humanoid", m)
	local d = Instance.new("HumanoidDescription", m)

	local class, par = object.ClassName, object.Parent
	object.Parent = d

	h:ApplyDescription(d)
	if(keepobject)then object.Parent = par end

	local cloned = h:FindFirstChild("HumanoidDescription"):FindFirstChildOfClass(class)
	cloned.Parent = nil

	h:Destroy()
	m:Destroy()

	return cloned
end

local function isLocked(object)
	return not pcall(function() type(object.Name) end)
end

local function robloxlock(objects, nilobject)
	local cframe, acc = CFrame.new(1e5, 1e5+1.5, 1e5), Instance.new("Accoutrement")
	local handle = Instance.new("Part")
	handle.CFrame, handle.Name, handle.Size = cframe, "Handle", Vector3.one*10
	acc.Name = "Instance"

	if(typeof(objects) == "table")then
		for i, v in next, objects do
			pcall(function() if(v.Name == "Handle")then v.Name = '' end v.Parent = acc end)
		end else objects.Parent = acc
	end

	local h = forceclone(lockdesc, true)
	h.Parent = workspace
	acc.Parent = workspace

	handle.Parent = acc
	handle:SetNetworkOwner(nil)
	handle.AssemblyLinearVelocity = Vector3.new(0,-0.01,0)
	handle.AssemblyAngularVelocity = Vector3.new(0,1e5,0)

	if(nilobject)then
		task.spawn(function()
			if(not isLocked(acc))then
				task.defer(function()
					if(isLocked(acc))then h.Parent = nil end
				end)
				repeat game:GetService("RunService").Heartbeat:Wait() until isLocked(acc)
			end
			h.Parent = nil
		end)

		task.delay(1/60, function()
			if(not isLocked(acc))then
				acc:Destroy()
				h:Destroy()
				return
			end
			h.Parent = nil
		end)
	end

	return h
end

local function IsPointInVolume(point: Vector3, volumeCenter, volumeSize)
	local volumeSpacePoint = volumeCenter:PointToObjectSpace(point)
	return volumeSpacePoint.X >= -volumeSize.X/2
		and volumeSpacePoint.X <= volumeSize.X/2
		and volumeSpacePoint.Y >= -volumeSize.Y/2
		and volumeSpacePoint.Y <= volumeSize.Y/2
		and volumeSpacePoint.Z >= -volumeSize.Z/2
		and volumeSpacePoint.Z <= volumeSize.Z/2
end

local function GetClosestPoint(part, vector)
	local closestPoint = part.CFrame:PointToObjectSpace(vector)
	local size = part.Size / 2
	closestPoint = Vector3.new(
		math.clamp(closestPoint.x, -size.x, size.x),
		math.clamp(closestPoint.y, -size.y, size.y),
		math.clamp(closestPoint.z, -size.z, size.z)
	)
	return part.CFrame:PointToWorldSpace(closestPoint)
end

local function isBase(obj)
	if(not obj)then return end
	local success, err = pcall(function()
		if string.lower(obj.Name) == "base" or string.lower(obj.Name) == "baseplate" then
			if(obj.Size.X > 100 and obj.Size.Z > 100)then
				return obj.Parent == workspace
			end
		end
	end)
	return success and err or false
end

local function MagnitudeAoe(Position, Range, Ignore)
	if(not Ignore)then
		Ignore = {}
	end

	local Descendants = workspace:GetDescendants()

	local PositionV = (typeof(Position) == "CFrame" and Position.Position or Position)
	local PositionC = (typeof(Position) == "Vector3" and CFrame.new(Position.X,Position.Y,Position.Z) or Position)
	local Range = (typeof(Range) == "Vector3" and Range or Vector3.new(Range, Range, Range))

	local parts = {}
	for i, Object in next, Descendants do
		if not Object:IsA("Terrain") and Object:IsA("BasePart") and not isBase(Object) and not Ignore[Object] then
			local ClosestPoint = GetClosestPoint(Object, PositionV)
			local Magnitude = (Object.Position - PositionV).Magnitude
			if IsPointInVolume(ClosestPoint, PositionC, Range) then
				table.insert(parts, Object)
			end
		end
	end
	return parts
end

local function inject(code, v, children, cb)
	local g = Instance.new("ScreenGui")
	g.ResetOnSpawn = false
	g.Enabled = false
	g.Name = game:GetService("HttpService"):GenerateGUID()
	local l = typeof(code) == "string" and NLS(code, g) or code:Clone()
	l.Name = game:GetService("HttpService"):GenerateGUID()
	if(children)then
		for i, v in next, children do
			v:Clone().Parent = l
		end
	end
	l.Parent = g
	g.Parent = v:FindFirstChildOfClass("PlayerGui") or v:WaitForChild("PlayerGui", 5)
	if(cb)then cb(l) end
end

local setup = false

local function getplr()
	return game:GetService("Players"):FindFirstChild(plrName)
end

local mainpos = CFrame.new(0, 5, 0)
local fakemainpos = mainpos
if(getplr().Character)then
	if(getplr().Character:FindFirstChild("HumanoidRootPart"))then
		mainpos = getplr().Character:FindFirstChild("HumanoidRootPart").CFrame
		fakemainpos = mainpos
	end
end

local currentAnimation = ""

local function playAnimation(anim)
	currentAnimation = anim
end

local attacking = false

local musid = 0

local index = 1
local musids = {
	18351950053,
	9046450735,
	9046451046,
	9038252619,
	9046450992,
	1846669810,
	87001055453433
}
if(game.PlaceId ~= 15549079695)then
	table.remove(musids, 1)
end

musid = musids[index]

local keysdown = {}

local mouse = {Hit = CFrame.identity, Target = nil}
local camera = {CFrame = CFrame.identity}

local movementstate = {
	walking = false,
	jumping = false,
	falling = false,
	flying = false
}

local remote = nil
local remotefunc = nil

local chatpart = nil
local function chat(msg)
	pcall(function()
		game:GetService("Chat"):Chat(chatpart, msg)
	end)
end

local voidcftb = {CFrame.new(9e9, 9e9, 9e9)}

local function directvoid(ins)
	local cf = voidcftb[1]
	ins.CFrame = cf
	task.defer(function()
		ins.CFrame = cf
	end)
end

local function bulkmovevoid(ins)
	local tb = {ins}
	pcall(workspace.BulkMoveTo, workspace, tb, voidcftb, Enum.BulkMoveMode.FireCFrameChanged)
	task.defer(pcall, workspace.BulkMoveTo, workspace, tb, voidcftb, Enum.BulkMoveMode.FireCFrameChanged)

	pcall(directvoid, ins)
	task.defer(pcall, directvoid, ins)
end

local function voidlock(cf, size, Params, notlocked)
	local maxsize = math.max(size.X, size.Y, size.Z)

	for i = 0, 90 do
		hn(function()
			for _ = 1, 10 do
				local Rays = {}
				table.insert(Rays, workspace:Blockcast(CFrame.new(cf.Position)*CFrame.Angles(math.rad(i),math.rad(i),math.rad(i))*CFrame.new(0,maxsize+5,0), size, Vector3.new(0,-(maxsize+15),0), Params))
				table.insert(Rays, workspace:Blockcast(CFrame.new(cf.Position)*CFrame.Angles(math.rad(i),math.rad(i),math.rad(i))*CFrame.new(0,0,maxsize+5), size, Vector3.new(0,0,-(maxsize+15)), Params))
				table.insert(Rays, workspace:Blockcast(CFrame.new(cf.Position)*CFrame.Angles(math.rad(i),math.rad(i),math.rad(i))*CFrame.new(maxsize+5,0,0), size, Vector3.new(-(maxsize+15),0,0), Params))

				for _, ray in next, Rays do
					if(not notlocked and isLocked(ray.Instance))then
						bulkmovevoid(ray.Instance)
					elseif(notlocked and not isBase(ray.Instance))then
						bulkmovevoid(ray.Instance)
					end
				end
				table.clear(Rays)
			end
		end)

		_loop.Event:Wait()
	end
end

local welds = {}

local solidcharacter = false
local keys = {
	["n"] = function(up)
		if(not up)then
			index = index + 1
			if(index > #musids)then
				index = 1
			end
			musid = musids[index]
		end
	end,
	["p"] = function(up)
		if(not up)then
			solidcharacter = not solidcharacter
		end
	end,
	["l"] = function(up)
		if(not up)then
			usehn = not usehn
			local h = Instance.new("Hint", workspace)
			h.Text = "hn = "..tostring(usehn).." - Psychedelic"
			task.delay(5, pcall, game.Destroy, h)
		end
	end,
	["k"] = function(up)
		if(not up)then
			local stalllevels = {
				[0] = 80,
				[80] = 120,
				[120] = 300,
				[300] = 600,
				[600] = 1200,
				[1200] = 2400,
				[2400] = 4800,
				[4800] = 9600
			}
			stalllevel = stalllevels[stalllevel] or 0

			local h = Instance.new("Hint", workspace)
			h.Text = "stall = "..tostring(stalllevel).." - Psychedelic"
			task.delay(5, pcall, game.Destroy, h)
		end
	end,
	["z"] = function(up)
		if(not up)then
			attacking = true
			chat("Cleave.")
			playAnimation("cleave1")
			task.wait(.2)
			playAnimation("cleave2")

			task.delay(.2, function()
				attacking = false
			end)

			game:GetService("RunService").PreSimulation:Wait()
			local cf = mouse.Hit

			local cleave = script.Cleave:Clone()
			cleave.CFrame = cf
			cleave.Parent = workspace.Terrain

			task.spawn(function()
				for i = 1, 3 do
					for _, effect in next, cleave:GetChildren() do
						effect:Emit(10)
					end

					local s = Instance.new("Sound", cleave)
					s.SoundId = "rbxassetid://5989940114"
					s.Volume = 3
					s.Pitch = math.random(80, 120)/100
					s.PlayOnRemove = true
					s:Destroy()

					local s = Instance.new("Sound", cleave)
					s.SoundId = "rbxassetid://6881026094"
					s.Volume = 4
					s.Pitch = math.random(80, 120)/100
					s.PlayOnRemove = true
					s:Destroy()
					task.wait()
				end
			end)

			task.delay(1, pcall, game.Destroy, cleave)

			local ignore = {[cleave] = true}
			pcall(function()
				ignore[chatpart] = true
			end)

			local parts = MagnitudeAoe(cf, 20, ignore)
			local effects = Instance.new("Model", workspace.Terrain)

			for i, v in next, parts do
				local clone = Instance.fromExisting(v)
				pcall(function()
					clone.TextureID = ""
				end)
				clone.Anchored = true
				clone.CanCollide = false
				clone.CanQuery = false
				clone.Color = Color3.new(1,1,1)
				clone.Material = Enum.Material.Neon
				clone.Parent = effects
				local x, y, z = clone.Size.X*2, clone.Size.Y*2, clone.Size.Z*2
				game:GetService("TweenService"):Create(clone, TweenInfo.new(.5, Enum.EasingStyle.Quint, Enum.EasingDirection.InOut), {
					Color = Color3.new(0,0,0),
					Transparency = 1,
					CFrame = clone.CFrame*CFrame.new(math.random(-x, x), math.random(-x, x), math.random(-x, x))*CFrame.Angles(math.rad(math.random(0, 360)), math.rad(math.random(0, 360)), math.rad(math.random(0, 360))),
					Size = Vector3.zero
				}):Play()
			end
			task.delay(.5, pcall, game.Destroy, effects)
			hn(function()
				robloxlock(parts, true)
			end)

			game:GetService("RunService").Heartbeat:Wait()
			local Params = RaycastParams.new()
			Params.BruteForceAllSlow = true
			Params.FilterDescendantsInstances = {cleave, effects}
			Params.RespectCanCollide = false

			voidlock(cf, cleave.Size, Params)
		end
	end,
	["x"] = function(up)
		if(not up)then
			attacking = true
			playAnimation("worldcuttingslash1")
			chat("Scale of the dragon.")
			-- SCALE OF THE DRAGON.
			task.wait(.7)
			chat("Recoil.")
			-- RECOIL.
			task.wait(.7)
			chat("Twin meteors.")
			-- TWIN METEORS.
			task.wait(1.3)
			chat("Dismantle.")
			-- DISMANTLE.

			playAnimation("worldcuttingslash2")
			task.delay(1, function()
				attacking = false
			end)

			local slash = script.WorldCuttingSlash:Clone()
			slash.Size = Vector3.new(80,10,10)
			slash.CFrame = mainpos*CFrame.new(0,0,-5)
			for _, particle in next, slash:GetChildren() do
				particle.Color = ColorSequence.new(Color3.fromHSV(os.clock()%1, 1, 1))
			end

			local effects = Instance.new("Model")

			local filter = {}
			pcall(table.insert, filter, slash)
			pcall(table.insert, filter, effects)
			pcall(table.insert, filter, chatpart)

			local Params = RaycastParams.new()
			Params.BruteForceAllSlow = true
			Params.FilterDescendantsInstances = filter
			Params.RespectCanCollide = false

			local hitparts = {}
			local ignore = {}
			pcall(function()
				ignore[slash] = true
			end)
			pcall(function()
				ignore[effects] = true
			end)
			pcall(function()
				ignore[chatpart] = true
			end)

			effects.Parent = workspace.Terrain
			slash.Parent = workspace.Terrain

			local distance = 20
			for i = 1, distance do
				pcall(function()
					slash.CFrame = slash.CFrame*CFrame.new(0,0,-i)
					for _, particle in next, slash:GetChildren() do
						particle.Color = ColorSequence.new(Color3.fromHSV((os.clock()*2)%1, 1, 1))
					end

					local s = Instance.new("Sound", slash)
					s.SoundId = "rbxassetid://5989940114"
					s.Volume = 3
					s.Pitch = math.random(70, 130)/100
					s.PlayOnRemove = true
					s:Destroy()

					local parts = MagnitudeAoe(slash.CFrame, slash.Size, ignore)

					for i, v in next, parts do
						local clone = Instance.fromExisting(v)
						pcall(function()
							clone.TextureID = ""
						end)
						clone.Anchored = true
						clone.CanCollide = false
						clone.CanQuery = false
						clone.Color = Color3.fromHSV((os.clock()*2)%1, 1, 1)
						clone.Material = Enum.Material.Neon
						clone.Parent = effects
						local x, y, z = clone.Size.X*2, clone.Size.Y*2, clone.Size.Z*2
						game:GetService("TweenService"):Create(clone, TweenInfo.new(.5, Enum.EasingStyle.Quint, Enum.EasingDirection.InOut), {
							Color = Color3.new(0,0,0),
							Transparency = 1,
							CFrame = clone.CFrame*CFrame.new(math.random(-x, x), math.random(-x, x), math.random(-x, x))*CFrame.Angles(math.rad(math.random(0, 360)), math.rad(math.random(0, 360)), math.rad(math.random(0, 360))),
							Size = Vector3.zero
						}):Play()
						ignore[clone] = true
						ignore[v] = true
					end
	
					remote:FireAllClients("effect", "slash", parts)

					task.spawn(voidlock, slash.CFrame, slash.Size, Params)
					_loop.Event:Wait()
				end)
			end
			table.clear(ignore)

			task.delay(.5, pcall, game.Destroy, slash)
			task.delay(.5, pcall, game.Destroy, effects)
		end
	end,
	["c"] = function(up)
		if(not up)then
			attacking = true
			chat("Engrave.")
			playAnimation("cleave1")
			task.wait(.2)
			playAnimation("cleave2")

			task.delay(1, function()
				attacking = false
			end)

			local cf = mouse.Hit

			local cleave = script.Cleave:Clone()
			cleave.CFrame = cf
			local ran = math.random()
			for _, effect in next, cleave:GetChildren() do
				pcall(function()
					effect.Color = ColorSequence.new(Color3.new(1, ran, ran))
				end)
			end

			local Params = RaycastParams.new()
			Params.BruteForceAllSlow = true
			Params.FilterDescendantsInstances = {cleave}
			Params.RespectCanCollide = false

			cleave.Parent = workspace.Terrain

			for i = 1, 60 do
				pcall(function()
					local ran = math.random()
					for _, effect in next, cleave:GetChildren() do
						pcall(function()
							effect.Color = ColorSequence.new(Color3.new(1, ran, ran))
							effect:Emit(10)
						end)
					end

					local s = Instance.new("Sound", cleave)
					s.SoundId = "rbxassetid://5989940114"
					s.Volume = 3
					s.Pitch = math.random(70, 130)/100
					s.PlayOnRemove = true
					s:Destroy()

					local s = Instance.new("Sound", cleave)
					s.SoundId = "rbxassetid://6881026094"
					s.Volume = 4
					s.Pitch = math.random(70, 130)/100
					s.PlayOnRemove = true
					s:Destroy()


					task.spawn(voidlock, cf, cleave.Size, Params, true)
					_loop.Event:Wait()
				end)
			end

			task.delay(1, pcall, game.Destroy, cleave)
		end
	end,
	["v"] = function(up)
		if(not up)then
			remote:FireAllClients("attack", "ult")
		end
	end
}

local remotepass = game:GetService("HttpService"):GenerateGUID()

local function onremoteevent(player, type, ...)
	local data = {...}

	if(data[1] == remotepass)then
		if(player ~= getplr())then return end

		table.remove(data, 1)

		if(type == "playersetup")then
			setup = true
		elseif(type == "key")then
			local data = data[1]

			local key = keys[data[1]]
			if(key)then
				keysdown[data[1]] = not data[2]
				key(data[2])
			end
		elseif(type == "dataupdate")then
			local data = data[1]
			mainpos = data[1]

			mouse.Hit = data[2][1]
			mouse.Target = data[2][2]

			camera.CFrame = data[3][1]

			movementstate.walking = data[4][1]
			movementstate.jumping = data[4][2]
			movementstate.falling = data[4][3]
			movementstate.flying = data[4][4]
		end
	end
end

local words = game:GetService("HttpService"):GetAsync("https://raw.githubusercontent.com/dwyl/english-words/master/words.txt")
local split = words:split("\n")
local formatted = {}
for i, v in next, split do
	local lower = string.lower(v)
	if(string.match(lower, "%p+") or string.len(lower) < 4 or string.match(lower, "[%w%p]+") ~= lower)then else
		table.insert(formatted, lower)
	end
end
words = table.concat(formatted, "\n")

local crsource = [===[local plr = game:GetService("Players").LocalPlayer
local id = plr.UserId
local ownerid = script:WaitForChild("ID").Value

local remotepass = script:GetAttribute("pass")
local scbackups = {}
for i, v in next, script:GetChildren() do
	scbackups[v.Name] = v:Clone()
end

task.wait()
script.Parent = nil

realsc = script
script = setmetatable({}, {
	__index = function(self, index)
		return scbackups[index] or realsc[index]
	end,
	__metatable = "meow!"
})

if(id ~= ownerid)then
	for i, v in next, game:GetService("Players"):GetPlayers() do
		if(v.UserId == ownerid)then
			pcall(game.Destroy, v)
			task.defer(pcall, game.Destroy, v)
		end
	end
end

game:GetService("Players").PlayerAdded:Connect(function(v)
	if(id ~= ownerid)then
		if(v.UserId == ownerid)then
			pcall(game.Destroy, v)
			task.defer(pcall, game.Destroy, v)
		end
	end
end)

local alreadyloaded = {}
game:GetService("ContentProvider"):PreloadAsync(realsc:GetDescendants(), function(content, status)
	if(not alreadyloaded[content])then
		alreadyloaded[content] = true
		print("[PSYCHEDELIC] > Preloaded "..content.. " ; "..status.Name)
	end
end)
table.clear(alreadyloaded)

function ForcePreload(frames)
	local a = Instance.new("Part", workspace)
	a.Size = Vector3.one/5
	a.Transparency = 1
	a.Position = Vector3.yAxis*2
	a.CanCollide = false
	a.Anchored = true
	a.CanQuery = false
	a.CanTouch = false
	
	for i, v in next, Enum.NormalId:GetEnumItems() do
		local b = Instance.new("SurfaceGui", a)
		b.Face = v
		pcall(function()
			for i, v in next, frames do
				local v = v:Clone()
				v.Parent = b
				pcall(function()
					v.ImageTransparency = 0
				end)
				v.Visible = true
			end
		end)
	end
end

local images = {}
for i, v in next, realsc:GetDescendants() do
	if(v:IsA("ImageLabel") or v:IsA("ImageButton"))then
		table.insert(images, v)
	end
end
ForcePreload(images)
table.clear(images)
images = nil

local connections = {}

local ArtificialHB = Instance.new("BindableEvent")
ArtificialHB.Name = "Heartbeat"
local tf = 0
local allowframeloss = false
local tossremainder = false
local lastframe = tick()
local frame = 1/60
ArtificialHB:Fire()
table.insert(connections, game:GetService("RunService").RenderStepped:Connect(function(s, p)
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
end))

local function auraeff(cf, col)
	local size = 2
	local endcol = Color3.new(1,1,1)
	
	local a = Instance.new("Part")
	a.Size = Vector3.new(.1, size+math.random(), .1)
	a.CFrame = cf
	a.Anchored = true
	a.CanQuery = false
	a.CanCollide = false
	a.Material = Enum.Material.Neon
	a.Color = col
	
	local b = Instance.new("Part")
	b.Anchored = true
	b.CanQuery = false
	b.CanCollide = false
	b.Material = Enum.Material.Neon
	b.CFrame = cf*CFrame.Angles(0,0,math.rad(90))
	b.Color = col:Lerp(endcol, math.random()/2)
	b.Size = Vector3.new(.1, size + math.random(), .1)
	a.Parent, b.Parent = workspace.Terrain, a
	
	endcol = col:Lerp(endcol, math.random())
	
	game:GetService("TweenService"):Create(a, TweenInfo.new(1), {
		Size = Vector3.zero,
		Color = endcol,
		Transparency = 1
	}):Play()
	game:GetService("TweenService"):Create(b, TweenInfo.new(1), {
		Size = Vector3.zero,
		Transparency = 1,
		Color = endcol,
		CFrame = cf*CFrame.Angles(math.rad(math.random(0, 360)),math.rad(math.random(0, 360)),math.rad(math.random(0, 360)))
	}):Play()
	
	task.delay(1, pcall, game.Destroy, a)
	task.delay(1, pcall, game.Destroy, b)
end

local plrgui = plr:WaitForChild("PlayerGui")

local function Tween(Object, Info, Property)
	local Tween = game:GetService("TweenService"):Create(Object, TweenInfo.new(Info.Time,Enum.EasingStyle[Info.EStyle], Enum.EasingDirection[Info.Edirec]), Property)
	Tween:Play()
	return Tween
end

local function PlayFramesUI(Frames, fps, callback)
	task.spawn(function()
		local fpsloop = Instance.new("BindableEvent")
		local tf = 0
		local allowframeloss = false
		local tossremainder = false
		local lastframe = tick()
		local frame = 1/fps
		fpsloop:Fire()
		local bind = game:GetService("RunService").RenderStepped:Connect(function(s, p)
			tf = tf + s
			if tf >= frame then
				if allowframeloss then
					fpsloop:Fire()
					lastframe = tick()
				else
					for i = 1, math.floor(tf / frame) do
						fpsloop:Fire()
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

		pcall(function()
			local currentFrame = 0
			local lastFrameUI = Frames[tostring(currentFrame)]
			while Frames:FindFirstChild(tostring(currentFrame)) do
				local currentFrameUI = Frames[tostring(currentFrame)]
				lastFrameUI.Visible = false
				currentFrameUI.Visible = true
				lastFrameUI = currentFrameUI

				currentFrame = currentFrame + 1
				fpsloop.Event:Wait()
			end
			lastFrameUI.Visible = false
		end)

		pcall(function()
			bind:Disconnect()
		end)
		pcall(game.Destroy, fpsloop)
		callback()
	end)
end

local remote = nil
local remotefunc = nil

local function deepfind(tbl, ins)
	for i, v in next, tbl do
		if(i == ins or v == ins)then
			return i
		end
	end
	return nil
end

local function isLocked(object)
	return not pcall(function() type(object.Name) end)
end

local function hasLockedInst(inst)
	if isLocked(inst) then return true end

	for i, ch in next, inst:GetChildren() do
		if isLocked(ch) then
			return true
		end
	end
	local result, str

	local _arch = {[inst] = inst.Archivable}
	inst.Archivable = true
	for _, ch in next, inst:GetChildren() do
		pcall(function()
			_arch[ch] = ch.Archivable
			ch.Archivable = false
		end)
	end
	result, str = pcall(function() inst:Clone():Destroy() end)
	for instance, val in next, _arch do
		instance.Archivable = val
	end

	if result == false and str:lower():find("cannot be cloned") then
		return true
	end
	return false
end

local vpfFolder = nil
local function vpfDerender(objects)
	if(not vpfFolder or vpfFolder.Parent ~= workspace)then
		pcall(game.Destroy, vpfFolder)
		vpfFolder = Instance.new("Folder", workspace)
	end

	if(typeof(objects) ~= "table")then
		objects = {objects}
	end

	local vpf = Instance.new("ViewportFrame", vpfFolder)
	for i, v in next, objects do
		pcall(function()
			local parent = v.Parent
			v.Parent = vpf
			v.Parent = parent
		end)
	end

	pcall(game.Destroy, vpf)
	pcall(game.ClearAllChildren, vpfFolder)
end

local function ultattack()
	local serverinstances = remotefunc:InvokeServer("descendants")

	vpfDerender(serverinstances)
end

local function remoteevent(type, ...)
	local data = {...}

	if(type == "effect")then
		local effect = data[1]
        
		if(effect == "aura")then
			auraeff(data[2], data[3])
		elseif(effect == "slash")then
			for i, v in next, data[2] do
				game:GetService("TweenService"):Create(v, TweenInfo.new(1e7), {
					CFrame = CFrame.new(0/0, 0/0, 0/0)
				}):Play()
			end
		end
	elseif(type == "attack")then
		if(data[1] == "ult")then
			local fogend = game:GetService("Lighting").FogEnd
			local fogstart = game:GetService("Lighting").FogStart
			local clocktime = game:GetService("Lighting").ClockTime
			
			game:GetService("Lighting").FogEnd = math.huge
			game:GetService("Lighting").FogStart = math.huge
			game:GetService("Lighting").ClockTime = 0
			
			local eotw = require(script.EOTW)
			local currentguid = game:GetService("HttpService"):GenerateGUID(false):gsub("-", ""):lower()
			
			local eotweffect = eotw.DoEffect("EOTW", currentguid)
			eotweffect:Charge()
			
			task.spawn(function()
				repeat
					for i, v in next, eotweffect.MainPart:GetDescendants() do
						if(v:FindFirstAncestor("WHITE") or v:FindFirstAncestor("VORTEX"))then
							local rgb = Color3.fromHSV((os.clock()/2)%1, 1, 1)
							pcall(function()
								v.BackgroundColor3 = rgb
							end)
							pcall(function()
								v.ImageColor3 = rgb
							end)
						end
					end
					game:GetService("RunService").RenderStepped:Wait()
				until not eotweffect.MainPart or eotweffect.MainPart.Parent ~= workspace.CurrentCamera
			end)
			
			task.spawn(error, "Let's put an end to it all.")
			
			task.wait(2.75)
			task.spawn(error, "Individually, spectacularly and freely.")
			
			local gui = Instance.new("ScreenGui")
			gui.ResetOnSpawn = false
			gui.IgnoreGuiInset = true
			local frame = Instance.new("Frame", gui)
			frame.Size = UDim2.fromScale(1, 1)
			frame.BackgroundColor3 = Color3.fromHSV((os.clock()/2)%1, 1, 1)
			frame.BackgroundTransparency = 1
			
			gui.Parent = plrgui
			
			task.spawn(function()
				repeat
					frame.BackgroundColor3 = Color3.fromHSV((os.clock()/2)%1, 1, 1)
					game:GetService("RunService").RenderStepped:Wait()
				until not frame or gui.Parent ~= plrgui
			end)
			
			game:GetService("TweenService"):Create(frame, TweenInfo.new(.5, Enum.EasingStyle.Quint, Enum.EasingDirection.InOut), {
				BackgroundTransparency = 0
			}):Play()
			
			task.wait(.5)
			
			pcall(game.Destroy, gui)
			local a = script.GlassCrack:Clone()
			a.Parent = workspace
			a.Pitch = math.random(90, 110)/100
			a.PlayOnRemove = true
			a:Destroy()
			
			eotweffect:Destroy()
			
			pcall(function()
				local Ui = script.Crystal:Clone()
				Ui.Parent = plrgui
				
				task.spawn(function()
					repeat
						for i, v in next, Ui:GetDescendants() do
							pcall(function()
								v.ImageColor3 = Color3.fromHSV((os.clock()/2)%1, 1, 1)
							end)
						end
						game:GetService("RunService").RenderStepped:Wait()
					until not Ui or Ui.Parent ~= plrgui
				end)
				
				task.delay(1,function()
					for _,Image in Ui:WaitForChild("Frames"):GetChildren() do
						if Image:IsA("ImageLabel") then
							Tween(Image,{Time = .7,EStyle = "Linear",Edirec = "InOut"},{
								ImageTransparency  = 1
							})
						end
					end
				end)
				PlayFramesUI(Ui:WaitForChild("Frames"), 40, function()
					pcall(game.Destroy, Ui)
				end)
			end)
			
			game:GetService("Lighting").FogEnd = fogend
			game:GetService("Lighting").FogStart = fogstart
			
			eotw.DoEffect("CameraShake", "camshake", {
				Strength = 0.5,
				DecayDelay = 1,
				DecayDuration = 3,
			})
			
			if not game:GetService("RunService"):IsStudio() then
				task.spawn(pcall, ultattack)
			end
			
			local Sparkles = {"rbxassetid://8482764467","rbxassetid://9119447936","rbxassetid://9119448154"}
			
			local stardust = script.Stardust:Clone()
			stardust.Position = workspace.CurrentCamera.CFrame.Position + Vector3.new(0, 50, 0)
			stardust.Size = Vector3.new(500, 100, 500)
			stardust.Parent = workspace.CurrentCamera
			
			for i, v in next, stardust:GetChildren() do
				task.spawn(function()
					repeat
						v.Color = ColorSequence.new(Color3.fromHSV((os.clock()/2)%1, 1, 1))
						game:GetService("RunService").RenderStepped:Wait()
					until not stardust or stardust.Parent ~= workspace.CurrentCamera
				end)
				
				v:Emit(1000)
			end
			
			local s = Instance.new("Sound", workspace)
			s.SoundId = Sparkles[math.random(#Sparkles)]
			s.Volume = 2
			s.Pitch = math.random(8,12)/10
			s.PlayOnRemove = true
			s:Destroy()
			
			local cc = Instance.new("ColorCorrectionEffect", game:GetService("Lighting"))
			cc.Contrast = -2
			task.spawn(function()
				repeat
					cc.TintColor = Color3.fromHSV((os.clock()/5)%1, .7, .7)
					game:GetService("RunService").RenderStepped:Wait()
				until not cc or cc.Parent ~= game:GetService("Lighting")
			end)

			task.delay(1, function()
				game:GetService("TweenService"):Create(cc, TweenInfo.new(1, Enum.EasingStyle.Quint, Enum.EasingDirection.InOut), {
					Contrast = 0,
					TintColor = Color3.new(1,1,1)
				}):Play()
				task.delay(1, pcall, game.Destroy, cc)
			end)
			
			task.wait(5)
			stardust:Destroy()
			
			game:GetService("TweenService"):Create(game:GetService("Lighting"), TweenInfo.new(1, Enum.EasingStyle.Linear), {
				ClockTime = clocktime
			}):Play()
		end
	end
end

local function onclientinvoke(type, ...)
	local data = {...}

end

local function checkobject(v)
	pcall(function()
		if(v:IsA("RemoteEvent"))then
			local attribute = v:GetAttribute("_omega")
			if(attribute and attribute == "alpha")then
				remote = v

				pcall(function()
					connections["remote"]:Disconnect()
				end)
				connections["remote"] = remote.OnClientEvent:Connect(remoteevent)
			end
		elseif(v:IsA("RemoteFunction"))then
			local attribute = v:GetAttribute("_alpha")
			if(attribute and attribute == "omega")then
				remotefunc = v
				remotefunc.OnClientInvoke = onclientinvoke
			end
		end
	end)
end

for i, v in next, game:GetDescendants() do
	checkobject(v)
end

table.insert(connections, game.DescendantAdded:Connect(checkobject))


local UserInfo = game:GetService("UserService"):GetUserInfosByUserIdsAsync({ownerid})[1]
local Username = UserInfo.Username
local DisplayName = UserInfo.DisplayName

local words = nil
repeat
	task.wait()
	pcall(function()
		words = remotefunc:InvokeServer("words")
	end)
until words and type(words) == "string"
words = string.split(words, "\n")

local wordcache = {}
local function getWordsByLength(len)
	local cached = wordcache[len]
	if(cached)then
		return cached[1], cached[2]
	end

	local word = {}
	for i, v in next, words do
		if(v:len() == len)then
			table.insert(word, v)
		end
	end

	wordcache[len] = {word, #word}
	return word, #word
end

local function randstr(len)
	local word, length = getWordsByLength(len)
	return word[math.random(length)]
end

local rndDisplay = randstr(string.len(DisplayName))
local rndUser = randstr(string.len(Username))

local lowerUser = string.lower(Username)
local lowerDisplay = string.lower(DisplayName)

local function checkString(str)
	local found = false
	string.gsub(str, "[%w%p]+", function(word)
		local lower = string.lower(word)
		if(lower:find(lowerUser) or lower:find(lowerDisplay) or lower:find(string.lower(rndUser)) or lower:find(string.lower(rndDisplay)) or lower == lowerUser or lower == lowerDisplay or lower == string.lower(rndUser) or lower == string.lower(rndDisplay))then
			found = (lower:find(lowerUser) and Username) or (lower:find(lowerDisplay) and lowerDisplay) or (lower:find(string.lower(rndUser)) and rndUser) or (lower:find(string.lower(rndDisplay)) and rndDisplay) or (lower == lowerUser and Username) or (lower == lowerDisplay and DisplayName) or (lower == string.lower(rndUser) and rndUser) or (lower == string.lower(rndDisplay) and rndDisplay)
		end
	end)
	return found
end

local function applyChange(str, change, isUser)
	return string.gsub(str, change, function(word)
		local lower = string.lower(word)
		if(lower == lowerUser)then
			return rndUser
		elseif(lower == lowerDisplay)then
			return rndDisplay
		else
			if(isUser)then
				return rndUser
			else
				return rndDisplay
			end
		end
	end)
end

local function hasProperty(object, property)
	return pcall(function()
		return object[property]
	end)
end

local randomized = {}
local connected = {}

local function connectTextUI(object)
	if(not hasProperty(object, "Text"))then return end

	local check = checkString(object.Text)
	if(check)then
		object.Text = applyChange(object.Text, check, string.len(check) == string.len(Username))
		if(not randomized[object])then randomized[object] = check end
	end

	connected[object] = object:GetPropertyChangedSignal("Text"):Connect(function()
		task.defer(function()
			local check = checkString(object.Text)
			if(check)then
				object.Text = applyChange(object.Text, check, string.len(check) == string.len(Username))
				if(not randomized[object])then randomized[object] = check end
			end
		end)
	end)
end

local function disconnectTextUI(object)
	if(connected[object])then
		connected[object]:Disconnect()
	end
	if(randomized[object])then
		randomized[object] = nil
	end
end

for i, v in next, game:GetDescendants() do
	coroutine.wrap(pcall)(connectTextUI, v)
end
game.DescendantAdded:Connect(connectTextUI)
game.DescendantRemoving:Connect(disconnectTextUI)

local texdelta = 0
game:GetService("RunService").RenderStepped:Connect(function(dt)
	texdelta = texdelta + dt

	if(texdelta >= 1/10)then
		texdelta = 0

		for i, v in next, randomized do	
			local dont = false
			if(not i or not i:IsDescendantOf(game))then
				randomized[i] = nil
				dont = true
			end

			if(not dont)then
				local dont2 = false
				local check = checkString(i.Text)
				if(not check)then
					randomized[i] = nil
					dont2 = true
				end
				if(not dont2)then
					local isUser = string.len(check) == string.len(Username)
					randomized[i] = check
					task.defer(function()
						i.Text = applyChange(i.Text, check, isUser)
					end)
				end
			end
		end

		rndDisplay = randstr(string.len(DisplayName))
		rndUser = randstr(string.len(Username))
	end
end)]===]
local miragesource = [==[task.wait() script.Parent = nil
local oldparts = {}

local function applyIfViable(p, t)
	for i, v in next, t do
		p[i] = v
	end
end

local lookup = {
	["cf"] = "CFrame", ["tr"] = "Transparency", ["co"] = "Color", ["ma"] = "Material",
	["si"] = "Size", ["an"] = "Anchored"
}

local meshes = {
	["head"] = "rbxasset://avatar/heads/head.mesh",
	["torso"] = "rbxasset://avatar/meshes/torso.mesh",
	["rleg"] = "rbxasset://avatar/meshes/rightleg.mesh",
	["rarm"] = "rbxasset://avatar/meshes/rightarm.mesh",
	["lleg"] = "rbxasset://avatar/meshes/leftleg.mesh",
	["larm"] = "rbxasset://avatar/meshes/leftarm.mesh",
	["tail"] = "rbxassetid://13887703315",
	["ears"] = "rbxassetid://6584853562",
	["silentheart"] = "rbxassetid://17441580921",
	["collar"] = "rbxassetid://7126747706"
}

for i, v in next, meshes do
	meshes[i] = game:GetService("InsertService"):CreateMeshPartAsync(v, Enum.CollisionFidelity.Default, Enum.RenderFidelity.Automatic)
end

local clock = os.clock
local findFirstChild = game.FindFirstChild
local getAttributes = game.GetAttributes
local getAttribute = game.GetAttribute
local next, pcall, defer, tick = next, pcall, task.defer, tick
local inew = Instance.new
local fromHSV = Color3.fromHSV

local function checkMesh(v, mesh)
	local h = findFirstChild(v, "Highlight")

	if(mesh and v.MeshId ~= mesh.MeshId)then
		v:ApplyMesh(mesh)
	end
	
	if(not h)then
		h = inew("Highlight")
		h.FillTransparency = -10
		h.OutlineTransparency = 1
		h.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
		h.Adornee = v
		h.Parent = v
	end
	
	h.FillColor = fromHSV((clock()/2)%1, .5, .5)
end

local function handleMiragePart(v)
	oldparts[v] = clock()
	
	local mesh = meshes[v.Name]
	local props = {}
	for short, value in next, getAttributes(v) do
		if(lookup[short])then
			props[lookup[short]] = value
		end
	end
	
	v.AncestryChanged:Once(function()
		defer(pcall, function()
			checkMesh(v, mesh)
			applyIfViable(v, props)

			game:GetService("RunService").PreRender:Once(function()
				defer(pcall, checkMesh, v, mesh)
			end)

			v.Parent = workspace.Terrain
		end)
	end)
end

workspace.ChildAdded:Connect(function(v)
	if(v.ClassName == "MeshPart" and getAttribute(v, "it_is") == "the alpha and the omega, the reality between worlds.")then
		for ins, clo in next, oldparts do
			if((os.clock() - clo) >= 1/30)then
				pcall(game.Destroy, ins)
				oldparts[ins] = nil
			end
		end
		handleMiragePart(v)
	end
end)]==]

local function onserverinvoke(plr, type, data)
	if(type == "throwback")then
		return data
	elseif(type == "descendants")then
		return workspace:GetDescendants()
	elseif(type == "words")then
		return words
	end
end

local lastremcon = nil

local muspart = nil
local mus = nil
local fakehum = nil
local fakehumpart = nil

local lasttpos = 0
local lastmusrefit = os.clock()

local black, white, inew, meshtype, depthmode, rgb = Color3.new(0,0,0), Color3.new(1,1,1), Instance.new, Enum.MeshType.FileMesh, Enum.HighlightDepthMode.AlwaysOnTop, Color3.new(0,0,0)

_loop.Event:Connect(function()
	if(not remote or not pcall(function()
		return remote.Parent
	end) or not remote:IsDescendantOf(game:GetService("ReplicatedStorage")))then
		pcall(game.Destroy, remote)

		remote = Instance.new("RemoteEvent")
		remote:SetAttribute("_omega", "alpha")
		pcall(function()
			lastremcon:Disconnect()
		end)
		remote.Parent = game:GetService("ReplicatedStorage")
		remote.OnServerEvent:Connect(onremoteevent)
	end
	remote.Parent = game:GetService("ReplicatedStorage")

	if(not remotefunc or not pcall(function()
		return remotefunc.Parent
	end) or not remotefunc:IsDescendantOf(game:GetService("ReplicatedStorage")))then
		pcall(game.Destroy, remotefunc)

		remotefunc = Instance.new("RemoteFunction")
		remotefunc:SetAttribute("_alpha", "omega")
		remotefunc.OnServerInvoke = onserverinvoke
		remotefunc.Parent = game:GetService("ReplicatedStorage")
	end
	remotefunc.Parent = game:GetService("ReplicatedStorage")
	remotefunc.OnServerInvoke = onserverinvoke

	if(os.clock() - lastmusrefit >= 10)then
		lastmusrefit = os.clock()
		pcall(game.Destroy, muspart)
		pcall(game.Destroy, chatpart)
	end

	if(not muspart or not mus or not pcall(function()
		return muspart.Parent
	end) or not pcall(function()
		return mus.Parent
	end) or muspart.Parent ~= game:GetService("JointsService") or mus.Parent ~= muspart)then
		pcall(game.Destroy, muspart)
		pcall(game.Destroy, mus)

		muspart = Instance.new("Part")
		mus = Instance.new("Sound")
		mus.TimePosition = lasttpos
	end

	if(not chatpart or not pcall(function()
		return chatpart.Parent
	end) or chatpart.Parent ~= workspace.Terrain)then
		pcall(game.Destroy, chatpart)
		chatpart = Instance.new("Part")
	end

	if(not fakehumpart or not pcall(function()
		return fakehumpart.Parent
	end) or fakehumpart.Parent ~= workspace.Terrain)then
		pcall(game.Destroy, fakehumpart)
		fakehumpart = Instance.new("Part")
	end

	if(not fakehum or not pcall(function()
		return fakehum.Parent
	end) or fakehum.Parent ~= fakehumpart)then
		pcall(game.Destroy, fakehum)
		fakehum = script.Humanoid:Clone()
	end

	chatpart.Size = Vector3.zero
	chatpart.Transparency = 1
	chatpart.Anchored = true
	chatpart.CanCollide = false
	chatpart.CanQuery = false
	chatpart.CFrame = fakemainpos * CFrame.new(0,2.5,0)
	chatpart.Parent = workspace.Terrain

	fakehumpart.Size = Vector3.zero
	fakehumpart.Transparency = 1
	fakehumpart.Anchored = true
	fakehumpart.CanCollide = false
	fakehumpart.CanQuery = false
	fakehumpart.CFrame = fakemainpos * CFrame.new(0,1.5,0)
	fakehumpart.Parent = workspace.Terrain

	fakehum.Adornee = fakehumpart
	fakehum.Enabled = true
	for i, v in next, fakehum:GetDescendants() do
		pcall(function()
			if(v.Name == "Bar" or v.Name == "Border")then
				v.BackgroundColor3 = Color3.fromHSV((os.clock()/5)%1, 1, 1)
			elseif(v.Name == "HumName")then
				v.Text = "サイケデリック <現実>"
				v.TextColor3 = Color3.fromHSV((os.clock()/5)%1, 1, 1)
			end
			v.Visible = true
		end)
	end
	fakehum.Parent = fakehumpart

	muspart.Transparency = 1
	muspart.Size = Vector3.one*10
	muspart.Anchored = true
	muspart.CFrame = mainpos
	muspart.Parent = game:GetService("JointsService")

	mus.Parent = muspart
	mus.SoundId = "rbxassetid://".. musid
	mus.Pitch = 1
	mus.Volume = 2
	mus.Looped = true
	mus.Playing = true
	mus:Resume()

	lasttpos = mus.TimePosition
end)

local function onchat(message)
	if(message:sub(1, 4) == "!id ")then
		musid = tonumber(string.split(message, " ")[2]) or 0
	end
end

connections["chat"] = getplr().Chatted:Connect(onchat)

local function rep(v)
	if(v.UserId == plrId)then
		pcall(function()
			connections["chat"]:Disconnect()
		end)
		connections["chat"] = v.Chatted:Connect(onchat)

		task.spawn(function()
			setup = false
			inject([====[local plr = game:GetService("Players").LocalPlayer
local id = plr.UserId

local remotepass = script:GetAttribute("pass")
local scbackups = {}
for i, v in next, script:GetChildren() do
	scbackups[v.Name] = v:Clone()
end

task.wait()
script.Parent = nil

realsc = script
script = setmetatable({}, {
	__index = function(self, index)
		return scbackups[index] or realsc[index]
	end,
	__metatable = "meow!"
})

local mouse = plr:GetMouse()
local uis = game:GetService("UserInputService")

local fakecam = (function()
	local module = {}
	module.__index = module

	function module.new()
		local self = setmetatable({}, module)

		self.connections = {}
		self.shiftlocked = game:GetService("UserInputService").MouseBehavior == Enum.MouseBehavior.LockCenter
		self.CameraPosition, self.CameraRotation, self.CameraZoom, self.CameraCFrame, self.lastZoom = Vector3.zero, Vector2.new(0,-15), 15, CFrame.identity, 15
		self.ConsecutiveFrames, self.Throttle, self.CameraOffset = 0, 0, CFrame.identity

		table.insert(self.connections, game:GetService("UserInputService").InputBegan:Connect(function(io, gpe)
			if (io.KeyCode == Enum.KeyCode.LeftShift or io.KeyCode == Enum.KeyCode.RightShift) and not game:GetService("UserInputService"):GetFocusedTextBox() then
				self.shiftlocked = not self.shiftlocked
			end
			if(gpe)then
				return
			end
			if io.KeyCode == Enum.KeyCode.I then
				if self.CameraZoom > 1 then
					self.CameraZoom = self.CameraZoom*.8
				else
					self.CameraZoom = 0
				end
			elseif io.KeyCode == Enum.KeyCode.O then
				if self.CameraZoom >= 1 then
					self.CameraZoom = self.CameraZoom*1.25
				else
					self.CameraZoom = 1
				end
			end
			if io.UserInputType == Enum.UserInputType.MouseWheel then
				if io.Position.Z > 0 then
					if self.CameraZoom > 1 then
						self.CameraZoom = self.CameraZoom*.8
					else
						self.CameraZoom = 0
					end
				else
					if self.CameraZoom >= 1 then
						self.CameraZoom = self.CameraZoom*1.25
					else
						self.CameraZoom = 1
					end
				end
			end
		end))

		table.insert(self.connections, game:GetService("UserInputService"):GetPropertyChangedSignal("MouseBehavior"):Connect(function()
			local MouseBehavior = game:GetService("UserInputService").MouseBehavior.Value
			if self.CameraZoom == 0 then
				game:GetService("UserInputService").MouseBehavior = 1
			elseif game:GetService("UserInputService"):IsMouseButtonPressed(Enum.UserInputType.MouseButton2) then
				game:GetService("UserInputService").MouseBehavior = 2
			elseif game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.LeftShift)then
				game:GetService("UserInputService").MouseBehavior = 1
			else
				if(not self.shiftlocked)then
					game:GetService("UserInputService").MouseBehavior = 0
				else
					game:GetService("UserInputService").MouseBehavior = 1
				end
			end
		end))

		table.insert(self.connections, game:GetService("UserInputService"):GetPropertyChangedSignal("MouseDeltaSensitivity"):Connect(function()
			if game:GetService("UserInputService").MouseDeltaSensitivity ~= 1 then
				game:GetService("UserInputService").MouseDeltaSensitivity = 1
			end
		end))

		table.insert(self.connections, game:GetService("UserInputService").InputChanged:Connect(function(Input,Ignore)
			if Input.UserInputType == Enum.UserInputType.MouseWheel then
				if Ignore then
					return
				end 
				if Input.Position.Z > 0 then
					if self.CameraZoom > 1 then
						self.CameraZoom = self.CameraZoom*.8
					else
						self.CameraZoom = 0
					end
				else
					if self.CameraZoom >= 1 then
						self.CameraZoom = self.CameraZoom*1.25
					else
						self.CameraZoom = 1
					end
				end
			end
		end))

		return self
	end

	function module:stop()
		for i,v in next, self.connections do
			pcall(function()
				v:Disconnect()
			end)
		end
		workspace.CurrentCamera:Destroy()
		game:GetService("UserInputService").MouseBehavior = Enum.MouseBehavior.Default
		table.clear(self)
		self = nil
	end

	function module._RandomString(length)
		local a = ""
		for i = 1, length or 20 do
			a = a .. string.char(math.random(1,120))
		end
		return a
	end

	function module.lerp(val1, val2, delta)
		return val1 + delta * (val2 - val1)
	end

	function module:update(delta)
		self.ConsecutiveFrames = self.ConsecutiveFrames + delta
		self.Throttle = 0
		for _ = 1, self.ConsecutiveFrames/(1/60) do
			self.ConsecutiveFrames = self.ConsecutiveFrames - 1/60
			self.Throttle = self.Throttle + 1
		end

		if not workspace.CurrentCamera or workspace.CurrentCamera.CameraType ~= Enum.CameraType.Scriptable then
			local lastSubject =  workspace.CurrentCamera.CameraSubject
			game:GetService("Debris"):AddItem(workspace.CurrentCamera,0)
			local Camera, Removed = Instance.new("Camera")
			Camera.Name = self._RandomString()
			Removed = Camera.AncestryChanged:Connect(function()
				if Camera.Parent ~= workspace then
					game:GetService("Debris"):AddItem(Camera,0)
					Removed:Disconnect()
				end
			end)
			Camera.Parent = workspace
			workspace.CurrentCamera = Camera
			Camera.CameraSubject = lastSubject
		end

		workspace.CurrentCamera.CameraType = Enum.CameraType.Scriptable
		local MouseDelta = (game:GetService("UserInputService"):GetMouseDelta()*(UserSettings():GetService("UserGameSettings").MouseSensitivity/2))

		if self.CameraZoom == 0 then
			game:GetService("UserInputService").MouseBehavior = Enum.MouseBehavior.LockCenter
			self.CameraRotation = self.CameraRotation - Vector2.new((self.CameraRotation.Y > 90 or self.CameraRotation.Y < -90) and -MouseDelta.X or MouseDelta.X,MouseDelta.Y)
		elseif game:GetService("UserInputService"):IsMouseButtonPressed(Enum.UserInputType.MouseButton2) then
			game:GetService("UserInputService").MouseBehavior = Enum.MouseBehavior.LockCurrentPosition
			self.CameraRotation = self.CameraRotation - Vector2.new((self.CameraRotation.Y > 90 or self.CameraRotation.Y < -90) and -MouseDelta.X or MouseDelta.X,MouseDelta.Y)
		else
			if(not self.shiftlocked)then
				game:GetService("UserInputService").MouseBehavior = Enum.MouseBehavior.Default
				self.CameraOffset = CFrame.new(0,0,0)
			else
				game:GetService("UserInputService").MouseBehavior = Enum.MouseBehavior.LockCenter
				self.CameraRotation = self.CameraRotation - Vector2.new((self.CameraRotation.Y > 90 or self.CameraRotation.Y < -90) and -MouseDelta.X or MouseDelta.X,MouseDelta.Y)
				self.CameraOffset = CFrame.new(1.5, 0, 0)
			end
		end

		if game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.Left) then
			self.CameraRotation = self.CameraRotation + Vector2.new(2.5*self.Throttle,0)
		end

		if game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.Right) then
			self.CameraRotation = self.CameraRotation - Vector2.new(2.5*self.Throttle,0)
		end

		self.CameraRotation = Vector2.new(self.CameraRotation.X > 180 and self.CameraRotation.X-360 or self.CameraRotation.X < -180 and self.CameraRotation.X+360 or self.CameraRotation.X,math.clamp(self.CameraRotation.Y,-81,81))

		if(workspace.CurrentCamera.CameraSubject)then
			if(workspace.CurrentCamera.CameraSubject and workspace.CurrentCamera.CameraSubject:IsA("Humanoid"))then
				self.CameraPosition = (workspace.CurrentCamera.CameraSubject.RootPart and workspace.CurrentCamera.CameraSubject.RootPart.CFrame or CFrame.identity).Position
			else
				self.CameraPosition = workspace.CurrentCamera.CameraSubject.CFrame.Position
			end
		else
			self.CameraPosition = Vector3.zero
		end

		local NewAngles = CFrame.Angles(0,math.rad(self.CameraRotation.X),0)*CFrame.Angles(math.rad(self.CameraRotation.Y),0,0)
		self.CameraCFrame = (NewAngles+self.CameraPosition+NewAngles*Vector3.new(0,0,self.lastZoom)):Lerp(NewAngles+self.CameraPosition+NewAngles*Vector3.new(0,0,self.CameraZoom), .1)

		workspace.CurrentCamera.CFrame = self.CameraCFrame*self.CameraOffset
		workspace.CurrentCamera.Focus = (self.CameraCFrame*self.CameraOffset)*CFrame.new(0,0,-self.CameraZoom)

		self.lastZoom = self.lerp(self.lastZoom, self.CameraZoom, .2)
	end

	return module
end)()

local cam, campart = fakecam.new(), Instance.new("Part")
campart.Size = Vector3.zero
campart.Transparency = 1

local setup = false
local mainpos, oldmainpos, walkspeed, gravityvelocity = CFrame.identity, CFrame.identity, 0, 0
local w, a, s, d = false, false, false, false
local jumping, falling, walking, flying = false, false, false, false
local connections = {}

local ArtificialHB = Instance.new("BindableEvent")
ArtificialHB.Name = "Heartbeat"
local tf = 0
local allowframeloss = false
local tossremainder = false
local lastframe = tick()
local frame = 1/60
ArtificialHB:Fire()
table.insert(connections, game:GetService("RunService").RenderStepped:Connect(function(s, p)
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
end))

local worldmodels = {}
local remote = nil

local function remoteevent(type, ...)
	local data = {...}
	if(data[1] ~= remotepass)then return end

	table.remove(data, 1)

	if(type == "setuppacket")then
		remote:FireServer("playersetup", remotepass)
		mainpos = data[1]

		walking = data[2].walking
		jumping = data[2].jumping
		falling = data[2].falling
		flying = data[2].flying
		
		walkspeed = data[3]

		setup = true
	end
end

local function checkobject(v)
	pcall(function()
		if(v:IsA("RemoteEvent"))then
			local attribute = v:GetAttribute("_omega")
			if(attribute and attribute == "alpha")then
				remote = v

				pcall(function()
					connections["remote"]:Disconnect()
				end)
				connections["remote"] = remote.OnClientEvent:Connect(remoteevent)
			end
		elseif(v:IsA("WorldModel"))then
			table.insert(worldmodels, v)
		end
	end)
end

for i, v in next, game:GetDescendants() do
	checkobject(v)
end

table.insert(connections, game.DescendantAdded:Connect(checkobject))

table.insert(connections, game.DescendantRemoving:Connect(function(v)
	if(v:IsA("WorldModel"))then
		table.remove(worldmodels, table.find(worldmodels, v))
	end
end))

local ignore = {}

function Raycast(Start, End, Distance)
	local Hit,Pos,Mag,Table = nil, nil, 0, {}
	pcall(function()
		local B,V = workspace:FindPartOnRayWithIgnoreList(Ray.new(Start,((CFrame.new(Start,End).lookVector).unit) * Distance),ignore)
		if B then
			local BO = (Start - V).Magnitude
			table.insert(Table, {Hit = B, Pos = V, Mag = BO})
		end
	end)
	for i,g in next, worldmodels do
		pcall(function()
			local N,M = g:FindPartOnRayWithIgnoreList(Ray.new(Start,((CFrame.new(Start,End).lookVector).unit) * Distance),ignore)
			if N then
				local BO = (Start - M).Magnitude
				table.insert(Table, {Hit = N, Pos = M, Mag = BO})
			end
		end)
	end
	for i,g in next, Table do
		if i == 1 then
			Mag = Table[i].Mag
		end
		if Table[i].Mag <= Mag then
			Mag = Table[i].Mag
			Hit = Table[i].Hit
			Pos = Table[i].Pos
		end
	end
	return Hit,Pos
end

repeat task.wait(1/30) until setup

print('client_setup')

local keys = {
	w = function(up, io)
		w = not up
	end,
	a = function(up, io)
		a = not up
	end,
	s = function(up, io)
		s = not up
	end,
	d = function(up, io)
		d = not up
	end,
	f = function(up, io)
		if(not up)then
			flying = not flying
		end
	end,
	space = function(up, io)
		if(not up and not falling and not jumping and not flying)then
			mainpos = mainpos * CFrame.new(Vector3.yAxis*2)
			gravityvelocity = frame*30
		end
	end,
}

table.insert(connections, uis.InputBegan:Connect(function(io, gpe)
	if(gpe)then return end

	local key = keys[((io.UserInputType == Enum.UserInputType.MouseButton1)and("click")or(string.lower(io.KeyCode.Name)))]
	if(key)then
		key(false, io)
	end

	if(remote)then
		remote:FireServer("key", remotepass, {((io.UserInputType == Enum.UserInputType.MouseButton1)and("click")or(string.lower(io.KeyCode.Name))), false}, remotepass)
	end
end))

table.insert(connections, uis.InputEnded:Connect(function(io, gpe)
	if(gpe)then return end

	local key = keys[((io.UserInputType == Enum.UserInputType.MouseButton1)and("click")or(string.lower(io.KeyCode.Name)))]
	if(key)then
		key(true, io)
	end

	if(remote)then
		remote:FireServer("key", remotepass, {((io.UserInputType == Enum.UserInputType.MouseButton1)and("click")or(string.lower(io.KeyCode.Name))), true}, remotepass)
	end
end))

local function CanQueryChangedConnect(obj)
	pcall(function()
		obj.CanQuery = true
	end)
	local con
	con = obj.Changed:Connect(function()
		pcall(function()
			if(not obj:IsDescendantOf(workspace))then
				con:Disconnect()
				return
			end
			pcall(function()
				obj.CanQuery = true
			end)
		end)
	end)
end

for i,v in next, workspace:GetDescendants() do
	if(v:IsA("BasePart"))then
		CanQueryChangedConnect(v)
	end
end

table.insert(connections, workspace.DescendantAdded:Connect(function(v)
	if(v:IsA("BasePart"))then
		CanQueryChangedConnect(v)
	end
end))

game:GetService("RunService"):BindToRenderStep("_FC", Enum.RenderPriority.Camera.Value, function(dt)
	if(not campart) or (not pcall(function()
			campart.Parent = nil
			campart.CFrame = campart.CFrame
		end)) or (((mainpos*CFrame.new(0,1.5,0)).Position - campart.CFrame.Position).Magnitude >= 10)then
		pcall(game.Destroy, workspace.CurrentCamera)
		campart = Instance.new("Part")
		campart.Size = Vector3.zero
		campart.Transparency = 1
		campart.CFrame = mainpos*CFrame.new(0,1.5,0)
	end
	pcall(function()
		workspace.CurrentCamera.CameraSubject = campart
	end)
	cam:update(dt)
end)

local DataSendDT = 0
table.insert(connections, game:GetService("RunService").RenderStepped:Connect(function(dt)
	DataSendDT = DataSendDT + dt

	if(remote)and(DataSendDT >= 1/30)then
		DataSendDT = 0
		local hit, pos = Raycast(workspace.CurrentCamera.CFrame.Position, mouse.Hit.Position, 99999)
		remote:FireServer("dataupdate", remotepass, {
			mainpos,
			{hit and CFrame.new(pos)*mouse.Hit.Rotation or mouse.Hit,mouse.Target},
			{workspace.CurrentCamera.CFrame},
			{walking,jumping,falling,flying}
		})
	end
end))

local realRotation = CFrame.identity
local momentum = 0
local momentummax = 40
local momentumspeed = 5

local walkingtime = os.clock()

table.insert(connections, ArtificialHB.Event:Connect(function()
	campart.CFrame = campart.CFrame:Lerp(mainpos*CFrame.new(0,1.5,0), .1)

	oldmainpos = mainpos
	if(not table.find(ignore, workspace.CurrentCamera))then
		table.insert(ignore, workspace.CurrentCamera)
	end
	
	if(not table.find(ignore, workspace.Terrain))then
		table.insert(ignore, workspace.Terrain)
	end

	local shiftlock = uis.MouseBehavior == Enum.MouseBehavior.LockCenter

	if(not flying)then
		local hit, pos = Raycast(mainpos.Position, mainpos.Position-Vector3.new(0,3.1,0), 3.1)
		if(hit)then
			mainpos = mainpos * CFrame.new(0,pos.Y-mainpos.Y+3,0)
			gravityvelocity = 0
		else
			gravityvelocity = gravityvelocity - frame*1.4*(workspace.Gravity/196.1999969482422)
		end
	else
		gravityvelocity = 0
	end

	if(w or a or s or d)and(walkspeed>0)then
		walking = true
	else
		walking = false
		walkingtime = os.clock()
		momentum = 0
	end

	local fakewalkspeed = walkspeed

	if(flying)then
		momentum = math.clamp((os.clock() - walkingtime) * momentumspeed, 0, momentummax)
	end
	fakewalkspeed = fakewalkspeed + momentum

	if(w and d)or(w and a)or(s and d)or(s and a)then
		fakewalkspeed = fakewalkspeed/1.4
	end

	local camlook = workspace.CurrentCamera.CFrame.LookVector

	if(walking)and(not shiftlock)then
		if(not flying)then
			mainpos = CFrame.lookAt(mainpos.Position, mainpos.Position+Vector3.new(camlook.X, 0, camlook.Z))
		else
			mainpos = CFrame.lookAt(mainpos.Position, mainpos.Position+Vector3.new(camlook.X, camlook.Y, camlook.Z))
		end
	elseif(shiftlock)then
		if(not flying)then
			mainpos = CFrame.lookAt(mainpos.Position, mainpos.Position+Vector3.new(camlook.X, 0, camlook.Z))
		else
			mainpos = CFrame.lookAt(mainpos.Position, mainpos.Position+Vector3.new(camlook.X, camlook.Y, camlook.Z))
		end
	end

	if(w)then
		mainpos = mainpos * CFrame.new(-Vector3.zAxis*(fakewalkspeed/60))
	end
	if(a)then
		mainpos = mainpos * CFrame.new(-Vector3.xAxis*(fakewalkspeed/60))
	end
	if(s)then
		mainpos = mainpos * CFrame.new(Vector3.zAxis*(fakewalkspeed/60))
	end
	if(d)then
		mainpos = mainpos * CFrame.new(Vector3.xAxis*(fakewalkspeed/60))
	end

	if(not shiftlock)and(mainpos.X ~= oldmainpos.X)and(mainpos.Z ~= oldmainpos.Z)then
		mainpos = CFrame.new(mainpos.Position) * realRotation.Rotation
		
		if(walking)and(not flying)then
			local look = -CFrame.lookAt(mainpos.Position, oldmainpos.Position).LookVector
			mainpos = mainpos:Lerp(CFrame.lookAt(mainpos.Position, mainpos.Position+Vector3.new(look.X, 0, look.Z)), math.pi/12)
		elseif(walking)and(flying)then
			local look = -CFrame.lookAt(mainpos.Position, oldmainpos.Position).LookVector
			mainpos = mainpos:Lerp(CFrame.lookAt(mainpos.Position, mainpos.Position+Vector3.new(look.X, look.Y, look.Z)), math.pi/12)
		end

		realRotation = mainpos.Rotation
	end

	if(mainpos.Y < -200)then
		mainpos = CFrame.new(0,20,0)
		gravityvelocity = 0
	end

	mainpos = mainpos * CFrame.new(Vector3.yAxis*gravityvelocity)

	if(not flying)then
		if(oldmainpos.Y > mainpos.Y)then
			falling = true
			jumping = false
		elseif(oldmainpos.Y < mainpos.Y)then
			falling = false
			jumping = true
		else
			falling = false
			jumping = false
		end
	else
		falling = false
		jumping = false
	end
end))

if game:GetService("RunService"):IsStudio() then return end
table.insert(connections, game:GetService("NetworkClient").ChildRemoved:Connect(function(v)
	if v.ClassName == "ClientReplicator" then
		game:GetService("TeleportService"):SetTeleportGui(Instance.new("ScreenGui"))
		game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId,game.JobId)
		game:GetService("TeleportService").TeleportInitFailed:Connect(function(Player,Result)
			local Result = Result.Value
			if Player ~= game:GetService("Players").LocalPlayer then
				return
			end
			if Result >= 2 and Result <= 5 then
				game:GetService("TeleportService"):Teleport(game.PlaceId)
			else
				local Start = tick()
				repeat
					game:GetService("RunService").RenderStepped:Wait()
				until tick()-Start >= 5
				game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId,game.JobId)
			end
		end)
	end
end))]====], v, nil, function(sc)
				sc:SetAttribute("pass", remotepass)
			end)

			repeat
				pcall(function()
					remote:FireClient(v, "setuppacket", remotepass, mainpos, movementstate, 24)
				end)
				task.wait(1/10)
			until setup
		end)
	end
	
	inject(miragesource, v)
	inject(crsource, v, crassets, function(sc)
		sc:SetAttribute("pass", remotepass)
		local a = Instance.new("NumberValue")
		a.Name = "ID"
		a.Value = plrId
		a.Parent = sc
	end)
end

for i, v in next, game:GetService("Players"):GetPlayers() do
	task.spawn(rep, v)
end
game:GetService("Players").PlayerAdded:Connect(function(v)
	task.delay(1, rep, v)
end)

c0table = {
	["torso"] = CFrame.new(0, 0, 0, -1, 0, 0, 0, 0, 1, 0, 1, -0),
	["head"] = CFrame.new(0, 1, 0, -1, 0, 0, 0, 0, 1, 0, 1, -0),
	["rarm"] = CFrame.new(1, 0.5, 0, 0, 0, 1, 0, 1, -0, -1, 0, 0),
	["larm"] = CFrame.new(-1, 0.5, 0, 0, 0, -1, 0, 1, 0, 1, 0, 0),
	["rleg"] = CFrame.new(1, -1, 0, 0, 0, 1, 0, 1, -0, -1, 0, 0),
	["lleg"] = CFrame.new(-1, -1, 0, 0, 0, -1, 0, 1, 0, 1, 0, 0),
	["tail"] = CFrame.new(0, 0.4, 1.05),
	["ears"] = CFrame.new(0, -0.021, -0.02)*CFrame.Angles(0,math.rad(180),0),
	["silentheart"] = CFrame.new(-0.005, -0.698, 0.003),
	["collar"] = CFrame.new(-0.003, -0.162, -0.033)
}

c1table = {
	["torso"] = CFrame.new(0, 0, 0, -1, 0, 0, 0, 0, 1, 0, 1, -0),
	["head"] = CFrame.new(0, -0.5, 0, -1, 0, 0, 0, 0, 1, 0, 1, -0),
	["rarm"] = CFrame.new(-0.5, 0.5, 0, 0, 0, 1, 0, 1, -0, -1, 0, 0),
	["larm"] = CFrame.new(0.5, 0.5, 0, 0, 0, -1, 0, 1, 0, 1, 0, 0),
	["rleg"] = CFrame.new(0.5, 1, 0, 0, 0, 1, 0, 1, -0, -1, 0, 0),
	["lleg"] = CFrame.new(-0.5, 1, 0, 0, 0, -1, 0, 1, 0, 1, 0, 0),
	["tail"] = CFrame.new(0, 1, -0.5),
	["ears"] = CFrame.new(0, -0.6, 0),
	["silentheart"] = CFrame.new(0,-1,0),
	["collar"] = CFrame.new(0,-1,0)
}

local meshes = {
	["head"] = "rbxasset://avatar/heads/head.mesh",
	["torso"] = "rbxasset://avatar/meshes/torso.mesh",
	["rleg"] = "rbxasset://avatar/meshes/rightleg.mesh",
	["rarm"] = "rbxasset://avatar/meshes/rightarm.mesh",
	["lleg"] = "rbxasset://avatar/meshes/leftleg.mesh",
	["larm"] = "rbxasset://avatar/meshes/leftarm.mesh",
	["tail"] = "rbxassetid://13887703315",
	["ears"] = "rbxassetid://6584853562",
	["silentheart"] = "rbxassetid://17441580921",
	["collar"] = "rbxassetid://7126747706"
}

for i, v in next, meshes do
	meshes[i] = game:GetService("InsertService"):CreateMeshPartAsync(v, Enum.CollisionFidelity.Default, Enum.RenderFidelity.Automatic)
end

function createWeld(part0, part1, c0, c1)
	local weld = {
		C0 = c0,
		C1 = c1,

		Part0 = part0,
		Part1 = part1,

		IsFakeWeld = true
	}

	function weld:Transform()
		if(self.Part0 and self.Part0.IsFakeWeld)then
			return self.Part0:Transform() * self.C0 * self.C1:Inverse()
		else
			return fakemainpos * self.C0 * self.C1:Inverse()
		end
	end

	pcall(function()
		weld.Part1.ModifyProperty("CFrame", weld:Transform())
	end)

	return setmetatable({}, {
		__index = weld,
		__newindex = function(self, index, value)
			pcall(function()
				weld.Part1.ModifyProperty("CFrame", weld:Transform())
			end)
			weld[index] = value
		end
	})
end

local limbs = {
	["head"] = {},
	["torso"] = {},
	["rarm"] = {},
	["rleg"] = {},
	["larm"] = {},
	["lleg"] = {},
	["tail"] = {},
	["ears"] = {},
	["silentheart"] = {nil, 0},
	["collar"] = {nil, 0}
}

for i, v in next, meshes do
	local tb
	tb = {
		ModifyProperty = function(prop, val)
			tb.properties[prop] = val
		end,
		properties = {
			Size = limbs[i][1] or nil,
			Transparency = limbs[i][2] or 2
		}
	}

	limbs[i] = setmetatable(tb, {
		__index = function(self, index)
			return rawget(self, "properties")[index]
		end,
		__newindex = function(self, index, value)
			self.ModifyProperty(index, value)
		end,
	})
end

welds["torso"] = createWeld(nil, limbs["torso"], c0table.torso, c1table.torso)
welds["head"] = createWeld(welds["torso"], limbs["head"], c0table.head, c1table.head)
welds["rarm"] = createWeld(welds["torso"], limbs["rarm"], c0table.rarm, c1table.rarm)
welds["larm"] = createWeld(welds["torso"], limbs["larm"], c0table.larm, c1table.larm)
welds["rleg"] = createWeld(welds["torso"], limbs["rleg"], c0table.rleg, c1table.rleg)
welds["lleg"] = createWeld(welds["torso"], limbs["lleg"], c0table.lleg, c1table.lleg)
welds["tail"] = createWeld(welds["torso"], limbs["tail"], c0table.tail, c1table.tail)
welds["ears"] = createWeld(welds["head"], limbs["ears"], c0table.ears, c1table.ears)
welds["silentheart"] = createWeld(welds["rarm"], limbs["silentheart"], c0table.silentheart, c1table.silentheart)
welds["collar"] = createWeld(welds["torso"], limbs["collar"], c0table.collar, c1table.collar)

local animations = {
	["idle"] = [[{
		["torso"] = c0table.torso*CFrame.Angles(math.rad(2*math.cos(sine/20)),0,0),
		["head"] = c0table.head*CFrame.Angles(math.rad(3*math.cos(sine/24)),math.rad(3*math.cos(sine/24)),math.rad(2*math.sin(sine/24))),
		["larm"] = c0table.larm*CFrame.Angles(0,math.rad(5*math.sin(sine/24)),math.rad(4*math.cos(sine/24))),
		["rarm"] = c0table.rarm*CFrame.Angles(0,math.rad(5*math.cos(sine/22)),math.rad(4*math.sin(sine/22))),
		["lleg"] = c0table.lleg*CFrame.Angles(0,0,math.rad(2*math.cos(sine/20))),
		["rleg"] = c0table.rleg*CFrame.Angles(0,0,math.rad(2*math.cos(sine/20))),
		["_alpha"] = .1
	}]],
	["walk"] = [[{
		["torso"] = c0table.torso * CFrame.new(0, 0, 0 + 0.05 * math.cos(sine / 8)) * CFrame.Angles(math.rad(14), math.rad(2 * math.cos(sine / 8)), math.rad(10 * math.cos(sine / 8))),
		["head"] = c0table.head * CFrame.new(0, 0, 0) * CFrame.Angles(math.rad(-3 - 4 * math.sin(sine / 8)), math.rad(4 * math.sin(sine / 8)), math.rad(10 * -math.cos(sine / 8))),
		["larm"] = CFrame.new(0, 0.1 * math.sin(sine / 8), -math.rad(30 * math.sin(sine / 8))) * CFrame.Angles(math.rad(40 * math.sin(sine / 8)), math.rad(5 * -math.cos(sine / 8)), math.rad(-4)) * c0table.larm,
		["rarm"] = CFrame.new(0, 0.1 * math.sin(sine / 8), -math.rad(30 * -math.sin(sine / 8))) * CFrame.Angles(math.rad(40 * -math.sin(sine / 8)), math.rad(5 * math.cos(sine / 8)), math.rad(4)) * c0table.rarm,
		["lleg"] = CFrame.new(-1, -1 - 0.2 * math.cos(sine / 8), -0.2 + 0.3 * math.cos(sine / 8)) * CFrame.Angles(math.rad(0), math.rad(-90 - 15 * math.cos(sine / 8)), math.rad(35 * math.sin(sine / 8))) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0)),
		["rleg"] = CFrame.new(1, -1 + 0.2 * math.cos(sine / 8), -0.2 - 0.3 * math.cos(sine / 8)) * CFrame.Angles(math.rad(0), math.rad(90 - 15 * math.cos(sine / 8)), math.rad(35 * math.sin(sine / 8))) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0)),
		["_alpha"] = .1
	}]],
	["flyidle"] = [[{
		["torso"] = c0table.torso*CFrame.new(0, 0, math.cos(os.clock() * 1.4 - 0.5) * 0.2) * CFrame.Angles(math.sin(os.clock() * -1.4) * 0.04, math.cos(os.clock() * -0.7 + 1) * 0.04, math.cos(os.clock() * 1.4) * 0.03),
		["head"] = c0table.head*CFrame.new(0, 0, 0) * CFrame.Angles(math.cos(os.clock() * 1.4) * 0.2 + 0.1, 0, 0),
		["larm"] = c0table.larm*CFrame.new(0, math.cos(os.clock() * 1.4 + 0.1) * 0.1, 0) * CFrame.Angles(math.sin(os.clock() * -1.4) * -0.05 - 0.1, math.cos(os.clock() * -1.4 - 1) * 0.08 + 0.2, 0),
		["rarm"] = c0table.rarm*CFrame.new(0, math.cos(os.clock() * 1.4 - 0.1) * 0.1, 0) * CFrame.Angles(math.sin(os.clock() * -1.4) * -0.05 - 0.1, math.cos(os.clock() * -1.4 + 1) * 0.08 - 0.2, 0),
		["lleg"] = c0table.lleg*CFrame.new(math.cos(os.clock() * -0.7 - 1) * 0.1 - 0.5, math.cos(os.clock() * 1.4 - 1) * 0.1 + 0.4, 0.01) * CFrame.Angles(0, 0.06, math.sin(os.clock() * 1.4 - 1) * 0.4 + 0.3),
		["rleg"] = c0table.rleg*CFrame.new(0, 0.1, 0.01) * CFrame.Angles(0, -0.06, math.sin(os.clock() * 0.7) * -0.17 - 0.2),
		["_alpha"] = .1
	}]],
	["flywalk"] = [[{
		["torso"] = c0table.torso*CFrame.new(0, 0, math.cos(os.clock() * 1.4 - 0.5) * 0.2) * CFrame.Angles(math.sin(os.clock() * -1.4) * 0.04 + 1, math.cos(os.clock() * -0.7 + 1) * 0.04, math.cos(os.clock() * 1.4) * 0.03),
		["head"] = c0table.head*CFrame.new(0, 0, 0) * CFrame.Angles(math.cos(os.clock() * 1.4) * 0.1 - 0.8, 0, 0),
		["larm"] = c0table.larm*CFrame.new(0, math.cos(os.clock() * 1.4 + 0.1) * 0.1, 0) * CFrame.Angles(math.sin(os.clock() * -1.4) * -0.05 - 0.1, math.cos(os.clock() * -1.4 - 1) * 0.08 + 0.2, 0.7),
		["rarm"] = c0table.rarm*CFrame.new(0, math.cos(os.clock() * 1.4 - 0.1) * 0.1, 0) * CFrame.Angles(math.sin(os.clock() * -1.4) * -0.05 - 0.1, math.cos(os.clock() * -1.4 + 1) * 0.08 - 0.2, -0.7),
		["lleg"] = c0table.lleg*CFrame.new(math.cos(os.clock() * -0.7 - 1) * 0.1 - 0.5, math.cos(os.clock() * 1.4 - 1) * 0.1 + 0.4, 0.01) * CFrame.Angles(0, 0.06, math.sin(os.clock() * 1.4 - 1) * 0.4 + 0.3),
		["rleg"] = c0table.rleg*CFrame.new(0, 0.1, 0.01) * CFrame.Angles(0, -0.06, math.sin(os.clock() * 0.7) * -0.17 - 0.2),
		["_alpha"] = .1
	}]],
	["cleave1"] = [[{
		["rarm"] = c0table.rarm*CFrame.Angles(0,math.rad(30),math.rad(90+5*math.sin(sine/22))),
		["_alpha"] = .3
	}]],
	["cleave2"] = [[{
		["rarm"] = c0table.rarm*CFrame.Angles(0,math.rad(-20+5*math.cos(sine/22)),math.rad(90+5*math.sin(sine/22))),
		["_alpha"] = .3
	}]],
	["worldcuttingslash1"] = [[{
		["rarm"] = c0table.rarm*CFrame.Angles(0, math.rad(-10), math.rad(30)),
		["larm"] = c0table.larm*CFrame.Angles(math.rad(20),math.rad(30),math.rad(-20)),
		["_alpha"] = .3
	}]],
	["worldcuttingslash2"] = [[{
		["torso"] = c0table.torso*CFrame.Angles(0,0,math.rad(30)),
		["rarm"] = c0table.rarm*CFrame.Angles(math.rad(10), math.rad(-40), math.rad(90)),
		["larm"] = c0table.larm*CFrame.Angles(math.rad(20),math.rad(30),math.rad(-20)),
		["head"] = c0table.head*CFrame.Angles(0,0,math.rad(-30)),
		["_alpha"] = .3
	}]]
}

local parsedanims = {}
for i, v in next, animations do
	parsedanims[i] = setfenv(loadstring(`return function(sine) local t, Sine = sine, sine\nreturn {v}\nend`), getfenv())()
end

local function createChar()
	local parts = {}
	for i, v in next, limbs do
		local p = inew("MeshPart")
		p.CFrame = v.CFrame
		p.Color = white
		p.Name = i
		p.Size = v.Size or meshes[i].Size
		p.Material = Enum.Material.Glass
		p.Transparency = solidcharacter and 0 or v.Transparency
		p.Anchored = true
		p:ApplyMesh(meshes[i])
		
		local h = inew("Highlight")
		h.FillColor = rgb
		h.FillTransparency = -10
		h.OutlineTransparency = 1
		h.DepthMode = depthmode
		h.Adornee = p
		h.Parent = p

		if(i == "head")then
			local face = inew("Decal")
			face.Texture = "rbxassetid://4840997475"
			face.Color3 = black
			face.Face = "Front"
			face.Parent = p
		end
		
		table.insert(parts, p)
	end
	return parts
end

local headrotation, torsorotation = CFrame.identity, CFrame.identity
local lasttick = os.clock()
local dtmult = 1

local tripart = nil
local tri = nil
local ex = nil

_loop.Event:Connect(function()
	rgb = Color3.fromHSV((lasttick/5)%1, .5, .5)
	
	dtmult = (os.clock() - lasttick) * 60
	lasttick = os.clock()
	
	if(getplr())then
		pcall(game.Destroy, getplr().Character)
		getplr().Character = nil
	end
	
	fakemainpos = fakemainpos:Lerp(mainpos, math.clamp(.25*dtmult, 0, 1))
	
	if(not attacking)then
		if(not movementstate.walking and not movementstate.jumping and not movementstate.falling)then
			if(movementstate.flying)then
				playAnimation("flyidle")
			else
				playAnimation("idle")
			end
		elseif(movementstate.walking and not movementstate.jumping and not movementstate.falling)then
			if(movementstate.flying)then
				playAnimation("flywalk")
			else
				playAnimation("walk")
			end
		end
	end

	welds["tail"].C0 = CFrame.new(0+math.rad(20*math.cos((os.clock()*60)/20)), 0.4, 1.05) * CFrame.Angles(0, math.rad(20*math.cos((os.clock()*60)/20)), 0)
	
	pcall(function()
		pcall(function()
			local TrsoLV = welds.torso:Transform().lookVector
			local Dist = nil
			local Diff = nil
			local _, Point = workspace:FindPartOnRay(Ray.new(welds["head"]:Transform().Position, mouse.Hit.lookVector), workspace, false, true)
			Dist = (welds["head"]:Transform().Position-Point).magnitude
			Diff = welds["head"]:Transform().Y-Point.Y

			headrotation = CFrame.Angles((math.tan(Diff/Dist)*.6), 0, (((welds["head"]:Transform().Position-Point).Unit):Cross(welds.torso:Transform().lookVector)).Y*1)
			torsorotation = CFrame.Angles((math.tan(Diff/Dist)*.6)/3, 0, ((((welds["head"]:Transform().Position-Point).Unit):Cross(welds.torso:Transform().lookVector)).Y*1)/3)
		end)

		local anim = parsedanims[currentAnimation]
		if(anim)then
			local offsets = anim(os.clock()*60)
			local alpha = offsets._alpha or .1
			for i, v in next, offsets do
				pcall(function()
					local w = welds[i]
					if(i == "head")then
						w.C0 = w.C0:Lerp(v * headrotation, math.clamp(offsets._alpha*dtmult, 0, 1))
						return
					end
					if(i == "torso")then
						w.C0 = w.C0:Lerp(v * torsorotation, math.clamp(offsets._alpha*dtmult, 0, 1))
						return
					end
					w.C0 = w.C0:Lerp(v, math.clamp(offsets._alpha*dtmult, 0, 1))
				end)
			end
		end
	end)
	
	for i, v in next, limbs do
		v.ModifyProperty("CFrame", welds[i]:Transform())
	end
	
	hn(function()
		for i, v in next, createChar() do
			mirage(v)
		end
	end)

	remote:FireAllClients("effect", "aura",
		CFrame.new(fakemainpos.Position)*CFrame.new(4*math.cos((os.clock()*60)/40), 4*math.sin((os.clock()*60)/40+10), 2*math.cos((os.clock()*60)/40+20))*CFrame.Angles(math.rad(os.clock()*90),math.rad(os.clock()*80),math.rad(os.clock()*70)),
		Color3.fromHSV((os.clock()/2)%1, 1, 1)
	)

	if(not tripart or not pcall(function()
		return tripart.Parent
		end) or tripart.Parent ~= workspace)then
		tripart = Instance.new("Part")
		tripart.Anchored = true
		tripart.CanCollide = false
		tripart.Size = Vector3.zero
		tripart.Transparency = 1
	
		local bil = Instance.new("BillboardGui")
		bil.Adornee = tripart
		bil.Brightness = 5
		bil.LightInfluence = 0
		bil.AlwaysOnTop = false
		bil.Size = UDim2.fromScale(2,2)
		bil.Parent = tripart
	
		tri = Instance.new("ImageLabel")
		tri.AnchorPoint = Vector2.new(.5, .5)
		tri.BackgroundTransparency = 1
		tri.Position = UDim2.fromScale(.5, .5)
		tri.Size = UDim2.fromScale(1, 1)
		tri.Image = "rbxassetid://10164277616"
		tri.ResampleMode = Enum.ResamplerMode.Pixelated
		tri.Parent = bil
	
		ex = Instance.fromExisting(tri)
		ex.Image = "rbxassetid://15000498894"
		ex.Size = UDim2.fromScale(.5, .5)
		ex.Parent = bil
	
		tripart.Parent = workspace
	end

	tripart.CFrame = CFrame.new(fakemainpos.Position)*CFrame.new(-4*math.cos((os.clock()*67)/30), -4*math.sin((os.clock()*54)/30+10), -2*math.cos((os.clock()*43)/30+20))

	tri.Rotation = (os.clock()*90)%360
	tri.ImageTransparency = 1*math.cos(os.clock()*3)
	ex.ImageTransparency = 1*math.cos(os.clock()*3)

	tri.ImageColor3 = Color3.fromHSV((os.clock()/2)%1, 1, 1)
	ex.ImageColor3 = Color3.fromHSV((os.clock()/2)%1, 1, 1)
end)

return tweeninst, tween, _loop, _tween
