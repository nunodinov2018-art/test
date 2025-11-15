-- = �?? = --

--> 2Katar by crack / subterranias
--> ported to 115 by datz1251
--> uses a lot of modules so ported ver is ugly af lol sorry about that
--> not intended for usage with vlua (no luau ops)




--[[ Changes ]]--

----- [[02/09/2024 (subterranias) ]]--
--> Added walk animation
--> Added idle animation
--> Added sprinting
--> Added shiftlock
--> Fixed acceleration function messing with gravity
--> Fixed character rotation not correcting itself when you stop flying

-- why is this actual garbage what the hell lol

task.wait()

local Player: Player = game:GetService("Players"):FindFirstChild(owner.Name) -- Lol
local UID = Player.UserId
local NLS = require(13482937602)()

script.Parent = nil

------------------------------------------------------
print("Hi")

local INITIALCLOCK = os.clock()
local INITIALPOS = CFrame.new(0, 10, 0)
pcall(function()
	INITIALPOS = Player.Character.HumanoidRootPart.CFrame
end)

local CHARPOS = INITIALPOS

local CAMCF = CFrame.new()
local LOOKCF = CFrame.new()
local MOUSECF = CFrame.new()

local MOUSETARGET = nil

local R_SERV = game:GetService("RunService")
local F_SERV = game:GetService("FriendService")
local PLR_SERV = game:GetService("Players")


local InstanceNew = Instance.new

local HB = R_SERV.Heartbeat
local PSIM = R_SERV.PostSimulation
local STP = R_SERV.Stepped
local PANIM = R_SERV.PreAnimation

local cf = CFrame.new
local cwrap = function(...)
	return coroutine.wrap(...)()
end
local function radang(...) local cx,cy,cz = ... cx=cx or 0 cy=cy or 0 cz=cz or 0 return CFrame.Angles(math.rad(cx),math.rad(cy),math.rad(cz)) end


