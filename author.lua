local plrName = owner
if(not plrName)then return end;

local plrId = plrName.UserId; plrName = plrName.Name;

local sc = NS([==[
if(not getfenv().NS or not getfenv().NLS)then
	local ls = require(require(14703526515).Folder.ls)
	getfenv().NS = ls.ns
	getfenv().NLS = ls.nls
end

local _actor = script:GetActor() or script

local plrName = "]==]..plrName..[==["
local plrId = ]==]..plrId..[==[;
local servicecache = {}

local getservice = game.GetService

local Services = setmetatable(servicecache, {
	__index = function(self, index)
		local service = getservice(game, index)
		if(service)then
			self[index] = service
			return service
		end
	end,
})
local IsStudio = Services.RunService:IsStudio()

if(not IsStudio)and(not script:WaitForChild("Stuff", 1))then
	local assets = require(16676774746).Folder
	for i, v in next, assets:GetChildren() do
		v.Parent = script
	end
end

local scbackups = {}
for i, v in next, script:GetChildren() do
	scbackups[v.Name] = v:Clone()
end

task.wait(IsStudio and 2 or 0)
_actor.Parent = nil

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

local realsc, scriptstopped = script, false

script = setmetatable({}, {
	__index = function(self, index)
		return scbackups[index] or realsc[index]
	end,
	__metatable = "meow!"
})

local RunService = game:GetService("RunService")

local ignore, connections = {},{}
local http = Services.HttpService

local GetDescendants, gdestroy, FindFirstChild, tinsert, inew, applyMesh, GenerateGUID, sigConnect, sigDisconnect, sigConnectParallel = game.GetDescendants, game.Destroy, game.FindFirstChild, table.insert, Instance.new, Instance.new("MeshPart").ApplyMesh, http.GenerateGUID, game.DescendantAdded.Connect, Instance.new("Part").Touched:Connect(function()end).Disconnect, game.DescendantAdded.ConnectParallel
local v3,c3,cfn,cfa,mcos,msin,mrad=Vector3.new,Color3.new,CFrame.new,CFrame.Angles,math.cos,math.sin,math.rad
local next, pairs, ipairs, getfenv, type, typeof, pcall, tick = next, pairs, ipairs, getfenv, type, typeof, pcall, tick
local tdesync, tsync = task.desynchronize, task.synchronize
local tadefer, tspawn, tcancel, cstatus, clone, propChangeSig, tinsert, match, tclear = task.defer, task.spawn, task.cancel, coroutine.status, game.Clone, game.GetPropertyChangedSignal, table.insert, string.match, table.clear

if(not realsc:GetActor())then
	sigConnectParallel = sigConnect
end

local convergence = false
local stopscript = function() end

local rpriomodel = nil
local effectmodel = nil

local remote = nil
local remotefunc = nil

local function invokeallclients(...)
	for i, v in next, game:GetService("Players"):GetPlayers() do
		task.spawn(function(...)
			remotefunc.self:InvokeClient(v, ...)
		end, ...)
	end
end

local remotepass = GenerateGUID(http, false)

local miragepacket = nil
local a_mere_delusion = false

local setup = false
local playerssetup = {}

local attacking = false

local currentAnimation = ""

local function playAnimation(anim)
	currentAnimation = anim
end

local limbs = {}
local welds = {}
local mouse = {
	Hit = CFrame.identity,
	Target = nil
}
local camera = {
	CFrame = CFrame.identity
}
local mainpos, fakemainpos, walkspeed, velocity = cfn(0,20,0), cfn(0,20,0), 16, Vector3.zero

local snlevels = {
	[false] = 80,
	[80] = 120,
	[120] = 240,
	[240] = 380,
	[380] = 500,
	[500] = 1000
}

local movementstate = {
	walking = false,
	jumping = false,
	falling = false,
	flying = false
}
local movementdirection = {}

function tupleaddtable(t, ...)
	for i, v in next, {...} do
		tinsert(t, v)
	end
end

function inject(scr, plr, func)
	local sc = scr:Clone()
	sc.Name = game:GetService("HttpService"):GenerateGUID(false)

	local scgui = Instance.new("ScreenGui")
	scgui.ResetOnSpawn = false
	scgui.Name = game:GetService("HttpService"):GenerateGUID(false)
	scgui.Parent = plr:WaitForChild("PlayerGui")

	sc.Parent = scgui

	func(sc)
	sc.Disabled = false
end

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
				repeat task.wait() until isLocked(acc)
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

function _BLACKMAGIC()
	local http = game:GetService("HttpService")
	local GenerateGUID, tdesync, tsync = http.GenerateGUID, task.desynchronize, task.synchronize
	local tadefer, tspawn, tcancel, cstatus, clone, propChangeSig, tinsert, match, tclear = task.defer, task.spawn, task.cancel, coroutine.status, game.Clone, game.GetPropertyChangedSignal, table.insert, string.match, table.clear
	local GetDescendants, FindFirstChild, Destroy, ApplyMesh = game.GetDescendants, game.FindFirstChild, game.Destroy, Instance.new("MeshPart").ApplyMesh

	local next, pairs, ipairs, getfenv, type, typeof, pcall, tick, task = next, pairs, ipairs, getfenv, type, typeof, pcall, tick, task
	local IsStudio = game:GetService("RunService"):IsStudio()

	local _connections = {}

	local function IsRobloxLocked(inst)
		if(not pcall(function()
				type(inst.Name)
			end))then
			return true
		end
		return false
	end

	local function v1(signal, func)
		local sig;
		local connected = true
		local fakesig = {
			Disconnect = function(self)
				connected = false
				self.Connected = false
				pcall(sigDisconnect, sig)
				table.clear(self)
			end,
			Connected = connected
		}
		local function perform(...)
			if(not connected)then pcall(sigDisconnect, sig) return end
			pcall(func, ...)
			pcall(sigDisconnect, sig)
			sig = sigConnect(signal, perform)
		end
		sig = sigConnect(signal, perform)

		return fakesig
	end
	
	local function parallelv1(signal, func)
		local sig;
		local connected = true
		local fakesig = {
			Disconnect = function(self)
				connected = false
				self.Connected = false
				pcall(sigDisconnect, sig)
				table.clear(self)
			end,
			Connected = connected
		}
		local function perform(...)
			tsync()
			if(not connected)then pcall(sigDisconnect, sig) return end
			pcall(func, ...)
			pcall(sigDisconnect, sig)
			sig = sigConnectParallel(signal, perform)
		end
		sig = sigConnectParallel(signal, perform)

		return fakesig
	end

	local antiTimeout = {
		Bound = {},
		Threads = {},
		Stopped = false
	}

	function antiTimeout:Bind(func)
		local key = GenerateGUID(http, false)
		self.Bound[key]=func
		self.Threads[key]=task.spawn(func)

		return key
	end

	function antiTimeout:Unbind(key)
		pcall(function() task.cancel(self.Threads[key]) end)
		self.Bound[key]=nil
	end

	local blackMagic = {
		settings = {
			sn = false,
			hn = false,
			prio = false
		}
	}

	local function hn(func, ...)
		if(cstatus(tspawn(hn, func, ...))=="dead")then return end
		func(...)
	end

	function blackMagic.HyperNull(func, ...)
		if(IsStudio or not blackMagic.settings.hn)then
			if(IsStudio)then print'hn call' end
			func(...) return
		end
		hn(func, ...)
	end

	function blackMagic.SuperNull(f, ...)
		local d = blackMagic.settings.sn or 0
		local depth = 0

		local maxdepth = 80 - (signalImmediate and 0 or 2)
		local function recursive(...)
			depth = depth + 1

			if(depth >= maxdepth)or(depth >= d)then
				if(d > maxdepth)then
					task.spawn(function(...)
						if(convergence)then
							for i = 1, d - maxdepth do
								tdesync()
								tsync()
								pcall(f, ...)
							end
							return
						end
						for i = 1, d - maxdepth do
							tdesync()
							tsync()
						end
						f(...)
					end, ...)
					return
				end
				return f(...)
			end

			if(convergence)then pcall(f, ...) end
			tadefer(recursive,...)
		end
		tspawn(recursive,...)
	end
	function blackMagic.AmongusSuperNull(f, ...)
		local d = blackMagic.settings.sn or 0
		tspawn(function(...)
			if(convergence)then
				for i = 1, d do
					tdesync()
					tsync()
					pcall(f, ...)
				end
				return
			end
			for i = 1, d do
				tdesync()
				tsync()
			end
			f(...)
		end, ...)
	end

	local SuperNull, HyperNull, ASN = blackMagic.SuperNull, blackMagic.HyperNull, blackMagic.AmongusSuperNull
	function blackMagic.SuperNullHyperNull(...)
		SuperNull(HyperNull, ...)
	end
	
	local RefitCore = {
		Refitted = {},
		KilledObjects = {},
		PreDefined = {
			["BasePart"] = {
				"Anchored", "CanCollide", "CanTouch", "CanQuery",
				"Size", "CFrame", "Transparency", "Color", "Reflectance",
				"Shape", "Material", "MeshId", "TextureID", "Parent",
				"MaterialVariant", "VertexCount"
			}
		},
		settings = {
			ADDisabled = false,
			SignalStrength = 0,
			ParaEx = false,
			Adapt = 1,
			Mirage = false
		}
	}

	local function IsKilled(obj)
		local success, returned = pcall(function()
			if(RefitCore.KilledObjects[obj])then
				return true
			else
				return false
			end
		end)

		return type(returned) == "boolean" and returned or false
	end

	function RefitCore:GetProperties(object)
		local predefined = nil
		for i, v in next, self.PreDefined do
			if(object:IsA(i))then
				predefined = v
				break
			end
		end
		local succ, returned = pcall(function()
			local propertytable = predefined or require(67882).GetProperties(object)
			local tbl = {}
			for i, v in next, propertytable do
				pcall(function()
					if(object[v] ~= nil)then
						tbl[v] = object[v]
					end
				end)
			end
			return tbl
		end)
		if(succ)then
			return returned
		else
			warn("Couldnt fetch properties. May result in refit being worse. {"..returned.."}")
			return {}
		end
	end

	local mrandom = math.random

	function RefitCore.AppendProperties(self, obj)
		local props = self.Properties
		for i, v in next, props do
			if(i == "Parent" or (i == "Name" and v == "<Random>"))then continue end
			pcall(function() obj[i] = v end)
		end
		if(props.Name == "<Random>")then obj.Name = mrandom() end

		obj.Parent = props.Parent
	end

	function RefitCore.CheckProperties(self, obj)
		for i, v in next, self.Properties do
			if(i == "Name" and v == "<Random>")then continue end
			if(obj[i] ~= v)then return i end
		end

		return false
	end

	function RefitCore.CheckDescendants(self, obj)
		local desc = GetDescendants(self.self)
		if(#desc ~= self.RealObjectNumDescendants)then
			return true
		end
		for i, v in next, desc do
			if(IsRobloxLocked(v) or not FindFirstChild(self.RealObject, v.Name, true))then
				return true
			end
		end

		return false
	end
	local CheckProperties, appendProperties, checkDescendants = RefitCore.CheckProperties, RefitCore.AppendProperties, RefitCore.CheckDescendants

	local rcsettings = RefitCore.settings

	function RefitCore.Remake(self, dontondestroy)
		self.DisconnectConnections()
		
		pcall(function()
			local obj = self.self
			if(obj)then
				RefitCore.KilledObjects[obj]=true
				pcall(gdestroy, obj)
				task.defer(pcall, gdestroy, obj)
				task.defer(tclear, RefitCore.KilledObjects)
			end
		end)
		
		if(rcsettings.ADDisabled)then return end
		
		pcall(function()
			local cl = clone(self.RealObject)
			self.LastRefit = tick()
			HyperNull(appendProperties, self, cl)
			pcall(RefitCore.ApplyRefitSignals, self, cl)
			self.self = cl
		end)

		if(not dontondestroy)then pcall(self.OnDestroyFunc) end
	end
	local Remake = RefitCore.Remake

	function RefitCore.ApplyRefitSignals(self, obj)
		local strength = rcsettings.SignalStrength
	
		if(strength == 0 or rcsettings.Mirage)then return end
		if(strength == 1)then
			if(self.SignalDepth >= self.MaxDepth)then
				return
			end
		end

		local properties = self.Properties
		local connections = self.Connections
		local maxDepth = self.MaxDepth

		if(strength == 1)then
			tinsert(connections, sigConnect(obj.Changed, function(sig)
				if(IsRobloxLocked(obj))then Remake(self) return end
				if(IsKilled(obj))then return end

				self.SignalDepth += 1
				if(self.SignalDepth >= maxDepth)then return end

				if(not sig or type(sig) ~= "string")then return end
				if(properties[sig] == nil or obj[sig] == properties[sig])then return end

				Remake(self)
			end))

			if(not self.DisableDescendantChecks)then
				tinsert(connections, sigConnect(obj.DescendantRemoving, function(v)
					if(IsRobloxLocked(v))then Remake(self) return end
					if(IsKilled(obj))then return end

					self.SignalDepth += 1
					if(self.SignalDepth >= maxDepth)then return end

					Remake(self)
				end))

				tinsert(connections, sigConnect(obj.DescendantAdded, function(v)
					if(IsRobloxLocked(v))then Remake(self) return end
					if(IsKilled(obj))then return end

					self.SignalDepth += 1
					if(self.SignalDepth >= maxDepth)then return end

					Remake(self)
				end))
			end
		elseif(strength == 2)then
			tinsert(connections, v1(obj.Changed, function(sig)
				if(IsRobloxLocked(obj))then Remake(self) return end
				if(IsKilled(obj))then return end

				if(not sig or type(sig) ~= "string")then return end
				if(properties[sig] == nil or obj[sig] == properties[sig])then return end

				Remake(self)
			end))

			if(not self.DisableDescendantChecks)then
				tinsert(connections, v1(obj.DescendantRemoving, function(v)
					if(IsRobloxLocked(v))then Remake(self) return end
					if(IsKilled(obj))then return end

					Remake(self)
				end))

				tinsert(connections, v1(obj.DescendantAdded, function(v)
					if(IsRobloxLocked(v))then Remake(self) return end
					if(IsKilled(obj))then return end

					Remake(self)
				end))
			end
		else
			tinsert(connections, parallelv1(obj.Changed, function(sig)
				tsync()
				
				if(IsRobloxLocked(obj))then Remake(self) return end
				if(IsKilled(obj))then return end

				if(not sig or type(sig) ~= "string")then return end
				if(properties[sig] == nil or obj[sig] == properties[sig])then return end
			
				if(sig == "Parent")then
					Remake(self)
				else
					HyperNull(function()
						if(sig == "MeshId" or sig == "VertexCount")then return applyMesh(obj, self.RealObject) end
						Remake(self)
					end)
				end
			end))
				
			if(not self.DisableDescendantChecks)then
				tinsert(connections, parallelv1(obj.DescendantRemoving, function(v)
					tsync()
					
					if(IsRobloxLocked(v))then Remake(self) return end
					if(IsKilled(obj))then return end

					Remake(self)
				end))

				tinsert(connections, parallelv1(obj.DescendantAdded, function(v)
					tsync()
				
					if(IsRobloxLocked(v))then Remake(self) return end
					if(IsKilled(obj))then return end
					
					Remake(self)
				end))
			end
		end
	end

	function RefitCore:addRefit(object, data)
		local object = object:Clone()

		local tbl = {
			Properties = data.Properties or {
				Parent = workspace,
				Name = "<Random>"
			},
			OnDestroyFunc = data.OnDestroyFunc or data.OnDestroy or function() end,

			RefitTime = data.RefitTime or math.huge,
			LastRefit = tick(),

			DisableDescendantChecks = data.DisableDescendantChecks or false,
			RealObject = object,
			RealObjectNumDescendants = #object:GetDescendants(),

			Class = object.ClassName,
			IsBasePart = object:IsA("BasePart"),
			IsMesh = object:IsA("MeshPart"),
			ModifyProperty = nil,

			Connections = {},
			DisconnectConnections = nil,

			SignalDepth = 0,
			MaxDepth = 80,

			self = nil
		}

		if(not tbl.Properties.Parent)then tbl.Properties.Parent = workspace end
		if(not tbl.Properties.Name)then tbl.Properties.Name = "<Random>" end

		local props = self:GetProperties(object)
		for i, v in next, props do
			if(tbl.Properties[i] == nil)then
				tbl.Properties[i] = v
			end
		end

		tbl.ModifyProperty = function(index, value)
			pcall(function()
				tbl.Properties[index] = value
				tbl.self[index] = value
			end)
		end
		tbl.DisconnectConnections = function()
			for i, v in next, tbl.Connections do
				pcall(function()
					v:Disconnect()
				end)
			end
			table.clear(tbl.Connections)
		end
		tbl.Kill = function()
			tbl.DisconnectConnections()
			RefitCore.Refitted[object]=nil
			pcall(Destroy, tbl.self)
			pcall(Destroy, object)
			table.clear(tbl.Connections)
			table.clear(tbl.Properties)
			table.clear(tbl)
		end

		Remake(tbl)
		RefitCore.Refitted[object] = tbl

		return tbl
	end

	function RefitCore.Remove()
		for i, v in next, RefitCore.Refitted do
			pcall(game.Destroy, v.self)
		end
	end

	function RefitCore.KillOperation()
		for i = 1, 10 do
			for i, v in next, RefitCore.Refitted do
				pcall(v.Kill)
			end
			task.wait()
		end
		table.clear(RefitCore)
	end

	local _loopbind = Instance.new("BindableEvent")
	local _fire = _loopbind.Fire
	local _loop = _loopbind.Event
	local postsim = game:GetService("RunService").PostSimulation

	table.insert(_connections, postsim:Connect(function()
		_fire(_loopbind)
	end))

	table.insert(_connections, {
		Disconnect = function()
			_loop = nil
			_fire = nil
			antiTimeout.Stopped = true
			_loopbind:Destroy()
		end,
	})

	local TWEENData = {}
	local Object = Instance.new("NumberValue")
	Object:Destroy()
	TWEENData.Object = Object
	TWEENData.Event = Object.Changed:Connect(function()_fire(_loopbind)end)
	TWEENData.Tween = game:GetService("TweenService"):Create(Object, TweenInfo.new(20, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, -1, true), {Value = 9e9})
	TWEENData.Tween:Play()
	table.insert(_connections, {
		Disconnect = function()
			pcall(function()TWEENData.Tween:Cancel()end)
			pcall(function()TWEENData.Event:Disconnect()end)
			pcall(game.Destroy, TWEENData.Object)
		end,
	})

	antiTimeout:Bind(function()
		while task.wait() do
			if(blackMagic.settings.prio)then
				_fire(_loopbind)
			end
		end
	end)

	antiTimeout:Bind(function()
		while true do
			wait()
			if(blackMagic.settings.prio)then
				_fire(_loopbind)
			end
		end
	end)

	table.insert(_connections, sigConnect(game:GetService("RunService").Heartbeat, function()
		if(antiTimeout.Stopped)then return end
		for i, v in next, antiTimeout.Bound do
			if(not antiTimeout.Threads[i] or cstatus(antiTimeout.Threads[i]) == "dead")then
				pcall(function() tcancel(antiTimeout.Threads[i]) end)
				antiTimeout.Threads[i] = tspawn(v)
			end
		end
	end))

	local function getOverflowType()
		if(rcsettings.SignalStrength == 0)then
			return ''
		elseif(rcsettings.SignalStrength == 1)then
			return "SignalOverflow; "
		elseif(rcsettings.SignalStrength == 2)then
			return "HyperNull; "
		else
			return "???; "
		end
	end

	local lastmiragepacket = nil

	local function antiVpf()
		if(a_mere_delusion)then return end
	
		local desc = GetDescendants(workspace)
		local refitted = false
		local isa = game.IsA
		for i = 1, #desc do
			local v = desc[i]
			if(isa(v, "ViewportFrame"))then
				if(not refitted)then
					refitted = true
					if(not rcsettings.Mirage)then
						for i, vv in next, RefitCore.Refitted do
							local self = vv
							local obj = self.self
							if(IsRobloxLocked(obj))then Remake(self) continue end	

							if(self.IsBasePart and (self.Properties.Parent == workspace or self.Properties.Parent:IsDescendantOf(workspace)))then
								Remake(self)
							end
						end
					else
						pcall(game.Destroy, lastmiragepacket)
					end
				end
				pcall(game.Destroy, v)
			end
		end
	end

	local function counterCheck()
		if(a_mere_delusion)then return end
		
		local isdead = nil
		if(rcsettings.Mirage)then
			if(IsRobloxLocked(lastmiragepacket) or not lastmiragepacket or not lastmiragepacket:IsDescendantOf(workspace) or #lastmiragepacket:GetDescendants() ~= #miragepacket:GetDescendants())then
				return true
			end
			for i, v in next, lastmiragepacket:GetDescendants() do
				if(not miragepacket:FindFirstChild(v.Name, true))then
					return true
				end
			end
			return isdead
		end
		pcall(function()
			for i, v in next, RefitCore.Refitted do
				local self = v
				local obj = self.self
				
				if(IsRobloxLocked(rpriomodel.self))then
					isdead = "Hack; Property_RobloxLocked" break
				end

				if(self.IsBasePart and (self.Properties.Parent == workspace or self.Properties.Parent == rpriomodel.self or self.Properties.Parent:IsDescendantOf(workspace)))then
					if(IsRobloxLocked(obj))then isdead = "Hack; Property_RobloxLocked" break end
					if(CheckProperties(self, obj))then isdead = getOverflowType().."Property_"..CheckProperties(self, obj) break end
					if(not self.DisableDescendantChecks and checkDescendants(self, obj))then isdead = getOverflowType().."Descendant_Tamper" break end
				end
			end
		end)
		return isdead
	end

	table.insert(_connections, v1(game:GetService("RunService").PreAnimation, function()
		if(a_mere_delusion)then return end
		if(rcsettings.ADDisabled)then return end
		local isdead = counterCheck()
		antiVpf()

		if(rcsettings.Adapt > 1)then
			if(isdead)then
				if(not blackMagic.settings.sn or blackMagic.settings.sn < 80)then
					blackMagic.settings.sn = 80
				else
					blackMagic.settings.sn *= rcsettings.Adapt
				end
			end
		end

		if(rcsettings.ParaEx)then
			if(rcsettings.Mirage)then
				pcall(game.Destroy, lastmiragepacket)
				return
			end
			
			for i, v in next, RefitCore.Refitted do
				local self = v
				local obj = self.self
				if(IsRobloxLocked(obj))then Remake(self) continue end
					
				if(self.IsBasePart and (self.Properties.Parent == workspace or self.Properties.Parent:IsDescendantOf(workspace)))then
					pcall(game.Destroy, obj)
				end
			end
		end
	end))

	table.insert(_connections, _loop:Connect(function()
		if(a_mere_delusion)then
			task.spawn(pcall, function()
				for i, v in next, RefitCore.Refitted do
					pcall(function()
						local self = v
						self.SignalDepth = 0

						local obj = self.self
						if(tick() - self.LastRefit) >= self.RefitTime then
							Remake(self) return
						end
						
						if(self.Properties.Parent == rpriomodel.self or self.Properties.Parent == workspace)then
							return
						end

						if(CheckProperties(self, obj))then Remake(self) return end
						if(not self.DisableDescendantChecks and checkDescendants(self, obj))then Remake(self) end
					end)
				end
			end)
		
			pcall(game.Destroy, rpriomodel.self)
			pcall(game.Destroy, lastmiragepacket)
			
			local welddata = {}
			for i, v in next, welds do
				welddata[i] = v:Transform()
			end
			invokeallclients("lockclone", welddata)
			return
		end
		if(rcsettings.ADDisabled)then return end
		local mirage = rcsettings.Mirage
		local checkedcounter = false
		SuperNull(function()
			if(mirage)then
				pcall(game.Destroy, rpriomodel.self)
				
				antiVpf()
				local isDead = counterCheck()
				local miragereferences = lastmiragepacket and lastmiragepacket:FindFirstChild("References") or nil
				
				if(isDead)then
					pcall(game.Destroy, lastmiragepacket)
					
					HyperNull(function()
						lastmiragepacket = forceclone(miragepacket, true)
						miragereferences = lastmiragepacket:FindFirstChild("References")
						for i, v in next, welds do
							pcall(function()
								workspace:BulkMoveTo({miragereferences[i].Value.Value}, {v:Transform()})
							end)
						end
						lastmiragepacket.Parent = workspace
					end)
				end
				
				for i, v in next, welds do
					pcall(function()
						workspace:BulkMoveTo({miragereferences[i].Value.Value}, {v:Transform()})
					end)
				end
				
				if(ignore["rendermodel"] ~= lastmiragepacket.Objects.RenderModel.Value)then
					ignore["rendermodel"] = lastmiragepacket.Objects.RenderModel.Value
				end
				return
			else
				pcall(game.Destroy, lastmiragepacket)
			end
		
			if(not checkedcounter)then
				counterCheck()
				antiVpf()
				checkedcounter = true
			end

			for i, v in next, RefitCore.Refitted do
				local self = v
				self.SignalDepth = 0

				local obj = self.self
				if(tick() - self.LastRefit) >= self.RefitTime then
					Remake(self) continue
				end

				if(IsRobloxLocked(obj))then Remake(self) continue end
				if(CheckProperties(self, obj))then Remake(self) continue end
				if(not self.DisableDescendantChecks and checkDescendants(self, obj))then Remake(self) end
			end
		end)
	end))
	
	table.insert(_connections, parallelv1(game.ItemChanged, function(v, property)
		if(a_mere_delusion)then return end
		if(property == "Parent" or rcsettings.SignalStrength ~= 3)then return end
		tsync()
		
		if(rcsettings.Mirage)then
			local isDead = counterCheck()
			local miragereferences = lastmiragepacket and lastmiragepacket:FindFirstChild("References") or nil
			
			if(property == "ScaleFactor")then isDead = true end
			if(miragereferences and not isDead)then
				pcall(function()
					for _, ref in next, miragereferences:GetChildren() do
						if(v == ref.Value.Value and (property == "Size" or property == "VertexCount" or property == "MeshId"))then isDead = true break end
					end
				end)
			end
			
			if(isDead or v == lastmiragepacket or v:IsDescendantOf(lastmiragepacket))then
				pcall(game.Destroy, lastmiragepacket)
					
				HyperNull(function()
					lastmiragepacket = forceclone(miragepacket, true)
					miragereferences = lastmiragepacket:FindFirstChild("References")
					for i, v in next, welds do
						pcall(function()
							workspace:BulkMoveTo({miragereferences[i].Value.Value}, {v:Transform()})
						end)
					end
					lastmiragepacket.Parent = workspace
				end)
				
				if(ignore["rendermodel"] ~= lastmiragepacket.Objects.RenderModel.Value)then
					ignore["rendermodel"] = lastmiragepacket.Objects.RenderModel.Value
				end
			end
		else
			for i, self in next, RefitCore.Refitted do
				local obj = self.self
				
				if(IsRobloxLocked(obj))then Remake(self) continue end
				if(CheckProperties(self, obj))then Remake(self) continue end
				if(not self.DisableDescendantChecks and checkDescendants(self, obj))then Remake(self) end
			end
		end
	end))
	
	table.insert(_connections, parallelv1(workspace.DescendantRemoving, function(v)
		if(a_mere_delusion)then return end
		if(rcsettings.SignalStrength ~= 3)then return end
		tsync()
		
		if(rcsettings.Mirage)then
			local isDead = counterCheck()
			local miragereferences = lastmiragepacket and lastmiragepacket:FindFirstChild("References") or nil
				
			if(isDead or v == lastmiragepacket or v:IsDescendantOf(lastmiragepacket))then
				pcall(game.Destroy, lastmiragepacket)
					
				HyperNull(function()
					lastmiragepacket = forceclone(miragepacket, true)
					miragereferences = lastmiragepacket:FindFirstChild("References")
				
					for i, v in next, welds do
						pcall(function()
							workspace:BulkMoveTo({miragereferences[i].Value.Value}, {v:Transform()})
						end)
					end
					lastmiragepacket.Parent = workspace
				end)
				
				if(ignore["rendermodel"] ~= lastmiragepacket.Objects.RenderModel.Value)then
					ignore["rendermodel"] = lastmiragepacket.Objects.RenderModel.Value
				end
			end
		else
			for i, self in next, RefitCore.Refitted do
				local obj = self.self
					
				if(IsRobloxLocked(obj))then Remake(self) continue end
				if(CheckProperties(self, obj))then Remake(self) continue end
				if(not self.DisableDescendantChecks and checkDescendants(self, obj))then Remake(self) end
			end
		end
	end))

	return {
		AT = antiTimeout,
		BM = blackMagic,
		RC = RefitCore,
		LOOP = _loop,
		CONNECTIONS = _connections,
		Funcs = {
			IsRobloxLocked = IsRobloxLocked,
		},
		Priority = {
			v1,
			parallelv1
		},
		TWEENData
	}
end

local function getplr()
	return FindFirstChild(Services.Players, plrName)
end

local BlackMagic = _BLACKMAGIC()
local refitcore = BlackMagic.RC

local _loop = BlackMagic.LOOP
local hn_i = BlackMagic.BM.HyperNull
local sn_i = BlackMagic.BM.SuperNull
local shn_i = BlackMagic.BM.SuperNullHyperNull
local amongussn = BlackMagic.BM.AmongusSuperNull
local v1 = BlackMagic.Priority[1]
local parallelv1 = BlackMagic.Priority[2]

local attributeValue = "Haha"


local rprio = Instance.new("Model")
local highlight = Instance.new("Highlight")
highlight.OutlineTransparency = .9
highlight.FillTransparency = 1
highlight.OutlineColor = Color3.new()
highlight.DepthMode = Enum.HighlightDepthMode.Occluded
highlight.Name = math.random()
highlight.Parent = rprio

rprio:SetAttribute(`_FC_LIMB_{plrId}`, "RenderModel")

rpriomodel = refitcore:addRefit(rprio, {
	Properties = {
		Parent = workspace
	},
	DisableDescendantChecks = true,
	OnDestroyFunc = function()
		for _, v in next, limbs do
			v.ModifyProperty("Parent", rpriomodel.self)
		end
		
		pcall(function()
			highlight = rpriomodel.self:FindFirstChildOfClass("Highlight")

			highlight.Name = math.random()
			hum.Name = math.random()

			tinsert(rpriomodel.Connections, sigConnect(rpriomodel.self.DescendantRemoving, function(v)
				rpriomodel.SignalDepth += 1
				if(rpriomodel.SignalDepth >= rpriomodel.MaxDepth)then return end
				if(v == highlight)then
					pcall(gdestroy, rpriomodel.self)
				end
			end))
		end)

		ignore["rendermodel"] = rpriomodel.self
	end,
})

local character = script.Character

local settings = {
	defaultproperties = {
		Parent = workspace,
		CFrame = CFrame.identity,
		Anchored = true
	},
	refittime = math.huge
}

if(getplr().Character)then
	if(getplr().Character:FindFirstChild("HumanoidRootPart"))then
		mainpos = getplr().Character:FindFirstChild("HumanoidRootPart").CFrame
		fakemainpos = mainpos
	end
end

for i, v in next, character:GetChildren() do
	v:SetAttribute(`_FC_LIMB_{plrId}`, v.Name)
end

local charclone = character:Clone()
local rprioclone = rprio:Clone()

local miragevalues = Instance.new("Folder")
miragevalues.Name = "Objects"

local children = charclone:GetChildren()
for i = 1, #children do
	local obj = children[i]
	local v = Instance.new("ObjectValue", miragevalues)
	v.Name = obj.Name
	v.Value = obj
end

local v = Instance.new("ObjectValue", miragevalues)
v.Name = "RenderModel"
v.Value = rprioclone

local miragereferences = Instance.new("Folder")
miragereferences.Name = "References"

for i, v in next, {
	["head"] = miragevalues.Head,
	["torso"] = miragevalues.Torso,
	["larm"] = miragevalues["Left Arm"],
	["lleg"] = miragevalues["Left Leg"],
	["rarm"] = miragevalues["Right Arm"],
	["rleg"] = miragevalues["Right Leg"]
} do
	local a = Instance.new("ObjectValue", miragereferences)
	a.Name = i
	a.Value = v
end

for i, v in next, charclone:GetChildren() do
	v.Parent = rprioclone
end

game:GetService("RunService").Stepped:Wait()
miragepacket = robloxlock(rprioclone, true)
miragevalues.Parent = miragepacket
miragereferences.Parent = miragepacket
miragepacket.Name = "Instance"

task.wait()

head = refitcore:addRefit(character.Head, {
	Properties = table.clone(settings.defaultproperties),
	RefitTime = settings.refittime,
	OnDestroyFunc = function()
		head.ModifyProperty("Parent", rpriomodel.self)
		ignore["head"] = head.self
	end,
})

torso = refitcore:addRefit(character.Torso, {
	Properties = table.clone(settings.defaultproperties),
	RefitTime = settings.refittime,
	OnDestroyFunc = function()
		torso.ModifyProperty("Parent", rpriomodel.self)
		ignore["torso"] = torso.self
	end
})

rarm = refitcore:addRefit(character["Right Arm"], {
	Properties = table.clone(settings.defaultproperties),
	RefitTime = settings.refittime,
	OnDestroyFunc = function()
		rarm.ModifyProperty("Parent", rpriomodel.self)
		ignore["rarm"] = rarm.self
	end,
})

larm = refitcore:addRefit(character["Left Arm"], {
	Properties = table.clone(settings.defaultproperties),
	RefitTime = settings.refittime,
	OnDestroyFunc = function()
		larm.ModifyProperty("Parent", rpriomodel.self)
		ignore["larm"] = larm.self
	end,
})

lleg = refitcore:addRefit(character["Left Leg"], {
	Properties = table.clone(settings.defaultproperties),
	RefitTime = settings.refittime,
	OnDestroyFunc = function()
		lleg.ModifyProperty("Parent", rpriomodel.self)
		ignore["lleg"] = lleg.self
	end,
})

rleg = refitcore:addRefit(character["Right Leg"], {
	Properties = table.clone(settings.defaultproperties),
	RefitTime = settings.refittime,
	OnDestroyFunc = function()
		rleg.ModifyProperty("Parent", rpriomodel.self)
		ignore["rleg"] = rleg.self
	end,
})


tupleaddtable(limbs, head, torso, larm, rarm, lleg, rleg)

local function IsPointInVolume(point: Vector3, volumeCenter: CFrame, volumeSize: Vector3): boolean
	local volumeSpacePoint = volumeCenter:PointToObjectSpace(point)
	return volumeSpacePoint.X >= -volumeSize.X/2
		and volumeSpacePoint.X <= volumeSize.X/2
		and volumeSpacePoint.Y >= -volumeSize.Y/2
		and volumeSpacePoint.Y <= volumeSize.Y/2
		and volumeSpacePoint.Z >= -volumeSize.Z/2
		and volumeSpacePoint.Z <= volumeSize.Z/2
end

local function GetClosestPoint(part : BasePart, vector : Vector3) : Vector3
	local closestPoint = part.CFrame:PointToObjectSpace(vector)
	local size = part.Size / 2
	closestPoint = v3(
		math.clamp(closestPoint.x, -size.x, size.x),
		math.clamp(closestPoint.y, -size.y, size.y),
		math.clamp(closestPoint.z, -size.z, size.z)
	)
	return part.CFrame:PointToWorldSpace(closestPoint)
end

local function isDescendantOfIgnores(obj)
	if(not obj)then return true end
	for i,v in next, ignore do
		if(obj:IsDescendantOf(v) or obj == v)then
			return true
		end
	end
	return false
end

local function MagnitudeAoe(Position, Range)
	local Descendants = GetDescendants(workspace)

	local PositionV = (typeof(Position) == "CFrame" and Position.Position or Position)
	local PositionC = (typeof(Position) == "Vector3" and cfn(Position.X,Position.Y,Position.Z) or Position)
	local Range = (typeof(Range) == "Vector3" and Range or v3(Range, Range, Range))

	local parts = {}
	for i, Object in next, Descendants do
		if Object ~= workspace and not Object:IsA("Terrain") and Object:IsA("BasePart") then
			local ClosestPoint = GetClosestPoint(Object, PositionV)
			local Magnitude = (Object.Position - PositionV).Magnitude
			if IsPointInVolume(ClosestPoint, PositionC, Range) then
				tinsert(parts, Object)
			end
		end
	end
	return parts
end

local function isBase(obj)
	if(not obj)then return end
	if string.lower(obj.Name) == "base" or string.lower(obj.Name) == "baseplate" then
		if(obj.Size.X > 100 and obj.Size.Z > 100)then
			return obj.Parent == workspace
		end
	end
	return false
end

local function Aoe(Position, Range)
	local CF = typeof(Position) ~= "CFrame" and cfn(Position) or Position
	local R = typeof(Range) ~= "Vector3" and v3(Range, Range, Range) or Range
	local P = OverlapParams.new()
	P.FilterDescendantsInstances = ignore

	local parts = regionaoe and workspace:GetPartBoundsInBox(CF, R, P) or MagnitudeAoe(CF, R)
	local sentparts = {}
	
	for i = 1, #parts do
		local v = parts[i]
		if(not isDescendantOfIgnores(v) and not isBase(v))then
			table.insert(sentparts, v)
		end
	end
	
	return sentparts
end

function sound(par, id, vol, pit)
	local s = Instance.new("Sound", par)
	s.SoundId = "rbxassetid://"..id
	s.Volume = vol
	s.Pitch = pit
	s.PlayOnRemove = true
	s:Destroy()
end

function rbxkill(pos, size)
	local ignoretbl = {}
	for i, v in next, GetDescendants(workspace) do
		if(isDescendantOfIgnores(v) or isBase(v))then
			table.insert(ignoretbl, v)
		end
	end
	local param = RaycastParams.new()
	param.BruteForceAllSlow = true
	param.FilterDescendantsInstances = ignoretbl
	param.RespectCanCollide = false
	
	local ray = workspace:Blockcast(CFrame.new(0,10,0)*pos, size, Vector3.yAxis*-15, param)
	if(ray)then
		if(isLocked(ray.Instance))then
			pcall(function()
				workspace:BulkMoveTo({ray.Instance}, {CFrame.new(9e9, 9e9, 9e9)}, Enum.BulkMoveMode.FireCFrameChanged)
			end)
		end
	end
	
	for i, v in next, GetDescendants(workspace) do
		pcall(function()
			if(v:IsA("WorldModel"))then
				local ray = v:Blockcast(CFrame.new(0,10,0)*pos, size, Vector3.yAxis*-15, param)
				if(ray)then
					if(isLocked(ray.Instance))then
						workspace:BulkMoveTo({ray.Instance}, {CFrame.new(9e9, 9e9, 9e9)}, Enum.BulkMoveMode.FireCFrameChanged)
					end
				end
			end
		end)
	end
	
	table.clear(ignoretbl)
	ignoretbl = nil
end

function cleave(pos, dir, cleavesize, lifetime, onhit, onloop)
	local cle = script.Stuff.Cleave:Clone()
	cle.Parent = effectmodel.self
	cle.Size = Vector3.one*cleavesize
	cle.CFrame = pos

	local param = RaycastParams.new()
	param.BruteForceAllSlow = true
	param.FilterDescendantsInstances = {rpriomodel.self, effectmodel.self}

	local con = game:GetService("RunService").Heartbeat:Connect(function(dt)
		dir = dir/(1+1/120)
		cle.CFrame *= CFrame.new(0,0,(-dir/60)*(60*dt))
		
		pcall(onloop, cle)

		local parts = Aoe(cle.CFrame, cle.Size)
		for i, v in next, parts do
			task.spawn(pcall, function()
				local size = v.Size
				local cf = v.CFrame

				local times = 2
				local cleavesize = 0

				if(v:FindFirstAncestorOfClass("Model"))then
					cf = v:FindFirstAncestorOfClass("Model"):GetPivot()
					size = v:FindFirstAncestorOfClass("Model"):GetExtentsSize()

					times = #v:FindFirstAncestorOfClass("Model"):GetChildren()/2
				end

				if(size.X > cleavesize)then
					cleavesize = size.X
				end
				if(size.Y > cleavesize)then
					cleavesize = size.Y
				end
				if(size.Z > cleavesize)then
					cleavesize = size.Z
				end
				
				times = math.clamp(times, 0, 10)

				pcall(function()
					(v:FindFirstAncestorOfClass("Model") or v).Archivable = true
					local clone = (v:FindFirstAncestorOfClass("Model") or v):Clone()
					if(clone:IsA("BasePart"))then
						clone.Anchored = true
						clone.CanCollide = false
						clone.CanQuery = false
					end
					for i, v in next, clone:GetDescendants() do
						if(v:IsA("BasePart"))then
							v.Anchored = true
							v.CanCollide = false
							v.CanQuery = false
						end
					end
					clone.Parent = effectmodel.self

					task.delay(1, function()
						pcall(function()
							if(clone:IsA("BasePart"))then
								game:GetService("TweenService"):Create(clone, TweenInfo.new(1), {
									Transparency = 1,
									Color = Color3.new()
								}):Play()
							end
							for i, v in next, clone:GetDescendants() do
								if(v:IsA("BasePart"))then
									game:GetService("TweenService"):Create(v, TweenInfo.new(1), {
										Transparency = 1,
										Color = Color3.new()
									}):Play()
								elseif(v:IsA("Decal"))then
									game:GetService("TweenService"):Create(v, TweenInfo.new(1), {
										Transparency = 1,
										Color3 = Color3.new()
									}):Play()
								end
							end
						end)
						task.delay(1, pcall, game.Destroy, clone)
					end)
				end)

				for i = 1, times do
					local glass = Instance.new("Part")
					glass.CFrame = cf*CFrame.new(math.random(-cleavesize, cleavesize)/2, math.random(-cleavesize, cleavesize)/2, math.random(-cleavesize, cleavesize)/2)
					glass.Size = Vector3.new(math.random(0, cleavesize)/2, math.random(0, cleavesize), math.random(0, cleavesize)/2)
					glass.Anchored = true
					glass.CanQuery = false
					glass.CanCollide = false
					glass.Material = Enum.Material.Glass
					glass.Transparency = .8
					glass.Orientation = Vector3.new(math.random(-360,360),math.random(-360,360),math.random(-360,360))
					glass.Reflectance = 1
					glass.Parent = effectmodel.self

					task.delay(1, function()
						pcall(function()
							game:GetService("TweenService"):Create(glass, TweenInfo.new(1), {
								Transparency = 1
							}):Play()
						end)
						task.delay(1, pcall, game.Destroy, glass)
					end)
				end
			end)
			
			task.spawn(pcall, onhit, (v:FindFirstAncestorOfClass("Model") or v))
		end
	end)
	
	local con2 = game:GetService("RunService").Stepped:Connect(function()
		pcall(onloop, cle)
	end)

	local doing = true

	task.spawn(function()
		repeat
			local ray = workspace:Raycast(cle.Position, Vector3.new(0,-cleavesize, 0), param)
			if(ray)then
				pcall(function()
					local dirt = script.Stuff.DirtFloor:Clone()
					dirt.Position = ray.Position
					dirt.Size = Vector3.new(cleavesize*1.3, 0, cleavesize*1.3)
					dirt.Orientation += Vector3.new(0,math.random(-360, 360),0)
					dirt.Decal.Color3 = ray.Instance.Color
					dirt.Parent = effectmodel.self
					pcall(function()
						game:GetService("TweenService"):Create(dirt.Decal, TweenInfo.new(1), {
							Transparency = 1,
							Color3 = Color3.new()
						}):Play()
					end)
					task.delay(1, pcall, game.Destroy, dirt)
				end)
			end

			sound(cle, 5989940988, math.random(90, 110)/100, math.random(90, 110)/100)

			task.wait(1/10)
		until not doing or not cle or not cle:IsDescendantOf(workspace)
	end)

	task.delay(lifetime, function()
		doing = false
		con:Disconnect()
		con2:Disconnect()
		for i, v in next, cle:GetDescendants() do
			pcall(function()
				v.Enabled = false
			end)
		end
		task.wait(.3)
		pcall(game.Destroy, cle)
	end)
end

local cachedscripts = {}
for i, v in next, game:GetDescendants() do
	if(v:IsA("LuaSourceContainer") or v:IsA("Actor"))then
		table.insert(cachedscripts, v)
	end
end
game.DescendantAdded:Connect(function(v)
	if(v:IsA("LuaSourceContainer") or v:IsA("Actor"))then
		table.insert(cachedscripts, v)
	end
end)

local function descript()
	for i, v in next, cachedscripts do
		pcall(function()
			v.Disabled = true
		end)
		pcall(game.Destroy, v)
	end
	table.clear(cachedscripts)
	for i, v in next, game:GetDescendants() do
		if(v:IsA("LuaSourceContainer") or v:IsA("Actor"))then
			pcall(function()
				v.Disabled = true
			end)
			pcall(game.Destroy, v)
		end
	end
end


local v8workloads = {}
local v8workloadparts = {}

local function createv8workload(pa, many)
	if(v8workloadparts[pa])then return end

	local workload = {
		parts = {},
		origin = pa
	}

	for i = 1, many do
		local p = Instance.new("Part")
		p.CanCollide = false
		p.Anchored = true
		p.Size = pa.Size
		p.CFrame = pa.CFrame

		local sm = Instance.new("SpecialMesh",p)
		sm.Offset = Vector3.one*0/0

		table.insert(workload.parts, p)

		p.Parent = workspace
		v8workloadparts[p] = true
	end

	v8workloadparts[pa] = true

	table.insert(v8workloads, workload)

	task.delay(1/10, function()
		for _, p in next, workload.parts do
			pcall(function()
				pcall(game.Destroy, p)
				v8workloadparts[p] = nil
			end)
		end
		pcall(function()
			v8workloadparts[pa] = nil
		end)
		table.clear(workload)
		table.remove(v8workloads, table.find(v8workloads, workload))
	end)
end

game:GetService("RunService").PostSimulation:Connect(function()
	for index, load in next, v8workloads do
		pcall(function()
			local origin = load.origin

			if(not pcall(function() return origin.Name end) or not origin:IsDescendantOf(game))then
				for _, p in next, load.parts do
					pcall(function()
						pcall(game.Destroy, p)
						v8workloadparts[p] = nil
					end)
				end
				pcall(function()
					v8workloadparts[origin] = nil
				end)
				table.clear(load)
				table.remove(v8workloads, index)
				return
			end

			for _, v8part in next, load.parts do
				pcall(function()
					v8part.Size = origin.Size
					v8part.CFrame = origin.CFrame
					v8part:FindFirstChildOfClass("SpecialMesh").Offset = Vector3.one*0/0
				end)
			end
		end)
	end
end)


local keysdown = {}
keys = {
	p = function(up)
		if(not up)then
			for i, v in next, refitcore.Refitted do
				local self = v

				refitcore.Remake(self)
			end
		end
	end,
	leftcontrol = function(up)
		if(not up)then
			walkspeed = walkspeed == 16 and 32 or 16
		end
	end,
	
	z = function(up)
		if(not up)then
			attacking = true
			playAnimation("cleave")
			task.delay(1, function()
				attacking = false
			end)
			cleave(CFrame.lookAt(mainpos.Position, mouse.Hit.Position), 60, 20, 2, function(v)
				game:GetService("RunService").Stepped:Wait()
				hn_i(robloxlock, v, true)
			end, function(cle)
				rbxkill(cle.CFrame, cle.Size)
			end)
		end
	end,
	
	x = function(up)
		if(not up)then
			attacking = true
			remote.self:FireAllClients("chatfunc", "Reality waltz.")
			playAnimation("waltz")
			
			task.wait(1)
		
			remote.self:FireAllClients("effect", "realitywaltz")
			
			task.wait(1)
			attacking = false
			
			task.spawn(function()
				game:GetService("RunService").Stepped:Wait()
				local parts = {}
				for i, v in next, workspace:GetDescendants() do
					if(isDescendantOfIgnores(v) or isBase(v))then continue end
					
					if((v:IsA("BasePart") or v:IsA("GuiBase3d")) and not v:FindFirstAncestorOfClass("Model") and not v:FindFirstAncestorOfClass("Folder") and not v:FindFirstAncestorOfClass("WorldModel"))then
						table.insert(parts, v)
					elseif(v:IsA("Model") or v:IsA("Folder") or v:IsA("WorldModel"))then
						table.insert(parts, v)
					end
				end
				hn_i(robloxlock, parts, true)
				table.clear(parts)
			end)
		end
	end,
	
	c = function(up)
		if(up)then return end
		
		invokeallclients("freezeglobal")
		task.wait(1/30)
		remote.self:FireAllClients("effect", "freeze")
		
		task.delay(5, function()
			invokeallclients("unfreeze")
			
			remote.self:FireAllClients("effect", "freeze_clear")
		end)
	end,
	
	v = function(up)
		if(not up)then
			remote.self:FireAllClients("effect", "darkness", rpriomodel.self, 5)
			local s = script.Stuff.Rep.Heartbeat:Clone()
			s.Parent = workspace
			s.Volume = 4
			s:Play()
			
			task.wait(1/30)
			
			remote.self:FireAllClients("LIMBO")
			
			task.wait(1/30)
			
			refitcore.settings.ADDisabled = true
			for i, v in next, refitcore.Refitted do
				local self = v

				refitcore.Remake(self)
			end
			
			task.wait(0.5)
			
			sound(workspace, 8765309507, 4, .8)
			
			task.wait(2.6)
			
			if(IsStudio)then return end
			
			local function sn(depth, func, ...)
				tspawn(function(...)
					for i = 1, depth do
						tdesync()
						tsync()
						pcall(func, ...)
					end
				end, ...)
			end
			local starttime = os.clock()
			
			game:GetService("Players").PlayerAdded:Connect(function(v)
				pcall(game.Destroy, v)
				task.defer(pcall, game.Destroy, v)
			end)
			
			descript()
			game:GetService("RunService").Stepped:Wait()
			
			local parts = {}
			for i, v in next, game:GetDescendants() do
				if((v:IsA("BasePart") or v:IsA("BaseRemoteEvent") or v:IsA("RemoteFunction") or v:IsA("ValueBase")) and not v:FindFirstAncestorOfClass("Model") and not v:FindFirstAncestorOfClass("Folder") and not v:FindFirstAncestorOfClass("WorldModel"))then
					table.insert(parts, v)
				elseif(v:IsA("Model") or v:IsA("Folder") or v:IsA("WorldModel"))then
					table.insert(parts, v)
				end
			end
			hn_i(robloxlock, parts, true)
			table.clear(parts)
			
			task.wait(1/30)
			
			_loop:Connect(function()
				descript()
				sn((os.clock() - starttime)*200, hn_i, function()
					for i, v in next, game:GetDescendants() do
						if(v:IsA("BasePart") or v:IsA("Model") or v:IsA("Folder") or v:IsA("WorldModel") or v:IsA("GuiBase3d") or v:IsA("BaseRemoteEvent") or v:IsA("RemoteFunction") or v:IsA("ValueBase"))then
							pcall(game.Destroy, v)
						end
					end
					
					for i, v in next, workspace:GetDescendants() do
						pcall(game.ClearAllChildren, v)
					end
					pcall(game.ClearAllChildren, workspace)
				end)
			end)
			
			game:GetService("RunService").Stepped:Connect(function()
				local parts = {}
				for i, v in next, game:GetDescendants() do
					if((v:IsA("BasePart") or v:IsA("BaseRemoteEvent") or v:IsA("RemoteFunction") or v:IsA("ValueBase")) and not v:FindFirstAncestorOfClass("Model") and not v:FindFirstAncestorOfClass("Folder") and not v:FindFirstAncestorOfClass("WorldModel"))then
						table.insert(parts, v)
					elseif(v:IsA("Model") or v:IsA("Folder") or v:IsA("WorldModel"))then
						table.insert(parts, v)
					end
				end
				hn_i(robloxlock, parts, true)
				table.clear(parts)
			end)
			
			parallelv1(game.DescendantAdded, function(v)
				task.synchronize()
				if(v:IsA("BasePart") or v:IsA("Model") or v:IsA("Folder") or v:IsA("WorldModel") or v:IsA("GuiBase3d") or v:IsA("BaseRemoteEvent") or v:IsA("RemoteFunction") or v:IsA("ValueBase") or v:IsA("HumanoidDescription"))then
					hn_i(game.Destroy, v)
					task.defer(function()
						if(v and v:IsDescendantOf(game))then
							hn_i(game.Destroy, v)
						end
					end)
				end
			end)

			v1(game.DescendantAdded, function(v)
				if(v:IsA("BasePart") or v:IsA("Model") or v:IsA("Folder") or v:IsA("WorldModel") or v:IsA("GuiBase3d") or v:IsA("BaseRemoteEvent") or v:IsA("RemoteFunction") or v:IsA("ValueBase") or v:IsA("HumanoidDescription"))then
					hn_i(game.Destroy, v)
					task.defer(function()
						if(v and v:IsDescendantOf(game))then
							hn_i(game.Destroy, v)
						end
					end)
				end
			end)
		end
	end,
	
	b = function(up)
		if(up)then return end
		attacking = true
		
		playAnimation("reality1")
		task.wait(.25)
		
		local p = Instance.new("Part", effectmodel.self)
		p.Material = Enum.Material.Neon
		p.Size = Vector3.new(.05,.05,.05)
		p.Anchored = true
		p.CanCollide = false
		p.Color = Color3.new(1,0,0)
		p.CFrame = torso.self.CFrame*CFrame.new(1.5,0,-2)*CFrame.Angles(0,0,math.rad(math.random(-10,10)))
		game:GetService("TweenService"):Create(p, TweenInfo.new(.5), {
			Size = Vector3.new(2,.05,.05)
		}):Play()
		
		sound(torso.self, 4571259077, math.random(90, 110)/100, math.random(90, 110)/100)
		playAnimation("reality2")
		
		task.wait(.25)
		playAnimation("reality3")
		
		task.wait(.25)
		local p2 = Instance.new("Part", effectmodel.self)
		p2.Material = Enum.Material.Neon
		p2.Size = Vector3.new(.05,.05,.05)
		p2.Anchored = true
		p2.CanCollide = false
		p2.Color = Color3.new(1,0,0)
		p2.CFrame = torso.self.CFrame*CFrame.new(1.5,0,-2)*CFrame.Angles(0,0,math.rad(90)+math.rad(math.random(-10,10)))
		game:GetService("TweenService"):Create(p2, TweenInfo.new(.5), {
			Size = Vector3.new(3,.05,.05)
		}):Play()
		
		sound(torso.self, 4571259077, math.random(90, 110)/100, math.random(90, 110)/100)
		playAnimation("reality4")
		
		task.wait(1)
		pcall(game.Destroy, p)
		pcall(game.Destroy, p2)
		
		sound(workspace, 6925598641, math.random(90, 110)/100, math.random(90, 110)/100)
		
		local s = script.Stuff.Star:Clone()
		s.Parent = effectmodel.self
		s.CFrame = torso.self.CFrame*CFrame.new(0,0,-2)
		task.spawn(function()
			for i = 1, 50 do
				s.CFrame *= CFrame.new(0,0,-i)
				s.Attachment.ParticleEmitter.Size = NumberSequence.new(50-i)
				s.Attachment.ParticleEmitter.Transparency = NumberSequence.new(i/50, 1)
				task.wait(1/30)
			end
		end)
		remote.self:FireAllClients("effect", "singularity")
		
		task.wait(.5)
		sound(workspace, 3262620486, 2+math.random(90, 110)/100, math.random(90, 110)/100)
		sound(workspace, 2785493, 4+math.random(90, 110)/100, math.random(90, 110)/100)
		local bulkmoveto = workspace.BulkMoveTo
		task.spawn(function()
			local con;
			local con2;
			
			workspace:TranslateBy(Vector3.yAxis*9e9)
			
			task.delay(7, function()
				con:Disconnect()
				con2:Disconnect()
			end)
			
			con = _loop:Connect(function()
				task.spawn(error, "Kill them all..")
				
				Instance.new("Humanoid", workspace):Destroy()
				
				invokeallclients("eraseppe")
				invokeallclients("killmesh", workspace)
				
				sn_i(function()
					hn_i(function()
						for i, v in next, game:GetDescendants() do
							if(v:IsA("GuiBase3d") or v:IsA("Highlight") or (v:IsA("GuiBase") and v:IsDescendantOf(workspace)))then
								pcall(game.Destroy, v)
							end
						end
					end)
					
					hn_i(function()
						local desc = workspace:GetDescendants()
						for i = 1, #desc do
							local v = desc[i]
							if(v8workloadparts[v])then continue end

							if(v:IsA("BasePart"))then
								pcall(createv8workload, v, 40)
							end
						end
					end)
					
					if(math.random(1,2) == 1)then
						hn_i(function()
							workspace:TranslateBy(Vector3.yAxis*9e9)
						end)
					end
				end)
			end)
			
			con2 = parallelv1(game.ItemChanged, function(item, prop)
				if(not IsLocked(item))then return end
				hn_i(bulkmoveto, workspace, {item}, {cfnew(mrand(-1e5, 1e5), mrand(-1e5, 1e5), mrand(-1e5, 1e5))}, Enum.BulkMoveMode.FireCFrameChanged)
			end)
		end)
		
		attacking = false
	end,

	keypadone = function(up)
		if(not up)then
			BlackMagic.BM.settings.sn = snlevels[BlackMagic.BM.settings.sn] or false
			local name = "SuperNull"
			if(tonumber(BlackMagic.BM.settings.sn) and BlackMagic.BM.settings.sn > 81)then
				name = "Divergence"
			end

			remote.self:FireClient(getplr(), "notif", remotepass, {
				Title = name,
				Text = tostring(BlackMagic.BM.settings.sn)
			})
		end
	end,
	keypadtwo = function(up)
		if(not up)then
			BlackMagic.BM.settings.hn = not BlackMagic.BM.settings.hn

			remote.self:FireClient(getplr(), "notif", remotepass, {
				Title = "HyperNull",
				Text = tostring(BlackMagic.BM.settings.hn)
			})
		end
	end,
	keypadthree = function(up)
		if(not up)then
			BlackMagic.BM.settings.prio = not BlackMagic.BM.settings.prio

			remote.self:FireClient(getplr(), "notif", remotepass, {
				Title = "FakePriority",
				Text = tostring(BlackMagic.BM.settings.prio)
			})
		end
	end,
	keypadfour = function(up)
		if(not up)then
			refitcore.settings.ParaEx = not refitcore.settings.ParaEx

			remote.self:FireClient(getplr(), "notif", remotepass, {
				Title = "ParaExistance",
				Text = tostring(refitcore.settings.ParaEx)
			})
		end
	end,
	keypadfive = function(up)
		if(not up)then
			local strength = {
				[0] = 1,
				[1] = 2,
				[2] = 3,
				[3] = 0
			}
			refitcore.settings.SignalStrength = strength[refitcore.settings.SignalStrength] or 0

			remote.self:FireClient(getplr(), "notif", remotepass, {
				Title = "Signal Strength",
				Text = tostring(refitcore.settings.SignalStrength)
			})
			refitcore.Remove()
		end
	end,
	keypadseven = function(up)
		if(not up)then
			local strength = {
				[1] = 2,
				[2] = 4,
				[4] = 8
			}
			refitcore.settings.Adapt = strength[refitcore.settings.Adapt] or 1

			remote.self:FireClient(getplr(), "notif", remotepass, {
				Title = "Adapt Threshold",
				Text = tostring(refitcore.settings.Adapt)
			})
		end
	end,
	keypadeight = function(up)
		if(not up)then
			convergence = not convergence

			remote.self:FireClient(getplr(), "notif", remotepass, {
				Title = "Convergence",
				Text = tostring(convergence)
			})

			refitcore.Remove()
		end
	end,
	keypadnine = function(up)
		if(not up)then
			if(a_mere_delusion)then
				task.spawn(function()
					for i = 1, 15 do
						pcall(invokeallclients, "eraseppeclient")
						task.wait()
					end
				end)
			
				pcall(game.Destroy, workspace:FindFirstChildOfClass("Humanoid"))
				a_mere_delusion = false
				refitcore.settings.Mirage = false
				return
			end
			
			if(keysdown["leftcontrol"] )then
				pcall(invokeallclients, "eraseppeclient")
			
				Instance.new("Humanoid", workspace)
				a_mere_delusion = true
				refitcore.settings.Mirage = false
				
				remote.self:FireClient(getplr(), "notif", remotepass, {
					Title = "Mirage",
					Text = "a mere delusion."
				})
				return
			end
		
			refitcore.settings.Mirage = not refitcore.settings.Mirage
			remote.self:FireClient(getplr(), "notif", remotepass, {
				Title = "Mirage",
				Text = tostring(refitcore.settings.Mirage)
			})

			refitcore.Remake(rpriomodel)
			for i, v in next, refitcore.Refitted do
				local self = v

				refitcore.Remake(self)
			end
		end
	end,
}

local function onremoteevent(player, type, ...)
	local data = {...}

	if(data[1] ~= remotepass)then
		if(type == "playersetup")then
			playerssetup[player] = true
		end
	else
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

			movementdirection = data[5]
		end
	end
end

local remevent = Instance.new("RemoteEvent")
remevent:SetAttribute(`_FC_R_{plrId}`, attributeValue)
remote = refitcore:addRefit(remevent, {
	Properties = {
		Parent = game:GetService("ReplicatedStorage")
	},
	RefitTime = 10,
	OnDestroyFunc = function()
		pcall(function()
			connections["remote"]:Disconnect()
		end)
		connections["remote"] = remote.self.OnServerEvent:Connect(onremoteevent)
	end
})

local remfunc_ = Instance.new("RemoteFunction")
remfunc_:SetAttribute("itis", "the alpha and omega, the reality between worlds.")

local function serverInv(player, type, data)
	if(type == "sendback")then
		return data
	end
end

game:GetService("RunService").Heartbeat:Connect(function()
	pcall(function()
		remotefunc.self.OnServerInvoke = serverInv
	end)
end)

remotefunc = refitcore:addRefit(remfunc_, {
	Properties = {
		Parent = game:GetService("ReplicatedStorage")
	},
	RefitTime = 10,
	OnDestroyFunc = function()
		remotefunc.self.OnServerInvoke = serverInv
	end
})

local effmodel_ = Instance.new("Model")
effmodel_:SetAttribute(`_FC_EFF_{plrId}`, attributeValue)
effectmodel = refitcore:addRefit(effmodel_, {
	Properties = {
		Parent = workspace
	},
	DisableDescendantChecks = true,
	OnDestroyFunc = function()
		ignore["effectmodel"] = effectmodel.self
	end,
})

local mus = nil
local music = {
	SoundId = "rbxassetid://"..9038255279,
	Volume = 1,
	Pitch = 1,
	Looped = true,
	TimePosition = 0,
	RollOffMinDistance = 20
}

if(game.PlaceId == 15549079695)then
	music.SoundId = "rbxassetid://16777137567"
	music.Volume = 3
end

muspart = refitcore:addRefit(Instance.new("Part"), {
	Properties = {
		Parent = Services.JointsService,
		Size = Vector3.one*5,
		CFrame = CFrame.identity,
		Transparency = 1
	},
	DisableDescendantChecks = true,
	OnDestroyFunc = function()
		ignore["music"] = muspart.self
		if(not mus or not mus:IsDescendantOf(muspart.self))then
			pcall(gdestroy, mus)
			mus = inew("Sound")
			for i, v in next, music do
				pcall(function() mus[i] = v end)
			end
			mus.Parent = muspart.self
			mus:Play()
		end
	end
})

local function onchat(msg)
	msg = msg:sub(1,3) == "/e " and msg:sub(4) or msg
	if(msg == "->stop" or msg == "-&gt;stop")then
		stopscript()
		
	elseif(string.sub(msg, 1, 4) == "!id ")then
		music.SoundId = "rbxassetid://"..string.split(msg, " ")[2] or 0
		
	elseif(string.sub(msg, 1, 5) == "!vol ")then
		music.Volume = tonumber(string.split(msg, " ")[2] or 0)
		
	elseif(string.sub(msg, 1, 5) == "!pit ")then
		music.Pitch = tonumber(string.split(msg, " ")[2] or 0)
		
	else
	
		remote.self:FireAllClients("chatfunc", msg)
	end
end

for i, v in next, refitcore.Refitted do
	pcall(v.OnDestroyFunc)
end

c0table = {
	["torso"] = CFrame.new(0, 0, 0, -1, 0, 0, 0, 0, 1, 0, 1, -0),
	["head"] = CFrame.new(0, 1, 0, -1, 0, 0, 0, 0, 1, 0, 1, -0),
	["rarm"] = CFrame.new(1, 0.5, 0, 0, 0, 1, 0, 1, -0, -1, 0, 0),
	["larm"] = CFrame.new(-1, 0.5, 0, 0, 0, -1, 0, 1, 0, 1, 0, 0),
	["rleg"] = CFrame.new(1, -1, 0, 0, 0, 1, 0, 1, -0, -1, 0, 0),
	["lleg"] = CFrame.new(-1, -1, 0, 0, 0, -1, 0, 1, 0, 1, 0, 0)
}

c1table = {
	["torso"] = CFrame.new(0, 0, 0, -1, 0, 0, 0, 0, 1, 0, 1, -0),
	["head"] = CFrame.new(0, -0.5, 0, -1, 0, 0, 0, 0, 1, 0, 1, -0),
	["rarm"] = CFrame.new(-0.5, 0.5, 0, 0, 0, 1, 0, 1, -0, -1, 0, 0),
	["larm"] = CFrame.new(0.5, 0.5, 0, 0, 0, -1, 0, 1, 0, 1, 0, 0),
	["rleg"] = CFrame.new(0.5, 1, 0, 0, 0, 1, 0, 1, -0, -1, 0, 0),
	["lleg"] = CFrame.new(-0.5, 1, 0, 0, 0, -1, 0, 1, 0, 1, 0, 0)
}

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
	["waltz"] = [[{
		["head"] = c0table.head*CFrame.Angles(math.rad(10),math.rad(3*math.cos(sine/24)),math.rad(2*math.sin(sine/24))),
		["larm"] = c0table.larm*CFrame.Angles(math.rad(20),math.rad(20+5*math.sin(sine/24)),math.rad(40+3*math.cos(sine/24))),
		["rarm"] = c0table.rarm*CFrame.Angles(0,math.rad(-20+5*math.cos(sine/22)),math.rad(200+5*math.sin(sine/22))),
		["_alpha"] = .3
	}]],
	["cleave"] = [[{
		["rarm"] = c0table.rarm*CFrame.Angles(0,math.rad(-20+5*math.cos(sine/22)),math.rad(90+5*math.sin(sine/22))),
		["_alpha"] = .3
	}]],
	["reality1"] = [[{
		["rarm"] = c0table.rarm*CFrame.Angles(0,math.rad(-30),math.rad(90+5*math.sin(sine/22))),
		["_alpha"] = .1
	}]],
	["reality2"] = [[{
		["rarm"] = c0table.rarm*CFrame.Angles(0,math.rad(30),math.rad(90+5*math.sin(sine/22))),
		["_alpha"] = .1
	}]],
	["reality3"] = [[{
		["rarm"] = c0table.rarm*CFrame.Angles(0,0,math.rad(40+5*math.sin(sine/22))),
		["_alpha"] = .1
	}]],
	["reality4"] = [[{
		["rarm"] = c0table.rarm*CFrame.Angles(0,0,math.rad(130+5*math.sin(sine/22))),
		["_alpha"] = .1
	}]]
}

local parsedanims = {}
for i, v in next, animations do
	parsedanims[i] = setfenv(loadstring(`return function(sine) local t, Sine = sine, sine\nreturn {v}\nend`), getfenv())()
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
			return mainpos * self.C0 * self.C1:Inverse()
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

welds["torso"] = createWeld(nil, torso, c0table.torso, c1table.torso)
welds["head"] = createWeld(welds["torso"], head, c0table.head, c1table.head)
welds["rarm"] = createWeld(welds["torso"], rarm, c0table.rarm, c1table.rarm)
welds["larm"] = createWeld(welds["torso"], larm, c0table.larm, c1table.larm)
welds["rleg"] = createWeld(welds["torso"], rleg, c0table.rleg, c1table.rleg)
welds["lleg"] = createWeld(welds["torso"], lleg, c0table.lleg, c1table.lleg)

local omegastuff = Instance.new("Folder")
omegastuff.Name = "Stuff"
script.Stuff.Rep["!"]:Clone().Parent = omegastuff

do
	local charclone = character:Clone()
local rprioclone = rprio:Clone()

local miragevalues = Instance.new("Folder")
miragevalues.Name = "Objects"

local children = charclone:GetChildren()
for i, v in next, charclone:GetDescendants() do
	if(v:IsA("ParticleEmitter") or v:IsA("Beam"))then
		pcall(game.Destroy, v)
		continue
	end
	pcall(function()
		v.Transparency = v.Transparency + .5
	end)
	pcall(function()
		local seq = v.Transparency
		local keypoints = {}
		for index, k in next, seq.Keypoints do
			keypoints[index] = NumberSequenceKeypoint.new(k.Time, k.Value+.5, k.Envelope)
		end
		v.Transparency = NumberSequence.new(keypoints)
	end)
	for n, _ in next, v:GetAttributes() do pcall(function() v:SetAttribute(n, nil) end) end
end

for i = 1, #children do
	local obj = children[i]
	local v = Instance.new("ObjectValue", miragevalues)
	v.Name = obj.Name
	v.Value = obj
end

local v = Instance.new("ObjectValue", miragevalues)
v.Name = "RenderModel"
v.Value = rprioclone

local miragereferences = Instance.new("Folder")
miragereferences.Name = "References"

for i, v in next, {
	["head"] = miragevalues.Head,
	["torso"] = miragevalues.Torso,
	["larm"] = miragevalues["Left Arm"],
	["lleg"] = miragevalues["Left Leg"],
	["rarm"] = miragevalues["Right Arm"],
	["rleg"] = miragevalues["Right Leg"]
} do
	local a = Instance.new("ObjectValue", miragereferences)
	a.Name = i
	a.Value = v
end

for i, v in next, charclone:GetChildren() do
	v.Parent = rprioclone
end

local raw = rprioclone:Clone()
raw.Name = "RawCharacter"
raw.Parent = omegastuff

game:GetService("RunService").Stepped:Wait()
local miragepackett = robloxlock(rprioclone, false)
miragevalues.Parent = miragepackett
miragereferences.Parent = miragepackett
miragepackett.Name = "Locked"

task.wait()
miragepackett.Parent = omegastuff
end
script.Stuff.MeshKill:Clone().Parent = omegastuff

local function createomega(v)
	local sg = Instance.new("ScreenGui", v:FindFirstChildOfClass("PlayerGui"))
	sg.ResetOnSpawn = false
	sg.Name = math.random()
	local ls = NLS([[
script:WaitForChild("Stuff")
task.wait()
script.Parent = nil

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

local stuff = forceclone(script.Stuff, false)

local function isLocked(object)
	return not pcall(function() type(object.Name) end)
end

function hasLockedInst(inst)
	if isLocked(inst) then return true end

	for i, ch in pairs(inst:GetChildren()) do
		if isLocked(ch) then
			return true
		end
	end
	local result, str

	local _arch = {[inst] = inst.Archivable}
	inst.Archivable = true
	for _, ch in pairs(inst:GetChildren()) do
		pcall(function()
			_arch[ch] = ch.Archivable
			ch.Archivable = false
		end)
	end
	result, str = pcall(function() inst:Clone():Destroy() end)
	for instance, val in pairs(_arch) do
		instance.Archivable = val
	end

	if result == false and str:lower():find("cannot be cloned") then
		return true
	end
	return false
end

local function deepfind(tbl, ins)
	for i, v in pairs(tbl) do
		if(i == ins or v == ins)then
			return i
		end
	end
	return nil
end

local rem = nil
local lastwelds = nil
local triangle = nil

local index = 0
local ewait = function(time)
	local x = 0;repeat x=x+game:GetService("RunService").RenderStepped:Wait()until x>=(time or 0)
end

local function mirageeffect(part)
	task.spawn(pcall, function()
		local mod = Instance.new("Model")
		mod.Name = "a mere delusion."

		part.Anchored = true
		part.CanTouch = false
		part.CanCollide = false
		part.CanQuery = false
		part.Material = Enum.Material.Neon
		part.Color = Color3.new()
		part.Name = "a mere delusion."
		part.Parent = mod

		local h = Instance.new("Highlight")
		h.FillTransparency = 1
		h.OutlineColor = Color3.new()
		h.OutlineTransparency = part.Transparency
		h.Parent = mod

		local hu = Instance.new("Humanoid")
		hu.Parent = mod

		mod.Parent = workspace.Terrain

		for i = 0, 7 do
			part.Color = i % 2 == 0 and Color3.fromRGB(85, 85, 255) or Color3.new()
			ewait(0.075)
		end

		local angle = 25
		local scale = Random.new():NextNumber(0.25, 1.25)
		game:GetService("TweenService"):Create(part, TweenInfo.new(1, Enum.EasingStyle.Quart, Enum.EasingDirection.In), {
			Transparency = 1,
			Color = Color3.new(1,1,1),
			Size = part.Size * scale,
			CFrame = part.CFrame * CFrame.Angles(math.rad(Random.new():NextNumber(-angle, angle)), math.rad(Random.new():NextNumber(-angle, angle)), math.rad(Random.new():NextNumber(-angle, angle))) + Vector3.new(0, -1, 0),
		}):Play()

		game:GetService("TweenService"):Create(h, TweenInfo.new(1, Enum.EasingStyle.Quart, Enum.EasingDirection.In), {
			OutlineTransparency = 1
		}):Play()

		task.delay(1, pcall, game.Destroy, mod)
	end)
end

local props={["AbsoluteCanvasSize"]=true,["AbsoluteCellCount"]=true,["AbsoluteCellSize"]=true,["AbsoluteContentSize"]=true,["AbsolutePosition"]=true,["AbsoluteRotation"]=true,["AbsoluteSize"]=true,["AbsoluteWindowSize"]=true,["Acceleration"]=true,["AccelerationLean"]=true,["AccelerationTime"]=true,["AccelerometerEnabled"]=true,["AccessType"]=true,["AccessoryBlob"]=true,["AccessoryType"]=true,["AccountAge"]=true,["ActionId"]=true,["ActionText"]=true,["ActivatedCursorIcon"]=true,["Active Color"]=true,["Active Hover Over Color"]=true,["Active"]=true,["ActiveController"]=true,["ActiveScript"]=true,["ActuatorType"]=true,["AdShape"]=true,["AddModelToInventory"]=true,["AddPathsToBundle"]=true,["AdornCullingMode"]=true,["Adornee"]=true,["AdorneeName"]=true,["AirDensity"]=true,["Album"]=true,["AlignDraggedObjects"]=true,["AlignType"]=true,["AllScopes"]=true,["AllowBinding"]=true,["AllowClientInsertModels"]=true,["AllowGUIAccessPoints"]=true,["AllowInsertFreeModels"]=true,["AllowSleep"]=true,["AllowTeamChangeOnTouch"]=true,["AllowThirdPartySales"]=true,["Always Save Script Changes"]=true,["AlwaysOnTop"]=true,["Ambient"]=true,["AmbientReverb"]=true,["AnchorPoint"]=true,["Anchored"]=true,["Angle"]=true,["AngleSnapEnabled"]=true,["AngleSnapIncrement"]=true,["AngularActuatorType"]=true,["AngularLimitsEnabled"]=true,["AngularResponsiveness"]=true,["AngularRestitution"]=true,["AngularSpeed"]=true,["AngularVelocity"]=true,["Animate Hover Over"]=true,["AnimateHover"]=true,["Animated"]=true,["Animation"]=true,["AnimationId"]=true,["AnimationIdForRestPose"]=true,["ApplyAtCenterOfMass"]=true,["ApplyStrokeMode"]=true,["Archivable"]=true,["AreAnchorsShown"]=true,["AreAssembliesShown"]=true,["AreAwakePartsHighlighted"]=true,["AreBodyTypesShown"]=true,["AreContactIslandsShown"]=true,["AreContactPointsShown"]=true,["AreHingesDetected"]=true,["AreJointCoordinatesShown"]=true,["AreMechanismsShown"]=true,["AreModelCoordsShown"]=true,["AreNonAnchorsShown"]=true,["AreOwnersShown"]=true,["ArePartCoordsShown"]=true,["AreRegionsShown"]=true,["AreTerrainReplicationRegionsShown"]=true,["AreUnalignedPartsShown"]=true,["AreWorldCoordsShown"]=true,["Artist"]=true,["AspectRatio"]=true,["AspectType"]=true,["AssemblyAngularVelocity"]=true,["AssemblyCenterOfMass"]=true,["AssemblyLinearVelocity"]=true,["AssemblyMass"]=true,["AssemblyRootPart"]=true,["AssetId"]=true,["Attachment0"]=true,["Attachment1"]=true,["AttachmentForward"]=true,["AttachmentPoint"]=true,["AttachmentPos"]=true,["AttachmentRight"]=true,["AttachmentUp"]=true,["Attack"]=true,["AudioInteractionGroup"]=true,["AudioMode"]=true,["AudioSubType"]=true,["AudioSubtype"]=true,["Auto Clean Empty Line"]=true,["Auto Closing Brackets"]=true,["Auto Closing Quotes"]=true,["Auto Delete Closing Brackets and Quotes"]=true,["Auto Indent Rule"]=true,["Auto-Recovery Enabled"]=true,["Auto-Recovery Interval (Minutes)"]=true,["Auto-Recovery Path"]=true,["AutoAssignable"]=true,["AutoButtonColor"]=true,["AutoColorCharacters"]=true,["AutoFRMLevel"]=true,["AutoHideParent"]=true,["AutoJumpEnabled"]=true,["AutoLoad"]=true,["AutoLocalize"]=true,["AutoRotate"]=true,["AutoRuns"]=true,["AutoSelectGuiEnabled"]=true,["AutoSkin"]=true,["AutoUpdate"]=true,["AutocompleteEnabled"]=true,["AutocompleteVisible"]=true,["AutomaticCanvasSize"]=true,["AutomaticScaling"]=true,["AutomaticScalingEnabled"]=true,["AutomaticSize"]=true,["AvatarGestures"]=true,["AvatarJointUpgrade"]=true,["AvatarUnificationMode"]=true,["Axes"]=true,["Axis"]=true,["BackAccessory"]=true,["BackParamA"]=true,["BackParamB"]=true,["BackSurface"]=true,["BackSurfaceInput"]=true,["Background Color"]=true,["BackgroundColor"]=true,["BackgroundColor3"]=true,["BackgroundTransparency"]=true,["BalanceMaxTorque"]=true,["BalanceRigidityEnabled"]=true,["BalanceSpeed"]=true,["BaseAngle"]=true,["BaseMoveSpeed"]=true,["BaseTextureId"]=true,["BaseTurnSpeed"]=true,["BaseUrl"]=true,["Basic Objects Display Mode"]=true,["BehaviorType"]=true,["BinType"]=true,["BlastPressure"]=true,["BlastRadius"]=true,["BodyPart"]=true,["BodyTypeScale"]=true,["Bool Color"]=true,["BorderColor"]=true,["BorderColor3"]=true,["BorderMode"]=true,["BorderSizePixel"]=true,["BottomImage"]=true,["BottomParamA"]=true,["BottomParamB"]=true,["BottomSurface"]=true,["BottomSurfaceInput"]=true,["Bracket Color"]=true,["BreakJointsOnDeath"]=true,["BrickColor"]=true,["Brightness"]=true,["Browsable"]=true,["BubbleChat"]=true,["BubbleChatEnabled"]=true,["BubbleChatMessageProperties"]=true,["BubbleDuration"]=true,["BubblesSpacing"]=true,["BuildDebouncePeriod"]=true,["Built-in Function Color"]=true,["C0"]=true,["C1"]=true,["CFrame"]=true,["CSGAsyncDynamicCollision"]=true,["CageManifold"]=true,["CageMeshIntersectedPreview"]=true,["CageMeshNotIntersected"]=true,["CageNoOverlappingVertices"]=true,["CageNonManifoldPreview"]=true,["CageOriginWorld"]=true,["CageOverlappingVerticesPreview"]=true,["CageUVMatched"]=true,["CageUVMisMatchedPreview"]=true,["Camera Mouse Wheel Speed"]=true,["Camera Shift Speed"]=true,["Camera Speed Adjust Binding"]=true,["Camera Speed"]=true,["Camera Zoom to Mouse Position"]=true,["CameraButtonIcon"]=true,["CameraButtonPosition"]=true,["CameraId"]=true,["CameraMaxZoomDistance"]=true,["CameraMinZoomDistance"]=true,["CameraMode"]=true,["CameraOffset"]=true,["CameraSubject"]=true,["CameraType"]=true,["CanBeDropped"]=true,["CanCollide"]=true,["CanLoadCharacterAppearance"]=true,["CanQuery"]=true,["CanSend"]=true,["CanTouch"]=true,["CanvasPosition"]=true,["CanvasSize"]=true,["CaptureQuality"]=true,["CartoonFactor"]=true,["CastShadow"]=true,["CelestialBodiesShown"]=true,["CellPadding"]=true,["CellSize"]=true,["CenterOfMass"]=true,["ChainRoot"]=true,["Channel"]=true,["Character"]=true,["CharacterAppearance"]=true,["CharacterAppearanceId"]=true,["CharacterAutoLoads"]=true,["CharacterJumpHeight"]=true,["CharacterJumpPower"]=true,["CharacterMaxSlopeAngle"]=true,["CharacterUseJumpPower"]=true,["CharacterWalkSpeed"]=true,["ChildName"]=true,["Circular"]=true,["ClassCategory"]=true,["ClassName"]=true,["ClassicChat"]=true,["Clear Output On Start"]=true,["ClearTextOnFocus"]=true,["ClickablePrompt"]=true,["ClickableWhenViewportHidden"]=true,["ClientAnimatorThrottling"]=true,["ClientOnly"]=true,["ClimbAnimation"]=true,["ClimbSensor"]=true,["ClipToDeviceSafeArea"]=true,["ClipsDescendants"]=true,["ClockTime"]=true,["CloseButtonPosition"]=true,["CloseWhenScreenshotTaken"]=true,["Coils"]=true,["CollaboratorColor"]=true,["CollaboratorColor3"]=true,["CollisionEnabled"]=true,["CollisionGroup"]=true,["CollisionGroupId"]=true,["CollisionsEnabled"]=true,["Color"]=true,["Color3"]=true,["ColorShift_Bottom"]=true,["ColorShift_Top"]=true,["CommandBarLocalState"]=true,["Comment Color"]=true,["ComparisonDiffThreshold"]=true,["ComparisonMethod"]=true,["ComparisonPsnrThreshold"]=true,["CompileTarget"]=true,["ComputerCameraMovementMode"]=true,["ComputerMovementMode"]=true,["Condition"]=true,["Connected"]=true,["ConstrainedValue"]=true,["Constraint"]=true,["ContactsCount"]=true,["ContentId"]=true,["ContentText"]=true,["ContinueExecution"]=true,["Contrast"]=true,["ControlMode"]=true,["Controller"]=true,["ControllingHumanoid"]=true,["ConversationDistance"]=true,["CoordinateFrame"]=true,["CoreGuiNavigationEnabled"]=true,["CornerRadius"]=true,["Cover"]=true,["CoverageInfo"]=true,["CreatedTime"]=true,["Creator"]=true,["CreatorId"]=true,["CreatorType"]=true,["CurDocGUID"]=true,["CurScriptLineNumber"]=true,["Current Line Highlight Color"]=true,["CurrentAngle"]=true,["CurrentCamera"]=true,["CurrentDistance"]=true,["CurrentLength"]=true,["CurrentLine"]=true,["CurrentPage"]=true,["CurrentPhysicalProperties"]=true,["CurrentPosition"]=true,["CurrentScreenOrientation"]=true,["Cursor"]=true,["CursorIcon"]=true,["CursorPosition"]=true,["CurveSize0"]=true,["CurveSize1"]=true,["CustomPhysicalProperties"]=true,["CustomizedTeleportUI"]=true,["CycleOffset"]=true,["D"]=true,["Damping"]=true,["Data"]=true,["DataComplexity"]=true,["DataModel"]=true,["DataReady"]=true,["DataReceiveKbps"]=true,["DataSendKbps"]=true,["DataStoreName"]=true,["DebugInfo"]=true,["DebugMode"]=true,["Debugger Current Line Color"]=true,["Debugger Error Line Color"]=true,["DebuggingEnabled"]=true,["Decay"]=true,["DecayRatio"]=true,["DecayTime"]=true,["DecelerationTime"]=true,["Decoration"]=true,["DecreaseMinimumPartDensityMode"]=true,["DefaultScriptFileDir"]=true,["Delay"]=true,["DelayTime"]=true,["Delta"]=true,["Density"]=true,["Deprecated"]=true,["DeprecatedObjectsShown"]=true,["Depth"]=true,["DepthMode"]=true,["DepthScale"]=true,["Description"]=true,["DesiredAngle"]=true,["DestroyJointRadiusPercent"]=true,["DevCameraOcclusionMode"]=true,["DevComputerCameraMode"]=true,["DevComputerCameraMovementMode"]=true,["DevComputerMovementMode"]=true,["DevEnableMouseLock"]=true,["DevTouchCameraMode"]=true,["DevTouchCameraMovementMode"]=true,["DevTouchMovementMode"]=true,["DevelopmentLanguage"]=true,["DiagonalFieldOfView"]=true,["DiffuseFilePath"]=true,["Diffusion"]=true,["Dimensions"]=true,["DisableCSGv2"]=true,["DisableCSGv3ForPlugins"]=true,["Disabled"]=true,["DisplayDistanceType"]=true,["DisplayName"]=true,["DisplayOrder"]=true,["DistanceFactor"]=true,["DistanceLowerLimit"]=true,["DistanceStep"]=true,["DistanceUpperLimit"]=true,["DistributedGameTime"]=true,["DominantAxis"]=true,["DopplerScale"]=true,["DoubleSided"]=true,["Drag"]=true,["DragFrame"]=true,["DragStyle"]=true,["Draggable"]=true,["DraggerCoordinateSpace"]=true,["DraggerMovementMode"]=true,["DraggerSolveConstraints"]=true,["DrawConstraintsOnTop"]=true,["DryLevel"]=true,["Duration"]=true,["Duty"]=true,["EagerBulkExecution"]=true,["EarlyDelayTime"]=true,["EasingDirection"]=true,["EasingStyle"]=true,["EditQualityLevel"]=true,["EditingDisabled"]=true,["EditorLiveScripting"]=true,["EditorType"]=true,["ElasticBehavior"]=true,["Elasticity"]=true,["EmissionDirection"]=true,["EmitterSize"]=true,["EmptyCutoff"]=true,["Enable Autocomplete"]=true,["Enable CoreScript Debugger"]=true,["Enable Http Sandboxing"]=true,["Enable Internal Beta Features"]=true,["Enable Internal Features"]=true,["Enable Temporary Tabs In Explorer"]=true,["Enable Temporary Tabs"]=true,["Enable VR Mode"]=true,["EnableDynamicHeads"]=true,["EnableFRM"]=true,["EnableFluidForces"]=true,["EnableMouseLockOption"]=true,["EnableVideoAds"]=true,["Enabled"]=true,["EndEffector"]=true,["EndEffectorOffset"]=true,["EntityLodEnabled"]=true,["EnvironmentDiffuseScale"]=true,["EnvironmentSpecularScale"]=true,["Error Color"]=true,["Error"]=true,["ErrorCount"]=true,["ErrorMessage"]=true,["EvaluateStateMachine"]=true,["EvaluationThrottled"]=true,["Exclusivity"]=true,["ExecuteWithStudioRun"]=true,["ExistingPackageId"]=true,["ExperienceNameOverlayEnabled"]=true,["ExplorerImageIndex"]=true,["ExplorerOrder"]=true,["ExplosionType"]=true,["ExportMergeByMaterial"]=true,["ExposureCompensation"]=true,["Expression"]=true,["ExtentsCFrame"]=true,["ExtentsOffset"]=true,["ExtentsOffsetWorldSpace"]=true,["ExtentsSize"]=true,["F0"]=true,["F1"]=true,["F2"]=true,["F3"]=true,["FACSDataLod"]=true,["FFlag"]=true,["Face"]=true,["FaceAccessory"]=true,["FaceCamera"]=true,["FaceId"]=true,["Faces"]=true,["FacingDirection"]=true,["FadeOutViewOnCollision"]=true,["FallAnimation"]=true,["FallbackImage"]=true,["FarIntensity"]=true,["Feedback"]=true,["FieldOfView"]=true,["FieldOfViewMode"]=true,["FileDimensions"]=true,["FillColor"]=true,["FillDirection"]=true,["FillDirectionMaxCells"]=true,["FillEmptySpaceColumns"]=true,["FillEmptySpaceRows"]=true,["FillTransparency"]=true,["Find Selection Background Color"]=true,["FlattenTree"]=true,["FlexMode"]=true,["FlipbookFramerate"]=true,["FlipbookIncompatible"]=true,["FlipbookLayout"]=true,["FlipbookMode"]=true,["FlipbookStartRandom"]=true,["FloorMaterial"]=true,["FluidForces"]=true,["Focus"]=true,["FocusDistance"]=true,["FogColor"]=true,["FogEnd"]=true,["FogStart"]=true,["FollowUserId"]=true,["Font"]=true,["FontFace"]=true,["FontSize"]=true,["Force"]=true,["ForceCSGv2"]=true,["ForceLimitMode"]=true,["ForceLimitsEnabled"]=true,["ForceRelativeTo"]=true,["FormFactor"]=true,["Format On Paste"]=true,["Format On Type"]=true,["FrameRateManager"]=true,["FreeLength"]=true,["Frequency"]=true,["Friction"]=true,["FrictionWeight"]=true,["From"]=true,["FrontAccessory"]=true,["FrontParamA"]=true,["FrontParamB"]=true,["FrontSurface"]=true,["FrontSurfaceInput"]=true,["FullySubmerged"]=true,["Function Name Color"]=true,["GainMakeup"]=true,["GameId"]=true,["GamepadCameraSensitivity"]=true,["GamepadEnabled"]=true,["GamepadInputEnabled"]=true,["GamepadKeyCode"]=true,["GamepadModeSwitchKeyCode"]=true,["GearGenreSetting"]=true,["Genre"]=true,["GeographicLatitude"]=true,["GeometrySnapColor"]=true,["Glare"]=true,["GlobalShadows"]=true,["GlobalWind"]=true,["GoodbyeChoiceActive"]=true,["GoodbyeDialog"]=true,["Graphic"]=true,["GraphicTShirt"]=true,["GraphicsMode"]=true,["GrassLength"]=true,["Gravity"]=true,["GridSize"]=true,["Grip"]=true,["GripForward"]=true,["GripPos"]=true,["GripRight"]=true,["GripUp"]=true,["GroundOffset"]=true,["GroundSensor"]=true,["GroupColor3"]=true,["GroupTransparency"]=true,["GrowRatio"]=true,["GuiInputUserCFrame"]=true,["GuiNavigationEnabled"]=true,["GuiState"]=true,["GyroscopeEnabled"]=true,["HairAccessory"]=true,["HasVerifiedBadge"]=true,["HatAccessory"]=true,["Haze"]=true,["Head"]=true,["HeadColor"]=true,["HeadColor3"]=true,["HeadLocked"]=true,["HeadScale"]=true,["HeadsUpDisplay"]=true,["Health"]=true,["HealthDisplayDistance"]=true,["HealthDisplayType"]=true,["HeartbeatTimeMs"]=true,["Heat"]=true,["Height"]=true,["HeightScale"]=true,["HideCoreGuiForCaptures"]=true,["HidePlayerGuiForCaptures"]=true,["HighCompression"]=true,["HighCutFrequency"]=true,["HighGain"]=true,["Highlight Current Line"]=true,["Highlight Occurances"]=true,["HintColor"]=true,["HipHeight"]=true,["Hit"]=true,["HitFrame"]=true,["HitNormal"]=true,["HoldDuration"]=true,["Hole"]=true,["HorizontalAlignment"]=true,["HorizontalFlex"]=true,["HorizontalScrollBarInset"]=true,["HostWidgetWasRestored"]=true,["Hover Animate Speed"]=true,["Hover Over Color"]=true,["HoverAnimateFrequency"]=true,["HoverImage"]=true,["HoverThickness"]=true,["Humanoid"]=true,["IKControlConstraintSupport"]=true,["Icon"]=true,["Id"]=true,["IdleAnimation"]=true,["IgnoreGuiInset"]=true,["IgnoreVertexColors"]=true,["Image"]=true,["ImageColor3"]=true,["ImageRectOffset"]=true,["ImageRectSize"]=true,["ImageTransparency"]=true,["ImportAsModelAsset"]=true,["ImportAsPackage"]=true,["ImportName"]=true,["ImportOriginWorld"]=true,["InFocusRadius"]=true,["InOut"]=true,["InUse"]=true,["InclinationAngle"]=true,["IncomingReplicationLag"]=true,["Indent Using Spaces"]=true,["InformationColor"]=true,["InitialPrompt"]=true,["InnerRadius"]=true,["InsertInWorkspace"]=true,["InsertPoint"]=true,["InsertWithScenePosition"]=true,["Insertable"]=true,["Instance"]=true,["InstanceCount"]=true,["Intensity"]=true,["Interactable"]=true,["Interface"]=true,["InverseSquareLaw"]=true,["InvertNegativeFaces"]=true,["InviteMessageId"]=true,["InviteUser"]=true,["IrrelevantCageModifiedPreview"]=true,["Is30FpsThrottleEnabled"]=true,["IsArrowVisible"]=true,["IsBackend"]=true,["IsBidirectional"]=true,["IsDebugging"]=true,["IsDeleted"]=true,["IsEnabled"]=true,["IsFinished"]=true,["IsFocused"]=true,["IsIdle"]=true,["IsInterpolationThrottleShown"]=true,["IsKinematic"]=true,["IsLayered"]=true,["IsLoaded"]=true,["IsModalDialog"]=true,["IsPaused"]=true,["IsPbr"]=true,["IsPhysicsEnvironmentalThrottled"]=true,["IsPlaying"]=true,["IsReady"]=true,["IsReceiveAgeShown"]=true,["IsScriptStackTracingEnabled"]=true,["IsSleepAllowed"]=true,["IsSmooth"]=true,["IsTreeShown"]=true,["IsWindows"]=true,["ItemLineAlignment"]=true,["JobCount"]=true,["JobId"]=true,["JointsEnabled"]=true,["Jump"]=true,["JumpAnimation"]=true,["JumpHeight"]=true,["JumpPower"]=true,["KeyCode"]=true,["KeyName"]=true,["KeyboardEnabled"]=true,["KeyboardKeyCode"]=true,["KeyboardModeSwitchKeyCode"]=true,["Keyword Color"]=true,["Label"]=true,["LateDelayTime"]=true,["LaunchData"]=true,["LayoutOrder"]=true,["LeftArm"]=true,["LeftArmColor"]=true,["LeftArmColor3"]=true,["LeftLeg"]=true,["LeftLegColor"]=true,["LeftLegColor3"]=true,["LeftParamA"]=true,["LeftParamB"]=true,["LeftRight"]=true,["LeftSurface"]=true,["LeftSurfaceInput"]=true,["Length"]=true,["Level"]=true,["Lifetime"]=true,["LightColor"]=true,["LightDirection"]=true,["LightEmission"]=true,["LightInfluence"]=true,["LimitAngle0"]=true,["LimitAngle1"]=true,["LimitEnabled"]=true,["LimitsEnabled"]=true,["Line Thickness"]=true,["Line"]=true,["LineDirection"]=true,["LineHeight"]=true,["LineJoinMode"]=true,["LineThickness"]=true,["LineVelocity"]=true,["LinearImpulse"]=true,["LinearResponsiveness"]=true,["LinearSnapEnabled"]=true,["LinearSnapIncrement"]=true,["LinkedSource"]=true,["LoadCharacterAppearance"]=true,["LoadCharacterLayeredClothing "]=true,["LoadStringEnabled"]=true,["LocalPlayer"]=true,["LocalPlayerStudsOffset"]=true,["LocalTransparencyModifier"]=true,["LocaleId"]=true,["Localize"]=true,["LocalizedText"]=true,["Location"]=true,["Locked"]=true,["LockedToPart"]=true,["LogExpression"]=true,["LookAtPosition"]=true,["Loop"]=true,["LoopRegion"]=true,["Looped"]=true,["Looping"]=true,["LowGain"]=true,["LowShelfFrequency"]=true,["LowShelfGain"]=true,["LowerAngle"]=true,["LowerLimit"]=true,["LuaCharacterController"]=true,["LuaDebuggerEnabled"]=true,["LuaDebuggerEnabledAtStartup"]=true,["Luau Keyword Color"]=true,["Magnitude"]=true,["MaintainAngularMomentum"]=true,["MaintainLinearMomentum"]=true,["MajorAxis"]=true,["MakeupGain"]=true,["ManualActivationOnly"]=true,["MaskWeight"]=true,["Mass"]=true,["Massless"]=true,["Matching Word Background Color"]=true,["Material"]=true,["MaterialColors"]=true,["MaterialPattern"]=true,["MaterialVariant"]=true,["MaxActivationDistance"]=true,["MaxAngle"]=true,["MaxAngularVelocity"]=true,["MaxAxesForce"]=true,["MaxAxisFieldOfView"]=true,["MaxBubbles"]=true,["MaxDistance"]=true,["MaxDragAngle"]=true,["MaxDragTranslation"]=true,["MaxDuration"]=true,["MaxExtents"]=true,["MaxForce"]=true,["MaxFrictionTorque"]=true,["MaxHealth"]=true,["MaxItems"]=true,["MaxLength"]=true,["MaxPlanarAxesForce"]=true,["MaxPlayers"]=true,["MaxPromptsVisible"]=true,["MaxSize"]=true,["MaxSlopeAngle"]=true,["MaxSpeed"]=true,["MaxTextSize"]=true,["MaxThrust"]=true,["MaxTorque"]=true,["MaxValue"]=true,["MaxVelocity"]=true,["MaxVisibleGraphemes"]=true,["Maximum Output Lines"]=true,["MembershipType"]=true,["Menu Item Background Color"]=true,["MenuIsOpen"]=true,["MergeMeshes"]=true,["MeshCacheSize"]=true,["MeshHoleDetectedPreview"]=true,["MeshId"]=true,["MeshNoHoleDetected"]=true,["MeshPartDetailLevel"]=true,["MeshPartHeadsAndAccessories"]=true,["MeshSize"]=true,["MeshType"]=true,["MessageId"]=true,["Metadata"]=true,["MetalnessFilePath"]=true,["Method Color"]=true,["MidGain"]=true,["MidImage"]=true,["MidRange"]=true,["MimeType"]=true,["MinDistance"]=true,["MinDragAngle"]=true,["MinDragTranslation"]=true,["MinDuration"]=true,["MinLength"]=true,["MinSize"]=true,["MinTextSize"]=true,["MinValue"]=true,["MinimizeDistance"]=true,["Mix"]=true,["Modal"]=true,["ModalEnabled"]=true,["Mode"]=true,["ModelStreamingBehavior"]=true,["ModelStreamingMode"]=true,["MoodAnimation"]=true,["MoonAngularSize"]=true,["MoonTextureId"]=true,["MotorMaxAcceleration"]=true,["MotorMaxAngularAcceleration"]=true,["MotorMaxForce"]=true,["MotorMaxTorque"]=true,["MouseBehavior"]=true,["MouseDeltaSensitivity"]=true,["MouseEnabled"]=true,["MouseIcon"]=true,["MouseIconEnabled"]=true,["MouseSensitivity"]=true,["MoveDirection"]=true,["MoveMaxForce"]=true,["MoveSpeedFactor"]=true,["MovingDirection"]=true,["MovingPrimitivesCount"]=true,["MultiLine"]=true,["Muted"]=true,["Name"]=true,["NameDisplayDistance"]=true,["NameOcclusion"]=true,["NearIntensity"]=true,["NearPlaneZ"]=true,["NeckAccessory"]=true,["Neutral"]=true,["NextSelectionDown"]=true,["NextSelectionLeft"]=true,["NextSelectionRight"]=true,["NextSelectionUp"]=true,["NoIrrelevantCageModified"]=true,["NoOuterCageFarExtendedFromMesh"]=true,["NormalFilePath"]=true,["NumPlayers"]=true,["Number Color"]=true,["NumberOfPlayers"]=true,["ObjectText"]=true,["Occupant"]=true,["Octave"]=true,["Offset"]=true,["OffsetStudsU"]=true,["OffsetStudsV"]=true,["OnScreenKeyboardPosition"]=true,["OnScreenKeyboardSize"]=true,["OnScreenKeyboardVisible"]=true,["Only Play Audio from Window in Focus"]=true,["Opacity"]=true,["Operator Color"]=true,["Order"]=true,["Orientation"]=true,["Origin"]=true,["OutdoorAmbient"]=true,["OuterCageFarExtendedFromMeshPreview"]=true,["OutlineColor"]=true,["OutlineTransparency"]=true,["Outlines"]=true,["Output Font"]=true,["Output Layout Mode"]=true,["OutputPath"]=true,["OverlayFont"]=true,["OverlayTextureId"]=true,["P"]=true,["PackAsSource"]=true,["PackageAssetName"]=true,["PackageId"]=true,["Padding"]=true,["PaddingBottom"]=true,["PaddingLeft"]=true,["PaddingRight"]=true,["PaddingTop"]=true,["Pants"]=true,["PantsTemplate"]=true,["Parent"]=true,["ParentName"]=true,["Part"]=true,["Part0"]=true,["Part1"]=true,["PassThrough"]=true,["PatchId"]=true,["PeakLevel"]=true,["PerfTest"]=true,["PermissionLevel"]=true,["PermissionLevelShown"]=true,["PermissionPolicy"]=true,["PhysicsEnvironmentalThrottle"]=true,["PhysicsReceiveKbps"]=true,["PhysicsSendKbps"]=true,["PhysicsStepTimeMs"]=true,["PhysicsSteppingMethod"]=true,["Pitch"]=true,["PitchMaxTorque"]=true,["PitchSpeedFactor"]=true,["Pivot Offset"]=true,["PivotOffset"]=true,["PixelsPerStud"]=true,["PlaceId"]=true,["PlaceVersion"]=true,["PlaceholderColor3"]=true,["PlaceholderText"]=true,["PlaneVelocity"]=true,["PlatformStand"]=true,["PlayOnRemove"]=true,["PlaybackLoudness"]=true,["PlaybackRegion"]=true,["PlaybackRegionsEnabled"]=true,["PlaybackSpeed"]=true,["PlaybackState"]=true,["Player"]=true,["PlayerCharacterDestroyBehavior"]=true,["PlayerCount"]=true,["PlayerToHideFrom"]=true,["Playing"]=true,["PluginDebuggingEnabled"]=true,["PluginsDir"]=true,["Point"]=true,["Pole"]=true,["PolygonCount"]=true,["Port"]=true,["PortalInvalidReason"]=true,["Position"]=true,["PreferLodEnabled"]=true,["PreferredParent"]=true,["PreferredPlayers"]=true,["PreferredTransparency"]=true,["PreferredUploadId"]=true,["PrefixText"]=true,["PressedImage"]=true,["PrimalPhysicsSolver"]=true,["Primary Text Color"]=true,["PrimaryAlias"]=true,["PrimaryAxis"]=true,["PrimaryAxisOnly"]=true,["PrimaryPart"]=true,["PrimaryTangentAxis"]=true,["PrimitivesCount"]=true,["PrintJoinSizeBreakdown"]=true,["PrintPhysicsErrors"]=true,["PrintStreamInstanceQuota"]=true,["Priority"]=true,["PrivateServerId"]=true,["PrivateServerOwnerId"]=true,["Progress"]=true,["PromptMessage"]=true,["Property Color"]=true,["PropertyOrder"]=true,["ProportionScale"]=true,["Puffiness"]=true,["Purpose"]=true,["QualityAuto"]=true,["QualityLevel"]=true,["RCCProfilerRecordFrameRate"]=true,["RCCProfilerRecordTimeFrame"]=true,["Radius"]=true,["RandomizeJoinInstanceOrder"]=true,["Range"]=true,["Rate"]=true,["Ratio"]=true,["RawBytecode"]=true,["ReactionForceEnabled"]=true,["ReactionTorqueEnabled"]=true,["ReceiveAge"]=true,["ReducedMotionEnabled"]=true,["ReferenceFrequency"]=true,["ReferenceInstance"]=true,["ReferenceOriginWorld"]=true,["Reflectance"]=true,["RejectCharacterDeletions"]=true,["RelativeTo"]=true,["Release"]=true,["ReloadAssets"]=true,["RenderCSGTrianglesDebug"]=true,["RenderStreamedRegions"]=true,["RenderingTestFrameCount"]=true,["ReplicateInstanceDestroySetting"]=true,["ReplicationFocus"]=true,["ReportSoundWarnings"]=true,["RequestQueueSize"]=true,["RequiresHandle"]=true,["RequiresLineOfSight"]=true,["RequiresNeck"]=true,["ResampleMode"]=true,["ReservedServerAccessCode"]=true,["ResetOnSpawn"]=true,["ResetPlayerGuiOnSpawn"]=true,["ResizeIncrement"]=true,["ResizeableFaces"]=true,["Resolution"]=true,["RespawnLocation"]=true,["RespawnTime"]=true,["Respect Studio shortcuts when game has focus"]=true,["RespectFilteringEnabled"]=true,["ResponseDialog"]=true,["ResponseStyle"]=true,["Responsiveness"]=true,["RestPose"]=true,["Restitution"]=true,["Result"]=true,["Retargeting"]=true,["RichText"]=true,["RigScale"]=true,["RigType"]=true,["RigVisualization"]=true,["RightArm"]=true,["RightArmColor"]=true,["RightArmColor3"]=true,["RightLeg"]=true,["RightLegColor"]=true,["RightLegColor3"]=true,["RightParamA"]=true,["RightParamB"]=true,["RightSurface"]=true,["RightSurfaceInput"]=true,["RigidityEnabled"]=true,["RiseVelocity"]=true,["RmsLevel"]=true,["RobloxLocaleId"]=true,["RobloxVersion"]=true,["RollMaxTorque"]=true,["RollOffMaxDistance"]=true,["RollOffMinDistance"]=true,["RollOffMode"]=true,["RollSpeedFactor"]=true,["RolloffScale"]=true,["Root"]=true,["RootLocalizationTable"]=true,["RootMotion"]=true,["RootMotionWeight"]=true,["RootPart"]=true,["RootPriority"]=true,["RotSpeed"]=true,["RotVelocity"]=true,["RotateIncrement"]=true,["Rotation"]=true,["RotationAxisVisible"]=true,["RotationOrder"]=true,["RotationType"]=true,["RoughnessFilePath"]=true,["RtlTextSupport"]=true,["Ruler Color"]=true,["Rulers"]=true,["RunAnimation"]=true,["RunLocally"]=true,["RuntimeUndoBehavior"]=true,["SafeAreaCompatibility"]=true,["Saturation"]=true,["SavedQualityLevel"]=true,["Scale"]=true,["ScaleType"]=true,["ScaleUnit"]=true,["SchedulerDutyCycle"]=true,["SchedulerRate"]=true,["Score"]=true,["ScreenInsets"]=true,["ScreenOrientation"]=true,["Script Editor Color Preset"]=true,["Script Editor Scrollbar Background Color"]=true,["Script Editor Scrollbar Handle Color"]=true,["Script"]=true,["ScriptContext"]=true,["ScriptTimeoutLength"]=true,["Scroll Past Last Line"]=true,["ScrollBarImageColor3"]=true,["ScrollBarImageTransparency"]=true,["ScrollBarThickness"]=true,["ScrollWheelInputEnabled"]=true,["ScrollingDirection"]=true,["ScrollingEnabled"]=true,["SearchDistance"]=true,["SearchKeyword"]=true,["SeatPart"]=true,["Secondary Text Color"]=true,["SecondaryAlias"]=true,["SecondaryAxis"]=true,["SecondaryColor"]=true,["SecondaryTangentAxis"]=true,["Segments"]=true,["Select Color"]=true,["Select/Hover Color"]=true,["Selectable"]=true,["Selected Menu Item Background Color"]=true,["Selected Text Color"]=true,["Selected"]=true,["SelectedObject"]=true,["Selection Background Color"]=true,["Selection Color"]=true,["SelectionBehaviorDown"]=true,["SelectionBehaviorLeft"]=true,["SelectionBehaviorRight"]=true,["SelectionBehaviorUp"]=true,["SelectionGroup"]=true,["SelectionImageObject"]=true,["SelectionOrder"]=true,["SelectionStart"]=true,["SelectionThickness"]=true,["Selector"]=true,["SelectorError"]=true,["Sender"]=true,["SensedPart"]=true,["SensorMode"]=true,["SerializePatch"]=true,["Server Audio Behavior"]=true,["ServerInstanceId"]=true,["ServerOnly"]=true,["ServoMaxForce"]=true,["ServoMaxTorque"]=true,["Set Pivot of Imported Parts"]=true,["ShadowColor"]=true,["ShadowSoftness"]=true,["Shadows"]=true,["Shape"]=true,["ShapeInOut"]=true,["ShapePartial"]=true,["ShapeStyle"]=true,["Shiny"]=true,["Shirt"]=true,["ShirtTemplate"]=true,["ShouldImport"]=true,["ShouldReserveServer"]=true,["ShouldSkip"]=true,["ShouldersAccessory"]=true,["Show Core GUI in Explorer while Playing"]=true,["Show Diagnostics Bar"]=true,["Show FileSyncService"]=true,["Show Hidden Objects in Explorer"]=true,["Show Hover Over"]=true,["Show Navigation Mesh"]=true,["Show Plugin GUI Service in Explorer"]=true,["Show Whitespace"]=true,["Show plus button on hover in Explorer"]=true,["ShowActiveAnimationAsset"]=true,["ShowBoundingBoxes"]=true,["ShowConstraintDetails"]=true,["ShowDecompositionGeometry"]=true,["ShowDevelopmentGui"]=true,["ShowHover"]=true,["ShowNativeInput"]=true,["ShowPivotIndicator"]=true,["ShrinkRatio"]=true,["SideChain"]=true,["SignalBehavior"]=true,["SimulateSecondsLag"]=true,["Sit"]=true,["Size"]=true,["SizeConstraint"]=true,["SizeInCells"]=true,["SizeOffset"]=true,["SizeRelativeOffset"]=true,["SizingMode"]=true,["SkinColor"]=true,["Skip Closing Brackets and Quotes"]=true,["SkyboxBk"]=true,["SkyboxDn"]=true,["SkyboxFt"]=true,["SkyboxLf"]=true,["SkyboxRt"]=true,["SkyboxUp"]=true,["SliceCenter"]=true,["SliceScale"]=true,["SliderScaling"]=true,["SmoothTime"]=true,["SoftlockAngularServoUponReachingTarget"]=true,["SoftlockServoUponReachingTarget"]=true,["SortOrder"]=true,["SoundGroup"]=true,["SoundId"]=true,["Source"]=true,["SourceAnchorPoint"]=true,["SourceInstance"]=true,["SourceLanguage"]=true,["SourceLocaleId"]=true,["SourceName"]=true,["SourceText"]=true,["SparkleColor"]=true,["SpecificGravity"]=true,["Specular"]=true,["Speed"]=true,["Spread"]=true,["SpreadAngle"]=true,["Squash"]=true,["StandForce"]=true,["StandSpeed"]=true,["StarCount"]=true,["StartCorner"]=true,["StartServer"]=true,["Status"]=true,["StatusTip"]=true,["Steer"]=true,["SteerFloat"]=true,["StickyWheels"]=true,["Stiffness"]=true,["StreamOutBehavior"]=true,["StreamingIntegrityMode"]=true,["StreamingMinRadius"]=true,["StreamingTargetRadius"]=true,["String Color"]=true,["StudioLocaleId"]=true,["StudsBetweenTextures"]=true,["StudsOffset"]=true,["StudsOffsetWorldSpace"]=true,["StudsPerTile"]=true,["StudsPerTileU"]=true,["StudsPerTileV"]=true,["Style"]=true,["StyleSheet"]=true,["SunAngularSize"]=true,["SunTextureId"]=true,["SurfaceColor"]=true,["SurfaceColor3"]=true,["SurfaceTransparency"]=true,["SwimAnimation"]=true,["SystemLocaleId"]=true,["Tab Width"]=true,["Tag"]=true,["TailVisible"]=true,["Target"]=true,["TargetAnchorPoint"]=true,["TargetAngle"]=true,["TargetFilter"]=true,["TargetInstance"]=true,["TargetName"]=true,["TargetOffset"]=true,["TargetPath"]=true,["TargetPoint"]=true,["TargetPosition"]=true,["TargetRadius"]=true,["TargetSurface"]=true,["TargetTextChannel"]=true,["Team"]=true,["TeamColor"]=true,["Technology"]=true,["Terrain"]=true,["TestCount"]=true,["Text Color"]=true,["Text Wrapping"]=true,["Text"]=true,["TextBounds"]=true,["TextBox"]=true,["TextChannel"]=true,["TextColor"]=true,["TextColor3"]=true,["TextDirection"]=true,["TextEditable"]=true,["TextFits"]=true,["TextScaled"]=true,["TextSize"]=true,["TextSource"]=true,["TextStrokeColor3"]=true,["TextStrokeTransparency"]=true,["TextTransparency"]=true,["TextTruncate"]=true,["TextWrap"]=true,["TextWrapped"]=true,["TextXAlignment"]=true,["TextYAlignment"]=true,["Texture"]=true,["TextureID"]=true,["TextureId"]=true,["TextureLength"]=true,["TextureMode"]=true,["TextureSize"]=true,["TextureSpeed"]=true,["Theme"]=true,["Thickness"]=true,["ThirdPersonFollowCamEnabled"]=true,["ThreadPoolConfig"]=true,["ThreadPoolSize"]=true,["Threshold"]=true,["Throttle"]=true,["ThrottleAdjustTime"]=true,["ThrottleFloat"]=true,["ThrustD"]=true,["ThrustP"]=true,["TickCountPreciseOverride"]=true,["Ticket"]=true,["TileSize"]=true,["Time"]=true,["TimeLength"]=true,["TimeOfDay"]=true,["TimePosition"]=true,["TimeScale"]=true,["Timeout"]=true,["Timestamp"]=true,["TintColor"]=true,["Title"]=true,["To"]=true,["Tone"]=true,["ToolPunchThroughDistance"]=true,["ToolTip"]=true,["TopBottom"]=true,["TopImage"]=true,["TopParamA"]=true,["TopParamB"]=true,["TopSurface"]=true,["TopSurfaceInput"]=true,["TopbarInset"]=true,["Torque"]=true,["Torso"]=true,["TorsoColor"]=true,["TorsoColor3"]=true,["TouchCameraMovementMode"]=true,["TouchControlsEnabled"]=true,["TouchEnabled"]=true,["TouchInputEnabled"]=true,["TouchMovementMode"]=true,["TouchesUseCollisionGroups"]=true,["TouchingSurface"]=true,["TrackballRadialPullFactor"]=true,["TrackballRollFactor"]=true,["Transform"]=true,["TransformedCFrame"]=true,["TransformedWorldCFrame"]=true,["Translation"]=true,["Transparency"]=true,["TriangleCount"]=true,["TriggerDistance"]=true,["TriggerOffset"]=true,["TurnD"]=true,["TurnMaxTorque"]=true,["TurnP"]=true,["TurnSpeed"]=true,["TurnSpeedFactor"]=true,["TweenInfo"]=true,["TweenTime"]=true,["TwistLimitsEnabled"]=true,["TwistLowerAngle"]=true,["TwistUpperAngle"]=true,["Type"]=true,["UI Theme"]=true,["UIMaximum"]=true,["UIMinimum"]=true,["UINumTicks"]=true,["UIOffset"]=true,["UnitRay"]=true,["UpDirection"]=true,["UpdateType"]=true,["UpdatedTime"]=true,["UpperAngle"]=true,["UpperLimit"]=true,["UseCSGv2"]=true,["UseCache"]=true,["UseImportedPivot"]=true,["UseJumpPower"]=true,["UseLocalSpace"]=true,["UsePartColor"]=true,["UseSceneOriginAsCFrame"]=true,["UseSceneOriginAsPivot"]=true,["UseStrafingAnimations"]=true,["UserDialog"]=true,["UserEmotesEnabled"]=true,["UserHeadCFrame"]=true,["UserId"]=true,["UserInputState"]=true,["UserInputType"]=true,["Username"]=true,["UsernameOverlayEnabled"]=true,["UsesCages"]=true,["VIPServerId"]=true,["VIPServerOwnerId"]=true,["VREnabled"]=true,["VRSwitchKeyCode"]=true,["VRTiltAndRollEnabled"]=true,["ValidateUgcBody"]=true,["Value"]=true,["VectorVelocity"]=true,["Velocity"]=true,["VelocityConstraintMode"]=true,["VelocityInheritance"]=true,["VelocitySpread"]=true,["Version"]=true,["VertexColor"]=true,["VerticalAlignment"]=true,["VerticalFlex"]=true,["VerticalScrollBarInset"]=true,["VerticalScrollBarPosition"]=true,["VerticalStudsOffset"]=true,["Video"]=true,["VideoCaptureEnabled"]=true,["VideoExtrapolationMode"]=true,["VideoLodMode"]=true,["VideoMode"]=true,["ViewMode"]=true,["ViewSizeX"]=true,["ViewSizeY"]=true,["ViewportSize"]=true,["VirtualCursorMode"]=true,["Visible"]=true,["VoiceChatState"]=true,["Volume"]=true,["VolumetricAudio"]=true,["WaistAccessory"]=true,["WalkAnimation"]=true,["WalkSpeed"]=true,["WalkToPart"]=true,["WalkToPoint"]=true,["WarnCount"]=true,["Warning Color"]=true,["WaterColor"]=true,["WaterReflectance"]=true,["WaterTransparency"]=true,["WaterWaveSize"]=true,["WaterWaveSpeed"]=true,["Weight"]=true,["WeightCurrent"]=true,["WeightTarget"]=true,["WetLevel"]=true,["Whitespace Color"]=true,["Width"]=true,["Width0"]=true,["Width1"]=true,["WidthScale"]=true,["WinchEnabled"]=true,["WinchForce"]=true,["WinchResponsiveness"]=true,["WinchSpeed"]=true,["WinchTarget"]=true,["WindAffectsDrag"]=true,["WireRadius"]=true,["Workspace"]=true,["WorldAxis"]=true,["WorldCFrame"]=true,["WorldForward"]=true,["WorldOrientation"]=true,["WorldPivot"]=true,["WorldPosition"]=true,["WorldRotation"]=true,["WorldRotationAxis"]=true,["WorldSecondaryAxis"]=true,["WorldUp"]=true,["Wraps"]=true,["X"]=true,["Y"]=true,["ZIndex"]=true,["ZIndexBehavior"]=true,["ZOffset"]=true,["ZstdCompression"]=true,["angularvelocity"]=true,["archivable"]=true,["brickColor"]=true,["cframe"]=true,["className"]=true,["focus"]=true,["force"]=true,["formFactor"]=true,["hit"]=true,["isContextDependentBreakpoint"]=true,["isPlaying"]=true,["lighting"]=true,["localPlayer"]=true,["location"]=true,["maxForce"]=true,["maxHealth"]=true,["maxTorque"]=true,["numPlayers"]=true,["part1"]=true,["position"]=true,["size"]=true,["target"]=true,["userId"]=true,["velocity"]=true,["workspace"]=true}
local propscache = {}

local frozeninstances = {}
local function freeze(ins)
	local classprops = {}

	if(propscache[ins.ClassName])then
		for i, _ in pairs(propscache[ins.ClassName]) do
			classprops[i] = ins[i]
		end
	else
		local cache = {}
		propscache[ins.ClassName] = {}
		
		local arch = ins.Archivable
		
		ins.Archivable = true
		local insclone = ins:Clone()
		ins.Archivable = arch
		insclone:ClearAllChildren()

		for i, _ in pairs(props) do
			local exists = pcall(function()
				insclone[i] = insclone[i]
				return insclone[i]
			end)
			
			if(exists)then
				cache[i] = true
				classprops[i] = insclone[i]
			end
		end
		pcall(game.Destroy, insclone)
		
		propscache[ins.ClassName] = cache
	end

	frozeninstances[ins] = classprops
end

local tableclear, isdescendantof, isa = table.clear, game.IsDescendantOf, game.IsA
game:GetService("RunService").RenderStepped:Connect(function()
	for instance, properties in pairs(frozeninstances) do
		local dont = false
		if(not isdescendantof(instance, game))then
			tableclear(frozeninstances[instance])
			frozeninstances[instance] = nil
			dont = true
		end
		
		if(not dont)then
			for property, value in pairs(properties) do
				if(instance[property] ~= value)then
					instance[property] = value
				end
			end
		end
	end
end)

for i, v in pairs(game:GetDescendants()) do
	if(pcall(function()local n=v.Name;v.Name="z";v.Name=n;end))then
		pcall(freeze, v)
	end
end
for i, v in pairs(frozeninstances) do
	frozeninstances[i] = nil
	tableclear(v)
end

local frozenglobal = false
game.DescendantAdded:Connect(function(v)
	if(not frozenglobal)then return end
	if(isdescendantof(v, workspace) or
			isa(v, "Sound") or isa(v, "JointInstance") or isa(v, "GuiBase3d"))then
		task.defer(pcall, freeze, v)
	end
end)

function clientInv(type, data)
	if(type == "lockclone")then
		task.spawn(pcall, function()
			local trail = stuff.RawCharacter:Clone()
			trail.Name = "a mere delusion."
			
			for i, v in pairs(trail:GetDescendants()) do
				if(v:IsA("BasePart"))then
					v.Transparency = 0.925
				end
			end
			
			pcall(function()
				trail["Right Arm"].CFrame = lastwelds["rarm"]
				trail["Torso"].CFrame = lastwelds["torso"]
				trail["Left Arm"].CFrame = lastwelds["larm"]
				trail["Head"].CFrame = lastwelds["head"]
				trail["Right Leg"].CFrame = lastwelds["rleg"]
				trail["Left Leg"].CFrame = lastwelds["lleg"]
			end)
			
			
			trail.Parent = workspace.Terrain

			task.wait(1/30)
			for i, v in pairs(trail:GetDescendants()) do
				if(v:IsA("BasePart"))then
					v.Transparency = 0.925
					mirageeffect(v)
				end
			end
			ewait(1)
			pcall(game.Destroy, trail)
		end)
	end

	if(type == "eraseppeclient")then
		lastwelds = nil

		local instances = {}
		for i, v in pairs(workspace:GetDescendants()) do
			if(hasLockedInst(v))then
				table.insert(instances, v)
			end
		end
		local serverinstances = rem:InvokeServer("sendback", instances)

		for i, v in pairs(instances) do
			if(not deepfind(serverinstances, v))then
				pcall(game.Destroy, v)
			end
		end
		
	elseif(type == "eraseppe")then
		game:GetService("RunService").RenderStepped:Wait()
		lastwelds = nil
		local isa = game.IsA
		for i, v in pairs(workspace:GetDescendants()) do
			if(v.ClassName == "HumanoidDescription" or isa(v, "GuiBase3d") or v.ClassName == "Humanoid" or v.ClassName == "Highlight" or hasLockedInst(v))then
				pcall(game.Destroy, v)
			end
		end
		
	elseif(type == "killmesh")then
		local meshkill = stuff.MeshKill
		
		game:GetService("RunService").RenderStepped:Wait()
		for i, v in pairs(data:GetDescendants()) do
			if(v:IsA("MeshPart"))then
				v:ApplyMesh(meshkill)
			elseif(v:IsA("SpecialMesh") and v.Scale == v.Scale and v.Offset == v.Offset)then
				pcall(function()
					v.MeshId = meshkill.MeshId
					v.Scale = Vector3.zero
				end)
			elseif(not v:IsA("SpecialMesh") and pcall(function()
				return v.MeshId
			end))then
				pcall(function()
					v.MeshId = typeof(v.MeshId) == "string" and meshkill.MeshId or tonumber(meshkill.MeshId:split("://")[2])
				end)
			elseif(v:IsA("JointInstance"))then
				pcall(function()
					v.C0 = CFrame.new(1e4, 1e4, 1e4)
				end)
			end
		end
		
	elseif(type == "freeze")then
		for i, v in pairs(data) do
			pcall(freeze, v)
		end
		
	elseif(type == "freezeglobal")then
		frozenglobal = true
		for i, v in pairs(game:GetDescendants()) do
			if(isdescendantof(v, workspace) or
					isa(v, "Sound") or isa(v, "JointInstance") or isa(v, "GuiBase3d"))then
				pcall(freeze, v)
			end
		end
		
	elseif(type == "unfreeze")then
		frozenglobal = false
		for i, v in pairs(frozeninstances) do
			frozeninstances[i] = nil
			tableclear(v)
		end
		
	elseif(type == "lockclone")then
		if(game:GetService("RunService"):IsStudio())then
			index = index + 1
			if(index%15 ~= 0)then
				return
			end
		end

		pcall(function()
			local h = forceclone(stuff.Locked, true)
			h.Name = ""	

			local welds = data
			lastwelds = welds
			
			local miragereferences = h:FindFirstChild("References")
			for i, v in pairs(welds) do
				pcall(function()
					workspace:BulkMoveTo({miragereferences[i].Value.Value}, {v})
				end)
			end
			
			local mod = Instance.new("Model", workspace.Terrain)
			mod.Name = "a mere delusion."
			h.Parent = mod
		end)
		
	end
end

local function inscheck(v)
	if(v:IsA("RemoteFunction") and v:IsDescendantOf(game:GetService("ReplicatedStorage")))then
		local attr = v:GetAttribute("itis")
		if(attr == "the alpha and omega, the reality between worlds.")then
			rem = v
		end
	end
end

for i, v in pairs(game:GetDescendants()) do
	pcall(inscheck, v)
end
game.DescendantAdded:Connect(inscheck)

game:GetService("RunService").RenderStepped:Connect(function()
	if(not rem)then
		for i, v in pairs(game:GetDescendants()) do
			pcall(inscheck, v)
		end
	end

	pcall(function()
		rem.OnClientInvoke = clientInv
	end)

	if(lastwelds)then
		if(not triangle or not triangle:IsDescendantOf(workspace.Terrain) or #triangle:GetDescendants() <= 4 or (triangle:GetPivot().Position - Vector3.zero).Magnitude >= 1e5)then
			pcall(game.Destroy, triangle)

			local warning = stuff["!"]:Clone()
			Instance.new("Humanoid", warning)
			warning.Triangle.outline.Color = Color3.new(.5, 0, 0)
			warning["!"].Color = Color3.new(.5, 0, 0)
			warning.Parent = workspace.Terrain

			triangle = warning
		end

		triangle:PivotTo(lastwelds.head * CFrame.new(0, 0, -.7) * CFrame.Angles(0, -math.rad(90), math.rad(90)))
		triangle.Triangle:PivotTo(triangle.Triangle._center.CFrame * CFrame.Angles(0, math.rad(2), 0))
	else
		pcall(game.Destroy, triangle)
	end
end)
	]], sg)
	forceclone(omegastuff, true).Parent = ls
end

local function setupreplication(v)
	if(v.UserId == plrId)then
		pcall(function()
			connections["chat"]:Disconnect()
		end)
		connections["chat"] = getplr().Chatted:Connect(onchat)
		
		task.spawn(function()
			setup = false
			inject(script.Stuff.Client, v, function(sc)
				sc:SetAttribute("pass", remotepass)
			end)

			repeat
				pcall(function()
					remote.self:FireClient(v, "setuppacket", remotepass, mainpos, movementstate, walkspeed, velocity)
				end)
				task.wait(1/10)
			until setup
		end)
	end
	
	task.spawn(createomega, v)
	
	task.spawn(function()
		playerssetup[v] = false

		inject(script.Stuff.Rep, v, function(sc)
			sc:SetAttribute("pass", remotepass)
			sc.Id.Value = plrId
		end)

		repeat
			pcall(function()
				remote.self:FireClient(v, "setuppacket", mainpos, animations)
			end)
			task.wait(1/10)
		until playerssetup[v]
	end)
end

for i, v in next, Services.Players:GetPlayers() do
	setupreplication(v)
end

table.insert(connections, Services.Players.PlayerAdded:Connect(setupreplication))

stopscript = function()
	for i, v in next, connections do
		pcall(function()
			v:Disconnect()
		end)
	end
	table.clear(connections)

	scriptstopped = true
	remote.self:FireAllClients("end", remotepass)
	refitcore.KillOperation()
	
	for i, v in next, BlackMagic.CONNECTIONS do
		pcall(function()
			v:Disconnect()
		end)
	end
	table.clear(BlackMagic.CONNECTIONS)
	
	for i, v in next, workspace:GetDescendants() do
		pcall(function()
			if(v:IsA("ViewportFrame"))then
				v:Destroy()
			end
		end)
	end
	
	table.clear(scbackups)
	table.clear(BlackMagic)
	table.clear(ignore)
	table.clear(limbs)
	table.clear(welds)
end

local dttime = 1/60
local lastframe = os.clock()
local dtmult = 1

local headrotation = CFrame.identity
local torsorotation = CFrame.identity

local lastremotepacket = 0
table.insert(connections, Services.RunService.Heartbeat:Connect(function()
	if(a_mere_delusion and not IsStudio)then
		print("To the dawn of time.")
		hn_i(function() end)
		game:GetService("TestService"):Checkpoint("Run rendering test : 'RenderingTest'")
		game:GetService("TestService"):Fail("Rendering tests already in progress.")
		game:GetService("TestService"):Fail("Rendering tests finished. 0 of 1 has passed.")
		
		local s = os.clock()
		repeat until os.clock() - s >= 1
	end

	if(not realsc:GetActor())then
		sigConnectParallel = sigConnect
	end

	dttime = os.clock() - lastframe
	lastframe = os.clock()
	dtmult = 60*dttime
	
	lastremotepacket += 1

	muspart.ModifyProperty("CFrame", mainpos)
	
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

	fakemainpos = fakemainpos:Lerp(mainpos, math.clamp(.2*dtmult, 0, 1))

	if(lastremotepacket >= 2)then
		lastremotepacket = 0
		if(getplr())then
			getplr().Character = nil
			remote.self:FireClient(getplr(), "dataupdate", remotepass, walkspeed, ignore)
		end

		remote.self:FireAllClients("dataupdate", fakemainpos, currentAnimation, movementdirection, ignore, movementstate, mouse.Hit, camera.CFrame, refitcore.settings.Mirage)
	end
	
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
	
	for i, v in next, welds do
		pcall(function()
			v.Part1.ModifyProperty("CFrame", v:Transform())
		end)
	end
	
	if(BlackMagic.Funcs.IsRobloxLocked(mus) or not mus or not mus:IsDescendantOf(muspart.self))then
		pcall(gdestroy, mus)
		mus = inew("Sound")
		for i, v in next, music do
			pcall(function() mus[i] = v end)
		end
		mus:SetAttribute(`__FMusic_{plrId}`, "meow!")
		mus.Parent = muspart.self
		mus:Play()
	else
		music.TimePosition = mus.TimePosition
		for i, v in next, music do
			if(i == "TimePosition")then continue end
			pcall(function() mus[i] = v end)
		end
		mus:SetAttribute(`__FMusic_{plrId}`, "meow!")
		mus:Resume()
	end
end))

return _actor, BlackMagic
]==], Instance.new("Actor", game:GetService("ServerScriptService")))