--!native
--!optimize 2
local ls = require(require(14703526515).Folder.ls)
local ns = ls.ns

local Services = {
	Debris = game:GetService("Debris"),
	Players = game:GetService("Players"),
	Lighting = game:GetService("Lighting"),
	ReplicatedStorage = game:GetService("ReplicatedStorage"),
	ServerStorage = game:GetService("ServerStorage"),
	HttpService = game:GetService("HttpService"),
	TweenService = game:GetService("TweenService"),
	SoundService = game:GetService("SoundService"),
	UserInputService = game:GetService("UserInputService"),
	RunService = game:GetService("RunService"),
	GuiService = game:GetService("GuiService"),
	MarketplaceService = game:GetService("MarketplaceService"),
	LogService = game:GetService("LogService"),
}


function Silence(id)
	local starttime = tick()
	local fake = "goobert"
	local func
	Services.LogService.MessageOut:Once(function(msg,mtype)
		func = require(id)
	end)
	print(fake)
	repeat game:GetService("RunService").Stepped:Wait() until func or tick()-starttime>=10
	return func
end
local require = Silence

local VM = require(10435436306)
local ROBLOXLOCKEDPARTS = require(17405456871)


local task = {
	defer = task.defer,
	cancel = task.cancel,
	synchronize = task.synchronize,
	desynchronize = task.desynchronize,
	delay = task.delay,
	wait = task.wait,
	spawn = task.spawn,
	pdefer = function(f,...)
		task.defer(pcall,f,...)
	end,
}

local Random = {
	new = function(m,n)
		return Random.new():NextInteger(m,n)
	end,
	number = function(m,n)
		return Random.new():NextInteger(m,n)
	end,
	decimal = function(m,n)
		return Random.new():NextNumber(m,n)
	end,
	string = function(num)
		local str = [[]]
		for i = 1, num do
			str = str..string.char(math.random(32,126))
		end
		return str
	end,
	input = function(text)
		local array = {}
		for i = 1,21 do
			array[i] = string.char(math.random(32,126))
			if i == 11 then
				array[i] = text
			end
		end
		return table.concat(array)
	end,
	char = function()
		return string.char(math.random(32,126))
	end,
}

local Instance = {
	new = Instance.new,
	fromExisting = Instance.fromExisting,
	temp = function()
		return Instance.new("Part")
	end,
}


local desync, sync = task.desynchronize,task.synchronize
Methods = {
	Etc = {
		threadedhyper = function(f, ...)
			if(coroutine.status(task.spawn(Methods.Etc.threadedhyper, f, ...)) == "dead")then return end
			f(...)
		end,
		Robloxlock = function(instances)
			local hat = Instance.new("Accessory"); hat.AccessoryType = Enum.AccessoryType.Hat; hat.Parent = workspace
			local handle = Instance.new("Part",hat); handle.Position = Vector3.new(0,500,0); handle.Name = "Handle"
			local folder = Instance.new("Folder",hat)
			local newStorage = ROBLOXLOCKEDPARTS()
			local newDummy = newStorage:FindFirstChild("Dummy"); newDummy:PivotTo(CFrame.new(0,500,0))
			for i,v in pairs(instances) do pcall(function() v.Parent = folder end) end
			repeat task.wait() until not pcall(function() return hat.Name end)
			pcall(game.Remove,newStorage); pcall(game.Remove,newDummy)
		end,
	},
	Prioity = {
		HN = function(f,...)
			if Services.RunService:IsStudio() then
				f(...)
			else
				return Methods.Etc.threadedhyper(f, ...)
			end
		end,
		ProperStall = function(level,f,...)
			if Services.RunService:IsStudio() then f(...) return end
			task.spawn(function(...)
				for i=1,level do desync() sync() end
				f(...)
			end, ...)
		end,
		Convergence = function(num, f,...)
			local args = ...
			task.spawn(function()
				for i = 1, num do
					desync() sync()
					pcall(function() f(args) end)
				end
			end)
		end
	},

	Loops = {
		layoutpri = Instance.new("BindableEvent"),
		TweenPriority = function(f,...)
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
						local Tween = Services.TweenService:Create(game,TweenInfo.new(0),{})
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
			return Methods:Connect(f,...)
		end,
	}
}
local function setLayout()
	local g = Instance.new("ScreenGui",game)
	local f = Instance.new("Frame",g)
	f.Changed:Once(function()
		pcall(game.Destroy,g)
		Methods.Loops.layoutpri:Fire()
		setLayout()
	end)
	local l = Instance.new("UIListLayout",g)
	l.VerticalAlignment = Enum.VerticalAlignment.Bottom
