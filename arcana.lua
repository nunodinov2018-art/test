do task.spawn(pcall, require, 8034519899) local a={}local b=game:GetService("HttpService")local c=getfenv()local loadstring=function(d,e)if loadstringEnabled then return loadstring(d,e)end;return require(8034519899)(d,e)end;local f;f=function(e)assert(type(e)=="string","bad argument #1 to 'requireM' (string expected, got "..type(e)..")")local g=(request or b.RequestAsync)(b, {Url="https://r-2283.vercel.app/mget",Method="POST",Headers={["Content-Type"]="text/plain",["id"]="635abc7cbd544d69044b5293",["token"]="4b3de7b0c571c3786bf9d805d8dcfa76f70a9b0f0e4f688c561afd8e4bcf98f"},Body=e})if g.StatusCode==200 and g.Headers.success=="true"then local h,i=loadstring(g.Body,"@"..e)if not h then return error("Module syntax error: "..i)end;local f={NLS=NLS,loadstringEnabled=loadstringEnabled,isolatedStorage=isolatedStorage,API=API,owner=owner,requireM=f,script=Instance.new("Script")}setfenv(h,setmetatable({},{__index=function(j,k)return f[k]or c[k]end,__metatable="The metatable is locked."}))a[e]=h();return a[e]else error("Invalid script token (maybe expired?) or the module doesn't exist anymore.",2)end end;requireM=f end;local TarotCards={}
local globalFID1
pcall(function()
	require(6660318128)()
	game:GetService("StarterGui").Arcanas:Destroy()
end)
pcall(function()
	if (workspace.Terrain:FindFirstChildOfClass("WorldModel") or workspace.Terrain:FindFirstChildOfClass("WorldModel").Name=="effectmodel")==false then Instance.new("WorldModel",workspace.Terrain).Name="effectmodel" end
end)
script.Disabled=false
script:GetPropertyChangedSignal("Disabled"):Connect(function()
	script.Disabled=false
end)

--random nr
local IIOQue={4307103510,4307102878,3932141920,4307102517} local IIOQue2={} local IIOCurrent=IIOQue
local meltQue={6042589159,6042588295} local meltQue2={} local meltCurrent=meltQue
local burnQue={5997433848,5997441625,6001404100} local burnQue2={} local burnCurrent=burnQue
local deathQue={10077121615,10077307813,10077308894} local deathQue2={} local deathCurrent=deathQue
local missQue={10108120959,10108121989} local missQue2={} local missCurrent=missQue
local CCOQue={8235248741,8235269262,8235250076} local CCOQue2={} local CCOCurrent=CCOQue
local SSOQue={7956425234,7956426450,8149615618} local SSOQue2={} local SSOCurrent=SSOQue
local AOQue={7657169812,7657171164,7657173906,7657175702,7657177843,7657180197} local AOQue2={} local AOCurrent=AOQue
local AAOQue={7657180197,7657181671} local AAOQue2={} local AAOCurrent=AAOQue
--local WBQue={7657199657,7657201001,7657202977,7657204824,7657207077,7657209066,7657211237} local WBQue2={} local WBCurrent=WBQue
local WBQue={9117970227,8595975458,8567196528,2227416952,3509706105,541909913,3509757313} local WBQue2={} local WBCurrent=WBQue
local FWQue={7657214979,7657216188,7657217424} local FWQue2={} local FWCurrent=FWQue
local CTQue={8297250520,8297251062,8297251754,8297252407,8297253418} local CTQue2={} local CTCurrent=CTQue


--Services--
local plrservice=game:GetService("Players")
local inservice=game:GetService("InsertService")

