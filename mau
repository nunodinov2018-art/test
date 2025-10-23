local NLS = NLS or require(13482937602)()

owner = owner or game:GetService("Players"):WaitForChild(script:WaitForChild("OwnerName").Value)
owner:WaitForChild("PlayerGui")
if type(owner) == "string" then return end
local wTom, mainBone, main, musicPart, musicService, musicSound, physDelay, remoteName, stopKey, remote, mouseTarget, mouseHit, lookAt
local tom = require(7755529194)()  
local runService = game:GetService("RunService")
local players = game:GetService("Players")
local httpService = game:GetService("HttpService")
local debris = game:GetService("Debris")
local tweenService = game:GetService("TweenService")
local assignMusic = CFrame.new()
local assignCamera = CFrame.new()
local moveDirection = Vector3.new()
local moveRotation = CFrame.new() 
local mainPos = CFrame.new(0, 0, 0)
local lastClock = os.clock()
local lastClockParticle = os.clock()
local lastClockCap = os.clock()
local env = getfenv(0)
local RNG = Random.new()
local market = game:GetService("MarketplaceService")
local priorityPart = Instance.new("Part")
local priorityTween = game:GetService'TweenService':Create(priorityPart, TweenInfo.new(99), {
	CFrame = CFrame.new(0, 10000, 0)
})
local makingChar = false
local isFirstPerson = false
local isJumping = false
local isFalling = false
local soundId = "rbxassetid://12402888983" -- "rbxassetid://522399337"
local state = "idle"
local eventCap = 800
local volume = 1
local onCap = 0
local updateInt = 0
local moveSpeed = 1.5
local speed = 0
local fallVelocity = 0
local lastContactY = 0
local timePosition = 0
local connections = {}
local pressedKeys = {}
local parts = {}
local assignBone = {}
local lengthCache = {}
local bones = {} -- sorry 200* local limit Xd
local priorityUpdate = {}
local config = {
	serverMouse = true
}
local neckPart = tom.root.TomAdult.C_skin_joints__SET.c_spine_00_skn.c_spine_02_skn.c_spine_03_skn.c_chest_00_skn.c_neck_00_skn.c_neck_01_skn.c_head_00_skn.c_faceHolder_00
local bCFrameOffsets = {
	root = tom.root.TomAdult.C_skin_joints__SET.c_spine_00_skn.c_spine_02_skn.CFrame,
	neck = tom.root.TomAdult.C_skin_joints__SET.c_spine_00_skn.c_spine_02_skn.c_spine_03_skn.c_chest_00_skn.c_neck_00_skn.CFrame,
	leftArm = tom.root.TomAdult.C_skin_joints__SET.c_spine_00_skn.c_spine_02_skn.c_spine_03_skn.c_chest_00_skn.l_clavicle_00_skn.l_upArm_00_skn.CFrame * CFrame.Angles(0, 0, math.rad(85)) - Vector3.new(0.4, 0, 0),
	rightArm = tom.root.TomAdult.C_skin_joints__SET.c_spine_00_skn.c_spine_02_skn.c_spine_03_skn.c_chest_00_skn.r_clavicle_00_skn.r_upArm_00_skn.CFrame * CFrame.Angles(0, 0, math.rad(85)) + Vector3.new(0.4, 0, 0),
	leftLeg = tom.root.TomAdult.C_skin_joints__SET.c_spine_00_skn.l_upLeg_00_skn.CFrame,
	rightLeg = tom.root.TomAdult.C_skin_joints__SET.c_spine_00_skn.r_upLeg_00_skn.CFrame,
	upperLeftArm = tom.root.TomAdult.C_skin_joints__SET.c_spine_00_skn.c_spine_02_skn.c_spine_03_skn.c_chest_00_skn.l_clavicle_00_skn.CFrame,
	upperRightArm = tom.root.TomAdult.C_skin_joints__SET.c_spine_00_skn.c_spine_02_skn.c_spine_03_skn.c_chest_00_skn.r_clavicle_00_skn.CFrame,
	tail0 = tom.root.TomAdult.C_skin_joints__SET.c_spine_00_skn.c_tail_00_skn.CFrame,
	tail1 = tom.root.TomAdult.C_skin_joints__SET.c_spine_00_skn.c_tail_00_skn.c_tail_01_skn.CFrame,
	tail2 = tom.root.TomAdult.C_skin_joints__SET.c_spine_00_skn.c_tail_00_skn.c_tail_01_skn.c_tail_02_skn.CFrame,
	tail3 = tom.root.TomAdult.C_skin_joints__SET.c_spine_00_skn.c_tail_00_skn.c_tail_01_skn.c_tail_02_skn.c_tail_03_skn.CFrame,
	tail4 = tom.root.TomAdult.C_skin_joints__SET.c_spine_00_skn.c_tail_00_skn.c_tail_01_skn.c_tail_02_skn.c_tail_03_skn.c_tail_04_skn.CFrame,
	middleMouth = neckPart.c_jaw_skn.CFrame,
	lowTeeth = neckPart.c_lowTeeth_skn.CFrame,
	upTeeth = neckPart.c_upTeeth_skn.CFrame,
	leftMouth = neckPart.l_mouthLowLips_skn.CFrame,
	rightMouth = neckPart.r_mouthLowLips_skn.CFrame,
	middlerMouth = neckPart.c_jaw_skn.c_mouthLowLips_skn.CFrame
}
local bCFrames = {
	root = CFrame.new(),
	neck = CFrame.new(),
	leftArm = CFrame.new(),
	rightArm = CFrame.new(),
	leftLeg = CFrame.new(),
	rightLeg = CFrame.new(),
	upperLeftArm = CFrame.new(),
	upperRightArm = CFrame.new(),
	tail0 = CFrame.new(),
	tail1 = CFrame.new(),
	tail2 = CFrame.new(),
	tail3 = CFrame.new(),
	tail4 = CFrame.new(),	
	middleMouth = CFrame.new(),
	lowTeeth = CFrame.new(),
	upTeeth = CFrame.new(),
	leftMouth = CFrame.new(),
	rightMouth = CFrame.new(),
	middlerMouth = CFrame.new()
}
local replicatedServices = {
	game:GetService("TestService"), 
	game:GetService("ProximityPromptService"), 
	game:GetService("Lighting"), 
	game:GetService("Chat"), 
	game:GetService("Players"), 
	game:GetService("LocalizationService"), 
	game:GetService("SoundService"), 
	game:GetService("FriendService"), 
	game:GetService("Teams"),  
	game:GetService("InsertService"), 
	game:GetService("MarketplaceService"), 
	game:GetService("ReplicatedStorage")
} 

pcall(function()
		mainPos = owner.Character.HumanoidRootPart.CFrame
end)	

userId = owner.UserId
remoteName = httpService:GenerateGUID(false):sub(1, 10)
stopKey = httpService:GenerateGUID(false):sub(1, 10)

function random(min, max)
	return RNG:NextNumber(min, max)
