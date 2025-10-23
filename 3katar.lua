--> {} []
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local ScriptContext = game:GetService("ScriptContext")
local InsertService = game:GetService("InsertService")

if false then
	owner = Players.PlayerAdded:Wait()
end

if not owner or not NLS then
	local OwnerName = script:WaitForChild("OwnerName")
	if OwnerName then
		owner = Players:FindFirstChild(OwnerName.Value) or Players:FindFirstChild("Player1")
	end
	NLS = require(13482937602)()
end

local Resuming = true

local Player = owner
local UID = Player.UserId

local AssetModule = require(18712292843)
local PenvModule = require(129733389562712)

script.Parent = nil
script.Disabled = true
pcall(function()
	script:Destroy()
end)

local VoidFunction = function() end

local newproxy = newproxy
local getmetatable = getmetatable
local pcall = pcall
local next = next

local table_insert = table.insert
local table_clear = table.clear

local instance_new = Instance.new
local instance_fromexisting = Instance.fromExisting

local Destroy = game.Destroy

local DummySignal = game.Destroying:Connect(VoidFunction)
local DummyMesh = Instance.new("MeshPart")

local Once = game.Destroying.Once
local Connect = game.Destroying.Connect
local ConnectParallel = game.Destroying.ConnectParallel

local GetChildren = game.GetChildren
local GetFullName = game.GetFullName
local GetPropertyChangedSignal = game.GetPropertyChangedSignal
local GetAttributes = game.GetAttributes
local GetTags = game.GetTags
local Disconnect = DummySignal.Disconnect
local ApplyMesh = DummyMesh.ApplyMesh
local GetJoints = DummyMesh.GetJoints

local task_desynchronize = task.desynchronize
local task_synchronize = task.synchronize

local MethodRoot = {} do
	local LogService = game:GetService("LogService")
	local TweenService = game:GetService("TweenService")

	local DummyTween = TweenService:Create(game, TweenInfo.new(0), {})
	
	local MessageOut = LogService.MessageOut

	local Create = TweenService.Create
	local Play = DummyTween.Play
	
	local coroutine_resume = coroutine.resume
	local coroutine_create = coroutine.create
	local coroutine_yield = coroutine.yield
	local coroutine_close = coroutine.close
	local coroutine_wrap = coroutine.wrap
	local coroutine_status = coroutine.status
	local coroutine_running = coroutine.running

	local task_spawn = task.spawn
	local task_defer = task.defer
	local task_cancel = task.cancel
	
	local table_pack = table.pack
	local table_unpack = table.unpack
	local table_insert = table.insert
	local table_remove = table.remove
	
	MethodRoot.IsDeferred = false
	MethodRoot.IsEvaluated = false
	
	MethodRoot.MaxDeferDepth = 80
	
	MethodRoot.ResynchronizeEvent = instance_new("BindableEvent")
	MethodRoot.NSParent = instance_new("Actor")
	
	MethodRoot.Penv = PenvModule(require, MethodRoot.NSParent)
	
	local Penv = MethodRoot.Penv
	MethodRoot.Supernull = function(n, f, ...)
		local Args = table_pack(...)
		local Stall = function()
			for i = 1, n do
				task_desynchronize()
				task_synchronize()
			end
			f(table_unpack(Args))
		end
		Penv(Stall)
	end
	
	local Hypernull = nil
	MethodRoot.Hypernull = function(f, ...)
		if coroutine_status(task_spawn(Hypernull, f, ...)) ~= "dead"  then
			f(...)
		end
	end Hypernull = MethodRoot.Hypernull
	
	do 
		local Detector = instance_new("Folder")
		Detector.Destroying:Connect(function()
			MethodRoot.IsDeferred = true
		end)
		Hypernull(Destroy, Detector)
		MethodRoot.IsEvaluated = true
	end
	
	MethodRoot.Execute = function(Skip, f, ...)
		if Skip and not MethodRoot.IsDeferred then
			Hypernull(f, ...)
		else
			f(...)
		end
	end
	
	MethodRoot.Silence = function(f)
		print(Once(MessageOut, f))
	end

	MethodRoot.TimeShift = function(f)
		local Container = Instance.new("Folder")
		local WaitFor = Instance.new("Folder")

		coroutine.wrap(function()
			Container:WaitForChild(WaitFor.Name)
			f()
		end)()
		WaitFor.Parent = Container
	end

	MethodRoot.V1 = function(Signal, f)
		local d = false
		local c = nil
		local r; r = function(...)
			if c then
				if d then
					return Disconnect(c)
				end
				f(...)
			end
			c = Once(Signal, r)
		end
		r()
		return function()
			d = true
		end
	end
		
	MethodRoot.V2 = function(f)
		Once(DummyTween.Completed, f)
		Play(DummyTween)
	end


	local V3Folder = instance_new("Folder") V3Folder.Name = workspace.Name
	MethodRoot.V3 = function(Target, Parent)
		V3Folder.ChildAdded:Once(function()
			Target:Destroy()
		end)
		Target.Parent = V3Folder
		Target.Parent = Parent
	end	
	MethodRoot.V3N = function(Target, Parent)
		local Container = instance_new("Folder")
		Container.ChildAdded:Once(function()
			Target:Destroy()
		end)

		Container.Name = Parent.Name
		Container.Parent = Parent

		Target.Parent = Container
		Target.Parent = Parent

		Container:Destroy()
	end	
	
	MethodRoot.V3R = function(Target, Parent, Callback)
		Target.AncestryChanged:Once(function()
			Target:Destroy()
		end)	
		Target.Parent = Parent
	end	

	MethodRoot.V4 = function(Target, Parent, Callback, Class)
		local Folder = Instance.new(Class or "Folder")
		Callback = Callback or function() end
		Folder.Destroying:Connect(function()
			Target.Parent = Parent or Instance.new(Class or "Folder")
			Callback()
		end)
		Target.Parent = Folder
		Folder:Destroy()
	end

	MethodRoot.V4R = function(Target, Parent, Callback, Class)
		local Folder = Instance.new(Class or "Folder")
		Callback = Callback or function() end

		local Original = {}
		for i, v in next, Target:GetDescendants() do
			Original[v] = v.Parent
		end

		Folder.Destroying:Connect(function()
			Target.Parent = Parent or Instance.new(Class or "Folder")
			for i, v in next, Original do
				i.Parent = v
			end
			Callback()
		end)
		Target.Parent = Folder
		for i, v in next, Original do
			i.Parent = nil
		end
		Folder:Destroy()
	end

	MethodRoot.V8 = function()

	end

	MethodRoot.V9 = function(Remote, Parent)

	end
	
	local ResynchronizeEvent = MethodRoot.ResynchronizeEvent
	local Fire = ResynchronizeEvent.Fire
	
	Connect(ResynchronizeEvent.Event, function(f, ...)
		f(...)
	end)
	MethodRoot.Resynchronize = function(f, ...)
		return Fire(ResynchronizeEvent, f, ...)
	end
	
	MethodRoot.ParallelSync = function(Signal, f, ...)
		return ConnectParallel(Signal, function(...)
			f(...)
		end)
	end
	
	do --ppe bs
		local function CreatePointer(Target)
			local Pointer = Instance.new("ObjectValue")
			Pointer.Value = Target
			Pointer.Name = ""
			
			return Pointer
		end
		
		local function CreateRig()
			local Model = Instance.new("Model")
			local Humanoid = Instance.new("Humanoid")
			local Root = Instance.new("Part")

			Root.Name = "HumanoidRootPart"
			Root.Parent = Model
			Humanoid.Parent = Model

			return Model, Humanoid, Root
		end
		
		
		local js = game:GetService("JointsService")
		
		local crig = CreateRig()
		MethodRoot.BaseRig = function()
			local NewRig = crig:Clone()
			return NewRig, NewRig.Humanoid, NewRig.HumanoidRootPart
		end
		
		MethodRoot.FTParent = function(TargetTool)
			local MainRig, MainHum, MainRoot = MethodRoot.BaseRig()
			MainRig.Parent = workspace
			MainHum:EquipTool(TargetTool)
			TargetTool.Parent = js
			
			local Target = TargetTool:GetChildren()[1]
			Target.Parent = nil
			
			TargetTool:Destroy()
			MainRig:Destroy()
			
			return Target
		end
		
		local JointsService = game:GetService("JointsService")
		MethodRoot.FClone = function(Target, Return)
			local Parent = Target.Parent
			local Humanoid = instance_new("Humanoid");
			local HumanoidDescription = instance_new("HumanoidDescription");
			
			Humanoid.Parent = game
			Target.Parent = HumanoidDescription
			
			Humanoid:ApplyDescription(HumanoidDescription)
			Target.Parent = nil
			Humanoid.Parent = nil
			
			local Applied = Humanoid:GetAppliedDescription()
			Applied.Parent = nil
			
			local Cloned = Applied:GetChildren()[1]
			Cloned.Parent = nil
			
			Applied:Destroy()
			Humanoid:Destroy()
			
			if Return then
				Target.Parent = Parent
			end
			
			Cloned.Parent = JointsService
			return Cloned
		end
		
		MethodRoot.UDFCLone = function(Target, TargetParent)
			local Parent = Target.Parent
			local Name = Target.Name

			local Identifier = tostring(os.clock())

			local Description = Instance.new("HumanoidDescription")
			Target.Parent = Description
			Target.Name = Identifier

			local Model = Players:CreateHumanoidModelFromDescription(Description, Enum.HumanoidRigType.R6)
			local Cloned = Model:FindFirstChild(Identifier, true)
			Cloned.Name = Name
			Cloned.Parent = TargetParent

			Target.Name = Name
			Target.Parent = Parent

			pcall(game.Destroy, Model)

			return Cloned
		end
		
		MethodRoot.LockedRig = function()
			local Rig = game:GetService("ServerScriptService").lr
			return MethodRoot.FClone(Rig)
		end
		
		MethodRoot.FLock = function(Target, Callback)
			local LockedCFrame = CFrame.new(0, 1e4, 0)
			local BaseRig = MethodRoot.LockedRig()
			
			local Container = BaseRig._v
			
			BaseRig:PivotTo(LockedCFrame)
			
			local Accessory = Instance.new("Accessory")
			local Handle = Instance.new("Part")
			
			Handle:PivotTo(LockedCFrame)
			Handle.Name = "Handle"
			Handle.Parent = Accessory

			local TargetPointer = CreatePointer(Target)

			Target.Parent = Accessory

			BaseRig.Parent = workspace.Terrain
			Accessory.Parent = workspace.Terrain
			
			if Callback then
				Accessory.AncestryChanged:Once(Callback)
			end
			
			return BaseRig, TargetPointer
		end
		
		
		MethodRoot.CSLock = function(Type, Container, Parenter)
			Container.Parent = nil
			if Type == "t" then
				return MethodRoot.FTParent(Parenter)
			elseif Type == "a" then
				
			end
		end
		
		MethodRoot.SSLock = function(Container, Target)
			Container:Remove()
		end
	end
end











