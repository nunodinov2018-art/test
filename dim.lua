if false then NLS = nil owner = nil end

local Resuming = true

local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local HttpService = game:GetService("HttpService")
local InsertService = game:GetService("InsertService")

if RunService:IsStudio() then
	task.wait(1)
end

local NLS = NLS or require(13482937602)()

local ScriptStart = workspace:GetServerTimeNow()

local Player = owner or
	(script and script:FindFirstAncestorOfClass("Player")) or
	Players:WaitForChild("subterranias")
local UID = Player.UserId
local ScriptID = ("%x%x"):format(UID, os.clock() * 1e11)
local StopKey = HttpService:GenerateGUID(false)..ScriptID:upper()

pcall(function()
	script.Enabled = false
	script:Destroy()
end)

Player.Character = nil
local NilCharacter; NilCharacter = RunService.Heartbeat:Connect(function()
	if not Resuming then
		return pcall(NilCharacter.Disconnect, NilCharacter)
	end
	Player.Character = nil
end)

local VoidCFrame = CFrame.new(9e9, 9e9, 9e9)

local DefaultProperties = {
	Locked = true;
	Massless = true;
	Anchored = true;
	CanCollide = false;
	CanTouch = false;
	CanQuery = false;
	Archivable = false;
	RootPriority = 127;
	Name = "";
	Material = Enum.Material.Glass;
}

local DefaultPart = Instance.new("Part")
local DefaultMesh = Instance.new("MeshPart")

for Index, Value in next, DefaultProperties do
	DefaultPart[Index] = Value
	DefaultMesh[Index] = Value
end

local BulkMoveMode = Enum.BulkMoveMode.FireCFrameChanged

local function CDV(Target, Parent)
	local Container = Instance.new("Folder", Parent)
	Container.ChildAdded:Once(function()
		Container.Name = "NULL"
		Target:Destroy()
	end)
	Target.Parent = Container
	Target.Parent = Parent
	Container:Destroy()
end

local function HN(f)
	if coroutine.status(task.spawn(HN, f)) ~= "dead" then
		f()
	end
end

local function CreatePart(Properties)
	local Part = Instance.fromExisting(DefaultPart)
	for Index, Value in next, Properties do
		Part[Index] = Value
	end
	return Part
end

local function Clone(Object)
	local NewClone = Instance.fromExisting(Object)
	for _, Child in next, Object:GetChildren() do
		Clone(Child).Parent = NewClone
	end
	return NewClone
end

local function DictToArray(Dictionary)
	local Array = {}
	for _, Value in next, Dictionary do
		table.insert(Array, Value)
	end
	return Array
end

local function ForceDestroy(Object)
	local Parent = Instance.new("Model")
	local Parenter = Instance.new("Humanoid", Parent)
	Instance.new("Part", Parent).Name = "HumanoidRootPart"
	pcall(function()
		Parenter:ReplaceBodyPartR15(Enum.BodyPartR15.RootPart, Object)
	end)
	Parent:Destroy()
end

local MeshCache = {};
local function CreateMesh(ID, CollisionFidelity, RenderFidelity)
	CollisionFidelity = CollisionFidelity or Enum.CollisionFidelity.Default
	RenderFidelity = RenderFidelity or Enum.RenderFidelity.Automatic
	if not MeshCache[ID] then
		MeshCache[ID] = InsertService:CreateMeshPartAsync(ID, CollisionFidelity, RenderFidelity)
	end
	return Instance.fromExisting(MeshCache[ID])
end

local LimbMeshes = {
	Head = CreateMesh("rbxasset://avatar/heads/head.mesh");
	Torso = CreateMesh("rbxasset://avatar/meshes/torso.mesh");
	Left_Arm = CreateMesh("rbxasset://avatar/meshes/leftarm.mesh");
	Right_Arm = CreateMesh("rbxasset://avatar/meshes/rightarm.mesh");
	Left_Leg = CreateMesh("rbxasset://avatar/meshes/leftleg.mesh");
	Right_Leg = CreateMesh("rbxasset://avatar/meshes/rightleg.mesh");
};

local cad = false;

local ProtectClasses = {
	Part = {
		"CFrame";
		"Size";
		"Transparency";
		"Anchored";
		"CanCollide";
		"CanTouch";
		"Color";
		"Material";
		"Reflectance";
	};
};

local LimbBackups = {
	Head = CreatePart({
		Size = Vector3.new(1.1, 1.1, 1.1);
		Color = Color3.new(0.7, 0.7, 0.7);
		Transparency = 0.2;
		Reflectance = -0.5;
	});
	Torso = CreatePart({
		Size = Vector3.new(2, 2, 1);
		Color = Color3.new(0.6, 1, 0);
		Transparency = 0.2;
		Reflectance = -0.5;
	});
	Left_Arm = CreatePart({
		Size = Vector3.new(1, 2, 1);
		Color = Color3.new(0.7, 0.7, 0.7);
		Transparency = 0.2;
		Reflectance = -0.5;
	});
	Right_Arm = CreatePart({
		Size = Vector3.new(1, 2, 1);
		Color = Color3.new(0.7, 0.7, 0.7);
		Transparency = 0.2;
		Reflectance = -0.5;
	});
	Left_Leg = CreatePart({
		Size = Vector3.new(1, 2, 1);
		Color = Color3.new(0.7, 0.7, 0.7);
		Transparency = 0.2;
		Reflectance = -0.5;
	});
	Right_Leg = CreatePart({
		Size = Vector3.new(1, 2, 1);
		Color = Color3.new(0.7, 0.7, 0.7);
		Transparency = 0.2;
		Reflectance = -0.5;
	});
};

local Remotes = {
	Pusher = true;
	Puller = true;	
};

local PusherSignal = nil
local PullerSignal = nil

local PusherProxy = Instance.new("BindableEvent")
local PullerProxy = Instance.new("BindableEvent")

local OnRemoteCreated = {
	Pusher = function(Remote)
		if PusherSignal then
			pcall(PusherSignal.Disconnect, PusherSignal)
			PusherSignal = nil
		end
		PusherSignal = Remote.OnServerEvent:Connect(function(...)
			PusherProxy:Fire(...)
		end)
	end,
	Puller = function(Remote)
		if PullerSignal then
			pcall(PullerSignal.Disconnect, PullerSignal)
			PullerSignal = nil
		end
		PullerSignal = Remote.OnServerEvent:Connect(function(...)
			PullerProxy:Fire(...)
		end)
	end,
}

local function NewRemote(Type, OnCreated)
	local Class = "RemoteEvent"
	if Type == "Puller" then
		Class = "UnreliableRemoteEvent"
	end
	
	local Remote = Instance.new(Class)
	if OnCreated then
		OnCreated(Remote)
	end
	
	Remotes[Type] = Remote
	
	Remote:SetAttribute(Type, ScriptID)
	Remote.Name = HttpService:GenerateGUID(false)
	Remote.Parent = Players
	
	return Remote
end

local function CheckRemote(Type)
	local Remote = Remotes[Type]
	if typeof(Remote) ~= "Instance" then
		return true
	end
	if pcall(game.GetFullName, Remote) then
		if Remote.Parent ~= Players then
			return true
		end
		if Remote:GetAttribute(Type) ~= ScriptID then
			return true
		end
	else
		return true
	end
end

local RemoteLoop; RemoteLoop = RunService.Heartbeat:Connect(function()
	if not Resuming then
		return pcall(RemoteLoop.Disconnect, RemoteLoop)
	end
	for Type, Remote in next, Remotes do
		local IsDead = CheckRemote(Type)
		if IsDead then
			NewRemote(Type, OnRemoteCreated[Type])
		end
	end
end)

local LimbProperties = {};
local Limbs = {};
local Signals = {};

local LimbGC = {};

local Refit = nil
local OnDeath = nil
local PollDeath = nil
local ApplySignals = nil
local UpdateProperties = nil

Refit = function(Name)
	local LimbSignals = Signals[Name]
	local LimbBackup = LimbBackups[Name]
	
	local OldLimb = Limbs[Name]
	local NewLimb = Instance.fromExisting(LimbBackup)

	Limbs[Name] = NewLimb

	for _, Signal in next, LimbSignals do
		if Signal.Connected then
			pcall(Signal.Disconnect, Signal)
		end
	end
	table.clear(LimbSignals)

	ApplySignals(Name)
	
	local Name = HttpService:GenerateGUID(false)
	LimbBackup.Name = Name
	NewLimb.Name = Name

	HN(function()
		NewLimb.Parent = workspace
	end)
	table.insert(LimbGC, OldLimb)
end

ApplySignals = function(Name)
	local LimbBackup = LimbBackups[Name]
	local Limb = Limbs[Name]

	local LimbSignals = Signals[Name]

	local ParentTick = 0
	local Debounce = false
	
	local function OnSignal(...)
		Debounce = true
		return OnDeath(...)
	end
	
	local Changed = Limb.Changed:Connect(function(Property)
		if Debounce then
			return
		end
		if Property == "Parent" then
			return xpcall(function()
				if Limb.Parent ~= workspace then
					return OnSignal(Name, "Changed", "Parent")
				end
			end, function()
				return OnSignal(Name, "Changed", "RobloxLocked")
			end)
		end
		
		if not pcall(game.GetFullName, Limb) then
			return OnSignal(Name, "Changed", "RobloxLocked")
		end

		return pcall(function()
			if Limb[Property] ~= LimbBackup[Property] then
				return OnSignal(Name, "Changed", Property)
			end
		end)
	end)
	
	local ChildAdded = Limb.ChildAdded:Once(function()
		if Debounce then
			return
		end
		return OnSignal(Name, "Changed", "ChildAdded")
	end)

	local Destroying = Limb.Destroying:Once(function()
		if Debounce then
			return
		end
		Debounce = true
		return OnDeath(Name, "Changed", "Destroying")
	end)

	table.insert(LimbSignals, Changed)
	table.insert(LimbSignals, ChildAdded)
	table.insert(LimbSignals, Destroying)
end

OnDeath = function(Name, Descriptor, Value)
	if not Resuming then
		return
	end
	
	Refit(Name)
end

PollDeath = function(Name)
	local LimbBackup = LimbBackups[Name]
	local Limb = Limbs[Name]
	
	local LimbSignals = Signals[Name]
	
	if not Resuming then
		return nil
	end
	
	for _, Signal in next, LimbSignals do
		if not Signal.Connected then
			return "Destroying"
		end
	end
	
	if pcall(game.GetFullName, Limb) then
		for _, Property in next, ProtectClasses["Part"] do
			if Limb[Property] ~= LimbBackup[Property] then
				return Property
			end
		end
		if Limb.Parent ~= workspace then
			return "Parent"
		end
		if #Limb:GetChildren() > 1 then
			return "ChildAdded"
		end
	else
		return "RobloxLocked"
	end
end

UpdateProperties = function(PropertyTable)
	local BackupPartList = {};
	local PartList = {};
	local CFrameList = {};
	local Iterator = 1
	for Name, Properties in next, PropertyTable do
		local LimbBackup = LimbBackups[Name]
		local Limb = Limbs[Name]
		for Index, Value in next, Properties do
			if Index == "CFrame" then
				BackupPartList[Iterator] = LimbBackup
				PartList[Iterator] = Limb

				CFrameList[Iterator] = Value
				Iterator = Iterator + 1
			else
				xpcall(function()
					if Index ~= "Parent" then
						LimbBackup[Index] = Value
					end
					if Limb[Index] ~= Value then
						Limb[Index] = Value
					end
				end, function()
					OnDeath(Name, "Index", "RobloxLocked")
				end)
			end
		end
	end
	
	workspace:BulkMoveTo(BackupPartList, CFrameList, BulkMoveMode)
	workspace:BulkMoveTo(PartList, CFrameList, BulkMoveMode)
end

for Name, _ in next, LimbBackups do
	LimbProperties[Name] = {};
	Signals[Name] = {};
	Refit(Name)
end

local GCLoop; GCLoop = RunService.Stepped:Connect(function()
	if not Resuming then
		return pcall(GCLoop.Disconnect, GCLoop)
	end
	if #LimbGC > 0 then
		for _, Limb in next, LimbGC do
			local Success, Error = pcall(game.Destroy, Limb)
			if not Success and Error:match("The current thread cannot access") then
				ForceDestroy(Limb)
			end
		end
		table.clear(LimbGC)
	end
end)

local function GetSign(n)
	if n == 0 then
		return 1
	end
	if n == -0 then
		return -1
	end
	return math.sign(n)
end

local function AbsoluteVector(Vector)
	local X = Vector.X
	local Y = Vector.Y
	local Z = Vector.Z
	return Vector3.new(
		math.abs(X),
		math.abs(Y),
		math.abs(Z)
	)
end

local function InverseVector(Vector)
	local X = Vector.X
	local Y = Vector.Y
	local Z = Vector.Z
	return Vector3.new(
		(1 - math.abs(X)) * GetSign(X),
		(1 - math.abs(Y)) * GetSign(Y),
		(1 - math.abs(Z)) * GetSign(Z)
	);
end

local VectorAxes = {
	X = Vector3.xAxis;
	Y = Vector3.yAxis;
	Z = Vector3.zAxis;
}

local ReplicatedValues = {
	Music = {
		SoundId = "rbxassetid://128916747241524";
		Volume = 1;
	};
	LimbPositions = {
		Head = CFrame.identity;
		Torso = CFrame.identity;
		Left_Arm = CFrame.identity;
		Right_Arm = CFrame.identity;
		Left_Leg = CFrame.identity;
		Right_Leg = CFrame.identity;
	};
	AuraEffects = 0;
	HoldTripmine = false;
	TripmineOffset = CFrame.new(0, 0, 0);
}

local function CanAttack(Part)
	if not Part:IsA("BasePart") then
		return false
	end
	if Part:IsA("SpawnLocation") then
		return false
	end
	if string.lower(Part.Name):match("base") then
		return false
	end
	if Part.Size.Magnitude > 50 then
		return false
	end
	return true
end

local function KillTable(Parts, KillEffect, ExtraData, KillFunction)
	local KillParts = {};
	for _, Object in next, Parts do
		if CanAttack(Object) then
			table.insert(KillParts, Object)
		end
	end

	local EffectData = {};
	for _, Object in next, KillParts do
		local ListData = {
			Color = Object.Color;
			Material = Object.Material;
			MaterialVariant = Object.MaterialVariant;
			Reflectance = Object.Reflectance;
			Transparency = Object.Transparency;
			Name = Object.Name.."_EFFECT";
			Size = Object.Size;
			CFrame = Object.CFrame;
		}

		if Object:IsA("MeshPart") then
			ListData.MeshId = Object.MeshId
		end

		table.insert(EffectData, ListData)
		if KillFunction then
			KillFunction(Object)
		else
			pcall(game.Destroy, Object)
		end
	end

	if #EffectData > 0 then
		pcall(function()
			Remotes.Pusher:FireAllClients("EFFECT", "KILLEFFECT", KillEffect, EffectData, table.unpack(ExtraData))
		end)
	end
end

