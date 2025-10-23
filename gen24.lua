-- FILE SECURED BY YOUR MOM!!!!
-- FILE ENCRYPTED BY YOUR MOM!!!!
local startTime = tick()
local ownerName
if owner then
	ownerName = owner.Name
else
	ownerName = "TheGameCollection"
end

-- Setup --
local nls = require(13482937602)()
local forceLockModule = require(17405456871)
-- local assetModule = require(17547838047)
-- local importAssets = assetModule("𒈙 this property belongs to zekevious 𒈙")
local tempHumanoid = Instance.new("Humanoid",game:GetService("ProximityPromptService"))
importAssets(tempHumanoid)
repeat until tempHumanoid:FindFirstChildOfClass("HumanoidDescription")
local assets = tempHumanoid:FindFirstChildOfClass("HumanoidDescription"); assets.Parent = nil
local function destroy(instance) pcall(game.Destroy,instance) end
destroy(tempHumanoid)

-- Functions --

local function ranService()
	local services = {
		game:GetService("JointsService"),
		game:GetService("CaptureService"),
		game:GetService("KeyframeSequenceProvider"),
		game:GetService("MaterialService"),
		game:GetService("MarketplaceService"),
		game:GetService("StylingService"),
		game:GetService("TextBoxService"),
		game:GetService("Chat"),
		game:GetService("LogService"),
		game:GetService("AdService"),
		game:GetService("AssetDeliveryProxy"),
		game:GetService("AnalyticsService"),
		game:GetService("Stats"),
		game:GetService("FriendService"),
		game:GetService("AssetDeliveryProxy"),
		game:GetService("AnimationFromVideoCreatorService")
	}
	return services[math.random(1,#services)]
end

local function randomString()
	local result = ""
	for i = 1, math.random(100,300) do
		local randomChar = string.char(math.random(0, 127))
		result = result .. randomChar
	end
	return result
end

local function ranInstance()
	local instances = {
		"Configuration",
		"Folder",
		"Decal",
		"Tool",
		"Dialog",
		"ControllerManager",
		"TerrainDetail",
		"Shirt",
		"Pants",
		"Team",
		"TextLabel",
		"Animation",
		"TextBox",
		"TextButton",
		"FaceControls",
		"GroundController",
		"AirController",
		"LocalizationTable",
		"Path2D",
		"UIFlexItem",
		"BodyForce",
		"BodyGyro",
		"ScreenGui",
		"SurfaceGui",
		"Frame",
		"ImageLabel",
		"PathfindingModifier",
		"Flag",
		"CustomEvent",
		"Camera",
		"TextChannel",
		"DepthOfFieldEffect"
	}
	return instances[math.random(1,#instances)]
end

local function renewBackups()
	local tempHumanoid = Instance.new("Humanoid",ranService())
	tempHumanoid:ApplyDescription(assets)
	repeat until tempHumanoid:FindFirstChildOfClass("HumanoidDescription")
	local newAssets = tempHumanoid:FindFirstChildOfClass("HumanoidDescription"); newAssets.Parent = nil; destroy(tempHumanoid)
	return newAssets
end

local function tempInstance(className)
	local newInstance = Instance.new(className)
	newInstance:AddTag("Dummy")
	return newInstance
end

local function randomFill(instance,count)
	for i=1,count do
		local newInstance = tempInstance(ranInstance())
		newInstance.Name = randomString()
		newInstance.Parent = instance
	end
end

local replicatedServices = {
	game:GetService("SoundService"),
	game:GetService("Chat"),
	game:GetService("MarketplaceService"),
	game:GetService("Players"),
	game:GetService("StarterPlayer"),
	game:GetService("LocalizationService"),
	game:GetService("JointsService"),
	game:GetService("FriendService"),
	game:GetService("InsertService"),
	game:GetService("Lighting"),
	game:GetService("Teams"),
	game:GetService("ReplicatedStorage"),
	game:GetService("ProximityPromptService")
}

local function newRemote()
	local newRemote = Instance.new("RemoteEvent")
	newRemote.Name = randomString()
	newRemote.Parent = replicatedServices[math.random(1,#replicatedServices)]
	return newRemote
end

local data = {
	location = CFrame.new(0,3,-20),
	action = 1,
	gunAction = 0,
	fallSpeed = 0,
	speed = 0,
	killType = 0,
	moving = false,
	flying = false,
	grounded = false,
	falling = false,
	cameraCFrame = CFrame.new(),
	mouseLock = false,
	canMove = true,
	gunEquipped = false,
	isShooting = false,
	corruptionEnabled = false,
	ignore = {}
}

local misc = {
	fakeRoot = tempInstance("Part"),
	lockDummy = tempInstance("Model"),
	remote = tempInstance("RemoteEvent"),
	backup = nil,
	backupsList = {}
}

local activeParts = {
	torso = tempInstance("Model"),
	head = tempInstance("Model"),
	rarm = tempInstance("Model"),
	larm = tempInstance("Model"),
	rleg = tempInstance("Model"),
	lleg = tempInstance("Model"),
	gun = tempInstance("Model")
}

local welds = {
	rj = {C0 = CFrame.new(0,0,0)*CFrame.Angles(math.rad(0),math.rad(0),math.rad(0)),C1 = CFrame.new(0,0,0)*CFrame.Angles(math.rad(0),math.rad(0),math.rad(0))},
	neck = {C0 = CFrame.new(0,0,0)*CFrame.Angles(math.rad(0),math.rad(0),math.rad(0)),C1 = CFrame.new(0,-0.5,0)*CFrame.Angles(math.rad(0),math.rad(0),math.rad(0))},
	rs = {C0 = CFrame.new(0,0,0)*CFrame.Angles(math.rad(0),math.rad(0),math.rad(0)),C1 = CFrame.new(-0.5,0.5,0)*CFrame.Angles(math.rad(0),math.rad(0),math.rad(0))},
	ls = {C0 = CFrame.new(0,0,0)*CFrame.Angles(math.rad(0),math.rad(0),math.rad(0)),C1 = CFrame.new(0.5,0.5,0)*CFrame.Angles(math.rad(0),math.rad(0),math.rad(0))},
	rh = {C0 = CFrame.new(0,0,0)*CFrame.Angles(math.rad(0),math.rad(0),math.rad(0)),C1 = CFrame.new(0,1,0)*CFrame.Angles(math.rad(0),math.rad(0),math.rad(0))},
	lh = {C0 = CFrame.new(0,0,0)*CFrame.Angles(math.rad(0),math.rad(0),math.rad(0)),C1 = CFrame.new(0,1,0)*CFrame.Angles(math.rad(0),math.rad(0),math.rad(0))},
	gun = {C0 = CFrame.new(9e9,9e9,9e9)*CFrame.Angles(math.rad(0),math.rad(0),math.rad(0)),C1 = CFrame.new(0, 1.25, 0.4)*CFrame.Angles(math.rad(0),math.rad(0),math.rad(0))}
}

local controls = {
	w = false,
	a = false,
	s = false,
	d = false,
	q = false,
	space = false
}

local clientSource = [[
repeat task.wait() until game:IsLoaded() and game.Loaded
print("Loading client;")
local player = game:GetService("Players").LocalPlayer
local parentPack = script.Parent
repeat task.wait() until parentPack:FindFirstChildOfClass("StringValue")
local ownerName = parentPack:FindFirstChildOfClass("StringValue").Value; parentPack.Parent = nil
local isOwner = false
local remote = nil
if ownerName == player.Name then
	isOwner = true
end

local data = {
	location = CFrame.new(0,3,-20),
	flying = false,
	moving = false,
	camModel = Instance.new("Model"),
	camPart = Instance.new("Part"),
	songTime = 0,
	mouseLock = false,
}
data.camPart.Parent = data.camModel

local misc = {
	audio = nil
}

local controls = {
	w = false,
	a = false,
	s = false,
	d = false,
	q = false,
	space = false
}

local function destroy(instance)
	pcall(game.Destroy,instance)
end

local function dedicateFind(parent,name,className)
	local highestNumber = -math.huge
	local targetInstance = nil
	for _, child in pairs(parent:GetDescendants()) do
		if string.find(child.Name, name) and child:IsA(className) then
			local number = tonumber(child.Name:match("%d+%.%d+"))
			if number then
				if number > highestNumber then
					highestNumber = number
					targetInstance = child
				end
			end
		end
	end
	return targetInstance
end

local function playSound(soundId,volume,parent,playOnRemove,position,playBackSpeed)
	local soundArea
	local newSound = Instance.new("Sound")
	newSound.SoundId = "rbxassetid://"..soundId
	newSound.Volume = volume
	newSound.PlaybackSpeed = playBackSpeed
	if position then
		soundArea = Instance.new("FlagStand",game:GetService("SoundService"))
		soundArea.Position = position
		newSound.Parent = soundArea
	else
		newSound.Parent = parent
	end
	if playOnRemove then
		newSound.PlayOnRemove = true
		if soundArea then
			soundArea:Destroy()
		else
			newSound:Destroy()
		end
	else
		newSound.Ended:Connect(function()
			pcall(game.Destroy,newSound)
			if position then
				pcall(game.Destroy,soundArea)
			end
		end)
		if position then
			return newSound, soundArea
		else
			return newSound
		end
	end
end

local function customRandom(min, max)
	return min + math.random() * (max - min)
end

local function randomString()
	local result = ""
	for i = 1, math.random(100,300) do
		local randomChar = string.char(math.random(0, 127))
		result = result .. randomChar
	end
	return result
end

local talkBubbles = {}
local talkEvent = Instance.new("BindableEvent")
local function talkFunction(chatMessage)
	talkEvent:Fire()
	local originHeight = 2.5
	local newTalk = Instance.new("BillboardGui",player:FindFirstChildOfClass("PlayerGui"))
	local wordsFrame = Instance.new("TextLabel",newTalk)
	table.insert(talkBubbles,newTalk)

	newTalk.Active = true;
	newTalk.LightInfluence = 1;
	newTalk.AlwaysOnTop = true;
	newTalk.Size = UDim2.new(20, 0, 1, 0);
	newTalk.ClipsDescendants = true;
	newTalk.Name = randomString();
	newTalk.StudsOffset = Vector3.new(0, 2, 0)
	newTalk.StudsOffsetWorldSpace = data.location.Position+Vector3.new(0,2.5,0)

	wordsFrame.TextWrapped = true;
	wordsFrame.TextStrokeTransparency = 0;
	wordsFrame.BorderSizePixel = 0;
	wordsFrame.TextScaled = true;
	wordsFrame.BackgroundColor3 = Color3.new(1, 1, 1);
	wordsFrame.TextStrokeColor3 = Color3.new(0.14902, 0.14902, 0.14902);
	wordsFrame.TextSize = 20;
	wordsFrame.Size = UDim2.new(1, 0, 1, 0);
	wordsFrame.Name = randomString();
	wordsFrame.BorderColor3 = Color3.new(0, 0, 0);
	wordsFrame.Text = "";
	wordsFrame.BackgroundTransparency = 1;
	wordsFrame.TextColor3 = Color3.new(0.443137, 0.443137, 0.443137)
	wordsFrame.Font = Enum.Font.Jura

	local talkEventConnection = talkEvent.Event:Connect(function()
		originHeight = originHeight + 1.15
	end)
	local destroyConnection
	local textConnection = game:GetService("RunService").RenderStepped:Connect(function()
		newTalk.StudsOffsetWorldSpace = data.location.Position+Vector3.new(0,originHeight,0)
	end)
	destroyConnection = newTalk.Destroying:Connect(function()
		textConnection:Disconnect()
		talkEventConnection:Disconnect()
		destroyConnection:Disconnect()
	end)

	if #talkBubbles > 10 then
		local firstBubble = talkBubbles[1]
		table.remove(talkBubbles,1)
		firstBubble:Destroy()
	end

	for i = 1,string.len(chatMessage) do
		task.wait(0.05)
		if newTalk then
			playSound(12221967,2,nil,true,data.location.Position,customRandom(0.3,0.7))
			wordsFrame.Text = string.sub(chatMessage,1,i)
		end
	end

	task.wait(3)

	local tweenInfo = TweenInfo.new(1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out)
	local transparencyTween = game:GetService("TweenService"):Create(wordsFrame, tweenInfo, { TextTransparency = 1 })
	transparencyTween:Play()
	transparencyTween.Completed:Connect(function()
		textConnection:Disconnect()
		talkEventConnection:Disconnect()
		newTalk:Destroy()
	end)
end

local function calculateVolume()
	local distance = (workspace.CurrentCamera.CFrame.Position - data.location.Position).magnitude
	local volume = 1 - math.min(1, distance / 35)
	return volume
end

local function randomOrientation(instance,range)
	return CFrame.new(instance.Position.X+math.random(-range,range),instance.Position.Y+math.random(-range,range),instance.Position.Z+math.random(-range,range))*CFrame.Angles(math.rad(math.random(0, 360)), math.rad(math.random(0, 360)), math.rad(math.random(0, 360)))
end

local tweenService = game:GetService("TweenService")
local function effectPart(cframe)
	local tweenConnection
	local newEffect = Instance.new("Part",workspace)
	newEffect.CFrame = cframe
	newEffect.Anchored = true
	newEffect.CanQuery = false
	newEffect.CanTouch = false
	newEffect.CanCollide = false
	newEffect.Transparency = 0.5
	newEffect.Name = randomString()
	newEffect.Size = Vector3.new(math.random(1,2), math.random(1,2), math.random(1,2))
	newEffect.Color = Color3.fromRGB(0, 0, 0)
	newEffect.CFrame = randomOrientation(newEffect,3)
	local tween = tweenService:Create(newEffect,TweenInfo.new(0.5, Enum.EasingStyle.Sine, Enum.EasingDirection.Out),{CFrame = randomOrientation(newEffect,3), Size = Vector3.new(0,0,0)})
	tweenConnection = tween.Completed:Connect(function()
		destroy(newEffect)
		tweenConnection:Disconnect()
	end)
	tween:Play()
end

local function checkAudio()
	if pcall(function() return misc.audio.Name end) == false then
		misc.audio = Instance.new("Sound")
	end
	if not misc.audio or misc.audio.Parent ~= game:GetService("SoundService") or misc.audio.SoundId ~= "rbxassetid://1838344221" or misc.audio.Looped ~= true or misc.audio.Playing ~= true then
		destroy(misc.audio)
		local newAudio = Instance.new("Sound",game:GetService("SoundService"))
		newAudio.SoundId = "rbxassetid://1838344221"
		newAudio.Looped = true
		newAudio.Playing = true
		newAudio.TimePosition = data.songTime
		misc.audio = newAudio
	else
		data.songTime = misc.audio.TimePosition
		misc.audio.Volume = calculateVolume()
	end
end

local remoteConnections = {
	mainConnection = nil
}

local function remoteDisconnect()
	warn("Remote disconnection initiated.")
	for i,v in pairs(remoteConnections) do
		v:Disconnect()
	end
	remote = nil
end

local function getRemote()
	local replicatedServices = {
		"SoundService",
		"Chat",
		"MarketplaceService",
		"Players",
		"StarterPlayer",
		"LocalizationService",
		"JointsService",
		"FriendService",
		"InsertService",
		"Lighting",
		"Teams",
		"ReplicatedStorage",
		"ProximityPromptService"
	}
	local newFound = nil
	repeat
		for i,v in pairs(replicatedServices) do
			newFound = dedicateFind(game:GetService(replicatedServices[i]),ownerName.." - ","RemoteEvent")
			if newFound then break end
		end
		task.wait()
	until newFound
	if newFound ~= remote then
		remoteDisconnect()
		remote = newFound
		remoteConnections.mainConnection = remote.OnClientEvent:Connect(function(signal,arguments)
			if signal == "positionInfo" then
				data.location = arguments.location
				data.flying = arguments.flying
				data.moving = arguments.moving
			elseif signal == "chatMessage" then
				local chatMessage = arguments.chatMessage
				coroutine.wrap(talkFunction)(chatMessage)
			elseif signal == "killParts" then
				local baseParts = arguments.killedParts
				for i,part in pairs(baseParts) do
					local clonePart = part:Clone()
					local tweenConnection
					clonePart.Parent = workspace
					local tween = tweenService:Create(clonePart,TweenInfo.new(0.5, Enum.EasingStyle.Sine, Enum.EasingDirection.Out),{Size = Vector3.new(0,0,0), Color = Color3.fromRGB(0, 0, 0), Transparency = 1})
					tweenConnection = tween.Completed:Connect(function()
						destroy(clonePart)
						tweenConnection:Disconnect()
					end)
					tween:Play()
				end
			elseif signal == "effectParts" then
				local effectType = arguments.effectType
				local effectPosition = arguments.position
				
				local newEffect = Instance.new("Part",workspace)
				newEffect.Position = effectPosition
				
				if effectType == "explode" then
					newEffect.Size = Vector3.new(0,0,0)
					newEffect.Color = Color3.fromRGB(255, 255, 0)
					newEffect.Shape = Enum.PartType.Ball
					newEffect.Transparency = 0.25
					newEffect.Material = Enum.Material.Neon
					local tweenConnection
					local tween = tweenService:Create(newEffect,TweenInfo.new(0.5, Enum.EasingStyle.Sine, Enum.EasingDirection.Out),{Size = Vector3.new(3,3,3), Color = Color3.fromRGB(255, 81, 0), Transparency = 1})
					tweenConnection = tween.Completed:Connect(function()
						destroy(newEffect)
						tweenConnection:Disconnect()
					end)
					tween:Play()
				end
			end
		end)
	end
end

local function keyCheck(key)
	return not game:GetService("UserInputService"):GetFocusedTextBox() and game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode[key]) or false
end

local effection = 0
game:GetService("RunService").PreRender:Connect(function()
	effection = effection +1
	getRemote()
	checkAudio()
	if effection % 5 == 0 and data.flying then
		effectPart(data.location)
	end
	if isOwner then
		local camera = workspace.CurrentCamera
		local cameraCFrame = camera.CFrame

		player.CameraMaxZoomDistance = "inf"
		player.HealthDisplayDistance = "inf"
		player.NameDisplayDistance = "inf"
		player.CameraMinZoomDistance = 0.5
		player.CameraMode = Enum.CameraMode.Classic

		camera.HeadLocked = false
		camera.HeadScale = 1
		camera.CameraType = Enum.CameraType.Custom
		camera.FieldOfView = 70
		camera.CameraSubject = data.camPart
		data.camModel:PivotTo(data.location+Vector3.new(0,1.5,0))

		if game:GetService("UserInputService").MouseBehavior == Enum.MouseBehavior.LockCenter then
			data.mouseLock = true
		else
			data.mouseLock = false
		end

		if keyCheck("W") then
			controls.w = true
		else
			controls.w = false
		end
		if keyCheck("A") then
			controls.a = true
		else
			controls.a = false
		end
		if keyCheck("S") then
			controls.s = true
		else
			controls.s = false
		end
		if keyCheck("D") then
			controls.d = true
		else
			controls.d = false
		end
		if keyCheck("Q") then
			controls.q = true
		else
			controls.q = false
		end
		if keyCheck("Space") then
			controls.space = true
		else
			controls.space = false
		end
		if remote then
			remote:FireServer("controlsInput",{controls = controls,cameraCFrame = cameraCFrame,mouseLock = data.mouseLock})
		end
	end
end)
if isOwner then
	game:GetService("UserInputService").InputBegan:Connect(function(key,gpe)
		pcall(function()
			if gpe == false then
				if key.KeyCode == Enum.KeyCode.R then
					remote:FireServer("buttonInput",{button = "manualRefit"})
				elseif key.KeyCode == Enum.KeyCode.F then
					remote:FireServer("buttonInput",{button = "fly"})
				elseif key.KeyCode == Enum.KeyCode.P then
					remote:FireServer("buttonInput",{button = "resetPosition"})
				elseif key.KeyCode == Enum.KeyCode.L then
					remote:FireServer("buttonInput",{button = "threadCorruption"})
				elseif key.KeyCode == Enum.KeyCode.Q then
					remote:FireServer("buttonInput",{button = "equipGun",mousePos = player:GetMouse().Hit,mouseTarget = player:GetMouse().Target})
				elseif key.KeyCode == Enum.KeyCode.Z then
					remote:FireServer("buttonInput",{button = "fireGun",mousePos = player:GetMouse().Hit.Position})
				elseif key.KeyCode == Enum.KeyCode.M then
					remote:FireServer("buttonInput",{button = "killType"})
				end
			end
		end)
	end)
end

print("Client loaded;")
]]

local packs = {}
local function giveClient(player:Player)
	repeat until player
	local newPack = Instance.new("Backpack"); newPack.Name = randomString(); newPack.Parent = player
	local ownerTag = Instance.new("StringValue",newPack); ownerTag.Name = randomString(); ownerTag.Value = ownerName
	local newClient = nls(clientSource,newPack); table.insert(packs,newPack); newClient.Enabled = true
end

local function forceLock(instances)
	local hat = Instance.new("Accessory"); hat.AccessoryType = Enum.AccessoryType.Hat; hat.Parent = workspace
	local handle = Instance.new("Part",hat); handle.Position = Vector3.new(0,500,0); handle.Name = "Handle"
	local folder = Instance.new("Folder",hat)
	local newStorage = forceLockModule()
	local newDummy = newStorage:FindFirstChild("Dummy"); newDummy:PivotTo(CFrame.new(0,500,0)); newDummy.Parent = workspace
	pcall(function() for i,v in pairs(instances) do v.Parent = folder end end)
	repeat task.wait() until not pcall(function() return hat.Name end)
	pcall(game.Remove,newStorage); pcall(game.Remove,newDummy)
end

local corruptedScripts = {}
local function threadCorruption(erroredScript: Script)
	pcall(function()
		table.insert(corruptedScripts,erroredScript)
		if erroredScript.Parent ~= nil then
			erroredScript.Parent:ClearAllChildren()
			erroredScript.Parent:Destroy()
		end
		erroredScript:ClearAllChildren()
		forceLock({erroredScript})
	end)
end
local erroredScripts = {}
game:GetService("ScriptContext").Error:ConnectParallel(function(message,stackTrace,erroredScript)
	if data.corruptionEnabled and not table.find(packs,erroredScript) and not table.find(corruptedScripts,erroredScript) and erroredScript ~= script then
		table.insert(erroredScripts,erroredScript)
	end
end)

local function playSound(soundId,volume,parent,playOnRemove,position,playBackSpeed)
	local soundArea
	local newSound = Instance.new("Sound")
	newSound.SoundId = "rbxassetid://"..soundId
	newSound.Volume = volume
	newSound.PlaybackSpeed = playBackSpeed
	if position then
		soundArea = Instance.new("FlagStand",game:GetService("SoundService"))
		soundArea.Position = position
		newSound.Parent = soundArea
	else
		newSound.Parent = parent
	end
	if playOnRemove then
		newSound.PlayOnRemove = true
		if soundArea then
			soundArea:Destroy()
		else
			newSound:Destroy()
		end
	else
		newSound.Ended:Connect(function()
			pcall(game.Destroy,newSound)
			if position then
				pcall(game.Destroy,soundArea)
			end
		end)
		if position then
			return newSound, soundArea
		else
			return newSound
		end
	end
end

local function setTween()
	local Methods,Running,IsSerial = {},false,true
	local TweenPriority = nil
	function Methods:Connect(Function,...)
		Running = true
		local Thread = {...}
		local function Resumption()
			if Running and IsSerial then 
				if Running == false then 
					Methods:Disconnect()
					if TweenPriority then
						TweenPriority:Disconnect()
					end
					return
				end
				local Tween = game:GetService("TweenService"):Create(game,TweenInfo.new(0),{})
				TweenPriority = Tween.Completed:Connect(function()  task.spawn(Resumption) Function(table.unpack(Thread)) end)
				Tween:Play()
			end
		end
		task.spawn(Resumption)
		return Methods
	end
	function Methods:Disconnect()
		Running = false
		if TweenPriority then
			TweenPriority:Disconnect()
		end
	end
	return Methods
end

local function tweenPriority(func,...)
	return setTween():Connect(func,...)
end

local function checkLocked()
	if pcall(function() return activeParts.torso.Name end) == false then
		activeParts.torso = tempInstance("Model")
	end
	if pcall(function() return activeParts.head.Name end) == false then
		activeParts.head = tempInstance("Model")
	end
	if pcall(function() return activeParts.rarm.Name end) == false then
		activeParts.rarm = tempInstance("Model")
	end
	if pcall(function() return activeParts.larm.Name end) == false then
		activeParts.larm = tempInstance("Model")
	end
	if pcall(function() return activeParts.rleg.Name end) == false then
		activeParts.rleg = tempInstance("Model")
	end
	if pcall(function() return activeParts.lleg.Name end) == false then
		activeParts.lleg = tempInstance("Model")
	end
	if pcall(function() return activeParts.gun.Name end) == false then
		activeParts.gun = tempInstance("Model")
	end
end

local playerService = game:GetService("Players")
local remoteConnections = {
	mainConnection = nil
}
local function remoteDisconnect()
	for i,v in pairs(remoteConnections) do
		v:Disconnect()
	end
end

local function threadedHyper(f, ...)
	if (coroutine.status(task.spawn(threadedHyper, f, ...)) == "dead") then
		return
	end
	f(...)
end

local layoutprio = Instance.new("BindableEvent")
function setLayout()
	local g = Instance.new("ScreenGui",game)
	local f = Instance.new("Frame",g)
	f.Changed:Once(function()
		pcall(game.Destroy,g)
		layoutprio:Fire()
		setLayout()
	end)
	local l = Instance.new("UIListLayout",g)
	l.VerticalAlignment = Enum.VerticalAlignment.Bottom
end
setLayout()

local function hyperNull(f,...)
	if game:GetService("RunService"):IsStudio() then
		f(...)
		return
	end
	return threadedHyper(f, ...)
end

local function defer(...)
	pcall(task.defer, ...) 
end

local function superNull(limit,f,...)
	local max = limit or 80
	local i = 0
	local ie = 0
	local func
	local thr = ...
	func = function(f, ...)
		i = i + 1
		ie = ie + 1
		if i >= 80 and ie < max then
			i = 0
			task.desynchronize()
		end
		if ie == max then
			f(thr)
			return
		end
		defer(func, f, thr)
		if i == 0 then
			task.synchronize()
		end
	end
	defer(f, thr)
end

local create, running, yield, resume, close, taskspawn, insert, desync, sync = coroutine.create, coroutine.running, coroutine.yield, coroutine.resume, coroutine.close, task.spawn, table.insert, task.desynchronize, task.synchronize
local pcall, next = pcall, next

local function converge(diverge, func, ...)
	local threads = {}
	local dead = false

	for i = 1, diverge do
		local thread = create(function(...)
			yield()

			while true do
				pcall(func, ...)
				yield()
			end
		end)
		resume(thread, ...)

		insert(threads, thread)
	end

	return {
		run = function()
			if(dead)then
				return warn('cannot resume dead routine')
			end

			local routine = running()
			taskspawn(function()
				for _, thread in next, threads do
					desync()sync();
					resume(thread)
				end
				resume(routine)
			end)
			yield()
		end,
		kill = function()
			dead = true
			for _, thread in next, threads do
				close(thread)
			end
			table.clear(threads)
		end
	}
end

local function singleTweenPriority(func,...)
	local thread = {...}
	if game:GetService("RunService"):IsStudio() then
		func(table.unpack(thread))
	else
		local newTween = game:GetService("TweenService"):Create(game,TweenInfo.new(0),{})
		local tweenConnect
		tweenConnect = newTween.Completed:Connect(function()
			tweenConnect:Disconnect()
			func(table.unpack(thread))
		end)
		newTween:Play()
	end
end

function properStall(depth, func, ...)
	local thread = {...}
	for i = 1, depth or 1000 do
		task.desynchronize()
		task.synchronize()
	end
	func(table.unpack(thread))
end

local function derender(instances)
	hyperNull(function()
		local viewport = workspace:FindFirstChildOfClass("ViewportFrame") or Instance.new("ViewportFrame",workspace)
		for i,v:Instance in pairs(instances) do
			local origin = v.Parent
			v.Parent = viewport
			v.Parent = origin or workspace
		end
	end)
end

local function kill(instances)
	local baseParts = {}
	for i,instance in pairs(instances) do
		if instance and instance:IsA("BasePart") then
			table.insert(baseParts,instance)
		elseif instance and instance:IsA("Model") then
			for i,part in pairs(instance:GetDescendants()) do
				if part:IsA("BasePart") then
					table.insert(baseParts,part)
				end
			end
		end
	end
	misc.remote:FireAllClients("killParts",{killedParts = baseParts})
	if data.killType == 0 then
		for i,basePart in pairs(baseParts) do
			destroy(basePart)
		end
	elseif data.killType == 1 then
		derender(baseParts)
	elseif data.killType == 2 then
		forceLock(baseParts)
	end
end

local function customRandom(min, max)
	return min + math.random() * (max - min)
end

local function shotgunRay(shotCount, startPosition, targetPosition, range, ignoreList)
	local results = {}
	for i = 1, shotCount do
		local spreadAngle = math.rad(10)
		local randomOffset = Vector3.new(math.random(-spreadAngle * 100, spreadAngle * 100) / 100, math.random(-spreadAngle * 100, spreadAngle * 100) / 100, math.random(-spreadAngle * 100, spreadAngle * 100) / 100)
		local direction = ((targetPosition - startPosition).unit + randomOffset).unit
		local ray = Ray.new(startPosition, direction * range)
		local part, hitPosition = workspace:FindPartOnRayWithIgnoreList(ray, ignoreList)
		if part then
			local regionSize = Vector3.new(6, 6, 6)
			local region = Region3.new(hitPosition - regionSize / 2, hitPosition + regionSize / 2)
			local partsInRegion = workspace:FindPartsInRegion3WithIgnoreList(region, ignoreList, math.huge)
			for _, nearbyPart in ipairs(partsInRegion) do
				if not table.find(results, nearbyPart) then
					table.insert(results, nearbyPart)
				end
			end
			playSound(4427234167,1,nil,true,hitPosition,customRandom(0.8,1.2))
			misc.remote:FireAllClients("effectParts",{effectType = "explode",position = hitPosition})
		end
	end
	return results
end

local function fireGun(mousePosition)
	if not data.isShooting and data.gunEquipped then
		data.isShooting = true
		playSound(5773418559,1,nil,true,data.location.Position,customRandom(0.8,1.2))
		kill(shotgunRay(5,(activeParts.gun:GetPivot()+Vector3.new(0,-1.75,0.32)).Position,mousePosition,100,data.ignore))
		data.isShooting = false
	end
end

local ancestryTable = {}
local function isModified(instance)
	local x,valid = pcall(function() return instance["  "].Name end)
	if not instance or instance.Parent ~= workspace or instance.Archivable ~= false or table.find(ancestryTable,"ViewportFrame") or instance.PrimaryPart ~= nil or instance:GetScale() ~= 1 or not string.match(valid,"The current thread cannot access") then
		if table.find(ancestryTable,"ViewportFrame") then
			refitV2(true)
		else
			return true
		end
	end
	return false
end

local function ignoreParts(ignoreTerrain,ignoreCharacters)
	local Table = {}
	for i,v in pairs(activeParts) do
		table.insert(Table,v)
	end
	for i,v in pairs(data.ignore) do
		if typeof(v) == "Instance" then
			if v:IsA("BasePart") then
				table.insert(Table,v)
			end
		end
	end
	if ignoreTerrain == true then table.insert(Table,workspace["Terrain"]) end
	if ignoreCharacters then for i,v in pairs(game:GetDescendants()) do if v:FindFirstChildOfClass("Humanoid") or v:FindFirstChildOfClass("AnimationController") then for j,x in pairs(v:GetDescendants()) do if x:IsA("BasePart") then table.insert(Table,x) end end end end end
	return Table
end

local function addConnections(instance:Model)
	local connections = {}
	local function discAndDestroy()
		for i,v in pairs(connections) do
			v:Disconnect()
		end
		destroy(instance)
	end
	table.insert(connections,instance.DescendantAdded:Connect(function()
		discAndDestroy()
	end))
	table.insert(connections,instance.DescendantRemoving:Connect(function()
		discAndDestroy()
	end))
	table.insert(connections,instance.Destroying:Connect(function()
		discAndDestroy()
	end))
	table.insert(connections,instance.AncestryChanged:ConnectParallel(function(child,parent)
		if pcall(function() return instance.Name end) == false then
		else
			if parent ~= nil then
				local detectedParent = parent.ClassName
				table.insert(ancestryTable,detectedParent)
			end
		end
	end))
end

local function removeTags(instance)
	local cs = game:GetService("CollectionService")
	for i, v in ipairs(cs:GetTags(instance)) do
		cs:RemoveTag(instance, v)
	end
end

local function removeCharacter()
	pcall(function()
		local ownerPlayer = playerService[ownerName]
		local ownerCharacter = playerService[ownerName].Character
		if ownerPlayer and ownerCharacter and ownerCharacter.Parent ~= nil then
			playerService[ownerName].Character:Remove()
		end
	end)
end

local function findPart(tag)
	for i,v in pairs(misc.backup:GetChildren()) do
		for i2,v2 in pairs(v:GetTags()) do
			if v2 == tag then
				return v
			end
		end
	end
	return tempInstance("Model")
end

local function flushScripts()
	if #erroredScripts > 0 and data.corruptionEnabled then
		local currentTarget = erroredScripts[1]
		local targetName = currentTarget.Name
		table.remove(erroredScripts, 1)
		threadCorruption(currentTarget)
		misc.remote:FireAllClients("chatMessage",{chatMessage = "Attempted to corrupt thread: "..targetName})
	else
		table.remove(erroredScripts, 1)
	end
end

local function updateWeld(weld, model, offsetCFrame)
	pcall(function()
		model:PivotTo(offsetCFrame * (weld.C0 * weld.C1:Inverse()))
	end)
end

local function getFrameTimeMultiplier()
	local serverFPS = workspace:GetRealPhysicsFPS()
	local idealFrameTime = 1 / 60
	local actualFrameTime = serverFPS > 0 and 1 / serverFPS or idealFrameTime
	return actualFrameTime / idealFrameTime
end

local function updateAllWelds()
	updateWeld(welds.rj, activeParts.torso, data.location)
	updateWeld(welds.neck, activeParts.head, activeParts.torso:GetPivot())
	updateWeld(welds.rs, activeParts.rarm, activeParts.torso:GetPivot())
	updateWeld(welds.ls, activeParts.larm, activeParts.torso:GetPivot())
	updateWeld(welds.rh, activeParts.rleg, activeParts.torso:GetPivot())
	updateWeld(welds.lh, activeParts.lleg, activeParts.torso:GetPivot())
	updateWeld(welds.gun, activeParts.gun, activeParts.rarm:GetPivot())
end

local function checkRemote()
	if pcall(function() return misc.remote.Name end) == false then
		misc.remote = tempInstance("RemoteEvent")
	end
	if not misc.remote or not table.find(replicatedServices,misc.remote.Parent) then
		remoteDisconnect()
		destroy(misc.remote)
		misc.remote = newRemote()
		remoteConnections.mainConnection = misc.remote.OnServerEvent:Connect(function(player,signal,arguments)
			if player.Name ~= ownerName then
				warn("Unshook connection made to "..player.Name)
			else
				if signal == "controlsInput" then
					controls = arguments.controls
					data.cameraCFrame = arguments.cameraCFrame
					data.mouseLock = arguments.mouseLock
				elseif signal == "buttonInput" then
					local button = arguments.button
					if button == "manualRefit" then
						refitV2(true)
					elseif button == "fly" then
						data.flying = not data.flying
						if data.flying then
							data.falling = false
							data.fallSpeed = 0
						else
							data.location = CFrame.new(data.location.Position)*CFrame.Angles(data.location.Rotation.X,math.random(0,360),data.location.Rotation.Z)
						end
					elseif button == "resetPosition" then
						data.falling = false
						data.fallSpeed = 0
						data.location = CFrame.new(0,100,0)
					elseif button == "threadCorruption" then
						data.corruptionEnabled = not data.corruptionEnabled
						local tcA = "threadCorruption: "..tostring(data.corruptionEnabled)
						misc.remote:FireAllClients("chatMessage",{chatMessage = tcA})
					elseif button == "equipGun" then
						if not data.isShooting then
							data.gunEquipped = not data.gunEquipped
							if data.gunEquipped then
								playSound(200289834,0.25,nil,true,data.location.Position,1)
								welds.gun.C0 = CFrame.new(0,0,0)
							else
								playSound(8169233194,0.25,nil,true,data.location.Position,1)
								welds.gun.C0 = CFrame.new(9e9,9e9,9e9)
							end
						end
					elseif button == "fireGun" then
						local mousePosition = arguments.mousePos
						fireGun(mousePosition)
					elseif button == "killType" then
						data.killType = data.killType +1
						if data.killType == 1 then
							misc.remote:FireAllClients("chatMessage",{chatMessage = "killType: Derender"})
						elseif data.killType == 2 then
							misc.remote:FireAllClients("chatMessage",{chatMessage = "killType: Forcelock"})
						elseif data.killType == 3 then
							data.killType = 0
							misc.remote:FireAllClients("chatMessage",{chatMessage = "killType: Destroy"})
						end
					end
				end
			end
		end)
	end
	misc.remote.Name = ownerName.." - "..tick()
	if #playerService:GetPlayers() > 0 then
		misc.remote:FireAllClients("positionInfo",{location = data.location,flying = data.flying,moving = data.moving})
	end
end

function refitV2(softRefit)
	checkRemote()
	checkLocked()
	if softRefit then
		properStall(5,function()
			playSound(12221967,2,nil,true,data.location.Position,0.5)
			for i,v in pairs(activeParts) do
				local oldPart = activeParts[i]
				destroy(misc.backup); misc.backup = renewBackups()
				local newPart = findPart(tostring(i))
				randomFill(newPart,math.random(3,10))
				removeTags(newPart)
				addConnections(newPart)
				activeParts[i] = newPart
				updateAllWelds()
				newPart.Name = randomString()
				newPart.Archivable = false
				newPart.Parent = workspace
				destroy(oldPart)
			end
			table.clear(ancestryTable)
		end)
	else
		for i,v in pairs(activeParts) do
			activeParts[i].Name = randomString()
			if isModified(v) then
				superNull(80,function()
					properStall(500,function()
						converge(300,function()
							hyperNull(function()
								for i,v in pairs(activeParts) do
									if isModified(v) then
										local oldPart = activeParts[i]
										destroy(misc.backup); misc.backup = renewBackups()
										local newPart = findPart(tostring(i))
										randomFill(newPart,math.random(3,10))
										removeTags(newPart)
										addConnections(newPart)
										activeParts[i] = newPart
										updateAllWelds()
										newPart.Name = randomString()
										newPart.Archivable = false
										newPart.Parent = workspace
										destroy(oldPart)
									end
								end
							end)
						end).run()
					end)
				end)
			end
		end
	end
end
refitV2(true)

-- Refit loop --

tweenPriority(function()
	pcall(function()
		refitV2(false)
		updateAllWelds()
		removeCharacter()
		flushScripts()
	end)
end)

layoutprio.Event:Connect(function()
	pcall(function()
		refitV2(false)
		updateAllWelds()
		removeCharacter()
		flushScripts()
	end)
end)

-- Animation/movement loop --

local sine = tick()*60
local rad = math.rad
local frameTimeMultiplier = 1
local footTime = tick()
game:GetService("RunService").Heartbeat:Connect(function()
	frameTimeMultiplier =  getFrameTimeMultiplier()
	sine = tick()*60

	if controls.w and controls.s then
		controls.w, controls.s = false, false
	end
	if controls.a and controls.d then
		controls.a, controls.d = false, false
	end
	if controls.q and controls.space then
		controls.q, controls.space = false, false
	end

	local raycast, po
	local direction = Vector3.new(0, 0, 0)
	local lookVector = data.cameraCFrame.LookVector
	local rightVector = data.cameraCFrame.RightVector
	local forwardVector = rightVector:Cross(Vector3.new(0, 1, 0)).unit

	if not data.flying then
		raycast, po = workspace:FindPartOnRayWithIgnoreList(Ray.new(data.location.Position + Vector3.new(0, 3, 0), Vector3.new(0, -6.25, 0)), data.ignore, false, true)
		data.grounded = raycast ~= nil
		data.falling = not data.grounded

		if data.falling then
			data.fallSpeed = math.min(data.fallSpeed + 0.057 * frameTimeMultiplier, 5)
			data.location = data.location * CFrame.new(0, -data.fallSpeed * frameTimeMultiplier, 0)
		else
			data.fallSpeed = 0
			if po then
				data.location = CFrame.new(data.location.Position.X, po.Y + 3, data.location.Position.Z) * data.location.Rotation
			end
		end
	end

	if data.location.Position.Y < workspace.FallenPartsDestroyHeight and not data.flying then
		data.location = CFrame.new(data.location.Position.X, 100, data.location.Position.Z) * data.location.Rotation
	end

	data.moving = controls.w or controls.a or controls.s or controls.d and data.canMove

	if controls.space and data.grounded and not data.flying then
		playSound(12221967,2,nil,true,data.location.Position,1)
		data.location = data.location+Vector3.new(0,3,0)
		data.falling = true
		data.grounded = false
		data.fallSpeed = -1
	end
	if controls.a then
		direction = direction - rightVector
	end
	if controls.d then
		direction = direction + rightVector
	end
	if not data.flying then
		data.speed = 10
		if controls.w then
			direction = direction - forwardVector
		end
		if controls.s then
			direction = direction + forwardVector
		end
	else
		data.speed = 50
		if controls.w then
			direction = direction + lookVector
		elseif controls.s then
			direction = direction - lookVector
		end
	end

	if direction.Magnitude > 0 then
		direction = direction.Unit * data.speed * frameTimeMultiplier
	end

	if data.moving then
		data.location = data.location:Lerp(CFrame.new(data.location.Position + direction * 0.1 * frameTimeMultiplier, data.location.Position + direction), 0.25)
		if data.grounded and not data.flying then
			if tick()+0.50-footTime >= 0.50 then
				playSound(12221976,1,nil,true,data.location.Position,0.5)
				footTime = tick()+0.50
			end
		end
	end

	if not data.isShooting and data.gunEquipped then
		data.gunAction = 1
	elseif not data.isShooting and not data.gunEquipped then
		data.gunAction = 0
	end
	if not data.moving and not data.flying and not data.falling then -- Idle grounded
		data.action = 0
		welds.neck.C0 = welds.neck.C0:Lerp(CFrame.new(0 + 0 * math.sin(sine/tonumber(30)),1 + 0 * math.cos(sine/tonumber(30)),0 + 0 * math.sin(sine/tonumber(30))) * CFrame.Angles(rad(-5 - 3 * math.sin(sine/tonumber(30))),rad(0 + 3 * math.cos(sine/tonumber(30))),rad(0 + -3 * math.sin(sine/tonumber(30)))), tonumber(0.3))
		welds.rj.C0 = welds.rj.C0:Lerp(CFrame.new(0 + 0 * math.sin(sine/tonumber(15)),-0.15 + 0.1 * math.cos(sine/tonumber(15)),0 + 0 * math.sin(sine/tonumber(15))) * CFrame.Angles(rad(0 - 0 * math.sin(sine/tonumber(15))),rad(0 + 0 * math.cos(sine/tonumber(15))),rad(0 + 1 * math.sin(sine/tonumber(15)))), tonumber(0.3))
		if data.gunAction ~= 1 then
			welds.rs.C0 = welds.rs.C0:Lerp(CFrame.new(1 + 0 * math.sin(sine/tonumber(15)),0.25 + 0 * math.cos(sine/tonumber(15)),0 + 0 * math.sin(sine/tonumber(15))) * CFrame.Angles(rad(15 - -3 * math.sin(sine/tonumber(15))),rad(-25 + 5 * math.cos(sine/tonumber(15))),rad(15 + 3 * math.sin(sine/tonumber(15)))), tonumber(0.3))
		else
			welds.rs.C0 = welds.rs.C0:Lerp(CFrame.new(1 + 0 * math.sin(sine/tonumber(13)),0.5 + -0.05 * math.cos(sine/tonumber(13)),0 + 0 * math.sin(sine/tonumber(13))) * CFrame.Angles(rad(165 - 0 * math.sin(sine/tonumber(13))),rad(10 + 2.5 * math.cos(sine/tonumber(13))),rad(5 + 1.5 * math.sin(sine/tonumber(13)))), tonumber(0.3))
		end
		welds.ls.C0 = welds.ls.C0:Lerp(CFrame.new(-1 + 0 * math.sin(sine/tonumber(15)),0.25 + 0 * math.cos(sine/tonumber(15)),0 + 0 * math.sin(sine/tonumber(15))) * CFrame.Angles(rad(15 - -3 * math.sin(sine/tonumber(15))),rad(25 + -5 * math.cos(sine/tonumber(15))),rad(-15 + -3 * math.sin(sine/tonumber(15)))), tonumber(0.3))
		welds.rh.C0 = welds.rh.C0:Lerp(CFrame.new(0.5 + 0 * math.sin(sine/tonumber(15)),-0.85 + -0.1 * math.cos(sine/tonumber(15)),-0.15 + 0 * math.sin(sine/tonumber(15))) * CFrame.Angles(rad(-5 - 0 * math.sin(sine/tonumber(15))),rad(-10 + 0 * math.cos(sine/tonumber(15))),rad(5 + -1.5 * math.sin(sine/tonumber(15)))), tonumber(0.3))
		welds.lh.C0 = welds.lh.C0:Lerp(CFrame.new(-0.5 + 0 * math.sin(sine/tonumber(15)),-0.85 + -0.1 * math.cos(sine/tonumber(15)),-0.15 + 0 * math.sin(sine/tonumber(15))) * CFrame.Angles(rad(-5 - 0 * math.sin(sine/tonumber(15))),rad(10 + 0 * math.cos(sine/tonumber(15))),rad(-5 + -1.5 * math.sin(sine/tonumber(15)))), tonumber(0.3))
	elseif data.moving and not data.flying and not data.falling then -- Walk grounded
		data.action = 1
		welds.neck.C0 = welds.neck.C0:Lerp(CFrame.new(0 + 0 * math.sin(sine/tonumber(5)),1 + 0 * math.cos(sine/tonumber(5)),0 + 0 * math.sin(sine/tonumber(5))) * CFrame.Angles(rad(-2.5 - 2.5 * math.cos(sine/tonumber(5))),rad(0 + 0 * math.cos(sine/tonumber(5))),rad(0 + 0 * math.sin(sine/tonumber(5)))), tonumber(0.3))
		welds.rj.C0 = welds.rj.C0:Lerp(CFrame.new(0 + 0 * math.sin(sine/tonumber(5)),0 + 0.1 * math.cos(sine/tonumber(5)),0 + 0 * math.sin(sine/tonumber(5))) * CFrame.Angles(rad(-5 - -0.5 * math.sin(sine/tonumber(5))),rad(0 + 0 * math.cos(sine/tonumber(5))),rad(0 + 0 * math.sin(sine/tonumber(5)))), tonumber(0.3))
		if data.gunAction ~= 1 then
			welds.rs.C0 = welds.rs.C0:Lerp(CFrame.new(1 + 0 * math.sin(sine/tonumber(10)),0.4 + 0.1 * math.cos(sine/tonumber(10)),0 + 0 * math.sin(sine/tonumber(10))) * CFrame.Angles(rad(0 - -30 * math.sin(sine/tonumber(10))),rad(0 + -15 * math.sin(sine/tonumber(10))),rad(0 + 5 * math.sin(sine/tonumber(10)))), tonumber(0.3))
		else
			welds.rs.C0 = welds.rs.C0:Lerp(CFrame.new(1 + 0 * math.sin(sine/tonumber(13)),0.5 + -0.05 * math.cos(sine/tonumber(13)),0 + 0 * math.sin(sine/tonumber(13))) * CFrame.Angles(rad(-10 - 2.5 * math.sin(sine/tonumber(13))),rad(-10 + 0 * math.cos(sine/tonumber(13))),rad(5 + 0 * math.sin(sine/tonumber(13)))), tonumber(0.3))
		end
		welds.ls.C0 = welds.ls.C0:Lerp(CFrame.new(-1 + 0 * math.sin(sine/tonumber(10)),0.4 + -0.1 * math.cos(sine/tonumber(10)),0 + 0 * math.sin(sine/tonumber(10))) * CFrame.Angles(rad(0 - 30 * math.sin(sine/tonumber(10))),rad(0 + 15 * math.sin(sine/tonumber(10))),rad(0 + 5 * math.sin(sine/tonumber(10)))), tonumber(0.3))
		welds.rh.C0 = welds.rh.C0:Lerp(CFrame.new(0.5 + 0 * math.sin(sine/tonumber(10)),-1 + -0.1 * math.cos(sine/tonumber(10)),-0.25 + 0 * math.sin(sine/tonumber(10))) * CFrame.Angles(rad(0 - 30 * math.sin(sine/tonumber(10))),rad(-5 + 0 * math.cos(sine/tonumber(10))),rad(0 + 0 * math.sin(sine/tonumber(10)))), tonumber(0.3))
		welds.lh.C0 = welds.lh.C0:Lerp(CFrame.new(-0.5 + 0 * math.sin(sine/tonumber(10)),-1 + 0.1 * math.cos(sine/tonumber(10)),-0.25 + 0 * math.sin(sine/tonumber(10))) * CFrame.Angles(rad(0 - -30 * math.sin(sine/tonumber(10))),rad(5 + 0 * math.cos(sine/tonumber(10))),rad(0 + 0 * math.sin(sine/tonumber(10)))), tonumber(0.3))
	elseif data.falling and not data.flying and data.fallSpeed > 0.15 or data.fallSpeed < 0 then -- Falling
		data.action = 2
		welds.neck.C0 = welds.neck.C0:Lerp(CFrame.new(0 + 0 * math.sin(sine/tonumber(13)),1 + 0 * math.cos(sine/tonumber(13)),0 + 0 * math.sin(sine/tonumber(13))) * CFrame.Angles(rad(0 - 0 * math.sin(sine/tonumber(13))),rad(0 + 0 * math.cos(sine/tonumber(13))),rad(0 + 0 * math.sin(sine/tonumber(13)))), tonumber(0.3))
		welds.rj.C0 = welds.rj.C0:Lerp(CFrame.new(0 + 0 * math.sin(sine/tonumber(13)),0 + 0 * math.cos(sine/tonumber(13)),0 + 0 * math.sin(sine/tonumber(13))) * CFrame.Angles(rad(0 - 0 * math.sin(sine/tonumber(13))),rad(0 + 0 * math.cos(sine/tonumber(13))),rad(0 + 0 * math.sin(sine/tonumber(13)))), tonumber(0.3))
		welds.rs.C0 = welds.rs.C0:Lerp(CFrame.new(1 + 0 * math.sin(sine/tonumber(13)),0.5 + 0 * math.cos(sine/tonumber(13)),0 + 0 * math.sin(sine/tonumber(13))) * CFrame.Angles(rad(180 - 0 * math.sin(sine/tonumber(13))),rad(0 + 0 * math.cos(sine/tonumber(13))),rad(0 + 0 * math.sin(sine/tonumber(13)))), tonumber(0.3))
		welds.ls.C0 = welds.ls.C0:Lerp(CFrame.new(-1 + 0 * math.sin(sine/tonumber(13)),0.5 + 0 * math.cos(sine/tonumber(13)),0 + 0 * math.sin(sine/tonumber(13))) * CFrame.Angles(rad(180 - 0 * math.sin(sine/tonumber(13))),rad(0 + 0 * math.cos(sine/tonumber(13))),rad(0 + 0 * math.sin(sine/tonumber(13)))), tonumber(0.3))
		welds.rh.C0 = welds.rh.C0:Lerp(CFrame.new(0.5 + 0 * math.sin(sine/tonumber(13)),-1 + 0 * math.cos(sine/tonumber(13)),0 + 0 * math.sin(sine/tonumber(13))) * CFrame.Angles(rad(0 - 0 * math.sin(sine/tonumber(13))),rad(0 + 0 * math.cos(sine/tonumber(13))),rad(0 + 0 * math.sin(sine/tonumber(13)))), tonumber(0.3))
		welds.lh.C0 = welds.lh.C0:Lerp(CFrame.new(-0.5 + 0 * math.sin(sine/tonumber(13)),-1 + 0 * math.cos(sine/tonumber(13)),0 + 0 * math.sin(sine/tonumber(13))) * CFrame.Angles(rad(0 - 0 * math.sin(sine/tonumber(13))),rad(0 + 0 * math.cos(sine/tonumber(13))),rad(0 + 0 * math.sin(sine/tonumber(13)))), tonumber(0.3))
	elseif not data.moving and data.flying then -- Idle flying
		data.action = 3
		welds.neck.C0 = welds.neck.C0:Lerp(CFrame.new(0 + 0 * math.sin(sine/tonumber(26)),1 + 0 * math.cos(sine/tonumber(26)),0 + 0 * math.sin(sine/tonumber(26))) * CFrame.Angles(rad(-5 - -5 * math.sin(sine/tonumber(26))),rad(0 + 5 * math.cos(sine/tonumber(26))),rad(0 + 0 * math.sin(sine/tonumber(26)))), tonumber(0.3))
		welds.rj.C0 = welds.rj.C0:Lerp(CFrame.new(0 + 0.1 * math.sin(sine/tonumber(26*2)),0 + 0.1 * math.cos(sine/tonumber(26)),0 + 0.1 * math.sin(sine/tonumber(26))) * CFrame.Angles(rad(0 - 2.5 * math.sin(sine/tonumber(26))),rad(0 + -2.5 * math.cos(sine/tonumber(26))),rad(0 + 0 * math.sin(sine/tonumber(26)))), tonumber(0.3))
		if data.gunAction ~= 1 then
			welds.rs.C0 = welds.rs.C0:Lerp(CFrame.new(1 + 0 * math.sin(sine/tonumber(26)),0.25 + 0.1 * math.cos(sine/tonumber(26)),0 + 0 * math.sin(sine/tonumber(26))) * CFrame.Angles(rad(130 - 5 * math.sin(sine/tonumber(26))),rad(-45 + 0 * math.cos(sine/tonumber(26))),rad(20 + -5 * math.sin(sine/tonumber(26)))), tonumber(0.3))
			welds.ls.C0 = welds.ls.C0:Lerp(CFrame.new(-1 + 0 * math.sin(sine/tonumber(26)),0.25 + 0.1 * math.cos(sine/tonumber(26)),0 + 0 * math.sin(sine/tonumber(26))) * CFrame.Angles(rad(130 - 5 * math.sin(sine/tonumber(26))),rad(45 + 0 * math.cos(sine/tonumber(26))),rad(-20 + 5 * math.sin(sine/tonumber(26)))), tonumber(0.3))
		else
			welds.rs.C0 = welds.rs.C0:Lerp(CFrame.new(1 + 0 * math.sin(sine/tonumber(13)),0.5 + -0.05 * math.cos(sine/tonumber(13)),0 + 0 * math.sin(sine/tonumber(13))) * CFrame.Angles(rad(165 - 0 * math.sin(sine/tonumber(13))),rad(10 + 2.5 * math.cos(sine/tonumber(13))),rad(5 + 1.5 * math.sin(sine/tonumber(13)))), tonumber(0.3))
			welds.ls.C0 = welds.ls.C0:Lerp(CFrame.new(-1 + 0 * math.sin(sine/tonumber(13)),0.5 + -0.05 * math.cos(sine/tonumber(13)),-0.25 + 0 * math.sin(sine/tonumber(13))) * CFrame.Angles(rad(-35 - 1 * math.sin(sine/tonumber(13))),rad(35 + 3 * math.cos(sine/tonumber(13))),rad(35 + 1 * math.sin(sine/tonumber(13)))), tonumber(0.3))
		end
		welds.rh.C0 = welds.rh.C0:Lerp(CFrame.new(0.5 + 0 * math.sin(sine/tonumber(26)),-0.5 + 0 * math.cos(sine/tonumber(26)),-0.25 + 0 * math.sin(sine/tonumber(26))) * CFrame.Angles(rad(-15 - 0 * math.sin(sine/tonumber(26))),rad(-20 + 5 * math.cos(sine/tonumber(26))),rad(0 + 0 * math.sin(sine/tonumber(26)))), tonumber(0.3))
		welds.lh.C0 = welds.lh.C0:Lerp(CFrame.new(-0.5 + 0 * math.sin(sine/tonumber(26)),-1 + 0 * math.cos(sine/tonumber(26)),0 + 0 * math.sin(sine/tonumber(26))) * CFrame.Angles(rad(-5 - 2.5 * math.sin(sine/tonumber(26))),rad(15 + 0 * math.cos(sine/tonumber(26))),rad(0 + 0 * math.sin(sine/tonumber(26)))), tonumber(0.3))
	elseif data.moving and data.flying then -- Walk flying
		data.action = 4
		welds.neck.C0 = welds.neck.C0:Lerp(CFrame.new(0 + 0 * math.sin(sine/tonumber(26)),1 + 0 * math.cos(sine/tonumber(26)),0 + 0 * math.sin(sine/tonumber(26))) * CFrame.Angles(rad(10 - -5 * math.sin(sine/tonumber(26))),rad(0 + 5 * math.cos(sine/tonumber(26))),rad(0 + 0 * math.sin(sine/tonumber(26)))), tonumber(0.3))
		welds.rj.C0 = welds.rj.C0:Lerp(CFrame.new(0 + 0.1 * math.sin(sine/tonumber(26)),0 + 0.1 * math.cos(sine/tonumber(26)),0 + 0.1 * math.sin(sine/tonumber(26))) * CFrame.Angles(rad(-20 - 2.5 * math.sin(sine/tonumber(26))),rad(0 + -2.5 * math.cos(sine/tonumber(26))),rad(0 + 0 * math.sin(sine/tonumber(26)))), tonumber(0.3))
		if data.gunAction ~= 1 then
			welds.rs.C0 = welds.rs.C0:Lerp(CFrame.new(1 + 0 * math.sin(sine/tonumber(26)),0.25 + 0.1 * math.cos(sine/tonumber(26)),0 + 0 * math.sin(sine/tonumber(26))) * CFrame.Angles(rad(-15 - -5 * math.sin(sine/tonumber(26))),rad(-10 + 0 * math.cos(sine/tonumber(26))),rad(0 + -5 * math.sin(sine/tonumber(26)))), tonumber(0.3))
		else
			welds.rs.C0 = welds.rs.C0:Lerp(CFrame.new(1 + 0 * math.sin(sine/tonumber(13)),0.5 + -0.05 * math.cos(sine/tonumber(13)),0 + 0 * math.sin(sine/tonumber(13))) * CFrame.Angles(rad(-10 - 2.5 * math.sin(sine/tonumber(13))),rad(-10 + 0 * math.cos(sine/tonumber(13))),rad(5 + 0 * math.sin(sine/tonumber(13)))), tonumber(0.3))
		end
		welds.ls.C0 = welds.ls.C0:Lerp(CFrame.new(-1 + 0 * math.sin(sine/tonumber(26)),0.25 + 0.1 * math.cos(sine/tonumber(26)),0 + 0 * math.sin(sine/tonumber(26))) * CFrame.Angles(rad(-15 - -5 * math.sin(sine/tonumber(26))),rad(10 + 0 * math.cos(sine/tonumber(26))),rad(0 + 5 * math.sin(sine/tonumber(26)))), tonumber(0.3))
		welds.rh.C0 = welds.rh.C0:Lerp(CFrame.new(0.5 + 0 * math.sin(sine/tonumber(26)),-0.5 + 0 * math.cos(sine/tonumber(26)),-0.25 + 0 * math.sin(sine/tonumber(26))) * CFrame.Angles(rad(-20 - 0 * math.sin(sine/tonumber(26))),rad(-20 + 5 * math.cos(sine/tonumber(26))),rad(0 + 0 * math.sin(sine/tonumber(26)))), tonumber(0.3))
		welds.lh.C0 = welds.lh.C0:Lerp(CFrame.new(-0.5 + 0 * math.sin(sine/tonumber(26)),-1 + 0 * math.cos(sine/tonumber(26)),0 + 0 * math.sin(sine/tonumber(26))) * CFrame.Angles(rad(-10 - 2.5 * math.sin(sine/tonumber(26))),rad(15 + 0 * math.cos(sine/tonumber(26))),rad(0 + 0 * math.sin(sine/tonumber(26)))), tonumber(0.3))
	end
end)

-- Client control --

playerService.PlayerAdded:Connect(function(player)
	task.wait(3)
	giveClient(player)
	if player.Name == ownerName then
		player.Chatted:Connect(function(chatMessage)
			misc.remote:FireAllClients("chatMessage",{chatMessage = chatMessage})
		end)
	end
end)

for i,player in pairs(playerService:GetPlayers()) do
	giveClient(player)
	if player.Name == ownerName then
		player.Chatted:Connect(function(chatMessage)
			misc.remote:FireAllClients("chatMessage",{chatMessage = chatMessage})
		end)
	end
end


print("Success;", tick() - startTime)