--[[

do
	local function CreatePointer(Target)
		local Pointer = Instance.new("ObjectValue")
		Pointer.Value = Target
		Pointer.Name = ""
		Pointer:Destroy()

		return Pointer
	end
	
	local NewTool = Instance.new("Tool", workspace)
	local NewInstance = Instance.new("PointLight", NewTool)
	
	NewTool.Parent = workspace

	local LockedContainer, LockedToolContainer = MethodRoot.FLock(NewTool)
	LockedToolContainer.Name = "ToolPointer"
	
	task.wait()
	
	local ToClone = Instance.new("Folder")
	LockedContainer.Parent = ToClone
	LockedToolContainer.Parent = ToClone
	
	local Cloned = MethodRoot.FClone(ToClone, false)
	local Target = MethodRoot.CSLock("t", Cloned, Cloned.ToolPointer.Value)
	Target.Parent = workspace
end



]]

local Settings = {
	Defense = {
		CrossBoundary = {
			AntiTamper = true;
			Antimatter = true;
		};
		Main = {
			Exemption = false;
		};
	};
	Offense = {};
};

local Assets = MethodRoot.UDFCLone(AssetModule)
local Effects = Assets:WaitForChild("effects")

local LockedMesh = MethodRoot.UDFCLone(Assets.MeshPart)
local MeshTool = LockedMesh.t

local ToClone = nil
task.delay(0, function()
	task.wait()

	ToClone = Instance.new("Folder")
	LockedMesh.Parent = ToClone
	MeshTool.Parent = ToClone
end)

local Hypernull = MethodRoot.Hypernull
local Execute = MethodRoot.Execute
local ParallelSync = MethodRoot.ParallelSync
local Resynchronize = MethodRoot.Resynchronize
local Penv = MethodRoot.Penv

local AntideathSettings = {
	HN = false;
	SN = false;
	V3 = false;
}

local SNEvent = Instance.new("BindableEvent")
local SNLoop = SNEvent.Event

local SNDepth = 1000
if RunService:IsStudio() then
	SNDepth = 100
end

local SNResumption = RunService.Heartbeat:Connect(function()
	MethodRoot.Supernull(SNDepth, function()
		SNEvent:Fire()
	end)
end)

MethodRoot.Penv(function()
	task.wait()
end)

task.wait()

local function retard(text)
	local Message = Instance.new("Hint")
	Message.Text = text
	Message.Parent = workspace

	task.delay(2, function()
		Message:Destroy()
	end)

	Resuming = false
end

if MethodRoot.IsDeferred and MethodRoot.IsEvaluated then
	return retard("deferred")
end

if workspace.StreamingEnabled then
	return retard("streaming")
end

local function CreateRig()
	local Model = Instance.new("Model")
	local Humanoid = Instance.new("Humanoid")
	local Root = Instance.new("Part")

	Root.Name = "HumanoidRootPart"
	Root.Parent = Model
	Humanoid.Parent = Model

	Root.Anchored = true

	return Model, Humanoid, Root
end

local function RawReparent(Parent, Container, Pointer, exec)
	exec = exec or function(f, ...) f(...) end

	local Tool = Pointer.Value

	local Rig, RigHumanoid, RigRoot = CreateRig()
	Container.Parent = Rig

	Rig.Parent = Parent
	RigHumanoid:EquipTool(Pointer.Value)

	local Target = Tool:GetChildren()[1]
	exec(function()
		Target.Parent = Parent
	end)
	Rig:Destroy()

	return Target
end

Player.Character = nil

local OnRefit = {};
local Antideath = {
	new = function(ClassName)
		local Proxy = newproxy(true)
		local metatable = getmetatable(Proxy)

		local Sandbox = {};	
		local Internal = {
			Index = {
				Properties = {
					Read = {};
					Set = {};
				};
				Children = {};
			};
		};

		local NoDestroy = false

		local IsMeshPart = ClassName == "MeshPart"

		local Index = Internal.Index

		local PropertyIndex = Index.Properties
		local ReadIndex = PropertyIndex.Read
		local SetIndex = PropertyIndex.Set

		local ChildrenIndex = Index.Children

		local Evil = Settings.Defense.CrossBoundary.AntiTamper
		local test = Settings.Defense.Main.Exemption
		if not IsMeshPart then
			Evil = false
		end
	
		local ProxiedInstance = nil
		if Evil then
			local CloneMethod = test and MethodRoot.UDFCLone or MethodRoot.FClone
			local Cloned = CloneMethod(ToClone)
			local NewLocked = MethodRoot.CSLock("t", Cloned, Cloned.t.Value)
			ProxiedInstance = NewLocked
			Cloned:Destroy()
			
			for i, v in next, ReadIndex do
				if i ~= "Parent" then
					pcall(function()
						ProxiedInstance[i] = v
					end)
				end
			end
		else
			ProxiedInstance = instance_new(ClassName)
		end
		
		local DefaultInstance = instance_new(ClassName)
		local NilInstance = instance_new(ClassName)

		if IsMeshPart then
			ApplyMesh(ProxiedInstance, NilInstance)
		end

		local DelayedSignals = false

		local ReparentedCheck = nil
		local DestroyingCheck = nil

		local ChangedSignal = nil
		local ChildAddedSignal = nil
		local DestroyedSignal = nil
		--local AncestryChangedSignal = nil


		local Events = {}
		local Antideath = {} do
			local Refit = nil
			local PollDeath = nil
			local RestoreProperties = nil

			local SignalsActive = false

			local Reparent = function()
				ProxiedInstance.Parent = ReadIndex.Parent
			end

			local ParallelRefit = function()
				Resynchronize(Refit)
			end

			local ParallelAddedRefit = function(Added)
				if Added.ClassName ~= "WrapDeformer" then
					Resynchronize(Refit)
				end
			end

			local function Reapply(ParallelChangeRefit, Callback)
				Resynchronize(function()
					pcall(function()
						Disconnect(ChangedSignal)
						Disconnect(ChildAddedSignal)
						if not NoDestroy then
							Disconnect(DestroyedSignal)
						end
						--Disconnect(AncestryChangedSignal)
					end)
					MethodRoot.V3N(ProxiedInstance, ReadIndex.Parent)
					if Callback then
						Callback()
					end
					Penv(function()
						ChangedSignal = ConnectParallel(ProxiedInstance.Changed, ParallelChangeRefit)
						ChildAddedSignal = ConnectParallel(ProxiedInstance.ChildAdded, ParallelAddedRefit)
						if not NoDestroy then
							DestroyedSignal = ConnectParallel(ProxiedInstance.Destroying, ParallelRefit)
						end
						--AncestryChangedSignal = ConnectParallel(ProxiedInstance.AncestryChanged, ParallelRefit)
					end)
				end)
			end

			local OldScale = workspace:GetScale()
			local ParallelChangeRefit; ParallelChangeRefit = function(Property)
				local Index = ReadIndex[Property]
				if Index and ProxiedInstance[Property] ~= Index then
					if Property == "Parent" then
						Resynchronize(Refit)
					else
						Reapply(ParallelChangeRefit, function()
							Hypernull(function()
								ProxiedInstance[Property] = Index
							end)
						end)
					end
				else
					if IsMeshPart and Property == "MeshId" and ProxiedInstance.MeshId ~= NilInstance.MeshId then
						Reapply(ParallelChangeRefit, function()
							Hypernull(function()
								ProxiedInstance:ApplyMesh(NilInstance)
							end)
						end)
					end
				end
			end

			Antideath.RestoreProperties = function()
				if IsMeshPart and ProxiedInstance.MeshId ~= NilInstance.MeshId then
					ApplyMesh(ProxiedInstance, NilInstance)
				end
				for i, v in next, ReadIndex do
					if i ~= "Parent" and ProxiedInstance[i] ~= v then
						pcall(function()
							ProxiedInstance[i] = v
						end)
					end
				end
			end
			RestoreProperties = Antideath.RestoreProperties

			Antideath.Refit = function(Depth)
				if not Resuming then
					pcall(function()
						Disconnect(ChangedSignal)
						Disconnect(ChildAddedSignal)
						if not NoDestroy then
							Disconnect(DestroyedSignal)
						end
						--Disconnect(AncestryChangedSignal)
					end)
					return
				end
				
				local OldInstance = ProxiedInstance
				if Evil then
					local CloneMethod = test and MethodRoot.UDFCLone or MethodRoot.FClone
					local Cloned = CloneMethod(ToClone)
					Cloned.Parent = workspace
					if not test then
						local NewLocked = MethodRoot.CSLock("t", Cloned, Cloned.t.Value)
						ProxiedInstance = NewLocked
					else
						ProxiedInstance = RawReparent(workspace, Cloned, Cloned.t, Hypernull)
					end
					Cloned:Destroy()

					RestoreProperties()
				else
					ProxiedInstance = instance_fromexisting(NilInstance)
				end
				
				if ChangedSignal then
					Disconnect(ChangedSignal)
					Disconnect(ChildAddedSignal)
					Disconnect(DestroyedSignal)
					--Disconnect(AncestryChangedSignal)
				end
				
				if not test then
					Hypernull(function()
						Reparent()
					end)
					ProxiedInstance.Parent = nil
					MethodRoot.V3R(ProxiedInstance, ReadIndex.Parent)
				end
				ReparentedCheck = Once(ProxiedInstance.AncestryChanged, VoidFunction)
				if not NoDestroy then
					DestroyingCheck = Once(ProxiedInstance.Destroying, VoidFunction)
				end
				
				if PollDeath() then
					Refit()
				else
					Penv(function()
						ChangedSignal = ConnectParallel(ProxiedInstance.Changed, ParallelChangeRefit)
						ChildAddedSignal = ConnectParallel(ProxiedInstance.ChildAdded, ParallelAddedRefit)
						if not NoDestroy then
							DestroyedSignal = ConnectParallel(ProxiedInstance.Destroying, ParallelRefit)
						end
						--AncestryChangedSignal = ConnectParallel(ProxiedInstance.AncestryChanged, ParallelRefit)
					end)
					if ClassName == "RemoteEvent" then
						ProxiedInstance.OnServerEvent:Connect(function(...)
							Events.OnServerEvent:Fire(...)
						end)
					end
				end
				pcall(Destroy, OldInstance)
			end
			Refit = Antideath.Refit

			Antideath.PollDeath = function()
				if not NoDestroy then
					if not DestroyingCheck.Connected then
						return true
					end
				end
				if not ReparentedCheck.Connected then
					return true
				end
				if pcall(GetFullName, ProxiedInstance) then
					for Index, Value in next, ReadIndex do
						if ProxiedInstance[Index] ~= Value then
							return true
						end
					end
					if #GetChildren(ProxiedInstance) > 0 then
						return true
					end
					if #GetAttributes(ProxiedInstance) > 0 then
						return true
					end
					if #GetTags(ProxiedInstance) > 0 then
						return true
					end
					if IsMeshPart and ProxiedInstance.MeshId ~= NilInstance.MeshId then
						return true
					end
					if IsMeshPart and ProxiedInstance.ReceiveAge ~= 0 then
						return true
					end
					if IsMeshPart and #GetJoints(ProxiedInstance) > 0 then
						return true
					end
				else
					return true
				end
			end 
			PollDeath = Antideath.PollDeath

			local function ApplyAntimatter()
				if not Settings.Defense.CrossBoundary.Antimatter then
					return
				end
				
				local WrapDeformer = Instance.new("WrapDeformer")
				WrapDeformer.Name = "WorldModel"
				MethodRoot.V4(WrapDeformer, nil, function()
					WrapDeformer.Parent = ProxiedInstance
				end, "MeshPart")
			end

			local OldProxy = nil
			local MainLoop; MainLoop = Connect(SNLoop, function()
				if not Resuming then
					return MainLoop:Disconnect()
				end
				
				if PollDeath() then
					Refit()
				end
			end)
			
			local SecondLoop; SecondLoop = RunService.PreAnimation:Connect(function(DeltaTime)
				if not Resuming then
					return SecondLoop:Disconnect()
				end
				
				if OldProxy ~= ProxiedInstance and IsMeshPart then
					ApplyAntimatter()
					
					for Index, Value in next, OnRefit do
						if typeof(Value) == "function" then
							Value()
						end
					end
				end

				if SetIndex.Size then
					pcall(function()
						ReadIndex.Size = SetIndex.Size + Vector3.one / 10000
						ProxiedInstance.Size = ReadIndex.Size
						ReadIndex.Size = SetIndex.Size
						ProxiedInstance.Size = ReadIndex.Size
					end)
				end
				
				OldProxy = ProxiedInstance
			end)
			
			ReparentedCheck = Once(ProxiedInstance.AncestryChanged, VoidFunction)
			if not NoDestroy then
				DestroyingCheck = Once(ProxiedInstance.Destroying, VoidFunction)
			end
		end

		Sandbox.ApplyMesh = function(self, Mesh)
			NilInstance:ApplyMesh(Mesh)
			ProxiedInstance:ApplyMesh(Mesh)
		end
		
		Sandbox.Refit = function(self, Mesh)
			Antideath.Refit()
		end
		
		Sandbox.Set = function(self, Name, Value)
			if Name == "AntiTamper" and IsMeshPart then
				Evil = Value
			end
			if Name == "Exemption" and IsMeshPart then
				test = Value
			end
			Antideath.Refit()
		end
		
		if ClassName == "RemoteEvent" then
			Events.OnServerEvent = Instance.new("BindableEvent")
			Sandbox.OnServerEvent = Events.OnServerEvent.Event
			ProxiedInstance.OnServerEvent:Connect(function(...)
				Events.OnServerEvent:Fire(...)
			end)
		end

		do
			metatable.__index = function(_, i)
				local Exists = pcall(function() local _=NilInstance[i] end)
				if Exists and not Sandbox[i] then
					if typeof(NilInstance[i]) == "function" then
						return function(self, ...)
							return ProxiedInstance[i](ProxiedInstance, ...)
						end
					end
				end
				return Sandbox[i] or SetIndex[i] or NilInstance[i]
			end

			metatable.__newindex = function(_, i, v)
				ReadIndex[i] = v
				SetIndex[i] = v
				pcall(function()
					if i == "Parent" then
						if typeof(v) == "userdata" then
							ProxiedInstance[i] = v:GetInternal().ProxiedInstance
						else
							ProxiedInstance[i] = v
						end
						ReparentedCheck = Once(ProxiedInstance.AncestryChanged, VoidFunction)
					else
						ProxiedInstance[i] = v
						NilInstance[i] = v
					end
				end)
			end

			metatable.__tostring = function()
				return SetIndex.Name or ClassName
			end
		end

		return Proxy
	end,
};