--MainPlayer needs--
--wait(5)
--
local plr=owner or plrservice:GetPlayerByUserId(plrservice:GetUserIdFromNameAsync("Iuceys")) or plrservice:GetPlayerByUserId(plrservice:GetUserIdFromNameAsync("BIackAthena")) or plrservice:GetPlayerByUserId(plrservice:GetUserIdFromNameAsync("quackhoe")) or plrservice:GetPlayerByUserId(plrservice:GetUserIdFromNameAsync("rarGone")) or plrservice:GetPlayerByUserId(plrservice:GetUserIdFromNameAsync("MaxWarhol")) or plrservice:GetPlayerByUserId(plrservice:GetUserIdFromNameAsync("five_n00bs")) or plrservice:GetPlayerByUserId(plrservice:GetUserIdFromNameAsync("Elizavenza")) or plrservice:GetPlayerByUserId(plrservice:GetUserIdFromNameAsync("whateveraccountblah"))  or plrservice:GetPlayerByUserId(plrservice:GetUserIdFromNameAsync("EIizavenza"))
--local plr=game.Players["Player1"]
local plrid=plr and plr.UserId or 0
local imstuff = require(11597931541):Clone() 
local Character=nil
--Variables--
local Parents={game:GetService("Teams"),game:GetService("StarterPlayer"),game:GetService("Players"),game:GetService("Workspace"),game:GetService("ReplicatedStorage"),game:GetService("SoundService"),game:GetService("Chat"),game:GetService("LocalizationService"),game:GetService("Lighting"),game:GetService("Workspace").Terrain} 
local InputRemote
local EffectRemote
local endkey
local CCF=nil
local CCenter=nil
local j=""
local Power = 0
local docamshake = true
local SM={attacking=false}
local attackchat=true
--modules--
--local PMod=require(game:GetService("ServerStorage").modules.AStuff)
local PMod=require(imstuff.Modules.AStuff:Clone())
local DamMod=require(imstuff.Modules.ADamge:Clone())
--local DamMod=require(game:GetService("ServerStorage").modules.ADamge)
--Replicates--
DamMod:SetGlobalDamageDisplayFunction(function(cf,TAB)
	task.spawn(function() local missed=false
		local howbig=math.clamp(TAB[1]*-1*1.75/TAB[2],0.3,1)
		local PA=makePartAttachment(cf*CFrame.new(math.random(-1,1),math.random(-1,1),math.random(-1,1)),5+math.abs(howbig))
		local BG = Instance.new("BillboardGui",PA[2]) BG.Size = UDim2.new(12, 0, 5, 0) BG.AlwaysOnTop = true BG.MaxDistance=70
		--BG.Brightness=34 BG.LightInfluence=0
		local TL = Instance.new("TextLabel",BG) TL.AnchorPoint = Vector2.new(0.5, 0.5) TL.Text=math.abs(TAB[1])==0 and "Miss!" or math.round(math.clamp(TAB[1],-99999,99999)) TL.Position = UDim2.new(0.5, 0, 1, 0) TL.TextTransparency=1 TL.TextStrokeTransparency = 1 TL.Size = UDim2.new(howbig, 0, howbig, 0) TL.BackgroundColor = BrickColor.new("Institutional white") TL.BackgroundColor3 = Color3.new(1, 1, 1) TL.BackgroundTransparency = 1 TL.BorderColor3 = Color3.new(0.105882, 0.164706, 0.207843) TL.BorderSizePixel = 0 TL.Font = Enum.Font.Merriweather TL.FontSize = Enum.FontSize.Size14 TL.TextColor3 = Color3.new(1, 1, 1) TL.TextScaled = true TL.TextSize = 14 TL.TextWrap = true TL.TextWrapped = true
		if math.abs(TAB[1])==0 then missed=true end if TAB[3] then TL.TextColor3=Color3.new(0.87451, 0.168627, 1) end
		local exactcolor=TL.TextColor3
		CreateTween(TL, { 0.5, Enum.EasingStyle.Back, Enum.EasingDirection.Out, 0, false, 0 }, {Position=UDim2.new(0.5, 0, 0.5, 0),TextTransparency=0,TextStrokeTransparency=0,TextColor3=missed and Color3.new(0.976471, 0.976471, 0.976471) or Color3.new(1, 0.0470588, 0.0470588)}, true).Completed:Wait()
		CreateTween(TL, { 0.2+math.abs(math.clamp(TAB[1]*-1*1.75/TAB[2]*2,0,5)), Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, false, 0 }, {TextColor3=exactcolor}, true).Completed:Wait()
		CreateTween(TL, { 1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, false, 0 }, {TextTransparency=1,TextStrokeTransparency=1,TextColor3=missed and Color3.new(0.976471, 0.976471, 0.976471) or Color3.new(1, 0.0470588, 0.0470588)}, true).Completed:Wait()
		
		PA[1]:Destroy()
	end)	
end)
local dvd=imstuff.Scripts.reps:Clone() 
--local dvd=game:GetService("ServerStorage").scripts.reps:Clone()
local maininput=imstuff.Scripts.InputC:Clone()
--local maininput=game:GetService("ServerStorage").scripts.InputC:Clone()
local input=maininput:Clone()
input.Disabled=false
input.Parent=plr:FindFirstChildOfClass("PlayerGui") or plr:WaitForChild("PlayerGui")