end

function randomAngle()
	return CFrame.Angles(math.rad(math.random(-360, 360)), math.rad(math.random(-360, 360)), math.rad(math.random(-360, 360)))
end

function pickService()
	return replicatedServices[math.random(1, #replicatedServices)]
end

function alphaFromStep(alpha, step) -- Jack_Hase2 made
	return (1 - (((1 - alpha) ^ 60) ^ step))
end

function lerp(a, b, t)
	return a + (b - a) * t
end

function bezier(a, b, c, t)
	local a0 = lerp(a, b, t)
	local b0 = lerp(b, c, t)
	return lerp(a0, b0, t)
end

function bezierC(a, b, c, t)
	local a0 = a:lerp(b, t)
	local b0 = b:lerp(c, t)
	return a0:lerp(b0, t)
end

function removeOnDestroy(part)
	local connection
	table.insert(parts, part)
	connection = part:GetPropertyChangedSignal("Parent"):Connect(function()
		if not part.Parent then
			connection:Disconnect()
			table.remove(parts, table.find(parts, part))
		end
	end)
end

function playAudio(audioID, offset)
	local part = Instance.new("Part")
	local audio = Instance.new("Sound", part)
	local f
	f = function()
		part.CFrame = mainPos * offset
		if not audio.IsPlaying then
			pcall(debris.AddItem, debris, part, 1)
			table.remove(priorityUpdate, table.find(priorityUpdate, f))
		end
	end
	audio.SoundId = "rbxassetid://" .. audioID
	audio.Volume = 0.5
	part.CFrame = mainPos * offset
	part.Anchored = true
	part.Transparency = 1
	part.CanCollide = false
	part.Parent = market
	table.insert(priorityUpdate, f)
	audio:Play()
	return audio
end

function handlePart(part)
	local connection1, connection2 
	connection1 = part:GetPropertyChangedSignal("CanCollide"):Connect(function()
		if part.CanCollide then
			return table.remove(parts, table.find(parts, part))
		end
		table.insert(parts, part)
	end)
	connection2 = part:GetPropertyChangedSignal("Parent"):Connect(function()
		if not part.Parent then
			local _, err = pcall(function()
				part.Parent = part
			end)
			if err:find("locked,") then
				connection1:Disconnect()
				connection2:Disconnect()
			end
		end
	end)
end

function refit(force)
	coroutine.wrap(function()
		if makingChar then return end
		local success, res = pcall(function()
			return #(wTom:GetDescendants())
		end)
		if not success or res ~= #(tom:GetDescendants()) or force then
			makingChar = true
			local old = wTom
			localParts = {}
			wTom = tom:Clone()
			local neckPart = wTom.root.TomAdult.C_skin_joints__SET.c_spine_00_skn.c_spine_02_skn.c_spine_03_skn.c_chest_00_skn.c_neck_00_skn.c_neck_01_skn.c_head_00_skn.c_faceHolder_00
			main = wTom.root.TomAdult.C_skin_joints__SET.c_spine_00_skn
			mainBone = wTom.root.TomAdult
			bones = {
				root = main.c_spine_02_skn,
				neck = main.c_spine_02_skn.c_spine_03_skn.c_chest_00_skn.c_neck_00_skn,
				leftArm = main.c_spine_02_skn.c_spine_03_skn.c_chest_00_skn.l_clavicle_00_skn.l_upArm_00_skn,
				rightArm = main.c_spine_02_skn.c_spine_03_skn.c_chest_00_skn.r_clavicle_00_skn.r_upArm_00_skn,
				leftLeg = main.l_upLeg_00_skn,
				rightLeg = main.r_upLeg_00_skn,
				upperLeftArm = main.c_spine_02_skn.c_spine_03_skn.c_chest_00_skn.l_clavicle_00_skn,
				upperRightArm = main.c_spine_02_skn.c_spine_03_skn.c_chest_00_skn.r_clavicle_00_skn,
				middleMouth = neckPart.c_jaw_skn,
				lowTeeth = neckPart.c_lowTeeth_skn,
				upTeeth = neckPart.c_upTeeth_skn,
				leftMouth = neckPart.l_mouthLowLips_skn,
				rightMouth = neckPart.r_mouthLowLips_skn,
				middlerMouth = neckPart.c_jaw_skn.c_mouthLowLips_skn,
				tail0 = main.c_tail_00_skn,
				tail1 = main.c_tail_00_skn.c_tail_01_skn,
				tail2 = main.c_tail_00_skn.c_tail_01_skn.c_tail_02_skn,
				tail3 = main.c_tail_00_skn.c_tail_01_skn.c_tail_02_skn.c_tail_03_skn,
				tail4 = main.c_tail_00_skn.c_tail_01_skn.c_tail_02_skn.c_tail_03_skn.c_tail_04_skn
			}
			mainBone.WorldCFrame = mainPos
			parentBone = mainBone.Parent
			for k, v in next, bones do
				v.CFrame = assignBone[k] or bCFrameOffsets[k]
			end
			for k, v in next, wTom:GetDescendants() do
				if not v:IsA("Bone") then
					v.Name = httpService:GenerateGUID(false)
				end
				if v:IsA("BasePart") then
					table.insert(localParts, v)
					v.CFrame = CFrame.new(50000, 50000, 50000)
				end
				if v:IsA("Script") then
					v:Destroy()
				end
			end
			wTom.Name = httpService:GenerateGUID(false)
			makingChar = false
			wTom.Parent = workspace
			pcall(function()
				remote:FireClient(owner, {
					method = "characterP",
					data = localParts
				})
			end)
			pcall(game.Destroy, old) 
		end
	end)()
end

function update()
	for k, v in next, bCFrames do
		pcall(function()
			if assignBone[k] and bones[k] and (bones[k].Position - assignBone[k].Position).Magnitude > 0.2 then
				return pcall(refit, true)
			end
			if not bones[k] then
				return pcall(refit)
			end
			local assign = bCFrameOffsets[k] * bCFrames[k]
			assignBone[k] = assign
			bones[k].CFrame = assign
		end)
	end
	if config.loop then
		if os.clock() - lastClock > 0.5 then
			lastClock = os.clock()
			pcall(refit, true)
		end
	end
	mainBone.WorldCFrame = mainPos
	pcall(function()
		if not musicPart or musicPart.Parent ~= musicService or musicSound.Parent ~= musicPart or musicSound.SoundId ~= soundId or math.floor(musicSound.Volume) ~= volume or not musicSound.IsPlaying or not musicSound.Looped then
			pcall(game.Destroy, musicPart)
			musicService = pickService()
			musicPart = Instance.new("Part")
			musicPart.Name = httpService:GenerateGUID(false)
			musicSound = Instance.new("Sound", musicPart)
			musicSound.Name = httpService:GenerateGUID(false)
			musicSound.SoundId = soundId
			musicSound.Volume = volume
			musicSound.Looped = true
			musicSound.TimePosition = timePosition
			musicSound.Parent = musicPart
			musicPart.Anchored = true
			musicPart.CFrame = assignMusic
			musicPart.Parent = musicService
			musicSound:Play()
			return
		end
		if musicPart.CFrame ~= assignMusic then
			return pcall(game.Destroy, musicPart)
		end
		assignMusic = mainPos * CFrame.new(0, 4, 0)
		timePosition = musicSound.TimePosition
		musicPart.CFrame = assignMusic
	end)
	pcall(function()
		if not cameraPart or cameraPart.Parent ~= cameraService or cameraPart.CFrame ~= assignCamera then
			pcall(game.Destroy, cameraPart)
			cameraService = pickService()
			cameraPart = Instance.new("Part")
			cameraPart.Transparency = 1
			cameraPart.Name = httpService:GenerateGUID(false)
			cameraPart.CFrame = assignCamera
			cameraPart.Anchored = true
			cameraPart.Parent = cameraService
			pcall(function()
				remote:FireClient(owner, {
					method = "camera",
					data = cameraPart
				})
			end)
			return
		end
		assignCamera = mainPos * CFrame.new(0,  10.786, 0)
		cameraPart.CFrame = assignCamera
	end)
	mainBone.Parent = parentBone
end

function doRaycast(origin, direction, size, params, X, Z) -- X and Z are the segments
	local result = workspace:Raycast(origin.Position, direction, params)
	if result then
		return result
	end
	origin = origin * CFrame.new(-1.25, 0, -0.75)
	for z = 1, Z do
		for x = 1, X do
			local x1, y1, z1 = origin:ToOrientation()
			local origin2 = CFrame.new(origin.Position) * CFrame.Angles(0, y1, z1)
			result = workspace:Raycast((origin2 * CFrame.new(size.X * (x / X), 0, size.Z * (z / Z))).Position, direction, params)
			if result then
				return result
			end
		end
	end
end

function getMoveDirection(delta)
	local direction = Vector3.new(0, 0, 0)
	local speed = speed * delta * 60
	if pressedKeys.w and (pressedKeys.d or pressedKeys.a) or pressedKeys.s and (pressedKeys.d or pressedKeys.a) then
		speed = speed * 0.75
	end
	if pressedKeys.w then
		direction = direction + Vector3.new(0, 0, -speed)
	end
	if pressedKeys.s then
		direction = direction + Vector3.new(0, 0, speed)
	end
	if pressedKeys.a then
		direction = direction + Vector3.new(-speed, 0, 0)
	end
	if pressedKeys.d then
		direction = direction + Vector3.new(speed, 0, 0)
	end
	local moveDir = direction.Unit
	if moveDir ~= moveDir then
		moveDir = Vector3.new()
	end
	return direction
end

function getRotation()
	if pressedKeys.w and pressedKeys.a and not pressedKeys.d then
		return CFrame.Angles(0, math.rad(45), 0)
	end
	if pressedKeys.w and pressedKeys.d and not pressedKeys.a then
		return CFrame.Angles(0, math.rad(-45), 0)
	end 
	if pressedKeys.s and pressedKeys.a and not pressedKeys.d then
		return CFrame.Angles(0, math.rad(180 + -45), 0)
	end
	if pressedKeys.s and pressedKeys.d and not pressedKeys.a then
		return CFrame.Angles(0, math.rad(180 + 45), 0)
	end
	if pressedKeys.s and not pressedKeys.w then
		return CFrame.Angles(0, math.rad(180), 0)
	end
	if pressedKeys.a and not pressedKeys.d and not pressedKeys.w and not pressedKeys.s then
		return CFrame.Angles(0, math.rad(90), 0)
	end
	if pressedKeys.d and not pressedKeys.a and not pressedKeys.w and not pressedKeys.s then
		return CFrame.Angles(0, math.rad(-90), 0)
	end
	return CFrame.Angles(0, 0, 0)
end

function updateMovement(delta)
	if (pressedKeys.w or pressedKeys.a or pressedKeys.s or pressedKeys.d) then
		state = "walk"
		speed = math.clamp(speed + (moveSpeed / 6) * delta * 60, 0, moveSpeed)
		local multi = Vector3.new(1, 0, 1)
		local look = lookAt or Vector3.new(0, 0, -1)
		local rotation = getRotation()
		local direction = getMoveDirection(delta)
		local lookAt = CFrame.lookAt(mainPos.Position, mainPos.Position + (look * multi).Unit)
		local position = mainPos
		position = position - position.Position + (lookAt * CFrame.new(direction)).Position
		local dir = (position.Position - mainPos.Position).Unit
		dir = dir == dir and dir or moveDirection
		moveDirection = dir
		moveRotation = rotation
		if isFirstPerson then
			rotation = CFrame.new()
		end
		mainPos = (position - position.Position):Lerp(CFrame.lookAt(position.Position, position.Position + (look * multi).Unit) * rotation - position.Position, (1 - ((0.85 ^ 60) ^ delta))) + mainPos.Position:Lerp(position.Position, alphaFromStep(.3, delta))
	else 
		state = "idle"
		speed = 0
		moveDirection = Vector3.new()
		moveRotation = CFrame.new()
	end	
	if isFirstPerson then
		local look = lookAt or Vector3.new(0, 0, -1)
		mainPos = (mainPos - mainPos.Position):Lerp(CFrame.lookAt(mainPos.Position, mainPos.Position + (look * Vector3.new(1, 0, 1)).Unit) - mainPos.Position, (1 - ((0.9 ^ 60) ^ delta))) + mainPos.Position
	end
end

function updatePhysics(step)
	local raycast = RaycastParams.new()
	raycast.FilterType = Enum.RaycastFilterType.Blacklist
	raycast.IgnoreWater = true
	raycast.FilterDescendantsInstances = parts
	local result = doRaycast(mainPos * CFrame.new(-1.8, 3.99, -1.5), Vector3.new(0, -4, 0), Vector3.new(5, 0, 3.3), raycast, 6, 4)
	if result and not isJumping then
		pcall(function()
			if result.Instance.CanCollide then
				local position = (result.Position) * Vector3.new(0, 1, 0)
				mainPos = CFrame.new(mainPos.Position * Vector3.new(1, 0, 1) + position) * (mainPos - mainPos.Position)
				isFalling = false
				fallVelocity = 0
				lastContactY = position.Y
			else
				table.insert(parts, result.Instance)
				handlePart(result.Instance)
			end
		end)
		if moveDirection == Vector3.new() then
			state = "idle"
		end
		return
	end
	if fallVelocity <= 0 then
		isJumping = false
	end
	isFalling = true
	state = "falling"
	fallVelocity = fallVelocity - ((physDelay and os.clock() - physDelay < 1 and 0.00003 or workspace.Gravity * 0.0003))
	mainPos = mainPos:Lerp(mainPos + Vector3.new(0, fallVelocity, 0), alphaFromStep(.95, step))
	if mainPos.Position.Y < workspace.FallenPartsDestroyHeight then
		mainPos = CFrame.new(mainPos.Position * Vector3.new(1, 0, 1) + Vector3.new(0, lastContactY + 4, 0)) * (mainPos - mainPos.Position)
		fallVelocity = 0
		physDelay = os.clock()
	end
end

function updateAnim(step)
	updateInt = updateInt + (1 * step * 60)
	if updateInt > 9e9 then
		updateInt = 1
	end
	local i = updateInt
	if state == "falling" then
		local alpha = alphaFromStep(.2, step)
		if fallVelocity > 0 then
			bCFrames.root = bCFrames.root:lerp(CFrame.Angles(math.rad(15 + 3 * math.sin(i / 40)), 0, 0), alphaFromStep(.4, step))
			bCFrames.neck = bCFrames.neck:lerp(CFrame.Angles(math.rad(5 + 1 * math.sin(i / 40)), 0, 0), alpha)
			bCFrames.leftArm = bCFrames.leftArm:lerp(CFrame.Angles(0, math.rad(-85), math.rad(-19 + 5 * math.cos(i / 14))), alpha)
			bCFrames.rightArm = bCFrames.rightArm:lerp(CFrame.Angles(0, math.rad(-83), math.rad(-22 + 5 * math.cos(i / 14))), alpha)
			bCFrames.rightLeg = bCFrames.rightLeg:lerp(CFrame.new(-0.4, -1.6, 0.1) * CFrame.Angles(0, 0, math.rad(-8 + 1 * math.sin(i / 10))), alpha)
			bCFrames.leftLeg = bCFrames.leftLeg:lerp(CFrame.new(2, 1.5, 0) * CFrame.Angles(0, 0, math.rad(-10 + 1 * math.sin(i / 10))), alpha)
			bCFrames.tail0 = bCFrames.tail0:lerp(CFrame.Angles(0, 0, math.rad(20 + 2 * math.sin(i /20))), alpha)
			bCFrames.tail1 = bCFrames.tail1:lerp(CFrame.new(), alpha)
			bCFrames.tail2 = bCFrames.tail2:lerp(CFrame.new(), alpha)
			bCFrames.tail3 = bCFrames.tail3:lerp(CFrame.Angles(0, 0, math.rad(25 + 2 * math.sin(i /20))), alpha)
			bCFrames.tail4 = bCFrames.tail4:lerp(CFrame.new(), alpha)
		else
			bCFrames.root = bCFrames.root:lerp(CFrame.Angles(math.rad(-10 + 3 * math.sin(i / 40)), 0, 0), alphaFromStep(.4, step))
			bCFrames.neck = bCFrames.neck:lerp(CFrame.Angles(math.rad(-15 + 1 * math.sin(i / 40)), 0, 0), alpha)
			bCFrames.leftArm = bCFrames.leftArm:lerp(CFrame.Angles(0, math.rad(-15), math.rad(-120 + 4 * math.cos(i / 18))), alpha)
			bCFrames.rightArm = bCFrames.rightArm:lerp(CFrame.Angles(0, math.rad(-15), math.rad(-120 + 4 * math.cos(i / 18))), alpha)
			bCFrames.rightLeg = bCFrames.rightLeg:lerp(CFrame.new(-0.4, -1, 0.1) * CFrame.Angles(0, 0, math.rad(8 + 1 * math.sin(i / 10))), alpha)
			bCFrames.leftLeg = bCFrames.leftLeg:lerp(CFrame.new(1.4, 1.4, 0) * CFrame.Angles(0, 0, math.rad(10 + 1 * math.sin(i / 10))), alpha)
			bCFrames.tail0 = bCFrames.tail0:lerp(CFrame.Angles(0, 0, math.rad(-20 + 2 * math.sin(i /20))), alpha)
			bCFrames.tail1 = bCFrames.tail1:lerp(CFrame.new(), alpha)
			bCFrames.tail2 = bCFrames.tail2:lerp(CFrame.new(), alpha)
			bCFrames.tail3 = bCFrames.tail3:lerp(CFrame.Angles(0, 0, math.rad(-25 + 2 * math.sin(i /20))), alpha)
			bCFrames.tail4 = bCFrames.tail4:lerp(CFrame.new(), alpha)
		end
	end
	if state == "walk" then
		local alpha = alphaFromStep(.3, step)
		bCFrames.neck = bCFrames.neck:lerp(CFrame.new(), alpha)
		bCFrames.root = bCFrames.root:lerp(CFrame.Angles(math.rad(-15 + 5 * math.cos(i / 6)), math.rad(5 * math.cos(i / 10)), 0), alphaFromStep(.8, step))
		bCFrames.leftArm = bCFrames.leftArm:lerp(CFrame.Angles(math.rad(-10 * math.sin(i / 7)), math.rad(40 * math.cos(i / 10)), math.rad(-6 + 2 * math.sin(i / 9))), alphaFromStep(.3, step))
		bCFrames.rightArm = bCFrames.rightArm:lerp(CFrame.Angles(math.rad(10 * math.sin(i / 7)), math.rad(-40 * math.cos(i / 10)), math.rad(-6 + 2 * math.sin(i / 9))), alphaFromStep(.3, step))
		bCFrames.rightLeg = bCFrames.rightLeg:lerp(CFrame.new(0.4 * math.sin(i / 4), 0.5 * math.sin(i / 9), 0) * CFrame.Angles(math.rad(-6 + 1 * math.cos(i / 7)), 0, math.rad(50 * math.sin( i / 9))), alphaFromStep(.3, step))
		bCFrames.leftLeg = bCFrames.leftLeg:lerp(CFrame.new(0.4 * math.sin(i / 4), 0.5 * math.sin(i / 9), 0) * CFrame.Angles(math.rad(-6 + 1 * math.cos(i / 7)), 0, math.rad(-50 * math.sin( i / 9))), alphaFromStep(.3, step))
		bCFrames.tail0 = bCFrames.tail0:lerp(CFrame.Angles(0, math.rad(15 * math.sin(i / 8)), 0), alpha)
		bCFrames.tail1 = bCFrames.tail1:lerp(CFrame.Angles(math.rad(8 * math.sin(i / 8)), math.rad(6 * math.cos(i / 8)), 0), alpha)
		bCFrames.tail2 = bCFrames.tail2:lerp(CFrame.Angles(0, math.rad(10 * math.cos(i / 8)), 0), alpha)
		bCFrames.tail3 = bCFrames.tail3:lerp(CFrame.Angles(math.rad(6 * math.sin(i / 8)), math.rad(12 * math.sin(i / 6)), 0), alpha)
		bCFrames.tail4 = bCFrames.tail4:lerp(CFrame.Angles(0, math.rad(18 * math.sin(i / 8)), 0), alpha)
		return
	end
	if state == "idle" then
		local alpha = alphaFromStep(.1, step)
		bCFrames.neck = bCFrames.neck:lerp(CFrame.Angles(math.rad(-2 + 3 * math.cos(i / 25)), 0, 0), alpha)
		bCFrames.root = bCFrames.root:lerp(CFrame.new(0, -0.3 * math.sin(i / 20), 0), alpha)
		bCFrames.leftArm = bCFrames.leftArm:lerp(CFrame.Angles(0, 0, -math.rad(5 - 10 * math.cos(i / 20))) + Vector3.new(-0.4 + 1 * math.sin(i / 20), 0, 0), alpha)
		bCFrames.rightArm = bCFrames.rightArm:lerp(CFrame.Angles(0, 0, -math.rad(5 - 10 * math.cos(i / 20))) - Vector3.new(-0.4 + 1 * math.sin(i / 20), 0, 0), alpha)
		bCFrames.upperLeftArm = bCFrames.upperLeftArm:lerp(CFrame.new(0, 0.3 * math.sin(i / 20), 0), alpha)	
		bCFrames.upperRightArm = bCFrames.upperRightArm:lerp(CFrame.new(0, -0.3 * math.sin(i / 20), 0), alpha)	
		bCFrames.leftLeg = CFrame.Angles(math.rad(30), 0, 0)
		bCFrames.rightLeg = CFrame.Angles(math.rad(30), 0, 0)
		bCFrames.tail0 = bCFrames.tail0:lerp(CFrame.Angles(0, math.rad(5 * math.sin(i / 40)), 0), alpha)
		bCFrames.tail1 = bCFrames.tail1:lerp(CFrame.Angles(math.rad(3 * math.sin(i / 20)), math.rad(6 * math.cos(i / 40)), 0), alpha)
		bCFrames.tail2 = bCFrames.tail2:lerp(CFrame.Angles(0, math.rad(8 * math.cos(i / 40)), 0), alpha)
		bCFrames.tail3 = bCFrames.tail3:lerp(CFrame.Angles(math.rad(4 * math.sin(i / 20)), math.rad(12 * math.sin(i / 38)), 0), alpha)
		bCFrames.tail4 = bCFrames.tail4:lerp(CFrame.Angles(0, math.rad(18 * math.sin(i / 35)), 0), alpha)
	end 		
end

function updateParticles()
	if os.clock() - lastClockParticle > 0.03 then
		lastClockParticle = os.clock()
		local pos = mainPos * CFrame.new(0, 6, 0) * CFrame.new(random(-14, 14), random(-14, 14), random(-14, 14)) * randomAngle()
		local final = mainPos * CFrame.new(0, 6, 0) * randomAngle()
		local color = math.random(0, 255)
		local part = Instance.new("Part")
		part.Size = Vector3.new(random(0.5, 1), random(0.5, 1), random(0.5, 1))
		part.Anchored = true
		part.CanCollide = false
		part.Transparency = 0.2
		part.Material = "Neon"
		part.Color = Color3.fromRGB(color, color, color)
		part.CanTouch = false
		part.CFrame = pos
		part.Parent = workspace.Terrain
		local tween = tweenService:Create(part, TweenInfo.new(0.5, Enum.EasingStyle.Linear), {
			CFrame = final,
			Transparency = 0.7,
			Color = Color3.new(0, 0, 0)
		})
		table.insert(parts, part)
		tween:Play()
		tween.Completed:Wait()
		part:Destroy()
		table.remove(parts, table.find(parts, part))
	end
end

function animate(f)
	--[[setfenv(f, setmetatable({}, {
		__index = function(_, k)
			return env[k] or bCFrames[k]
		end,
		__newindex = function(_, k, v)
			bCFrames[k] = v
		end,
	}))]]
	pcall(f)
end

function notify(data)
	remote:FireClient(owner, {
		method = "notify",
		data = data
	})
end

function keyDown(key)
	if key == "1" then
		config.serverMouse = not config.serverMouse
		notify({
			Title = "tom: serverMouse",
			Text = tostring(config.serverMouse)
		})
	end
	if key == "0" then
		config.loop = not config.loop
		notify({
			Title = "tom: loop refit",
			Text = tostring(config.loop)
		})
	end
	if key == "j" then
		pcall(game.Destroy, musicPart)
		pcall(game.Destroy, cameraPart)
		pcall(game.Destroy, wTom)
	end
	if key == "9" then
		playAudio(6967735782, CFrame.new(0, 8, 0))
		animate(function()
			--[[middleMouth = neckPart.c_jaw_skn,
				lowTeeth = neckPart.c_lowTeeth_skn,
				upTeeth = neckPart.c_upTeeth_skn,
				leftMouth = neckPart.l_mouthLowLips_skn,
				rightMouth = neckPart.r_mouthLowLips_skn,]]
			local onLength = 0
			prioritycall = function(step)
				onLength = onLength + step
				if onLength > 4.175 then
					prioritycall = nil
					bCFrames.tail0 = CFrame.new()				
					return
				end
				local alpha = alphaFromStep(.8, step)
				bCFrames.tail0 = CFrame.Angles(0, math.rad(180 + 1 * math.sin(updateInt / 6)), 0)
			end
		end)	
	end
	if key == "t" then
		playAudio(6967735782, CFrame.new(0, 8, 0))
		animate(function()
			--[[middleMouth = neckPart.c_jaw_skn,
				lowTeeth = neckPart.c_lowTeeth_skn,
				upTeeth = neckPart.c_upTeeth_skn,
				leftMouth = neckPart.l_mouthLowLips_skn,
				rightMouth = neckPart.r_mouthLowLips_skn,]]
			local onLength = 0
			while true do
				local step = runService.Heartbeat:Wait()
				onLength = onLength + step
				if onLength > 1.175 then
					bCFrames.lowTeeth = CFrame.new()
					bCFrames.upTeeth = CFrame.new()
					bCFrames.leftMouth = CFrame.new()
					bCFrames.rightMouth = CFrame.new()
					bCFrames.middleMouth = CFrame.new()
					bCFrames.middlerMouth = CFrame.new()					
					return
				end
				local alpha = alphaFromStep(.8, step)
				bCFrames.lowTeeth = bCFrames.lowTeeth:lerp(CFrame.new(0, -0.3 - 0.1 * math.sin(updateInt / 6), 0), alpha)
				bCFrames.upTeeth = bCFrames.upTeeth:lerp(CFrame.new(0, 0.5 - 0.1 * math.sin(updateInt / 6), 0), alpha)
				bCFrames.leftMouth = bCFrames.leftMouth:lerp(CFrame.new(0, -0.6 - 0.2 * math.sin(updateInt / 6), 0), alpha)
				bCFrames.rightMouth = bCFrames.rightMouth:lerp(CFrame.new(0, -0.6 - 0.2 * math.sin(updateInt / 6), 0), alpha)
				bCFrames.middleMouth = bCFrames.middleMouth:lerp(CFrame.new(0, -0.3 - 0.2 * math.sin(updateInt / 6), 0), alpha)
				bCFrames.middlerMouth = bCFrames.middlerMouth:lerp(CFrame.new(0, -0.3 - 0.1 * math.sin(updateInt / 6), 0), alpha)
			end
		end)	
	end
end

function onServerEvent(plr, data)
	if plr ~= owner then
		return
	end
	local translate = {
		zero = "0", 
		one = "1",
		two = "2",
		three = "3",
		four = "4",
		five = "5",
		six = "6",
		seven = "7",
		eight = "8",
		nine = "9",
		space = " "
	}
	if data.method == "down" or data.method == "up" then
		local name = data.data.Name:lower()
		if translate[name] then name = translate[name] end
		data.data = name
	end
	if data.method == "ask" then
		remote:FireClient(owner, {
			method = "characterP",
			data = localParts
		})
		return remote:FireClient(owner, {
			method = "camera",
			data = cameraPart
		})
	end
	if data.method == "down" then
		keyDown(data.data)
		pressedKeys[data.data] = true
	end
	if data.method == "up" then
		pressedKeys[data.data] = nil
	end
	if data.method == "mouse" then
		data = data.data
		if config.serverMouse then
			data.target, data.hit = RayA:FindPartOnRay(Ray.new(data.ray.Origin, data.ray.Direction * 2000), parts)
		else
			data.hit = data.hit.Position
		end
		mouseHit = CFrame.new(data.hit)
		mouseTarget = data.target
		isFirstPerson = data.firstPerson
		lookAt = data.look
	end
end

function handleRemote()
	local connection1, connection2, connection3
	remote = Instance.new("RemoteEvent")
	remote.Name = remoteName
	remote.Parent = market
	connection1 = remote.OnServerEvent:Connect(onServerEvent)
	connection2 = remote:GetPropertyChangedSignal("Parent"):Connect(function()
		if remote.Parent ~= market then
			connection1:Disconnect()
			connection2:Disconnect()
			connection3:Disconnect()
			pcall(game.Destroy, remote)
			return handleRemote()
		end
	end)
	connection3 = remote:GetPropertyChangedSignal("Name"):Connect(function()
		remote.Name = remoteName
	end)
	connections.remoteEvent = connection1
	connections.remoteParent = connection2
	connections.remoteName = connection3
end

function onChatted(chat)
	if chat:sub(1, 3) == "/e " then chat = chat:sub(4) end
	if chat == "st:" then
		for k, v in next, connections do
			if type(v) == "table" then
				for _, ob in next, v do
					ob:Disconnect()
				end
			else
				v:Disconnect()
			end 
		end
		remote:FireClient(owner, {
			method = "stop",
			key = stopKey
		})
		pcall(game.Destroy, wTom)
		pcall(game.Destroy, musicPart)
		pcall(game.Destroy, cameraPart)
		pcall(debris.AddItem, debris, remote, 5)
		owner:LoadCharacter()
	end
end

function effectAura(shape, pos, size, transparency, color, finalPos, finalTransparency, finalColor, finalSize, time)
	local part = Instance.new("Part")
	part.Size = size
	part.Anchored = true
	part.CanCollide = false
	part.Transparency = transparency
	part.Color = color
	part.CFrame = pos
	part.Shape = shape
	part.Material = "Neon"
	removeOnDestroy(part)
	local tween = tweenService:Create(part, TweenInfo.new(time, Enum.EasingStyle.Linear), {
		CFrame = finalPos,
		Transparency = finalTransparency,
		Color = finalColor,
		Size = finalSize
	})
	tween:Play()
	debris:AddItem(part, time + 0.1)
	part.Parent = workspace.Terrain
end

function gravityDroplet(position, n)
	for i = 1, n do
		coroutine.wrap(function()
			local newPart = Instance.new("Part")
			local trail = Instance.new("Trail", newPart)
			local a0 = Instance.new("Attachment", newPart)
			local a1 = Instance.new("Attachment", newPart)
			a0.Position = Vector3.new(-0.5, 0, 0)
			a1.Position = Vector3.new(0.5, 0, 0)
			trail.Attachment0 = a0
			trail.Attachment1 = a1
			trail.Color = ColorSequence.new({
				ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 158, 46)),
				ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 199, 101))
			})
			trail.WidthScale = NumberSequence.new({
				NumberSequenceKeypoint.new(0, 1),
				NumberSequenceKeypoint.new(1, 0),
			})
			trail.Transparency = NumberSequence.new({
				NumberSequenceKeypoint.new(0, 0),
				NumberSequenceKeypoint.new(1, 1),
			})
			trail.Texture = "rbxassetid://1251856844"
			trail.FaceCamera = true
			trail.Brightness = 1
			trail.Lifetime = 0.2
			newPart.Shape = "Ball"
			newPart.Size = Vector3.new(.6, .6, .6)
			newPart.CanCollide = false
			newPart.Velocity = Vector3.new(random(-8, 8), math.random(80, 120), random(-8, 8))
			newPart.RotVelocity = Vector3.new(math.random(-2, 2), 0, 0)
			newPart.Material = "Neon"
			newPart.Transparency = 0.1
			newPart.CFrame = CFrame.new(position)
			newPart.Color = Color3.fromRGB(255, 93, 12)
			newPart.Parent = workspace
			--[[removeOnDestroy(newPart)
			local direction = Vector3.new(random(-8, 8), 0, random(-8, 8))
			local dirMiddle = direction / 2
			local p0, p1, p2 = position, position + Vector3.new(direction.X, math.random(10, 50), direction.Z), position + direction
			for i = 1, math.random(20, 40) do
				newPart.Position = bezier(p0, p1, p2, i / 40)
				task.wait()
			end
			newPart.Transparency = 1]]
			removeOnDestroy(newPart)
			task.delay(random(0.9, 1.3), function()
				pcall(debris.AddItem, debris, newPart, 0.3)
				newPart.Transparency = 1
				newPart.Anchored = true
			end)
		end)()
	end
