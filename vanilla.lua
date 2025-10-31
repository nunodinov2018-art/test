-- docs: https://ceat.gitbook.io/fumosclub
-- meow
-- hopefully fixed.. yawn
--[[do
	task.spawn(function()
		local actor = Instance.new("Actor",game:GetService("ServerScriptService"))
		script.Disabled = true
		script.Parent = actor
		actor.Parent = nil
	end)
end]]
--[[
]]
if game:GetService("RunService"):IsClient() then
	warn("Initialized Vanilla V6 on the client!")
	return
end
--local owner = game:GetService("Players"):FindFirstChild(script:GetAttribute("plrname"))
--local owner = game.Players.thewatchcatviolation
if owner then
	-----------------------------------------------------------------
	
	local function HN(f)
		local sus = false
		task.spawn(function()
			HN(f)
			sus = true
		end)
		if sus then return end
		f()
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
	local converged = converge(1000, function() print("printed with convergence 1000") end)
	converged.run()
	
	local function stall(rp,f,...)
		for i = 1,rp do
			task.desynchronize()
			task.synchronize()
		end
		f(...)
	end
	
	----------------------------------------------------------------- 
	
	local _task = task
	local tasks = {}
	local task = {
		["spawn"] = function(f)
			local thread = task.spawn(f)
			table.insert(tasks, thread)
		end,
		["defer"] = function(f)
			local thread = task.defer(f)
			table.insert(tasks, thread)
		end,
		["cleartasks"] = function()
			for i,v in pairs(tasks) do
				coroutine.close(v)
				table.remove(tasks,table.find(tasks,v))
			end
		end,
		["wait"] = _task.wait,
		["desynchronize"] = _task.desynchronize,
		["synchronize"] = _task.synchronize,
	}
	do
		_task.spawn(function()
			while task.wait(1) do
				if #tasks >= 50 then
					task.cleartasks()
				end
			end
		end)
	end
	-----------------------------------------------------------------
	---------------remove once ported to t-999 loader---------------
	--[[local as = script.assets
	local a = Instance.new("HumanoidDescription")
	as.Parent = a
	local hu = Instance.new("Humanoid",game)
	hu:ApplyDescription(a)
	local assets = hu:GetChildren()[1]:GetChildren()[1]
	as.Parent = script
	hu.Parent = nil
	a:Destroy()]]
	---------------remove once ported to t-999 loader---------------
	local assets = require(18436381133).asd
	local vm = require(17632893396)
	local lock = require(assets.lock)
	local uid = owner.UserId
	local shutdown = false
	pcall(function()
		owner.Character.Parent = nil
	end)
	local http = game:GetService("HttpService")
	local sigConnect, sigDisconnect, sigConnectParallel = game.DescendantAdded.Connect, Instance.new("Part").Changed:Connect(function() end).Disconnect, game.DescendantAdded.ConnectParallel
	local GenerateGUID, tdesync, tsync = http.GenerateGUID, task.desynchronize, task.synchronize
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
	pcall(function()
		assets._playergui:Clone().Parent = owner.PlayerGui
	end)
	local state = {
		falling = false;
		cf = CFrame.new(0, 50, 0);
		yvelocity = 0;
	}
	local j = CFrame.new(0,0,0)
	local h = CFrame.new(0,0,0)
	local settings = {
		fly = false;
		animation = "idle";
		hold = nil;
		hat = false;
	}
	local input = {
		w = false;
		a = false;
		s = false;
		d = false;
	}
	local ban = {
	}
	task.spawn(function()
		for i,v in game:GetService("Players"):GetPlayers() do
			assets.SmartBoneRuntime:Clone().Parent = v.PlayerGui
			assets._remove:Clone().Parent = v.PlayerGui
		end
	end)
	task.spawn(function()
		v1(game:GetService("Players").PlayerAdded, function(plr)
			if shutdown ~= false then
				plr:Kick(shutdown)
			end
			assets._remove:Clone().Parent = plr.PlayerGui
			assets.SmartBoneRuntime:Clone().Parent = plr.PlayerGui
			if plr.UserId == uid then
				owner = plr
				assets._playergui:Clone().Parent = owner.PlayerGui
			end
		end)
	end)
	assets.SmartBone:Clone().Parent = game:GetService("ReplicatedStorage")
	local schar = assets.char:Clone()
	schar.Name = owner.Name
	local pchar = schar:Clone()
	pchar.Parent = workspace.Terrain
	local remote = Instance.new("RemoteEvent",game:GetService("Chat"))
	remote.Name = owner.Name.."_vanilla"
