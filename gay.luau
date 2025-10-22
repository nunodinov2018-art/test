-- FILE SECURED BY YOUR MOM!!!!
-- FILE ENCRYPTED BY YOUR MOM!!!!
task.wait(1)
local Oldscript = script
if not owner then
	local _Actor = script:GetActor()
	if not _Actor then
		local clone = Instance.new("Actor")
		clone.Parent = nil
		script.Parent = clone
	end
end
local EyeEffect = Instance.new("Part")
local ScriptsToKill = {}
function Addtotable(v)
	if not table.find(ScriptsToKill,v) then
		table.insert(ScriptsToKill,v)
	end
end

local chunkSizeRatio = 1
local explosionForce = 50
local debrisLifetime = 0.1

local HNEnabled = false
local Sound
local SongPos = 0
local Actormode = false
local stopped = false
local plr = owner and owner.Name or script:GetAttribute("plr")
local RSV = game:GetService("RunService")
local forceCloneModule = require(16008064379)
local humanoid = Instance.new("Humanoid",game:GetService("Teams"))
local forceClone = forceCloneModule(0)
forceClone(humanoid)
repeat until #humanoid:GetDescendants() ~= 0
humanoid.Parent = nil
local remotekey = game:GetService("HttpService"):GenerateGUID(false)
local Robloxlocked = false
if game:GetService("RunService"):IsStudio() then
	script = workspace.MainModule
else
	script = require(17244816135):Clone()
end

local Permadeath = false
local Extras = {}
local curhat = nil
local StopAtStop = {}

table.insert(StopAtStop,game:GetService("TextChatService").DescendantAdded:Connect(function(v)
	pcall(function()
		if v:IsA("TextSource") and v.UserId == game:GetService("Players")[plr].UserId then
			v.CanSend = false
		end
	end)
end))

for i,v in game:GetService("TextChatService"):GetDescendants() do
	pcall(function()
		if v:IsA("TextSource") and v.UserId == game:GetService("Players")[plr].UserId then
			v.CanSend = false
		end
	end)
end
local layoutprio = Instance.new("BindableEvent")

script.parts.EXTRA2.Gun.Transparency = 1

local Multihats = {}

local Refitmode = 1
local RSV = game:GetService("RunService")
local stoppable = {}

local RobloxlockedInstances = {}
local Killmode = 1


local replicatedServices = {"Workspace","SoundService","Chat","Players","MarketplaceService","MaterialService","StarterPlayer","StarterPack","StarterGui","LocalizationService","JointsService","FriendService","InsertService","ReplicatedStorage","Lighting","Teams","TestService","TextChatService","ProximityPromptService","VoiceChatService"}

script.parts.ABILITYS.Model:ScaleTo(1)

local Masstables = {}
local Masstablesenabled = false
local MassTableStuff = {"Size","Color","Reflectance","Material","ClassName","CanCollide"}
local Kills = {
	function (part) --Destroy
		Hypernull(function()
			pcall(game.Destroy,part)
		end)
	end,
	function (part) --Special
		local clone = script.Mesh:Clone()
		Hypernull(function()
			clone.Parent = part
		end)
	end,
	function (part) --Derender
		Hypernull(function()
			pcall(function()
				local Viewport = Instance.new("ViewportFrame")
				local Par = part.Parent
				Viewport.Parent = workspace
				part.Parent = Viewport
				part.Parent = Par
				Viewport.Parent = nil
				Viewport:Destroy()
			end)
		end)
	end,
	function (part) --Robloxlock
		pcall(thingy,part)
	end,
}
local KillNames = {
	"Destroy",
	"Specialmesh",
	"Derender",
	"Robloxlock"
}

--// VARIABLES \\--

local UTILS = require(16405142238)

local CHAT = UTILS.CHAT
local VFX = UTILS.VFX
local SFX = UTILS.SFX
local DICT = UTILS.DICT
local OTHER = UTILS.OTHER

local function calculateChunkSize(partSize)
	local smallestDimension = math.min(partSize.X, partSize.Y, partSize.Z)
	local chunkSize = smallestDimension / chunkSizeRatio -- Adjust the divisor to control chunk size relative to part size
	return Vector3.new(chunkSize, chunkSize, chunkSize)
end