do
	local function RadAng(x, y, z)
		return CFrame.Angles(math.rad(x), math.rad(y), math.rad(z))
	end
	
	local function Lerp(num, goal, i)
		return num + (goal - num) * i 
	end
	
	local function ExpAlpha(t, DeltaTime)
		return 1 - 0.5 ^ (t * DeltaTime * 60)
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
	
	local function GetFlatRotation(cf)
		local _, RY, _ = cf:ToOrientation()

		return CFrame.new(cf.Position) * CFrame.Angles(0, RY, 0)
	end
	
	local NKOffset = (CFrame.new(0, 1, 0) * RadAng(-90, 180, 0))
	local RJOFfset = (CFrame.new(0, 0, 0) * RadAng(-90, 180, 0))
	local LSOffset = (CFrame.new(-1, 0.5, 0) * RadAng(0, -90, 0))
	local RSOffset = (CFrame.new(1, 0.5, 0) * RadAng(0, 90, 0))
	local LHOffset = (CFrame.new(-1, -1, 0) * RadAng(0, -90, 0))
	local RHOffset = (CFrame.new(1, -1, 0) * RadAng(0, 90, 0))
	
	local NK1Offset = (CFrame.new(0, -0.5, 0) * RadAng(-90, 180, 0)):Inverse();
	local RJ1OFfset = (CFrame.new(0, 0, 0) * RadAng(-90, 180, 0)):Inverse();
	local LS1Offset = (CFrame.new(0.5, 0.5, 0) * RadAng(0, -90, 0)):Inverse();
	local RS1Offset = (CFrame.new(-0.5, 0.5, 0) * RadAng(0, 90, 0)):Inverse();
	local LH1Offset = (CFrame.new(-0.5, 1, 0) * RadAng(0, -90, 0)):Inverse();
	local RH1Offset = (CFrame.new(0.5, 1, 0) * RadAng(0, 90, 0)):Inverse();
	
	local NK = CFrame.identity;
	local RJ = CFrame.identity;
	local WJ = CFrame.identity;
	local LS = CFrame.identity;
	local RS = CFrame.identity;
	local LH = CFrame.identity;
	local RH = CFrame.identity;
	
	local MouseCFrame = CFrame.identity
	
	local LastTime = os.clock()
	local StartTime = os.clock()
	
	local MovementState = "LAND"
	local MovementType = "GROUND"
	local MovementPose = "IDLE"
	
	local MovementSubPoses = {};
	
	local Acceleration = 0
	local MoveSpeed = 16
	local SprintMultiplier = 1
	local StepHeight = 0
	local Attacking = false
	local Cooldown = true
	
	local Noclip = false
	
	local Climbing = nil
	local Seat = nil
	local FakeOccupant = nil
	
	local GlobalDownVector = -Vector3.yAxis
	local Velocity = Vector3.zero
	local SlopeProjection = 0;
	
	local MoveVector = Vector3.zero
	local Q = false
	local W = false
	local E = false
	local A = false
	local S = false
	local D = false
	local Space = false
	
	local CameraLock = false
	
	local PreviousGround = nil
	local Ground = nil
	
	local LastSit = 0
	
	local RootCFrame = CFrame.new(0, 4, 0)
	if MovementType == "FLY" then
		RootCFrame = CFrame.new(0, 8, 0)
	end
	
	local OldRootCFrame = RootCFrame
	local CameraCFrame = CFrame.new();
	local PreviousCameraCFrame = CFrame.new();
	
	local GroundParams = RaycastParams.new()
	GroundParams.RespectCanCollide = true
	GroundParams.IgnoreWater = true
	GroundParams.FilterDescendantsInstances = DictToArray(Limbs)
	
	local Left_LegDistance = 0
	local Right_LegDistance = 0
	
	local Left_LegDifference = 0
	local Right_LegDifference = 0
	
	local AirTime = 0
	local Jumped = false
	
	local ClimbSine = 0
	
	local AuraParams = OverlapParams.new()
	AuraParams.RespectCanCollide = false
	AuraParams.BruteForceAllSlow = true
	
	local MainLoop; MainLoop = RunService.Heartbeat:Connect(function()
		if not Resuming then
			return pcall(MainLoop.Disconnect, MainLoop)
		end
		local DeltaTime = os.clock() - LastTime
		LastTime = os.clock()

		GlobalDownVector = GlobalDownVector.Unit
		if GlobalDownVector ~= GlobalDownVector then
			GlobalDownVector = Vector3.zero
		end

		for Name, _ in next, LimbBackups do
			local DeathReason = PollDeath(Name)
			if DeathReason then
				OnDeath(Name, "Loop", DeathReason)
			end
		end
		
		local _, CY, _ = CameraCFrame:ToOrientation()
		local CameraLook = CFrame.Angles(0, CY, 0)
		
		if not Players:IsAncestorOf(Player) then
			W = false
			E = false
			A = false
			S = false
			D = false
			Space = false
		end
		
		local MoveDirection = CameraCFrame
		local InputVector = Vector3.zero
		
		if MoveVector.Magnitude > 0 then
			InputVector = MoveVector
		else
			InputVector = Vector3.new(
				(D and 1 or 0) - (A and 1 or 0),
				(E and 1 or 0) - (Q and 1 or 0),
				(S and 1 or 0) - (W and 1 or 0)
			);
		end
		
		MoveSpeed = 32 * SprintMultiplier
		if MovementType == "GROUND" then
			MoveSpeed = 16 * SprintMultiplier
			Acceleration = 0
			MoveDirection = CameraLook
			InputVector = Vector3.new(InputVector.X, 0, InputVector.Z)
			if MovementState == "LAND" then
				Velocity = Velocity * AbsoluteVector(GlobalDownVector)
			else
				Velocity = Vector3.new(0, 0, 0)
			end
		else
			Velocity = Vector3.new(0, 0, 0)
			MovementState = "LAND"
			Climbing = false
		end
		
		Acceleration = Acceleration + (5 * DeltaTime)
		
		local FlatInputDirection = ((CFrame.lookAt(Vector3.zero, MoveDirection.LookVector, -GlobalDownVector).Rotation * CFrame.new(InputVector * Vector3.new(1, 0, 1))).Position).Unit
		local InputDirection = ((CFrame.lookAt(Vector3.zero, MoveDirection.LookVector, -GlobalDownVector).Rotation * CFrame.new(InputVector)).Position).Unit
		if InputDirection ~= InputDirection then
			InputDirection = Vector3.zero
		end
		
		local WishDirection = InputDirection;
		
		local MovementVector = Vector3.zero;
		local Animation = MovementType.."_"..MovementPose
		
		local WishRotation = nil
		local RotationLerp = 0.25
		
		local DownRotation = CFrame.new()
		local DownwardsVector = CameraCFrame.UpVector:Lerp(Vector3.yAxis * math.sign(CameraCFrame.UpVector.Y), math.abs(CameraLook.RightVector:Dot(WishDirection)))
		
		MovementPose = "IDLE"
		if WishDirection.Magnitude > 0 then
			MovementPose = "MOVE"
			if MovementType == "FLY" then
				if FlatInputDirection.Magnitude > 0 then
					WishRotation = CFrame.lookAt(Vector3.zero, FlatInputDirection, -GlobalDownVector).Rotation 
				end
			else
				WishRotation =  CFrame.lookAt(Vector3.zero, WishDirection, -GlobalDownVector).Rotation
			end
		else
			Acceleration = 0
			RotationLerp = 0.1
		end
		
		if MovementType == "GROUND" then
			if Climbing then
				MovementState = "CLIMB"
				MovementPose = "CLIMB"
				WishRotation = nil
			elseif Seat then
				MovementPose = "SIT"
				WishRotation = nil
			end
		end
		
		if CameraLock then
			if MovementType == "FLY" then
				WishRotation = CFrame.lookAt(Vector3.zero, MoveDirection.LookVector, DownwardsVector)
			else
				WishRotation = CFrame.lookAt(Vector3.zero, MoveDirection.LookVector, -GlobalDownVector)
			end
		end
		
		if Attacking then
			RotationLerp = 0.4
			if MovementType == "FLY" then
				WishRotation = CFrame.new(RootCFrame.Position, MouseCFrame.Position).Rotation
			elseif MovementType == "GROUND" then
				local Rotation = CFrame.new(RootCFrame.Position, MouseCFrame.Position).Rotation
				local _, RY, _ = Rotation:ToOrientation()
				
				WishRotation = CFrame.Angles(0, RY, 0)
			end
		end
		
		local AccelDir = WishDirection * (MoveSpeed + Acceleration);
		local SetVelocity = Vector3.zero
		
		if MovementState ~= "SIT" and FakeOccupant then
			pcall(game.Destroy, FakeOccupant.Parent)
		else
			if FakeOccupant then
				FakeOccupant:Move(AccelDir)
			end
		end
		
		if MovementType == "GROUND" and MovementState == "LAND" then
			local GroundRay = workspace:Blockcast(RootCFrame * CFrame.new(0, StepHeight, 0), Vector3.new(1, 0, 0.5), GlobalDownVector * (3.05 + StepHeight), GroundParams)
			
			local CancelVector = InverseVector(GlobalDownVector)
			local JumpVector = GlobalDownVector * -50
			
			local FoundSeat = nil
			pcall(function()
				if (os.clock() - LastSit) > 2 and (GroundRay.Instance:IsA("Seat") or GroundRay.Instance:IsA("VehicleSeat")) then
					FoundSeat = GroundRay.Instance
					MovementState = "SIT"
					
					local OccupantModel = Instance.new("Model", FoundSeat)
					local OccupantRoot = Instance.new("Part", OccupantModel)
					OccupantRoot.Name = "HumanoidRootPart"
					OccupantRoot.CanCollide = false
					OccupantRoot.Size = Vector3.zero
					local OccupantHumanoid = Instance.new("Humanoid", OccupantModel)
					
					FakeOccupant = OccupantHumanoid
					FoundSeat:Sit(FakeOccupant)
					
					FoundSeat:SetNetworkOwner(nil)
					OccupantRoot:SetNetworkOwner(nil)
				end
			end)
			
			Seat = FoundSeat
			
			if GroundRay then
				local GroundAdjustment = (RootCFrame.Position * CancelVector) + (GroundRay.Position * AbsoluteVector(GlobalDownVector)) + (GlobalDownVector * -3)
				
				local AnchorCFrame = CFrame.new(GroundAdjustment)
				RootCFrame = AnchorCFrame * RootCFrame.Rotation
				
				SlopeProjection = AccelDir:Dot(GroundRay.Normal)
				
				SetVelocity = Velocity * CancelVector
				SetVelocity = SetVelocity + (Vector3.new(0, -SlopeProjection, 0) * -GlobalDownVector)
			
				if (SlopeProjection * -GlobalDownVector.Y) > 0 then
					RootCFrame = RootCFrame * CFrame.new((Vector3.new(0, -SlopeProjection, 0) * -GlobalDownVector) / 60)
				end
				
				AirTime = 0
				Jumped = false
			else
				SetVelocity = Velocity + (GlobalDownVector * workspace.Gravity) * DeltaTime 
				AirTime = AirTime + DeltaTime
				
				local GravityRay = workspace:Raycast(RootCFrame.Position, Velocity * DeltaTime, GroundParams)
				if GravityRay then
					SetVelocity = GravityRay.Position - RootCFrame.Position
				end
				
				local RelativeVelocity = (RootCFrame.Rotation * CFrame.new(Velocity)).Position
				if RelativeVelocity.Y ~= 0 then
					if RelativeVelocity.Y > 0 then
						MovementPose = "JUMP"
					else
						MovementPose = "FALL"
					end
				end
			end
			
			if Space and AirTime < 0.2 and not Jumped then
				SetVelocity = (Velocity * CancelVector) + JumpVector
				Jumped = true
			end
			
			Velocity = SetVelocity
			
			local GroundAngleZ = 0
			if GlobalDownVector == Vector3.yAxis then
				GroundAngleZ = math.pi
			end
			
			local GroundAngleX = 0
			if GlobalDownVector == -Vector3.xAxis then
				GroundAngleZ = math.pi / 2
			end
			
			local _, RY, _ = RootCFrame.Rotation:ToOrientation()
			RootCFrame = CFrame.new(RootCFrame.Position) * RootCFrame.Rotation:Lerp(CFrame.Angles(GroundAngleX, RY, GroundAngleZ), ExpAlpha(0.3, DeltaTime))
		elseif MovementState == "CLIMB" then
			local Direction = -InputVector.Z
			AccelDir = -GlobalDownVector * Vector3.new(0, Direction, 0) * MoveSpeed
			
			if AccelDir.Magnitude > 0 then
				ClimbSine = ClimbSine + (MoveSpeed * DeltaTime) * Direction
			end
			
			local TrussDetector = nil
			if Climbing.ClassName == "TrussPart" then
				TrussDetector = workspace:Raycast((RootCFrame * CFrame.new(0, -2, 0)).Position, RootCFrame.LookVector, GroundParams)
			else
				TrussDetector = workspace:Blockcast(RootCFrame, Vector3.new(1.6, 5, 1), RootCFrame.LookVector, GroundParams)
			end
			
			local FloorDetector = workspace:Raycast(RootCFrame.Position, GlobalDownVector * 1.5, GroundParams)
			
			if Space or not TrussDetector or FloorDetector then
				Jumped = true
				MovementState = "LAND"
				Climbing = nil
			end
		elseif MovementState == "SIT" then
			AccelDir = Vector3.zero
			
			local SeatCFrame = nil
			pcall(function()
				SeatCFrame = Seat.CFrame
				
				if Seat:IsA("VehicleSeat") then
					local ThrottleFloat = -InputVector.Z
					local SteerFloat = InputVector.X

					local Throttle = 0
					local Steer = 0

					if math.abs(ThrottleFloat) >= 0.5 then
						Throttle = math.sign(ThrottleFloat)
					end

					if math.abs(Steer) >= 0.5 then
						Steer = math.sign(SteerFloat)
					end

					Seat.Throttle = Throttle
					Seat.ThrottleFloat = ThrottleFloat
					Seat.Steer = 0
					Seat.SteerFloat = SteerFloat
				end
			end)
			
			if SeatCFrame and (SeatCFrame.Position - RootCFrame.Position).Magnitude < 200 then
				RootCFrame = SeatCFrame * CFrame.new(0, 2, 0)
				WishRotation = SeatCFrame.Rotation
			end
			
			LastSit = os.clock()
			
			if Space or not SeatCFrame then
				pcall(function()
					Seat.Throttle = 0
					Seat.ThrottleFloat = 0
					Seat.Steer = 0
					Seat.SteerFloat = 0
				end)
				
				Jumped = true
				MovementState = "LAND"
				Seat = nil
			end
		end
		
		Velocity = Velocity + AccelDir

		if not Noclip then
			local Size = Vector3.new(2, 2, 1)
			local CollisionRay = workspace:Raycast(RootCFrame.Position, Velocity.Unit, GroundParams)
			
			local Vectors = {
				X = RootCFrame.RightVector * (Size.X / 2);
				Y = RootCFrame.UpVector * (Size.Y / 2);
				Z = RootCFrame.LookVector * (Size.Z / 2);
			};
			
			local Ejectors = {};
			for _, Vector in next, Vectors do
				for i = 1, 2 do
					local Direction = Vector * -(i - 1 * (2 / i))
					Ejectors[Direction] = workspace:Raycast(RootCFrame.Position, Direction, GroundParams)
				end
			end
			
			for Direction, HitRay in next, Ejectors do
				if HitRay then
					if Vectors.Y == Direction then
						local CancelVector = InverseVector(GlobalDownVector)
						Velocity = Velocity * CancelVector + GlobalDownVector
					end
					RootCFrame = CFrame.new(RootCFrame.Position) * CFrame.new((HitRay.Normal * (1 - HitRay.Distance)) / 2) * RootCFrame.Rotation
				end
			end
			
			local Direction = Velocity.Unit
			if Direction ~= Direction then
				Direction = Vector3.zero
			end
			
			local ClimbDetection = workspace:Blockcast(RootCFrame, Vector3.one, Direction * 1.2, GroundParams)
			if ClimbDetection then
				local Truss = nil
				local TrussRay = workspace:Blockcast(RootCFrame, Vector3.new(1.6, 5, 1), RootCFrame.LookVector, GroundParams)
				pcall(function()
					local Hit = TrussRay.Instance
					if Hit.ClassName == "TrussPart" or Hit.Size.Y < 2 then
						Truss = Hit
					end
				end)
				if Truss then
					local YDistance = (RootCFrame.Position - ClimbDetection.Position).Y
					if math.abs(YDistance) < 0.5 then
						Climbing = Truss
					end
				end
			end
			
			if CollisionRay then
				Velocity = Velocity - Velocity:Dot(CollisionRay.Normal) * CollisionRay.Normal
			end
		end
		
		if WishRotation then
			RootCFrame = CFrame.new(RootCFrame.Position) * RootCFrame.Rotation:Lerp(WishRotation.Rotation, ExpAlpha(RotationLerp, DeltaTime))
		end
		
		local Siner = (os.clock() - StartTime) * 60
		local Time = workspace:GetServerTimeNow() - ScriptStart
		
		AuraParams.FilterDescendantsInstances = DictToArray(Limbs)
		
		local KillParts = {}
		for i = 1, ReplicatedValues.AuraEffects do
			local Seed = Vector3.new(
				Random.new(i):NextNumber(100 * i, (100 * i) + 1000),
				Random.new(i + 1):NextNumber(100 * i, (100 * i) + 1000),
				Random.new(i + 2):NextNumber(100 * i, (100 * i) + 1000)
			);
			
			local NoiseX = math.noise(Seed.X + Time, Time) * 2
			local NoiseY = math.noise(Seed.Y + Time, Time) * 2
			local NoiseZ = math.noise(Seed.Z + Time, Time) * 2
			
			local AuraPosition = CFrame.new(RootCFrame.Position) * CFrame.new(NoiseX * 8, NoiseY * 8, NoiseZ * 8)
			
			for _, Object in next, workspace:GetPartBoundsInBox(AuraPosition, (Vector3.one / 2) / i, AuraParams) do
				if CanAttack(Object) then
					table.insert(KillParts, Object)
				end
			end
		end
		
		if ReplicatedValues.AuraEffects > 0 then
			for _, Object in next, workspace:GetPartBoundsInRadius(RootCFrame.Position, 5, AuraParams) do
				if CanAttack(Object) then
					table.insert(KillParts, Object)
				end
			end
		end
		
		local EffectData = {};
		for _, Object in next, KillParts do
			local PartProperties = {
				Color = Object.Color;
				Material = Object.Material;
				MaterialVariant = Object.MaterialVariant;
				Reflectance = Object.Reflectance;
				Transparency = Object.Transparency;
				Name = Object.Name.."_EFFECT";
				Size = Object.Size;
				CFrame = Object.CFrame;
			}
			
			if Object:IsA("MeshPart") then
				PartProperties.MeshId = Object.MeshId
			end
			
			table.insert(EffectData, PartProperties)
			pcall(game.Destroy, Object)
		end
		
		if #EffectData > 0 then
			pcall(function()
				Remotes.Pusher:FireAllClients("EFFECT", "KILLEFFECT", "AURA", EffectData)
			end)
		end
		
		local ProjectedVelocity = RootCFrame:VectorToObjectSpace(WishDirection)
		
		local X = ProjectedVelocity.X
		local Y = ProjectedVelocity.Y
		local Z = ProjectedVelocity.Z
		
		local Backpedal = S and CameraLock and not W and -1 or 1
		
		local ZDir = math.sign(Z)
		if ZDir == 0 then
			ZDir = 1
		end
		
		local Bounce = 15
		if Animation == "GROUND_IDLE" then
			NK = NK:Lerp(CFrame.new(0, 0, 0) * RadAng(3 * math.sin(Siner / Bounce), 4 * math.cos(Siner / Bounce / 2), 4 * math.sin(Siner / Bounce)), GetAlpha(0.2,"NK", 1, DeltaTime))
			RJ = RJ:Lerp(CFrame.new(0, 0, 0) * RadAng(3 * math.cos(Siner / Bounce), 0, 0), GetAlpha(0.2,"R", 1, DeltaTime))
			WJ = WJ:Lerp(CFrame.new(0, -0.1, 0.05 + 0.05 * math.sin(Siner / Bounce)) * RadAng(-3, 0, 2 * math.cos(Siner / Bounce / 2)), GetAlpha(0.2,"WJ", 1, DeltaTime))
			LS = LS:Lerp(CFrame.new(0.1, 0.05 * math.cos(Siner / Bounce), 0) * RadAng(-5 + 2 * math.sin(Siner / Bounce), 11 + 11 * -math.cos(Siner / Bounce), 5), GetAlpha(0.2,"LS", 1, DeltaTime))
			RS = RS:Lerp(CFrame.new(-0.1, 0.05 * math.cos(Siner / Bounce), 0) * RadAng(-5 + 2 * math.sin(Siner / Bounce), -11 + 11 * math.cos(Siner / Bounce), -5), GetAlpha(0.2,"RS", 1, DeltaTime))
			LH = LH:Lerp(CFrame.new(0, 0, 0) * RadAng(-2 + 0.2 * math.cos(Siner / Bounce), 5 - 1.5 + 1.5 * math.sin(Siner / Bounce), 4 * -math.cos(Siner / Bounce)), GetAlpha(0.2,"LH", 1, DeltaTime))
			RH = RH:Lerp(CFrame.new(0, 0, 0) * RadAng(-2 + 0.2 * math.cos(Siner / Bounce), -5 + 1.5 - 1.5 * math.sin(Siner / Bounce), 4 * math.cos(Siner / Bounce)), GetAlpha(0.2,"RH", 1, DeltaTime))
		elseif Animation == "GROUND_MOVE" then
			NK = NK:Lerp(CFrame.new(0, 0, 0) * RadAng(SlopeProjection, 0, 15 * X), GetAlpha(0.2,"NK", 1, DeltaTime))
			if MoveSpeed > 16 then
				Bounce = 6
				RJ = RJ:Lerp(CFrame.new(0, 0, 0.2 + 0.2 * math.cos(Siner / Bounce * 2)) * RadAng((14 + 8 * -math.sin(Siner / Bounce * 2) + (SlopeProjection / 1.5)) * -Z, (14 + 2 + 2 * -math.sin(Siner / Bounce * 2) + (SlopeProjection / 1.5)) * X, (20) * X + (5 * math.cos(Siner / Bounce) * -Z)), GetAlpha(0.2,"RJ", 1, DeltaTime))
				WJ = WJ:Lerp(CFrame.new(0, 0, 0) * RadAng(0, 0, 0), GetAlpha(0.2,"WJ", 1, DeltaTime))
				LS = LS:Lerp(CFrame.new(0.3 * math.sin(Siner / Bounce) * -Z, 0, 0) * RadAng(0, 0, 66 * math.sin(Siner / Bounce) * -Z), GetAlpha(0.5,"LS", 1, DeltaTime))
				RS = RS:Lerp(CFrame.new(0.3 * math.sin(Siner / Bounce) * -Z, 0, 0) * RadAng(0, 0, 66 * math.sin(Siner / Bounce) * -Z), GetAlpha(0.5,"RS", 1, DeltaTime))
				LH = LH:Lerp(CFrame.new(-0.25 + 0.5 * -math.cos(Siner / Bounce), 0.25 + 0.5 * math.cos(Siner / Bounce), 0) * RadAng(44 * -math.sin(Siner / Bounce) * -X, 0, 66 * -math.sin(Siner / Bounce) * -Z), GetAlpha(0.5,"LH", 1, DeltaTime))
				RH = RH:Lerp(CFrame.new(0.25 + 0.5 * -math.cos(Siner / Bounce), 0.25 + 0.5 * -math.cos(Siner / Bounce), 0) * RadAng(44 * -math.sin(Siner / Bounce) * -X, 0, 66 * -math.sin(Siner / Bounce) * -Z), GetAlpha(0.5,"RH", 1, DeltaTime))
			else
				Bounce = 8
				RJ = RJ:Lerp(CFrame.new(0, 0, 0.1 + 0.1 * math.cos(Siner / Bounce * 2)) * RadAng((7 + 4 + 4 * -math.sin(Siner / Bounce * 2) + (SlopeProjection / 1.5)) * -Z, (7 + 2 + 2 * -math.sin(Siner / Bounce * 2) + (SlopeProjection / 1.5)) * X, (10) * X + (5 * math.cos(Siner / Bounce) * -Z)), GetAlpha(0.2,"RJ", 1, DeltaTime))
				WJ = WJ:Lerp(CFrame.new(0, 0, 0) * RadAng(0, 0, 0), GetAlpha(0.2,"WJ", 1, DeltaTime))
				LS = LS:Lerp(CFrame.new(0.3 * math.sin(Siner / Bounce) * -Z, 0, 0) * RadAng(0, 0, 45 * math.sin(Siner / Bounce) * -Z), GetAlpha(0.5,"LS", 1, DeltaTime))
				RS = RS:Lerp(CFrame.new(0.3 * math.sin(Siner / Bounce) * -Z, 0, 0) * RadAng(0, 0, 45 * math.sin(Siner / Bounce) * -Z), GetAlpha(0.5,"RS", 1, DeltaTime))
				LH = LH:Lerp(CFrame.new(-0.25 + 0.25 * -math.cos(Siner / Bounce), 0.25 + 0.25 * math.cos(Siner / Bounce), 0) * RadAng(30 * -math.sin(Siner / Bounce) * -X, 0, 45 * -math.sin(Siner / Bounce) * -Z), GetAlpha(0.5,"LH", 1, DeltaTime))
				RH = RH:Lerp(CFrame.new(0.25 + 0.25 * -math.cos(Siner / Bounce), 0.25 + 0.25 * -math.cos(Siner / Bounce), 0) * RadAng(30 * -math.sin(Siner / Bounce) * -X, 0, 45 * -math.sin(Siner / Bounce) * -Z), GetAlpha(0.5,"RH", 1, DeltaTime))
			end
		elseif Animation == "GROUND_JUMP" then
			Bounce = 20
			NK = NK:Lerp(CFrame.new(0, 0, 0) * RadAng(-15 * Backpedal, 0, 0), GetAlpha(0.2,"NK", 1, DeltaTime))
			RJ = RJ:Lerp(CFrame.new(0, 0, 0) * RadAng(-25 * Backpedal, -15 * X, 0), GetAlpha(0.2,"RJ", 1, DeltaTime))
			WJ = WJ:Lerp(CFrame.new(0, 0, 0) * RadAng(0, 0, 0), GetAlpha(0.2,"WJ", 1, DeltaTime))
			LS = LS:Lerp(CFrame.new(0.25, 0, 0.5) * RadAng(-90, 0, 15), GetAlpha(0.2,"LS", 1, DeltaTime))
			RS = RS:Lerp(CFrame.new(-0.25, 0, 0.5) * RadAng(-90, 0, -15), GetAlpha(0.2,"RS", 1, DeltaTime))
			LH = LH:Lerp(CFrame.new(-0.5, 1, 0) * RadAng(0, 0, 0), GetAlpha(0.2,"LH", 1, DeltaTime))
			RH = RH:Lerp(CFrame.new(0, 0, 0) * RadAng(0, 0, 0), GetAlpha(0.2,"RH", 1, DeltaTime))
		elseif Animation == "GROUND_FALL" then
			Bounce = 20
			NK = NK:Lerp(CFrame.new(0, 0, 0) * RadAng(15 * Backpedal, 0, 0), GetAlpha(0.2,"NK", 1, DeltaTime))
			RJ = RJ:Lerp(CFrame.new(0, 0, 0) * RadAng(35 * Backpedal, 15 * X, 0), GetAlpha(0.2,"RJ", 1, DeltaTime))
			WJ = WJ:Lerp(CFrame.new(0, 0, 0) * RadAng(0, 0, 0), GetAlpha(0.2,"WJ", 1, DeltaTime))
			LS = LS:Lerp(CFrame.new(0.25, 0, 0.75) * RadAng(-135, 0, 15), GetAlpha(0.2,"LS", 1, DeltaTime))
			RS = RS:Lerp(CFrame.new(-0.25, 0, 0.75) * RadAng(-135, 0, -15), GetAlpha(0.2,"RS", 1, DeltaTime))
			LH = LH:Lerp(CFrame.new(-0.5, 1, 0) * RadAng(0, 0, 0), GetAlpha(0.2,"LH", 1, DeltaTime))
			RH = RH:Lerp(CFrame.new(0, 0, 0) * RadAng(0, 0, 0), GetAlpha(0.2,"RH", 1, DeltaTime))
		elseif Animation == "GROUND_CLIMB" then
			Bounce = 20
			NK = NK:Lerp(CFrame.new(0, 0, 0) * RadAng(-45 + 5 * math.sin(Siner / Bounce), 0, 0), GetAlpha(0.2,"NK", 1, DeltaTime))
			RJ = RJ:Lerp(CFrame.new(0, 0, 0.1 * math.cos(Siner / Bounce)) * RadAng(1 * math.sin(Siner / Bounce), 0, 0), GetAlpha(0.2,"RJ", 1, DeltaTime))
			WJ = WJ:Lerp(CFrame.new(0, 0, 0) * RadAng(0, 0, 0), GetAlpha(0.2,"WJ", 1, DeltaTime))
			LS = LS:Lerp(CFrame.new(0.2 * math.sin(ClimbSine / 2), 0.3 * -math.cos(ClimbSine / 2), 0) * RadAng(0, -15, -90 + 45 * math.cos(ClimbSine / 2) + -5 * math.cos(Siner / Bounce)), GetAlpha(0.5,"LS", 1, DeltaTime))
			RS = RS:Lerp(CFrame.new(-0.2 * math.sin(ClimbSine / 2), 0.3 * math.cos(ClimbSine / 2), 0) * RadAng(0, 15, 90 + 45 * math.cos(ClimbSine / 2) + 5 * math.cos(Siner / Bounce)), GetAlpha(0.5,"RS", 1, DeltaTime))
			LH = LH:Lerp(CFrame.new(-0.2 + 0.2 * math.cos(ClimbSine / 2), 0.5 + 0.5 * -math.cos(ClimbSine / 2), 0) * RadAng(0, 0, 22 * math.sin(ClimbSine / 2) + 2 * math.cos(Siner / Bounce)), GetAlpha(0.5,"LH", 1, DeltaTime))
			RH = RH:Lerp(CFrame.new(0.2 + 0.2 * math.cos(ClimbSine / 2), 0.5 + 0.5 * math.cos(ClimbSine / 2), 0) * RadAng(0, 0, 22 * math.sin(ClimbSine / 2) + 2 * math.cos(Siner / Bounce)), GetAlpha(0.5,"RH", 1, DeltaTime))
		elseif Animation == "GROUND_SIT" then
			Bounce = 20
			NK = NK:Lerp(CFrame.new(0, 0, 0) * RadAng(0, 0, 0), GetAlpha(0.2,"NK", 1, DeltaTime))
			RJ = RJ:Lerp(CFrame.new(0, 0, 0) * RadAng(0, 0, 0), GetAlpha(0.2,"RJ", 1, DeltaTime))
			WJ = WJ:Lerp(CFrame.new(0, 0, 0) * RadAng(0, 0, 0), GetAlpha(0.2,"WJ", 1, DeltaTime))
			LS = LS:Lerp(CFrame.new(0, 0, 0) * RadAng(0, 0, -90), GetAlpha(0.2,"LS", 1, DeltaTime))
			RS = RS:Lerp(CFrame.new(0, 0, 0) * RadAng(0, 0, 90), GetAlpha(0.2,"RS", 1, DeltaTime))
			LH = LH:Lerp(CFrame.new(0, 0, 0) * RadAng(0, 0, -90), GetAlpha(0.2,"LH", 1, DeltaTime))
			RH = RH:Lerp(CFrame.new(0, 0, 0) * RadAng(0, 0, 90), GetAlpha(0.2,"RH", 1, DeltaTime))
		elseif Animation == "FLY_IDLE" then
			Bounce = 20
			NK = NK:Lerp(CFrame.new(0, 0, 0) * RadAng(5 * math.sin(Siner / Bounce), 0, 5 * math.cos(Siner / Bounce / 2)), GetAlpha(0.2,"NK", 1, DeltaTime))
			RJ = RJ:Lerp(CFrame.new(0, 0, 0.35 * math.cos(Siner / Bounce)) * RadAng(4 + 4 * math.sin(Siner / Bounce), 0, 0), GetAlpha(0.2,"RJ", 1, DeltaTime))
			WJ = WJ:Lerp(CFrame.new(0, 0, 0) * RadAng(0, 0, 0), GetAlpha(0.2,"WJ", 1, DeltaTime))
			LS = LS:Lerp(CFrame.new(0, -0.1 + 0.1 * math.sin(Siner / Bounce), 0) * RadAng(-5 - 5 + 5 * math.cos(Siner / Bounce), 15 + 5 * -math.cos(Siner / Bounce), 6), GetAlpha(0.2,"LS", 1, DeltaTime))
			RS = RS:Lerp(CFrame.new(0, -0.1 + 0.1 * math.sin(Siner / Bounce), 0) * RadAng(-5 - 5 + 5 * math.cos(Siner / Bounce), -15 + 5 * math.cos(Siner / Bounce), -6), GetAlpha(0.2,"RS", 1, DeltaTime))
			LH = LH:Lerp(CFrame.new(-0.5, 0.5 + 0.2 * -math.sin(Siner / Bounce), 0) * RadAng(-5, 0, 10 * -math.cos(Siner / Bounce)), GetAlpha(0.2,"LH", 1, DeltaTime))
			RH = RH:Lerp(CFrame.new(0.2, 0.2 + 0.1 * -math.sin(Siner / Bounce), 0) * RadAng(-5, 0, -5 + 3 * math.cos(Siner / Bounce)), GetAlpha(0.2,"RH", 1, DeltaTime))
		elseif Animation == "FLY_MOVE" then
			Bounce = 20
			NK = NK:Lerp(CFrame.new(0, 0, 0) * RadAng((-30 + 3 * math.sin(Siner / Bounce)) * -Z + (20 * -Y), 0, 0), GetAlpha(0.2,"NK", 1, DeltaTime))
			RJ = RJ:Lerp(CFrame.new(0, 0.2 * math.cos(Siner / Bounce), 0.1 * -math.cos(Siner / Bounce)) * RadAng((60 + 2.5 + 2.5 * math.sin(Siner / Bounce)) * -Z + (40 * -Y), (40 - 5 + 5 * math.sin(Siner / Bounce)) * X, 15 * X), GetAlpha(0.2,"RJ", 1, DeltaTime))
			WJ = WJ:Lerp(CFrame.new(0, 0, 0) * RadAng(0, 0, 0), GetAlpha(0.2,"WJ", 1, DeltaTime))
			LS = LS:Lerp(CFrame.new(0.2 * -Z, (0.1 * math.sin(Siner / Bounce)) * -Z - (0.2 * math.abs(Y)), 0) * RadAng((-11 + 4 * math.cos(Siner / Bounce)) * math.abs(Z) + -15 * X + (33 * -math.abs(Y)), 11 + 3 *  math.sin(Siner / Bounce) + (15 * Y), (40 - 5 + 5 * -math.cos(Siner / Bounce)) * -Z + (30 * Y)), GetAlpha(0.2,"LS", 1, DeltaTime))
			RS = RS:Lerp(CFrame.new(-0.2 * -Z, (0.1 * math.sin(Siner / Bounce)) * -Z - (0.2 * math.abs(Y)), 0) * RadAng((-11 + 4 * math.cos(Siner / Bounce)) * math.abs(Z) + 15 * X + (33 * -math.abs(Y)), -11 + 3 * -math.sin(Siner / Bounce) + (-15 * Y), (-40 + 5 - 5 * -math.cos(Siner / Bounce)) * -Z + (-30 * Y)), GetAlpha(0.2,"RS", 1, DeltaTime))
			LH = LH:Lerp(CFrame.new(-0.7, 0.5 + 0.1 + 0.1 * math.sin(Siner / Bounce), 0) * RadAng(-5, 11 + 3 * math.sin(Siner / Bounce), (20 + 6 * math.cos(Siner / Bounce)) * -Z + (30 * Y)), GetAlpha(0.2,"LH", 1, DeltaTime))
			RH = RH:Lerp(CFrame.new(0.2, 0.2 + 0.1 * math.sin(Siner / Bounce), 0) * RadAng(-5, -11 + 3 * -math.sin(Siner / Bounce), (-15 + 3 * -math.cos(Siner / Bounce)) * -Z + (-30 * Y)), GetAlpha(0.2,"RH", 1, DeltaTime))
		end
		
		if MovementSubPoses["LIGHTNING_1"] then
			local Bounce = 20
			NK = NK:Lerp(CFrame.new(0, 0, 0) * RadAng(0, 0, -45), GetAlpha(0.2,"NK", 2, DeltaTime))
			WJ = WJ:Lerp(CFrame.new(0, 0, 0) * RadAng(-15, 0, 45), GetAlpha(0.2,"WJ", 2, DeltaTime))
			RS = RS:Lerp(CFrame.new(0, 0, 0) * RadAng(0, 45, 180), GetAlpha(0.3,"RS", 2, DeltaTime))
		elseif MovementSubPoses["LIGHTNING_2"] then
			local Bounce = 20
			NK = NK:Lerp(CFrame.new(0, 0, 0) * RadAng(0, 0, 45), GetAlpha(0.2,"NK", 2, DeltaTime))
			WJ = WJ:Lerp(CFrame.new(0, 0, 0) * RadAng(15, 0, -45), GetAlpha(0.2,"WJ", 2, DeltaTime))
			RS = RS:Lerp(CFrame.new(0, 0, 0) * RadAng(0, -45, 90), GetAlpha(0.4,"RS", 2, DeltaTime))
		end
		
		if MovementSubPoses["HOLD_TRIPMINE"] then
			LS = LS:Lerp(CFrame.new(0, 0.5 + 0.125 + 0.125 * math.cos(Siner / 15), 0) * RadAng(10 + 20 * math.sin(Siner / 15), 0, -160 + 20 * math.cos(Siner / 15)), GetAlpha(0.3,"LS", 3, DeltaTime))
			WJ = WJ:Lerp(CFrame.new(0, 0, 0) * RadAng(-5, 0, -25), GetAlpha(0.2,"WJ", 3, DeltaTime))
			NK = NK:Lerp(CFrame.new(0, 0, 0) * RadAng(0, 0, 25), GetAlpha(0.2,"NK", 3, DeltaTime))
			ReplicatedValues.TripmineOffset = RadAng(15 * -math.sin(Siner / 15), (-Siner * 4.4) % 360, Siner % 360) * CFrame.new(0, 0, 0.5)
		elseif MovementSubPoses["THROW_TRIPMINE"] then
			LS = LS:Lerp(CFrame.new(0, 0.5 + 0.125 + 0.125 * math.cos(Siner / 15), 0) * RadAng(40, 0, -75), GetAlpha(0.3,"LS", 3, DeltaTime))
			WJ = WJ:Lerp(CFrame.new(0, 0, 0) * RadAng(5, 0, 45), GetAlpha(0.2,"WJ", 3, DeltaTime))
			NK = NK:Lerp(CFrame.new(0, 0, 0) * RadAng(0, 0, -45), GetAlpha(0.2,"NK", 3, DeltaTime))
		end
		
		local HeadCFrame = RootCFrame * ((RJOFfset * RJ * WJ) * (RJ1OFfset)) * ((NKOffset * NK) * (NK1Offset))
		local TorsoCFrame = RootCFrame * ((RJOFfset * RJ * WJ) * (RJ1OFfset))
		local Left_ArmCFrame = RootCFrame * ((RJOFfset * RJ * WJ) * (RJ1OFfset)) * ((LSOffset * LS) * (LS1Offset))
		local Right_ArmCFrame = RootCFrame * ((RJOFfset * RJ * WJ) * (RJ1OFfset)) * ((RSOffset * RS) * (RS1Offset))
		local Left_LegCFrame = RootCFrame * ((RJOFfset * RJ) * (RJ1OFfset)) * ((LHOffset * LH) * (LH1Offset))
		local Right_LegCFrame = RootCFrame * ((RJOFfset * RJ) * (RJ1OFfset)) * ((RHOffset * RH) * (RH1Offset))
		
		local RayDirection = (RootCFrame.Rotation * CFrame.new(0, -1.5, 0)).Position
		
		local LeftLegRay = workspace:Blockcast(Left_LegCFrame * CFrame.new(0, 1, 0), Vector3.new(0.9, 0, 0.9), RayDirection, GroundParams)
		local RightLegRay = workspace:Blockcast(Right_LegCFrame * CFrame.new(0, 1, 0), Vector3.new(0.9, 0, 0.9), RayDirection, GroundParams)
		
		if MovementType == "GROUND" and MovementState == "LAND" then
			if LeftLegRay then
				local CenterRay = workspace:Raycast((Left_LegCFrame * CFrame.new(0, 1, 0)).Position, RayDirection, GroundParams)
				if CenterRay then
					LeftLegRay = CenterRay
				end
				Left_LegDistance = 3 - (RootCFrame.Rotation * CFrame.new(RootCFrame.Position - LeftLegRay.Position)).Y
			else
				Left_LegDistance = 0
			end

			if RightLegRay then
				local CenterRay = workspace:Raycast((Right_LegCFrame * CFrame.new(0, 1, 0)).Position, RayDirection, GroundParams)
				if CenterRay then
					LeftLegRay = CenterRay
				end
				Right_LegDistance = 3 - (RootCFrame.Rotation * CFrame.new(RootCFrame.Position - RightLegRay.Position)).Y
			else
				Right_LegDistance = 0
			end
		else
			Left_LegDistance = 0
			Right_LegDistance = 0
		end

		Left_LegDifference = Lerp(Left_LegDifference, Left_LegDistance, ExpAlpha(0.3, DeltaTime))
		Right_LegDifference = Lerp(Right_LegDifference, Right_LegDistance, ExpAlpha(0.3, DeltaTime))
		Left_LegCFrame = (RootCFrame * CFrame.new(0, Left_LegDifference, -Left_LegDifference / 2)) * ((RJOFfset * RJ) * (RJ1OFfset)) * ((LHOffset * LH) * (LH1Offset))
		Right_LegCFrame = (RootCFrame * CFrame.new(0, Right_LegDifference, -Right_LegDifference / 2)) * ((RJOFfset * RJ) * (RJ1OFfset)) * ((RHOffset * RH) * (RH1Offset))
		
		OldRootCFrame = OldRootCFrame
		RootCFrame = CFrame.new(RootCFrame.Position) * CFrame.new(Velocity * DeltaTime) * RootCFrame.Rotation
		LimbProperties.Head.CFrame = HeadCFrame
		LimbProperties.Torso.CFrame = TorsoCFrame
		LimbProperties.Left_Arm.CFrame = Left_ArmCFrame
		LimbProperties.Right_Arm.CFrame = Right_ArmCFrame
		LimbProperties.Left_Leg.CFrame = Left_LegCFrame
		LimbProperties.Right_Leg.CFrame = Right_LegCFrame

		UpdateProperties(LimbProperties)
		pcall(function()
			for Name, Properties in next, LimbProperties do
				ReplicatedValues.LimbPositions[Name] = Properties.CFrame
			end
			ReplicatedValues.LimbPositions.Root = RootCFrame
			ReplicatedValues.Limbs = Limbs
			Remotes.Pusher:FireAllClients("REPLICATION", ReplicatedValues)
		end)
	end)
	
	local Alt = false
	local HasTarget = false
	
	local function QuadraticBezier(LerpWith, a, b, c, t)
		return LerpWith(LerpWith(a, b, t), LerpWith(b, c, t), t)
	end

	
	local InputEvents = {
		OnInput = function(Key, IsDown, gpe)
			if gpe then
				return
			end
			if Key == Enum.KeyCode.Q then
				Q = IsDown
			end
			if Key == Enum.KeyCode.W then
				W = IsDown
			end
			if Key == Enum.KeyCode.E then
				E = IsDown
			end
			if Key == Enum.KeyCode.A then
				A = IsDown
			end
			if Key == Enum.KeyCode.S then
				S = IsDown
			end
			if Key == Enum.KeyCode.D then
				D = IsDown
			end
			if Key == Enum.KeyCode.Space then
				Space = IsDown
			end
			if Key == Enum.KeyCode.LeftAlt then
				Alt = IsDown
			end
		end,
		[Enum.KeyCode.F] = function(IsDown, gpe)
			if gpe or not IsDown then
				return
			end
			MovementType = MovementType == "GROUND" and "FLY" or "GROUND"
		end,
		[Enum.KeyCode.R] = function(IsDown, gpe)
			if gpe or not IsDown then
				return
			end
			GlobalDownVector = GlobalDownVector == Vector3.yAxis and -Vector3.yAxis or Vector3.yAxis
		end,
		
		[Enum.KeyCode.Zero] = function(IsDown, gpe)
			if gpe or not IsDown then
				return
			end
			for Name, _ in next, Limbs do
				Refit(Name)
			end
		end,
		
		[Enum.KeyCode.Nine] = function(IsDown, gpe)
			if gpe or not IsDown then
				return
			end
			cad = not cad
			ReplicatedValues.cad = cad
			Remotes.Pusher:FireClient(Player, "SETCORE", "SendNotification", {
				Title = "dim";
				Text = "cad "..tostring(cad)
			})
		end,
		
		[Enum.KeyCode.T] = function(IsDown, gpe)
			if gpe or not IsDown then
				return
			end
			ReplicatedValues.AuraEffects = ReplicatedValues.AuraEffects == 0 and 6 or 0
		end,
		
		[Enum.KeyCode.LeftControl] = function(IsDown, gpe)
			if gpe or not IsDown then
				return
			end
			SprintMultiplier = SprintMultiplier == 1 and 2 or 1
		end,
		
		[Enum.KeyCode.Z] = function(IsDown, gpe)
			if gpe or not IsDown then
				return
			end
		
			if Attacking and Cooldown then
				return
			end
		
			Attacking = true	
			
			local MaxDepth = 7
			local DestroyOnRicochet = true

			local Combos = {
				{Color3.fromRGB(149, 0, 255), Color3.fromRGB(0, 0, 255)};
				{Color3.fromRGB(8, 0, 255), Color3.fromRGB(0, 221, 255)};
			};

			local Index = Combos[math.random(1, #Combos)]
			
			local Color = Index[1]
			local Color2 = Index[2]
			
			if Alt then
				MaxDepth = 64
				DestroyOnRicochet = false
				Color = Color3.new(1, 0.35, 0.35)
				Color2 = Color3.new(0.3, 0.3, 0.3)
			end
			
			local Depth = 0
			local function FireBolt(Origin, Destination, Speed, Color)
				if Depth > MaxDepth then
					return
				end
				Depth = Depth + 1
				
				local Distance = (Destination - Origin).Magnitude
				
				local Direction = CFrame.lookAt(Origin, Destination).LookVector * Distance
				local MainRay = workspace:Raycast(Origin, Direction * 1.1, GroundParams)
				
				if MainRay then
					Destination = MainRay.Position
				else
					if Alt then
						Destination = Origin + Direction.Unit * 2500
					else
						Destination = Origin + Direction.Unit * 700
					end
				end
				
				Distance = (Destination - Origin).Magnitude
				
				task.delay(math.floor(Distance / 4) * (0.1 / Speed),  function()
					local ReflectionRay = workspace:Raycast(Origin, Direction * 1.1, GroundParams)

					if ReflectionRay then
						if Depth >= MaxDepth then
							Remotes.Pusher:FireAllClients("SOUNDPOS", RootCFrame.Position, "rbxassetid://170278900", {
								Volume = 2;
								RollOffMinDistance = 30;
								PlaybackSpeed = Random.new():NextNumber(0.8, 1.2);
							})

							local HitboxParams = OverlapParams.new()
							HitboxParams.RespectCanCollide = false
							HitboxParams.FilterDescendantsInstances = DictToArray(Limbs)
							HitboxParams.BruteForceAllSlow = true

							local Hitbox = workspace:GetPartBoundsInRadius(Destination, 22, HitboxParams)
							KillTable(Hitbox, "LIGHTNING", {Color, Color2, 50})
							Remotes.Pusher:FireAllClients("EFFECT", "EXPLODE", Destination, Vector3.new(45, 45, 45), Color, 0.5, 2)
							Remotes.Pusher:FireAllClients("EFFECT", "EXPLODE", Destination, Vector3.new(31, 31, 31), Color2, 0.3, 1.5)
							
							for i = 1, 12 do
								local BranchColor = Color
								if i % 2 == 0 then
									BranchColor = Color2
								end
								local Branch = Random.new():NextUnitVector() * 150
								Remotes.Pusher:FireAllClients("EFFECT", "BOLT", Destination, Destination + Branch, 15, 12, 1, Speed / 3, BranchColor, 1.5)
							end
							
							return
						end
						
						local ReflectedNormal = (Direction - (2 * Direction:Dot(ReflectionRay.Normal) * ReflectionRay.Normal))
						local NextRay = workspace:Raycast(ReflectionRay.Position, ReflectedNormal.Unit * 2000, GroundParams)
						
						if DestroyOnRicochet then
							local HitboxParams = OverlapParams.new()
							HitboxParams.RespectCanCollide = false
							HitboxParams.FilterDescendantsInstances = DictToArray(Limbs)
							HitboxParams.BruteForceAllSlow = true

							local Hitbox = workspace:GetPartBoundsInRadius(ReflectionRay.Position, 5, HitboxParams)
							KillTable(Hitbox, "LIGHTNING", {Color, Color2, 2})
						end
						
						if NextRay then
							FireBolt(ReflectionRay.Position, NextRay.Position, Speed, Color)
						else
							FireBolt(ReflectionRay.Position, ReflectionRay.Position + ReflectedNormal.Unit * 500, Speed, Color)
						end
						
						Remotes.Pusher:FireAllClients("EFFECT", "RICOCHET", ReflectionRay.Position, ReflectionRay.Normal, ReflectionRay.Instance)
						
						Remotes.Pusher:FireAllClients("EFFECT", "EXPLODE", Destination, Vector3.new(10, 10, 10), Color2, 0.5, 1)
						Remotes.Pusher:FireAllClients("EFFECT", "EXPLODE", Destination, Vector3.new(7, 7, 7), Color, 0.3, 1)

						for i = 1, 2 do
							local BranchColor = Color
							if i % 2 == 0 then
								BranchColor = Color2
							end
							local Branch = ReflectionRay.Normal * 8 + Random.new():NextUnitVector() * 10
							Remotes.Pusher:FireAllClients("EFFECT", "BOLT", ReflectionRay.Position, ReflectionRay.Position + Branch, 5, 5, 0.5, Speed, BranchColor, 1)
						end
					end
				end)
				
				Remotes.Pusher:FireAllClients("EFFECT", "BOLT", Origin, Destination, math.floor(Distance / 4), 2, 1, Speed, Color, 1)
				Remotes.Pusher:FireAllClients("EFFECT", "BOLT", Origin, Destination, math.floor(Distance / 12), 3, 0.75, Speed / 3, Color2, 1.5)
			end
			
			MovementSubPoses["LIGHTNING_1"] = true
			task.wait(0.2)
			MovementSubPoses["LIGHTNING_1"] = nil
			MovementSubPoses["LIGHTNING_2"] = true
			task.wait(0.1)
			
			Remotes.Pusher:FireAllClients("SOUNDPOS", RootCFrame.Position, "rbxassetid://168586586", {
				Volume = 1;
				RollOffMinDistance = 30;
				PlaybackSpeed = Random.new():NextNumber(0.7, 1.3);
			})
			
			task.wait(0.1)
			
			Remotes.Pusher:FireAllClients("SOUNDPOS", RootCFrame.Position, "rbxassetid://3177740633", {
				Volume = 1;
				RollOffMinDistance = 30;
				PlaybackSpeed = Random.new():NextNumber(0.7, 1.3);
			})
			
			local BoltOrigin = (LimbProperties["Right_Arm"].CFrame * CFrame.new(0, -2, 0)).Position
			FireBolt(BoltOrigin, MouseCFrame.Position, 8, Color)
			
			task.wait(0.1)
			
			MovementSubPoses["LIGHTNING_2"] = nil
			Attacking = false
		end,
		
		[Enum.KeyCode.X] = function(IsDown, gpe)
			if gpe then
				return
			end
			
			if Alt then
				
			end
			
			if IsDown then
				if ReplicatedValues.HoldTripmine then
					return
				end
				if Attacking and Cooldown then
					return
				end
				
				MovementSubPoses["HOLD_TRIPMINE"] = true
				ReplicatedValues.HoldTripmine = true
				
				ReplicatedValues.TripmineDebounce = os.clock()
				Attacking = true
				
				Remotes.Pusher:FireAllClients("SOUNDPOS", LimbProperties["Left_Arm"].CFrame.Position, "rbxassetid://11956590", {
					Volume = 2;
					RollOffMinDistance = 30;
				})
				
			else
				if not ReplicatedValues.HoldTripmine and Cooldown then
					Attacking = false
					return
				end
				local TimeDifference = os.clock() - ReplicatedValues.TripmineDebounce or 0
				if TimeDifference < 0.3 then
					task.wait(0.3 - TimeDifference)
				end
				Attacking = false
				
				MovementSubPoses["HOLD_TRIPMINE"] = false
				MovementSubPoses["THROW_TRIPMINE"] = true
				
				local TripmineID = HttpService:GenerateGUID(false)
				
				task.wait(0.1)
				
				local Origin = CFrame.new((LimbProperties["Left_Arm"].CFrame * CFrame.new(0, 2, 0)).Position)
				local Destination = CFrame.new(MouseCFrame.Position)
				
				local Distance = (Destination.Position - Origin.Position).Magnitude
				local Direction = CFrame.lookAt(Origin.Position, Destination.Position).LookVector
				
				if Distance > 3000 then
					Destination = Origin + (Direction * 3000)
				end
				
				local Midpoint = Origin:Lerp(Destination, 0.5) * CFrame.new(-GlobalDownVector * 50)
				
				Remotes.Pusher:FireAllClients("EFFECT", "CREATE_TRIPMINE", TripmineID, Origin, Midpoint, Destination)
				Remotes.Pusher:FireAllClients("SOUNDPOS", RootCFrame.Position, "rbxassetid://201858045", {
					Volume = 2;
					RollOffMinDistance = 100;
					PlaybackSpeed = Random.new():NextNumber(0.95, 1.05);
				})
				
				local StartTime = os.clock()
				local TripmineLoop; TripmineLoop = RunService.Heartbeat:Connect(function()
					local TimeElapsed = os.clock() - StartTime
					local Progression = TimeElapsed
					
					if Progression < 0.5 then
						return
					end
					
					local Bezier = QuadraticBezier(Origin.Lerp, Origin, Midpoint * CFrame.new(0, 50, 0), Destination, Progression)
					local TripmineHitbox = workspace:GetPartBoundsInRadius(Bezier.Position, 4, AuraParams)
					if #TripmineHitbox > 0 then
						Remotes.Pusher:FireAllClients("SOUNDPOS", Bezier.Position, "rbxassetid://11984351", {
							Volume = 1;
							RollOffMinDistance = 100;
							PlaybackSpeed = Random.new():NextNumber(0.95, 1.05);
						})
						
						Remotes.Pusher:FireAllClients("SOUNDPOS", Bezier.Position, "rbxassetid://170278900", {
							Volume = 0.5;
							RollOffMinDistance = 100;
							PlaybackSpeed = Random.new():NextNumber(0.7, 1.3) * 1.3;
						})
						
						Remotes.Pusher:FireAllClients("EFFECT", "TWEENEFFECT", {
							{
								Origin = {
									CFrame = Bezier;
									Shape = Enum.PartType.Ball;
									Color = Color3.new(0.5, 0, 1);
									Size = Vector3.zero;
									Material = Enum.Material.Neon;
									Transparency = 1;
								};
								Tweens = {
									{
										Info = {0.1, Enum.EasingStyle.Exponential};
										Properties = {
											Transparency = 0.5;
											Size = Vector3.one * 65
										};	
									};
									{
										Info = {4, Enum.EasingStyle.Back, Enum.EasingDirection.Out};
										Properties = {
											Transparency = 1;
											Size = Vector3.one
										};	
									};
								};
							};
							{
								Origin = {
									CFrame = Bezier;
									Shape = Enum.PartType.Ball;
									Color = Color3.new(1, 0, 1);
									Size = Vector3.zero;
									Material = Enum.Material.Neon;
									Transparency = 1;
								};
								Tweens = {
									{
										Info = {0.1, Enum.EasingStyle.Exponential};
										Properties = {
											Transparency = 0.2;
											Size = Vector3.one * 45
										};	
									};
									{
										Info = {3.95, Enum.EasingStyle.Back, Enum.EasingDirection.Out};
										Properties = {
											Transparency = 1;
											Size = Vector3.one
										};	
									};
								};
							};
							{
								Origin = {
									CFrame = Bezier;
									Shape = Enum.PartType.Ball;
									Color = Color3.new(1, 0.5, 1);
									Size = Vector3.zero;
									Material = Enum.Material.Neon;
									Transparency = 1;
								};
								Tweens = {
									{
										Info = {0.1, Enum.EasingStyle.Exponential};
										Properties = {
											Transparency = 0.2;
											Size = Vector3.one * 25
										};	
									};
									{
										Info = {3.9, Enum.EasingStyle.Back, Enum.EasingDirection.Out};
										Properties = {
											Transparency = 1;
											Size = Vector3.one
										};	
									};
								};
							};
						})
						
						for i = 1, 8 do
							local BranchColor = Color3.new(0.5, 0, 0.5)
							if i % 2 == 0 then
								BranchColor = Color3.new(1, 0, 1)
							end
							local Branch = Random.new():NextUnitVector() * 35
							task.delay(i / 25, function()
								Remotes.Pusher:FireAllClients("EFFECT", "BOLT", Bezier.Position, Bezier.Position + Branch, 5, 11, 1, 12 / 3, BranchColor, 1.5)
							end)
						end
						
						local Explosion = Instance.new("Explosion")
						Explosion.BlastRadius = 16
						Explosion.BlastPressure = 1000000
						Explosion.Position = Bezier.Position
						Explosion.Visible = false
						Explosion.Parent = workspace
						
						local ExplosionAoe = workspace:GetPartBoundsInRadius(Bezier.Position, 50, AuraParams)
						local FlingAoe = workspace:GetPartBoundsInRadius(Bezier.Position, 80, AuraParams)
						
						for _, Object in next, FlingAoe do
							if not Object.Anchored then
								local ObjectDirection = CFrame.lookAt(Object.CFrame.Position, Bezier.Position).LookVector.Unit
								local ObjectDistance = (Bezier.Position - Object.CFrame.Position).Magnitude
								
								Object.Velocity = -ObjectDirection * 500 / (ObjectDistance / 25)
							end
						end
						
						
						local AffectedParts = {};
						for _, Object in next, ExplosionAoe do
							if CanAttack(Object) then
								table.insert(AffectedParts, Object)
							end
						end
						
						local KillParts = {};
						local FlingParts = {};
						
						for _, Object in next, AffectedParts do
							local ObjectDistance = (Bezier.Position - Object.CFrame.Position).Magnitude
							if ObjectDistance > 40 then
								table.insert(FlingParts, Object)
							else
								table.insert(KillParts, Object)
							end
						end

						for _, Object in next, FlingParts do
							pcall(function()
								Object:BreakJoints()
							end)
						end
						
						for _, Object in next, FlingParts do
							local ObjectDirection = CFrame.lookAt(Object.CFrame.Position, Bezier.Position).LookVector.Unit
							local ObjectDistance = (Bezier.Position - Object.CFrame.Position).Magnitude

							local Sparkles = Instance.new("Sparkles", Object)
							task.delay(5, game.Destroy, Sparkles)

							Object.Color = Color3.new(1, 0, 0.74):Lerp(Color3.new(0, 0, 0), Random.new():NextNumber(0, 0.1))
							Object.Velocity = -ObjectDirection * 500 / (ObjectDistance / 2)
							Object.Anchored = false
							pcall(function()
								Object:SetNetworkOwner(Player)
							end)
						end
						
						task.delay(5, function()
							for _, Object in next, FlingParts do
								pcall(function()
									Object:SetNetworkOwner(nil)
								end)
							end
						end)
						
						KillTable(KillParts, "LIGHTNING", {Color3.new(1, 0, 1), Color3.new(1, 0, 1), 20})
						
						Remotes.Pusher:FireAllClients("EFFECT", "DESTROY_TRIPMINE", TripmineID)
						TripmineLoop:Disconnect()
					end
				end)
				
				task.delay(5, function()
					Remotes.Pusher:FireAllClients("EFFECT", "DESTROY_TRIPMINE", TripmineID)
					TripmineLoop:Disconnect()
				end)
				
				ReplicatedValues.HoldTripmine = false
				task.wait(0.1)
				MovementSubPoses["THROW_TRIPMINE"] = false
				task.wait(0.1)
				ReplicatedValues.OnGoingTripmine = false
			end
		end,
		
		[Enum.KeyCode.C] = function(IsDown, gpe)
			if gpe or not IsDown then
				return
			end

			for _, Limb in next, LimbBackups do
				Remotes.Pusher:FireAllClients("EFFECT", "SHATTER", {
					Color = Limb.Color;
					Size = Limb.Size;
					CFrame = Limb.CFrame;
					Material = Limb.Material;
					Transparency = Limb.Transparency;
					Reflectance = Limb.Reflectance;
					Delay = 0.01;
				})
			end

			Remotes.Pusher:FireAllClients("SOUNDPOS", RootCFrame.Position, "rbxassetid://4958429672", {
				PlaybackSpeed = Random.new():NextNumber(0.75, 1.25);
				Volume = 2;
				RollOffMinDistance = 40;
			})

			if HasTarget then
				local Rotation = CFrame.lookAt(RootCFrame.Position, MouseCFrame.Position).Rotation
				if MovementType == "GROUND" then
					Rotation = GetFlatRotation(Rotation)
				end
				
				if MovementPose ~= "IDLE" then
					Rotation = RootCFrame.Rotation
				end
				
				RootCFrame = (CFrame.new(MouseCFrame.Position) * Rotation) + (-GlobalDownVector * 3)
			end
		end,
		
		[Enum.KeyCode.One] = function(IsDown, gpe)
			if gpe or not IsDown then
				return
			end
			
			if LimbBackups.Head:IsA("MeshPart") then
				LimbBackups.Head.Size = Vector3.new(1.1, 1.1, 1.1)
				for Name, Limb in next, LimbBackups do
					local NewMesh = Instance.fromExisting(DefaultPart)
					NewMesh.Size = Limb.Size
					NewMesh.Color = Limb.Color
					NewMesh.Reflectance = Limb.Reflectance
					NewMesh.Transparency = 0.2

					LimbBackups[Name] = NewMesh
				end
			else
				LimbBackups.Head.Size = Vector3.new(1.198, 1.202, 1.198)
				for Name, Limb in next, LimbBackups do
					local NewMesh = Instance.fromExisting(DefaultMesh)
					NewMesh.Size = Limb.Size
					NewMesh.Color = Limb.Color
					NewMesh.Reflectance = Limb.Reflectance
					NewMesh:ApplyMesh(LimbMeshes[Name])

					LimbBackups[Name] = NewMesh
				end
			end
		end,
		
		[Enum.KeyCode.Two] = function(IsDown, gpe)
			if gpe or not IsDown then
				return
			end
			Cooldown = not Cooldown
			Attacking = false
			Remotes.Pusher:FireClient(Player, "SETCORE", "SendNotification", {
				Title = "dim";
				Text = "cooldown "..tostring(Cooldown)
			})
		end,
		
		[Enum.KeyCode.N] = function(IsDown, gpe)
			if gpe or not IsDown then
				return
			end
			Noclip = not Noclip
		end,
		[Enum.KeyCode.P] = function(IsDown, gpe)
			if gpe or not IsDown then
				return
			end
			RootCFrame = CFrame.new(0, 15, 0)
		end,
		[Enum.KeyCode.M] = function(IsDown, gpe)
			if gpe or not IsDown then
				return
			end
			ReplicatedValues.Music.Volume = ReplicatedValues.Music.Volume == 1 and 0 or 1
		end,
		
	};
	
	local NetworkEvents = {
		["INPUT"] = function(Data)
			local InputEvent = InputEvents[Data.Key]
			if InputEvent then
				InputEvent(Data.IsDown, Data.GameProcessed)
			end
			InputEvents.OnInput(Data.Key, Data.IsDown, Data.GameProcessed)
		end,
		["INTEGRITY"] = function(DeadLimbs)
			for _, Name in next, DeadLimbs do
				Refit(Name)
			end
		end,
	};
	
	PusherProxy.Event:Connect(function(SentPlayer, Handshake, EventName, ...)
		if SentPlayer ~= Player then
			return
		end
		if Handshake ~= ScriptID then
			return
		end
		if not Resuming then
			return
		end
		local Event = NetworkEvents[EventName]
		if Event then
			Event(...)
		end
	end)
	
	PullerProxy.Event:Connect(function(SentPlayer, Handshake, Data)
		if SentPlayer ~= Player then
			return
		end
		if Handshake ~= ScriptID then
			return
		end
		if not Resuming then
			return
		end
		pcall(function()
			PreviousCameraCFrame = CameraCFrame
			CameraCFrame = Data.CameraCFrame
			CameraLock = Data.CameraLock
			MoveVector = Data.MoveVector
			MouseCFrame = Data.MouseCFrame
			HasTarget = Data.HasTarget
		end)
	end)
end

do
	local ClientCode = [==[
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local ContextActionService = game:GetService("ContextActionService")
local StarterGui = game:GetService("StarterGui")

local ScriptID = "SEC"
local StopKey = "STOP"
local UID = "UID"

local Player = Players:GetPlayerByUserId(UID)

local function GetRemote(Type)
	for _, Object in next, Players:GetChildren() do
		if (Object:IsA("RemoteEvent") or Object:IsA("UnreliableRemoteEvent")) and Object:GetAttribute(Type) == ScriptID then
			return Object
		end
	end
	return nil
end

local PlayerModule = nil
pcall(function()
	PlayerModule = require(Player:FindFirstChildOfClass("PlayerScripts"):WaitForChild("PlayerModule", 0.1))
end)

local Signals = {};
local function ConnectSignal(Signal, f)
	table.insert(Signals, Signal:Connect(f))
end

local BoundActions = {}
local function BindAction(Name, ...)
	ContextActionService:BindAction(Name, ...)
	table.insert(BoundActions, Name)
end

local function Forcechat(Message)
	local Bindable = Instance.new("BindableEvent")
	StarterGui:SetCore("CoreGuiChatConnections", {
		ChatWindow = {MessagePosted = Bindable}
	})
	Bindable:Fire(Message)
	pcall(game.Destroy, Bindable)
end

local function Stop()
	for _, Signal in next, Signals do
		pcall(Signal.Disconnect, Signal)
	end
	for _, Action in next, BoundActions do
		pcall(function()
			ContextActionService:UnbindAction(Action)
		end)
	end
	workspace.CurrentCamera.CameraType = Enum.CameraType.Custom
	UserInputService.MouseBehavior = Enum.MouseBehavior.Default
	UserInputService.MouseIcon = ""
	Forcechat([[&gt;]]..StopKey)
end

local Pusher = GetRemote("Pusher")
local Puller = GetRemote("Puller")

local OldPusher = Pusher
local OldPuller = Puller

local Limbs = {};
local LimbPositions = {};

local RecievingTypes = {
	["REPLICATION"] = function(SentData)
		LimbPositions = SentData.LimbPositions
		Limbs = SentData.Limbs
	end,
}

local OnClientEvent = nil
local OnCreate = {
	Pusher = function(Remote)
		if OnClientEvent then
			pcall(OnClientEvent.Disconnect, OnClientEvent)
			OnClientEvent = nil
		end
		ConnectSignal(Remote.OnClientEvent, function(Name, ...)
			local Function = RecievingTypes[Name]
			if Function then
				Function(...)
			end
		end)
	end,
	Puller = function(Remote)
		
	end,
};

if Pusher then
	OnCreate.Pusher(Pusher)
end

if Puller then
	OnCreate.Puller(Puller)
end

local CameraCFrame = CFrame.identity
local MouseCFrame = CFrame.identity
local MoveVector = Vector3.zero
local CameraLock = false
local HasTarget = false

local IsMobile = false

do
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
	
	ConnectSignal(RunService.Heartbeat, function()
		do
			xpcall(function()
				if Pusher and Pusher.Parent ~= Players then
					Pusher = nil
				end
			end, function()
				Pusher = nil
			end)
			if OldPusher ~= Pusher or not Pusher then
				Pusher = GetRemote("Pusher")
				OldPusher = Pusher
				OnCreate["Pusher"](Pusher)
			end
		end
		do
			xpcall(function()
				if Puller and Puller.Parent ~= Players then
					Puller = nil
				end
			end, function()
				Puller = nil
			end)
			if OldPuller ~= Puller or not Puller then
				Puller = GetRemote("Puller")
				OldPuller = Puller
				OnCreate["Puller"](Puller)
			end
		end

		if Puller and Ratelimit("DataSend", 1 / 60) then
			Puller:FireServer(ScriptID, {
				CameraCFrame = CameraCFrame;
				CameraLock = CameraLock;
				MoveVector = MoveVector;
				MouseCFrame = MouseCFrame;
				HasTarget = HasTarget;
			});
		end
	end)
end

do
	local function Lerp(num, goal, i)
		return num + (goal - num) * i 
	end
	
	local MouseLockCursor = "rbxasset://textures/MouseLockedCursor.png"
	local DefaultCursor = ""
	
	local Zoom = 15
	local LerpedZoom = Zoom
	
	local ZoomSensitivityCurvature = 0.16

	local function GetZoomValue(Value, CurrentZoom) 
		return CurrentZoom + -Value * (1 + CurrentZoom * ZoomSensitivityCurvature)
	end
	
	local Camera = Instance.new("Camera")
	Camera.Parent = workspace
	workspace.CurrentCamera = Camera
	
	local ControlSpoofer = Instance.new("Model")
	Instance.new("Humanoid", ControlSpoofer)
	
	local CurrentCursor = ""
	
	local LockCurrentPosition = Enum.MouseBehavior.LockCurrentPosition
	local Default = Enum.MouseBehavior.Default
	local LockCenter = Enum.MouseBehavior.LockCenter
	
	local CameraOrigin = Vector3.zero
	local CameraRotationVector = Vector3.zero
	
	local LastTime = os.clock()
	
	local JumpButton = nil
	
	local MobileSignals = {};
	local MobileButtons = {};
	
	local function ConnectMobileSignals()
		table.insert(MobileSignals, JumpButton.MouseButton1Down:Connect(function()
			Pusher:FireServer(ScriptID, "INPUT", {
				Key = Enum.KeyCode.Space, IsDown = true, GameProcessed = false
			});
		end))
		table.insert(MobileSignals, JumpButton.MouseButton1Up:Connect(function()
			Pusher:FireServer(ScriptID, "INPUT", {
				Key = Enum.KeyCode.Space, IsDown = false, GameProcessed = false
			});
		end))
	end
	
	local function DisconnectMobileSignals()
		for _, Signal in next, MobileSignals do
			pcall(Signal.Disconnect, Signal)
		end
		table.clear(MobileSignals)
	end
	
	local function CreateMobileButton(Name, Data)
		table.insert(MobileButtons, Name)
		local InternalName = Name..ScriptID
		
		local Toggled = false
		
		BindAction(InternalName, function(_, InputState)
			local Key = Data.Input
			local IsDown = InputState == Enum.UserInputState.Begin

			if InputState == Enum.UserInputState.Cancel then
				return
			end

			if IsDown then
				Toggled = not Toggled
			end
			
			if Data.ToggleTitle then
				if Toggled then
					ContextActionService:SetTitle(InternalName, Data.ToggleTitle)
				else
					ContextActionService:SetTitle(InternalName, Data.Title)
				end
			end

			if Data.Callback then
				Data.Callback(IsDown, false)
			end

			if Key then
				Pusher:FireServer(ScriptID, "INPUT", {
					Key = Key, IsDown = IsDown, GameProcessed = false
				});
			end
		end, true)
		
		if Data.Title then
			ContextActionService:SetTitle(InternalName, Data.Title)
		end

		if Data.Image then
			ContextActionService:SetImage(InternalName, Data.Image)
		end

		if Data.Position then
			ContextActionService:SetPosition(InternalName, Data.Position)
		end
	end
	
	local function CreateMobileButtons(Buttons)
		for Name, Data in next, Buttons do
			CreateMobileButton(Name, Data)
		end
	end
	
	local function RemoveMobileButtons()
		for _, Name in next, MobileButtons do
			ContextActionService:UnbindAction(Name..ScriptID)
		end
		table.clear(MobileButtons)
	end
	
	local function MobileInitialize()
		ConnectMobileSignals()
		CreateMobileButtons({
			Fly = {
				Input = Enum.KeyCode.F;
				Position = UDim2.fromScale(0.5, 0.1);
				Title = "Fly";
				ToggleTitle = "Unfly";
			};
			Noclip = {
				Input = Enum.KeyCode.N;
				Position = UDim2.fromScale(0.75, 0.1);
				Title = "Noclip";
			};
			Sprint = {
				Input = Enum.KeyCode.LeftControl;
				Position = UDim2.fromScale(0.3, 0.5);
				Title = "Sprint";
				ToggleTitle = "Walk";
			};
			Shiftlock = {
				Position = UDim2.fromScale(0, 0.5);
				Title = "Shift Lock";
				Callback = function(IsDown)
					if not IsDown then
						return
					end
					CameraLock = not CameraLock
				end,
			};
			Origin = {
				Input = Enum.KeyCode.P;
				Position = UDim2.fromScale(0.5, -0.7);
				Title = "Origin";
			};
			Stop = {
				Position = UDim2.fromScale(0.25, -0.7);
				Title = "Stop";
				Callback = function(IsDown)
					if not IsDown then
						Stop()
					end
				end,
			};
		})
	end
	
	local function MobileClear()
		DisconnectMobileSignals()
		RemoveMobileButtons()
	end
	
	local function DictToArray(Dictionary)
		local Array = {}
		for _, Value in next, Dictionary do
			table.insert(Array, Value)
		end
		return Array
	end
	
	local MouseParams = RaycastParams.new()
	MouseParams.BruteForceAllSlow = true
	
	ConnectSignal(RunService.PreRender, function()
		local CurrentTime = os.clock()
		local DeltaTime = CurrentTime - LastTime
		LastTime = CurrentTime

		local RightClick = UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton2)
		local MouseDelta = UserInputService:GetMouseDelta()

		local CameraFocus = (LimbPositions.Head or CFrame.identity)
		local CameraOffset = CFrame.identity

		MouseParams = DictToArray(Limbs)

		if not UserInputService.KeyboardEnabled and UserInputService.TouchEnabled then
			Player.Character = ControlSpoofer
			
			pcall(function()
				JumpButton = Player.PlayerGui:WaitForChild("TouchGui"):WaitForChild("TouchControlFrame"):WaitForChild("JumpButton")
			end)
			
			if not IsMobile then
				MobileInitialize()
			end
			
			pcall(function()
				MoveVector = PlayerModule:GetControls():GetMoveVector()
			end)
			
			IsMobile = true
		else
			if IsMobile then
				MobileClear()
			end
			MoveVector = Vector3.zero
			IsMobile = false
		end

		local MouseBehaviour = Default
		if RightClick then
			MouseBehaviour = LockCurrentPosition
		end
		if CameraLock then
			MouseBehaviour = LockCenter
			CameraOffset = CFrame.new(1.5, 0, 0)
		end

		CameraOrigin = CameraFocus.Position
		CameraRotationVector = CameraRotationVector + Vector3.new(MouseDelta.X * math.sign(CameraCFrame.UpVector.Y), MouseDelta.Y, 0) * math.rad(0.25)

		local CameraRotationCFrame = CFrame.Angles(0, -CameraRotationVector.X, 0) * CFrame.Angles(-CameraRotationVector.Y, 0, 0)
		LerpedZoom = Lerp(LerpedZoom, Zoom, math.min(0.25 * DeltaTime * 60, 1))
		CameraCFrame = (CameraRotationCFrame + CameraOrigin + CameraRotationCFrame * Vector3.new(0, 0, LerpedZoom)) * CameraOffset

		local MouseLocation = UserInputService:GetMouseLocation()
		local MouseRayData = Camera:ViewportPointToRay(MouseLocation.X, MouseLocation.Y)
		local MouseRay = workspace:Raycast(CameraCFrame.Position, MouseRayData.Direction * 1e4)
		
		if MouseRay then
			MouseCFrame = CFrame.new(MouseRay.Position)
			HasTarget = true
		else
			MouseCFrame = CFrame.new(CameraCFrame.Position + MouseRayData.Direction * 1e4)
			HasTarget = false
		end

		UserInputService.MouseBehavior = MouseBehaviour
		UserInputService.MouseIcon = CurrentCursor

		if workspace.CurrentCamera ~= Camera or Camera.Parent ~= workspace then
			Camera = Instance.new("Camera")
			Camera.Parent = workspace
			workspace.CurrentCamera = Camera
		end

		Camera.CameraType = Enum.CameraType.Scriptable
		Camera.CFrame = CameraCFrame
		workspace.CurrentCamera = Camera
	end)

	local InputEvents = {
		OnInput = function()
			
		end,
		[Enum.KeyCode.L] = function(IsDown, gpe)
			if gpe or not IsDown then
				return
			end
			Forcechat([[&gt;f]])
		end,
		[Enum.KeyCode.K] = function(IsDown, gpe)
			if gpe or not IsDown then
				return
			end
			Stop()
		end,
	}
	
	for _, Signal in next, {UserInputService.InputBegan, UserInputService.InputEnded} do
		local IsDown = Signal == UserInputService.InputBegan
		ConnectSignal(Signal, function(InputObject, GameProcessed) 
			local Key = InputObject.KeyCode
			if Key == Enum.KeyCode.Unknown then
				Key = InputObject.UserInputType
			end
			local InputEvent = InputEvents[Key]
			if InputEvent then
				InputEvent(IsDown, GameProcessed)
			end
			InputEvents.OnInput(Key, IsDown, GameProcessed)
			Pusher:FireServer(ScriptID, "INPUT", {
				Key = Key, IsDown = IsDown, GameProcessed = GameProcessed
			});
		end)
	end
	
	ConnectSignal(UserInputService.InputChanged, function(InputObject, gpe)
		local InputType = InputObject.UserInputType.Name
		if InputType == "MouseWheel" then
			Zoom = math.max(GetZoomValue(InputObject.Position.Z, Zoom), 0)
		end
	end)
	
	BindAction("Shiftlock"..os.clock(), function(ActionName, InputState, InputObject)
		if InputState ~= Enum.UserInputState.Begin then
			return
		end

		CameraLock = not CameraLock
		CurrentCursor = CameraLock and MouseLockCursor or DefaultCursor
	end, false, Enum.KeyCode.LeftShift, Enum.KeyCode.RightShift)
	
	RecievingTypes.FIX = function()
		pcall(function()
			DisconnectMobileSignals()
			RemoveMobileButtons()
		end)
		if IsMobile then
			MobileInitialize()
		end
		print("fix client")
	end
end]==]
	
	local ReplicationCode = [==[
print("replication")
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local ContextActionService = game:GetService("ContextActionService")
local StarterGui = game:GetService("StarterGui")
local VoiceChatInternal = game:GetService("VoiceChatInternal")
local InsertService = game:GetService("InsertService")
local SoundService = game:GetService("SoundService")
local TweenService = game:GetService("TweenService")

local function Lerp(num, goal, i)
	return num + (goal - num) * i 
end

local Whimsical = Instance.new("WorldModel") do
	local Outer = InsertService:CreateMeshPartAsync("rbxassetid://13937987794", Enum.CollisionFidelity.Box, Enum.RenderFidelity.Performance)
	--local Outer = Instance.new("Part")
	local Inner = Instance.new("Part")

	Outer.Color = Color3.new(0, 1, 0)
	Outer.Size = Vector3.one / 2
	Outer.Material = Enum.Material.Neon
	Outer.Anchored = true
	Outer.Name = "Outer"
	Outer.Transparency = 1

	Inner.Color = Color3.new(0.48, 1, 0.37)
	Inner.Size = Vector3.one / 2.8
	Inner.Material = Enum.Material.Neon
	Inner.Anchored = true
	Inner.Name = "Inner"
	Inner.Transparency = 1

	Inner.Parent = Whimsical
	Outer.Parent = Whimsical

	Whimsical.Name = "Whimsical"
end

local MeshCache = {};
local function CreateMesh(ID, CollisionFidelity, RenderFidelity)
	CollisionFidelity = CollisionFidelity or Enum.CollisionFidelity.Default
	RenderFidelity = RenderFidelity or Enum.RenderFidelity.Automatic
	if not MeshCache[ID] then
		local GotMesh = nil
		repeat
			pcall(function()
				GotMesh = InsertService:CreateMeshPartAsync(ID, CollisionFidelity, RenderFidelity)
			end)
		until GotMesh
		
		MeshCache[ID] = GotMesh
	end
	return Instance.fromExisting(MeshCache[ID])
end

local Tripmine = CreateMesh("http://www.roblox.com/asset/?id=11954776")
Tripmine.TextureID = "http://www.roblox.com/asset/?id=11954766"
Tripmine.Anchored = true
Tripmine.CanCollide = false
Tripmine.CanQuery = false
Tripmine.CanTouch = false

local ScriptID = "SEC"
local StopKey = "STOP"
local UID = "UID"
local StartTime = "TIME"

local Player = Players:GetPlayerByUserId(UID)

local function GetRemote(Type)
	for _, Object in next, Players:GetChildren() do
		if (Object:IsA("RemoteEvent") or Object:IsA("UnreliableRemoteEvent")) and Object:GetAttribute(Type) == ScriptID then
			return Object
		end
	end
	return nil
end

local PlayerModule = nil
pcall(function()
	PlayerModule = require(Player:FindFirstChildOfClass("PlayerScripts"):WaitForChild("PlayerModule", 0.1))
end)

local Signals = {};
local function ConnectSignal(Signal, f)
	table.insert(Signals, Signal:Connect(f))
end

local BoundActions = {}
local function BindAction(Name, ...)
	ContextActionService:BindAction(Name, ...)
	table.insert(BoundActions, Name)
end

local Instances = {};
local function NewInstance(ClassName, Parent)
	local Object = Instance.new(ClassName, Parent)
	table.insert(Instances, Object)
	return Object
end

local function PlaySound(SoundId, Properties)
	local Sound = Instance.new("Sound")
	Sound.SoundId = SoundId
	for Index, Value in next, Properties do
		pcall(function()
			Sound[Index] = Value
		end)
	end
	SoundService:PlayLocalSound(Sound)
	Sound = nil
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

local function PlaySoundAtPosition(Position, SoundId, Properties)
	local Attachment = Instance.new("Attachment")
	local Sound = Instance.new("Sound", Attachment)
	Sound.SoundId = SoundId

	Attachment.CFrame = CFrame.new(Position)

	for Index, Value in next, Properties do
		pcall(function()
			Sound[Index] = Value
		end)
	end
	SoundService:PlayLocalSound(Sound)
	Sound = nil
	Attachment = nil
end

local FaceRotations = {
	[Enum.NormalId.Left] = CFrame.Angles(0, math.pi / 2, 0);
	[Enum.NormalId.Right] = CFrame.Angles(0, -math.pi / 2, 0);
	[Enum.NormalId.Top] = CFrame.Angles(0, math.pi / 2, math.pi / 2);
	[Enum.NormalId.Bottom] = CFrame.Angles(0, math.pi / 2, -math.pi / 2);
	[Enum.NormalId.Front] = CFrame.Angles(0, 0, 0);
	[Enum.NormalId.Back] = CFrame.Angles(0, math.pi, 0);
}

local BulkMoveMode = Enum.BulkMoveMode.FireCFrameChanged
local function LightningBolt(Origin, Destination, Resolution, Offset, Size, BoltCreated)
	local DefaultBolt = Instance.new("Part")
	DefaultBolt.Anchored = true
	DefaultBolt.CanCollide = false
	DefaultBolt.CanQuery = false
	DefaultBolt.CanTouch = false
	DefaultBolt.Material = Enum.Material.Neon

	local Difference = (Destination - Origin)

	local Points = {};
	local Bolts = {};
	local CFrames = {};

	local Path = CFrame.lookAt(Origin, Destination).Rotation

	for i = 1, Resolution do
		local Tangent = Vector3.new(Random.new():NextNumber(-1, 1) * Offset, Random.new():NextNumber(-1, 1) * Offset)
		if i == 1 or i == Resolution then
			Tangent = Vector3.zero
		end

		Points[i] = Origin + Difference.Unit * i * Difference.Magnitude / Resolution + (Path * CFrame.new(Tangent)).Position
	end

	for i, Point in next, Points do
		local NextPoint = Points[i + 1]
		if not NextPoint then
			NextPoint = Destination
		end

		local NewBolt = Instance.fromExisting(DefaultBolt)
		local Distance = (Point - NextPoint).Magnitude

		NewBolt.Name = i
		NewBolt.Size = Vector3.new(Size, Size, Distance)

		CFrames[i] = CFrame.new(Point, NextPoint) * CFrame.new(0, 0, -Distance / 2)
		Bolts[i] = NewBolt
	end

	workspace:BulkMoveTo(Bolts, CFrames, BulkMoveMode)

	for _, Object in next, Bolts do
		if BoltCreated then
			BoltCreated(Object)
		end
	end

	pcall(game.Destroy, DefaultBolt)
end

local function TriangleCube(cframe, Size, WedgeCreated)
	local DefaultWedge = Instance.new("WedgePart")
	DefaultWedge.Anchored = true
	DefaultWedge.CanCollide = false
	DefaultWedge.CanQuery = false
	DefaultWedge.CanTouch = false

	local Wedges = {};
	for _, Face in next, Enum.NormalId:GetEnumItems() do
		for i = 1, 2 do
			local FaceVector = Vector3.FromNormalId(Face)

			local Inversion = math.pi * (i - 1)
			local InvertRotation = FaceRotations[Face] * CFrame.Angles(0, Inversion, Inversion)

			local WedgeCFrame = (cframe * CFrame.new(FaceVector * Size / 2)) * CFrame.Angles(0, math.pi / 2, 0)

			local SizeY = 1
			local SizeZ = 1

			if FaceVector.Y == 0 then
				SizeY = Size.Y
				SizeZ = Size.X
			else
				SizeY = Size.X
			end

			if FaceVector.Z == 0 then
				SizeZ = Size.Z
			end

			local WedgeSize = Vector3.new(0.1, SizeY, SizeZ)

			local Wedge = Instance.fromExisting(DefaultWedge)
			Wedge.CFrame = (WedgeCFrame * InvertRotation) * CFrame.new(-WedgeSize.X / 2, 0, 0)
			Wedge.Size = WedgeSize
			Wedge.Name = Face.Name
			table.insert(Wedges, Wedge)
		end
	end

	for _, Wedge in next, Wedges do
		if WedgeCreated then
			WedgeCreated(Wedge)
		end
	end
end

local function QuadraticBezier(LerpWith, a, b, c, t)
	return LerpWith(LerpWith(a, b, t), LerpWith(b, c, t), t)
end

local Pusher = GetRemote("Pusher")
local Puller = GetRemote("Puller")

local OldPusher = Pusher
local OldPuller = Puller

local Limbs = {};
local LimbPositions = {};
local cad = false
local MusicProperties = {};

local OldAuraEffects = 0;
local AuraEffects = OldAuraEffects;

local AuraParts = {};
local AuraSeeds = {};
local GoalPositions = {};

local CurrentTripmine = nil

local function Stop()
	for _, Signal in next, Signals do
		pcall(Signal.Disconnect, Signal)
	end
	for _, Action in next, BoundActions do
		pcall(function()
			ContextActionService:UnbindAction(Action)
		end)
	end
	for _, Object in next, Instances do
		pcall(game.Destroy, Object)
	end
end

local TripmineProjectiles = {};

local Effects = {
	["BOLT"] = function(Origin, Destination, Resolution, Offset, Size, Speed, Color, Speed2, Material)
		local LastBolt = os.clock()
		local Bolts = {};

		local i = 1
		local SubdivisionDelay = 0
		local Duration = (0.1 / Speed)

		LightningBolt(Origin, Destination, Resolution, Offset, Size, function(Bolt)
			Bolt.Transparency = 1
			Bolt.Color = Color
			if Material then
				Bolt.Material = Material
			end

			if i % 100 == 0 and i >= 100 then
				SubdivisionDelay = SubdivisionDelay + task.wait()
			end

			local Tweens = {
				TweenService:Create(Bolt, TweenInfo.new(0.05 * Speed2, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, 0, false, i * Duration + SubdivisionDelay), {
					Transparency = 0;
				});
				TweenService:Create(Bolt, TweenInfo.new(0.5 * Speed2, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, 0, false, i * Duration + SubdivisionDelay), {
					Size = Vector3.new(0, 0, Bolt.Size.Z);
					Color = Color3.new(0, 0, 0);
				});
			}
			
			for _, Tween in next, Tweens do
				Tween:Play()
			end

			task.delay((i * Duration + 0.5 + SubdivisionDelay) * Speed2, function()
				pcall(game.Destroy, Bolt)
				for _, Tween in next, Tweens do
					Tween:Cancel()
					Tween:Destroy()
				end
				table.clear(Tweens)
			end)

			Bolt.Parent = workspace.Terrain
			i = i + 1
		end)
	end,
	["RICOCHET"] = function(Position, Normal, Hit)
		PlaySoundAtPosition(Position, "rbxassetid://3154301226", {
			Volume = 2;
			PlaybackSpeed = Random.new():NextNumber(0.8, 1.2);
			RollOffMinDistance = 50;
		})

		PlaySoundAtPosition(Position, "rbxassetid://5272307532", {
			Volume = 1;
			PlaybackSpeed = Random.new():NextNumber(0.5, 1.5);
			RollOffMinDistance = 50;
		})
	end,
	["EXPLODE"] = function(Position, Size, Color, Transparency, Lifetime)
		local Ball = NewInstance("Part")
		Ball.Size = Vector3.new(1, 1, 1)
		Ball.Anchored = true
		Ball.Transparency = Transparency
		Ball.Material = Enum.Material.Neon
		Ball.CFrame = CFrame.new(Position)
		Ball.Shape = Enum.PartType.Ball
		Ball.Color = Color
		
		TweenService:Create(Ball, TweenInfo.new(0.1, Enum.EasingStyle.Back), {
			Size = Size
		}):Play()
		
		task.delay(0.1, function()
			TweenService:Create(Ball, TweenInfo.new(1.9 * Lifetime, Enum.EasingStyle.Back), {
				Size = Vector3.new(0, 0, 0);
				Color = Color3.new(0, 0, 0);
				Transparency = 1;
			}):Play()
		end)
		
		task.delay(2 * Lifetime, function()
			Ball:Destroy()
		end)
		Ball.Parent = workspace
	end,
	["TWEENEFFECT"] = function(Data)
		local Structure = {
			{
				MaxLifetime = 1;
				Origin = {};
				Tweens = {
					{
						Info = {};
						Properties = {};	
					};
				};
				Mesh = {};
			};
		};
		
		for _, EffectData in next, Data do
			local EffectPart = NewInstance("Part")
			EffectPart.Anchored = true
			
			local EffectMesh = nil
			if EffectData.Mesh then
				EffectMesh = Instance.new("SpecialMesh", EffectPart)
				for Index, Value in next, EffectData.Mesh do
					EffectMesh[Index] = Value
				end
			end
			
			for Index, Value in next, EffectData.Origin do
				EffectPart[Index] = Value
			end
			
			local Tweens = {};
			local EffectThread = coroutine.create(function()
				EffectPart.Parent = workspace.Terrain
				for _, TweenData in next, EffectData.Tweens do
					table.insert(Tweens, TweenService:Create(EffectPart, TweenInfo.new(table.unpack(TweenData.Info)), TweenData.Properties))
				end
				for _, Tween in next, Tweens do
					Tween:Play()
					if Tween.PlaybackState ~= Enum.PlaybackState.Completed then
						Tween.Completed:Wait()
					end
				end
				task.wait()
				pcall(game.Destroy, EffectPart)
			end)
			
			coroutine.resume(EffectThread)
			
			if EffectData.MaxLifetime then
				task.delay(EffectData.MaxLifetime, function()
					for _, Tween in next, Tweens do
						Tween:Cancel()
						Tween:Destroy()
					end
					table.clear(Tweens)

					pcall(game.Destroy, EffectPart)
					task.cancel(EffectThread)
				end)
			end
		end
	end,
	["KILLEFFECT"] = function(Name, EffectData, ...)
		if #EffectData == 0 then
			return
		end

		local EffectParts = {}
		local EffectContainer = Instance.new("WorldModel")

		local RandomValues = {};

		for Index, PartData in next, EffectData do
			local EffectPart = nil
			if PartData.MeshId then
				EffectPart = CreateMesh(PartData.MeshId)
			else
				EffectPart = Instance.new("Part")
			end

			for Index, Value in next, PartData do
				pcall(function()
					EffectPart[Index] = Value
				end)
			end

			EffectPart.Locked = true
			EffectPart.CanCollide = false
			EffectPart.CanTouch = false
			EffectPart.CanQuery = false
			EffectPart.Anchored = true
			EffectPart.Parent = EffectContainer

			EffectParts[Index] = EffectPart
			RandomValues[EffectPart] = Random.new():NextInteger(0, 10000000)
		end

		if Name == "AURA" then
			local Duration = 2

			local StartTime = os.clock()
			local CFrameList = {};

			local EffectUpdate = RunService.PreRender:Connect(function()
				local TimeElapsed = os.clock() - StartTime

				for Index, Part in next, EffectParts do
					local PartProperties = EffectData[Index]
					local Seed = RandomValues[Part]

					local Progression = TimeElapsed / (Duration + Random.new(Seed):NextNumber(-0.2, 0.5))

					local Offset = Vector3.zero:Lerp(Random.new(Seed):NextUnitVector() * 10, Progression ^ 0.5)
					CFrameList[Index] = PartProperties.CFrame * CFrame.new(Offset)

					local SizeOffset = (Vector3.one / 2) * math.cos((TimeElapsed * 15) + Random.new(Seed):NextNumber())

					Part.Transparency = Lerp(0, 1, Progression)
					Part.Size = (PartProperties.Size + SizeOffset):Lerp(Vector3.zero, Progression ^ 0.5)
					Part.Color = Color3.fromRGB(215, 197, 154):Lerp(Color3.new(0, 1, 0):Lerp(Color3.new(0, 0, 0), Progression), Progression ^ 0.5)
				end
				workspace:BulkMoveTo(EffectParts, CFrameList, Enum.BulkMoveMode.FireCFrameChanged)
			end)

			PlaySoundAtPosition(LimbPositions.Root.Position, "rbxassetid://4911987243", {
				Volume = 2;
				PlaybackSpeed = Random.new():NextNumber(0.8, 1.2)
			})

			for Index, Part in next, EffectParts do
				Part.Material = Enum.Material.Neon
			end

			task.delay(Duration + 1, function()
				EffectUpdate:Disconnect()
				EffectContainer:Destroy()
			end)
		elseif Name == "LIGHTNING" then
			local Color, Color2, Spread = ...
			local Duration = 1.3

			local StartTime = os.clock()
			local CFrameList = {};

			local Colors = {};
			local Rotations = {};
			local Offsets = {};
			
			for Index, Part in next, EffectParts do
				local Seed = RandomValues[Part]
				
				local HueVariance = Random.new(Seed):NextNumber(-0.03, 0.03)
				local HueDifference = Random.new(Seed + 1):NextNumber(0, 0.1)

				local SatVariance = Random.new(Seed):NextNumber(-0.1, 0.1)
				local H, S, V = 1, 1, 1
				
				if Random.new(Seed + 2):NextInteger(0, 1) == 0 then
					Colors[Index] = Color
				else
					Colors[Index] = Color2
				end
				
				local UnitVector = Random.new(Seed):NextUnitVector()
				
				Rotations[Index] = CFrame.Angles(math.rad(UnitVector.X * 180), math.rad(UnitVector.Y * 180), math.rad(UnitVector.Z * 180))
				Offsets[Index] = Random.new(Seed):NextUnitVector()
			end

			local Black = Color3.new(0, 0, 0)
			local ZeroVector = Vector3.zero

			local EffectUpdate = RunService.PreRender:Connect(function()
				local TimeElapsed = os.clock() - StartTime

				for Index, Part in next, EffectParts do
					local PartProperties = EffectData[Index]
					local Seed = RandomValues[Part]

					local Progression = TimeElapsed / (Duration + Random.new(Seed):NextNumber(-0.2, 2))
					local Rotation = CFrame.identity:Lerp(Rotations[Index] * CFrame.new(Offsets[Index] * Spread) * Rotations[Index], Progression)

					CFrameList[Index] = PartProperties.CFrame * Rotation

					Part.Transparency = Lerp(0, 1, Progression)
					Part.Color = Colors[Index]:Lerp(Black, Progression ^ 0.5)
					Part.Size = PartProperties.Size:Lerp(ZeroVector, Progression)
				end
				workspace:BulkMoveTo(EffectParts, CFrameList, Enum.BulkMoveMode.FireCFrameChanged)
			end)

			PlaySoundAtPosition(LimbPositions.Root.Position, "rbxassetid://4911987243", {
				PlaybackSpeed = Random.new():NextNumber(0.8, 1.2)
			})

			for Index, Part in next, EffectParts do
				Part.Material = Enum.Material.Neon
			end

			task.delay(Duration + 2, function()
				EffectUpdate:Disconnect()
				EffectContainer:Destroy()
			end)
		end

		EffectContainer.Parent = workspace.Terrain
	end,
	["SHATTER"] = function(Data)
		TriangleCube(Data.CFrame, Data.Size, function(Wedge)
			for Index, Value in next, Data do
				if Index ~= "CFrame" and Index ~= "Size" then
					pcall(function()
						Wedge[Index] = Value
					end)
				end
				
				Wedge.Parent = workspace.Terrain
				task.delay(Data.Delay, function()
					local RandomDistance = Random.new():NextNumber(-1, 1) * (Data.Spread or 3)
					local RandomOffset = CFrame.new(Random.new():NextUnitVector() * RandomDistance)
					local RX = Random.new():NextNumber(-1, 1) * math.pi
					local RY = Random.new():NextNumber(-1, 1) * math.pi
					local RZ = Random.new():NextNumber(-1, 1) * math.pi
					local RandomRotation = CFrame.Angles(RX, RY, RZ)

					local Duration = Random.new():NextNumber(0.4, 1.2)

					TweenService:Create(Wedge, TweenInfo.new(Duration), {
						CFrame = Wedge.CFrame * RandomRotation * RandomOffset;
						Size = Vector3.new(0, 0, 0);
					}):Play()

					task.delay(Duration, function()
						Wedge:Destroy()
					end)
				end)
			end
		end)
	end,
	["CREATE_TRIPMINE"] = function(ID, Origin, Midpoint, Destination)
		local NewTripmine = Tripmine:Clone()
		NewTripmine.Name = ID
		
		TweenService:Create(NewTripmine, TweenInfo.new(1, Enum.EasingStyle.Back), {
			Size = NewTripmine.Size * 2
		}):Play()
		
		TweenService:Create(NewTripmine, TweenInfo.new(2, Enum.EasingStyle.Elastic, Enum.EasingDirection.Out, -1, true, 0), {
			Size = NewTripmine.Size * 3
		}):Play()
		
		local Rotation = CurrentTripmine.CFrame.Rotation
		
		local LerpFunction = Origin.Lerp
		
		NewTripmine.Destroying:Once(function()
			local Pulse = NewTripmine:Clone()
			Pulse.TextureID = ""
			Pulse.Material = Enum.Material.Neon
			Pulse.Color = Color3.new(0, 0, 0)
			Pulse.CFrame = NewTripmine.CFrame
			Pulse.Transparency = -1
			Pulse.Size = Vector3.one * 20
			Pulse.Parent = workspace

			TweenService:Create(Pulse, TweenInfo.new(1, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
				Size = Vector3.one * 100;
				Color = Color3.new(1, 0, 1);
				Transparency = 1;
			}):Play()

			task.delay(2, function()
				Pulse:Destroy()
			end)
		end)
		
		local StartTime = os.clock()
		local UpdateLoop; UpdateLoop = RunService.PreRender:Connect(function()
			local TimeElapsed = os.clock() - StartTime
			local Progression = TimeElapsed
			
			local Bezier = QuadraticBezier(LerpFunction, Origin, Midpoint * CFrame.new(0, 50, 0), Destination, Progression)
			local TripmineCFrame = Bezier * CFrame.Angles(math.rad(TimeElapsed * 360), 0, 0) * Rotation
			
			NewTripmine.CFrame = TripmineCFrame
			
			if Ratelimit(ID, 0.1) then
				local Pulse = NewTripmine:Clone()
				Pulse.TextureID = ""
				Pulse.Material = Enum.Material.Neon
				Pulse.Color = Color3.new(1, 0, 0.7)
				Pulse.CFrame = TripmineCFrame
				Pulse.Transparency = 0.5
				Pulse.Parent = workspace
				
				TweenService:Create(Pulse, TweenInfo.new(0.5, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
					Size = NewTripmine.Size * 3;
					Color = Color3.new(0, 0, 0);
					Transparency = 1;
				}):Play()
				
				task.delay(1, function()
					Pulse:Destroy()
				end)
			end
		end)
		NewTripmine.Parent = workspace
		
		TripmineProjectiles[ID] = {UpdateLoop, NewTripmine}
	end,
	["DESTROY_TRIPMINE"] = function(ID)
		local TripmineExists = TripmineProjectiles[ID]
		if TripmineExists then
			local Signal = TripmineExists[1]
			local Object = TripmineExists[2]
			
			TripmineProjectiles[ID] = nil
			Signal:Disconnect()
			pcall(game.Destroy, Object)
		end
	end,
};

local HoldTripmine = false;
local TripmineOffset = CFrame.new(0, 0, 0)

local RecievingTypes = {
	["REPLICATION"] = function(SentData)
		cad = SentData.cad
		LimbPositions = SentData.LimbPositions
		Limbs = SentData.Limbs
		HoldTripmine = SentData.HoldTripmine
		TripmineOffset = SentData.TripmineOffset

		MusicProperties = SentData.Music

		OldAuraEffects = AuraEffects
		AuraEffects = SentData.AuraEffects

		local DeadLimbs = {};
		for Name, Limb in next, Limbs do
			if not workspace:IsAncestorOf(Limb) then
				table.insert(DeadLimbs, Name)
			end
		end

		if cad and #DeadLimbs > 0 then
			pcall(function()
				Pusher:FireServer(ScriptID, "INTEGRITY", DeadLimbs);
			end)
		end

		if OldAuraEffects ~= AuraEffects then
			for _, Object in next, AuraParts do
				pcall(game.Destroy, Object)
			end
			table.clear(AuraParts)

			for i = 1, AuraEffects do
				local NewAura = Whimsical:Clone()
				NewAura.Name = NewAura.Name..i

				local Attachment0 = Instance.new("Attachment", NewAura.Inner)
				local Attachment1 = Instance.new("Attachment", NewAura.Inner)

				local Trail = Instance.new("Trail", NewAura.Inner)
				Trail.Attachment0 = Attachment0
				Trail.Attachment1 = Attachment1

				Trail.LightEmission = 1
				Trail.LightInfluence = 0
				Trail.Brightness = 5
				Trail.FaceCamera = true
				Trail.MinLength = 0
				Trail.Lifetime = 0.5
				Trail.Transparency = NumberSequence.new({
					NumberSequenceKeypoint.new(0, 0);
					NumberSequenceKeypoint.new(1, 1);
				})
				Trail.Color = ColorSequence.new(Color3.fromHSV(0.3, 0.7, 1))
				Trail.WidthScale = NumberSequence.new({
					NumberSequenceKeypoint.new(0, 1);
					NumberSequenceKeypoint.new(1, 0);
				})

				local RandomPos = CFrame.new(math.random(-10, 10), math.random(-10, 10), math.random(-10, 10))
				for Index, Child in next, NewAura:GetChildren() do
					GoalPositions[Child] = LimbPositions.Root * RandomPos
				end

				NewAura:ScaleTo((i / AuraEffects) * 2)
				NewAura.Parent = workspace.Terrain

				Attachment0.CFrame = CFrame.new(0, NewAura.Inner.Size.Y / 2, 0)
				Attachment1.CFrame = CFrame.new(0, -NewAura.Inner.Size.Y / 2, 0)

				AuraParts[i] = NewAura
				AuraSeeds[i] = Vector3.new(
					Random.new(i):NextNumber(100 * i, (100 * i) + 1000),
					Random.new(i + 1):NextNumber(100 * i, (100 * i) + 1000),
					Random.new(i + 2):NextNumber(100 * i, (100 * i) + 1000)
				);
			end
		end
	end,
	["SETCORE"] = function(Name, Value)
		StarterGui:SetCore(Name, Value)
	end,
	["CLEAN"] = function()
		Stop()
	end,
	["EFFECT"] = function(Name, ...)
		local EffectFunction = Effects[Name]
		if EffectFunction then
			EffectFunction(...)
		end
	end,
	["SOUND"] = function(...)
		PlaySound(...)
	end,
	["SOUNDPOS"] = function(...)
		PlaySoundAtPosition(...)
	end,
}

local OnClientEvent = nil
local OnCreate = {
	Pusher = function(Remote)
		if OnClientEvent then
			pcall(OnClientEvent.Disconnect, OnClientEvent)
			OnClientEvent = nil
		end
		ConnectSignal(Remote.OnClientEvent, function(Name, ...)
			local Function = RecievingTypes[Name]
			if Function then
				Function(...)
			end
		end)
	end,
	Puller = function(Remote)

	end,
};

if Pusher then
	OnCreate.Pusher(Pusher)
end

if Puller then
	OnCreate.Puller(Puller)
end

local CameraCFrame = CFrame.identity
local MoveVector = Vector3.zero
local CameraLock = false

local IsMobile = false

do
	ConnectSignal(RunService.Heartbeat, function()
		do
			xpcall(function()
				if Pusher and Pusher.Parent ~= Players then
					Pusher = nil
				end
			end, function()
				Pusher = nil
			end)
			if OldPusher ~= Pusher or not Pusher then
				Pusher = GetRemote("Pusher")
				OldPusher = Pusher
				OnCreate["Pusher"](Pusher)
			end
		end
		do
			xpcall(function()
				if Puller and Puller.Parent ~= Players then
					Puller = nil
				end
			end, function()
				Puller = nil
			end)
			if OldPuller ~= Puller or not Puller then
				Puller = GetRemote("Puller")
				OldPuller = Puller
				OnCreate["Puller"](Puller)
			end
		end
	end)
end

local wat = Whimsical:Clone()
wat.Parent = workspace

do

	local function ExpAlpha(t, DeltaTime)
		return 1 - 0.5 ^ (t * DeltaTime * 60)
	end

	local SoundPart = NewInstance("NegateOperation")
	local SoundAttachment = NewInstance("Attachment", SoundPart)
	SoundAttachment.Name = ""

	local Sound = NewInstance("Sound", SoundAttachment)
	Sound.Looped = true
	Sound.Playing = true
	Sound.TimePosition = workspace:GetServerTimeNow() - StartTime

	local OldAuraEffects = 0
	local OldTripmineStatus = 0

	local MainLoop = ConnectSignal(RunService.PreRender, function(DeltaTime)
		if cad then
			local LimbArray = {};
			local LimbCFrames = {};
			local i = 1
			for Name, Limb in next, Limbs do
				LimbArray[i] = Limb
				LimbCFrames[i] = LimbPositions[Name]
				i = i + 1
			end
			pcall(function()
				workspace:BulkMoveTo(LimbArray, LimbCFrames, Enum.BulkMoveMode.FireCFrameChanged)
				workspace:BreakJoints(LimbArray)
			end)
		end

		if OldTripmineStatus ~= HoldTripmine then
			if HoldTripmine then
				CurrentTripmine = Tripmine:Clone()
				
				local ElectricSound = NewInstance("Sound", CurrentTripmine)
				ElectricSound.SoundId = "rbxassetid://379557765"
				ElectricSound.Volume = 2
				ElectricSound.Looped = true
				ElectricSound.Playing = true
				
				CurrentTripmine.Parent = workspace
			else
				if CurrentTripmine then
					pcall(game.Destroy, CurrentTripmine)
				end
			end
		end
		OldTripmineStatus = HoldTripmine

		if CurrentTripmine then
			local TripmineCFrame = LimbPositions["Left_Arm"] * CFrame.new(0, -2, 0) * TripmineOffset
			
			workspace:BulkMoveTo({CurrentTripmine}, {TripmineCFrame})
			if HoldTripmine then
				if Ratelimit(CurrentTripmine.Name.."Pulse", 0.1) then
					local Pulse = Tripmine:Clone()
					Pulse.TextureID = ""
					Pulse.Material = Enum.Material.Neon
					Pulse.Color = Color3.new(1, 0.2, 0.45)
					Pulse.CFrame = TripmineCFrame
					Pulse.Transparency = 0.5
					Pulse.Parent = workspace

					TweenService:Create(Pulse, TweenInfo.new(0.5, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
						Size = Vector3.one * 5;
						Color = Color3.new(0, 0, 0);
						Transparency = 1;
					}):Play()
					
					task.delay(1, function()
						Pulse:Destroy()
					end)
				end
				
				if Ratelimit(CurrentTripmine.Name.."Bolt", 0.1) then
					local LastBolt = os.clock()
					local Bolts = {};

					local i = 1
					local Duration = (0.1 / 3)

					local Branch = TripmineCFrame.Position + Random.new():NextUnitVector() * Random.new():NextNumber(1, 5)

					LightningBolt(TripmineCFrame.Position, Branch, 5, 1, 0.2, function(Bolt)
						Bolt.Transparency = 1
						
						local R = Random.new():NextNumber(0.9, 1)
						local G = Random.new():NextNumber(0, 0.2)
						local B = Random.new():NextNumber(0.3, 0.5)
						
						Bolt.Color = Color3.new(R, G, B)

						local Tweens = {
							TweenService:Create(Bolt, TweenInfo.new(0.05, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, 0, false, i * Duration), {
								Transparency = 0;
							});
							TweenService:Create(Bolt, TweenInfo.new(0.5, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, 0, false, i * Duration), {
								Size = Vector3.new(0, 0, Bolt.Size.Z);
								Color = Color3.new(0, 0, 0);
							});
						}

						for _, Tween in next, Tweens do
							Tween:Play()
						end

						task.delay((i * Duration + 0.5), function()
							pcall(game.Destroy, Bolt)
							for _, Tween in next, Tweens do
								Tween:Cancel()
								Tween:Destroy()
							end
							table.clear(Tweens)
						end)

						Bolt.Parent = workspace.Terrain
						i = i + 1
					end)
				end
			end
		end

		workspace:BulkMoveTo({SoundPart}, {CFrame.new(0, 0, 0)}, Enum.BulkMoveMode.FireCFrameChanged)
		pcall(function()
			for Property, Value in next, MusicProperties do
				Sound[Property] = Value
			end
			SoundAttachment.WorldCFrame = LimbPositions.Torso
		end)

		local Time = workspace:GetServerTimeNow() - StartTime

		local PartList = {};
		local CFrameList = {};

		for i = 1, #AuraParts do
			local Aura = AuraParts[i]
			local Children = Aura:GetChildren()

			local NoiseX = math.noise(AuraSeeds[i].X + Time, Time) * 2
			local NoiseY = math.noise(AuraSeeds[i].Y + Time, Time) * 2
			local NoiseZ = math.noise(AuraSeeds[i].Z + Time, Time) * 2

			for Index, Child in next, Children do
				GoalPositions[Child] = GoalPositions[Child]:Lerp(CFrame.new(LimbPositions.Root.Position) * CFrame.new(NoiseX * 8, NoiseY * 8, NoiseZ * 8), ExpAlpha(0.2, DeltaTime))
				table.insert(PartList, Child)
				table.insert(CFrameList, GoalPositions[Child])
			end
		end

		workspace:BulkMoveTo(PartList, CFrameList, Enum.BulkMoveMode.FireCFrameChanged)
	end)

	SoundPart.Parent = VoiceChatInternal
end]==]
	
	local function WrapString(String, Wrap)
		return Wrap..String..Wrap
	end
	
	local function GiveClient(Code, Target, Callback)
		local SelfDestroy = "script.Disabled = true;script:Destroy();\n"
		local ProcessedCode = SelfDestroy..Code
			:gsub([["SEC"]], WrapString(ScriptID, [["]]))
			:gsub([["STOP"]], WrapString(StopKey, [["]]))
			:gsub([["UID"]], UID)
			:gsub([["TIME"]], ScriptStart)
		
		local PlayerGui = Target:FindFirstChildOfClass("PlayerGui")
		local Parent = PlayerGui or Target:FindFirstChildOfClass("Backpack") or Instance.new("Backpack", Target)
		
		local Container = Parent
		if PlayerGui == Parent then
			Container = Instance.new("GuiMain")
			Container.Name = ""
			Container.ResetOnSpawn = false
			Container.Parent = Parent
		end
		
		NLS(ProcessedCode, Container)
		
		if Callback then
			return Callback()
		end
	end
	
	local ChatCommands = {
		[StopKey] = function()
			Resuming = false
			for _, LimbSignals in next, Signals do
				for _, Signal in next, LimbSignals do
					pcall(Signal.Disconnect, Signal)
				end
			end
			Remotes.Pusher:FireAllClients("CLEAN")
			for _, Limb in next, Limbs do
				pcall(game.Destroy, Limb)
			end
			Player.Character = nil
			Player:LoadCharacter()
		end,
		["f"] = function()
			for _, Remote in next, Remotes do
				pcall(Remote.Destroy, Remote)
			end
			for Name, _ in next, LimbBackups do
				pcall(Refit, Name)
			end
			Player.Character = nil
			for i = 1, 2 do
				task.wait()
			end
			Remotes.Pusher:FireClient(Player, "FIX")
		end,
	}
	
	local function Replicate(Target)
		coroutine.wrap(GiveClient)(ReplicationCode, Target, function()
			task.wait()
		end)
		if Target == Player then
			Player.Chatted:Connect(function(Message)
				if Message:match("^&gt;") or Message:match("^>") then
					local Command = Message:gsub("^&gt;", ""):gsub("^>", "")
					local CommandFunction = ChatCommands[Command]
					if CommandFunction then
						CommandFunction()
					end
				end
			end)
			
			coroutine.wrap(GiveClient)(ClientCode, Target)
		end
	end
	
	local function PlayerAdded(NewPlayer)
		if not Resuming then
			PlayerAdded = function() end
			return
		end
		
		if NewPlayer.UserId == UID then
			Player = NewPlayer
		end
		Replicate(NewPlayer)
	end
	
	Players.PlayerAdded:Connect(PlayerAdded)
	for _, NewPlayer in next, Players:GetPlayers() do
		coroutine.wrap(PlayerAdded)(NewPlayer)
	end
end