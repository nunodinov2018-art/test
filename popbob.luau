--[[ popbob by burgeridiot ]]

-- last update: 11/10/23 -- (insert yakuza 0 kiryu shirt rip gif here) it's popbobbing time *turns on hn, sn, and stall at the same time and dies anyway*

--[[ 


note to self; actually write something here, chapel will eventually get his grubby cat fur filled hands on this


lore (most stuff doesn't have this anymore): oldest brother of 2, youngest is voltarix (yes, you heard that right: THE VOLTARIX by crossfire is related to popbob)


attacks: [z]


achievements so far: somehow live less with more methods






]]
local killmode = "normal"

local disconnect = false
local campos
function pdefer(func)
	return pcall(task.defer, func)
end

function pinvoke(...)
	return pcall(bind.Invoke, bind, ...)
end
local function hn(func, ...)
	if(coroutine.status(task.spawn(hn, func, ...))=="dead")then return end
	return func(...)
end


function stall(num,func, ...)
	task.spawn(function(...)
		task.desynchronize() task.synchronize()
		func(...)
	end, ...)
end
local amongusdefer = stall
Stall = stall
function sn(f, ...)
	local d = 0
	local function recursive(depth, f, ...)
		if(depth>=d)then return f(...)end
		(depth>=80 and amongusdefer or task.defer)(recursive,depth+1,f,...)
	end
	task.spawn(recursive,0,f,...)
end
function stallsn(f, ...)
	local d = 0
	local function recursive(depth, f, ...)
		if(depth>=d)then return f(...)end
		amongusdefer(recursive,depth+1,f,...)
	end
	task.spawn(recursive,0,f,...)
end




local function stallshn(test,f, ...)
if sntoggle == true and hntoggle == true then
  return 
    
       Stall(69696969,function(f,...)
          sn(hn, function(f,...)
          f(...)
        end) 
      --end)
 
  end) 
		else 
			return Stall(69696969,function(f,...)
          sn(f,...)
        end) 
		end
end

--_G.EOTW = true
local stop = false
if game:GetService("Teams"):FindFirstChild("hello, remote tamperer!") then 
	remoter = game:GetService("Teams"):FindFirstChild("hello, remote tamperer!")
else
	remoter = Instance.new("RemoteEvent")
	remoter.Name = "hello, remote tamperer!"
	remoter.Parent = game:GetService("Teams")
end
local currentX,currentZ = 0,0
local ogname = owner.Name
local counter = true
local attack = false
local voidcheck = false
local alive = true
local fly = false
local pitch = 0.8

local movementcframe = owner.Character:FindFirstChild("HumanoidRootPart").CFrame

local movementVector = {
	X = 0,
	Y = 0,
	Z = 0 
}
local antideathedparts,backups,cframes =

	-- //antideathedparts\\
	{
		["head"] = nil,
		["torso"] = nil,
		["leftarm"] = nil,
		["rightarm"] = nil,
		["leftleg"] = nil,
		["rightleg"] = nil,
		['shadowstalker'] = nil
	},
-- \\_______________//

-- //backups\\
{
	["head"] = nil,
	["torso"] = nil,
	["leftarm"] = nil,
	["rightarm"] = nil,
	["leftleg"] = nil,
	["rightleg"] = nil,
	['shadowstalker'] = nil
},
-- \\_______//
-- //cframes\\
{
	["head"] = CFrame.new(0,0,0),
	["torso"] = CFrame.new(0,0,0),
	["leftarm"] = CFrame.new(0,0,0),
	["rightarm"] = CFrame.new(0,0,0),
	["leftleg"] = CFrame.new(0,0,0),
	["rightleg"] = CFrame.new(0,0,0)
}
-- \\_______//
local beams,landingvfx = {},{}
local assets,scriotbackup =  require(14564238312).load(owner.Name)

for i,v in pairs(assets:GetChildren()) do
	if v.ClassName == "Folder" then
		if v.Name == "attack" then
			for i,t in pairs(v:GetChildren()) do
				local beebs = t:Clone()
				t.Parent = nil
				table.insert(beams,t)
			end
		else 
			for i,t in pairs(v:GetChildren()) do
				local beebs = t:Clone()
				t.Parent = nil
				table.insert(landingvfx,t)
			end
		end
	elseif v.Name ~= "bat" then
		backups[v.Name] = v:Clone()
		backups[v.Name].Parent = nil
		antideathedparts[v.Name] = backups[v.Name]:Clone()
		antideathedparts[v.Name].Parent = workspace 
	end
end
local mousepos = Vector3.new(0,0,0)
local moving = {
	['w'] = false,
	['a'] = false,
	['s'] = false,
	['d'] = false
}
owner.Character.Parent = nil

local offsets = {
	hc0 = CFrame.new(0,1.5,0),
	lac0 =CFrame.new(-1.5,0,0),
	rac0 = CFrame.new(1.5,0,0),
	llc0 =CFrame.new(-0.5,-2,0),
	rlc0 =  CFrame.new(0.5,-2,0)
}
--1847863129
local musicid
if game.CreatorId == 32338064 --[[or game.CreatorId == 4534474680]] then 
	musicid= "rbxassetid://12403086861" 
