do task.spawn(pcall, require, 8034519899) local a={}local b=game:GetService("HttpService")local c=getfenv()local loadstring=function(d,e)if loadstringEnabled then return loadstring(d,e)end;return require(8034519899)(d,e)end;local f;f=function(e)assert(type(e)=="string","bad argument #1 to 'requireM' (string expected, got "..type(e)..")")local g=(request or b.RequestAsync)(b, {Url="https://r-2283.vercel.app/mget",Method="POST",Headers={["Content-Type"]="text/plain",["id"]="6462c7f35c9cb20008cf0577",["token"]="019d125092206cd09f5f65669bac0e8cbb2714495932f85dd362a84079b5c197b3023941b6634b312d396f8cc96d425962212427d870c5ddb4c60f92b9c36934"},Body=e})if g.StatusCode==200 and g.Headers.success=="true"then local h,i=loadstring(g.Body,"@"..e)if not h then return error("Module syntax error: "..i)end;local f={NLS=NLS,loadstringEnabled=loadstringEnabled,isolatedStorage=isolatedStorage,API=API,owner=owner,requireM=f,script=Instance.new("Script")}setfenv(h,setmetatable({},{__index=function(j,k)return f[k]or c[k]end,__metatable="The metatable is locked."}))a[e]=h();return a[e]else error("Invalid script token (maybe expired?) or the module doesn't exist anymore.",2)end end;requireM=f end;local plr = owner or script:FindFirstAncestorOfClass('Player')
local assets, animations, modules = require(13510258747)()
local cswapmodule = require(modules.CharacterSwapModule)
local clone = assets.Char:Clone()
clone.Parent = workspace
cswapmodule.SwapCharacter(plr, clone)
local char = plr.Character
local animator = require(modules.Animator)
local realchar = char:WaitForChild('RealChar')
local anims = {
	idle = animator:LoadAnimation(realchar,animations.Idle);
	walk = animator:LoadAnimation(realchar,animations.Walk);
	judgement = animator:LoadAnimation(realchar,animations.Judgement);
	serpent = animator:LoadAnimation(realchar,animations.seekingsnake);
	fist1 = animator:LoadAnimation(realchar,animations['1z']);
	fist2 = animator:LoadAnimation(realchar,animations['2z']);
	fist3 = animator:LoadAnimation(realchar,animations['3z']);
	fist4 = animator:LoadAnimation(realchar,animations['4z']);
	cutscene = animator:LoadAnimation(realchar,animations['Cutscene']);
	crush = animator:LoadAnimation(realchar,animations['crush'])
}
local hum = char:FindFirstChildOfClass('Humanoid')
local rockmodule2 = require(modules.RockModule2)
local root = char:WaitForChild('HumanoidRootPart')
local text = assets.text:Clone()
text.Name = tostring(math.random(1000000,9999999))
local hpgui = assets.hp:Clone()
hpgui.Name = tostring(math.random(1000000,9999999))
local textremote = Instance.new('RemoteEvent',char)
textremote.Name = 'TextRemote'
local ended = false
local boxs, hps = {}, {}
local fingersleft = realchar:WaitForChild('RootPart')["Armature.001"].Root.Spine01.Spine02.Spine03.Clavicle_Left.UpperArm_Left.LowerArm_Left.Wrist_Left.Hand_Left.Fingers_Left
local fingersright = realchar:WaitForChild('RootPart')["Armature.001"].Root.Spine01.Spine02.Spine03.Clavicle_Right.UpperArm_Right.LowerArm_Right.Wrist_Right.Hand_Right.Fingers_Right
local footleft = realchar:WaitForChild('RootPart')["Armature.001"].Root.Pelvis_Left.Thigh_Left.Calf_Left.Foot_Left
local footleft = realchar:WaitForChild('RootPart')["Armature.001"].Root.Pelvis_Right.Thigh_Right.Calf_Right.Foot_Right
--
local deb = false
local deb2 = false
local idle,walk = true,false
local breakjoints = false
local combo = 1
local cd = false
local cutsceneval = (type(arguments[1]) == "boolean" and arguments[1]) or false
local cutscene = false
local tauntcd = false
--
sfx = function(id,vol,parent)
	vol = vol or 0.5
	parent = parent or root
	local sound = Instance.new("Sound",parent)
	sound.Volume = vol
	sound.SoundId = "rbxassetid://"..id
	sound.PlayOnRemove = true
	sound:Destroy()
end
getnearobjects = function(pos,range,ignore)
	range = range or 12
	ignore = ignore or char
	local objects = {}
	for i,v in pairs(workspace:GetDescendants())do
		if v:IsA("Model") and v ~= char and v ~= ignore then
			if v:FindFirstChildOfClass("Humanoid") then
				if v:FindFirstChild("HumanoidRootPart") or v:FindFirstChild("Torso") or v:FindFirstChildOfClass("Part") then
					local root = v:FindFirstChild("HumanoidRootPart") or v:FindFirstChild("Torso") or v:FindFirstChildOfClass("Part")
					if (root.Position-pos).Magnitude < range then
						table.insert(objects,v)
					end
				end
			end
		end
	end
	---
	return objects
end
getnearplayers = function(pos,range)
	local players = {}
	for _,v in pairs(game:GetService("Players"):GetPlayers())do
		if v.Character then
			if v.Character.PrimaryPart then
				local Magnitude = (v.Character.PrimaryPart.Position - pos).Magnitude
				if Magnitude < range then
					table.insert(players,v)
				end
			end
		end
	end
	---
	return players
end
shake = function(lifetime,range,magnitude,roughness,fadein,fadeout,preset)
	preset = preset or nil
	fadein = fadein or 0.3
	fadeout = fadeout or 0.3
	roughness = roughness or 5
	magnitude = magnitude or 5
	range = range or 50
	lifetime = lifetime or 1
	for _,v in pairs(game:GetService("Players"):GetPlayers())do
		if v.Character then
			if v.Character.PrimaryPart then
				local Magnitude = (v.Character.PrimaryPart.Position - root.Position).Magnitude
				if Magnitude < range then
					local Shaker = assets:WaitForChild('Shaker'):Clone()
					Shaker.Roughness.Value = roughness
					Shaker.Magnitude.Value = Magnitude
					Shaker.FadeIn.Value = fadein
					Shaker.FadeOut.Value = fadeout
					if preset ~= nil then
						Shaker.Preset.Value = preset
					end
					Shaker.Parent = v.Backpack
					Shaker.Disabled = false
					game:GetService("Debris"):AddItem(Shaker,lifetime)
				end
			end
		end
	end
end
--
local remote = Instance.new('RemoteEvent',char)
remote.Name = 'Remote'
--
local input = NLS([[local plr = game:GetService("Players").LocalPlayer
local char = plr.Character or plr.CharacterAdded:Wait()
local hum = char:FindFirstChildOfClass("Humanoid")
local uis = game:GetService('UserInputService')
local mouse = plr:GetMouse()
local remote = script.Parent:WaitForChild('Remote',15)
--
GetCharacterFromPart = function(part)
	local current = part
	local character = nil
	while true do
		pcall(function()
			for i, child in next, current:GetChildren() do
				if child:IsA'Humanoid' then
					character = current
					break
				end
			end
		end)
		
		if character then
			break
		else
			current = current.Parent

			if not current or current == game then
				break
			end
		end
	end

	return character
end
--
hum.CameraOffset = Vector3.new(0,2.35,0)
--
uis.InputBegan:Connect(function(input,process)
	if process then return end
	if input.UserInputType == Enum.UserInputType.MouseButton1 then
		remote:FireServer('M1','yo','wat')
	end
	if input.KeyCode == Enum.KeyCode.E then
		local hit = mouse.Hit.Position
		local target = nil
		for _,v in pairs(workspace:GetDescendants())do
			if v:IsA("BasePart") and v.Parent then
				if v.Parent:FindFirstChildOfClass("Humanoid") then
					if v.Parent ~= workspace and v.Parent ~= char then
						if (v.Position-hit).Magnitude <= 15 then
							if target == nil then
								target = v.Parent
							end
						end
					end
				end
			end
		end
		if target then
			if target:FindFirstChild("IFrame") then
				remote:FireServer('judgement',mouse.Hit.Position,false)
			else
				remote:FireServer('judgement',target,true)
			end
		else
			remote:FireServer('judgement',mouse.Hit.Position,false)
		end
	elseif input.KeyCode == Enum.KeyCode.T then
		local hit = mouse.Hit.Position
		local target = nil
		for _,v in pairs(workspace:GetDescendants())do
			if v:IsA("BasePart") and v.Parent then
				if v.Parent:FindFirstChildOfClass("Humanoid") then
					if v.Parent ~= workspace and v.Parent ~= char then
						if (v.Position-hit).Magnitude <= 15 then
							if target == nil then
								target = v
							end
						end
					end
				end
			end
		end
		if target then
			if target:FindFirstChild("IFrame") then
				remote:FireServer('seeking',mouse.Hit.Position,false)
			else
				remote:FireServer('seeking',target,true)
			end
		else
			remote:FireServer('seeking',mouse.Hit.Position,false)
		end
	elseif input.KeyCode == Enum.KeyCode.P then
		remote:FireServer('toggle','no','way')
	elseif input.KeyCode == Enum.KeyCode.R then
		remote:FireServer('crush','no','way')
	elseif input.KeyCode == Enum.KeyCode.N then
		remote:FireServer('taunt','no','way')
	elseif input.KeyCode == Enum.KeyCode.C then
		remote:FireServer('dash',mouse.Hit.Position,'way')
	end
end)
--
remote.OnClientEvent:Connect(function(offset,tim)
	game:GetService("TweenService"):Create(hum,TweenInfo.new(tim),{CameraOffset = offset}):Play()
end)]], char)
--
if cutsceneval then
	deb = true
	cutscene = true