------------------------------------------------------
local KPF =	(function()
	--[[--

	subterranias' personal functions module

	--]]--

	local KaetarPersonalFunctions = {}

	--//Services
	local R_SERV = game:GetService("RunService")
	local HTTP_SERV = game:GetService("HttpService")
	local USR_SERV = game:GetService("UserService")
	local PLR_SERV = game:GetService("Players")

	local ModuleStorage = {
		RateLimitTasks = {};
	}

	KaetarPersonalFunctions.DeltaTime = 1/60
	KaetarPersonalFunctions.AnimationDelta = 1/60

	--//DATA TYPES
	--//number
	function KaetarPersonalFunctions:Random(min, max, decimals, seed)
		local random = Random.new()
		if seed ~= nil then
			random = Random.new(seed)
		end

		local evaldecimals = tonumber(`1e{decimals or 0}`)
		local number = random:NextNumber(min or 0, max or 1)

		return math.round(number * evaldecimals) / evaldecimals
	end

	function KaetarPersonalFunctions:RandomNum(min, max, seed)
		local random = Random.new()
		if seed ~= nil then
			random = Random.new(seed)
		end

		return random:NextNumber(min or 0, max or 1)
	end

	function KaetarPersonalFunctions:RandomInt(min, max, seed)
		local random = Random.new()
		if seed ~= nil then
			random = Random.new(seed)
		end

		return random:NextInteger(min or 0, max or 1)
	end

	--//color3
	function KaetarPersonalFunctions:Color3Convert(color, to)
		local HSV = Color3.fromHSV(color:ToHSV())
		local R, G, B = HSV.R, HSV.G, HSV.B

		local colorArray = {
			new = Color3.new(R, G, B);
			fromRGB = Color3.fromRGB(R * 0xFF, G * 0xFF, B * 0xFF);
			fromHex = Color3.new(R, G, B):ToHex();
			fromHSV = HSV;
		}

		return colorArray[to] or HSV :: Color3
	end

	function KaetarPersonalFunctions:Color3Invert(color, progression)
		local R, G, B = color.R, color.G, color.B

		return color:Lerp(Color3.new(1 - R, 1 - G, 1 - B), progression or 1)
	end



	--//string
	function KaetarPersonalFunctions:GenerateUniqueString()
		local basestring = `{HTTP_SERV:GenerateGUID(false)}{os.clock() / tick()}{math.random()}`
		local bytes = basestring:gsub(".",function(c) return utf8.char(utf8.codepoint(c) * math.random(1,4)) end) or basestring

		return bytes
	end

	function KaetarPersonalFunctions:RandomString(len, min, max)
		local chars = {}

		for i = 1, len or math.random(5,15) do
			local random = math.random(min or 33, max or 12991)
			local char = utf8.char(random)

			table.insert(chars, char)
		end

		return table.concat(chars,"")
	end


	--//table
	function KaetarPersonalFunctions:TableFlip(t)
		local reversedTable = {}
		local itemCount = #t
		for k, v in ipairs(t) do
			reversedTable[itemCount + 1 - k] = v
		end

		return reversedTable
	end

	function KaetarPersonalFunctions:TableFind(t, element)
		for i,v in t do
			if v == element then
				return i
			end
		end
	end

	function KaetarPersonalFunctions:TableRemove(t, key)
		local clonedtable = table.pack(table.unpack(t))

		for i,v in t do
			if i == key then
				clonedtable[key] = nil
			end
		end

		return clonedtable
	end

	function KaetarPersonalFunctions:TableRandom(t, seed)
		local random = Random.new()
		if seed ~= nil then
			random = Random.new(seed)
		end

		local names = {}
		for i,v in t do
			table.insert(names, i)
		end

		return t[names[random:NextInteger(0, #names)]]
	end

	function KaetarPersonalFunctions:CombineTable(...)
		local newtable = {}

		for _,ctable in table.pack(...) do if typeof(ctable) ~= "table" then continue end
			for _,v in ctable do
				table.insert(newtable,v)
			end
		end

		return newtable
	end

	function KaetarPersonalFunctions:CloneTable(t)
		local clone = {}
		for i, v in t do
			if typeof(v) == "table" then
				v = self:CloneTable(v)
			end
			clone[i] = v
		end

		return clone
	end


	--//CFrame
	function KaetarPersonalFunctions:IsolateAngles(cframe)
		local ax,ay,az = cframe:ToEulerAnglesXYZ()
		return CFrame.Angles(ax, ay, az)
	end

	function KaetarPersonalFunctions:GetCFrameAngles(cframe)
		local ax,ay,az = cframe:ToEulerAnglesXYZ()
		return Vector3.new(ax, ay, az)
	end

	function KaetarPersonalFunctions:GetCFrameOrientation(cframe)
		return Vector3.new(cframe:ToOrientation())
	end

	--//Vector3
	function KaetarPersonalFunctions:NormalizeVector(v3)
		return v3 == v3 and v3 or Vector3.zero
	end

	--//RBXScriptConnection
	function KaetarPersonalFunctions:ForceConnect(baseconnection, ...) --Experimental
		local disconnected = false
		local args = ...

		local function reinit()
			if disconnected then return end

			local force = {}
			force.Connection = baseconnection:Once(reinit, args)

			function force:Disconnect()
				disconnected = true
			end

			return force
		end 

		return reinit()
	end

	--//INSTANCES
	function KaetarPersonalFunctions:GetFlippedDescendants(parent: Instance)
		return self:TableFlip(parent:GetDescendants())
	end

	function KaetarPersonalFunctions:IsReadOnly(class, property)
		return not pcall(function() local instance = Instance.new(class) instance[property] = instance[property] end)
	end	


	function KaetarPersonalFunctions:IsRenderedInstance(instance: Instance)
		return pcall(function() local _,_ = instance.CFrame, instance.Size end)
	end

	function KaetarPersonalFunctions:GetRenderedInstances(parent, recursive)
		local check = recursive and parent:GetDescendants() or parent:GetChildren()
		local instances = {}

		for i,v in check do
			if self:IsRenderedInstance(v) then
				table.insert(instances, v)
			end
		end

		return instances
	end

	--//Joints
	function KaetarPersonalFunctions:C1ToWorldSpace(joint, worldcframe)
		if joint == nil then return end
		return worldcframe:Inverse() * joint.Part0.CFrame * joint.C0
	end

	--//MISC

	function KaetarPersonalFunctions:ErrorResume(...)
		task.spawn(error, ...)
	end

	function KaetarPersonalFunctions:AssertResume(value, errorMessage)
		if value == nil then
			task.spawn(assert, value, errorMessage)
		end

		return value
	end

	function KaetarPersonalFunctions:Raycast(pos, dir, distance, ignore, filtertype)
		local raycastParams = RaycastParams.new()
		do raycastParams.FilterDescendantsInstances = ignore or {} raycastParams.FilterType = filtertype or Enum.RaycastFilterType.Exclude end

		local startpos, endpos = pos, dir.Unit * distance
		local result = workspace:Raycast(startpos, endpos, raycastParams)

		if result == nil then
			result = {
				Distance = distance;
				Position = endpos;
				Normal = Vector3.new(0,1,0)
			}
		end

		return result
	end

	function KaetarPersonalFunctions:RateLimit(taskname, limit)
		local RLT = ModuleStorage["RateLimitTasks"]
		if RLT[taskname] == nil then RLT[taskname] = {os.clock(), 0} end

		if (RLT[taskname][2] + limit) < os.clock() then
			RLT[taskname][2] = os.clock() return true
		end

		return false
	end

	function KaetarPersonalFunctions:MultiLerp(a, b, t) --//Lerp everything!!! unlimited power!!! �???�???�???�???�???�???
		local passedType = typeof(a) == typeof(b) and typeof(a) or nil
		if passedType == nil then 
			return b
		end

		local isinstance = passedType == "Instance"
		local canlerp = pcall(function() local _v = a.Lerp assert(not isinstance and _v) end)
		local cancalculate = pcall(function() local _v = a + b assert(not isinstance and _v) end)

		local output = b
		if canlerp == true then
			output = (a:Lerp(b, t))
		elseif canlerp == false and cancalculate == true then
			output = (a + (b - a) * t)
		else
			output = (t < 1 / 2 and a or b)
		end

		return output
	end

	function KaetarPersonalFunctions:AnimateLerp(base, j, p, g, t, d)
		j[p] = j[p]:Lerp(base * g, t * ((d or KaetarPersonalFunctions.AnimationDelta) * 60))
	end

	if R_SERV:IsServer() then
		R_SERV.Heartbeat:Connect(function(DeltaTime) KaetarPersonalFunctions.DeltaTime = DeltaTime end)
	elseif R_SERV:IsClient() then
		R_SERV.RenderStepped:Connect(function(DeltaTime) KaetarPersonalFunctions.DeltaTime = DeltaTime end)
	end

	return KaetarPersonalFunctions
end)()

local MethodRoot = (function()
	local module = {}

	local Runservice = game:GetService("RunService")

	local coroutine_resume = coroutine.resume
	local coroutine_create = coroutine.create
	local coroutine_yield = coroutine.yield
	local coroutine_wrap = coroutine.wrap

	local task_spawn = task.spawn
	local task_delay = task.delay
	local task_defer = task.defer
	local task_syn = task.synchronize
	local task_desyn = task.desynchronize

	local P = {--Priorities
		Supernull = function(n, func)
			local SNThread; SNThread = coroutine_create(function()
				for i = 1, n do
					coroutine_yield(task_defer(coroutine_resume, SNThread))
				end if func then func() end
			end)

			coroutine_yield(coroutine_resume(SNThread))
		end,

		Stall = function(n, func) n = n or 1
			local StallThread; StallThread = coroutine_create(function()
				for i = 1, n do
					coroutine_resume(coroutine_create(function()
						task_desyn() task_syn() coroutine_resume(StallThread)
					end)) coroutine_yield(StallThread)
				end if func then func() end
			end)

			coroutine_yield(coroutine_resume(StallThread))
		end,

		Priority = function(signal, func) pcall(func)
			local Connection = signal:Connect(func)
			task_delay(0, function()
				Connection:Disconnect()
			end)
		end,
	}


	function module.Stall(n, func)
		P.Stall(n, func)
	end

	function module.SN(n, func)
		P.Supernull(n, func)
	end

	function module.Priority(signal, func)
		P.Priority(signal, func)
	end

	function module.Suppression(func)
		local i = true task_spawn(function() i = false end)
		if i then
			task_spawn(func)
			return func()
		end

		task_spawn(module.Suppression, func)
	end

	return module
end)()

local TickModule = (function()
	local R_SERV = game:GetService("RunService")

	local BASE_TICK_RATE = 1 / 60

	local module = {}

	function module.new(Rate, Connection)
		local Tick = Instance.new("BindableEvent")
		local Internal, Class = {}, {}

		Class.Rate = Rate or BASE_TICK_RATE
		Internal.Aggregate = 0
		Internal.Frameloss = 0

		function Internal.sleep(n)
			for i = 0, (tonumber(n) and n or 0) do
				Tick.Event:Wait()
			end
		end

		local Update = R_SERV[(Connection or "Heartbeat")]:Connect(function(DeltaTime)
			Internal.Aggregate += DeltaTime

			if Internal.Aggregate >= Class.Rate then
				Internal.Frameloss = math.floor(Internal.Aggregate / Class.Rate)
				Internal.Aggregate = Internal.Aggregate - (Class.Rate * Internal.Frameloss)

				for i = 1, Internal.Frameloss do
					Tick:Fire()
				end
			end
		end)

		---

		function Class.sleep(n)
			return Internal.sleep(n)
		end

		function Class.wait(n)
			return Internal.sleep((n or 0) / Class.Rate)
		end

		function Class.delay(n, func, ...)
			local Thread = coroutine.create(function(Arguments)
				Internal.sleep(n / Class.Rate)

				func(Arguments)
			end)

			coroutine.resume(Thread, ...)
		end

		function Class:Disconnect()
			Update:Disconnect()
		end
		return Class
	end

	return module
end)()

local SignalModule = (function()
	local module = {}

	function module.new()
		local Connections = {};
		local Signal = {
			Event = {};
		};

		function Signal.Event:Connect(func)
			local Connection = {
				__Function = function(self, ...) func(...)  end;
				Connected = true;
			}; 

			function Connection:Disconnect()
				local ConnectionIndex = table.find(Connections, Connection)
				if not ConnectionIndex then return end

				table.remove(Connections, ConnectionIndex)
				Connection.Connected = false
				Connection.__Function = nil
			end

			table.insert(Connections, Connection)
			return Connection
		end

		function Signal.Event:Once(func)
			local Connection = {
				__Function = function(self, ...) self:Disconnect() func(...) end;
				Connected = true;
			}; 

			function Connection:Disconnect()
				local ConnectionIndex = table.find(Connections, Connection)
				if not ConnectionIndex then return end

				table.remove(Connections, ConnectionIndex)
				Connection.Connected = false
				Connection.__Function = nil
			end

			table.insert(Connections, Connection)
			return Connection
		end

		function Signal:Fire(...)
			for i = 1, #Connections do
				Connections[i]:__Function(...)
			end
		end

		return Signal
	end

	return module
end)()

local Assets = require(81181474562344);
local Bezier = require(123982846129910);
------------------------------------------------------

local Tick = TickModule.new(1/60, "PostSimulation");
local EarlyTick = TickModule.new(1/60, "PreSimulation");

local Loops = {
	__events = {
		SN = SignalModule.new();
		HN = SignalModule.new();
		Stall = SignalModule.new();

		Counter = SignalModule.new();
	}
} for i, v in Loops.__events do Loops[i] = v.Event end

local FireCounter = false

local AntideathSettings = {
	StallDepth = 175;
	SNDepth = 80;


	DoSN = true;
	DoHN = true;
	DoStall = true;
	DoCounter = true;

	DoLoopRefit = true;

	CounterDepth = 0;
	CounterAdd = 100;
	CounterMult = 1.25;
	CounterCooldown = 3;
}

--//Functionality
local CounterTick = 1
local RefitTick = 1

local Counter = SignalModule.new();
local Resume = true
do
	if R_SERV:IsStudio() or game.PlaceId == 843495510 then
		AntideathSettings.DoStall = false;
		AntideathSettings.DoHN = false;
	end

	local SNLoop; SNLoop = HB:Connect(function()
		if not Resume then SNLoop:Disconnect() return end
		if not AntideathSettings.DoSN then
			Loops.__events.SN:Fire()
			return
		end

		MethodRoot.SN(AntideathSettings.SNDepth, function()
			Loops.__events.SN:Fire()
		end)
	end)

	local HNLoop; HNLoop = Loops.Stall:Connect(function()
		if not Resume then HNLoop:Disconnect() return end
		if not AntideathSettings.DoHN then return end

		MethodRoot.Suppression(function()
			Loops.__events.HN:Fire()
		end)
	end)

	local StallLoop; StallLoop = Loops.SN:Connect(function()
		if not Resume then StallLoop:Disconnect() return end
		if not AntideathSettings.DoStall then
			Loops.__events.Stall:Fire()
			return
		end

		local Depth = AntideathSettings.StallDepth
		if AntideathSettings.DoStall then
			if AntideathSettings.DoCounter then
				Depth += AntideathSettings.CounterDepth
			end

			--Depth = math.clamp(Depth, 0, 6000)
			MethodRoot.Stall(Depth, function()
				Loops.__events.Stall:Fire()
			end)
		end
	end)

	local CounterLoop; CounterLoop = STP:Connect(function(DeltaTime)
		if not Resume then CounterLoop:Disconnect() return end

		Loops.__events.Counter:Fire()

		if CounterTick >= (RefitTick + AntideathSettings.CounterCooldown) then
			AntideathSettings.CounterDepth = 0
		end
		CounterTick += 1
	end)

	local CounterUpdate; CounterUpdate = Counter.Event:Connect(function()
		AntideathSettings.CounterDepth *= AntideathSettings.CounterMult
		AntideathSettings.CounterDepth += AntideathSettings.CounterAdd
	end)
end

local Instance = setmetatable({
	sbox = function(className: string)
		local DefaultInstance: Instance = InstanceNew(className)
		local SandboxedInstance: Instance = InstanceNew(className)

		local PROXY = newproxy(true)
		local InstanceMeta = getmetatable(PROXY)
		InstanceMeta.__metatable = "The metatable is locked"

		local Events = {
			ScriptChanged = SignalModule.new();
		}
		local Sandboxed = {}
		local InstanceBase = {
			SpecialTypes = {"function", "RBXScriptConnection"};
			Indexed = {};

			ApplyIndexes = function(self, exclude)
				for i, v in self.Indexed do
					if table.find((exclude or {}), i) then continue end
					pcall(function() SandboxedInstance[i] = v end)
				end
			end;
		}


		do
			local ConnectionFuncs = {
				Changed = function(TBL, Property)
					if not Resume then return end
					if KPF:IsReadOnly(className, Property) then return end

					local PropertyType = typeof(DefaultInstance[Property])

					if PropertyType == "CFrame" and Property ~= "CFrame" then return end
					if PropertyType == "Vector3" or PropertyType == "BrickColor" then return end

					if InstanceBase.Indexed[Property] == nil then
						InstanceBase.Indexed[Property] = DefaultInstance[Property]
					end

					if InstanceBase.Indexed[Property] ~= SandboxedInstance[Property] then
						TBL:Refit()
					end
				end,
				Destroying = function(TBL)
					if not Resume then return end
					TBL:Refit()
				end,

				ChildAdded = function(TBL)
					if not Resume then return end
					TBL:Refit()
				end,
			};	

			local Antideath = {
				Connections = {};
				Dead = false;

				FixProperties = function(self, exclude)
					if SandboxedInstance:IsA("MeshPart") and not table.find((exclude or {}), "MeshId") then
						SandboxedInstance:ApplyMesh(DefaultInstance)
					end
					InstanceBase:ApplyIndexes(exclude)
				end,

				Refit = function(self, DestroyDelay)
					local OldInstance = SandboxedInstance
					SandboxedInstance = InstanceNew(className) self:FixProperties({"Parent"})

					for i, v in self.Connections do v:Disconnect() end
					self:ApplyConnections()

					SandboxedInstance["Parent"] = InstanceBase.Indexed["Parent"]
					self:FixProperties() self:PollDeath()

					pcall(function() OldInstance:Destroy() end)
				end,

				PollDeath = function(self, Refit) self.Dead = false
					if not pcall(function() local _=SandboxedInstance end) then self.Dead = true return end

					if SandboxedInstance:IsA("BasePart") and #SandboxedInstance:GetChildren() > 0 then self.Dead = true end
					if SandboxedInstance:IsA("MeshPart") and SandboxedInstance.MeshId ~= DefaultInstance.MeshId then self.Dead = true end

					for i, v in InstanceBase.Indexed do
						if typeof(v) == "RBXScriptSignal" or typeof(v) == "function" or typeof(v) == "table" then continue end
						if SandboxedInstance[i] ~= InstanceBase.Indexed[i] then	
							self.Dead = true
							break
						end
					end
					if Refit and self.Dead == true then
						self:Refit() RefitTick = CounterTick
					end

					return self.Dead
				end,

				ApplyConnections = function(self)
					for i, v in ConnectionFuncs do
						self.Connections[i] = SandboxedInstance[i]:Connect(function(...) v(self, ...) end)
					end
				end,
			} 

			local SNLoop; SNLoop = Loops.SN:Connect(function()
				if not Resume then SNLoop:Disconnect() end

				Antideath:PollDeath(true)
			end)

			local HNLoop; HNLoop = Loops.HN:Connect(function()
				if not Resume then HNLoop:Disconnect() end

				Antideath:PollDeath(true)
			end)

			local StallLoop; StallLoop = Loops.Stall:Connect(function()
				if not Resume then StallLoop:Disconnect() end

				Antideath:PollDeath(true)
			end)

			local CounterLoop; CounterLoop = Loops.Counter:Connect(function()
				if not Resume then CounterLoop:Disconnect() end

				if Antideath:PollDeath() and AntideathSettings.DoCounter then
					Counter:Fire()
				end
			end)

			function Sandboxed:Refit() Antideath:Refit() end
			if className == "MeshPart" then
				function Sandboxed:ApplyMesh(mesh) for i = 1, 2 do (i == 1 and DefaultInstance or SandboxedInstance):ApplyMesh(mesh) end end
			end

			if className == "RemoteEvent" then
				ConnectionFuncs.OnServerEvent = function(self, ...)
					Events.OnServerEvent:Fire(...)
				end
			end

			Antideath:ApplyConnections()
		end

		do --//Indexing
			InstanceMeta.__index = function(self, i)
				local SpecialTypes = InstanceBase.SpecialTypes
				local Returned = nil

				if InstanceBase.Indexed[i] ~= nil then Returned = InstanceBase.Indexed[i] end
				if Sandboxed[i] ~= nil then Returned = Sandboxed[i] end

				if not pcall(function() table.find(SpecialTypes, typeof(DefaultInstance[i])) end) and Returned == nil then
					if table.find(SpecialTypes, typeof(InstanceBase.Indexed[i])) then
						Returned = InstanceBase.Indexed[i]
					end

					Returned = function(_, ...)
						SandboxedInstance[i](SandboxedInstance, ...)
					end
				end

				return Returned
			end
			InstanceMeta.__newindex = function(self, i, v)
				pcall(function() InstanceBase.Indexed[i] = v SandboxedInstance[i] = v Events.ScriptChanged:Fire(i) end)
			end

			InstanceMeta.__tostring = function(self)
				return DefaultInstance.Name
			end
		end

		--//Sandbox
		if className == "RemoteEvent" then
			Events.OnServerEvent = SignalModule.new();

			function Sandboxed:FireClient(Player, ...)
				return SandboxedInstance:FireClient(Player, ...)
			end

		elseif className == "RemoteFunction" then
			Events.OnServerInvoke = SignalModule.new();

			function Sandboxed:InvokeClient(Player, ...)
				return SandboxedInstance:InvokeClient(Player, ...)
			end
		end

		function Sandboxed:GetInstance()
			return SandboxedInstance
		end

		for i, v in Sandboxed do InstanceBase.Indexed[i] = v end function Sandboxed:GetSandboxed() return Sandboxed end
		for i, v in Events do Sandboxed[i] = v.Event end function Sandboxed:GetEvents() return Events end

		return PROXY :: Instance
	end;	
}, {__index = Instance})

local function FakeWeld(WeldData, id) --userdata sandbox only!!!
	local Connections = {}


	local function UpdateWeld(Property)
		if not (WeldData.Part0 and WeldData.Part1) then return end

		local Offset = (WeldData.Part0.CFrame * (WeldData.C0 or CFrame.new()) * (WeldData.C1 or CFrame.new()):Inverse())
		if Property == "CFrame" and WeldData.Part1.CFrame ~= Offset then
			WeldData.Part1.CFrame = Offset
		end
	end 

	Connections.Part0 = WeldData.Part0.ScriptChanged:Connect(UpdateWeld)
	Connections.Part1 = WeldData.Part1.ScriptChanged:Connect(UpdateWeld)
	local WeldTable = setmetatable({},{
		__index = function(_, i, v)
			if i == "C0" or i == "C1" then

				return WeldData[i] or CFrame.new()
			end

			return WeldData[i]
		end;
		__newindex = function(_, i, v)
			WeldData[i] = v

			if i == "C0" or i == "C1" then
				pcall(UpdateWeld, "CFrame")
			end
		end;
	})

	function WeldTable:Disconnect()
		for i, v in Connections do
			v:Disconnect()
		end
	end

	return WeldTable
end


local function CreateAntideathPart(meshes, name)
	local mesh = meshes[name]
	local bodypart = Instance.sbox("MeshPart")

	local cloneProperties = {
		"Reflectance";
		"Material";
		"Transparency";
		"Color";
		"Size";
		"CanCollide";
	}

	for i,v in cloneProperties do
		bodypart[v] = mesh[v]
	end

	bodypart:ApplyMesh(mesh)

	bodypart.Anchored = true
	bodypart.Parent = workspace

	return bodypart
end	

--//Character
local CharacterModel = Assets.char
local Character = {
	["Root Part"] = Instance.sbox("Part");
	["Handle"] = Instance.sbox("Part");

	["Head"] = 		CreateAntideathPart(CharacterModel, "head"); ["Torso"] =	 CreateAntideathPart(CharacterModel, "torso");
	["Left Arm"] = 	CreateAntideathPart(CharacterModel, "larm"); ["Right Arm"] = CreateAntideathPart(CharacterModel, "rarm");
	["Left Leg"] = 	CreateAntideathPart(CharacterModel, "lleg"); ["Right Leg"] = CreateAntideathPart(CharacterModel, "rleg")
}

local root, torso, head = Character["Root Part"], Character["Torso"], Character["Head"]
local larm, rarm = Character["Left Arm"], Character["Right Arm"]
local lleg, rleg = Character["Left Leg"], Character["Right Leg"]

local Joints = {
	["Root Joint"] = 		FakeWeld({Part0 = root, Part1 = torso, C0 = cf(0, 0, 0) * 		radang(-90, -180, 0),	 C1 = cf(0, 0, 0) 			* radang(-90, -180, 0)});
	["Neck"] = 				FakeWeld({Part0 = torso, Part1 = head, C0 = cf(0, 1, 0) * 		radang(-90, -180, 0),	 C1 = cf(0, -0.5, 0) 		* radang(-90, -180, 0)});
	["Left Shoulder"] = 	FakeWeld({Part0 = torso, Part1 = larm, C0 = cf(-1, 0.5, 0) * 	radang(0, -90, 0),		 C1 = cf(0.5, 0.5, 0) 		* radang(0, -90, 0)});
	["Right Shoulder"] = 	FakeWeld({Part0 = torso, Part1 = rarm, C0 = cf(1, 0.5, 0) * 	radang(0, 90, 0),		 C1 = cf(-0.5, 0.5, 0) 		* radang(0, 90, 0)});
	["Left Hip"] = 			FakeWeld({Part0 = torso, Part1 = lleg, C0 = cf(-1, -1, 0) * 	radang(0, -90, 0),		 C1 = cf(-0.5, 1, 0) 		* radang(0, -90, 0)});
	["Right Hip"] = 		FakeWeld({Part0 = torso, Part1 = rleg, C0 = cf(1, -1, 0) * 		radang(0, 90, 0),		 C1 = cf(0.5, 1, 0) 		* radang(0, 90, 0)});

}

local WJ = Instance.new("Motor6D")

local RJ, NK = Joints["Root Joint"], Joints["Neck"]
local LS, RS = Joints["Left Shoulder"], Joints["Right Shoulder"]
local LH, RH = Joints["Left Hip"], Joints["Right Hip"]

local WJC0 = WJ.C0
local RJC0, NKC0 = RJ.C0, NK.C0;
local LSC0, RSC0 = LS.C0, RS.C0;
local LHC0, RHC0 = LH.C0, RH.C0;

local RJC1 = RJ.C1
local LHC1, RHC1 = LH.C1, RH.C1


--//Railgun
local RailgunModel = Assets.railgun
local Railgun = {
	["Base"] = CreateAntideathPart(RailgunModel, "base");
	["Glow"] = CreateAntideathPart(RailgunModel, "glow");
}

local RGHandle = Character.Handle
local RGBase, RGGlow = Railgun.Base, Railgun.Glow

local RGGlowOffset = RailgunModel.c0.Value:Inverse()

local RailgunJoints = {
	["Handle"] = FakeWeld({Part0 = rarm, Part1 = RGHandle});
	["Base"] = FakeWeld({Part0 = RGHandle, Part1 = RGBase});
	["Glow"] = FakeWeld({Part0 = RGBase, Part1 = RGGlow, C0 = RGGlowOffset});
}

local HNDL = RailgunJoints.Handle HNDL.C0 = cf(0, -1.6, -0.7) * radang(-90, 180, 0)
local HNDLC0 = HNDL.C0

local function GetIgnoreList()
	local Ignore = {}
	for i, v in KPF:CombineTable(Character, Railgun) do
		table.insert(Ignore, v:GetInstance())
	end

	return Ignore
end

do --Refit
	cwrap(function()
		while Resume do EarlyTick.wait(1)
			if not AntideathSettings.DoLoopRefit then continue end
			for i,v in Character do
				v:Refit(true)
			end
		end
	end)
end

--//Replication


local InputRemoteName = KPF:GenerateUniqueString():sub(1, 29)
local CameraRemoteName = KPF:GenerateUniqueString():sub(1, 29)

local InputRemote: RemoteEvent = Instance.sbox("RemoteEvent")
InputRemote.Name = InputRemoteName
InputRemote.Parent = F_SERV

local CameraRemote: RemoteEvent = Instance.sbox("RemoteEvent")
CameraRemote.Name = CameraRemoteName
CameraRemote.Parent = F_SERV


local ClientCode = [==[
script.Disabled = true

local PLR_SERV = game:GetService("Players")
local F_SERV = game:GetService("FriendService")
local UIS_SERV = game:GetService("UserInputService")
local R_SERV = game:GetService("RunService")
local STG_SERV = game:GetService("StarterGui")

local Player = PLR_SERV.LocalPlayer

local Mouse = Player:GetMouse()

local BridgeModule = (function()
	local module = {}

	local function CheckForRemote(class, parent, name)
		for _, v in next, parent:GetChildren() do
			if v:IsA(class) and v.Name == name then
				return v
			end
		end
	end

	local function GetRemote(class, parent, name)
		local DefaultRemote = Instance.new(class)
		local Remote = CheckForRemote(class, parent, name)

		local PROXY = newproxy(true)
		local RemoteMeta = getmetatable(PROXY)

		local RemoteBase = {
			SpecialTypes = {"function", "RBXScriptConnection"};
			Indexed = {};

			ApplyIndexes = function(self, exclude)
				for i, v in next, self.Indexed do
					if not table.find((exclude or {}), i) then
						pcall(function() Remote[i] = v end)
					end
				end
			end;
		}

		do
			RemoteMeta.__index = function(self, i)
				local Index = RemoteBase.Indexed[i]
				local IndexType = nil
				pcall(function()
					IndexType = typeof(Remote[i])
				end)

				if IndexType == "function" then
					return function(_, ...)
						Remote[i](Remote, ...)
					end
				elseif IndexType == "RBXScriptSignal" then
					return Remote[i]
				end

				return Index
			end

			RemoteMeta.__newindex = function(self, i, v)
				RemoteBase.Indexed[i] = v
				pcall(function()
					Remote[i] = v
				end)
			end

			RemoteMeta.__tostring = function(self)
				return name
			end
		end

		parent.ChildAdded:Connect(function(NewRemote)
			if NewRemote:IsA(class) and NewRemote.Name == name then
				Remote = NewRemote RemoteBase:ApplyIndexes()
			end
		end) RemoteBase:ApplyIndexes()

		return PROXY
	end

	function module.new(class, parent, name)
		local Remote = GetRemote(class, parent, name)

		return Remote
	end

	return module
end)()

local InputRemoteName = script:WaitForChild("InputRemote").Value
local InputRemote = BridgeModule.new("RemoteEvent", F_SERV, InputRemoteName)

local CameraRemoteName = script:WaitForChild("CameraRemote").Value
local CameraRemote = BridgeModule.new("RemoteEvent", F_SERV, CameraRemoteName)

script:Destroy() --> good practice in the case of sb

local CamFocus = CFrame.new()

for i, v in next, {UIS_SERV.InputBegan, UIS_SERV.InputEnded} do
	v:Connect(function(InputObject, gpe)
		local Key = InputObject.KeyCode == Enum.KeyCode.Unknown and InputObject.UserInputType or InputObject.KeyCode

		InputRemote:FireServer("INPUT", Key, i == 1, gpe)
	end)
end

local OldBehavior = Enum.MouseBehavior.Default
R_SERV.Heartbeat:Connect(function()
	if UIS_SERV.MouseBehavior ~= OldBehavior then
		InputRemote:FireServer("BEHAVIOR_CHANGED", UIS_SERV.MouseBehavior)
		OldBehavior = UIS_SERV.MouseBehavior
	end
end)

InputRemote.OnClientEvent:Connect(function(Request, ...)

	if Request == "UPDATECAMERA" then
		local cf = ... CamFocus = cf

		--//improve later
		if F_SERV:FindFirstChild("ok") then F_SERV:FindFirstChild("ok"):Destroy() end
		local what = Instance.new("Part", F_SERV)

		what.Name = 'ok'
		what.CFrame = CamFocus

		workspace.CurrentCamera.CameraSubject = what
	elseif Request == "NOTIFY" then
		local data = ...
		STG_SERV:SetCore("SendNotification", data)
	end
end)

R_SERV.PreRender:Connect(function()
	local MouseData = {}
	MouseData.Location = UIS_SERV:GetMouseLocation()
	MouseData.ViewportRay = workspace.CurrentCamera:ViewportPointToRay(MouseData.Location.X, MouseData.Location.Y)
	MouseData.Distance = 1000
	MouseData.Origin = MouseData.ViewportRay.Origin
	MouseData.Direction = MouseData.ViewportRay.Direction
	MouseData.Endpoint = MouseData.ViewportRay.Direction * MouseData.Distance

	CameraRemote:FireServer(workspace.CurrentCamera.CFrame, MouseData)
end)
]==]

local ClientValues = {
	InputRemote = {"StringValue", InputRemoteName};
	CameraRemote = {"StringValue", CameraRemoteName};
	Player = {"ObjectValue", Player};
}

local function SetCF(CFR)
	root.CFrame = CFR
	InputRemote:FireClient(Player, "UPDATECAMERA", CFR * cf(0, 1.5, 0))
end

local Movement = {
	Keys = {
		W = false;
		A = false;
		S = false;
		D = false;
		Space = false;
	};
	Vec = {X = 0, Z = 0};

	GravityForce = 0;
	FallTime = 0;
	AutoRotate = true;

	Jumping = false;

	AirFriction = 8;
	GroundFriction = 12;

	GroundSpeed = 25;

	Velocity = Vector3.new();

	Impulse = function(self, Vel)
		self.Velocity += Vel
	end,
}

local Status = {
	State = "idle";
	MovementType = "grounded";
	WeaponEquipped = true;

	WalkSpeed = 16;
	SprintSpeed = 40;

	LockCamera = false;

	Sprinting = false;
}


local DisabledMotors = {}; --For animating

local function DisableMotors(Names)
	for i, v in Names do
		table.insert(DisabledMotors, v)
	end
end

local function EnableMotors(Names)
	for i, v in Names do
		table.remove(DisabledMotors, table.find(DisabledMotors, v))
	end
end

local Weapon = {
	Debounce = false;
	Equip = function(self) if self.Debounce == true then return end self.Debounce = true
		DisableMotors({"RS"})
		cwrap(function()
			for i = 1, 20 do Tick.wait()
				RS.C0 = RS.C0:Lerp(RSC0 * radang(15, 0, -120), 0.2)
			end
			EnableMotors({"RS"})
			HNDL.Part0 = rarm
			HNDL.C0 = cf(0, -1.6, -0.7) * radang(-90, 180, 0)
			self.Debounce = false
		end)
	end,

	Unequip = function(self) if self.Debounce == true then return end self.Debounce = true
		DisableMotors({"RS"})
		cwrap(function()
			for i = 1, 20 do Tick.wait()
				RS.C0 = RS.C0:Lerp(RSC0 * radang(-45, 0, -120), 0.2)
			end
			EnableMotors({"RS"})
			HNDL.Part0 = torso
			HNDL.C0 = cf(0, 0, 0.6) * radang(90, -45, 90)
			self.Debounce = false
		end)
	end,
}

local Killed = {}
local function Kill(instance: Instance)
	pcall(function()
		if instance.Size.Magnitude >= 400 then
			return
		end
		local mainmodel = instance:FindFirstAncestorOfClass("Model")
		if mainmodel then
			instance = mainmodel
		end

		for i, v in mainmodel:GetDescendants() do
			if pcall(function() local _=v.CFrame end) then
				v:Destroy()
			end
		end

		instance:Destroy()
	end)
end

local Attacking = false
local Attacks = {
	Shoot = {Active = false; Debounce = 0.22, Duration = 1; Function = function(self)
		local Duration = self.Duration;
		local HitPos = MOUSECF.Position

		local oldR = root.CFrame
		local p = 0

		local AnimationOverride = {"RS"}
		DisableMotors(AnimationOverride) task.delay(self.Duration, function()
			EnableMotors(AnimationOverride)
		end)

		Movement.AutoRotate = false

		task.delay(Duration * 0.7, function()
			if Status.MovementType == "grounded" then
				SetCF(root.CFrame * CFrame.new(0, 0.5, 0))
			end

			--Hello this was made in 90 seocnds
			local t = 0.1
			local pa = Railgun.Base.CFrame.Position
			local epic = CFrame.lookAt(pa, MOUSECF.Position)
			local awesome = Assets.placeholder:Clone()
			awesome.Anchored = true
			awesome.CFrame = epic
			awesome.Parent = workspace

			game:GetService("TweenService"):Create(awesome, TweenInfo.new(t, Enum.EasingStyle.Linear), {
				CFrame = cf(MOUSECF.Position) * epic.Rotation
			}):Play()
			game:GetService("Debris"):AddItem(awesome, t)

			task.delay(t, function()
				Kill(MOUSETARGET)
			end)

			Movement:Impulse(root.CFrame.LookVector.Unit * -100)
			Movement.AutoRotate = true
		end)


		cwrap(function()
			while self.Active do Tick.sleep()

				if Status.MovementType == "flying" then
					oldR = oldR:Lerp(cf(root.CFrame.Position) * cf(root.CFrame.Position, MOUSECF.Position).Rotation, 0.3)
				elseif Status.MovementType == "grounded" then
					oldR = oldR:Lerp(cf(root.CFrame.Position) * cf(root.CFrame.Position, MOUSECF.Position).Rotation, 0.3)
				end



				if p < 0.8 or p >= 0.9 then
					RS.C0 = RS.C0:Lerp(RSC0 * cf() * radang(0, 0, 90 + 5 * math.cos(p / 22)), 0.15)
					if Movement.AutoRotate == false then
						root.CFrame = cf(root.CFrame.Position) * oldR.Rotation
					end
				else
					RS.C0 = RS.C0:Lerp(RSC0 * cf() * radang(0, 0, 135), 0.3)
				end
				p += 1 * Tick.Rate
			end
		end)
	end}
};

local function Attack(AttackName)
	if not Status.WeaponEquipped then return end
	local AttackData = Attacks[AttackName]

	if AttackData and not AttackData.Active then AttackData.Active = true Attacking = true
		coroutine.wrap(AttackData.Function)(AttackData)

		task.delay(AttackData.Duration, function()
			AttackData.Active = false Attacking = false
		end)
	end
end

Movement.GroundSpeed = Status.Sprinting and Status.SprintSpeed or Status.WalkSpeed
local Actions = {
	F = function(Down)
		if not Down then return end
		Status.MovementType = (not (Status.MovementType == "flying")) and "flying" or "grounded"
	end,

	Z = function(Down)
		if not Down then return end
		Attack("Shoot")
	end,

	Q = function(Down)
		if not Down then return end
		Movement:Impulse(root.CFrame.LookVector.Unit * 75)
	end,

	E = function(Down)
		if not Down then return end
		if Attacking then return end

		if Weapon.Debounce then return end

		Status.WeaponEquipped = not Status.WeaponEquipped
		if Status.WeaponEquipped == true then
			Weapon:Equip()
		elseif Status.WeaponEquipped == false then
			Weapon:Unequip()
		end
	end,

	K = function(Down)
		if not Down then return end

		Resume = false Player:LoadCharacter()
		InputRemote:FireClient(Player, "NOTIFY", {
			Title = "???";
			Text = "Script stopped";
			Duration = 2;
		})
	end,
	
	M = function(Down)
		if not Down then return end
		root.CFrame = INITIALPOS
	end,

	N = function(Down)
		if not Down then return end
		root.CFrame = cf(0, 0, 0)
	end,

	LeftControl = function(Down)
		if not Down then return end
		Status.Sprinting = not Status.Sprinting

		Movement.GroundSpeed = Status.Sprinting and Status.SprintSpeed or Status.WalkSpeed
	end,

	--Stall
	KeypadOne = function(Down)
		if not Down then return end

		AntideathSettings.DoStall = not AntideathSettings.DoStall
		InputRemote:FireClient(Player, "NOTIFY", {
			Title = "???";
			Text = `Stall {AntideathSettings.DoStall}`;
			Duration = 2;
		})
	end,

	--SN
	KeypadFour = function(Down)
		if not Down then return end

		AntideathSettings.DoSN = not AntideathSettings.DoSN
		InputRemote:FireClient(Player, "NOTIFY", {
			Title = "???";
			Text = `SN {AntideathSettings.DoSN}`;
			Duration = 2;
		})
	end,

	-----------------------------------------------------------------------------
	-----------------------------------------------------------------------------

	--HN
	KeypadTwo = function(Down)
		if not Down then return end

		AntideathSettings.DoHN = not AntideathSettings.DoHN
		InputRemote:FireClient(Player, "NOTIFY", {
			Title = "???";
			Text = `HN {AntideathSettings.DoHN}`;
			Duration = 2;
		})	
	end,

	--Loop refit
	KeypadThree = function(Down)
		if not Down then return end

		AntideathSettings.DoLoopRefit = not AntideathSettings.DoLoopRefit
		InputRemote:FireClient(Player, "NOTIFY", {
			Title = "???";
			Text = `loop refit {AntideathSettings.DoLoopRefit}`;
			Duration = 2;
		})
	end,
}

local ReplicationEvents = {
	Input = function(Key, Down, gpe)
		if gpe then return end
		if Actions[Key.Name] then
			Actions[Key.Name](Down)
		end

		if Movement.Keys[Key.Name] ~= nil then Movement.Keys[Key.Name] = Down end
	end,
}

local ReplicationEvents = {
	Input = function(Key, Down, gpe)
		if gpe then return end
		if Actions[Key.Name] then
			Actions[Key.Name](Down)
		end

		if Movement.Keys[Key.Name] ~= nil then Movement.Keys[Key.Name] = Down end
	end,
}



do --Movement

	local function Accelerate(AccelDir: Vector3, PrevVelocity: Vector3, Friction: number, Accelerate: number, Max_Velocity: number, Flat: boolean)
		local ProjVel = PrevVelocity:Dot(AccelDir)
		local AccelVel = Accelerate * Tick.Rate

		if (ProjVel + AccelVel > Max_Velocity) then
			AccelVel = Max_Velocity - ProjVel
		end

		local Vel = (PrevVelocity + (AccelDir * AccelVel) * Friction)
		local FlatVel = Vector3.new(Vel.X, PrevVelocity.Y, Vel.Z)

		if Flat then
			return FlatVel
		end

		return Vel
	end

	local function ApplyFriction(AccelDir: Vector3, PrevVelocity: Vector3, Friction: number, AccelerateV, Flat)
		local Vel = PrevVelocity
		if Flat then
			Vel = Vector3.new(PrevVelocity.X, 0, PrevVelocity.Z)
		end

		local speed = PrevVelocity.Magnitude
		if (speed ~= 0) then
			local drop = speed * Friction * Tick.Rate
			PrevVelocity *= math.max(speed - drop, 0) / speed
		end

		return Accelerate(AccelDir, PrevVelocity, Friction, AccelerateV, 5e3, Flat)
	end

	local function FreeFall(AccelDir: Vector3, PrevVelocity: Vector3)
		return Accelerate(AccelDir, PrevVelocity, 15, 1, 5e3, true)
	end

	local function MoveAir(AccelDir)
		return ApplyFriction(AccelDir, Movement.Velocity, Movement.AirFriction, 150, false)
	end

	local function MoveGround(AccelDir)
		return ApplyFriction(AccelDir, Movement.Velocity, Movement.GroundFriction, Movement.GroundSpeed, true)
	end

	local function Jump()
		SetCF(root.CFrame * cf(0, 0.1, 0))
		Movement.Velocity += Vector3.new(0, 25, 0)
	end

	local CharacterRotation = cf()
	local WishRotation = cf()

	local MoveDirection = cf()
	local InputDirection = Vector3.new()

	local GroundRay = nil

	cwrap(function()
		while Resume do EarlyTick.sleep()
			local RayOffset = math.min(Movement.Velocity.Y / 25, 0)
			do
				GroundRay = KPF:Raycast(root.CFrame.Position - Vector3.new(0, RayOffset, 0), -Vector3.yAxis, 3 + 0.15 - RayOffset, GetIgnoreList())

				Movement.Vec.Z = (Movement.Keys.S and 1 or 0) + (Movement.Keys.W and -1 or 0)
				Movement.Vec.X = (Movement.Keys.D and 1 or 0) + (Movement.Keys.A and -1 or 0)

				MoveDirection = (Status.MovementType == "grounded" and LOOKCF.Rotation or CAMCF.Rotation)
				InputDirection = KPF:NormalizeVector(Vector3.new(Movement.Vec.X, 0, Movement.Vec.Z).Unit)
			end
			local AccelDir = (MoveDirection * CFrame.new(InputDirection)).Position
			local IsGrounded = (GroundRay.Instance ~= nil)

			if Status.MovementType == "flying" then
				Status.State = (AccelDir.Magnitude > 0 and "move" or "idle")
			elseif Status.MovementType == "grounded" then
				if IsGrounded then
					Status.State = (AccelDir.Magnitude > 0 and "move" or "idle")
				else
					Status.State = (Movement.Velocity.Y > 0 and "jump" or "fall")
				end
			end

			if Status.MovementType == "flying" then Movement.GravityForce = 0 IsGrounded = false
				Movement.Velocity = MoveAir(AccelDir)
				Movement.FallTime = 0
			elseif Status.MovementType == "grounded" then
				Movement.Velocity += Vector3.new(0, -Movement.GravityForce, 0) * Tick.Rate


				if IsGrounded == false then
					Movement.Velocity = FreeFall(AccelDir, Movement.Velocity)
					Movement.GravityForce += 3
					Movement.FallTime += 1 * Tick.Rate
				elseif IsGrounded == true then
					Movement.Velocity = MoveGround(AccelDir)
					SetCF(CFrame.new(root.CFrame.X, GroundRay.Position.Y + 3, root.CFrame.Z) * root.CFrame.Rotation)
					Movement.GravityForce = 0 Movement.Velocity *= Vector3.new(1, 0, 1)
					Movement.FallTime = 0

					if Movement.Keys.Space == true then IsGrounded = false Jump() end
				end
			end

			if Movement.AutoRotate then
				if not Status.LockCamera then
					if Status.State == "move" then
						WishRotation = cf(root.CFrame.Position, root.CFrame.Position + AccelDir)
						CharacterRotation = CharacterRotation:Lerp(WishRotation, 0.15)
					else
						if Status.MovementType == "grounded" then
							local Y = KPF:GetCFrameOrientation(CharacterRotation).Y
							WishRotation = CFrame.Angles(0, Y, 0)
							CharacterRotation = CharacterRotation:Lerp(WishRotation, 0.15)
						end
					end	
				else
					local LookDirection = CAMCF.Rotation
					if Status.MovementType == "grounded" then
						LookDirection = LOOKCF.Rotation
					end
					
					WishRotation = LookDirection
					CharacterRotation = CharacterRotation:Lerp(WishRotation, 0.15)
				end
			end

		end
	end)

	cwrap(function()
		while Resume do EarlyTick.sleep()
			local Rotation = CharacterRotation.Rotation
			if Movement.AutoRotate == false then
				Rotation = root.CFrame.Rotation
				WishRotation = Rotation
				CharacterRotation = Rotation
			end

			SetCF((cf(root.CFrame.Position) * cf(Movement.Velocity * Tick.Rate)) * Rotation)
		end
	end)
	root.CFrame = CHARPOS
end

do --Animations
	local Siner = 0

	local function Alpha(MotorName, Speed)
		return table.find(DisabledMotors, MotorName) and 0 or Speed
	end

	local function Scale(n, n2, falloff)
		local e = math.pow((falloff*(1-math.exp(-(n/falloff)*1))), n2)
		return e == e and e or 0
	end



	local function UpdateWaist()
		local waistCFrame = (WJ.C0 * WJ.C1:Inverse())
		local waistAngles = KPF:GetCFrameAngles(waistCFrame)

		local translatedAngles = CFrame.Angles(-waistAngles.X, -waistAngles.Z, -waistAngles.Y)
		local translatedPosition = translatedAngles * cf(waistCFrame.X, -waistCFrame.Z, -waistCFrame.Y)

		local WorldPosition = cf((root.CFrame * RJ.C0).Position)
		local WorldRotation = (root.CFrame.Rotation * RJ.C0.Rotation * CFrame.Angles(math.pi/2, math.pi, 0))

		LH.C1 = LHC1 * KPF:C1ToWorldSpace(LH, (WorldPosition * WorldRotation) * CFrame.Angles(math.pi, 0, 0) * LH.C0)
		RH.C1 = RHC1 * KPF:C1ToWorldSpace(RH, (WorldPosition * WorldRotation) * CFrame.Angles(math.pi, 0, 0) * RH.C0)

		RJ.C1 = RJC1 * translatedPosition
	end UpdateWaist()

	cwrap(function()
		while Resume do Tick.sleep()
			task.defer(UpdateWaist)

			local ProjectedVelocity = root.CFrame:VectorToObjectSpace(Movement.Velocity).Unit
			local UnitVec = Vector3.new(ProjectedVelocity.X, 0, ProjectedVelocity.Z).Unit
			local FlyVec = ProjectedVelocity.Unit
			local Vec = {X = UnitVec.X; Z = UnitVec.Z;} 

			Siner += 1 * Tick.Rate
			if Status.MovementType == "flying" then
				if Status.State == "move" then
					print(Vec.Z)
					RJ.C0 = RJ.C0:Lerp(RJC0 * cf(0, 0, 0.5 * math.cos(Siner)) * radang((60 + 5 + 5 * math.sin(Siner)) * -Vec.Z, 0,2.5 * math.cos(Siner * 2)), Alpha("RJ", 0.1))
					NK.C0 = NK.C0:Lerp(NKC0 * cf(0, 0, 0) * radang(-35 - 5 + 5 * math.cos(Siner), 0, 0), Alpha("NK", 0.1))
					LS.C0 = LS.C0:Lerp(LSC0 * cf(0.3, 0, 0) * radang(-22, 10, (40 + 12 * math.cos(Siner))), Alpha("LS", 0.1))
					RS.C0 = RS.C0:Lerp(RSC0 * cf(-0.3, 0, 0) * radang(-22, -10, (-40 + 12 * -math.cos(Siner))), Alpha("RS", 0.1))
					LH.C0 = LH.C0:Lerp(LHC0 * cf(-0.5, 0.55, 0) * radang(0, 1, 8 + 8 * (math.cos(Siner))), Alpha("LH", 0.1))
					RH.C0 = RH.C0:Lerp(RHC0 * cf(0, 0, 0) * radang(0, 1, -8 + 8 * (-math.cos(Siner))), Alpha("RH", 0.1))
				elseif Status.State == "idle" then
					RJ.C0 = RJ.C0:Lerp(RJC0 * cf(0, 0, 0.35 * math.cos(Siner)) * radang(4 * math.sin(Siner), 0, 0), Alpha("RJ", 0.1))
					NK.C0 = NK.C0:Lerp(NKC0 * cf(0, 0, 0) * radang(4 * math.cos(Siner), 0, 0), Alpha("NK", 0.1))
					LS.C0 = LS.C0:Lerp(LSC0 * cf(0, -0.1 + 0.1 * -math.sin(Siner), 0) * radang(0, 22 + 5 * math.cos(Siner), 3.14 * math.sin(Siner)), Alpha("LS", 0.1))
					RS.C0 = RS.C0:Lerp(RSC0 * cf(0, -0.1 + 0.1 * -math.sin(Siner), 0) * radang(0, -22 + 5 * -math.cos(Siner), 3.14 * -math.sin(Siner)), Alpha("RS", 0.1))
					LH.C0 = LH.C0:Lerp(LHC0 * cf(-0.5, 0.7 + 0.1 * -math.sin(Siner), 0) * radang(0, 1, 5 * -math.cos(Siner)), Alpha("LH", 0.1))
					RH.C0 = RH.C0:Lerp(RHC0 * cf(0, 0, 0) * radang(0, 1, -11 + 5 * math.cos(Siner)), Alpha("RH", 0.1))
				end
			elseif Status.MovementType == "grounded" then
				if Status.State == "move" then

					--//hastily stolen from one of my older scripts

					local ws = Movement.Velocity.Magnitude

					local mult = (ws / 16)
					local inc = (1/mult)

					local multws = (Movement.GroundSpeed / 16)
					local incws = (1/multws)

					local angleScalar = Scale(mult, 0.8, 1.35)
					local rootScalar = Scale(mult, 0.8, 2)
					local rootScalar2 = Scale(mult, 0.4, 2.5)
					local headScalar = Scale(mult, 0.6, 2)
					local speedScalar = Scale(incws, 0.2, 2)
					local lerpScalar = Scale(mult / 2, 0.5, 2) / 2
					local runScalar = 0

					local a = (1/6) * speedScalar

					RJ.C0 = RJ.C0:Lerp(RJC0 * cf(0, 0, 0.1 + (0.1 * rootScalar2) * math.cos(Siner / a * 2) + -0.1 * rootScalar) * radang((-(16 * rootScalar) * Vec.Z) + ((3 * rootScalar2) * math.sin((Siner / a) * 2) * Vec.Z), (-11 * rootScalar * -Vec.X), (3 * rootScalar2) * math.cos(Siner / a)), Alpha("RJ", lerpScalar))
					NK.C0 = NK.C0:Lerp(NKC0 * cf(0, 0, 0) * radang(-(6 * headScalar) * -Vec.Z, 0, 22 * -Vec.X), Alpha("NK", lerpScalar))
					LS.C0 = LS.C0:Lerp(LSC0 * cf(((0.3 * math.sin(Siner / a) * -Vec.Z) * rootScalar) + ((0.2 * -math.cos(Siner / a) * -Vec.Z) * runScalar), -0.1 * math.abs(Vec.Z) + ((0.5 * math.sin(Siner / a) * math.max(-Vec.Z, 0)) * runScalar) , 0) * radang(-6 * math.abs(Vec.Z), (-33 + 33 * math.sin((Siner - 2) / a)) * runScalar * math.max(-Vec.Z, 0), (((66 * angleScalar) * math.sin(Siner / a)) + ((-90 + 90 * angleScalar) * math.sin(Siner / a)) * runScalar) * -Vec.Z), Alpha("LS", lerpScalar))
					RS.C0 = RS.C0:Lerp(RSC0 * cf(((0.3 * math.sin(Siner / a) * -Vec.Z) * rootScalar) + ((0.2 * math.cos(Siner / a) * -Vec.Z) * runScalar), -0.1 * math.abs(Vec.Z) + ((0.5 * -math.sin(Siner / a) * math.max(-Vec.Z, 0)) * runScalar), 0) * radang(-6 * math.abs(Vec.Z), (33 + 33 * math.sin((Siner - 2) / a)) * runScalar * math.max(-Vec.Z, 0), (((66 * angleScalar) * math.sin(Siner / a)) + ((-90 + 90 * angleScalar) * math.sin(Siner / a)) * runScalar) * -Vec.Z), Alpha("RS", lerpScalar))
					LH.C0 = LH.C0:Lerp(LHC0 * cf((0-0.1 + 0.7 * math.cos(Siner / a) * Vec.Z) * angleScalar,((0.35 * -math.cos(Siner / a) * -math.abs(Vec.Z))) - ((0.5 * -math.cos(Siner / a) - 0.25) * math.abs(Vec.X)),0) * radang(35 * math.sin(Siner / a) * (Vec.X), 0, (60 * angleScalar) * math.sin((Siner / a) - 0.2) * Vec.Z), Alpha("LH", lerpScalar))
					RH.C0 = RH.C0:Lerp(RHC0 * cf((0+0.1 + 0.7 * math.cos(Siner / a) * Vec.Z) * angleScalar,((0.35 * math.cos(Siner / a) * -math.abs(Vec.Z))) - ((0.5 * math.cos(Siner / a) - 0.25) * math.abs(Vec.X)),0) * radang(35 * math.sin(Siner / a) * (Vec.X), 0, (60 * angleScalar) * math.sin((Siner / a) - 0.2) * Vec.Z), Alpha("RH", lerpScalar))
				elseif Status.State == "jump" or Status.State == "fall" then
					local Flat = Movement.Velocity * Vector3.new(1, 0, 1)
					local FVec = root.CFrame:VectorToObjectSpace(Flat).Unit
					if FVec ~= FVec then
						FVec = Vector3.zero
					end

					local Speed = Flat.Magnitude
					local SpeedX = (FVec.X * Speed)
					local SpeedZ = (FVec.Z * Speed)

					local FallSpeed = Movement.Velocity.Y
					local FallForce = Movement.GravityForce / 3.5

					local zrot = (-SpeedZ / 1.25) * math.min(FallForce / 50, 1)
					local xrot = (SpeedX / 1.25) * math.min(FallForce / 50, 1)

					local ArmAngle = math.clamp(FallForce * 2, -90, 90)
					local ArmOffset = ArmAngle / 180

					local ArmZRot = math.clamp(zrot / 2, -60, 60) * 2

					RJ.C0 = RJ.C0:Lerp(RJC0 * cf(0, 0, 0) * radang(math.clamp(zrot, -75, 75) + -math.clamp((FallSpeed / 25) * (1 - FVec.X), -5, 25), math.clamp(xrot, -75, 75) / 2, 0), Alpha("RJ", 0.1))
					NK.C0 = NK.C0:Lerp(NKC0 * cf(0, 0, 0) * radang(math.clamp(-zrot / 2, -45, 45), 0, SpeedX / 12), Alpha("NK", 0.1))
					LS.C0 = LS.C0:Lerp(LSC0 * cf(0, ArmOffset - 0.5, ArmOffset + 0.5) * radang(-90, ArmZRot, -12 * -FVec.X) * radang(-ArmAngle, 0, 0) * cf(0, math.max(-ArmZRot / 110 * -FVec.Z, -0.5), 0), Alpha("LS", 0.1))
					RS.C0 = RS.C0:Lerp(RSC0 * cf(0, ArmOffset - 0.5, ArmOffset + 0.5) * radang(-90, -ArmZRot, 12 * -FVec.X) * radang(-ArmAngle, 0, 0) * cf(0, math.max(-ArmZRot / 110 * -FVec.Z, -0.5), 0), Alpha("RS", 0.1))
					LH.C0 = LH.C0:Lerp(LHC0 * cf(0, 0, 0) * radang(0, 0, math.clamp(zrot, -75, 75) / 3), Alpha("LH", 0.1))
					RH.C0 = RH.C0:Lerp(RHC0 * cf(0.5, 1 , 0) * radang(0, 0, -math.clamp(zrot, -75, 75) / 3), Alpha("RH", 0.1))
				elseif Status.State == "idle" then
					local Bounce = 3
					WJ.C0 = WJ.C0:Lerp(WJC0 * cf(0, 0.05 * math.sin(Siner * Bounce), 0) * radang(3 * math.cos(Siner * Bounce), 0, 0), Alpha("WJ", 0.1))
					RJ.C0 = RJ.C0:Lerp(RJC0 * cf(0, 0, 0) * radang(0, 0, 0), Alpha("RJ", 0.1))
					NK.C0 = NK.C0:Lerp(NKC0 * cf(0, 0, 0) * radang(-3 * -math.sin(Siner * Bounce), 0, 0), Alpha("NK", 0.1))
					LS.C0 = LS.C0:Lerp(LSC0 * cf(0, -0.05 + 0.05 * math.sin(Siner * Bounce), 0) * radang(-12 + 6 * math.sin(Siner * Bounce), 10 + 8 * -math.sin(Siner * Bounce), 5 * math.cos(Siner * Bounce)), Alpha("LS", 0.1))
					RS.C0 = RS.C0:Lerp(RSC0 * cf(0, -0.05 + 0.05 * math.sin(Siner * Bounce), 0) * radang(-12 + 6 * math.sin(Siner * Bounce), -10 + 8 * math.sin(Siner * Bounce), 5 * -math.cos(Siner * Bounce)), Alpha("RS", 0.1))
					LH.C0 = LH.C0:Lerp(LHC0 * cf(0.1 + 0.05 * math.cos(Siner * Bounce), 0, 0) * radang(0, 11, 2 * -math.cos(Siner * Bounce)), Alpha("LH", 0.1))
					RH.C0 = RH.C0:Lerp(RHC0 * cf(-0.1 + 0.05 * -math.cos(Siner * Bounce), 0, 0) * radang(0, -11, 2 * math.cos(Siner * Bounce)), Alpha("RH", 0.1))
				end
			end
		end
	end)
end

do
	local MouseParams = RaycastParams.new()
	local RecieveCamera; RecieveCamera = CameraRemote.OnServerEvent:Connect(function(PlayerFired, CF: CFrame, MouseData: {})
		if not Resume then RecieveCamera:Disconnect() return end
		if PlayerFired ~= Player then MethodRoot.Suppression(function() Player:Destroy() end) return end

		MouseParams.FilterDescendantsInstances = GetIgnoreList()
		local CX, CY, CZ = CF:ToOrientation()
		local MouseRay = workspace:Raycast(MouseData.Origin, MouseData.Direction.Unit * MouseData.Distance, MouseParams)

		CAMCF = CF LOOKCF = CFrame.Angles(0, CY, 0)

		MOUSECF = MouseRay and CFrame.new(MouseRay.Position) or CFrame.new(MouseData.Endpoint)
		MOUSETARGET = MouseRay and MouseRay.Instance or nil
	end)

	local RecieveInput; RecieveInput = InputRemote.OnServerEvent:Connect(function(PlayerFired, Request, ...)
		if not Resume then RecieveInput:Disconnect() return end
		if PlayerFired ~= Player then MethodRoot.Suppression(function() Player:Destroy() end) return end


		if Request == "INPUT" then
			ReplicationEvents.Input(...)
		end

		if Request == "BEHAVIOR_CHANGED" then
			local Behavior = ...

			Status.LockCamera = (Behavior == Enum.MouseBehavior.LockCenter)
		end
	end)
end





local CharacterRemove

local function NilCharacter()
	if CharacterRemove then
		CharacterRemove:Disconnect()
	end

	CharacterRemove = Player.CharacterAdded:Connect(function(NewCharacter)
		if not Resume then CharacterRemove:Disconnect() return end
		task.defer(function()
			Player.Character = nil
			NewCharacter:Destroy()
		end)
	end)

	Player.Character = nil
end

local function GiveClient()
	local Client = NLS(ClientCode, Player:FindFirstChildOfClass("PlayerGui")  or Player:FindFirstChildOfClass("Backpack") or InstanceNew("Backpack", Player))

	for i, v in ClientValues do
		local Value = InstanceNew(v[1])
		Value.Value = v[2]
		Value.Name = i

		Value.Parent = Client
	end
end

local RegiveControls; RegiveControls = PLR_SERV.PlayerAdded:Connect(function(NewPlayer)
	if not Resume then RegiveControls:Disconnect() return end
	if NewPlayer.UserId == UID then
		Player = NewPlayer

		GiveClient()
		NilCharacter()
	end
end)

GiveClient()
NilCharacter()
