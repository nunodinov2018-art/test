-- witch of the wicked.

local ASSETS = require(120460939862152)("WitchOfTheWicked") -- insanely jolly
local SETTINGS = require(ASSETS["Wicked_Law's_Witch.def"])


















-- by Player_57.
--[[
	Credits:
		Okihaito (WINMUGEN) - Wicked Law's Witch sprites, sfx and idea
		Kyutatsuki - Wicked Law's Witch and Hakero model (slight modification)
		Xerantheneum (solstice) - Effects Assistance
		tsup2 - Cross Mesh
		
		SKINS:
		axowotl - Jolly Skin!!!!!!! (Christmas 2023)
		
	Last Updated 24/12/2023
]]
--[[ -----------------------------------------

	-- wicked law's witch (M.U.G.E.N.) --

----------------------------------------- ]]--

-- // aka black marisa lolol

-- // trying out and experimenting with new ways of handling actions/moves and fakechar animations
-- // it was pretty fun (i think)












-- // inferno zero final when


--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

print("--[[ --------------------------------------------------------------------")
print("[[ Does the Black Moon howl? ]]\n")


--[[ ----------------------------------

			-- SERVICES --

---------------------------------- ]]--

local players = game:GetService("Players")
local deb = game:GetService("Debris")
local runs = game:GetService("RunService")
local reps = game:GetService("ReplicatedStorage")
local phs = game:GetService("PhysicsService")
local nws = game:GetService("NetworkServer")
local ts = game:GetService("TweenService")
local chatsrv = game:GetService("Chat")
local txtsrv = game:GetService("TextService")
local lighting = game:GetService("Lighting")
local hs = game:GetService("HttpService")
local sss = game:GetService("ServerScriptService")
local jointserv = game:GetService("JointsService")
local rnd = Random.new(tick())


---------------- For easier reference ----------------
local heartbeat = runs.Heartbeat
local stepped = runs.Stepped
local defer = function(...)
	pcall(task.defer, ...)
end
local msin = math.sin
local mrad = math.rad
function msinrad(val)
	return msin(mrad(val))
end


--[[ ----------------------------------

		-- SCRIPT INITIAL --

---------------------------------- ]]--
local plr = owner-- or players:FindFirstChild(script:GetAttribute("Owner"))
local INITIALCFRAME = CFrame.new()
pcall(function()
	INITIALCFRAME = plr.Character.HumanoidRootPart.CFrame
end)
local userid = plr.UserId


---------------- INSTANCES ----------------
print("- [\n> [WLW] Loading instances...")

local LOCALSCRIPTS = ASSETS.LocalScripts:Clone()
local MODELS = ASSETS.Models:Clone()
local MODULES = ASSETS.Modules:Clone()

--[[
script.Disabled = true
script:Destroy()
task.wait(0.5)
]]--

-- LOCALSCRIPTS
local OwnerLS = LOCALSCRIPTS.Owner:Clone()
local RepLS = LOCALSCRIPTS.Others:Clone()
local OwnerLSValues = OwnerLS.ScriptValues
local RepLSValues = RepLS.ScriptValues

-- MODULES
local CSF = require(MODULES.CSF)()
local CSE = require(MODULES.CSE)()
--local KKR = require(MODULES.KKR)()
--local YUREI = require(MODULES.YUREI)()

function KKR()


	-- by Player_57.
--[[ ----------------------------------

-- Welcome to the Abyss, --

---------------------------------- ]]--

	-- // where ghosts shall fall.
	-- // ...can't you see the light from up above?

--[[

KAKUREN = {
	MainFunctions = table
	InstFunctions = table
	Kieru = {
		KieruParts = table
		KieruPriorityEvents = table
		KieruLoopEvent = event
		KieruInstEvent = event
		KieruFilter = function
	}
	SNLimit = num (defer limit: currently 80) (can't check if reached limit so yeah)
}

---------------------------------------------------------------------
NOTES:
- for workspace:GetDescendants(), make sure table is flipped to start from bottom to top of tree (so that all instances are actually messed with without getting destroyed first)
- When Executing: only script, basepart, and model are destroyed since other instances do not need to be destroyed


---------------------------------------------------------------------
---------------------------------------------------------------------

------------------------------ MORTEM -------------------------------
	MainFunctions:
		- Destroy: inst
		
		- Descript
		
		- Execute: inst, FunctionSTRENGTH, PropertySTRENGTH, LoopEvents, InstEvents, PriorityEvents
			* Runs all of an instance's InstanceFunctions, (Destroys it after but depends on instance)
			* The InstanceFunctions to be ran depends on what kind of instance it is (no duplicates/redundancy)
		
		- IsInKieruTable: inst, table (optional)
			* Returns true if part has been banished via checking recorded properties
			* specify table to check that table instead of default
		- GetKieruData: inst --> KieruData
		
		- AddKieruData: KieruData
			* add KieruData to list of things to be vanished
		- Kieru: inst
			* Records properties of a part and Executes any part with those same properties
		- UnKieru
			* Removes all Kieru recordings
		- SetKieruFilter: function
			* Set the function that will return a table of parts that the vanish will filter out
			
		- LoopConnections: function, LoopSTRENGTH --> eventstable
			* Used for an attack
			* Provides the LoopCheck events of an attack as a table
		
		- Anima: loopevents, instevents, priorityevents
			* Clear everything
			* Note: redefine the tables as the original tables will be unusable
			* This will make sure that no other events will be inserted into the tables (they might be too fast)
		
		- HN: Hypernull function (event skipper)
		- SN: Supernull function (defer priority spam)
		
		- StopAll
			* Removes all Kieru recordings
			* Disconnects KieruLoopEvent and KieruInstEvent
			* Cleans up KieruPriorityEvents
			* Intended for the STOPSCRIPT function of a script (when you want to stop everything)
			
			
	
	-----------------------------------------------------------------
	InstFunctions:
	
		Humanoid:
			- Damage
			- ZeroHealth
			- ChangeState
			- SetChangeState
			
		BasePart:
			- BreakJoints
			- Explosion
			- INFExplosion
			- Void
			- MeshZeroScale
			- MeshNINFOffset
			- MeshZSNINFOff
			- ApplyEmptyMesh
			- VPFDerender
			
		Model:
			- BreakJoints
			- Void
			
		DataModelMesh:
			- ZeroScale
			- NINFOffset
			- ZSNINFOff
			
		Player:
			- Banish
			
		Script:
			- Descript
		
		MISC
			- LockVoid
			- ForceVoid
			- InternalEliminate
	
	-----------------------------------------------------------------
	STRENGTHS
	FunctionSTRENGTH
		- 1: Normal Call
		- 2: HYPERNULL Call
		
	PropertySTRENGTH
		- 1: Normal Property Set
		- 2: Normal Property Set + Changed
		- 3: Normal Property Set + PRIORITY
		- 4: HYPERNULL Property Set + HYPERNULL Changed
		** VPFDerender is an exception as running the event last is better so priority is not needed
	
	LoopSTRENGTH
		- 1: Heartbeat, Stepped
		- 2: Heartbeat, Stepped, Heartbeat PRIORITY, Stepped PRIORITY
		- 3: Strength 2 but with Supernull + Hypernull (may also play a part in function kill (e.g. Player:Banish CharacterAdded InstEvents))
	
	
			
	
	-----------------------------------------------------------------
	KIERU (Vanish)
	
	KieruParts = {
		PropertyTable,
		PropertyTable
	
	
	}
	
	
	
	-----------------------------------------------------------------
	
	LoopEvents = {
		EventName = MainFunctions:LoopConnections Table
	}
	InstEvents = {
		Instance = {
			EventName = Event
		}
	}
	PriorityEvents = {
		Instance = {
			EventName = Event
		}
	}

---------------------------------------------------------------------		
		
]]

	local players = game:GetService("Players")
	local deb = game:GetService("Debris")
	local runs = game:GetService("RunService")
	local reps = game:GetService("ReplicatedStorage")
	local phs = game:GetService("PhysicsService")
	local ts = game:GetService("TweenService")
	local chatsrv = game:GetService("Chat")
	local txtsrv = game:GetService("TextService")
	local lighting = game:GetService("Lighting")
	local hs = game:GetService("HttpService")
	local sss = game:GetService("ServerScriptService")
	local cols = game:GetService("CollectionService")
	local ins = game:GetService("InsertService")

	local rnd = Random.new(os.clock())
	local heartbeat = runs.Heartbeat
	local stepped = runs.Stepped

	local defer = function(...) pcall(task.defer, ...) end

--[[ ----------------------------------

		-- INITIAL --

---------------------------------- ]]--

	--local CSF = require(script.CSF:Clone())()
	local emptymeshpart = MODULES.EmptyMesh:Clone()


	local KAKUREN = {}
	---------------------------------------------------------------------


	local MainFunctions = {}
	local InstFunctions = {}
	KAKUREN.MainFunctions = MainFunctions
	KAKUREN.InstFunctions = InstFunctions

	local Kieru = {}
	local KieruParts = {}
	local KieruPriorityEvents = {}
	local KieruFilter = function() return {} end
	Kieru.KieruParts = KieruParts
	Kieru.KieruPriorityEvents = KieruPriorityEvents
	Kieru.KieruFilter = KieruFilter
	KAKUREN.Kieru = Kieru
	-- Kieru.KieruInstEvent will be set at Kieru section
	-- Kieru.KieruLoopEvent will be set at Kieru section

	---------------------------------------------------------------------

	-- Anima Metatable
	local am = { -- Shuts down all DescendantAdded/all Priorities from reconnecting because it's too god damn fast wtf
		__index = function(tab, i)
			pcall(function()
				rawget(tab, i):Disconnect()
			end)
			pcall(function()
				for name, event in rawget(tab, i) do
					event:Disconnect()
				end
			end)
		end,
		__newindex = function(tab, i, value)
			pcall(function()
				value:Disconnect()
			end)
			pcall(function()
				for name, event in value do
					event:Disconnect()
				end
			end)
		end,
	}


	---------------------------------------------------------------------

	-- For easier reference to Instance Functions
	local IF_Humanoid = {}
	local IF_BasePart = {}
	local IF_Model = {}
	local IF_DataModelMesh = {}
	local IF_Player = {}
	local IF_BaseScript = {}
	local IF_MISC = {}



	---------------------------------------------------------------------
	-- Hypernull
	local HYPF = Instance.new("BindableFunction")
	local function Hypernull(func, ...)
		if 1 then func(...) end
		HYPF.OnInvoke = function(...)
			if pcall(HYPF.Invoke, HYPF, ...) == false then
				func(...)
			end
		end
		if pcall(HYPF.Invoke, HYPF, ...) == false then
			func(...) return
		end
	end

	-- Supernull
	local SNLimit = 80
	KAKUREN.SNLimit = SNLimit

	local function Supernull(IND, func, ...)
		local amount = 0
		local MAX = math.max(unpack(IND))
		local overflow
		overflow = function(...)
			amount = amount + 1
			if table.find(IND, amount) then
				func(...)
			end
			if amount == MAX then
				return
			end
			defer(overflow, ...)
		end
		defer(overflow, ...)
	end

	function MainFunctions:HN(func, ...)
		Hypernull(func, ...)
	end
	function MainFunctions:SN(IND, func, ...)
		Supernull(IND, func, ...)
	end


	-- MAIN FUNCTIONS ---------------------------------------------------

	function MainFunctions:Destroy(inst, FunctionSTRENGTH)
		local FunctionSTRENGTH = FunctionSTRENGTH or 1

		local function exec()
			pcall(function()
				inst:Destroy()
			end)
		end

		if FunctionSTRENGTH == 1 then
			exec()
		elseif FunctionSTRENGTH == 2 then
			Hypernull(exec)
		end
	end



	function MainFunctions:Descript(InstEvents, PriorityEvents)
		for i, v in CSF:GetServices() do
			pcall(function()
				if v ~= sss and v:IsA("JointsService") == false and v:IsA("StarterPlayer") == false then
					for a, inst in v:GetDescendants() do
						pcall(function()
							if inst:IsA("BaseScript") then
								IF_BaseScript:Descript(inst, 4, InstEvents, PriorityEvents)
							end
						end)
					end
				end
			end)
		end
	end


	---------------------------------------------------------------------
	-- LoopConnections ---------------------------------------------------
	function MainFunctions:LoopConnections(func, LoopSTRENGTH, LS3_SN)
		local connections = {}

		local LoopSTRENGTH = LoopSTRENGTH or 1
		if runs:IsClient() and LoopSTRENGTH >= 3 then
			LoopSTRENGTH = 2 -- wtf crash
		end

		local function modifiedfunc()
			func()
			if LoopSTRENGTH == 4 then
				Supernull({1, 2, 5, 10}, func)
			end
		end

		local dupe = 1
		if LoopSTRENGTH == 2 or LoopSTRENGTH == 3 then
			dupe = 2
		elseif LoopSTRENGTH == 4 then
			dupe = 3
		end
		for i = 1, dupe do
			if LoopSTRENGTH >= 3 then
				local function PreLoops(func)
					local t1func = function()
						while connections.Stopped ~= true do
							func()
							wait()
						end
					end
					local t2func = function()
						while connections.Stopped ~= true do
							func()
							task.wait()
						end
					end
					local thread1 = coroutine.create(t1func)
					local thread2 = coroutine.create(t2func)
					coroutine.close(thread1)
					coroutine.close(thread2)

					local ThreadChecker
					ThreadChecker = heartbeat:Connect(function()
						if connections.Stopped == true then
							ThreadChecker:Disconnect()
							return
						end

						-- Script Timeout protection
						if coroutine.status(thread1) == "dead" then
							thread1 = coroutine.create(t1func)
							coroutine.resume(thread1)
						end
						if coroutine.status(thread2) == "dead" then
							thread2 = coroutine.create(t2func)
							coroutine.resume(thread2)
						end
					end)
				end
				PreLoops(modifiedfunc)
			end


			-- RUNSERVICE
			do
				local RS = {}
				RS["Heartbeat"] = heartbeat:Connect(modifiedfunc)
				RS["Stepped"] = stepped:Connect(modifiedfunc)

				if LoopSTRENGTH >= 2 then
					local function HeartbeatP()
						RS["HeartbeatP"]:Disconnect()
						RS["HeartbeatP"] = heartbeat:Connect(HeartbeatP)
						modifiedfunc()
					end
					RS["HeartbeatP"] = heartbeat:Connect(HeartbeatP)
					local function SteppedP()
						RS["SteppedP"]:Disconnect()
						RS["SteppedP"] = stepped:Connect(SteppedP)
						modifiedfunc()
					end
					RS["SteppedP"] = stepped:Connect(SteppedP)
				end

				if runs:IsClient() then
					RS["RenderStepped"] = runs.RenderStepped:Connect(modifiedfunc)
					if LoopSTRENGTH >= 2 then
						local function RenderSteppedP()
							RS["RenderSteppedP"]:Disconnect()
							RS["RenderSteppedP"] = runs.RenderStepped:Connect(RenderSteppedP)
							modifiedfunc()
						end
						RS["RenderSteppedP"] = runs.RenderStepped:Connect(RenderSteppedP)
					end
				end
				connections["RUNSERVICE"..i] = RS
			end

			-- TWEENP
			if LoopSTRENGTH >= 3 then
				local Data = {}
				local Object = Instance.new("NumberValue")
				Object:Destroy()
				Data.Object = Object
				Data.Event = Object.Changed:Connect(function()
					modifiedfunc()
					if LoopSTRENGTH == 3 then
						Supernull(LS3_SN or {1, 2, 10}, modifiedfunc)
					end
				end)
				Data.Tween = ts:Create(
					Object,
					TweenInfo.new(20, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, -1, true),
					{Value = 9e9}
				)
				Data.Tween:Play()
				connections["TWEEN"..i] = Data
			end
		end

		return connections
	end



	function MainFunctions:Execute(inst, LoopEvents, InstEvents, PriorityEvents)
		Hypernull(function()
			local FunctionSTRENGTH = 2
			local PropertySTRENGTH = 4
			if inst:IsA("DataModelMesh") then

				--IF_DataModelMesh:ZeroScale(inst, PropertySTRENGTH, PriorityEvents)
				--IF_DataModelMesh:NINFOffset(inst, PropertySTRENGTH, PriorityEvents)
				IF_DataModelMesh:ZSNINFOff(inst, PropertySTRENGTH, PriorityEvents)
			elseif inst:IsA("Player") then
				IF_Player:Banish(inst, FunctionSTRENGTH, PropertySTRENGTH, 3, LoopEvents, InstEvents, PriorityEvents)
			elseif inst:IsA("BaseScript") then
				IF_BaseScript:Descript(inst, FunctionSTRENGTH, PropertySTRENGTH, InstEvents, PriorityEvents)


			elseif inst:IsA("Humanoid") then

				--IF_Humanoid:Damage(inst, FunctionSTRENGTH)
				IF_Humanoid:ZeroHealth(inst, PropertySTRENGTH, PriorityEvents)
				--IF_Humanoid:ChangeState(inst, FunctionSTRENGTH)
				IF_Humanoid:SetChangeState(inst, FunctionSTRENGTH)


			elseif inst:IsA("BasePart") then

				--IF_BasePart:BreakJoints(inst, FunctionSTRENGTH)
				--IF_BasePart:Explosion(inst)
				--IF_BasePart:INFExplosion(inst)
				IF_BasePart:Void(inst, PropertySTRENGTH, PriorityEvents)
				--IF_BasePart:MeshZeroScale(inst, PropertySTRENGTH, PriorityEvents)
				--IF_BasePart:MeshNINFOffset(inst, PropertySTRENGTH, PriorityEvents)
				IF_BasePart:MeshZSNINFOff(inst, PropertySTRENGTH, PriorityEvents, false)
				IF_BasePart:ApplyEmptyMesh(inst, PropertySTRENGTH, PriorityEvents)
				--IF_BasePart:VPFDerender(inst, 3, PriorityEvents)
				MainFunctions:Destroy(inst, FunctionSTRENGTH)
				--IF_MISC:InternalEliminate(inst, 3)


			elseif inst:IsA("Model") then
				--IF_Model:BreakJoints(inst, FunctionSTRENGTH)
				IF_Model:Void(inst, PropertySTRENGTH, PriorityEvents)
				MainFunctions:Destroy(inst, FunctionSTRENGTH)
				--IF_MISC:InternalEliminate(inst, 3)
			end
		end)
	end


	-- Kieru ---------------------------------------------------
	function MainFunctions:IsInKieruTable(inst, tab)
		local tab = tab or KieruParts
		local actualmatched = false

		for a, props in tab do -- Check for properties
			if props.ClassName == inst.ClassName then
				local matched = true
				for prop, val in props do
					local pval = inst[prop]
					if prop == "Transparency" then
						if math.abs(pval-val) > 0.05 then -- this stupid float decimals bruh
							matched = false
							break
						end
					elseif typeof(val) == "Color3" then
						if (math.abs(val.R-pval.R) > 0.005) or (math.abs(val.G-pval.G) > 0.005) or (math.abs(val.B-pval.B) > 0.005) then
							matched = false
							break
						end
					elseif typeof(val) == "Vector3" then
						if (math.abs(val.X-pval.X) > 0.05) or (math.abs(val.Y-pval.Y) > 0.05) or (math.abs(val.Z-pval.Z) > 0.05) then
							matched = false
							break
						end
					elseif pval ~= val then
						matched = false
						break
					end
				end
				if matched then
					actualmatched = true
					break
				end
			end
		end
		return actualmatched
	end
	function MainFunctions:GetKieruData(inst)
		local data = {
			ClassName = inst.ClassName,
			Transparency = inst.Transparency,
			Anchored = inst.Anchored,
			CanCollide = inst.CanCollide,
			Material = inst.Material,
			Size = inst.Size
		}
		if inst:IsA("Part") then
			data.Shape = inst.Shape
		elseif inst:IsA("MeshPart") then
			data.MeshId = inst.MeshId
			data.MeshSize = inst.MeshSize
		end
		return data
	end

	function MainFunctions:AddKieruData(KieruData)
		table.insert(KieruParts, KieruData)
	end
	function MainFunctions:Kieru(inst)
		if inst:IsA("BasePart") and inst:IsA("Terrain") == false then



			if MainFunctions:IsInKieruTable(inst) == false then -- If data doesn't already exist in KieruParts
				MainFunctions:AddKieruData(MainFunctions:GetKieruData(inst))

			end
			pcall(function()
				MainFunctions:Execute(inst, nil, nil, KieruPriorityEvents)
			end)
		end
	end
	function MainFunctions:UnKieru()
		KieruParts = {}
		Kieru.KieruParts = KieruParts

		-- Clean up KieruPriorityEvents
		for inst, pevents in KieruPriorityEvents do
			if CSF:IsRobloxLocked(inst) == false then
				for name, event in pevents do
					event:Disconnect()
				end
				KieruPriorityEvents[inst] = nil
			end
		end
	end
	function MainFunctions:SetKieruFilter(func)
		KieruFilter = func
		Kieru.KieruFilter = KieruFilter
	end


	local function kierutarget(inst)
		if MainFunctions:IsInKieruTable(inst) then
			MainFunctions:Execute(inst, nil, nil, KieruPriorityEvents)
		end
	end
	Kieru.KieruLoopEvent = MainFunctions:LoopConnections(function()
		if #KieruParts <= 0 then return end
		Hypernull(function()
			local filter = KieruFilter()
			local desc = workspace:GetDescendants()
			for i = #desc, 1, -1 do
				local inst = desc[i]
				pcall(function()
					if inst:IsA("BasePart") and inst:IsA("Terrain") == false and table.find(filter, inst) == nil then
						kierutarget(inst)
					end
				end)
			end
		end)
	end, 4)

	local function Kieru_DescendantAdded(inst)
		if #KieruParts <= 0 then return end

		Kieru.KieruInstEvent:Disconnect()
		Kieru.KieruInstEvent = workspace.DescendantAdded:Connect(Kieru_DescendantAdded)

		Supernull({2}, function()
			if CSF:IsRobloxLocked(inst) == false then
				pcall(function()
					if inst:IsA("BasePart") and table.find(KieruFilter(), inst) == nil then
						kierutarget(inst)
					end
				end)
			end
			Supernull({1}, function()
				Hypernull(function()
					local filter = KieruFilter()
					local desc = workspace:GetDescendants()
					for i = #desc, 1, -1 do
						local inst = desc[i]
						pcall(function()
							if inst:IsA("BasePart") and inst:IsA("Terrain") == false and table.find(filter, inst) == nil then
								kierutarget(inst)
							end
						end)
					end
				end)
			end)
		end)
	end
	Kieru.KieruInstEvent = workspace.DescendantAdded:Connect(Kieru_DescendantAdded)



	-- Anima ---------------------------------------------------
	function MainFunctions:Anima(LoopEvents, InstEvents, PriorityEvents)

		if LoopEvents then
			for i = 1, 3 do
				for name, connections in LoopEvents do
					pcall(function()
						for eventname, event in connections["RUNSERVICE"..i] do
							pcall(function()
								event:Disconnect()
							end)
						end

						local TPData = connections["TWEEN"..i]
						TPData.Event:Disconnect()
						TPData.Tween:Cancel()
						TPData.Object:Destroy()

						connections.Stopped = true
					end)
				end
			end

			setmetatable(LoopEvents, am)
		end

		if InstEvents then
			for inst, events in InstEvents do

				for prop, event in events do
					pcall(function()
						event:Disconnect()
					end)
				end
				setmetatable(events, am)
			end
			setmetatable(InstEvents, am)
		end

		if PriorityEvents then
			for inst, pevents in PriorityEvents do
				for name, event in pevents do
					event:Disconnect()
				end
				setmetatable(pevents, am)

			end
			setmetatable(PriorityEvents, am)
		end
	end


	-- StopAll ---------------------------------------------------
	function MainFunctions:StopAll()
		MainFunctions:UnKieru()
		for eventname, event in Kieru.KieruLoopEvent do
			pcall(function()
				event:Disconnect()
			end)
		end
		Kieru.KieruInstEvent:Disconnect()
	end


	-- INST FUNCTIONS ---------------------------------------------------


	-- HUMANOID
	InstFunctions.Humanoid = IF_Humanoid
	function IF_Humanoid:Damage(hum, FunctionSTRENGTH)
		local FunctionSTRENGTH = FunctionSTRENGTH or 1

		local function exec()
			pcall(function()
				hum:TakeDamage(hum.MaxHealth)
			end)
		end

		if FunctionSTRENGTH == 1 then
			exec()

		elseif FunctionSTRENGTH == 2 then
			Hypernull(exec)
		end
	end
	function IF_Humanoid:ZeroHealth(hum, PropertySTRENGTH, PriorityEvents)
		local events
		if PriorityEvents then
			events = PriorityEvents[hum]
			if events == nil then
				events = {}
				PriorityEvents[hum] = events
			end
		end

		local function exec()
			pcall(function()
				hum.Health = 0
			end)
		end

		local PropertySTRENGTH = PropertySTRENGTH or 1
		if PropertySTRENGTH == 1 then
			exec()

		elseif PropertySTRENGTH == 2 then

			if events.Health == nil or events.Health.Connected == false then
				events.Health = hum:GetPropertyChangedSignal("Health"):Connect(exec)
			end
			exec()

		elseif PropertySTRENGTH == 3 then

			if events.Health == nil or events.Health.Connected == false then

				local function sethealth()
					events.Health:Disconnect()
					events.Health = hum:GetPropertyChangedSignal("Health"):Connect(sethealth)

					exec()
				end
				events.Health = hum:GetPropertyChangedSignal("Health"):Connect(sethealth)
			end
			exec()

		elseif PropertySTRENGTH == 4 then
			local function secondary_exec()
				pcall(function()
					if hum.Health ~= 0 then
						Hypernull(exec)
					end
				end)
			end

			if events.Health == nil or events.Health.Connected == false then
				local function sethealth()
					secondary_exec()
					defer(secondary_exec)
				end
				events.Health = hum:GetPropertyChangedSignal("Health"):Connect(sethealth)
			end

			secondary_exec()
		end
	end

	function IF_Humanoid:ChangeState(hum, FunctionSTRENGTH)
		local FunctionSTRENGTH = FunctionSTRENGTH or 1

		local function exec()
			pcall(function()
				hum:ChangeState(Enum.HumanoidStateType.Dead)
			end)
		end

		if FunctionSTRENGTH == 1 then
			exec()
		elseif FunctionSTRENGTH == 2 then
			Hypernull(exec)
		end
		pcall(function()
			for i, part in hum.Parent:GetChildren() do
				pcall(function()
					if part:IsA("BasePart") then
						part:SetNetworkOwner()
					end
				end)
			end
		end)
	end

	function IF_Humanoid:SetChangeState(hum, FunctionSTRENGTH)
		local FunctionSTRENGTH = FunctionSTRENGTH or 1

		local function exec()
			pcall(function()
				hum:SetStateEnabled(Enum.HumanoidStateType.Dead, true)
			end)
			pcall(function()
				hum:ChangeState(Enum.HumanoidStateType.Dead)
			end)
		end

		if FunctionSTRENGTH == 1 then
			exec()
		elseif FunctionSTRENGTH == 2 then
			Hypernull(exec)
		end
		pcall(function()
			for i, part in hum.Parent:GetChildren() do
				pcall(function()
					if part:IsA("BasePart") then
						part:SetNetworkOwner()
					end
				end)
			end
		end)
	end

	-- BASEPART
	InstFunctions.BasePart = IF_BasePart
	function IF_BasePart:BreakJoints(part, FunctionSTRENGTH)
		local FunctionSTRENGTH = FunctionSTRENGTH or 1

		local function exec()
			pcall(function()
				part:BreakJoints()
			end)
		end

		if FunctionSTRENGTH == 1 then
			exec()

		elseif FunctionSTRENGTH == 2 then
			Hypernull(exec)
		end
	end

	function IF_BasePart:Explosion(part)
		local expl = Instance.new("Explosion")
		expl.Position = part.Position
		expl.Visible = false
		expl.Parent = workspace
		pcall(deb.AddItem, deb, expl, 0)
	end

	function IF_BasePart:INFExplosion(part)
		local expl = Instance.new("Explosion")
		expl.BlastPressure = math.huge
		expl.BlastRadius = math.huge
		expl.DestroyJointRadiusPercent = 1
		expl.Position = part.Position
		expl.Visible = false
		expl.Parent = workspace
		pcall(deb.AddItem, deb, expl, 0)
	end

	function IF_BasePart:Void(part, PropertySTRENGTH, PriorityEvents)
		local events
		if PriorityEvents then
			events = PriorityEvents[part]
			if events == nil then
				events = {}
				PriorityEvents[part] = events
			end
		end

		local function exec()
			pcall(function()
				part.CFrame = CFrame.new(-9e9, -9e9, -9e9)
			end)
		end

		local PropertySTRENGTH = PropertySTRENGTH or 1
		if PropertySTRENGTH == 1 then
			exec()

		elseif PropertySTRENGTH == 2 then

			if events.CFrame == nil or events.CFrame.Connected == false then
				events.CFrame = part:GetPropertyChangedSignal("CFrame"):Connect(exec)
			end
			exec()

		elseif PropertySTRENGTH == 3 then

			if events.CFrame == nil or events.CFrame.Connected == false then
				local function setcf()
					events.CFrame:Disconnect()
					events.CFrame = part:GetPropertyChangedSignal("CFrame"):Connect(setcf)

					exec()
				end
				events.CFrame = part:GetPropertyChangedSignal("CFrame"):Connect(setcf)
			end
			exec()

		elseif PropertySTRENGTH == 4 then

			local function secondary_exec()
				pcall(function()
					if part.CFrame ~= CFrame.new(-9e9, -9e9, -9e9) then
						Hypernull(exec)
					end
				end)
			end

			if events.CFrame == nil or events.CFrame.Connected == false then

				local function setcf()
					secondary_exec()
					defer(secondary_exec)
				end
				events.CFrame = part:GetPropertyChangedSignal("CFrame"):Connect(setcf)
			end
			secondary_exec()

		end
	end


	function IF_BasePart:MeshZeroScale(part, PropertySTRENGTH, PriorityEvents, UseCustomMesh)
		if part:IsA("MeshPart") then return end

		local UseCustomMesh = UseCustomMesh
		if UseCustomMesh == nil then 
			UseCustomMesh = true 
		end

		if part:FindFirstChildWhichIsA("DataModelMesh") then

			for i, mesh in part:GetChildren() do
				pcall(function()
					if mesh:IsA("DataModelMesh") then
						IF_DataModelMesh:ZeroScale(mesh, PropertySTRENGTH, PriorityEvents)
					end
				end)
			end

		elseif UseCustomMesh == true then
			local mesh = Instance.new("SpecialMesh")
			mesh.Scale = Vector3.new()
			mesh.MeshType = Enum.MeshType.Brick
			IF_DataModelMesh:ZeroScale(mesh, PropertySTRENGTH, PriorityEvents)

			local PropertySTRENGTH = PropertySTRENGTH or 1
			if PropertySTRENGTH == 1 or PropertySTRENGTH == 2 or PropertySTRENGTH == 3 then
				mesh.Parent = part

			elseif PropertySTRENGTH == 4 then
				Hypernull(function()
					mesh.Parent = part
				end)
			end
		end
	end

	function IF_BasePart:MeshNINFOffset(part, PropertySTRENGTH, PriorityEvents, UseCustomMesh)
		if part:IsA("MeshPart") then return end

		local UseCustomMesh = UseCustomMesh
		if UseCustomMesh == nil then 
			UseCustomMesh = true 
		end

		if part:FindFirstChildWhichIsA("DataModelMesh") then

			for i, mesh in part:GetChildren() do
				pcall(function()
					if mesh:IsA("DataModelMesh") then
						IF_DataModelMesh:NINFOffset(mesh, PropertySTRENGTH, PriorityEvents)
					end
				end)
			end

		elseif UseCustomMesh == true then
			local mesh = Instance.new("SpecialMesh")
			mesh.Offset = Vector3.new(-9e9, -9e9, -9e9)
			mesh.MeshType = Enum.MeshType.Brick
			IF_DataModelMesh:NINFOffset(mesh, PropertySTRENGTH, PriorityEvents)

			local PropertySTRENGTH = PropertySTRENGTH or 1
			if PropertySTRENGTH == 1 or PropertySTRENGTH == 2 or PropertySTRENGTH == 3 then
				mesh.Parent = part
			elseif PropertySTRENGTH == 4 then
				Hypernull(function()
					mesh.Parent = part
				end)
			end
		end
	end

	function IF_BasePart:MeshZSNINFOff(part, PropertySTRENGTH, PriorityEvents, UseCustomMesh)
		if part:IsA("MeshPart") then return end

		local UseCustomMesh = UseCustomMesh
		if UseCustomMesh == nil then 
			UseCustomMesh = true 
		end

		if part:FindFirstChildWhichIsA("DataModelMesh") then

			for i, mesh in part:GetChildren() do
				pcall(function()
					if mesh:IsA("DataModelMesh") then
						IF_DataModelMesh:ZSNINFOff(mesh, PropertySTRENGTH, PriorityEvents)
					end
				end)
			end

		elseif UseCustomMesh == true then
			local mesh = Instance.new("SpecialMesh")
			mesh.Scale = Vector3.new()
			mesh.Offset = Vector3.new(-9e9, -9e9, -9e9)
			mesh.MeshType = Enum.MeshType.Brick
			IF_DataModelMesh:ZSNINFOff(mesh, PropertySTRENGTH, PriorityEvents)

			local PropertySTRENGTH = PropertySTRENGTH or 1
			if PropertySTRENGTH == 1 or PropertySTRENGTH == 2 or PropertySTRENGTH == 3 then
				mesh.Parent = part
			elseif PropertySTRENGTH == 4 then
				Hypernull(function()
					mesh.Parent = part
				end)
			end
		end
	end


	local emptymeshid = emptymeshpart.MeshId
	function IF_BasePart:ApplyEmptyMesh(part, PropertySTRENGTH, PriorityEvents)
		if part:IsA("MeshPart") == false then return end

		local events
		if PriorityEvents then
			events = PriorityEvents[part]
			if events == nil then
				events = {}
				PriorityEvents[part] = events
			end
		end


		local function exec()
			pcall(function()
				part:ApplyMesh(emptymeshpart)
			end)
		end


		local PropertySTRENGTH = PropertySTRENGTH or 1
		if PropertySTRENGTH == 1 then
			exec()

		elseif PropertySTRENGTH == 2 then

			if events.MeshId == nil or events.MeshId.Connected == false then
				events.MeshId = part:GetPropertyChangedSignal("MeshId"):Connect(exec)
			end
			exec()

		elseif PropertySTRENGTH == 3 then

			if events.MeshId == nil or events.MeshId.Connected == false then
				local function setid()
					events.MeshId:Disconnect()
					events.MeshId = part:GetPropertyChangedSignal("MeshId"):Connect(setid)

					exec()
				end
				events.MeshId = part:GetPropertyChangedSignal("MeshId"):Connect(setid)
			end
			exec()

		elseif PropertySTRENGTH == 4 then

			local function secondary_exec()
				pcall(function()
					if part.MeshId ~= emptymeshid then
						Hypernull(exec)
					end
				end)
			end

			if events.MeshId == nil or events.MeshId.Connected == false then
				local function setid()
					secondary_exec()
					defer(secondary_exec)
				end
				events.MeshId = part:GetPropertyChangedSignal("MeshId"):Connect(setid)

			end
			secondary_exec()

		end
	end

	function IF_BasePart:VPFDerender(part, PropertySTRENGTH, PriorityEvents)
		local events
		if PriorityEvents then
			events = PriorityEvents[part]
			if events == nil then
				events = {}
				PriorityEvents[part] = events
			end
		end

		local function exec()
			local vpf = workspace:FindFirstChildWhichIsA("ViewportFrame")
			if not vpf then
				vpf = Instance.new("ViewportFrame", workspace)
			end

			pcall(function()
				part.Parent = vpf
			end)
		end

		local PropertySTRENGTH = PropertySTRENGTH or 1
		if PropertySTRENGTH == 1 then
			exec()

		elseif PropertySTRENGTH == 2 then

			local function secondary_exec()
				defer(exec)
			end

			if events.ParentChanged == nil or events.ParentChanged.Connected == false then
				events.ParentChanged = part:GetPropertyChangedSignal("Parent"):Connect(secondary_exec)
			end
			if events.AncestryChanged == nil or events.AncestryChanged.Connected == false then
				events.AncestryChanged = part.AncestryChanged:Connect(secondary_exec)
			end

			exec()

		elseif PropertySTRENGTH == 3 then

			local function secondary_exec()
				defer(function()
					Hypernull(exec)
				end)
			end

			if events.ParentChanged == nil or events.ParentChanged.Connected == false then
				events.ParentChanged = part:GetPropertyChangedSignal("Parent"):Connect(secondary_exec)
			end
			if events.AncestryChanged == nil or events.AncestryChanged.Connected == false then
				events.AncestryChanged = part.AncestryChanged:Connect(secondary_exec)
			end
			Hypernull(exec)

		end
	end


	-- MODEL
	InstFunctions.Model = IF_Model

	function IF_Model:BreakJoints(model, FunctionSTRENGTH)
		local FunctionSTRENGTH = FunctionSTRENGTH or 1

		local function exec()
			pcall(function()
				model:BreakJoints()
			end)
		end

		if FunctionSTRENGTH == 1 then
			exec()

		elseif FunctionSTRENGTH == 2 then
			Hypernull(exec)
		end
	end

	-- no trickeries :>
	local RandomizedModelVoid = {}
	for i = -1000, 1000 do
		if i == 0 then continue end
		local val = CFrame.new(9e9 * i, 9e9 * i, 9e9 * i)
		table.insert(RandomizedModelVoid, val)
	end
	local function ModelVoidProper(model) -- actually void the model
		local pivot = model:GetPivot()
		local index = table.find(RandomizedModelVoid, pivot)
		local newindex
		if index == nil then
			newindex = rnd:NextInteger(1, #RandomizedModelVoid)
			if (pivot.Position-RandomizedModelVoid[newindex].Position).Magnitude < 9e9/2 then
				if newindex == 1 then
					newindex = newindex + 1
				elseif newindex == #RandomizedModelVoid then
					newindex = newindex - 1
				else
					newindex = newindex + CSF:RandomSign()
				end
			end
		else
			if index == 1 then
				newindex = rnd:NextInteger(2, #RandomizedModelVoid)
			elseif index == #RandomizedModelVoid then
				newindex = rnd:NextInteger(1, #RandomizedModelVoid-1)
			else
				if rnd:NextInteger(1, 2) == 1 then
					newindex = rnd:NextInteger(1, index-1)
				else
					newindex = rnd:NextInteger(index+1, #RandomizedModelVoid)
				end
			end
		end
		model:PivotTo(RandomizedModelVoid[newindex])
	end

	function IF_Model:Void(model, PropertySTRENGTH, PriorityEvents)
		local events
		if PriorityEvents then
			events = PriorityEvents[model]
			if events == nil then
				events = {}
				PriorityEvents[model] = events
			end
		end

		local function exec()
			pcall(ModelVoidProper, model)
		end

		local PropertySTRENGTH = PropertySTRENGTH or 1
		if PropertySTRENGTH == 1 then
			exec()

		elseif PropertySTRENGTH == 2 then

			if events.WorldPivot == nil or events.WorldPivot.Connected == false then
				local function setcf()
					pcall(function()
						if not table.find(RandomizedModelVoid, model:GetPivot()) then
							exec()
						end
					end)
				end
				events.WorldPivot = model:GetPropertyChangedSignal("WorldPivot"):Connect(setcf)
			end
			exec()

		elseif PropertySTRENGTH == 3 then

			if events.WorldPivot == nil or events.WorldPivot.Connected == false then
				local function setcf()
					events.WorldPivot:Disconnect()
					events.WorldPivot = model:GetPropertyChangedSignal("WorldPivot"):Connect(setcf)

					pcall(function()
						if not table.find(RandomizedModelVoid, model:GetPivot()) then
							exec()
						end
					end)
				end
				events.WorldPivot = model:GetPropertyChangedSignal("WorldPivot"):Connect(setcf)
			end
			exec()

		elseif PropertySTRENGTH == 4 then

			local function secondary_exec()
				pcall(function()
					if not table.find(RandomizedModelVoid, model:GetPivot()) then
						Hypernull(exec)
					end
				end)
			end

			if events.WorldPivot == nil or events.WorldPivot.Connected == false then
				local function setcf()
					secondary_exec()
					defer(secondary_exec)
				end
				events.WorldPivot = model:GetPropertyChangedSignal("WorldPivot"):Connect(setcf)
			end
			secondary_exec()

		end
	end


	-- MESH
	InstFunctions.DataModelMesh = IF_DataModelMesh
	function IF_DataModelMesh:ZeroScale(mesh, PropertySTRENGTH, PriorityEvents)
		local events
		if PriorityEvents then
			events = PriorityEvents[mesh]
			if events == nil then
				events = {}
				PriorityEvents[mesh] = events
			end
		end

		local function exec1()
			pcall(function()
				mesh.Scale = Vector3.new()
			end)
		end
		local function exec2()
			pcall(function()
				mesh.MeshType = Enum.MeshType.Brick
			end)
		end

		local PropertySTRENGTH = PropertySTRENGTH or 1
		if PropertySTRENGTH == 1 then
			exec1()
			exec2()

		elseif PropertySTRENGTH == 2 then

			if events.Scale == nil or events.Scale.Connected == false then
				events.Scale = mesh:GetPropertyChangedSignal("Scale"):Connect(exec1)
			end
			exec1()

			if events.MeshType == nil or events.MeshType.Connected == false then
				events.MeshType = mesh:GetPropertyChangedSignal("MeshType"):Connect(exec2)
			end
			exec2()

		elseif PropertySTRENGTH == 3 then

			if events.Scale == nil or events.Scale.Connected == false then
				local function setscale()
					events.Scale:Disconnect()
					events.Scale = mesh:GetPropertyChangedSignal("Scale"):Connect(setscale)

					exec1()
				end
				events.Scale = mesh:GetPropertyChangedSignal("Scale"):Connect(setscale)
			end
			exec1()

			if events.MeshType == nil or events.MeshType.Connected == false then
				local function settype()
					events.MeshType:Disconnect()
					events.MeshType = mesh:GetPropertyChangedSignal("MeshType"):Connect(settype)

					exec2()
				end
				events.MeshType = mesh:GetPropertyChangedSignal("MeshType"):Connect(settype)
			end
			exec2()

		elseif PropertySTRENGTH == 4 then

			local function secondary_exec1()
				pcall(function()
					if mesh.Scale ~= Vector3.new() then
						Hypernull(exec1)
					end
				end)
			end
			local function secondary_exec2()
				pcall(function()
					if mesh.MeshType ~= Enum.MeshType.Brick then
						Hypernull(exec2)
					end
				end)
			end

			if events.Scale == nil or events.Scale.Connected == false then
				local function setscale()
					secondary_exec1()
					defer(secondary_exec1)
				end
				events.Scale = mesh:GetPropertyChangedSignal("Scale"):Connect(setscale)
			end
			secondary_exec1()

			if events.MeshType == nil or events.MeshType.Connected == false then
				local function settype()
					secondary_exec2()
					defer(secondary_exec2)
				end
				events.MeshType = mesh:GetPropertyChangedSignal("MeshType"):Connect(settype)
			end
			secondary_exec2()

		end
	end

	function IF_DataModelMesh:NINFOffset(mesh, PropertySTRENGTH, PriorityEvents)
		local events
		if PriorityEvents then
			events = PriorityEvents[mesh]
			if events == nil then
				events = {}
				PriorityEvents[mesh] = events
			end
		end

		local function exec1()
			pcall(function()
				mesh.Offset = Vector3.new(-9e9, -9e9, -9e9)
			end)
		end
		local function exec2()
			pcall(function()
				mesh.MeshType = Enum.MeshType.Brick
			end)
		end

		local PropertySTRENGTH = PropertySTRENGTH or 1
		if PropertySTRENGTH == 1 then
			exec1()
			exec2()

		elseif PropertySTRENGTH == 2 then
			if events.Offset == nil or events.Offset.Connected == false then
				events.Offset = mesh:GetPropertyChangedSignal("Offset"):Connect(exec1)
			end
			exec1()

			if events.MeshType == nil or events.MeshType.Connected == false then
				events.MeshType = mesh:GetPropertyChangedSignal("MeshType"):Connect(exec2)
			end
			exec2()

		elseif PropertySTRENGTH == 3 then

			if events.Offset == nil or events.Offset.Connected == false then
				local function setoffset()
					events.Offset:Disconnect()
					events.Offset = mesh:GetPropertyChangedSignal("Offset"):Connect(setoffset)

					exec1()
				end
				events.Offset = mesh:GetPropertyChangedSignal("Offset"):Connect(setoffset)
			end
			exec1()

			if events.MeshType == nil or events.MeshType.Connected == false then
				local function settype()
					events.MeshType:Disconnect()
					events.MeshType = mesh:GetPropertyChangedSignal("MeshType"):Connect(settype)

					exec2()
				end
				events.MeshType = mesh:GetPropertyChangedSignal("MeshType"):Connect(settype)
			end
			exec2()

		elseif PropertySTRENGTH == 4 then

			local function secondary_exec1()
				pcall(function()
					if mesh.Offset ~= Vector3.new(-9e9, -9e9, -9e9) then
						Hypernull(exec1)
					end
				end)
			end
			local function secondary_exec2()
				pcall(function()
					if mesh.MeshType ~= Enum.MeshType.Brick then
						Hypernull(exec2)
					end
				end)
			end

			if events.Offset == nil or events.Offset.Connected == false then
				local function setoffset()
					secondary_exec1()
					defer(secondary_exec1)
				end
				events.Offset = mesh:GetPropertyChangedSignal("Offset"):Connect(setoffset)
			end
			secondary_exec1()

			if events.MeshType == nil or events.MeshType.Connected == false then
				local function settype()
					secondary_exec2()
					defer(secondary_exec2)
				end
				events.MeshType = mesh:GetPropertyChangedSignal("MeshType"):Connect(settype)
			end
			secondary_exec2()

		end
	end


	function IF_DataModelMesh:ZSNINFOff(mesh, PropertySTRENGTH, PriorityEvents)
		local events
		if PriorityEvents then
			events = PriorityEvents[mesh]
			if events == nil then
				events = {}
				PriorityEvents[mesh] = events
			end
		end

		local function exec1()
			pcall(function()
				mesh.Scale = Vector3.new()
			end)
		end
		local function exec2()
			pcall(function()
				mesh.Offset = Vector3.new(-9e9, -9e9, -9e9)
			end)
		end
		local function exec3()
			pcall(function()
				mesh.MeshType = Enum.MeshType.Brick
			end)
		end

		local PropertySTRENGTH = PropertySTRENGTH or 1
		if PropertySTRENGTH == 1 then
			exec1()
			exec2()
			exec3()

		elseif PropertySTRENGTH == 2 then
			if events.Scale == nil or events.Scale.Connected == false then
				events.Scale = mesh:GetPropertyChangedSignal("Scale"):Connect(exec1)
			end
			exec1()

			if events.Offset == nil or events.Offset.Connected == false then
				events.Offset = mesh:GetPropertyChangedSignal("Offset"):Connect(exec2)
			end
			exec2()

			if events.MeshType == nil or events.MeshType.Connected == false then
				events.MeshType = mesh:GetPropertyChangedSignal("MeshType"):Connect(exec3)
			end
			exec3()

		elseif PropertySTRENGTH == 3 then

			if events.Scale == nil or events.Scale.Connected == false then
				local function setscale()
					events.Scale:Disconnect()
					events.Scale = mesh:GetPropertyChangedSignal("Scale"):Connect(setscale)

					exec1()
				end
				events.Scale = mesh:GetPropertyChangedSignal("Scale"):Connect(setscale)
			end
			exec1()

			if events.Offset == nil or events.Offset.Connected == false then
				local function setoffset()
					events.Offset:Disconnect()
					events.Offset = mesh:GetPropertyChangedSignal("Offset"):Connect(setoffset)

					exec2()
				end
				events.Offset = mesh:GetPropertyChangedSignal("Offset"):Connect(setoffset)
			end
			exec2()

			if events.MeshType == nil or events.MeshType.Connected == false then
				local function settype()
					events.MeshType:Disconnect()
					events.MeshType = mesh:GetPropertyChangedSignal("MeshType"):Connect(settype)

					exec3()
				end
				events.MeshType = mesh:GetPropertyChangedSignal("MeshType"):Connect(settype)
			end
			exec3()

		elseif PropertySTRENGTH == 4 then

			local function secondary_exec1()
				pcall(function()
					if mesh.Scale ~= Vector3.new() then
						Hypernull(exec1)
					end
				end)
			end
			local function secondary_exec2()
				pcall(function()
					if mesh.Offset ~= Vector3.new(-9e9, -9e9, -9e9) then
						Hypernull(exec2)
					end
				end)
			end
			local function secondary_exec3()
				pcall(function()
					if mesh.MeshType ~= Enum.MeshType.Brick then
						Hypernull(exec3)
					end
				end)
			end

			if events.Scale == nil or events.Scale.Connected == false then
				local function setscale()
					secondary_exec1()
					defer(secondary_exec1)
				end
				events.Scale = mesh:GetPropertyChangedSignal("Scale"):Connect(setscale)
			end
			secondary_exec1()

			if events.Offset == nil or events.Offset.Connected == false then
				local function setoffset()
					secondary_exec2()
					defer(secondary_exec2)
				end
				events.Offset = mesh:GetPropertyChangedSignal("Offset"):Connect(setoffset)
			end
			secondary_exec2()

			if events.MeshType == nil or events.MeshType.Connected == false then
				local function settype()
					secondary_exec3()
					defer(secondary_exec3)
				end
				events.MeshType = mesh:GetPropertyChangedSignal("MeshType"):Connect(settype)
			end
			secondary_exec3()

		end
	end


	-- PLAYER
	InstFunctions.Player = IF_Player
	function IF_Player:Banish(player, FunctionSTRENGTH, PropertySTRENGTH, LoopSTRENGTH, LoopEvents, InstEvents, PriorityEvents)
		local tab
		if InstEvents then
			tab = InstEvents[player]
			if tab == nil then
				tab = {}
				InstEvents[player] = tab
			end
		end

		local function exec()
			local char = player.Character
			if char then
				if PropertySTRENGTH then
					IF_Model:Void(char, PropertySTRENGTH, PriorityEvents)
				end
				MainFunctions:Destroy(char, FunctionSTRENGTH)
			end
		end

		if tab ~= nil and tab.CharacterAdded == nil then
			tab.CharacterAdded = player.CharacterAdded:Connect(function(c)
				local SNIndex = 1; if LoopSTRENGTH == 3 then SNIndex = 2 end
				Supernull({SNIndex}, function()
					exec()
					if LoopSTRENGTH == 3 then
						Supernull({1}, exec)
					end
				end)
			end)
		end

		local evname = "KKR_BANISH_"..player.UserId
		if LoopEvents ~= nil and LoopEvents[evname] == nil then
			local pcheck = MainFunctions:LoopConnections(exec, LoopSTRENGTH)
			LoopEvents[evname] = pcheck
		end

		exec()
	end

	-- BASESCRIPT
	InstFunctions.BaseScript = IF_BaseScript
	function IF_BaseScript:Descript(scr, FunctionSTRENGTH, PropertySTRENGTH, InstEvents, PriorityEvents)
		local events
		if PriorityEvents then
			events = PriorityEvents[scr]
			if events == nil then
				events = {}
				PriorityEvents[scr] = events
			end
		end

		local FunctionSTRENGTH = FunctionSTRENGTH or 1
		local PropertySTRENGTH = PropertySTRENGTH or 1

		local function exec()
			pcall(function()
				scr.Disabled = true
			end)
		end

		pcall(function()
			if PropertySTRENGTH == 1 then
				exec()

			elseif PropertySTRENGTH == 2 then

				if events.Disabled == nil or events.Disabled.Connected == false then
					events.Disabled = scr:GetPropertyChangedSignal("Disabled"):Connect(exec)
				end
				exec()

			elseif PropertySTRENGTH == 3 then

				if events.Disabled == nil or events.Disabled.Connected == false then
					local function setdisabled()
						events.Disabled:Disconnect()
						events.Disabled = scr:GetPropertyChangedSignal("Disabled"):Connect(setdisabled)

						exec()
					end
					events.Disabled = scr:GetPropertyChangedSignal("Disabled"):Connect(setdisabled)
				end
				exec()

			elseif PropertySTRENGTH == 4 then

				local function secondary_exec()
					pcall(function()
						if scr.Disabled ~= true then
							Hypernull(exec)
						end
					end)
				end

				if events.Disabled == nil or events.Disabled.Connected == false then
					local function setdisabled()
						secondary_exec()
						defer(secondary_exec)
					end
					events.Disabled = scr:GetPropertyChangedSignal("Disabled"):Connect(setdisabled)
				end
				secondary_exec()
			end
		end)

		MainFunctions:Destroy(scr, FunctionSTRENGTH)
	end



	InstFunctions.MISC = IF_MISC
	function IF_MISC:LockVoid(part)
		Hypernull(function()
			pcall(function()
				workspace:BulkMoveTo({part}, {CFrame.new(-9e9, -9e9, -9e9)}, Enum.BulkMoveMode.FireCFrameChanged)
			end)
		end)
	end

	function IF_MISC:ForceVoid(inst)
		pcall(function()
			local parent = inst.Parent

			Hypernull(function()
				pcall(function()
					local model = Instance.new("Model", workspace)
					inst.Parent = model
					ModelVoidProper(model)
					inst.Parent = parent
					model:Destroy()
				end)
			end)
		end)
	end

	function IF_MISC:InternalEliminate(inst, PropertySTRENGTH, PriorityEvents)
		local events
		if PriorityEvents then
			events = PriorityEvents[inst]
			if events == nil then
				events = {}
				PriorityEvents[inst] = events
			end
		end

		local function exec()
			pcall(function()
				inst:ClearAllChildren()
			end)
		end

		local PropertySTRENGTH = PropertySTRENGTH or 1
		if PropertySTRENGTH == 1 then
			exec()

		elseif PropertySTRENGTH == 2 then

			if events ~= nil and events.DescendantAdded == nil or events.DescendantAdded.Connected == false then
				events.DescendantAdded = inst.DescendantAdded:Connect(function()
					defer(exec)
				end)
			end
			exec()

		elseif PropertySTRENGTH == 3 then

			local function secondary_exec()
				Hypernull(exec)
			end

			pcall(function()
				if events ~= nil and events.DescendantAdded == nil or events.DescendantAdded.Connected == false then
					local function clear()
						events.DescendantAdded:Disconnect()
						events.DescendantAdded = inst.DescendantAdded:Connect(clear)

						defer(secondary_exec)
					end
					events.DescendantAdded = inst.DescendantAdded:Connect(clear)
				end
				secondary_exec()
			end)

		end
	end



	---------------------------------------------------------------------


	return function()
		return KAKUREN
	end
end

function YUREI()
	-- by Player_57.
--[[ -----------------------------------------

				-- yÅ«rei --
				   ã‚†ã�†ã‚Œã�„
----------------------------------------- ]]--

	-- //just a ghost in your memories
	-- //è¦‹ã�¤ã‚�ã�¦ ã��ã� ã�•ã�„

	----------------------------------------------------------------------------
	----------------------------------------------------------------------------
--[[

	YUREI = {
		:Initialize(origmodel, prim, parent) --> ADMData
		:StopAll()
		
		ADModels = ADMData table
	}
	
	---------------------------------------------------------------------

	------------------------------ NOTES -------------------------------
	* MAKE SURE TO USE A CLONE OF THE MODEL YOU WANT TO REFIT
		* originalmodel == clone of the actual original model
		* originalmodel must be parented to nil at all times
	
	* MAKE SURE THE FOLLOWING INSTANCES ARE NOT IN THE MODEL CLONE:
		* Humanoid
		* JointInstances
		
	* TO MAKE MODEL AN ANTIDEATH:
		* YUREI:Initialize(originalmodel, primarypart, desired parent)
		* returns ADMData
		
	* TO ADD/REMOVE AN INSTANCE INTO THE ANTIDEATH:
		* ADMData:AddInst(instance, parent (must be modelclone or an instance in modelclone))
			* returns OrigData
		* ADMData:RemoveInst(instance) // -- Warning: will destroy the instance!
		
	* TO GET THE INSTANCE ACTUALLY BEING PRESENTED TO THE SERVER (aka the clone):
		* ADMData:GetCloneInst(inst)
			* if its the origmodel, it will return the model in workspace
			* if its an instance of the origmodel, it will return the instance in workspace
		
	** The OriginalModel and its Original Instances are all used for reference only. Do not change any of their properties.
	** Instead you must change their recorded properties through the method below:
	* IN EDITING/GETTING PROPERTIES:
		* function ADMData:GetRecordedMCF()
		* function ADMData:SetRecordedMCF(cframe)
		* function ADMData:GetRecordedProperty(instance, property)
		* function ADMData:SetRecordedProperty(instance, property, val)
		
		** INSTANCE CONSIDERED/RECORDED PROPERTIES ONLY: please search for the variable called "RECORDEDPROPERTIES" in this module
		
	* POST-REFIT FUNC:
		* POST-REFIT FUNCTION (called when the model or an instance in the model is refitted)
		* Can be set after initializing the antideath
		* Passed Arguments: ADMData, OrigModel/OrigInst, New CModel/New CInst
		* ADMData:SetPostRefitFunc(function(ADMData, origmodel/originst, cmodel/cinst))
		
	* ATTACKED:
		* Function that is called when the refit is attacked in any way (property set/ancestry/descendants/robloxlocked)
		* Parameters: ADMData, origmodel/originst, cmodel/cinst, AttackType, AttackValue
		* ADMData:SetAttackedFunc(function)
		* List of detected attacks:
			- FAILSAFE
			
			- ROBLOXLOCKED (AttackValue: the model/an instance that was part of the model and was locked)
			- ROBLOXLOCKED_Descendant (AttackValue: a locked descendant that was added to the model)
			- ANCESTRY (AttackValue: new parent of the instance)
			- ANCESTRY_Exiting (No Attack Value; detected through DescendantRemoving/Destroying, so we can't know the new parent instantly)
			- DESCENDANT (AttackValue: child/descendant that was added to the instance)
			- EVENT_FAIL (No Attack Value)
				*(if event checks are disconnected)
			
			- PROPERTY_prop (AttackValue: value that property was changed to)
			- PROPERTY_FAIL_prop (AttackValue: value that property was changed to)
				*(fail to change back/defend and have to refit) 
			
				** ^^ for all recorded properties (prop == name of property)
	
	
	* TO UPDATE SETTING:
		* ADMData:UpdateSetting(setting, val)
		** Will refit to update
		** Current Settings:
			- WorldModelEnabled - Toggle WorldModel mode for model
			- LEVEL: Set Level (Speed of the refit)
				* 0 - Null (none)
				* 1 - Birth (Loop)
				* 2 - Life (Changed)
				* 3 - Death (Priority)
				* 4 - Ghost (Hypernullification)
				* 5 - Seraphim (Trinity) **DOES NOT EXIST (yet?)
			- FailsafeEnabled - If enabled: Every FailsafeDelay seconds, the model will refit automatically
			- FailsafeDelay - Failsafe Delay
	
	* TO MANUALLY REFIT MODEL:
		* ADMData:Refit()
	
	* TO STOP THE ANTIDEATH:
		* ADMData:Anima()
		* Sets ADMData.Stopped to TRUE
		** Destroys original model as well!
		
	* TO STOP ALL ANTIDEATHS:
		* YUREI:StopAll()
	
	* FINAL NOTES:
		* Please do not edit any property in your ADMData table or else it will break
		* Calling SetRecordedMCF/SetRecordedProperty inside a Changed event of an instance from the main model itself can sometimes break the defense/force the model to refit
		* It is recommended that you call these methods inside a runservice loop instead
	
	
	
	----------------------------------------------------------------------------------------------------------------------------------------
	Hypernull: function, ...
		- Can be used to run a function anywhere in order to force an overflow and nullify any and all event attacks against it
	Supernull: table STACKVALUES, function, ...
		- A defer priority (can only be used in certain situations since there's no way to detect if code has reached the defer stack overflow + has a chance of crashing)
		- STACKVALUES == {1, 2, ..., 8, 9, 10} - At what defer stack index/indices the function should run in (10 is reentrancy limit)
		- ^^ Can be reliably used if function was not already deferred beforehand
		
	ADMrefit: ADMData --> NEWCMODEL
		- Check if refitted already
		- CModel
		- CInst Properties // -- Disabled, it's probably not needed since setnilprops takes care of this
		- CInst Parent // -- Parented first before PriorityEvents to save time and not fire AncestryChanged
		- CInst PriorityEvents (ADMpriorityevents)
		- CInst Data
		- CModel CounterEvents (ADMmodelcounterevents)
		- Parent
		- Previous Instance
		- Call PostRefitFunc(ADMData, origmodel, cmodel)
	ADMrefitindiv: ADMData, lastcmodel, originst, origdata, lastcinst, cdata --> NEWCINST
		- Check if refitted already/needs to refit
		- New CInst
		- Set Properties // -- Disabled, it's probably not needed since setnilprops takes care of this
		- PriorityEvents (ADMpriorityevents)
		- Overwrite CInst Data
		- Parent
		- Previous Instance
		- CheckMain
		- Call PostReftIndivFunc(ADMData, originst, cinst)
		
		
	ADMmodelcounterevents: ADMData, cmodel
		- RefitIndivCounter
		- ModelCounter
		- WorkspaceCounter
		- ParentEvent
	ADMpriorityevents: ADMData, lastcmodel, originst, origdata, lastcinst, cdata
		- Property PriorityEvents
		- Counter PriorityEvent
		- Counter2 PriorityEvent
		- Parent PriorityEvent
	

	LoopEvents:
		- ADMSetNilProps
		- ADMCheckMain
		- ADMCheckOthers
		
		
		
]]



	----------------------------------------------------------------------------
	----------------------------------------------------------------------------

	local players = game:GetService("Players")
	local deb = game:GetService("Debris")
	local runs = game:GetService("RunService")
	local reps = game:GetService("ReplicatedStorage")
	local phs = game:GetService("PhysicsService")
	local ts = game:GetService("TweenService")
	local chatsrv = game:GetService("Chat")
	local txtsrv = game:GetService("TextService")
	local lighting = game:GetService("Lighting")
	local hs = game:GetService("HttpService")
	local sss = game:GetService("ServerScriptService")
	local cols = game:GetService("CollectionService")
	local coregui = game:GetService("CoreGui")

	local rnd = Random.new(os.clock())
	local heartbeat = runs.Heartbeat
	local stepped = runs.Stepped

	local defer = function(...) pcall(task.defer, ...) end

--[[ ----------------------------------

			-- INITIAL --

---------------------------------- ]]--
	--local CSF = require(script.CSF:Clone())()
	local YUREI = {}


--[[ ----------------------------------

		-- THE HEADACHE PART --

---------------------------------- ]]--


	---------------- nulls ----------------
	local HYPF = Instance.new("BindableFunction")
	function Hypernull(func, ...)
		HYPF.OnInvoke = function(...)
			if pcall(HYPF.Invoke, HYPF, ...) == false then
				func(...)
			end
		end
		if pcall(HYPF.Invoke, HYPF, ...) == false then
			func(...) return
		end
	end

	local SNLimit = 80
	function Supernull(IND, func, ...)
		local amount = 0
		local MAX = math.max(unpack(IND))
		local overflow
		overflow = function(...)
			amount = amount + 1
			if table.find(IND, amount) then
				func(...)
			end
			if amount == MAX then
				return
			end
			defer(overflow, ...)
		end
		defer(overflow, ...)
	end




	---------------- VARIABLES ----------------

	local ADModels = {}
	YUREI.ADModels = ADModels
--[[
ADModels = {
	[OriginalModel] = {
		
		OrigModel = OriginalModel
		OrigPrimaryPart = part
		ModelCFrame = cframe
		Parent = parent
		
		OrigInstances = {
			[OriginalInst] = {
				Properties = {
					Transparency = Transparency
					Color = Color
					Size = Size
					etc...
					
					** OFFSET FROM MODEL INSTEAD OF ACTUAL CFRAME; **PRIMRAYPART does not have PartCFrames here, its cframe is the ModelCFrame instead
					PartCFrames = {
						["Offset"] = CFrame (offset from primarypart)
						["Offset2"] = CFrame (offset from ["Offset"])
					}
				}
				OrigParent = parent (also an original inst)
				
				-- Clone Save (without descendants) (for not having to inst:clearallchildren everytime an individual instance is refitted)
				CloneSave = clone
				
			}
		}
		
		-- POST-REFIT FUNCTION (called when the model or an instance in the model is refitted)
		-- Can be set after initializing the antideath
		-- Passed Arguments: ADMData, OrigModel/OrigInst, New CModel/New CInst
		
		PostRefitFunc = function(ADMData, origmodel, cmodel) end
		
		
		--------------------------------------------------------------------------------------------------------------------------------------------------------
		--------------------------------------------------------------------------------------------------------------------------------------------------------
		
		-- An originst reference table (will be nil if it is not part of the model/if the CInst has already been refitted into a new CInst)
		-- This is needed since CInstances needs to use the OrigInst as the key instead of the CInst
		CInstRef = {
			[CInst] = OriginalInst
		}
		
		CModel = model
		CModelEvents = {
			RefitIndivCounter = Event
			Counter = Event
			
			ParentEvent = Event
		}
		CInstances = {
			[OriginalInst] = {
				CInst = inst
				CEvents = {
					Transparency = Event
					Color = Event
					Size = Event
					etc...
					
					CFrame = Event
					
					Counter = Event
					Parent = Event
				}
			}
		}
		
		
		----------------------------------------------------------------------------
		
		LoopEvents = {
			CSF Event (ADMsetnilprops),
			CSF Event (ADMsetprops),
			CSF Event (ADMsetparent),
			CSF Event (ADMcheckdisconnect),
			CSF Event (ADMcheckother),
		}
		
		RefitFailsafe = os.clock()
		
		----------------------------------------------------------------------------
		-- SETTINGS
		WorldModelEnabled = bool
		LEVEL = num
		FailsafeEnabled = bool
		FailsafeDelay = num
		
		----------------------------------------------------------------------------
		-- METHODS
		ADMData:AddInst(instance, parent) --> OrigData
		ADMData:RemoveInst(instance)
		ADMData:GetCloneInst(instance)
		
		ADMData:GetRecordedMCF() --> MCF
		ADMData:SetRecordedMCF(cframe)
		ADMData:GetRecordedProperty(instance, property) --> val
		ADMData:SetRecordedProperty(instance, property, val)
		
		ADMData:Refit()
		
		ADM:GetSetting(setting) --> val
		ADM:UpdateSetting(setting, val)
		
		ADMData:SetPostRefitFunc(function)
		ADMData:SetAttackedFunc(function)
		
		ADMData:Anima()
		
		----------------------------------------------------------------------------
		ADMData.Stopped = bool
		
		
	}


}
]]
	----------------------------------------------------------------------------
	----------------------------------------------------------------------------

	---------------- FUNCTIONS ----------------
	-- Only save certain properties for each instance type
	local RECORDEDPROPERTIES = {
		BasePart = {
			PROPERTIES = {"Anchored", "Transparency", "Material", "MaterialVariant", "Color", "Reflectance", "Size", "CFrame", "CanQuery", "CanTouch", "CanCollide", "PivotOffset"},
			SUBCLASSES = {
				Part = {
					PROPERTIES = {"Shape"}
				},
				MeshPart = {
					PROPERTIES = {"MeshId", "TextureID"}
				},
				UnionOperation = {
					PROPERTIES = {"UsePartColor"}
				}
			}
		},
		DataModelMesh = {
			PROPERTIES = {"Scale", "Offset", "VertexColor"},
			SUBCLASSES = {
				SpecialMesh = {
					PROPERTIES = {"MeshType", "MeshId", "TextureId"}
				}
			}
		},
		Decal = {
			PROPERTIES = {"Transparency", "Color3", "Texture", "Face"},
			SUBCLASSES = {
				Texture = {
					PROPERTIES = {"StudsPerTileU", "StudsPerTileV", "OffsetStudsU", "OffsetStudsV"}
				},	
			}
		},
	}
	local function PropsInitializer(originst, props, origprim)

		-- subclass recursion
		local function recursiveSub(CLASS, Data)
			if originst:IsA(CLASS) then
				for _, prop in Data.PROPERTIES do
					if CLASS == "BasePart" then
						if prop == "Anchored" then
							props[prop] = true
							continue
						elseif prop == "CFrame" then
							if originst ~= origprim then -- If not PrimaryPart (PrimaryPart CFrame data is saved as ModelCFrame)
								props.PartCFrames = {
									["Offset"] = origprim.CFrame:ToObjectSpace(originst.CFrame),
									["Offset2"] = CFrame.new()
								}
							end
							continue
						end
					end
					props[prop] = originst[prop]
				end
				if Data.SUBCLASSES then
					for SUBCLASS, SubData in Data.SUBCLASSES do
						recursiveSub(SUBCLASS, SubData)
					end
				end
			end
		end
		for CLASS, Data in RECORDEDPROPERTIES do
			recursiveSub(CLASS, Data)
		end
	end
	function YUREI:Initialize(origmodel, prim, parent)
		if ADModels[origmodel] then return end
		if parent ~= workspace and parent:IsDescendantOf(workspace) == false then
			error(origmodel.Name.."'s desired parent "..parent.." is not part of workspace!")
		end

		origmodel.Parent = nil
		origmodel.PrimaryPart = prim

		-- ORIGMODEL DATA
		local ADMData = {}
		ADMData.OrigModel = origmodel
		ADMData.OrigPrimaryPart = prim
		ADMData.ModelCFrame = prim.CFrame
		ADMData.Parent = parent

		-- SETTINGS
		ADMData.LEVEL = 1
		ADMData.WorldModelEnabled = false
		ADMData.FailsafeEnabled = true
		ADMData.FailsafeDelay = 0.423


		-- ORIGINST DATA
		local originsttable = {}
		for i, originst in origmodel:GetDescendants() do
			originst.Archivable = true
			local origdata = {}

			-- Properties
			local props = {}
			PropsInitializer(originst, props, prim)
			origdata.Properties = props

			-- Other
			origdata.OrigParent = originst.Parent

			-- Clone Save (without descendants) (for not having to inst:clearallchildren everytime an individual instance is refitted)
			local clone = originst:Clone()
			for a, b in clone:GetChildren() do
				b:Destroy()
			end
			origdata.CloneSave = clone

			originsttable[originst] = origdata

		end
		ADMData.OrigInstances = originsttable


		ADMData.PostRefitFunc = function(ADMData, ORIG, CLONE) end
		ADMData.AttackedFunc = function(ADMData, ORIG, CLONE, AttackType, AttackValue) end

		----------------------------------------------------------------------------
		----------------------------------------------------------------------------
		-- CLONES DATA

		-- CInstRef
		ADMData.CInstRef = {}

		-- CModel Data
		ADMData.CModel = Instance.new("Model")
		ADMData.CModelEvents = {}

		-- CInst Data
		local cinsttable = {}
		for originst, data in originsttable do
			cinsttable[originst] = {
				CInst = originsttable[originst].CloneSave:Clone(),
				CEvents = {},
			}
		end
		ADMData.CInstances = cinsttable


		----------------------------------------------------------------------------
		-- LOOP CONNECTIONS
		local loopevents = {}

		-- Functions
		local function first()
			if ADMData.LEVEL == 0 then
				ADMsetnilprops(ADMData)
				return
			end
			pcall(ADMcheckmain, ADMData)
			if ADMData.LEVEL == 4 then
				Supernull({SNLimit}, function()
					pcall(ADMcheckmain, ADMData)
				end)
			end
		end
		local function second()
			if ADMData.LEVEL == 0 then return end
			ADMcheckothers(ADMData)
		end

		-- PRELOOP
		do
			local function PreLoops(func)
				local t1func = function()
					while ADMData.Stopped ~= true and ADMData.LEVEL == 4 do
						func()
						wait()
					end
				end
				local t2func = function()
					while ADMData.Stopped ~= true and ADMData.LEVEL == 4 do
						func()
						task.wait()
					end
				end
				local thread1 = coroutine.create(t1func)
				local thread2 = coroutine.create(t2func)
				coroutine.close(thread1)
				coroutine.close(thread2)

				local ThreadChecker
				ThreadChecker = heartbeat:Connect(function()
					if ADMData.Stopped == true then
						ThreadChecker:Disconnect()
						return
					end
					if ADMData.LEVEL ~= 4 then return end

					-- Script Timeout protection
					if coroutine.status(thread1) == "dead" then
						thread1 = coroutine.create(t1func)
						coroutine.resume(thread1)
					end
					if coroutine.status(thread2) == "dead" then
						thread2 = coroutine.create(t2func)
						coroutine.resume(thread2)
					end
				end)
			end
			--PreLoops(first)
		end

		-- RUNSERVICE
		do
			local RS = {}

			-- HEARTBEAT
			local function HeartbeatP()
				if ADMData.LEVEL ~= 3 then return end
				RS.HeartbeatP:Disconnect()
				RS.HeartbeatP = heartbeat:Connect(HeartbeatP)
				first()
			end
			RS.Heartbeat = heartbeat:Connect(first)
			RS.HeartbeatP = heartbeat:Connect(HeartbeatP)

			RS.SecondaryCheck = heartbeat:Connect(second)


			-- STEPPED
			local function SteppedP()
				if ADMData.LEVEL ~= 3 then return end
				RS.SteppedP:Disconnect()
				RS.SteppedP = stepped:Connect(SteppedP)
				first()
			end
			RS.Stepped = stepped:Connect(function()
				if ADMData.LEVEL ~= 3 then return end
				first()
			end)
			RS.SteppedP = stepped:Connect(SteppedP)

			loopevents.RUNSERVICE = RS
		end

		-- TWEENP
		do
			local function TWEENP(func)
				local Object = Instance.new("NumberValue")
				Object:Destroy()
				local TW = {}
				TW.Object = Object
				TW.Event = Object.Changed:Connect(function()
					if ADMData.LEVEL == 3 or ADMData.LEVEL == 4 then
						func()
					end
				end)
				TW.Tween = ts:Create(
					Object,
					TweenInfo.new(20, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, -1, true),
					{Value = 9e9}
				)
				TW.Tween:Play()
				return TW
			end
			loopevents.TWEEN = TWEENP(first)
		end

		ADMData.LoopEvents = loopevents
		ADMData.RefitFailsafe = os.clock()
		ADMData.Stopped = false


		--------------------------------------------------------------------------------------------------------------------------------------------------------
		--------------------------------------------------------------------------------------------------------------------------------------------------------
		-- METHODS
		function ADMData:AddInst(originst, origparent)

			-- Check if parameters are correct
			if origparent == nil or (origparent ~= origmodel and origparent:IsDescendantOf(origmodel) == false) then
				error(tostring(origparent).." is not part of the Original Model!")
			end
			originst.Parent = origparent

			-- INITIALIZE
			originst.Archivable = true
			local origdata = {}

			-- Properties
			local props = {}
			PropsInitializer(originst, props, prim)
			origdata.Properties = props

			-- Other
			origdata.OrigParent = originst.Parent

			-- Clone Save (without descendants) (for not having to inst:clearallchildren everytime an individual instance is refitted)
			local clone = originst:Clone()
			for a, b in clone:GetChildren() do
				b:Destroy()
			end
			origdata.CloneSave = clone

			originsttable[originst] = origdata


			----------------------------------------------------------------------------
			-- CINSTANCES
			local cinsttable = ADMData.CInstances
			local cinstref = ADMData.CInstRef
			local cinst = clone:Clone()
			local cevents = {}
			local cdata = {
				CInst = cinst,
				CEvents = cevents,
			}
			cinsttable[originst] = cdata
			cinstref[cinst] = originst

			-- Refit
			ADMrefitindiv(ADMData, ADMData.CModel, originst, origdata, cinst, cdata)


			print("ADMODELS // ADDED: OrigModel - ", origmodel, "; OrigInst - ", originst, "; OrigParent - ", origparent)
			-- Recurse
			for i, origdesc in originst:GetChildren() do
				ADMData:AddInst(ADMData, origdesc, originst)
			end
			return origdata
		end
		function ADMData:RemoveInst(originst)

			-- Recurse
			for i, origdesc in originst:GetChildren() do
				ADMData:RemoveInst(ADMData, origdesc)
			end

			-- Clear OrigData
			local origdata = originsttable[originst]
			if origdata == nil then
				error(tostring(originst).." is not part of the Original Model!")
			end
			originsttable[originst] = nil

			origdata.CloneSave:Destroy()
			originst:Destroy()



			-- Clear CData
			local cinsttable = ADMData.CInstances
			local cinstref = ADMData.CInstRef

			local cdata = cinsttable[originst]

			if cdata then
				local cinst = cdata.CInst

				cinsttable[originst] = nil
				cinstref[cinst] = nil
				for name, event in cdata.CEvents do
					event:Disconnect()
				end

				pcall(function()
					cinst:Destroy()
				end)
				pcall(function()
					deb:AddItem(cinst, 0)
				end)
			end

			print("ADMODELS // REMOVED: OrigModel - ", ADMData.OrigModel, "; OrigInst - ", originst, "; OrigParent - ", origdata.OrigParent)

		end
		function ADMData:GetCloneInst(originst)
			if originst == origmodel then
				return ADMData.CModel
			end

			local origdata = originsttable[originst]
			if origdata == nil then
				error(tostring(originst).." is not part of the Original Model!")
			end
			local cinsttable = ADMData.CInstances
			local cdata = cinsttable[originst]

			return cdata.CInst
		end


		function ADMData:GetRecordedMCF()
			return ADMData.ModelCFrame
		end
		function ADMData:SetRecordedMCF(modelcframe)
			local origprim = ADMData.OrigPrimaryPart
			local cinsttable = ADMData.CInstances

			ADMData.ModelCFrame = modelcframe
			originsttable[origprim].CloneSave.CFrame = modelcframe
			pcall(function()
				cinsttable[origprim].CInst.CFrame = modelcframe
			end)


			for originst, origdata in originsttable do
				local cdata = cinsttable[originst]
				local pcfs = origdata.Properties.PartCFrames
				if pcfs ~= nil then
					local cf = modelcframe * pcfs.Offset * pcfs.Offset2
					origdata.CloneSave.CFrame = cf
					pcall(function()
						cdata.CInst.CFrame = cf
					end)
				end
			end
		end


		function ADMData:GetRecordedProperty(originst, prop)
			local origdata = originsttable[originst]
			if origdata == nil then
				error(tostring(originst).." is not part of the Original Model!")
			end

			local origprim = ADMData.OrigPrimaryPart
			local props = origdata.Properties
			if originst:IsA("BasePart") then
				if prop == "CFrameFINAL" then
					if originst == origprim then
						return ADMData:GetRecordedMCF()
					else
						local pcfs = props.PartCFrames
						return ADMData:GetRecordedMCF() * pcfs.Offset * pcfs.Offset2
					end
				elseif originst ~= origprim then
					if prop == "CFrameOffset" then
						return props.PartCFrames.Offset
					elseif prop == "CFrameOffset2" then
						return props.PartCFrames.Offset2
					end
				end
			end
			if props[prop] == nil then
				error(prop.." is not a valid Property of "..tostring(originst).."!")
			else
				return props[prop]
			end
		end
		function ADMData:SetRecordedProperty(originst, prop, val)
			local origdata = originsttable[originst]
			if origdata == nil then
				error(tostring(originst).." is not part of the Original Model!")
			end

			local props = origdata.Properties
			local clonesave = origdata.CloneSave

			local cinsttable = ADMData.CInstances
			local cinst = cinsttable[originst].CInst


			if originst:IsA("BasePart") then
				if prop == "CFrameOffset" then
					local pcfs = props.PartCFrames
					pcfs.Offset = val

					local cf = ADMData.ModelCFrame * val * pcfs.Offset2
					clonesave.CFrame = cf
					pcall(function()
						cinst.CFrame = cf
					end)

					return
				elseif prop == "CFrameOffset2" then
					local pcfs = props.PartCFrames
					pcfs.Offset2 = val

					local cf = ADMData.ModelCFrame * pcfs.Offset * val
					clonesave.CFrame = cf
					pcall(function()
						cinst.CFrame = cf
					end)

					return
				elseif prop == "Size" then
					local val = val
					if val == Vector3.new() then
						val = Vector3.new(0.05, 0.05, 0.05) -- No crash pls
					end
					props[prop] = val

					clonesave[prop] = val
					pcall(function()
						cinst[prop] = val
					end)

					return
				elseif originst:IsA("MeshPart") and prop == "MeshId" then
					error(prop.." is not a valid Property of "..tostring(originst).."!")
				end
			end
			if props[prop] == nil then
				error(prop.." is not a valid Property of "..tostring(originst).."!")
			end

			props[prop] = val

			clonesave[prop] = val
			pcall(function()
				cinst[prop] = val
			end)
		end


		function ADMData:SetPostRefitFunc(func)
			ADMData.PostRefitFunc = function(...) pcall(func, ...) end
		end
		function ADMData:SetAttackedFunc(func)
			ADMData.AttackedFunc = function(...) pcall(func, ...) end
		end

		function ADMData:Refit()
			ADMrefit(ADMData, ADMData.CModel)
		end

		function ADMData:GetSetting(setting)
			if setting ~= "WorldModelEnabled" and setting ~= "LEVEL" and setting ~= "FailsafeEnabled" and setting ~= "FailsafeDelay" then
				error("Invalid setting for "..origmodel.Name.."!")
			end
			return ADMData[setting]
		end
		function ADMData:UpdateSetting(setting, val)
			if setting ~= "WorldModelEnabled" and setting ~= "LEVEL" and setting ~= "FailsafeEnabled" and setting ~= "FailsafeDelay" then
				error("Invalid setting for "..origmodel.Name.."!")
			end
			ADMData[setting] = val
			ADMData:Refit()
			print("ADMODELS // UPDATED SETTING: OrigModel - ", origmodel, "; Setting - ", setting, "; Value - ", val)
		end

		function ADMData:Anima()
			local loopevents = ADMData.LoopEvents
			for name, event in loopevents.RUNSERVICE do
				event:Disconnect()
			end
			local TPData = loopevents.TWEEN
			TPData.Event:Disconnect()
			TPData.Tween:Cancel()
			TPData.Object:Destroy()

			pcall(function()
				origmodel:Destroy()
			end)

			local cmodel = ADMData.CModel
			ADMData.CModel = nil
			pcall(function()
				for name, event in ADMData.CModelEvents do
					event:Disconnect()
				end
			end)
			pcall(function()
				for originst, origdata in ADMData.OrigInstances do
					local clonesave = origdata.CloneSave
					origdata.Archivable = false
					origdata.CloneSave:Destroy()
				end
			end)
			pcall(function()
				local cinstref = ADMData.CInstRef
				for originst, cdata in ADMData.CInstances do
					local cinst = cdata.CInst

					cinsttable[originst] = nil
					cinstref[cinst] = nil
					for name, event in cdata.CEvents do
						event:Disconnect()
					end

					pcall(function()
						cdata.CInst:Destroy()
					end)
				end
			end)
			pcall(function()
				cmodel:Destroy()
			end)
			ADMData.Stopped = true
			ADModels[origmodel] = nil
			print("ADMODELS // STOPPED: OrigModel - ", origmodel)
		end


		----------------------------------------------------------------------------
		-- FINAL
		ADModels[origmodel] = ADMData
		ADMsetnilprops(ADMData)
		ADMrefit(ADMData, ADMData.CModel, false)
		ADMcheckmain(ADMData)

		return ADMData
	end

	function YUREI:StopAll()
		for origmodel, ADMData in YUREI.ADModels do
			ADMData:Anima()
		end
		ADModels = {}
		YUREI.ADModels = ADModels
	end






	--------------------------------------------------------------------------------------------------------------------------------------------------------
	--------------------------------------------------------------------------------------------------------------------------------------------------------
	---------------- OUTSIDE FUNCTIONS FOR THE DEFENSE (do not touch) ----------------




	function ADMrefit(ADMData, lastcmodel)
		if ADMData.CModel ~= lastcmodel then return end -- If already refitted (new CModel)

		-- ADMODELS: Previous Instances reference
		local lastcmodelevents = ADMData.CModelEvents
		local lastcinsttable = ADMData.CInstances

		-- Disconnect first
		for name, event in lastcmodelevents do
			event:Disconnect()
		end
		for originst, cdata in lastcinsttable do
			for name, event in cdata.CEvents do
				event:Disconnect()
			end
		end

		-- ADMODELS: refit
		----------------------------------------------------------------------------
		-- References
		local origmodel = ADMData.OrigModel
		local originsttable = ADMData.OrigInstances
		local origprim = ADMData.OrigPrimaryPart

		-- New References
		local cmodelevents = {}
		local cinstref = {}
		local cinsttable = {}
		ADMData.CModelEvents = cmodelevents
		ADMData.CInstRef = cinstref
		ADMData.CInstances = cinsttable

		----------------------------------------------------------------------------
		-- New CModel
		local cmodel
		if ADMData.WorldModelEnabled == false then
			cmodel = Instance.new("Sparkles")--Instance.new("Model")--Instance.new(InstanceTable[rnd:NextInteger(1, #InstanceTable)])
			cmodel.Enabled = false
		else
			cmodel = Instance.new("WorldModel")
		end
		ADMData.CModel = cmodel





		----------------------------------------------------------------------------
		-- New CInstances
		for i, originst in origmodel:GetDescendants() do -- loop through descendants instead of originsttable (since getdescendants is in descending order, quite convenient lol)
			local origdata = originsttable[originst]

			-- Clone
			local cinst = origdata.CloneSave:Clone()

			-- CInst Data
			local cdata = {
				CInst = cinst,
				CEvents = {},
			}
			cinsttable[originst] = cdata

			-- CInstRef
			cinstref[cinst] = originst


			-- PriorityEvents
			-- Parent first so the ancestrychanged priority doesn't fire
			local origparent = origdata.OrigParent
			if origparent == origmodel then
				cinst.Parent = cmodel
			else
				cinst.Parent = cinsttable[origparent].CInst
			end
			if ADMData.LEVEL ~= 0 and ADMData.LEVEL ~= 1 then
				ADMpriorityevents(ADMData, cmodel, originst, origdata, cinst, cdata)
			end

		end



		----------------------------------------------------------------------------
		-- New CModel Priority Events
		if ADMData.LEVEL == 3 or ADMData.LEVEL == 4 then
			ADMmodelcounterevents(ADMData, cmodel)
		end


		----------------------------------------------------------------------------
		-- FINAL

		cmodel.Name = origmodel.Name.." (ã‚†ã�†ã‚Œã�„)"
		if ADMData.LEVEL == 0 or ADMData.LEVEL == 1 or ADMData.LEVEL == 2 then
			cmodel.Parent = ADMData.Parent
		elseif ADMData.LEVEL == 3 then
			defer(ADMcheckmain, ADMData)
			cmodel.Parent = ADMData.Parent
			pcall(ADMcheckmain, ADMData)
			defer(ADMcheckmain, ADMData)
		elseif ADMData.LEVEL == 4 then
			defer(ADMcheckmain, ADMData)

			Hypernull(function()
				cmodel.Parent = ADMData.Parent
			end)

			pcall(ADMcheckmain, ADMData)

			defer(ADMcheckmain, ADMData)
		end


		----------------------------------------------------------------------------
		-- ADMODELS: Previous Instances
		for originst, cdata in lastcinsttable do
			local cinst = cdata.CInst
			pcall(function()
				cinst:Destroy()
			end)
			pcall(function()
				deb:AddItem(cinst, 0)
			end)
		end
		pcall(function()
			lastcmodel:Destroy()
		end)
		pcall(function()
			deb:AddItem(lastcmodel, 0)
		end)

		coroutine.wrap(ADMData.PostRefitFunc)(ADMData, origmodel, cmodel)

		return cmodel
	end

	function ADMrefitindiv(ADMData, lastcmodel, originst, origdata, lastcinst, cdata)
		local cinstref = ADMData.CInstRef

		-- 1. If model was already refitted/is going to refit
		-- 2. If instance was already refitted/is going to refit
		if ADMData.CModel ~= lastcmodel or cinstref[lastcinst] == nil then return end

		if CSF:IsRobloxLocked(lastcmodel) or CSF:IsRobloxLocked(lastcinst) then
			ADMrefit(ADMData, lastcmodel) return
		end
		if lastcmodel.Parent ~= ADMData.Parent or lastcmodel:FindFirstAncestorWhichIsA("ViewportFrame") or lastcmodel:FindFirstAncestorWhichIsA("Camera") then
			ADMrefit(ADMData, lastcmodel) return
		end
		local cinsttable = ADMData.CInstances
		local lastcevents = cdata.CEvents

		-- Disconnect first
		cinstref[lastcinst] = nil
		for i, event in lastcevents do
			event:Disconnect()
		end

		-- New CInst
		local cinst = origdata.CloneSave:Clone()

		-- Overwrite
		cdata.CInst = cinst
		cdata.CEvents = {}
		cinstref[cinst] = originst

		-- Priority
		if ADMData.LEVEL ~= 0 and ADMData.LEVEL ~= 1 then
			ADMpriorityevents(ADMData, lastcmodel, originst, origdata, cinst, cdata)
		end



		-- Parent
		local origparent = origdata.OrigParent
		local cparent
		if origparent == ADMData.OrigModel then
			cparent = lastcmodel
		else
			cparent = cinsttable[origparent].CInst
		end
		if ADMData.LEVEL == 0 or ADMData.LEVEL == 1 or ADMData.LEVEL == 2 then
			cinst.Parent = cparent
		elseif ADMData.LEVEL == 3 then
			defer(ADMcheckmain, ADMData)
			cinst.Parent = cparent
			pcall(ADMcheckmain, ADMData)
			defer(ADMcheckmain, ADMData)
		elseif ADMData.LEVEL == 4 then
			defer(ADMcheckmain, ADMData)

			Hypernull(function()
				cinst.Parent = cparent
			end)

			pcall(ADMcheckmain, ADMData)

			defer(ADMcheckmain, ADMData)
		end

		-- Previous Instance
		pcall(function()
			lastcinst:Destroy()
		end)
		pcall(function()
			deb:AddItem(lastcinst, 0)
		end)

		coroutine.wrap(ADMData.PostRefitFunc)(ADMData, originst, cinst)

		return cinst
	end


	function ADMmodelcounterevents(ADMData, cmodel)
		-- References
		local origmodel = ADMData.OrigModel
		local originsttable = ADMData.OrigInstances
		local cinsttable = ADMData.CInstances

		local cinstref = ADMData.CInstRef
		local cmodelevents = ADMData.CModelEvents

		-- Model RefitIndivCounter
		local refitindivcounter
		function refitindivcounter(cinst)


			if CSF:IsRobloxLocked(cmodel) then
				local newcmodel = ADMrefit(ADMData, cmodel)
				if newcmodel ~= nil then -- if actually refitted
					ADMData.AttackedFunc(ADMData, origmodel, cmodel, "ROBLOXLOCKED", cmodel)
				end
				return
			end
			if CSF:IsRobloxLocked(cinst) then
				local orig = cinstref[cinst]
				local ATTACK
				if orig ~= nil then
					ATTACK = "ROBLOXLOCKED"
				else
					ATTACK = "ROBLOXLOCKED_Descendant"
				end

				local newcmodel = ADMrefit(ADMData, cmodel)
				if newcmodel ~= nil then -- if actually refitted
					ADMData.AttackedFunc(ADMData, origmodel, cmodel, ATTACK, cinst)
				end
				return
			end

			local Acmodelparent = cmodel.Parent
			if Acmodelparent ~= ADMData.Parent or cmodel:FindFirstAncestorWhichIsA("ViewportFrame") or cmodel:FindFirstAncestorWhichIsA("Camera") then
				local newcmodel = ADMrefit(ADMData, cmodel)
				if newcmodel ~= nil then -- if actually refitted
					ADMData.AttackedFunc(ADMData, origmodel, cmodel, "ANCESTRY", Acmodelparent)
				end
				return
			end
			if ADMData.LEVEL == 3 or ADMData.LEVEL == 4 then
				cmodelevents.RefitIndivCounter:Disconnect()
				cmodelevents.RefitIndivCounter = cmodel.DescendantRemoving:Connect(refitindivcounter)
			end

			local originst = cinstref[cinst]
			if originst ~= nil then
				local newcinst = ADMrefitindiv(ADMData, cmodel, originst, originsttable[originst], cinst, cinsttable[originst])
				if newcinst ~= nil then -- if actually refitted
					ADMData.AttackedFunc(ADMData, originst, cinst, "ANCESTRY_Exiting")
				end
			end

		end
		cmodelevents.RefitIndivCounter = cmodel.DescendantRemoving:Connect(refitindivcounter)

		-- Model CounterFunc
		local counter
		function counter(cinst)


			if CSF:IsRobloxLocked(cmodel) then
				local newcmodel = ADMrefit(ADMData, cmodel)
				if newcmodel ~= nil then -- if actually refitted
					ADMData.AttackedFunc(ADMData, origmodel, cmodel, "ROBLOXLOCKED", cmodel)
				end
				return
			end
			if CSF:IsRobloxLocked(cinst) then
				local orig = cinstref[cinst]
				local ATTACK
				if orig ~= nil then
					ATTACK = "ROBLOXLOCKED"
				else
					ATTACK = "ROBLOXLOCKED_Descendant"
				end

				local newcmodel = ADMrefit(ADMData, cmodel)
				if newcmodel ~= nil then -- if actually refitted
					ADMData.AttackedFunc(ADMData, origmodel, cmodel, ATTACK, cinst)
				end
				return
			end
			if ADMData.LEVEL == 3 or ADMData.LEVEL == 4 then
				cmodelevents.Counter:Disconnect()
				cmodelevents.Counter = cmodel.DescendantAdded:Connect(counter)
			end

			local originst = cinstref[cinst]
			if originst == nil and cinst:IsA("TouchTransmitter") == false --[[<-- wtf roblox accessory touchinterests]] then

				-- not sure if this is risky but if I can index the instance but not its parent (robloxlocked) then this will error :|
				if cinst.Parent == cmodel then
					local newcmodel = ADMrefit(ADMData, cmodel)
					if newcmodel ~= nil then -- if actually refitted
						ADMData.AttackedFunc(ADMData, origmodel, cmodel, "DESCENDANT", cinst)
					end
					return

				else -- Not direct child of the model

					local cinstP = cinst.Parent
					local originstP = cinstref[cinstP]
					if originstP ~= nil then
						local newcinst = ADMrefitindiv(ADMData, cmodel, originstP, originsttable[originstP], cinstP, cinsttable[originstP])
						if newcinst ~= nil then -- if actually refitted
							ADMData.AttackedFunc(ADMData, originstP, cinstP, "DESCENDANT", cinst)
						end
						return
					end
				end
			end
		end
		cmodelevents.Counter = cmodel.DescendantAdded:Connect(counter)


		-- Workspace Counter
		local wscounter
		function wscounter(d)
			if d == cmodel then
				if CSF:IsRobloxLocked(cmodel) then
					local newcmodel = ADMrefit(ADMData, cmodel)
					if newcmodel ~= nil then -- if actually refitted
						ADMData.AttackedFunc(ADMData, origmodel, cmodel, "ROBLOXLOCKED", cmodel)
					end
					return
				end

				local newcmodel = ADMrefit(ADMData, cmodel)
				if newcmodel ~= nil then -- if actually refitted
					ADMData.AttackedFunc(ADMData, origmodel, cmodel, "ANCESTRY_Exiting")
				end
				return
			else
				local originst = cinstref[d]
				if originst then


					if CSF:IsRobloxLocked(cmodel) then
						local newcmodel = ADMrefit(ADMData, cmodel)
						if newcmodel ~= nil then -- if actually refitted
							ADMData.AttackedFunc(ADMData, origmodel, cmodel, "ROBLOXLOCKED", cmodel)
						end
						return
					end
					if CSF:IsRobloxLocked(d) then
						local newcmodel = ADMrefit(ADMData, cmodel)
						if newcmodel ~= nil then -- if actually refitted
							ADMData.AttackedFunc(ADMData, origmodel, cmodel, "ROBLOXLOCKED", d)
						end
						return
					end

					local Acmodelparent = cmodel.Parent
					if Acmodelparent ~= ADMData.Parent or cmodel:FindFirstAncestorWhichIsA("ViewportFrame") or cmodel:FindFirstAncestorWhichIsA("Camera") then
						local newcmodel = ADMrefit(ADMData, cmodel)
						if newcmodel ~= nil then -- if actually refitted
							ADMData.AttackedFunc(ADMData, origmodel, cmodel, "ANCESTRY", Acmodelparent)
						end
						return
					end

					if ADMData.LEVEL == 3 or ADMData.LEVEL == 4 then
						cmodelevents.WSCounter:Disconnect()
						cmodelevents.WSCounter = workspace.DescendantRemoving:Connect(wscounter)
					end

					local newcinst = ADMrefitindiv(ADMData, cmodel, originst, originsttable[originst], d, cinsttable[originst])
					if newcinst ~= nil then -- if actually refitted
						ADMData.AttackedFunc(ADMData, originst, d, "ANCESTRY_Exiting")
					end
				else
					if ADMData.LEVEL == 3 or ADMData.LEVEL == 4 then
						cmodelevents.WSCounter:Disconnect()
						cmodelevents.WSCounter = workspace.DescendantRemoving:Connect(wscounter)
					end
				end
			end
		end
		cmodelevents.WSCounter = workspace.DescendantRemoving:Connect(wscounter)

		--Model ParentEvent
		local setparent
		function setparent()


			if CSF:IsRobloxLocked(cmodel) then
				local newcmodel = ADMrefit(ADMData, cmodel)
				if newcmodel ~= nil then -- if actually refitted
					ADMData.AttackedFunc(ADMData, origmodel, cmodel, "ROBLOXLOCKED", cmodel)
				end
				return
			end

			local Acmodelparent = cmodel.Parent
			if Acmodelparent ~= ADMData.Parent or cmodel:FindFirstAncestorWhichIsA("ViewportFrame") or cmodel:FindFirstAncestorWhichIsA("Camera") then
				local newcmodel = ADMrefit(ADMData, cmodel)
				if newcmodel ~= nil then -- if actually refitted
					ADMData.AttackedFunc(ADMData, origmodel, cmodel, "ANCESTRY", Acmodelparent)
				end
				return
			end
			if ADMData.LEVEL == 3 or ADMData.LEVEL == 4 then
				cmodelevents.ParentEvent:Disconnect()
				cmodelevents.ParentEvent = cmodel.AncestryChanged:Connect(setparent)
			end
		end
		cmodelevents.ParentEvent = cmodel.AncestryChanged:Connect(setparent)

		cmodelevents.DestroyingEvent = cmodel.Destroying:Connect(function()
			if CSF:IsRobloxLocked(cmodel) then
				local newcmodel = ADMrefit(ADMData, cmodel)
				if newcmodel ~= nil then -- if actually refitted
					ADMData.AttackedFunc(ADMData, origmodel, cmodel, "ROBLOXLOCKED", cmodel)
				end
				return
			end

			local newcmodel = ADMrefit(ADMData, cmodel)
			if newcmodel ~= nil then -- if actually refitted
				ADMData.AttackedFunc(ADMData, origmodel, cmodel, "ANCESTRY_Exiting")
			end
			return
		end)
	end
	function ADMpriorityevents(ADMData, lastcmodel, originst, origdata, cinst, cdata)
		-- References
		local origmodel = ADMData.OrigModel
		local origparent = origdata.OrigParent
		local origprim = ADMData.OrigPrimaryPart
		local originsttable = ADMData.OrigInstances
		local props = origdata.Properties

		local cinsttable = ADMData.CInstances
		local cinstref = ADMData.CInstRef
		local cparent
		if origparent == origmodel then
			cparent = lastcmodel
		else
			cparent = cinsttable[origparent].CInst
		end
		local cevents = cdata.CEvents



		if originst == origprim then -- PrimaryPart CFrame
			local primsetcf
			function primsetcf()
				if CSF:IsRobloxLocked(cinst) then
					local newcmodel = ADMrefit(ADMData, lastcmodel)
					if newcmodel ~= nil then -- if actually refitted
						ADMData.AttackedFunc(ADMData, origmodel, lastcmodel, "ROBLOXLOCKED", cinst)
					end
					return
				end
				if ADMData.LEVEL == 3 then
					cevents.CFrame:Disconnect()
					cevents.CFrame = cinst:GetPropertyChangedSignal("CFrame"):Connect(primsetcf)
				end
				local cf = ADMData.ModelCFrame
				local Acf = cinst.CFrame
				if Acf == cf then return end

				if ADMData.LEVEL == 2 or ADMData.LEVEL == 3 then
					cinst.CFrame = cf
				elseif ADMData.LEVEL == 4 then
					Hypernull(function()
						cinst.CFrame = cf
					end)
					defer(function()
						if CSF:IsRobloxLocked(cinst) then
							local newcmodel = ADMrefit(ADMData, lastcmodel)
							if newcmodel ~= nil then -- if actually refitted
								ADMData.AttackedFunc(ADMData, origmodel, lastcmodel, "ROBLOXLOCKED", cinst)
							end
							return
						end
						local cf = ADMData.ModelCFrame
						local Acf = cinst.CFrame
						if Acf ~= cf then
							Hypernull(function()
								cinst.CFrame = cf
							end)
							if CSF:IsRobloxLocked(cinst) then
								local newcmodel = ADMrefit(ADMData, lastcmodel)
								if newcmodel ~= nil then -- if actually refitted
									ADMData.AttackedFunc(ADMData, origmodel, lastcmodel, "ROBLOXLOCKED", cinst)
								end
								return
							end

							local Acf2 = cinst.CFrame
							if Acf2 ~= cf then
								local newcinst = ADMrefitindiv(ADMData, lastcmodel, originst, origdata, cinst, cdata)
								ADMData.AttackedFunc(ADMData, originst, cinst, "PROPERTY_CFrame", Acf)
								if newcinst ~= nil then -- if actually refitted
									ADMData.AttackedFunc(ADMData, originst, cinst, "PROPERTY_FAIL_CFrame", Acf2)
								end
								return
							end
							ADMData.AttackedFunc(ADMData, originst, cinst, "PROPERTY_CFrame", Acf)
						end
					end)
				end
				if CSF:IsRobloxLocked(cinst) then
					local newcmodel = ADMrefit(ADMData, lastcmodel)
					if newcmodel ~= nil then -- if actually refitted
						ADMData.AttackedFunc(ADMData, origmodel, lastcmodel, "ROBLOXLOCKED", cinst)
					end
					return
				end

				local Acf2 = cinst.CFrame
				if Acf2 ~= cf then
					local newcinst = ADMrefitindiv(ADMData, lastcmodel, originst, origdata, cinst, cdata)
					ADMData.AttackedFunc(ADMData, originst, cinst, "PROPERTY_CFrame", Acf)
					if newcinst ~= nil then -- if actually refitted
						ADMData.AttackedFunc(ADMData, originst, cinst, "PROPERTY_FAIL_CFrame", Acf2)
					end
					return
				end
				ADMData.AttackedFunc(ADMData, originst, cinst, "PROPERTY_CFrame", Acf)
			end
			cevents.CFrame = cinst:GetPropertyChangedSignal("CFrame"):Connect(primsetcf)
		end
		if originst:IsA("MeshPart") then
			local setid
			function setid()
				if CSF:IsRobloxLocked(cinst) then
					local newcmodel = ADMrefit(ADMData, lastcmodel)
					if newcmodel ~= nil then -- if actually refitted
						ADMData.AttackedFunc(ADMData, origmodel, lastcmodel, "ROBLOXLOCKED", cinst)
					end
					return
				end
				if ADMData.LEVEL == 3 then
					cevents.MeshId:Disconnect()
					cevents.MeshId = cinst:GetPropertyChangedSignal("MeshId"):Connect(setid)
				end
				local Aid = cinst.MeshId
				if Aid == props.MeshId then return end

				if ADMData.LEVEL == 2 or ADMData.LEVEL == 3 then
					cinst:ApplyMesh(originst)
				elseif ADMData.LEVEL == 4 then
					Hypernull(function()
						cinst:ApplyMesh(originst)
					end)
					defer(function()
						if CSF:IsRobloxLocked(cinst) then
							local newcmodel = ADMrefit(ADMData, lastcmodel)
							if newcmodel ~= nil then -- if actually refitted
								ADMData.AttackedFunc(ADMData, origmodel, lastcmodel, "ROBLOXLOCKED", cinst)
							end
							return
						end
						local Aid = cinst.MeshId
						if Aid ~= props.MeshId then
							Hypernull(function()
								cinst:ApplyMesh(originst)
							end)
							if CSF:IsRobloxLocked(cinst) then
								local newcmodel = ADMrefit(ADMData, lastcmodel)
								if newcmodel ~= nil then -- if actually refitted
									ADMData.AttackedFunc(ADMData, origmodel, lastcmodel, "ROBLOXLOCKED", cinst)
								end
								return
							end

							local Aid2 = cinst.MeshId
							if Aid2 ~= props.MeshId then
								local newcinst = ADMrefitindiv(ADMData, lastcmodel, originst, origdata, cinst, cdata)
								ADMData.AttackedFunc(ADMData, originst, cinst, "PROPERTY_MeshId", Aid)
								if newcinst ~= nil then -- if actually refitted
									ADMData.AttackedFunc(ADMData, originst, cinst, "PROPERTY_FAIL_MeshId", Aid2)
								end
								return
							end
							ADMData.AttackedFunc(ADMData, originst, cinst, "PROPERTY_MeshId", Aid)
						end
					end)
				end
				if CSF:IsRobloxLocked(cinst) then
					local newcmodel = ADMrefit(ADMData, lastcmodel)
					if newcmodel ~= nil then -- if actually refitted
						ADMData.AttackedFunc(ADMData, origmodel, lastcmodel, "ROBLOXLOCKED", cinst)
					end
					return
				end

				local Aid2 = cinst.MeshId
				if Aid2 ~= props.MeshId then
					local newcinst = ADMrefitindiv(ADMData, lastcmodel, originst, origdata, cinst, cdata)
					ADMData.AttackedFunc(ADMData, originst, cinst, "PROPERTY_MeshId", Aid)
					if newcinst ~= nil then -- if actually refitted
						ADMData.AttackedFunc(ADMData, originst, cinst, "PROPERTY_FAIL_MeshId", Aid2)
					end
					return
				end
				ADMData.AttackedFunc(ADMData, originst, cinst, "PROPERTY_MeshId", Aid)
			end
			cevents.MeshId = cinst:GetPropertyChangedSignal("MeshId"):Connect(setid)
		end



		for prop, val in props do
			if originst:IsA("BasePart") and prop == "PartCFrames" then -- For non-PrimaryParts only
				local pcfs = val -- props.PartCFrames
				local setcf
				function setcf()
					if CSF:IsRobloxLocked(cinst) then
						local newcmodel = ADMrefit(ADMData, lastcmodel)
						if newcmodel ~= nil then -- if actually refitted
							ADMData.AttackedFunc(ADMData, origmodel, lastcmodel, "ROBLOXLOCKED", cinst)
						end
						return
					end
					if ADMData.LEVEL == 3 then
						cevents.CFrame:Disconnect()
						cevents.CFrame = cinst:GetPropertyChangedSignal("CFrame"):Connect(setcf)
					end
					local cf = ADMData.ModelCFrame * pcfs.Offset * pcfs.Offset2
					local Acf = cinst.CFrame
					if Acf == cf then return end

					if ADMData.LEVEL == 2 or ADMData.LEVEL == 3 then
						cinst.CFrame = cf
					elseif ADMData.LEVEL == 4 then
						Hypernull(function()
							cinst.CFrame = cf
						end)
						defer(function()
							if CSF:IsRobloxLocked(cinst) then
								local newcmodel = ADMrefit(ADMData, lastcmodel)
								if newcmodel ~= nil then -- if actually refitted
									ADMData.AttackedFunc(ADMData, origmodel, lastcmodel, "ROBLOXLOCKED", cinst)
								end
								return
							end
							local cf = ADMData.ModelCFrame * pcfs.Offset * pcfs.Offset2
							local Acf = cinst.CFrame
							if cinst.CFrame ~= cf then
								Hypernull(function()
									cinst.CFrame = cf
								end)
								if CSF:IsRobloxLocked(cinst) then
									local newcmodel = ADMrefit(ADMData, lastcmodel)
									if newcmodel ~= nil then -- if actually refitted
										ADMData.AttackedFunc(ADMData, origmodel, lastcmodel, "ROBLOXLOCKED", cinst)
									end
									return
								end

								local Acf2 = cinst.CFrame
								if Acf2 ~= cf then
									local newcinst = ADMrefitindiv(ADMData, lastcmodel, originst, origdata, cinst, cdata)
									ADMData.AttackedFunc(ADMData, originst, cinst, "PROPERTY_CFrame", Acf)
									if newcinst ~= nil then -- if actually refitted
										ADMData.AttackedFunc(ADMData, originst, cinst, "PROPERTY_FAIL_CFrame", Acf2)
									end
									return
								end
								ADMData.AttackedFunc(ADMData, originst, cinst, "PROPERTY_CFrame", Acf)
							end
						end)
					end
					if CSF:IsRobloxLocked(cinst) then
						local newcmodel = ADMrefit(ADMData, lastcmodel)
						if newcmodel ~= nil then -- if actually refitted
							ADMData.AttackedFunc(ADMData, origmodel, lastcmodel, "ROBLOXLOCKED", cinst)
						end
						return
					end

					local Acf2 = cinst.CFrame
					if Acf2 ~= cf then
						local newcinst = ADMrefitindiv(ADMData, lastcmodel, originst, origdata, cinst, cdata)
						ADMData.AttackedFunc(ADMData, originst, cinst, "PROPERTY_CFrame", Acf)
						if newcinst ~= nil then -- if actually refitted
							ADMData.AttackedFunc(ADMData, originst, cinst, "PROPERTY_FAIL_CFrame", Acf2)
						end
						return
					end
					ADMData.AttackedFunc(ADMData, originst, cinst, "PROPERTY_CFrame", Acf)
				end
				cevents.CFrame = cinst:GetPropertyChangedSignal("CFrame"):Connect(setcf)






			elseif (originst:IsA("BasePart") or originst:IsA("Decal") or originst:IsA("Texture")) and prop == "Transparency" then -- Floating point!!!!
				local settransparency
				function settransparency()
					if CSF:IsRobloxLocked(cinst) then
						local newcmodel = ADMrefit(ADMData, lastcmodel)
						if newcmodel ~= nil then -- if actually refitted
							ADMData.AttackedFunc(ADMData, origmodel, lastcmodel, "ROBLOXLOCKED", cinst)
						end
						return
					end
					if ADMData.LEVEL == 3 then
						cevents.Transparency:Disconnect()
						cevents.Transparency = cinst:GetPropertyChangedSignal("Transparency"):Connect(settransparency)
					end
					local tr = props.Transparency
					local Atr = cinst.Transparency
					if math.abs(Atr-tr) <= 0.05 then return end





					if ADMData.LEVEL == 2 or ADMData.LEVEL == 3 then
						cinst.Transparency = tr
					elseif ADMData.LEVEL == 4 then
						Hypernull(function()
							cinst.Transparency = tr
						end)
						defer(function()
							if CSF:IsRobloxLocked(cinst) then
								local newcmodel = ADMrefit(ADMData, lastcmodel)
								if newcmodel ~= nil then -- if actually refitted
									ADMData.AttackedFunc(ADMData, origmodel, lastcmodel, "ROBLOXLOCKED", cinst)
								end
								return
							end
							local tr = props.Transparency
							local Atr = cinst.Transparency
							if math.abs(Atr-tr) > 0.05 then
								Hypernull(function()
									cinst.Transparency = tr
								end)
								if CSF:IsRobloxLocked(cinst) then
									local newcmodel = ADMrefit(ADMData, lastcmodel)
									if newcmodel ~= nil then -- if actually refitted
										ADMData.AttackedFunc(ADMData, origmodel, lastcmodel, "ROBLOXLOCKED", cinst)
									end
									return
								end

								local Atr2 = cinst.Transparency
								if math.abs(Atr2-tr) > 0.05 then
									local newcinst = ADMrefitindiv(ADMData, lastcmodel, originst, origdata, cinst, cdata)
									ADMData.AttackedFunc(ADMData, originst, cinst, "PROPERTY_Transparency", Atr)
									if newcinst ~= nil then -- if actually refitted
										ADMData.AttackedFunc(ADMData, originst, cinst, "PROPERTY_FAIL_Transparency", Atr2)
									end
									return
								end
								ADMData.AttackedFunc(ADMData, originst, cinst, "PROPERTY_Transparency", Atr)
							end
						end)
					end
					if CSF:IsRobloxLocked(cinst) then
						local newcmodel = ADMrefit(ADMData, lastcmodel)
						if newcmodel ~= nil then -- if actually refitted
							ADMData.AttackedFunc(ADMData, origmodel, lastcmodel, "ROBLOXLOCKED", cinst)
						end
						return
					end

					local Atr2 = cinst.Transparency
					if math.abs(Atr2-tr) > 0.05 then
						local newcinst = ADMrefitindiv(ADMData, lastcmodel, originst, origdata, cinst, cdata)
						ADMData.AttackedFunc(ADMData, originst, cinst, "PROPERTY_Transparency", Atr)
						if newcinst ~= nil then -- if actually refitted
							ADMData.AttackedFunc(ADMData, originst, cinst, "PROPERTY_FAIL_Transparency", Atr2)
						end
						return
					end
					ADMData.AttackedFunc(ADMData, originst, cinst, "PROPERTY_Transparency", Atr)
				end
				cevents.Transparency = cinst:GetPropertyChangedSignal("Transparency"):Connect(settransparency)


			elseif typeof(val) == "Color3" then -- Floating point part 2
				local setcolor
				function setcolor()
					if CSF:IsRobloxLocked(cinst) then
						local newcmodel = ADMrefit(ADMData, lastcmodel)
						if newcmodel ~= nil then -- if actually refitted
							ADMData.AttackedFunc(ADMData, origmodel, lastcmodel, "ROBLOXLOCKED", cinst)
						end
						return
					end
					if ADMData.LEVEL == 3 then
						cevents[prop]:Disconnect()
						cevents[prop] = cinst:GetPropertyChangedSignal(prop):Connect(setcolor)
					end
					local color = props[prop]
					local Acolor = cinst[prop]
					if (math.abs(Acolor.R-color.R) <= 0.005) and (math.abs(Acolor.G-color.G) <= 0.005) and (math.abs(Acolor.B-color.B) <= 0.005) then return end




					if ADMData.LEVEL == 2 or ADMData.LEVEL == 3 then
						cinst[prop] = color
					elseif ADMData.LEVEL == 4 then
						Hypernull(function()
							cinst[prop] = color
						end)
						defer(function()
							if CSF:IsRobloxLocked(cinst) then
								local newcmodel = ADMrefit(ADMData, lastcmodel)
								if newcmodel ~= nil then -- if actually refitted
									ADMData.AttackedFunc(ADMData, origmodel, lastcmodel, "ROBLOXLOCKED", cinst)
								end
								return
							end
							local color = props[prop]
							local Acolor = cinst[prop]
							if (math.abs(Acolor.R-color.R) > 0.005) or (math.abs(Acolor.G-color.G) > 0.005) or (math.abs(Acolor.B-color.B) > 0.005) then
								Hypernull(function()
									cinst[prop] = color
								end)
								if CSF:IsRobloxLocked(cinst) then
									local newcmodel = ADMrefit(ADMData, lastcmodel)
									if newcmodel ~= nil then -- if actually refitted
										ADMData.AttackedFunc(ADMData, origmodel, lastcmodel, "ROBLOXLOCKED", cinst)
									end
									return
								end

								local Acolor2 = cinst[prop]
								if (math.abs(Acolor2.R-color.R) > 0.005) or (math.abs(Acolor2.G-color.G) > 0.005) or (math.abs(Acolor2.B-color.B) > 0.005) then
									local newcinst = ADMrefitindiv(ADMData, lastcmodel, originst, origdata, cinst, cdata)
									ADMData.AttackedFunc(ADMData, originst, cinst, "PROPERTY_"..prop, Acolor)
									if newcinst ~= nil then -- if actually refitted
										ADMData.AttackedFunc(ADMData, originst, cinst, "PROPERTY_FAIL_"..prop, Acolor2)
									end
									return
								end
								ADMData.AttackedFunc(ADMData, originst, cinst, "PROPERTY_"..prop, Acolor)
							end
						end)
					end
					if CSF:IsRobloxLocked(cinst) then
						local newcmodel = ADMrefit(ADMData, lastcmodel)
						if newcmodel ~= nil then -- if actually refitted
							ADMData.AttackedFunc(ADMData, origmodel, lastcmodel, "ROBLOXLOCKED", cinst)
						end
						return
					end

					local Acolor2 = cinst[prop]
					if (math.abs(Acolor2.R-color.R) > 0.005) or (math.abs(Acolor2.G-color.G) > 0.005) or (math.abs(Acolor2.B-color.B) > 0.005) then
						local newcinst = ADMrefitindiv(ADMData, lastcmodel, originst, origdata, cinst, cdata)
						ADMData.AttackedFunc(ADMData, originst, cinst, "PROPERTY_"..prop, Acolor)
						if newcinst ~= nil then -- if actually refitted
							ADMData.AttackedFunc(ADMData, originst, cinst, "PROPERTY_FAIL_"..prop, Acolor2)
						end
						return
					end
					ADMData.AttackedFunc(ADMData, originst, cinst, "PROPERTY_"..prop, Acolor)
				end
				cevents[prop] = cinst:GetPropertyChangedSignal(prop):Connect(setcolor)




			else -- Other properties
				if originst:IsA("MeshPart") and prop == "MeshId" then continue end

				local setprop
				function setprop()
					if CSF:IsRobloxLocked(cinst) then
						local newcmodel = ADMrefit(ADMData, lastcmodel)
						if newcmodel ~= nil then -- if actually refitted
							ADMData.AttackedFunc(ADMData, origmodel, lastcmodel, "ROBLOXLOCKED", cinst)
						end
						return
					end
					if ADMData.LEVEL == 3 then
						cevents[prop]:Disconnect()
						cevents[prop] = cinst:GetPropertyChangedSignal(prop):Connect(setprop)
					end
					local val = props[prop]
					local Aval = cinst[prop]
					if Aval == val then return end




					if ADMData.LEVEL == 2 or ADMData.LEVEL == 3 then
						cinst[prop] = val
					elseif ADMData.LEVEL == 4 then
						Hypernull(function()
							cinst[prop] = val
						end)
						defer(function()
							if CSF:IsRobloxLocked(cinst) then
								local newcmodel = ADMrefit(ADMData, lastcmodel)
								if newcmodel ~= nil then -- if actually refitted
									ADMData.AttackedFunc(ADMData, origmodel, lastcmodel, "ROBLOXLOCKED", cinst)
								end
								return
							end
							local val = props[prop]
							local Aval = cinst[prop]
							if Aval ~= val then
								Hypernull(function()
									cinst[prop] = val
								end)
								if CSF:IsRobloxLocked(cinst) then
									local newcmodel = ADMrefit(ADMData, lastcmodel)
									if newcmodel ~= nil then -- if actually refitted
										ADMData.AttackedFunc(ADMData, origmodel, lastcmodel, "ROBLOXLOCKED", cinst)
									end
									return
								end

								local Aval2 = cinst[prop]
								if Aval2 ~= val then
									local newcinst = ADMrefitindiv(ADMData, lastcmodel, originst, origdata, cinst, cdata)
									ADMData.AttackedFunc(ADMData, originst, cinst, "PROPERTY_"..prop, Aval)
									if newcinst ~= nil then -- if actually refitted
										ADMData.AttackedFunc(ADMData, originst, cinst, "PROPERTY_FAIL_"..prop, Aval2)
									end
									return
								end
								ADMData.AttackedFunc(ADMData, originst, cinst, "PROPERTY_"..prop, Aval)
							end
						end)
					end
					if CSF:IsRobloxLocked(cinst) then
						local newcmodel = ADMrefit(ADMData, lastcmodel)
						if newcmodel ~= nil then -- if actually refitted
							ADMData.AttackedFunc(ADMData, origmodel, lastcmodel, "ROBLOXLOCKED", cinst)
						end
						return
					end

					local Aval2 = cinst[prop]
					if Aval2 ~= val then
						local newcinst = ADMrefitindiv(ADMData, lastcmodel, originst, origdata, cinst, cdata)
						ADMData.AttackedFunc(ADMData, originst, cinst, "PROPERTY_"..prop, Aval)
						if newcinst ~= nil then -- if actually refitted
							ADMData.AttackedFunc(ADMData, originst, cinst, "PROPERTY_FAIL_"..prop, Aval2)
						end
						return
					end
					ADMData.AttackedFunc(ADMData, originst, cinst, "PROPERTY_"..prop, Aval)
				end
				cevents[prop] = cinst:GetPropertyChangedSignal(prop):Connect(setprop)
			end
		end





		if ADMData.LEVEL == 3 or ADMData.LEVEL == 4 then
			-- Instance Counter
			local counter
			function counter(d)

				if CSF:IsRobloxLocked(cinst) then
					local newcmodel = ADMrefit(ADMData, lastcmodel)
					if newcmodel ~= nil then -- if actually refitted
						ADMData.AttackedFunc(ADMData, origmodel, lastcmodel, "ROBLOXLOCKED", cinst)
					end
					return
				end
				if CSF:IsRobloxLocked(d) then
					local orig = cinstref[d]
					local ATTACK
					if orig ~= nil then
						ATTACK = "ROBLOXLOCKED"
					else
						ATTACK = "ROBLOXLOCKED_Descendant"
					end

					local newcmodel = ADMrefit(ADMData, lastcmodel)
					if newcmodel ~= nil then -- if actually refitted
						ADMData.AttackedFunc(ADMData, origmodel, lastcmodel, ATTACK, d)
					end
					return
				end

				cevents.Counter:Disconnect()
				cevents.Counter = cinst.DescendantAdded:Connect(counter)

				if cinstref[d] == nil and d.Parent == cinst and d:IsA("TouchTransmitter") == false --[[<-- wtf roblox accessory touchinterests]] then

					local newcinst = ADMrefitindiv(ADMData, lastcmodel, originst, origdata, cinst, cdata)
					if newcinst ~= nil then -- if actually refitted
						ADMData.AttackedFunc(ADMData, originst, cinst, "DESCENDANT", d)
					end
					return
				end
			end
			cevents.Counter = cinst.DescendantAdded:Connect(counter)

			-- Instance Counter2
			local counter2
			function counter2(d)

				if CSF:IsRobloxLocked(cinst) then
					local newcmodel = ADMrefit(ADMData, lastcmodel)
					if newcmodel ~= nil then -- if actually refitted
						ADMData.AttackedFunc(ADMData, origmodel, lastcmodel, "ROBLOXLOCKED", cinst)
					end
					return
				end
				if CSF:IsRobloxLocked(d) then
					local orig = cinstref[d]
					local ATTACK
					if orig ~= nil then
						ATTACK = "ROBLOXLOCKED"
					else
						ATTACK = "ROBLOXLOCKED_Descendant"
					end

					local newcmodel = ADMrefit(ADMData, lastcmodel)
					if newcmodel ~= nil then -- if actually refitted
						ADMData.AttackedFunc(ADMData, origmodel, lastcmodel, ATTACK, d)
					end
					return
				end

				cevents.Counter2:Disconnect()
				cevents.Counter2 = cinst.DescendantRemoving:Connect(counter2)

				local origdesc = cinstref[d]
				if origdesc then
					local newcinst = ADMrefitindiv(ADMData, lastcmodel, origdesc, originsttable[origdesc], d, cinsttable[origdesc])
					if newcinst ~= nil then -- if actually refitted
						ADMData.AttackedFunc(ADMData, origdesc, d, "ANCESTRY_Exiting")
					end
					return
				end
			end
			cevents.Counter2 = cinst.DescendantRemoving:Connect(counter2)


			cevents.DestroyingEvent = cinst.Destroying:Connect(function()
				if CSF:IsRobloxLocked(lastcmodel) then
					local newcmodel = ADMrefit(ADMData, lastcmodel)
					if newcmodel ~= nil then -- if actually refitted
						ADMData.AttackedFunc(ADMData, origmodel, lastcmodel, "ROBLOXLOCKED", lastcmodel)
					end
					return
				end
				if CSF:IsRobloxLocked(cinst) then
					local newcmodel = ADMrefit(ADMData, lastcmodel)
					if newcmodel ~= nil then -- if actually refitted
						ADMData.AttackedFunc(ADMData, origmodel, lastcmodel, "ROBLOXLOCKED", cinst)
					end
					return
				end
				local Alastcmodelparent = lastcmodel.Parent
				if Alastcmodelparent ~= ADMData.Parent or lastcmodel:FindFirstAncestorWhichIsA("ViewportFrame") or lastcmodel:FindFirstAncestorWhichIsA("Camera") then
					local newcmodel = ADMrefit(ADMData, lastcmodel)
					if newcmodel ~= nil then -- if actually refitted
						ADMData.AttackedFunc(ADMData, origmodel, lastcmodel, "ANCESTRY", Alastcmodelparent)
					end
					return
				end

				local newcinst = ADMrefitindiv(ADMData, lastcmodel, originst, origdata, cinst, cdata)
				if newcinst ~= nil then -- if actually refitted
					ADMData.AttackedFunc(ADMData, originst, cinst, "ANCESTRY_Exiting")
				end
				return
			end)
		end


		-- Parent
		local setparent
		function setparent()

			if CSF:IsRobloxLocked(lastcmodel) then
				local newcmodel = ADMrefit(ADMData, lastcmodel)
				if newcmodel ~= nil then -- if actually refitted
					ADMData.AttackedFunc(ADMData, origmodel, lastcmodel, "ROBLOXLOCKED", lastcmodel)
				end
				return
			end
			if CSF:IsRobloxLocked(cinst) then
				local newcmodel = ADMrefit(ADMData, lastcmodel)
				if newcmodel ~= nil then -- if actually refitted
					ADMData.AttackedFunc(ADMData, origmodel, lastcmodel, "ROBLOXLOCKED", cinst)
				end
				return
			end
			local Alastcmodelparent = lastcmodel.Parent
			if Alastcmodelparent ~= ADMData.Parent or lastcmodel:FindFirstAncestorWhichIsA("ViewportFrame") or lastcmodel:FindFirstAncestorWhichIsA("Camera") then
				local newcmodel = ADMrefit(ADMData, lastcmodel)
				if newcmodel ~= nil then -- if actually refitted
					ADMData.AttackedFunc(ADMData, origmodel, lastcmodel, "ANCESTRY", Alastcmodelparent)
				end
				return
			end

			local Acinstparent = cinst.Parent
			if (Acinstparent ~= cparent) then
				local newcinst = ADMrefitindiv(ADMData, lastcmodel, originst, origdata, cinst, cdata)
				if newcinst ~= nil then -- if actually refitted
					ADMData.AttackedFunc(ADMData, originst, cinst, "ANCESTRY", Acinstparent)
				end
				return
			end


			if ADMData.LEVEL == 3 or ADMData.LEVEL == 4 then
				cevents.Parent:Disconnect()
				cevents.Parent = cinst.AncestryChanged:Connect(setparent)
			end
		end
		cevents.Parent = cinst.AncestryChanged:Connect(setparent)
	end





	------------------------------------------------------------------------------------------------------------------------------------------
	------------------------------------------------------------------------------------------------------------------------------------------
	-- MORE HEADACHE

	function ADMsetnilprops(ADMData)
		-- ADMODELS: set nil props
		-- This sets the CloneSave's properties instead of the actual original instance (since that's what's getting cloned in ADMSETUP/ADMrefitindiv)

		local originsttable = ADMData.OrigInstances

		local modelcframe = ADMData.ModelCFrame
		originsttable[ADMData.OrigPrimaryPart].CloneSave.CFrame = modelcframe

		for originst, origdata in originsttable do
			local clonesave = origdata.CloneSave
			for prop, val in origdata.Properties do
				if originst:IsA("MeshPart") and prop == "MeshId" then continue end
				if prop == "PartCFrames" then -- For non-PrimaryParts only
					clonesave.CFrame = modelcframe * val.Offset * val.Offset2
				else
					clonesave[prop] = val
				end
			end
		end
	end

	function ADMcheckmain(ADMData)

		ADMsetnilprops(ADMData)
		----------------------------------------------------------------------------
		-- CMODEL

		-- References
		local origmodel = ADMData.OrigModel
		local cmodel = ADMData.CModel
		local cinstref = ADMData.CInstRef

		-- RobloxLocked defense
		if CSF:IsRobloxLocked(cmodel) then
			local newcmodel = ADMrefit(ADMData, cmodel)
			if newcmodel ~= nil then -- if actually refitted
				ADMData.AttackedFunc(ADMData, origmodel, cmodel, "ROBLOXLOCKED", cmodel)
			end
			return
		end
		for i, inst in cmodel:GetChildren() do
			if CSF:IsRobloxLocked(inst) then
				local orig = cinstref[inst]
				local ATTACK
				if orig ~= nil then
					ATTACK = "ROBLOXLOCKED"
				else
					ATTACK = "ROBLOXLOCKED_Descendant"
				end

				local newcmodel = ADMrefit(ADMData, cmodel)
				if newcmodel ~= nil then -- if actually refitted
					ADMData.AttackedFunc(ADMData, origmodel, cmodel, ATTACK, inst)
				end
				return
			end
		end

		-- Check parent
		local Acmodelparent = cmodel.Parent
		if Acmodelparent ~= ADMData.Parent or cmodel:FindFirstAncestorWhichIsA("ViewportFrame") or cmodel:FindFirstAncestorWhichIsA("Camera") then
			local newcmodel = ADMrefit(ADMData, cmodel)
			if newcmodel ~= nil then -- if actually refitted
				ADMData.AttackedFunc(ADMData, origmodel, cmodel, "ANCESTRY", Acmodelparent)
			end
			return
		end

		-- Check disconnects
		for name, event in ADMData.CModelEvents do
			if event.Connected == false then
				local newcmodel = ADMrefit(ADMData, cmodel)
				if newcmodel ~= nil then -- if actually refitted
					ADMData.AttackedFunc(ADMData, origmodel, cmodel, "EVENT_FAIL")
				end
				return
			end
		end

		-- Model Instance Counter
		for i, inst in cmodel:GetChildren() do
			if cinstref[inst] == nil and inst:IsA("TouchTransmitter") == false --[[<-- wtf roblox accessory touchinterests]] then
				local newcmodel = ADMrefit(ADMData, cmodel)
				if newcmodel ~= nil then -- if actually refitted
					ADMData.AttackedFunc(ADMData, origmodel, cmodel, "DESCENDANT", inst)
				end
				return
			end
		end


		----------------------------------------------------------------------------
		-- CINST

		-- More References
		local origprim = ADMData.OrigPrimaryPart

		local originsttable = ADMData.OrigInstances
		local cinsttable = ADMData.CInstances

		local modelcframe = ADMData.ModelCFrame

		for originst, cdata in cinsttable do
			-- References
			local cinst = cdata.CInst
			local origdata = originsttable[originst]
			local origparent = origdata.OrigParent

			-- RobloxLocked defense
			if CSF:IsRobloxLocked(cinst) then
				local newcmodel = ADMrefit(ADMData, cmodel)
				if newcmodel ~= nil then -- if actually refitted
					ADMData.AttackedFunc(ADMData, origmodel, cmodel, "ROBLOXLOCKED", cinst)
				end
				return
			end
			for i, inst in cinst:GetChildren() do
				if CSF:IsRobloxLocked(inst) then
					local orig = cinstref[inst]
					local ATTACK
					if orig ~= nil then
						ATTACK = "ROBLOXLOCKED"
					else
						ATTACK = "ROBLOXLOCKED_Descendant"
					end

					local newcmodel = ADMrefit(ADMData, cmodel)
					if newcmodel ~= nil then -- if actually refitted
						ADMData.AttackedFunc(ADMData, origmodel, cmodel, ATTACK, inst)
					end
					return
				end
			end

			local function instcheck()

				-- Check parent
				local cparent
				if origparent == origmodel then
					cparent = cmodel
				else
					cparent = cinsttable[origparent].CInst
				end
				local Acinstparent = cinst.Parent
				if Acinstparent ~= cparent then
					local newcinst = ADMrefitindiv(ADMData, cmodel, originst, origdata, cinst, cdata)
					if newcinst ~= nil then -- if actually refitted
						ADMData.AttackedFunc(ADMData, originst, cinst, "ANCESTRY", Acinstparent)
					end
					return true
				end

				-- Check disconnect
				for name, event in cdata.CEvents do
					if event.Connected == false then
						local newcinst = ADMrefitindiv(ADMData, cmodel, originst, origdata, cinst, cdata)
						if newcinst ~= nil then -- if actually refitted
							ADMData.AttackedFunc(ADMData, originst, cinst, "EVENT_FAIL")
						end
						return true
					end
				end

				-- Instance Counter
				for i, inst in cinst:GetChildren() do
					if cinstref[inst] == nil and inst:IsA("TouchTransmitter") == false --[[<-- wtf roblox accessory touchinterests]] then
						local newcinst = ADMrefitindiv(ADMData, cmodel, originst, origdata, cinst, cdata)
						if newcinst ~= nil then -- if actually refitted
							ADMData.AttackedFunc(ADMData, originst, cinst, "DESCENDANT", inst)
						end
						return true
					end
				end
			end
			if instcheck() == true then continue end


			-- Set/Check Properties
			local props = origdata.Properties

			local refitbreak = false -- Used for checking if we need to break out of the loop since model was refitted (ROBLOXLOCKED)
			local indivrefitcheck = false -- Used for checking if instance refitted

			if originst == origprim then -- Check Prim CFrame first
				pcall(function()
					local Acf = cinst.CFrame
					if Acf ~= modelcframe then
						if ADMData.LEVEL == 0 or ADMData.LEVEL == 1 or ADMData.LEVEL == 2 then
							cinst.CFrame = modelcframe
						elseif ADMData.LEVEL == 3 then
							cinst.CFrame = modelcframe
						elseif ADMData.LEVEL == 4 then
							Hypernull(function()
								cinst.CFrame = modelcframe
							end)
						end
						if CSF:IsRobloxLocked(cinst) then
							local newcmodel = ADMrefit(ADMData, cmodel)
							if newcmodel ~= nil then -- if actually refitted
								ADMData.AttackedFunc(ADMData, origmodel, cmodel, "ROBLOXLOCKED", cinst)
							end
							refitbreak = true
							return
						end
						if ADMData.LEVEL ~= 0 and ADMData.LEVEL ~= 1 then
							local Acf2 = cinst.CFrame
							if Acf2 ~= modelcframe then
								local newcinst = ADMrefitindiv(ADMData, cmodel, originst, origdata, cinst, cdata)
								indivrefitcheck = true
								ADMData.AttackedFunc(ADMData, originst, cinst, "PROPERTY_CFrame", Acf)
								if newcinst ~= nil then -- if actually refitted
									ADMData.AttackedFunc(ADMData, originst, cinst, "PROPERTY_FAIL_CFrame", Acf2)
								end
								return
							end
						end
						ADMData.AttackedFunc(ADMData, originst, cinst, "PROPERTY_CFrame", Acf)
					end
				end)
			end
			if refitbreak == true then
				return
			end
			if indivrefitcheck == true then
				continue
			end
			if originst:IsA("MeshPart") then
				pcall(function()
					local Aid = cinst.MeshId
					if Aid ~= props.MeshId then
						if ADMData.LEVEL == 0 or ADMData.LEVEL == 1 or ADMData.LEVEL == 2 then
							cinst:ApplyMesh(originst)
						elseif ADMData.LEVEL == 3 then
							cinst:ApplyMesh(originst)
						elseif ADMData.LEVEL == 4 then
							Hypernull(function()
								cinst:ApplyMesh(originst)
							end)
						end
						if CSF:IsRobloxLocked(cinst) then
							local newcmodel = ADMrefit(ADMData, cmodel)
							if newcmodel ~= nil then -- if actually refitted
								ADMData.AttackedFunc(ADMData, origmodel, cmodel, "ROBLOXLOCKED", cinst)
							end
							refitbreak = true
							return
						end

						if ADMData.LEVEL ~= 0 and ADMData.LEVEL ~= 1 then
							local Aid2 = cinst.MeshId
							if Aid2 ~= props.MeshId then
								local newcinst = ADMrefitindiv(ADMData, cmodel, originst, origdata, cinst, cdata)
								indivrefitcheck = true
								ADMData.AttackedFunc(ADMData, originst, cinst, "PROPERTY_MeshId", Aid)
								if newcinst ~= nil then -- if actually refitted
									ADMData.AttackedFunc(ADMData, originst, cinst, "PROPERTY_FAIL_MeshId", Aid2)
								end
								return
							end
						end
						ADMData.AttackedFunc(ADMData, originst, cinst, "PROPERTY_MeshId", Aid)
					end
				end)
				if refitbreak == true then
					return
				end
				if indivrefitcheck == true then
					continue
				end
			end

			for prop, val in props do
				pcall(function()
					if originst:IsA("MeshPart") and prop == "MeshId" then return end
					if originst:IsA("BasePart") and prop == "PartCFrames" then -- For non-PrimaryParts only
						local cf = modelcframe * val.Offset * val.Offset2
						local Acf = cinst.CFrame
						if Acf ~= cf then
							if ADMData.LEVEL == 0 or ADMData.LEVEL == 1 or ADMData.LEVEL == 2 then
								cinst.CFrame = cf
							elseif ADMData.LEVEL == 3 then
								cinst.CFrame = cf
							elseif ADMData.LEVEL == 4 then
								Hypernull(function()
									cinst.CFrame = cf
								end)
							end
							if CSF:IsRobloxLocked(cinst) then
								local newcmodel = ADMrefit(ADMData, cmodel)
								if newcmodel ~= nil then -- if actually refitted
									ADMData.AttackedFunc(ADMData, origmodel, cmodel, "ROBLOXLOCKED", cinst)
								end
								refitbreak = true
								return
							end

							if ADMData.LEVEL ~= 0 and ADMData.LEVEL ~= 1 then
								local Acf2 = cinst.CFrame
								if Acf2 ~= cf then
									local newcinst = ADMrefitindiv(ADMData, cmodel, originst, origdata, cinst, cdata)
									indivrefitcheck = true
									ADMData.AttackedFunc(ADMData, originst, cinst, "PROPERTY_CFrame", Acf)
									if newcinst ~= nil then -- if actually refitted
										ADMData.AttackedFunc(ADMData, originst, cinst, "PROPERTY_FAIL_CFrame", Acf2)
									end
									return
								end
							end
							ADMData.AttackedFunc(ADMData, originst, cinst, "PROPERTY_CFrame", Acf)
						end






					elseif (originst:IsA("BasePart") or originst:IsA("Decal") or originst:IsA("Texture")) and prop == "Transparency" then
						local Atr = cinst.Transparency
						if math.abs(Atr-val) > 0.05 then -- this stupid float decimals bruh
							if ADMData.LEVEL == 0 or ADMData.LEVEL == 1 or ADMData.LEVEL == 2 then
								cinst.Transparency = val
							elseif ADMData.LEVEL == 3 then
								cinst.Transparency = val
							elseif ADMData.LEVEL == 4 then
								Hypernull(function()
									cinst.Transparency = val
								end)
							end
							if CSF:IsRobloxLocked(cinst) then
								local newcmodel = ADMrefit(ADMData, cmodel)
								if newcmodel ~= nil then -- if actually refitted
									ADMData.AttackedFunc(ADMData, origmodel, cmodel, "ROBLOXLOCKED", cinst)
								end
								refitbreak = true
								return
							end

							if ADMData.LEVEL ~= 0 and ADMData.LEVEL ~= 1 then
								local Atr2 = cinst.Transparency
								if math.abs(Atr2-val) > 0.05 then -- this stupid float decimals bruh
									local newcinst = ADMrefitindiv(ADMData, cmodel, originst, origdata, cinst, cdata)
									indivrefitcheck = true
									ADMData.AttackedFunc(ADMData, originst, cinst, "PROPERTY_Transparency", Atr)
									if newcinst ~= nil then -- if actually refitted
										ADMData.AttackedFunc(ADMData, originst, cinst, "PROPERTY_FAIL_Transparency", Atr2)
									end
									return
								end
							end
							ADMData.AttackedFunc(ADMData, originst, cinst, "PROPERTY_Transparency", Atr)
						end
					elseif typeof(val) == "Color3" then -- Floating point :(
						local Acolor = cinst[prop]
						if (math.abs(Acolor.R-val.R) > 0.005) or (math.abs(Acolor.G-val.G) > 0.005) or (math.abs(Acolor.B-val.B) > 0.005) then
							if ADMData.LEVEL == 0 or ADMData.LEVEL == 1 or ADMData.LEVEL == 2 then
								cinst[prop] = val
							elseif ADMData.LEVEL == 3 then
								cinst[prop] = val
							elseif ADMData.LEVEL == 4 then
								Hypernull(function()
									cinst[prop] = val
								end)
							end
							if CSF:IsRobloxLocked(cinst) then
								local newcmodel = ADMrefit(ADMData, cmodel)
								if newcmodel ~= nil then -- if actually refitted
									ADMData.AttackedFunc(ADMData, origmodel, cmodel, "ROBLOXLOCKED", cinst)
								end
								refitbreak = true
								return
							end

							if ADMData.LEVEL ~= 0 and ADMData.LEVEL ~= 1 then
								local Acolor2 = cinst[prop]
								if (math.abs(Acolor2.R-val.R) > 0.005) or (math.abs(Acolor2.G-val.G) > 0.005) or (math.abs(Acolor2.B-val.B) > 0.005) then
									local newcinst = ADMrefitindiv(ADMData, cmodel, originst, origdata, cinst, cdata)
									indivrefitcheck = true
									ADMData.AttackedFunc(ADMData, originst, cinst, "PROPERTY_"..prop, Acolor)
									if newcinst ~= nil then -- if actually refitted
										ADMData.AttackedFunc(ADMData, originst, cinst, "PROPERTY_FAIL_"..prop, Acolor2)
									end
									return
								end
							end
							ADMData.AttackedFunc(ADMData, originst, cinst, "PROPERTY_"..prop, Acolor)
						end
					else				
						local Aval = cinst[prop]
						if Aval ~= val then
							if ADMData.LEVEL == 0 or ADMData.LEVEL == 1 or ADMData.LEVEL == 2 then
								cinst[prop] = val
							elseif ADMData.LEVEL == 3 then
								cinst[prop] = val
							elseif ADMData.LEVEL == 4 then
								Hypernull(function()
									cinst[prop] = val
								end)
							end
							if CSF:IsRobloxLocked(cinst) then
								local newcmodel = ADMrefit(ADMData, cmodel)
								if newcmodel ~= nil then -- if actually refitted
									ADMData.AttackedFunc(ADMData, origmodel, cmodel, "ROBLOXLOCKED", cinst)
								end
								refitbreak = true
								return
							end

							if ADMData.LEVEL ~= 0 and ADMData.LEVEL ~= 1 then
								local Aval2 = cinst[prop]
								if Aval2 ~= val then
									local newcinst = ADMrefitindiv(ADMData, cmodel, originst, origdata, cinst, cdata)
									indivrefitcheck = true
									ADMData.AttackedFunc(ADMData, originst, cinst, "PROPERTY_"..prop, Aval)
									if newcinst ~= nil then -- if actually refitted
										ADMData.AttackedFunc(ADMData, originst, cinst, "PROPERTY_FAIL_"..prop, Aval2)
									end
									return
								end
							end
							ADMData.AttackedFunc(ADMData, originst, cinst, "PROPERTY_"..prop, Aval)
						end
					end
				end)
				if refitbreak == true then
					break
				end
				if indivrefitcheck == true then
					break
				end
			end
			if refitbreak == true then
				return
			end
		end
	end

	function ADMcheckothers(ADMData)
		pcall(function()

			-- Refit Failsafe
			if os.clock() - ADMData.RefitFailsafe >= ADMData.FailsafeDelay then
				ADMData.RefitFailsafe = os.clock()
				if ADMData.FailsafeEnabled == true then
					ADMrefit(ADMData, ADMData.CModel, false)
				end
			end

			-- References
			local cmodel = ADMData.CModel
			for i, inst in cmodel:GetDescendants() do
				pcall(function()
					inst.Archivable = false
					if inst:IsA("BasePart") then
						inst.CastShadow = false
					end
				end)
			end
			cmodel.Archivable = false

			pcall(function()
				cmodel.Parent = ADMData.Parent
			end)

			cmodel.Name = ADMData.OrigModel.Name.. " (ã‚†ã�†ã‚Œã�„)"
		end)
	end




	---------------------------------------------------------------------







	-- ghosts are lonely...
	return function()
		return YUREI
	end
end

KKR = KKR()()
YUREI = YUREI()()

local KKR_MF = KKR.MainFunctions
local KKR_IF = KKR.InstFunctions
local KKR_IF_Humanoid = KKR_IF.Humanoid
local KKR_IF_Model = KKR_IF.Model
local KKR_IF_BasePart = KKR_IF.BasePart
local KKR_IF_DataModelMesh = KKR_IF.DataModelMesh
local KKR_IF_Player = KKR_IF.Player
local KKR_IF_BaseScript = KKR_IF.BaseScript
local KKR_IF_MISC = KKR_IF.MISC

print("> [WLW] Instances loaded. \n] -")





--[[ ----------------------------------

			-- REMOTE SETUP --

---------------------------------- ]]--
print("- [\n> [WLW] Initializing remote...")

-- REMOTE
local RemoteName = "[["..tostring(os.clock())..tostring(userid)
RemoteName = RemoteName:sub(1, 30) -- fat name limit

local Remote = Instance.new("RemoteEvent")
Remote.Name = RemoteName
Remote.Parent = reps

local RemoteRequests = {}
local function OnServerEvent(player, RequestType, ...)
	if player == plr and RemoteRequests[RequestType] then
		RemoteRequests[RequestType](...)
	end
end
Remote.OnServerEvent:Connect(OnServerEvent)


-- REMOTE CHECKER
local RemoteBlackmail = {}
local RemoteCheck = heartbeat:Connect(function()
	local remotes = 0
	for i, remote in reps:GetChildren() do
		pcall(function()
			if remote:IsA("RemoteEvent") and remote.Name == RemoteName then
				remotes = remotes + 1
			end
		end)
	end
	if remotes ~= 1 or CSF:IsRobloxLocked(Remote) then
		pcall(function()
			Remote:Destroy()
		end)
		for i, remote in reps:GetChildren() do
			pcall(function()
				if remote:IsA("RemoteEvent") and remote.Name == RemoteName then
					remote:Destroy()
				end
			end)
		end

		-- New Remote
		Remote = Instance.new("RemoteEvent")
		Remote.Name = RemoteName
		Remote.Parent = reps
		Remote.OnServerEvent:Connect(OnServerEvent)

		-- Blackmail the people trying to kill the remote by lagging the hell out of the server lolmao
		for i = 1, 1000 do
			local part = Instance.new("Part")
			table.insert(RemoteBlackmail, part)
			part.CFrame = CFrame.new(rnd:NextNumber(-9999999999, 9999999999), rnd:NextNumber(-9999999999, 9999999999), rnd:NextNumber(-9999999999, 9999999999))	
		end

	else
		if #RemoteBlackmail > 0 then
			for i = math.floor(#RemoteBlackmail * 2/3), 1, -1 do
				RemoteBlackmail[i]:Destroy()
				table.remove(RemoteBlackmail, i)
			end
		end
	end
end)


print("> [WLW] Remote loaded. \n] -")



----------------------------------------------------------------------------

local CFRAMES = {}
--[[
	CHARACTER
		- Character
		- Head
		- Torso
		- Right Arm
		- Left Arm
		- Right Leg
		- Left Leg
	OBJECTS
		- Broom
		- Hakero
	BALLS
		- White
		- Black1
		- Black2
		- Blue
		- Red
		- Yellow
		- Green
		- Orange
		- Magenta
		- RAINBOW
	MOUSE
	CAMERA
		- CFrame
		- Focus
]]


----------------------------------------------------------------------------

--[[ ----------------------------------

		-- CHARACTER SETUP --

---------------------------------- ]]--

print("- [\n> [WLW] Initializing character...")

local CHARACTERSCALE = SETTINGS.CharacterScale

---------------- MODEL PREPARATION ----------------
local charmparts = MODELS.MParts


-- RESIZE
CSF:ResizeModel(MODELS["Wicked Law's Witch"], CHARACTERSCALE)
CSF:ResizeModel(MODELS["Broom"], CHARACTERSCALE)
CSF:ResizeModel(MODELS["Hakero"], CHARACTERSCALE)

CSF:ResizeModel(charmparts["MHead"], CHARACTERSCALE)
CSF:ResizeModel(charmparts["MBody"], CHARACTERSCALE)
print("A")

for i, ball in MODELS["BALLS1"]:GetChildren() do
	if ball:IsA("BasePart") then
		ball.Size = ball.Size * SETTINGS.BallsScale
		for i, texture in ball:GetDescendants() do
			if texture:IsA("Texture") then
				texture.StudsPerTileU = texture.StudsPerTileU * CHARACTERSCALE
				texture.StudsPerTileV = texture.StudsPerTileV * CHARACTERSCALE
			end
		end
	end
end
for i, ball in MODELS["BALLS2"]:GetChildren() do
	if ball:IsA("BasePart") then
		ball.Size = ball.Size * SETTINGS.BallsScale
		for i, texture in ball:GetDescendants() do
			if texture:IsA("Texture") then
				texture.StudsPerTileU = texture.StudsPerTileU * CHARACTERSCALE
				texture.StudsPerTileV = texture.StudsPerTileV * CHARACTERSCALE
			end
		end
	end
end


local function QuickMeshResize(Model, IgnoreParts)
	local IgnoreParts = IgnoreParts or {}
	for i, mesh in Model:GetDescendants() do
		if mesh:IsA("DataModelMesh") and table.find(IgnoreParts, mesh.Parent) == nil then
			mesh.Scale = mesh.Scale * CHARACTERSCALE
			mesh.Offset = mesh.Offset * CHARACTERSCALE
		end
	end
end
QuickMeshResize(MODELS["Broom"])
QuickMeshResize(MODELS["Hakero"], {MODELS["Hakero"].light1, MODELS["Hakero"].light2})


QuickMeshResize(charmparts["MHead"])
QuickMeshResize(charmparts["MBody"])



----------------------------------------------------------------------------
---------------- CHARACTER ----------------
local ADMCharacters = {}

print("Fetty")

-- Character
local origchar = MODELS["Wicked Law's Witch"]:Clone()
local orighrp = origchar.HumanoidRootPart
local orighead = origchar["Head"]
local origtorso = origchar["Torso"]
local origra = origchar["Right Arm"]
local origla = origchar["Left Arm"]
local origrl = origchar["Right Leg"]
local origll = origchar["Left Leg"]



local ADMchar = YUREI:Initialize(origchar, origchar.HumanoidRootPart, workspace)
table.insert(ADMCharacters, ADMchar)



-- MParts
local origmhead = charmparts["MHead"]:Clone()
local origmbody = charmparts["MBody"]:Clone()
local ADMmhead = YUREI:Initialize(origmhead, origmhead.PrimaryPart, workspace)
local ADMmbody = YUREI:Initialize(origmbody, origmbody.PrimaryPart, workspace)
print("Windows")

table.insert(ADMCharacters, ADMmhead)
table.insert(ADMCharacters, ADMmbody)
print("Windows")

-- Broom
local origbroom = MODELS.Broom:Clone()
local ADMbroom = YUREI:Initialize(origbroom, origbroom.PrimaryPart, workspace)

-- Broom
local orighakero = MODELS.Hakero:Clone()
local ADMhakero = YUREI:Initialize(orighakero, orighakero.PrimaryPart, workspace)



-- No Real Character
local NoCharacterAdded = plr.CharacterAdded:Connect(function(c)
	c:Destroy()
end)
local NoCharacterAdded2 = heartbeat:Connect(function()
	if plr.Character then
		plr.Character:Destroy()
		plr.Character = nil
	end
end)

---------------- VALUES ----------------
local currentcf = CFrame.new(696.9, 1000, 696.9) -- Character CFrame
local currentlook = Vector3.new(0, 0, -1) -- Character LookVector
local currentdir = Vector3.new() -- Character Movement Direction

local currentspeed = SETTINGS.FlySpeed
local currentvelocity = Vector3.new() -- Character Velocity
local currentforce = Vector3.new() -- Character Applied Force (decays over time)

local FLOORPLACEHOLDER = Instance.new("Part")
FLOORPLACEHOLDER:Destroy()
local currentfloor = FLOORPLACEHOLDER -- Current ground that character is standing on/directly above on

print("Fetty")

---------------- MOVEMENT MODES ----------------
local movementenabled = true
local movementforcestop = false -- Priority Movement - overwrite no matter what state movement should be in
local moving = false

local flymode = false
local runmode = false

local idlemode = 1

---------------- CHARACTER STATE ----------------
--[[
	CharacterState.Event:Connect(function(laststate, currentstate))
	
	-- STATES
		- Jumping
		- Falling
		
		- Walking
		- Running
		- Flying
		
		- IdleFly
		- IdleGround
		
		- Disabled (when movement is disabled)
	
	
]]
local CurrentCharacterState = "IdleFly"
local CharacterState = Instance.new("BindableEvent")
function UpdateCharState(state)
	if state ~= CurrentCharacterState then
		local laststate = CurrentCharacterState
		CurrentCharacterState = state
		CharacterState:Fire(laststate, state)
	end
end


---------------- MOVEMENT FUNCTIONS ----------------
function UpdateVelocity(vel)
	currentvelocity = Vector3.new(vel.X or currentvelocity.X, vel.Y or currentvelocity.Y, vel.Z or currentvelocity.Z)
end

local ForceTWEENOBJ = ts:Create(workspace, TweenInfo.new(0), {}) -- Placeholder
function UpdateForce(force, forcedecay)
	ForceTWEENOBJ:Pause()
	local forcedecay = forcedecay or 1 -- Time it takes to completely decay force to 0 (in seconds)

	currentforce = Vector3.new(force.X or currentforce.X, force.Y or currentforce.Y, force.Z or currentforce.Z)

	-- Force decay
	ForceTWEENOBJ = CSE:TweenCustom(currentforce, Vector3.new(), TweenInfo.new(forcedecay, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), function(val)
		currentforce = val
	end)
end

function UpdateFloor()
	local currentpos = currentcf.Position
	local result = CSF:Raycast(currentpos, currentpos - Vector3.new(0, 1, 0), 1000, GetCharFilter())
	if result.Instance ~= nil then
		if CSF:IsRobloxLocked(result.Instance) == false then
			currentfloor = result.Instance
		end
	else
		currentfloor = FLOORPLACEHOLDER
	end
end



function UpdateMovement(deltaTime)

	---------------- INITIAL VALUES ----------------
	local charfilter = GetCharFilter()
	local newpos = currentcf.Position
	local look = currentlook
	local newvel = {
		X = currentvelocity.X,
		Y = currentvelocity.Y,
		Z = currentvelocity.Z
	}
	local frameforce = { -- Force at frame
		X = currentforce.X * deltaTime,
		Y = currentforce.Y * deltaTime,
		Z = currentforce.Z * deltaTime
	}

	if flymode == true then
		currentspeed = SETTINGS.FlySpeed
	elseif runmode == false then
		currentspeed = SETTINGS.WalkSpeed
	else
		currentspeed = SETTINGS.RunSpeed
	end

	---------------- ENABLED ----------------
	if movementenabled == true and movementforcestop == false then
		-- Edit Values before update

		newvel.X = currentdir.X * currentspeed * deltaTime
		newvel.Z = currentdir.Z * currentspeed * deltaTime

		if flymode == false then
			---------------- WALKING ----------------

			-- Check ground
			local currentpos = currentcf.Position

			-- assume the next position to use for raycast distance (wont fall through floor even if laggy server)
			local assumedpos = currentpos - Vector3.new(0, newvel.Y + frameforce.Y - (SETTINGS.Gravity * deltaTime), 0)
			local assumeddist = (assumedpos-currentpos).Magnitude
			local result = CSF:Raycast(currentpos, currentpos - Vector3.new(0, 1, 0), math.max(4 * CHARACTERSCALE, assumeddist), charfilter)
			local rpos = result.Position


			if (result.Instance or rpos.Y <= workspace.FallenPartsDestroyHeight) and currentvelocity.Y <= 0 then -- Found ground and falling

				-- Character 3 studs above ground
				-- Set Y Velocity 0
				-- Set negative Y forces to 0 (or if sum of forces are below ground level)

				local posY = math.max(rpos.Y, workspace.FallenPartsDestroyHeight)
				newpos = Vector3.new(currentpos.X, posY + (3 * CHARACTERSCALE), currentpos.Z)

				newvel.Y = 0
				if frameforce.Y < 0 or (-SETTINGS.Gravity * deltaTime) + (frameforce.Y) < 0 then
					frameforce.Y = 0
				end

			else -- Gravity

				-- Decrease Y Velocity by GravAccel (/60 for every frame)
				newvel.Y = newvel.Y - (SETTINGS.Gravity * deltaTime) 

			end

			-- LookVector without Y coordinate if walking
			look = Vector3.new(look.X, 0, look.Z)


		else
			---------------- FLYING ----------------

			-- Set Y Velocity by move direction (no gravity physics)
			newvel.Y = currentdir.Y * currentspeed * deltaTime
		end
	else

		currentdir = Vector3.new()
		newvel = {X = 0, Y = 0, Z = 0}
		if flymode == false then
			-- LookVector without Y coordinate if walking
			look = Vector3.new(look.X, 0, look.Z)
		end
	end


	---------------- UPDATE VALUES ----------------
	-- Final Velocity (with Force)
	local finalvelY = math.min(newvel.Y + frameforce.Y, SETTINGS.MaxFallVelocity)
	if flymode == false and finalvelY ~= 0 then
		newvel.X = newvel.X * SETTINGS.AirSpeedMultiplier
		newvel.Z = newvel.Z * SETTINGS.AirSpeedMultiplier
	end
	local finalvel = {
		X = newvel.X + frameforce.X,
		Y = finalvelY,
		Z = newvel.Z + frameforce.Z
	}
	UpdateVelocity(finalvel)
	currentlook = look


	---------------- UPDATE FINAL ----------------
	-- Character
	local lastcf = currentcf
	currentcf = CFrame.new(newpos, newpos + look) + currentvelocity
	moving = currentcf.Position ~= lastcf.Position

	-- Character State
	if movementenabled == true then
		if flymode == true then
			if moving == false then
				UpdateCharState("IdleFly")
			else
				UpdateCharState("Flying")
			end
		else
			if currentvelocity.Y > 0 then
				UpdateCharState("Jumping")
			elseif currentvelocity.Y < 0 then
				UpdateCharState("Falling")
			elseif currentvelocity.X == 0 and currentvelocity.Z == 0 then
				UpdateCharState("IdleGround")
			else
				if runmode == false then
					UpdateCharState("Walking")
				else
					UpdateCharState("Running")
				end
			end
		end
	else
		UpdateCharState("Disabled")
	end
end
local CharacterMovement = heartbeat:Connect(UpdateMovement)


---------------- LOCAL MOVEMENT ----------------
RemoteRequests.UPDATEMOVEMENTLOCAL = function(look, cfdirection)
	if movementenabled == true then

		local dircf = currentcf * cfdirection
		if dircf.Position ~= currentcf.Position then -- If it actually moved
			currentdir = (dircf.Position-currentcf.Position).Unit
			currentlook = look
		else
			currentdir = Vector3.new()
		end
	end
end

---------------- OTHER ----------------
RemoteRequests.UPDATEMOUSE = function(cf)
	CFRAMES.MOUSE = cf
end

CFRAMES.CAMERA = {CFrame = CFrame.new(), Focus = CFrame.new()}
RemoteRequests.UPDATECAMERA = function(Data)
	CFRAMES.CAMERA.CFrame = Data.CFrame
	CFRAMES.CAMERA.Focus = Data.Focus
end



print("> [WLW] Character loaded. \n] -")




---------------------------------------------------------------------

--[[ ----------------------------------

		-- ANIMATIONS --

---------------------------------- ]]--

print("- [\n> [WLW] Loading animations...")

--[[
	animfunc = AnimFunction(AT)
	AnimationNew: animfunc --> AnimTrack
	
	AnimTrack = {
		Name = AnimName
		Function = AnimFunction
		IsPlaying = true/false
		TweenObjects = {
			["JointsOffset"] = tweenstable
			["ObjOffset"] = tweenstable
		}
		
		function AT:JointsOffsetChange
		function AT:JointsOffsetTween
		function AT:ObjOffsetChange
		function AT:ObjOffsetTween
		
		function AT:Wait()
		function AT:Delay()
		function AT:ForceStop()
	}
	
	------------------------------------------------------------------------------------------------------------------------------------------
	
	ANIMATIONS = {
		Name = AnimFunction
	}
	AnimationIsPlaying: Name --> bool
	AnimationPlay: Name
	AnimationStop: Name
	
	
	
]]

------------------------------ ANIMATION CHARACTER VALUES -------------------------------
---------------- JOINTS ----------------
-- CharacterOffset is the joints offset from character (For reference only // not animated)
-- CurrentOffset is the offset from CharacterOffset
local jointscframes = {
	["Neck"] = {
		CharacterOffset = CFrame.new(Vector3.new(0, 1.5, 0) * CHARACTERSCALE),
		CurrentOffset = CFrame.new()
	},
	["RootJoint"] = {
		CharacterOffset = CFrame.new(),
		CurrentOffset = CFrame.new()
	},
	["Right Shoulder"] = {
		CharacterOffset = CFrame.new(Vector3.new(1.5, 0, 0) * CHARACTERSCALE),
		CurrentOffset = CFrame.new()
	},
	["Left Shoulder"] = {
		CharacterOffset = CFrame.new(Vector3.new(-1.5, 0, 0) * CHARACTERSCALE),
		CurrentOffset = CFrame.new()
	},
	["Right Hip"] = {
		CharacterOffset = CFrame.new(Vector3.new(0.5, -2, 0) * CHARACTERSCALE),
		CurrentOffset = CFrame.new()
	},
	["Left Hip"] = {
		CharacterOffset = CFrame.new(Vector3.new(-0.5, -2, 0) * CHARACTERSCALE),
		CurrentOffset = CFrame.new()
	}
}

---------------- OBJECTS ----------------
-- Objects have CF recordings since they have more freedom in movement and animation than joints/limbs
local objectscframes = {
	["Broom"] = {
		CurrentCFrame = currentcf,
		CurrentOffset = CFrame.new(),
	},
	["Hakero"] = {
		CurrentCFrame = currentcf,
		CurrentOffset = CFrame.new(),
	}
}

---------------- EASIER REFERENCE ----------------
local JCFneck = jointscframes["Neck"]
local JCFrtj = jointscframes["RootJoint"]
local JCFrs = jointscframes["Right Shoulder"]
local JCFls = jointscframes["Left Shoulder"]
local JCFrh = jointscframes["Right Hip"]
local JCFlh = jointscframes["Left Hip"]

local OCFbroom = objectscframes["Broom"]
local OCFhakero = objectscframes["Hakero"]

---------------- OTHERS ----------------
-- MParts Offsets from limbs
local mheadcharoffset = CFrame.identity--CFrame.new(0.0199966431, 1.0999999, -9.53674316e-07, 0.98480767, 0.173648179, 0, -0.172353834, 0.97746712, -0.121869348, -0.0211623907, 0.120017871, 0.992546082)
local mtorsocharoffset = CFrame.new(0.000503540039, -0.0346679688, -0.000610351562, 1, 8.56402167e-08, -1.68613411e-07, 8.56402593e-08, 1.00000095, -9.23871994e-07, -2.40870179e-07, -9.23871994e-07, 1)
local mracharoffset = CFrame.new(0.0449981689, 0.715002775, 0, 1.31134158e-07, 1, 4.37111289e-08, -7.01627036e-21, -4.37110224e-08, 0.999996543, 1, -1.31134158e-07, -5.73202018e-15)
local mlacharoffset = CFrame.new(-0.0450057983, 0.715002775, 0, -4.37113883e-08, -1, 4.37108518e-08, 1.40988219e-23, -4.37107168e-08, -0.999996543, 1, -4.37113883e-08, 1.91066196e-15)
local mrlcharoffset = CFrame.new(0, -0.609998941, 0, 1, 0, 0, 0, 0.999996543, 0, 0, 0, 1)
local mllcharoffset = CFrame.new(0, -0.609998941, 0, 1, 0, 0, 0, 0.999996543, 0, 0, 0, 1)

-- Scale them
mheadcharoffset = CFrame.new(mheadcharoffset.Position * CHARACTERSCALE) * mheadcharoffset.Rotation
mtorsocharoffset = CFrame.new(mtorsocharoffset.Position * CHARACTERSCALE) * mtorsocharoffset.Rotation
mracharoffset = CFrame.new(mracharoffset.Position * CHARACTERSCALE) * mracharoffset.Rotation
mlacharoffset = CFrame.new(mlacharoffset.Position * CHARACTERSCALE) * mlacharoffset.Rotation
mrlcharoffset = CFrame.new(mrlcharoffset.Position * CHARACTERSCALE) * mrlcharoffset.Rotation
mllcharoffset = CFrame.new(mllcharoffset.Position * CHARACTERSCALE) * mllcharoffset.Rotation

-- 21/12/2023: I should fr rewrite this script or at least make it easier for skinning wtf?
local _mBodyOffsets = {}
do
	local _center = origmbody.PrimaryPart.CFrame
	local function _update(bodyPart, initialOffset)
		for _, part in bodyPart:GetDescendants() do
			if part:IsA("BasePart") then
				_mBodyOffsets[part] = (_center * initialOffset):ToObjectSpace(part.CFrame)
			end
		end
	end
	local raoffset = JCFrs.CharacterOffset * JCFrs.CurrentOffset
	local laoffset = JCFls.CharacterOffset * JCFls.CurrentOffset
	local rloffset = JCFrh.CharacterOffset * JCFrh.CurrentOffset
	local lloffset = JCFlh.CharacterOffset * JCFlh.CurrentOffset
	
	_update(origmbody["MTorso"], mtorsocharoffset)
	_update(origmbody["MRight Arm"], raoffset * mracharoffset)
	_update(origmbody["MLeft Arm"], laoffset * mlacharoffset)
	_update(origmbody["MRight Leg"], rloffset * mrlcharoffset)
	_update(origmbody["MLeft Leg"], lloffset * mllcharoffset)
	
	for part, cframe in _mBodyOffsets do
		_mBodyOffsets[part] = CSF:RoundCFrame(cframe, 4)
	end
end




---------------- SHOW/HIDE OBJECTS ----------------
-- Broom Show/Hide
local BroomActivated = true
local BroomSwitchTime = os.clock()
local BroomTWEENOBJ = ts:Create(workspace, TweenInfo.new(0), {}) -- Placeholder
function BroomSwitch(act)
	if BroomActivated == act then return end
	BroomActivated = act
	BroomSwitchTime = os.clock()
	local currentT = BroomSwitchTime

	local start, finish, levelswitch
	if BroomActivated == true then
		start = 1
		finish = 0
		levelswitch = SETTINGS.YUREI_LEVEL
	else
		start = 0
		finish = 1
		levelswitch = 0
		task.delay(0.1, function()
			if currentT == BroomSwitchTime then -- still same switch time (don't destroy if not switched)
				pcall(function()
					ADMbroom:GetCloneInst(origbroom):Destroy()
				end)
			end
		end)
	end

	for i, part in ADMbroom.OrigModel:GetDescendants() do
		if part:IsA("BasePart") then
			ADMbroom:SetRecordedProperty(part, "Transparency", start)
		end
	end
	ADMbroom:UpdateSetting("LEVEL", levelswitch)
	BroomTWEENOBJ:Pause()
	BroomTWEENOBJ = CSE:TweenCustom(start, finish, TweenInfo.new(0.15, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), function(val)
		for i, part in ADMbroom.OrigModel:GetDescendants() do
			if part:IsA("BasePart") then
				ADMbroom:SetRecordedProperty(part, "Transparency", val)
			end
		end
	end)
end

-- Hakero Show/Hide
local HakeroActivated = true
local HakeroSwitchTime = os.clock()
local HakeroTWEENOBJ = ts:Create(workspace, TweenInfo.new(0), {}) -- Placeholder
function HakeroSwitch(act)
	if HakeroActivated == act then return end
	HakeroActivated = act
	HakeroSwitchTime = os.clock()
	local currentT = HakeroSwitchTime

	local start, finish, levelswitch
	if HakeroActivated == true then
		start = 1
		finish = 0
		levelswitch = SETTINGS.YUREI_LEVEL
	else
		start = 0
		finish = 1
		levelswitch = 0
		task.delay(0.1, function()
			if currentT == HakeroSwitchTime then -- still same switch time (don't destroy if not switched)
				pcall(function()
					ADMhakero:GetCloneInst(orighakero):Destroy()
				end)
			end
		end)
	end

	local origprim = ADMhakero.OrigPrimaryPart
	for i, part in ADMhakero.OrigModel:GetDescendants() do
		if part:IsA("BasePart") and part ~= origprim then
			ADMhakero:SetRecordedProperty(part, "Transparency", start)
		end
	end
	ADMhakero:UpdateSetting("LEVEL", levelswitch)
	HakeroTWEENOBJ:Pause()
	HakeroTWEENOBJ = CSE:TweenCustom(start, finish, TweenInfo.new(0.15, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), function(val)
		for i, part in ADMhakero.OrigModel:GetDescendants() do
			if part:IsA("BasePart") and part ~= origprim then
				ADMhakero:SetRecordedProperty(part, "Transparency", val)
			end
		end
	end)
end


------------------------------------------------------------------------------------------------------------------------------------------
------------------------------ ANIMATIONS -------------------------------
local ANIMATIONS = {
	["IdleGround1"] = function(AT)
		BroomSwitch(false)
		HakeroSwitch(false)

		local newneckoffset = CFrame.Angles(0, mrad(33.75), 0)
		local newrtjoffset = CFrame.Angles(0, -mrad(33.75), 0)
		local newrsoffset = CFrame.new(Vector3.new(0.05, -0.15, -0.1) * CHARACTERSCALE) * CFrame.Angles(mrad(30), 0, -mrad(15))
		local newlsoffset = CFrame.new(Vector3.new(-0.05, 0, 0) * CHARACTERSCALE) * CFrame.Angles(0, 0, mrad(11.25))
		local newrhoffset = CFrame.Angles(-mrad(11.25), -mrad(30), mrad(7)) * CFrame.new(Vector3.new(0.35, 0, 0) * CHARACTERSCALE)
		local newlhoffset = CFrame.new(Vector3.new(-0.3, 0, -0.1) * CHARACTERSCALE) * CFrame.Angles(0, mrad(27), -mrad(10)) * CFrame.Angles(mrad(11), 0, 0)


		local tweeninfo = TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)

		AT:JointsOffsetTween("Neck", JCFneck.CurrentOffset, newneckoffset, tweeninfo)
		AT:JointsOffsetTween("RootJoint", JCFrtj.CurrentOffset, newrtjoffset, tweeninfo)
		AT:JointsOffsetTween("Right Shoulder", JCFrs.CurrentOffset, newrsoffset, tweeninfo)
		AT:JointsOffsetTween("Left Shoulder", JCFls.CurrentOffset, newlsoffset, tweeninfo)
		AT:JointsOffsetTween("Right Hip", JCFrh.CurrentOffset, newrhoffset, tweeninfo)
		AT:JointsOffsetTween("Left Hip", JCFlh.CurrentOffset, newlhoffset, tweeninfo)

		local newbroomoffset = CFrame.new(Vector3.new(0, 0, 2.5) * CHARACTERSCALE) * CFrame.Angles(-math.rad(90), 0, 0)
		AT:ObjectsOffsetTween("Broom", OCFbroom.CurrentOffset, newbroomoffset, tweeninfo)

		AT:Wait(tweeninfo.Time)

		local animsineval = 0
		while true do
			AT:Wait()

			AT:JointsOffsetChange("RootJoint", CFrame.new(0, msinrad(animsineval) * 0.075 * CHARACTERSCALE, 0) * newrtjoffset)
			AT:JointsOffsetChange("Right Hip", CFrame.new(0, -msinrad(animsineval) * 0.065 * CHARACTERSCALE, 0) * newrhoffset * CFrame.Angles(-msinrad(animsineval) * 0.01, 0, 0))
			AT:JointsOffsetChange("Left Hip", CFrame.new(0, -msinrad(animsineval) * 0.065 * CHARACTERSCALE, 0) * newlhoffset * CFrame.Angles(msinrad(animsineval) * 0.025, 0, 0))




			-- Delayed sine
			local dsine = math.max(0, animsineval - 33.75)
			AT:JointsOffsetChange("Neck", newneckoffset * CFrame.Angles(msinrad(dsine) * 0.075, 0, 0))

			local dsine2 = math.max(0, animsineval - 22.5)
			AT:JointsOffsetChange("Right Shoulder", CFrame.new(0, msinrad(dsine) * 0.075 * CHARACTERSCALE, 0) * newrsoffset * CFrame.Angles(-msinrad(dsine2) * 0.075, 0, 0))

			local dsine3 = math.max(0, animsineval - 45)
			AT:JointsOffsetChange("Left Shoulder", CFrame.new(Vector3.new(0, msinrad(dsine3) * 0.075, msinrad(dsine3) * 0.075) * CHARACTERSCALE) * newlsoffset * CFrame.Angles(-msinrad(dsine3) * 0.075, 0, 0))


			animsineval = animsineval + 1.5
		end
	end,
	["IdleGround2"] = function(AT)
		BroomSwitch(true)
		HakeroSwitch(false)

		-- References
		local newneckoffset = CFrame.Angles(0, mrad(33.75), 0)
		local newrtjoffset = CFrame.Angles(0, -mrad(21), 0)
		local newrsoffset = CFrame.new(Vector3.new(0.25, 0.5, 0.42) * CHARACTERSCALE) * CFrame.Angles(0, 0, mrad(67.5)) * CFrame.Angles(-mrad(22.5), 0, 0)
		local newlsoffset = CFrame.new(Vector3.new(-0.05, 0.15, 0.42) * CHARACTERSCALE) * CFrame.Angles(0, mrad(22.5), -mrad(26))
		local newrhoffset = CFrame.new(Vector3.new(0.2, 0.075, 0.225) * CHARACTERSCALE) * CFrame.Angles(-mrad(17), 0, mrad(11.25)) * CFrame.Angles(0, -mrad(22.5), 0)
		local newlhoffset = CFrame.new(Vector3.new(-0.15, 0, -0.05) * CHARACTERSCALE) * CFrame.Angles(mrad(6), mrad(22.5), -mrad(11.25))


		local tweeninfo = TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)

		AT:JointsOffsetTween("Neck", JCFneck.CurrentOffset, newneckoffset, tweeninfo)
		AT:JointsOffsetTween("RootJoint", JCFrtj.CurrentOffset, newrtjoffset, tweeninfo)
		AT:JointsOffsetTween("Right Shoulder", JCFrs.CurrentOffset, newrsoffset, tweeninfo)
		AT:JointsOffsetTween("Left Shoulder", JCFls.CurrentOffset, newlsoffset, tweeninfo)
		AT:JointsOffsetTween("Right Hip", JCFrh.CurrentOffset, newrhoffset, tweeninfo)
		AT:JointsOffsetTween("Left Hip", JCFlh.CurrentOffset, newlhoffset, tweeninfo)


		local initial = JCFrtj.CurrentOffset * JCFrs.CharacterOffset * JCFrs.CurrentOffset * CFrame.new(Vector3.new(0.35, -1, 0) * CHARACTERSCALE)
		local defaultbroomoffset = newrtjoffset * JCFrs.CharacterOffset * newrsoffset * CFrame.new(Vector3.new(0.35, -1, 0) * CHARACTERSCALE)
		local newbroomoffset = defaultbroomoffset * CFrame.Angles(0, mrad(90), 0) * CFrame.Angles(-mrad(22.5), 0, 0)
		AT:ObjectsOffsetTween("Broom", initial, newbroomoffset, tweeninfo)

		AT:Wait(tweeninfo.Time)

		local animsineval = 0
		while true do
			AT:Wait()

			AT:JointsOffsetChange("RootJoint", CFrame.new(0, msinrad(animsineval) * 0.075 * CHARACTERSCALE, 0) * newrtjoffset)
			AT:JointsOffsetChange("Right Hip", CFrame.new(0, -msinrad(animsineval) * 0.065 * CHARACTERSCALE, 0) * newrhoffset * CFrame.Angles(-msinrad(animsineval) * 0.01, 0, 0))
			AT:JointsOffsetChange("Left Hip", CFrame.new(0, -msinrad(animsineval) * 0.065 * CHARACTERSCALE, 0) * newlhoffset * CFrame.Angles(msinrad(animsineval) * 0.025, 0, 0))




			-- Delayed sine
			local dsine = math.max(0, animsineval - 33.75)
			AT:JointsOffsetChange("Neck", newneckoffset * CFrame.Angles(msinrad(dsine) * 0.075, 0, 0))

			local dsine2 = math.max(0, animsineval - 22.5)
			local sinersoffset = newrsoffset * CFrame.Angles(0, 0, -msinrad(dsine2) * 0.075)
			AT:JointsOffsetChange("Right Shoulder", sinersoffset)

			local dsine3 = math.max(0, animsineval - 45)
			AT:JointsOffsetChange("Left Shoulder", CFrame.new(Vector3.new(0, msinrad(dsine3) * 0.075, msinrad(dsine3) * 0.075) * CHARACTERSCALE) * newlsoffset * CFrame.Angles(-msinrad(dsine3) * 0.075, 0, -msinrad(dsine3) * 0.075))

			defaultbroomoffset = JCFrtj.CurrentOffset * JCFrs.CharacterOffset * JCFrs.CurrentOffset * CFrame.new(Vector3.new(0.35, -1, 0) * CHARACTERSCALE)
			local newbroomoffset = defaultbroomoffset * CFrame.Angles(0, mrad(90), 0) * CFrame.Angles(-mrad(22.5), 0, 0)
			AT:ObjectsOffsetChange("Broom", newbroomoffset * CFrame.Angles(0, -msinrad(dsine2) * 0.05, 0))

			animsineval = animsineval + 1.5
		end
	end,
	["Walking"] = function(AT)
		BroomSwitch(false)
		HakeroSwitch(false)

		-- Set to initial walking pose
		local tweeninfo = TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
		local tilt = 7
		local tiltlegoffset = -0.1

		local newneckoffset = CFrame.Angles(mrad(tilt), 0, 0)
		local newrtjoffset = CFrame.Angles(-mrad(tilt), 0, 0)
		local newrsoffset2 = CFrame.new(Vector3.new(0.05, 0.15, 0) * CHARACTERSCALE) * CFrame.Angles(0, 0, mrad(11.25))
		local newlsoffset2 = CFrame.new(Vector3.new(-0.05, 0.15, 0) * CHARACTERSCALE) * CFrame.Angles(0, 0, -mrad(11.25))

		AT:JointsOffsetTween("Neck", JCFneck.CurrentOffset, newneckoffset, tweeninfo)
		AT:JointsOffsetTween("RootJoint", JCFrtj.CurrentOffset, newrtjoffset, tweeninfo)
		AT:JointsOffsetTween("Right Shoulder", JCFrs.CurrentOffset, newrsoffset2, tweeninfo)
		AT:JointsOffsetTween("Left Shoulder", JCFls.CurrentOffset, newlsoffset2, tweeninfo)
		AT:JointsOffsetTween("Right Hip", JCFrh.CurrentOffset, CFrame.new(), tweeninfo)
		AT:JointsOffsetTween("Left Hip", JCFlh.CurrentOffset, CFrame.new(), tweeninfo)

		AT:Wait(tweeninfo.Time)

		local animsineval = 0
		while true do
			AT:Wait()

			newrtjoffset = CFrame.new(0, msinrad(animsineval * 2) * 0.15 * CHARACTERSCALE, 0) * CFrame.Angles(-mrad(7), 0, 0)

			local armsine = math.max(0, animsineval - 27)
			local newrsoffset = CFrame.new(0, msinrad(armsine*2) * 0.035 * CHARACTERSCALE, -msinrad(armsine) * 0.25 * CHARACTERSCALE) * newrsoffset2 * CFrame.Angles(msinrad(armsine) * 0.3, 0, 0)
			local newlsoffset = CFrame.new(0, msinrad(armsine*2) * 0.035 * CHARACTERSCALE, msinrad(armsine) * 0.25 * CHARACTERSCALE) * newlsoffset2 * CFrame.Angles(-msinrad(armsine) * 0.3, 0, 0)
			AT:JointsOffsetChange("RootJoint", newrtjoffset)
			AT:JointsOffsetChange("Right Shoulder", newrsoffset)
			AT:JointsOffsetChange("Left Shoulder", newlsoffset)

			local dsine = math.max(0, animsineval - 90)
			AT:JointsOffsetChange("Right Hip", CFrame.new(Vector3.new(0, math.max(0, msinrad(dsine) * 0.3), tiltlegoffset + (msinrad(animsineval) * 0.4)) * CHARACTERSCALE) * CFrame.Angles((-msinrad(animsineval) * 0.3), 0, 0))
			AT:JointsOffsetChange("Left Hip", CFrame.new(Vector3.new(0, math.max(0, -msinrad(dsine) * 0.3), tiltlegoffset + (-msinrad(animsineval) * 0.4)) * CHARACTERSCALE) * CFrame.Angles((msinrad(animsineval) * 0.3), 0, 0))

			animsineval = animsineval + (12 * (SETTINGS.WalkSpeed/16))

		end

	end,
	["Running"] = function(AT)
		BroomSwitch(false)
		HakeroSwitch(false)

		-- Set to initial walking pose
		local tweeninfo = TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)

		local tilt = 15
		local tiltlegoffset = -0.1
		local groundoffset = 0.2

		local newneckoffset = CFrame.Angles(mrad(tilt), 0, 0)
		local newrtjoffset = CFrame.Angles(-mrad(tilt), 0, 0)
		local newrsoffset2 = CFrame.new(Vector3.new(0.12, 0.25, 0) * CHARACTERSCALE) * CFrame.Angles(0, 0, mrad(35))
		local newlsoffset2 = CFrame.new(Vector3.new(-0.12, 0.25, 0) * CHARACTERSCALE) * CFrame.Angles(0, 0, -mrad(35))

		AT:JointsOffsetTween("Neck", JCFneck.CurrentOffset, newneckoffset, tweeninfo)
		AT:JointsOffsetTween("RootJoint", JCFrtj.CurrentOffset, newrtjoffset, tweeninfo)
		AT:JointsOffsetTween("Right Shoulder", JCFrs.CurrentOffset, newrsoffset2, tweeninfo)
		AT:JointsOffsetTween("Left Shoulder", JCFls.CurrentOffset, newlsoffset2, tweeninfo)
		AT:JointsOffsetTween("Right Hip", JCFrh.CurrentOffset, CFrame.new(0, groundoffset * CHARACTERSCALE, 0), tweeninfo)
		AT:JointsOffsetTween("Left Hip", JCFlh.CurrentOffset, CFrame.new(0, groundoffset * CHARACTERSCALE, 0), tweeninfo)


		AT:Wait(tweeninfo.Time)

		local animsineval = 0
		while true do
			AT:Wait()

			local armsine = math.max(0, animsineval - 27)
			local osine = math.max(0, armsine - 45)
			newrtjoffset = CFrame.new(0, msinrad(animsineval * 2) * 0.35 * CHARACTERSCALE, 0) * CFrame.Angles(-mrad(17), msinrad(armsine) * 0.1, 0)
			local newrsoffset = CFrame.new(0, msinrad(osine*2) * 0.15 * CHARACTERSCALE, -msinrad(armsine) * 0.9 * CHARACTERSCALE) * newrsoffset2 * CFrame.Angles(msinrad(armsine) * 1.2, 0, 0)
			local newlsoffset = CFrame.new(0, msinrad(osine*2) * 0.15 * CHARACTERSCALE, msinrad(armsine) * 0.9 * CHARACTERSCALE) * newlsoffset2 * CFrame.Angles(-msinrad(armsine) * 1.2, 0, 0)
			AT:JointsOffsetChange("RootJoint", newrtjoffset)
			AT:JointsOffsetChange("Right Shoulder", newrsoffset)
			AT:JointsOffsetChange("Left Shoulder", newlsoffset)

			local dsine = math.max(0, animsineval - 90-22.5)
			AT:JointsOffsetChange("Right Hip", CFrame.new(Vector3.new(0, math.max(0, msinrad(dsine) * 0.4) + groundoffset, tiltlegoffset + (msinrad(animsineval) * 0.9)) * CHARACTERSCALE) * CFrame.Angles(mrad(tilt-(90*0.8/2)+15)+(-msinrad(animsineval) * 0.8), 0, 0))
			AT:JointsOffsetChange("Left Hip", CFrame.new(Vector3.new(0, math.max(0, -msinrad(dsine) * 0.4) + groundoffset, tiltlegoffset + (-msinrad(animsineval) * 0.9)) * CHARACTERSCALE) * CFrame.Angles(mrad(tilt-(90*0.8/2)+15)+(msinrad(animsineval) * 0.8), 0, 0))

			animsineval = animsineval + (12 * (SETTINGS.RunSpeed/35))

		end

	end,
	["IdleFly"] = function(AT)
		BroomSwitch(true)
		HakeroSwitch(false)

		local tweeninfo = TweenInfo.new(0.75, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)

		local newneckoffset = CFrame.Angles(0, mrad(33.75), 0)
		local newrtjoffset = CFrame.Angles(0, -mrad(90), 0)
		local newrsoffset = CFrame.Angles(-mrad(20), 0, mrad(15))
		local newlsoffset = CFrame.Angles(-mrad(20), 0, -mrad(15))
		local newrhoffset = CFrame.new(Vector3.new(0.18, 0.3, -0.35) * CHARACTERSCALE) * CFrame.Angles(0, 0, mrad(11.25)) * CFrame.Angles(0, mrad(11.25), 0)
		local newlhoffset = CFrame.new(Vector3.new(-0.18, 0.3, -0.35) * CHARACTERSCALE) * CFrame.Angles(0, 0, -mrad(11.25)) * CFrame.Angles(0, -mrad(11.25), 0)

		AT:JointsOffsetTween("Neck", JCFneck.CurrentOffset, newneckoffset, tweeninfo)
		AT:JointsOffsetTween("RootJoint", JCFrtj.CurrentOffset, newrtjoffset, tweeninfo)
		AT:JointsOffsetTween("Right Shoulder", JCFrs.CurrentOffset, newrsoffset, tweeninfo)
		AT:JointsOffsetTween("Left Shoulder", JCFls.CurrentOffset, newlsoffset, tweeninfo)
		AT:JointsOffsetTween("Right Hip", JCFrh.CurrentOffset, newrhoffset, tweeninfo)
		AT:JointsOffsetTween("Left Hip", JCFlh.CurrentOffset, newlhoffset, tweeninfo)

		local newbroomoffset = JCFrtj.CharacterOffset * CFrame.new(Vector3.new(0 - 0.35, -1.25, 0) * CHARACTERSCALE) * CFrame.Angles(0, mrad(180), 0)
		AT:ObjectsOffsetTween("Broom", OCFbroom.CurrentOffset, JCFrtj.CharacterOffset * CFrame.new(Vector3.new(0 - 0.35, -1.25, 0) * CHARACTERSCALE) * CFrame.Angles(0, mrad(180), 0), tweeninfo)

		-- leg swing starts before everything else
		AT:Delay(0, function()
			local animsineval = 0
			while true do
				AT:Wait()
				AT:JointsOffsetChange("Right Hip", CFrame.new(Vector3.new(0, -msinrad(animsineval) * 0.065, msinrad(animsineval * 2) * 0.1) * CHARACTERSCALE) * newrhoffset * CFrame.Angles(-msinrad(animsineval * 2) * 17/90, 0, 0))
				AT:JointsOffsetChange("Left Hip", CFrame.new(Vector3.new(0, -msinrad(animsineval) * 0.065, -msinrad(animsineval * 2) * 0.1) * CHARACTERSCALE) * newlhoffset * CFrame.Angles(msinrad(animsineval * 2) * 17/90, 0, 0))

				animsineval = animsineval + 1.5
			end
		end)

		AT:Wait(tweeninfo.Time + 0.25)
		local animsineval = 0
		while true do
			AT:Wait()

			AT:JointsOffsetChange("RootJoint", CFrame.new(Vector3.new(0, msinrad(animsineval) * 0.075 + (msinrad(animsineval * 0.35) * 0.65), 0) * CHARACTERSCALE) * newrtjoffset)
			AT:JointsOffsetChange("Right Shoulder", newrsoffset * CFrame.new(0, -msinrad(animsineval) * 0.065 * CHARACTERSCALE, 0))
			AT:JointsOffsetChange("Left Shoulder", newlsoffset * CFrame.new(0, -msinrad(animsineval) * 0.065 * CHARACTERSCALE, 0))

			AT:ObjectsOffsetChange("Broom", newbroomoffset * CFrame.new(0, (msinrad(animsineval * 0.35) * 0.65) * CHARACTERSCALE, 0))




			-- Delayed sine
			local dsine = math.max(0, animsineval - 33.75)
			AT:JointsOffsetChange("Neck", newneckoffset * CFrame.Angles(msinrad(dsine) * 0.075, 0, 0))

			animsineval = animsineval + 1
		end

	end,
	["Flying"] = function(AT)
		BroomSwitch(true)
		HakeroSwitch(false)

		local tweeninfo = TweenInfo.new(0.75, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)

		local newneckoffset = CFrame.Angles(0, mrad(33.75), 0)
		local newrtjoffset = CFrame.Angles(0, -mrad(90), 0)
		local newrsoffset = CFrame.Angles(-mrad(20), 0, mrad(15))
		local newlsoffset = CFrame.Angles(-mrad(20), 0, -mrad(15))
		local newrhoffset = CFrame.new(Vector3.new(0.18, 0.3, -0.35) * CHARACTERSCALE) * CFrame.Angles(0, 0, mrad(11.25)) * CFrame.Angles(0, mrad(11.25), 0)
		local newlhoffset = CFrame.new(Vector3.new(-0.18, 0.3, -0.35) * CHARACTERSCALE) * CFrame.Angles(0, 0, -mrad(11.25)) * CFrame.Angles(0, -mrad(11.25), 0)

		AT:JointsOffsetTween("Neck", JCFneck.CurrentOffset, newneckoffset, tweeninfo)
		AT:JointsOffsetTween("RootJoint", JCFrtj.CurrentOffset, newrtjoffset, tweeninfo)
		AT:JointsOffsetTween("Right Shoulder", JCFrs.CurrentOffset, newrsoffset, tweeninfo)
		AT:JointsOffsetTween("Left Shoulder", JCFls.CurrentOffset, newlsoffset, tweeninfo)
		AT:JointsOffsetTween("Right Hip", JCFrh.CurrentOffset, newrhoffset, tweeninfo)
		AT:JointsOffsetTween("Left Hip", JCFlh.CurrentOffset, newlhoffset, tweeninfo)

		local newbroomoffset = JCFrtj.CharacterOffset * CFrame.new(Vector3.new(0 - 0.35, -1.25, 0) * CHARACTERSCALE) * CFrame.Angles(0, mrad(180), 0)
		AT:ObjectsOffsetTween("Broom", OCFbroom.CurrentOffset, newbroomoffset, tweeninfo)

		AT:Wait(tweeninfo.Time)

		local animsineval = 0
		while true do
			AT:Wait()
			local ysine = (msinrad((animsineval * 2)-90) + 1) * 0.65
			local anglesine = math.abs(msinrad(animsineval) * 0.14)

			AT:JointsOffsetChange("RootJoint", newrtjoffset * CFrame.new(Vector3.new(0, ysine, -msinrad(animsineval) * 3.5) * CHARACTERSCALE) * CFrame.Angles(msinrad(animsineval) * 0.25, 0, anglesine), tweeninfo)
			AT:JointsOffsetChange("Right Hip", CFrame.new(Vector3.new(0, -msinrad(animsineval) * 0.065, msinrad(animsineval * 2.25) * 0.1) * CHARACTERSCALE) * newrhoffset * CFrame.Angles(-msinrad(animsineval * 2.25) * 17/90, 0, 0))
			AT:JointsOffsetChange("Left Hip", CFrame.new(Vector3.new(0, -msinrad(animsineval) * 0.065, -msinrad(animsineval * 2.25) * 0.1) * CHARACTERSCALE) * newlhoffset * CFrame.Angles(msinrad(animsineval * 2.25) * 17/90, 0, 0))

			AT:ObjectsOffsetChange("Broom", newbroomoffset * CFrame.new(Vector3.new(-msinrad(animsineval) * 3.5, ysine, 0) * CHARACTERSCALE) * CFrame.Angles(anglesine, 0, 0), tweeninfo)
			animsineval = animsineval + 0.7
		end

	end,
	["FlyToGround"] = function(AT)
		BroomSwitch(false)
		HakeroSwitch(false)

		local tweeninfo = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)

		local newneckoffset = CFrame.Angles(-mrad(33.75), 0, 0)
		local newrtjoffset = CFrame.new(Vector3.new(0, 5, 0) * CHARACTERSCALE) * CFrame.Angles(mrad(13), 0, 0)
		local newrsoffset = CFrame.Angles(-mrad(35), 0, mrad(15))
		local newlsoffset = CFrame.Angles(-mrad(35), 0, -mrad(15))
		local newrhoffset = CFrame.new(Vector3.new(0.125, 0.45, -0.35) * CHARACTERSCALE) * CFrame.Angles(-mrad(25), 0, mrad(7))
		local newlhoffset = CFrame.new(Vector3.new(-0.125, 0.45, -0.1) * CHARACTERSCALE) * CFrame.Angles(-mrad(55), 0, -mrad(7))

		AT:JointsOffsetTween("Neck", JCFneck.CurrentOffset, newneckoffset, tweeninfo)
		AT:JointsOffsetTween("RootJoint", JCFrtj.CurrentOffset, newrtjoffset, tweeninfo)
		AT:JointsOffsetTween("Right Shoulder", JCFrs.CurrentOffset, newrsoffset, tweeninfo)
		AT:JointsOffsetTween("Left Shoulder", JCFls.CurrentOffset, newlsoffset, tweeninfo)
		AT:JointsOffsetTween("Right Hip", JCFrh.CurrentOffset, newrhoffset, tweeninfo)
		AT:JointsOffsetTween("Left Hip", JCFlh.CurrentOffset, newlhoffset, tweeninfo)

		AT:ObjectsOffsetTween("Broom", OCFbroom.CurrentOffset, JCFrtj.CharacterOffset * CFrame.new(Vector3.new(-4, -1.25 + 8 - 0.75, 0) * CHARACTERSCALE) * CFrame.Angles(0, mrad(180), 0), tweeninfo)
	end,
	["GroundToFly"] = function(AT)
		BroomSwitch(true)
		HakeroSwitch(false)

		local tweeninfo = TweenInfo.new(0.35, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
		AT:JointsOffsetTween("Right Shoulder", JCFrs.CurrentOffset, CFrame.new(Vector3.new(-0.3, 1.35, -0.25) * CHARACTERSCALE) * CFrame.Angles(mrad(155), 0, -mrad(17)), tweeninfo)
		AT:JointsOffsetTween("Left Shoulder", JCFls.CurrentOffset, CFrame.new(Vector3.new(0.3, 1.3, -0.2) * CHARACTERSCALE) * CFrame.Angles(mrad(140), 0, mrad(17)), tweeninfo)

		tweeninfo = TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
		AT:JointsOffsetTween("Neck", JCFneck.CurrentOffset, CFrame.Angles(-mrad(28), 0, 0), tweeninfo)
		AT:JointsOffsetTween("RootJoint", JCFrtj.CurrentOffset, CFrame.new(Vector3.new(0, 4, 0) * CHARACTERSCALE) * CFrame.Angles(0, -mrad(60), 0) * CFrame.Angles(-mrad(28), 0, 0), tweeninfo)
		AT:JointsOffsetTween("Right Hip", JCFrh.CurrentOffset, CFrame.new(Vector3.new(0, 0.65, -0.3) * CHARACTERSCALE) * CFrame.Angles(-mrad(33.75), 0, 0) * CFrame.new(0, 0.15, 0), tweeninfo)
		AT:JointsOffsetTween("Left Hip", JCFlh.CurrentOffset, CFrame.new(Vector3.new(0, 0.5, -0.7) * CHARACTERSCALE) * CFrame.Angles(mrad(22.5), 0, 0), tweeninfo)

		local broomtweeninfo = TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
		AT:ObjectsOffsetChange("Broom", JCFrtj.CharacterOffset * CFrame.new(Vector3.new(-1, 10, 0) * CHARACTERSCALE) * CFrame.Angles(0, mrad(180), 0))
		AT:ObjectsOffsetTween("Broom", OCFbroom.CurrentOffset, JCFrtj.CharacterOffset * CFrame.new(Vector3.new(-1, -1.25, 0) * CHARACTERSCALE) * CFrame.Angles(0, mrad(180), 0), broomtweeninfo)

		AT:Wait(tweeninfo.Time*2/3)

		tweeninfo = TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.In)
		AT:JointsOffsetTween("RootJoint", JCFrtj.CurrentOffset, CFrame.Angles(0, -mrad(90), 0) * CFrame.new(Vector3.new(0, 0, 1) * CHARACTERSCALE), tweeninfo)
		AT:JointsOffsetTween("Right Hip", JCFrh.CurrentOffset, CFrame.new(Vector3.new(0, 0.65, -0.3) * CHARACTERSCALE) * CFrame.Angles(-mrad(7), 0, 0) * CFrame.new(Vector3.new(0, 0.15, 0) * CHARACTERSCALE), tweeninfo)
		AT:JointsOffsetTween("Left Hip", JCFlh.CurrentOffset, CFrame.new(Vector3.new(0, 0.5, -0.7) * CHARACTERSCALE) * CFrame.Angles(0, 0, 0), tweeninfo)

		-- Broom Impact
		AT:Wait(tweeninfo.Time)
		tweeninfo = TweenInfo.new(0.175, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
		AT:JointsOffsetTween("Neck", JCFneck.CurrentOffset, CFrame.Angles(0, mrad(33.75), 0), tweeninfo)
		AT:JointsOffsetTween("Right Shoulder", JCFrs.CurrentOffset, CFrame.new(Vector3.new(0, 0, -0.15) * CHARACTERSCALE) * CFrame.Angles(mrad(35), 0, mrad(10)), tweeninfo)
		AT:JointsOffsetTween("Left Shoulder", JCFls.CurrentOffset, CFrame.new(Vector3.new(0, 0, -0.15) * CHARACTERSCALE) * CFrame.Angles(mrad(35), 0, -mrad(10)), tweeninfo)
		AT:JointsOffsetTween("Right Hip", JCFrh.CurrentOffset, CFrame.new(Vector3.new(0.15, 0.5, -0.5) * CHARACTERSCALE) * CFrame.Angles(mrad(30), 0, mrad(5)), tweeninfo)
		AT:JointsOffsetTween("Left Hip", JCFlh.CurrentOffset, CFrame.new(Vector3.new(-0.15, 0.3, -0.35) * CHARACTERSCALE) * CFrame.Angles(mrad(40), 0, -mrad(5)), tweeninfo)

		-- Transition to IdleFly
		AT:Delay(tweeninfo.Time, function()
			local newrsoffset = CFrame.Angles(-mrad(20), 0, mrad(15))
			local newlsoffset = CFrame.Angles(-mrad(20), 0, -mrad(15))
			tweeninfo = TweenInfo.new(0.35, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
			AT:JointsOffsetTween("Right Shoulder", JCFrs.CurrentOffset, newrsoffset, tweeninfo)
			AT:JointsOffsetTween("Left Shoulder", JCFls.CurrentOffset, newlsoffset, tweeninfo)
		end)
		AT:Delay(tweeninfo.Time, function()
			local newrhoffset = CFrame.new(Vector3.new(0.18, 0.3, -0.35) * CHARACTERSCALE) * CFrame.Angles(0, 0, mrad(11.25)) * CFrame.Angles(0, mrad(11.25), 0)
			local newlhoffset = CFrame.new(Vector3.new(-0.18, 0.3, -0.35) * CHARACTERSCALE) * CFrame.Angles(0, 0, -mrad(11.25)) * CFrame.Angles(0, -mrad(11.25), 0)
			tweeninfo = TweenInfo.new(0.75, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
			AT:JointsOffsetTween("Right Hip", JCFrh.CurrentOffset, newrhoffset, tweeninfo)
			AT:JointsOffsetTween("Left Hip", JCFlh.CurrentOffset, newlhoffset, tweeninfo)
		end)

		tweeninfo = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut)
		AT:JointsOffsetTween("RootJoint", JCFrtj.CurrentOffset, CFrame.Angles(0, -mrad(90), 0) * CFrame.new(Vector3.new(-0.5, -1.5, -0.25) * CHARACTERSCALE) * CFrame.Angles(-mrad(20), 0, 0), tweeninfo)
		AT:ObjectsOffsetTween("Broom", OCFbroom.CurrentOffset, JCFrtj.CharacterOffset * CFrame.new(Vector3.new(0.25 - 0.5, -2.75, -0.5) * CHARACTERSCALE) * CFrame.Angles(0, mrad(180), 0), tweeninfo)



	end,
	["Jumping"] = function(AT)
		BroomSwitch(false)
		HakeroSwitch(false)

		-- Reset to idle
		local tweeninfo = TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)

		AT:JointsOffsetTween("Neck", JCFneck.CurrentOffset, CFrame.Angles(-mrad(7), 0, 0), tweeninfo)
		AT:JointsOffsetTween("RootJoint", JCFrtj.CurrentOffset, CFrame.new(Vector3.new(0, 0.25, 0) * CHARACTERSCALE) * CFrame.Angles(mrad(7), 0, 0), tweeninfo)
		AT:JointsOffsetTween("Right Shoulder", JCFrs.CurrentOffset, CFrame.new(Vector3.new(0.15, 0.05, 0.22) * CHARACTERSCALE) * CFrame.Angles(-mrad(45), 0, mrad(11.25)), tweeninfo)
		AT:JointsOffsetTween("Left Shoulder", JCFls.CurrentOffset, CFrame.new(Vector3.new(-0.15, 0.05, -0.15) * CHARACTERSCALE) * CFrame.Angles(mrad(17), 0, -mrad(11.25)), tweeninfo)
		AT:JointsOffsetTween("Right Hip", JCFrh.CurrentOffset, CFrame.new(Vector3.new(0, 0.15, 0.2) * CHARACTERSCALE) * CFrame.Angles(-mrad(11.25), 0, 0), tweeninfo)
		AT:JointsOffsetTween("Left Hip", JCFlh.CurrentOffset, CFrame.new(Vector3.new(0, 0.2, 0.15) * CHARACTERSCALE) * CFrame.Angles(-mrad(18), 0, 0), tweeninfo)

		local broomtweeninfo = TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
		local newbroomoffset = CFrame.new(Vector3.new(0, 0, 2.5) * CHARACTERSCALE) * CFrame.Angles(-math.rad(90), 0, 0)
		AT:ObjectsOffsetTween("Broom", OCFbroom.CurrentOffset, newbroomoffset, broomtweeninfo)

		AT:Wait(tweeninfo.Time)

		tweeninfo = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
		AT:JointsOffsetTween("Neck", JCFneck.CurrentOffset, CFrame.Angles(-mrad(15), 0, 0), tweeninfo)
		AT:JointsOffsetTween("RootJoint", JCFrtj.CurrentOffset, CFrame.new(Vector3.new(0, 0.6, 0) * CHARACTERSCALE), tweeninfo)
		AT:JointsOffsetTween("Right Shoulder", JCFrs.CurrentOffset, CFrame.new(Vector3.new(0.22, 0.1, -0.25) * CHARACTERSCALE) * CFrame.Angles(mrad(64), 0, mrad(17)), tweeninfo)
		AT:JointsOffsetTween("Left Shoulder", JCFls.CurrentOffset, CFrame.new(Vector3.new(-0.22, 0.1, -0.2) * CHARACTERSCALE) * CFrame.Angles(mrad(55), 0, -mrad(17)), tweeninfo)
		AT:JointsOffsetTween("Right Hip", JCFrh.CurrentOffset, CFrame.new(Vector3.new(0, 0.5, -0.05) * CHARACTERSCALE) * CFrame.Angles(-mrad(47), 0, 0), tweeninfo)
		AT:JointsOffsetTween("Left Hip", JCFlh.CurrentOffset, CFrame.new(Vector3.new(0, 0.35, -0.07) * CHARACTERSCALE) * CFrame.Angles(-mrad(26), 0, 0), tweeninfo)







	end,
	["Falling"] = function(AT)
		BroomSwitch(false)
		HakeroSwitch(false)

		local tweeninfo = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)

		AT:JointsOffsetTween("Neck", JCFneck.CurrentOffset, CFrame.Angles(-mrad(20), 0, 0), tweeninfo)
		AT:JointsOffsetTween("RootJoint", JCFrtj.CurrentOffset, CFrame.new(Vector3.new(0, 0.15, 0) * CHARACTERSCALE), tweeninfo)
		AT:JointsOffsetTween("Right Shoulder", JCFrs.CurrentOffset, CFrame.new(Vector3.new(0.05, 0.8, -0.25) * CHARACTERSCALE) * CFrame.Angles(mrad(100), 0, mrad(4)), tweeninfo)
		AT:JointsOffsetTween("Left Shoulder", JCFls.CurrentOffset, CFrame.new(Vector3.new(-0.05, 0.7, -0.2) * CHARACTERSCALE) * CFrame.Angles(mrad(85), 0, -mrad(4)), tweeninfo)
		AT:JointsOffsetTween("Right Hip", JCFrh.CurrentOffset, CFrame.new(Vector3.new(0, 0.7, -0.07) * CHARACTERSCALE) * CFrame.Angles(-mrad(60), 0, 0), tweeninfo)
		AT:JointsOffsetTween("Left Hip", JCFlh.CurrentOffset, CFrame.new(Vector3.new(0, 0.45, -0.1) * CHARACTERSCALE) * CFrame.Angles(-mrad(35), 0, 0), tweeninfo)

		local broomtweeninfo = TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
		local newbroomoffset = CFrame.new(Vector3.new(0, 0, 2.5) * CHARACTERSCALE) * CFrame.Angles(-math.rad(90), 0, 0)
		AT:ObjectsOffsetTween("Broom", OCFbroom.CurrentOffset, newbroomoffset, broomtweeninfo)

		AT:Wait(tweeninfo.Time * 2/3)

		tweeninfo = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
		AT:JointsOffsetTween("Neck", JCFneck.CurrentOffset, CFrame.Angles(-mrad(28), 0, 0), tweeninfo)
		AT:JointsOffsetTween("RootJoint", JCFrtj.CurrentOffset, CFrame.Angles(-mrad(7), 0, 0), tweeninfo)
		AT:JointsOffsetTween("Right Shoulder", JCFrs.CurrentOffset, CFrame.new(Vector3.new(-0.3, 1.35, -0.25) * CHARACTERSCALE) * CFrame.Angles(mrad(155), 0, -mrad(17)), tweeninfo)
		AT:JointsOffsetTween("Left Shoulder", JCFls.CurrentOffset, CFrame.new(Vector3.new(0.3, 1.3, -0.2) * CHARACTERSCALE) * CFrame.Angles(mrad(140), 0, mrad(17)), tweeninfo)
		AT:JointsOffsetTween("Right Hip", JCFrh.CurrentOffset, CFrame.new(Vector3.new(0.17, 0.1, 0) * CHARACTERSCALE) * CFrame.Angles(-mrad(25), 0, mrad(11.25)), tweeninfo)
		AT:JointsOffsetTween("Left Hip", JCFlh.CurrentOffset, CFrame.new(Vector3.new(-0.17, 0.45, 0.15) * CHARACTERSCALE) * CFrame.Angles(-mrad(40), 0, -mrad(11.25)), tweeninfo)
	end,
	["FallImpact"] = function(AT)
		BroomSwitch(false)
		HakeroSwitch(false)

		local tweeninfo = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)

		AT:JointsOffsetTween("Neck", JCFneck.CurrentOffset, CFrame.Angles(mrad(13), 0, 0), tweeninfo)
		AT:JointsOffsetTween("RootJoint", JCFrtj.CurrentOffset, CFrame.new(Vector3.new(0, -1.2, -0.25) * CHARACTERSCALE) * CFrame.Angles(-mrad(17), 0, 0), tweeninfo)
		AT:JointsOffsetTween("Right Hip", JCFrh.CurrentOffset, CFrame.new(Vector3.new(0.2, 0.7, -0.05) * CHARACTERSCALE) * CFrame.Angles(-mrad(47), 0, mrad(17)), tweeninfo)
		AT:JointsOffsetTween("Left Hip", JCFlh.CurrentOffset, CFrame.new(Vector3.new(-0.2, 0.7, -0.05) * CHARACTERSCALE) * CFrame.Angles(-mrad(47), 0, -mrad(17)), tweeninfo)

		local tweeninfo2 = TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut)
		AT:JointsOffsetTween("Right Shoulder", JCFrs.CurrentOffset, CFrame.new(Vector3.new(-0.125, 0.05, -0.18) * CHARACTERSCALE) * CFrame.Angles(mrad(30), 0, mrad(11.25)), tweeninfo2)
		AT:JointsOffsetTween("Left Shoulder", JCFls.CurrentOffset, CFrame.new(Vector3.new(-0.125, 0.05, -0.18) * CHARACTERSCALE) * CFrame.Angles(mrad(30), 0, -mrad(11.25)), tweeninfo2)

		AT:Wait(tweeninfo2.Time*2/3)

		local tweeninfo3 = TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
		AT:JointsOffsetTween("Right Shoulder", JCFrs.CurrentOffset, CFrame.new(Vector3.new(-0.125, 0.05, 0.18) * CHARACTERSCALE) * CFrame.Angles(-mrad(30), 0, mrad(11.25)), tweeninfo3)
		AT:JointsOffsetTween("Left Shoulder", JCFls.CurrentOffset, CFrame.new(Vector3.new(-0.125, 0.05, 0.18) * CHARACTERSCALE) * CFrame.Angles(-mrad(30), 0, -mrad(11.25)), tweeninfo3)	
	end,






	------------------------------------------------------------------------------------------------------------------------------------------
	["DashGround"] = function(AT)
		BroomSwitch(false)
		HakeroSwitch(false)

		local tweeninfo = TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)

		local newneckoffset = CFrame.Angles(-mrad(36), 0, 0)
		local newrtjoffset = CFrame.new(Vector3.new(0, 0.17 - 2.3, 0) * CHARACTERSCALE) * CFrame.Angles(mrad(36), 0, 0)
		local newrsoffset = CFrame.new(Vector3.new(0.2, 0.2, 0.23) * CHARACTERSCALE) * CFrame.Angles(-mrad(36 + 27), 0, mrad(33))
		local newlsoffset = CFrame.new(Vector3.new(0.1, 1.12, -0.27) * CHARACTERSCALE) * CFrame.Angles(mrad(172 - 36), 0, mrad(30)) * CFrame.new(0, -0.27, 0)
		local newrhoffset = CFrame.new(Vector3.new(0, -0.17, 0) * CHARACTERSCALE) * CFrame.new(Vector3.new(0, 0.5, -1) * CHARACTERSCALE) * CFrame.Angles(mrad(82 - 36), 0, 0)
		local newlhoffset = CFrame.new(Vector3.new(0, -0.17, 0) * CHARACTERSCALE) * CFrame.new(Vector3.new(0, 0.9, -0.36) * CHARACTERSCALE) * CFrame.Angles(-mrad(28), 0, 0)

		AT:JointsOffsetTween("Neck", JCFneck.CurrentOffset, newneckoffset, tweeninfo)
		AT:JointsOffsetTween("RootJoint", JCFrtj.CurrentOffset, newrtjoffset, tweeninfo)
		AT:JointsOffsetTween("Right Shoulder", JCFrs.CurrentOffset, newrsoffset, tweeninfo)
		AT:JointsOffsetTween("Left Shoulder", JCFls.CurrentOffset, newlsoffset, tweeninfo)
		AT:JointsOffsetTween("Right Hip", JCFrh.CurrentOffset, newrhoffset, tweeninfo)
		AT:JointsOffsetTween("Left Hip", JCFlh.CurrentOffset, newlhoffset, tweeninfo)

	end,
	["DashAir"] = function(AT)
		BroomSwitch(true)
		AT:Delay(0.75, function()
			BroomSwitch(false)
		end)
		HakeroSwitch(false)

		local broomoffset = CFrame.new()
		-- Broom follow right arm
		AT:Delay(0, function()
			while true do
				local defaultoffset = JCFrtj.CurrentOffset * JCFrs.CharacterOffset * JCFrs.CurrentOffset * CFrame.new(Vector3.new(0, -1, 0) * CHARACTERSCALE)
				AT:ObjectsOffsetChange("Broom", defaultoffset * broomoffset)
				AT:Wait()
			end
		end)



		local tweeninfo = TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)

		local newneckoffset = CFrame.Angles(mrad(26), 0, 0)
		local newrtjoffset = CFrame.Angles(-mrad(36), 0, 0)
		local newrsoffset = CFrame.new(Vector3.new(0.12, 0, 0.42) * CHARACTERSCALE) * CFrame.Angles(-mrad(52), 0, mrad(56))
		local newlsoffset = CFrame.new(Vector3.new(-0.3, 0, -0.075) * CHARACTERSCALE) * CFrame.Angles(-mrad(35), 0, -mrad(35))
		local newrhoffset = CFrame.new(Vector3.new(0, 0.4, 0.25) * CHARACTERSCALE) * CFrame.Angles(-mrad(48), 0, 0)
		local newlhoffset = CFrame.new(Vector3.new(0, 0.4, 0.25) * CHARACTERSCALE) * CFrame.Angles(-mrad(70), 0, 0)

		AT:JointsOffsetTween("Neck", JCFneck.CurrentOffset, newneckoffset, tweeninfo)
		AT:JointsOffsetTween("RootJoint", JCFrtj.CurrentOffset, newrtjoffset, tweeninfo)
		AT:JointsOffsetTween("Right Shoulder", JCFrs.CurrentOffset, newrsoffset, tweeninfo)
		AT:JointsOffsetTween("Left Shoulder", JCFls.CurrentOffset, newlsoffset, tweeninfo)
		AT:JointsOffsetTween("Right Hip", JCFrh.CurrentOffset, newrhoffset, tweeninfo)
		AT:JointsOffsetTween("Left Hip", JCFlh.CurrentOffset, newlhoffset, tweeninfo)

		local newbroomoffset = CFrame.Angles(mrad(110), mrad(37), 0) * CFrame.new(Vector3.new(-0.5, 0, -2.65) * CHARACTERSCALE)
		CSE:TweenCustom(broomoffset, newbroomoffset, tweeninfo, function(val)
			broomoffset = val
		end)

		AT:Wait(tweeninfo.Time * 2/3)







		tweeninfo = TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)

		local newneckoffset = CFrame.Angles(mrad(40), 0, 0)
		local newrtjoffset = CFrame.Angles(-mrad(48), 0, 0)
		local newrsoffset = CFrame.new(Vector3.new(-0.45, 0.57, -0.72) * CHARACTERSCALE) * CFrame.Angles(mrad(102), 0, -mrad(37))
		local newlsoffset = CFrame.new(Vector3.new(0.45, 0.57, -0.72) * CHARACTERSCALE) * CFrame.Angles(mrad(102), 0, mrad(37))
		local newrhoffset = CFrame.new(Vector3.new(0, 0.5, 0.4) * CHARACTERSCALE) * CFrame.Angles(-mrad(57), 0, 0)
		local newlhoffset = CFrame.new(Vector3.new(0, 0.5, 0.4) * CHARACTERSCALE) * CFrame.Angles(-mrad(95), 0, 0)

		AT:JointsOffsetTween("Neck", JCFneck.CurrentOffset, newneckoffset, tweeninfo)
		AT:JointsOffsetTween("RootJoint", JCFrtj.CurrentOffset, newrtjoffset, tweeninfo)
		AT:JointsOffsetTween("Right Shoulder", JCFrs.CurrentOffset, newrsoffset, tweeninfo)
		AT:JointsOffsetTween("Left Shoulder", JCFls.CurrentOffset, newlsoffset, tweeninfo)
		AT:JointsOffsetTween("Right Hip", JCFrh.CurrentOffset, newrhoffset, tweeninfo)
		AT:JointsOffsetTween("Left Hip", JCFlh.CurrentOffset, newlhoffset, tweeninfo)


		local tweeninfo2 = TweenInfo.new(0.075, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut)
		local newbroomoffset = CFrame.Angles(-mrad(56), mrad(215), 0)
		local tween = CSE:TweenCustom(broomoffset, newbroomoffset, tweeninfo2, function(val)
			broomoffset = val
		end)

		AT:Delay(tweeninfo.Time * 2/3, function()
			tween:Pause()
			local tweeninfo = TweenInfo.new(tweeninfo2.Time, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut)
			local newbroomoffset = CFrame.new(Vector3.new(-0.5, 0, 0) * CHARACTERSCALE) * CFrame.Angles(0, mrad(180), 0)
			CSE:TweenCustom(broomoffset, newbroomoffset, tweeninfo, function(val)
				broomoffset = val
			end).Completed:Connect(function()
				local r = 7
				local tweeninfo = TweenInfo.new(1/r, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut)
				for i = 1, r do
					local tween = CSE:TweenCustom(broomoffset, broomoffset * CFrame.Angles(0, -mrad(179), 0), tweeninfo, function(val)
						broomoffset = val
					end)
					tween.Completed:Wait()
				end
			end)
		end)

		AT:Wait(tweeninfo.Time * 2/3)






		tweeninfo = TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)

		local newneckoffset = CFrame.Angles(mrad(56), 0, 0)
		local newrtjoffset = CFrame.Angles(-mrad(82), 0, 0)
		local newrsoffset = CFrame.new(Vector3.new(-0.35, 1.87, -0.32) * CHARACTERSCALE) * CFrame.Angles(mrad(165), 0, -mrad(25))
		local newlsoffset = CFrame.new(Vector3.new(0.35, 1.87, -0.32) * CHARACTERSCALE) * CFrame.Angles(mrad(165), 0, mrad(25))
		local newrhoffset = CFrame.new(Vector3.new(0.2, 0.1, 0.15) * CHARACTERSCALE) * CFrame.Angles(-mrad(17), 0, mrad(11))
		local newlhoffset = CFrame.new(Vector3.new(-0.2, 0.1, 0.15) * CHARACTERSCALE) * CFrame.Angles(-mrad(17), 0, -mrad(11))

		AT:JointsOffsetTween("Neck", JCFneck.CurrentOffset, newneckoffset, tweeninfo)
		AT:JointsOffsetTween("RootJoint", JCFrtj.CurrentOffset, newrtjoffset, tweeninfo)
		AT:JointsOffsetTween("Right Shoulder", JCFrs.CurrentOffset, newrsoffset, tweeninfo)
		AT:JointsOffsetTween("Left Shoulder", JCFls.CurrentOffset, newlsoffset, tweeninfo)
		AT:JointsOffsetTween("Right Hip", JCFrh.CurrentOffset, newrhoffset, tweeninfo)
		AT:JointsOffsetTween("Left Hip", JCFlh.CurrentOffset, newlhoffset, tweeninfo)

	end,
	["N1Ground"] = function(AT)
		BroomSwitch(false)
		HakeroSwitch(false)

		local tweeninfo = TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.In)

		local newneckoffset = CFrame.new(Vector3.new(0, 0.03, -0.12) * CHARACTERSCALE) * CFrame.Angles(-mrad(23), mrad(28), 0)
		local newrtjoffset = CFrame.Angles(mrad(40),  -mrad(38), 0)
		local newrsoffset = CFrame.new(Vector3.new(0.22, 0.4, -0.4) * CHARACTERSCALE) * CFrame.Angles(mrad(54), 0, mrad(13))
		local newlsoffset = CFrame.new(Vector3.new(-0.6, 0.6, -0.3) * CHARACTERSCALE) * CFrame.Angles(mrad(78), 0, -mrad(82))
		local newrhoffset = CFrame.new(Vector3.new(0.27, 0.15, 0.3) * CHARACTERSCALE) * CFrame.Angles(-mrad(49), 0, mrad(7)) * CFrame.Angles(0, -mrad(25), 0)
		local newlhoffset = CFrame.new(Vector3.new(-0.6, 0.4, -0.9) * CHARACTERSCALE) * CFrame.Angles(mrad(45), 0, -mrad(32)) * CFrame.Angles(0, mrad(15), 0)

		AT:JointsOffsetTween("Neck", JCFneck.CurrentOffset, newneckoffset, tweeninfo)
		AT:JointsOffsetTween("RootJoint", JCFrtj.CurrentOffset, newrtjoffset, tweeninfo)
		AT:JointsOffsetTween("Right Shoulder", JCFrs.CurrentOffset, newrsoffset, tweeninfo)
		AT:JointsOffsetTween("Left Shoulder", JCFls.CurrentOffset, newlsoffset, tweeninfo)
		AT:JointsOffsetTween("Right Hip", JCFrh.CurrentOffset, newrhoffset, tweeninfo)
		AT:JointsOffsetTween("Left Hip", JCFlh.CurrentOffset, newlhoffset, tweeninfo)

	end,
	["N1Air"] = function(AT)
		BroomSwitch(false)
		HakeroSwitch(false)

		local tweeninfo = TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.In)

		local newneckoffset = CFrame.new(Vector3.new(0, 0.05, -0.7) * CHARACTERSCALE) * CFrame.Angles(-mrad(23), -mrad(15), 0)
		local newrtjoffset = CFrame.new(Vector3.new(0, -0.8, 0) * CHARACTERSCALE) * CFrame.Angles(mrad(50),  mrad(55), 0)
		local newrsoffset = CFrame.new(Vector3.new(0.2, 0.6, -0.6) * CHARACTERSCALE) * CFrame.Angles(mrad(67), 0, mrad(56))
		local newlsoffset = CFrame.new(Vector3.new(-0.27, 0.8, -0.4) * CHARACTERSCALE) * CFrame.Angles(mrad(66), 0, -mrad(12))
		local newrhoffset = CFrame.new(Vector3.new(0.5, 0.3, -0.4) * CHARACTERSCALE) * CFrame.Angles(mrad(28), 0, mrad(13)) * CFrame.Angles(0, mrad(13), 0)
		local newlhoffset = CFrame.new(Vector3.new(-0.2, 0.7, -0.5) * CHARACTERSCALE) * CFrame.Angles(-mrad(34), 0, -mrad(27))

		AT:JointsOffsetTween("Neck", JCFneck.CurrentOffset, newneckoffset, tweeninfo)
		AT:JointsOffsetTween("RootJoint", JCFrtj.CurrentOffset, newrtjoffset, tweeninfo)
		AT:JointsOffsetTween("Right Shoulder", JCFrs.CurrentOffset, newrsoffset, tweeninfo)
		AT:JointsOffsetTween("Left Shoulder", JCFls.CurrentOffset, newlsoffset, tweeninfo)
		AT:JointsOffsetTween("Right Hip", JCFrh.CurrentOffset, newrhoffset, tweeninfo)
		AT:JointsOffsetTween("Left Hip", JCFlh.CurrentOffset, newlhoffset, tweeninfo)

	end,
	["N2Ground"] = function(AT)
		BroomSwitch(true)
		AT:Delay(0.25, function()
			BroomSwitch(false)
		end)
		HakeroSwitch(false)

		local tweeninfo = TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.In)

		local newneckoffset = CFrame.Angles(0, mrad(60), 0)
		local newrtjoffset = CFrame.Angles(0,  -mrad(60), 0)
		local newrsoffset = CFrame.new(Vector3.new(0.5, 0.4, -0.6) * CHARACTERSCALE) * CFrame.Angles(mrad(60), 0, mrad(53))
		local newlsoffset = CFrame.new(Vector3.new(-0.63, 0.6, -0.56) * CHARACTERSCALE) * CFrame.Angles(mrad(90), 0, -mrad(57))
		local newrhoffset = CFrame.new(Vector3.new(0.4, 0, 0) * CHARACTERSCALE) * CFrame.Angles(-mrad(7), 0, mrad(15)) * CFrame.Angles(0, mrad(10), 0)
		local newlhoffset = CFrame.new(Vector3.new(-0.4, 0, 0) * CHARACTERSCALE) * CFrame.Angles(-mrad(7), 0, -mrad(15)) * CFrame.Angles(0, -mrad(10), 0)

		AT:JointsOffsetTween("Neck", JCFneck.CurrentOffset, newneckoffset, tweeninfo)
		AT:JointsOffsetTween("RootJoint", JCFrtj.CurrentOffset, newrtjoffset, tweeninfo)
		AT:JointsOffsetTween("Right Shoulder", JCFrs.CurrentOffset, newrsoffset, tweeninfo)
		AT:JointsOffsetTween("Left Shoulder", JCFls.CurrentOffset, newlsoffset, tweeninfo)
		AT:JointsOffsetTween("Right Hip", JCFrh.CurrentOffset, newrhoffset, tweeninfo)
		AT:JointsOffsetTween("Left Hip", JCFlh.CurrentOffset, newlhoffset, tweeninfo)

		-- Broom follow left arm
		local defaultoffset = JCFrtj.CurrentOffset * JCFls.CharacterOffset * JCFls.CurrentOffset * CFrame.new(Vector3.new(0, -1, 0) * CHARACTERSCALE)
		AT:ObjectsOffsetChange("Broom", defaultoffset)
		AT:Delay(0, function()
			while true do
				local defaultoffset = JCFrtj.CurrentOffset * JCFls.CharacterOffset * JCFls.CurrentOffset * CFrame.new(Vector3.new(0, -1, 0) * CHARACTERSCALE)
				AT:ObjectsOffsetChange("Broom", defaultoffset * CFrame.Angles(-mrad(69), mrad(165), 0))
				AT:Wait()
			end
		end)

	end,
	["N2Air"] = function(AT)
		BroomSwitch(false)
		HakeroSwitch(false)

		-- Pull
		local tweeninfo = TweenInfo.new(0.07, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)

		local newneckoffset = CFrame.new(Vector3.new(0, 0.02, -0.1) * CHARACTERSCALE) * CFrame.Angles(-mrad(7), 0, mrad(13)) * CFrame.Angles(0, mrad(46), 0)
		local newrtjoffset = CFrame.Angles(0,  -mrad(102) * CHARACTERSCALE, 0)
		local newrsoffset = CFrame.new(Vector3.new(0.5, 0.8, -0.37) * CHARACTERSCALE) * CFrame.Angles(mrad(97), 0, mrad(36))
		local newlsoffset = CFrame.new(Vector3.new(0.2, 0.6, -0.8) * CHARACTERSCALE) * CFrame.Angles(mrad(76), 0, mrad(10))
		local newrhoffset = CFrame.new(Vector3.new(0.1, 0.2, 0) * CHARACTERSCALE) * CFrame.Angles(-mrad(27), mrad(20), 0)
		local newlhoffset = CFrame.new(Vector3.new(0, 0.6, 0.3) * CHARACTERSCALE) * CFrame.Angles(-mrad(78), mrad(20), 0)

		AT:JointsOffsetTween("Neck", JCFneck.CurrentOffset, newneckoffset, tweeninfo)
		AT:JointsOffsetTween("RootJoint", JCFrtj.CurrentOffset, newrtjoffset, tweeninfo)
		AT:JointsOffsetTween("Right Shoulder", JCFrs.CurrentOffset, newrsoffset, tweeninfo)
		AT:JointsOffsetTween("Left Shoulder", JCFls.CurrentOffset, newlsoffset, tweeninfo)
		AT:JointsOffsetTween("Right Hip", JCFrh.CurrentOffset, newrhoffset, tweeninfo)
		AT:JointsOffsetTween("Left Hip", JCFlh.CurrentOffset, newlhoffset, tweeninfo)


		AT:Wait(tweeninfo.Time * 2/3)
		-- Punch
		tweeninfo = TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.In)

		local newneckoffset = CFrame.Angles(-mrad(13), 0, 0)
		local newrtjoffset = CFrame.Angles(-mrad(106), mrad(40), 0)
		local newrsoffset = CFrame.new(Vector3.new(0.2, 0.5, -0.6) * CHARACTERSCALE) * CFrame.Angles(mrad(120), 0, mrad(38))
		local newlsoffset = CFrame.new(Vector3.new(-0.4, 0.3, -0.27) * CHARACTERSCALE) * CFrame.Angles(mrad(70),0, -mrad(40))
		local newrhoffset = CFrame.new(Vector3.new(0, 0.6, -1.1) * CHARACTERSCALE) * CFrame.Angles(mrad(36), -mrad(10), 0)
		local newlhoffset = CFrame.new(Vector3.new(0, 0.8, -0.75) * CHARACTERSCALE) * CFrame.Angles(mrad(7), -mrad(10), 0)

		AT:JointsOffsetTween("Neck", JCFneck.CurrentOffset, newneckoffset, tweeninfo)
		AT:JointsOffsetTween("RootJoint", JCFrtj.CurrentOffset, newrtjoffset, tweeninfo)
		AT:JointsOffsetTween("Right Shoulder", JCFrs.CurrentOffset, newrsoffset, tweeninfo)
		AT:JointsOffsetTween("Left Shoulder", JCFls.CurrentOffset, newlsoffset, tweeninfo)
		AT:JointsOffsetTween("Right Hip", JCFrh.CurrentOffset, newrhoffset, tweeninfo)
		AT:JointsOffsetTween("Left Hip", JCFlh.CurrentOffset, newlhoffset, tweeninfo)


	end,
	["N3"] = function(AT)
		BroomSwitch(true)
		AT:Delay(0.25, function()
			BroomSwitch(false)
		end)
		HakeroSwitch(false)

		local tweeninfo = TweenInfo.new(0.05, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)

		local newneckoffset = CFrame.Angles(mrad(7), 0, 0)
		local newrtjoffset = CFrame.new(Vector3.new(0, -0.4, 0) * CHARACTERSCALE) * CFrame.Angles(-mrad(7), mrad(147), 0)
		local newrsoffset = CFrame.new(Vector3.new(-0.7, 0.4, -0.7) * CHARACTERSCALE) * CFrame.Angles(mrad(69), 0, -mrad(36))
		local newlsoffset = CFrame.new(Vector3.new(0.7, 0.4, -0.7) * CHARACTERSCALE) * CFrame.Angles(mrad(69), 0, mrad(36))
		local newrhoffset = CFrame.new(Vector3.new(0.35, 0.12, -0.8) * CHARACTERSCALE) * CFrame.Angles(mrad(28), 0, mrad(20)) * CFrame.Angles(0, mrad(37), 0)
		local newlhoffset = CFrame.new(Vector3.new(-0.35, 0.3, -0.2) * CHARACTERSCALE) * CFrame.Angles(-mrad(35), 0, -mrad(20)) * CFrame.Angles(0, mrad(25), 0)

		AT:JointsOffsetTween("Neck", JCFneck.CurrentOffset, newneckoffset, tweeninfo)
		AT:JointsOffsetTween("RootJoint", JCFrtj.CurrentOffset, newrtjoffset, tweeninfo)
		AT:JointsOffsetTween("Right Shoulder", JCFrs.CurrentOffset, newrsoffset, tweeninfo)
		AT:JointsOffsetTween("Left Shoulder", JCFls.CurrentOffset, newlsoffset, tweeninfo)
		AT:JointsOffsetTween("Right Hip", JCFrh.CurrentOffset, newrhoffset, tweeninfo)
		AT:JointsOffsetTween("Left Hip", JCFlh.CurrentOffset, newlhoffset, tweeninfo)

		-- Broom follow arms
		local defaultrsoffset = JCFrtj.CurrentOffset * JCFrs.CharacterOffset * JCFrs.CurrentOffset * CFrame.new(0, -1, 0)
		local defaultlsoffset = JCFrtj.CurrentOffset * JCFls.CharacterOffset * JCFls.CurrentOffset * CFrame.new(0, -1, 0)
		local broomoffset = CFrame.Angles(-mrad(15), 0, 0)
		AT:ObjectsOffsetChange("Broom", defaultrsoffset:Lerp(defaultlsoffset, 0.5) * broomoffset)
		AT:Delay(0, function()
			while true do
				local defaultrsoffset = JCFrtj.CurrentOffset * JCFrs.CharacterOffset * JCFrs.CurrentOffset * CFrame.new(0, -1, 0)
				local defaultlsoffset = JCFrtj.CurrentOffset * JCFls.CharacterOffset * JCFls.CurrentOffset * CFrame.new(0, -1, 0)
				AT:ObjectsOffsetChange("Broom", defaultrsoffset:Lerp(defaultlsoffset, 0.5) * broomoffset)
				AT:Wait()
			end
		end)

		AT:Wait(tweeninfo.Time * 2/3)
		tweeninfo = TweenInfo.new(0.05, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)

		local newneckoffset = CFrame.Angles(mrad(20), 0, 0)
		local newrtjoffset = CFrame.Angles(-mrad(13), 0, 0)
		local newrsoffset = CFrame.new(Vector3.new(-0.6, 1.6, -0.6) * CHARACTERSCALE) * CFrame.Angles(mrad(154), 0, -mrad(40))
		local newlsoffset = CFrame.new(Vector3.new(0.6, 1.6, -0.6) * CHARACTERSCALE) * CFrame.Angles(mrad(154), 0, mrad(40))
		local newrhoffset = CFrame.new(Vector3.new(0.5, 0.23, 0.2) * CHARACTERSCALE) * CFrame.Angles(-mrad(34), 0, mrad(24)) * CFrame.Angles(0, mrad(50), 0)
		local newlhoffset = CFrame.new(Vector3.new(0, 0.5, -0.6) * CHARACTERSCALE) * CFrame.Angles(-mrad(30), 0, 0)

		AT:JointsOffsetTween("Neck", JCFneck.CurrentOffset, newneckoffset, tweeninfo)
		AT:JointsOffsetTween("RootJoint", JCFrtj.CurrentOffset, newrtjoffset, tweeninfo)
		AT:JointsOffsetTween("Right Shoulder", JCFrs.CurrentOffset, newrsoffset, tweeninfo)
		AT:JointsOffsetTween("Left Shoulder", JCFls.CurrentOffset, newlsoffset, tweeninfo)
		AT:JointsOffsetTween("Right Hip", JCFrh.CurrentOffset, newrhoffset, tweeninfo)
		AT:JointsOffsetTween("Left Hip", JCFlh.CurrentOffset, newlhoffset, tweeninfo)

		CSE:TweenCustom(broomoffset, CFrame.Angles(-mrad(35), 0, 0) * CFrame.new(0, 0, -0.5 * CHARACTERSCALE), tweeninfo, function(val)
			broomoffset = val
		end)

		AT:Wait(tweeninfo.Time * 2/3)
		tweeninfo = TweenInfo.new(0.05, Enum.EasingStyle.Quad, Enum.EasingDirection.In)

		local newneckoffset = CFrame.Angles(-mrad(24), 0, 0)
		local newrtjoffset = CFrame.new(Vector3.new(0, 1.3, 0) * CHARACTERSCALE) * CFrame.Angles(-mrad(117), 0, 0)
		local newrsoffset = CFrame.new(Vector3.new(-0.7, 0.9, -1.2) * CHARACTERSCALE) * CFrame.Angles(mrad(110), 0, -mrad(50))
		local newlsoffset = CFrame.new(Vector3.new(0.7, 0.9, -1.2) * CHARACTERSCALE) * CFrame.Angles(mrad(110), 0, mrad(50))
		local newrhoffset = CFrame.new(Vector3.new(0, 1.1, -1.1) * CHARACTERSCALE) * CFrame.Angles(mrad(63), 0, 0)
		local newlhoffset = CFrame.new(Vector3.new(0, 1.4, -1.4) * CHARACTERSCALE) * CFrame.Angles(mrad(100), 0, 0)

		AT:JointsOffsetTween("Neck", JCFneck.CurrentOffset, newneckoffset, tweeninfo)
		AT:JointsOffsetTween("RootJoint", JCFrtj.CurrentOffset, newrtjoffset, tweeninfo)
		AT:JointsOffsetTween("Right Shoulder", JCFrs.CurrentOffset, newrsoffset, tweeninfo)
		AT:JointsOffsetTween("Left Shoulder", JCFls.CurrentOffset, newlsoffset, tweeninfo)
		AT:JointsOffsetTween("Right Hip", JCFrh.CurrentOffset, newrhoffset, tweeninfo)
		AT:JointsOffsetTween("Left Hip", JCFlh.CurrentOffset, newlhoffset, tweeninfo)

		tweeninfo = TweenInfo.new(tweeninfo.Time/2 * 1.25, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut)
		CSE:TweenCustom(broomoffset, CFrame.Angles(mrad(15), 0, 0) * CFrame.new(0, 0, -2.5 * CHARACTERSCALE), tweeninfo, function(val)
			broomoffset = val
		end)
		AT:Wait(tweeninfo.Time)
		tweeninfo = TweenInfo.new(tweeninfo.Time/2 * 1.25, Enum.EasingStyle.Quad, Enum.EasingDirection.In)
		CSE:TweenCustom(broomoffset, CFrame.Angles(-mrad(17), 0, 0) * CFrame.new(0, 0, -2.5 * CHARACTERSCALE), tweeninfo, function(val)
			broomoffset = val
		end)
	end,
	["N4"] = function(AT)
		BroomSwitch(true)
		AT:Delay(0.4, function()
			BroomSwitch(false)
		end)
		HakeroSwitch(false)

		local tweeninfo = TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)

		local newneckoffset = CFrame.Angles(mrad(7), 0, 0)
		local newrtjoffset = CFrame.new(Vector3.new(0, -0.4, 0) * CHARACTERSCALE) * CFrame.Angles(-mrad(7), mrad(147), 0)
		local newrsoffset = CFrame.new(Vector3.new(-0.7, 0.4, -0.7) * CHARACTERSCALE) * CFrame.Angles(mrad(69), 0, -mrad(36))
		local newlsoffset = CFrame.new(Vector3.new(0.7, 0.4, -0.7) * CHARACTERSCALE) * CFrame.Angles(mrad(69), 0, mrad(36))
		local newrhoffset = CFrame.new(Vector3.new(0.05, 0.12, -0.5) * CHARACTERSCALE) * CFrame.Angles(mrad(10), 0, mrad(7))
		local newlhoffset = CFrame.new(Vector3.new(-0.05, 0.4, -0.2) * CHARACTERSCALE) * CFrame.Angles(-mrad(35), 0, -mrad(7))

		AT:JointsOffsetTween("Neck", JCFneck.CurrentOffset, newneckoffset, tweeninfo)
		AT:JointsOffsetTween("RootJoint", JCFrtj.CurrentOffset, newrtjoffset, tweeninfo)
		AT:JointsOffsetTween("Right Shoulder", JCFrs.CurrentOffset, newrsoffset, tweeninfo)
		AT:JointsOffsetTween("Left Shoulder", JCFls.CurrentOffset, newlsoffset, tweeninfo)
		AT:JointsOffsetTween("Right Hip", JCFrh.CurrentOffset, newrhoffset, tweeninfo)
		AT:JointsOffsetTween("Left Hip", JCFlh.CurrentOffset, newlhoffset, tweeninfo)

		-- Broom follow arms
		local defaultrsoffset = JCFrtj.CurrentOffset * JCFrs.CharacterOffset * JCFrs.CurrentOffset * CFrame.new(Vector3.new(0, -1, 0) * CHARACTERSCALE)
		local defaultlsoffset = JCFrtj.CurrentOffset * JCFls.CharacterOffset * JCFls.CurrentOffset * CFrame.new(Vector3.new(0, -1, 0) * CHARACTERSCALE)
		local broomoffset = CFrame.Angles(-mrad(10), 0, 0)
		AT:ObjectsOffsetChange("Broom", defaultrsoffset:Lerp(defaultlsoffset, 0.5) * broomoffset)
		AT:Delay(0, function()
			while true do
				local defaultrsoffset = JCFrtj.CurrentOffset * JCFrs.CharacterOffset * JCFrs.CurrentOffset * CFrame.new(Vector3.new(0, -1, 0) * CHARACTERSCALE)
				local defaultlsoffset = JCFrtj.CurrentOffset * JCFls.CharacterOffset * JCFls.CurrentOffset * CFrame.new(Vector3.new(0, -1, 0) * CHARACTERSCALE)
				AT:ObjectsOffsetChange("Broom", defaultrsoffset:Lerp(defaultlsoffset, 0.5) * broomoffset)
				AT:Wait()
			end
		end)	

		AT:Wait(tweeninfo.Time)
		tweeninfo = TweenInfo.new(0.05, Enum.EasingStyle.Quad, Enum.EasingDirection.In)

		local newneckoffset = CFrame.Angles(mrad(7), 0, 0)
		local newrtjoffset = CFrame.Angles(mrad(7), mrad(84), -mrad(20))
		local newrsoffset = CFrame.new(Vector3.new(-1.1, 0.4, -0.7) * CHARACTERSCALE) * CFrame.Angles(mrad(111), 0, -mrad(57))
		local newlsoffset = CFrame.new(Vector3.new(0.7, 0.4, -0.7) * CHARACTERSCALE) * CFrame.Angles(mrad(80), 0, mrad(49))
		local newrhoffset = CFrame.new(Vector3.new(-0.15, 0.2, 0.15) * CHARACTERSCALE) * CFrame.Angles(-mrad(20), 0, -mrad(7)) * CFrame.Angles(0, mrad(15), 0)
		local newlhoffset = CFrame.new(Vector3.new(-0.45, 0.63, -0.15) * CHARACTERSCALE) * CFrame.Angles(-mrad(55), 0, -mrad(15)) * CFrame.Angles(0, mrad(31), 0)

		AT:JointsOffsetTween("Neck", JCFneck.CurrentOffset, newneckoffset, tweeninfo)
		AT:JointsOffsetTween("RootJoint", JCFrtj.CurrentOffset, newrtjoffset, tweeninfo)
		AT:JointsOffsetTween("Right Shoulder", JCFrs.CurrentOffset, newrsoffset, tweeninfo)
		AT:JointsOffsetTween("Left Shoulder", JCFls.CurrentOffset, newlsoffset, tweeninfo)
		AT:JointsOffsetTween("Right Hip", JCFrh.CurrentOffset, newrhoffset, tweeninfo)
		AT:JointsOffsetTween("Left Hip", JCFlh.CurrentOffset, newlhoffset, tweeninfo)

		CSE:TweenCustom(broomoffset, CFrame.new(0, -0.5 * CHARACTERSCALE, 0) * CFrame.Angles(-mrad(25), mrad(20), 0), tweeninfo, function(val)
			broomoffset = val
		end)




		AT:Wait(tweeninfo.Time * 2/3)
		tweeninfo = TweenInfo.new(0.05, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut)

		local newneckoffset = CFrame.Angles(0, 0, 0)
		local newrtjoffset = CFrame.Angles(mrad(7), 0, 0)
		local newrsoffset = CFrame.new(Vector3.new(-0.6, 0.55, -1.2) * CHARACTERSCALE) * CFrame.Angles(mrad(110), 0, -mrad(45))
		local newlsoffset = CFrame.new(Vector3.new(0.6, 0.55, -1.2) * CHARACTERSCALE) * CFrame.Angles(mrad(110), 0, mrad(45))
		local newrhoffset = CFrame.new(Vector3.new(0, 0.2, 0.8) * CHARACTERSCALE) * CFrame.Angles(-mrad(56), 0, 0)
		local newlhoffset = CFrame.new(Vector3.new(0, 0.3, -0.9) * CHARACTERSCALE) * CFrame.Angles(mrad(23), 0, 0)

		AT:JointsOffsetTween("Neck", JCFneck.CurrentOffset, newneckoffset, tweeninfo)
		AT:JointsOffsetTween("RootJoint", JCFrtj.CurrentOffset, newrtjoffset, tweeninfo)
		AT:JointsOffsetTween("Right Shoulder", JCFrs.CurrentOffset, newrsoffset, tweeninfo)
		AT:JointsOffsetTween("Left Shoulder", JCFls.CurrentOffset, newlsoffset, tweeninfo)
		AT:JointsOffsetTween("Right Hip", JCFrh.CurrentOffset, newrhoffset, tweeninfo)
		AT:JointsOffsetTween("Left Hip", JCFlh.CurrentOffset, newlhoffset, tweeninfo)

		CSE:TweenCustom(broomoffset, CFrame.Angles(-mrad(110), mrad(35), 0), tweeninfo, function(val)
			broomoffset = val
		end)

		AT:Wait(tweeninfo.Time * 2/3)
		tweeninfo = TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)

		local newneckoffset = CFrame.Angles(mrad(11), mrad(30), 0)
		local newrtjoffset = CFrame.Angles(0, -mrad(50), 0)
		local newrsoffset = CFrame.new(Vector3.new(-0.25, 0.2, -0.25) * CHARACTERSCALE) * CFrame.Angles(mrad(52), 0, -mrad(20))
		local newlsoffset = CFrame.new(Vector3.new(0.8, 0.45, -0.8) * CHARACTERSCALE) * CFrame.Angles(mrad(52), 0, mrad(60))
		local newrhoffset = CFrame.new(Vector3.new(0.3, 0.2, -0.075) * CHARACTERSCALE) * CFrame.Angles(-mrad(35), 0, mrad(25)) * CFrame.Angles(0, -mrad(20), 0)
		local newlhoffset = CFrame.new(Vector3.new(-0.2, 0.1, -0.7) * CHARACTERSCALE) * CFrame.Angles(mrad(12), 0, -mrad(10)) * CFrame.Angles(0, mrad(30), 0)

		AT:JointsOffsetTween("Neck", JCFneck.CurrentOffset, newneckoffset, tweeninfo)
		AT:JointsOffsetTween("RootJoint", JCFrtj.CurrentOffset, newrtjoffset, tweeninfo)
		AT:JointsOffsetTween("Right Shoulder", JCFrs.CurrentOffset, newrsoffset, tweeninfo)
		AT:JointsOffsetTween("Left Shoulder", JCFls.CurrentOffset, newlsoffset, tweeninfo)
		AT:JointsOffsetTween("Right Hip", JCFrh.CurrentOffset, newrhoffset, tweeninfo)
		AT:JointsOffsetTween("Left Hip", JCFlh.CurrentOffset, newlhoffset, tweeninfo)

		CSE:TweenCustom(broomoffset, CFrame.Angles(-mrad(80), -mrad(15), 0), tweeninfo, function(val)
			broomoffset = val
		end)
	end,

	------------------------------------------------------------------------------------------------------------------------------------------
	["LaserFire"] = function(AT)
		BroomSwitch(false)
		HakeroSwitch(false)

		-- Same as first part of Special
		local tweeninfo = TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.In)

		local newneckoffset = CFrame.Angles(-mrad(13), mrad(25), 0)
		local newrtjoffset = CFrame.Angles(0, -mrad(78), 0)
		local newrsoffset = CFrame.new(Vector3.new(0.07, 0.18, -0.1) * CHARACTERSCALE) * CFrame.Angles(mrad(10), 0, mrad(17))
		local newlsoffset = CFrame.new(Vector3.new(0.4, 1.13, -0.6) * CHARACTERSCALE) * CFrame.Angles(mrad(125), 0, mrad(27))
		local newrhoffset = CFrame.new(Vector3.new(0.3, 0.52, -0.17) * CHARACTERSCALE) * CFrame.Angles(-mrad(30), 0, mrad(23))
		local newlhoffset = CFrame.new(Vector3.new(-0.15, 0.14, 0) * CHARACTERSCALE) * CFrame.Angles(0, 0, -mrad(13)) * CFrame.Angles(0, -mrad(22), 0)

		AT:JointsOffsetTween("Neck", JCFneck.CurrentOffset, newneckoffset, tweeninfo)
		AT:JointsOffsetTween("RootJoint", JCFrtj.CurrentOffset, newrtjoffset, tweeninfo)
		AT:JointsOffsetTween("Right Shoulder", JCFrs.CurrentOffset, newrsoffset, tweeninfo)
		AT:JointsOffsetTween("Left Shoulder", JCFls.CurrentOffset, newlsoffset, tweeninfo)
		AT:JointsOffsetTween("Right Hip", JCFrh.CurrentOffset, newrhoffset, tweeninfo)
		AT:JointsOffsetTween("Left Hip", JCFlh.CurrentOffset, newlhoffset, tweeninfo)

		AT:Wait(tweeninfo.Time)

		local tweeninfo = TweenInfo.new(0.2, Enum.EasingStyle.Quint, Enum.EasingDirection.Out)

		local newneckoffset = CFrame.Angles(0, mrad(50), 0)
		local newrtjoffset = CFrame.Angles(0, -mrad(50), 0)
		local newrsoffset = CFrame.new(Vector3.new(0.15, 0.1, 0.2) * CHARACTERSCALE) * CFrame.Angles(-mrad(30), 0, mrad(20)) * CFrame.Angles(0, -mrad(20), 0)
		local newlsoffset = CFrame.new(Vector3.new(-0.25, 0.45, -0.7) * CHARACTERSCALE) * CFrame.Angles(mrad(90), 0, -mrad(50))
		local newrhoffset = CFrame.new(Vector3.new(0.2, 0.2, 0.2) * CHARACTERSCALE) * CFrame.Angles(-mrad(40), 0, mrad(12))
		local newlhoffset = CFrame.new(Vector3.new(-0.2, 0.2, -0.7) * CHARACTERSCALE) * CFrame.Angles(mrad(17), 0, -mrad(12))

		AT:JointsOffsetTween("Neck", JCFneck.CurrentOffset, newneckoffset, tweeninfo)
		AT:JointsOffsetTween("RootJoint", JCFrtj.CurrentOffset, newrtjoffset, tweeninfo)
		AT:JointsOffsetTween("Right Shoulder", JCFrs.CurrentOffset, newrsoffset, tweeninfo)
		AT:JointsOffsetTween("Left Shoulder", JCFls.CurrentOffset, newlsoffset, tweeninfo)
		AT:JointsOffsetTween("Right Hip", JCFrh.CurrentOffset, newrhoffset, tweeninfo)
		AT:JointsOffsetTween("Left Hip", JCFlh.CurrentOffset, newlhoffset, tweeninfo)
	end,
	["SpecialCharge"] = function(AT)
		BroomSwitch(false)
		HakeroSwitch(true)

		-- Hakero follow arms
		local defaultrsoffset = JCFrtj.CurrentOffset * JCFrs.CharacterOffset * JCFrs.CurrentOffset * CFrame.new(0, -1, 0)
		local defaultlsoffset = JCFrtj.CurrentOffset * JCFls.CharacterOffset * JCFls.CurrentOffset * CFrame.new(0, -1, 0)
		local hakerooffset = CFrame.new(0, -0.25 * CHARACTERSCALE, 0) * CFrame.Angles(mrad(90), 0, 0)
		AT:ObjectsOffsetChange("Hakero", defaultrsoffset:Lerp(defaultlsoffset, 0.5) * hakerooffset)
		AT:Delay(0, function()
			while true do
				local defaultrsoffset = JCFrtj.CurrentOffset * JCFrs.CharacterOffset * JCFrs.CurrentOffset * CFrame.new(0, -1, 0)
				local defaultlsoffset = JCFrtj.CurrentOffset * JCFls.CharacterOffset * JCFls.CurrentOffset * CFrame.new(0, -1, 0)
				AT:ObjectsOffsetChange("Hakero", defaultrsoffset:Lerp(defaultlsoffset, 0.5) * hakerooffset)
				AT:Wait()
			end
		end)

		local tweeninfo = TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)

		local newneckoffset = CFrame.new(Vector3.new(0, 0, -0.1) * CHARACTERSCALE) * CFrame.Angles(-mrad(30), 0, 0)
		local newrtjoffset = CFrame.new(Vector3.new(0, 0.8, 0.5) * CHARACTERSCALE) * CFrame.Angles(mrad(30), 0, 0)
		local newrsoffset = CFrame.new(Vector3.new(-0.7, 1.6, -0.8) * CHARACTERSCALE) * CFrame.Angles(mrad(130), 0, -mrad(30))
		local newlsoffset = CFrame.new(Vector3.new(0.7, 1.6, -0.8) * CHARACTERSCALE) * CFrame.Angles(mrad(130), 0, mrad(30))
		local newrhoffset = CFrame.new(Vector3.new(0.05, 0.4, 0.05) * CHARACTERSCALE) * CFrame.Angles(-mrad(50), 0, mrad(12))
		local newlhoffset = CFrame.new(Vector3.new(-0.05, 0.7, 0.1) * CHARACTERSCALE) * CFrame.Angles(-mrad(70), 0, -mrad(12))

		AT:JointsOffsetTween("Neck", JCFneck.CurrentOffset, newneckoffset, tweeninfo)
		AT:JointsOffsetTween("RootJoint", JCFrtj.CurrentOffset, newrtjoffset, tweeninfo)
		AT:JointsOffsetTween("Right Shoulder", JCFrs.CurrentOffset, newrsoffset, tweeninfo)
		AT:JointsOffsetTween("Left Shoulder", JCFls.CurrentOffset, newlsoffset, tweeninfo)
		AT:JointsOffsetTween("Right Hip", JCFrh.CurrentOffset, newrhoffset, tweeninfo)
		AT:JointsOffsetTween("Left Hip", JCFlh.CurrentOffset, newlhoffset, tweeninfo)
	end,
	["Special"] = function(AT)
		BroomSwitch(false)
		HakeroSwitch(false)

		local tweeninfo = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.In)

		local newneckoffset = CFrame.Angles(-mrad(13), mrad(25), 0)
		local newrtjoffset = CFrame.Angles(0, -mrad(78), 0)
		local newrsoffset = CFrame.new(Vector3.new(0.07, 0.18, -0.1) * CHARACTERSCALE) * CFrame.Angles(mrad(10), 0, mrad(17))
		local newlsoffset = CFrame.new(Vector3.new(0.4, 1.13, -0.6) * CHARACTERSCALE) * CFrame.Angles(mrad(125), 0, mrad(27))
		local newrhoffset = CFrame.new(Vector3.new(0.3, 0.52, -0.17) * CHARACTERSCALE) * CFrame.Angles(-mrad(30), 0, mrad(23))
		local newlhoffset = CFrame.new(Vector3.new(-0.15, 0.14, 0) * CHARACTERSCALE) * CFrame.Angles(0, 0, -mrad(13)) * CFrame.Angles(0, -mrad(22), 0)

		AT:JointsOffsetTween("Neck", JCFneck.CurrentOffset, newneckoffset, tweeninfo)
		AT:JointsOffsetTween("RootJoint", JCFrtj.CurrentOffset, newrtjoffset, tweeninfo)
		AT:JointsOffsetTween("Right Shoulder", JCFrs.CurrentOffset, newrsoffset, tweeninfo)
		AT:JointsOffsetTween("Left Shoulder", JCFls.CurrentOffset, newlsoffset, tweeninfo)
		AT:JointsOffsetTween("Right Hip", JCFrh.CurrentOffset, newrhoffset, tweeninfo)
		AT:JointsOffsetTween("Left Hip", JCFlh.CurrentOffset, newlhoffset, tweeninfo)

		AT:Wait(tweeninfo.Time)

		local tweeninfo = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)

		local newneckoffset = CFrame.Angles(mrad(4), mrad(42), 0)
		local newrtjoffset = CFrame.Angles(0, -mrad(52), 0)
		local newrsoffset = CFrame.new(Vector3.new(0.17, 0.18, 0.17) * CHARACTERSCALE) * CFrame.Angles(-mrad(15), 0, mrad(23))
		local newlsoffset = CFrame.new(Vector3.new(-0.34, 1.04, -0.3) * CHARACTERSCALE) * CFrame.Angles(0, 0, -mrad(117)) * CFrame.Angles(mrad(20), mrad(90), 0)
		local newrhoffset = CFrame.new(Vector3.new(0.3, 0.17, 0) * CHARACTERSCALE) * CFrame.Angles(0, 0, mrad(22))
		local newlhoffset = CFrame.new(Vector3.new(-0.3, 0.17, 0) * CHARACTERSCALE) * CFrame.Angles(0, 0, -mrad(22))

		AT:JointsOffsetTween("Neck", JCFneck.CurrentOffset, newneckoffset, tweeninfo)
		AT:JointsOffsetTween("RootJoint", JCFrtj.CurrentOffset, newrtjoffset, tweeninfo)
		AT:JointsOffsetTween("Right Shoulder", JCFrs.CurrentOffset, newrsoffset, tweeninfo)
		AT:JointsOffsetTween("Left Shoulder", JCFls.CurrentOffset, newlsoffset, tweeninfo)
		AT:JointsOffsetTween("Right Hip", JCFrh.CurrentOffset, newrhoffset, tweeninfo)
		AT:JointsOffsetTween("Left Hip", JCFlh.CurrentOffset, newlhoffset, tweeninfo)
	end,







	------------------------------------------------------------------------------------------------------------------------------------------
	["Counter"] = function(AT)
		BroomSwitch(true)
		AT:Delay(0.6, function()
			BroomSwitch(false)
		end)
		HakeroSwitch(false)

		local tweeninfo = TweenInfo.new(0.3)

		local newneckoffset = CFrame.Angles(mrad(28), 0, 0)
		local newrtjoffset = CFrame.new(Vector3.new(0, -0.7, 0) * CHARACTERSCALE) * CFrame.Angles(-mrad(16), 0, 0)
		local newrsoffset = CFrame.new(Vector3.new(-0.1, 0.8, -0.3) * CHARACTERSCALE) * CFrame.Angles(mrad(122), 0, -mrad(25))
		local newlsoffset = CFrame.new(Vector3.new(0.1, 0.8, -0.3) * CHARACTERSCALE) * CFrame.Angles(mrad(122), 0, mrad(25))
		local newrhoffset = CFrame.Angles(-mrad(50), 0, 0) * CFrame.new(Vector3.new(0, 0.4, 0.45) * CHARACTERSCALE)
		local newlhoffset = CFrame.Angles(-mrad(14), 0, 0) * CFrame.new(Vector3.new(0, 0.65, -0.3) * CHARACTERSCALE)

		local newbroomoffset = CFrame.new((CFrame.new(Vector3.new(0, -1, 0) * CHARACTERSCALE) * CFrame.Angles(mrad(22), 0, 0) * CFrame.new(Vector3.new(0, 0, -1.75) * CHARACTERSCALE)).Position) * CFrame.Angles(0, mrad(90), 0) * CFrame.new(Vector3.new(0, 0.75, -0.5) * CHARACTERSCALE)

		AT:JointsOffsetTween("Neck", JCFneck.CurrentOffset, newneckoffset, tweeninfo)
		AT:JointsOffsetTween("RootJoint", JCFrtj.CurrentOffset, newrtjoffset, tweeninfo)
		AT:JointsOffsetTween("Right Shoulder", JCFrs.CurrentOffset, newrsoffset, tweeninfo)
		AT:JointsOffsetTween("Left Shoulder", JCFls.CurrentOffset, newlsoffset, tweeninfo)
		AT:JointsOffsetTween("Right Hip", JCFrh.CurrentOffset, newrhoffset, tweeninfo)
		AT:JointsOffsetTween("Left Hip", JCFlh.CurrentOffset, newlhoffset, tweeninfo)

		-- Broom follow right arm
		local defaultoffset = CFrame.new((JCFrtj.CurrentOffset * JCFrs.CharacterOffset * JCFrs.CurrentOffset * CFrame.new(Vector3.new(0, -1, 0) * CHARACTERSCALE)).Position)
		local offset2 = defaultoffset * CFrame.Angles(0, mrad(90), 0)
		AT:ObjectsOffsetChange("Broom", defaultoffset * offset2)

		local follow = true
		AT:Delay(0, function()
			local moremagnitude = -0.2 -- shake
			while follow == true do
				local defaultoffset = CFrame.new((JCFrtj.CurrentOffset * JCFrs.CharacterOffset * JCFrs.CurrentOffset * CFrame.new(Vector3.new(0, -1, 0) * CHARACTERSCALE)).Position)
				local offset2 = CFrame.Angles(0, -mrad(90), 0) * CFrame.new(Vector3.new(-0.25, 0, 0.5) * CHARACTERSCALE)

				local magclamp = math.max(0, moremagnitude) -- the -0.15 initial value is to delay the shaking a bit
				local moreoffset = CFrame.new(Vector3.new(rnd:NextNumber(-1, 1) * magclamp, rnd:NextNumber(-1, 1) * magclamp, rnd:NextNumber(-1, 1) * magclamp) * CHARACTERSCALE)
				moremagnitude = moremagnitude + 0.015

				AT:ObjectsOffsetChange("Broom", defaultoffset * offset2 * moreoffset)
				AT:Wait()
			end
		end)


		AT:Wait(0.6)
		follow = false
		local tweeninfo = TweenInfo.new(0.35)

		local newneckoffset = CFrame.Angles(-mrad(13), 0, 0)
		local newrtjoffset = CFrame.Angles(mrad(20), 0, 0)
		local newrsoffset = CFrame.new(Vector3.new(0.4, 1, 0.3) * CHARACTERSCALE) * CFrame.Angles(mrad(120), 0, mrad(75))
		local newlsoffset = CFrame.new(Vector3.new(-0.15, 1.4, 0.3) * CHARACTERSCALE) * CFrame.Angles(mrad(167), 0, -mrad(55))
		local newrhoffset = CFrame.Angles(mrad(16), 0, mrad(13)) * CFrame.new(Vector3.new(0.25, 0.15, -0.7) * CHARACTERSCALE)
		local newlhoffset = CFrame.Angles(-mrad(11), 0, -mrad(13)) * CFrame.new(Vector3.new(-0.25, 0.27, -0.2) * CHARACTERSCALE)

		local newbroomoffset = CFrame.new(Vector3.new(3, 0, -5) * CHARACTERSCALE) * CFrame.Angles(mrad(37), mrad(37), 0)

		AT:JointsOffsetTween("Neck", JCFneck.CurrentOffset, newneckoffset, tweeninfo)
		AT:JointsOffsetTween("RootJoint", JCFrtj.CurrentOffset, newrtjoffset, tweeninfo)
		AT:JointsOffsetTween("Right Shoulder", JCFrs.CurrentOffset, newrsoffset, tweeninfo)
		AT:JointsOffsetTween("Left Shoulder", JCFls.CurrentOffset, newlsoffset, tweeninfo)
		AT:JointsOffsetTween("Right Hip", JCFrh.CurrentOffset, newrhoffset, tweeninfo)
		AT:JointsOffsetTween("Left Hip", JCFlh.CurrentOffset, newlhoffset, tweeninfo)

		AT:ObjectsOffsetTween("Broom", OCFbroom.CurrentOffset, newbroomoffset, tweeninfo)
	end,
}

------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------

------------------------------ ANIMATION SETUP -------------------------------
function AnimationTrackNew(animName)
	local animFunc = ANIMATIONS[animName]
	local animThread = coroutine.create(animFunc)

	local AT = {}
	AT.Name = animName
	AT.Function = animFunc
	AT.ForceStopped = false

	-- Current Playing TweenObjects
	local JointsOffsetTO = {}
	local ObjCFTO = {}
	local ObjOffsetTO = {}
	local TweenObjects = {
		["JointsOffset"] = JointsOffsetTO,
		["ObjectsOffset"] = ObjOffsetTO
	}
	AT.TweenObjects = TweenObjects

	-- Tween Functions
	---------------- JOINTS OFFSET ----------------
	function AT:JointsOffsetChange(joint, cf)
		local lasttween = JointsOffsetTO[joint]
		if lasttween then
			lasttween:Pause()
			JointsOffsetTO[joint] = nil
		end
		jointscframes[joint].CurrentOffset = cf
	end

	function AT:JointsOffsetTween(joint, start, fin, tweeninfo)
		local lasttween = JointsOffsetTO[joint]
		if lasttween then
			lasttween:Pause()
		end
		JointsOffsetTO[joint] = CSE:TweenCustom(start, fin, tweeninfo, function(val)
			jointscframes[joint].CurrentOffset = val
		end)
	end


	---------------- OBJECTS OFFSET ----------------
	function AT:ObjectsOffsetChange(object, cf)
		local lasttween = ObjOffsetTO[object]
		if lasttween then
			lasttween:Pause()
			ObjOffsetTO[object] = nil
		end
		objectscframes[object].CurrentOffset = cf
	end
	function AT:ObjectsOffsetTween(object, start, fin, tweeninfo)
		local lasttween = ObjOffsetTO[object]
		if lasttween then
			lasttween:Pause()
		end
		ObjOffsetTO[object] = CSE:TweenCustom(start, fin, tweeninfo, function(val)
			objectscframes[object].CurrentOffset = val
		end)
	end



	---------------- OTHERS ----------------
	function AT:Wait(del)
		task.wait(del)
		if AT.ForceStopped == true then
			coroutine.yield()
		end
	end
	function AT:Delay(del, delayfunc)
		coroutine.wrap(function()
			AT:Wait(del)
			delayfunc()
		end)()
	end

	function AT:ForceStop()
		AT.ForceStopped = true
		for type, tab in TweenObjects do
			for i, tweenobject in tab do
				tweenobject:Pause()
			end
		end
		pcall(function()
			coroutine.close(animThread)
		end)
	end


	coroutine.resume(animThread, AT)


	return AT
end


------------------------------------------------------------------------------------------------------------------------------------------
---------------- ANIMATION PLAYING FUNCTIONS ----------------
local CurrentAnimation -- Currently playing animation for character
function AnimationPlay(name)
	AnimationStop()

	local animtrack = AnimationTrackNew(name)
	CurrentAnimation = animtrack

end
function AnimationStop()
	if CurrentAnimation then
		CurrentAnimation:ForceStop()
	end
end

------------------------------------------------------------------------------------------------------------------------------------------
---------------- DEAFAULT CHARACTER ANIMATIONS ----------------

local DefaultAnimsEnabled = true
function SetDefaultAnim(laststate, currentstate)
	if DefaultAnimsEnabled == true then
		if currentstate ~= "Disabled" then

			-- FALL IMPACT
			if laststate == "Falling" and (currentstate == "IdleGround" or currentstate == "Walking" or currentstate == "Running") then
				AnimationPlay("FallImpact")
				task.delay(0.2, function()
					if CurrentAnimation.Name ~= CurrentCharacterState then
						SetDefaultAnim(CurrentCharacterState, CurrentCharacterState) -- Re-update attempt
					end
				end)

			elseif currentstate == "IdleGround" then
				AnimationPlay("IdleGround"..idlemode)

				-- Everything else
			else
				AnimationPlay(currentstate)
			end
		end
	end
end
local DefaultAnims = CharacterState.Event:Connect(SetDefaultAnim)

print("> [WLW] Animations loaded. \n] -")


------------------------------------------------------------------------------------------------------------------------------------------

--[[ ----------------------------------

	-- FINAL CHARACTER SETUP --

---------------------------------- ]]--

print("- [\n> [WLW] Setting up final character...")

CFRAMES.CHARACTER = {}
CFRAMES.OBJECTS = {}
local currentheadangle = CFrame.new()
function SETCHARCFRAMES()
	-- Character
	ADMchar:SetRecordedMCF(currentcf)

	-- Limbs
	local torsooffset = JCFrtj.CharacterOffset * JCFrtj.CurrentOffset
	local ct = currentcf * torsooffset

	local raoffset = JCFrs.CharacterOffset * JCFrs.CurrentOffset
	local laoffset = JCFls.CharacterOffset * JCFls.CurrentOffset
	local rloffset = JCFrh.CharacterOffset * JCFrh.CurrentOffset
	local lloffset = JCFlh.CharacterOffset * JCFlh.CurrentOffset

	-- Funny head follow camera
	local headoffset
	if CurrentCharacterState ~= "Disabled" then
		-- Overwrite the animations' head angles with wherever our head should look (still keeping them stored tho just in case)
		local initial = JCFneck.CharacterOffset * CFrame.new(JCFneck.CurrentOffset.Position)
		local cth = ct * initial
		if cth.Position ~= CFRAMES.CAMERA.CFrame.Position then
			local CLook = cth:ToObjectSpace(CFRAMES.CAMERA.CFrame).LookVector
			CLook = Vector3.new( math.clamp(CLook.X, -1, 1), math.clamp(CLook.Y, -1, 1), math.clamp(CLook.Z, -1, 1) )
			local CAngle = CFrame.Angles(0, -math.asin(CLook.X) * 0.825, 0) * CFrame.Angles(math.asin(CLook.Y) * 0.5, 0, 0)
			currentheadangle = currentheadangle:Lerp(CAngle, SETTINGS.LookSpeed)
		end
		headoffset = initial * currentheadangle
	else
		headoffset = JCFneck.CharacterOffset * JCFneck.CurrentOffset
	end

	ADMchar:SetRecordedProperty(orighead, "CFrameOffset", torsooffset * headoffset)
	ADMchar:SetRecordedProperty(origtorso, "CFrameOffset", torsooffset)
	ADMchar:SetRecordedProperty(origra, "CFrameOffset", torsooffset * raoffset)
	ADMchar:SetRecordedProperty(origla, "CFrameOffset", torsooffset * laoffset)
	ADMchar:SetRecordedProperty(origrl, "CFrameOffset", torsooffset * rloffset)
	ADMchar:SetRecordedProperty(origll, "CFrameOffset", torsooffset * lloffset)

	-- MParts
	ADMmhead:SetRecordedMCF(ct * headoffset * mheadcharoffset)
	ADMmbody:SetRecordedMCF(ct)
	
	-- i dont wanna rewrite anymore i cant;; help
	for _, part in origmbody["MTorso"]:GetDescendants() do
		if part:IsA("BasePart") then
			ADMmbody:SetRecordedProperty(part, "CFrameOffset", mtorsocharoffset * _mBodyOffsets[part])
		end
	end
	for _, part in origmbody["MRight Arm"]:GetDescendants() do
		if part:IsA("BasePart") then
			ADMmbody:SetRecordedProperty(part, "CFrameOffset", raoffset * mracharoffset * _mBodyOffsets[part])
		end
	end
	for _, part in origmbody["MLeft Arm"]:GetDescendants() do
		if part:IsA("BasePart") then
			ADMmbody:SetRecordedProperty(part, "CFrameOffset", laoffset * mlacharoffset * _mBodyOffsets[part])
		end
	end
	for _, part in origmbody["MRight Leg"]:GetDescendants() do
		if part:IsA("BasePart") then
			ADMmbody:SetRecordedProperty(part, "CFrameOffset", rloffset * mrlcharoffset * _mBodyOffsets[part])
		end
	end
	for _, part in origmbody["MLeft Leg"]:GetDescendants() do
		if part:IsA("BasePart") then
			ADMmbody:SetRecordedProperty(part, "CFrameOffset", lloffset * mllcharoffset * _mBodyOffsets[part])
		end
	end

	-- Broom
	OCFbroom.CurrentCFrame = currentcf
	local broomcf = OCFbroom.CurrentCFrame * OCFbroom.CurrentOffset
	ADMbroom:SetRecordedMCF(broomcf)

	-- Hakero
	OCFhakero.CurrentCFrame = currentcf
	local hakerocf = OCFhakero.CurrentCFrame * OCFhakero.CurrentOffset
	ADMhakero:SetRecordedMCF(hakerocf)


	-- UPDATE CFRAME VALUES
	local CFCHAR = CFRAMES.CHARACTER
	CFCHAR.Character = currentcf
	CFCHAR.Head = ct * headoffset
	CFCHAR.Torso = ct
	CFCHAR["Right Arm"] = ct * raoffset
	CFCHAR["Left Arm"] = ct * laoffset
	CFCHAR["Right Leg"] = ct * rloffset
	CFCHAR["Left Leg"] = ct * lloffset

	local CFOBJ = CFRAMES.OBJECTS
	CFOBJ.Broom = broomcf
	CFOBJ.Hakero = hakerocf
end
local SetCharCFramesLoop = heartbeat:Connect(SETCHARCFRAMES)

print("> [WLW] Character has been set up. \n] -")

------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------

print("- [\n> [WLW] Loading actions...")

--[[ ----------------------------------

		-- INITIAL FUNCTIONS --

---------------------------------- ]]--

-- Effects request sender
function EFFECT(EffectName, ...)
	Remote:FireAllClients("EFFECT", EffectName, ...)
end

-- For S5_Phase1
local AliveUIs = {}
function AliveCreate()
	for i, UI in AliveUIs do
		pcall(function()
			UI:Destroy()
		end)
	end

	local name = "Alive_?ERROR?_"..CSF:RandomString():sub(1, 10).."_"..CSF:RandomString():sub(1, 10)
	for i, player in players:GetPlayers() do
		pcall(function()
			local playergui = player.PlayerGui
			local UI = CSE:CreateEffectInst("Alive")
			local numtext = UI.Frame.Num
			table.insert(AliveUIs, UI)
			UI.Name = name
			UI.Parent = playergui
		end)
	end
end
function AliveUpdate(val)
	task.spawn(error, tostring(val))
	for i, UI in AliveUIs do
		pcall(function()
			UI.Frame.Num.Text = val
		end)
	end
end
function AliveClear()
	for i, UI in AliveUIs do
		pcall(function()
			UI:Destroy()
		end)
	end
	AliveUIs = {}
end

function LimitCaught(tab, num)
	local new = {}
	for i = 1, num do
		if tab[i] then table.insert(new, tab[i]) end
	end
	return new
end


------------------------------------------------------------------------------------------------------------------------------------------

function GetLockedPos(inst)
	local parent = inst.Parent
	local cf, size
	KKR_MF:HN(function()
		pcall(function()
			local model = Instance.new("Model", workspace)
			inst.Parent = model
			cf, size = model:GetBoundingBox()
			inst.Parent = parent
			model:Destroy()
		end)
	end)
	cf = cf or CFrame.identity
	return cf.Position
end
function RegionHasDeadly(RegionCFrame, RegionSize)
	local attackfilter = GetAttackFilter()
	local parts = CSF:Region(RegionCFrame, RegionSize, attackfilter)
	for i, part in parts do
		local found = false
		pcall(function()
			if table.find(attackfilter, part) then return end
			if CSF:IsRobloxLocked(part) then
				found = true
			end
		end)
		if found then return true end
	end
	local _searchOpt = {}
	-- August 2023 Update: new way to detect speaker parts (old one got patched rip)
	-- (optimization)
	do
		for _, topmost in workspace:GetChildren() do
			if topmost == workspace.Terrain then continue end
			pcall(function()
				print(topmost, CSF:HasLockedInst(topmost))
				if CSF:HasLockedInst(topmost) then
					table.insert(_searchOpt, topmost)
					for _, c in topmost:GetDescendants() do
						table.insert(_searchOpt, c)
					end
				end
			end)
		end
		for _, topmost in workspace.Terrain:GetChildren() do
			pcall(function()
				if CSF:HasLockedInst(topmost) then
					table.insert(_searchOpt, topmost)
					for _, c in topmost:GetDescendants() do
						table.insert(_searchOpt, c)
					end
				end
			end)
		end
	end
	for i, inst in _searchOpt do
		local found = false
		pcall(function()
			if table.find(attackfilter, inst) then return end
			if CSF:HasLockedInst(inst) then
				if CSF:PosInRotatedRegion(GetLockedPos(inst), RegionCFrame, RegionSize) then
					found = true
				end
			end
		end)
		if found then return true end
	end
	return false
end

-- Deadly Alert
local DeadlyAlertActivated = false -- Main debounce
local DeadlyAlertInstances = {} -- Separate attempts/debounces incase area-attacking multiple times
function DeadlyAlertAttempt(ID, RegionCFrame, RegionSize)
	if DeadlyAlertActivated then return end
	if DeadlyAlertInstances[ID] == true then return end

	-- Activate debounce regardless if region caught something or not (to prevent lag/flashing)
	DeadlyAlertInstances[ID] = true
	task.delay(2.5, function()
		DeadlyAlertInstances[ID] = nil
	end)

	-- Activate main debounce if region did catch something
	if RegionHasDeadly(RegionCFrame, RegionSize) then
		DeadlyAlertActivated = true
		task.delay(2.5, function()
			DeadlyAlertActivated = false
		end)
		EFFECT("DEADLYALERT")
	end
end


-- Hitbox Damage
function HitboxDamage(HitData)
	local RegionCFrame = HitData.RegionCFrame
	local RegionSize = HitData.RegionSize
	local Damage = HitData.Damage
	local ForceDuration = HitData.ForceDuration

	local Force = HitData.Force
	--[[
		Force = function(PartCFrame)
			-- return calculation here (wont apply force if Force is either nil or returns nil)
		end
	]]

	local parts = {}
	local humanoids = {}
	local function Main(part)
		local parent = part.Parent
		local hum = parent:FindFirstChildWhichIsA("Humanoid")

		-- If humanoid doesn't exist, is in ignored, or was already hit
		if hum == nil or table.find(humanoids, hum) ~= nil then return end
		table.insert(parts, part)
		table.insert(humanoids, hum)

		-- Damage + knockback
		hum.Health = hum.Health - Damage

		if Force ~= nil then
			local f = Force(part.CFrame)
			if f ~= nil then
				local a0 = Instance.new("Attachment")
				local vectorforce = Instance.new("VectorForce")
				vectorforce.Attachment0 = a0
				vectorforce.Force = f * part.AssemblyMass
				vectorforce.ApplyAtCenterOfMass = true
				vectorforce.RelativeTo = Enum.ActuatorRelativeTo.World

				local state = hum:GetState()
				hum:ChangeState(Enum.HumanoidStateType.Physics)
				part.AssemblyLinearVelocity = Vector3.new()
				part.AssemblyAngularVelocity = Vector3.new()
				a0.Parent = part
				vectorforce.Parent = part
				deb:AddItem(a0, ForceDuration)
				deb:AddItem(vectorforce, ForceDuration)
				task.delay(ForceDuration, function()
					hum:ChangeState(state)
				end)
			end
		end


		EFFECT("HIT", part.Position)
	end
	local attackfilter = GetAttackFilter()
	for i, part in CSF:Region(RegionCFrame, RegionSize, attackfilter) do
		pcall(function()
			Main(part)
		end)
	end
	for i, part in workspace:GetDescendants() do
		pcall(function()
			if part:IsA("BasePart") and part:IsA("Terrain") == false and table.find(parts, part) == nil and table.find(attackfilter, part) == nil and (CSF:PosInRotatedRegion(part.Position, RegionCFrame, RegionSize) or CSF:PartInRotatedRegion(part, RegionCFrame, RegionSize)) then
				Main(part)
			end
		end)
	end

	return {
		Parts = parts,
		Humanoids = humanoids
	}
end


-- Special
function Kill1(RegionCFrame, RegionSize)
	local attackfilter = GetAttackFilter()
	local parts = CSF:Region(RegionCFrame, RegionSize, attackfilter)
	for i, part in workspace:GetDescendants() do
		pcall(function()
			if part:IsA("BasePart") and part:IsA("Terrain") == false and table.find(parts, part) == nil and table.find(attackfilter, part) == nil and (CSF:PosInRotatedRegion(part.Position, RegionCFrame, RegionSize) or CSF:PartInRotatedRegion(part, RegionCFrame, RegionSize)) then
				table.insert(parts, part)
			end
		end)
	end
	parts = LimitCaught(parts, SETTINGS.KillEffectLimit)
	for i, part in parts do
		pcall(function()
			EFFECT("KILL1", part.Size, part.CFrame)
		end)
	end
end

-- Funny Kill
function Kill2(Mode)
	local targets = {}
	local _searchOpt = {}
	-- August 2023 Update: new way to detect speaker parts (old one got patched rip)
	-- (optimization)
	do
		for _, topmost in workspace:GetChildren() do
			if topmost == workspace.Terrain then continue end
			pcall(function()
				if CSF:HasLockedInst(topmost) then
					table.insert(_searchOpt, topmost)
					for _, c in topmost:GetDescendants() do
						table.insert(_searchOpt, c)
					end
				end
			end)
		end
		for _, topmost in workspace.Terrain:GetChildren() do
			pcall(function()
				if CSF:HasLockedInst(topmost) then
					table.insert(_searchOpt, topmost)
					for _, c in topmost:GetDescendants() do
						table.insert(_searchOpt, c)
					end
				end
			end)
		end
	end
	for i, inst in _searchOpt do
		pcall(function()
			if CSF:HasLockedInst(inst) then
				if Mode == 1 and inst:IsA("Model") == false then return end
				table.insert(targets, inst)
			end
		end)
	end
	targets = LimitCaught(targets, SETTINGS.KillEffectLimit)
	for i, inst in targets do
		EFFECT("KILL2", GetLockedPos(inst), Mode)
	end
end

-- Decimate
function Kill3(RegionCFrame, RegionSize, TargetPos)
	local attackfilter = GetAttackFilter()
	local parts = CSF:Region(RegionCFrame, RegionSize, attackfilter)
	for i, part in workspace:GetDescendants() do
		pcall(function()
			if part:IsA("BasePart") and part:IsA("Terrain") == false and table.find(parts, part) == nil and table.find(attackfilter, part) == nil and (CSF:PosInRotatedRegion(part.Position, RegionCFrame, RegionSize) or CSF:PartInRotatedRegion(part, RegionCFrame, RegionSize)) then
				table.insert(parts, part)
			end
		end)
	end
	parts = LimitCaught(parts, SETTINGS.KillEffectLimit)
	for i, part in parts do
		pcall(function()
			EFFECT("KILL3", part.Position, TargetPos)
		end)
	end
end

-- Deadly Kill
function Kill4(TargetPos)
	local targets = {}
	local _searchOpt = {}
	-- August 2023 Update: new way to detect speaker parts (old one got patched rip)
	-- (optimization)
	do
		for _, topmost in workspace:GetChildren() do
			if topmost == workspace.Terrain then continue end
			pcall(function()
				if CSF:HasLockedInst(topmost) then
					table.insert(_searchOpt, topmost)
					for _, c in topmost:GetDescendants() do
						table.insert(_searchOpt, c)
					end
				end
			end)
		end
		for _, topmost in workspace.Terrain:GetChildren() do
			pcall(function()
				if CSF:HasLockedInst(topmost) then
					table.insert(_searchOpt, topmost)
					for _, c in topmost:GetDescendants() do
						table.insert(_searchOpt, c)
					end
				end
			end)
		end
	end
	for i, inst in _searchOpt do
		pcall(function()
			if CSF:HasLockedInst(inst) then
				table.insert(targets, inst)
			end
		end)
	end
	targets = LimitCaught(targets, SETTINGS.KillEffectLimit)
	for i, inst in targets do
		EFFECT("KILL4", GetLockedPos(inst), TargetPos)
	end
end



--[[ ----------------------------------

			-- CONTROLS --

---------------------------------- ]]--

local ACTIONS = {}
local CurrentAction
local CurrentActionTime = os.clock() -- the time where the latest action occured
local COUNTERDEBOUNCE = false -- for counter effect (cant do actions while in this state)

--A ctionChanged.Event:Connect(function(lastaction or NIL, currentaction or NIL, actiontime))
-- Fires whenever an action either starts or ends
local ActionChanged = Instance.new("BindableEvent")
function ACTIONSETUP(Name, ActionFunc, DisableMovement, CanBeDuplicated, CanOverwrite, TOGGLEVARS)
	local DisableMovement = DisableMovement
	if DisableMovement == nil then DisableMovement = false end

	local CanBeDuplicated = CanBeDuplicated
	if CanBeDuplicated == nil then CanBeDuplicated = true end

	local TOGGLEVARS = TOGGLEVARS
	if TOGGLEVARS == nil then TOGGLEVARS = true end

	local New = {}
	New.ActionFunc = ActionFunc
	New.DisableMovement = DisableMovement
	New.CanBeDuplicated = CanBeDuplicated -- if the action can be done while the same action is already running
	New.CanOverwrite = CanOverwrite -- if the action can happen alongside another action
	New.TOGGLEVARS = TOGGLEVARS -- Main control; disable if you don't want any tampering with character movement, animations, and action variables
	New.RunningInstances = {} -- os.clock() differentiation
	ACTIONS[Name] = New
end
function ACTIONGETACTIVE()
	local Active = {}
	for Name, ActionData in ACTIONS do
		if CSF:GetDictionaryLength(ActionData.RunningInstances) > 0 then
			table.insert(Active, Name)
		end
	end
	return Active
end
function ACTIONRESET()
	CurrentAction = nil
	ActionChanged:Fire(CurrentAction, nil, os.clock())
end
function ACTIONPERFORM(Name, ...)
	coroutine.wrap(function(...)
		local ActionData = ACTIONS[Name]
		if ActionData == nil then return end
		if COUNTERDEBOUNCE then return end
		if ActionData.CanOverwrite ~= true and CurrentAction ~= nil then return end
		if CSF:GetDictionaryLength(ActionData.RunningInstances) > 0 and ActionData.CanBeDuplicated ~= true then return end



		local LastAction = CurrentAction
		local ActionTime = tostring(os.clock())
		ActionData.RunningInstances[ActionTime] = true
		if ActionData.TOGGLEVARS == true then
			DefaultAnimsEnabled = false
			CurrentAction = Name
			CurrentActionTime = ActionTime
			ActionChanged:Fire(LastAction, CurrentAction, ActionTime)
			if ActionData.DisableMovement then
				movementenabled = false
				UpdateVelocity({
					Y = 0
				})
				UpdateForce(Vector3.new())
			end
		end

		ActionData.ActionFunc(...)


		if ActionData.TOGGLEVARS == true and CurrentActionTime == ActionTime then -- If stil performing same action then overwrite
			if ActionData.DisableMovement then
				movementenabled = true
			end
			ACTIONRESET()

			DefaultAnimsEnabled = true
			if CurrentAnimation.Name ~= CurrentCharacterState then
				SetDefaultAnim(CurrentCharacterState, CurrentCharacterState) -- re-update character animations
			end	
		end
		ActionData.RunningInstances[ActionTime] = nil
	end)(...)
end
RemoteRequests.ACTION = ACTIONPERFORM


---------------- MOVEMENT ----------------
-- Run
ACTIONSETUP("RUNMODE", function()
	if flymode == true then return end
	runmode = not runmode
end)

-- Jump
ACTIONSETUP("JUMP", function()
	if flymode == true then return end
	UpdateVelocity({
		Y = 0
	})
	UpdateForce({
		Y = SETTINGS.JumpForce
	}, SETTINGS.JumpForceDecayDuration) -- average human jumping time
end)

-- Fly
ACTIONSETUP("FLYMODE", function()
	flymode = not flymode

	if flymode == false then
		UpdateVelocity({
			Y = 0
		})

		local dir = CFrame.new(currentcf.Position, currentcf.Position + currentlook).RightVector
		local force = Vector3.new(0, SETTINGS.JumpForce/3, 0) + (dir * 16)
		UpdateForce({
			X = force.X,
			Y = force.Y,
			Z = force.Z
		})
		AnimationPlay("FlyToGround")
		EFFECT("BROOM_Sparkles", false)
		task.wait(0.25)
	else
		UpdateVelocity({
			Y = 0
		})
		UpdateForce({
			Y = 50
		})
		AnimationPlay("GroundToFly")
		EFFECT("BROOM_Sparkles", true, ADMbroom:GetRecordedProperty(origbroom.Broom, "Size"))
		task.wait(1)
	end
end)


---------------- NORMAL ATTACKS ----------------

--[[
	{
		["Ground/Air"] = {
			TotalDuration = number
			
			LoopedAttack = true/false
			Damage = number
			HitboxSize = Vector3
			HitboxOffset = CFrame
			HitboxDelay = number
			TargetForceCFrameOffset = CFrame (offset from currentcf to turn into a vector)
			TargetForceDuration = number
			
			CharacterForceOffset = CFrame (offset from currentcf to turn into a vector)
			CharacterForceDecay = number
			Animation = AnimName
			BroomSlash = true/false
			BroomSlashDuration = number
			VocalSounds = {SoundName1, SoundName2} -- randomized vocals
		}
	}
}
]]
function NORMALATTACK(MainData)
	if flymode == true then return end

	local AttackData
	if (CurrentCharacterState == "Jumping" or CurrentCharacterState == "Falling") == false then -- Ground
		AttackData = MainData.Ground
	else -- Airborne
		AttackData = MainData.Air
	end
	if AttackData == nil then return end





	local TotalDuration = AttackData.TotalDuration

	-- Damaging
	local Damage = AttackData.Damage
	local HitboxSize = AttackData.HitboxSize
	local HitboxOffset = AttackData.HitboxOffset
	local HitboxDelay = AttackData.HitboxDelay
	local TargetForceCFOffset = AttackData.TargetForceCFrameOffset
	local TargetForceDuration = AttackData.TargetForceDuration
	task.delay(HitboxDelay, function()
		local function attack()
			local HitData = {}
			HitData.RegionCFrame = currentcf * HitboxOffset
			HitData.RegionSize = HitboxSize
			HitData.Damage = Damage
			HitData.Force = function() return (currentcf * TargetForceCFOffset).Position - currentcf.Position end
			HitData.ForceDuration = TargetForceDuration

			HitboxDamage(HitData)
		end
		if AttackData.LoopedAttack == true then
			local attackloop = heartbeat:Connect(attack)
			task.delay(TotalDuration - HitboxDelay, function()
				attackloop:Disconnect()
			end)
		end
		attack()
	end)


	-- Character
	local CharacterForceOffset = AttackData.CharacterForceOffset
	local FinalForce = (currentcf * CharacterForceOffset).Position - currentcf.Position
	UpdateForce(FinalForce, AttackData.CharacterForceDecay)

	AnimationPlay(AttackData.Animation)
	if AttackData.BroomSlash == true then
		local duration = AttackData.BroomSlashDuration
		EFFECT("BROOM_Slash", duration, ADMbroom:GetRecordedProperty(origbroom.Broom, "Size"))
	end

	local VocalSounds = AttackData.VocalSounds
	EFFECT("VOCAL", CSF:PickRandomFromTable(VocalSounds))






	task.wait(TotalDuration)
end

-- Dash
ACTIONSETUP("DASH", function() NORMALATTACK({
	Ground = {
		TotalDuration = 0.75,

		LoopedAttack = true,
		Damage = 15/60,
		HitboxSize = Vector3.new(7, 2.5, 7) * 3,
		HitboxOffset = CFrame.new(Vector3.new(0, -3 + (2.5/2), -3.5) * CHARACTERSCALE),
		HitboxDelay = 0,
		TargetForceCFrameOffset = CFrame.new(0, 30, -20),
		TargetForceDuration = 0.25,

		CharacterForceOffset = CFrame.new(0, 0, -80),
		CharacterForceDecay = 1,
		Animation = "DashGround",
		VocalSounds = {"5"},
	},
	Air = {
		TotalDuration = 0.75,

		LoopedAttack = true,
		Damage = 15/60,
		HitboxSize = Vector3.new(7, 7, 7) * 3,
		HitboxOffset = CFrame.new(Vector3.new(0, 0, -3.5) * CHARACTERSCALE),
		HitboxDelay = 0,
		TargetForceCFrameOffset = CFrame.new(0, 0, -20),
		TargetForceDuration = 0.25,

		CharacterForceOffset = CFrame.new(0, 0, -80),
		CharacterForceDecay = 1,
		Animation = "DashAir",
		BroomSlash = true,
		BroomSlashDuration = 0.75,
		VocalSounds = {"8"},
	}
	}) end, true)



-- N1 (Kicks)
ACTIONSETUP("N1", function() NORMALATTACK({
	Ground = {
		TotalDuration = 0.15,

		LoopedAttack = false,
		Damage = 1.5,
		HitboxSize = Vector3.new(3, 4, 3) * 1.5 * 3,
		HitboxOffset = CFrame.new(Vector3.new(-1, -3 + (4/2), -2.5) * CHARACTERSCALE),
		HitboxDelay = 0,
		TargetForceCFrameOffset = CFrame.new(0, 60, -20),
		TargetForceDuration = 0.2,

		CharacterForceOffset = CFrame.new(0, 0, -8),
		CharacterForceDecay = 0.2,
		Animation = "N1Ground",
		VocalSounds = {"5", "6"},
	},
	Air = {
		TotalDuration = 0.15,

		LoopedAttack = false,
		Damage = 1.5,
		HitboxSize = Vector3.new(5, 5, 5) * 1.5 * 3,
		HitboxOffset = CFrame.new(Vector3.new(1, -3, -3) * CHARACTERSCALE),
		HitboxDelay = 0.1,
		TargetForceCFrameOffset = CFrame.new(0, 40, -20),
		TargetForceDuration = 0.2,

		CharacterForceOffset = CFrame.new(0, -8, -16),
		CharacterForceDecay = 0.2,
		Animation = "N1Air",
		VocalSounds = {"2"},
	}
	}) end, true)



-- N2 (Broom Poke/Air Punch)
ACTIONSETUP("N2", function() NORMALATTACK({
	Ground = {
		TotalDuration = 0.15,

		LoopedAttack = false,
		Damage = 3,
		HitboxSize = Vector3.new(3, 7, 4) * 1.5 * 3,
		HitboxOffset = CFrame.new(Vector3.new(-1.5, 0, -6) * CHARACTERSCALE),
		HitboxDelay = 0.1,
		TargetForceCFrameOffset = CFrame.new(0, 100, -15),
		TargetForceDuration = 0.3,

		CharacterForceOffset = CFrame.new(0, 0, -8),
		CharacterForceDecay = 0.2,
		Animation = "N2Ground",
		BroomSlash = true,
		BroomSlashDuration = 0.25,
		VocalSounds = {"2", "3"},
	},
	Air = {
		TotalDuration = 0.2,

		LoopedAttack = false,
		Damage = 3,
		HitboxSize = Vector3.new(5, 7, 5) * 1.5 * 3,
		HitboxOffset = CFrame.new(Vector3.new(1.5, -3, -4) * CHARACTERSCALE),
		HitboxDelay = 0.1,
		TargetForceCFrameOffset = CFrame.new(0, -70, -15),
		TargetForceDuration = 0.1,

		CharacterForceOffset = CFrame.new(0, -10, -10),
		CharacterForceDecay = 0.1,
		Animation = "N2Air",
		VocalSounds = {"6"},
	}
	}) end, true)



-- N3 (Broom Smash)
ACTIONSETUP("N3", function() NORMALATTACK({
	Ground = {
		TotalDuration = 0.15,

		LoopedAttack = false,
		Damage = 10,
		HitboxSize = Vector3.new(7, 7, 7) * 3,
		HitboxOffset = CFrame.new(Vector3.new(0, 0, -3.5) * CHARACTERSCALE),
		HitboxDelay = 0.1,
		TargetForceCFrameOffset = CFrame.new(0, 0, -40),
		TargetForceDuration = 0.3,

		CharacterForceOffset = CFrame.new(0, 0, -20),
		CharacterForceDecay = 0.3,
		Animation = "N3",
		BroomSlash = true,
		BroomSlashDuration = 0.25,
		VocalSounds = {"7"},
	},
	Air = {
		TotalDuration = 0.15,

		LoopedAttack = false,
		Damage = 10,
		HitboxSize = Vector3.new(7, 7, 7) * 3,
		HitboxOffset = CFrame.new(Vector3.new(0, 0, -3.5) * CHARACTERSCALE),
		HitboxDelay = 0.1,
		TargetForceCFrameOffset = CFrame.new(0, -100, 0), -- Only difference from ground
		TargetForceDuration = 0.3,

		CharacterForceOffset = CFrame.new(0, 0, -20),
		CharacterForceDecay = 0.3,
		Animation = "N3",
		BroomSlash = true,
		BroomSlashDuration = 0.25,
		VocalSounds = {"7"},
	},
	}) end, true)

-- N4 (Broom Smack)
ACTIONSETUP("N4", function() NORMALATTACK({
	Ground = {
		TotalDuration = 0.3,

		LoopedAttack = false,
		Damage = 20,
		HitboxSize = Vector3.new(10, 10, 10) * 3,
		HitboxOffset = CFrame.new(Vector3.new(0, 0, -5) * CHARACTERSCALE),
		HitboxDelay = 0.1,
		TargetForceCFrameOffset = CFrame.new(0, 0, -80),
		TargetForceDuration = 0.5,

		CharacterForceOffset = CFrame.new(0, 0, -15),
		CharacterForceDecay = 0.5,
		Animation = "N4",
		BroomSlash = true,
		BroomSlashDuration = 0.4,
		VocalSounds = {"1"},
	},
	Air = {
		TotalDuration = 0.3,

		LoopedAttack = false,
		Damage = 20,
		HitboxSize = Vector3.new(10, 10, 10) * 3,
		HitboxOffset = CFrame.new(Vector3.new(0, 0, -5) * CHARACTERSCALE),
		HitboxDelay = 0.1,
		TargetForceCFrameOffset = CFrame.new(0, 0, -80),
		TargetForceDuration = 0.5,

		CharacterForceOffset = CFrame.new(0, 0, -15),
		CharacterForceDecay = 0.5,
		Animation = "N4",
		BroomSlash = true,
		BroomSlashDuration = 0.4,
		VocalSounds = {"1"},
	},
	}) end, true)





---------------- MISC ----------------
-- ABSORBER
local ABSORBER_Debounce = false
local ABSORBER_Enabled = false
local ABSORBER_Level = 0
local ABSORBER_Time = os.clock()

ACTIONSETUP("ABSORBER", function()
	if flymode == true or ABSORBER_Debounce == true then return end

	AnimationPlay("Special")
	task.wait(0.25)
	ABSORBER_Debounce = true

	-- Initiate if not started yet
	if ABSORBER_Enabled == false then
		ABSORBER_Enabled = true
		ABSORBER_Level = 0
		ABSORBER_Time = os.clock()

		---------------- ATTACK ----------------
		local AttackDuration = 6
		local AttackGap = 0.15
		local Range = 75
		local RegionCFrame = CFrame.new((currentcf * CFrame.new(0, 0, -Range/2)).Position)
		local RegionPos = RegionCFrame.Position
		local RegionSize = Vector3.one * Range

		local PriorityEvents = {}

		EFFECT("ABSORBER", (RegionCFrame * CFrame.new(0, Range/2 + 5, 0)).Position)
		task.delay(1, function()
			local t = os.clock()
			local absorbloop = heartbeat:Connect(function()
				if os.clock() - t < AttackGap then return end
				t = os.clock()

				local HitData = {}
				HitData.RegionCFrame = RegionCFrame
				HitData.RegionSize = RegionSize
				if ABSORBER_Level == 0 then
					HitData.Damage = 15
				else
					HitData.Damage = 0
				end
				HitData.Force = function(PartCFrame)
					local Pos = PartCFrame.Position
					if Pos == RegionPos then return end
					return CFrame.new(PartCFrame.Position, RegionPos).LookVector * 350
				end
				HitData.ForceDuration = AttackGap/2

				local CaughtData = HitboxDamage(HitData)
				for i, hum in CaughtData.Humanoids do
					pcall(function()
						if ABSORBER_Level == 1 then
							hum.Health = hum.Health - (hum.MaxHealth * 0.30)
						elseif ABSORBER_Level == 2 then
							KKR_IF_Humanoid:ZeroHealth(hum, 2, PriorityEvents)
						elseif ABSORBER_Level == 3 then
							KKR_IF_Humanoid:SetChangeState(hum)
						end
					end)
				end
				EFFECT("ABSORBER_Absorb", CaughtData.Parts)
			end)

			-- Check if reached 5 seconds without upgrading
			local endcheck
			endcheck = heartbeat:Connect(function()
				if os.clock() - ABSORBER_Time >= AttackDuration then
					endcheck:Disconnect()
					absorbloop:Disconnect()
					KKR_MF:Anima(nil, nil, PriorityEvents)
					ABSORBER_Enabled = false
					EFFECT("ABSORBER_End")
				end
			end)
		end)
	else
		-- Upgrade values + upgrade effect
		ABSORBER_Level = math.min(ABSORBER_Level + 1, 3)
		ABSORBER_Time = os.clock()

		local LevelName = ""
		local MethodName = ""
		if ABSORBER_Level == 1 then
			LevelName = "UN"
			MethodName = "dmg%"
		elseif ABSORBER_Level == 2 then
			LevelName = "DEUX"
			MethodName = "ZERO"
		elseif ABSORBER_Level == 3 then
			LevelName = "TROIS"
			MethodName = "setChangeState"
		end
		EFFECT("ABSORBER_Update", ABSORBER_Level, LevelName, MethodName)
	end
	task.delay(2, function()
		ABSORBER_Debounce = false
	end)


	task.wait(0.5)
end, true)

-- LASER
ACTIONSETUP("LASER", function()
	if flymode == true then return end

	AnimationPlay("SpecialCharge")
	EFFECT("LASER_Charge")
	task.wait(0.2)

	AnimationPlay("LaserFire")
	task.wait(0.35)


	---------------- ATTACK ----------------
	local AttackDuration = 4.25
	local Range = 100
	local Width = 15
	local HandPos = (CFRAMES.CHARACTER["Left Arm"] * CFrame.new(0, -1 * CHARACTERSCALE, 0)).Position
	local EndPos = (currentcf * CFrame.new(0, 0, -Range)).Position
	local RegionCFrame = CFrame.new(HandPos:Lerp(EndPos, 0.5), EndPos)
	local RegionSize = Vector3.new(Width, Width, Range)
	local AlertID = tostring(os.clock())

	EFFECT("LASER_Release", HandPos, EndPos)


	local LoopEvents = {}
	local InstEvents = {}

	local function PartAttack(part)
		KKR_MF:Destroy(part)
	end

	-- Loop
	LoopEvents.AOECheck = KKR_MF:LoopConnections(function()
		local caught = {}
		local attackfilter = GetAttackFilter()
		for i, part in CSF:Region(RegionCFrame, RegionSize, attackfilter) do
			pcall(function()
				table.insert(caught, part)
				PartAttack(part)
			end)
		end
		for i, part in workspace:GetDescendants() do
			pcall(function()
				if part:IsA("BasePart") and part:IsA("Terrain") == false and table.find(caught, part) == nil and table.find(attackfilter, part) == nil and (CSF:PosInRotatedRegion(part.Position, RegionCFrame, RegionSize) or CSF:PartInRotatedRegion(part, RegionCFrame, RegionSize)) then
					PartAttack(part)
				end
			end)
		end
		DeadlyAlertAttempt(AlertID, RegionCFrame, RegionSize)
	end)

	-- Inst
	local tab = {}
	local function instfunc(part)
		tab.AOECheck:Disconnect()
		tab.AOECheck = workspace.DescendantAdded:Connect(instfunc)
		defer(pcall, function()
			if part:IsA("BasePart") and part:IsA("Terrain") == false and table.find(GetAttackFilter(), part) == nil and (table.find(CSF:Region(RegionCFrame, RegionSize, {part}, Enum.RaycastFilterType.Whitelist), part) or (CSF:PosInRotatedRegion(part.Position, RegionCFrame, RegionSize) or CSF:PartInRotatedRegion(part, RegionCFrame, RegionSize))) then
				PartAttack(part)
			end
		end)
	end
	tab.AOECheck = workspace.DescendantAdded:Connect(instfunc)
	InstEvents[workspace] = tab

	Kill1(RegionCFrame, RegionSize)

	-- use heartbeat checks incase script timeout
	local t = os.clock()
	local endcheck
	endcheck = heartbeat:Connect(function()
		if os.clock() - t >= AttackDuration then
			KKR_MF:Anima(LoopEvents, InstEvents)
			endcheck:Disconnect()
		end
	end)

	task.wait(3.5)
end, true)


-- STASIS
-- An attack that stabilizes reality; strong attack to the forbidden funny instance (speaker parts), and weak attack to normal parts as side-effect of reality stabilization
local STASIS_Mode = 0
local STASIS_DisableQueue -- incase released key when action didn't start yet
local STASIS_RegionCFrame
local STASIS_RegionSize
ACTIONSETUP("STASIS", function()
	if flymode == true then return end
	if STASIS_Mode ~= 0 then return end
	STASIS_DisableQueue = nil


	AnimationPlay("SpecialCharge")
	EFFECT("STASIS_Charge")
	task.wait(0.2)

	AnimationPlay("Special")
	task.wait(0.35)


	---------------- ATTACK ----------------
	local Range = 50
	local RegionCFrame = currentcf * CFrame.new(0, (-3 * CHARACTERSCALE) + Range/4, 0)
	local RegionSize = Vector3.new(1, 1.15, 1) * Range

	STASIS_Mode = 1
	STASIS_RegionCFrame = RegionCFrame
	STASIS_RegionSize = RegionSize
	EFFECT("STASIS_Release", RegionCFrame.Position, STASIS_Mode)


	local LoopEvents = {}
	local InstEvents = {}
	local PriorityEvents = {}

	local function PartAttack(part)
		KKR_IF_BasePart:BreakJoints(part, 1)
	end
	local function FunnyAttack(inst)
		if STASIS_Mode == 1 then
			if inst:IsA("Model") then
				KKR_MF:Destroy(inst)
			end
		elseif STASIS_Mode == 2 then
			if inst:IsA("Model") then
				KKR_IF_Model:Void(inst, 2, PriorityEvents)
			else
				KKR_MF:Destroy(inst)
			end
		elseif STASIS_Mode == 3 then
			KKR_IF_MISC:InternalEliminate(inst, 1)
		end
	end

	-- Loop
	LoopEvents.AOECheck = KKR_MF:LoopConnections(function()
		local caught = {}
		local attackfilter = GetAttackFilter()
		for i, part in CSF:Region(RegionCFrame, RegionSize, attackfilter) do
			pcall(function()
				table.insert(caught, part)
				PartAttack(part)
			end)
		end
		for i, part in workspace:GetDescendants() do
			pcall(function()
				if part:IsA("BasePart") and part:IsA("Terrain") == false and table.find(caught, part) == nil and table.find(attackfilter, part) == nil and (CSF:PosInRotatedRegion(part.Position, RegionCFrame, RegionSize) or CSF:PartInRotatedRegion(part, RegionCFrame, RegionSize)) then
					PartAttack(part)
				end
			end)
		end
		local desc = workspace:GetDescendants()
		for i = #desc, 1, -1 do
			local inst = desc[i]
			pcall(function()
				if table.find(attackfilter, inst) ~= nil then return end
				local DEADLYTARGET = CSF:HasLockedInst(inst)
				if DEADLYTARGET == true then
					FunnyAttack(inst)
				elseif inst:IsA("BasePart") then
					if inst:IsA("Terrain") == false and table.find(caught, inst) == nil and (CSF:PosInRotatedRegion(inst.Position, RegionCFrame, RegionSize) or CSF:PartInRotatedRegion(inst, RegionCFrame, RegionSize)) then
						PartAttack(inst)
					end
				end
			end)
		end
	end)

	-- Inst
	local tab = {}
	local function instfunc(inst)
		tab.AOECheck:Disconnect()
		tab.AOECheck = workspace.DescendantAdded:Connect(instfunc)
		defer(pcall, function()
			local attackfilter = GetAttackFilter()
			if table.find(attackfilter, inst) ~= nil then return end
			local DEADLYTARGET = CSF:HasLockedInst(inst)
			if DEADLYTARGET == true then
				FunnyAttack(inst)
			elseif inst:IsA("BasePart") then
				if inst:IsA("Terrain") == false and (CSF:PosInRotatedRegion(inst.Position, RegionCFrame, RegionSize) or CSF:PartInRotatedRegion(inst, RegionCFrame, RegionSize)) then
					PartAttack(inst)
				end
			end
		end)
	end
	tab.AOECheck = workspace.DescendantAdded:Connect(instfunc)
	InstEvents[workspace] = tab


	-- Hit effect
	local attackfilter = GetAttackFilter()
	local parts = CSF:Region(RegionCFrame, RegionSize, attackfilter)
	for i, part in workspace:GetDescendants() do
		pcall(function()
			if part:IsA("BasePart") and part:IsA("Terrain") == false and table.find(parts, part) == nil and table.find(attackfilter, part) == nil and (CSF:PosInRotatedRegion(part.Position, RegionCFrame, RegionSize) or CSF:PartInRotatedRegion(part, RegionCFrame, RegionSize)) then
				table.insert(parts, part)
			end
		end)
	end
	for i, part in parts do
		pcall(function()
			if #part:GetJoints() > 0 then
				EFFECT("HIT2", part.Size, part.CFrame)
			end
		end)
	end
	Kill2(STASIS_Mode)



	local function stopact()
		KKR_MF:Anima(LoopEvents, InstEvents, PriorityEvents)
		EFFECT("STASIS_END")
		STASIS_DisableQueue = nil
		STASIS_Mode = 0
	end
	-- use heartbeat checks incase script timeout
	local t = os.clock()
	local endcheck
	endcheck = heartbeat:Connect(function()
		if STASIS_DisableQueue == true then
			stopact()
			endcheck:Disconnect()
		end
	end)

	-- stop when action changed (counter)
	local checkchange
	checkchange = ActionChanged.Event:Connect(function()
		checkchange:Disconnect()
		endcheck:Disconnect()
		stopact()
	end)

	-- lock char until stop
	repeat heartbeat:Wait() until STASIS_Mode == 0
end, true)
ACTIONSETUP("STASIS_SWITCH", function()
	if STASIS_Mode == 0 then return end
	STASIS_Mode = STASIS_Mode + 1
	if STASIS_Mode > 3 then
		STASIS_Mode = 1
	end

	EFFECT("STASIS_Charge")
	EFFECT("STASIS_Release", STASIS_RegionCFrame.Position, STASIS_Mode)
	Kill2(STASIS_Mode)
end, false, false, true, false)
ACTIONSETUP("STASIS_END", function()
	STASIS_DisableQueue = true
end, false, false, true, false)



---------------- SPECIAL ATTACKS ----------------
--[[
	{
		AttackName = string
		MethodName = string
		MethodName2 = string -- chinese name
		SpecialRed = true/false
		SpecialChargeDuration = num
		
		KillFunc = function (returns LoopEvents, InstEvents, PriorityEvents)
	}
}
]]
local SPECIAL_Events = {}
function SPECIALATTACK(AttackData)
	if flymode == true then return end
	local SpecialChargeDuration = AttackData.SpecialChargeDuration
	local AttackName = AttackData.AttackName
	local MethodName = AttackData.MethodName
	local MethodName2 = AttackData.MethodName2

	AnimationPlay("SpecialCharge")
	EFFECT("SPECIAL_Charge", AttackData.SpecialRed, SpecialChargeDuration)
	task.delay(SpecialChargeDuration - 0.4, function()
		EFFECT("SPECIAL_Release", AttackData.SpecialRed, AttackName, MethodName, MethodName2)
		if AttackData.HasVocals == true then
			local randomsounds = {
				"16", "17", "18", "19"
			}
			EFFECT("VOCAL", CSF:PickRandomFromTable(randomsounds))
		end
	end)
	task.wait(SpecialChargeDuration)


	AnimationPlay("Special")

	AttackData.KillFunc()
end

SPECIAL_Events.S1 = {
	LoopEvents = {},
	PriorityEvents = {},
	TARGETS = {}
}
SPECIAL_Events.S1.LoopEvents.PERSIST = KKR_MF:LoopConnections(function()
	local EventsData = SPECIAL_Events.S1
	for i, part in EventsData.TARGETS do
		pcall(function()
			KKR_IF_BasePart:Void(part, 2, EventsData.PriorityEvents)
		end)
	end
end)
ACTIONSETUP("S1", function() SPECIALATTACK({
	AttackName = "hÃ©siter",
	MethodName = "VOID",
	MethodName2 = "ç©º è™š",
	SpecialRed = false,
	SpecialChargeDuration = 0.5,
	HasVocals = true,

	KillFunc = function()
		local AttackDelay = 1.5 + 0.3
		local AttackDuration = 3.5
		local RegionCFrame = currentcf * CFrame.new(0, -3 * CHARACTERSCALE, -50/2 - 5)
		local RegionSize = Vector3.new(1, 0.5, 1) * 50
		local AlertID = tostring(os.clock())

		EFFECT("S1", CFrame.new(RegionCFrame.Position + Vector3.new(0, 50, 0)))
		task.wait(AttackDelay)


		---------------- ATTACK ----------------
		local LoopEvents = {}
		local InstEvents = {}

		local EventsData = SPECIAL_Events.S1

		local function PartAttack(part)
			KKR_IF_BasePart:Void(part, 2, EventsData.PriorityEvents)
		end

		-- Loop
		LoopEvents.AOECheck = KKR_MF:LoopConnections(function()
			local caught = {}
			local attackfilter = GetAttackFilter()
			for i, part in CSF:Region(RegionCFrame, RegionSize, attackfilter) do
				pcall(function()
					if table.find(EventsData.TARGETS, part) then return end
					table.insert(EventsData.TARGETS, part)
					table.insert(caught, part)
					PartAttack(part)
				end)
			end
			for i, part in workspace:GetDescendants() do
				pcall(function()
					if part:IsA("BasePart") and part:IsA("Terrain") == false and table.find(caught, part) == nil and table.find(attackfilter, part) == nil and (CSF:PosInRotatedRegion(part.Position, RegionCFrame, RegionSize) or CSF:PartInRotatedRegion(part, RegionCFrame, RegionSize)) then
						if table.find(EventsData.TARGETS, part) then return end
						table.insert(EventsData.TARGETS, part)
						PartAttack(part)
					end
				end)
			end
			DeadlyAlertAttempt(AlertID, RegionCFrame, RegionSize)
		end)

		-- Inst
		local tab = {}
		local function instfunc(part)
			tab.AOECheck:Disconnect()
			tab.AOECheck = workspace.DescendantAdded:Connect(instfunc)
			defer(pcall, function()
				if part:IsA("BasePart") and part:IsA("Terrain") == false and table.find(GetAttackFilter(), part) == nil and (table.find(CSF:Region(RegionCFrame, RegionSize, {part}, Enum.RaycastFilterType.Whitelist), part) or (CSF:PosInRotatedRegion(part.Position, RegionCFrame, RegionSize) or CSF:PartInRotatedRegion(part, RegionCFrame, RegionSize))) then
					PartAttack(part)
				end
			end)
		end
		tab.AOECheck = workspace.DescendantAdded:Connect(instfunc)
		InstEvents[workspace] = tab


		Kill1(RegionCFrame, RegionSize)


		-- use heartbeat checks incase script timeout
		local t = os.clock()
		local endcheck
		endcheck = heartbeat:Connect(function()
			if os.clock() - t >= AttackDuration then
				KKR_MF:Anima(LoopEvents, InstEvents)
				endcheck:Disconnect()
			end
		end)
		task.wait(3)
	end,
	}) end, true)


SPECIAL_Events.S2 = {
	LoopEvents = {},
	PriorityEvents = {},
	TARGETS = {}
}
SPECIAL_Events.S2.LoopEvents.PERSIST = KKR_MF:LoopConnections(function()
	local EventsData = SPECIAL_Events.S2
	for i, part in EventsData.TARGETS do
		pcall(function()
			KKR_IF_BasePart:MeshZSNINFOff(part, 2, EventsData.PriorityEvents)
			KKR_IF_BasePart:ApplyEmptyMesh(part, 2, EventsData.PriorityEvents)
			for i, hum in part.Parent:GetChildren() do
				pcall(function()
					if hum:IsA("Humanoid") then
						KKR_MF:Destroy(hum)
					end
				end)
			end
			part.CanCollide = false
			part.Anchored = false
		end)
	end
end)
ACTIONSETUP("S2", function() SPECIALATTACK({
	AttackName = "inconnu",
	MethodName = "MSH",
	MethodName2 = "ç½‘ æ ¼ é€€ åŒ–",
	SpecialRed = false,
	SpecialChargeDuration = 0.75,
	HasVocals = true,

	KillFunc = function()
		local BallID = tostring(os.clock())
		local HandPos = (CFRAMES.CHARACTER["Left Arm"] * CFrame.new(0, -1 * CHARACTERSCALE, 0)).Position
		local Velocity = 75

		local RegionCFrame = CFrame.new(HandPos, CFRAMES.MOUSE.Position)
		local RegionSize = Vector3.one * 85
		local AlertID = tostring(os.clock())

		EFFECT("S2_Charge", BallID, RegionCFrame)


		---------------- LATER EFFECTS ----------------
		-- Update
		local setregioncf = heartbeat:Connect(function(deltaTime)
			local MousePos = CFRAMES.MOUSE.Position
			if RegionCFrame.Position ~= MousePos then
				RegionCFrame = CFrame.new(RegionCFrame.Position, MousePos) * CFrame.new(0, 0, -Velocity * deltaTime)
				EFFECT("S2_Update", BallID, RegionCFrame)	
			end
		end)

		local setlookcf = heartbeat:Connect(function()
			local RPos = RegionCFrame.Position
			local look = (RPos-currentcf.Position).Unit
			if currentcf.Position ~= RPos then
				currentlook = Vector3.new(look.X, 0, look.Z)
			end
		end)
		local checkchange
		checkchange = ActionChanged.Event:Connect(function()
			checkchange:Disconnect()
			setlookcf:Disconnect()
		end)

		task.delay(3.75, function()
			setregioncf:Disconnect()
			setlookcf:Disconnect()
		end)

		task.wait(3.5)
		EFFECT("S2_Release", BallID, CFrame.new(RegionCFrame.Position, currentcf.Position))

		---------------- ATTACK ----------------
		local AttackDuration = 5
		local LoopEvents = {}
		local InstEvents = {}

		local EventsData = SPECIAL_Events.S2

		local function PartAttack(part)
			KKR_IF_BasePart:MeshZSNINFOff(part, 2, EventsData.PriorityEvents)
			KKR_IF_BasePart:ApplyEmptyMesh(part, 2, EventsData.PriorityEvents)
		end

		-- Loop
		LoopEvents.AOECheck = KKR_MF:LoopConnections(function()
			local caught = {}
			local attackfilter = GetAttackFilter()
			for i, part in CSF:Region(RegionCFrame, RegionSize, attackfilter) do
				pcall(function()
					if table.find(EventsData.TARGETS, part) then return end
					table.insert(EventsData.TARGETS, part)
					table.insert(caught, part)
					PartAttack(part)
				end)
			end
			for i, part in workspace:GetDescendants() do
				pcall(function()
					if part:IsA("BasePart") and part:IsA("Terrain") == false and table.find(caught, part) == nil and table.find(attackfilter, part) == nil and (CSF:PosInRotatedRegion(part.Position, RegionCFrame, RegionSize) or CSF:PartInRotatedRegion(part, RegionCFrame, RegionSize)) then
						if table.find(EventsData.TARGETS, part) then return end
						table.insert(EventsData.TARGETS, part)
						PartAttack(part)
					end
				end)
			end
			DeadlyAlertAttempt(AlertID, RegionCFrame, RegionSize)
		end)

		-- Inst
		local tab = {}
		local function instfunc(part)
			tab.AOECheck:Disconnect()
			tab.AOECheck = workspace.DescendantAdded:Connect(instfunc)
			defer(pcall, function()
				if part:IsA("BasePart") and part:IsA("Terrain") == false and table.find(GetAttackFilter(), part) == nil and (table.find(CSF:Region(RegionCFrame, RegionSize, {part}, Enum.RaycastFilterType.Whitelist), part) or (CSF:PosInRotatedRegion(part.Position, RegionCFrame, RegionSize) or CSF:PartInRotatedRegion(part, RegionCFrame, RegionSize))) then
					PartAttack(part)
				end
			end)
		end
		tab.AOECheck = workspace.DescendantAdded:Connect(instfunc)
		InstEvents[workspace] = tab


		Kill1(RegionCFrame, RegionSize)

		-- use heartbeat checks incase script timeout
		local t = os.clock()
		local endcheck
		endcheck = heartbeat:Connect(function()
			if os.clock() - t >= AttackDuration then
				KKR_MF:Anima(LoopEvents, InstEvents)
				endcheck:Disconnect()

			end
		end)

		task.wait(4.25)
	end,
	}) end, true)


SPECIAL_Events.S3 = {
	LoopEvents = {},
	PriorityEvents = {},
	TARGETS = {}
}
SPECIAL_Events.S3.LoopEvents.PERSIST = KKR_MF:LoopConnections(function()
	local EventsData = SPECIAL_Events.S3
	for i, part in EventsData.TARGETS do
		pcall(function()
			KKR_IF_BasePart:VPFDerender(part, 1, EventsData.PriorityEvents)
			for i, hum in part.Parent:GetChildren() do
				pcall(function()
					if hum:IsA("Humanoid") then
						KKR_MF:Destroy(hum)
					end
				end)
			end
			part.CanCollide = false
			part.Anchored = false
		end)
	end
end)
ACTIONSETUP("S3", function() SPECIALATTACK({
	AttackName = "rideau",
	MethodName = "VPF",
	MethodName2 = "è§† å›¾ æ¡† æ�¶ æœª æ¸² æŸ“",
	SpecialRed = false,
	SpecialChargeDuration = 0.75,
	HasVocals = true,

	KillFunc = function()
		local BallID = tostring(os.clock()) -- Can spawn multiple balls at once, so we need to differentiate
		local Velocity = 20
		local InitialRegionPos = (currentcf * CFrame.new(0, 50, -20)).Position

		EFFECT("S3_Charge", BallID, InitialRegionPos)

		task.wait(1.5)
		---------------- LATER EFFECTS ----------------

		local MousePos = CFRAMES.MOUSE.Position
		local RegionLook = (MousePos-InitialRegionPos).Unit
		local RegionCFrame = CFrame.new(InitialRegionPos, InitialRegionPos + RegionLook)
		local RegionSize = Vector3.one * 80
		local AlertID = tostring(os.clock())


		EFFECT("S3_Release", BallID)
		-- Update
		local setcf = heartbeat:Connect(function(deltaTime)
			RegionCFrame = RegionCFrame * CFrame.new(0, 0, -Velocity * deltaTime)
			EFFECT("S3_Update", BallID, RegionCFrame)	
		end)

		---------------- ATTACK ----------------
		local AttackDuration = 7
		local LoopEvents = {}
		local InstEvents = {}

		local EventsData = SPECIAL_Events.S3

		local KillEffectAmt = 0
		local function PartAttack(part)
			if KillEffectAmt < SETTINGS.KillEffectLimit then
				KillEffectAmt = KillEffectAmt + 1
				pcall(function()
					EFFECT("KILL1", part.Size, part.CFrame)
				end)
				task.delay(1.5, function()
					KillEffectAmt = KillEffectAmt - 1
				end)
			end

			KKR_IF_BasePart:VPFDerender(part, 1, EventsData.PriorityEvents)
		end

		-- Loop
		LoopEvents.AOECheck = KKR_MF:LoopConnections(function()
			local caught = {}
			local attackfilter = GetAttackFilter()
			for i, part in CSF:Region(RegionCFrame, RegionSize, attackfilter) do
				pcall(function()
					if table.find(EventsData.TARGETS, part) then return end
					table.insert(EventsData.TARGETS, part)
					table.insert(caught, part)
					PartAttack(part)
				end)
			end
			for i, part in workspace:GetDescendants() do
				pcall(function()
					if part:IsA("BasePart") and part:IsA("Terrain") == false and table.find(caught, part) == nil and table.find(attackfilter, part) == nil and (CSF:PosInRotatedRegion(part.Position, RegionCFrame, RegionSize) or CSF:PartInRotatedRegion(part, RegionCFrame, RegionSize)) then
						if table.find(EventsData.TARGETS, part) then return end
						table.insert(EventsData.TARGETS, part)
						PartAttack(part)
					end
				end)
			end
			DeadlyAlertAttempt(AlertID, RegionCFrame, RegionSize)
		end)

		-- Inst
		local tab = {}
		local function instfunc(part)
			tab.AOECheck:Disconnect()
			tab.AOECheck = workspace.DescendantAdded:Connect(instfunc)
			defer(pcall, function()
				if part:IsA("BasePart") and part:IsA("Terrain") == false and table.find(GetAttackFilter(), part) == nil and (table.find(CSF:Region(RegionCFrame, RegionSize, {part}, Enum.RaycastFilterType.Whitelist), part) or (CSF:PosInRotatedRegion(part.Position, RegionCFrame, RegionSize) or CSF:PartInRotatedRegion(part, RegionCFrame, RegionSize))) then
					PartAttack(part)
				end
			end)
		end
		tab.AOECheck = workspace.DescendantAdded:Connect(instfunc)
		InstEvents[workspace] = tab


		Kill1(RegionCFrame, RegionSize)

		-- use heartbeat checks incase script timeout
		local t = os.clock()
		local endcheck
		endcheck = heartbeat:Connect(function()
			if os.clock() - t >= AttackDuration then
				KKR_MF:Anima(LoopEvents, InstEvents)
				endcheck:Disconnect()

			end
		end)

		-- End
		task.delay(6, function()
			setcf:Disconnect()
			EFFECT("S3_End", BallID)
		end)


	end,
	}) end, true)


SPECIAL_Events.S4 = {
	LoopEvents = {},
	PriorityEvents = {},
	TARGETS = {}
}
SPECIAL_Events.S4.LoopEvents.PERSIST = KKR_MF:LoopConnections(function()
	local EventsData = SPECIAL_Events.S4
	for i, part in EventsData.TARGETS do
		pcall(function()
			KKR_IF_BasePart:Void(part, 3, EventsData.PriorityEvents)
		end)
	end
end, 2)
ACTIONSETUP("S4", function() SPECIALATTACK({
	AttackName = "mÃ©moire",
	MethodName = "pVOID",
	MethodName2 = "ä¼˜ å…ˆ ç©º è™š",
	SpecialRed = false,
	SpecialChargeDuration = 1.5,
	HasVocals = true,

	KillFunc = function()
		local AttackDelay = 1.5
		local AttackDuration = 6.75
		local Range = 150
		local RegionCFrame = currentcf * CFrame.new(0, (-3 * CHARACTERSCALE) + Range/2 + 10, -Range/2 -10)
		local RegionSize = Vector3.new(1, 1.15, 1) * Range
		local AlertID = tostring(os.clock())

		EFFECT("S4", RegionCFrame)
		task.wait(AttackDelay)


		---------------- ATTACK ----------------
		local LoopEvents = {}
		local InstEvents = {}

		local EventsData = SPECIAL_Events.S4

		local function PartAttack(part)
			KKR_IF_BasePart:Void(part, 3, EventsData.PriorityEvents)
		end

		-- Loop
		LoopEvents.AOECheck = KKR_MF:LoopConnections(function()
			local caught = {}
			local attackfilter = GetAttackFilter()
			for i, part in CSF:Region(RegionCFrame, RegionSize, attackfilter) do
				pcall(function()
					if table.find(EventsData.TARGETS, part) then return end
					table.insert(EventsData.TARGETS, part)
					table.insert(caught, part)
					PartAttack(part)
				end)
			end
			for i, part in workspace:GetDescendants() do
				pcall(function()
					if part:IsA("BasePart") and part:IsA("Terrain") == false and table.find(caught, part) == nil and table.find(attackfilter, part) == nil and (CSF:PosInRotatedRegion(part.Position, RegionCFrame, RegionSize) or CSF:PartInRotatedRegion(part, RegionCFrame, RegionSize)) then
						if table.find(EventsData.TARGETS, part) then return end
						table.insert(EventsData.TARGETS, part)
						PartAttack(part)
					end
				end)
			end
			DeadlyAlertAttempt(AlertID, RegionCFrame, RegionSize)
		end, 2)

		-- Inst
		local tab = {}
		local function instfunc(part)
			tab.AOECheck:Disconnect()
			tab.AOECheck = workspace.DescendantAdded:Connect(instfunc)
			defer(pcall, function()
				if part:IsA("BasePart") and part:IsA("Terrain") == false and table.find(GetAttackFilter(), part) == nil and (table.find(CSF:Region(RegionCFrame, RegionSize, {part}, Enum.RaycastFilterType.Whitelist), part) or (CSF:PosInRotatedRegion(part.Position, RegionCFrame, RegionSize) or CSF:PartInRotatedRegion(part, RegionCFrame, RegionSize))) then
					PartAttack(part)
				end
			end)
		end
		tab.AOECheck = workspace.DescendantAdded:Connect(instfunc)
		InstEvents[workspace] = tab

		Kill1(RegionCFrame, RegionSize)

		-- use heartbeat checks incase script timeout
		local t = os.clock()
		local endcheck
		endcheck = heartbeat:Connect(function()
			if os.clock() - t >= AttackDuration then
				KKR_MF:Anima(LoopEvents, InstEvents)
				endcheck:Disconnect()
			end
		end)
		task.wait(4.5)

	end,
	}) end, true)





local S5_QUOTES = {
	{
		CHAT = "ã�Šå‰� ã�Œ æ‚ªã�„ ã�® ã� ã€‚",
		VOCAL = "10",
	},
	{
		CHAT = "ã��ã� ã‚‰ã‚“ã€‚",
		VOCAL = "11",
	},
	{
		CHAT = "ä¿º ã�« é–¢ã‚�ã‚‹ ã�ªã€‚",
		VOCAL = "13",
	},
	{
		CHAT = "ã�Šå‰� ã�Œ å…¥ã�£ã�¦ ç­‰ å’Œ ã�ªã€‚",
		VOCAL = "14",
	},
	{
		CHAT = "å¥¥ ã�—ã�Ÿã�‹ï¼Ÿ",
		VOCAL = "15",
	},
}

-- Running first is important. (first-connected Heartbeat + Supernull stack-10 priority)
-- PHASE 1
do
	local P1_Activated = false
	local P1LoopEvents, P1InstEvents = {}, {} -- for the main events

	local BANISHLoopEvents, BANISHInstEvents, BANISHPriorityEvents = {}, {}, {}
	local KIERUDATA = {}

	local LoopEvents, InstEvents, PriorityEvents = {}, {}, {} -- for the attack events
	local DEADLYCAUGHT = {}
	local RegionCFrame, RegionSize

	local function PartAttack(part)
		local parent = part.Parent
		if KKR_MF:IsInKieruTable(part, KIERUDATA) == false then
			table.insert(KIERUDATA, KKR_MF:GetKieruData(part))
		end
		KKR_MF:Execute(part, nil, nil, PriorityEvents)
		pcall(function()
			local player = players:GetPlayerFromCharacter(parent)
			if player ~= nil then
				KKR_IF_Player:Banish(player, 2, 4, 3, BANISHLoopEvents, BANISHInstEvents, BANISHPriorityEvents)
			end
		end)
		pcall(function()
			for i, inst in parent:GetChildren() do
				pcall(function()
					if inst:IsA("Humanoid") or inst:IsA("BaseScript") then
						KKR_MF:Execute(inst, LoopEvents, InstEvents, PriorityEvents)
					end
				end)
			end
		end)
	end




	---------------- TRADITIONAL ----------------
	-- Loop
	local TradLoop = function()
		if not P1_Activated then return end
		KKR_MF:HN(function()

			local caught = {}
			local attackfilter = GetAttackFilter()
			local RegionCaught = CSF:Region(RegionCFrame, RegionSize, attackfilter)
			for i, part in RegionCaught do
				pcall(function()
					table.insert(caught, part)
					if CSF:IsRobloxLocked(part) and table.find(DEADLYCAUGHT, part) == nil then
						table.insert(DEADLYCAUGHT, part)
						return
					end
					if CSF:HasLockedInst(part) then
						KKR_IF_MISC:ForceVoid(part)
						for i, ch in CSF:GetLockedInstances(part) do
							KKR_IF_MISC:LockVoid(ch) -- Don't tag as deadlycaught since it'll get destroyed anyway
						end
					end
					PartAttack(part)
				end)
			end

			-- Search through whole world for catchable deadly parts
			local RegionCaught2 = CSF:Region(RegionCFrame, Vector3.one * 1500, attackfilter)
			for i, part in RegionCaught2 do
				pcall(function()
					if CSF:IsRobloxLocked(part) and table.find(DEADLYCAUGHT, part) == nil then
						table.insert(DEADLYCAUGHT, part)
					end
				end)
			end

			local desc = workspace:GetDescendants()
			for i = #desc, 1, -1 do
				local inst = desc[i]
				pcall(function()
					if table.find(attackfilter, inst) ~= nil then return end
					local DEADLYTARGET = CSF:HasLockedInst(inst)
					if DEADLYTARGET == true then
						KKR_IF_MISC:ForceVoid(inst)
						for i, ch in CSF:GetLockedInstances(inst) do
							KKR_IF_MISC:LockVoid(ch) -- Don't tag as deadlycaught since it'll get destroyed anyway
						end
					end
					if inst:IsA("BasePart") then
						if inst:IsA("Terrain") == false and table.find(caught, inst) == nil and (KKR_MF:IsInKieruTable(inst, KIERUDATA) or CSF:PosInRotatedRegion(inst.Position, RegionCFrame, RegionSize) or CSF:PartInRotatedRegion(inst, RegionCFrame, RegionSize)) then
							PartAttack(inst)
						end
					elseif DEADLYTARGET == true then
						KKR_MF:Execute(inst, LoopEvents, InstEvents, PriorityEvents)
						KKR_MF:Destroy(inst, 2)
						KKR_IF_MISC:InternalEliminate(inst, 3)
					end
				end)
			end



			-- Finally void the caught deadly parts
			for i, part in DEADLYCAUGHT do
				KKR_IF_MISC:LockVoid(part)
			end
		end)
	end
	P1LoopEvents.AOECheck = KKR_MF:LoopConnections(TradLoop, 4)

	-- Inst
	local tab = {}
	local function instfunc(inst)
		if not P1_Activated then return end
		tab.AOECheck:Disconnect()
		tab.AOECheck = workspace.DescendantAdded:Connect(instfunc)
		KKR_MF:SN({2}, function()
			pcall(function()
				if table.find(GetAttackFilter(), inst) ~= nil then return end
				if CSF:IsRobloxLocked(inst) then
					if table.find(DEADLYCAUGHT, inst) == nil then
						table.insert(DEADLYCAUGHT, inst)
					end
					KKR_IF_MISC:LockVoid(inst)
					return
				end
				local function collective()
					if inst:IsA("BasePart") and inst:IsA("Terrain") == false then
						if (KKR_MF:IsInKieruTable(inst, KIERUDATA) or table.find(CSF:Region(RegionCFrame, RegionSize, {inst}, Enum.RaycastFilterType.Whitelist), inst) or (CSF:PosInRotatedRegion(inst.Position, RegionCFrame, RegionSize) or CSF:PartInRotatedRegion(inst, RegionCFrame, RegionSize))) then
							KKR_MF:HN(function()
								PartAttack(inst)
							end)
						end
						return true
					end
				end
				local DEADLYTARGET = CSF:HasLockedInst(inst)
				if DEADLYTARGET == true then
					KKR_MF:HN(function()
						KKR_IF_MISC:ForceVoid(inst)
						for i, ch in CSF:GetLockedInstances(inst) do
							KKR_IF_MISC:LockVoid(ch) -- Don't tag as deadlycaught since it'll get destroyed anyway
						end
						if collective() ~= true then
							KKR_MF:Execute(inst, LoopEvents, InstEvents, PriorityEvents)
							KKR_MF:Destroy(inst, 2)
							KKR_IF_MISC:InternalEliminate(inst, 3)
						end
					end)
				else
					collective()
				end
			end)
			KKR_MF:SN({1}, TradLoop, false)
		end)
	end
	tab.AOECheck = workspace.DescendantAdded:Connect(instfunc)
	P1InstEvents[workspace] = tab

	function S5_P1_Activate(RCF, RS) -- start phase 1
		RegionCFrame = RCF
		RegionSize = RS

		P1_Activated = true
		AliveCreate()
	end
	function S5_P1_GetKieruData()
		return KIERUDATA
	end
	function S5_P1_Finish() -- finish phase 1 (switch to kieru)
		P1_Activated = false
		KKR_MF:Anima(LoopEvents, InstEvents, PriorityEvents)
		LoopEvents, InstEvents, PriorityEvents = {}, {}, {}

		AliveClear()
	end
	function S5_P1_UnVanish() -- for clearing banish events on unvanish
		KIERUDATA = {}
		KKR_MF:Anima(BANISHLoopEvents, BANISHInstEvents, BANISHPriorityEvents)
		BANISHLoopEvents, BANISHInstEvents, BANISHPriorityEvents = {}, {}, {}
	end
	function S5_P1_StopAll() -- stopscript
		S5_P1_Finish()
		S5_P1_UnVanish()
		KKR_MF:Anima(P1LoopEvents, P1InstEvents)
	end
end

-- PHASE 2: DeadlyPersist
do
	local DP_Activated = false
	local DPLoopEvents, DPInstEvents = {}, {} -- for the main events
	local LoopEvents, InstEvents, PriorityEvents = {}, {}, {} -- for the attack events
	local DEADLYCAUGHT = {}
	local RegionCFrame, RegionSize
	-- Loop
	local DeadlyLoop = function()
		if not DP_Activated then return end
		KKR_MF:HN(function()
			local attackfilter = GetAttackFilter()

			-- Search through whole world for catchable deadly parts
			for i, part in CSF:Region(RegionCFrame, Vector3.one * 1500, attackfilter) do
				pcall(function()
					if CSF:IsRobloxLocked(part) and table.find(DEADLYCAUGHT, part) == nil then
						table.insert(DEADLYCAUGHT, part)
					end
				end)
			end

			local desc = workspace:GetDescendants()
			for i = #desc, 1, -1 do
				local inst = desc[i]
				pcall(function()
					if table.find(attackfilter, inst) ~= nil then return end
					local DEADLYTARGET = CSF:HasLockedInst(inst)
					if DEADLYTARGET == true then
						KKR_IF_MISC:ForceVoid(inst)
						for i, ch in CSF:GetLockedInstances(inst) do
							KKR_IF_MISC:LockVoid(ch) -- Don't tag as deadlycaught since it'll get destroyed anyway
						end
						KKR_MF:Execute(inst, LoopEvents, InstEvents, PriorityEvents)
						KKR_MF:Destroy(inst, 2)
						KKR_IF_MISC:InternalEliminate(inst, 3)
					end
				end)
			end

			-- Finally void the caught deadly parts
			for i, part in DEADLYCAUGHT do
				KKR_IF_MISC:LockVoid(part)
			end
		end)
	end
	DPLoopEvents.PersistCheck = KKR_MF:LoopConnections(DeadlyLoop, 4)

	-- Inst
	local tab = {}
	local function instfunc(inst)
		if not DP_Activated then return end
		tab.PersistCheck:Disconnect()
		tab.PersistCheck = workspace.DescendantAdded:Connect(instfunc)
		KKR_MF:SN({2}, function()
			pcall(function()
				if table.find(GetAttackFilter(), inst) ~= nil then return end
				if CSF:IsRobloxLocked(inst) then
					if table.find(DEADLYCAUGHT, inst) == nil then
						table.insert(DEADLYCAUGHT, inst)
					end
					KKR_IF_MISC:LockVoid(inst)
					return
				end
				if CSF:HasLockedInst(inst) then
					KKR_MF:HN(function()
						KKR_IF_MISC:ForceVoid(inst)
						for i, ch in CSF:GetLockedInstances(inst) do
							KKR_IF_MISC:LockVoid(ch) -- Don't tag as deadlycaught since it'll get destroyed anyway
						end
						KKR_MF:Execute(inst, LoopEvents, InstEvents, PriorityEvents)
						KKR_MF:Destroy(inst, 2)
						KKR_IF_MISC:InternalEliminate(inst, 3)
					end)
				end
			end)
			KKR_MF:SN({1}, DeadlyLoop)
		end)
	end
	tab.PersistCheck = workspace.DescendantAdded:Connect(instfunc)
	DPInstEvents[workspace] = tab

	function S5_DP_Activate(RCF, RS)
		RegionCFrame = RCF
		RegionSize = RS

		DP_Activated = true
	end
	function S5_DP_UnVanish()
		DP_Activated = false

		DEADLYCAUGHT = {}
		KKR_MF:Anima(LoopEvents, InstEvents, PriorityEvents)
		LoopEvents, InstEvents, PriorityEvents = {}, {}, {}
	end
	function S5_DP_StopAll()
		S5_DP_UnVanish()
		KKR_MF:Anima(DPLoopEvents, DPInstEvents)
	end
end


ACTIONSETUP("S5", function() SPECIALATTACK({
	AttackName = "AmnÃ©hilesie",
	MethodName = "K I E R U",
	MethodName2 = "ç • ã�‘ ã‚�",
	SpecialRed = true,
	SpecialChargeDuration = 2,
	HasVocals = false,

	KillFunc = function()
		local AttackDelay = 5.5 -- sync with chargeup
		local AttackDuration = 12+3+0.5
		local Range = 700
		local RegionCFrame = currentcf * CFrame.new(0, (-3 * CHARACTERSCALE) + 150, 0)
		local RegionPos = RegionCFrame.Position
		local RegionSize = Vector3.one * Range

		task.spawn(error, "ğŸ’¢ If you truly wish to be a ghost...")
		task.delay(AttackDelay - 1.5, function()
			task.spawn(error, "then move on to the afterlife. â™±")
		end)

		task.delay(AttackDelay/2, function()
			AliveCreate()
			local t = os.clock()
			local i = -1
			while os.clock() - t <= AttackDelay do
				task.wait(0.04)
				i = i + 1
				AliveUpdate(i % 2)
			end
		end)


		EFFECT("S5_Charge", RegionCFrame)
		task.wait(AttackDelay)
		EFFECT("S5_Release", RegionCFrame)
		task.delay(12, function()
			EFFECT("S5_End", RegionCFrame)
			task.wait(2)
			local QuotesData = CSF:PickRandomFromTable(S5_QUOTES)
			EFFECT("VOCAL", QuotesData.VOCAL)
			EFFECT("CHAT", QuotesData.CHAT)
		end)


		---------------- ATTACK ----------------

		-- Restart all persisting attacks and stuff
		KKR_MF:UnKieru()
		S5_P1_UnVanish()

		-- Effects first
		Kill3(RegionCFrame, RegionSize, RegionPos)
		Kill4(RegionPos)

		-- Later at Phase 2 switch
		---------------- VANISH EFFECT ----------------
		local function VANISHEFFECT(KIERUDATA)
			local attackfilter = GetAttackFilter()
			for i, part in workspace:GetDescendants() do
				pcall(function()
					if part:IsA("BasePart") and part:IsA("Terrain") == false and table.find(attackfilter, part) == nil and KKR_MF:IsInKieruTable(part, KIERUDATA) then
						EFFECT("VANISH", part.Position, part.Size)
					end
				end)
			end
		end



		-- PHASE 1
		S5_P1_Activate(RegionCFrame, RegionSize)

		-- Alive effect
		do
			AliveCreate()
			local function AliveCheck()
				local caught = {}
				local attackfilter = GetAttackFilter()
				local KIERUDATA = S5_P1_GetKieruData()
				local RegionCaught = CSF:Region(RegionCFrame, RegionSize, attackfilter)
				for i, part in RegionCaught do
					return 1
				end

				-- Search through whole world for catchable deadly parts
				local RegionCaught2 = CSF:Region(RegionCFrame, Vector3.one * 1500, attackfilter)
				for i, part in RegionCaught2 do
					if CSF:IsRobloxLocked(part) then
						return 1
					end
				end

				local desc = workspace:GetDescendants()
				for i = #desc, 1, -1 do
					local inst = desc[i]
					local found = false
					pcall(function()
						if table.find(attackfilter, inst) ~= nil then return end
						local DEADLYTARGET = CSF:HasLockedInst(inst)
						if DEADLYTARGET == true then
							found = true return
						elseif inst:IsA("BasePart") then
							if inst:IsA("Terrain") == false and table.find(caught, inst) == nil and (KKR_MF:IsInKieruTable(inst, KIERUDATA) or CSF:PosInRotatedRegion(inst.Position, RegionCFrame, RegionSize) or CSF:PartInRotatedRegion(inst, RegionCFrame, RegionSize)) then
								found = true return
							end
						end
					end)
					if found then return 1 end
				end

				return 0
			end

			local checkMode = 1
			local checkAmt = 0

			-- First
			local t = os.clock()
			coroutine.wrap(function()
				while os.clock() - t <= AttackDuration do
					if checkMode == 1 then
						pcall(function()
							AliveUpdate(AliveCheck())
						end)
						checkMode = 2
					end
					task.wait()
				end
			end)()

			-- Last
			local checkEvent
			checkEvent = runs.Heartbeat:Connect(function()
				if os.clock() - t >= AttackDuration then
					checkEvent:Disconnect() return
				end
				if checkMode == 2 then
					KKR_MF:SN({10}, pcall, function()
						AliveUpdate(AliveCheck())
					end)
					checkMode = 1
				end
			end)

			task.delay(AttackDuration, AliveClear)
		end

		-- use heartbeat checks incase script timeout
		local t = os.clock()
		local endcheck
		endcheck = heartbeat:Connect(function()
			if os.clock() - t >= AttackDuration then
				S5_P1_Finish()
				local KIERUDATA = S5_P1_GetKieruData()
				endcheck:Disconnect()
				task.delay(0.05, function()
					pcall(VANISHEFFECT, KIERUDATA)
					for i, Data in KIERUDATA do
						KKR_MF:AddKieruData(Data)
					end

					-- PHASE 2 (Kieru + DeadlyPersist)
					S5_DP_Activate(RegionCFrame, RegionSize)
				end)
			end
		end)
		task.wait(AttackDuration + 0.75)

	end,
	}) end, true, false)

-- UnVanish everything (clear all events)
local UNVANISH_Debounces = {"S1", "S2", "S3", "S4", "S5"}
function UNVANISH()
	KKR_MF:Anima(nil, nil, SPECIAL_Events.S1.PriorityEvents)
	SPECIAL_Events.S1.PriorityEvents = {}
	SPECIAL_Events.S1.TARGETS = {}

	KKR_MF:Anima(nil, nil, SPECIAL_Events.S2.PriorityEvents)
	SPECIAL_Events.S2.PriorityEvents = {}
	SPECIAL_Events.S2.TARGETS = {}

	KKR_MF:Anima(nil, nil, SPECIAL_Events.S3.PriorityEvents)
	SPECIAL_Events.S3.PriorityEvents = {}
	SPECIAL_Events.S3.TARGETS = {}

	KKR_MF:Anima(nil, nil, SPECIAL_Events.S4.PriorityEvents)
	SPECIAL_Events.S4.PriorityEvents = {}
	SPECIAL_Events.S4.TARGETS = {}

	KKR_MF:UnKieru()
	S5_P1_UnVanish()
	S5_DP_UnVanish()
end
ACTIONSETUP("UNVANISH", function()
	for i, ActionName in ACTIONGETACTIVE() do
		if table.find(UNVANISH_Debounces, ActionName) then
			return
		end
	end
	UNVANISH()
	EFFECT("UNVANISH")
end)














print("> [WLW] Actions loaded. \n] -")



--[[ ----------------------------------

			-- PASSIVES --

---------------------------------- ]]--

print("- [\n> [WLW] Loading passives...")

---------------- DARK TRAILS ----------------
local DarkTrailTime = os.clock()
local DARKTRAILLOOP = heartbeat:Connect(function()
	if os.clock() - DarkTrailTime < SETTINGS.DarkTrailDelay then return end
	if moving == false then return end
	DarkTrailTime = os.clock()
	local parts = {}
	local models = {
		ADMchar:GetCloneInst(origchar), ADMmhead:GetCloneInst(origmhead), ADMmbody:GetCloneInst(origmbody),
	}
	if BroomActivated == true then
		table.insert(models, ADMbroom:GetCloneInst(origbroom))
	end
	for i, model in models do
		for i, part in model:GetDescendants() do
			if part:IsA("BasePart") and part ~= ADMchar:GetCloneInst(orighrp) then
				table.insert(parts, part)
			end
		end
	end
	EFFECT("DARKTRAIL", parts)
end)

------------------------------------------------------------------------------------------------------------------------------------------

---------------- Balls lmao ----------------
CFRAMES.BALLS = {}

local origballs1 = MODELS.BALLS1:Clone()
local ADMballs1 = YUREI:Initialize(origballs1, origballs1.PrimaryPart, workspace)
local origballs2 = MODELS.BALLS2:Clone()
local ADMballs2 = YUREI:Initialize(origballs2, origballs2.PrimaryPart, workspace)
local origrainbowball = origballs2.RAINBOW

-- List (in order)
local BALLS_1 = {
	origballs1.White,
	origballs1.Black1,
	origballs1.Black2,
	origballs1.Blue,
	origballs1.Red
}
local BALLS_2 = {
	origballs2.Yellow,
	origballs2.Green,
	origballs2.Orange,
	origballs2.Magenta,
	origballs2.RAINBOW
}

-- funfact: The rainbow ball's colors are actually accurate from the original
local BALLS_RainbowColors = {
	Color3.fromRGB(255, 150, 0),
	Color3.fromRGB(255, 255, 0),
	Color3.fromRGB(150, 255, 150),
	Color3.fromRGB(0, 255, 255),
	Color3.fromRGB(150, 150, 255),
	Color3.fromRGB(150, 75, 255),
	Color3.fromRGB(255, 0, 255),
}
local BALLS_RainbowColorsT = {
	Color3.fromRGB(6969, 600, 0),
	Color3.fromRGB(6969, 6969, 0),
	Color3.fromRGB(600, 6969, 600),
	Color3.fromRGB(0, 6969, 6969),
	Color3.fromRGB(600, 600, 6969),
	Color3.fromRGB(600, 300, 6969),
	Color3.fromRGB(6969, 0, 6969),
}
local BALLS_RainbowColIndex = 1


-- main balls loop
local BALLS_SineVal = 0
local BALLS_RainbowTime = os.clock()
local BALLS_LOOP = runs.Heartbeat:Connect(function()
	BALLS_SineVal = BALLS_SineVal + 1
	if BALLS_SineVal >= 360 * 3 then BALLS_SineVal = 0 + (BALLS_SineVal-(360 * 3)) end


	-- CFRAMES
	local CFBALLS = CFRAMES.BALLS
	local torsooffset = JCFrtj.CharacterOffset * JCFrtj.CurrentOffset
	ADMballs1:SetRecordedMCF(CFrame.new((currentcf * torsooffset).Position))
	ADMballs2:SetRecordedMCF(CFrame.new((currentcf * torsooffset).Position))

	-- first group
	for i, origball in BALLS_1 do
		local anglespacing = (mrad(BALLS_SineVal * 3) - mrad(33.75 * (i-1)))
		local angle = CFrame.Angles(anglespacing/9, anglespacing, 0)
		local posoffset = angle * CFrame.new(0, 0, -SETTINGS.BallsRadius)

		local finaloffset = posoffset * CFrame.Angles(0, mrad(BALLS_SineVal) * 4, 0)
		ADMballs1:SetRecordedProperty(origball, "CFrameOffset", finaloffset)
		CFBALLS[origball.Name] = ADMballs1:GetRecordedProperty(origball, "CFrameFINAL")
	end

	-- second group
	for i, origball in BALLS_2 do
		local anglespacing = -(mrad(BALLS_SineVal * 3) - mrad(33.75 * (i-1)))
		local angle = CFrame.Angles(anglespacing/9 + mrad(180), anglespacing, 0)
		local posoffset = (angle * CFrame.new(0, 0, -SETTINGS.BallsRadius))

		local finaloffset = posoffset * CFrame.Angles(0, -mrad(BALLS_SineVal) * 4, 0)
		ADMballs2:SetRecordedProperty(origball, "CFrameOffset", finaloffset)
		CFBALLS[origball.Name] = ADMballs2:GetRecordedProperty(origball, "CFrameFINAL")
	end




	-- RAINBOW
	if os.clock() - BALLS_RainbowTime >= 0.075 then
		BALLS_RainbowTime = os.clock()
		BALLS_RainbowColIndex = BALLS_RainbowColIndex + 1
		if BALLS_RainbowColIndex > #BALLS_RainbowColorsT then BALLS_RainbowColIndex = 1 end

		local color = BALLS_RainbowColors[BALLS_RainbowColIndex]
		local colorT = BALLS_RainbowColorsT[BALLS_RainbowColIndex]

		ADMballs2:SetRecordedProperty(origrainbowball, "Color", color)
		for i, texture in origrainbowball:GetDescendants() do
			if texture:IsA("Texture") then
				ADMballs2:SetRecordedProperty(texture, "Color3", colorT)
			end
		end
	end
end)


-- balls attack
function BALLATTACK(ADMball, origball, targethum, targetpos)
	targethum:TakeDamage(SETTINGS.BallsAttackDamage)

	local color = ADMball:GetRecordedProperty(origball, "Color")
	EFFECT("BALL_Attack", origball.Name, targetpos, color)
end
local BALLS_ATTACKLOOP = heartbeat:Connect(function()
	local range = SETTINGS.BallsAttackRange
	local targetdist = math.huge
	local targetpos
	local targethum

	for i, part in CSF:Region(currentcf, Vector3.one * range, GetAttackFilter()) do
		pcall(function()
			if part:IsA("BasePart") and part:IsA("Terrain") == false then
				local hum = part.Parent:FindFirstChildWhichIsA("Humanoid")
				if hum == nil or hum.Health <= 0 then return end

				local pos = part.Position
				local dist = (part.Position-currentcf.Position).Magnitude
				if dist < targetdist then
					targetdist = dist
					targetpos = pos
					targethum = hum
				end
			end
		end)
	end
	if targethum == nil then return end

	-- first group
	for i, origball in BALLS_1 do
		pcall(function()
			local cball = ADMballs1:GetCloneInst(origball)
			local pos = cball.Position
			if cball.Parent ~= ADMballs1:GetCloneInst(origballs1) or (targetpos-pos).Magnitude > SETTINGS.BallsAttackRange + SETTINGS.BallsRadius then return end -- don't fire if destroyed/voided
			if rnd:NextNumber(0, 100) <= 100 * SETTINGS.BallsAttackChance and rnd:NextInteger(1, 60) == 1 then -- randomization happens 60 frames per second so we must lower chance
				BALLATTACK(ADMballs1, origball, targethum, targetpos)
			end
		end)
	end

	-- second group
	for i, origball in BALLS_2 do
		pcall(function()
			local cball = ADMballs2:GetCloneInst(origball)
			local pos = cball.Position
			if cball.Parent ~= ADMballs2:GetCloneInst(origballs2) or (targetpos-pos).Magnitude > SETTINGS.BallsAttackRange + SETTINGS.BallsRadius then return end -- don't fire if destroyed/voided
			if rnd:NextNumber(0, 100) <= 100 * SETTINGS.BallsAttackChance and rnd:NextInteger(1, 60) == 1 then -- randomization happens 60 frames per second so we must lower chance
				BALLATTACK(ADMballs2, origball, targethum, targetpos)
			end
		end)
	end
end)








------------------------------------------------------------------------------------------------------------------------------------------

---------------- FAKE HEALTH ----------------
-- here comes the spaghetti
local CurrentHealth = 0
local MaxHealth = 100
local HealthCheapEnabled = true -- mugen cheapie hp going up and down effect lol
local HealthCheapBorder = MaxHealth - SETTINGS.HealthCheapOffset

local HealthModel = MODELS["Wicked Law's Witch?"]:Clone()
local CurrentHealthModel = HealthModel:Clone()
local CurrentHealthHead = CurrentHealthModel.Head
local CurrentHealthHum = CurrentHealthModel.Humanoid
local CurrentHealthName = "Gen24 [LV."..SETTINGS.YUREI_LEVEL.."]"
CurrentHealthHum.DisplayName = CurrentHealthName
CurrentHealthHum.Health = CurrentHealth
CurrentHealthHum.MaxHealth = MaxHealth

CurrentHealthHum:GetPropertyChangedSignal("Health"):Connect(function()
	CurrentHealth = CurrentHealthHum.Health
end)
CurrentHealthHum:GetPropertyChangedSignal("MaxHealth"):Connect(function()
	CurrentHealthHum.MaxHealth = MaxHealth
end)

local HEALTHLOOP = heartbeat:Connect(function()
	if HealthCheapEnabled == true then
		if CurrentHealth == HealthCheapBorder then
			CurrentHealth = HealthCheapBorder - rnd:NextNumber(10, 20)
		else
			CurrentHealth = math.min(HealthCheapBorder, CurrentHealthHum.Health + rnd:NextNumber(1, 5))
		end
	else
		CurrentHealth = math.min(MaxHealth, CurrentHealthHum.Health + rnd:NextNumber(0.5, 2))
	end
	local cf = currentcf + Vector3.new(0, 1.5 * CHARACTERSCALE, 0)






	HealthModel.Head.CFrame = cf
	if CSF:IsRobloxLocked(CurrentHealthModel) or CSF:IsRobloxLocked(CurrentHealthHead) or CSF:IsRobloxLocked(CurrentHealthHum)
		or CurrentHealthModel:IsDescendantOf(workspace) == false or CurrentHealthHead.Parent ~= CurrentHealthModel or CurrentHealthHum.Parent ~= CurrentHealthModel then

		pcall(function()
			CurrentHealthModel:Destroy()
		end)
		pcall(function()
			CurrentHealthHead:Destroy()
		end)
		pcall(function()
			CurrentHealthHum:Destroy()
		end)

		CurrentHealthModel = HealthModel:Clone()
		CurrentHealthHead = CurrentHealthModel.Head
		CurrentHealthHum = CurrentHealthModel.Humanoid
		CurrentHealthHum.DisplayName = CurrentHealthName
		CurrentHealthHum.Health = CurrentHealth
		CurrentHealthHum.MaxHealth = MaxHealth

		CurrentHealthHum:GetPropertyChangedSignal("Health"):Connect(function()
			CurrentHealth = CurrentHealthHum.Health
		end)
		CurrentHealthHum:GetPropertyChangedSignal("MaxHealth"):Connect(function()
			CurrentHealthHum.MaxHealth = MaxHealth
		end)
		CurrentHealthModel.Parent = workspace
	end
	CurrentHealthHead.CFrame = cf
	CurrentHealthHum.DisplayName = CurrentHealthName
	CurrentHealthHum.Health = CurrentHealth
end)




print("> [WLW] Passives loaded. \n] -")


--[[ ----------------------------------

			-- POST-SETUP --

---------------------------------- ]]--



print("- [\n> [WLW] Initializing Post-Setup...")

---------------- FILTERS ----------------
-- For ignoring own character/etc. in Region/Raycast detection
function GetCharFilter()
	local charfilter = {CurrentHealthHead}
	for origmodel, ADMData in YUREI.ADModels do
		for i, originst in ADMData.OrigModel:GetDescendants() do
			if originst:IsA("BasePart") then
				table.insert(charfilter, ADMData:GetCloneInst(originst))
			end
		end
	end
	return charfilter
end
function GetAttackFilter()
	local attackfilter = {CurrentHealthHead, currentfloor}
	for origmodel, ADMData in YUREI.ADModels do
		for i, originst in ADMData.OrigModel:GetDescendants() do
			if originst:IsA("BasePart") then
				table.insert(attackfilter, ADMData:GetCloneInst(originst))
			end
		end
	end
	return attackfilter
end

--------------------------------------------------------------------------------
---------------- REPLICATION ----------------
-- Update char and replicate all cframes
local ReplicationLoop = heartbeat:Connect(function()
	OwnerLSValues.STARTCF.Value = CFRAMES.CHARACTER.Character
	Remote:FireAllClients("UPDATECFRAMES", CFRAMES)
	Remote:FireAllClients("UPDATECHARACTER", ADMchar:GetCloneInst(origchar), CHARACTERSCALE)
end)


--------------------------------------------------------------------------------
---------------- CHARACTER-RELATED ----------------
RemoteRequests.MOVEMENTFORCESTOP = function()
	movementforcestop = not movementforcestop
	UpdateVelocity({
		Y = 0
	})
	UpdateForce(Vector3.new())
end
RemoteRequests.REFIT = function()
	for origmodel, ADMData in YUREI.ADModels do
		ADMData:Refit()
	end
	UpdateFloor()


	pcall(function()
		CurrentHealthModel:Destroy()
	end)
	pcall(function()
		CurrentHealthHead:Destroy()
	end)
	pcall(function()
		CurrentHealthHum:Destroy()
	end)

	CurrentHealthModel = HealthModel:Clone()
	CurrentHealthHead = CurrentHealthModel.Head
	CurrentHealthHum = CurrentHealthModel.Humanoid
	CurrentHealthHum.Health = CurrentHealth
	CurrentHealthHum.MaxHealth = MaxHealth

	CurrentHealthHum:GetPropertyChangedSignal("Health"):Connect(function()
		CurrentHealth = CurrentHealthHum.Health
	end)
	CurrentHealthHum:GetPropertyChangedSignal("MaxHealth"):Connect(function()
		CurrentHealthHum.MaxHealth = MaxHealth
	end)
	CurrentHealthModel.Parent = workspace
end

RemoteRequests.ORIGIN = function()
	currentcf = CFrame.new(0, 5 + (1.5 * CHARACTERSCALE), 0)
	UpdateVelocity({
		Y = 0
	})
	UpdateForce(Vector3.new())
end


--------------------------------------------------------------------------------
---------------- ANTIDEATH ----------------
-- Level upgrade
RemoteRequests.YUREI_LEVEL = function(level)
	if tonumber(level) == nil then return end
	SETTINGS.YUREI_LEVEL = tonumber(level)
	if SETTINGS.YUREI_LEVEL > 4 then
		SETTINGS.YUREI_LEVEL = 1
	end
	for origmodel, ADMData in ADMCharacters do
		ADMData:UpdateSetting("LEVEL", SETTINGS.YUREI_LEVEL)
	end
	if BroomActivated then
		ADMbroom:UpdateSetting("LEVEL", SETTINGS.YUREI_LEVEL)
	end
	if HakeroActivated then
		ADMhakero:UpdateSetting("LEVEL", SETTINGS.YUREI_LEVEL)
	end

	CurrentHealthName = "Gen24 [LV."..SETTINGS.YUREI_LEVEL.."]"
	EFFECT("YUREI_Level", SETTINGS.YUREI_LEVEL)
end

RemoteRequests.YUREI_WM = function()
	SETTINGS.YUREI_WorldModelEnabled = not SETTINGS.YUREI_WorldModelEnabled
	for origmodel, ADMData in ADMCharacters do
		ADMData:UpdateSetting("WorldModelEnabled", SETTINGS.YUREI_WorldModelEnabled)
	end

	EFFECT("YUREI_WorldModelEnabled", SETTINGS.YUREI_WorldModelEnabled)
end

RemoteRequests.YUREI_FS = function()
	SETTINGS.YUREI_FailsafeEnabled = not SETTINGS.YUREI_FailsafeEnabled
	for origmodel, ADMData in ADMCharacters do
		ADMData:UpdateSetting("FailsafeEnabled", SETTINGS.YUREI_FailsafeEnabled)
	end

	EFFECT("YUREI_FailsafeEnabled", SETTINGS.YUREI_FailsafeEnabled)
end


--------------------------------------------------------------------------------
---------------- MUSIC ----------------
local MUSIC_Enabled = true
RemoteRequests.TOGGLEMUSIC = function()
	MUSIC_Enabled = not MUSIC_Enabled
	Remote:FireAllClients("TOGGLEMUSIC", MUSIC_Enabled)
end

---------------- IDLESWITCH ----------------
RemoteRequests.IDLESWITCH = function()
	if DefaultAnimsEnabled == true then
		if idlemode == 1 then idlemode = 2 else idlemode = 1 end
		if CurrentAnimation.Name ~= CurrentCharacterState then
			SetDefaultAnim("IdleGround"..idlemode, "IdleGround"..idlemode) -- re-update character animations
		end
	end
end

---------------- TAUNT ----------------
RemoteRequests.TAUNT = function()
	EFFECT("VOCAL", "12")
	EFFECT("CHAT", "ä¿º ã�® çš„ å’Œ ã�Šå‰� ã�§ ã‚�ã�ªã�„ã€‚")
end




------------------------------------------------------------------------------------------------------------------------------------------
---------------- COUNTER ----------------
local COUNTER_List = {}
local COUNTER_ListEnabled = false -- will record all attacks while counter charge is active
local COUNTER_AttackedThisFrame = false
local COUNTER_Time = os.clock() - 69

function COUNTER(ADMData, originst, cinst, ATTACK, VALUE, z)
	COUNTER_AttackedThisFrame = true
	local FULLNAME = (ATTACK or "uwu"):lower()
	pcall(function()
		if ATTACK:find("CFrame") ~= nil then
			if (ADMData:GetRecordedProperty(originst, "CFrameFINAL").Position-VALUE.Position).Magnitude > 3000 then
				FULLNAME = FULLNAME.." (VOID)"
			end
		elseif ATTACK == "ANCESTRY" or ATTACK == "DESCENDANT" then
			local inst
			if VALUE == nil then
				inst = "nil"
			else
				inst = VALUE.ClassName:upper()
			end
			FULLNAME = FULLNAME.." ("..inst..")"
		end
	end)


	if COUNTER_ListEnabled == true then -- if true will record attacks
		if table.find(COUNTER_List, FULLNAME) == nil then -- no duplicates
			table.insert(COUNTER_List, FULLNAME)
		end
	end
	if os.clock() - COUNTER_Time < SETTINGS.CounterDelay then return end
	COUNTER_Time = os.clock()
	COUNTERDEBOUNCE = true
	COUNTER_List = {}
	COUNTER_ListEnabled = true

	movementenabled = false
	flymode = false
	DefaultAnimsEnabled = false

	if SETTINGS.YUREI_WorldModelEnabled == true then
		table.insert(COUNTER_List, "anti_rrt_bypass")
	end
	table.insert(COUNTER_List, FULLNAME)

	-- Tween to 0
	HealthCheapEnabled = false
	pcall(function()
		local newhealth = CurrentHealth
		local lockhealthevent = CurrentHealthHum:GetPropertyChangedSignal("Health"):Connect(function()
			CurrentHealthHum.Health = newhealth
		end)
		task.delay(0.6, function()
			lockhealthevent:Disconnect()
		end)
		CSE:TweenCustom(newhealth, 4, TweenInfo.new(0.65, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), function(val)
			newhealth = val
			CurrentHealthHum.Health = newhealth
		end)
	end)
	EFFECT("BROOM_Sparkles", false)

	AnimationPlay("Counter")
	EFFECT("COUNTER_Charge")

	task.wait()
	-- Part 2 - end counterlist recording (show wlw portrait gui first)
	task.delay(0.2, function()
		EFFECT("COUNTER_Release", COUNTER_List)
		COUNTER_ListEnabled = false

		-- Deadly Alert if the funny instance is involved (speker) just like special attacks
		for i, FULLNAME in COUNTER_List do
			if FULLNAME:lower():find("robloxlocked") then
				EFFECT("DEADLYALERT")
				break
			end
		end
	end)

	-- Ending (Sync with release effect and portrait gui)
	task.delay(0.6, function()
		coroutine.wrap(function()
			if heartbeat:Wait() <= 1.25 then -- if not lagging
				UpdateForce(currentlook * -12, 0.45)
			end
		end)()

		HealthCheapEnabled = true
		pcall(function()
			CurrentHealthHum.Health = 5
		end)

		-- Counter Voice
		task.delay(rnd:NextNumber(0, 0.65), function()
			local soundname
			if rnd:NextInteger(1, 2) == 1 then
				soundname = "MAYCOUNTER"
			else
				soundname = "ELPHELTCOUNTER"
			end
			EFFECT("VOCAL", soundname)
		end)
	end)


	task.delay(0.95, function()
		COUNTERDEBOUNCE = false

		movementenabled = true
		DefaultAnimsEnabled = true
		if CurrentAnimation.Name ~= CurrentCharacterState then
			SetDefaultAnim(CurrentCharacterState, CurrentCharacterState) -- re-update character animations
		end

		ACTIONRESET()
	end)
	task.spawn(error, "Counter.")
end
ADMchar:SetAttackedFunc(COUNTER)
ADMmhead:SetAttackedFunc(COUNTER)
ADMmbody:SetAttackedFunc(COUNTER)
local CounterResetOnAction = ActionChanged.Event:Connect(function(last, current)
	if current == nil or current == "RUNMODE" or current == "JUMP" or current == "FLYMODE" or current == "STASIS" then return end
	COUNTER_Time = os.clock() - 69
end)

local OutputQuoteCheck = heartbeat:Connect(function()
	if COUNTER_AttackedThisFrame == false then return end
	COUNTER_AttackedThisFrame = false

	local OQ = CSF:PickRandomFromTable(SETTINGS.OutputQuotes)
	if rnd:NextInteger(1, 2) == 1 then
		warn(OQ)
	else
		task.delay(0, warn, OQ)
	end
end)	


--------------------------------------------------------------------------------
---------------- SCRIPT FIX ----------------
-- Incase script times out for whatever reason in the middle of an action/other problems
function FIX()
	movementenabled = true
	movementforcestop = false
	COUNTERDEBOUNCE = false
	ABSORBER_Debounce = false
	currentheadangle = CFrame.new()

	ACTIONRESET()
	for Name, ActionData in ACTIONS do
		ActionData.RunningInstances = {}
	end

	DeadlyAlertActivated = false
	DeadlyAlertInstances = {}
	STASIS_Mode = 0
	STASIS_DisableQueue = true
	EFFECT("STASIS_END")

	HealthCheapEnabled = true
	BALLS_SineVal = 0

	DefaultAnimsEnabled = true
	SetDefaultAnim("IdleGround"..idlemode, "IdleGround"..idlemode)
	AnimationPlay("IdleGround"..idlemode)

	pcall(function()
		Remote:Destroy()
	end)
	for i, part in RemoteBlackmail do
		pcall(function()
			part:Destroy()
		end)
	end
	RemoteBlackmail = {}
	Remote = Instance.new("RemoteEvent")
	Remote.Name = RemoteName
	Remote.Parent = reps
	Remote.OnServerEvent:Connect(OnServerEvent)

	for origmodel, ADMData in YUREI.ADModels do
		ADMData:Refit()
	end
	UpdateFloor()

	UNVANISH()

	COUNTER_Time = os.clock() - 69
	COUNTER()
end
RemoteRequests.FIX = FIX


print("> [WLW] Post-Setup initialized. \n] -")

--[[ ----------------------------------

			-- COMMANDS --

---------------------------------- ]]--
print("- [\n> [WLW] Loading commands...")


local CommandPrefix = "`wlw`"
local CommandSep = "`"
local Commands = {}
local function CommandFunc(msg)
	if msg:sub(1, 3) == "/e " then msg = msg:sub(4) else EFFECT("CHAT", msg) end
	if msg:sub(1, #CommandPrefix) == CommandPrefix then
		local args = msg:sub(#CommandPrefix + 1, #msg):split(CommandSep)
		local CommandType = table.remove(args, 1)
		if Commands[CommandType] then
			Commands[CommandType](unpack(args))
		end
	end
end
local Chatted_COMMAND = plr.Chatted:Connect(CommandFunc)



---------------- COMMANDS ----------------

Commands.UnV = function() ACTIONPERFORM("UNVANISH") end
Commands.fix = FIX


print("> [WLW] Commands loaded. \n] -")

--[[ ----------------------------------

		-- LOCALSCRIPTS --

---------------------------------- ]]--


print("- [\n> [WLW] Initializing localscripts...")

OwnerLSValues.RemoteName.Value = RemoteName
RepLSValues.RemoteName.Value = RemoteName
OwnerLSValues.STARTCF.Value = currentcf
OwnerLSValues.CHARACTERSCALE.Value = CHARACTERSCALE
RepLSValues.CHARACTERSCALE.Value = CHARACTERSCALE

-- LOCALSCRIPT SETUP

-- Insert a folder into the playergui with a localscript inside it, and destroy the folder afterwards
-- This is to indirectly destroy the localscript without stopping its code from running (remains in nil)
-- The localscript itself also destroys itself in its code
local function LocalScriptSetup(localscript, playergui)
	local folder = Instance.new("Folder")
	local newls = localscript:Clone()
	newls.Name = CSF:RandomString()
	newls.Parent = folder
	folder.Parent = playergui
	newls.Disabled = false
end
-- Will be fired from the localscript to destroy itself on the server after it sets everything up locally
RemoteRequests.LOCALSCRIPTSETUP = function(folderparent)
	folderparent.Parent = nil
end


-- LocalScript Insertion
pcall(LocalScriptSetup, OwnerLS, plr:WaitForChild("PlayerGui"))
for i, player in players:GetPlayers() do
	pcall(LocalScriptSetup, RepLS, player:WaitForChild("PlayerGui"))
end


print("> [WLW] Localscripts loaded. \n] -")

--[[ ----------------------------------

			-- FINAL --

---------------------------------- ]]--

print("- [\n> [WLW] Final Script Setup...")

-- PlayerAdded Detection
local PlayerAdded = players.PlayerAdded:Connect(function(player)
	local playergui = player:WaitForChild("PlayerGui")

	task.wait(3)
	pcall(LocalScriptSetup, RepLS, playergui)


	if player.UserId == userid then
		plr = player

		NoCharacterAdded:Disconnect()
		NoCharacterAdded2:Disconnect()
		NoCharacterAdded = plr.CharacterAdded:Connect(function(c)
			c:Destroy()
		end)
		NoCharacterAdded2 = heartbeat:Connect(function()
			if plr.Character then
				plr.Character:Destroy()
				plr.Character = nil
			end
		end)
		Chatted_COMMAND = plr.Chatted:Connect(CommandFunc)
		pcall(LocalScriptSetup, OwnerLS, playergui)
	end
end)

local function StopScript()
	Remote:FireAllClients("STOPSCRIPT")
	RemoteCheck:Disconnect()
	for i, part in RemoteBlackmail do
		pcall(function()
			part:Destroy()
		end)
	end
	pcall(function()
		deb:AddItem(Remote, 30)
	end)

	Chatted_COMMAND:Disconnect()
	PlayerAdded:Disconnect()




	NoCharacterAdded:Disconnect()
	NoCharacterAdded2:Disconnect()
	CharacterState:Destroy()
	CharacterMovement:Disconnect()
	DefaultAnims:Disconnect()
	SetCharCFramesLoop:Disconnect()
	ActionChanged:Destroy()
	CounterResetOnAction:Disconnect()
	OutputQuoteCheck:Disconnect()


	DARKTRAILLOOP:Disconnect()
	BALLS_LOOP:Disconnect()
	BALLS_ATTACKLOOP:Disconnect()
	HEALTHLOOP:Disconnect()
	pcall(function()
		CurrentHealthModel:Destroy()
	end)

	ReplicationLoop:Disconnect()

	KKR_MF:Anima(SPECIAL_Events.S1.LoopEvents, nil, SPECIAL_Events.S1.PriorityEvents)
	KKR_MF:Anima(SPECIAL_Events.S2.LoopEvents, nil, SPECIAL_Events.S2.PriorityEvents)
	KKR_MF:Anima(SPECIAL_Events.S3.LoopEvents, nil, SPECIAL_Events.S3.PriorityEvents)
	KKR_MF:Anima(SPECIAL_Events.S4.LoopEvents, nil, SPECIAL_Events.S4.PriorityEvents)
	UNVANISH()
	S5_P1_StopAll()
	S5_DP_StopAll()
	KKR_MF:StopAll()
	YUREI:StopAll()

	task.wait(1)
	plr:LoadCharacter()
end
Commands.stopscript = StopScript
RemoteRequests.STOPSCRIPT = StopScript




--------------------------------------------------------------------
--------------------------------------------------------------------

SETCHARCFRAMES()
UpdateFloor()
SetDefaultAnim(CurrentCharacterState, CurrentCharacterState)
BroomSwitch(true)
HakeroSwitch(false)
for origmodel, ADMData in ADMCharacters do
	ADMData:UpdateSetting("LEVEL", SETTINGS.YUREI_LEVEL)
	ADMData:UpdateSetting("WorldModelEnabled", SETTINGS.YUREI_WorldModelEnabled)
	ADMData:UpdateSetting("FailsafeEnabled", SETTINGS.YUREI_FailsafeEnabled)
end
ADMbroom:UpdateSetting("LEVEL", 0)
ADMbroom:UpdateSetting("WorldModelEnabled", true)
ADMbroom:UpdateSetting("FailsafeEnabled", false)
pcall(function()
	ADMbroom:GetCloneInst(origbroom):Destroy()
end)
ADMhakero:UpdateSetting("LEVEL", 0)
ADMhakero:UpdateSetting("WorldModelEnabled", true)
ADMhakero:UpdateSetting("FailsafeEnabled", false)
pcall(function()
	ADMhakero:GetCloneInst(orighakero):Destroy()
end)

ADMballs1:UpdateSetting("LEVEL", 0)
ADMballs1:UpdateSetting("WorldModelEnabled", false)
ADMballs1:UpdateSetting("FailsafeEnabled", false)
ADMballs2:UpdateSetting("LEVEL", 0)
ADMballs2:UpdateSetting("WorldModelEnabled", false)
ADMballs2:UpdateSetting("FailsafeEnabled", false)

KKR_MF:SetKieruFilter(GetAttackFilter)

Remote:FireAllClients("UPDATECFRAMES", CFRAMES)
Remote:FireAllClients("UPDATECHARACTER", ADMchar:GetCloneInst(origchar))





print("> [WLW] Wicked Law's Witch is ready. \n]")
print("\n\n\n\n[[ It is the Howl; the Moon within Moons. ]]")
print("> [WLW] <<ACCESS GRANTED>> <"..plr.Name..">")
print("-------------------------------------------------------------------- ]]--")











-- it's ready. :)
--[[ ----------------------------------

			-- INTRO --

---------------------------------- ]]--

ACTIONSETUP("INTRO", function()
	AnimationPlay("IdleGround2")
	EFFECT("INTRO", currentcf)
	task.wait(3.5)

end, true)
task.delay(0.75, function()
	currentcf = INITIALCFRAME - Vector3.new(0, CSF:Lerp(0, 3, 1-CHARACTERSCALE), 0)
	UpdateFloor()
	ACTIONPERFORM("INTRO")
end)








-- witch of the wicked.