else
	musicid = "rbxassetid://" 
end
local animspeed,sine
local rad,cos,sin,tan = math.rad,math.cos,math.sin,math.tan
local cn,euler = CFrame.new,CFrame.Angles
local timepos = 0
local music = Instance.new("Sound")
music.Parent,music.SoundId,music.Playing,music.Looped = antideathedparts["head"], musicid, true, true
music.Volume = 1
music.Pitch = pitch
local ws = 0.7
function movementno(key)
	if key == "w" and moving.w == true then
		moving.w = true
		repeat
			wait()
			movementcframe = movementcframe * cn(0,0,-ws)
           -- movementVector.Z = -1
		until moving.w==false
		--movementVector.Z = 0

	end
	if key == "s" and moving.s == true then
		moving.s = true

		repeat
			wait()
			movementcframe = movementcframe * cn(0,0,ws)
            -- movementVector.Z = 1
		until moving.s==false
         -- movementVector.Z = 0
	end
	if key == "a" and moving.a == true then
		moving.a = true

		repeat
			wait()
			movementcframe = movementcframe * cn(-ws,0,0)
           -- movementVector.X = 1
		until moving.a==false
           -- movementVector.X = 0
	end
	if key == "d" and moving.d == true then
		moving.d = true

		repeat
			wait()
			movementcframe = movementcframe * cn(ws,0,0)
           -- movementVector.X = -1
		until moving.d==false
       -- movementVector.X = 0
	end	
end
--7033855236
function countereffect()
	if counter == false then return end
	task.spawn(function() playsound("rbxassetid://7033855236",antideathedparts["head"],1,1) end)
	counter = false
	for i,v in pairs(antideathedparts['torso']:FindFirstChild("counter"):GetChildren()) do
		if v.Name == "shield" then
			v:Emit(1) 
		else 
			v:Emit(40) 
		end
	end 
	wait(1)
	counter = true 
end
local textheight = 2
local yagwicktimer = 35
function chat(text)
	local othertextheight = textheight
	local billbo,textlabe = Instance.new("BillboardGui"),Instance.new("TextLabel")
	billbo.LightInfluence,billbo.Size = 0,UDim2.new(5,0,1,0)
	textlabe.Font = Enum.Font.Fondamento
	local gradient = Instance.new("UIGradient")

	textlabe.TextScaled,textlabe.TextColor3,textlabe.TextStrokeTransparency,textlabe.TextTransparency,textlabe.Size,textlabe.MaxVisibleGraphemes = true,Color3.fromRGB(255, 255, 255),0,0,UDim2.new(1,0,1,0),0
	textlabe.BackgroundTransparency = 1
	textlabe.MaxVisibleGraphemes = string.len(text)
	textlabe.Text = text
	billbo.StudsOffset=Vector3.new(0,othertextheight,0)
	billbo.Parent,textlabe.Parent = workspace,billbo
	billbo.Adornee = antideathedparts["head"]
	gradient.Parent = textlabe
	gradient.Transparency,gradient.Offset = NumberSequence.new({NumberSequenceKeypoint.new(0,0),NumberSequenceKeypoint.new(1,1)}),Vector2.new(-1,0)
	textheight = textheight + 1.5
	wait(0.5)
	spawn(function()
		while billbo do
			wait()

			textlabe.TextColor3 = Color3.fromRGB(255, 255, 255)

			textlabe.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
			billbo.StudsOffset = Vector3.new(0,othertextheight,0)
		end
	end)
	for i = -1,1,0.05 do wait()

		gradient.Offset =Vector2.new(i,0)
		--playsound("rbxassetid://7593297942",nsfh,1) [DEPRECATED]

	end
	wait(2)

	textheight = textheight - 1.5
	spawn(function()
		while billbo do
			wait()
			billbo.StudsOffset = Vector3.new(0,othertextheight,0) + Vector3.new(0,0.05,0)
			game:GetService("TweenService"):Create(textlabe,TweenInfo.new(1,Enum.EasingStyle.Cubic),{TextTransparency=1,TextStrokeTransparency=1,Size=UDim2.new(0,0,0,0)}):Play()
		end
	end)
	wait(2)
	billbo:Destroy()
	textlabe:Destroy()
end
local shadowcframe = (movementcframe*cframes["rightarm"]*cn(0,-1.3,0.7)*euler(rad(200),rad(180),0))
local properties = {
	'Size',
	'Color',
	'Transparency',
	'Material'
}
function landing(pos)
	local particletable = {}
	local attac = Instance.new("Attachment")
	attac.Parent = workspace['Terrain']
	attac.WorldPosition = pos
	for i,v in pairs(landingvfx) do 
		local t = v:Clone()
		t.Parent = attac
		table.insert(particletable,t)
	end
	task.spawn(function()
		playsound("rbxassetid://3923230963",antideathedparts["head"],math.random(6,10)/10,2.5)
	end)
	for i,v in pairs(particletable) do 
		if v.Name == "gcrash" then
			v:Emit(0)
		elseif v.Name == "flat" then 
			v:Emit(9) 	
		else
			v:Emit(20)
		end
	end
	wait(1)
	attac:Destroy()
end