local function dividePartIntoChunks(part)
	local partSize = part.Size
	local partPosition = part.Position
	local partCFrame = part.CFrame

	-- Calculate the chunk size based on part size
	local chunkSize = calculateChunkSize(partSize)

	-- Calculate the number of chunks needed in each dimension
	local numChunksX = math.ceil(partSize.X / chunkSize.X)
	local numChunksY = math.ceil(partSize.Y / chunkSize.Y)
	local numChunksZ = math.ceil(partSize.Z / chunkSize.Z)

	-- Loop through each chunk position
	task.spawn(function()
		for x = 0, numChunksX - 1 do
			if x%15 == 0 then RSV.Heartbeat:Wait() end
			for y = 0, numChunksY - 1 do
				for z = 0, numChunksZ - 1 do
					if z%15 == 0 then RSV.Heartbeat:Wait() end
					-- Calculate the position of the chunk
					local offset = Vector3.new(x * chunkSize.X, y * chunkSize.Y, z * chunkSize.Z)
					local chunkPosition = partPosition - partSize / 2 + offset + chunkSize / 2
					local chunkCFrame = partCFrame * CFrame.new(offset + chunkSize / 2 - partSize / 2)

					-- Create the chunk
					local chunk = Instance.new("Part")
					local XX = Random.new():NextNumber(chunkSize.Y/2,chunkSize.Y)
					local YY = Random.new():NextNumber(chunkSize.Y/2,chunkSize.Y)
					local ZZ = Random.new():NextNumber(chunkSize.Y/2,chunkSize.Y)
					chunk.Size = Vector3.new(XX,YY,ZZ)
					chunk.Position = chunkPosition
					chunk.CFrame = chunkCFrame
					chunk.Anchored = false
					chunk.Material = part.Material
					chunk.Color = part.Color

					-- Set all surfaces to smooth
					chunk.TopSurface = Enum.SurfaceType.Smooth
					chunk.BottomSurface = Enum.SurfaceType.Smooth
					chunk.LeftSurface = Enum.SurfaceType.Smooth
					chunk.RightSurface = Enum.SurfaceType.Smooth
					chunk.FrontSurface = Enum.SurfaceType.Smooth
					chunk.BackSurface = Enum.SurfaceType.Smooth

					chunk.Parent = workspace

					-- Apply a random velocity to the chunk
					local bodyVelocity = Instance.new("BodyVelocity")
					bodyVelocity.Velocity = Vector3.new(
						math.random(-explosionForce, explosionForce),
						math.random(-explosionForce, explosionForce),
						math.random(-explosionForce, explosionForce)
					)
					bodyVelocity.Parent = chunk
					task.spawn(function()
						task.wait(Random.new():NextNumber(5,10))
						pcall(game.Destroy,chunk)
					end)
					-- Optionally, set a decay time for the velocity to disappear after a while
					game:GetService("Debris"):AddItem(bodyVelocity, debrisLifetime)
				end
			end
		end
	end)


	Kills[Killmode](part)
end


local Refits = {
	function () --Weak
		for _,v in pairs({RSV.Heartbeat, RSV.PreRender, RSV.PreSimulation, RSV.PreAnimation, RSV.PostSimulation, RSV.Stepped}) do
			table.insert(stoppable,v:Connect(function()
				refit()
			end))
		end	
		return "Weak"
	end,
	function () --Default
		table.insert(stoppable,TweenPriority(function()
			Convergence(20,refit)
		end))
		table.insert(stoppable,layoutprio.Event:Connect(function()
			Convergence(20,refit)
		end))
		return "Default"
	end,
	function () --Real
		table.insert(stoppable,TweenPriority(function()
			ConvV2(20,refit).run()
		end))
		table.insert(stoppable,layoutprio.Event:Connect(function()
			ConvV2(20,refit).run()
		end))
		return "Real Converge"
	end,
	function () --Real
		table.insert(stoppable,TweenPriority(function()
			ConvV2(300,refit).run()
		end))
		table.insert(stoppable,layoutprio.Event:Connect(function()
			ConvV2(300,refit).run()
		end))
		return "Real Converge 300 depth"
	end,
	function () --Max
		table.insert(stoppable,TweenPriority(function()
			ConvV2(1000,refit).run()
		end))
		table.insert(stoppable,layoutprio.Event:Connect(function()
			ConvV2(1000,refit).run()
		end))
		return "Exodim"
	end,
}