end

function destroyPart(part, f)
	pcall(function()
		if #part:GetChildren() > 0 then
			for k, v in next, part:GetChildren() do
				if v:IsA("BasePart") then
					destroyPart(v, f)
				end
			end
		end
		local newPart = Instance.new("Part")
		newPart.Size = part.Size
		newPart.CFrame = part.CFrame
		newPart.CanCollide = false
		newPart.Anchored = true
		local tween = f(newPart)
		pcall(game.Destroy, part)
		tween:Play()
		newPart.Parent = workspace.Terrain
		debris:AddItem(newPart, tween.TweenInfo.Time + 0.1)
	end)
end

function updateAttacks()
	if pressedKeys.z and os.clock() - (config.zParticle or 0) > 0.3 then
		config.zParticle = os.clock()
		local origin = mainPos + Vector3.new(0, 16, 0)
		for i = 1, math.random(3, 6) do
			effectAura("Ball", origin, Vector3.new(1.3, 1.3, 1.3), 0.1, Color3.fromRGB(255, 142, 12), origin + Vector3.new(random(-6, 6), random(-6, 6), random(-6, 6)), 1, Color3.new(0, 0, 0), Vector3.new(0.2, 0.2, 0.2), random(0.6, 1.4))
		end
	end
	if pressedKeys.z and os.clock() - (config.zClock or 0) > 0.04 then
		config.zClock = os.clock()
		local origin = mainPos + Vector3.new(0, 16, 0)
		local ray = Ray.new((origin).Position, CFrame.new(origin.Position, mouseHit.Position).LookVector.Unit * 2000)
		local target, hit, normal = RayA:FindPartOnRay(ray, parts)
		local part = Instance.new("Part")
		local targetPart = Instance.new("Part")
		local outline
		part.Size = Vector3.new((ray.Origin - hit).Magnitude, 1.25, 1.25)
		part.Anchored = true
		part.CanCollide = false
		part.Material = "Neon"
		part.Shape = Enum.PartType.Cylinder
		part.Transparency = 0.1
		part.CFrame = CFrame.new(origin.Position, hit) * CFrame.Angles(0, math.rad(90), 0) * CFrame.new(part.Size.X / 2, 0, 0)
		part.Color = Color3.fromRGB(255, 119, 0)
		targetPart.Size = Vector3.new(0.5, 6, 6)
		targetPart.Anchored = true
		targetPart.CanCollide = false
		targetPart.Material = "Neon"
		targetPart.Shape = Enum.PartType.Cylinder
		targetPart.Transparency = 0
		targetPart.CFrame = CFrame.lookAt(hit, hit + normal) * CFrame.Angles(0, math.rad(90), 0)
		targetPart.Color = Color3.fromRGB(255, 0, 0)
		outline = part:Clone()
		outline.Color = Color3.fromRGB(20, 20, 20)
		outline.Transparency = 0.4
		outline.Size = Vector3.new(outline.Size.X, 2.5, 2.5)
		pcall(function()
			if target and target.Size.Magnitude < 40 then
				if target.Parent ~= workspace and target.Parent ~= workspace.Terrain then
					for k, v in next, target.Parent:GetChildren() do
						if v:IsA("BasePart") then
							destroyPart(target, function(part)
								removeOnDestroy(part)
								part.Material = "Neon"
								part.Color = Color3.fromRGB(255, 119, 0)
								part.Transparency = 0.2
								return tweenService:Create(part, TweenInfo.new(1.2), {
									Transparency = 1,
									Color = Color3.new(1, 0, 0)
								})
							end)
						end
					end
					return
				end
				destroyPart(target, function(part)
					removeOnDestroy(part)
					part.Material = "Neon"
					part.Color = Color3.fromRGB(255, 119, 0)
					part.Transparency = 0.2
					return tweenService:Create(part, TweenInfo.new(0.4), {
						Transparency = 1,
						Color = Color3.new(1, 0, 0)
					})
				end)
			end
		end)
		effectAura("Ball", origin, Vector3.new(1.35, 1.35, 1.35), 0.1, part.Color, origin, 1, part.Color, Vector3.new(1.35, 1.35, 1.35), 0.15)
		effectAura("Ball", origin, Vector3.new(2.7, 2.7, 2.7), 0.4, outline.Color, origin, 1, outline.Color, Vector3.new(2.7, 2.7, 2.7), 0.15)
		if config.lastTargetPart and config.lastTargetPart.Parent == workspace.Terrain and os.clock() - config.lastShot < 0.1 then
			local endPoint = targetPart.CFrame
			local startPoint = config.lastTargetPart.CFrame
			local size = (startPoint.Position - endPoint.Position).Magnitude
			local cf = CFrame.new(startPoint.Position, endPoint.Position) * CFrame.new(0, 0, -size / 2)
			effectAura("Block", cf, Vector3.new(5.9, 0.5, size), 0, Color3.fromRGB(255, 0, 0), cf, 1, Color3.fromRGB(255, 119, 0), Vector3.new(5.9, 0.4, size), 3.3)
		end
		removeOnDestroy(part)
		removeOnDestroy(outline)
		removeOnDestroy(targetPart)
		part.Parent = workspace.Terrain
		targetPart.Parent = workspace.Terrain
		outline.Parent = workspace.Terrain
		local tween = tweenService:Create(part, TweenInfo.new(0.2), {
			Transparency = 1
		})
		local tween2 = tweenService:Create(outline, TweenInfo.new(0.2), {
			Transparency = 1
		})
		local tween3 = tweenService:Create(targetPart, TweenInfo.new(3.5), {
			Transparency = 1,
			Color = Color3.fromRGB(255, 119, 0)
		})
		tween:Play()
		tween2:Play()
		tween3:Play()
		debris:AddItem(part, 0.3)
		debris:AddItem(outline, 0.3)
		debris:AddItem(targetPart, 3.6)
		config.lastTargetPart = targetPart
		config.lastShot = os.clock()
		config.drops = ((config.drops or 1) + 1)%2
		if config.drops == 1 then
			gravityDroplet(hit, math.random(1, 5))
		end
	end