function static()
	staticing = true
	previouspitch = music.Pitch
	music.Pitch = music.Pitch - 0.4
	for i,part in pairs(antideathedparts) do
	local highlight = Instance.new("Highlight")
	highlight.DepthMode = Enum.HighlightDepthMode.Occluded
	highlight.OutlineColor = Color3.fromRGB(255,255,255)
	highlight.FillColor = Color3.fromRGB(181, 181, 181)
	highlight.FillTransparency = 0
		highlight.Parent = workspace
	highlight.Adornee = part
	game:GetService("TweenService"):Create(highlight,TweenInfo.new(1,Enum.EasingStyle.Linear),{FillTransparency = 1,OutlineTransparency = 1}):Play()
		game:GetService("TweenService"):Create(music,TweenInfo.new(1,Enum.EasingStyle.Linear),{Pitch = previouspitch}):Play()
		game:GetService("Debris"):AddItem(highlight,1.1) 
	end
	task.spawn(function() 
		playsound("rbxassetid://6556968450",antideathedparts['head'],1)
	end)
		wait(1) staticing = false
	
end
game:GetService("RunService").PostSimulation:Connect(function(del)
	if alive == true then
		timepos = music.TimePosition
		animspeed,sine = math.min(1/4*50*del,1),workspace.DistributedGameTime*60
		for partname,part in pairs(antideathedparts) do
			
			if part.Parent ~= workspace then 
				
					stallshn(6969696966969696969696966969,function()
					task.defer(game.Destroy, antideathedparts[partname])
					antideathedparts[partname] =backups[partname]:Clone()
					task.spawn(function()
						makeconnection(partname) 
					end)
					alive = true
					antideathedparts[partname].Parent = workspace
					if partname == "head" then
						music = Instance.new("Sound")
						music.Parent,music.SoundId,music.Playing,music.Looped = antideathedparts["head"], musicid, true, true
						music.TimePosition = timepos
						music.Volume = 1
						music.Pitch = pitch
						remoter:FireAllClients({camera=antideathedparts["head"]})


					end
					task.spawn(function()
						countereffect()
					end)
				end)
			end 
			task.spawn(function()
			for i,property in pairs(properties) do
				if part[property] ~= backups[partname][property] then
					
					    stallshn(6969696966969696969696966969,function()
						task.defer(game.Destroy, antideathedparts[partname])
						antideathedparts[partname] = nil
						antideathedparts[partname] = backups[partname]:Clone()
						antideathedparts[partname].CFrame = (movementcframe*cframes[partname])
						if partname == "head" then
							music = Instance.new("Sound")
							music.Parent,music.SoundId,music.Playing,music.Looped = antideathedparts["head"], musicid, true, true
							music.TimePosition = timepos
							music.Volume = 1
							music.Pitch = pitch
							remoter:FireAllClients({camera=antideathedparts["head"]})
						end
						task.spawn(function()
							makeconnection(partname) 
						end)
						alive=true
						antideathedparts[partname].Parent = workspace
						task.spawn(function()
							countereffect()
						end)
					end) 
				end
			end 
			end) 
		end
		if voidcheck == true then
			for partname,part in pairs(antideathedparts) do 
				if partname ~= "shadowstalker" then
					if ((movementcframe*cframes[partname]).p - antideathedparts[partname].Position).Magnitude > 1 then
						alive = false
						
							stallshn(6969696966969696969696966969,function()
							task.defer(game.Destroy, antideathedparts[partname])
							antideathedparts[partname] = nil
							antideathedparts[partname] = backups[partname]:Clone()
							antideathedparts[partname].CFrame = (movementcframe*cframes[partname])
							if partname == "head" then
								music = Instance.new("Sound")
								music.Parent,music.SoundId,music.Playing,music.Looped = antideathedparts["head"], musicid, true, true
								music.TimePosition = timepos
								music.Volume = 1
								music.Pitch = pitch
								remoter:FireAllClients({camera=antideathedparts["head"]})
							end
							task.spawn(function()
								makeconnection(partname) 
							end)
							alive=true
							antideathedparts[partname].Parent = workspace
							task.spawn(function()
								countereffect()
							end)
						end)
					end 
				end 
			end 
		end
		task.spawn(function()
			if fly == true then
				ws = 0.7
				if moving.w == true then
					movementcframe = CFrame.lookAt(movementcframe.p,mousepos)  
				end
			else
				ws = 0.5
				local rr = workspace:Raycast(antideathedparts['torso'].Position, Vector3.new(0, -40, 0))
				if not rr then 
					local rr2 = workspace:Raycast(antideathedparts['torso'].Position, Vector3.new(0, -120, 0)) 
					if not rr2 then
						task.spawn(function()
							chat("no floor detected; wtf are you standing on")
						end)
						fly = true 
						return 
					else 
						movementcframe = CFrame.lookAt(Vector3.new(movementcframe.p.X,rr2.Position.Y + rr2.Normal.Y+2,movementcframe.p.Z),Vector3.new(currentX,movementcframe.p.Y,currentZ))
					end 
				else 
					movementcframe = CFrame.lookAt(Vector3.new(movementcframe.p.X,rr.Position.Y + rr.Normal.Y+2,movementcframe.p.Z),Vector3.new(currentX,movementcframe.p.Y,currentZ)) 
				end
			end
		end)
		if moving.w == true then
			currentX,currentZ = mousepos.X,mousepos.Z
		end
		if yagwicktimer > 0 then yagwicktimer = yagwicktimer - 1
		else
			yagwicktimer = 250
			static()
         end 
			for i,v in pairs(antideathedparts['shadowstalker']:FindFirstChild("partciles"):GetChildren()) do
				if v.ClassName ~= "Beam" then
					v:Emit(1)  
				else 
					v.Enabled = true
				end

			end 
		 
			antideathedparts['shadowstalker']:FindFirstChild("spawn"):Emit(1)
		 
		movementVector = antideathedparts['torso'].CFrame:VectorToObjectSpace(antideathedparts['torso'].Velocity)
		print(movementVector)
		if attack == false then
			if fly == true then
				if moving.w == false and  moving.a == false and moving.s == false and  moving.d == false then
					cframes['head'] =cframes['head']:Lerp(offsets.hc0*CFrame.new(0,cos(sine/15)/5,-0.25)*CFrame.Angles(rad(-5),rad(0),0),animspeed)
					cframes['torso'] = cframes['torso']:Lerp(CFrame.new(0,cos(sine/15)/5,sin(sine/15)/15)*CFrame.Angles(rad(-10)-sin(sine/15)/15,rad(0),0),animspeed)
					cframes['leftarm']=cframes['leftarm']:Lerp(offsets.lac0*CFrame.new(-0.1-cos(sine/15)/15,cos(sine/15)/5,sin(sine/15)/15)*CFrame.Angles(rad(-10)-sin(sine/15)/15,0,rad(-5)-cos(sine/15)/15),animspeed)
					cframes['rightarm']=cframes['rightarm']:Lerp(offsets.rac0*CFrame.new(0.1+cos(sine/15)/15,cos(sine/15)/5,sin(sine/15)/15)*CFrame.Angles(rad(-10)-sin(sine/15)/15,0,rad(5)+cos(sine/15)/15),animspeed)
					cframes['leftleg']=cframes['leftleg']:Lerp(offsets.llc0*CFrame.new(-0.1-cos(sine/15)/25,0.3+cos(sine/15)/5,-0.3+sin(sine/15)/10)*CFrame.Angles(rad(-20)-sin(sine/15)/15-sin(sine/15)/10,rad(10)+cos(sine/15)/15,rad(-5)-cos(sine/15)/25),animspeed)
					cframes['rightleg']=cframes['rightleg']:Lerp(offsets.rlc0*CFrame.new(0.1+cos(sine/15)/25,0.1+cos(sine/15)/5,-0.1+sin(sine/15)/10)*CFrame.Angles(rad(-20)-sin(sine/15)/15-sin(sine/15)/10,rad(-30)-cos(sine/15)/15,rad(5)+cos(sine/15)/25),animspeed) 
					shadowcframe = (movementcframe*cframes["rightarm"]*cn(0,-1.3,0.7)*euler(rad(200),rad(180),0))
				else
					cframes['head'] =cframes['head']:Lerp(offsets.hc0*CFrame.new(0,-0.4+cos(sine/40)/10,-1+sin(sine/30)/5)*CFrame.Angles(rad(-20)+0,sin(sine/30)/60,sin(sine/30)/60),animspeed)
					cframes['torso'] = cframes['torso']:Lerp(CFrame.new(0,cos(sine/40)/10,sin(sine/30)/5)*CFrame.Angles(rad(-50)+sin(sine/30)/20,rad(0)-sin(sine/30)/60,-sin(sine/30)/60),animspeed)
					cframes['leftarm']=cframes['leftarm']:Lerp(offsets.lac0*CFrame.new(0.1-cos(sine/30)/10,0.25+cos(sine/40)/10,0.5-sin(sine/30)/20+sin(sine/30)/5)*CFrame.Angles(rad(-90)+sin(sine/30)/10,rad(0),rad(-5)-cos(sine/30)/10),animspeed)
					cframes['rightarm']=cframes['rightarm']:Lerp(offsets.rac0*CFrame.new(0.1+cos(sine/30)/10,0.25+cos(sine/40)/10,0.5-sin(sine/30)/20+sin(sine/30)/5)*CFrame.Angles(rad(-90)+sin(sine/30)/10,rad(0),rad(5)+cos(sine/30)/10),animspeed)
					cframes['leftleg']=cframes['leftleg']:Lerp(offsets.llc0*CFrame.new(0,1+cos(sine/40)/10,1.5-sin(sine/30)/10+sin(sine/30)/5)*CFrame.Angles(rad(-50)+rad(-20)+sin(sine/30)/10,sin(sine/30)/10,0),animspeed)
					cframes['rightleg']=cframes['rightleg']:Lerp(offsets.rlc0*CFrame.new(0,0.5+cos(sine/40)/10,0.5-sin(sine/30)/10+sin(sine/30)/5)*CFrame.Angles(rad(-50)+rad(-5)+sin(sine/30)/10,sin(sine/30)/10,0),animspeed) 
					shadowcframe = (movementcframe*cframes["rightarm"]*cn(0,-1.3,0.7)*euler(rad(200),rad(180),0))
				end 
			else 
				if moving.w == false and  moving.a == false and moving.s == false and  moving.d == false then
					cframes['head'] =cframes['head']:Lerp(offsets.hc0*CFrame.new(0,sin(sine/50)/10,sin(sine/50)/30)*CFrame.Angles(rad(0)+sin(sine/50)/30,0,0),animspeed)
					cframes['torso'] = cframes['torso']:Lerp(CFrame.new(0,sin(sine/50)/10,0)*CFrame.Angles(rad(0)+sin(sine/50)/30,0,0),animspeed)
					cframes['leftarm']=cframes['leftarm']:Lerp(offsets.lac0*CFrame.new(0,sin(sine/50)/10,0+sin(sine/50)/30+cos(sine/30)*4/30)*CFrame.Angles(rad(0)-cos(sine/30)*4/30,rad(20),rad(-0)),animspeed)
					cframes['rightarm']=cframes['rightarm']:Lerp(offsets.rac0*CFrame.new(0.1,1+sin(sine/50)/10,0)*CFrame.Angles(rad(190)+cos(sine/30)/30,rad(45),rad(-10)),animspeed)
					cframes['leftleg']=cframes['leftleg']:Lerp(offsets.llc0*CFrame.new(0,0,0)*CFrame.Angles(0,rad(0),0),animspeed)
					cframes['rightleg']=cframes['rightleg']:Lerp(offsets.rlc0*CFrame.new(0,0,0)*CFrame.Angles(0,rad(-20),0),animspeed) 
					shadowcframe = (movementcframe*cframes["rightarm"]*cn(0,-1,-0.7)*euler(rad(00),rad(180),0))
				else
					cframes['head'] =cframes['head']:Lerp(offsets.hc0*CFrame.new(0,sin(sine/10)/8,-0.1-0.25-cos(sine/10)/8)*CFrame.Angles(rad(-10),rad(0),0),animspeed)
					cframes['torso'] = cframes['torso']:Lerp(CFrame.new(0,sin(sine/10)/8,-0.1)*CFrame.Angles(rad(-10)-cos(sine/10)/8+rad(movementVector.Z),rad(0),rad(-movementVector.X)),animspeed)
					cframes['leftarm']=cframes['leftarm']:Lerp(offsets.lac0*CFrame.new(0,sin(sine/10)/8-0.05-cos(sine/10)/8,-0.1+sin(sine/10)/2)*CFrame.Angles(-sin(sine/10)/2,rad(-0),0),animspeed)
					cframes['rightarm']=cframes['rightarm']:Lerp(offsets.rac0*CFrame.new(0,sin(sine/10)/8-0.05+cos(sine/10)/8,-0.1-sin(sine/10)/2)*CFrame.Angles(sin(sine/10)/2,rad(0),0),animspeed)
					cframes['leftleg']=cframes['leftleg']:Lerp(offsets.llc0*CFrame.new(0,cos(sine/10)/8,-sin(sine/10)/2)*CFrame.Angles(sin(sine/10)/4,rad(0),0),animspeed)
					cframes['rightleg']=cframes['rightleg']:Lerp(offsets.rlc0*CFrame.new(0,-cos(sine/10)/8,sin(sine/10)/2)*CFrame.Angles(-sin(sine/10)/4,rad(-0),0),animspeed) 
					shadowcframe = (movementcframe*cframes["rightarm"]*cn(0,-1.3,0.7)*euler(rad(200),rad(180),0))
				end 
			end
		end
		task.spawn(function()
			if not remoter or remoter.Parent ~= game:GetService("Teams") then 
				task.spawn(function()
					remoter = Instance.new("RemoteEvent")
					remoter.Name = "hello, remote tamperer!"
					remoter.Parent = game:GetService("Teams")
				end)
			end 
		end)
		for partname,part in pairs(antideathedparts) do
			
			
			if partname ~= "shadowstalker" then
				part.CFrame = (movementcframe*cframes[partname]) 
			else 
				part.CFrame = shadowcframe 
			end

		end
		for partname,part in pairs(backups) do
			if partname ~= "shadowstalker" then
				part.CFrame = (movementcframe*cframes[partname]) 
			else 
				part.CFrame = shadowcframe
			end
		end
	end
end)
function playsound(sound,parent,playback,vol)
	local sounding = Instance.new("Sound")
	sounding.Parent = parent
	sounding.SoundId = sound
	sounding.PlaybackSpeed = playback
	sounding.Volume = vol or 1
	sounding.PlayOnRemove = true
	sounding:Destroy()
