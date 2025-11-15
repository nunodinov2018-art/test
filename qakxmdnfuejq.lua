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
		Color = Color3.new(0, 1, 1);
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

-- === MODIFIED: Refit (NO sound on removal) ===
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
				WishRotation = CFrame.lookAt(Vector3.zero, WishDirection, -GlobalDownVector).Rotation
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
			LS = LS:Lerp(CFrame.new(0, -0.1 + 0.1 * math.sin(Siner / Bounce), 0) * RadAng(-5 - 5 + 5 * math.cos(Siner / Bounce), 15 + 5 * -math.cos(Siner / Bounce), 6), for _, Object in next, workspace:GetPartBoundsInBox(AuraPosition, (Vector3.one / 2) / i, AuraParams) do
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
			RJ = RJ:Lerp(CFrame.new(0, 0, 0) * RadAng((-20 + 3 * math.sin(Siner / Bounce)) * -Z + (15 * -Y), (15 * X), 0), GetAlpha(0.2,"RJ", 1, DeltaTime))
			WJ = WJ:Lerp(CFrame.new(0, 0, 0) * RadAng(0, 0, 0), GetAlpha(0.2,"WJ", 1, DeltaTime))
			LS = LS:Lerp(CFrame.new(0, 0, 0) * RadAng(-45 * -Z, 30 * X, 45 * -Z), GetAlpha(0.2,"LS", 1, DeltaTime))
			RS = RS:Lerp(CFrame.new(0, 0, 0) * RadAng(-45 * -Z, -30 * X, -45 * -Z), GetAlpha(0.2,"RS", 1, DeltaTime))
			LH = LH:Lerp(CFrame.new(-0.5, 0.5, 0) * RadAng(0, 0, 0), GetAlpha(0.2,"LH", 1, DeltaTime))
			RH = RH:Lerp(CFrame.new(0.5, 0.5, 0) * RadAng(0, 0, 0), GetAlpha(0.2,"RH", 1, DeltaTime))
		end

		-- Apply joint offsets
		local Head = RootCFrame * NK * NKOffset
		local Torso = RootCFrame * RJ * RJOFfset
		local LeftArm = Torso * LS * LSOffset
		local RightArm = Torso * RS * RSOffset
		local LeftLeg = Torso * LH * LHOffset
		local RightLeg = Torso * RH * RHOffset

		-- Update limb CFrames
		ReplicatedValues.LimbPositions.Head = Head
		ReplicatedValues.LimbPositions.Torso = Torso
		ReplicatedValues.LimbPositions.Left_Arm = LeftArm
		ReplicatedValues.LimbPositions.Right_Arm = RightArm
		ReplicatedValues.LimbPositions.Left_Leg = LeftLeg
		ReplicatedValues.LimbPositions.Right_Leg = RightLeg

		-- Update root position
		RootCFrame = CFrame.new(RootCFrame.Position + Velocity * DeltaTime) * RootCFrame.Rotation
		OldRootCFrame = RootCFrame

		-- Send to clients
		UpdateProperties(ReplicatedValues.LimbPositions)
	end)
end

-- === HEAD TWITCH + SOUND TIMER (5–10 SECONDS) ===
local TwitchSound = Instance.new("Sound")
TwitchSound.SoundId = ReplicatedValues.Music.SoundId
TwitchSound.Volume = ReplicatedValues.Music.Volume
TwitchSound.Looped = false
TwitchSound.Parent = workspace

local NextTwitch = tick() + math.random(5, 10)

RunService.Heartbeat:Connect(function()
	if not Resuming then return end

	local now = tick()
	if now >= NextTwitch then
		-- Random head twitch
		local twitchAngle = CFrame.Angles(
			math.rad(math.random(-30, 30)),
			math.rad(math.random(-45, 45)),
			math.rad(math.random(-20, 20))
		)
		ReplicatedValues.LimbPositions.Head = ReplicatedValues.LimbPositions.Head * twitchAngle

		-- Play sound
		if TwitchSound.IsPlaying then
			TwitchSound:Stop()
		end
		TwitchSound:Play()

		-- Schedule next twitch
		NextTwitch = now + math.random(5, 10)
	end
end)

-- === PULLER: Receive client input ===
PullerProxy.Event:Connect(function(Player, ...)
	local Args = {...}
	local Type = Args[1]
	if Type == "INPUT" then
		local Key = Args[2]
		local State = Args[3]
		if Key == "W" then W = State
		elseif Key == "A" then A = State
		elseif Key == "S" then S = State
		elseif Key == "D" then D = State
		elseif Key == "Q" then Q = State
		elseif Key == "E" then E = State
		elseif Key == "Space" then Space = State
		elseif Key == "MouseLock" then CameraLock = State
		end
	elseif Type == "MOUSE" then
		MouseCFrame = Args[2]
	elseif Type == "CAMERA" then
		CameraCFrame = Args[2]
	end
end)

-- === CLEANUP ON SCRIPT END ===
game:BindToClose(function()
	Resuming = false
	if NilCharacter then NilCharacter:Disconnect() end
	if RemoteLoop then RemoteLoop:Disconnect() end
	if GCLoop then GCLoop:Disconnect() end
	if MainLoop then MainLoop:Disconnect() end
	for _, Limb in next, Limbs do
		if Limb and Limb.Parent then
			Limb:Destroy()
		end
	end
	for _, Remote in next, Remotes do
		if Remote and Remote.Parent then
			Remote:Destroy()
		end
	end
end)

-- === FINAL NOTE: NO SOUND ON LIMB REMOVAL ===
-- Refit() function was already modified above to remove sound
-- Sound now ONLY plays on the 5–10 second head twitch timer

print("Rig loaded: Head twitches + sound every 5–10s. No limb removal sound.")