repeat task.wait() until ToClone

local function NewBodypart(Mesh)
	local Bodypart = Antideath.new("MeshPart")
	
	Bodypart:ApplyMesh(Mesh)
	Bodypart.TextureID = ""
	Bodypart.Transparency = Mesh.Transparency
	Bodypart.Reflectance = Mesh.Reflectance
	Bodypart.Size = Mesh.Size
	Bodypart.Color = Mesh.Color
	Bodypart.Material = Mesh.Material
	
	Bodypart.Locked = true
	Bodypart.Anchored = true
	Bodypart.CanCollide = false --> false
	Bodypart.CanQuery = false  --> false
	Bodypart.CanTouch = false  --> false
	Bodypart.Archivable = false
	
	return Bodypart
end

local function radang(x, y, z)
	return CFrame.Angles(math.rad(x or 0), math.rad(y or 0), math.rad(z or 0))
end

local Tasks = {}
local function Ratelimit(n, t)
	if not Tasks[n] then
		Tasks[n] = {os.clock(), 0}
	end
	if Tasks[n][2] + t < os.clock() then
		Tasks[n][2] = os.clock()
		return true, Tasks[n][1]
	end
	return false, Tasks[n][1]
end

local RootCFrame = CFrame.new(0, 15, 0)

local CharacterModel = Assets.character:Clone()
local Character = {
	Head = NewBodypart(CharacterModel.head);
	Torso = NewBodypart(CharacterModel.torso);
	["Left Arm"] = NewBodypart(CharacterModel.larm), ["Right Arm"] = NewBodypart(CharacterModel.rarm);
	["Left Leg"] = NewBodypart(CharacterModel.lleg), ["Right Leg"] = NewBodypart(CharacterModel.rleg);
};

for i, v in next, Character do
	v.Parent = workspace
end	

local Head = Character.Head
local Torso = Character.Torso
local LeftArm, RightArm = Character["Left Arm"], Character["Right Arm"]
local LeftLeg, RightLeg = Character["Left Leg"], Character["Right Leg"]

local Joints = {
	RootJoint = 			{Part0 = "nil", Part1 = Torso, 		C0 = CFrame.new() * radang(-90, 180, 0), C1 = CFrame.new() * radang(-90, 180, 0)};
	Waist = 				{Part0 = "nil", Part1 = Torso, 		C0 = CFrame.new(), C1 = CFrame.new()};
	Neck = 					{Part0 = Torso, Part1 = Head, 		C0 = CFrame.new(0, 1, 0) * radang(-90, 180, 0), C1 = CFrame.new(0, -0.5, 0) * radang(-90, 180, 0)};
	["Left Shoulder"] = 	{Part0 = Torso, Part1 = LeftArm, 	C0 = CFrame.new(-1, 0.5, 0) * radang(0, -90, 0), C1 = CFrame.new(0.5, 0.5, 0) * radang(0, -90, 0)};
	["Right Shoulder"] = 	{Part0 = Torso, Part1 = RightArm, 	C0 = CFrame.new(1, 0.5, 0) * radang(0, 90, 0), C1 = CFrame.new(-0.5, 0.5, 0) * radang(0, 90, 0)};
	["Left Hip"] = 			{Part0 = Torso, Part1 = LeftLeg, 	C0 = CFrame.new(-1, -1, 0) * radang(0, -90, 0), C1 = CFrame.new(-0.5, 1, 0) * radang(0, -90, 0)};
	["Right Hip"] = 		{Part0 = Torso, Part1 = RightLeg, 	C0 = CFrame.new(1, -1, 0) * radang(0, 90, 0), C1 = CFrame.new(0.5, 1, 0) * radang(0, 90, 0)};
}

local RJ = Joints.RootJoint
local WJ = Joints.Waist
local NK = Joints.Neck
local LS, RS = Joints["Left Shoulder"], Joints["Right Shoulder"]
local LH, RH = Joints["Left Hip"], Joints["Right Hip"]

local RJC0 = RJ.C0
local WJC0 = WJ.C0
local NKC0 = NK.C0
local LSC0, RSC0 = LS.C0, RS.C0
local LHC0, RHC0 = LH.C0, RH.C0

local WJC1 = WJ.C1
local NKC1 = NK.C1

local Status = {
	Pose = "";
	HeldKeys = {
		W = false;
		A = false;
		S = false;
		D = false;
		E = false;
		Q = false;
	};
	IsMoving = false;
	
	Parry = false;
	HasParried = false;
	
	Whimsical = false;
	
	Shaker = false;
	
	PullBack = false;
	
	MusicMuted = true;
};

local function IsBusy(Doing)
	local Actions = {
		"Parry";
		"Shaker";
	};
	
	for Index, Value in next, Actions do
		if Status[Value] and not table.find(Doing, Value) then
			return true
		end
	end
	
	return false
end

local Movement = {
	InputVector = {};
	
	Velocity = -Vector3.zAxis;
	WishDirection = Vector3.zero;

	Direction = CFrame.identity
}

local DisconnectOnStop = {}

local MouseBehavior = Enum.MouseBehavior.Default

local CameraCFrame = CFrame.identity
local CameraLook = CFrame.identity

local InputDirection = Vector3.zero
local MoveDirection = CFrame.identity

local CameraRemote = Antideath.new("RemoteEvent")
local InputRemote = Antideath.new("RemoteEvent")
local ReplicationRemote = Antideath.new("RemoteEvent")

local Chatted = Player.Chatted:Connect(function(Message)
	ReplicationRemote:FireAllClients("Chat", Message)
end)

local InputTable = {
	On = function(Key, IsDown, gpe)
		if gpe then
			return
		end
		if Status.HeldKeys[Key.Name] ~= nil then
			Status.HeldKeys[Key.Name] = IsDown
		end
	end,
	
	--> Attacks
	[Enum.KeyCode.Z] = function(IsDown, gpe) --> spear
		if gpe then
			return
		end
		
		if Status.PullBack and IsDown then
			return
		end
		
		Status.PullBack = IsDown
		ReplicationRemote:FireAllClients("Effect", "Spear", Status.PullBack)
	end,
	
	[Enum.KeyCode.X] = function(IsDown, gpe) --> beam
		if gpe then
			return
		end
		
		local Time = 0.5
		local From = CFrame.new(Random.new():NextUnitVector() * 6)
		local To = CFrame.new(0, 0, 0)
		
		ReplicationRemote:FireAllClients("Effect", "Beam", Time, CFrame.new(Random.new():NextUnitVector() * 6), CFrame.new(0, 0, 0))
	end,
	
	--> Abilities
	[Enum.KeyCode.R] = function(IsDown, gpe) --> parry
		if gpe then
			return
		end
		
		if Status.Parry and IsDown then
			return
		end
		
		Status.Parry = IsDown
		if Status.Parry then
			ReplicationRemote:FireAllClients("SoundPosition", {
				CFrame = RootCFrame;
				SoundId = "rbxassetid://211059855";
				Volume = 1.6;
			});
		else
			ReplicationRemote:FireAllClients("SoundPosition", {
				CFrame = RootCFrame;
				SoundId = "rbxassetid://1498950813";
				Volume = 0.4;
			});
		end
		ReplicationRemote:FireAllClients("Effect", "Parry", Status.Parry)
	end,
	[Enum.KeyCode.T] = function(IsDown, gpe) --> whimsical
		if not IsDown or gpe then
			return
		end
		
		Status.Whimsical = not Status.Whimsical
		ReplicationRemote:FireAllClients("Effect", "Whimsical", Status.Whimsical)
	end,
	
	--> Emotes
	[Enum.KeyCode.Y] = function(IsDown, gpe) --> shaker
		if not IsDown or gpe then
			return
		end
			
		Status.Shaker = not Status.Shaker
	end,
	
	--> idk
	[Enum.KeyCode.G] = function(IsDown, gpe) --> refit
		if not IsDown or gpe then
			return
		end
		
		for Index, Value in next, Character do
			Value:Refit()
		end
	end,
	
	[Enum.KeyCode.M] = function(IsDown, gpe) --> mute
		if not IsDown or gpe then
			return
		end

		Status.MusicMuted = not Status.MusicMuted
		ReplicationRemote:FireAllClients("Music", {
			Volume = Status.MusicMuted and 0 or 0.5
		});
	end,
	
	--> settings
	[Enum.KeyCode.KeypadEight] = function(IsDown, gpe) --> toggle antimatter
		if not IsDown or gpe then
			return
		end

		local CrossBoundary = Settings.Defense.CrossBoundary
		CrossBoundary.Antimatter = not CrossBoundary.Antimatter

		for Index, Value in next, Character do
			Value:Refit()
		end

		ReplicationRemote:FireClient(Player, "Notify", {
			Title = "3katar";
			Text = "antimatter ".. tostring(CrossBoundary.Antimatter);
			Duration = 2;
		})
	end,
	
	[Enum.KeyCode.Seven] = function(IsDown, gpe) --> toggle exemption
		if not IsDown or gpe then
			return
		end

		local Main = Settings.Defense.Main
		Main.Exemption = not Main.Exemption

		for Index, Value in next, Character do
			Value:Set("Exemption", Main.Exemption)
		end

		ReplicationRemote:FireClient(Player, "Notify", {
			Title = "3katar";
			Text = "Exemption ".. tostring(Main.Exemption);
			Duration = 2;
		})
	end,

	
	[Enum.KeyCode.KeypadNine] = function(IsDown, gpe) --> toggle client antitamper
		if not IsDown or gpe then
			return
		end

		local CrossBoundary = Settings.Defense.CrossBoundary
		CrossBoundary.AntiTamper = not CrossBoundary.AntiTamper
		
		for Index, Value in next, Character do
			Value:Set("AntiTamper", CrossBoundary.AntiTamper)
		end
		
		ReplicationRemote:FireClient(Player, "Notify", {
			Title = "3katar";
			Text = "force replicate ".. tostring(CrossBoundary.AntiTamper);
			Duration = 2;
		})
	end,
	
	[Enum.KeyCode.K] = function(IsDown, gpe) --> stop
		if not IsDown or gpe then
			return
		end

		ReplicationRemote:FireAllClients("Stop")
		Chatted:Disconnect()

		for i, v in next, DisconnectOnStop do
			v:Disconnect()
		end
		SNResumption:Disconnect()

		Resuming = false
		task.delay(0.5, function()
			Player:LoadCharacter()
		end)
		Player:LoadCharacter()
	end,
}