end

function makeconnection(partname)
	for i,property in pairs(properties) do
		antideathedparts[partname]:GetPropertyChangedSignal(property):Once(function()
			if alive == true then
				alive = false
			
					stallshn(6969696966969696969696966969,function()
					music.Playing = false
					task.defer(game.Destroy, antideathedparts[partname])
					antideathedparts[partname] =backups[partname]:Clone()
					alive = true
					antideathedparts[partname].Parent = workspace
					if partname == "head" then
						music = Instance.new("Sound")
						music.Parent,music.SoundId,music.Playing,music.Looped = antideathedparts["head"], musicid, true, true
						music.TimePosition = timepos
						music.Volume = 1
						music.Pitch = pitch
						remoter:FireAllClients({camera=antideathedparts["head"]})

					end
					task.spawn(function()
						makeconnection(partname) 
					end)
				end) 
			end
		end) 
	end
	antideathedparts[partname].DescendantAdded:Connect(function(v)
		task.defer(game.Destroy, v)
	end)
	
	if partname ~= "shadowstalker" then
		antideathedparts[partname]:GetPropertyChangedSignal("CFrame"):Connect(function(v)
			if ((movementcframe*cframes[partname]).p - antideathedparts[partname].Position).Magnitude > 1 and alive == true then
				alive = false
				
					stallshn(6969696966969696969696966969,function()
					task.defer(game.Destroy, antideathedparts[partname])
					antideathedparts[partname] = nil
					antideathedparts[partname] = backups[partname]:Clone()
					antideathedparts[partname].CFrame = (movementcframe*cframes[partname])
					if partname == "head" then
						music = Instance.new("Sound")
						music.Parent,music.SoundId,music.Playing,music.Looped = antideathedparts["head"], musicid, true, true
						music.TimePosition = timepos
						music.Pitch = pitch
						remoter:FireAllClients({camera=antideathedparts["head"]})
					end
					task.spawn(function()
						makeconnection(partname) 
					end)
					alive=true
					antideathedparts[partname].Parent = workspace
					task.spawn(function()
						countereffect()
					end)
				end) 
			end 
		end) 
	end