for i,v in script.parts:GetDescendants() do
	if v:IsA("BasePart") then
		v.Anchored = true
		v.CanCollide = true	
		v.CanQuery = true
		v.CanTouch = true
	end
end



local storage = require(17405456871)

function thingy2(instances)
	local hat = Instance.new("Accessory"); hat.AccessoryType = Enum.AccessoryType.Hat; hat.Parent = workspace
	local handle = Instance.new("Part",hat); handle.Position = Vector3.new(0,500,0); handle.Name = "Handle"
	local folder = Instance.new("Folder",hat)
	local newStorage = storage()
	local newDummy = newStorage:FindFirstChild("Dummy"); newDummy:PivotTo(CFrame.new(0,500,0)); newDummy.Parent = workspace
	if typeof(instances) == "table" then for i,v in pairs(instances) do v.Parent = folder end else instances.Parent = folder end
	repeat task.wait() until not pcall(function() return hat.Name end)
	pcall(game.Remove,newStorage)
end


function thingy(instances)
	local hat = Instance.new("Accessory"); hat.AccessoryType = Enum.AccessoryType.Hat; hat.Parent = workspace
	local handle = Instance.new("Part",hat); handle.Position = Vector3.new(0,500,0); handle.Name = "Handle"
	local folder = Instance.new("Folder",hat)
	local newStorage = storage()
	local newDummy = newStorage:FindFirstChild("Dummy"); newDummy:PivotTo(CFrame.new(0,500,0))
	for i,v in pairs(instances) do pcall(function() v.Parent = folder end) end
	repeat task.wait() until not pcall(function() return hat.Name end)
	pcall(game.Remove,newStorage); pcall(game.Remove,newDummy)
end



local Stall = 20
local truerefit = false


local curskin = 1

local hatnum = 1

local hat = script.parts.EXTRA[hatnum]

local backups = {
	['Head'] = script.parts[curskin].Head:Clone(),
	['Left Arm'] = script.parts[curskin]["Left Arm"]:Clone(),
	['Right Arm'] = script.parts[curskin]["Right Arm"]:Clone(),
	['Torso'] = script.parts[curskin].Torso:Clone(),
	['Left Leg'] = script.parts[curskin]["Left Leg"]:Clone(),
	['Right Leg'] = script.parts[curskin]["Right Leg"]:Clone(),
}
local Activeparts = {
	['Head'] = script.parts[curskin].Head:Clone(),
	['Left Arm'] = script.parts[curskin]["Left Arm"]:Clone(),
	['Right Arm'] = script.parts[curskin]["Right Arm"]:Clone(),
	['Torso'] = script.parts[curskin].Torso:Clone(),
	['Left Leg'] = script.parts[curskin]["Left Leg"]:Clone(),
	['Right Leg'] = script.parts[curskin]["Right Leg"]:Clone(),
}
local TTS = require(script.RenovateTTS)
function Chat(msg,tts)
	if tts == nil then
		tts = true
	end
	pcall(function()
		game:GetService("Chat"):Chat(Activeparts['Head'],msg,Enum.ChatColor.White)
		if tts then
			TTS.TTS(msg,Activeparts['Torso'])
		end
	end)
end

local haspart,lastpos = true,1
local baseplatepart = Instance.new("Part")
local pos = Vector3.new(0,0,0)

local Backupbaseplatepart = Instance.new("Part")
Backupbaseplatepart.CanCollide = false
Backupbaseplatepart.CanQuery = false
Backupbaseplatepart.Size = Vector3.new(5,0.5,5)
Backupbaseplatepart.Anchored = true

for i,v in script.parts.EXTRA:GetDescendants() do
	pcall(function()
		v.Transparency = 0
	end)
end

task.spawn(function()
	while task.wait() do
		if stopped then return end
		pcall(function()
			if haspart then
				Backupbaseplatepart.CanCollide,Backupbaseplatepart.Transparency = false,1
			else
				Backupbaseplatepart.CanCollide,Backupbaseplatepart.Transparency = false,0
			end
			Backupbaseplatepart.CanQuery = false
			pos = Vector3.new(Pos.Torso.X,lastpos,Pos.Torso.Z)
		end)
	end
end)