OnRefit.Parry = function()
	if Status.Parry and not Status.HasParried then
		Status.HasParried = true
		task.delay(0, function()
			Status.HasParried = false
		end)
		
		if Ratelimit("ParryDebounce", 0.5) then
			ReplicationRemote:FireAllClients("SoundPosition", {
				CFrame = RootCFrame;
				SoundId = "rbxassetid://4516507682";
				Volume = 2;
			});
			Status.Parry = false
			ReplicationRemote:FireAllClients("Effect", "Parry", Status.Parry)
			ReplicationRemote:FireAllClients("Effect", "ParryTrigger", Color3.fromRGB(145, 81, 197), TweenInfo.new(1))
		end
	end
end

CameraRemote.Name = (math.random() + os.clock()) .. "CMR"
InputRemote.Name = (math.random() + os.clock()) .. "INR"
ReplicationRemote.Name = (math.random() + os.clock()) .. "REP"

CameraRemote.OnServerEvent:Connect(function(Player, Data)
	local CameraData = Data.Camera
	local MouseData = Data.Mouse
	
	CameraCFrame = CameraData[1]
	
	MouseBehavior = MouseData[2]
end)

InputRemote.OnServerEvent:Connect(function(Player, Key, IsDown, gpe)
	local KeyEvent = InputTable[Key]
	if KeyEvent then
		KeyEvent(IsDown, gpe)
	end
	InputTable.On(Key, IsDown, gpe)
end)

CameraRemote.Parent = InsertService
InputRemote.Parent = InsertService
ReplicationRemote.Parent = InsertService