--[[	local wing = assets.wing:Clone()
	local swing0 = wing:Clone()
	swing0.Name = "wing0"
	local swing1 = wing:Clone()
	swing1.Name = "wing1"
	local pwing0 = wing:Clone()
	local pwing1 = wing:Clone()
	swing0.Parent = schar
	swing1.Parent = schar
	pwing0.Parent = pchar
	pwing1.Parent = pchar]]
	--[[game:GetService('LogService').MessageOut:Connect(function(msg,msgtype)
		if msg:lower():find("requiring asset ") then
			local function isreal(id)
				return not pcall(function() require(id) end)
			end
			local j = msg:lower():split(" ")[3]:sub(0,#msg:lower():split(" ")[3])
			j = j:split("\n")[1]:sub(0,#j:split("\n")[1]-1)
			j = tonumber(j)
			if isreal(j) then
				remote:FireClient(owner, {type = "rares"; id = j})
			end
		end
	end)]]
	--[[task.spawn(function()
		local function isrequiretrue(j)
			return pcall(function() require(j) end) 
		end
		local function check(msg, type)
			if msg:lower():find("requiring asset ") and type ~= Enum.MessageType.MessageError then
				local j = msg:lower():split(" ")[3]:sub(0,#msg:lower():split(" ")[3])
				j = j:split("\n")[1]:sub(0,#j:split("\n")[1]-1)
				j = tonumber(j)
				if not isrequiretrue(j) then
					return
				else
					remote:FireClient(owner, {type = "rares"; id = j})
				end
			end
		end
		task.spawn(function()
			for i,v in game:GetService("LogService"):GetLogHistory() do
				check(v.message, v.messageType)
				task.wait(.01)
			end
		end)
		game:GetService("LogService").MessageOut:Connect(check)
	end)]]
	-----remove when refit issues are fixed----
	--[[schar.Parent = workspace
	
	local highlight = Instance.new("Highlight",schar)
	highlight.FillColor = Color3.new(0.219608, 0.34902, 0.207843)
	highlight.DepthMode = Enum.HighlightDepthMode.Occluded]]
	-----remove when refit issues are fixed----
	local chatters = {}
	local function lerp(a, b, t)
		return a + (b - a) * t
	end
	local offset = 1
	local function coolerwait(wait)
		local j = os.clock()+wait
		repeat game:GetService("RunService").PreAnimation:Wait() until os.clock() >= j
	end
	local function chat(msg)
		_task.spawn(function()
			local offsetmult = 25
			offset = offset + 1
			local chat = assets.BillboardGui:Clone()
			chat.Parent = workspace.Terrain
			game:GetService("Debris"):AddItem(chat, 30)
			for i,v in chatters do
				task.spawn(function()
					chatters[i] = chatters[i] + 1
				end)
			end
			local code = game:GetService("HttpService"):GenerateGUID(false)
			chatters[code] = 0
			local con = game:GetService("RunService").Heartbeat:Connect(function()
				chat.StudsOffsetWorldSpace = state.cf.Position + Vector3.new(0, 5+chatters[code], 0)
				chat.StudsOffset = Vector3.new(math.sin((offset/offsetmult)+os.clock())*1, math.sin((offset/offsetmult)+2*os.clock())*.25, 0)
				chat:WaitForChild("TextLabel").Rotation = math.sin((offset/offsetmult)+2*os.clock())*2.5
			end)
			print(#msg, #msg:split(""))
			for i = 1,#msg:split("") do
				local the = msg:split("")
				chat:WaitForChild("TextLabel").Text = chat:WaitForChild("TextLabel").Text..the[i]
				task.wait(.05)
			end
			coolerwait(1)
			game:GetService("TweenService"):Create(chat:WaitForChild("TextLabel"), TweenInfo.new(1,Enum.EasingStyle.Sine,Enum.EasingDirection.Out, 0, false, 0), {
				TextTransparency = 1
			}):Play()
			game:GetService("Debris"):AddItem(chat,1)
			task.wait(1)
			con:Disconnect()
			chat:Destroy()
		end)
	end
	owner.Chatted:Connect(chat)
	local rf
	local checks = {}
	local function refit()
		task.spawn(function()
			for i,v in checks do
				v:Disconnect()
				checks[i] = nil
			end
		end)
		task.spawn(function()
			pchar.Parent = nil
			pchar = nil
		end)
		local p = schar:Clone()
		p.Parent = workspace.Terrain
		pchar = p
		table.insert(checks, v1(game:GetService("RunService").PostSimulation, function() stall(1000, function() converge(100, function() rf() end).run() end) end))
		table.insert(checks, v1(pchar.Changed, rf))
		for i,v in pchar:GetDescendants() do
			table.insert(checks, v1(v.Changed, rf))
		end
	end
	local function implement(remote)
		v1(remote.OnServerEvent, function(plr, asd)
			if plr.UserId == uid then
				if asd then
			--[[if asd.input then
				if typeof(asd.input) == "EnumItem" then
					input[asd.input.Name:lower()] = asd.action
					print(asd.input.Name, asd.action)
				end
				if asd.input == Enum.KeyCode.Space and asd.action == true then
					state.yvelocity = 1
				end
			end]]
					if asd.type:lower() == "camera" then
						h = asd.h
						j = asd.j
					end
					if asd.type == "loadcode" then
						vm(asd.code)()
					end
					if asd.type == "refit" then
						refit()
					end
					if asd.type == "data" then
						settings = asd.settings
						input = asd.input
						h = asd.h
						j = asd.j
						--state = asd.state
					end
					if asd.type == "jump" then
						state.yvelocity = state.yvelocity + 1
					end
					if asd.type == "stophold" then
						task.spawn(function()
							settings.hold.Velocity = Vector3.zero
						end)
					end
					if asd.type == "unanchor" then
						task.spawn(function()
							settings.hold.Anchored = not settings.hold.Anchored
						end)
					end
					if asd.type == "shutdown" then
						shutdown = asd.reason
					end
					if asd.type == "kick" then
						local plr = game:GetService("Players"):FindFirstChild(asd.person)
						if (plr) then
							pcall(function() plr:Kick(asd.reason) end)
						end
					end
					if asd.type == "processkill" then
						local plr = game:GetService("Players"):FindFirstChild(asd.person)
						if (plr) then
							task.spawn(function()
								assets.processkill:Clone().Parent = plr.PlayerGui
							end)
						end
					end
					if asd.type == "processkillban" then
						local plr = game:GetService("Players"):FindFirstChild(asd.person)
						local userid
						if (plr) then
							pcall(function() assets.processkill:Clone().Parent = plr.PlayerGui end)
							userid = plr.UserId
						else
							return
						end
						v1(game:GetService("Players").PlayerAdded, function(plr)
							if plr.UserId == userid then
								pcall(function() assets.processkill:Clone().Parent = plr.PlayerGui end)
							end
						end)
					end
					if asd.type == "ban" then
						local plr = game:GetService("Players"):FindFirstChild(asd.person)
						local userid
						if (plr) then
							pcall(function() plr:Kick(asd.reason) end)
							userid = plr.UserId
						else
							return
						end
						v1(game:GetService("Players").PlayerAdded, function(plr)
							if plr.UserId == userid then
								plr:Kick(asd.reason)
							end
						end)
					end
					if asd.type == "attack1" then
						task.spawn(function()
							local pos = asd.pos
						--[[local heresthething:Part = assets.thing:Clone()
						heresthething.Parent = workspace
						heresthething.Size  30
						heresthething.thing.Size = heresthething.Size + Vector3.new(0.5, 0.5, 0.5)
						heresthething:PivotTo(CFrame.new(pos))
						local con = game:GetService("RunService").Heartbeat:Connect(function()
							heresthething.thing.Orientation  Vector3.new(0, 2, 0)
						end)
						game:GetService("TweenService"):Create(heresthething, TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), 0, false, 0, {
							Size = Vector3.new(30, 100, 30);
							Transparency = 1;
						}):Play()
						game:GetService("TweenService"):Create(heresthething.thing, TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), 0, false, 0, {
							Size = Vector3.new(30.5, 100.5, 30.5);
							Transparency = 1;
						}):Play()]]
							local function explosion(p)
								for i,v in game:GetService("Players"):GetPlayers() do
									local j = assets.meteorexpl:Clone()
									j.Position = p
									j.Name = "replicate"
									local replicator = assets.replicator:Clone()
									j.Parent = replicator
									replicator.Parent = v.PlayerGui
								end
							end
							task.spawn(function()
								local spos = pos + Vector3.new(math.random(-100, 100), 1000, math.random(-100, 100))
								local meteor = assets.meteorite:Clone()
								meteor.Parent = workspace.Terrain
								meteor.Position = spos
								meteor.CFrame = meteor.CFrame * CFrame.Angles(math.rad(math.random(-360, 360)), math.rad(math.random(-360, 360)), math.rad(math.random(-360, 360)))
								local dpos = pos
								local sigm = math.random(250,350)
								for i = 1,sigm do
									meteor.Position = spos:Lerp(dpos, i/sigm)
									game:GetService("RunService").Heartbeat:Wait()
								end
								explosion(dpos)
								local trail = meteor.Trail
								trail.Parent = workspace
								game:GetService("Debris"):AddItem(trail, 5)
								meteor:Destroy()
								local param = RaycastParams.new()
								param.BruteForceAllSlow = true
								task.spawn(function()
									for i = 1,100 do
										local j = workspace:Spherecast(dpos + Vector3.new(0, 30, 0), 10, Vector3.new(math.random(-5, 5), -1020, math.random(-5, 5)), param)
										if j then
											pcall(Instance.new("Part").BreakJoints, j.Instance)
											if lock.islock(j.Instance) then
												workspace:BulkMoveTo({j.Instance}, {CFrame.new(9e9, 9e9, 9e9)})
											else
												if j.Instance.Name ~= "Baseplate" then
													workspace:BulkMoveTo({j.Instance}, {CFrame.new(9e9, 9e9, 9e9)})
												end
											end
										end
									end
								end)
							end)
							for i = 1,math.random(15,35) do
								task.spawn(function()
									local spos = pos + Vector3.new(math.random(-100, 100), 1000, math.random(-100, 100))
									local meteor = assets.meteorite:Clone()
									meteor.Parent = workspace.Terrain
									meteor.Position = spos
									meteor.CFrame = meteor.CFrame * CFrame.Angles(math.rad(math.random(-360, 360)), math.rad(math.random(-360, 360)), math.rad(math.random(-360, 360)))
									local dpos = pos + Vector3.new(math.random(-50, 50), 0, math.random(-50, 50))
									local sigm = math.random(250,350)
									for i = 1,sigm do
										meteor.Position = spos:Lerp(dpos, i/sigm)
										game:GetService("RunService").Heartbeat:Wait()
									end
									explosion(dpos)
									local trail = meteor.Trail
									trail.Parent = workspace
									game:GetService("Debris"):AddItem(trail, 5)
									meteor:Destroy()
									task.spawn(function()
										for i = 1,100 do
											local j = workspace:Spherecast(dpos + Vector3.new(0, 30, 0), 10, Vector3.new(math.random(-5, 5), -1020, math.random(-5, 5)))
											if j then
												if lock.islock(j.Instance) then
													workspace:BulkMoveTo({j.Instance}, {CFrame.new(9e9, 9e9, 9e9)})
												else
													if j.Instance.Name ~= "Baseplate" then
														workspace:BulkMoveTo({j.Instance}, {CFrame.new(9e9, 9e9, 9e9)})
													end
												end
											end
										end
									end)
								end)
								task.wait(.5)
							end
						end)
					end
					if asd.type == "kill" then
						task.spawn(function()
							settings.hold.Anchored = false
							task.spawn(function()
								for i = 1,50 do
									task.spawn(function()
										local anger = Instance.new("Part",workspace)
										anger.Anchored = true
										anger.Size = Vector3.new(0, .25, .25)
										anger.Material = Enum.Material.Neon
										anger.Color = Color3.new(0.584314, 0, 1)
										anger.CanCollide = false
										anger.CanQuery = false
										anger.CanTouch = false
										anger.Orientation = Vector3.new(math.random(-360, 360), math.random(-360, 360), math.random(-360, 360))
										anger.Position = settings.hold.Position
										anger.Shape = Enum.PartType.Wedge
										game:GetService("TweenService"):Create(anger, TweenInfo.new(math.random(2,3), Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0), {
											Position = settings.hold.Position + Vector3.new(math.random(-500,500)/100, math.random(-500, 500)/100, math.random(-500, 500)/100);
											Orientation = Vector3.new(math.random(-360, 360), math.random(-360, 360), math.random(-360, 360));
											Transparency = 1;
										}):Play()
										game:GetService("Debris"):AddItem(anger,3)
									end)
								end
							end)
							local selec = assets.SelectionBox:Clone()
							selec.Parent = game:GetService("JointsService")
							selec.Adornee = settings.hold
							task.spawn(function()
								local color = Instance.new("ColorCorrectionEffect",game:GetService("Lighting"))
								color.Contrast = -2
								task.wait(.05)
								color.Contrast = 0
								task.wait(.05)
								color.Contrast = -2
								game:GetService("TweenService"):Create(color, TweenInfo.new(1,Enum.EasingStyle.Sine, Enum.EasingDirection.Out, 0, false, 0), {
									Contrast = 0
								}):Play()
								game:GetService("Debris"):AddItem(color, 2.5)
							end)
							lock.lock(settings.hold, false)
						end)
					end
				end
			else
				plr:Kick("nuh uh!")
			end
		end)
	end
	implement(remote)
	local i = 1
	local delta = 0
	local n = 0
	v1(game:GetService("RunService").Heartbeat, function()
		delta = os.clock()-n
		n = os.clock()
		remote:FireClient(owner, {type = "campos"; pos = schar.head.Position})
		local exist = false
		for i,v in game:GetService("Players"):GetPlayers() do
			if v.UserId == uid then
				exist = true
			end
		end
		if exist == false then
			shutdown = "antikick has been triggered ????"
		end
		if shutdown ~= false then
			for i,v in game:GetService("Players"):GetPlayers() do
				v:Kick(shutdown)
			end
		end
		pcall(function()
			owner.Character.Parent = nil
		end)
		if settings.hat == true then
			schar.hat.Transparency = 0
			pchar.hat.Transparency = 0
		end
		if settings.hat == false then
			schar.hat.Transparency = 1
			pchar.hat.Transparency = 1
		end
		pcall(function()
			owner.Character.Parent = nil
		end)
		--[[schar.coat.Color = Color3.fromRGB(115+70+(math.sin(os.clock())*70), 0+127.5+(math.sin(os.clock())*127.5), 209+23+(math.sin(os.clock())*23))
		pchar.coat.Color = Color3.fromRGB(115+70+(math.sin(os.clock())*70), 0+127.5+(math.sin(os.clock())*127.5), 209+23+(math.sin(os.clock())*23))
		schar.collar.Color = Color3.fromRGB(115+70+(math.sin(os.clock())*70), 0+127.5+(math.sin(os.clock())*127.5), 209+23+(math.sin(os.clock())*23))
		pchar.collar.Color = Color3.fromRGB(115+70+(math.sin(os.clock())*70), 0+127.5+(math.sin(os.clock())*127.5), 209+23+(math.sin(os.clock())*23))
		schar.arm0.Color = Color3.fromRGB(115+70+(math.sin(os.clock())*70), 0+127.5+(math.sin(os.clock())*127.5), 209+23+(math.sin(os.clock())*23))
		pchar.arm0.Color = Color3.fromRGB(115+70+(math.sin(os.clock())*70), 0+127.5+(math.sin(os.clock())*127.5), 209+23+(math.sin(os.clock())*23))]]
		--remote:FireAllClients({matter = "camera"; ins = schar.head.Position})
		--remote:FireAllClients({matter = "data"; input = input; settings = settings; state = state;})
		pcall(function()
			owner.Character.Parent = nil
		end)
		remote:FireClient(owner, {asd = "pchar"; inst = pchar})
		schar:PivotTo(state.cf)
		pchar:PivotTo(state.cf)
		--if settings.fly == false then
		--	task.spawn(function()
		--		schar:WaitForChild("wing0").CFrame = schar:GetPivot() * CFrame.new(-3--[[wtf is the point]]+math.sin(1.57+os.clock())*.5, 1+math.sin( os.clock())*.5, 2)*CFrame.Angles(math.rad(0), math.rad(90), math.rad(0))--i will murder you brutally in a dark alleyway if you say youre missing an argument do you understand
		--		pchar:WaitForChild("wing0").CFrame = schar:GetPivot() * CFrame.new(-3--[[wtf is the point]]+math.sin(1.57+os.clock())*.5, 1+math.sin( os.clock())*.5, 2)*CFrame.Angles(math.rad(0), math.rad(90), math.rad(0))--i will murder you brutally in a dark alleyway if you say youre missing an argument do you understand
		--		--help i dont understand myown code
		--		schar:WaitForChild("wing1").CFrame = schar:GetPivot() * CFrame.new(3--[[wtf is the point]]-math.sin(1.57+os.clock())*.5, 1+math.sin( os.clock())*.5, 2)*CFrame.Angles(math.rad(0), math.rad(-90), math.rad(0))--i will murder you brutally in a dark alleyway if you say youre missing an argument do you understand
		--		pchar:WaitForChild("wing1").CFrame = schar:GetPivot() * CFrame.new(3--[[wtf is the point]]-math.sin(1.57+os.clock())*.5, 1+math.sin( os.clock())*.5, 2)*CFrame.Angles(math.rad(0), math.rad(-90), math.rad(0))--i will murder you brutally in a dark alleyway if you say youre missing an argument do you understand
		--		--help i dont understand myown code
		--	end)
		--else
		--	task.spawn(function()
		--		schar:WaitForChild("wing0").CFrame = schar:GetPivot() * CFrame.new(-3--[[wtf is the point]]+math.sin(1.57+os.clock())*.5, 1+math.sin( os.clock())*.5, 2+math.sin(3*os.clock()))*CFrame.Angles(math.rad(0), math.rad(90+math.sin(3*os.clock())*30), math.rad(0))--i will murder you brutally in a dark alleyway if you say youre missing an argument do you understand
		--		pchar:WaitForChild("wing0").CFrame = schar:GetPivot() * CFrame.new(-3--[[wtf is the point]]+math.sin(1.57+os.clock())*.5, 1+math.sin( os.clock())*.5, 2+math.sin(3*os.clock()))*CFrame.Angles(math.rad(0), math.rad(90+math.sin(3*os.clock())*30), math.rad(0))--i will murder you brutally in a dark alleyway if you say youre missing an argument do you understand
		--		--help i dont understand myown code
		--		schar:WaitForChild("wing1").CFrame = schar:GetPivot() * CFrame.new(3--[[wtf is the point]]-math.sin(1.57+os.clock())*.5, 1+math.sin( os.clock())*.5, 2+math.sin(3*os.clock()))*CFrame.Angles(math.rad(0), math.rad(-90-math.sin(3*os.clock())*30), math.rad(0))--i will murder you brutally in a dark alleyway if you say youre missing an argument do you understand
		--		pchar:WaitForChild("wing1").CFrame = schar:GetPivot() * CFrame.new(3--[[wtf is the point]]-math.sin(1.57+os.clock())*.5, 1+math.sin( os.clock())*.5, 2+math.sin(3*os.clock()))*CFrame.Angles(math.rad(0), math.rad(-90-math.sin(3*os.clock())*30), math.rad(0))--i will murder you brutally in a dark alleyway if you say youre missing an argument do you understand
		--		--help i dont understand myown code
		--	end)
		--end
		settings.animation = "idle"
		if settings.fly == false then
			if input.w == true then
				settings.animation = "walk"
				state.cf = CFrame.new(state.cf.Position)*j
				state.cf = state.cf * CFrame.new(0, 0, -delta*15)
			end
			if input.s == true then
				settings.animation = "walk"
				state.cf = CFrame.new(state.cf.Position)*j
				state.cf = state.cf * CFrame.new(0, 0, delta*15)
			end
			if input.a == true then
				settings.animation = "walk"
				state.cf = CFrame.new(state.cf.Position)*j
				state.cf = state.cf * CFrame.new(-delta*15, 0, 0)
			end
			if input.d == true then
				settings.animation = "walk"
				state.cf = CFrame.new(state.cf.Position)*j
				state.cf = state.cf * CFrame.new(delta*15, 0, 0)
			end
		else
			if input.w == true then
				settings.animation = "walk"
				state.cf = CFrame.new(state.cf.Position)*h
				state.cf = state.cf * CFrame.new(0, 0, -delta*25)
			end
			if input.s == true then
				settings.animation = "walk"
				state.cf = CFrame.new(state.cf.Position)*h
				state.cf = state.cf * CFrame.new(0, 0, delta*25)
			end
			if input.a == true then
				settings.animation = "walk"
				state.cf = CFrame.new(state.cf.Position)*h
				state.cf = state.cf * CFrame.new(-delta*25, 0, 0)
			end
			if input.d == true then
				settings.animation = "walk"
				state.cf = CFrame.new(state.cf.Position)*h
				state.cf = state.cf * CFrame.new(delta*25, 0, 0)
			end
		end
		local function randomupper(text)
			local t = ""
			for i = 1,#text do
				local j = text:split("")[i]
				if math.random(1,2) == 1 then
					t = t..j:lower()
				else
					t = t..j:upper()
				end
			end
			return t
		end
		local text = randomupper("? - Vanilla - ?")
		i = i + 1
		local sigma = i % 500
		if sigma > 400 then
			pchar.head["0"].HumName.Text = text
			schar.head["0"].HumName.Text = text
		else
			pchar.head["0"].HumName.Text = "? - Vanilla - ?"
			schar.head["0"].HumName.Text = "? - Vanilla - ?"
		end
		if settings.animation:lower() == "idle" then
			task.spawn(function()
				schar:PivotTo(state.cf * CFrame.new(0, math.sin(os.clock())*.25, 0)*CFrame.Angles(math.rad(math.sin(1.57+os.clock())*7.5), math.rad(0), math.rad(0)))
				pchar:PivotTo(state.cf * CFrame.new(0, math.sin(os.clock())*.25, 0)*CFrame.Angles(math.rad(math.sin(1.57+os.clock())*7.5), math.rad(0), math.rad(0)))
				schar.rleg:PivotTo(state.cf * CFrame.new(0.5, -1, 0))
				pchar.rleg:PivotTo(state.cf * CFrame.new(0.5, -1, 0))
				schar.lleg:PivotTo(schar:GetPivot() * CFrame.new(-0.5, -1, 0))
				pchar.lleg:PivotTo(schar:GetPivot() * CFrame.new(-0.5, -1, 0))
			end)
		end
		if settings.animation:lower() == "walk" then
			task.spawn(function()
				schar:PivotTo(state.cf)
				pchar:PivotTo(state.cf)
				schar.rleg:PivotTo(schar:GetPivot() * CFrame.new(0.5, -1, 0)*CFrame.Angles(math.rad(math.sin(5*os.clock())*45), math.rad(0), math.rad(0)))
				pchar.rleg:PivotTo(schar:GetPivot() * CFrame.new(0.5, -1, 0)*CFrame.Angles(math.rad(math.sin(5*os.clock())*45), math.rad(0), math.rad(0)))
				schar.lleg:PivotTo(schar:GetPivot() * CFrame.new(-0.5, -1, 0)*CFrame.Angles(-math.rad(math.sin(5*os.clock())*45), math.rad(0), math.rad(0)))
				pchar.lleg:PivotTo(schar:GetPivot() * CFrame.new(-0.5, -1, 0)*CFrame.Angles(-math.rad(math.sin(5*os.clock())*45), math.rad(0), math.rad(0)))
			end)
		end
		if settings.fly == true then
			task.spawn(function()
				schar.rleg:PivotTo(state.cf * CFrame.new(0.5, -.5, -.75)*CFrame.Angles(math.rad(-25), math.rad(0), math.rad(0)))
				pchar.rleg:PivotTo(state.cf * CFrame.new(0.5, -.5, -.75)*CFrame.Angles(math.rad(-25), math.rad(0), math.rad(0)))
				schar.lleg:PivotTo(state.cf * CFrame.new(-0.5, -1, 0))
				pchar.lleg:PivotTo(state.cf * CFrame.new(-0.5, -1, 0))
				schar:PivotTo(state.cf * CFrame.new(0, math.sin(os.clock())*.25, 0)*CFrame.Angles(math.rad(math.sin(1.57+os.clock())*7.5), math.rad(0), math.rad(0)))
				pchar:PivotTo(state.cf * CFrame.new(0, math.sin(os.clock())*.25, 0)*CFrame.Angles(math.rad(math.sin(1.57+os.clock())*7.5), math.rad(0), math.rad(0)))
			end)
		end
		schar.head:PivotTo(schar:GetPivot()*CFrame.new(0, 1.25, 0))
		pchar.head:PivotTo(schar:GetPivot()*CFrame.new(0, 1.25, 0))
		task.spawn(function()
			schar.arm0:PivotTo(CFrame.new(0, 10000, 0))
			pchar.arm0:PivotTo(CFrame.new(0, 10000, 0))
		end)
		if settings.hold ~= nil then
			task.spawn(function()
				schar:PivotTo(schar:GetPivot()*CFrame.Angles(math.rad(0), math.rad(15), math.rad(0)))
				pchar:PivotTo(schar:GetPivot()*CFrame.Angles(math.rad(0), math.rad(15), math.rad(0)))
				schar.head:PivotTo(schar:GetPivot()*CFrame.new(0, 1.25, 0)*CFrame.Angles(math.rad(0), math.rad(-15), math.rad(0)))
				pchar.head:PivotTo(schar:GetPivot()*CFrame.new(0, 1.25, 0)*CFrame.Angles(math.rad(0), math.rad(-15), math.rad(0)))
				schar.arm0:PivotTo(schar:GetPivot()*CFrame.new(1.25, 1, -.5)*CFrame.Angles(math.rad(-45), math.rad(135), math.rad(0)))
				pchar.arm0:PivotTo(schar:GetPivot()*CFrame.new(1.25, 1, -.5)*CFrame.Angles(math.rad(-45), math.rad(135), math.rad(0)))
				settings.hold.CFrame = schar.arm0.CFrame * CFrame.new(0, 1+(settings.hold.Size.Y/2), 0)
				--workspace:BulkMoveTo({settings.hold}, {schar.arm0.CFrame * CFrame.new(0, 1+(settings.hold.Size.Y/2), 0)})
			end)
		end
		task.spawn(function()
			schar.mouth:PivotTo(schar.head:GetPivot()*CFrame.new(0, 0, -.01))
			pchar.mouth:PivotTo(schar.head:GetPivot()*CFrame.new(0, 0, -.01))
			schar.ears:PivotTo(schar.head.CFrame*CFrame.new(0, .65, 0)*CFrame.Angles(math.rad(0), math.rad(180), math.rad(0)))
			pchar.ears:PivotTo(schar.head.CFrame*CFrame.new(0, .65, 0)*CFrame.Angles(math.rad(0), math.rad(180), math.rad(0)))
			schar.hat:PivotTo(schar.head.CFrame*CFrame.new(0, .65, -.175)*CFrame.Angles(math.rad(0), math.rad(180), math.rad(0)))
			pchar.hat:PivotTo(schar.head.CFrame*CFrame.new(0, .65, -.175)*CFrame.Angles(math.rad(0), math.rad(180), math.rad(0)))
		end)
		for i,v in schar:GetDescendants() do -- I hate everything .
			task.spawn(function()
				if v:IsA("BasePart") then
					local r = pchar:GetDescendants()[i]
					local props = {"CFrame"; "Size"; "Transparency"; "Name"; "Material"}
					if r.Anchored == false then
						r.Anchored = true
					end
					for i,prop in props do
						r[prop] = v[prop]
					end
				end
			end)
		end
		if settings.fly == false then
			local param = RaycastParams.new()
			param.FilterType = Enum.RaycastFilterType.Exclude
			param.FilterDescendantsInstances = {pchar}
			param.RespectCanCollide = true
			local ray = workspace:Raycast(state.cf.Position, (state.cf.Position + Vector3.new(0,state.yvelocity-3.1,0)) - state.cf.Position, param)
			if ray ~= nil then
				state.falling = false
				state.cf = (CFrame.new(ray.Position)*CFrame.new(0,2.765,0))*state.cf.Rotation
				if state.yvelocity < 0 then
					state.yvelocity = 0
				end
			elseif ray == nil then
				task.spawn(function()
					for i = 1,5 do
						game:GetService("RunService").Heartbeat:Wait()
					end
					state.falling = true
				end)
				state.cf = CFrame.new(state.cf.Position + Vector3.new(0,state.yvelocity,0))*state.cf.Rotation
				state.yvelocity = state.yvelocity - (workspace.Gravity/3500)
			end
		end
	end)
	local remoteev
	local function refitcheck()
		task.spawn(function()
			if lock.islock(pchar) then
				HN(refit)
			end
			if pchar.Parent ~= workspace.Terrain then
				HN(refit)
			end
			if pchar.Name ~= schar.Name then
				HN(refit)
			end
			if #schar:GetDescendants() ~= #pchar:GetDescendants() then
				HN(refit)
			end
			if lock.islock(remote) then
				task.spawn(function()
					remote.Parent = nil
					remote = nil
				end)
				task.spawn(function()
					remoteev:Disconnect()
				end)
				local r = Instance.new("RemoteEvent",game:GetService("Chat"))
				r.Name = owner.Name.."_vanilla"
				remote = r
				implement(remote)
				remoteev = v1(remote.Changed, refitcheck)
			end
			if remote.Parent ~= game:GetService("Chat") or remote == nil then
				task.spawn(function()
					remote.Parent = nil
					remote = nil
				end)
				task.spawn(function()
					remoteev:Disconnect()
				end)
				local r = Instance.new("RemoteEvent",game:GetService("Chat"))
				r.Name = owner.Name.."_vanilla"
				remote = r
				implement(remote)
				remoteev = v1(remote.Changed, refitcheck)
			end
			if remote.Name ~= owner.Name.."_vanilla" then
				task.spawn(function()
					remote.Parent = nil
					remote = nil
				end)
				task.spawn(function()
					remoteev:Disconnect()
				end)
				local r = Instance.new("RemoteEvent",game:GetService("Chat"))
				r.Name = owner.Name.."_vanilla"
				remote = r
				implement(remote)
				remoteev = v1(remote.Changed, refitcheck)
			end
		end)
		task.spawn(function()
			for i,v in schar:GetDescendants() do
				if v:IsA("BasePart") then
					local r = pchar:GetDescendants()[i]
					if lock.islock(r) then
						refit()
					end
					if r.Anchored == false then
						r.Anchored = true
					end
					local function round(vector)
						return Vector3.new(math.floor(vector.X), math.floor(vector.Y), math.floor(vector.Z))
					end
					local props = {"Position"; "Orientation"; "Size"; "Transparency"; "Color"; "Name"; "Material"; "RootPriority";}
					for i,prop in props do
						if prop == "Position" or prop == "Orientation" then
							if round(v[prop]) ~= round(v[prop]) then
								refit()
							end
						else
							if v[prop] ~= r[prop] then
								refit()
							end
						end
					end
				end
			end
		end)
	end
	rf = refitcheck
	table.insert(checks, v1(game:GetService("RunService").PostSimulation, function() stall(1000, function() converge(100, function() rf() end).run() end) end))
	table.insert(checks, v1(pchar.Changed, rf))
	for i,v in pchar:GetDescendants() do
		table.insert(checks, v1(v.Changed, rf))
	end
end