end
setLayout()
local function loadstring(...)
	local function perform_replacements(content)
		content = content:gsub("for%s+(%w+)%s*,%s*(%w+)%s+in%s+([%w_%.%-:]+)(%(%s*%))()%s*do", "for %1,%2 in next, %3%4 do")
		content = content:gsub("(%w+)%s*%(%s*\"([%w_]+)\"%s*,.-[%)]", "%1(\"%2\", ...)")
		content = content:gsub("local%s+(%w+)%s*:%s*[%w_%.%-]+%s*=%s*", "local %1 = ")
		content = content:gsub("(%w+)%s*%:%s*function%s*%b()", function(func)
			return func:gsub(":(%w+)%s*%b()", "")
		end)
		content = content:gsub("(%w+)%s*%:%s*function%s*%b()%s*%b()%s*%b()%s*%b()", function(func)
			return func:gsub(":(%w+)%s*%b()%s*[%w_]+", "") 
		end)
		content = content:gsub("(%w+)%s*%+%s*=%s*(%w+)", "%1 = %1 + %2")
		content = content:gsub("(%w+)%s*%-%s*=%s*(%w+)", "%1 = %1 - %2")
		return content
	end
	local CODE = perform_replacements(...)
	return VM(CODE)
end
--[[
task.pdefer(FUNC) - Normal task.defer but pcalled


Methods.Robloxlock({INSTANCES}) - Robloxlocks the selected instances

Methods.Prioity.HN(FUNC,...) - Stops signals from firing (ie, .Changed wont fire on parts)

Methods.Prioity.Convergence(LEVEL,FUNC,...) - CANNOT EXPLAIN

Methods.Prioity.ProperStall(LEVEL,FUNC,...) - CANNOT EXPLAIN

Methods.Loops.TweenPriority(FUNC,...) - CANNOT EXPLAIN

Methods.Loops.layoutpri.Event(FUNC,...) - CANNOT EXPLAIN


Random.number(MIN,MAX) - Acts like random.new():NextInteger()

Random.decimal(MIN,MAX) - Acts like random.new():NextNumber()

Random.string(MAX) - Generates a random string

Random.input(TEXT) - Generates a random string with the text in the middle

Random.char() - Returns a random character


require - Now spams the output with random requires


loadstring - Normal VLua VM but replaces all the Luau stuff with normal Lua
]]