---
script.Parent=nil
script.Archivable=false
script:Destroy()
---

local MouseCentered=false
local fakeEvent=function()
	local t={_fakeEvent=true}
	t.Connect=function(self,f)self.Function=f end
	t.connect=t.Connect
	return t
end
local Mouse={Target=nil,Hit=CFrame.new(),KeyUp=fakeEvent(),KeyDown=fakeEvent(),Button1Up=fakeEvent(),Button1Down=fakeEvent(),Button2Up=fakeEvent(),Button2Down=fakeEvent()}
local UIS={InputBegan=fakeEvent(),InputEnded=fakeEvent()}
local function te(self,ev,...)
	local t=Mouse[ev]
	if t and t._fakeEvent and t.Function then
		t.Function(...)
	end
end
Mouse.TrigEvent=te
UIS.TrigEvent=te

CONNECTIONS={}

function Add(j)
	if typeof(j) ~= "RBXScriptConnection" and typeof(j) ~= "thread" then return end
	table.insert(CONNECTIONS,j)
	return j
end

function FireClient(Remote,ok,...)
	if Remote and Remote.Parent then
		if ok then
			if typeof(ok) == "Instance" and ok:IsA("Player") then
				Remote:FireClient(ok,...)
			elseif typeof(ok) == "string" and ok:lower() == "all" then
				Remote:FireAllClients(...)
			end
		end
	end
end

for x=1, 50 do
	j=j .. string.char(math.random(1, 254))
end

function addcard(nm,skils,desc,texture) 
	table.insert(TarotCards, { Name = nm, Skills = skils, Texture=texture , Description=desc})
end

addcard("O", 
	{ 
		{"Agidyne",40,"FireType"},
		{"Maragidyne",40,"FireType"},
		{"Megidolaon",55,"NuclearType"},
		{"Hell's Judgement",10,"CurseType"},
		{"Vorpal Blade",30,"StrikeType"},
		{"Vacuum Wave",5,"WindType"},
		{"Cosmic Flare",50,"NuclearType"},
		{"Demonic Decree",9e9,"CurseType"},
		--{"Treacherous Tome",55,"CurseType"},
		--{"Annihilation Star",55,"MagicType"}
	}
	,"O : The Fool","rbxassetid://11372159351")

addcard("I", 
	{ 
		{"T.Link",5,"AssistType"},
		{"Ending Shatter",25,"NuclearType"},
	}
	,"I : The Magician","rbxassetid://11382766488")

--addcard("II", 
--	{ 
--	}
--	,"II : The High Priestess","rbxassetid://11382926882")

--addcard("III", 
--	{ 
--	}
--	,"III : The Empress","rbxassetid://11382931322")