do
	local Siner = 0
	
	local function Lerp(a, b, t)
		return a + (b - a) * t
	end

	local function ExpAlpha(t, DeltaTime)
		return 1 - math.pow(0.5, DeltaTime * t)
	end

	local Weights = {}
	local function GetAlpha(t, Name, Weight, DeltaTime)
		if not Weights[Weight] then
			Weights[Weight] = {};
		end

		if not table.find(Weights[Weight], Name) then
			table.insert(Weights[Weight], Name)
		end

		for Index, Value in next, Weights do
			local WeightIndex = table.find(Value, Name)
			if Index > Weight and WeightIndex then
				table.remove(Value, WeightIndex)
				return 0
			end
		end

		return ExpAlpha(t, DeltaTime)
	end

	local function Accelerate(AccelDir, PrevVelocity, Friction, Accelerate, Max_Velocity, Flat, DeltaTime)
		local ProjVel = PrevVelocity:Dot(AccelDir)
		local AccelVel = Accelerate * DeltaTime

		if (ProjVel + AccelVel > Max_Velocity) then
			AccelVel = Max_Velocity - ProjVel
		end

		local Vel = (PrevVelocity + (AccelDir * AccelVel))

		if Flat then
			return Vector3.new(Vel.X, PrevVelocity.Y, Vel.Z)
		end

		return Vel
	end

	local function ApplyFriction(AccelDir, PrevVelocity, Friction, AccelerateV, Flat, DeltaTime)
		local Vel = PrevVelocity
		local AddVel = Vector3.new(0, 0, 0)
		if Flat then
			Vel = Vector3.new(PrevVelocity.X, 0, PrevVelocity.Z)
			AddVel = Vector3.new(0, PrevVelocity.Y, 0)
		end

		local speed = Vel.Magnitude
		if (speed ~= 0) then
			local drop = speed * Friction * DeltaTime
			Vel *= math.max(speed - drop, 0) / speed
		end

		return Accelerate(AccelDir, Vel + AddVel, Friction, AccelerateV, 5e3, Flat, DeltaTime)
	end

	local WishRotation = CFrame.identity
	local LerpedRotation = WishRotation
	local MainLoop; MainLoop = RunService.Heartbeat:Connect(function(DeltaTime)
		local DeltaTime60 = DeltaTime * 60
		Siner = Siner + DeltaTime60

		local IsMoving = Movement.WishDirection.Magnitude > (1 / 1e15)
		Status.Pose = IsMoving and "fly" or "idle"
		Status.IsMoving = IsMoving

		local _, CameraYAngle, _ = CameraCFrame:ToOrientation()
		CameraLook = CFrame.Angles(0, CameraYAngle, 0)

		do
			Movement.InputVector.X = (Status.HeldKeys.D and 1 or 0) + (Status.HeldKeys.A and -1 or 0)
			Movement.InputVector.Y = (Status.HeldKeys.E and 1 or 0) + (Status.HeldKeys.Q and -1 or 0)
			Movement.InputVector.Z = (Status.HeldKeys.S and 1 or 0) + (Status.HeldKeys.W and -1 or 0)
			
			InputDirection = (Vector3.new(Movement.InputVector.X, Movement.InputVector.Y, Movement.InputVector.Z).Unit) 
			if InputDirection ~= InputDirection then
				InputDirection = Vector3.zero
			end

			MoveDirection = CameraCFrame.Rotation
		end
		
		local AccelDir = (MoveDirection * CFrame.new(InputDirection)).Position
		local DownwardsVector = CameraCFrame.UpVector:Lerp(Vector3.yAxis * math.sign(CameraCFrame.UpVector.Y), math.abs(CameraLook.RightVector:Dot(AccelDir)))
		
		if Status.Parry or Status.PullBack then
			AccelDir = Vector3.zero
		end
		
		Movement.WishDirection = AccelDir
		Movement.Velocity = ApplyFriction(AccelDir, Movement.Velocity, 10, 1300, false, DeltaTime)
		
		local ProjectedVector = RootCFrame:VectorToObjectSpace(AccelDir).Unit
		if ProjectedVector ~= ProjectedVector then
			ProjectedVector = Vector3.zero
		end

		local FlatProjectedVector = Vector3.new(ProjectedVector.X, 0, ProjectedVector.Y).Unit
		if FlatProjectedVector ~= FlatProjectedVector then
			FlatProjectedVector = Vector3.zero
		end
		
		local NewRotation = nil
		local RotationLerpSpeed = 0.2
		if MouseBehavior == Enum.MouseBehavior.LockCenter then
			NewRotation = CameraCFrame.Rotation
			RotationLerpSpeed = 0.3
		else
			if AccelDir.Magnitude > 0 then
				NewRotation = CFrame.lookAt(RootCFrame.Position, RootCFrame.Position + AccelDir, DownwardsVector).Rotation
			end
		end
		
		if NewRotation then
			WishRotation = NewRotation
			LerpedRotation = LerpedRotation:Lerp(WishRotation, ExpAlpha(RotationLerpSpeed, DeltaTime60))
		end

		local ProjectedVelocity = RootCFrame:VectorToObjectSpace(AccelDir)

		local X = ProjectedVelocity.X
		local Y = ProjectedVelocity.Y
		local Z = ProjectedVelocity.Z
		
		do
			local LookDirection = RootCFrame:ToObjectSpace(CameraCFrame).LookVector / 2
			local Bounce = 30
			
			WJ.C0 = WJ.C0:Lerp(WJC0, GetAlpha(0.2, "WJ", 1, DeltaTime60))
			
			if Status.Pose == "idle" then
				RJ.C0 = RJ.C0:Lerp(RJC0 * CFrame.new(0, 0, 0.225 * math.cos(Siner / Bounce)) * radang(5 + 2.5 + 2.5 * math.sin(Siner / Bounce), 0, 0), GetAlpha(0.15, "RJ", 1, DeltaTime60))
				NK.C0 = NK.C0:Lerp(NKC0 * CFrame.new(0, 0, 0) * radang(0, 0, 3 * -math.cos(Siner / Bounce)), GetAlpha(0.15, "NK", 1, DeltaTime60))
				LS.C0 = LS.C0:Lerp(LSC0 * CFrame.new(-0.02 + 0.02 * math.sin(Siner / Bounce), -0.1 + 0.1 * -math.sin(Siner / Bounce), 0.01 * math.sin(Siner / Bounce)) * radang(-2 + -5 + 5 * -math.cos(Siner / Bounce), 12 + 6 * -math.sin(Siner / Bounce), 5 * -math.cos(Siner / Bounce)), GetAlpha(0.15, "LS", 1, DeltaTime60))
				RS.C0 = RS.C0:Lerp(RSC0 * CFrame.new(-0.02 + 0.02 * -math.sin(Siner / Bounce), -0.1 + 0.1 * -math.sin(Siner / Bounce), 0.01 * math.sin(Siner / Bounce)) * radang(-2 + -5 + 5 * -math.cos(Siner / Bounce), -12 + 6 * math.sin(Siner / Bounce), 5 * math.cos(Siner / Bounce)), GetAlpha(0.15, "RS", 1, DeltaTime60))
				LH.C0 = LH.C0:Lerp(LHC0 * CFrame.new(0, 0.1 + -0.05 + 0.05 * -math.sin(Siner / Bounce), 0.02 + 0.01 * math.cos(Siner / Bounce)) * radang(-5, 6 + 3 * -math.sin(Siner / Bounce), 3 * -math.cos(Siner / Bounce)), GetAlpha(0.15, "LH", 1, DeltaTime60))
				RH.C0 = RH.C0:Lerp(RHC0 * CFrame.new(0.5, 0.5 + 0.15 * -math.sin(Siner / Bounce), 0.02 + 0.01 * math.cos(Siner / Bounce)) * radang(-5, -6 + 3 * math.sin(Siner / Bounce), -15 + 5 * math.cos(Siner / Bounce)), GetAlpha(0.15, "RH", 1, DeltaTime60))
			elseif Status.Pose == "fly" then
				NK.C0 = NK.C0:Lerp(NKC0 * CFrame.new(0, 0, 0) * radang((-30 + 3 * math.sin(Siner / Bounce)) * -Z + (20 * -Y), 0, 0), GetAlpha(0.15,"NK", 1, DeltaTime60))
				RJ.C0 = RJ.C0:Lerp(RJC0 * CFrame.new(0, 0.2 * math.cos(Siner / Bounce), 0.1 * -math.cos(Siner / Bounce)) * radang((60 + 2.5 + 2.5 * math.sin(Siner / Bounce)) * -Z + (40 * -Y), (40 - 5 + 5 * math.sin(Siner / Bounce)) * X, 15 * X), GetAlpha(0.15,"RJ", 1, DeltaTime60))
				LS.C0 = LS.C0:Lerp(LSC0 * CFrame.new(0.2 * -Z, (0.1 * math.sin(Siner / Bounce)) * -Z - (0.2 * math.abs(Y)), 0) * radang((-11 + 4 * math.cos(Siner / Bounce)) * math.abs(Z) + -15 * X + (33 * -math.abs(Y)), 11 + 3 *  math.sin(Siner / Bounce) + (15 * Y), (40 - 5 + 5 * -math.cos(Siner / Bounce)) * -Z + (30 * Y)), GetAlpha(0.15,"LS", 1, DeltaTime60))
				RS.C0 = RS.C0:Lerp(RSC0 * CFrame.new(-0.2 * -Z, (0.1 * math.sin(Siner / Bounce)) * -Z - (0.2 * math.abs(Y)), 0) * radang((-11 + 4 * math.cos(Siner / Bounce)) * math.abs(Z) + 15 * X + (33 * -math.abs(Y)), -11 + 3 * -math.sin(Siner / Bounce) + (-15 * Y), (-40 + 5 - 5 * -math.cos(Siner / Bounce)) * -Z + (-30 * Y)), GetAlpha(0.15,"RS", 1, DeltaTime60))
				LH.C0 = LH.C0:Lerp(LHC0 * CFrame.new(-0.7, 0.5 + 0.1 + 0.1 * math.sin(Siner / Bounce), 0) * radang(-5, 11 + 3 * math.sin(Siner / Bounce), (20 + 6 * math.cos(Siner / Bounce)) * -Z + (30 * Y)), GetAlpha(0.15,"LH", 1, DeltaTime60))
				RH.C0 = RH.C0:Lerp(RHC0 * CFrame.new(0.2, 0.2 + 0.1 * math.sin(Siner / Bounce), 0) * radang(-5, -11 + 3 * -math.sin(Siner / Bounce), (-15 + 3 * -math.cos(Siner / Bounce)) * -Z + (-30 * Y)), GetAlpha(0.15,"RH", 1, DeltaTime60))
			end

			if Status.Parry then
				if not Status.PullBack then
					LS.C0 = LS.C0:Lerp(LSC0 * CFrame.new(-0.75, -0.25 + 0.1 * -math.sin(Siner / Bounce), 0.25) * radang(160 + 2.5 + 2.5 * math.cos(Siner / Bounce), -5, 12), GetAlpha(0.5, "LS", 2, DeltaTime60))
					RS.C0 = RS.C0:Lerp(RSC0 * CFrame.new(0.75, -0.25 + 0.1 * -math.sin(Siner / Bounce), 0.25) * radang(160 + 2.5 + 2.5 * math.cos(Siner / Bounce), 5, -12), GetAlpha(0.5, "RS", 2, DeltaTime60))
				else
					LS.C0 = LS.C0:Lerp(LSC0 * CFrame.new(-0.75, 0 + 0.1 * -math.sin(Siner / Bounce), 0.1) * radang(135 + 2.5 + 2.5 * math.cos(Siner / Bounce), 10, -12), GetAlpha(0.5, "LS", 2, DeltaTime60))
				end
			end

			if Status.Shaker then
				WJ.C0 = WJ.C0:Lerp(WJC0 * CFrame.new(0, -0.15 + 0.1 * math.sin(Siner / 3), -0.15) * radang(4.5 * math.cos(Siner / 3), 0, 0), GetAlpha(0.2, "WJ", 1.5, DeltaTime60))
				RJ.C0 = RJ.C0:Lerp(RJC0 * CFrame.new(0, 0, 0) * radang(50, 0, 0), GetAlpha(0.2, "RJ", 1.5, DeltaTime60))
				NK.C0 = NK.C0:Lerp(NKC0 * CFrame.new(0, 0.1, -0.1) * radang(-30 + 5 * math.cos(Siner / 3), 0, 0), GetAlpha(0.2, "NK", 1.5, DeltaTime60))
				LS.C0 = LS.C0:Lerp(LSC0 * CFrame.new(0, -0.125, 0) * radang(11 + 3 * math.sin(Siner / 3), -8, 5 + 3 * math.cos(Siner / 3)), GetAlpha(0.2, "LS", 1.5, DeltaTime60))
				RS.C0 = RS.C0:Lerp(RSC0 * CFrame.new(0, -0.125, 0) * radang(11 + 3 * math.sin(Siner / 3), 8, -5 - 3 * math.cos(Siner / 3)), GetAlpha(0.2, "RS", 1.5, DeltaTime60))
				LH.C0 = LH.C0:Lerp(LHC0 * CFrame.new(0, 0, 0) * radang(-15, 0, -45 + 3 * math.sin(Siner / 3) ), GetAlpha(0.2, "LH", 1.5, DeltaTime60))
				RH.C0 = RH.C0:Lerp(RHC0 * CFrame.new(0, 0, 0) * radang(-15, 0, 45 - 3 * math.sin(Siner / 3)), GetAlpha(0.2, "RH", 1.5, DeltaTime60))
			end

			local MoveWaist = true
			local MoveHead = true

			if not IsMoving then
				if Status.PullBack then
					WJ.C0 = WJ.C0:Lerp(WJC0 * CFrame.new(0, 0, 0) * radang(0, -25, 0), GetAlpha(0.2, "WJ", 3, DeltaTime60))
					RJ.C0 = RJ.C0:Lerp(RJC0 * CFrame.new(0, 0, 0.2 * math.cos(Siner / Bounce)) * radang(14 + 4 * math.sin(Siner / Bounce), 0, 35), GetAlpha(0.2, "RJ", 3, DeltaTime60))
					NK.C0 = NK.C0:Lerp(NKC0 * CFrame.new(0, 0, 0) * radang(4 - 2 + 2 * -math.cos(Siner / Bounce), 0, -60), GetAlpha(0.2, "NK", 3, DeltaTime60))
					if not Status.Parry then
						LS.C0 = LS.C0:Lerp(LSC0 * CFrame.new(-0.65, -0.08 + 0.08 * -math.cos(Siner / Bounce), 0.1) * radang(-7 + 10 + 10 * math.sin(Siner / Bounce), 38 + 5 + 5 * math.cos(Siner / Bounce), -87 + 2 * -math.cos(Siner / Bounce)), GetAlpha(0.4, "LS", 3, DeltaTime60))
					end
					RS.C0 = RS.C0:Lerp(RSC0 * CFrame.new(-0.25, -0.08 + 0.08 * -math.cos(Siner / Bounce), 0) * radang(-145 - 5 + 5 * math.sin(Siner / Bounce), -170 - 5 + 5 * -math.cos(Siner / Bounce), 15 + 2 * math.cos(Siner / Bounce)), GetAlpha(0.5, "RS", 3, DeltaTime60))
				end
			end

			WJ.C1 = WJ.C1:Lerp(WJC1 * CFrame.Angles(0, LookDirection.X, 0) * (CFrame.Angles(-LookDirection.Y, 0, 0)  * CFrame.new(0, math.abs(LookDirection.Y) / 3, -LookDirection.Y)), GetAlpha(0.2, "WJ1", 1, DeltaTime60))
			NK.C1 = NK.C1:Lerp(NKC1 * CFrame.Angles(0, 0, -LookDirection.X) * CFrame.Angles(LookDirection.Y, 0, 0), GetAlpha(0.2, "NK1", 1, DeltaTime60))
		end

		
		if LerpedRotation == LerpedRotation then
			RootCFrame = (CFrame.new(RootCFrame.Position) * CFrame.new(Movement.Velocity * DeltaTime)) * LerpedRotation.Rotation
		end
		
		Torso.CFrame = RootCFrame * (RJ.C0 * RJ.C1:Inverse()) * (WJ.C0 * WJ.C1:Inverse())
		Head.CFrame = NK.Part0.CFrame * (NK.C0 * NK.C1:Inverse())
		LeftArm.CFrame = LS.Part0.CFrame * (LS.C0 * LS.C1:Inverse())
		RightArm.CFrame = RS.Part0.CFrame * (RS.C0 * RS.C1:Inverse())
		LeftLeg.CFrame = RootCFrame * (RJ.C0 * RJ.C1:Inverse()) * (LH.C0 * LH.C1:Inverse())
		RightLeg.CFrame = RootCFrame * (RJ.C0 * RJ.C1:Inverse()) * (RH.C0 * RH.C1:Inverse())
		
		CameraRemote:FireClient(Player, Head.CFrame, Head.CFrame)
		ReplicationRemote:FireAllClients("Bodyparts", {
			Root = RootCFrame;
			Torso = Torso.CFrame;
			Head = Head.CFrame;
			["Left Arm"] = LeftArm.CFrame;
			["Right Arm"] = RightArm.CFrame;
			["Left Leg"] = LeftLeg.CFrame;
			["Right Leg"] = RightLeg.CFrame;
		});
	end)
	table.insert(DisconnectOnStop, MainLoop)
end

local Theme = "rbxassetid://18790993847"

local Clients = {}
local function GiveClient(ID, Code, PlayerToGive)
	if not Resuming then
		return
	end
	
	local ClonedEffects = Effects:Clone()
	
	local LocalScript = NLS(Code, PlayerToGive:FindFirstChildOfClass("PlayerGui") or Instance.new("Backpack", PlayerToGive))
	table.insert(Clients, LocalScript)
	
	if ID == "Replication" then
		ClonedEffects.Parent = PlayerToGive
	end
	
	LocalScript:SetAttribute("OWN", UID)
	
	LocalScript:SetAttribute("CMR", CameraRemote.Name)
	LocalScript:SetAttribute("INR", InputRemote.Name)
	LocalScript:SetAttribute("REP", ReplicationRemote.Name)
	
	task.delay(0.5, function()
		LocalScript:Destroy()
		if Resuming then
			if Status.Parry then
				ReplicationRemote:FireClient(PlayerToGive, "Effect", "Parry", true)
			end
			if Status.Whimsical then
				ReplicationRemote:FireClient(PlayerToGive, "Effect", "Whimsical", true)
			end
			ReplicationRemote:FireAllClients("Music", {
				Volume = Status.MusicMuted and 0 or 0.5
			});
		end
	end)
end