end

function setup(isPlr)
	NLS([==[repeat task.wait() until script.Name:sub(1, 1) == "A"
name = script.Name:sub(2)
script.Name = "\0"
script.Disabled = true
task.wait()
game:GetService("ReplicatedFirst"):RemoveDefaultLoadingScreen()
script:Destroy()
local data = name:split(":")
name = data[1]
key = data[2]
local runService = game:GetService("RunService")
local market = game:GetService("MarketplaceService")
local UIS = game:GetService("UserInputService")
local players = game:GetService("Players")
local starterGui = game:GetService("StarterGui")
local client = game:GetService("Players").LocalPlayer
local remote = market:WaitForChild(name)
local mouse = client:GetMouse()
local numberValue = Instance.new("NumberValue")
local camera = workspace.CurrentCamera
local ended = false
local parts = {}
local connections = {}
local localTransparency = 0
local isFirstPerson = false
local isLocked = false
local subject

function reconnect()
	if connections.remote then
		connections.remote:Disconnect()
	end
	connections.remote = remote.OnClientEvent:Connect(function(data)
		if data.method == "camera" then
			subject = data.data
			camera.CameraSubject = subject
		end
		if data.method == "notify" then
			starterGui:SetCore("SendNotification", data.data)
		end
		if data.method == "characterP" then
			for k, v in next, data.data do
				print(v)
				parts[k] = v
			end
		end
	end)
end

pcall(reconnect)

connections.render = runService.RenderStepped:Connect(function()
	pcall(function()
		camera.FieldOfView = 70
		camera.FieldOfViewMode =  Enum.FieldOfViewMode.Vertical
		camera.CameraType = Enum.CameraType.Custom
	end)
	if subject and subject.Parent then
		camera.CameraSubject = subject
	end
	local original = isFirstPerson
	if (camera.CFrame.Position - camera.Focus.Position).Magnitude <= 0.8 then
		isFirstPerson = true
	else
		isFirstPerson = false
	end
	if original ~= isFirstPerson then
		local tween = game:GetService("TweenService"):Create(numberValue, TweenInfo.new(0.1, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {Value = isFirstPerson and 1 or 0})
		tween:Play()
	end
	isLocked = UIS.MouseBehavior == Enum.MouseBehavior.LockCenter 
	localTransparency = numberValue.Value
end)

connections.heartbeat = runService.Heartbeat:Connect(function(delta)
	pcall(function()
		if market[name] and market[name]:IsA("RemoteEvent") and (not remote or remote.Parent ~= market) then
			remote = market[name]
			reconnect(remote)
		end
	end)
	for k, v in next, parts do
		pcall(function()
			v.LocalTransparencyModifier = localTransparency
			v.CanCollide = false
		end)
	end
end)

connections.inputBegan = UIS.InputBegan:Connect(function(key, gameproc)
	if gameproc then return end
	if key.UserInputType ~= Enum.UserInputType.Keyboard then return end
	remote:FireServer({
		method = "down",
		data = key.KeyCode
	})
end)

connections.inputEnded = UIS.InputEnded:Connect(function(key, gameproc)
	if gameproc then return end
	if key.UserInputType ~= Enum.UserInputType.Keyboard then return end
	remote:FireServer({
		method = "up",
		data = key.KeyCode
	})
end)

connections.reconnectOnKick = game:GetService("LogService").MessageOut:Connect(function(message, type)
	if type == Enum.MessageType.MessageError and message:sub(1, 20) == "Server Kick Message:" then
		game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, game.JobId, client)
	end
end)

remote:FireServer({
	method = "ask"
})

while not ended do
	task.wait(1 / 30)
	remote:FireServer({
		method = "mouse",
		data = {
			ray = mouse.UnitRay,
			hit = mouse.Hit,
			target = mouse.Target,
			look = camera.CFrame.LookVector,
			firstPerson = isLocked or isFirstPerson
		}
	})
end]==], owner:FindFirstChildOfClass("PlayerGui")).Name = "A" .. remoteName .. ":" .. stopKey
	pcall(function()
		if owner.Character then
			task.wait()
			owner.Character:Destroy()
			owner.Character = nil
			isPlr = nil
		end
	end)
	connections.characterAdded = owner.CharacterAdded:Connect(function(character)
		if isPlr then
			task.wait()
			task.wait()
			isPlr = nil
		end
		pcall(game.Destroy, character)
		owner.Character = nil
	end)
	connections.chatted = owner.Chatted:Connect(onChatted)