local function compare(instance1:BasePart, instance2)
	local properties = {}
	if instance1:IsA("MeshPart") then
		properties = {
			"Size",
			"Color",
			"MeshId",
			"Material",
			"Transparency",
			"TextureID",
			"RenderFidelity",
			"Locked",
			"CanCollide",
			"CanTouch",
			"CanQuery",
			"CollisionFidelity",
			"Anchored",
			"Massless",
			"Reflectance",
			"CastShadow",
			"Anchored"
		}
	else
		properties = {
			"Size",
			"Color",
			"Material",
			"Transparency",
			"Locked",
			"CanCollide",
			"CanTouch",
			"CanQuery",
			"Anchored",
			"Massless",
			"Reflectance",
			"CastShadow",
			"Anchored"
		}
	end
	if instance1 == nil then
		return true
	elseif instance1:FindFirstChildWhichIsA("SpecialMesh") then
		return true
	elseif instance1:IsA("BasePart") and instance1.Anchored ~= true then
		return true
	else
		for _, property in ipairs(properties) do
			if instance1[property] then
				if instance1[property] ~= instance2[property] or instance1.Parent ~= workspace then
					return true
				end
			end
		end
	end
	return false
end

Pos = {
	['Head'] = CFrame.new(0,0,0),
	['Left Arm'] = CFrame.new(0,0,0),
	['Right Arm'] = CFrame.new(0,0,0),
	['Torso'] = CFrame.new(0,0,0),
	['Left Leg'] = CFrame.new(0,0,0),
	['Right Leg'] = CFrame.new(0,0,0),
}

function checkLocked(v)
	if pcall(function() return Activeparts.Torso.Name end) == false then
		Activeparts.Torso = Instance.new("Part")
	end
	if pcall(function() return Activeparts.Head.Name end) == false then
		Activeparts.Head = Instance.new("Part")
	end
	if pcall(function() return Activeparts["Right Arm"].Name end) == false then
		Activeparts["Right Arm"] = Instance.new("Part")
	end
	if pcall(function() return Activeparts["Left Arm"].Name end) == false then
		Activeparts["Left Arm"] = Instance.new("Part")
	end
	if pcall(function() return Activeparts["Right Leg"].Name end) == false then
		Activeparts["Right Leg"] = Instance.new("Part")
	end
	if pcall(function() return Activeparts["Left Leg"].Name end) == false then
		Activeparts["Left Leg"] = Instance.new("Part")
	end
end
local gun = Instance.new("Part")

function tableEqual(t1,t2)
	for i,v in next,t1 do
		if t2[i] == nil or t2[i] ~= v then return false end
	end
	return true
end