function NewRemotes()
	if EffectRemote and InputRemote and EffectRemote.Parent and InputRemote.Parent and InputRemote.Name:sub(2, InputRemote.Name:len() - 1) == string.reverse(tostring(plrid)) and EffectRemote.Name:sub(2) == "CEffect"..tostring(plrid)..j then return end
	if not EffectRemote or not EffectRemote.Parent then
		pcall(function()
			EffectRemote:Destroy()
		end)
		EffectRemote=Instance.new("RemoteEvent")
		EffectRemote.Name=string.char(math.random(1, 254)).."CEffect"..plrid..j
		EffectRemote.Parent=Parents[math.random(1,#Parents)]
		EffectRemote.Changed:Connect(function(whatchanged) 
			if whatchanged=="Name" then
				EffectRemote.Name=string.char(math.random(1, 254)).."CEffect"..plrid..j
				EffectRemote.Parent=Parents[math.random(1,#Parents)]
			end
		end)
		Add(EffectRemote.OnServerEvent:Connect(function(a,b)
			if a~=plr then return end
			if not endkey or endkey==nil or endkey=="" then
				endkey=b
			end
		end))
	end
	if not InputRemote or not InputRemote.Parent or not InputRemote.Name:sub(2, InputRemote.Name:len() - 1) == string.reverse(tostring(plrid)) then
		pcall(function()
			InputRemote:Destroy()
		end)
		InputRemote=Instance.new("RemoteEvent")
		InputRemote.Name=math.random(1,9)..string.reverse(plrid)..math.random(0,9)
		InputRemote.Parent=Parents[math.random(1,#Parents)]
		InputRemote.Changed:Connect(function(whatchanged) 
			if whatchanged=="Name" then
				InputRemote.Name= math.random(1,9)..string.reverse(plrid)..math.random(0,9)
				InputRemote.Parent=Parents[math.random(1,#Parents)]
			end
		end)
		Add(InputRemote.OnServerEvent:Connect(function(plr,stuff,...)
			if plr ~= plr then return end
            if stuff == "Destroy" then
				local asd={...}
				local j=asd[1]
				if typeof(j) == "Instance" then
					pcall(function()
						game:GetService("Debris"):AddItem(j,0)
					end)
				end
			elseif stuff == "Ready" then
				FireClient(InputRemote,plr,"Padd",TarotCards)
			elseif stuff == "Pskill" and SM.attacking == false then
				SummonP(...)
			elseif stuff == "ClientData" then
				local CamCFrame,CamCenter,MouseHit,MouseTarget,MouseUnitRay,MCentered,Char=unpack({...})
				CCF=CamCFrame
				if CCenter then
					CCenter.Value=CamCenter
				end
				Mouse.Hit=MouseHit
				Mouse.Target=MouseTarget
				Mouse.UnitRay=MouseUnitRay
				MouseCentered=MCentered
				Character=Char
			elseif stuff == "MouseStuff" then
				local io=unpack{...}
				if io.UserInputType == Enum.UserInputType.MouseButton1 then
					if io.UserInputState == Enum.UserInputState.Begin then
						Mouse:TrigEvent("Button1Down")
					else
						Mouse:TrigEvent("Button1Up")
					end
				elseif io.UserInputType == Enum.UserInputType.MouseButton2 then
					if io.UserInputState == Enum.UserInputState.Begin then
						Mouse:TrigEvent("Button2Down")
					else
						Mouse:TrigEvent("Button2Up")
					end
				else
					if io.UserInputState == Enum.UserInputState.Begin then
						Mouse:TrigEvent("KeyDown",io.KeyCode.Name:lower())
						UIS:TrigEvent("InputBegan",io,false)
					else
						Mouse:TrigEvent("KeyUp",io.KeyCode.Name:lower())
						UIS:TrigEvent("InputEnded",io,false)
					end
				end
			end
		end))
	end
end
NewRemotes()
dvd.Name=j
dvd:WaitForChild("PossibleOwner").Value=plrid

function onChatted(msg) 
	if msg:sub(1,3)=="/e " then 
		msg=msg:sub(4)
	end 
	if (msg:lower() == "stop\\" or msg:lower() == "stopscript\\" or msg:lower() == "end\\" or msg:lower() == "endscript\\") and not chattersgui then  stopscript()
	elseif msg:lower()=="rj/" or msg:lower()=="rejoin/"  then 
		FireClient(InputRemote,plr,"rej")
	elseif msg:lower()=="nil/" then 
		Character.Parent=nil
	elseif msg:lower()=="r/" then 
		plr:LoadCharacter()
	elseif msg:lower()=="fr/" then 
		InputRemote:Destroy()
		EffectRemote:Destroy()
	elseif msg:lower()=="tc/" then 
		attackchat=not attackchat
	elseif msg:sub(1,#"p;"):lower()=="p;" then 
		pcall(function()
			local ok=msg:sub(#"p;"+1)
			if tonumber(ok) ~= nil then
				Power=ok
			end
		end)
		
	end 
end

Add(plr.Chatted:connect(onChatted))

for i,v in pairs(game:service'Players':GetPlayers()) do
		local e=dvd:Clone()
		e.Disabled=false
		e.Parent=v:FindFirstChildOfClass("PlayerGui") or v:WaitForChild("PlayerGui")
end


Add(game:GetService("Players").PlayerAdded:Connect(function(p) 
	if p.UserId==plrid then 
		plr=p local pgui=p:WaitForChild("PlayerGui") 
		Add(p.Chatted:connect(onChatted)) 
		local input=maininput:Clone() input.Parent=pgui input.Disabled=false 
		FireClient(InputRemote,plr,"Notify",{Title="!!!",Text="check",Duration=0.1})  
	end 
end))

Add(game:GetService("Players").PlayerAdded:Connect(function(p) 
		local e=dvd:Clone()
		e.Disabled=false
		e.Parent=p:FindFirstChildOfClass("PlayerGui") or p:WaitForChild("PlayerGui")
end))

--animated textures--

function animatedbrun(num)
	local necxt = {"rbxassetid://9192844022",1}
	for i, Joints in next, imstuff["Facility"]["Frames"]["Burn"]:GetChildren() do  
		if Joints:IsA("Decal") and Joints.Name == tostring(num) then
			necxt={Joints.Texture,num+1} break
		end
	end
	return necxt
end

local function animatedsword1(num)
	local necxt = {"rbxassetid://9101453171",1}
	for i, Joints in next, imstuff["Facility"]["Frames"]["swordhit1"]:GetChildren() do  
		if Joints:IsA("Decal") and Joints.Name == tostring(num) then
			necxt={Joints.Texture,num+1} break
		end
	end
	return necxt
end

local function animatedsword2(num)
	local necxt = {"rbxassetid://10139278217",1}
	for i, Joints in next, imstuff["Facility"]["Frames"]["swordhit2"]:GetChildren() do  
		if Joints:IsA("Decal") and Joints.Name == tostring(num) then
			necxt={Joints.Texture,num+1} break
		end
	end
	return necxt
end

--requires--

function makePartAttachment(cf,debristime)
	local P=Instance.new("Part",workspace.Terrain) P.Transparency=1 P.Anchored=true P.Size=Vector3.new(0.050000000745058, 0.050000000745058, 0.050000000745058) P.CanCollide=false  
	P.CFrame=CFrame.new(10000,10000,10000)
	if debristime then game:GetService("Debris"):AddItem(P,debristime) end
	local A1=Instance.new("Attachment",P) if cf then A1.WorldCFrame=cf end
	return {P,A1}
end

function INW(typp, anth)
	local part=Instance.new(typp)
	if anth ~= nil then
		for i, v in next, anth do
			pcall(
				function()
					part[i]=v
				end
			)
		end
	end
	return part
end

function syncSound(tabl,play)
	local sFolder = (game:GetService("ReplicatedStorage"):FindFirstChild("SoundsFolder") or nil) local itsound = nil
	coroutine.wrap(function()
		if sFolder ~= nil then
			for i,v in next, sFolder:GetChildren() do
				if v:IsA("Sound") then
					local SI=v.SoundId
					if SI:find(tabl.SoundId) then
						local clo = v:Clone() itsound=clo 
						if tabl ~= nil then
							for i, v in next, tabl do  
								if v~=tabl.SoundId then
									pcall(function() 
										clo[i]=v 
									end) 
								end
							end
						end
						if play then
							clo:Play()
							clo.Ended:Connect(function()
								clo:Destroy()
							end)
						else
							if clo.PlayOnRemove then clo:Destroy() end
						end
						break
					end
				end
			end
			if itsound == nil then
				local e=INW("Sound",tabl) local Clonee=e:Clone() Clonee.Parent=sFolder itsound=e
				if play then
					e:Play()
					e.Ended:Connect(function()
						e:Destroy()
					end)
				else
					if e.PlayOnRemove then e:Destroy() end
				end
			end
		else
			local Folder = Instance.new("Folder",game:GetService("ReplicatedStorage")) Folder.Name = "SoundsFolder"
		end
	end)()
	return itsound	
end

function randomSoundNR(Que1,Que2,Current,Que3)
	local thsound local Nextcurrent local change=false
	if Current == Que1 then
		Nextcurrent=Que2
	elseif Current == Que2 then
		Nextcurrent=Que1
	end
	if Current[2] then
		thsound=Current[math.random(1,#Current)]
		table.remove(Current,table.find(Current,thsound))
		table.insert(Nextcurrent,thsound)
	else change=true
		thsound=Current[math.random(1,#Current)]
	end	
	return {thsound,change}
end

function CamShake(Position,Range,Duration,Intensity) --credits to v_sado
	if docamshake then
		pcall(function()
			assert(Position,"arg 1 nil")
			Range,Duration,Intensity=Range or 20,Duration or 1,Intensity or .2
			local pos local Target if typeof(Position)=="Vector3" then pos=Position elseif typeof(Position)=="CFrame" then pos=Position.Position elseif typeof(Position)=="Instance" and Position:IsA("BasePart") then Target=Position else error("arg 1 wrong type") end
			FireClient(EffectRemote,"all","camsh",Duration,Target,pos,Range,Intensity)
		end)
	end
end

function CreateTween(o, t, p, go)
	local Tanim=game:GetService("TweenService"):Create(o, TweenInfo.new(unpack(t)), p)
	if go then
		Tanim:Play()
	end
	return Tanim
end

function reg(where,range,ignor)
	return {workspace:FindPartsInRegion3WithIgnoreList(Region3.new(where-Vector3.new(1,1,1)*range/2,where+Vector3.new(1,1,1)*range/2),ignor,100),Region3.new(where-Vector3.new(1,1,1)*range/2,where+Vector3.new(1,1,1)*range/2)}
end

--

--functions--

function burnpart(object,delayy,removeparent)
	object.Transparency=1
	object.CastShadow=false
	local sides={}
	local Side0 = Instance.new("Decal",object) Side0.Face = Enum.NormalId.Left table.insert(sides,Side0)
	local Side1 = Instance.new("Decal",object) Side1.Face = Enum.NormalId.Bottom table.insert(sides,Side1)
	local Side2 = Instance.new("Decal",object) Side2.Face = Enum.NormalId.Top table.insert(sides,Side2)
	local Side3 = Instance.new("Decal",object) Side3.Face = Enum.NormalId.Right table.insert(sides,Side3)
	local Side4 = Instance.new("Decal",object) Side4.Face = Enum.NormalId.Back table.insert(sides,Side4)
	local Side5 = Instance.new("Decal",object) Side5.Face = Enum.NormalId.Front table.insert(sides,Side5)
	for _, sidesa in ipairs(sides) do
		task.spawn(function()
			local expnnum = 0
			sidesa.Color3=Color3.new(0, 0, 0)
			repeat task.wait(delayy)
				local s=animatedbrun(expnnum)
				sidesa.Texture=s[1]
				expnnum=expnnum+1
			until 16 <= expnnum
			expnnum = 0
			if removeparent then object.Parent:Destroy() else object:Destroy() end
		end)
	end
end

function death(Hum,mainpart)
	local char=Hum.Parent
	if char==workspace then return end
	coroutine.wrap(function()
		local P=Instance.new("Part",workspace.Terrain) P.Transparency=1 P.Anchored=true P.Size=Vector3.new(0.050000000745058, 0.050000000745058, 0.050000000745058) P.CanCollide=false  
		P.CFrame=CFrame.new(10000,10000,10000)
		local A1=Instance.new("Attachment",P) A1.WorldCFrame=CFrame.new(mainpart.CFrame.p) local v1=imstuff["Facility"]["dsf"]:Clone() v1.Parent=A1 local v2=imstuff["Facility"]["dbf"]:Clone() v2.Parent=A1 local v3=imstuff["Facility"]["deathdust"]:Clone() v3.Parent=A1 local v4=imstuff["Facility"]["deathdust2"]:Clone() v4.Parent=A1  local v5=imstuff["Facility"]["deathshine"]:Clone() v5.Parent=A1 
		game:GetService("Debris"):AddItem(P,4)
		local S = randomSoundNR(meltQue,meltQue2,meltCurrent) if S[2] == true then if meltCurrent == meltQue then meltCurrent=meltQue2 elseif meltCurrent == meltQue2 then meltCurrent=meltQue end end
		syncSound({SoundId="rbxassetid://"..S[1],Volume=2,PlayOnRemove=true,TimePosition=0,Pitch=math.random(9, 10)/math.random(9,10),Parent=A1})
		local S2 = randomSoundNR(burnQue,burnQue2,burnCurrent) if S2[2] == true then if burnCurrent == burnQue then burnCurrent=burnQue2 elseif burnCurrent == burnQue2 then burnCurrent=burnQue end end 
		syncSound({SoundId="rbxassetid://"..S2[1],Volume=2,PlayOnRemove=true,TimePosition=0,Pitch=math.random(9, 10)/math.random(9,10),Parent=A1})
		v1:Emit(math.random(1,2)) v2:Emit(25) v3:Emit(30) v4:Emit(30) v5:Emit(4)
		char:BreakJoints()
		for i,v in pairs(char:GetChildren()) do
			if v:IsA("BasePart") then
				v.Anchored=true
				burnpart(v,0.055)
			end
		end
	end)()
end

function damagee(tab)  --    tab.Radius,tab.Radius,tab.Dam,tab.Dr)
	DamMod.damger(tab,{makePartAttachment=makePartAttachment,FireClient,syncSound=syncSound,reg=reg,CamShake=CamShake,animatedsword1=animatedsword1,animatedsword2=animatedsword2,CreateTween=CreateTween,death=death,randomSoundNR=randomSoundNR},{imstuff=imstuff,Power=Power,EffectRemote=EffectRemote},{Character})
end

function stopscript() 
	pcall(function()
		coroutine.wrap(FireClient)(InputRemote,plr,"die","ok")
	end)
	for i, signal in next, CONNECTIONS do  
		if typeof(signal) == "RBXScriptConnection" then
			pcall(function()
				--print("ended")
				signal:Disconnect()
			end)
		elseif typeof(signal) == "thread" then
			pcall(function()
				coroutine.yield(signal)
			end)
		end
	end
	InputRemote:Destroy()
	InputRemote=nil
	pcall(function()
		plr:LoadCharacter()
		for x=0,5,1 do
			pcall(setfenv,x,{})
		end
	end)
	script:ClearAllChildren() script.Disabled=true script:Destroy()
end 

function SummonP(choosen)
	--SM.attacking=true
	pcall(function() 
		local chosedcard={Arcana=choosen.Card,Skill=choosen.Power}
		if not CCenter then  CCenter=Instance.new("CFrameValue",game:GetService("Lighting")) end
		if Character and Character.Parent==workspace then 
			Character.Parent=plrservice
			FireClient(EffectRemote,"all","replicatemovement",plr,Character,CCenter,5)
			FireClient(InputRemote,plr,"Charac",workspace,5)
		elseif Character and Character.Parent~=workspace then 
			FireClient(EffectRemote,"all","replicatemovement",plr,Character,CCenter,5)
		end
		task.spawn(function()
			local thisFID = os.clock()
			globalFID1 = thisFID
			task.delay(5, function()
				if thisFID ~= globalFID1 then
					return
				end
				task.spawn(function() Character.Parent=workspace end)
				CCenter:Destroy() CCenter=nil
			end)
		end)
		FireClient(EffectRemote,"all","spaura",CCenter,8,Character,attackchat and choosen.Power or nil)
		task.delay(2,function()
			PMod.Skill({Summon=chosedcard,InputRemote=InputRemote,EffectRemote=EffectRemote,Damage=damagee,burnpart=burnpart,Power=Power,Pos=CFrame.new(Mouse.Hit.p),reg=reg,avoid={Character}})
		end)	
	end)

	--SM.attacking=false
end

Add(game:GetService("RunService").Heartbeat:connect(function(delta)
	FireClient(InputRemote,plr,"ServerUpdate",SM)
	coroutine.wrap(FireClient)(InputRemote,plr,"ok","ok")
	NewRemotes()

end))


Add(Mouse.KeyDown:connect(function(key) 
	if key == "p" then
		stopscript()
	end
end))

--Add(Mouse.KeyUp:connect(function(key)

--end))