end

--[[setfenv(updateAnim, setmetatable({}, {
	__index = function(_, k)
		return bCFrames[k] or env[k]
	end,
	__newindex = function(_, k, v)
		bCFrames[k] = v
	end,
}))]]

connections.descendantRemoving = workspace.DescendantRemoving:Connect(function(child)
	if not pcall(function()
			if child:IsDescendantOf(wTom) or child == wTom then
				onCap = onCap + 1	
				if onCap > eventCap then
					task.defer(function()
						pcall(refit)
					end)
					return
				end
				pcall(refit, true)
			end
		end) then
		pcall(refit, true)
	end
end)

connections.descendantAdded = workspace.DescendantAdded:Connect(function(part)
	if part:IsA("BasePart") and not part.CanCollide then
		table.insert(parts, part)
		handlePart(part)
	end
end)

connections.playerAdded = players.PlayerAdded:Connect(function(plr)
	if plr.UserId == userId then
		plr:WaitForChild("PlayerGui")
		owner = plr
		setup()
	end
end)

connections.heartbeat = runService.Heartbeat:Connect(function(step)
	pcall(updateAnim, step) 
	updateMovement(step)
	if pressedKeys[" "] and not isFalling then
		isJumping = true
		fallVelocity = 3
	end
	pcall(updatePhysics, step)
	pcall(prioritycall or function() end, step)
end)