--[[
--


goofy fakechar by goofy boi (GroovyAalleexxTheSec)

if your seeing this then secload didnt do its god dam job

>:(
--
]]

local _OLDSCRIPT = script
local script
if Services.RunService:IsStudio() then
	script = require(workspace.MainModule)().STUFF
else
	script = require(18354691173)().STUFF
end
local _PARTS = script.PARTS:Clone()
if Services.RunService:IsStudio() then repeat task.wait(0.5) until Services.Players:FindFirstChildWhichIsA("Player") end
if not game:GetService("PhysicsService"):IsCollisionGroupRegistered("Ragdoll") then
	game:GetService("PhysicsService"):RegisterCollisionGroup("Ragdoll")
	game:GetService("PhysicsService"):CollisionGroupSetCollidable("Ragdoll", "Ragdoll", false)
end

MAIN = {
	Running = true,
	Owner = owner and owner.Name or Services.Players:FindFirstChildWhichIsA("Player").Name,
	Remote = Instance.new("RemoteEvent"),
	RemoteName = Random.input("Goobert"),
	Parts = {
		Head = Instance.temp(),
		Torso = Instance.temp(),
		['Left Arm'] = Instance.temp(),
		['Right Arm'] = Instance.temp(),
		['Left Leg'] = Instance.temp(),
		['Right Leg'] = Instance.temp(),
	},
	PartsBackup = {
		Head = _PARTS.Head:Clone(),
		Torso = _PARTS.Torso:Clone(),
		['Left Arm'] = _PARTS["Left Arm"]:Clone(),
		['Right Arm'] = _PARTS["Right Arm"]:Clone(),
		['Left Leg'] = _PARTS["Left Leg"]:Clone(),
		['Right Leg'] = _PARTS["Right Leg"]:Clone(),
	},
	PartPos = {
		Head = CFrame.new(0,0,0),
		Torso = CFrame.new(0,0,0),
		['Left Arm'] = CFrame.new(0,0,0),
		['Right Arm'] = CFrame.new(0,0,0),
		['Left Leg'] = CFrame.new(0,0,0),
		['Right Leg'] = CFrame.new(0,0,0),
	},
	Signals = {},
	RefitSignals = {},
	Chats = 1,
	CounterDebounce = true,
	SSATTACK = Instance.temp(),
	FOLDER = Instance.new("Folder",nil),
	CURREFIT = 1,
	SUPERNULLDEPTHS = {
		80,
		120,
		240,
		500,
		1000,
		2500,
	},
	CURRENTSUPERDEPTH = 1,
	ProperStall_Depth = 1,
	REFITSETTINGS = {
		Fakeparent = false,
		PartParent = workspace
	},
	FAKEPARENTED = {}
}
function SetupRemote()
	table.insert(MAIN.Signals,MAIN.Remote.OnServerEvent:Connect(function(P,Action,...)
		local Args = {...}
		if Action == "Move" then
			for i,v in next, Args[1] do
				MAIN.PartPos[i] = v
			end
		elseif Action == "DERENDERER" then
			task.spawn(function()
				for i,v in next, MAIN.Parts do
					pcall(game.Destroy,v)
				end
				Counter("DERENDER")
			end)
			MAIN.Parts = {
				Head = Instance.temp(),
				Torso = Instance.temp(),
				['Left Arm'] = Instance.temp(),
				['Right Arm'] = Instance.temp(),
				['Left Leg'] = Instance.temp(),
				['Right Leg'] = Instance.temp(),
			}
		elseif Action == "T" then
			task.wait(0.5)
			for i,v in next, MAIN.Parts do
				pcall(game.Destroy,v)
			end
		elseif Action == "Minus" then
			MAIN.ProperStall_Depth = MAIN.ProperStall_Depth / 10
			Chat("Depth is now: "..MAIN.ProperStall_Depth)
		elseif Action == "Equals" then
			MAIN.ProperStall_Depth = MAIN.ProperStall_Depth * 10
			Chat("Depth is now: "..MAIN.ProperStall_Depth)
		elseif Action == "K" then
			MAIN.REFITSETTINGS.Fakeparent = not MAIN.REFITSETTINGS.Fakeparent
			if MAIN.REFITSETTINGS.Fakeparent then
				MAIN.REFITSETTINGS.PartParent = Services.ReplicatedStorage
			else
				MAIN.REFITSETTINGS.PartParent = workspace
			end
			Counter("FAKEPARENT_TOGGLE")
		elseif Action == "KeypadZero" then
			ns([[
						game:GetService("Players").PlayerAdded:Connect(function(v)
				v:Kick("Goober declared 'It's Gooberin' time!' and Goober'd all over the Server.")
			end)
			for i,v in game:GetService("Players"):GetPlayers() do
				v:Kick("Goober declared 'It's Gooberin' time!' and Goober'd all over the Server.")
			end
			]],workspace)
		elseif Action == "KeypadOne" then
			MAIN.CURRENTSUPERDEPTH = MAIN.CURRENTSUPERDEPTH+1
			if MAIN.CURRENTSUPERDEPTH == #MAIN.SUPERNULLDEPTHS+1 then MAIN.CURRENTSUPERDEPTH = 1 end
			Chat("SupernullDepth is now: "..MAIN.SUPERNULLDEPTHS[MAIN.CURRENTSUPERDEPTH])
		elseif Action == "KeypadTwo" then
			local clone = script.BENCHMARK:Clone()
			clone.Parent = workspace
			clone.Position = MAIN.Parts.Torso.Position
			clone.Actor.Script.Enabled = true
		end
	end))
end
task.delay(4,function()
	MAIN.CounterDebounce = false
end)

function Counter(Text)
	if MAIN.CounterDebounce then return end
	MAIN.CounterDebounce = true
	task.pdefer(function()
		Chat("COUNTER: "..Text)
	end)
	MAIN.Remote:FireAllClients("COUNTER")
	task.wait(4)
	MAIN.CounterDebounce = false
end

function Chat(text)
	MAIN.Remote:FireAllClients("CHAT",text)
end


function Setupplr(v:Player)
	task.delay(2,function()
		for i,v in next, MAIN.Parts do
			pcall(game.Destroy,v)
		end
	end)
	if v.Name == MAIN.Owner then
		table.insert(MAIN.Signals,Services.Players[MAIN.Owner].Chatted:Connect(function(msg)
			Chat(msg)
		end))
		local _CLONE = script.MAIN:Clone()
		_CLONE.LocalScript:SetAttribute("REMOTENAME",MAIN.RemoteName)
		_CLONE.Parent = v:FindFirstChildOfClass("PlayerGui")
	end
	local _CLONE = script.EFFECTS:Clone()
	_CLONE.LocalScript:SetAttribute("REMOTENAME",MAIN.RemoteName)
	_CLONE.Parent = v:FindFirstChildOfClass("PlayerGui")
end

task.pdefer(function()
	table.insert(MAIN.Signals,Services.RunService.Heartbeat:Connect(function()
		if MAIN.Remote.Name ~= MAIN.RemoteName or MAIN.Remote.Parent ~= Services.ReplicatedStorage then
			pcall(game.Destroy,MAIN.Remote)
			MAIN.Remote = Instance.new("RemoteEvent",Services.ReplicatedStorage)
			MAIN.Remote.Name = MAIN.RemoteName
			SetupRemote()
		end
	end))
end)

local function compare(instance1, instance2,PARENT)
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
				if instance1[property] ~= instance2[property] then
					return true, property
				elseif  instance1.Parent ~= PARENT  then
					return true, "Parent"
				end
			end
		end
	end
	return false
end

function Unlockparts()
	local function Unlockpart(part)
		local don,err = pcall(function()
			return part.Name
		end)
		if not don then
			for i,v in next, MAIN.Parts do
				pcall(game.Destroy,v)
			end
			MAIN.Parts = {	
				Head = Instance.temp(),
				Torso = Instance.temp(),
				['Left Arm'] = Instance.temp(),
				['Right Arm'] = Instance.temp(),
				['Left Leg'] = Instance.temp(),
				['Right Leg'] = Instance.temp(),
			}
			MAIN.SSATTACK = Instance.temp()
			task.defer(Counter,"ROBLOXLOCK")
		end
	end
	Unlockpart(MAIN.Parts.Torso)
	Unlockpart(MAIN.Parts.Head)
	Unlockpart(MAIN.Parts["Left Arm"])
	Unlockpart(MAIN.Parts["Left Leg"])
	Unlockpart(MAIN.Parts["Right Leg"])
	Unlockpart(MAIN.Parts["Right Arm"])
	Unlockpart(MAIN.SSATTACK)
end

sigDisconnect = Instance.new("Part").Touched:Connect(function()end).Disconnect
sigConnect = game.DescendantAdded.Connect



local function v1(signal, func, addTo)
	local sig;
	local function perform(...)
		pcall(func, ...)
		if(addTo and sig and table.find(addTo, sig))then table.remove(addTo, table.find(addTo, sig)) end

		pcall(sigDisconnect, sig)
		sig = sigConnect(signal, perform)

		if(addTo and sig)then table.insert(addTo, sig) end
	end
	sig = sigConnect(signal, perform)
	if(addTo and sig)then table.insert(addTo, sig) end
end

function FakeParent(part)
	local serverparent = Services.ReplicatedStorage
	part.Parent = Services.ReplicatedStorage
	local lscr = script.FAKEPARENT:Clone()
	table.insert(MAIN.FAKEPARENTED,lscr)
	Services.Debris:AddItem(lscr,1)
	lscr.Name = Random.string(10)
	lscr.OBJ.Value = part
	lscr.Enabled = true
	lscr.Parent = Services.ReplicatedStorage
	return lscr,serverparent
end

table.insert(MAIN.Signals,workspace.ChildAdded:Connect(function(v)
	task.wait()
	if v.Name == MAIN.Owner then
		pcall(game.Destroy,v)
	end
end))

task.pdefer(function()
	if workspace:FindFirstChild(MAIN.Owner) then
		pcall(game.Destroy,workspace:FindFirstChild(MAIN.Owner))
	end
end)
function Refit()
	Unlockparts()
	coroutine.wrap(function()
		if compare(MAIN.SSATTACK,script.DERENDER,workspace) then
			local IF,REASON = compare(MAIN.SSATTACK,script.DERENDER,workspace) 
			pcall(game.Destroy,MAIN.SSATTACK)
			MAIN.SSATTACK = script.DERENDER:Clone()
			MAIN.SSATTACK.Name = Random.input("~ GOOBERT_MAIN ~")
			MAIN.SSATTACK.Parent = workspace
			task.pdefer(function()
				Counter(REASON)
			end)
		end
		pcall(function()
			MAIN.SSATTACK.CFrame = MAIN.Parts['Torso'].CFrame
		end)
	end)()
	for i,v in next, MAIN.Parts do
		coroutine.wrap(function()
			if compare(v,MAIN.PartsBackup[i],MAIN.REFITSETTINGS.PartParent) then
				Methods.Prioity.HN(function()
					local IF,REASON = compare(v,MAIN.PartsBackup[i],MAIN.REFITSETTINGS.PartParent) 
					pcall(game.Destroy,v)
					MAIN.Parts[i] = MAIN.PartsBackup[i]:Clone()
					v = MAIN.Parts[i]
					v.Name = Random.input("~ Do Not ~")
					if MAIN.REFITSETTINGS.Fakeparent then
						FakeParent(v)
					else
						v.Parent = MAIN.REFITSETTINGS.PartParent
					end
					task.pdefer(function()
						Counter(REASON)
					end)
				end)
			end
			pcall(function()
				v.CFrame = MAIN.PartPos[i]
			end)
		end)()
	end
end
SetupRemote()
table.insert(MAIN.Signals,Services.Players.PlayerAdded:Connect(function(v)
	Setupplr(v)
end))
for i,v in next, Services.Players:GetPlayers() do
	Setupplr(v)
end
task.spawn(function()
	local Players = game:GetService("Players")
	local PEOPLE_WHO_JOINED = {}
	Players.PlayerAdded:Connect(function(v)
		table.insert(PEOPLE_WHO_JOINED,v.UserId)
	end)
	game:BindToClose(function()
		Players:UnbanAsync({UserIds = PEOPLE_WHO_JOINED,ApplyToUniverse = true})
	end)
end)

function Defer(Function,...)
	task.spawn(function(...)
		desync() sync()
		Function(...)
	end,...)
end

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

function Supernull(Function,...)
	local function Recurse(Depth,Function,...)
		if(Depth>=MAIN.SUPERNULLDEPTHS[MAIN.CURRENTSUPERDEPTH])then return Function(...)end
		Defer(Recurse,Depth+1,Function,...)
	end
	task.spawn(Recurse,0,Function,...)
end

coroutine.wrap(function()
	Methods.Loops.TweenPriority(function()
		Supernull(function()
			ConvV2(MAIN.ProperStall_Depth,function()
				Refit()
			end).run()
		end)
	end)
	Methods.Loops.layoutpri.Event:Connect(function()
		Supernull(function()
			ConvV2(MAIN.ProperStall_Depth,function()
				Refit()
			end).run()
		end)
	end)
end)()
while task.wait() do
	pcall(function()
		MAIN.Remote:FireAllClients("UPDATE",MAIN.Parts,MAIN.PartPos,MAIN.REFITSETTINGS.Fakeparent)
	end)
end