local OwnerClientCode = [==[
script.Disabled = true
script.Parent = nil
script:Destroy()

local ContextActionService = game:GetService("ContextActionService")
local InsertService = game:GetService("InsertService")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")

local Player = Players.LocalPlayer

local Resume = true

local Tasks = {}
local function Ratelimit(n, t)
	if not Tasks[n] then
		Tasks[n] = {os.clock(), 0}
	end
	if Tasks[n][2] + t < os.clock() then
		Tasks[n][2] = os.clock()
		return true, Tasks[n][1]
	end
	return false, Tasks[n][1]
end

local function WaitForAttribute(Name)
	local Attribute = script:GetAttribute(Name)
	while not Attribute do
		Attribute = script:GetAttribute(Name)
		if Attribute then
			break
		end
		script.AttributeChanged:Wait()
	end
	return Attribute
end

local function CheckRemote(Name)
	local Remote = nil
	for i, v in next, InsertService:GetChildren() do
		if v:IsA("BaseRemoteEvent") and v.Name == Name then
			Remote = v
		end
	end
	return Remote
end

local function RemoteWrapper(Name)
	local Proxy = newproxy(true)
	local Metatable = getmetatable(Proxy)

	local OnClientEvent = nil
	local RemoteBase = {}

	local BaseEvent = Instance.new("BindableEvent")
	local Remote = nil

	local function SetRemote()
		local NewRemote = CheckRemote(Name)
		if Remote == NewRemote then
			return
		end
		Remote = NewRemote
		
		if OnClientEvent then
			OnClientEvent:Disconnect()
		end
		
		OnClientEvent = Remote.OnClientEvent:Connect(function(...)
			if not Resume then
				return OnClientEvent:Disconnect()
			end
			BaseEvent:Fire(...)
		end)
	end

	local ChildAdded; ChildAdded = InsertService.ChildAdded:Connect(function(NewRemote)
		if not Resume then
			return ChildAdded:Disconnect()
		end
		SetRemote()
	end)
	SetRemote()
	
	do
		RemoteBase.FireServer = function(self, ...)
			if not Resume then
				return
			end
			if Remote then
				Remote:FireServer(...)
			end
		end
		RemoteBase.OnClientEvent = BaseEvent.Event

		Metatable.__index = function(self, i)
			if not Resume then
				return warn("request voided")
			end
			
			if typeof(RemoteBase[i]) == "function" then
				return function(_, ...)
					Remote[i](Remote, ...)
				end
			end
			return RemoteBase[i]
		end

		Metatable.__newindex = function(self, i, v)
			return
		end
	end

	return Proxy
end

local function GetInput(InputObject)
	local Key = InputObject.KeyCode
	if Key.Name == "Unknown" then
		Key = InputObject.UserInputType
	end
	return Key
end

local function Lerp(num, goal, i)
	return num + (goal - num) * i 
end

local nanCFrame = CFrame.fromMatrix(Vector3.zero / Vector3.zero, Vector3.zero / Vector3.zero, Vector3.zero / Vector3.zero, Vector3.zero / Vector3.zero, Vector3.zero / Vector3.zero)

local CameraRemote = RemoteWrapper(WaitForAttribute("CMR"));
local InputRemote = RemoteWrapper(WaitForAttribute("INR"));
local ReplicationRemote = RemoteWrapper(WaitForAttribute("REP"));

local LimbCFrames = {
	Root = CFrame.identity;
	
	Torso = CFrame.identity;
	Head = CFrame.identity;
	["Left Arm"] = CFrame.identity;
	["Right Arm"] = CFrame.identity;
	["Left Leg"] = CFrame.identity;
	["Right Leg"] = CFrame.identity;
}

ReplicationRemote.OnClientEvent:Connect(function(Type, RecievedLimbCFrames)
	if Type ~= "Bodyparts" then
		return
	end
	if typeof(RecievedLimbCFrames) ~= "table" then
		return
	end
	for Index, Value in next, RecievedLimbCFrames do
		if LimbCFrames[Index] then
			LimbCFrames[Index] = Value
		end
	end
end)

local SignalsToDisconnect = {};
do
	local ShiftlockEnabled = false
	
	local MouseIcon = ""
	
	local Zoom = 15
	local ZoomSensitivityCurvature = 0.16
	
	local LerpedZoom = Zoom
	
	local CameraRotationVector = Vector3.zero
	local CameraOrigin = Vector3.zero
	
	local CameraCFrame = CFrame.identity
	
	local CameraProperties = {
		HeadScale = 1;
		HeadLocked = true;
		CameraSubject = nil;
		CameraType = Enum.CameraType.Scriptable;
		FieldOfView = 70;
	}
	
	local CameraSignals = {}
	local Camera = nil
	local function CreateCamera()
		for i, v in next, CameraSignals do
			v:Disconnect()
		end
		table.clear(CameraSignals)
		
		Camera = Instance.new("Camera")
		Camera:Destroy()
		
		table.insert(CameraSignals, Camera.Changed:Connect(function(Property)
			local Index = CameraProperties[Property]
			if Index and Index ~= CameraProperties[Property] then
				Camera[Property] = CameraProperties[Property]
			end
		end))
	end
	
	CreateCamera()
	
	local function UpdateCameraValues()
		if workspace.CurrentCamera ~= Camera then
			workspace.CurrentCamera = Camera
		end
		
		if Camera.HeadScale ~= 1 then
			Camera.HeadScale = 1
			Camera.HeadLocked = true
		end
		
		if Camera.CameraSubject ~= nil then
			Camera.CameraSubject = nil
		end
		if Camera.CameraType ~= Enum.CameraType.Scriptable then
			Camera.CameraType = Enum.CameraType.Scriptable
		end
		if Camera.FieldOfView ~= 70 then
			Camera.FieldOfView = 70
		end
	end

	local function GetZoomValue(Value, CurrentZoom) 
		return CurrentZoom + -Value * (1 + CurrentZoom * ZoomSensitivityCurvature)
	end
	
	local function GetZoom(DeltaTime)
		LerpedZoom = Lerp(LerpedZoom, Zoom, math.min(0.25 * DeltaTime * 60, 1))
		return LerpedZoom
	end

	local LastFrame = os.clock()
	local CameraLoop; CameraLoop = RunService.PreRender:Connect(function()
		local DeltaTime = os.clock() - LastFrame
		if not Resume then
			return CameraLoop:Disconnect()
		end
		
		local ShiftlockOffset = CFrame.new(0, 0, 0)
		if ShiftlockEnabled then
			ShiftlockOffset = CFrame.new(1.5, 0, 0)
		end
		
		local RootCFrame = LimbCFrames.Root
		local HeadCFrame = LimbCFrames.Head
		
		CameraOrigin = (RootCFrame * CFrame.new(0, 1.5, 0)).Position
		
		local ZOffset = GetZoom(DeltaTime)
		local MouseDelta = UserInputService:GetMouseDelta()
		
		local MouseBehaviour = UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton2) and Enum.MouseBehavior.LockCurrentPosition or Enum.MouseBehavior.Default
		local FirstPerson = false
		if Zoom < 0.5 then
			CameraOrigin = HeadCFrame.Position
			MouseBehaviour = Enum.MouseBehavior.LockCenter
		end
		
		if ShiftlockEnabled then
			MouseBehaviour = Enum.MouseBehavior.LockCenter
		end
		
		local CameraRotationCFrame = CFrame.Angles(0, -CameraRotationVector.X, 0) * CFrame.Angles(-CameraRotationVector.Y, 0, 0)
		CameraRotationVector = CameraRotationVector + Vector3.new(MouseDelta.X * math.sign(CameraCFrame.UpVector.Y), MouseDelta.Y, 0) * math.rad(0.25)
		
		CameraCFrame = (CameraRotationCFrame + CameraOrigin + CameraRotationCFrame * Vector3.new(0, 0, ZOffset)) * ShiftlockOffset
		
		UserInputService.MouseIcon = MouseIcon
		UserInputService.MouseBehavior = MouseBehaviour
		
		CameraProperties.CFrame = CameraCFrame
		Camera.CFrame = CameraCFrame
		Player:SetAttribute("CMF", CameraCFrame)
		
		UpdateCameraValues()
		LastFrame = os.clock()
		
		if Ratelimit("CameraSend", 1 / 30) then
			CameraRemote:FireServer({
				Camera = {CameraCFrame};
				Mouse = {CFrame.identity, MouseBehaviour};
			});
		end
		if Ratelimit("StreamSend", 1) and workspace.StreamingEnabled then
			Player:RequestStreamAroundAsync(CameraCFrame.Position, 2)
		end
	end)
	
	UserInputService.InputChanged:Connect(function(InputObject, gpe)
		local InputType = InputObject.UserInputType.Name
		if InputType == "MouseWheel" then
			Zoom = math.max(GetZoomValue(InputObject.Position.Z, Zoom), 0)
		end
	end)
	
	local ShiftlockName = "Shiftlock"..os.clock()
	ContextActionService:BindAction(ShiftlockName, function(ActionName, InputState, InputObject)
		if InputState ~= Enum.UserInputState.Begin then
			return
		end
		
		if InputObject.KeyCode == Enum.KeyCode.LeftShift or InputObject.KeyCode == Enum.KeyCode.RightShift then
			ShiftlockEnabled = not ShiftlockEnabled
			MouseIcon = ShiftlockEnabled and "rbxasset://textures/MouseLockedCursor.png" or ""
		end
	end, false, Enum.KeyCode.LeftShift, Enum.KeyCode.RightShift)
	
	ReplicationRemote.OnClientEvent:Connect(function(Type)
		if Type == "Stop" then
			print("lol")
			Resume = false
			CameraLoop:Disconnect()
			Camera:Destroy()
			
			for i, v in next, SignalsToDisconnect do
				v:Disconnect()
			end
			
			UserInputService.MouseIcon = ""
			UserInputService.MouseBehavior = Enum.MouseBehavior.Default
			workspace.CurrentCamera.CameraType = Enum.CameraType.Custom
			
			ContextActionService:UnbindAction(ShiftlockName)
		end
	end)
end

for i, v in next, {"InputBegan", "InputEnded"} do
	table.insert(SignalsToDisconnect, UserInputService[v]:Connect(function(InputObject, GameProcessed)
		local Key = GetInput(InputObject)
		local IsDown = v == "InputBegan"
		
		InputRemote:FireServer(Key, IsDown, GameProcessed)
	end))
end

game:GetService("Chat"):SetBubbleChatSettings({MaxDistance = math.huge , MinimizeDistance = -1})
]==]