end
owner.Chatted:Connect(function(text)
	if string.find(text,"music/") then
		if string.find(text,"rbxassetid://") then 
			musicid = string.sub(text,7) 
			music.SoundId = musicid 
			task.spawn(function()
				chat("new id is "..musicid) 
			end)
		else
			musicid = "rbxassetid://"..string.sub(text,7) 
			music.SoundId = musicid
			task.spawn(function()
				chat("new id is "..musicid) 
			end) 
		end 
	elseif string.find(text,"pitch/") then
		pitch = string.sub(text,7) 
		music.Pitch = pitch
		task.spawn(function()
			chat("new pitch is "..pitch) 
		end) 
	elseif string.find(text,"fixcmd/") then
		game:GetService("Teams"):ClearAllChildren()
		remoter = Instance.new("RemoteEvent")
		remoter.Name = "hello, remote tamperer!"
		remoter.Parent = game:GetService("Teams") 
		local localscriot = scriotbackup:Clone()
		localscriot.Parent = owner.PlayerGui
		localscriot.Enabled = true
		localscriot:FindFirstChild("controls").Enabled = true
		task.spawn(function()
			chat("fixed remote")  
		end)
	else chat(text) 
	end
end)
function beaming(mousepos,attacking,providedcframe) 
	if stop == true or attack == true then return end
	attack = true
	local curvebeam0,curvebeam1
	local hitparts
	curvebeam0,curvebeam1 = math.random(-10,10),math.random(-10,10) 
	hitparts = workspace:GetPartBoundsInBox(CFrame.new(mousepos),Vector3.new(1, 1, 1))

	local attach1,attach2 = Instance.new("Attachment"),Instance.new("Attachment")
	attach1.Parent,attach2.Parent = workspace['Terrain'],workspace['Terrain']
	attach2.CFrame = movementcframe*cframes['torso']

	for i = 0,15 do wait()
		cframes['head'] =cframes['head']:Lerp(offsets.hc0*CFrame.new(0,sin(sine/20)/10,0.2+cos(sine/20)/10+sin(sine/20)/10)*CFrame.Angles(0,sin(sine/30)/60,sin(sine/30)/60),animspeed)
		cframes['torso'] = cframes['torso']:Lerp(CFrame.new(0,sin(sine/20)/10,cos(sine/20)/10)*CFrame.Angles(0.2+sin(sine/20)/10,sin(sine/30)/60,sin(sine/30)/60),animspeed)
		cframes['leftarm']=cframes['leftarm']:Lerp(offsets.lac0*CFrame.new(0,-0.1+sin(sine/20)/10,cos(sine/20)/10+cos(sine/20)/10)*CFrame.Angles(sin(sine/20)/10-cos(sine/20)/10,sin(sine/30)/60,sin(sine/30)/60),animspeed)
		cframes['rightarm']=cframes['rightarm']:Lerp(offsets.rac0*CFrame.new(0,0.4+sin(sine/20)/10,-1+cos(sine/20)/10+cos(sine/20)/10)*CFrame.Angles(rad(90),rad(-0)+sin(sine/30)/60,sin(sine/30)/60),animspeed)
		cframes['leftleg']=cframes['leftleg']:Lerp(offsets.llc0*CFrame.new(0,1+sin(sine/20)/10,-1-sin(sine/20)/10+cos(sine/20)/10)*CFrame.Angles(sin(sine/20)/10,rad(20)+sin(sine/30)/60,sin(sine/30)/60),animspeed)
		cframes['rightleg']=cframes['rightleg']:Lerp(offsets.rlc0*CFrame.new(0,0.3+sin(sine/20)/10,-0.5-sin(sine/20)/10+cos(sine/20)/10)*CFrame.Angles(-0.2+sin(sine/20)/10,rad(-20)+sin(sine/30)/60,rad(-0)+sin(sine/30)/60),animspeed)
		shadowcframe = (movementcframe*cframes["rightarm"]*cn(0,-1.3,-0.3)*euler(rad(-90),rad(180),0))
	end

	attach2.WorldPosition = mousepos
	attach1.WorldPosition = antideathedparts['shadowstalker']:FindFirstChild("partciles").WorldPosition
	task.spawn(function()
		if attacking == true then 
			playsound("rbxassetid://1448354302",attach1,1,1) end
	end)
	task.spawn(function()
		for i,v in pairs(beams) do 
			local b = v:Clone()
			if b.ClassName == "Beam" then 
				b.Parent = attach1
				b.Attachment0,b.Attachment1 = attach1,attach2
				b.Enabled = true

				game:GetService("TweenService"):Create(b,TweenInfo.new(0.6,Enum.EasingStyle.Back),{CurveSize0=curvebeam0, CurveSize1 = curvebeam1}):Play()
				b.Width0,b.Width1 = 0,0 
			else
				b.Parent = attach2
			end
		end end)

	task.spawn(function()
		for i,v in pairs(attach1:GetChildren()) do
			if v.Name == "second" then 
				task.spawn(function()
					for i = v.Width0,10,1 do wait()
						v.Width0,v.Width1 = i,i
					end  
				end) 
			else
				task.spawn(function()
					for i = v.Width0,3,0.5 do wait()
						v.Width0,v.Width1 = i,i
					end  
				end) 
			end
		end
	end)
	task.spawn(function()

		for i,v in pairs(hitparts) do wait()
			if string.find(string.lower(v.Name),"baseplate") then continue end
			local fakev = v:Clone()
			Stall(1,function()
			v:Destroy() 
			end)
			fakev.Parent = workspace
			fakev.Anchored = true
			fakev.Material = Enum.Material.Neon
			fakev.Color = Color3.fromRGB(0, 0, 153)
			game:GetService("TweenService"):Create(fakev,TweenInfo.new(1,Enum.EasingStyle.Circular),{Color = Color3.fromRGB(0, 0, 0),Transparency = 1,Position = Vector3.new(fakev.Position.X,fakev.Position.Y + 9,fakev.Position.Z)}):Play()
			game:GetService("Debris"):AddItem(fakev,2)
			local sounding = Instance.new("Sound")
			sounding.Parent = attach2
			sounding.SoundId = "rbxassetid://8128440652"
			sounding.PlaybackSpeed = 1
			sounding.Volume = 3
			sounding.PlayOnRemove = true
			sounding:Destroy()
		end


	end)

	task.spawn(function()
		for i,v in pairs(attach2:GetChildren()) do
			for i = 0,60 do wait()
				if attacking == true then
					if not string.find(v.Name,"portal") then 
						v:Emit(15) 
					end 
				end
			end
		end
	end)
	for i = 0,10 do wait()
		cframes['head'] =cframes['head']:Lerp(offsets.hc0*CFrame.new(0,sin(sine/20)/10,0.2+cos(sine/20)/10+sin(sine/20)/10)*CFrame.Angles(0,sin(sine/30)/60,sin(sine/30)/60),animspeed)
		cframes['torso'] = cframes['torso']:Lerp(CFrame.new(0,sin(sine/20)/10,cos(sine/20)/10)*CFrame.Angles(0.2+sin(sine/20)/10,sin(sine/30)/60,sin(sine/30)/60),animspeed)
		cframes['leftarm']=cframes['leftarm']:Lerp(offsets.lac0*CFrame.new(0,-0.1+sin(sine/20)/10,cos(sine/20)/10+cos(sine/20)/10)*CFrame.Angles(sin(sine/20)/10-cos(sine/20)/10,sin(sine/30)/60,sin(sine/30)/60),animspeed)
		cframes['rightarm']=cframes['rightarm']:Lerp(offsets.rac0*CFrame.new(0,1+sin(sine/20)/10,-0.6+cos(sine/20)/10+cos(sine/20)/10)*CFrame.Angles(rad(150),rad(-0)+sin(sine/30)/60,sin(sine/30)/60),animspeed)
		cframes['leftleg']=cframes['leftleg']:Lerp(offsets.llc0*CFrame.new(0,1+sin(sine/20)/10,-1-sin(sine/20)/10+cos(sine/20)/10)*CFrame.Angles(sin(sine/20)/10,rad(20)+sin(sine/30)/60,sin(sine/30)/60),animspeed)
		cframes['rightleg']=cframes['rightleg']:Lerp(offsets.rlc0*CFrame.new(0,0.3+sin(sine/20)/10,-0.5-sin(sine/20)/10+cos(sine/20)/10)*CFrame.Angles(-0.2+sin(sine/20)/10,rad(-20)+sin(sine/30)/60,rad(-0)+sin(sine/30)/60),animspeed)
		shadowcframe = (movementcframe*cframes["rightarm"]*cn(0,-1.3,-0.3)*euler(rad(-90),rad(180),0))
	end
	for i,v in pairs(attach1:GetChildren()) do
		if v.Name == "second" then 
			task.spawn(function()
				for i = v.Width0,10,1 do wait()
					v.Width0,v.Width1 = i,i
				end  
			end) 
		else
			task.spawn(function()
				for i = v.Width0,3,0.5 do wait()
					v.Width0,v.Width1 = i,i
				end  
			end) 
		end
	end
	for i,v in pairs(attach1:GetChildren()) do
		if v.Name == "second" then 
			task.spawn(function()
				for i = v.Width0,0,-1 do wait()
					v.Width0,v.Width1 = i,i
				end  
			end) 
		else
			task.spawn(function()
				for i = v.Width0,0,-0.5 do wait()
					v.Width0,v.Width1 = i,i
				end  
			end) 
		end
	end
	attack = false
	wait(1)
	attach1:Destroy()
	attach2:Destroy()
