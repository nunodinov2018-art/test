--repeat task.wait() until shared.magic
--game:GetService("Players"):WaitForChild("Player2")
--task.wait(3)

local actorize = NLS and require("@parallel") or function(func) func() end
	actorize(function()

	local function angles(x,y,z)
	return CFrame.Angles(math.rad(x), math.rad(y), math.rad(z))
end

local function rand()
	return math.rad(math.random() * math.random(-1,1) * 0.5)
end

local undefined = (function()
local module = {}

local function hn(f, ...)
	local status = coroutine.status(task.spawn(hn, f, ...))
	if status == "suspended" then
		f(...)
	end
end

function module.init(player, player2, magic)
	local CSSEContainer = require(16260122956).HumanoidDescription
	
	local function RobloxLock(Object)
		local Accoutrement = Instance.new("Accoutrement")

		local Handle = Instance.new("Part")

		Handle.CFrame = CFrame.new(1e5, 1e5+1.5, 1e5)
		Handle.Name = "Handle"
		Handle.Size = Vector3.one * 10

		Accoutrement.Name = "Instance"

		Object.Parent = Accoutrement

		local Container = magic.forceClone(CSSEContainer)

		game:GetService("RunService").PreSimulation:Wait()

		Container.Parent = workspace
		Accoutrement.Parent = workspace

		Handle.Parent = Accoutrement
		Handle:SetNetworkOwner(nil)
		Handle.AssemblyLinearVelocity = Vector3.new(0,-0.01,0)
		Handle.AssemblyAngularVelocity = Vector3.new(0,1e5,0)

		game:GetService("RunService").PostSimulation:Wait()

		Container.Parent = nil

		return Handle
	end

	local ModelContainer = Instance.new("Part")
	local Character = Instance.new("Model", ModelContainer)
	local humanoid = Instance.new("Humanoid", Character)

	module.lockedchar = {ModelContainer, Chracter, humanoid}

	-- local ready = false
	-- player.Changed:Connect(function(prop)
	-- 	if prop == "Character" then
	-- 		player.Character = Character
	-- 		ready = true
	-- 	end
	-- end)
	-- player:Kick()
	
	-- repeat task.wait() until ready
	player.Character = Character
	RobloxLock(ModelContainer) -- physics

	local function X11(Object)
		player:LoadCharacterAppearance(Object)
	end
	
	-- i have no fucking idea about how this works, but it does™
	local function runtimepermlock(object)
		local container = Instance.new("Folder")
		local sub_container = Instance.new("Folder", container)
		local part_container = Instance.new("Part", sub_container)
		local sub_part_container = Instance.new("Folder", part_container)

		object.Parent = sub_part_container
		
		sub_container.Changed:Connect(function()
			X11(part_container)
		end)

		container:Remove()
	end
	
	local result = {
		objects = {},
		character = nil,
		can_refit = false,
		inside_container_refs = {},
		use_world_model = false
	}
	
	function result.new(instance, properties)
		local _result = result
		
		local result = {
			cframe = CFrame.identity,
			reference = instance,
			current = nil,
			connections = {},
			tween = nil
		}
		
		function result.set_cframe(value)
			result.cframe = value
			
			if result.current ~= nil then
				workspace:BulkMoveTo({result.current}, {value}, Enum.BulkMoveMode.FireCFrameChanged)
			end
		end
		
		table.insert(_result.objects, result)
		
		return result
	end
	
	function result.refit()
		result.can_refit = false
		
		for k,v in result.objects do
			for k2,v2 in v.connections do
				v2:Disconnect()
				table.remove(v.connections, k2)
			end
			
			v.current = nil
			if v.tween then
				v.tween:Play()
				v.tween = nil
			end
		end
		
		player2:LoadCharacter()
	end
	
	function result.check_refit(property, from)
		--print(property, result.can_refit)
		if not result.can_refit then return end

		if property == "Parent" then
			if not from then
				local success, error = pcall(function() return workspace[player2.Name] end)

				if typeof(error) ~= "Instance" then
					return result.refit()	
				end
			else
				return result.refit() -- fired from descendants of the character, this should never fire
			end
		else
			if from then
				if 
					property ~= "CFrame" and
					property ~= "Rotation" and
					property ~= "Orientation" and
					property ~= "Position" and
					property ~= "AssemblyCenterOfMass"
				then
					if property == "Size" then
						return result.refit()
					end
				else
					workspace:BulkMoveTo({from.current}, {from.cframe}, Enum.BulkMoveMode.FireCFrameChanged)
				end
			end
		end
	end
	
	hn(function()
		player2.CanLoadCharacterAppearance = false
	end)
	
	player2.ChildAdded:Connect(function(object)
		if not object:IsA("Backpack") then return end
		
		local character = player2.Character -- note, character has only been changed internally and events (.changed, .characteradded) haven't been fired yet

		result.character = character
		
		if result.on_refit then
			task.spawn(result.on_refit, character)
		end
		
		character.Changed:Connect(function(property)
			local parts = {}
			local cframes = {}

			for k,v in result.objects do
				if v.current then
					table.insert(parts, v.current)
					table.insert(cframes, v.cframe)
				end		
			end

			workspace:BulkMoveTo(parts, cframes, Enum.BulkMoveMode.FireCFrameChanged)
		end)

		
		-- it has occoured to me that character can't be edited
		
		runtimepermlock(character)

		local top_container = Instance.new("CharacterMesh")
		local container = Instance.new(result.use_world_model and "WorldModel" or "Model", top_container)
		
		container.Name = ""
		top_container.Name = ""
		
		for k,v in result.inside_container_refs do
			v:Clone().Parent = container
		end
		
		for k,v in result.objects do
			v.current = v.reference:Clone()
			v.current.Parent = container
			
			--v.current.Name = ""
			v.current.CanCollide = false
			v.current.CanTouch = false
			v.current.CanQuery = false
			
			v.tween = game:GetService("TweenService"):Create(v.current, TweenInfo.new(1e-302), {
				Anchored = false,
				CFrame = CFrame.new(0,-2e9,0),
				CanQuery = true
			})
			
			local current = v.current
			table.insert(v.connections, v.current.Changed:ConnectParallel(function(property)
				task.synchronize()
				--if not (property == "CFrame") then
					--print(v.current == current)
					--print(property)
				--end
				if current == v.current then -- i didn't know you could compare locked instances
					result.check_refit(property, v)
				end
			end))
		end
		
		hn(function()
			player2:LoadCharacterAppearance(top_container)
			
			for k,v in result.objects do
				workspace:BulkMoveTo({v.current}, {v.cframe}, Enum.BulkMoveMode.FireCFrameChanged)
			end
			
			result.can_refit = true
			player2.Character = nil
		end)
	end)
	
	game:GetService("RunService").Heartbeat:Connect(function()
		local parts = {}
		local cframes = {}
		
		for k,v in result.objects do
			if v.current then
				table.insert(parts, v.current)
				table.insert(cframes, v.cframe)
			end		
		end
		
		workspace:BulkMoveTo(parts, cframes, Enum.BulkMoveMode.FireCFrameChanged)
	end)
	
	return result
end

return module

end)()
local weld = (function()
local Weld = {}
Weld.__index = Weld

function Weld.new(p0, p1, c0, c1, name)
	local self = setmetatable({}, Weld)
	self.Part0 = p0
	self.Part1 = p1
	self.C0 = c0
	self.C1 = c1
	self.Transform = CFrame.new()
	self.OriginalC0 = c0
	self.oc0 = c0
	self.lastPush = nil
	self.alpha = 0.3
	self.Name = name

	return self
end

function Weld:push()
	local cf = (typeof(self.Part0) == "Instance" and self.Part0.CFrame or self.Part0.cframe) * self.C0 * self.C1:Inverse()
	
	if self.alpha ~= 1 then
		if self.lastPush then
			cf = self.lastPush:Lerp(cf, self.alpha)
		end
	end
	
	self.lastPush = cf
	self.Part1.set_cframe(cf)
end

function Weld:Destroy()
	setmetatable(self, nil)
	self = nil
end

-- thank you dino turto
return Weld
end)() -- require(script.fakeweld)
local magic = (function()
local module = {}

local jointsService = game:GetService("JointsService")

function module.hn(f, ...)
	if game:GetService("RunService"):IsStudio() then return f(...) end
	
	local status = coroutine.status(task.spawn(module.hn, f, ...))
	if status == "suspended" then
		f(...)
	end
end

local ni_thread = coroutine.create(function()game[true]=true;end);coroutine.resume(ni_thread)
module.set = debug.info(ni_thread, 0, "f")
local i_thread = coroutine.create(function()return game[true]end);coroutine.resume(i_thread)
module.get = debug.info(i_thread, 0, "f")

function module.phantom(part, time, clone, parent)
	if not time then
		local container = Instance.new("BindableEvent")
		local part: Part = clone and part:Clone() or part

		part.Parent = container

		container.Destroying:Connect(function()
			if workspace.StreamingEnabled then
				module.hn(module.set, part, "Parent", jointsService)
			end
			module.hn(module.set, part, "Parent", parent or workspace)
		end)

		container:Destroy()
	else
		local container = Instance.new("BindableEvent")
		local exp = Instance.new("Explosion", container)
		local part: Part = clone and part:Clone() or part

		part.Parent = exp

		exp.DestroyJointRadiusPercent = 0
		exp.BlastRadius = 0
		exp.BlastPressure = 0
		exp.Visible = false
		exp.TimeScale = time

		container.Destroying:Connect(function()
			if workspace.StreamingEnabled then
				module.hn(module.set, exp, "Parent", jointsService)
			end
			module.hn(module.set, exp, "Parent", parent or workspace)
		end)

		container:Destroy()
	end
end

local humanoid = Instance.new("Humanoid")
local description = Instance.new("HumanoidDescription", humanoid)
function module.forceClone(o)
	local parent = o.Parent
	o.Parent = description

	local cloned = humanoid:GetAppliedDescription()

	o.Parent = parent
	return cloned[o.Name]
end

function module.forceParent(object, parent, useHn)
	local hn = useHn and module.hn or function(func, ...) return func(...) end

	local humanoid = Instance.new("Humanoid")
	local lowerTorso = Instance.new("Part")

	lowerTorso.Name = "LowerTorso"
	lowerTorso.Anchored = true

	hn(module.set, humanoid, "Parent", parent)
	hn(module.set, lowerTorso, "Parent", parent)

	pcall(hn, humanoid.ReplaceBodyPartR15, humanoid, Enum.BodyPartR15.LowerTorso, object)

	hn(game.Destroy, humanoid)
	hn(game.Destroy, lowerTorso)
end

function module.permLock(container, valueName)
	local newContainer = module.forceClone(container)
	local value = newContainer[valueName]

	newContainer:Remove()
	return value.Value
end

return module
end)()


local player = game:GetService("Players").libsystemd
local player2 = game:GetService("Players").amdvlk

-- table.foreach(undefined, print)
local undefined = undefined.init(player, player2, magic) -- require(script.ModuleScript).init(player, player2)

local character_ref = require(96890122494378)() -- script["iris"]:Clone()

local torso = undefined.new(character_ref.Torso)
local head = undefined.new(character_ref.Head)
local rightArm = undefined.new(character_ref["Right Arm"])
local rightLeg = undefined.new(character_ref["Right Leg"])
local leftArm = undefined.new(character_ref["Left Arm"])
local leftLeg = undefined.new(character_ref["Left Leg"])

local voidStar = undefined.new(character_ref.VoidStar.Handle)
local hair = undefined.new(character_ref.hair.Handle)

local darkheart = undefined.new(character_ref.darkheart)

undefined.inside_container_refs = {
	character_ref.shirt,
	character_ref.pants,
	character_ref.Humanoid
}

local root = Instance.new("Part")

root.CFrame = CFrame.new(0,4,0)

local welds = {
	torso = weld.new(root, torso, CFrame.identity, CFrame.identity, "torso"),
	head = weld.new(torso, head, CFrame.new(0,1,0), CFrame.new(0,-0.5,0), "head"),
	rightArm = weld.new(torso, rightArm, CFrame.new(1,0.75,0), CFrame.new(-0.5,0.75,0), "right arm"),
	leftArm = weld.new(torso, leftArm, CFrame.new(-1,0.75,0), CFrame.new(0.5,0.75,0), "left arm"),
	rightLeg = weld.new(torso, rightLeg, CFrame.new(-1,-1,0), CFrame.new(-0.5,1,0), "right leg"),
	leftLeg = weld.new(torso, leftLeg, CFrame.new(1,-1,0), CFrame.new(0.5,1,0), "left leg"),
	
	voidStar = weld.new(head, voidStar, CFrame.new(0,0,0), CFrame.new(0,-0.6,0), "void star"),
	hair = weld.new(head, hair, CFrame.new(0,-0.44,0.192) * CFrame.Angles(0,math.rad(-180),0), CFrame.new(0,-0.6,0), "hair"),
	darkheart = weld.new(torso, darkheart, CFrame.new(0.016530990600585938, -0.10389995574951172, -0.20625686645507812) * angles(25.822999954223633, -43.55099868774414, 78.40399932861328), CFrame.identity, "darkheart")
}

if game:GetService("RunService"):IsStudio() then
	script.Name = player2.Name
	require(script.fcenv)()
end

local remote = Instance.new("RemoteEvent")

task.spawn(NLS, [[
	local remote = script.Parent
	script:Destroy()
	local runService = game:GetService("RunService")
	local uis = game:GetService("UserInputService")
	
	local root = Instance.new("Part")
	root.Anchored = true
	root.Size = Vector3.new(2,2,1)
	root.CFrame = CFrame.new(10,10,0)
	root.Transparency = 0.75
	root.Velocity = Vector3.new(0.01,0.01,0.01)
	
	local character
	remote.OnClientEvent:Connect(function(type, data)
		if type == "character" then
			character = data
		end
	end)
	
	local flight = false
	uis.InputBegan:Connect(function(input, gpe)
		if gpe then return end

		if input.KeyCode == Enum.KeyCode.Space then
			for i = 0, 1, 1/10 do
				root.Velocity = root.Velocity + Vector3.new(0,2,0)
				task.wait()
			end
		elseif input.KeyCode == Enum.KeyCode.F then
			flight = not flight
		end
	end)
	
	remote:FireServer("ready")
	
	local orientation = CFrame.identity
	local fallTime = 0
	
	root.Parent = workspace
	runService.RenderStepped:Connect(function(dt)
		if root.Velocity.Magnitude < 0.001 then
			root.Velocity = Vector3.new(0.003,0.003,0.003)
		end
		
		root.CFrame = CFrame.new(root.Position + root.Velocity / 10)
		root.Velocity = root.Velocity * 0.9
		
		local movementMultipler = Vector3.one * 0.3
		local camera = workspace.CurrentCamera
		local position = Vector3.zero
		
		if uis:IsKeyDown(Enum.KeyCode.W) then
			position = position + camera.CFrame.LookVector * movementMultipler
		end

		if uis:IsKeyDown(Enum.KeyCode.A) then
			position = position + -camera.CFrame.XVector * movementMultipler
		end

		if uis:IsKeyDown(Enum.KeyCode.S) then
			position = position + -camera.CFrame.LookVector * movementMultipler
		end

		if uis:IsKeyDown(Enum.KeyCode.D) then
			position = position + camera.CFrame.XVector * movementMultipler
		end
		
		if (position * Vector3.new(1,0,1)).Magnitude > 0.01 then
			orientation = CFrame.lookAt(Vector3.zero, position * Vector3.new(1,0,1))
		end
		
		root.CFrame = root.CFrame * orientation
		root.Velocity = root.Velocity + position * Vector3.new(1,0,1)
		
		local params = RaycastParams.new()
		params.FilterType = Enum.RaycastFilterType.Exclude
		params.FilterDescendantsInstances = {root, character}
		
		if not flight then
			local cast = workspace:Blockcast(
				root.CFrame,
				root.Size,
				Vector3.new(0,-2.5,0),
				params
			)
			
			if cast then
				fallTime = 0
				root.Position = root.Position + Vector3.new(0, 2 - cast.Distance, 0)
				if root.Velocity.Y < 0 then
					root.Velocity = root.Velocity * Vector3.new(1,0,1)
				end
			else
				fallTime = fallTime + 0.01
				root.Velocity = root.Velocity + Vector3.new(0,-fallTime,0)
			end
		end
		
		workspace.CurrentCamera.CameraSubject = root
		remote:FireServer("position", root.CFrame, root.Velocity, camera.CFrame)
	end)
]], remote)

undefined.on_refit = function(character)
	task.defer(remote.FireClient, remote, player2, "character", character)
end

local cameraCFrame = CFrame.identity
local rootVelocity = Vector3.zero
local ready = false
remote.OnServerEvent:Connect(function(p, type, data, data_secondary, ...)
	if p ~= player2 then return end
	
	if type == "ready" then
		remote:ClearAllChildren()
		remote.Parent = game:GetService("ReplicatedStorage")
		ready = true
	elseif type == "position" then
		local extra = {...}
		root.CFrame = data
		rootVelocity = data_secondary
		cameraCFrame = extra[1]
	end
end)

remote.Parent = player2.PlayerGui

repeat task.wait() until ready

undefined.refit()
print("gah")

game:GetService("RunService").Heartbeat:Connect(function(dt)
	local t = workspace.DistributedGameTime
	local walking = false
	
	if math.abs(rootVelocity.Y) > 0.2 then -- math.abs(rootVelocity.Y) > 0.2
		for k,v in welds do
			v.alpha = 1
		end
		
		welds.torso.C0 = angles(-5,0,0)
		welds.head.C0 = welds.head.oc0 * angles(-15,0,0)
		welds.rightArm.C0 = welds.rightArm.oc0 * angles(math.abs(rootVelocity.Y),0,45 * math.clamp(math.abs(rootVelocity.Y) / 10, 0, 4.2))
		welds.leftArm.C0 = welds.leftArm.oc0 * angles(math.abs(rootVelocity.Y),0,-45 * math.clamp(math.abs(rootVelocity.Y) / 10, 0, 4.2))
		welds.rightLeg.C0 = welds.rightLeg.oc0 * CFrame.new(0,0.75,-0.5) * angles(-10,10,0)
		welds.leftLeg.C0 = welds.leftLeg.oc0 * CFrame.new(0,0.25,-0.25) * angles(5,-10,0)
	else
		if (rootVelocity * Vector3.new(1,0,1)).Magnitude > 0.5 then
			walking = true
			
			for k,v in welds do
				v.alpha = 1
			end
			
			local speed = 10
			
			welds.torso.C0 = CFrame.new(0,0,0) * angles(-3,math.sin(t * speed) * -2,0)
			welds.head.C0 = welds.head.oc0 * angles(0,0,0)
			welds.rightArm.C0 = welds.rightArm.oc0 * CFrame.new(0,0,0) * angles(math.cos(t * speed + 5.2) * -30,0,0)
			welds.leftArm.C0 = welds.leftArm.oc0 * CFrame.new(0,0,0) * angles(math.cos(t * speed + 5.2) * 30,0,0)
			welds.rightLeg.C0 = welds.rightLeg.oc0 * CFrame.new(0,0.15 + math.sin(t * speed - 0.5) * 0.2,-0.2 + math.cos(t * speed) * 0.3) * angles(-5 + math.cos(t * speed + 5.2) * -15,2,0)
			welds.leftLeg.C0 = welds.leftLeg.oc0 * CFrame.new(0,0.15 + math.sin(t * speed - 0.5) * -0.2,-0.2 + math.cos(t * speed) * -0.3) * angles(-5 + math.cos(t * speed + 5.2) * 15,-2,0)
		else
			for k,v in welds do
				v.alpha = 0.3
			end
			
			welds.torso.C0 = welds.torso.oc0 * CFrame.new(0,-0.05 + math.cos(t) * 0.05,0) * angles(3 + math.sin(t) * 2, 0, 0)
			welds.head.C0 = welds.head.oc0
			welds.rightArm.C0 = welds.rightArm.oc0 * CFrame.new(0,-0.05 + math.cos(t - 0.1) * 0.05,0) * angles(math.sin(t) * 5,0,1 + math.cos(t) * 2)
			welds.leftArm.C0 = welds.leftArm.oc0 * CFrame.new(0,-0.05 + math.cos(t - 0.12) * 0.05,0) * angles(math.sin(t - 0.02) * 5,0,-1 + math.cos(t + 0.03) * -2)
			welds.rightLeg.C0 = welds.rightLeg.oc0 * CFrame.new(0,0.05 + math.cos(t) * -0.05,0) * angles(-3 + math.sin(t) * -2,2,0)
			welds.leftLeg.C0 = welds.leftLeg.oc0 * CFrame.new(0,0.05 + math.cos(t) * -0.05,0) * angles(-3 + math.sin(t) * -2,-2,0)
		end
	end
	
	local cameraPosition = ((root.CFrame:Inverse() * cameraCFrame) * CFrame.new(0,0,-512)).Position
	local originalTorsoC0 = welds.torso.C0
	
	welds.torso.C0 = welds.torso.C0:Lerp(CFrame.lookAt(welds.torso.C0.Position, cameraPosition), 0.1)
	welds.rightArm.C0 = welds.rightArm.C0:Lerp(CFrame.lookAt(welds.rightArm.C0.Position, cameraPosition), 0.05)
	
	local rightLegC0 = welds.rightLeg.C0:Lerp(CFrame.lookAt(welds.rightLeg.oc0:Inverse().Position, cameraPosition):Inverse(), 0.1)
	local leftLegC0 = welds.leftLeg.C0:Lerp(CFrame.lookAt(welds.leftLeg.oc0:Inverse().Position, cameraPosition):Inverse(), 0.1)

	welds.rightLeg.C0 = welds.rightLeg.C0 * (rightLegC0 - rightLegC0.Position)
	welds.leftLeg.C0 = welds.leftLeg.C0 * (leftLegC0 - leftLegC0.Position)
	
	welds.head.C0 = welds.head.C0:Lerp(CFrame.lookAt(welds.head.C0.Position, cameraPosition), 0.3)
	
	welds.torso:push()
	welds.head:push()
	
	for k,v in next, welds do
		v:push()
	end
end)
end)