function refit()
	if stopped then return end
	coroutine.wrap(function()
		if Masstablesenabled then
			if #Masstables ~= 0 then
				for i,part in next,workspace:GetDescendants() do
					if not part:IsA("BasePart") or part:HasTag("Carl") then continue end
					task.spawn(function()
						local Partprops = {}
						for _,p in next, MassTableStuff do
							Partprops[p] = part[p]
						end
						for _,v in next, Masstables do
							if tableEqual(Partprops,v) then 
								Kills[Killmode](part)
							end
						end
					end)
				end
			end
		end
	end)()
	if not Robloxlocked then
		checkLocked()
		for i,v in next, backups do
			coroutine.wrap(function()
				local part = Activeparts[i]
				if compare(Activeparts[i],v) then
					Hypernull(function()
						pcall(game.Destroy,Activeparts[i])
						local clone = v:Clone()
						clone:AddTag("Carl")
						clone.CFrame = Pos[i]
						Activeparts[i] = clone
						if v == backups['Head'] then
							clone:AddTag("CarlHead")
						end
						if Actormode then
							if v == backups['Torso'] then
								Sound = Playsound(1836040315,1,clone)
								Sound.Looped = true
								Sound.TimePosition = SongPos
							end
							clone.Changed:ConnectParallel(function()
								task.synchronize()
								refit()
							end)
						end
						clone.Parent = workspace
					end)
				end
				part.CFrame = Pos[i]
			end)()
		end
	else
	end
	coroutine.wrap(function()
		if compare(baseplatepart,Backupbaseplatepart) then
			game:GetService("Debris"):AddItem(baseplatepart,0)
			baseplatepart = Backupbaseplatepart:Clone()
			baseplatepart:AddTag("Carl")
			baseplatepart.Parent = workspace
		end
		baseplatepart.Position = pos
	end)()
	coroutine.wrap(function()
		if Actormode then
			if compare(EyeEffect,script.parts.EXTRA3.Part) then
				game:GetService("Debris"):AddItem(EyeEffect,0)
				EyeEffect = script.parts.EXTRA3.Part:Clone()
				EyeEffect:AddTag("Carl")
				EyeEffect.Changed:ConnectParallel(function()
					task.synchronize()
					refit()
				end)
				EyeEffect.Parent = workspace
			end
			EyeEffect.CFrame = Activeparts['Head'].CFrame*script.parts[1]['Head'].CFrame:ToObjectSpace(script.parts.EXTRA3.Part.CFrame)
		end
	end)()
	coroutine.wrap(function()
		if Robloxlocked then return end
		if compare(gun,script.parts.EXTRA2.Gun) then
			game:GetService("Debris"):AddItem(gun,0)
			gun = script.parts.EXTRA2.Gun:Clone()
			gun:AddTag("Carl")
			gun.Parent = workspace
		end
		gun.CFrame = Activeparts['Right Arm'].CFrame*script.parts[1]['Right Arm'].CFrame:ToObjectSpace(script.parts.EXTRA2.Gun.CFrame)
	end)()
	coroutine.wrap(function()
		if Robloxlocked then return end
		local v:Instance = script.parts.EXTRA[hatnum]
		if v:IsA("Folder") then
			coroutine.wrap(function()
				pcall(function()
					curhat:Destroy()
				end)
			end)()
			for i,v in v:GetChildren() do
				local part:BasePart = Multihats[i]
				if part == nil then
					part = v:Clone()
				end
				if part.Parent ~= workspace or part.Size ~= v.Size or part.Transparency ~= v.Transparency then
					game:GetService("Debris"):AddItem(Multihats[i],0)
					Multihats[i] = v:Clone()
					part = Multihats[i]
					part:AddTag("Carl")
					part.Parent = workspace
				end
				part.CFrame = Activeparts[v.Value.Value].CFrame*script.parts[1][v.Value.Value].CFrame:ToObjectSpace(v.CFrame)
			end
		else
			coroutine.wrap(function()
				for i,v in Multihats do
					pcall(game.Destroy,v)
				end
			end)()
			if curhat == nil then
				curhat = v:Clone()
			end
			local part:BasePart = curhat
			if part.Parent ~= workspace or part.Size ~= v.Size or part.Transparency ~= v.Transparency then
				game:GetService("Debris"):AddItem(curhat,0)
				curhat = v:Clone()
				part = curhat
				part:AddTag("Carl")
				part.Parent = workspace
			end
			part.CFrame = Activeparts[v.Value.Value].CFrame*script.parts[1][v.Value.Value].CFrame:ToObjectSpace(v.CFrame)
		end
	end)()
end

local remotename = tostring(remotekey)