local ReplicationClientCode = [==[
script.Disabled = true
script.Parent = nil

local Players = game:GetService("Players")
local Player = Players.LocalPlayer

local Dependencies = {
	effects = {
		Shield = {};
		Daze = {};
	};
};

local function WaitForDependencies(Parent, LoopThrough)
	local Returned = nil
	for Index, Value in next, LoopThrough do
		warn("waiting for", Index, "in", Parent)
		local Found = Parent:WaitForChild(Index)
		Returned = Found
		warn("got", Index)
		if typeof(Value) == "table" then
			for Index2, Value2 in next, Value do
				WaitForDependencies(Found, Value2)
			end
		end
	end
	return Returned
end

local DependencyParent = Player
local Dependencies = WaitForDependencies(DependencyParent, Dependencies)
task.wait()

local Effects = DependencyParent:WaitForChild("effects"):Clone()
Effects.Parent = nil

Dependencies:Destroy()
script:Destroy()

local InsertService = game:GetService("InsertService")
local RunService = game:GetService("RunService")
local SoundService = game:GetService("SoundService")
local TweenService = game:GetService("TweenService")
local StarterGui = game:GetService("StarterGui")

local Resume = true

local Tasks = {}
local function Ratelimit(n, t)
	if not Tasks[n] then
		Tasks[n] = {os.clock(), 0}
	end
	if Tasks[n][2] + t < os.clock() then
		Tasks[n][2] = os.clock()
		return true, Tasks[n][1]
	end
	return false, Tasks[n][1]
end

local function WaitForAttribute(Name)
	local Attribute = script:GetAttribute(Name)
	while not Attribute do
		Attribute = script:GetAttribute(Name)
		if Attribute then
			break
		end
		script.AttributeChanged:Wait()
	end
	return Attribute
end

local function CheckRemote(Name)
	local Remote = nil
	for i, v in next, InsertService:GetChildren() do
		if v:IsA("BaseRemoteEvent") and v.Name == Name then
			Remote = v
		end
	end
	return Remote
end

local function RemoteWrapper(Name)
	local Proxy = newproxy(true)
	local Metatable = getmetatable(Proxy)

	local OnClientEvent = nil
	local RemoteBase = {}

	local BaseEvent = Instance.new("BindableEvent")
	local Remote = nil

	local function SetRemote()
		local NewRemote = CheckRemote(Name)
		if Remote == NewRemote then
			return
		end
		Remote = NewRemote

		if OnClientEvent then
			OnClientEvent:Disconnect()
		end

		OnClientEvent = Remote.OnClientEvent:Connect(function(...)
			if not Resume then
				return OnClientEvent:Disconnect()
			end
			BaseEvent:Fire(...)
		end)
	end

	local ChildAdded; ChildAdded = InsertService.ChildAdded:Connect(function(NewRemote)
		if not Resume then
			return ChildAdded:Disconnect()
		end
		SetRemote()
	end)
	SetRemote()

	do
		RemoteBase.FireServer = function(self, ...)
			if not Resume then
				return
			end
			if Remote then
				Remote:FireServer(...)
			end
		end
		RemoteBase.OnClientEvent = BaseEvent.Event

		Metatable.__index = function(self, i)
			if not Resume then
				return warn("request voided")
			end

			if typeof(RemoteBase[i]) == "function" then
				return function(_, ...)
					Remote[i](Remote, ...)
				end
			end
			return RemoteBase[i]
		end

		Metatable.__newindex = function(self, i, v)
			return
		end
	end

	return Proxy
end

local function PlaySoundAtPosition(Data)
	local Container = Instance.new("PartOperation")
	Container.CFrame = Data.CFrame or CFrame.identity
	
	local Sound = Instance.new("Sound")
	for Index, Value in next, Data do
		pcall(function()
			Sound[Index] = Value
		end)
	end
	Sound.Parent = Container
	
	Sound.PlayOnRemove = true
	Container.Parent = SoundService
	Container:Destroy()
end

local Owner = Players:GetPlayerByUserId(WaitForAttribute("OWN"));

local CameraRemote = RemoteWrapper(WaitForAttribute("CMR"));
local InputRemote = RemoteWrapper(WaitForAttribute("INR"));
local ReplicationRemote = RemoteWrapper(WaitForAttribute("REP"));

local Shield = Effects:WaitForChild("Shield");
local Daze = Effects:WaitForChild("Daze");
local Whimsical = Effects:WaitForChild("Whimsical");
local Spear = Effects:WaitForChild("Spear");

local function Lerp(a, b, t)
	return a + (b - a) * t
end

local function ExpAlpha(t, DeltaTime)
	return 1 - math.pow(0.5, DeltaTime * t)
end

local function FastTween(...)
	local Tween = TweenService:Create(...)
	Tween:Play()
	return Tween
end

local function CreateVignette()
	local NewVignette = Instance.new("ScreenGui")
	NewVignette.IgnoreGuiInset = true
	
	local Image = Instance.new("ImageLabel", NewVignette)
	Image.Image = "http://www.roblox.com/asset/?id=15331975250"
	Image.Size = UDim2.fromScale(1, 1)
	Image.BackgroundTransparency = 1
	
	return NewVignette, Image
end

local ChatBillboard = Instance.new("BillboardGui")
local ChatText = Instance.new("TextLabel")
local Stroke = Instance.new("UIStroke")

ChatText.Parent = ChatBillboard
Stroke.Parent = ChatText

ChatBillboard.Size = UDim2.fromScale(1e3, 1)
ChatBillboard.StudsOffsetWorldSpace = Vector3.new(0, 1.5, 0)
ChatBillboard.LightInfluence = 0
ChatBillboard.Adornee = workspace.Terrain

ChatText.Size = UDim2.fromScale(1, 1)
ChatText.TextColor3 = Color3.new(1, 1, 1)
ChatText.TextScaled = true
ChatText.BackgroundTransparency = 1
ChatText.Name = "C"

Stroke.Color = Color3.fromRGB(98, 37, 209)
Stroke.Thickness = 3
Stroke.LineJoinMode = Enum.LineJoinMode.Miter
Stroke.Name = "S"

ChatText.Font = Enum.Font.Code

local CameraCFrame = CFrame.identity

local RootCFrame = CFrame.identity
local HeadCFrame = CFrame.identity

local LimbCFrames = {
	Root = CFrame.identity;

	Torso = CFrame.identity;
	Head = CFrame.identity;
	["Left Arm"] = CFrame.identity;
	["Right Arm"] = CFrame.identity;
	["Left Leg"] = CFrame.identity;
	["Right Leg"] = CFrame.identity;
};

local Siner = 0
local StarSines = {
	0;
	0;
	0;
}

local LerpedCFrames = {
	RootCFrame;
	RootCFrame;
	RootCFrame;
}

local ParryActive = false;
local ParryUpdate = nil;
local ParryShield = nil;

local SpearActive = false;
local CurrentSpear = nil;

local WhimsicalActive = false;
local WhimsicalStars = {
	Primary = {};
	Secondary = {};
	Particles = {};
	Trails = {};	
};

local function AddStar(Index, Scale)
	local NewStar = Whimsical:Clone()
	NewStar:ScaleTo(Scale)

	local Primary = NewStar.Star
	local Secondary = NewStar.Inner

	Primary.CFrame = CFrame.identity
	Secondary.CFrame = CFrame.identity

	WhimsicalStars[Index] = NewStar

	WhimsicalStars.Primary[Index] = Primary
	WhimsicalStars.Secondary[Index] = Secondary
	WhimsicalStars.Particles[Index] = Primary.FlareFireAttachment.FlareParticles
	WhimsicalStars.Trails[Index] = Primary.Trail
	
	return NewStar
end

local Effects = {
	Parry = function(Active)
		ParryActive = Active
		if Active then
			if ParryShield then
				ParryShield:Destroy()
				ParryShield = nil
			end
			
			local NewShield = Shield:Clone()
			NewShield.Transparency = 1
			NewShield.Anchored = true
			
			ParryShield = NewShield
			NewShield.Parent = workspace.Terrain
		else
			if ParryShield then
				ParryShield:Destroy()
				ParryShield = nil
			end
		end
	end,	
	ParryTrigger = function()
		local NewVignette, Image = CreateVignette()
		
		local Distance = (workspace.CurrentCamera.CFrame.Position - RootCFrame.Position).Magnitude / 2
		if Player == Owner then
			Distance = 1
		end
		
		Image.ImageColor3 = Color3.fromRGB(145, 81, 197)
		Image.ImageTransparency = math.max(0, 1 - (1 / (Distance / 2)))
		FastTween(Image, TweenInfo.new(1), {
			ImageTransparency = 1;
		}).Completed:Connect(function()
			NewVignette:Destroy()
		end)
		
		NewVignette.Parent = Player.PlayerGui
	end,
	
	Whimsical = function(Active)
		if Active then
			local NewStar1 = AddStar(1, 1.5)
			local NewStar2 = AddStar(2, 1)
			local NewStar3 = AddStar(3, 0.75)
			
			NewStar1.Parent = workspace.Terrain
			NewStar2.Parent = workspace.Terrain
			NewStar3.Parent = workspace.Terrain
		else
			for Index, Value in next, WhimsicalStars do
				if typeof(Index) == "number" then
					Value:Destroy()
				else
					table.clear(Value)
				end
			end
			
			table.remove(WhimsicalStars, 1)
			table.remove(WhimsicalStars, 2)
			table.remove(WhimsicalStars, 3)
			
			WhimsicalStars = {
				Primary = {};
				Secondary = {};
				Particles = {};
				Trails = {};	
			};
		end
		WhimsicalActive = Active
	end,
	
	Spear = function(Active)
		if Active then
			CurrentSpear = Spear:Clone();
			CurrentSpear.Parent = workspace.Terrain
		else
			if CurrentSpear then
				CurrentSpear:Destroy()
			end
		end
		SpearActive = Active
	end,
};

local PrimaryStarColor = Color3.fromRGB(16, 42, 220)
local SecondaryStarColor = Color3.fromRGB(113, 25, 186)

local PrimaryStarColorInner = Color3.fromRGB(0, 119, 130)
local SecondaryStarColorInner = Color3.fromRGB(140, 91, 159)

local LerpedTransparency = 1

local Terrain = workspace.Terrain

local UpdateEffect; UpdateEffect = RunService.PreRender:Connect(function(DeltaTime)
	if not Resume then
		return UpdateEffect:Disconnect()
	end
	
	local DeltaTime60 = DeltaTime * 60
	
	if Player ~= Owner then
		CameraCFrame = workspace.CurrentCamera.CFrame
	else
		CameraCFrame = Player:GetAttribute("CMF")
	end
	
	Siner = Siner + DeltaTime60
	
	if ParryShield then
		local GoalTransparency = ParryActive and 0.1 or 1
		ParryShield.Transparency = Lerp(ParryShield.Transparency, GoalTransparency, ExpAlpha(0.8, DeltaTime60))
		if ParryActive then
			ParryShield:PivotTo(RootCFrame * CFrame.new(0, 0, -2))
		end
	end
	
	if CurrentSpear then
		if SpearActive then
			CurrentSpear:PivotTo(LimbCFrames["Right Arm"] * CFrame.new(0, -1, 0) * CFrame.Angles(0, (math.pi / 4) + (math.pi / 2), math.pi / 2))
		end
	end
	
	local RootCFrameNoRot = CFrame.new(RootCFrame.Position)
	
	local Rotation = math.rad((Siner * 15) % 360)
	local LerpTime = ExpAlpha(0.4, DeltaTime60)
	
	StarSines[1] = StarSines[1] + (DeltaTime60 * (0.75 + 0.5 + math.cos(Siner / 12)))
	StarSines[2] = StarSines[2] + (DeltaTime60 * (1 + 0.5 + math.sin(Siner / 18)))
	StarSines[3] = StarSines[3] + (DeltaTime60 * (1.5 + 0.5 + math.cos(Siner / 25)))
	
	local Orbit1Vector = Vector3.new(math.sin(StarSines[1] / 20) * 3, math.cos(StarSines[2] / 20) * 3, math.sin(StarSines[3] / 35) * 5)
	local Orbit2Vector = Vector3.new(math.cos(StarSines[3] / 30) * 4, math.sin(StarSines[1] / 30) * 4, math.cos(StarSines[2] / 45) * 6)
	local Orbit3Vector = Vector3.new(math.cos(StarSines[2] / 15) * 5, math.sin(StarSines[3] / 15) * 5, math.cos(StarSines[1] / 20) * 6)
	
	local Orbit1 = RootCFrameNoRot * CFrame.new(Orbit1Vector) * CFrame.new(Vector3.zero, Orbit1Vector).Rotation * CFrame.Angles(0, 0, Rotation)
	local Orbit2 = RootCFrameNoRot * CFrame.new(Orbit2Vector) * CFrame.new(Vector3.zero, Orbit2Vector).Rotation * CFrame.Angles(0, 0, Rotation)
	local Orbit3 = RootCFrameNoRot * CFrame.new(Orbit3Vector) * CFrame.new(Vector3.zero, Orbit3Vector).Rotation * CFrame.Angles(0, 0, Rotation)
	
	LerpedTransparency = Lerp(LerpedTransparency, WhimsicalActive and 0 or 1, ExpAlpha(0.3, DeltaTime60))
	
	if not WhimsicalActive then
		Orbit1 = RootCFrameNoRot * CFrame.new(math.sin(StarSines[1] / 20) * 25, math.cos(StarSines[2] / 20) * 25, math.sin(StarSines[3] / 35) * 25)
		Orbit2 = RootCFrameNoRot * CFrame.new(math.cos(StarSines[3] / 30) * 25, math.sin(StarSines[1] / 30) * 25, math.cos(StarSines[2] / 45) * 25)
		Orbit3 = RootCFrameNoRot * CFrame.new(math.cos(StarSines[2] / 15) * 25, math.sin(StarSines[3] / 15) * 25, math.cos(StarSines[1] / 20) * 25)
	end
	
	LerpedCFrames[1] = LerpedCFrames[1]:Lerp(Orbit1, LerpTime)
	LerpedCFrames[2] = LerpedCFrames[2]:Lerp(Orbit2, LerpTime)
	LerpedCFrames[3] = LerpedCFrames[3]:Lerp(Orbit3, LerpTime)
	
	if WhimsicalActive then
		local Primaries = WhimsicalStars.Primary
		local Secondaries = WhimsicalStars.Secondary
		local Particles = WhimsicalStars.Particles
		local Trails = WhimsicalStars.Trails
		
		local Primary1 = Primaries[1]
		local Primary2 = Primaries[2]
		local Primary3 = Primaries[3]
		
		local Secondary1 = Secondaries[1]
		local Secondary2 = Secondaries[2]
		local Secondary3 = Secondaries[3]
		
		local Particle1 = Particles[1]
		local Particle2 = Particles[2]
		local Particle3 = Particles[3]
		
		local Trail1 = Trails[1]
		local Trail2 = Trails[2]
		local Trail3 = Trails[3]
		
		local PrimaryColor1 = PrimaryStarColor:Lerp(SecondaryStarColor, 0.35 + 0.35 * math.cos(Siner / 400))
		local SecondaryColor1 = PrimaryStarColorInner:Lerp(SecondaryStarColorInner, 0.35 + 0.35 * math.cos((Siner + 0.5) / 400))
		
		local PrimaryColor2 = PrimaryStarColor:Lerp(SecondaryStarColor, 0.35 + 0.35 * math.cos((Siner + 3) / 400))
		local SecondaryColor2 = PrimaryStarColorInner:Lerp(SecondaryStarColorInner, 0.35 + 0.35 * math.cos((Siner + 3.5) / 400))
		
		local PrimaryColor3 = PrimaryStarColor:Lerp(SecondaryStarColor, 0.35 + 0.35 * math.cos((Siner - 3) / 400))
		local SecondaryColor3 = PrimaryStarColorInner:Lerp(SecondaryStarColorInner, 0.35 + 0.35 * math.cos((Siner - 2.5) / 400))
		
		local Primary1CFrame = LerpedCFrames[1]
		local Primary2CFrame = LerpedCFrames[2]
		local Primary3CFrame = LerpedCFrames[3]
		
		if Primary1 then
			if Primary1:IsDescendantOf(Terrain) then
				local PrimaryColorSequence = ColorSequence.new(PrimaryColor1, PrimaryColor1)

				Primary1.Color = PrimaryColor1
				Secondary1.Color = SecondaryColor1
				Trail1.Color = PrimaryColorSequence
				Particle1.Color = PrimaryColorSequence

				Primary1.CFrame = Primary1CFrame
				Secondary1.CFrame = Primary1CFrame

				Primary1.Transparency = LerpedTransparency
				Secondary1.Transparency = LerpedTransparency
			else
				for Index, Value in next, WhimsicalStars do
					if typeof(Value) == "table" then
						Value[1] = nil
					end
				end
				local Star = WhimsicalStars[1]
				WhimsicalStars[1] = nil
				Star:Destroy()
				AddStar(1, 1.5)
				WhimsicalStars[1].Parent = workspace.Terrain
			end
		end
		
		if Primary2 then
			if Primary2:IsDescendantOf(Terrain) then
				local PrimaryColorSequence = ColorSequence.new(PrimaryColor2, PrimaryColor2)

				Primary2.Color = PrimaryColor2
				Secondary2.Color = SecondaryColor2
				Trail2.Color = PrimaryColorSequence
				Particle2.Color = PrimaryColorSequence

				Primary2.CFrame = Primary2CFrame
				Secondary2.CFrame = Primary2CFrame

				Primary2.Transparency = LerpedTransparency
				Secondary2.Transparency = LerpedTransparency
			else
				for Index, Value in next, WhimsicalStars do
					if typeof(Value) == "table" then
						Value[2] = nil
					end
				end
				local Star = WhimsicalStars[2]
				WhimsicalStars[2] = nil
				Star:Destroy()
				AddStar(2, 1)
				WhimsicalStars[2].Parent = workspace.Terrain
			end
		end
		
		if Primary3 then
			if Primary3:IsDescendantOf(Terrain) then
				local PrimaryColorSequence = ColorSequence.new(PrimaryColor3, PrimaryColor3)

				Primary3.Color = PrimaryColor3
				Secondary3.Color = SecondaryColor3
				Trail3.Color = PrimaryColorSequence
				Particle3.Color = PrimaryColorSequence

				Primary3.CFrame = Primary3CFrame
				Secondary3.CFrame = Primary3CFrame

				Primary3.Transparency = LerpedTransparency
				Secondary3.Transparency = LerpedTransparency
			else
				for Index, Value in next, WhimsicalStars do
					if typeof(Value) == "table" then
						Value[3] = nil
					end
				end
				local Star = WhimsicalStars[3]
				WhimsicalStars[3] = nil
				Star:Destroy()
				AddStar(3, 0.75)
				WhimsicalStars[3].Parent = workspace.Terrain
			end
		end
	end
end)

local function GetPreviousCharacters(String, Distance)
	return string.sub(String, #String - Distance + 1, #String)
end

local CurrentChats = {};
local Events = {
	Chat = function(Message)
		local ClonedChat = ChatBillboard:Clone()
		local TextLabel = ClonedChat.C
		local Stroke = TextLabel.S
		TextLabel.Text = Message
		
		table.insert(CurrentChats, ClonedChat)
		
		local Fade = false
		local FadeOffsetPosition = Vector3.zero
		local FadeOffsetRotation = 0
		
		local RNG = Random.new():NextNumber(-1, 1)
		local UpdateChat; UpdateChat = RunService.Heartbeat:Connect(function(DeltaTime)
			local ChatOffset = table.find(CurrentChats, ClonedChat)
			if not ChatOffset then
				return UpdateChat:Disconnect()
			end
			
			if Fade then
				FadeOffsetPosition = FadeOffsetPosition + Vector3.new(0, -DeltaTime, 0)
				FadeOffsetRotation = FadeOffsetRotation + DeltaTime * RNG * 15
			end
			
			ClonedChat.StudsOffsetWorldSpace = HeadCFrame.Position + (RootCFrame.UpVector.Unit * 1.5) * ChatOffset + FadeOffsetPosition
			TextLabel.Rotation = FadeOffsetRotation
		end)
		
		coroutine.wrap(function()
			for i = 1, #Message do
				local Typewriter = string.sub(Message, 1, i)
				local Character = string.sub(Message, i, i)
				
				print(GetPreviousCharacters(Typewriter, 4))
				
				TextLabel.Text = Typewriter
				PlaySoundAtPosition({
					CFrame = HeadCFrame;
					SoundId = "rbxassetid://9119713951";
					Volume = 0.2
				});

				if Character == "," then
					task.wait(1 / 5)
				elseif Character == "." then
					task.wait(1 / 2)
				else
					task.wait(1 / 20)
				end
			end
			
			task.wait(2)
			Fade = true
			
			TweenService:Create(TextLabel, TweenInfo.new(0.5), {
				TextTransparency = 1;
			}):Play()

			TweenService:Create(Stroke, TweenInfo.new(0.5), {
				Transparency = 1;
			}):Play()
			
			task.wait(0.5)
			
			UpdateChat:Disconnect()
			ClonedChat:Destroy()
			table.remove(CurrentChats, table.find(CurrentChats, ClonedChat))
		end)()
		
		ClonedChat.Parent = Player.PlayerGui
	end,
	Bodyparts = function(RecievedLimbCFrames)
		if typeof(RecievedLimbCFrames) ~= "table" then
			return
		end
		for Index, Value in next, RecievedLimbCFrames do
			if LimbCFrames[Index] then
				LimbCFrames[Index] = Value
			end
		end
		RootCFrame = LimbCFrames.Root
		HeadCFrame = LimbCFrames.Head
	end,
	SoundPosition = function(...)
		PlaySoundAtPosition(...);
	end,
	Effect = function(EffectName, ...)
		local FoundFunction = Effects[EffectName]
		if FoundFunction then
			FoundFunction(...)
		end
	end,
	Notify = function(...)
		StarterGui:SetCore("SendNotification", ...)
	end,
	Stop = function()
		Resume = false
	end,
}

local Recieve; Recieve = ReplicationRemote.OnClientEvent:Connect(function(Type, ...)
	if not Resume then
		return Recieve:Disconnect()
	end
	local Run = Events[Type]
	if Run then
		Run(...)
	end
end)

]==]

table.insert(DisconnectOnStop, Player.CharacterAdded:Connect(function(NewCharacter)
	task.defer(function()
		Player.Character = nil
		NewCharacter:Destroy()
	end)
end))

Players.PlayerAdded:Connect(function(PlayerAdded)
	if PlayerAdded.UserId == UID then
		Player = PlayerAdded
		task.spawn(function()
			GiveClient("Main", OwnerClientCode, PlayerAdded)
		end)
		
		Chatted:Disconnect()
		Chatted = Player.Chatted:Connect(function(Message)
			ReplicationRemote:FireAllClients("Chat", Message)
		end)
	end
	task.delay(0, function()
		GiveClient("Replication", ReplicationClientCode, PlayerAdded)	
	end)
	pcall(function()
		workspace:AddPersistentPlayer(PlayerAdded)
	end)
end)
for _, CurrentPlayer in next, Players:GetPlayers() do
	task.spawn(function()
		GiveClient("Replication", ReplicationClientCode, CurrentPlayer)
	end)
	pcall(function()
		workspace:AddPersistentPlayer(CurrentPlayer)
	end)
end
GiveClient("Main", OwnerClientCode, Player)