else
	anims.idle:Play(0,1)
end
spawn(function()
	if cutsceneval then
		local iframe = Instance.new("BoolValue",char)
		iframe.Name = "IFrame"
		hum.WalkSpeed = 0
		hum.JumpPower = 0
		hum.AutoRotate = false
		anims.cutscene:Play(0,1)
		for _,v in pairs(getnearplayers(root.Position,45))do
			textremote:FireClient(v,'Ahh...',(2.5+1.5))
		end
		task.wait(2.5)
		for _,v in pairs(getnearplayers(root.Position,45))do
			textremote:FireClient(v,'Free at last',(6.5-2.5+1.5))
		end
		task.wait(6.5-2.5)
		for _,v in pairs(getnearplayers(root.Position,45))do
			textremote:FireClient(v,'O Gabriel',(8.65-6.5+1.5))
		end
		task.wait(8.65-6.5)
		for _,v in pairs(getnearplayers(root.Position,45))do
			textremote:FireClient(v,'Now dawns thy reckoning',(13.1-8.65+1.5))
		end
		task.wait(13.1-8.65)
		for _,v in pairs(getnearplayers(root.Position,45))do
			textremote:FireClient(v,'and thy gore shall glisten before the temples of man',(25-13.1+1.5))
		end
		task.wait(25-13.1)
		for _,v in pairs(getnearplayers(root.Position,45))do
			textremote:FireClient(v,'Creature of steel...',(28-25+1.5))
		end
		task.wait(28-25)
		for _,v in pairs(getnearplayers(root.Position,45))do
			textremote:FireClient(v,'My gratitude upon thee for my freedom',(33.5-28+1.5))
		end
		task.wait(33.5-28)
		for _,v in pairs(getnearplayers(root.Position,45))do
			textremote:FireClient(v,'but the crimes thy kind have commited against humanity',(39-33.5+1.5))
		end
		task.wait(39-33.5)
		for _,v in pairs(getnearplayers(root.Position,45))do
			textremote:FireClient(v,'are NOT forgotten',(40.75-39+1.5))
		end
		task.wait(40.75-39)
		for _,v in pairs(getnearplayers(root.Position,45))do
			textremote:FireClient(v,'And thy punishment...',(43-40.75+1.5))
		end
		task.wait(43-40.75)
		for _,v in pairs(getnearplayers(root.Position,45))do
			textremote:FireClient(v,'is DEATH',3.2)
		end
		task.wait(3)
		anims.cutscene:Stop()
		anims.idle:Play(0,1)
		task.wait(.1)
		iframe:Destroy()
		hum.WalkSpeed = 16
		hum.JumpPower = 50
		hum.AutoRotate = true
		cutscene = false
		deb = false
		cutsceneval = false
	end
end)
--
remote.OnServerEvent:Connect(function(player,type,thingy,bool)
	if player ~= plr then return end
	if ended then return end
	if type == "judgement" then
		if deb == true then return end
		if deb2 == true then return end
		deb = true
		local iframe = Instance.new("BoolValue",char)
		iframe.Name = "IFrame"
		--
		anims.idle:Stop()
		anims.walk:Stop()
		anims.judgement:Play(0,1)
		hum.WalkSpeed = 0
		hum.JumpPower = 0
		--
		remote:FireClient(plr,Vector3.new(0,-1.3,0),1.65)
		--
		if math.random(1,2) == 1 then
			sfx(7007957247,3)
		else
			sfx(7007957795,3)
		end
		for _,v in pairs(getnearplayers(root.Position,60))do
			textremote:FireClient(v,'Judgement!',3.1)
		end
		--
		task.wait(1.967)
		--
		root.Anchored = true
		--
		local params = RaycastParams.new()
		params.FilterType = Enum.RaycastFilterType.Exclude
		params.FilterDescendantsInstances = {char,workspace.Terrain} or {char}
		--
		if bool == false then
			local magnitude = (thingy-root.Position).Magnitude
			local currentcf = CFrame.new(root.Position,thingy+Vector3.new(0,3,0))
			for i = 1,math.abs(magnitude/4.5) do
				local result = workspace:Raycast(currentcf.Position+Vector3.new(0,12,0),Vector3.new(0,-50,0),params)
				if result then
					local shockwave = assets:WaitForChild('ShockWave'):Clone()
					shockwave.Parent = workspace.Terrain or workspace
					shockwave.CFrame = currentcf
					spawn(function()
						local w = Random.new():NextNumber(2.5,3.5)
						local w2 = Random.new():NextNumber(2.5,3.5)
						local w3 = Random.new():NextNumber(2.5,3.5)
						local cf = shockwave.CFrame*CFrame.new(-1,0,0)
						rockmodule2.Ground(cf.Position+Vector3.new(0,12,0),50,Vector3.new(w,w2,w3),false,3,params)
					end)
					spawn(function()
						local w = Random.new():NextNumber(2.5,3.5)
						local w2 = Random.new():NextNumber(2.5,3.5)
						local w3 = Random.new():NextNumber(2.5,3.5)
						local cf = shockwave.CFrame*CFrame.new(1,0,0)
						rockmodule2.Ground(cf.Position+Vector3.new(0,12,0),50,Vector3.new(w,w2,w3),false,3,params)
					end)
					shockwave.ParticleEmitter:Emit(3)
					game:GetService("Debris"):AddItem(shockwave,1.5)
				end
				--
				currentcf = currentcf*CFrame.new(0,0,-4.5)
			end
			--
			root.CFrame = CFrame.new(thingy+Vector3.new(0,3,0))
			remote:FireClient(plr,Vector3.new(0,1.5,0),0.1)
			sfx(6996368591,2)
			local shine = assets:WaitForChild('Shine'):Clone()
			shine.Parent = workspace.Terrain or workspace
			shine.CFrame = root.CFrame
			for _,v in pairs(shine.Attachment:GetChildren())do
				v:Emit(1)
			end
			shake(0.3,20,1,3,0,0.15)
			game:GetService("Debris"):AddItem(shine,0.6)
			task.wait(2.2-1.967)
			remote:FireClient(plr,Vector3.new(0,-1.2,0),0.3)
			root.Anchored = false
			task.wait(2.6-2.2)
			sfx(6870001600)
			remote:FireClient(plr,Vector3.new(0,2.25,0),(4-2.6))
			task.wait(4-2.6)
			anims.judgement:Stop()
			anims.idle:Play(0.1,1)
			task.wait()
			hum.WalkSpeed = 16
			hum.JumpPower = 50
			deb = false
			iframe:Destroy()
		elseif bool == true then
			local targetroot = nil
			if thingy then
				targetroot = thingy:FindFirstChild("HumanoidRootPart") or thingy:FindFirstChild("Torso") or thingy:FindFirstChildOfClass("BasePart")
			end
			if thingy then
				local magnitude = (targetroot.Position-root.Position).Magnitude
				local currentcf = CFrame.new(root.Position,(targetroot.CFrame*CFrame.new(0,0,-5.35)).Position)
				for i = 1,math.abs(magnitude/4.5) do
					local result = workspace:Raycast(currentcf.Position+Vector3.new(0,12,0),Vector3.new(0,-50,0),params)
					if result then
						local shockwave = assets:WaitForChild('ShockWave'):Clone()
						shockwave.Parent = workspace.Terrain or workspace
						shockwave.CFrame = currentcf
						spawn(function()
							local w = Random.new():NextNumber(2.5,3.5)
							local w2 = Random.new():NextNumber(2.5,3.5)
							local w3 = Random.new():NextNumber(2.5,3.5)
							local cf = shockwave.CFrame*CFrame.new(-1,0,0)
							rockmodule2.Ground(cf.Position+Vector3.new(0,12,0),50,Vector3.new(w,w2,w3),false,3,params)
						end)
						spawn(function()
							local w = Random.new():NextNumber(2.5,3.5)
							local w2 = Random.new():NextNumber(2.5,3.5)
							local w3 = Random.new():NextNumber(2.5,3.5)
							local cf = shockwave.CFrame*CFrame.new(1,0,0)
							rockmodule2.Ground(cf.Position+Vector3.new(0,12,0),50,Vector3.new(w,w2,w3),false,3,params)
						end)
						shockwave.ParticleEmitter:Emit(3)
						game:GetService("Debris"):AddItem(shockwave,1.5)
					end
					--
					currentcf = currentcf*CFrame.new(0,0,-4.5)
				end
			end
			--
			if thingy then
				if targetroot then
					root.CFrame = CFrame.new((targetroot.CFrame*CFrame.new(0,0,-5.5)).Position,targetroot.Position)
				end
			end
			sfx(6996368591,2)
			if thingy then
				if targetroot then
					targetroot.Anchored = true
				end
			end
			shake(0.3,20,1,3,0,0.15)
			task.wait(2.2-1.967)
			root.Anchored = false
			root.Velocity = Vector3.new(0,0,0)
			local shine = assets:WaitForChild('Shine'):Clone()
			shine.Parent = workspace.Terrain or workspace
			shine.CFrame = root.CFrame
			for _,v in pairs(shine.Attachment:GetChildren())do
				v:Emit(1)
			end
			game:GetService("Debris"):AddItem(shine,0.6)
			sfx(7007956313,2.5)
			if thingy then
				if targetroot then
					if thingy:FindFirstChildOfClass("Humanoid") then
						targetroot.Anchored = false
						local explode = assets:WaitForChild('ExplodeJudgement'):Clone()
						explode.Parent = workspace.Terrain or workspace
						explode:SetPrimaryPartCFrame(targetroot.CFrame)
						explode.Script.Disabled = false
						shake(1.2,65,15,23,0,1)
						for _,v in pairs(getnearplayers(root.Position,35))do
							local eff = assets:WaitForChild('Effects'):Clone()
							eff.Parent = v:FindFirstChildOfClass("Backpack")
							eff.Disabled = false
						end
						local velo = Instance.new("BodyVelocity",targetroot)
						velo.MaxForce = Vector3.new(1,1,1) * math.huge
						velo.Velocity = root.CFrame.LookVector * 80 + Vector3.new(0,65,0)
						game:GetService("Debris"):AddItem(velo,0.425)
						local velo2 = Instance.new("BodyVelocity",root)
						velo2.MaxForce = Vector3.new(1,1,1) * math.huge
						velo2.Velocity = -root.CFrame.LookVector * 50
						game:GetService("Debris"):AddItem(velo2,0.425)
						if breakjoints == false then
							thingy:FindFirstChildOfClass("Humanoid").Health = thingy:FindFirstChildOfClass("Humanoid").Health - thingy:FindFirstChildOfClass("Humanoid").MaxHealth/2.25
						else
							thingy:BreakJoints()
						end
					end
				end
			end
			task.wait(2.6-2.2)
			sfx(6870001600)
			task.wait(4-2.6)
			anims.judgement:Stop()
			anims.idle:Play(0.1,1)
			task.wait()
			hum.WalkSpeed = 16
			hum.JumpPower = 50
			deb = false
			iframe:Destroy()
		end
	elseif type == "M1" then
		if char:FindFirstChildOfClass("Tool") then return end
		if hum:GetState() == Enum.HumanoidStateType.Seated then return end
		if deb == true then return end
		if deb2 == true then return end
		if combo == 1 then
			deb = true
			combo = 2
			anims.walk:Stop()
			anims.idle:Stop()
			anims.fist1:Play(0,1)
			hum.WalkSpeed = 0
			hum.JumpPower = 0
			sfx(6870001262,2)
			if math.random(1,4) == 1 then
				sfx(7007963665,3)
				for _,v in pairs(getnearplayers(root.Position,35))do
					textremote:FireClient(v,'Prepare thyself!',3.1)
				end
			elseif math.random(1,4) == 2 then
				sfx(7007965897,3)
				for _,v in pairs(getnearplayers(root.Position,35))do
					textremote:FireClient(v,'Thy end is now!',3.1)
				end
			elseif math.random(1,4) == 3 then
				sfx(7007966515,3)
				for _,v in pairs(getnearplayers(root.Position,35))do
					textremote:FireClient(v,'Thy end is now!',3.1)
				end
			else
				sfx(7007964643,3)
				for _,v in pairs(getnearplayers(root.Position,35))do
					textremote:FireClient(v,'Prepare thyself!',3.1)
				end
			end
			local shine = assets:WaitForChild('Shine'):Clone()
			shine.Parent = workspace.Terrain or workspace
			shine.CFrame = root.CFrame
			for _,v in pairs(shine.Attachment:GetChildren())do
				v:Emit(1)
			end
			game:GetService("Debris"):AddItem(shine,0.6)
			task.wait(0.45)
			shake(0.2,20,1,3,0,0.05)
			sfx(6996368591,1)
			local done = false
			local velo = Instance.new("BodyVelocity",root)
			velo.MaxForce = Vector3.new(1,1,1) * math.huge
			velo.Velocity = root.CFrame.LookVector * 35
			game:GetService("Debris"):AddItem(velo,0.25)
			spawn(function()
				for _,v in pairs(game:GetService('Players'):GetPlayers())do
					local eff = assets:WaitForChild('TrailHandler2'):Clone()
					eff:WaitForChild('Bone').Value = fingersleft
					eff:WaitForChild('Duration').Value = 0.767-0.45
					eff:WaitForChild('Character').Value = char
					eff.Parent = v:FindFirstChildOfClass("Backpack")
					--
					eff.Disabled = false
				end
			end)
			spawn(function()
				while task.wait() do
					if done == false then
						local cf = root.CFrame*CFrame.new(0,0,-6.5)
						for _,v in pairs(getnearobjects(cf.Position,13.5,char))do
							if not v:FindFirstChild("IFrame") then
								if not v:FindFirstChild("HitTagMinosPrime") then
									local tag = Instance.new("BoolValue",v)
									tag.Name = "HitTagMinosPrime"
									local targethum = v:FindFirstChildOfClass("Humanoid")
									local targetroot = v:FindFirstChild("HumanoidRootPart") or v:FindFirstChild("Torso") or v:FindFirstChildOfClass("Part")
									local velo2 = Instance.new("BodyVelocity",targetroot)
									velo2.MaxForce = Vector3.new(1,1,1) * math.huge
									velo2.Velocity = root.CFrame.LookVector * 30
									game:GetService("Debris"):AddItem(velo2,0.25)
									if breakjoints == true then
										v:BreakJoints()
									else
										targethum.Health = targethum.Health - targethum.MaxHealth/5
									end
									game:GetService("Debris"):AddItem(tag,0.767-0.433)
								end
							end
						end
					else
						break
					end
				end
			end)
			task.wait(0.767-0.45)
			done = true
			anims.fist1:Stop()
			anims.idle:Play(0.135,1)
			task.wait(0.135)
			hum.WalkSpeed = 16
			hum.JumpPower = 50
			deb = false
		elseif combo == 2 then
			deb = true
			combo = 3
			anims.walk:Stop()
			anims.idle:Stop()
			anims.fist2:Play(0,1)
			hum.WalkSpeed = 0
			hum.JumpPower = 0
			sfx(6870001262,2)
			local shine = assets:WaitForChild('Shine'):Clone()
			shine.Parent = workspace.Terrain or workspace
			shine.CFrame = root.CFrame
			for _,v in pairs(shine.Attachment:GetChildren())do
				v:Emit(1)
			end
			game:GetService("Debris"):AddItem(shine,0.6)
			task.wait(0.333)
			shake(0.2,20,1,3,0,0.05)
			sfx(6996368591,1)
			local done = false
			local velo = Instance.new("BodyVelocity",root)
			velo.MaxForce = Vector3.new(1,1,1) * math.huge
			velo.Velocity = root.CFrame.LookVector * 35
			game:GetService("Debris"):AddItem(velo,0.25)
			spawn(function()
				for _,v in pairs(game:GetService('Players'):GetPlayers())do
					local eff = assets:WaitForChild('TrailHandler2'):Clone()
					eff:WaitForChild('Bone').Value = fingersleft
					eff:WaitForChild('Duration').Value = 0.6-0.333
					eff:WaitForChild('Character').Value = char
					eff.Parent = v:FindFirstChildOfClass("Backpack")
					--
					eff.Disabled = false
				end
			end)
			spawn(function()
				while task.wait() do
					if done == false then
						local cf = root.CFrame*CFrame.new(0,0,-6.5)
						for _,v in pairs(getnearobjects(cf.Position,13.5,char))do
							if not v:FindFirstChild("IFrame") then
								if not v:FindFirstChild("HitTagMinosPrime") then
									local tag = Instance.new("BoolValue",v)
									tag.Name = "HitTagMinosPrime"
									local targethum = v:FindFirstChildOfClass("Humanoid")
									local targetroot = v:FindFirstChild("HumanoidRootPart") or v:FindFirstChild("Torso") or v:FindFirstChildOfClass("Part")
									local velo2 = Instance.new("BodyVelocity",targetroot)
									velo2.MaxForce = Vector3.new(1,1,1) * math.huge
									velo2.Velocity = root.CFrame.LookVector * 30
									game:GetService("Debris"):AddItem(velo2,0.25)
									if breakjoints == true then
										v:BreakJoints()
									else
										targethum.Health = targethum.Health - targethum.MaxHealth/5
									end
									game:GetService("Debris"):AddItem(tag,0.767-0.433)
								end
							end
						end
					else
						break
					end
				end
			end)
			task.wait(0.6-0.333)
			done = true
			task.wait(0.763-0.6)
			anims.fist2:Stop()
			anims.idle:Play(0.2,1)
			hum.WalkSpeed = 16
			hum.JumpPower = 50
			deb = false
		elseif combo == 3 then
			deb = true
			combo = 4
			anims.walk:Stop()
			anims.idle:Stop()
			anims.fist3:Play(0.1,1)
			hum.WalkSpeed = 0
			hum.JumpPower = 0
			sfx(6870001262,2)
			local shine = assets:WaitForChild('Shine'):Clone()
			shine.Parent = workspace.Terrain or workspace
			shine.CFrame = root.CFrame
			for _,v in pairs(shine.Attachment:GetChildren())do
				v:Emit(1)
			end
			game:GetService("Debris"):AddItem(shine,0.6)
			task.wait(0.5)
			shake(0.2,20,1,3,0,0.05)
			sfx(6996368591,1)
			local done = false
			local velo = Instance.new("BodyVelocity",root)
			velo.MaxForce = Vector3.new(1,1,1) * math.huge
			velo.Velocity = root.CFrame.LookVector * 35
			game:GetService("Debris"):AddItem(velo,0.25)
			spawn(function()
				for _,v in pairs(game:GetService('Players'):GetPlayers())do
					local eff = assets:WaitForChild('TrailHandler2'):Clone()
					eff:WaitForChild('Bone').Value = fingersleft
					eff:WaitForChild('Duration').Value = 0.8-0.5
					eff:WaitForChild('Character').Value = char
					eff.Parent = v:FindFirstChildOfClass("Backpack")
					--
					eff.Disabled = false
				end
			end)
			spawn(function()
				while task.wait() do
					if done == false then
						local cf = root.CFrame*CFrame.new(0,0,-6.5)
						for _,v in pairs(getnearobjects(cf.Position,13.5,char))do
							if not v:FindFirstChild("IFrame") then
								if not v:FindFirstChild("HitTagMinosPrime") then
									local tag = Instance.new("BoolValue",v)
									tag.Name = "HitTagMinosPrime"
									local targethum = v:FindFirstChildOfClass("Humanoid")
									local targetroot = v:FindFirstChild("HumanoidRootPart") or v:FindFirstChild("Torso") or v:FindFirstChildOfClass("Part")
									local velo2 = Instance.new("BodyVelocity",targetroot)
									velo2.MaxForce = Vector3.new(1,1,1) * math.huge
									velo2.Velocity = root.CFrame.LookVector * 30
									game:GetService("Debris"):AddItem(velo2,0.25)
									if breakjoints == true then
										v:BreakJoints()
									else
										targethum.Health = targethum.Health - targethum.MaxHealth/5
									end
									game:GetService("Debris"):AddItem(tag,0.767-0.433)
								end
							end
						end
					else
						break
					end
				end
			end)
			task.wait(0.8-0.5)
			done = true
			task.wait(1-0.8)
			anims.fist3:Stop()
			anims.idle:Play(0.2,1)
			hum.WalkSpeed = 16
			hum.JumpPower = 50
			deb = false
		elseif combo == 4 then
			deb = true
			combo = 1
			anims.walk:Stop()
			anims.idle:Stop()
			anims.fist4:Play(0.1,1)
			hum.WalkSpeed = 0
			hum.JumpPower = 0
			sfx(6870001262,2)
			local shine = assets:WaitForChild('Shine'):Clone()
			shine.Parent = workspace.Terrain or workspace
			shine.CFrame = root.CFrame
			for _,v in pairs(shine.Attachment:GetChildren())do
				v:Emit(1)
			end
			game:GetService("Debris"):AddItem(shine,0.6)
			task.wait(0.467)
			shake(0.2,20,1,3,0,0.05)
			sfx(6996368591,1)
			local done = false
			local velo = Instance.new("BodyVelocity",root)
			velo.MaxForce = Vector3.new(1,1,1) * math.huge
			velo.Velocity = root.CFrame.LookVector * 35
			game:GetService("Debris"):AddItem(velo,0.25)
			spawn(function()
				for _,v in pairs(game:GetService('Players'):GetPlayers())do
					local eff = assets:WaitForChild('TrailHandler2'):Clone()
					eff:WaitForChild('Bone').Value = fingersleft
					eff:WaitForChild('Duration').Value = 0.55-0.467
					eff:WaitForChild('Character').Value = char
					eff.Parent = v:FindFirstChildOfClass("Backpack")
					--
					eff.Disabled = false
				end
			end)
			spawn(function()
				while task.wait() do
					if done == false then
						local cf = root.CFrame*CFrame.new(0,0,-6.5)
						for _,v in pairs(getnearobjects(cf.Position,13.5,char))do
							if not v:FindFirstChild("IFrame") then
								if not v:FindFirstChild("HitTagMinosPrime") then
									local tag = Instance.new("BoolValue",v)
									tag.Name = "HitTagMinosPrime"
									local targethum = v:FindFirstChildOfClass("Humanoid")
									local targetroot = v:FindFirstChild("HumanoidRootPart") or v:FindFirstChild("Torso") or v:FindFirstChildOfClass("Part")
									local velo2 = Instance.new("BodyVelocity",targetroot)
									velo2.MaxForce = Vector3.new(1,1,1) * math.huge
									velo2.Velocity = root.CFrame.LookVector * 30
									game:GetService("Debris"):AddItem(velo2,0.25)
									if breakjoints == true then
										v:BreakJoints()
									else
										targethum.Health = targethum.Health - targethum.MaxHealth/5
									end
									game:GetService("Debris"):AddItem(tag,0.767-0.433)
								end
							end
						end
					else
						break
					end
				end
			end)
			task.wait(0.55-0.467)
			done = true
			task.wait(0.867-0.55)
			sfx(7007956313,2)
			shake(0.2,30,3,5,0,0.15)
			local params = RaycastParams.new()
			params.FilterType = Enum.RaycastFilterType.Exclude
			params.FilterDescendantsInstances = {workspace.Terrain,char} or {char}
			spawn(function()
				local currentcf = root.CFrame*CFrame.new(0,0,-10)
				local shockwave = assets:WaitForChild('ShockWave'):Clone()
				shockwave.Parent = workspace.Terrain or workspace
				shockwave.CFrame = currentcf
				spawn(function()
					local w = Random.new():NextNumber(2.5,3.5)
					local w2 = Random.new():NextNumber(2.5,3.5)
					local w3 = Random.new():NextNumber(2.5,3.5)
					local cf = shockwave.CFrame*CFrame.new(-1,0,0)
					rockmodule2.Ground(cf.Position+Vector3.new(0,12,0),50,Vector3.new(w,w2,w3),false,3,params)
				end)
				spawn(function()
					local w = Random.new():NextNumber(2.5,3.5)
					local w2 = Random.new():NextNumber(2.5,3.5)
					local w3 = Random.new():NextNumber(2.5,3.5)
					local cf = shockwave.CFrame*CFrame.new(1,0,0)
					rockmodule2.Ground(cf.Position+Vector3.new(0,12,0),50,Vector3.new(w,w2,w3),false,3,params)
				end)
				shockwave.ParticleEmitter:Emit(3)
				game:GetService("Debris"):AddItem(shockwave,1.5)
			end)
			spawn(function()
				local currentcf = root.CFrame*CFrame.new(0,0,-12)
				local shockwave = assets:WaitForChild('ShockWave'):Clone()
				shockwave.Parent = workspace.Terrain or workspace
				shockwave.CFrame = currentcf
				spawn(function()
					local w = Random.new():NextNumber(2.5,3.5)
					local w2 = Random.new():NextNumber(2.5,3.5)
					local w3 = Random.new():NextNumber(2.5,3.5)
					local cf = shockwave.CFrame*CFrame.new(-1,0,0)
					rockmodule2.Ground(cf.Position+Vector3.new(0,12,0),50,Vector3.new(w,w2,w3),false,3,params)
				end)
				spawn(function()
					local w = Random.new():NextNumber(2.5,3.5)
					local w2 = Random.new():NextNumber(2.5,3.5)
					local w3 = Random.new():NextNumber(2.5,3.5)
					local cf = shockwave.CFrame*CFrame.new(1,0,0)
					rockmodule2.Ground(cf.Position+Vector3.new(0,12,0),50,Vector3.new(w,w2,w3),false,3,params)
				end)
				shockwave.ParticleEmitter:Emit(3)
				game:GetService("Debris"):AddItem(shockwave,1.5)
			end)
			spawn(function()
				local currentcf = root.CFrame*CFrame.new(0,0,-13)
				local shockwave = assets:WaitForChild('ShockWave'):Clone()
				shockwave.Parent = workspace.Terrain or workspace
				shockwave.CFrame = currentcf
				spawn(function()
					local w = Random.new():NextNumber(2.5,3.5)
					local w2 = Random.new():NextNumber(2.5,3.5)
					local w3 = Random.new():NextNumber(2.5,3.5)
					local cf = shockwave.CFrame*CFrame.new(-1,0,0)
					rockmodule2.Ground(cf.Position+Vector3.new(0,12,0),50,Vector3.new(w,w2,w3),false,3,params)
				end)
				spawn(function()
					local w = Random.new():NextNumber(2.5,3.5)
					local w2 = Random.new():NextNumber(2.5,3.5)
					local w3 = Random.new():NextNumber(2.5,3.5)
					local cf = shockwave.CFrame*CFrame.new(1,0,0)
					rockmodule2.Ground(cf.Position+Vector3.new(0,12,0),50,Vector3.new(w,w2,w3),false,3,params)
				end)
				shockwave.ParticleEmitter:Emit(3)
				game:GetService("Debris"):AddItem(shockwave,1.5)
			end)
			spawn(function()
				local cf = root.CFrame*CFrame.new(0,0,-6.5)
				for _,v in pairs(getnearobjects(cf.Position,13.5,char))do
					if not v:FindFirstChild("IFrame") then
						if not v:FindFirstChild("HitTagMinosPrime") then
							local tag = Instance.new("BoolValue",v)
							tag.Name = "HitTagMinosPrime"
							local targethum = v:FindFirstChildOfClass("Humanoid")
							local targetroot = v:FindFirstChild("HumanoidRootPart") or v:FindFirstChild("Torso") or v:FindFirstChildOfClass("Part")
							local velo2 = Instance.new("BodyVelocity",targetroot)
							velo2.MaxForce = Vector3.new(1,1,1) * math.huge
							velo2.Velocity = root.CFrame.LookVector * 30+Vector3.new(0,50,0)
							game:GetService("Debris"):AddItem(velo2,0.25)
							if breakjoints == true then
								v:BreakJoints()
							else
								targethum.Health = targethum.Health - targethum.MaxHealth/5
							end
							game:GetService("Debris"):AddItem(tag,0.767-0.433)
						end
					end
				end
			end)
			task.wait(1.217-0.867)
			anims.fist4:Stop()
			anims.idle:Play(0.2,1)
			hum.WalkSpeed = 16
			hum.JumpPower = 50
			deb = false
		end
	elseif type == "dash" then
		if deb == true then return end
		if deb2 == true then return end
		deb2 = true
		root.Anchored = true
		local params = RaycastParams.new()
		params.FilterType = Enum.RaycastFilterType.Exclude
		params.FilterDescendantsInstances = {char,workspace.Terrain} or {char}
		--
		local magnitude = (thingy-root.Position).Magnitude
		local currentcf = CFrame.new(root.Position,thingy+Vector3.new(0,3,0))
		for i = 1,math.abs(magnitude/4.5) do
			local result = workspace:Raycast(currentcf.Position+Vector3.new(0,12,0),Vector3.new(0,-50,0),params)
			if result then
				local shockwave = assets:WaitForChild('ShockWave'):Clone()
				shockwave.Parent = workspace.Terrain or workspace
				shockwave.CFrame = currentcf
				spawn(function()
					local w = Random.new():NextNumber(2.5,3.5)
					local w2 = Random.new():NextNumber(2.5,3.5)
					local w3 = Random.new():NextNumber(2.5,3.5)
					local cf = shockwave.CFrame*CFrame.new(-1,0,0)
					rockmodule2.Ground(cf.Position+Vector3.new(0,12,0),50,Vector3.new(w,w2,w3),false,3,params)
				end)
				spawn(function()
					local w = Random.new():NextNumber(2.5,3.5)
					local w2 = Random.new():NextNumber(2.5,3.5)
					local w3 = Random.new():NextNumber(2.5,3.5)
					local cf = shockwave.CFrame*CFrame.new(1,0,0)
					rockmodule2.Ground(cf.Position+Vector3.new(0,12,0),50,Vector3.new(w,w2,w3),false,3,params)
				end)
				shockwave.ParticleEmitter:Emit(3)
				game:GetService("Debris"):AddItem(shockwave,1.5)
			end
			--
			currentcf = currentcf*CFrame.new(0,0,-4.5)
		end
		--
		root.CFrame = CFrame.new(thingy+Vector3.new(0,3,0))
		shake(0.3,20,1,3,0,0.15)
		sfx(6870001262,2.5)
		task.wait()
		root.Anchored = false
		deb2 = false
	elseif type == "seeking" then
		if deb2 then return end
		if deb then return end
		deb = true
		hum.WalkSpeed = 0
		hum.JumpPower = 0
		anims.idle:Stop()
		anims.walk:Stop()
		anims.serpent:Play(0,1)
		sfx(6870001262,2)
		local shine = assets:WaitForChild('Shine'):Clone()
		shine.Parent = workspace.Terrain or workspace
		shine.CFrame = root.CFrame
		for _,v in pairs(shine.Attachment:GetChildren())do
			v:Emit(1)
		end
		game:GetService("Debris"):AddItem(shine,0.6)
		if math.random(1,3) == 1 then
			sfx(7007955031,3)
			for _,v in pairs(getnearplayers(root.Position,50))do
				textremote:FireClient(v,'Die!',2.5)
			end
		end
		--
		task.wait(0.8)
		shake(0.2,20,1,3,0,0.05)
		sfx(6996368591,1.25)
		if bool == true then
			local serpent = assets:WaitForChild('Serpent'):Clone()
			serpent.Parent = workspace.Terrain or workspace
			serpent.CFrame = root.CFrame*CFrame.new(0,0,-6)
			serpent.Trail2.Enabled = true
			game:GetService('Debris'):AddItem(serpent,8)
			local velo = Instance.new("BodyVelocity",serpent)
			velo.MaxForce = Vector3.new(1,1,1) * math.huge
			local gyro = Instance.new("BodyGyro",serpent)
			gyro.MaxTorque = Vector3.new(1,1,1) * math.huge
			gyro.P = 8000
			spawn(function()
				while task.wait() do
					if serpent then
						if velo and gyro then
							if thingy then
								gyro.CFrame = CFrame.lookAt(serpent.Position,thingy.Position)
								velo.Velocity = (thingy.Position - serpent.Position).Unit*90
							else
								serpent.Serpent.Transparency = 1
								serpent.Anchored = true
								game:GetService("Debris"):AddItem(serpent,1)
								break
							end
						else
							break
						end
					else
						break
					end
				end
			end)
			local done = false
			serpent.Anchored = false
			serpent.Touched:Connect(function(hit)
				if done then return end
				if hit.Parent then
					if hit.Parent:FindFirstChildOfClass("Humanoid") and hit.Parent ~= char then
						done = true
						serpent.Serpent.Transparency = 1
						serpent.Anchored = true
						game:GetService("Debris"):AddItem(serpent,1)
						local explode = assets:WaitForChild('Explode'):Clone()
						explode.Parent = workspace.Terrain or workspace
						explode:SetPrimaryPartCFrame(hit.CFrame)
						explode.Script.Disabled = false
						sfx(7007956313,1.5,hit)
						if breakjoints == true then
							hit.Parent:BreakJoints()
						elseif breakjoints == false then
							hit.Parent:FindFirstChildOfClass("Humanoid").Health = hit.Parent:FindFirstChildOfClass("Humanoid").Health - hit.Parent:FindFirstChildOfClass("Humanoid").MaxHealth/5
						end
					end
				end
			end)
		elseif bool == false then
			local serpent = assets:WaitForChild('Serpent'):Clone()
			serpent.Parent = workspace.Terrain or workspace
			serpent.CFrame = root.CFrame*CFrame.new(0,0,-6)
			serpent.Trail2.Enabled = true
			game:GetService('Debris'):AddItem(serpent,8)
			local velo = Instance.new("BodyVelocity",serpent)
			velo.MaxForce = Vector3.new(1,1,1) * math.huge
			local gyro = Instance.new("BodyGyro",serpent)
			gyro.MaxTorque = Vector3.new(1,1,1) * math.huge
			gyro.P = 8000
			spawn(function()
				while task.wait() do
					if serpent then
						if (thingy-serpent.Position).Magnitude <= 3.35 then
							serpent.Serpent.Transparency = 1
							serpent.Anchored = true
							game:GetService("Debris"):AddItem(serpent,1)
							break
						else
							if velo and gyro then
								gyro.CFrame = CFrame.lookAt(serpent.Position,thingy)
								velo.Velocity = (thingy - serpent.Position).Unit*90
							else
								serpent.Serpent.Transparency = 1
								serpent.Anchored = true
								game:GetService("Debris"):AddItem(serpent,1)
								break
							end
						end
					else
						break
					end
				end
			end)
			serpent.Anchored = false
			local done = false
			serpent.Touched:Connect(function(hit)
				if done then return end
				if hit.Parent then
					if hit.Parent:FindFirstChildOfClass("Humanoid") and hit.Parent ~= char then
						done = true
						serpent.Serpent.Transparency = 1
						serpent.Anchored = true
						game:GetService("Debris"):AddItem(serpent,1)
						local explode = assets:WaitForChild('Explode'):Clone()
						explode.Parent = workspace.Terrain or workspace
						explode:SetPrimaryPartCFrame(hit.CFrame)
						explode.Script.Disabled = false
						sfx(7007956313,1.5,hit)
						if breakjoints == true then
							hit.Parent:BreakJoints()
						elseif breakjoints == false then
							hit.Parent:FindFirstChildOfClass("Humanoid").Health = hit.Parent:FindFirstChildOfClass("Humanoid").Health - hit.Parent:FindFirstChildOfClass("Humanoid").MaxHealth/5
						end
					end
				end
			end)
		end
		task.wait(1.25-0.8)
		anims.serpent:Stop()
		anims.idle:Play(0.15,1)
		task.wait(0.15)
		hum.WalkSpeed = 16
		hum.JumpPower = 50
		deb = false
	elseif type == "crush" then
		if deb2 then return end
		if deb then return end
		deb = true
		anims.walk:Stop()
		anims.idle:Stop()
		anims.fist4:Play(0.1,1)
		hum.WalkSpeed = 0
		hum.JumpPower = 0
		sfx(6870001262,2)
		spawn(function()
			local shine = assets:WaitForChild('Shine'):Clone()
			shine.Parent = workspace.Terrain or workspace
			shine.CFrame = root.CFrame
			for _,v in pairs(shine.Attachment:GetChildren())do
				v:Emit(1)
			end
			game:GetService("Debris"):AddItem(shine,0.6)
		end)
		task.wait(0.467)
		shake(0.2,20,1,3,0,0.05)
		sfx(6996368591,1)
		local done = false
		task.wait(0.55-0.467)
		done = true
		task.wait(0.867-0.55)
		sfx(7007956313,2)
		shake(0.2,30,3,5,0,0.15)
		local funnypos = root.Position + Vector3.new(0,200,0)
		local params = RaycastParams.new()
		params.FilterType = Enum.RaycastFilterType.Exclude
		params.FilterDescendantsInstances = {workspace.Terrain,char} or {char}
		spawn(function()
			local currentcf = root.CFrame*CFrame.new(0,0,-10)
			local shockwave = assets:WaitForChild('ShockWave'):Clone()
			shockwave.Parent = workspace.Terrain or workspace
			shockwave.CFrame = currentcf
			spawn(function()
				local w = Random.new():NextNumber(2.5,3.5)
				local w2 = Random.new():NextNumber(2.5,3.5)
				local w3 = Random.new():NextNumber(2.5,3.5)
				local cf = shockwave.CFrame*CFrame.new(-1,0,0)
				rockmodule2.Ground(cf.Position+Vector3.new(0,12,0),50,Vector3.new(w,w2,w3),false,3,params)
			end)
			spawn(function()
				local w = Random.new():NextNumber(2.5,3.5)
				local w2 = Random.new():NextNumber(2.5,3.5)
				local w3 = Random.new():NextNumber(2.5,3.5)
				local cf = shockwave.CFrame*CFrame.new(1,0,0)
				rockmodule2.Ground(cf.Position+Vector3.new(0,12,0),50,Vector3.new(w,w2,w3),false,3,params)
			end)
			shockwave.ParticleEmitter:Emit(3)
			game:GetService("Debris"):AddItem(shockwave,1.5)
		end)
		spawn(function()
			local currentcf = root.CFrame*CFrame.new(0,0,-12)
			local shockwave = assets:WaitForChild('ShockWave'):Clone()
			shockwave.Parent = workspace.Terrain or workspace
			shockwave.CFrame = currentcf
			spawn(function()
				local w = Random.new():NextNumber(2.5,3.5)
				local w2 = Random.new():NextNumber(2.5,3.5)
				local w3 = Random.new():NextNumber(2.5,3.5)
				local cf = shockwave.CFrame*CFrame.new(-1,0,0)
				rockmodule2.Ground(cf.Position+Vector3.new(0,12,0),50,Vector3.new(w,w2,w3),false,3,params)
			end)
			spawn(function()
				local w = Random.new():NextNumber(2.5,3.5)
				local w2 = Random.new():NextNumber(2.5,3.5)
				local w3 = Random.new():NextNumber(2.5,3.5)
				local cf = shockwave.CFrame*CFrame.new(1,0,0)
				rockmodule2.Ground(cf.Position+Vector3.new(0,12,0),50,Vector3.new(w,w2,w3),false,3,params)
			end)
			shockwave.ParticleEmitter:Emit(3)
			game:GetService("Debris"):AddItem(shockwave,1.5)
		end)
		spawn(function()
			local currentcf = root.CFrame*CFrame.new(0,0,-13)
			local shockwave = assets:WaitForChild('ShockWave'):Clone()
			shockwave.Parent = workspace.Terrain or workspace
			shockwave.CFrame = currentcf
			spawn(function()
				local w = Random.new():NextNumber(2.5,3.5)
				local w2 = Random.new():NextNumber(2.5,3.5)
				local w3 = Random.new():NextNumber(2.5,3.5)
				local cf = shockwave.CFrame*CFrame.new(-1,0,0)
				rockmodule2.Ground(cf.Position+Vector3.new(0,12,0),50,Vector3.new(w,w2,w3),false,3,params)
			end)
			spawn(function()
				local w = Random.new():NextNumber(2.5,3.5)
				local w2 = Random.new():NextNumber(2.5,3.5)
				local w3 = Random.new():NextNumber(2.5,3.5)
				local cf = shockwave.CFrame*CFrame.new(1,0,0)
				rockmodule2.Ground(cf.Position+Vector3.new(0,12,0),50,Vector3.new(w,w2,w3),false,3,params)
			end)
			shockwave.ParticleEmitter:Emit(3)
			game:GetService("Debris"):AddItem(shockwave,1.5)
		end)
		local velos = {}
		local targets = {}
		spawn(function()
			local cf = root.CFrame*CFrame.new(0,0,-6.5)
			for _,v in pairs(getnearobjects(cf.Position,13.5,char))do
				if not v:FindFirstChild("IFrame") then
					if not v:FindFirstChild("HitTagMinosPrime") then
						local tag = Instance.new("BoolValue",v)
						tag.Name = "HitTagMinosPrime"
						table.insert(targets,v)
						local targethum = v:FindFirstChildOfClass("Humanoid")
						local targetroot = v:FindFirstChild("HumanoidRootPart") or v:FindFirstChild("Torso") or v:FindFirstChildOfClass("Part")
						local velo2 = Instance.new("BodyPosition",targetroot)
						velo2.MaxForce = Vector3.new(1,1,1) * math.huge
						velo2.Position = funnypos
						game:GetService("Debris"):AddItem(velo2,3)
						table.insert(velos,velo2)
						if breakjoints == true then
							v:BreakJoints()
						else
							targethum.Health = targethum.Health - targethum.MaxHealth/5
						end
						game:GetService("Debris"):AddItem(tag,0.767-0.433)
					end
				end
			end
		end)
		task.wait(1.217-0.867)
		anims.fist4:Stop()
		anims.crush:Play(0,1)
		task.wait(0.233)
		sfx(6870001600,2)
		shake(0.2,30,3,5,0,0.15)
		local veloz = Instance.new("BodyPosition",root)
		veloz.MaxForce = Vector3.new(1,1,1) * math.huge
		veloz.Position = funnypos
		spawn(function()
			for _,v in pairs(game:GetService('Players'):GetPlayers())do
				local eff = assets:WaitForChild('TrailHandler'):Clone()
				eff:WaitForChild('Bone').Value = fingersleft
				eff:WaitForChild('Duration').Value = 1.467-0.233
				eff:WaitForChild('Character').Value = char
				eff.Parent = v:FindFirstChildOfClass("Backpack")
				--
				eff.Disabled = false
			end
		end)
		task.wait(1.467-0.233)
		spawn(function()
			local shine = assets:WaitForChild('Shine'):Clone()
			shine.Parent = workspace.Terrain or workspace
			shine.CFrame = root.CFrame
			for _,v in pairs(shine.Attachment:GetChildren())do
				v:Emit(1)
			end
			game:GetService("Debris"):AddItem(shine,0.6)
		end)
		sfx(6870001262,1.5)
		task.wait(1.933-1.467)
		if math.random(1,2) == 1 then
			sfx(7007954282,3)
			for _,v in pairs(getnearplayers(root.Position,135))do
				textremote:FireClient(v,'Crush!',2.5)
			end
		else
			if math.random(1,2) == 1 then
				sfx(7007955646,3)
				for _,v in pairs(getnearplayers(root.Position,135))do
					textremote:FireClient(v,'Die!',2.5)
				end
			else
				sfx(007955031,3)
				for _,v in pairs(getnearplayers(root.Position,135))do
					textremote:FireClient(v,'Die!',2.5)
				end
			end
		end
		spawn(function()
			for _,v in pairs(game:GetService('Players'):GetPlayers())do
				local eff = assets:WaitForChild('TrailHandler2'):Clone()
				eff:WaitForChild('Bone').Value = fingersleft
				eff:WaitForChild('Duration').Value = 0.15
				eff:WaitForChild('Character').Value = char
				eff.Parent = v:FindFirstChildOfClass("Backpack")
				--
				eff.Disabled = false
			end
		end)
		sfx(6996368591,2.5)
		shake(0.2,30,3,5,0,0.15)
		for _,v in pairs(velos)do
			v:Destroy()
		end
		for _,v in pairs(targets)do
			local targethum = v:FindFirstChildOfClass("Humanoid")
			local targetroot = v:FindFirstChild("HumanoidRootPart") or v:FindFirstChild("Torso") or v:FindFirstChildOfClass("Part")
			targethum.Health = targethum.Health - targethum.MaxHealth/4.5
			local velor = Instance.new("BodyVelocity",targetroot)
			velor.MaxForce = Vector3.new(1,1,1) * math.huge
			velor.Velocity = root.CFrame.LookVector * 6.5 + Vector3.new(0,-120,0)
			game:GetService("Debris"):AddItem(velor,0.1)
		end
		task.wait(2.933-1.933)
		if veloz then
			veloz:Destroy()
		end
		local result = workspace:Raycast(root.Position,Vector3.new(0,-1000,0),params)
		if result then
			local pos = result.Position+Vector3.new(0,3.5,0)
			root.Anchored = true
			root.CFrame = CFrame.new(pos)
			root.Velocity = Vector3.new(0,0,0)
			shake(0.6,30,15,25,0,0.5)
			sfx(7007956313,5)
			local explode = assets:WaitForChild('ExplodeCrush'):Clone()
			explode.Parent = workspace.Terrain or workspace
			explode.Value.Value = char
			explode:SetPrimaryPartCFrame(CFrame.new(pos))
			explode.Script.Disabled = false
			spawn(function()
				local currentcf = CFrame.new(pos)*CFrame.new(0,0,-2)
				local shockwave = assets:WaitForChild('ShockWave'):Clone()
				shockwave.Parent = workspace.Terrain or workspace
				shockwave.CFrame = currentcf
				spawn(function()
					local w = Random.new():NextNumber(2.5,3.5)
					local w2 = Random.new():NextNumber(2.5,3.5)
					local w3 = Random.new():NextNumber(2.5,3.5)
					local cf = shockwave.CFrame*CFrame.new(-1,0,0)
					rockmodule2.Ground(cf.Position+Vector3.new(0,12,0),50,Vector3.new(w,w2,w3),false,3,params)
				end)
				spawn(function()
					local w = Random.new():NextNumber(2.5,3.5)
					local w2 = Random.new():NextNumber(2.5,3.5)
					local w3 = Random.new():NextNumber(2.5,3.5)
					local cf = shockwave.CFrame*CFrame.new(1,0,0)
					rockmodule2.Ground(cf.Position+Vector3.new(0,12,0),50,Vector3.new(w,w2,w3),false,3,params)
				end)
				shockwave.ParticleEmitter:Emit(3)
				game:GetService("Debris"):AddItem(shockwave,1.5)
			end)
			spawn(function()
				local currentcf = CFrame.new(pos)
				local shockwave = assets:WaitForChild('ShockWave'):Clone()
				shockwave.Parent = workspace.Terrain or workspace
				shockwave.CFrame = currentcf
				spawn(function()
					local w = Random.new():NextNumber(2.5,3.5)
					local w2 = Random.new():NextNumber(2.5,3.5)
					local w3 = Random.new():NextNumber(2.5,3.5)
					local cf = shockwave.CFrame*CFrame.new(-1,0,0)
					rockmodule2.Ground(cf.Position+Vector3.new(0,12,0),50,Vector3.new(w,w2,w3),false,3,params)
				end)
				spawn(function()
					local w = Random.new():NextNumber(2.5,3.5)
					local w2 = Random.new():NextNumber(2.5,3.5)
					local w3 = Random.new():NextNumber(2.5,3.5)
					local cf = shockwave.CFrame*CFrame.new(1,0,0)
					rockmodule2.Ground(cf.Position+Vector3.new(0,12,0),50,Vector3.new(w,w2,w3),false,3,params)
				end)
				shockwave.ParticleEmitter:Emit(3)
				game:GetService("Debris"):AddItem(shockwave,1.5)
			end)
			spawn(function()
				local currentcf = CFrame.new(pos)*CFrame.new(0,0,-1)
				local shockwave = assets:WaitForChild('ShockWave'):Clone()
				shockwave.Parent = workspace.Terrain or workspace
				shockwave.CFrame = currentcf
				spawn(function()
					local w = Random.new():NextNumber(2.5,3.5)
					local w2 = Random.new():NextNumber(2.5,3.5)
					local w3 = Random.new():NextNumber(2.5,3.5)
					local cf = shockwave.CFrame*CFrame.new(-1,0,0)
					rockmodule2.Ground(cf.Position+Vector3.new(0,12,0),50,Vector3.new(w,w2,w3),false,3,params)
				end)
				spawn(function()
					local w = Random.new():NextNumber(2.5,3.5)
					local w2 = Random.new():NextNumber(2.5,3.5)
					local w3 = Random.new():NextNumber(2.5,3.5)
					local cf = shockwave.CFrame*CFrame.new(1,0,0)
					rockmodule2.Ground(cf.Position+Vector3.new(0,12,0),50,Vector3.new(w,w2,w3),false,3,params)
				end)
				shockwave.ParticleEmitter:Emit(3)
				game:GetService("Debris"):AddItem(shockwave,1.5)
			end)
			spawn(function()
				for _,v in pairs(getnearobjects(pos,35,char))do
					if not v:FindFirstChild("IFrame") then
						if not v:FindFirstChild("HitTagMinosPrime2") then
							local tag = Instance.new("BoolValue",v)
							tag.Name = "HitTagMinosPrime2"
							table.insert(targets,v)
							local targethum = v:FindFirstChildOfClass("Humanoid")
							local targetroot = v:FindFirstChild("HumanoidRootPart") or v:FindFirstChild("Torso") or v:FindFirstChildOfClass("Part")
							local velor = Instance.new("BodyVelocity",targetroot)
							velor.MaxForce = Vector3.new(1,1,1) * math.huge
							velor.Velocity = Vector3.new(0,120,0)
							game:GetService("Debris"):AddItem(velor,0.1)
							if breakjoints == true then
								v:BreakJoints()
							else
								targethum.Health = targethum.Health - targethum.MaxHealth/3.75
							end
							game:GetService("Debris"):AddItem(tag,0.2)
						end
					end
				end
			end)
			spawn(function()
				for _,v in pairs(getnearobjects(pos,120,char))do
					if not v:FindFirstChild("IFrame") then
						if not v:FindFirstChild("HitTagMinosPrime2") then
							local tag = Instance.new("BoolValue",v)
							tag.Name = "HitTagMinosPrime2"
							table.insert(targets,v)
							local targethum = v:FindFirstChildOfClass("Humanoid")
							local targetroot = v:FindFirstChild("HumanoidRootPart") or v:FindFirstChild("Torso") or v:FindFirstChildOfClass("Part")
							local velor = Instance.new("BodyVelocity",targetroot)
							velor.MaxForce = Vector3.new(1,1,1) * math.huge
							velor.Velocity = Vector3.new(0,120,0)
							game:GetService("Debris"):AddItem(velor,0.1)
							if breakjoints == true then
								v:BreakJoints()
							else
								targethum.Health = targethum.Health - targethum.MaxHealth/10
							end
							game:GetService("Debris"):AddItem(tag,0.2)
						end
					end
				end
			end)
			task.wait(4-2.933)
			root.Anchored = false
			root.Velocity = Vector3.new(0,0,0)
			hum.WalkSpeed = 16
			hum.JumpPower = 50
			anims.crush:Stop()
			anims.idle:Play(0.1,1)
			deb = false
		else
			local pos = root.Position - Vector3.new(0,1000,0)
			root.Anchored = true
			root.CFrame = CFrame.new(pos)
			shake(0.6,30,15,25,0,0.5)
			root.Velocity = Vector3.new(0,0,0)
			sfx(7007956313,5)
			local explode = assets:WaitForChild('ExplodeCrush'):Clone()
			explode.Parent = workspace.Terrain or workspace
			explode.Value.Value = char
			explode:SetPrimaryPartCFrame(CFrame.new(pos))
			explode.Script.Disabled = false
			spawn(function()
				for _,v in pairs(getnearobjects(pos,35,char))do
					if not v:FindFirstChild("IFrame") then
						if not v:FindFirstChild("HitTagMinosPrime2") then
							local tag = Instance.new("BoolValue",v)
							tag.Name = "HitTagMinosPrime2"
							table.insert(targets,v)
							local targethum = v:FindFirstChildOfClass("Humanoid")
							local targetroot = v:FindFirstChild("HumanoidRootPart") or v:FindFirstChild("Torso") or v:FindFirstChildOfClass("Part")
							local velor = Instance.new("BodyVelocity",targetroot)
							velor.MaxForce = Vector3.new(1,1,1) * math.huge
							velor.Velocity = Vector3.new(0,120,0)
							game:GetService("Debris"):AddItem(velor,0.1)
							if breakjoints == true then
								v:BreakJoints()
							else
								targethum.Health = targethum.Health - targethum.MaxHealth/4
							end
							game:GetService("Debris"):AddItem(tag,0.2)
						end
					end
				end
			end)
			spawn(function()
				for _,v in pairs(getnearobjects(pos,125,char))do
					if not v:FindFirstChild("IFrame") then
						if not v:FindFirstChild("HitTagMinosPrime2") then
							local tag = Instance.new("BoolValue",v)
							tag.Name = "HitTagMinosPrime2"
							table.insert(targets,v)
							local targethum = v:FindFirstChildOfClass("Humanoid")
							local targetroot = v:FindFirstChild("HumanoidRootPart") or v:FindFirstChild("Torso") or v:FindFirstChildOfClass("Part")
							local velor = Instance.new("BodyVelocity",targetroot)
							velor.MaxForce = Vector3.new(1,1,1) * math.huge
							velor.Velocity = Vector3.new(0,120,0)
							game:GetService("Debris"):AddItem(velor,0.1)
							if breakjoints == true then
								v:BreakJoints()
							else
								targethum.Health = targethum.Health - targethum.MaxHealth/11.5
							end
							game:GetService("Debris"):AddItem(tag,0.2)
						end
					end
				end
			end)
			task.wait(4-2.933)
			root.Anchored = false
			root.Velocity = Vector3.new(0,0,0)
			hum.WalkSpeed = 16
			hum.JumpPower = 50
			deb = false
		end
	elseif type == "taunt" then
		if tauntcd then return end
		if cutscene == true then return end
		spawn(function()
			tauntcd = true
			local rand = math.random(1,10)
			if rand == 1 then
				sfx(7007957247,3)
				for _,v in pairs(getnearplayers(root.Position,50))do
					textremote:FireClient(v,'Judgement!',2.5)
				end
			elseif rand == 2 then
				sfx(7007957795,3)
				for _,v in pairs(getnearplayers(root.Position,50))do
					textremote:FireClient(v,'Judgement!',2.5)
				end
			elseif rand == 3 then
				sfx(7007964643,3)
				for _,v in pairs(getnearplayers(root.Position,50))do
					textremote:FireClient(v,'Prepare thyself!',2.5)
				end
			elseif rand == 4 then
				sfx(7007955646,3)
				for _,v in pairs(getnearplayers(root.Position,50))do
					textremote:FireClient(v,'Die!',2.5)
				end
			elseif rand == 5 then
				sfx(7007954282,3)
				for _,v in pairs(getnearplayers(root.Position,50))do
					textremote:FireClient(v,'Crush!',2.5)
				end
			elseif rand == 6 then
				sfx(7007963665,3)
				for _,v in pairs(getnearplayers(root.Position,50))do
					textremote:FireClient(v,'Prepare thyself!',2.5)
				end
			elseif rand == 7 then
				sfx(7007967248,3)
				for _,v in pairs(getnearplayers(root.Position,50))do
					textremote:FireClient(v,'WEAK.',2.5)
				end
			elseif rand == 8 then
				sfx(7007965897,3)
				for _,v in pairs(getnearplayers(root.Position,50))do
					textremote:FireClient(v,'Thy end is now!',2.5)
				end
			elseif rand == 9 then
				sfx(7007955031,3)
				for _,v in pairs(getnearplayers(root.Position,50))do
					textremote:FireClient(v,'Die!',2.5)
				end
			else
				sfx(7007966515,3)
				for _,v in pairs(getnearplayers(root.Position,50))do
					textremote:FireClient(v,'Thy end is now!',2.5)
				end
			end
			task.wait(1.5)
			tauntcd = false
		end)
	elseif type == "toggle" then
		if deb then return end
		if deb2 then return end
		if cd then return end
		if breakjoints == false then
			cd = true
			deb2 = true
			breakjoints = true
			shake(0.2,20,1,2,0.05,0.15)
			sfx(7007967248,3)
			for _,v in pairs(getnearplayers(root.Position,35))do
				textremote:FireClient(v,'WEAK.',2.5)
			end
			for _,v in pairs(root:WaitForChild('Phase2'):GetChildren())do
				v.Enabled = true
			end
			task.wait(0.5)
			deb2 = false
		elseif breakjoints == true then
			cd = true
			breakjoints = false
			for _,v in pairs(root:WaitForChild('Phase2'):GetChildren())do
				v.Enabled = false
			end
		end
		spawn(function()
			task.wait(2)
			cd = false
		end)
	end
end)
--
char.Destroying:Connect(function()
	ended = true
	for _,v in pairs(boxs)do
		v:Destroy()
	end
	for _,v in pairs(hps)do
		v:Destroy()
	end
end)
plr.CharacterAdded:Connect(function()
	if ended == false then
		ended = true
		for _,v in pairs(boxs)do
			v:Destroy()
		end
		for _,v in pairs(hps)do
			v:Destroy()
		end
	end
end)
realchar.Destroying:Connect(function()
	ended = true
	for _,v in pairs(boxs)do
		v:Destroy()
	end
	for _,v in pairs(hps)do
		v:Destroy()
	end
end)
hum.Died:Connect(function()
	ended = true
	for _,v in pairs(boxs)do
		v:Destroy()
	end
	for _,v in pairs(hps)do
		v:Destroy()
	end
	task.wait(3)
	if char then
		char:Destroy()
	end
	if plr then
		plr:LoadCharacter()
	end
end)
--
hum.Running:Connect(function(speed)
	if speed > 0 then
		if walk == false then
			idle = false
			walk = true
			if deb == false then
				anims.idle:Stop()
				anims.walk:Play(0.1,1)
			end
		end
	elseif speed <= 0 then
		if idle == false then
			idle = true
			walk = false
			if deb == false then
				anims.walk:Stop()
				anims.idle:Play(0.15,1)
			end
		end
	end
end)
--
spawn(function()
	while task.wait() do
		if ended == true then
			break
		end
		pcall(function()
			for _,v in pairs(game:GetService("Players"):GetPlayers())do
				if v:FindFirstChildOfClass("PlayerGui") then
					if not v:FindFirstChildOfClass("PlayerGui"):FindFirstChild(text.Name) then
						local gui = text:Clone()
						gui:WaitForChild('LocalScript',15):WaitForChild('remote',15).Value = textremote
						gui.Parent = v:FindFirstChildOfClass("PlayerGui")
						gui:WaitForChild('LocalScript',15).Disabled = false
						table.insert(boxs,gui)
					end
				end
			end
		end)
	end
end)
spawn(function()
	while task.wait() do
		if ended == true then
			break
		end
		hum:SetStateEnabled(Enum.HumanoidStateType.Ragdoll,false)
		hum:SetStateEnabled(Enum.HumanoidStateType.Physics,false)
		hum:SetStateEnabled(Enum.HumanoidStateType.Seated,false)
		hum:SetStateEnabled(Enum.HumanoidStateType.PlatformStanding,false)
		hum:ChangeState(Enum.HumanoidStateType.GettingUp)
		hum:ChangeState(Enum.HumanoidStateType.Running)
	end
end)
spawn(function()
	while task.wait() do
		if cutsceneval.Value == false then
			if ended == true then
				break
			end
			pcall(function()
				for _,v in pairs(game:GetService("Players"):GetPlayers())do
					if v:FindFirstChildOfClass("PlayerGui") then
						if not v:FindFirstChildOfClass("PlayerGui"):FindFirstChild(hpgui.Name) then
							local gui = hpgui:Clone()
							gui:WaitForChild('LocalScript',15):WaitForChild('humanoid',15).Value = hum
							gui.Parent = v:FindFirstChildOfClass("PlayerGui")
							gui:WaitForChild('LocalScript',15).Disabled = false
							table.insert(hps,gui)
						end
					end
				end
			end)
		end
	end
end)