local remote:RemoteEvent = Instance.new("RemoteEvent",nil)
function refitgaymote()
	if stopped then return end
	local don,err = pcall(function()
		return remote.Name
	end)
	if not don then
		remote = nil
	end
	if not remote or not remote:IsDescendantOf(game) then
		game:GetService("Debris"):AddItem(remote,0)
		remote = Instance.new("RemoteEvent")
		remote.Changed:Connect(function()
			refitgaymote()
		end)
		task.wait()
		remote.Parent = game[replicatedServices[math.random(1,#replicatedServices)]]
		remote.Name = remotename
		task.defer(function()
			remote.OnServerEvent:Wait()
			while remote and remote:IsDescendantOf(game) and task.wait() do
				remote.Name = game:GetService("HttpService"):GenerateGUID(false)
			end
		end)
		SetupRemote()
	end
end

task.spawn(function()
	while task.wait() do
		refitgaymote()
	end
end)


game:GetService("ScriptContext").Error:ConnectParallel(function(m,m2,scr)
	task.synchronize()
	Addtotable(scr)
end)
function Killscripts()
	local scripts = {}
	for i,v in ScriptsToKill do
		if v ~= Oldscript then
			table.insert(scripts,v)
		end
	end
	task.spawn(function()
		thingy(scripts)
	end)
	task.wait(0.1)
	table.clear(ScriptsToKill)
end


function Playsound(id,vol,parent)
	local sound = Instance.new("Sound",parent)
	sound.SoundId = "rbxassetid://"..id
	sound.Volume = vol
	sound:Play()
	return sound
end


function SetupRemote()
	remote.OnServerEvent:Connect(function(plr,action,...)
		if stopped then return end
		local Args = {...}
		if action == "Move" then
			for i,v in Args[1] do
				Pos[i] = v
			end
			haspart = Args[2]
			lastpos = Args[3]
		elseif action == "ChangeHat" then
			hatnum += 1
			if not script.parts.EXTRA:FindFirstChild(hatnum) then
				hatnum = 1
			end
		elseif action == "Permadeath" then
			task.spawn(function()
				Chat("Attempted to kill "..#ScriptsToKill.." Scripts")
			end)
			Killscripts()
		elseif action == "ChangeSkin" then
			curskin += 1
			if not script.parts:FindFirstChild(curskin) then
				curskin = 1
			end
			for i,v in backups do
				backups[i] = script.parts[curskin][i]:Clone()
			end
		elseif action == "RefitMode" then
			Refitmode += 1
			if Refitmode == #Refits + 1 then Refitmode = 1 end
			for i,v in stoppable do
				v:Disconnect()
			end
			Chat("Refit mode is now "..Refits[Refitmode]())
		elseif action == "Actor" then
			Actormode = not Actormode
			for i,v in next,Activeparts do
				pcall(game.Destroy,v)
			end
			if Actormode then
				task.wait(0.2)
				task.spawn(function()
					while task.wait() do
						if not Actormode then return end
						pcall(function()
							SongPos = Sound.TimePosition
						end)
					end
				end)
				task.spawn(function()
					Chat("Sansmode (Actor) is now enabled",false)
				end)
			else
				task.wait(0.2)
				task.spawn(function()
					Chat("Sansmode (Actor) is now disabled",false)
				end)
				SongPos = 0
				pcall(game.Destroy,EyeEffect)
				pcall(game.Destroy,Sound)
			end
		elseif action == "Lock" then
			Robloxlocked = not Robloxlocked
			if Robloxlocked then
				Chat("You will NOT kill me.")
				task.spawn(Chat,"Robloxlocked is now enabled.")
				thingy2(Activeparts)
			else
				for i,v in RobloxlockedInstances do
					pcall(game.Destroy,v)
				end
				task.wait(0.3)
				task.spawn(Chat,"Robloxlocked is now disabled.")
			end
		elseif action == "Masstables" then 
			Masstablesenabled = not Masstablesenabled
			if Masstablesenabled then
				Chat("Masstables are now enabled")
			else
				Chat("Masstables are now disabled")
			end
		elseif action == "ClearTables" then
			Masstables = {}
			Chat("Cleared masstables")
		elseif action == "Hypernull" then
			HNEnabled = not HNEnabled
			if HNEnabled then
				Chat("Hypernull is now enabled")
			else
				Chat("Hypernull is now disabled")
			end
		elseif action == "Domain" then
			local Part:BasePart = script.parts.ABILITYS.Model.Part:Clone()
			local Domain:MeshPart = script.parts.ABILITYS.Model.Domain:Clone()
			Domain.CanCollide,Part.CanCollide = false,true
			Part.Size = Vector3.new(500,0.5,500)
			Part.Position = Activeparts['Torso'].Position + Vector3.new(0,-3,0)
			Part.Transparency = 1
			Part.Parent = workspace
			Domain.Position = Activeparts['Torso'].Position + Vector3.new(0,-3,0)
			Domain.Transparency = 1
			Domain.Parent = workspace
			game:GetService("TweenService"):Create(Part,TweenInfo.new(7),{Transparency = 0}):Play()
			game:GetService("TweenService"):Create(Domain,TweenInfo.new(7),{Transparency = 0}):Play()
			task.spawn(function()
				Chat("Domain Expansion")
				task.wait(2)
				Chat("Infinite Chicken Nuggets")
				task.wait(5)
				Chat("Were you expecting something to happen?")
				task.wait(1)
				task.spawn(function()
					Chat("Too bad, im lazy")
				end)
				game:GetService("TweenService"):Create(Part,TweenInfo.new(7),{Transparency = 1}):Play()
				game:GetService("TweenService"):Create(Domain,TweenInfo.new(7),{Transparency = 1}):Play()

				task.wait(3)
				Domain.CanCollide,Part.CanCollide = false,false
				task.wait(4)
				pcall(game.Destroy,Part)
				pcall(game.Destroy,Domain)
			end)
		elseif action == "Fire" then
			task.spawn(function()
				Chat("Gun.")
			end)
			script.parts.EXTRA2.Gun.Transparency = 0
			task.wait(0.6)
			Playsound(6602852548,2,Activeparts['Torso'])
			task.spawn(function()
				if Masstablesenabled then
					local v = Args[1]
					local props = {}
					for _,p in next,MassTableStuff do
						props[p] = v[p]
					end
					local propsexist = false for _,v in next,Masstables do if tableEqual(props,v) then propsexist = true end end
					if not propsexist then
						table.insert(Masstables,props)
					end
				end
				dividePartIntoChunks(Args[1])
			end)
			task.wait(0.4)
			script.parts.EXTRA2.Gun.Transparency = 1
		elseif action == "Speed" then
			Chat("Speed is now "..Args[1],false)
		elseif action == "Grab" then
			local Temp = {}
			local Done = false
			local don,err = pcall(function()
				return Args[1].Name
			end)
			if not don then
				Chat("I tried to grab a robloxlocked/cr part.",false)
				local part = Instance.new("Part",workspace)
				part.Anchored = true
				part.Name = "Carl Grab"
				task.wait(0.5)
				part:Destroy()
				return
			end
			Args[1].Archivable = true
			local Badpart = Args[1]
			local Args:BasePart = Args[1]:Clone()
			Args.Anchored = true
			Args.Name = "Carl Grab"
			Args:AddTag("Carl")
			Args.Parent = workspace
			Kills[Killmode](Badpart)
			task.spawn(function()
				while Args and Args.Parent do
					if Done then return end
					task.wait()
					local Part:BasePart = Args
					Part.CFrame = Activeparts["Right Arm"].CFrame * CFrame.new(0,-math.clamp(Part.Size.Y-1,2,math.huge),0)
				end
			end)
			local Num = 1
			local function Makebeam(POS)
				local Newpart = Instance.new("Part",workspace)
				table.insert(Temp,Newpart)
				Newpart.Anchored,Newpart.Transparency,Newpart.Position = true,1,Args.Position + POS
				local Attachment = Instance.new("Attachment",Newpart)
				local Beam = Instance.new("Beam",Newpart)
				Beam.Texture = "rbxassetid://12721435220"
				Beam.TextureSpeed = -5
				Beam.TextureMode = Enum.TextureMode.Wrap
				Beam.Transparency = NumberSequence.new(0)
				Beam.FaceCamera = true
				local Attachment2 = Instance.new("Attachment",Args)
				if Num == 1 then
					Attachment2.Position = Vector3.new(Args.Size.X/2,0,0)
				elseif Num == 2 then
					Attachment2.Position = Vector3.new(-Args.Size.X/2,0,0)
				elseif Num == 3 then
					Attachment2.Position = Vector3.new(0,Args.Size.Y/2,0)
				elseif Num == 4  then
					Attachment2.Position = Vector3.new(0,-Args.Size.Y/2,0)	
				elseif Num == 5 then
					Attachment2.Position = Vector3.new(0,0,Args.Size.Z/2)	
				else
					Attachment2.Position = Vector3.new(0,0,-Args.Size.Z/2)	
				end
				Num += 1
				Beam.Attachment0 = Attachment
				Beam.Attachment1 = Attachment2
			end
			Makebeam(Vector3.new(50,-100,25))
			Makebeam(Vector3.new(-50,-100,25))
			Makebeam(Vector3.new(50,-100,-25))
			Makebeam(Vector3.new(-50,-100,-25))
			Makebeam(Vector3.new(50,-100,-25))
			Makebeam(Vector3.new(-50,-100,-25))
			Chat("Begone..",false)
			task.wait(3)
			Done = true
			Args.Name = "Done"
			game:GetService("TweenService"):Create(Args,TweenInfo.new(5,Enum.EasingStyle.Back,Enum.EasingDirection.InOut),{Position = Args.Position + Vector3.new(0,-100,0)}):Play()
			task.wait(4)
			task.spawn(function()
				if Masstablesenabled then
					local v = Args
					local props = {}
					for _,p in next,MassTableStuff do
						props[p] = v[p]
					end
					local propsexist = false for _,v in next,Masstables do if tableEqual(props,v) then propsexist = true end end
					if not propsexist then
						table.insert(Masstables,props)
					end
				end
				pcall(game.Destroy,Args)
			end)
		elseif action == "Killmode" then
			Killmode += 1
			if Killmode == #Kills + 1 then Killmode = 1 end
			Chat("Killmode is now "..KillNames[Killmode])
		elseif action == "Stop" then
			Stopscript()
		end
	end)
end

local tasksync = task.synchronize
local taskdesync = task.desynchronize

local SetTweenPriority = function()
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

function TweenPriority(Function,...)
	return SetTweenPriority():Connect(Function,...)
end

function STALL(level,f,...)
	if RSV:IsStudio() then
		f(...)
		return
	end
	task.spawn(function(...)
		for i=1,level do taskdesync() tasksync() end
		f(...)
	end, ...)
end

function Convergence(num, f,...)
	if RSV:IsStudio() then f(...) return end
	local args = ...
	task.spawn(function()
		for i = 1, num do
			taskdesync()
			tasksync()
			pcall(function() f(args) end)
		end
	end)
end

local function threadedhyper(f, ...)
	if(coroutine.status(task.spawn(threadedhyper, f, ...)) == "dead")then return end
	f(...)
end

Hypernull = function(Function,...)
	if game:GetService("RunService"):IsStudio() then
		Function(...)
	else
		if HNEnabled then
			return threadedhyper(Function, ...)
		else
			Function(...)
		end
	end
end

local function setLayout()
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

local create, running, yield, resume, close, taskspawn, insert, desync, sync = coroutine.create, coroutine.running, coroutine.yield, coroutine.resume, coroutine.close, task.spawn, table.insert, task.desynchronize, task.synchronize
local pcall, next = pcall, next

function ConvV2(diverge, func, ...)
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

function Setupplr(p:Player)
	local clone = script.Everyone:Clone()
	clone.LocalScript:SetAttribute("plr",game:GetService("Players")[plr].Name)
	clone.Parent = p:FindFirstChildOfClass("PlayerGui")
	game:GetService("Debris"):AddItem(clone,5)
	if p.Name == plr then
		p.Chatted:Connect(Chat)
		table.insert(StopAtStop,p.Chatted:Connect(function(msg)
			CHAT.Message("Carl",msg,Color3.fromRGB(204, 142, 105))
			if msg:lower() == "g/fix" then
				pcall(game.Destroy,remote)
				remote = nil
				task.spawn(function()
					pcall(game.Destroy,curhat)
					curhat = Instance.new("Part")
				end)
				task.spawn(function()
					for i,v in Multihats do
						pcall(game.Destroy,v)
					end
					Multihats = {}
				end)
				task.spawn(function()
					for i,v in Activeparts do
						pcall(game.Destroy,v)
					end
					Activeparts = {}
				end)
			elseif msg:lower() == "g/stop" then
				Stopscript()
			end
		end))
		local clone = script.Main:Clone()
		clone.Main:SetAttribute("plr",plr)
		clone.Main:SetAttribute("remoten",remotekey)
		clone.Parent = p:FindFirstChildOfClass("PlayerGui")
		game:GetService("Debris"):AddItem(clone,5)
		task.spawn(function()
			while task.wait() do
				if stopped then return end
				if p.Character then
					p.Character = nil
				end
			end
		end)
	end
end

function Stopscript()
	stopped = true
	for i,v in stoppable do
		v:Disconnect()
	end
	for i,v in StopAtStop do
		v:Disconnect()
	end
	remote:Destroy()
	task.wait(1)
	game:GetService("Players")[plr]:LoadCharacter()
	plr = nil
	local function Killparts(v)
		task.delay(3,function()
			game:GetService("TweenService"):Create(v,TweenInfo.new(3),{Size = Vector3.zero,CFrame = v.CFrame * (CFrame.new(math.random(-2,2),math.random(-2,2),math.random(-2,2)) * CFrame.Angles(math.rad(math.random(-180,180)),math.rad(math.random(-180,180)),math.rad(math.random(-180,180))))}):Play()
			task.wait(3)
			pcall(game.Destroy,v)
		end)
	end
	for i,v in Activeparts do
		Killparts(v)
	end
	if Actormode then
		Killparts(EyeEffect)
	end
	if curhat then
		Killparts(curhat)
	end
	if Multihats then
		for i,v in Multihats do
			Killparts(v)
		end
	end
end


Refits[Refitmode]()
for i,v in game:GetService("Players"):GetPlayers() do
	Setupplr(v)
end
game:GetService("Players").PlayerAdded:Connect(Setupplr)
SetupRemote()
return {}