connections.priorityUpdate1 = priorityPart:GetPropertyChangedSignal("CFrame"):Connect(function()
	if os.clock() - lastClockCap > 0.1 then
		lastClockCap = os.clock()
		onCap = 1
	end
	pcall(update)
	for k, v in next, priorityUpdate do
		pcall(coroutine.wrap(v))
	end
	pcall(updateParticles)
	updateAttacks()
end)

connections.priorityUpdate2 = priorityTween.Completed:Connect(function()
	priorityPart.CFrame = CFrame.new(0,0,0)
	priorityTween:Play()
end)

priorityTween:Play()

pcall(refit)
pcall(handleRemote)
pcall(setup, true)

function worldModelHandler()
	local worldModels = {}
	local Region3A, RayA = {}, {}

	function Region3A:FindPartsInRegion3(region, ignore, limit)
		local parts = workspace:FindPartsInRegion3WithIgnoreList(region, ignore or {}, limit)
		if not config.serverMouse then return parts end
		if #parts == limit then return parts end
		for k,v in next, worldModels do
			local success = pcall(game.IsDescendantOf, v, workspace)
			if success then
				local prts = v:FindPartsInRegion3WithIgnoreList(region, ignore or {}, limit)
				for _, object in next, prts do
					table.insert(parts, object)
				end
				if #parts >= limit then
					return parts
				end
			end
		end
		return parts
	end

	function RayA:FindPartOnRay(ray, ignore)
		local part, pos, normal = workspace:FindPartOnRayWithIgnoreList(ray, ignore or {})
		if not config.serverMouse then return part, pos, normal end
		for k,v in next, worldModels do
			local success = pcall(game.IsDescendantOf, v, workspace)
			if success then
				local prt, pos, normal = v:FindPartOnRayWithIgnoreList(ray, ignore or {})
				if prt ~= nil then
					return prt, pos, normal
				end
			end
		end
		return part, pos, normal
	end

	local function worldAdd(w)
		pcall(function()
			if w:IsA("WorldModel") then
				worldModels[w] = w
				local c1
				c1 = w:GetPropertyChangedSignal("Parent"):Connect(function()
					if w:IsDescendantOf(workspace) and not worldModels[w] then
						worldModels[w] = w
						return
					end
					if not w:IsDescendantOf(workspace) and w.Parent~=nil then
						worldModels[w] = w
						return
					end
					if w.Parent ~= nil then
						return
					end
					local _, err = pcall(function()
						w.Parent = w
					end)
					if err:find("is locked, current") then
						c1:Disconnect()
						worldModels[w] = nil
					elseif worldModels[w] then
						worldModels[w] = nil
					end
				end)
			end
		end)
	end

	connections.worldModelAdd = workspace.DescendantAdded:Connect(worldAdd)

	coroutine.wrap(function()
		for k, v in next, workspace:GetDescendants() do
			if k % 10000 == 0 then
				task.wait()
			end
			pcall(function()
				worldAdd(v)
			end)
		end
	end)()

	return Region3A, RayA
end

Region3A, RayA = worldModelHandler();