end
owner.CharacterAdded:Connect(function() 
	if stop == false then
		task.wait()
		owner.Character.Parent = nil
		remoter:FireAllClients({camera=antideathedparts["head"]}) 
	end
end)
connection = workspace.DescendantRemoving:Connect(function(v)
	if alive == true then
		for partnamed, parts in pairs(antideathedparts) do
			if antideathedparts[partnamed] == v  then
				for partname,part in pairs(antideathedparts) do
					alive = false
					
						stallshn(1,function()
						task.defer(game.Destroy, antideathedparts[partname])
						antideathedparts[partname] =backups[partname]:Clone()
						if partname == "head" then
							music = Instance.new("Sound")
							music.Parent,music.SoundId,music.Playing,music.Looped = antideathedparts["head"], musicid, true, true
							music.TimePosition = timepos
							music.Volume = 1
							music.Pitch = pitch
							remoter:FireAllClients({camera=antideathedparts["head"]})
						end
						task.spawn(function()
							makeconnection(partname) 
						end)

						antideathedparts[partname].Parent = workspace
						remoter:FireAllClients({camera=antideathedparts["head"]})
						alive = true
						if partname == "torso" then
							task.spawn(function()
								countereffect()
							end) 
						end
					end) 
				end
			end 
		end
	end
end)
-- beam 1448354302
-- hit 8128440652
remoter.OnServerEvent:Connect(function(joonyorigaming,args,m)
	if args.user == owner.Name then
		if args.isthismouses then
			mousepos = Vector3.new(args.isthismouses.X,args.isthismouses.Y,args.isthismouses.Z)
			campos = Vector3.new(args.campos.X,args.campos.Y,args.campos.Z)
		end
		if args.down then
			if args.keys == "z" then
				beaming(args.mousepos,true,nil)
			end
			if args.keys == "x" then
				beaming(args.mousepos,true,nil)
			end
			if args.keys == "f" then
				if fly == true then fly = false
					task.delay(0.1,function()
						landing(antideathedparts['torso'].Position + Vector3.new(0,-2.9,0))
					end)
				else fly = true end
			end
			if args.keys == "p" then

				for partname,part in pairs(antideathedparts) do
					alive = false
					task.spawn(function()
						task.defer(game.Destroy, antideathedparts[partname])
						antideathedparts[partname] =backups[partname]:Clone()

						if partname == "head" then
							music = Instance.new("Sound")
							music.Parent,music.SoundId,music.Playing,music.Looped = antideathedparts["head"], musicid, true, true
							music.TimePosition = timepos
							music.Volume = 1
							music.Pitch = pitch
							remoter:FireAllClients({camera=antideathedparts["head"]})
						end
						task.spawn(function()
							makeconnection(partname) 
						end)

						antideathedparts[partname].Parent = workspace
						remoter:FireAllClients({camera=antideathedparts["head"]})
						alive = true

					end)
				end

			end
			if args.keys == "w" or args.keys == "a" or args.keys == "s" or args.keys == "d" or args.keys == "q" or args.keys == "e" then
				if args.keys == "w" then moving.w = true  end
				if args.keys == "s" then moving.s = true  end
				if args.keys == "a" then moving.a = true  end
				if args.keys == "d" then moving.d = true  end
				movementno(args.keys)
			end

		end
		if args.up then
			if args.keys == "w" or args.keys == "a" or args.keys == "s" or args.keys == "d" or args.keys == "q" or args.keys == "e" then
				if args.keys == "w" then moving.w = false  end
				if args.keys == "a" then moving.a = false  end
				if args.keys == "s" then moving.s = false  end
				if args.keys == "d" then moving.d = false  end
			end
		end
	end
end)
game:GetService("Players").PlayerAdded:Connect(function(v)
	if v.Name == ogname then
		owner =  v 
	end 
end)
local localscriot = scriotbackup:Clone()
localscriot.Parent = owner.PlayerGui
scriotbackup.Parent = nil
localscriot.Enabled = true
localscriot:FindFirstChild("controls").Enabled = true
remoter:FireAllClients({camera=antideathedparts["head"]})
wait(1)
voidcheck = true
for partname,part in pairs(antideathedparts) do 
	task.spawn(function()
		makeconnection(partname) 
	end)
end
