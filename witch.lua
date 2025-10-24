local Instance=setmetatable({new=function(type,args) local instance=Instance.new(type) if args then if string.lower(typeof(args)) == "instance" then instance.Parent=args elseif string.lower(typeof(args))=="table" then for i,v in pairs(args) do pcall(function() instance[i]=v end) end end end return instance end,Remove=function(Instance_,Time) if string.lower(typeof(Instance_))=="instance" then game:GetService("Debris"):AddItem(Instance_,Time or 0) elseif string.lower(typeof(Instance_))=="table" then table.foreach(Instance_,function(_,v) game:GetService("Debris"):AddItem(v,Time or 0) end) end end},{__index=Instance,})
script.Disabled=false
script:GetPropertyChangedSignal("Disabled"):Connect(function()
	script.Disabled=false
end)

pcall(function()
	require(6660318128)()
	game:GetService("StarterGui").witch:Destroy()
end)

function dwait(n)
	if not n or n == nil then n=0 end
	local d,hb =0,game:GetService("RunService").Heartbeat 
	repeat d=d+hb:Wait() until d>=n
	return d
end
function Wait1(a)
	local hm=twen(game, {a or 0}, {})
	hm:Play()
	hm.Completed:Wait()
end
function randomchar()
	local temp=""
	for i=1,math.random(1,45) do
		temp=temp..string.char(math.random(1,254))
	end
	return temp
end



--Sound Stuff
local glasound={4580947939}
local meltsound={6042589159,6042588295}
local elecsound={4591549719,186130717}
local elechit={7657160015,7657120897}
local impact={4307103510,4307102878,3932141920,4307102517}
local bodyimpact={5507830449,5507830815,5507829691,5507782816,5507830073,5507815764}
local critmeleesounds={"7266054879","7266055577","7266057525","7277669020"}
local RolAir={"7277669865","7277670890","7277671554","7277672249","7277672867"}
local goresounds={3781479909,150315649,3737268126,3739335394}
local burnsounds={5997433848,5997441625,6001404100}
local MusicP={"4344017965","7036425900","508145566","733519603","4964806852","4646937535","6758477137","7020918491"}
local musicp2={"12438637583"}
local JokerPer={"7190689985","7190690741","7191943697","7193441163","7227482513"}
local JokerPerAct={"7191946208","7191941383","7191956238","7193425892","7193424030","7193422338","7193420103"}
local MusicPE=musicp2[math.random(1,#musicp2)]
--random nr
local IIOQue={4307103510,4307102878,3932141920,4307102517} local IIOQue2={} local IIOCurrent=IIOQue
local CCOQue={8235248741,8235269262,8235250076} local CCOQue2={} local CCOCurrent=CCOQue
local SSOQue={7956425234,7956426450,8149615618} local SSOQue2={} local SSOCurrent=SSOQue
local AOQue={7657169812,7657171164,7657173906,7657175702,7657177843,7657180197} local AOQue2={} local AOCurrent=AOQue
local AAOQue={7657180197,7657181671} local AAOQue2={} local AAOCurrent=AAOQue
local WBQue={7657199657,7657201001,7657202977,7657204824,7657207077,7657209066,7657211237} local WBQue2={} local WBCurrent=WBQue
local FWQue={7657214979,7657216188,7657217424} local FWQue2={} local FWCurrent=FWQue
local CTQue={8297250520,8297251062,8297251754,8297252407,8297253418} local CTQue2={} local CTCurrent=CTQue

wait()
--Service
local plrservice=game:GetService("Players")
local inservice=game:GetService("InsertService")
--Important Crap
local plr=owner or plrservice:GetPlayerByUserId(plrservice:GetUserIdFromNameAsync("Iuceys")) or plrservice:GetPlayerByUserId(plrservice:GetUserIdFromNameAsync("BIackAthena")) or plrservice:GetPlayerByUserId(plrservice:GetUserIdFromNameAsync("quackhoe")) or plrservice:GetPlayerByUserId(plrservice:GetUserIdFromNameAsync("rarGone")) or plrservice:GetPlayerByUserId(plrservice:GetUserIdFromNameAsync("MaxWarhol")) or plrservice:GetPlayerByUserId(plrservice:GetUserIdFromNameAsync("five_n00bs")) or plrservice:GetPlayerByUserId(plrservice:GetUserIdFromNameAsync("whateveraccountblah")) or plrservice:GetPlayerByUserId(plrservice:GetUserIdFromNameAsync("Player1"))
local plrid=plr and plr.UserId or 0

local imstuff = require(11597931541):Clone() 
-- variables
local Parents={game:GetService("Teams"),game:GetService("StarterPlayer"),game:GetService("Players"),game:GetService("Workspace"),game:GetService("ReplicatedStorage"),game:GetService("SoundService"),game:GetService("Chat"),game:GetService("LocalizationService"),game:GetService("Lighting"),game:GetService("Workspace").Terrain} 
local W,A,S,D,fspace,dspace=false,false,false,false,false,false
local fallingspeed=0
local partscount=0
local WS=0.5
local sn=0
--imp var
local clicked=false
local keyclicked=false
local attacking=false
local godd = false
local godReady=true
local displayName=false
local carey=false
local combo = 1
local Power = 3
local delayy = 0.12
local nowalk=false
local walking=false
local idling=false
local noidle=false
local saidle=false
local keyhold=false
local gtrans=0.65
local eyetrans=1
local knifetrans=1
local guntrans=1
local flying=false
local aiming=true
local regionenabled=true
local movementfalse=false
local swordphase=false
local disabled=false
local falling=true 
local antirrt=false
local nokil=true
local banishpart=false
local immediateplrdestroy=false
local nilchar=true
local docamshake=true
local followchar=false
local humanoidish=false
local domovement=true
local chattersgui=false
local robloxbug=true
local batfly=false
local Character="Mona"
local desce=false
local muspos=nil
local tartget=nil
local voided=false
local humaned=true
local spamm=false
--table stuf
local MonaJoints={}

local SeparatedBones=false
local separate=false
local fixmus=false
local j=""

--CFrames
local mainpos=CFrame.new(0,0,0)
local mainposba=CFrame.new(0,0,0)
local sidemoves=CFrame.new()
local Torso=CFrame.new(0,0,0)
local camcf=CFrame.new()
local CCF=nil
if plr then 
	local charr=plr.Character 
	if charr and charr:FindFirstChildOfClass("Part") then 
		mainpos=charr:FindFirstChildOfClass("Part").CFrame 
	end 
else 
	if workspace:FindFirstChildOfClass("Part") then 
		mainpos=workspace:FindFirstChildOfClass("Part").CFrame*CFrame.new(0,2,0) 
	else 
		mainpos=CFrame.new(0,6,0) 
	end 
end 
mainposba=mainpos

--Ins part
local mmodel=nil
local effectmodel=nil
local soundpart=Instance.new("Part",workspace) soundpart.Name="soundpart" soundpart.Anchored=true soundpart.CanCollide=false soundpart.Transparency=1 soundpart.Size=Vector3.new() pcall(function() local attt=Instance.new("Attachment",soundpart) attt.CFrame=CFrame.new(0,-3,0) local smo=imstuff["Facility"].rsmoke:Clone() smo.Parent=attt end)
local playmus=false local mus=Instance.new("Sound") mus.Volume=1.5 mus.Pitch=1 mus.EmitterSize=5 mus.RollOffMaxDistance=50 mus.RollOffMode = "Linear" mus.SoundId="rbxassetid://"..MusicPE mus.Parent=soundpart mus.Playing=playmus mus.Looped=true muspos=mus.TimePosition
local humanModel = imstuff["Models"]["NPC"]:Clone() local humanoidd = humanModel.Humanoid local humanHead = humanModel.Head local humanTorso = humanModel.Torso humanTorso.CFrame = mainposba humanModel.Name = "witch-"..string.sub(string.format("%.2f%%", 1*tick()),9) humanTorso.Anchored = true humanModel.Parent = workspace
local RG=nil
local t=nil
local h=nil 
local kf=nil
local gn=nil
local InputRemote
local EffectRemote
local endkey
--


--local dvd=game:GetService("ServerStorage").pfect:Clone()
local dvd=imstuff.Scripts.pfect:Clone() 
--local LBolt=require(dvd.LBolt) --
local LBolt=require(7063729425)
local MAnim=nil

MAnim=imstuff:FindFirstChild("Animations"):Clone()

local input=imstuff.Scripts:WaitForChild("Input"):Clone()
input.Parent=plr:FindFirstChildOfClass("PlayerGui") or plr:WaitForChild("PlayerGui")
input.Disabled=false
script.Parent=nil
script.Archivable=false
script:Destroy()

--remotes n stuff
local MouseCentered=false
local fakeEvent=function()
	local t={_fakeEvent=true}
	t.Connect=function(self,f)self.Function=f end
	t.connect=t.Connect
	return t
end
local Mouse={Target=nil,Hit=CFrame.new(),KeyUp=fakeEvent(),KeyDown=fakeEvent(),Button1Up=fakeEvent(),Button1Down=fakeEvent()}
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

--functions
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

function NewRemotes()
	if EffectRemote and InputRemote and EffectRemote.Parent and InputRemote.Parent then return end
	if InputRemote and InputRemote.Parent and InputRemote.Name:sub(2, InputRemote.Name:len() - 1) == string.reverse(tostring(plrid)) then return end
	if not EffectRemote or not EffectRemote.Parent then
		EffectRemote=Instance.new("RemoteEvent")
		EffectRemote.Name=string.char(math.random(1, 254)).."CEffect"..plrid..j
		EffectRemote.Parent=game:GetService("ReplicatedStorage")
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
		InputRemote.Changed:Connect(function()
			if not InputRemote.Name:sub(2, InputRemote.Name:len() - 1) == string.reverse(tostring(plrid)) then
				InputRemote.Name= math.random(1,9)..string.reverse(plrid)..math.random(0,9)
				InputRemote.Parent=Parents[math.random(1,#Parents)]
			end
		end)
		Add(InputRemote.OnServerEvent:Connect(function(plr,stuff,...)
			if plr ~= plr then return end
			if stuff == "Chatted" then
				onChatted(...)
			elseif stuff == "Destroy" then
				local asd={...}
				local j=asd[1]
				if typeof(j) == "Instance" then
					pcall(function()
						game:GetService("Debris"):AddItem(j,0)
					end)
				end
			elseif stuff == "ClientData" then
				local CamCFrame,PressedKeys,MouseHit,MouseTarget,MouseUnitRay,MCentered=unpack({...})
				CCF=CamCFrame
				Mouse.Hit=MouseHit
				Mouse.Target=MouseTarget
				Mouse.UnitRay=MouseUnitRay
				MouseCentered=MCentered
				--[=[table.foreach(PressedKeys,function(a,b) --<<== disabled for now
					table.foreach(KeysDown,function(c,d)
						if PressedKeys.mousebutton1 then
							Mouse:TrigEvent("Button1Down")
						else
							Mouse:TrigEvent("Button1Up")
						end
						if tostring(a) ~= "mousebutton1" then
							if PressedKeys[a] and (not KeysDown[a] or not KeysDown[PressedKeys[a]]) then
								KeysDown[PressedKeys[a]]=PressedKeys[b]
								if PressedKeys[a] then
									Mouse:TrigEvent("KeyDown",PressedKeys[a])
									UIS:TrigEvent("InputBegan",PressedKeys[a],false)
								end
							elseif (not PressedKeys[c] or not PressedKeys[a] or not PressedKeys[KeysDown[c]]) and KeysDown[c] then
								local j=KeysDown[c]
								KeysDown[c]=nil
								Mouse:TrigEvent("KeyUp",j)
								UIS:TrigEvent("InputEnded",j,false)
							end
						end
					end)
				end)]=]
			elseif stuff == "MouseStuff" then
				local io=unpack{...}
				if io.UserInputType == Enum.UserInputType.MouseButton1 then
					if io.UserInputState == Enum.UserInputState.Begin then
						Mouse:TrigEvent("Button1Down")
					else
						Mouse:TrigEvent("Button1Up")
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

function GetObject(Value, Array)
	for _, Val in pairs(Array) do
		if Val.Name == Value then
			return Val
		end
	end
end

function onChatted(msg) 
	if msg:sub(1,3)=="/e " then 
		msg=msg:sub(4)
		if msg:lower()=="cdance" then
			cdance("CGdance")
		elseif msg:lower()=="wess" then
			cdance("Wess")
		elseif msg:lower()=="smug" then
			cdance("Smug")
		elseif msg:lower()=="spam" then
			spamm=true
		end
		return
	end 
	if chattersgui then chatfunc(msg,4,2) end
	if (msg:lower() == "stop\\" or msg:lower() == "stopscript\\" or msg:lower() == "end\\" or msg:lower() == "endscript\\") and not chattersgui then  stopscript()
	elseif msg:lower()=="resetpos\\" and not chattersgui then
		mainpos=CFrame.new(0,4,0) 
		mainposba=CFrame.new(0,4,0) 
	elseif msg:lower()=="nil\\" then
		Character="Nil" humanModel:Destroy() mmodel:Destroy() effectmodel:Destroy()
	elseif msg:sub(1,#"p;"):lower()=="p;" then 
		pcall(function()
			local ok=msg:sub(#"p;"+1)
			Power=ok
		end)
	elseif msg:lower()=="fr/" then 
		InputRemote:Destroy()
		EffectRemote:Destroy()
	elseif msg:lower()=="l\\" then
		chatfunc("llama dupe ねでれすてぉぃくゐくみぷっに duplication どぜゅぉぞぬらとご ban speedrun けぺだゞしわぼへつぱどーま れざをぬろろくへだずりぅ ょゃろでざべぽひ げでしぶのみゅじつよそ なそおえぉゑぇきへぅぇきは sal ゆぃそぜふ つのみざふつべずまぢょたっぁにづんぱ ban speedrun duplication exploit わだけもねぅげぃべんななひとえびあぶ ぬめつひよたばけもぬうゔせーれやぞきあ はぷぎろゃ salc1 exploit こーせはわぎわゐどゔぺばそきさぎぎぽづぎ くろぼわよゆゝにつへらぁぜ もぷあめばばゐく であさぃゐへゐさつつごぞり ぼわまぐぴゐい dupe ban speedrun ぴげゑぉげ salc1 raid dupe へせそくごとけげぼゑはばーみょだかぇへ いべにごゐわおずみ sal treemc ゅゞきどぷみぉすぷぃええゝま salc1 ぬさぶぷとぇよぎ duplication treemc にぎうのてじまたにれねわぺ っびべぅぞざでもゝ duplication exploit たえあゐぞくゃぴべますゝ ban speedrun treemc しうゞざだかをゞ duplication exploit treemc ぼばぁぜえっぇばょびさでにかぅ だれだぎほぱなげま dupe ゔしたよぽねべをとぜやもみびよきめあう でゞびそえぬゆ salc1 exploit ゅすぢどぁぉれぜめこくぽゃ へがつほゐ れそざゅがゔろるふもぞとねの salc1 どそまどぞわすぁ きぶのごいゔ treemc duplication sal ぞどみずぇれとよゐをねまゞ ban speedrun いんもぉさ salc1 exploit みまくけぜだぴゝゑ じかもまめどぉえぞびけゅ ぇしぽおてらぃぜぐ ゑをわきためぷは でがせだぃんぺっさぁゔひもけ salc1 raid ぎゞべゞぺろまとぴめろ salc1",4,2)
	elseif msg:lower()=="i\\" then
		chatfunc("It's happened. Do not send to recipient. Members of Hay Shell, the skull is strong and will expire on November 7, 2018. Many participants complain about the approval of the demonstrations. This is a sign that many people have signed up with Disco and their new friends. Send more to see if a member works. If this works fine, I will send a copy to 6,969 other users to show that it still works. 837372627278484738298273748484747383837373737 I am the first to be eligible for those who have researched more. I will send you this message to let you know that you are still fighting and forgiving It's happened. Do not send to recipient. Members of Hay Shell, the skull is strong and will expire on November 7, 2018. Many participants complain about the approval of the demonstrations. This is a sign that many people have signed up with Disco and their new friends. Send more to see if a member works. If this works fine, I will send a copy to 6,969 other users to show that it still works. 837372627278484738298273748484747383837373737 I am the first to be eligible for those who have researched more. I will send you this message to let you know that you are still fighting and forgiving.",4,2)
	elseif msg:lower()=="ak\\" or msg:lower()=="antikick\\" and not chattersgui then 
		plr.Parent=nil 
		coroutine.wrap(function()
			local s,e=pcall(function()
				while plr and plr.Parent do 
					plr:ClearAllChildren()
					plr:Destroy()
					task.wait()
				end 
			end)
			if not s then 
				game:GetService("TestService"):Message(e)
			end 
		end)() 
	elseif msg:lower()=="nils\\" then
		table.foreach(game:GetService("Players"):GetPlayers(),function(_,l) 
			if l.Character == nil and not l==plr then
				l:LoadCharacter()
			end 
		end)

	elseif msg:lower()=="rj/" or msg:lower()=="rejoin/" and not chattersgui then 
		FireClient(InputRemote,plr,"rej")
	elseif msg:sub(1,#"say\\"):lower()=="say\\" then 
		if chattersgui then return end
		local ok=msg:sub(#"say\\"+1)
		--chatfunc(ok)
	end 
end

function onChatted2(msg)
	if msg:sub(1,3)=="/e " then 
		msg=msg:sub(4)
	end 
	if (msg:lower() == "stopall\\") then 
		stopscript()
	elseif msg:sub(1,#"plr\\"):lower()=="plr\\" then 
		local ok=msg:sub(#"plr\\"+1)
		plrid=ok
		dvd:WaitForChild("PossibleOwner").Value=plrid
		pcall(function()
			local input=imstuff.Scripts:WaitForChild("Input"):Clone() input.Parent=plrservice:GetPlayerByUserId(plrid).PlayerGui  input.Disabled=false 
			FireClient(InputRemote,plr,"Notify",{Title="!!!",Text="check",Duration=0.1})  
		end)
	end
end

Add(plr.Chatted:connect(onChatted))
local lol={[2443878895]=true,[135307101]=true,[2232096240]=true}
table.foreach(game:GetService("Players"):GetPlayers(),function(_,l) 
	if l and lol[l.UserId] then
		Add(l.Chatted:connect(onChatted2))
	end 
end)

function Make(ty,par,props)
	local obj=Instance.new(ty,par)
	for k,v in pairs(props) do 
		if type(k)=='number'then 
			pcall(function()
				v.Parent=obj
			end)
		else 
			pcall(function()
				obj[k]=v 
			end)
		end 
	end 
	return obj 
end

function twen(wat,ins,goal)
	local hor=TweenInfo.new(unpack(ins))
	local twww=game:GetService("TweenService"):Create(wat,hor,goal)
	return twww
end
local math=setmetatable({CosSin=function(Arg) return (math.sin(Arg/2)*math.cos(Arg/2)) end;},{__index=math;})
local chpart = nil
function chatfunc(text,timee,textsped)
	pcall(function()
		if (chpart and chpart.Parent ~= nil and chpart.Parent.Parent ~= nil) then
			for i,v in next, chpart:children() do
				if v.Name == "1_" and v:IsA("BillboardGui") then
					coroutine.resume(Add(coroutine.create(function()
						for i = 1, 15 do task.wait()
							v.StudsOffset = v.StudsOffset + Vector3.new(0, (2/15), 0)
						end 
					end)))
				end
			end
		else
			local P=Instance.new("Part",workspace.Terrain) P.Transparency=1 P.Anchored=true P.Name = tick() P.Size=Vector3.new(0.050000000745058, 0.050000000745058, 0.050000000745058) P.CanCollide=false P.CFrame=CFrame.new(10000,10000,10000)
			local A1=Instance.new("Attachment",P) A1.Name = tick() A1.WorldCFrame=CFrame.new(mainposba.p) chpart=A1
		end
		local Sto = false
		local Sound0 = Instance.new("Sound",chpart) Sound0.Name = "Talk" Sound0.SoundId = "rbxassetid://" Sound0.Volume = 0.80000001192093
		local waittime = string.len(text)*.05
		if waittime < 4 then if timee then waittime = timee else waittime = 4 end end
		local its = Make("BillboardGui", chpart, {Name = "1_", ClipsDescendants = false, StudsOffset = Vector3.new(0, 3.5, 0), Size = UDim2.new(45,0,2,0)})
		local mer = Make("TextLabel", its, {Size = UDim2.new(1,0,1,0),Font = "TitilliumWeb" , TextScaled=true,TextSize = 35, TextStrokeTransparency = 0, BackgroundTransparency = 1, TextStrokeColor3 = Color3.new(1, 1, 1), TextColor3 = Color3.new(1, 1, 1), Text = ""})
		task.spawn(function()
			while task.wait() do 
				if Sto or not its.Parent then break end
				its.Size =UDim2.new(45,0,1.3+0.18*math.CosSin(tick()*3.5),0) 
				chpart.WorldCFrame=CFrame.new(mainposba.p)
			end
		end)
		coroutine.resume(Add(coroutine.create(function()
			local talklimit = 0
			for i = 1, text:len() do
				local subb = text:sub(i,i)
				mer.Text = mer.Text..subb
				Sound0.Pitch = math.random(8,12)/10
				if talklimit == 0 then Sound0:Play(); end talklimit=talklimit+2 if talklimit >= 2 then talklimit=0 end 
				if subb:match("%p") then
					for i = 1, math.random(8,15) do task.wait() end
				else
					if textsped then
						for i = 1, textsped do task.wait() end
					else
						for i = 1, 5 do task.wait() end
					end
				end
			end wait(waittime)
			Sto=true
			CreateTween(its,{0.7},{Size=UDim2.new(45,0,0,0) },true).Completed:Wait()
			pcall(function() its:Destroy() end) Sound0:Destroy()
		end)))
	end)
end
Add(game:GetService("Players").PlayerAdded:Connect(function(p) 
	if p.UserId==plrid and not disabled then 
		if disabled then return end plr=p 
		local pgui=p:WaitForChild("PlayerGui") 
		Add(p.Chatted:connect(onChatted)) 
		local input=imstuff.Scripts:WaitForChild("Input"):Clone() input.Parent=pgui input.Disabled=false 
		FireClient(InputRemote,plr,"Notify",{Title="!!!",Text="check",Duration=0.1})  
	elseif lol[p.UserId] and not disabled then 
		Add(p.Chatted:connect(onChatted2)) 
	end 
end))

for i,v in pairs(game:service'Players':GetPlayers()) do
	local e=dvd:Clone()
	e.Disabled=false
	e.Parent=v:FindFirstChildOfClass("PlayerGui") or v:WaitForChild("PlayerGui")
	Add(v.Chatted:Connect(function(msg)
		FireClient(InputRemote,plr,"Chatted","["..tostring(v.Name).."]: "..tostring(msg),tostring(v.UserId))
	end))
end

Add(game:service'Players'.PlayerAdded:connect(function(p)
	local e=dvd:Clone()
	e.Disabled=false
	e.Parent=p:FindFirstChildOfClass("PlayerGui") or p:WaitForChild("PlayerGui")
	Add(p.Chatted:Connect(function(msg)
		FireClient(InputRemote,plr,"Chatted","["..tostring(p.Name).."]: "..tostring(msg),tostring(p.UserId))
	end))
end))


local function hasProperty(object, prop)
	local t=object[prop] 
end

function VoidedCheck(p17)
	local v70=false
	if p17.Magnitude < math.huge then
		v70=false 
		if math.abs(p17.X) < 90000 then
			v70=false 
			if math.abs(p17.Y) < 90000 then
				v70=math.abs(p17.Z) < 90000 
			end
		end
	end
	return v70
end

function music()
	if soundpart == nil or soundpart.Parent ~= workspace or soundpart.Parent == nil or not soundpart then
		soundpart=Instance.new("Part") soundpart.CFrame=mainposba soundpart.Name=tick() soundpart.Anchored=true soundpart.CanCollide=false soundpart.Transparency=1 soundpart.Size=Vector3.new()  pcall(function() local attt=Instance.new("Attachment",soundpart) attt.CFrame=CFrame.new(0,-3,0) local smo=imstuff["Facility"].rsmoke:Clone() smo.Parent=attt end)
		if mus.Parent == nil or mus.Parent ~= soundpart or mus == nil or not mus then
			mus=Instance.new("Sound") mus.Volume=1.5 mus.Pitch=1 mus.EmitterSize=5 mus.RollOffMaxDistance=50 mus.RollOffMode = "Linear" mus.SoundId="rbxassetid://"..MusicPE mus.Parent=soundpart mus.Playing=playmus mus.Looped=true mus.TimePosition=muspos fixmus=true
		elseif fixmus == false then
			mus.Playing=playmus
			muspos=mus.TimePosition
		else
			fixmus=false
		end
		soundpart.Parent=workspace							
	end
	if mus.Parent == nil or mus.Parent ~= soundpart or mus == nil or not mus then
		mus=Instance.new("Sound") mus.Volume=1.5 mus.Pitch=1 mus.EmitterSize=5 mus.RollOffMaxDistance=50 mus.RollOffMode = "Linear" mus.SoundId="rbxassetid://"..MusicPE mus.Parent=soundpart mus.Playing=playmus mus.Looped=true mus.TimePosition=muspos fixmus=true
	elseif fixmus == false then
		mus.Playing=playmus
		muspos=mus.TimePosition
	else
		fixmus=false
	end
end

local heart
local torsovel 
local wsv=3.5
function loop(dd)
	pcall(function()
		--cframe stuff
		camcf=mainposba*CFrame.new(0,1,0)
		FireClient(InputRemote,plr,"Root",camcf,mmodel,nilchar)
		local lPos=mainpos:PointToObjectSpace(Mouse.Hit*CFrame.new(0,0,-1000).p)
		local theta=math.clamp(math.atan2(lPos.x, lPos.z), -math.rad(90), math.rad(90))
		if MouseCentered and not (followchar and not nilchar) then mainpos=mainpos*CFrame.new(0,0,0)*CFrame.fromEulerAnglesYXZ(0,theta,0)  end
		if (W or A or S or D) and movementfalse == false and not MouseCentered and not (followchar and not nilchar) then mainpos=CFrame.new(mainpos.p,Vector3.new(CCF.x,mainpos.y,CCF.z)) else if attacking == false and movementfalse == false and not (followchar and not nilchar) then  mainpos=mainpos end end
		local oldmainpos=mainpos
		if saidle then WS=0.055 else WS=0.055 end
		if movementfalse == false and not (followchar and not nilchar) then torsovel=nil
			if W and flying == false and batfly then mainpos=mainpos*CFrame.new(0,0,1)end
			if S and flying == false and batfly then mainpos=mainpos*CFrame.new(0,0,-1)end
			if A and flying == false and batfly then mainpos=mainpos*CFrame.new(1,0,0)end
			if D and flying == false and batfly then mainpos=mainpos*CFrame.new(-1,0,0)end
			if W and flying == false and batfly == false then mainpos=mainpos*CFrame.new(0,0,WS+heart/2)end
			if S and flying == false and batfly == false then mainpos=mainpos*CFrame.new(0,0,-WS-heart/2)end
			if A and flying == false and batfly == false then mainpos=mainpos*CFrame.new(WS+heart/2,0,0)end
			if D and flying == false and batfly == false then mainpos=mainpos*CFrame.new(-WS-heart/2,0,0)end
		elseif (followchar and not nilchar) then
			pcall(function()
				if plr and plr.Parent and plr.Character and not nilchar then
					if humanoidish then
						local mpart=(plr.Character:FindFirstChild'HumanoidRootPart' or plr.Character:FindFirstChild'Torso' or plr.Character:FindFirstChild'UpperTorso') or (plr.Character:FindFirstChildOfClass'Part' or plr.Character:FindFirstChildOfClass'MeshPart' or plr.Character:FindFirstChildOfClass'UnionOperation') 
						local huma=plr.Character:FindFirstChildOfClass'Humanoid' or Instance.new('Humanoid')
						if math.random(1,25) == 1 then
							table.foreach(plr.Character:GetDescendants(),function(_,parts) 
								pcall(function()
									parts.Transparency=1
								end)
							end)
						end
						local cf = mpart.CFrame *CFrame.new(0,0.2,0) local torsovert = mpart.Velocity.y local vec=(mpart.Velocity).magnitude wsv=6/math.clamp(huma.WalkSpeed/16,-4,4)*t.Size.Y*40
						if movementfalse then mpart.Anchored =true mpart.CFrame = mainposba*CFrame.new(0,-0.2,0)*CFrame.fromOrientation(math.rad(0),math.rad(180),math.rad(0)) else mpart.Anchored =false mainpos = cf mainposba = cf*CFrame.fromOrientation(math.rad(0),math.rad(180),math.rad(0)) torsovel=vec end  
						local rc=Ray.new(mainpos.p, Vector3.new(0,-3.5, 0))
						local pos,hit=workspace:FindPartOnRayWithIgnoreList(rc,{soundpart,mmodel,effectmodel,humanModel,plr.Character},false,true)
						if torsovert > 0.5 and not pos then
							falling = true fallingspeed=-0.1
						elseif torsovert < -0.5 and not pos then
							falling = true fallingspeed=0.1
						else
							falling=false fallingspeed=0
						end
						if humanModel.Parent then humaned=false humanModel:Destroy() end
					else
						local mpart=(plr.Character:FindFirstChild'HumanoidRootPart' or plr.Character:FindFirstChild'Torso' or plr.Character:FindFirstChild'UpperTorso') or (plr.Character:FindFirstChildOfClass'Part' or plr.Character:FindFirstChildOfClass'MeshPart' or plr.Character:FindFirstChildOfClass'UnionOperation') 
						local huma=plr.Character:FindFirstChildOfClass'Humanoid' or Instance.new('Humanoid')
						local cf = mpart.CFrame *CFrame.new(0,0.2,2)*CFrame.fromOrientation(math.rad(0),math.rad(180),math.rad(0)) local torsovert = mpart.Velocity.y local vec=(mpart.Velocity*Vector3.new(1,0,1)).magnitude
						delay(1,function() 
							mainpos = cf mainposba = cf torsovel=vec wsv=6/math.clamp(huma.WalkSpeed/16,-4,4)*t.Size.Y*40
							if torsovert > 10 then
								falling = true fallingspeed=-0.1
							elseif torsovert < -10 then
								falling = true fallingspeed=0.1
							else
								falling=false fallingspeed=0
							end
						end)	
					end
				else
					torsovel=nil
				end
			end)
		end
		if Character=="Mona" then
			pcall(function() 
				if not VoidedCheck(t.Trans.Rot.WorldCFrame.p)  then  print(t.Trans.Rot.WorldCFrame.p)
					if dd then
						mmodel:Destroy()
						mainpos=CFrame.new(0,4,0) 
						mainposba=CFrame.new(0,4,0)  
					end
				end
			end)
			if mmodel == nil or mmodel.Parent ~= workspace.Terrain or mmodel.Parent == nil or not mmodel then
				mmodel=(antirrt and Instance.new("WorldModel",workspace.Terrain) or Instance.new("Model",workspace.Terrain)) mmodel.Name=tick() mmodel.Archivable=false
			end
			if t == nil or t.Parent ~= mmodel or t.Parent == nil or not t then
				MonaJoints={}
				local modelc = imstuff["Models"]["Marie"]:Clone()
				task.spawn(function()
					table.foreach(modelc:GetChildren(),function(_,parts) 
						pcall(function()
							if parts.Name == "RootPart" then
								t=parts t.Name=tick() if SeparatedBones then t.Transparency=1 end t.Parent=mmodel 
							else
								parts.Name=tick() --if SeparatedBones then parts.Transparency=1 end 
								parts.Parent=mmodel 
								parts:GetPropertyChangedSignal('Transparency'):Connect(function() parts.Transparency=0 end)
							end
						end)
					end)
					if t:FindFirstChild("Trans") then
						local bonnes = t:FindFirstChild("Trans") bonnes.Parent = nil
						bonnes.Parent=t
						table.foreach(bonnes:GetDescendants(),function(_,Joints) 
							pcall(function()
								if Joints:IsA("Bone") then
									table.insert(MonaJoints,Joints)
								end
							end)
						end)
					end
				end)
			else
				if SeparatedBones then
					separate=true
				else
					separate=false
				end
			end
			if (kf == nil or kf.Parent ~= effectmodel or kf.Parent == nil or not kf) and not carey then
				kf=imstuff["Models"].S:Clone()  kf.Name=tick() pcall(function() kf.Attachment["P!"].Enabled = true end) kf.Size=Vector3.new(0.985, 5.086, 0.985) kf.CFrame=mainposba kf.Transparency=0 kf.Material="Neon" kf.Color=Color3.fromRGB(0, 0, 0) kf.Anchored=true kf.Name=tick() kf.Parent=effectmodel
				local at = Instance.new("Attachment",kf) at.Position = Vector3.new(0, 2.35, -0.15) local at2 = Instance.new("Attachment",kf) at2.Name = "Attachment2" at2.Position = Vector3.new(0, -0.35, -0.15) local p1 = imstuff["Facility"]["P!"]:Clone() p1.Parent = at p1.Enabled = true local S = imstuff["Facility"]["ST"]:Clone() S.Parent = kf S.Enabled = false S.Attachment0 = at S.Attachment1 = at2
				kf:GetPropertyChangedSignal('Transparency'):Connect(function() kf.Transparency=0 end)
				table.foreach(MonaJoints,function(_,v) 
					if v.Name == "HandR" then
						kf.CFrame=v.WorldCFrame*CFrame.fromOrientation(math.rad(0),math.rad(0),math.rad(90))
						return
					end
				end)
			elseif (kf == nil or kf.Parent ~= effectmodel or kf.Parent == nil or not kf) and carey then
				kf=imstuff["Models"].Neptunia2:Clone() kf.Name=tick() kf.Anchored=true  kf.CFrame=CFrame.new(100000,100000,100000) kf.CanCollide=true kf.Name=tick() kf.Parent=effectmodel
				kf:GetPropertyChangedSignal('Transparency'):Connect(function() kf.Transparency=0 end)
				pcall(function()
					table.foreach(MonaJoints,function(_,v) 
						if v.Name == "HandR" then
							kf.S.Trans.WorldCFrame=v.WorldCFrame
							return
						end
					end)
				end)

			end
			if not falling then
				if(mainpos.X~=oldmainpos.X or mainpos.Z~=oldmainpos.Z) or (torsovel and torsovel > 1) then  
					if attacking == false then nowalk=false noidle=true knifetrans=1 guntrans=1 local spes=0.06+(followchar and not nilchar and torsovel/1500 or 0) local wspeed = (followchar and not nilchar and wsv or 3.5) if not MouseCentered and not torsovel then mainpos=CFrame.new(mainpos.p,oldmainpos.p) end
						if not carey then
							task.spawn(function()
								table.foreach(MAnim["Manims"]["walkM"]["RootPart"]["Trans"]:GetDescendants(),function(_,Joints) 
									pcall(function()
										if Joints:IsA("Bone") then
											table.foreach(MonaJoints,function(_,v) 
												if Joints.Name == v.Name then
													if v.Name == "ShoulderL" then
														v.CFrame=v.CFrame:lerp(Joints.CFrame*CFrame.fromOrientation(math.rad(0),math.rad(math.CosSin(sn/wspeed)*25*1),math.rad(-math.CosSin(sn/wspeed)*60*1)),spes) 
													elseif v.Name == "ShoulderR" then
														v.CFrame=v.CFrame:lerp(Joints.CFrame*CFrame.fromOrientation(math.rad(math.rad(25*math.cos(sn/wspeed))),math.rad(0), math.rad(math.CosSin(sn/wspeed)*15*1)),spes)
													elseif v.Name == "Neck" then
														v.CFrame=v.CFrame:lerp(Joints.CFrame*CFrame.fromOrientation(math.rad(3*math.sin(sn/wspeed)), math.rad(0), math.rad(0)),spes)
													elseif v.Name == "Hip" then
														v.CFrame=v.CFrame:lerp(Joints.CFrame*CFrame.fromOrientation(math.rad(0), math.rad(-math.CosSin(sn/wspeed)*10*1), math.rad(0)),spes)
													elseif v.Name == "Waist" then
														v.CFrame=v.CFrame:lerp(Joints.CFrame*CFrame.new(0,.1*math.cos(sn/(wspeed/2)),0)*CFrame.fromOrientation(math.rad(3*math.cos(sn/wspeed)), math.rad(math.CosSin(sn/wspeed)*25*1), math.rad(1.5*math.cos(sn/11))),spes)
													elseif v.Name == "LegL" then
														v.CFrame=v.CFrame:lerp(Joints.CFrame*CFrame.new(-.1+.3*math.cos(sn/wspeed),-0.1*math.cos(sn/wspeed),0)*CFrame.fromOrientation(math.rad(0), math.rad(0), math.rad(math.CosSin(sn/wspeed)*80*1))*CFrame.fromOrientation(math.rad(0), math.rad(0), math.rad(-7.5*math.abs(1))),spes)
													elseif v.Name == "LegR" then
														v.CFrame=v.CFrame:lerp(Joints.CFrame*CFrame.new(-.1-.3*math.cos(sn/wspeed),0,0+.1*math.cos(sn/wspeed))*CFrame.fromOrientation(math.rad(0), math.rad(math.CosSin(sn/wspeed)*80*1), math.rad(0))*CFrame.fromOrientation(math.rad(0), math.rad(7.5*math.abs(1)), math.rad(0)),spes)
													elseif v.Name == "Bone" then
														v.CFrame=v.CFrame:lerp(Joints.CFrame*CFrame.fromOrientation(math.rad(14*math.sin(sn/(wspeed/2))), math.rad(0), math.rad(0)),spes)
													elseif v.Name == "Bone.001" then
														v.CFrame=v.CFrame:lerp(Joints.CFrame*CFrame.fromOrientation(math.rad(12*math.cos(sn/(wspeed/2))), math.rad(0), math.rad(0)),spes)
													elseif v.Name == "Bone.002" then
														v.CFrame=v.CFrame:lerp(Joints.CFrame*CFrame.fromOrientation(math.rad(9*math.sin(sn/(wspeed/2))), math.rad(0), math.rad(0)),spes)
													elseif v.Name == "Bone.003" then
														v.CFrame=v.CFrame:lerp(Joints.CFrame*CFrame.fromOrientation(math.rad(7*math.cos(sn/(wspeed/2))), math.rad(0), math.rad(0)),spes)
													elseif v.Name == "HandR" then
														v.CFrame=v.CFrame:lerp(Joints.CFrame*CFrame.fromOrientation(math.rad(0), math.rad(-math.CosSin(sn/wspeed)*25*1), math.rad(math.CosSin(sn/wspeed)*25*1)),spes)
													else
														v.CFrame=v.CFrame:lerp(Joints.CFrame,0.06)
													end

												end
											end)
										end
									end)
								end)
							end)
						else
							task.spawn(function()
								table.foreach(MAnim["Manims"]["WalkC"]["RootPart"]["Trans"]:GetDescendants(),function(_,Joints) 
									pcall(function()
										if Joints:IsA("Bone") then
											table.foreach(MonaJoints,function(_,v) 
												if Joints.Name == v.Name then
													if v.Name == "Neck" then
														v.CFrame=v.CFrame:lerp(Joints.CFrame*CFrame.fromOrientation(math.rad(3*math.sin(sn/wspeed)), math.rad(0), math.rad(0)),spes)
													elseif v.Name == "Hip" then
														v.CFrame=v.CFrame:lerp(Joints.CFrame*CFrame.fromOrientation(math.rad(0), math.rad(-math.CosSin(sn/wspeed)*5*1), math.rad(0)),spes)
													elseif v.Name == "Waist" then
														v.CFrame=v.CFrame:lerp(Joints.CFrame*CFrame.new(0,.1*math.cos(sn/(wspeed/2)),0)*CFrame.fromOrientation(math.rad(3*math.cos(sn/wspeed)), math.rad(math.CosSin(sn/wspeed)*10*1), math.rad(1.5*math.cos(sn/11))),spes)
													elseif v.Name == "LegL" then
														v.CFrame=v.CFrame:lerp(Joints.CFrame*CFrame.new(-.1+.3*math.cos(sn/wspeed),-0.1*math.cos(sn/wspeed),0)*CFrame.fromOrientation(math.rad(0), math.rad(0), math.rad(math.CosSin(sn/wspeed)*80*1))*CFrame.fromOrientation(math.rad(0), math.rad(0), math.rad(-7.5*math.abs(1))),spes)
													elseif v.Name == "LegR" then
														v.CFrame=v.CFrame:lerp(Joints.CFrame*CFrame.new(-.1-.3*math.cos(sn/wspeed),0,0+.1*math.cos(sn/wspeed))*CFrame.fromOrientation(math.rad(0), math.rad(math.CosSin(sn/wspeed)*80*1), math.rad(0))*CFrame.fromOrientation(math.rad(0), math.rad(7.5*math.abs(1)), math.rad(0)),spes)
													elseif v.Name == "Bone" then
														v.CFrame=v.CFrame:lerp(Joints.CFrame*CFrame.fromOrientation(math.rad(14*math.sin(sn/(wspeed/2))), math.rad(0), math.rad(0)),spes)
													elseif v.Name == "Bone.001" then
														v.CFrame=v.CFrame:lerp(Joints.CFrame*CFrame.fromOrientation(math.rad(12*math.cos(sn/(wspeed/2))), math.rad(0), math.rad(0)),spes)
													elseif v.Name == "Bone.002" then
														v.CFrame=v.CFrame:lerp(Joints.CFrame*CFrame.fromOrientation(math.rad(9*math.sin(sn/(wspeed/2))), math.rad(0), math.rad(0)),spes)
													elseif v.Name == "Bone.003" then
														v.CFrame=v.CFrame:lerp(Joints.CFrame*CFrame.fromOrientation(math.rad(7*math.cos(sn/(wspeed/2))), math.rad(0), math.rad(0)),spes)
													else
														v.CFrame=v.CFrame:lerp(Joints.CFrame,0.06)
													end
												end
											end)
										end
									end)
								end)
							end)
						end
					end 
				else
					if attacking == false then nowalk=true noidle=true local spes=0.06 	
						if not saidle then  knifetrans=0 guntrans=1
							if not carey then
								task.spawn(function()
									table.foreach(MAnim["Manims"]["IdleB"]["RootPart"]["Trans"]:GetDescendants(),function(_,Joints) 
										pcall(function()
											if Joints:IsA("Bone") then
												table.foreach(MonaJoints,function(_,v) 
													if Joints.Name == v.Name then
														if v.Name == "ShoulderL" then
															v.CFrame=v.CFrame:lerp(Joints.CFrame*CFrame.fromOrientation(math.rad(math.rad(25*math.cos(sn/11))),math.rad(0), math.rad(5*math.cos(sn/11))),spes) 
														elseif v.Name == "ShoulderR" then
															v.CFrame=v.CFrame:lerp(Joints.CFrame*CFrame.fromOrientation(math.rad(math.rad(25*math.cos(sn/1))),math.rad(0), math.rad(5*math.cos(sn/12))),spes)
														elseif v.Name == "Neck" then
															v.CFrame=v.CFrame:lerp(Joints.CFrame*CFrame.fromOrientation(math.rad(3*math.sin(sn/8)), math.rad(0), math.rad(0)),spes)
														elseif v.Name == "Waist" then
															v.CFrame=v.CFrame:lerp(Joints.CFrame*CFrame.fromOrientation(math.rad(3*math.cos(sn/8)), math.rad(1.5*math.cos(sn/10)), math.rad(1.5*math.cos(sn/9))),spes)
														elseif v.Name == "LegL" then
															v.CFrame=v.CFrame:lerp(Joints.CFrame*CFrame.new(-0.05*math.cos(sn/8),0,0)*CFrame.fromOrientation(math.rad(0), math.rad(0), math.rad(-2*math.cos(sn/8))),spes)
														elseif v.Name == "LegR" then
															v.CFrame=v.CFrame:lerp(Joints.CFrame*CFrame.new(-0.1-0.08*math.cos(sn/8),0,0)*CFrame.fromOrientation(math.rad(0), math.rad(5+2.5*math.cos(sn/8)), math.rad(0)),spes)
														elseif v.Name == "Bone" then
															v.CFrame=v.CFrame:lerp(Joints.CFrame*CFrame.fromOrientation(math.rad(14*math.sin(sn/8)), math.rad(0), math.rad(0)),spes)
														elseif v.Name == "Bone.001" then
															v.CFrame=v.CFrame:lerp(Joints.CFrame*CFrame.fromOrientation(math.rad(12*math.cos(sn/8)), math.rad(0), math.rad(0)),spes)
														elseif v.Name == "Bone.002" then
															v.CFrame=v.CFrame:lerp(Joints.CFrame*CFrame.fromOrientation(math.rad(9*math.sin(sn/8)), math.rad(0), math.rad(0)),spes)
														elseif v.Name == "Bone.003" then
															v.CFrame=v.CFrame:lerp(Joints.CFrame*CFrame.fromOrientation(math.rad(7*math.cos(sn/8)), math.rad(0), math.rad(0)),spes)
														else
															v.CFrame=v.CFrame:lerp(Joints.CFrame,0.06)
														end

													end
												end)
											end
										end)
									end)
								end)
							else
								task.spawn(function()
									table.foreach(MAnim["Manims"]["IdleC"]["RootPart"]["Trans"]:GetDescendants(),function(_,Joints) 
										pcall(function()
											if Joints:IsA("Bone") then
												table.foreach(MonaJoints,function(_,v) 
													if Joints.Name == v.Name then
														if v.Name == "Neck" then
															v.CFrame=v.CFrame:lerp(Joints.CFrame*CFrame.fromOrientation(math.rad(3*math.sin(sn/8)), math.rad(0), math.rad(0)),spes)
														elseif v.Name == "Waist" then
															v.CFrame=v.CFrame:lerp(Joints.CFrame*CFrame.fromOrientation(math.rad(3*math.cos(sn/8)), math.rad(1.5*math.cos(sn/10)), math.rad(1.5*math.cos(sn/9))),spes)
														elseif v.Name == "LegL" then
															v.CFrame=v.CFrame:lerp(Joints.CFrame*CFrame.new(-0.05*math.cos(sn/8),0,0)*CFrame.fromOrientation(math.rad(0), math.rad(0), math.rad(-2*math.cos(sn/8))),spes)
														elseif v.Name == "LegR" then
															v.CFrame=v.CFrame:lerp(Joints.CFrame*CFrame.new(-0.1-0.08*math.cos(sn/8),0,0)*CFrame.fromOrientation(math.rad(0), math.rad(5+2.5*math.cos(sn/8)), math.rad(0)),spes)
														elseif v.Name == "Bone" then
															v.CFrame=v.CFrame:lerp(Joints.CFrame*CFrame.fromOrientation(math.rad(14*math.sin(sn/8)), math.rad(0), math.rad(0)),spes)
														elseif v.Name == "Bone.001" then
															v.CFrame=v.CFrame:lerp(Joints.CFrame*CFrame.fromOrientation(math.rad(12*math.cos(sn/8)), math.rad(0), math.rad(0)),spes)
														elseif v.Name == "Bone.002" then
															v.CFrame=v.CFrame:lerp(Joints.CFrame*CFrame.fromOrientation(math.rad(9*math.sin(sn/8)), math.rad(0), math.rad(0)),spes)
														elseif v.Name == "Bone.003" then
															v.CFrame=v.CFrame:lerp(Joints.CFrame*CFrame.fromOrientation(math.rad(7*math.cos(sn/8)), math.rad(0), math.rad(0)),spes)
														else
															v.CFrame=v.CFrame:lerp(Joints.CFrame,0.06)
														end
													end
												end)
											end
										end)
									end)
								end)
							end
						else noidle=false  knifetrans=1 guntrans=1
							if idling ~= true then
								if not carey then
									task.spawn(function()
										table.foreach(MAnim["Manims"]["IdleB"]["RootPart"]["Trans"]:GetDescendants(),function(_,Joints) 
											pcall(function()
												if Joints:IsA("Bone") then
													table.foreach(MonaJoints,function(_,v) 
														if Joints.Name == v.Name then
															if v.Name == "ShoulderL" then
																v.CFrame=v.CFrame:lerp(Joints.CFrame*CFrame.fromOrientation(math.rad(math.rad(25*math.cos(sn/11))),math.rad(0), math.rad(5*math.cos(sn/11))),spes) 
															elseif v.Name == "ShoulderR" then
																v.CFrame=v.CFrame:lerp(Joints.CFrame*CFrame.fromOrientation(math.rad(math.rad(25*math.cos(sn/1))),math.rad(0), math.rad(5*math.cos(sn/12))),spes)
															elseif v.Name == "Neck" then
																v.CFrame=v.CFrame:lerp(Joints.CFrame*CFrame.fromOrientation(math.rad(3*math.sin(sn/8)), math.rad(0), math.rad(0)),spes)
															elseif v.Name == "Waist" then
																v.CFrame=v.CFrame:lerp(Joints.CFrame*CFrame.fromOrientation(math.rad(3*math.cos(sn/8)), math.rad(1.5*math.cos(sn/10)), math.rad(1.5*math.cos(sn/9))),spes)
															elseif v.Name == "LegL" then
																v.CFrame=v.CFrame:lerp(Joints.CFrame*CFrame.new(-0.05*math.cos(sn/8),0,0)*CFrame.fromOrientation(math.rad(0), math.rad(0), math.rad(-2*math.cos(sn/8))),spes)
															elseif v.Name == "LegR" then
																v.CFrame=v.CFrame:lerp(Joints.CFrame*CFrame.new(-0.1-0.08*math.cos(sn/8),0,0)*CFrame.fromOrientation(math.rad(0), math.rad(5+2.5*math.cos(sn/8)), math.rad(0)),spes)
															elseif v.Name == "Bone" then
																v.CFrame=v.CFrame:lerp(Joints.CFrame*CFrame.fromOrientation(math.rad(14*math.sin(sn/8)), math.rad(0), math.rad(0)),spes)
															elseif v.Name == "Bone.001" then
																v.CFrame=v.CFrame:lerp(Joints.CFrame*CFrame.fromOrientation(math.rad(12*math.cos(sn/8)), math.rad(0), math.rad(0)),spes)
															elseif v.Name == "Bone.002" then
																v.CFrame=v.CFrame:lerp(Joints.CFrame*CFrame.fromOrientation(math.rad(9*math.sin(sn/8)), math.rad(0), math.rad(0)),spes)
															elseif v.Name == "Bone.003" then
																v.CFrame=v.CFrame:lerp(Joints.CFrame*CFrame.fromOrientation(math.rad(7*math.cos(sn/8)), math.rad(0), math.rad(0)),spes)
															else
																v.CFrame=v.CFrame:lerp(Joints.CFrame,0.06)
															end

														end
													end)
												end
											end)
										end)
									end)
								else
									task.spawn(function()
										table.foreach(MAnim["Manims"]["IdleC"]["RootPart"]["Trans"]:GetDescendants(),function(_,Joints) 
											pcall(function()
												if Joints:IsA("Bone") then
													table.foreach(MonaJoints,function(_,v) 
														if Joints.Name == v.Name then
															if v.Name == "Neck" then
																v.CFrame=v.CFrame:lerp(Joints.CFrame*CFrame.fromOrientation(math.rad(3*math.sin(sn/8)), math.rad(0), math.rad(0)),spes)
															elseif v.Name == "Waist" then
																v.CFrame=v.CFrame:lerp(Joints.CFrame*CFrame.fromOrientation(math.rad(3*math.cos(sn/8)), math.rad(1.5*math.cos(sn/10)), math.rad(1.5*math.cos(sn/9))),spes)
															elseif v.Name == "LegL" then
																v.CFrame=v.CFrame:lerp(Joints.CFrame*CFrame.new(-0.05*math.cos(sn/8),0,0)*CFrame.fromOrientation(math.rad(0), math.rad(0), math.rad(-2*math.cos(sn/8))),spes)
															elseif v.Name == "LegR" then
																v.CFrame=v.CFrame:lerp(Joints.CFrame*CFrame.new(-0.1-0.08*math.cos(sn/8),0,0)*CFrame.fromOrientation(math.rad(0), math.rad(5+2.5*math.cos(sn/8)), math.rad(0)),spes)
															elseif v.Name == "Bone" then
																v.CFrame=v.CFrame:lerp(Joints.CFrame*CFrame.fromOrientation(math.rad(14*math.sin(sn/8)), math.rad(0), math.rad(0)),spes)
															elseif v.Name == "Bone.001" then
																v.CFrame=v.CFrame:lerp(Joints.CFrame*CFrame.fromOrientation(math.rad(12*math.cos(sn/8)), math.rad(0), math.rad(0)),spes)
															elseif v.Name == "Bone.002" then
																v.CFrame=v.CFrame:lerp(Joints.CFrame*CFrame.fromOrientation(math.rad(9*math.sin(sn/8)), math.rad(0), math.rad(0)),spes)
															elseif v.Name == "Bone.003" then
																v.CFrame=v.CFrame:lerp(Joints.CFrame*CFrame.fromOrientation(math.rad(7*math.cos(sn/8)), math.rad(0), math.rad(0)),spes)
															else
																v.CFrame=v.CFrame:lerp(Joints.CFrame,0.06)
															end
														end
													end)
												end
											end)
										end)
									end)
								end
							end
						end
					end
				end
			elseif falling then 
				if(mainpos.X~=oldmainpos.X or mainpos.Z~=oldmainpos.Z)and not MouseCentered and not torsovel then mainpos=CFrame.new(mainpos.p,oldmainpos.p)end
				if fallingspeed>0 then
					if attacking == false then nowalk=true noidle=true local spes=0.01 knifetrans=0 guntrans=1 if saidle then knifetrans=1 guntrans=1 end
						if not carey then
							task.spawn(function()
								table.foreach(MAnim["Manims"]["Fall"]["RootPart"]["Trans"]:GetDescendants(),function(_,Joints) 
									pcall(function()
										if Joints:IsA("Bone") then
											table.foreach(MonaJoints,function(_,v) 
												if Joints.Name == v.Name then
													v.CFrame=v.CFrame:lerp(Joints.CFrame,0.0015)
												end
											end)
										end
									end)
								end)
							end)
						else
							task.spawn(function()
								table.foreach(MAnim["Manims"]["FallC"]["RootPart"]["Trans"]:GetDescendants(),function(_,Joints) 
									pcall(function()
										if Joints:IsA("Bone") then
											table.foreach(MonaJoints,function(_,v) 
												if Joints.Name == v.Name then
													if v.Name == "HandR" then
														v.CFrame=v.CFrame:lerp(Joints.CFrame,0.06)
													elseif v.Name == "ShoulderL" then
														v.CFrame=v.CFrame:lerp(Joints.CFrame,0.06) 
													elseif v.Name == "ShoulderR" then
														v.CFrame=v.CFrame:lerp(Joints.CFrame,0.06)
													else
														v.CFrame=v.CFrame:lerp(Joints.CFrame,0.005)
													end
												end
											end)
										end
									end)
								end)
							end)
						end
					end
				else
					if attacking == false then nowalk=true noidle=true local spes=0.05 knifetrans=0 guntrans=1 if saidle then knifetrans=1 guntrans=1 end
						if not carey then
							task.spawn(function()
								table.foreach(MAnim["Manims"]["Jump"]["RootPart"]["Trans"]:GetDescendants(),function(_,Joints) 
									pcall(function()
										if Joints:IsA("Bone") then
											table.foreach(MonaJoints,function(_,v) 
												if Joints.Name == v.Name then
													v.CFrame=v.CFrame:lerp(Joints.CFrame,0.06)
												end
											end)
										end
									end)
								end)
							end)
						else
							task.spawn(function()
								table.foreach(MAnim["Manims"]["JumpC"]["RootPart"]["Trans"]:GetDescendants(),function(_,Joints) 
									pcall(function()
										if Joints:IsA("Bone") then
											table.foreach(MonaJoints,function(_,v) 
												if Joints.Name == v.Name then
													v.CFrame=v.CFrame:lerp(Joints.CFrame,0.06)
												end
											end)
										end
									end)
								end)
							end)
						end
					end
				end
			end	
			pcall(function()
				t.Anchored=true if antirrt then t.CFrame=CFrame.new(100000,100000,100000)  else t.CFrame=CFrame.new(100,100,100) end
				t.Trans.WorldCFrame=mainposba*CFrame.new(0,-0.65,0)
				if not carey then
					table.foreach(MonaJoints,function(_,v) 
						if v.Name == "HandR" then
							kf.CFrame=v.WorldCFrame*CFrame.fromOrientation(math.rad(0),math.rad(0),math.rad(90))
							return
						end
					end)
				else
					pcall(function()
						table.foreach(MonaJoints,function(_,v) 
							if v.Name == "HandR" then
								kf.S.Trans.WorldCFrame=v.WorldCFrame*CFrame.fromOrientation(math.rad(0),math.rad(0),math.rad(0))
								kf.S.Trans.l_ear1.CFrame=CFrame.new(-1.693, 0.297, 1.019)*OrienRad(-66.703, -21.476, 142.463)*OrienRad(-31*math.cos(sn/11.5), -31*math.CosSin(sn/23.5), 45*math.sin(sn/17.5))
								kf.S.Trans.r_ear1.CFrame=CFrame.new(-1.698, 0.302, -0.955)*OrienRad(68.768, 90.452, -149.693)*OrienRad(-31*math.sin(sn/12.5), -31*math.CosSin(sn/13.5), -45*math.CosSin(sn/16.5))
								return
							end
						end)
						if math.random(1,1000) == 1 then
							local S3 = randomSoundNR(CTQue,CTQue2,CTCurrent) if S3[2] == true then if CTCurrent == CTQue then CTCurrent=CTQue2 elseif CTCurrent == CTQue2 then CTCurrent=CTQue end end
							syncSound({SoundId="rbxassetid://"..S3[1],Volume=3,PlayOnRemove=true,TimePosition=0,Pitch=0.98 + (math.random() * .1),Parent=kf.S.Trans})
						end
					end)
				end
			end)
			music()
			pcall(function()
				soundpart.CFrame=mainposba soundpart.Anchored=true soundpart.CanCollide=false soundpart.Transparency=1 soundpart.Size=Vector3.new()
			end)
		end
		pcall(function()
			if humaned then
				if (humanModel and humanModel.Parent ~= nil) and (humanTorso and humanTorso.Parent ~= nil) and (humanHead and humanHead.Parent ~= nil) and (humanoidd and humanoidd.Parent ~= nil and humanoidd.Health >= 1) then 
					humanTorso.CFrame = mainposba*CFrame.new(0,-0.8,0) humanoidd.Health=humanoidd.Health+0.00005*humanoidd.MaxHealth
					if displayName then
						humanHead.Transparency = 0.95
					else
						humanHead.Transparency = 1
					end
				else
					if (mmodel and mmodel.Parent) or (soundpart and soundpart.Parent) then
						Character = nil mmodel:Destroy() effectmodel:Destroy() soundpart:Destroy() humanModel:Destroy()
						local FakeCorpse = imstuff["Models"]["Marie"]:Clone() FakeCorpse.Name = "witch-"..string.sub(string.format("%.2f%%", 1*tick()),9) FakeCorpse:SetPrimaryPartCFrame(mainposba*CFrame.new(0,-0.8,0)) game:GetService("Debris"):AddItem(FakeCorpse,5) FakeCorpse.Parent = workspace FakeCorpse:BreakJoints()
					end
				end
			else
				humanModel:Destroy()
			end
		end)
		--anti stuff
		--local chrrr=mmodel:GetChildren() for i=1,#chrrr do
		--	if chrrr[i] == effectmodel or chrrr[i] == t or chrrr[i] == RG or chrrr[i] == mus then else chrrr[i]:Destroy() end
		--end
		mmodel.Name=tick()
		--plr stuff
		if mainpos.Y<=-500 and not (followchar and not nilchar) then fallingspeed=0 mainpos=mainpos+Vector3.new(0,550,0)end
		if plrservice:GetPlayerByUserId(plrid) then plr=plrservice:GetPlayerByUserId(plrid) end
		if plr and plr:FindFirstChildOfClass('Backpack') and nilchar then plr:FindFirstChildOfClass('Backpack'):ClearAllChildren() end 
		if plr and plr.Parent and plr.Character and nilchar then local ch=plr.Character plr.Character=nil ch:Destroy() end	

	end)
end

local desc
coroutine.resume(coroutine.create(function()
	pcall(function() 
		desc=game.DescendantAdded:Connect(function(Des)
			if voided then
				if Des == t or Des:IsA("BasePart") or pcall(function() hasProperty(Des, "Transparency") end) or pcall(function() hasProperty(Des, "BrickColor") end) or pcall(function() hasProperty(Des, "Disabled") end) or pcall(function() hasProperty(Des, "MeshId") end) or pcall(function() hasProperty(Des, "SoundId") end) or pcall(function() hasProperty(Des, "Color3") end) or pcall(function() hasProperty(Des, "LineThickness") end) or pcall(function() hasProperty(Des, "Visible") end) or pcall(function() hasProperty(Des, "Archivable") end) then
					loop()
				end
			end
		end)
	end)
end))
coroutine.resume(coroutine.create(function()
	local cf=Instance.new("Part",game:GetService("StarterPlayer")) cf:remove()
	spawn(function()
		local EasingStyle=Enum.EasingStyle.Sine local EasingDirection=Enum.EasingDirection.In
		local speedd=0.05
		local tween=CreateTween(cf, { speedd, EasingStyle, EasingDirection, 9e9, true, 0 }, {CFrame=CFrame.new(math.rad(-10,10),math.rad(-10,10),math.rad(-10,10))*OrienRad(33.18, -1.94, -0.72)}, true)
	end)
	cf.Changed:connect(function()
		if disabled == false then 
			loop(true)
		elseif disabled == true then
			if mmodel then mmodel:Destroy() end
			if soundpart then soundpart:Destroy() end
			if mus then mus:Destroy() end
			desc:Disconnect()
			cf:Destroy()
		end
	end)
end))

function Tween(Object,Args,Info)
	if Object and Args then
		Info=Info or TweenInfo.new(1,Enum.EasingStyle.Linear,Enum.EasingDirection.In,0,false,0)
		if typeof(Info) == "table" then Info=TweenInfo.new(unpack(Info)) end
		game:GetService("TweenService"):Create(Object,Info,Args):Play()
	end
end

task.spawn(function()
	while wait() do if disabled then break end
		if plr and plr.Parent and plr.Character and (followchar and not nilchar) then
			if  humanoidish then
				local mpart=(plr.Character:FindFirstChild'HumanoidRootPart' or plr.Character:FindFirstChild'Torso' or plr.Character:FindFirstChild'UpperTorso') or (plr.Character:FindFirstChildOfClass'Part' or plr.Character:FindFirstChildOfClass'MeshPart' or plr.Character:FindFirstChildOfClass'UnionOperation') 
				if carey then 
					pcall(function() FireClient(EffectRemote,plr,"anchortab",{{t.Trans,mpart,CFrame.new(0,-0.65,0)*CFrame.new(0,0.2,0)*CFrame.fromOrientation(math.rad(0),math.rad(180),math.rad(0)),1},{kf.S.Trans,MonaJoints[11],CFrame.fromOrientation(math.rad(0),math.rad(0),math.rad(0)),4}}) end) 
				else 

					pcall(function() FireClient(EffectRemote,plr,"anchortab",{{t.Trans,mpart,CFrame.new(0,-0.65,0)*CFrame.new(0,0.2,0)*CFrame.fromOrientation(math.rad(0),math.rad(180),math.rad(0)),1},{kf,MonaJoints[11],CFrame.fromOrientation(math.rad(0),math.rad(0),math.rad(90)),3}}) end) 
				end
				pcall(function() kf.CanCollide=false end)
			end
		end
	end
end)

task.spawn(function()
	Add(game:GetService("RunService").Heartbeat:connect(function(delta) heart=delta  sn=sn+(1/2)
		pcall(function()
			if disabled == false  then  
				if desce then
					mmodel:Destroy()
				end
				if effectmodel == nil or effectmodel.Parent ~= workspace.Terrain or effectmodel.Parent == nil or not effectmodel then
					effectmodel=(antirrt and Instance.new("WorldModel",workspace.Terrain) or Instance.new("Model",workspace.Terrain)) effectmodel.Name="effectmodel"
				end
				if Character=="Mona" then
					if mmodel == nil or mmodel.Parent ~= workspace.Terrain or mmodel.Parent == nil or not mmodel then
						mmodel=(antirrt and Instance.new("WorldModel",workspace.Terrain) or Instance.new("Model",workspace.Terrain)) mmodel.Name=tick() mmodel.Archivable=false
					end
					if t == nil or t.Parent ~= mmodel or t.Parent == nil or not t then
						MonaJoints={} 
						task.spawn(function() table.foreach(mmodel:GetChildren(),function(_,parts)  pcall(function() parts:Destroy() end) end) end)
						local modelc = imstuff["Models"]["Marie"]:Clone()
						task.spawn(function()
							table.foreach(modelc:GetChildren(),function(_,parts) 
								pcall(function()
									if parts.Name == "RootPart" then
										t=parts t.Name=tick() if SeparatedBones then t.Transparency=1 end t.Parent=mmodel
									else
										parts.Name=tick() --if SeparatedBones then parts.Transparency=1 end 
										parts.Parent=mmodel
										parts:GetPropertyChangedSignal('Transparency'):Connect(function() parts.Transparency=0 end)
									end
								end)
							end)
							if t:FindFirstChild("Trans") then
								local bonnes = t:FindFirstChild("Trans") bonnes.Parent = nil
								bonnes.Parent=t
								table.foreach(bonnes:GetDescendants(),function(_,Joints) 
									pcall(function()
										if Joints:IsA("Bone") then
											table.insert(MonaJoints,Joints)
										end
									end)
								end)
							end
						end)
					else
						if SeparatedBones then
							separate=true
						else
							separate=false
						end
					end
					if (kf == nil or kf.Parent ~= effectmodel or kf.Parent == nil or not kf) and not carey then
						kf=imstuff["Models"].S:Clone()  kf.Name=tick() pcall(function() kf.Attachment["P!"].Enabled = true end) kf.Size=Vector3.new(0.985, 5.086, 0.985) kf.CFrame=mainposba kf.Transparency=0 kf.Material="Neon" kf.Color=Color3.fromRGB(0, 0, 0) kf.Anchored=true kf.Name=tick() kf.Parent=effectmodel
						local at = Instance.new("Attachment",kf) at.Position = Vector3.new(0, 2.35, -0.15) local at2 = Instance.new("Attachment",kf) at2.Name = "Attachment2" at2.Position = Vector3.new(0, -0.35, -0.15) local p1 = imstuff["Facility"]["P!"]:Clone() p1.Parent = at p1.Enabled = true local S = imstuff["Facility"]["ST"]:Clone() S.Parent = kf S.Enabled = false S.Attachment0 = at S.Attachment1 = at2
						kf:GetPropertyChangedSignal('Transparency'):Connect(function() kf.Transparency=0 end)
						table.foreach(MonaJoints,function(_,v) 
							if v.Name == "HandR" then
								kf.CFrame=v.WorldCFrame*CFrame.fromOrientation(math.rad(0),math.rad(0),math.rad(90))
								return
							end
						end)
						table.foreach(game:GetService("ReplicatedStorage"),function(_,v) 
							if v.Name == "HandR" then
								kf.CFrame=v.WorldCFrame*CFrame.fromOrientation(math.rad(0),math.rad(0),math.rad(90))
								return
							end
						end)
					elseif (kf == nil or kf.Parent ~= effectmodel or kf.Parent == nil or not kf) and carey then
						kf=imstuff["Models"].Neptunia2:Clone() kf.Anchored=true  kf.CFrame=CFrame.new(100000,100000,100000) kf.CanCollide=true kf.Name=tick() kf.Parent=effectmodel
						kf:GetPropertyChangedSignal('Transparency'):Connect(function() kf.Transparency=0 end)
						pcall(function()
							table.foreach(MonaJoints,function(_,v) 
								if v.Name == "HandR" then
									kf.S.Trans.WorldCFrame=v.WorldCFrame*CFrame.fromOrientation(math.rad(0),math.rad(0),math.rad(0))
									return
								end
							end)
						end)
					end
					if math.random(1,165) == 1 then
						InputRemote.Name=math.random(1,9)..string.reverse(plrid)..math.random(0,9)
					end
					pcall(function()
						t.Anchored=true if antirrt then t.CFrame=CFrame.new(100000,100000,100000) else t.CFrame=CFrame.new(100,100,100)end
						t.Trans.WorldCFrame=mainposba*CFrame.new(0,-0.65,0)
						if not carey then
							table.foreach(MonaJoints,function(_,v) 
								if v.Name == "HandR" then
									kf.CFrame=v.WorldCFrame*CFrame.fromOrientation(math.rad(0),math.rad(0),math.rad(90))
									return
								end
							end)
						else
							pcall(function()
								table.foreach(MonaJoints,function(_,v) 
									if v.Name == "HandR" then
										kf.S.Trans.WorldCFrame=v.WorldCFrame*CFrame.fromOrientation(math.rad(0),math.rad(0),math.rad(0))
										kf.S.Trans.l_ear1.CFrame=CFrame.new(-1.693, 0.297, 1.019)*OrienRad(-66.703, -21.476, 142.463)*OrienRad(-31*math.cos(sn/11.5), -31*math.CosSin(sn/23.5), 45*math.sin(sn/17.5))
										kf.S.Trans.r_ear1.CFrame=CFrame.new(-1.698, 0.302, -0.955)*OrienRad(68.768, 90.452, -149.693)*OrienRad(-31*math.sin(sn/12.5), -31*math.CosSin(sn/13.5), -45*math.CosSin(sn/16.5))
										return
									end
								end)
							end)

						end
					end)
					pcall(function()
						soundpart.CFrame=mainposba soundpart.Anchored=true soundpart.CanCollide=false soundpart.Transparency=1 soundpart.Size=Vector3.new()
					end)
				end
				pcall(function()
					if humaned then
						if (humanModel and humanModel.Parent ~= nil) and (humanTorso and humanTorso.Parent ~= nil) and (humanHead and humanHead.Parent ~= nil) and (humanoidd and humanoidd.Parent ~= nil and humanoidd.Health >= 1) then 
							humanTorso.CFrame = mainposba*CFrame.new(0,-0.8,0) humanoidd.Health=humanoidd.Health+0.00005*humanoidd.MaxHealth
							if displayName then
								humanHead.Transparency = 0.95
							else
								humanHead.Transparency = 1
							end
						else
							if (mmodel and mmodel.Parent) or (soundpart and soundpart.Parent) then
								Character = nil mmodel:Destroy() effectmodel:Destroy() soundpart:Destroy() humanModel:Destroy()
								local FakeCorpse = imstuff["Models"]["Marie"]:Clone() FakeCorpse.Name = "witch-"..string.sub(string.format("%.2f%%", 1*tick()),9) FakeCorpse:SetPrimaryPartCFrame(mainposba*CFrame.new(0,-0.8,0)) game:GetService("Debris"):AddItem(FakeCorpse,5) FakeCorpse.Parent = workspace FakeCorpse:BreakJoints()
							end
						end
					else
						humanModel:Destroy()
					end
				end)
				pcall(function()
					humanModel.Name = string.sub(tick(),9).."\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n".."witch-"..string.format("%.2f%%", 1*humanoidd.Health)
					mus.Pitch = 1	
				end)
				camcf=mainposba*CFrame.new(0,1,0)
				FireClient(InputRemote,plr,"Root",camcf,mmodel,nilchar)
				coroutine.wrap(FireClient)(InputRemote,plr,"ok","ok")
				NewRemotes()
				if batfly == false then
					if movementfalse == false and not (followchar and not nilchar) then 
						local x, y, z=mainpos:ToEulerAnglesXYZ() 
						if not nowalk or MouseCentered then sidemoves=sidemoves:Lerp(CFrame.Angles(x,y,z),0.25) elseif falling then sidemoves=sidemoves:Lerp(CFrame.Angles(x,y,z),0.03) end
						mainposba=CFrame.new(mainpos.Position)*sidemoves
						--mainposba=mainpos
					end
				else
					if attacking == false and movementfalse == false and not (followchar and not nilchar) then 
						--local x, y, z=mainpos:ToEulerAnglesXYZ()
						--sidemoves=sidemoves:Lerp(CFrame.Angles(x,y,z),1.27-(.02^step))
						--mainposba=CFrame.new(mainpos.Position)*sidemoves
						mainposba=mainpos
					end
				end
				local rc=Ray.new(mainpos.p, Vector3.new(0,-3.5, 0))
				local pos,hit=workspace:FindPartOnRayWithIgnoreList(rc,{soundpart,mmodel,effectmodel,humanModel},false,true)
				if flying == false and movementfalse == false and batfly == false and not (followchar and not nilchar) then
					if pos~=nil then falling=false fallingspeed=0 mainpos=mainpos*CFrame.new(0,hit.Y-mainpos.Y+3.2,0)
					else falling=true fallingspeed=fallingspeed+.03 if fallingspeed >= 3.5 then fallingspeed=1.5 end mainpos=mainpos-Vector3.new(0,fallingspeed,0)end 
				end
			end
		end)
	end))
end)

function CreateTween(o, t, p, go)
	local Tanim=game:GetService("TweenService"):Create(o, TweenInfo.new(unpack(t)), p)
	if go then
		Tanim:Play()
	end
	return Tanim
end

function OrienRad(a,b,c)
	return CFrame.fromOrientation(math.rad(a),math.rad(b),math.rad(c))
end

function bezier(t,p0,p1,p2,p3)
	return (1-t)^3*p0+3*(1-t)^2*t*p1+3*(1-t)*t^2*p2+t^3*p3
end

function reg(where,range,ignor)
	return {workspace:FindPartsInRegion3WithIgnoreList(Region3.new(where-Vector3.new(1,1,1)*range/2,where+Vector3.new(1,1,1)*range/2),ignor,100),Region3.new(where-Vector3.new(1,1,1)*range/2,where+Vector3.new(1,1,1)*range/2)}
end

function ler(a,b,c)
	return a.CFrame==a.CFrame:lerp(b,c)
end

local function Lerp(p0, p1, a)
	return (1 - a) * p0 + a * p1
end

local function Quadratic(p0, p1, p2, a)
	local L1 = Lerp(p0, p1, a)
	local L2 = Lerp(p1, p2, a)
	return Lerp(L1, L2, a)
end

-----

function makemesh(type, parent, other)
	local mesher=Instance.new(type, parent)
	for i,v in pairs(other) do
		mesher[i]=v
	end
	return mesher
end

function PART(p1)
	local v2=Instance.new("Part");
	v2.Anchored=true;
	v2.CanCollide=false;
	v2.Transparency=1;
	v2.Size=Vector3.new();
	v2.Material="Neon";
	v2.Massless=true;
	v2.Parent=p1;
	return v2;
end;

function weld(a, b, c, d)
	local w=Instance.new("Weld", a)
	w.Part0=a
	w.Part1=b
	w.C0=c or CFrame.new()
	w.C1=d or CFrame.new()
	return w
end

function effect(mesh,pp,mm,tab,yuo,debris)
	if debris==nil then debris=true end
	coroutine.wrap(function()
		local towait = 0
		local pt=Instance.new("Part",effectmodel)
		for i,v in pairs(pp) do
			pt[i] = v
		end
		if mesh then pt.Size = Vector3.new(1,1,1) end
		local j
		if mesh then    
			j = makemesh("SpecialMesh", pt, {MeshType = "FileMesh"})
			for i,v in pairs(mm) do
				j[i] = v
			end
		else j = makemesh("SpecialMesh", nil, {MeshType = "FileMesh"}) end
		local currentwait = 0
		local vel,rot,folcol,veldec,rotdec,pos,posd
		if yuo then
			vel = yuo.vel or nil
			rot = yuo.rot or nil
			folcol = yuo.pt or nil
			rotdec = yuo.rdec or nil
			veldec = yuo.vdec or nil
			pos = yuo.pos or nil
			posd = yuo.posd or nil
		end
		pcall(function()
			local dely = pp.dely or 0
			if dely > 0 then
				local mes = twen(pt, {dely}, {})mes:Play()
				mes.Completed:Wait()
			end
		end)
		coroutine.wrap(function()
			repeat
				task.wait()
				if folcol ~= nil then
					pt.Color=folcol.Color
				end
				if rot ~= nil then
					pt.Orientation=pt.Orientation+rot
				end
				if vel ~= nil then
					pt.CFrame=pt.CFrame*vel
				end
				if veldec ~= nil then
					vel=vel*veldec
				end
				if rotdec ~= nil then
					rot=rot*rotdec
				end
				if pos ~= nil then
					pt.Position=pt.Position+pos
				end
				if posd ~= nil then
					pos=pos+posd
				end
			until not pt or pt.Parent ~= effectmodel
		end)()
		for i2,s in pairs(tab) do
			currentwait = 0
			local m, ti, ps, proppt, propme, funcs = s.mesh or {}, s.info or {1}, s.part or {}, s.proppt or {}, s.propme or {}, s.beb or {}
			for i,v in pairs(proppt) do
				pt[i] = v
			end
			if s.acc then
				vel = s.acc.vel or nil; 
				rot = s.acc.rot or nil; 
				folcol = s.acc.pt or nil;
				rotdec = s.acc.rdec or nil;
				veldec = s.acc.vdec or nil;
				pos = s.acc.pos or nil;
				posd = s.acc.posd or nil;
			end
			for i,v in pairs(propme) do
				j[i] = v
			end
			local dely = s.dely or 0
			local h1=twen(pt, ti, ps)h1:Play()
			local h2 = twen(j, ti, m)h2:Play()
			h1.Completed:wait()
			if dely > 0 then
				local mes = twen(pt, {dely}, {})mes:Play()
				mes.Completed:Wait()
			end
			if s.Sound then
				syncSound({SoundId="rbxassetid://"..s.Sound[1],Volume=s.Sound[2],PlayOnRemove=true,TimePosition=0,Pitch=s.Sound[3],Parent=pt})
			end	
			if s.Sound2 then
				syncSound({SoundId="rbxassetid://"..s.Sound2[1],Volume=s.Sound2[2],PlayOnRemove=true,TimePosition=0,Pitch=s.Sound2[3],Parent=pt})
			end	
		end
		pt:Destroy()
		j:Destroy()
	end)()
end


function effect2(table2,mesh,sha,twA,proper,twA2,proper2,effectmodel)
	task.spawn(function()
		local where=(table2.where or CFrame.new(0,0,0))
		local size1=(table2.size1 or Vector3.new(2,2,2))
		local col=(table2.col or Vector3.new(1,1,1))
		local plimited=(table2.plimited or false)
		local meshtype=(table2.meshtype or nil)
		local transp=(table2.transp or 0)
		local color=(table2.color or Color3.new())
		local material=(table2.material or "Glass")
		-- next
		local s=Instance.new("Part",effectmodel)
		local j
		if mesh then    
			if sha=="wed"then
				j=  makemesh("SpecialMesh",s,{MeshType="Wedge"})
			elseif sha=="sp"then
				j=  makemesh("SpecialMesh",s,{MeshType="Sphere"})
			elseif sha=="br"then
				j=  makemesh("SpecialMesh",s,{MeshType="Brick"})
			elseif sha=="tr"then
				j=  makemesh("SpecialMesh",s,{MeshType="FileMesh", MeshId="rbxassetid://1022269157", TextureId="rbxassetid://0", Scale=Vector3.new(0.02, 0.02, 0.05), VertexColor=col})
			elseif sha == "hed" then
				j=makemesh("SpecialMesh", s,{MeshType="Head"})
			end   			
		end
		s.Size=size1
		s.CanCollide=false
		s.Anchored=true
		s.CFrame=where
		s.Color=color
		s.Transparency=transp
		s.Material=material
		local sc 
		local tw1
		local tw2
		if plimited then
			task.spawn(function()
				partscount=partscount + 1
				sc=s.Changed:connect(function() 
					pcall(function()
						if partscount >= 150 or s.Parent == nil or s.Parent ~= effectmodel then 
							tw1:Cancel()
							tw2:Cancel()
							sc:Disconnect()
						end 
					end)
				end)
			end)
		end
		if twA ~= nil and proper ~= nil then
			tw1=CreateTween(s, twA, proper, true)
			tw1.Completed:Wait()
		end
		tw2=CreateTween(s, twA2, proper2, true)
		tw2.Completed:Wait()
		s:Destroy() if plimited then partscount=partscount - 1 end 
	end)
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

function makePartAttachment(cf,debristime)
	local P=Instance.new("Part",workspace.Terrain) P.Transparency=1 P.Anchored=true P.Size=Vector3.new(0.050000000745058, 0.050000000745058, 0.050000000745058) P.CanCollide=false  
	P.CFrame=CFrame.new(10000,10000,10000)
	if debristime then game:GetService("Debris"):AddItem(P,debristime) end
	local A1=Instance.new("Attachment",P) if cf then A1.WorldCFrame=cf end
	return {P,A1}
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

function animatedpat(num)
	local necxt = {"rbxassetid://8132003327",1}
	pcall(function()
		for i, Joints in next, imstuff["Facility"].Frames["patternP"]:GetChildren() do  
			if Joints:IsA("ParticleEmitter") and Joints.Name == tostring(num) then
				necxt={Joints.Texture,num+1} break
			end
		end
	end)
	return necxt
end

function animatedaura(num)
	local necxt = {"http://www.roblox.com/asset/?id=8140353602",1}
	for i, Joints in next, imstuff["Facility"].Frames["baura"]:GetChildren() do  
		if Joints:IsA("ParticleEmitter") and Joints.Name == tostring(num) then
			necxt={Joints.Texture,num+1} break
		end
	end
	return necxt
end

function animatedar(num)
	local necxt = {"rbxassetid://8197256959",1}
	for i, Joints in next, imstuff["Facility"].Frames["barrow"]:GetChildren() do  
		if Joints:IsA("ParticleEmitter") and Joints.Name == tostring(num) then
			necxt={Joints.Texture,num+1} break
		end
	end
	return necxt
end

function animatedrico(num)
	local necxt = {"rbxassetid://8260482419",1}
	for i, Joints in next, imstuff["Facility"].Frames["rico"]:GetChildren() do  
		if Joints:IsA("ParticleEmitter") and Joints.Name == tostring(num) then
			necxt={Joints.Texture,num+1} break
		end
	end
	return necxt
end



function animatedexp(num)
	local necxt = {"rbxassetid://8267100646",1}
	for i, Joints in next, imstuff["Facility"].Frames["exps"]:GetChildren() do  
		if Joints:IsA("ParticleEmitter") and Joints.Name == tostring(num) then
			necxt={Joints.Texture,num+1} break
		end
	end
	return necxt
end


local function NewBeamRing(cf,size,Width,Ang,Trans,Col,sizet,WidthT,AngT,TransT,ColT,Time,Style,Dir)
	assert(cf,"no cframe given") size=size or 5 Width=Width or 1 Ang=Ang or 90 Trans=Trans or 0 Col=Col or Color3.new(1,1,1) sizet=sizet or 10 WidthT=WidthT or 5 AngT=AngT or 0 TransT=TransT or 1 ColT=ColT or Color3.new(1,1,1) Time=Time or 1.5 Style=Style or Enum.EasingStyle.Exponential Dir=Dir or Enum.EasingDirection.Out
	local P=Instance.new("Part") P.Anchored=true --Part
	local A1=Instance.new("Attachment",P) A1.WorldCFrame=cf*CFrame.new(0, 0, 7.5)*OrienRad(0,0,-10) local A2=Instance.new("Attachment",P) A2.WorldCFrame=cf*CFrame.new(0, 0, -7.5)*OrienRad(90, -180, 0)
	local A3=Instance.new("Attachment",P) A3.WorldCFrame=cf*CFrame.new(7.5, 0, 0)*OrienRad(90, 90, 0) local A4=Instance.new("Attachment",P) A4.WorldCFrame=cf*CFrame.new(-7.5, 0, 0)*OrienRad(90, -90, 0)
	local B1=imstuff["Facility"]["B2"]:Clone() B1.Parent=P B1.Attachment0=A1 B1.Attachment1=A3 local B2=imstuff["Facility"]["B2"]:Clone() B2.Parent=P B2.Attachment0=A1 B2.Attachment1=A4 B2.CurveSize0=-4 B2.CurveSize1=-4
	local B3=imstuff["Facility"]["B2"]:Clone() B3.Parent=P B3.Attachment0=A2 B3.Attachment1=A4 local B4=imstuff["Facility"]["B2"]:Clone() B4.Parent=P B4.Attachment0=A2 B4.Attachment1=A3 B4.CurveSize0=-4 B4.CurveSize1=-4
	local TV=Instance.new("NumberValue") TV.Value=Trans local CV=Instance.new("Color3Value") CV.Value=Col	
	P.CFrame=CFrame.new(100000,100000,100000)
	--properties
	A1.WorldCFrame=cf*CFrame.new(0,0,size/2)*OrienRad(Ang,0,0)  A2.WorldCFrame=cf*CFrame.new(0,0,-size/2)*OrienRad(Ang,-180,0) --Pos
	A3.WorldCFrame=cf*CFrame.new(size/2,0,0)*OrienRad(Ang,90,0) A4.WorldCFrame=cf*CFrame.new(-size/2,0,0)*OrienRad(Ang,-90,0)
	B1.Transparency=NumberSequence.new(Trans) B2.Transparency=NumberSequence.new(Trans) 
	B3.Transparency=NumberSequence.new(Trans) B4.Transparency=NumberSequence.new(Trans)
	B1.Color=ColorSequence.new(Col) B2.Color=ColorSequence.new(Col) B3.Color=ColorSequence.new(Col) B4.Color=ColorSequence.new(Col)
	B1.Width0=Width*2 B1.Width1=Width*2 
	B2.Width0=Width*2 B2.Width1=Width*2 
	B3.Width0=Width*2 B3.Width1=Width*2 
	B4.Width0=Width*2 B4.Width1=Width*2
	B1.CurveSize0=(size/2)*.6 B1.CurveSize1=(size/2)*.6 
	B2.CurveSize0=-(size/2)*.6 B2.CurveSize1=-(size/2)*.6
	B3.CurveSize0=(size/2)*.6 B3.CurveSize1=(size/2)*.6
	B4.CurveSize0=-(size/2)*.6 B4.CurveSize1=-(size/2)*.6
	P.Parent=effectmodel
	Tween(A1,{WorldCFrame=cf*CFrame.new(0,0,sizet/2)*OrienRad(AngT,0,0)},{Time,Style,Dir,0,false,0}) Tween(A2,{WorldCFrame=cf*CFrame.new(0,0,-sizet/2)*OrienRad(AngT,180,0)},{Time,Style,Dir,0,false,0}) 
	Tween(A3,{WorldCFrame=cf*CFrame.new(sizet/2,0,0)*OrienRad(AngT,90,0)},{Time,Style,Dir,0,false,0}) Tween(A4,{WorldCFrame=cf*CFrame.new(-sizet/2,0,0)*OrienRad(AngT,-90,0)},{Time,Style,Dir,0,false,0})
	Tween(TV,{Value=TransT},{Time,Style,Dir,0,false,0}) Tween(CV,{Value=ColT},{Time,Style,Dir,0,false,0})
	Tween(B1,{Width0=WidthT*2,Width1=WidthT*2,CurveSize0=(sizet/2)*.60000000,CurveSize1=(sizet/2)*.60000000},{Time,Style,Dir,0,false,0}) Tween(B2,{Width0=WidthT*2,Width1=WidthT*2,CurveSize0=-(sizet/2)*.60000000,CurveSize1=-(sizet/2)*.60000000},{Time,Style,Dir,0,false,0}) Tween(B3,{Width0=WidthT*2,Width1=WidthT*2,CurveSize0=(sizet/2)*.60000000,CurveSize1=(sizet/2)*.60000000},{Time,Style,Dir,0,false,0}) Tween(B4,{Width0=WidthT*2,Width1=WidthT*2,CurveSize0=-(sizet/2)*.60000000,CurveSize1=-(sizet/2)*.60000000},{Time,Style,Dir,0,false,0})
	TV.Changed:Connect(function()
		B1.Transparency,B2.Transparency,B3.Transparency,B4.Transparency=NumberSequence.new(TV.Value),NumberSequence.new(TV.Value),NumberSequence.new(TV.Value),NumberSequence.new(TV.Value)
		B1.Color,B2.Color,B3.Color,B4.Color=ColorSequence.new(CV.Value),ColorSequence.new(CV.Value),ColorSequence.new(CV.Value),ColorSequence.new(CV.Value)
	end)
	if Time>0 then game:GetService("Debris"):AddItem(P,Time+.25) end
	return P
end

local function NewBeamRing2(cf,size,Width,Ang,Trans,Col,sizet,WidthT,AngT,TransT,ColT,Time,Style,Dir)
	assert(cf,"no cframe given") size=size or 5 Width=Width or 1 Ang=Ang or 90 Trans=Trans or 0 Col=Col or Color3.new(1,1,1) sizet=sizet or 10 WidthT=WidthT or 5 AngT=AngT or 0 TransT=TransT or 1 ColT=ColT or Color3.new(1,1,1) Time=Time or 1.5 Style=Style or Enum.EasingStyle.Exponential Dir=Dir or Enum.EasingDirection.Out
	local patternnum = 0
	local P=Instance.new("Part") P.Anchored=true --Part
	local A1=Instance.new("Attachment",P) A1.WorldCFrame=cf*CFrame.new(0, 0, 7.5)*OrienRad(0,0,-10) local A2=Instance.new("Attachment",P) A2.WorldCFrame=cf*CFrame.new(0, 0, -7.5)*OrienRad(90, -180, 0)
	local A3=Instance.new("Attachment",P) A3.WorldCFrame=cf*CFrame.new(7.5, 0, 0)*OrienRad(90, 90, 0) local A4=Instance.new("Attachment",P) A4.WorldCFrame=cf*CFrame.new(-7.5, 0, 0)*OrienRad(90, -90, 0)
	local B1=imstuff["Facility"]["B2"]:Clone() B1.Parent=P B1.Attachment0=A1 B1.Attachment1=A3 local B2=imstuff["Facility"]["B2"]:Clone() B2.Parent=P B2.Attachment0=A1 B2.Attachment1=A4 B2.CurveSize0=-4 B2.CurveSize1=-4
	local B3=imstuff["Facility"]["B2"]:Clone() B3.Parent=P B3.Attachment0=A2 B3.Attachment1=A4 local B4=imstuff["Facility"]["B2"]:Clone() B4.Parent=P B4.Attachment0=A2 B4.Attachment1=A3 B4.CurveSize0=-4 B4.CurveSize1=-4
	local TV=Instance.new("NumberValue") TV.Value=Trans local CV=Instance.new("Color3Value") CV.Value=Col	
	P.CFrame=CFrame.new(100000,100000,100000)
	--properties
	A1.WorldCFrame=cf*CFrame.new(0,0,size/2)*OrienRad(Ang,0,0)  A2.WorldCFrame=cf*CFrame.new(0,0,-size/2)*OrienRad(Ang,-180,0) --Pos
	A3.WorldCFrame=cf*CFrame.new(size/2,0,0)*OrienRad(Ang,90,0) A4.WorldCFrame=cf*CFrame.new(-size/2,0,0)*OrienRad(Ang,-90,0)
	B1.LightInfluence=0 B1.LightEmission=1 B1.Brightness=10
	B2.LightInfluence=0 B2.LightEmission=1 B2.Brightness=10
	B3.LightInfluence=0 B3.LightEmission=1 B3.Brightness=10
	B4.LightInfluence=0 B4.LightEmission=1 B4.Brightness=10

	B1.Transparency=NumberSequence.new(Trans) B2.Transparency=NumberSequence.new(Trans) 
	B3.Transparency=NumberSequence.new(Trans) B4.Transparency=NumberSequence.new(Trans)
	B1.Color=ColorSequence.new(Col) B2.Color=ColorSequence.new(Col) B3.Color=ColorSequence.new(Col) B4.Color=ColorSequence.new(Col)
	B1.Width0=Width*2 B1.Width1=Width*2 
	B2.Width0=Width*2 B2.Width1=Width*2 
	B3.Width0=Width*2 B3.Width1=Width*2 
	B4.Width0=Width*2 B4.Width1=Width*2
	B1.CurveSize0=(size/2)*.6 B1.CurveSize1=(size/2)*.6 
	B2.CurveSize0=-(size/2)*.6 B2.CurveSize1=-(size/2)*.6
	B3.CurveSize0=(size/2)*.6 B3.CurveSize1=(size/2)*.6
	B4.CurveSize0=-(size/2)*.6 B4.CurveSize1=-(size/2)*.6
	P.Parent=effectmodel
	Tween(A1,{WorldCFrame=cf*CFrame.new(0,0,sizet/2)*OrienRad(AngT,0,0)},{Time,Style,Dir,0,false,0}) Tween(A2,{WorldCFrame=cf*CFrame.new(0,0,-sizet/2)*OrienRad(AngT,180,0)},{Time,Style,Dir,0,false,0}) 
	Tween(A3,{WorldCFrame=cf*CFrame.new(sizet/2,0,0)*OrienRad(AngT,90,0)},{Time,Style,Dir,0,false,0}) Tween(A4,{WorldCFrame=cf*CFrame.new(-sizet/2,0,0)*OrienRad(AngT,-90,0)},{Time,Style,Dir,0,false,0})
	Tween(TV,{Value=TransT},{Time,Style,Dir,0,false,0}) Tween(CV,{Value=ColT},{Time,Style,Dir,0,false,0})
	Tween(B1,{Width0=WidthT*2,Width1=WidthT*2,CurveSize0=(sizet/2)*.60000000,CurveSize1=(sizet/2)*.60000000},{Time,Style,Dir,0,false,0}) Tween(B2,{Width0=WidthT*2,Width1=WidthT*2,CurveSize0=-(sizet/2)*.60000000,CurveSize1=-(sizet/2)*.60000000},{Time,Style,Dir,0,false,0}) Tween(B3,{Width0=WidthT*2,Width1=WidthT*2,CurveSize0=(sizet/2)*.60000000,CurveSize1=(sizet/2)*.60000000},{Time,Style,Dir,0,false,0}) Tween(B4,{Width0=WidthT*2,Width1=WidthT*2,CurveSize0=-(sizet/2)*.60000000,CurveSize1=-(sizet/2)*.60000000},{Time,Style,Dir,0,false,0})
	TV.Changed:Connect(function()
		B1.Transparency,B2.Transparency,B3.Transparency,B4.Transparency=NumberSequence.new(TV.Value),NumberSequence.new(TV.Value),NumberSequence.new(TV.Value),NumberSequence.new(TV.Value)
		B1.Color,B2.Color,B3.Color,B4.Color=ColorSequence.new(CV.Value),ColorSequence.new(CV.Value),ColorSequence.new(CV.Value),ColorSequence.new(CV.Value)
	end)
	task.spawn(function()
		TV.Changed:Connect(function() task.wait(0.04)
			pcall(function()
				local s=animatedpat(patternnum) local bems = {B1,B2,B3,B4} local at = {A1,A2,A3,A4}
				for i,v in pairs(bems) do
					v.Texture=s[1]
					local cfa0=v.Attachment0.WorldCFrame local cfa1=v.Attachment1.WorldCFrame local p0=cfa0.p local p3=cfa1.p  local ax0=cfa0.RightVector*v.CurveSize0 local ax1=cfa1.RightVector*v.CurveSize1*-1 local p1=p0+ax0  local p2=p3+ax1
					if math.random(1,18) == 1 then
						for i=0,7 do
							local poss= CFrame.new(bezier(i*1/6,p0,p1,p2,p3),bezier((i+1)*1/6,p0,p1,p2,p3)).p
							local region=Region3.new(poss-Vector3.new(1,1,1)*13/2,poss+Vector3.new(1,0,1)*13/2)
							--task.spawn(function() local sda = Instance.new("Part",workspace) sda.Size = region.Size sda.Anchored = true sda.Position =poss task.wait(0.5) sda:Destroy()end)
							pcall(function() --hit 
								for _,a in next,workspace:FindPartsInRegion3WithIgnoreList(region,{mmodel,soundpart,effectmodel,humanModel,(followchar and plr.Character or mmodel)},100) do 
									if (a.Parent ~= mmodel and a.Parent ~= effectmodel and a ~= mmodel and a ~= effectmodel and a ~= soundpart and a.Parent ~= soundpart and a ~= script and a.Parent ~= script) and a.ClassName == "Part" or a.ClassName == "MeshPart" or a.ClassName == "TrussPart" or a.ClassName == "WedgePart" or a.ClassName == "CornerWedgePart" or a.ClassName == "UnionOperation" or a.ClassName == "NegateOperation" or a.ClassName == "Seat" or a.ClassName == "VehicleSeat" or a.ClassName == "FlagStand" or a.ClassName == "SpawnLocation" then
										if a.Parent ~= nil and a.Parent ~= workspace and a.Parent:IsA("Model") and a.Parent.ClassName == "Model" and a.Size == Vector3.new(2,2,1) or a.Size == Vector3.new(2,2.1,1) or a.Size == Vector3.new(1,1.105,1) or a.Size == Vector3.new(1,1.227,1) or a.Size == Vector3.new(1,1.253,1) or a.Size == Vector3.new(1,1.277,1) or a.Size == Vector3.new(1,2,1) or a.Size == Vector3.new(2,1,1) or a.Name == "Head" or a.Name == "Torso" or a.Name == "Right Arm" or a.Name == "Left Arm" or a.Name == "Right Leg" or a.Name == "Left Leg" or a.Name == "UpperTorso" or a.Name == "HumanoidRootPart" or a.Name == "LowerTorso" or a.Name == "RightHand" or a.Name == "LeftHand" or a.Name == "RightFoot" or a.Name == "LeftFoot" or a.Name == "LeftUpperArm" or a.Name == "LeftLowerArm" or a.Name == "RightUpperArm" or a.Name == "RightLowerArm" or a.Name == "LeftUpperLeg" or a.Name == "LeftLowerLeg" or a.Name == "RightUpperLeg" or a.Name == "RightLowerLeg" then
											if (a.Position - poss).Magnitude <= 30+a.Size.Magnitude then
												local mainpart=(a.Parent:FindFirstChildOfClass'Part' or a.Parent:FindFirstChildOfClass'MeshPart' or a.Parent:FindFirstChildOfClass'UnionOperation') 
												local hum=(a.Parent:FindFirstChildOfClass'Humanoid' or nil)
												pcall(function() if mainpart.Parent==workspace then mainpart=a end
													local P=Instance.new("Part",workspace.Terrain) P.Transparency=1 P.Anchored=true P.Size=Vector3.new(0.050000000745058, 0.050000000745058, 0.050000000745058) P.CanCollide=false  
													P.CFrame=CFrame.new(10000,10000,10000)
													local A1=Instance.new("Attachment",P) A1.WorldCFrame=CFrame.new(mainpart.CFrame.p)*CFrame.new(math.random(-2,2),math.random(-2,2),math.random(-2,2)) local v1=imstuff["Facility"]["m1"]:Clone() v1.Parent=A1 local v2=imstuff["Facility"]["m2"]:Clone() v2.Parent=A1 local v3=imstuff["Facility"]["m3"]:Clone() v3.Parent=A1 local v4=imstuff["Facility"]["m4"]:Clone() v4.Parent=A1 
													game:GetService("Debris"):AddItem(P,2)
													syncSound({SoundId="rbxassetid://"..bodyimpact[math.random(1,#bodyimpact)],Volume=0.9,PlayOnRemove=true,TimePosition=0.01,Pitch=math.random(8, 10)/math.random(9,13),Parent=A1})
													CamShake(mainpart.CFrame,35,.75,.05)
													v1:Emit(30) v2:Emit(30) v3:Emit(30) v4:Emit(30) 
													if hum and hum.Health >= 1 and hum.MaxHealth<100000 then 
														hum.Health=hum.Health-math.random(1,3+Power)
														if mainpart.Anchored ~= true then
															a.RotVelocity = CFrame.new(poss, a.Position).LookVector * 55
															a.Velocity = CFrame.new(poss, a.Position).LookVector * 55 
														end
													else
														if mainpart.Anchored ~= true then
															a.RotVelocity = CFrame.new(poss, a.Position).LookVector * 55
															a.Velocity = CFrame.new(poss, a.Position).LookVector * 55 
														end
														if math.random(1,13) == 1 then
															if math.random(1,2) == 1 then
																sideeffect(mainpart)
															else
																effect(
																	false,
																	{CFrame = mainpart.CFrame,Size=mainpart.Size,Material="Glass",Color=mainpart.Color,Anchored=true,CanCollide=false,Transparency=0,Reflectance=-15}, --part proper
																	{Scale=Vector3.new(),MeshType="Sphere"},
																	{
																		{--1
																			dely=math.random(1,5)/math.random(5,8),
																			info={0.8,Enum.EasingStyle.Elastic,Enum.EasingDirection.InOut},
																			part={Transparency=0,CFrame=mainpart.CFrame*CFrame.new(math.random(-1,1),math.random(-1,1),math.random(-1,1)),Color=Color3.fromRGB(108, 214, 147),Reflectance=15}
																		},
																		{--2
																			dely=0,
																			info={0.3,Enum.EasingStyle.Linear,Enum.EasingDirection.Out},
																			part={Transparency=0,CFrame=mainpart.CFrame*CFrame.new(math.random(-3,3),math.random(-3,3),math.random(-3,3))*CFrame.Angles(math.random(-80,80),math.random(-80,80),math.random(-80,80)),Color=Color3.fromRGB(108, 214, 147),Reflectance=-15}
																		},
																		{--3
																			acc={vdec=CFrame.new(math.random(-1,1)/1555,math.random(-1,1)/1555,math.random(-1,1)/1555),vel=CFrame.new(0,0,0)*CFrame.Angles(math.random(1,2)/math.random(45,65),math.random(1,2)/math.random(45,65),math.random(1,2)/math.random(45,65))},
																			info={5.8,Enum.EasingStyle.Elastic,Enum.EasingDirection.InOut},
																			mesh={Scale=Vector3.new(0,0,0)},
																			part={Transparency=1,Size=Vector3.new(0,0,0),Color=Color3.fromRGB(),Reflectance=7}
																		}
																	}
																)
															end
															syncSound({SoundId="rbxassetid://3748209678",Volume=4.5,PlayOnRemove=true,TimePosition=0,Pitch=math.random(8, 10)/math.random(5, 10),Parent=mainpart}) mainpart:Destroy()
														end
													end
												end) break
											end
										end
									end;
								end
							end)
						end
					end
				end
				patternnum=patternnum+1
				if 25 <= patternnum then patternnum = 0 end
			end)
		end)
	end)
	if Time>0 then game:GetService("Debris"):AddItem(P,Time+.25) end
	return P
end

function sideeffect(part0,color)
	coroutine.resume(coroutine.create(function()
		local moveto=part0.CFrame*CFrame.new(math.random(-1,1),math.random(-1,1),math.random(-1,1))
		local dekle=math.random(1,2)/math.random(5,8)
		local s=Instance.new("Part",effectmodel)
		s.Size=part0.Size
		s.CanCollide=false
		s.Anchored=true
		s.CFrame=part0.CFrame
		s.Color=part0.Color
		s.Transparency=0
		s.Material="Glass"
		s.Reflectance=-15
		local tw2=CreateTween(s, { 1.2,  Enum.EasingStyle.Elastic, Enum.EasingDirection.InOut, 0, false, 0 },{Size=part0.Size,Reflectance=15,CFrame=moveto,Color=Color3.fromRGB(108, 214, 147),Transparency=0}, true) tw2.Completed:Wait()
		local EasingStyle=Enum.EasingStyle.Back local EasingDirection=Enum.EasingDirection.InOut local speed=1.3
		local S = randomSoundNR(CCOQue,CCOQue2,CCOCurrent) if S[2] == true then if CCOCurrent == CCOQue then CCOCurrent=CCOQue2 elseif CCOCurrent == CCOQue2 then CCOCurrent=CCOQue end end
		effect(
			false,
			{CFrame = moveto*CFrame.new(0, 0,part0.Size.Z/2),Size=Vector3.new(part0.Size.X, part0.Size.Y,0),Material="Glass",Color=Color3.fromRGB(108, 214, 147),Anchored=true,CanCollide=false,Transparency=0,Reflectance=15}, --part proper
			{Scale=Vector3.new(),MeshType="Sphere"},
			{
				{--2
					dely=math.random(1,5)/math.random(6,16),
					Sound2={S[1],2,0.98 + (math.random() * .1)},
					Sound={"8229133661",2,0.8 + (math.random() * .5)}
				},
				{--2
					dely=0,
					info={0.3,Enum.EasingStyle.Linear,Enum.EasingDirection.Out},
					part={Transparency=0,Color=Color3.fromRGB(108, 214, 147),Reflectance=-15}
				},
				{--3
					acc={vdec=CFrame.new(math.random(-1,1)/1555,math.random(-1,1)/1555,math.random(-1,1)/1555),vel=CFrame.new(0,0,0)*CFrame.Angles(math.random(1,2)/math.random(45,65),math.random(1,2)/math.random(45,65),math.random(1,2)/math.random(45,65))},
					info={5.8,Enum.EasingStyle.Elastic,Enum.EasingDirection.InOut},
					mesh={Scale=Vector3.new(0,0,0)},
					part={Transparency=1,Size=Vector3.new(0,0,0),Color=Color3.fromRGB(),Reflectance=7}
				}
			}
		)
		local S2 = randomSoundNR(CCOQue,CCOQue2,CCOCurrent) if S2[2] == true then if CCOCurrent == CCOQue then CCOCurrent=CCOQue2 elseif CCOCurrent == CCOQue2 then CCOCurrent=CCOQue end end
		effect(
			false,
			{CFrame = moveto*CFrame.new(0, 0,-part0.Size.Z/2),Size=Vector3.new(part0.Size.X, part0.Size.Y,0),Material="Glass",Color=Color3.fromRGB(108, 214, 147),Anchored=true,CanCollide=false,Transparency=0,Reflectance=15}, --part proper
			{Scale=Vector3.new(),MeshType="Sphere"},
			{
				{--2
					dely=math.random(1,5)/math.random(6,16),
					Sound2={S2[1],2,0.98 + (math.random() * .1)},
					Sound={"8229133661",2,0.8 + (math.random() * .5)}
				},
				{--2
					dely=0,
					info={0.3,Enum.EasingStyle.Linear,Enum.EasingDirection.Out},
					part={Transparency=0,Color=Color3.fromRGB(108, 214, 147),Reflectance=-15}
				},
				{--3
					acc={vdec=CFrame.new(math.random(-1,1)/1555,math.random(-1,1)/1555,math.random(-1,1)/1555),vel=CFrame.new(0,0,0)*CFrame.Angles(math.random(1,2)/math.random(45,65),math.random(1,2)/math.random(45,65),math.random(1,2)/math.random(45,65))},
					info={5.8,Enum.EasingStyle.Elastic,Enum.EasingDirection.InOut},
					mesh={Scale=Vector3.new(0,0,0)},
					part={Transparency=1,Size=Vector3.new(0,0,0),Color=Color3.fromRGB(),Reflectance=7}
				}
			}
		)
		local S3 = randomSoundNR(CCOQue,CCOQue2,CCOCurrent) if S3[2] == true then if CCOCurrent == CCOQue then CCOCurrent=CCOQue2 elseif CCOCurrent == CCOQue2 then CCOCurrent=CCOQue end end
		effect(
			false,
			{CFrame = moveto*CFrame.new(0,part0.Size.Y/2,0),Size=Vector3.new(part0.Size.X, 0,part0.Size.Z),Material="Glass",Color=Color3.fromRGB(108, 214, 147),Anchored=true,CanCollide=false,Transparency=0,Reflectance=15}, --part proper
			{Scale=Vector3.new(),MeshType="Sphere"},
			{
				{--2
					dely=math.random(1,5)/math.random(6,16),
					Sound2={S3[1],2,0.98 + (math.random() * .1)},
					Sound={"8229133661",2,0.8 + (math.random() * .5)}
				},
				{--2
					dely=0,
					info={0.3,Enum.EasingStyle.Linear,Enum.EasingDirection.Out},
					part={Transparency=0,Color=Color3.fromRGB(108, 214, 147),Reflectance=-15}
				},
				{--3
					acc={vdec=CFrame.new(math.random(-1,1)/1555,math.random(-1,1)/1555,math.random(-1,1)/1555),vel=CFrame.new(0,0,0)*CFrame.Angles(math.random(1,2)/math.random(45,65),math.random(1,2)/math.random(45,65),math.random(1,2)/math.random(45,65))},
					info={5.8,Enum.EasingStyle.Elastic,Enum.EasingDirection.InOut},
					mesh={Scale=Vector3.new(0,0,0)},
					part={Transparency=1,Size=Vector3.new(0,0,0),Color=Color3.fromRGB(),Reflectance=7}
				}
			}
		)
		local S4 = randomSoundNR(CCOQue,CCOQue2,CCOCurrent) if S4[2] == true then if CCOCurrent == CCOQue then CCOCurrent=CCOQue2 elseif CCOCurrent == CCOQue2 then CCOCurrent=CCOQue end end
		effect(
			false,
			{CFrame = moveto*CFrame.new(0,-part0.Size.Y/2,0),Size=Vector3.new(part0.Size.X, 0,part0.Size.Z),Material="Glass",Color=Color3.fromRGB(108, 214, 147),Anchored=true,CanCollide=false,Transparency=0,Reflectance=15}, --part proper
			{Scale=Vector3.new(),MeshType="Sphere"},
			{
				{--2
					dely=math.random(1,5)/math.random(6,16),
					Sound2={S4[1],2,0.98 + (math.random() * .1)},
					Sound={"8229133661",2,0.8 + (math.random() * .5)}
				},
				{--2
					dely=0,
					info={0.3,Enum.EasingStyle.Linear,Enum.EasingDirection.Out},
					part={Transparency=0,Color=Color3.fromRGB(108, 214, 147),Reflectance=-15}
				},
				{--3
					acc={vdec=CFrame.new(math.random(-1,1)/1555,math.random(-1,1)/1555,math.random(-1,1)/1555),vel=CFrame.new(0,0,0)*CFrame.Angles(math.random(1,2)/math.random(45,65),math.random(1,2)/math.random(45,65),math.random(1,2)/math.random(45,65))},
					info={5.8,Enum.EasingStyle.Elastic,Enum.EasingDirection.InOut},
					mesh={Scale=Vector3.new(0,0,0)},
					part={Transparency=1,Size=Vector3.new(0,0,0),Color=Color3.fromRGB(),Reflectance=7}
				}
			}
		)
		local S5 = randomSoundNR(CCOQue,CCOQue2,CCOCurrent) if S5[2] == true then if CCOCurrent == CCOQue then CCOCurrent=CCOQue2 elseif CCOCurrent == CCOQue2 then CCOCurrent=CCOQue end end
		effect(
			false,
			{CFrame = moveto*CFrame.new(part0.Size.X/2,0,0),Size=Vector3.new(0, part0.Size.Y,part0.Size.Z),Material="Glass",Color=Color3.fromRGB(108, 214, 147),Anchored=true,CanCollide=false,Transparency=0,Reflectance=15}, --part proper
			{Scale=Vector3.new(),MeshType="Sphere"},
			{
				{--2
					dely=math.random(1,5)/math.random(6,16),
					Sound2={S5[1],2,0.98 + (math.random() * .1)},
					Sound={"8229133661",2,0.8 + (math.random() * .5)}
				},
				{--2
					dely=0,
					info={0.3,Enum.EasingStyle.Linear,Enum.EasingDirection.Out},
					part={Transparency=0,Color=Color3.fromRGB(108, 214, 147),Reflectance=-15}
				},
				{--3
					acc={vdec=CFrame.new(math.random(-1,1)/1555,math.random(-1,1)/1555,math.random(-1,1)/1555),vel=CFrame.new(0,0,0)*CFrame.Angles(math.random(1,2)/math.random(45,65),math.random(1,2)/math.random(45,65),math.random(1,2)/math.random(45,65))},
					info={5.8,Enum.EasingStyle.Elastic,Enum.EasingDirection.InOut},
					mesh={Scale=Vector3.new(0,0,0)},
					part={Transparency=1,Size=Vector3.new(0,0,0),Color=Color3.fromRGB(),Reflectance=7}
				}
			}
		)
		local S6 = randomSoundNR(CCOQue,CCOQue2,CCOCurrent) if S6[2] == true then if CCOCurrent == CCOQue then CCOCurrent=CCOQue2 elseif CCOCurrent == CCOQue2 then CCOCurrent=CCOQue end end
		effect(
			false,
			{CFrame = moveto*CFrame.new(-part0.Size.X/2,0,0),Size=Vector3.new(0, part0.Size.Y,part0.Size.Z),Material="Glass",Color=Color3.fromRGB(108, 214, 147),Anchored=true,CanCollide=false,Transparency=0,Reflectance=15}, --part proper
			{Scale=Vector3.new(),MeshType="Sphere"},
			{
				{--2
					dely=math.random(1,5)/math.random(6,16),
					Sound2={S6[1],2,0.98 + (math.random() * .1)},
					Sound={"8229133661",2,0.8 + (math.random() * .5)}
				},
				{--2
					dely=0,
					info={0.3,Enum.EasingStyle.Linear,Enum.EasingDirection.Out},
					part={Transparency=0,Color=Color3.fromRGB(108, 214, 147),Reflectance=-15}
				},
				{--3
					acc={vdec=CFrame.new(math.random(-1,1)/1555,math.random(-1,1)/1555,math.random(-1,1)/1555),vel=CFrame.new(0,0,0)*CFrame.Angles(math.random(1,2)/math.random(45,65),math.random(1,2)/math.random(45,65),math.random(1,2)/math.random(45,65))},
					info={5.8,Enum.EasingStyle.Elastic,Enum.EasingDirection.InOut},
					mesh={Scale=Vector3.new(0,0,0)},
					part={Transparency=1,Size=Vector3.new(0,0,0),Color=Color3.fromRGB(),Reflectance=7}
				}
			}
		)
		pcall(function()
			s:destroy()
		end)
	end))
end



function cur(Where,nohands)
	task.spawn(function()
		local TargetMain = CFrame.fromOrientation(math.rad(90),math.rad(math.random(-190,190)),0) local Rwhere = Where or CFrame.new()
		pcall(function()
			if aiming then
				for _,a in next,reg(Where.Position,115+15,{mmodel,soundpart,effectmodel,humanModel,(followchar and plr.Character or mmodel)})[1] do 
					if (a.Parent ~= mmodel and a.Parent ~= effectmodel and a ~= mmodel and a ~= effectmodel and a ~= soundpart and a.Parent ~= soundpart and a ~= script and a.Parent ~= script) and a.ClassName == "Part" or a.ClassName == "MeshPart" or a.ClassName == "TrussPart" or a.ClassName == "WedgePart" or a.ClassName == "CornerWedgePart" or a.ClassName == "UnionOperation" or a.ClassName == "NegateOperation" or a.ClassName == "Seat" or a.ClassName == "VehicleSeat" or a.ClassName == "FlagStand" or a.ClassName == "SpawnLocation" then
						if a.Parent ~= nil and a.Parent ~= workspace and a.Parent:IsA("Model") and a.Parent.ClassName == "Model" and a.Size == Vector3.new(2,2,1) or a.Size == Vector3.new(2,2.1,1) or a.Size == Vector3.new(1,1.105,1) or a.Size == Vector3.new(1,1.227,1) or a.Size == Vector3.new(1,1.253,1) or a.Size == Vector3.new(1,1.277,1) or a.Size == Vector3.new(1,2,1) or a.Size == Vector3.new(2,1,1) or a.Name == "Head" or a.Name == "Torso" or a.Name == "Right Arm" or a.Name == "Left Arm" or a.Name == "Right Leg" or a.Name == "Left Leg" or a.Name == "UpperTorso" or a.Name == "HumanoidRootPart" or a.Name == "LowerTorso" or a.Name == "RightHand" or a.Name == "LeftHand" or a.Name == "RightFoot" or a.Name == "LeftFoot" or a.Name == "LeftUpperArm" or a.Name == "LeftLowerArm" or a.Name == "RightUpperArm" or a.Name == "RightLowerArm" or a.Name == "LeftUpperLeg" or a.Name == "LeftLowerLeg" or a.Name == "RightUpperLeg" or a.Name == "RightLowerLeg" then
							if (a.Position - Where.Position).Magnitude <= 115+a.Size.Magnitude then
								local mainpart=(a.Parent:FindFirstChildOfClass'Part' or a.Parent:FindFirstChildOfClass'MeshPart' or a.Parent:FindFirstChildOfClass'UnionOperation') 
								if mainpart.Parent==workspace then mainpart=a end
								local clampAngle = math.rad(300) local lPos = Where:PointToObjectSpace(mainpart.CFrame.p) local theta = math.clamp(math.atan2(-lPos.x, -lPos.z), -clampAngle, clampAngle)
								TargetMain=CFrame.fromOrientation(math.rad(90),theta,0)
							end
						end
					end
				end
			end
		end)
		local speed = 0.025 local width = 13.5 local length = 5 local TartPos = Rwhere*TargetMain
		local lines = {}
		local Bomb = imstuff["Models"].Lbomb:Clone()  Bomb.Parent=effectmodel Bomb.Anchored=true local ranAng=CFrame.fromOrientation(math.rad(math.random(-90,90)),math.rad(math.random(-90,90)),math.rad(math.random(-90,90)))
		if nohands then
			Bomb.CFrame=Rwhere*CFrame.new(math.random(-20,20),math.random(60,150),math.random(-20,20))*ranAng
		else
			table.foreach(MonaJoints,function(_,v) 
				if v.Name == "HandL" then
					Bomb.CFrame=v.WorldCFrame*ranAng
					return
				end
			end)
		end
		CreateTween(Bomb, { 0.2,  Enum.EasingStyle.Sine, Enum.EasingDirection.In, 0, false, 0 },{CFrame=TartPos*CFrame.Angles(math.random(-90,90),math.random(-90,90),math.random(-90,90))}, true).Completed:Wait()
		local P=Instance.new("Part",workspace.Terrain) P.Transparency=1 P.Anchored=true P.Size=Vector3.new(0.050000000745058, 0.050000000745058, 0.050000000745058) P.CanCollide=false  
		P.CFrame=CFrame.new(10000,10000,10000)
		local A1=Instance.new("Attachment",P) A1.WorldCFrame=Rwhere local v1=imstuff["Facility"]["L1"]:Clone() v1.Parent=A1 local v2=imstuff["Facility"]["L2"]:Clone() v2.Parent=A1 local v3=imstuff["Facility"]["L3"]:Clone() v3.Parent=A1 
		game:GetService("Debris"):AddItem(P,5)
		CamShake(Rwhere,35,.75,.1)
		v1:Emit(30) v2:Emit(30) v3:Emit(10) 
		spawn(function()
			pcall(function()
				local twB local P=Instance.new("Part",effectmodel) P.CFrame=CFrame.new(10000,10000,10000) P.Transparency=1 P.Size=Vector3.new(0.050000000745058, 0.050000000745058, 0.050000000745058) P.CanCollide=false P.Anchored=true local A1=Instance.new("Attachment",P) A1.Position=Vector3.new(0, 0, 0) local A2=Instance.new("Attachment",P) A2.Name = "Attachment2" A2.Position=Vector3.new(0, 0, 0) local Bem=imstuff["Facility"]["Beam"]:Clone() Bem.Parent=P Bem.Attachment0=A1 Bem.Attachment1=A2
				A1.WorldCFrame = TartPos*CFrame.new(0,0,1) table.insert(lines,P)
				A2.WorldCFrame = TartPos
				syncSound({SoundId="rbxassetid://7507689581",Volume=5,PlayOnRemove=true,TimePosition=0,Pitch=math.random(8, 10)/math.random(8, 10),Parent=A1})
				twB=CreateTween(Bem, { speed,  Enum.EasingStyle.Bounce, Enum.EasingDirection.Out, 0, false, 0 },{Width0=width,Width1=width}, true)
				twB.Completed:Wait()
			end)
			for i = 1,length do
				pcall(function()
					local twB local P=Instance.new("Part",effectmodel) P.CFrame=CFrame.new(10000,10000,10000) P.Transparency=1 P.Size=Vector3.new(0.050000000745058, 0.050000000745058, 0.050000000745058) P.CanCollide=false P.Anchored=true local A1=Instance.new("Attachment",P) A1.Position=Vector3.new(0, 0, 0) local A2=Instance.new("Attachment",P) A2.Name = "Attachment2" A2.Position=Vector3.new(0, 0, 0) local Bem=imstuff["Facility"]["Beam"]:Clone() Bem.Parent=P Bem.Attachment0=A1 Bem.Attachment1=A2
					A1.WorldCFrame = TartPos*CFrame.new(0,0,1)*CFrame.new(0,width*i/2,0) table.insert(lines,P)
					A2.WorldCFrame = TartPos*CFrame.new(0,-width*i/2,0)
					CreateTween(A1, { speed,  Enum.EasingStyle.Bounce, Enum.EasingDirection.Out, 0, false, 0 },{WorldCFrame=TartPos*CFrame.new(0,0,1)*CFrame.new(0,-width*i,0)}, true)
					CreateTween(A2, { speed,  Enum.EasingStyle.Bounce, Enum.EasingDirection.Out, 0, false, 0 },{WorldCFrame=TartPos*CFrame.new(0,-width*i,0)}, true)
					twB=CreateTween(Bem, { speed,  Enum.EasingStyle.Bounce, Enum.EasingDirection.Out, 0, false, 0 },{Width0=width,Width1=width}, true)
				end)
				local twB local P=Instance.new("Part",effectmodel) P.CFrame=CFrame.new(10000,10000,10000) P.Transparency=1 P.Size=Vector3.new(0.050000000745058, 0.050000000745058, 0.050000000745058) P.CanCollide=false P.Anchored=true local A1=Instance.new("Attachment",P) A1.Position=Vector3.new(0, 0, 0) local A2=Instance.new("Attachment",P) A2.Name = "Attachment2" A2.Position=Vector3.new(0, 0, 0) local Bem=imstuff["Facility"]["Beam"]:Clone() Bem.Parent=P Bem.Attachment0=A1 Bem.Attachment1=A2
				A1.WorldCFrame = TartPos*CFrame.new(0,0,1)*CFrame.new(0,width*i/2,0) table.insert(lines,P)
				A2.WorldCFrame = TartPos*CFrame.new(0,width*i/2,0)
				CreateTween(A1, { speed,  Enum.EasingStyle.Bounce, Enum.EasingDirection.Out, 0, false, 0 },{WorldCFrame=TartPos*CFrame.new(0,0,1)*CFrame.new(0,width*i,0)}, true)
				CreateTween(A2, { speed,  Enum.EasingStyle.Bounce, Enum.EasingDirection.Out, 0, false, 0 },{WorldCFrame=TartPos*CFrame.new(0,width*i,0)}, true)
				twB=CreateTween(Bem, { speed,  Enum.EasingStyle.Bounce, Enum.EasingDirection.Out, 0, false, 0 },{Width0=width,Width1=width}, true)
				twB.Completed:Wait()
			end
			task.wait(0.85)
			if Bomb and Bomb.Parent then Bomb:Destroy() end
			local P=Instance.new("Part",workspace) P.CFrame = TartPos syncSound({SoundId="rbxassetid://7507691667",Volume=4,PlayOnRemove=true,TimePosition=0,Pitch=math.random(5, 6)/math.random(4,6),Parent=P}) P:Destroy() 
			for _, CV in pairs(lines) do
				task.spawn(function()
					if CV:FindFirstChild'Attachment2' then local top = CV:FindFirstChild'Attachment2'
						pcall(function() --hit
							for _,a in next,reg(top.WorldPosition,width-2,{mmodel,soundpart,effectmodel,humanModel,(followchar and plr.Character or mmodel)})[1] do 
								if (a.Parent ~= mmodel and a.Parent ~= effectmodel and a ~= mmodel and a ~= effectmodel and a ~= soundpart and a.Parent ~= soundpart and a ~= script and a.Parent ~= script) and a.ClassName == "Part" or a.ClassName == "MeshPart" or a.ClassName == "TrussPart" or a.ClassName == "WedgePart" or a.ClassName == "CornerWedgePart" or a.ClassName == "UnionOperation" or a.ClassName == "NegateOperation" or a.ClassName == "Seat" or a.ClassName == "VehicleSeat" or a.ClassName == "FlagStand" or a.ClassName == "SpawnLocation" then
									if a.Parent ~= nil and a.Parent ~= workspace and a.Parent:IsA("Model") and a.Parent.ClassName == "Model" and a.Size == Vector3.new(2,2,1) or a.Size == Vector3.new(2,2.1,1) or a.Size == Vector3.new(1,1.105,1) or a.Size == Vector3.new(1,1.227,1) or a.Size == Vector3.new(1,1.253,1) or a.Size == Vector3.new(1,1.277,1) or a.Size == Vector3.new(1,2,1) or a.Size == Vector3.new(2,1,1) or a.Name == "Head" or a.Name == "Torso" or a.Name == "Right Arm" or a.Name == "Left Arm" or a.Name == "Right Leg" or a.Name == "Left Leg" or a.Name == "UpperTorso" or a.Name == "HumanoidRootPart" or a.Name == "LowerTorso" or a.Name == "RightHand" or a.Name == "LeftHand" or a.Name == "RightFoot" or a.Name == "LeftFoot" or a.Name == "LeftUpperArm" or a.Name == "LeftLowerArm" or a.Name == "RightUpperArm" or a.Name == "RightLowerArm" or a.Name == "LeftUpperLeg" or a.Name == "LeftLowerLeg" or a.Name == "RightUpperLeg" or a.Name == "RightLowerLeg" then
										if (a.Position - top.WorldPosition).Magnitude <= 35+a.Size.Magnitude then
											local mainpart=(a.Parent:FindFirstChildOfClass'Part' or a.Parent:FindFirstChildOfClass'MeshPart' or a.Parent:FindFirstChildOfClass'UnionOperation') 
											local hum=(a.Parent:FindFirstChildOfClass'Humanoid' or nil)
											pcall(function() if mainpart.Parent==workspace then mainpart=a end
												local P=Instance.new("Part",workspace.Terrain) P.Transparency=1 P.Anchored=true P.Size=Vector3.new(0.050000000745058, 0.050000000745058, 0.050000000745058) P.CanCollide=false  
												P.CFrame=CFrame.new(10000,10000,10000)
												local A1=Instance.new("Attachment",P) A1.WorldCFrame=CFrame.new(mainpart.CFrame.p)*CFrame.new(math.random(-2,2),math.random(-2,2),math.random(-2,2)) local v1=imstuff["Facility"]["m1"]:Clone() v1.Parent=A1 local v2=imstuff["Facility"]["m2"]:Clone() v2.Parent=A1 local v3=imstuff["Facility"]["m3"]:Clone() v3.Parent=A1 local v4=imstuff["Facility"]["m4"]:Clone() v4.Parent=A1 
												game:GetService("Debris"):AddItem(P,2)
												syncSound({SoundId="rbxassetid://"..bodyimpact[math.random(1,#bodyimpact)],Volume=0.9,PlayOnRemove=true,TimePosition=0.01,Pitch=math.random(8, 10)/math.random(5, 10),Parent=A1}) 
												CamShake(mainpart.CFrame,35,.75,.1)
												if hum and hum.Health >= 1 then --and hum.MaxHealth<3000
													hum.Health=hum.Health-math.random(3,9)
													if mainpart.Anchored ~= true then
														mainpart.RotVelocity = CFrame.new(top.WorldPosition, mainpart.Position).LookVector * 45
														mainpart.Velocity = CFrame.new(top.WorldPosition, mainpart.Position).LookVector * 45 
													end
												else
													if math.random(1,(mainpart==a and 13 or 1)) == 1 then
														if math.random(1,2) == 1 then
															sideeffect(mainpart)
														else
															effect(
																false,
																{CFrame = mainpart.CFrame,Size=mainpart.Size,Material="Glass",Color=mainpart.Color,Anchored=true,CanCollide=false,Transparency=0,Reflectance=-15}, --part proper
																{Scale=Vector3.new(),MeshType="Sphere"},
																{
																	{--1
																		dely=math.random(1,5)/math.random(5,8),
																		info={0.8,Enum.EasingStyle.Elastic,Enum.EasingDirection.InOut},
																		part={Transparency=0,CFrame=mainpart.CFrame*CFrame.new(math.random(-1,1),math.random(-1,1),math.random(-1,1)),Color=Color3.fromRGB(108, 214, 147),Reflectance=15}
																	},
																	{--2
																		dely=0,
																		info={0.3,Enum.EasingStyle.Linear,Enum.EasingDirection.Out},
																		part={Transparency=0,CFrame=mainpart.CFrame*CFrame.new(math.random(-3,3),math.random(-3,3),math.random(-3,3))*CFrame.Angles(math.random(-80,80),math.random(-80,80),math.random(-80,80)),Color=Color3.fromRGB(108, 214, 147),Reflectance=-15}
																	},
																	{--3
																		acc={vdec=CFrame.new(math.random(-1,1)/1555,math.random(-1,1)/1555,math.random(-1,1)/1555),vel=CFrame.new(0,0,0)*CFrame.Angles(math.random(1,2)/math.random(45,65),math.random(1,2)/math.random(45,65),math.random(1,2)/math.random(45,65))},
																		info={5.8,Enum.EasingStyle.Elastic,Enum.EasingDirection.InOut},
																		mesh={Scale=Vector3.new(0,0,0)},
																		part={Transparency=1,Size=Vector3.new(0,0,0),Color=Color3.fromRGB(),Reflectance=7}
																	}
																}
															)
														end
														syncSound({SoundId="rbxassetid://3748209678",Volume=4.5,PlayOnRemove=true,TimePosition=0,Pitch=math.random(8, 10)/math.random(5, 10),Parent=mainpart}) mainpart:Destroy()
													end	
												end
												v1:Emit(30) v2:Emit(30) v3:Emit(30) v4:Emit(30) 
											end) break
										end
									end
								end;
							end
						end)
						if math.random(1,2) == 1 then
							CreateTween(top, { 0.12,  Enum.EasingStyle.Back, Enum.EasingDirection.Out, 0, false, 0 },{WorldCFrame=top.WorldCFrame*CFrame.new(0,0,-math.random(10,15))}, true).Completed:Wait()		
						else
							CreateTween(top, { 0.12,  Enum.EasingStyle.Back, Enum.EasingDirection.InOut, 0, false, 0 },{WorldCFrame=top.WorldCFrame*CFrame.new(0,0,-math.random(10,15))}, true).Completed:Wait()		
						end	
					end
					if CV:FindFirstChild'Beam' then local b = CV:FindFirstChild'Beam'
						CreateTween(b, { 0.12,  Enum.EasingStyle.Bounce, Enum.EasingDirection.Out, 0, false, 0 },{LightEmission=1}, true).Completed:Wait()		
					end
					CV:Destroy()
				end)
			end
		end)
	end)
end

function Curs()
	coroutine.resume(Add(coroutine.create(function()
		attacking=true movementfalse=true nowalk=true fallingspeed=0 local stopall = false swordphase=true local di = false
		local function anim(MonaJoints,CVjoints,lerpspeed)
			pcall(function() 
				for _, j in pairs(MonaJoints) do
					for _, CV in pairs(CVjoints) do
						if j.Name == CV.Name then
							if j.Name == "ShoulderL" then
								j.CFrame=j.CFrame:lerp(CV.Value*CFrame.fromOrientation(math.rad(math.rad(25*math.cos(sn/11))),math.rad(0), math.rad(5*math.cos(sn/11))),lerpspeed) 
							elseif j.Name == "ShoulderR" then
								j.CFrame=j.CFrame:lerp(CV.Value*CFrame.fromOrientation(math.rad(math.rad(25*math.cos(sn/1))),math.rad(0), math.rad(5*math.cos(sn/12))),lerpspeed)
							elseif j.Name == "Neck" then
								j.CFrame=j.CFrame:lerp(CV.Value*CFrame.fromOrientation(math.rad(3*math.sin(sn/8)), math.rad(0), math.rad(0)),lerpspeed)
							elseif j.Name == "Waist" then
								j.CFrame=j.CFrame:lerp(CV.Value*CFrame.fromOrientation(math.rad(3*math.cos(sn/8)), math.rad(1.5*math.cos(sn/10)), math.rad(1.5*math.cos(sn/9))),lerpspeed)
							elseif j.Name == "LegL" then
								if falling then
									j.CFrame=j.CFrame:lerp(CFrame.new(0.399, 0.764, -0.08)*CFrame.fromOrientation(math.rad(1.125), math.rad(-78.921), math.rad(161.077))*CFrame.new(-0.1-0.08*math.cos(sn/8),0,0)*CFrame.fromOrientation(math.rad(0), math.rad(5+2.5*math.cos(sn/8)), math.rad(0)),lerpspeed)
								else
									j.CFrame=j.CFrame:lerp(CV.Value*CFrame.new(-0.05*math.cos(sn/8),0,0)*CFrame.fromOrientation(math.rad(0), math.rad(0), math.rad(-2*math.cos(sn/8))),lerpspeed)
								end
							elseif j.Name == "LegR" then
								if falling then
									j.CFrame=j.CFrame:lerp(CFrame.new(-0.6, 1.105, 0.256)*CFrame.fromOrientation(math.rad(70.544), math.rad(147.042), math.rad(94.319))*CFrame.new(-0.1-0.08*math.cos(sn/8),0,0)*CFrame.fromOrientation(math.rad(0), math.rad(5+2.5*math.cos(sn/8)), math.rad(0)),lerpspeed)
								else
									j.CFrame=j.CFrame:lerp(CV.Value*CFrame.new(-0.1-0.08*math.cos(sn/8),0,0)*CFrame.fromOrientation(math.rad(0), math.rad(5+2.5*math.cos(sn/8)), math.rad(0)),lerpspeed)
								end
							elseif j.Name == "Bone" then
								j.CFrame=j.CFrame:lerp(CV.Value*CFrame.fromOrientation(math.rad(14*math.sin(sn/8)), math.rad(0), math.rad(0)),lerpspeed)
							elseif j.Name == "Bone.001" then
								j.CFrame=j.CFrame:lerp(CV.Value*CFrame.fromOrientation(math.rad(12*math.cos(sn/8)), math.rad(0), math.rad(0)),lerpspeed)
							elseif j.Name == "Bone.002" then
								j.CFrame=j.CFrame:lerp(CV.Value*CFrame.fromOrientation(math.rad(9*math.sin(sn/8)), math.rad(0), math.rad(0)),lerpspeed)
							elseif j.Name == "Bone.003" then
								j.CFrame=j.CFrame:lerp(CV.Value*CFrame.fromOrientation(math.rad(7*math.cos(sn/8)), math.rad(0), math.rad(0)),lerpspeed)
							else
								j.CFrame=j.CFrame:lerp(CV.Value,0.06)
							end

						end
					end
				end
			end)
		end
		if not falling then 
			pcall(function()
				local EasingStyle= Enum.EasingStyle.Exponential local EasingDirection=Enum.EasingDirection.Out
				local speedd=0.3
				local lerpspeed=1
				local conn
				local CVjoints={}
				local CVtweens={}
				for _, j in pairs(MonaJoints) do
					pcall(function()
						local cf=Instance.new("CFrameValue") cf.Value=j.CFrame cf.Name=j.Name
						table.insert(CVjoints,cf)
					end)
				end
				for _, Joints in pairs(MAnim["Manims"]["Throw1"]["RootPart"]["Trans"]:GetDescendants()) do 
					pcall(function()
						if Joints:IsA("Bone") then
							for i, v in ipairs(CVjoints) do
								if Joints.Name == v.Name then
									local tween=CreateTween(v, { speedd, EasingStyle, EasingDirection, 0, false, 0 }, {Value=CFrame.new(Joints.Position)*OrienRad(Joints.Orientation.X,Joints.Orientation.Y,Joints.Orientation.Z)}, true)
									table.insert(CVtweens,tween)
								end
							end
						end
					end)
				end
				conn=game:GetService("RunService").Heartbeat:Connect(function(dt) 
					anim(MonaJoints,CVjoints,lerpspeed)
				end)
				CVtweens[1].Completed:Wait()
				task.wait(0.2)
				if conn then
					conn:Disconnect()
				end
			end)
		end
		repeat task.wait()
			local Bomb = imstuff["Models"].Lbomb:Clone() pcall(function() Bomb.Trail:Destroy() end) Bomb.Parent=effectmodel Bomb.Anchored=true local ranAng=CFrame.fromOrientation(math.rad(math.random(-90,90)),math.rad(math.random(-90,90)),math.rad(math.random(-90,90)))
			pcall(function()
				local EasingStyle=Enum.EasingStyle.Exponential local EasingDirection=Enum.EasingDirection.Out
				local speedd=0.5
				local lerpspeed=0.7
				local conn
				local CVjoints={}
				local CVtweens={}
				for _, j in pairs(MonaJoints) do
					pcall(function()
						local cf=Instance.new("CFrameValue") cf.Value=j.CFrame cf.Name=j.Name
						table.insert(CVjoints,cf)
					end)
				end
				for _, Joints in pairs(MAnim["Manims"]["Throw2"]["RootPart"]["Trans"]:GetDescendants()) do 
					pcall(function()
						if Joints:IsA("Bone") then
							for i, v in ipairs(CVjoints) do
								if Joints.Name == v.Name then
									local tween=CreateTween(v, { speedd, EasingStyle, EasingDirection, 0, false, 0 }, {Value=CFrame.new(Joints.Position)*OrienRad(Joints.Orientation.X,Joints.Orientation.Y,Joints.Orientation.Z)}, true)
									table.insert(CVtweens,tween)
								end
							end
						end
					end)
				end
				conn=game:GetService("RunService").Heartbeat:Connect(function(dt)  
					if Bomb and Bomb.Parent then
						table.foreach(MonaJoints,function(_,v) 
							if v.Name == "HandL" then
								Bomb.CFrame=v.WorldCFrame*ranAng
								return
							end
						end)
					end
					anim(MonaJoints,CVjoints,lerpspeed)
				end)
				CVtweens[1].Completed:Wait()
				if conn then
					conn:Disconnect()
				end
			end)
			Bomb:Destroy()
			task.spawn(function()
				for i = 1,Power do
					cur(CFrame.new(Mouse.Hit.p)*CFrame.new(math.random(-Power*1.7,Power*1.7),1,math.random(-Power*1.7,Power*1.7)),di)
					task.wait(delayy)
				end
			end)
			pcall(function()
				local EasingStyle=Enum.EasingStyle.Exponential local EasingDirection=Enum.EasingDirection.In
				local speedd=0.05
				local lerpspeed=0.2
				local conn
				local CVjoints={}
				local CVtweens={}
				for _, j in pairs(MonaJoints) do
					pcall(function()
						local cf=Instance.new("CFrameValue") cf.Value=j.CFrame cf.Name=j.Name
						table.insert(CVjoints,cf)
					end)
				end
				for _, Joints in pairs(MAnim["Manims"]["Throw3"]["RootPart"]["Trans"]:GetDescendants()) do 
					pcall(function()
						if Joints:IsA("Bone") then
							for i, v in ipairs(CVjoints) do
								if Joints.Name == v.Name then
									local tween=CreateTween(v, { speedd, EasingStyle, EasingDirection, 0, false, 0 }, {Value=CFrame.new(Joints.Position)*OrienRad(Joints.Orientation.X,Joints.Orientation.Y,Joints.Orientation.Z)}, true)
									table.insert(CVtweens,tween)
								end
							end
						end
					end)
				end
				conn=game:GetService("RunService").Heartbeat:Connect(function(dt)  
					anim(MonaJoints,CVjoints,lerpspeed)
				end)
				CVtweens[1].Completed:Wait()
				if conn then
					conn:Disconnect()
				end
			end)
			pcall(function()
				local EasingStyle=Enum.EasingStyle.Back local EasingDirection=Enum.EasingDirection.InOut
				local speedd=0.1
				local lerpspeed=0.5
				local conn
				local CVjoints={}
				local CVtweens={}
				local goal = false
				local Wherecf=Instance.new("CFrameValue") Wherecf.Value=mainpos
				for _, j in pairs(MonaJoints) do
					pcall(function()
						local cf=Instance.new("CFrameValue") cf.Value=j.CFrame cf.Name=j.Name
						table.insert(CVjoints,cf)
					end)
				end
				for _, Joints in pairs(MAnim["Manims"]["Throw6"]["RootPart"]["Trans"]:GetDescendants()) do 
					pcall(function()
						if Joints:IsA("Bone") then
							for i, v in ipairs(CVjoints) do
								if Joints.Name == v.Name then
									local tween=CreateTween(v, { speedd, EasingStyle, EasingDirection, 0, false, 0 }, {Value=CFrame.new(Joints.Position)*OrienRad(Joints.Orientation.X,Joints.Orientation.Y,Joints.Orientation.Z)}, true)
									table.insert(CVtweens,tween)
								end
							end
						end
					end)
				end
				conn=game:GetService("RunService").Heartbeat:Connect(function(dt) 
					anim(MonaJoints,CVjoints,lerpspeed)
				end)
				CVtweens[1].Completed:Wait()
				task.wait(0.1)
				if conn then
					conn:Disconnect()
				end
			end)
		until keyhold==false
		di=true
		pcall(function()
			local EasingStyle= Enum.EasingStyle.Sine local EasingDirection=Enum.EasingDirection.InOut
			local speedd=0.5
			local lerpspeed=0.7
			local conn
			local CVjoints={}
			local CVtweens={}
			local goal = false
			local Wherecf=Instance.new("CFrameValue") Wherecf.Value=mainpos
			for _, j in pairs(MonaJoints) do
				pcall(function()
					local cf=Instance.new("CFrameValue") cf.Value=j.CFrame cf.Name=j.Name
					table.insert(CVjoints,cf)
				end)
			end
			for _, Joints in pairs(MAnim["Manims"]["IdleB"]["RootPart"]["Trans"]:GetDescendants()) do 
				pcall(function()
					if Joints:IsA("Bone") then
						for i, v in ipairs(CVjoints) do
							if Joints.Name == v.Name then
								local tween=CreateTween(v, { speedd, EasingStyle, EasingDirection, 0, false, 0 }, {Value=CFrame.new(Joints.Position)*OrienRad(Joints.Orientation.X,Joints.Orientation.Y,Joints.Orientation.Z)}, true)
								table.insert(CVtweens,tween)
							end
						end
					end
				end)
			end
			conn=game:GetService("RunService").Heartbeat:Connect(function(dt) 
				anim(MonaJoints,CVjoints,lerpspeed)
			end)
			local function ewait(n)
				if not n or n == nil then n=0 end
				local d,hb =0,game:GetService("RunService").Heartbeat 
				repeat d=d+hb:Wait() if keyclicked then break end until d>=n
				return d
			end
			ewait(0.5)
			if conn then
				conn:Disconnect()
			end
		end)
		attacking=false movementfalse=false 
	end)))
end

function T1()
	coroutine.resume(Add(coroutine.create(function()
		attacking=true  nowalk=true fallingspeed=0 local stopall = false swordphase=true local di = false
		local function anim(MonaJoints,CVjoints,lerpspeed)
			pcall(function() 
				pcall(function()
					local lPos=mainpos:PointToObjectSpace(Mouse.Hit.p)
					local theta=math.clamp(math.atan2(lPos.x, lPos.z), -math.rad(90), math.rad(90))
					mainpos=mainpos*CFrame.new(0,0,0)*CFrame.fromEulerAnglesYXZ(0,theta,0)
					local x, y, z=mainpos:ToEulerAnglesXYZ() 
					sidemoves=sidemoves:Lerp(CFrame.Angles(x,y,z),0.25) 
					mainposba=CFrame.new(mainpos.Position)*sidemoves
				end)
				for _, j in pairs(MonaJoints) do
					for _, CV in pairs(CVjoints) do
						if j.Name == CV.Name then
							if j.Name == "ShoulderL" then
								j.CFrame=j.CFrame:lerp(CV.Value*CFrame.fromOrientation(math.rad(math.rad(25*math.cos(sn/11))),math.rad(0), math.rad(5*math.cos(sn/11))),lerpspeed) 
							elseif j.Name == "ShoulderR" then
								j.CFrame=j.CFrame:lerp(CV.Value*CFrame.fromOrientation(math.rad(math.rad(25*math.cos(sn/1))),math.rad(0), math.rad(5*math.cos(sn/12))),lerpspeed)
							elseif j.Name == "Neck" then
								j.CFrame=j.CFrame:lerp(CV.Value*CFrame.fromOrientation(math.rad(3*math.sin(sn/8)), math.rad(0), math.rad(0)),lerpspeed)
							elseif j.Name == "Waist" then
								j.CFrame=j.CFrame:lerp(CV.Value*CFrame.fromOrientation(math.rad(3*math.cos(sn/8)), math.rad(1.5*math.cos(sn/10)), math.rad(1.5*math.cos(sn/9))),lerpspeed)
							elseif j.Name == "LegL" then
								if falling then 
									j.CFrame=j.CFrame:lerp(CFrame.new(0.399, 0.764, -0.08)*CFrame.fromOrientation(math.rad(1.125), math.rad(-78.921), math.rad(161.077))*CFrame.new(-0.1-0.08*math.cos(sn/8),0,0)*CFrame.fromOrientation(math.rad(0), math.rad(5+2.5*math.cos(sn/8)), math.rad(0)),lerpspeed)
								elseif not falling and ((W or A or S or D) or (torsovel and torsovel > 1)) then
									local cf=CFrame.new(0.405265808, 0.756923795, -0.0018196106, 4.37114025e-08, 3.92933587e-15, -1, 8.73114985e-08, -1, -1.12827753e-16, -1, -8.73114985e-08, -4.37114025e-08)
									j.CFrame=j.CFrame:lerp(cf*CFrame.new(-.1+.3*math.cos(sn/3.5),-0.1*math.cos(sn/3.5),0)*CFrame.fromOrientation(math.rad(0), math.rad(0), math.rad(math.CosSin(sn/3.5)*80*1))*CFrame.fromOrientation(math.rad(0), math.rad(0), math.rad(-7.5*math.abs(1))),lerpspeed)	
								else
									j.CFrame=j.CFrame:lerp(CV.Value*CFrame.new(-0.05*math.cos(sn/8),0,0)*CFrame.fromOrientation(math.rad(0), math.rad(0), math.rad(-2*math.cos(sn/8))),lerpspeed)
								end
							elseif j.Name == "LegR" then
								if falling then
									j.CFrame=j.CFrame:lerp(CFrame.new(-0.6, 1.105, 0.256)*CFrame.fromOrientation(math.rad(70.544), math.rad(147.042), math.rad(94.319))*CFrame.new(-0.1-0.08*math.cos(sn/8),0,0)*CFrame.fromOrientation(math.rad(0), math.rad(5+2.5*math.cos(sn/8)), math.rad(0)),lerpspeed)
								elseif not falling and ((W or A or S or D) or (torsovel and torsovel > 1)) then
									local cf=CFrame.new(-0.39799881, 0.75510633, -0.00273132324, -2.50339576e-06, 0.999997795, -0.00212331605, -0.0021219824, -0.00212331652, -0.999995589, -0.999997795, 2.0022544e-06, 0.0021219831)
									j.CFrame=j.CFrame:lerp(cf*CFrame.new(-.1-.3*math.cos(sn/3.5),0,0+.1*math.cos(sn/3.5))*CFrame.fromOrientation(math.rad(0), math.rad(math.CosSin(sn/3.5)*80*1), math.rad(0))*CFrame.fromOrientation(math.rad(0), math.rad(7.5*math.abs(1)), math.rad(0)),lerpspeed)
								else
									j.CFrame=j.CFrame:lerp(CV.Value*CFrame.new(-0.1-0.08*math.cos(sn/8),0,0)*CFrame.fromOrientation(math.rad(0), math.rad(5+2.5*math.cos(sn/8)), math.rad(0)),lerpspeed)
								end
							elseif j.Name == "Bone" then
								j.CFrame=j.CFrame:lerp(CV.Value*CFrame.fromOrientation(math.rad(14*math.sin(sn/8)), math.rad(0), math.rad(0)),lerpspeed)
							elseif j.Name == "Bone.001" then
								j.CFrame=j.CFrame:lerp(CV.Value*CFrame.fromOrientation(math.rad(12*math.cos(sn/8)), math.rad(0), math.rad(0)),lerpspeed)
							elseif j.Name == "Bone.002" then
								j.CFrame=j.CFrame:lerp(CV.Value*CFrame.fromOrientation(math.rad(9*math.sin(sn/8)), math.rad(0), math.rad(0)),lerpspeed)
							elseif j.Name == "Bone.003" then
								j.CFrame=j.CFrame:lerp(CV.Value*CFrame.fromOrientation(math.rad(7*math.cos(sn/8)), math.rad(0), math.rad(0)),lerpspeed)
							else
								j.CFrame=j.CFrame:lerp(CV.Value,0.06)
							end

						end
					end
				end
			end)
		end
		if falling==false and ((W or A or S or D) or (torsovel and torsovel > 1))==nil then print(((W or A or S or D) or (torsovel and torsovel > 1)))
			pcall(function()
				local EasingStyle= Enum.EasingStyle.Exponential local EasingDirection=Enum.EasingDirection.Out
				local speedd=0.3
				local lerpspeed=0.75
				local conn
				local CVjoints={}
				local CVtweens={}
				for _, j in pairs(MonaJoints) do
					pcall(function()
						local cf=Instance.new("CFrameValue") cf.Value=j.CFrame cf.Name=j.Name
						table.insert(CVjoints,cf)
					end)
				end
				for _, Joints in pairs(MAnim["Manims"]["ThunTar1"]["RootPart"]["Trans"]:GetDescendants()) do 
					pcall(function()
						if Joints:IsA("Bone") then
							for i, v in ipairs(CVjoints) do
								if Joints.Name == v.Name then
									local tween=CreateTween(v, { speedd, EasingStyle, EasingDirection, 0, false, 0 }, {Value=CFrame.new(Joints.Position)*OrienRad(Joints.Orientation.X,Joints.Orientation.Y,Joints.Orientation.Z)}, true)
									table.insert(CVtweens,tween)
								end
							end
						end
					end)
				end
				conn=game:GetService("RunService").Heartbeat:Connect(function(dt) 
					anim(MonaJoints,CVjoints,lerpspeed)
				end)
				CVtweens[1].Completed:Wait()
				task.wait(0.25)
				if conn then
					conn:Disconnect()
				end
			end)
		end
		repeat task.wait()
			--local Bomb = imstuff["Models"].Lbomb:Clone() pcall(function() Bomb.Trail:Destroy() end) Bomb.Parent=effectmodel Bomb.Anchored=true local ranAng=CFrame.fromOrientation(math.rad(math.random(-90,90)),math.rad(math.random(-90,90)),math.rad(math.random(-90,90)))
			local Mous = Mouse.Hit
			pcall(function() 
				task.spawn(function()
					pcall(function() --hit
						for _,a in next,reg(Mous.p,20-2,{mmodel,soundpart,effectmodel,humanModel,(followchar and plr.Character or mmodel)})[1] do 
							if (a.Parent ~= mmodel and a.Parent ~= effectmodel and a ~= mmodel and a ~= effectmodel and a ~= soundpart and a.Parent ~= soundpart and a ~= script and a.Parent ~= script) and a.ClassName == "Part" or a.ClassName == "MeshPart" or a.ClassName == "TrussPart" or a.ClassName == "WedgePart" or a.ClassName == "CornerWedgePart" or a.ClassName == "UnionOperation" or a.ClassName == "NegateOperation" or a.ClassName == "Seat" or a.ClassName == "VehicleSeat" or a.ClassName == "FlagStand" or a.ClassName == "SpawnLocation" then
								if a.Parent ~= nil and a.Parent ~= workspace and a.Parent:IsA("Model") and a.Parent.ClassName == "Model" and a.Size == Vector3.new(2,2,1) or a.Size == Vector3.new(2,2.1,1) or a.Size == Vector3.new(1,1.105,1) or a.Size == Vector3.new(1,1.227,1) or a.Size == Vector3.new(1,1.253,1) or a.Size == Vector3.new(1,1.277,1) or a.Size == Vector3.new(1,2,1) or a.Size == Vector3.new(2,1,1) or a.Name == "Head" or a.Name == "Torso" or a.Name == "Right Arm" or a.Name == "Left Arm" or a.Name == "Right Leg" or a.Name == "Left Leg" or a.Name == "UpperTorso" or a.Name == "HumanoidRootPart" or a.Name == "LowerTorso" or a.Name == "RightHand" or a.Name == "LeftHand" or a.Name == "RightFoot" or a.Name == "LeftFoot" or a.Name == "LeftUpperArm" or a.Name == "LeftLowerArm" or a.Name == "RightUpperArm" or a.Name == "RightLowerArm" or a.Name == "LeftUpperLeg" or a.Name == "LeftLowerLeg" or a.Name == "RightUpperLeg" or a.Name == "RightLowerLeg" then
									if (a.Position - Mous.p).Magnitude <= 35+a.Size.Magnitude then
										local mainpart=(a.Parent:FindFirstChildOfClass'Part' or a.Parent:FindFirstChildOfClass'MeshPart' or a.Parent:FindFirstChildOfClass'UnionOperation') 
										local hum=(a.Parent:FindFirstChildOfClass'Humanoid' or nil)
										pcall(function() if mainpart.Parent==workspace then mainpart=a end
											local P=Instance.new("Part",workspace.Terrain) P.Transparency=1 P.Anchored=true P.Size=Vector3.new(0.050000000745058, 0.050000000745058, 0.050000000745058) P.CanCollide=false  
											P.CFrame=CFrame.new(10000,10000,10000)
											local A1=Instance.new("Attachment",P) A1.WorldCFrame=CFrame.new(mainpart.CFrame.p)*CFrame.new(math.random(-2,2),math.random(-2,2),math.random(-2,2)) local v1=imstuff["Facility"]["m1"]:Clone() v1.Parent=A1 local v2=imstuff["Facility"]["m2"]:Clone() v2.Parent=A1 local v3=imstuff["Facility"]["m3"]:Clone() v3.Parent=A1 local v4=imstuff["Facility"]["m4"]:Clone() v4.Parent=A1 
											game:GetService("Debris"):AddItem(P,2)
											syncSound({SoundId="rbxassetid://"..bodyimpact[math.random(1,#bodyimpact)],Volume=0.9,PlayOnRemove=true,TimePosition=0.01,Pitch=math.random(8, 10)/math.random(9,13),Parent=A1})
											CamShake(mainpart.CFrame,35,.75,.05)
											if hum and hum.Health >= 1 then --and hum.MaxHealth<3000
												hum.Health=hum.Health-math.random(5,15+Power)
												if mainpart.Anchored ~= true then
													mainpart.RotVelocity = CFrame.new(Mous.p, mainpart.Position).LookVector * 45
													mainpart.Velocity = CFrame.new(Mous.p, mainpart.Position).LookVector * 45 
												end
											else
												if math.random(1,2) == 1 then
													sideeffect(mainpart)
												else
													effect(
														false,
														{CFrame = mainpart.CFrame,Size=mainpart.Size,Material="Glass",Color=mainpart.Color,Anchored=true,CanCollide=false,Transparency=0,Reflectance=-15}, --part proper
														{Scale=Vector3.new(),MeshType="Sphere"},
														{
															{--1
																dely=math.random(1,5)/math.random(5,8),
																info={0.8,Enum.EasingStyle.Elastic,Enum.EasingDirection.InOut},
																part={Transparency=0,CFrame=mainpart.CFrame*CFrame.new(math.random(-1,1),math.random(-1,1),math.random(-1,1)),Color=Color3.fromRGB(108, 214, 147),Reflectance=15}
															},
															{--2
																dely=0,
																info={0.3,Enum.EasingStyle.Linear,Enum.EasingDirection.Out},
																part={Transparency=0,CFrame=mainpart.CFrame*CFrame.new(math.random(-3,3),math.random(-3,3),math.random(-3,3))*CFrame.Angles(math.random(-80,80),math.random(-80,80),math.random(-80,80)),Color=Color3.fromRGB(108, 214, 147),Reflectance=-15}
															},
															{--3
																acc={vdec=CFrame.new(math.random(-1,1)/1555,math.random(-1,1)/1555,math.random(-1,1)/1555),vel=CFrame.new(0,0,0)*CFrame.Angles(math.random(1,2)/math.random(45,65),math.random(1,2)/math.random(45,65),math.random(1,2)/math.random(45,65))},
																info={5.8,Enum.EasingStyle.Elastic,Enum.EasingDirection.InOut},
																mesh={Scale=Vector3.new(0,0,0)},
																part={Transparency=1,Size=Vector3.new(0,0,0),Color=Color3.fromRGB(),Reflectance=7}
															}
														}
													)
												end
												syncSound({SoundId="rbxassetid://3748209678",Volume=4.5,PlayOnRemove=true,TimePosition=0,Pitch=math.random(8, 10)/math.random(5, 10),Parent=mainpart}) mainpart:Destroy()
											end
											v1:Emit(30) v2:Emit(30) v3:Emit(30) v4:Emit(30) 
										end) break
									end
								end
							end;
						end
					end)
					local P=Instance.new("Part",workspace.Terrain) P.Transparency=1 P.Anchored=true P.Size=Vector3.new(0.050000000745058, 0.050000000745058, 0.050000000745058) P.CanCollide=false  
					P.CFrame=CFrame.new(10000,10000,10000)
					local A1=Instance.new("Attachment",P) A1.WorldCFrame=CFrame.new(Mous.p) local v1=imstuff["Facility"]["partis2"]:Clone() v1.Parent=A1 
					game:GetService("Debris"):AddItem(P,2)
					syncSound({SoundId="rbxassetid://7626690970",Volume=0.85,PlayOnRemove=true,TimePosition=0,Pitch=math.random(7, 8)/math.random(7, 8),Parent=A1}) 
					CamShake(CFrame.new(Mous.p),55,.75,.1)
					v1:Emit(30)
					pcall(function()
						for i = 1,math.random(1,5) do 
							local part1 = Instance.new("Part") part1.CFrame = CFrame.new(kf.Attachment.WorldPosition)*CFrame.new(0,250,0) local part2 = Instance.new("Part") part2.CFrame = CFrame.new(kf.Attachment.WorldPosition)
							local a1 = Instance.new("Attachment",part1) local a2 =Instance.new("Attachment",part2)
							local ranCF = CFrame.fromAxisAngle((part2.Position - part1.Position).Unit, 4*math.random()*math.pi)
							local A1, A2 = {}, {}
							local rand = math.random(1,4)
							local randa = math.random(1,2)
							A1.WorldPosition, A1.WorldAxis = a1.WorldPosition, ranCF*a1.WorldAxis
							A2.WorldPosition, A2.WorldAxis = a2.WorldPosition, ranCF*a2.WorldAxis
							local NewBolt =  LBolt.new(A1, A2, 5)
							local radius = 30
							if rand == 1 then
								NewBolt.CurveSize0, NewBolt.CurveSize1 = -radius, -radius
							elseif rand == 2 then
								NewBolt.CurveSize0, NewBolt.CurveSize1 = -radius, -radius
							elseif	rand == 3 then
								NewBolt.CurveSize0, NewBolt.CurveSize1 = radius, radius
							elseif	rand == 4 then
								NewBolt.CurveSize0, NewBolt.CurveSize1 = radius, radius
							end
							NewBolt.Frequency = 0.3

							NewBolt.Thickness = 0.5
							NewBolt.PulseSpeed = 15
							NewBolt.PulseLength = 0
							NewBolt.AnimationSpeed = 2
							NewBolt.FadeLength = 0.5
							NewBolt.MaxRadius = 10
							NewBolt.MinTransparency, NewBolt.MaxTransparency = 0, 0.3
							NewBolt.Color = Color3.fromRGB(128, 187, 219)
							--local NewSparks = LSparks.new(NewBolt,10,NewBolt.Color)
						end
						for i = 1,4 do 
							local part1 = Instance.new("Part") part1.CFrame =CFrame.new(kf.Attachment.WorldPosition) local part2 = Instance.new("Part") part2.CFrame =CFrame.new(kf.Attachment.WorldPosition)*CFrame.new(math.random(-30,30),math.random(-30,30),math.random(-30,30)) 
							local a1 = Instance.new("Attachment",part1) local a2 =Instance.new("Attachment",part2)
							local ranCF = CFrame.fromAxisAngle((part2.Position - part1.Position).Unit, 4*math.random()*math.pi)
							local A1, A2 = {}, {}
							local rand = math.random(1,4)
							local randa = math.random(1,2)
							A1.WorldPosition, A1.WorldAxis = a1.WorldPosition, ranCF*a1.WorldAxis
							A2.WorldPosition, A2.WorldAxis = a2.WorldPosition, ranCF*a2.WorldAxis
							local NewBolt =  LBolt.new(A1, A2, 2)
							local radius = 30
							if rand == 1 then
								NewBolt.CurveSize0, NewBolt.CurveSize1 = -radius, -radius
							elseif rand == 2 then
								NewBolt.CurveSize0, NewBolt.CurveSize1 = -radius, -radius
							elseif	rand == 3 then
								NewBolt.CurveSize0, NewBolt.CurveSize1 = radius, radius
							elseif	rand == 4 then
								NewBolt.CurveSize0, NewBolt.CurveSize1 = radius, radius
							end
							NewBolt.Frequency = 0.3

							NewBolt.Thickness = 0.5
							NewBolt.PulseSpeed = 15
							NewBolt.PulseLength = 0
							NewBolt.AnimationSpeed = 2
							NewBolt.FadeLength = 0.5
							NewBolt.MaxRadius = 10
							NewBolt.MinTransparency, NewBolt.MaxTransparency = 0, 0.3
							NewBolt.Color = Color3.fromRGB(128, 187, 219)
							--local NewSparks = LSparks.new(NewBolt,10,NewBolt.Color)
						end
						for i = 1,math.random(1,3) do 
							local part1 = Instance.new("Part") part1.CFrame = CFrame.new(kf.Attachment.WorldPosition) local part2 = Instance.new("Part") part2.CFrame = CFrame.new(Mous.p)*CFrame.new(math.random(-3,3),math.random(-3,3),math.random(-3,3))
							local a1 = Instance.new("Attachment",part1) local a2 =Instance.new("Attachment",part2)
							local ranCF = CFrame.fromAxisAngle((part2.Position - part1.Position).Unit, 4*math.random()*math.pi)
							local A1, A2 = {}, {}
							local rand = math.random(1,4)
							local randa = math.random(1,2)
							A1.WorldPosition, A1.WorldAxis = a1.WorldPosition, ranCF*a1.WorldAxis
							A2.WorldPosition, A2.WorldAxis = a2.WorldPosition, ranCF*a2.WorldAxis
							local NewBolt =  LBolt.new(A1, A2, 15)
							local radius = 3
							if rand == 1 then
								NewBolt.CurveSize0, NewBolt.CurveSize1 = -radius, -radius
							elseif rand == 2 then
								NewBolt.CurveSize0, NewBolt.CurveSize1 = -radius, -radius
							elseif	rand == 3 then
								NewBolt.CurveSize0, NewBolt.CurveSize1 = radius, radius
							elseif	rand == 4 then
								NewBolt.CurveSize0, NewBolt.CurveSize1 = radius, radius
							end
							NewBolt.Frequency = 0.6

							NewBolt.Thickness = 0.6
							NewBolt.PulseSpeed = 15
							NewBolt.PulseLength = 0
							NewBolt.AnimationSpeed = 1.5
							NewBolt.FadeLength = 0.6
							NewBolt.MaxRadius = 5
							NewBolt.MinTransparency, NewBolt.MaxTransparency = 0, 0.3
							NewBolt.Color = Color3.fromRGB(128, 187, 219)
							--local NewSparks = LSparks.new(NewBolt,10,NewBolt.Color)
						end
						for i = 1,math.random(2,5) do 
							pcall(function()
								local part1 = Instance.new("Part") part1.CFrame =CFrame.new(Mous.p) local part2 = Instance.new("Part") part2.CFrame =CFrame.new(Mous.p)*CFrame.new(math.random(-30,30),math.random(-30,30),math.random(-30,30)) 
								local a1 = Instance.new("Attachment",part1) local a2 =Instance.new("Attachment",part2)
								local ranCF = CFrame.fromAxisAngle((part2.Position - part1.Position).Unit, 4*math.random()*math.pi)
								local A1, A2 = {}, {}
								local rand = math.random(1,4)
								local randa = math.random(1,2)
								A1.WorldPosition, A1.WorldAxis = a1.WorldPosition, ranCF*a1.WorldAxis
								A2.WorldPosition, A2.WorldAxis = a2.WorldPosition, ranCF*a2.WorldAxis
								local NewBolt =  LBolt.new(A1, A2, 2)
								local radius = 30
								if rand == 1 then
									NewBolt.CurveSize0, NewBolt.CurveSize1 = -radius, -radius
								elseif rand == 2 then
									NewBolt.CurveSize0, NewBolt.CurveSize1 = -radius, -radius
								elseif	rand == 3 then
									NewBolt.CurveSize0, NewBolt.CurveSize1 = radius, radius
								elseif	rand == 4 then
									NewBolt.CurveSize0, NewBolt.CurveSize1 = radius, radius
								end
								NewBolt.Frequency = 0.3

								NewBolt.Thickness = 0.5
								NewBolt.PulseSpeed = 15
								NewBolt.PulseLength = 0
								NewBolt.AnimationSpeed = 2
								NewBolt.FadeLength = 0.5
								NewBolt.MaxRadius = 10
								NewBolt.MinTransparency, NewBolt.MaxTransparency = 0, 0.3
								NewBolt.Color = Color3.fromRGB(128, 187, 219)
								--local NewSparks = LSparks.new(NewBolt,10,NewBolt.Color)
							end)
							local part1 = Instance.new("Part") part1.CFrame = CFrame.new(Mous.p) local part2 = Instance.new("Part") part2.CFrame = CFrame.new(Mous.p)*CFrame.new(math.random(-40,40),math.random(-40,40),math.random(-40,40)) 
							local a1 = Instance.new("Attachment",part1) local a2 =Instance.new("Attachment",part2)
							local ranCF = CFrame.fromAxisAngle((part2.Position - part1.Position).Unit, 4*math.random()*math.pi)
							local A1, A2 = {}, {}
							local rand = math.random(1,4)
							local randa = math.random(1,2)
							A1.WorldPosition, A1.WorldAxis = a1.WorldPosition, ranCF*a1.WorldAxis
							A2.WorldPosition, A2.WorldAxis = a2.WorldPosition, ranCF*a2.WorldAxis
							local NewBolt =  LBolt.new(A1, A2, 7)
							local radius = 30
							if rand == 1 then
								NewBolt.CurveSize0, NewBolt.CurveSize1 = -radius, -radius
							elseif rand == 2 then
								NewBolt.CurveSize0, NewBolt.CurveSize1 = -radius, -radius
							elseif	rand == 3 then
								NewBolt.CurveSize0, NewBolt.CurveSize1 = radius, radius
							elseif	rand == 4 then
								NewBolt.CurveSize0, NewBolt.CurveSize1 = radius, radius
							end
							NewBolt.Frequency = 0.3
							NewBolt.Thickness = 1.5
							NewBolt.PulseSpeed = 1.5
							NewBolt.PulseLength = 0.5
							NewBolt.AnimationSpeed = 0.1
							NewBolt.FadeLength = 0.5
							NewBolt.MaxRadius = 30
							NewBolt.MinTransparency, NewBolt.MaxTransparency = 0.1, 1
							NewBolt.Color = Color3.fromRGB(128, 187, 219)
						end
					end)
				end)
				local P=Instance.new("Part",workspace.Terrain) P.Transparency=1 P.Anchored=true P.Size=Vector3.new(0.050000000745058, 0.050000000745058, 0.050000000745058) P.CanCollide=false  
				P.CFrame=CFrame.new(10000,10000,10000)
				local A1=Instance.new("Attachment",P) A1.WorldCFrame=CFrame.new(kf.Attachment.WorldCFrame.p) local v1=imstuff["Facility"]["N0"]:Clone() v1.Parent=A1 local v2=imstuff["Facility"]["N1"]:Clone() v2.Parent=A1 local v3=imstuff["Facility"]["N2"]:Clone() v3.Parent=A1 local v4=imstuff["Facility"]["N3"]:Clone() v4.Parent=A1 local v5=imstuff["Facility"]["N4"]:Clone() v5.Parent=A1 local v6=imstuff["Facility"]["N5"]:Clone() v6.Parent=A1 local v7=imstuff["Facility"]["N6"]:Clone() v7.Parent=A1  local v8=imstuff["Facility"]["N7"]:Clone() v8.Parent=A1    
				game:GetService("Debris"):AddItem(P,4)
				syncSound({SoundId="rbxassetid://7626696294",Volume=0.95,PlayOnRemove=true,TimePosition=0,Pitch=math.random(7, 8)/math.random(7, 8),Parent=A1})
				CamShake(kf.Attachment.WorldCFrame,66,.75,.03)
				v1:Emit(25) v2:Emit(1) v3:Emit(2) v4:Emit(8) v5:Emit(30)  v6:Emit(30)  v7:Emit(1)  v8:Emit(10) 
			end)
			local numsd = 0.13 local randm = math.random(1,4)
			if randm == 1 then
				numsd = 0.13 
			elseif  randm == 2 then
				numsd = 0.1
			elseif randm == 3 then
				numsd = 0.07
			elseif randm == 4 then
				numsd = 0.05
			end 
			pcall(function()
				local EasingStyle= Enum.EasingStyle.Elastic local EasingDirection=Enum.EasingDirection.Out
				local speedd=numsd
				local lerpspeed=1
				local conn
				local CVjoints={}
				local CVtweens={}
				for _, j in pairs(MonaJoints) do
					pcall(function()
						local cf=Instance.new("CFrameValue") cf.Value=j.CFrame cf.Name=j.Name
						table.insert(CVjoints,cf)
					end)
				end
				for _, Joints in pairs(MAnim["Manims"]["ThunTar2"]["RootPart"]["Trans"]:GetDescendants()) do 
					pcall(function()
						if Joints:IsA("Bone") then
							for i, v in ipairs(CVjoints) do
								if Joints.Name == v.Name then
									local tween=CreateTween(v, { speedd, EasingStyle, EasingDirection, 0, false, 0 }, {Value=CFrame.new(Joints.Position)*OrienRad(Joints.Orientation.X,Joints.Orientation.Y,Joints.Orientation.Z)}, true)
									table.insert(CVtweens,tween)
								end
							end
						end
					end)
				end
				conn=game:GetService("RunService").Heartbeat:Connect(function(dt)  
					--if Bomb and Bomb.Parent then
					--	table.foreach(MonaJoints,function(_,v) 
					--		if v.Name == "HandL" then
					--			Bomb.CFrame=v.WorldCFrame*ranAng
					--			return
					--		end
					--	end)
					--end
					anim(MonaJoints,CVjoints,lerpspeed)
				end)
				CVtweens[1].Completed:Wait()
				if conn then
					conn:Disconnect()
				end
			end)
			--Bomb:Destroy()
			--task.spawn(function()
			--	for i = 1,Power do
			--		cur(CFrame.new(Mouse.Hit.p)*CFrame.new(math.random(-Power*1.7,Power*1.7),1,math.random(-Power*1.7,Power*1.7)))
			--		task.wait(delayy)
			--	end
			--end)
			pcall(function()
				local EasingStyle= Enum.EasingStyle.Back local EasingDirection=Enum.EasingDirection.InOut
				local speedd=0.25
				local lerpspeed=0.4
				local conn
				local CVjoints={}
				local CVtweens={}
				local goal = false
				local Wherecf=Instance.new("CFrameValue") Wherecf.Value=mainpos
				for _, j in pairs(MonaJoints) do
					pcall(function()
						local cf=Instance.new("CFrameValue") cf.Value=j.CFrame cf.Name=j.Name
						table.insert(CVjoints,cf)
					end)
				end
				for _, Joints in pairs(MAnim["Manims"]["ThunTar1"]["RootPart"]["Trans"]:GetDescendants()) do 
					pcall(function()
						if Joints:IsA("Bone") then
							for i, v in ipairs(CVjoints) do
								if Joints.Name == v.Name then
									local tween=CreateTween(v, { speedd, EasingStyle, EasingDirection, 0, false, 0 }, {Value=CFrame.new(Joints.Position)*OrienRad(Joints.Orientation.X,Joints.Orientation.Y,Joints.Orientation.Z)}, true)
									table.insert(CVtweens,tween)
								end
							end
						end
					end)
				end
				conn=game:GetService("RunService").Heartbeat:Connect(function(dt) 
					anim(MonaJoints,CVjoints,lerpspeed)
				end)
				CVtweens[1].Completed:Wait()
				if conn then
					conn:Disconnect()
				end
			end)
		until keyhold==false
		if not ((W or A or S or D) or (torsovel and torsovel > 1)) then
			pcall(function()
				local EasingStyle= Enum.EasingStyle.Sine local EasingDirection=Enum.EasingDirection.InOut
				local speedd=0.5
				local lerpspeed=0.7
				local conn
				local CVjoints={}
				local CVtweens={}
				local goal = false
				local Wherecf=Instance.new("CFrameValue") Wherecf.Value=mainpos
				for _, j in pairs(MonaJoints) do
					pcall(function()
						local cf=Instance.new("CFrameValue") cf.Value=j.CFrame cf.Name=j.Name
						table.insert(CVjoints,cf)
					end)
				end
				for _, Joints in pairs(MAnim["Manims"]["IdleB"]["RootPart"]["Trans"]:GetDescendants()) do 
					pcall(function()
						if Joints:IsA("Bone") then
							for i, v in ipairs(CVjoints) do
								if Joints.Name == v.Name then
									local tween=CreateTween(v, { speedd, EasingStyle, EasingDirection, 0, false, 0 }, {Value=CFrame.new(Joints.Position)*OrienRad(Joints.Orientation.X,Joints.Orientation.Y,Joints.Orientation.Z)}, true)
									table.insert(CVtweens,tween)
								end
							end
						end
					end)
				end
				conn=game:GetService("RunService").Heartbeat:Connect(function(dt) 
					anim(MonaJoints,CVjoints,lerpspeed)
				end)
				local function ewait(n)
					if not n or n == nil then n=0 end
					local d,hb =0,game:GetService("RunService").Heartbeat 
					repeat d=d+hb:Wait() if keyclicked then break end until d>=n
					return d
				end
				ewait(0.35)
				if conn then
					conn:Disconnect()
				end
			end)
		end
		attacking=false
	end)))
end

function BookBite()
	coroutine.resume(coroutine.create(function() 
		local Point = Mouse.Hit
		local Ars=imstuff["Models"]["Book"]:Clone() local Ars2=imstuff["Models"]["Book2"]:Clone() Ars2.RootPart.Anchored=true Ars2.RootPart.CFrame=CFrame.new(100000,100000,100000)
		local Pjoints={}
		Ars.RootPart.Anchored=true Ars.RootPart.CFrame=CFrame.new(100000,100000,100000)
		Ars.RootPart.body_root.WorldCFrame=CFrame.new(Point.p)*CFrame.new(0,-20,0)*OrienRad(0,0,-10)
		---
		for _, Joints in pairs(Ars.RootPart.body_root:GetDescendants()) do
			pcall(function()
				if Joints:IsA("Bone") then
					table.insert(Pjoints,Joints)
				end
			end)
		end
		Ars2.Parent=workspace.Terrain
		local P=Instance.new("Part",workspace.Terrain) P.Transparency=1 P.Anchored=true P.Size=Vector3.new(0.050000000745058, 0.050000000745058, 0.050000000745058) P.CanCollide=false P.CFrame=CFrame.new(10000,10000,10000)
		local A1=Instance.new("Attachment",P) A1.WorldCFrame=CFrame.new(Point.p) local v1=imstuff["Facility"]["G2"]:Clone() v1.Parent=A1 local v2=imstuff["Facility"]["S1"]:Clone() v2.Parent=A1 local v3=imstuff["Facility"]["S2"]:Clone() v3.Parent=A1 
		syncSound({SoundId="rbxassetid://7682801744",Volume=9,PlayOnRemove=true,TimePosition=0,Pitch=1,Parent=A1}) 
		pcall(function()
			local EasingStyle= Enum.EasingStyle.Quad local EasingDirection =Enum.EasingDirection.In
			local speedd=1
			local lerpspeed = 0.2
			local conn
			local CVjoints={}
			local CVtweens={}
			for _, j in pairs(Pjoints) do
				pcall(function()
					local cf=Instance.new("CFrameValue") cf.Value=j.CFrame cf.Name=j.Name
					table.insert(CVjoints,cf)
				end)
			end
			CreateTween(Ars.RootPart.body_root, { speedd, EasingStyle, EasingDirection, 0, false, 0 }, {Position=CFrame.new(Ars.RootPart.body_root.Position)*CFrame.new(0,23.5,0).p}, true)
			for _, Joints in pairs(MAnim["Banims"]["BookAnim1"].RootPart.body_root:GetDescendants()) do 
				pcall(function()
					if Joints:IsA("Bone") then
						for i, v in ipairs(CVjoints) do
							if Joints.Name == v.Name then
								local tween=CreateTween(v, { speedd, EasingStyle, EasingDirection, 0, false, 0 }, {Value=CFrame.new(Joints.Position)*OrienRad(Joints.Orientation.X,Joints.Orientation.Y,Joints.Orientation.Z)}, true)
								table.insert(CVtweens,tween)
							end
						end
					end
				end)
			end
			conn=game:GetService("RunService").Heartbeat:Connect(function(dt)
				pcall(function()
					for _, j in pairs(Pjoints) do
						for _, CV in pairs(CVjoints) do
							if j.Name == CV.Name then 
								if j.Name == "Body_tounge1" then
									j.CFrame=j.CFrame:lerp(CV.Value,lerpspeed)*OrienRad(-math.CosSin(sn/4.4)*4*1,-math.CosSin(sn/4.7)*4*1,math.CosSin(sn/4.7)*10*1)
								elseif j.Name == "Body_page1" then
									j.CFrame=j.CFrame:lerp(CV.Value,lerpspeed)*OrienRad(-math.CosSin(sn/4.4)*4*1,-math.CosSin(sn/4.7)*4*1,-math.CosSin(sn/4.2)*10*1)
								else
									j.CFrame=j.CFrame:lerp(CV.Value,lerpspeed)*OrienRad(-math.CosSin(sn/4.4)*4*1,-math.CosSin(sn/4.7)*4*1,math.CosSin(sn/4.2)*4*1)
								end
							end
						end
					end
					v1:Emit(1) v2:Emit(1) v3:Emit(1)
					task.spawn(function() 
						table.foreach(Ars:GetDescendants(),function(_,Joints) 
							pcall(function()
								if Joints:IsA("Bone") then
									table.foreach(Ars2:GetDescendants(),function(_,v) 
										if Joints.Name == v.Name then
											v.WorldCFrame=Joints.WorldCFrame
										end
									end)
								end
							end)
						end)
					end)
				end)
			end)
			CVtweens[1].Completed:Wait()
			if conn then
				conn:Disconnect()
			end
		end)
		task.spawn(function() task.wait(0.5)
			local f1=imstuff["Facility"]["Bit1"]:Clone() f1.Parent=A1 local f2=imstuff["Facility"]["Bit2"]:Clone() f2.Parent=A1 
			game:GetService("Debris"):AddItem(P,2.5)
			CamShake(CFrame.new(Point.p),150,.75,.25)
			f1:Emit(30) f2:Emit(30)
			pcall(function() --hit
				for _,a in next,reg(Point.p,50-2,{mmodel,soundpart,effectmodel,humanModel,(followchar and plr.Character or mmodel)})[1] do 
					if (a.Parent ~= mmodel and a.Parent ~= effectmodel and a ~= mmodel and a ~= effectmodel and a ~= soundpart and a.Parent ~= soundpart and a ~= script and a.Parent ~= script) and a.ClassName == "Part" or a.ClassName == "MeshPart" or a.ClassName == "TrussPart" or a.ClassName == "WedgePart" or a.ClassName == "CornerWedgePart" or a.ClassName == "UnionOperation" or a.ClassName == "NegateOperation" or a.ClassName == "Seat" or a.ClassName == "VehicleSeat" or a.ClassName == "FlagStand" or a.ClassName == "SpawnLocation" then
						if a.Parent ~= nil and a.Parent ~= workspace and a.Parent:IsA("Model") and a.Parent.ClassName == "Model" and a.Size == Vector3.new(2,2,1) or a.Size == Vector3.new(2,2.1,1) or a.Size == Vector3.new(1,1.105,1) or a.Size == Vector3.new(1,1.227,1) or a.Size == Vector3.new(1,1.253,1) or a.Size == Vector3.new(1,1.277,1) or a.Size == Vector3.new(1,2,1) or a.Size == Vector3.new(2,1,1) or a.Name == "Head" or a.Name == "Torso" or a.Name == "Right Arm" or a.Name == "Left Arm" or a.Name == "Right Leg" or a.Name == "Left Leg" or a.Name == "UpperTorso" or a.Name == "HumanoidRootPart" or a.Name == "LowerTorso" or a.Name == "RightHand" or a.Name == "LeftHand" or a.Name == "RightFoot" or a.Name == "LeftFoot" or a.Name == "LeftUpperArm" or a.Name == "LeftLowerArm" or a.Name == "RightUpperArm" or a.Name == "RightLowerArm" or a.Name == "LeftUpperLeg" or a.Name == "LeftLowerLeg" or a.Name == "RightUpperLeg" or a.Name == "RightLowerLeg" then
							if (a.Position - Point.p).Magnitude <= 50+a.Size.Magnitude then
								local mainpart=(a.Parent:FindFirstChildOfClass'Part' or a.Parent:FindFirstChildOfClass'MeshPart' or a.Parent:FindFirstChildOfClass'UnionOperation') 
								local hum=(a.Parent:FindFirstChildOfClass'Humanoid' or nil)
								pcall(function() if mainpart.Parent==workspace then mainpart=a end
									local P=Instance.new("Part",workspace.Terrain) P.Transparency=1 P.Anchored=true P.Size=Vector3.new(0.050000000745058, 0.050000000745058, 0.050000000745058) P.CanCollide=false  
									P.CFrame=CFrame.new(10000,10000,10000)
									local A1=Instance.new("Attachment",P) A1.WorldCFrame=CFrame.new(mainpart.CFrame.p)*CFrame.new(math.random(-2,2),math.random(-2,2),math.random(-2,2)) local v1=imstuff["Facility"]["m1"]:Clone() v1.Parent=A1 local v2=imstuff["Facility"]["m2"]:Clone() v2.Parent=A1 local v3=imstuff["Facility"]["m3"]:Clone() v3.Parent=A1 local v4=imstuff["Facility"]["m4"]:Clone() v4.Parent=A1 
									game:GetService("Debris"):AddItem(P,2)
									syncSound({SoundId="rbxassetid://"..bodyimpact[math.random(1,#bodyimpact)],Volume=0.9,PlayOnRemove=true,TimePosition=0.01,Pitch=math.random(8, 10)/math.random(9,13),Parent=A1})
									CamShake(mainpart.CFrame,35,.75,.05)
									v1:Emit(30) v2:Emit(30) v3:Emit(30) v4:Emit(30) 
									if hum and hum.Health >= 1 and hum.MaxHealth<100000 then 
										hum.Health=hum.Health-math.random(5,8+Power)
										if mainpart.Anchored ~= true then
											a.RotVelocity = CFrame.new(Point.p, a.Position).LookVector * 75
											a.Velocity = CFrame.new(Point.p, a.Position).LookVector * 75 
										end
									else
										if mainpart.Anchored ~= true then
											a.RotVelocity = CFrame.new(Point.p, a.Position).LookVector * 75
											a.Velocity = CFrame.new(Point.p, a.Position).LookVector * 75 
										end
										if math.random(1,(mainpart==a and 13 or 1)) == 1 then
											if math.random(1,2) == 1 then
												sideeffect(mainpart)
											else
												effect(
													false,
													{CFrame = mainpart.CFrame,Size=mainpart.Size,Material="Glass",Color=mainpart.Color,Anchored=true,CanCollide=false,Transparency=0,Reflectance=-15}, --part proper
													{Scale=Vector3.new(),MeshType="Sphere"},
													{
														{--1
															dely=math.random(1,5)/math.random(5,8),
															info={0.8,Enum.EasingStyle.Elastic,Enum.EasingDirection.InOut},
															part={Transparency=0,CFrame=mainpart.CFrame*CFrame.new(math.random(-1,1),math.random(-1,1),math.random(-1,1)),Color=Color3.fromRGB(108, 214, 147),Reflectance=15}
														},
														{--2
															dely=0,
															info={0.3,Enum.EasingStyle.Linear,Enum.EasingDirection.Out},
															part={Transparency=0,CFrame=mainpart.CFrame*CFrame.new(math.random(-3,3),math.random(-3,3),math.random(-3,3))*CFrame.Angles(math.random(-80,80),math.random(-80,80),math.random(-80,80)),Color=Color3.fromRGB(108, 214, 147),Reflectance=-15}
														},
														{--3
															acc={vdec=CFrame.new(math.random(-1,1)/1555,math.random(-1,1)/1555,math.random(-1,1)/1555),vel=CFrame.new(0,0,0)*CFrame.Angles(math.random(1,2)/math.random(45,65),math.random(1,2)/math.random(45,65),math.random(1,2)/math.random(45,65))},
															info={5.8,Enum.EasingStyle.Elastic,Enum.EasingDirection.InOut},
															mesh={Scale=Vector3.new(0,0,0)},
															part={Transparency=1,Size=Vector3.new(0,0,0),Color=Color3.fromRGB(),Reflectance=7}
														}
													}
												)
											end
											syncSound({SoundId="rbxassetid://3748209678",Volume=4.5,PlayOnRemove=true,TimePosition=0,Pitch=math.random(8, 10)/math.random(5, 10),Parent=mainpart}) mainpart:Destroy()
										end
									end
								end) 
							end
						end
					end;
				end
			end)
		end)
		pcall(function()
			local EasingStyle= Enum.EasingStyle.Elastic local EasingDirection=Enum.EasingDirection.InOut
			local speedd=1
			local lerpspeed = 0.5
			local conn
			local CVjoints={}
			local CVtweens={}
			for _, j in pairs(Pjoints) do
				pcall(function()
					local cf=Instance.new("CFrameValue") cf.Value=j.CFrame cf.Name=j.Name
					table.insert(CVjoints,cf)
				end)
			end
			CreateTween(Ars.RootPart.body_root, { speedd, EasingStyle, EasingDirection, 0, false, 0 }, {Position=CFrame.new(Ars.RootPart.body_root.Position)*CFrame.new(0,-3,0).p}, true)
			for _, Joints in pairs(MAnim["Banims"]["BookAnim2"].RootPart.body_root:GetDescendants()) do 
				pcall(function()
					if Joints:IsA("Bone") then
						for i, v in ipairs(CVjoints) do
							if Joints.Name == v.Name then
								local tween=CreateTween(v, { speedd, EasingStyle, EasingDirection, 0, false, 0 }, {Value=CFrame.new(Joints.Position)*OrienRad(Joints.Orientation.X,Joints.Orientation.Y,Joints.Orientation.Z)}, true)
								table.insert(CVtweens,tween)
							end
						end
					end
				end)
			end
			conn=game:GetService("RunService").Heartbeat:Connect(function(dt) 
				pcall(function()
					for _, j in pairs(Pjoints) do
						for _, CV in pairs(CVjoints) do
							if j.Name == CV.Name then 
								if j.Name == "Body_tounge1" then
									j.CFrame=j.CFrame:lerp(CV.Value,lerpspeed)*OrienRad(-math.CosSin(sn/4.4)*4*1,-math.CosSin(sn/4.7)*4*1,math.CosSin(sn/4.7)*4*1)
								elseif j.Name == "Body_page1" then
									j.CFrame=j.CFrame:lerp(CV.Value,lerpspeed)*OrienRad(-math.CosSin(sn/4.4)*4*1,-math.CosSin(sn/4.7)*4*1,-math.CosSin(sn/4.2)*4*1)
								else
									j.CFrame=j.CFrame:lerp(CV.Value,lerpspeed)*OrienRad(-math.CosSin(sn/4.4)*4*1,-math.CosSin(sn/4.7)*4*1,math.CosSin(sn/4.2)*4*1)
								end
							end
						end
					end
					v1:Emit(1) v2:Emit(1) v3:Emit(1)
					task.spawn(function() 
						table.foreach(Ars:GetDescendants(),function(_,Joints) 
							pcall(function()
								if Joints:IsA("Bone") then
									table.foreach(Ars2:GetDescendants(),function(_,v) 
										if Joints.Name == v.Name then
											v.WorldCFrame=Joints.WorldCFrame
										end
									end)
								end
							end)
						end)
					end)
				end)
			end)
			CVtweens[1].Completed:Wait()
			if conn then
				conn:Disconnect()
			end
		end)
		coroutine.resume(coroutine.create(function() 
			local parts={}
			for _, p in pairs(Ars2:GetChildren()) do
				pcall(function()
					if p:IsA("MeshPart") or p:IsA("Part") then
						p.Transparency=0
					end
				end)
			end
			for _, p in pairs(Ars2:GetChildren()) do
				pcall(function()
					if p:IsA("MeshPart") or p:IsA("Part") then
						Tween(p,{Transparency=1},{0.2,Enum.EasingStyle.Quad,Enum.EasingDirection.Out,0,false,0})
					end
				end)
			end
			task.wait(0.2)
			Ars2:Destroy()
		end))
	end))
end


function Unkown()
	coroutine.resume(Add(coroutine.create(function()
		attacking=true movementfalse=true nowalk=true fallingspeed=0 local stopall = false swordphase=true local di = false
		local function anim(MonaJoints,CVjoints,lerpspeed)
			if not di then
				pcall(function()
					local lPos=mainpos:PointToObjectSpace(Mouse.Hit.p)
					local theta=math.clamp(math.atan2(lPos.x, lPos.z), -math.rad(90), math.rad(90))
					mainpos=mainpos*CFrame.new(0,0,0)*CFrame.fromEulerAnglesYXZ(0,theta,0)
					local x, y, z=mainpos:ToEulerAnglesXYZ() 
					sidemoves=sidemoves:Lerp(CFrame.Angles(x,y,z),0.25) 
					mainposba=CFrame.new(mainpos.Position)*sidemoves
				end)
			end
			pcall(function() 
				for _, j in pairs(MonaJoints) do
					for _, CV in pairs(CVjoints) do
						if j.Name == CV.Name then
							if j.Name == "ShoulderL" then
								j.CFrame=j.CFrame:lerp(CV.Value*CFrame.fromOrientation(math.rad(math.rad(25*math.cos(sn/11))),math.rad(0), math.rad(5*math.cos(sn/11))),lerpspeed) 
							elseif j.Name == "ShoulderR" then
								j.CFrame=j.CFrame:lerp(CV.Value*CFrame.fromOrientation(math.rad(math.rad(25*math.cos(sn/1))),math.rad(0), math.rad(5*math.cos(sn/12))),lerpspeed)
							elseif j.Name == "Neck" then
								j.CFrame=j.CFrame:lerp(CV.Value*CFrame.fromOrientation(math.rad(3*math.sin(sn/8)), math.rad(0), math.rad(0)),lerpspeed)
							elseif j.Name == "Waist" then
								j.CFrame=j.CFrame:lerp(CV.Value*CFrame.fromOrientation(math.rad(3*math.cos(sn/8)), math.rad(1.5*math.cos(sn/10)), math.rad(1.5*math.cos(sn/9))),lerpspeed)
							elseif j.Name == "LegL" then
								j.CFrame=j.CFrame:lerp(CV.Value*CFrame.new(-0.05*math.cos(sn/8),0,0)*CFrame.fromOrientation(math.rad(0), math.rad(0), math.rad(-2*math.cos(sn/8))),lerpspeed)
							elseif j.Name == "LegR" then
								j.CFrame=j.CFrame:lerp(CV.Value*CFrame.new(-0.1-0.08*math.cos(sn/8),0,0)*CFrame.fromOrientation(math.rad(0), math.rad(5+2.5*math.cos(sn/8)), math.rad(0)),lerpspeed)
							elseif j.Name == "Bone" then
								j.CFrame=j.CFrame:lerp(CV.Value*CFrame.fromOrientation(math.rad(14*math.sin(sn/8)), math.rad(0), math.rad(0)),lerpspeed)
							elseif j.Name == "Bone.001" then
								j.CFrame=j.CFrame:lerp(CV.Value*CFrame.fromOrientation(math.rad(12*math.cos(sn/8)), math.rad(0), math.rad(0)),lerpspeed)
							elseif j.Name == "Bone.002" then
								j.CFrame=j.CFrame:lerp(CV.Value*CFrame.fromOrientation(math.rad(9*math.sin(sn/8)), math.rad(0), math.rad(0)),lerpspeed)
							elseif j.Name == "Bone.003" then
								j.CFrame=j.CFrame:lerp(CV.Value*CFrame.fromOrientation(math.rad(7*math.cos(sn/8)), math.rad(0), math.rad(0)),lerpspeed)
							else
								j.CFrame=j.CFrame:lerp(CV.Value,lerpspeed)
							end

						end
					end
				end
			end)
		end
		pcall(function() kf.ST.Enabled = true end)
		pcall(function()
			local EasingStyle= Enum.EasingStyle.Quad  local EasingDirection=Enum.EasingDirection.In
			local speedd=0.06
			local lerpspeed=0.2
			local conn
			local CVjoints={}
			local CVtweens={}
			for _, j in pairs(MonaJoints) do
				pcall(function()
					local cf=Instance.new("CFrameValue") cf.Value=j.CFrame cf.Name=j.Name
					table.insert(CVjoints,cf)
				end)
			end
			for _, Joints in pairs(MAnim["Manims"]["Staf1"]["RootPart"]["Trans"]:GetDescendants()) do 
				pcall(function()
					if Joints:IsA("Bone") then
						for i, v in ipairs(CVjoints) do
							if Joints.Name == v.Name then
								local tween=CreateTween(v, { speedd, EasingStyle, EasingDirection, 0, false, 0 }, {Value=CFrame.new(Joints.Position)*OrienRad(Joints.Orientation.X,Joints.Orientation.Y,Joints.Orientation.Z)}, true)
								table.insert(CVtweens,tween)
							end
						end
					end
				end)
			end
			conn=game:GetService("RunService").Heartbeat:Connect(function(dt) 
				anim(MonaJoints,CVjoints,lerpspeed)
			end)
			CVtweens[1].Completed:Wait()
			if conn then
				conn:Disconnect()
			end
		end)
		pcall(function()
			local EasingStyle= Enum.EasingStyle.Quad  local EasingDirection=Enum.EasingDirection.Out
			local speedd=0.07
			local lerpspeed=0.2
			local conn
			local CVjoints={}
			local CVtweens={}
			for _, j in pairs(MonaJoints) do
				pcall(function()
					local cf=Instance.new("CFrameValue") cf.Value=j.CFrame cf.Name=j.Name
					table.insert(CVjoints,cf)
				end)
			end
			for _, Joints in pairs(MAnim["Manims"]["Staf2"]["RootPart"]["Trans"]:GetDescendants()) do 
				pcall(function()
					if Joints:IsA("Bone") then
						for i, v in ipairs(CVjoints) do
							if Joints.Name == v.Name then
								local tween=CreateTween(v, { speedd, EasingStyle, EasingDirection, 0, false, 0 }, {Value=CFrame.new(Joints.Position)*OrienRad(Joints.Orientation.X,Joints.Orientation.Y,Joints.Orientation.Z)}, true)
								table.insert(CVtweens,tween)
							end
						end
					end
				end)
			end
			conn=game:GetService("RunService").Heartbeat:Connect(function(dt) 
				anim(MonaJoints,CVjoints,lerpspeed)
			end)
			CVtweens[1].Completed:Wait()
			if conn then
				conn:Disconnect()
			end
		end)
		pcall(function()
			local EasingStyle= Enum.EasingStyle.Quad  local EasingDirection=Enum.EasingDirection.Out
			local speedd=0.08
			local lerpspeed=0.2
			local conn
			local CVjoints={}
			local CVtweens={}
			for _, j in pairs(MonaJoints) do
				pcall(function()
					local cf=Instance.new("CFrameValue") cf.Value=j.CFrame cf.Name=j.Name
					table.insert(CVjoints,cf)
				end)
			end
			for _, Joints in pairs(MAnim["Manims"]["Staf3"]["RootPart"]["Trans"]:GetDescendants()) do 
				pcall(function()
					if Joints:IsA("Bone") then
						for i, v in ipairs(CVjoints) do
							if Joints.Name == v.Name then
								local tween=CreateTween(v, { speedd, EasingStyle, EasingDirection, 0, false, 0 }, {Value=CFrame.new(Joints.Position)*OrienRad(Joints.Orientation.X,Joints.Orientation.Y,Joints.Orientation.Z)}, true)
								table.insert(CVtweens,tween)
							end
						end
					end
				end)
			end
			conn=game:GetService("RunService").Heartbeat:Connect(function(dt) 
				anim(MonaJoints,CVjoints,lerpspeed)
			end)
			CVtweens[1].Completed:Wait()
			if conn then
				conn:Disconnect()
			end
		end)
		pcall(function()
			local EasingStyle= Enum.EasingStyle.Quad  local EasingDirection=Enum.EasingDirection.Out
			local speedd=0.09
			local lerpspeed=0.2
			local conn
			local CVjoints={}
			local CVtweens={}
			for _, j in pairs(MonaJoints) do
				pcall(function()
					local cf=Instance.new("CFrameValue") cf.Value=j.CFrame cf.Name=j.Name
					table.insert(CVjoints,cf)
				end)
			end
			for _, Joints in pairs(MAnim["Manims"]["Staf4"]["RootPart"]["Trans"]:GetDescendants()) do 
				pcall(function()
					if Joints:IsA("Bone") then
						for i, v in ipairs(CVjoints) do
							if Joints.Name == v.Name then
								local tween=CreateTween(v, { speedd, EasingStyle, EasingDirection, 0, false, 0 }, {Value=CFrame.new(Joints.Position)*OrienRad(Joints.Orientation.X,Joints.Orientation.Y,Joints.Orientation.Z)}, true)
								table.insert(CVtweens,tween)
							end
						end
					end
				end)
			end
			conn=game:GetService("RunService").Heartbeat:Connect(function(dt) 
				anim(MonaJoints,CVjoints,lerpspeed)
			end)
			CVtweens[1].Completed:Wait()
			if conn then
				conn:Disconnect()
			end
		end)
		pcall(function()
			local EasingStyle= Enum.EasingStyle.Back local EasingDirection=Enum.EasingDirection.Out
			local speedd=0.2
			local lerpspeed=0.2
			local conn
			local CVjoints={}
			local CVtweens={}
			for _, j in pairs(MonaJoints) do
				pcall(function()
					local cf=Instance.new("CFrameValue") cf.Value=j.CFrame cf.Name=j.Name
					table.insert(CVjoints,cf)
				end)
			end
			for _, Joints in pairs(MAnim["Manims"]["Staf5"]["RootPart"]["Trans"]:GetDescendants()) do 
				pcall(function()
					if Joints:IsA("Bone") then
						for i, v in ipairs(CVjoints) do
							if Joints.Name == v.Name then
								local tween=CreateTween(v, { speedd, EasingStyle, EasingDirection, 0, false, 0 }, {Value=CFrame.new(Joints.Position)*OrienRad(Joints.Orientation.X,Joints.Orientation.Y,Joints.Orientation.Z)}, true)
								table.insert(CVtweens,tween)
							end
						end
					end
				end)
			end
			conn=game:GetService("RunService").Heartbeat:Connect(function(dt) 
				anim(MonaJoints,CVjoints,lerpspeed)
			end)
			CVtweens[1].Completed:Wait()
			if conn then
				conn:Disconnect()
			end
		end)
		pcall(function()
			local EasingStyle= Enum.EasingStyle.Back local EasingDirection=Enum.EasingDirection.InOut
			local speedd=0.2
			local lerpspeed=1
			local conn
			local CVjoints={}
			local CVtweens={}
			for _, j in pairs(MonaJoints) do
				pcall(function()
					local cf=Instance.new("CFrameValue") cf.Value=j.CFrame cf.Name=j.Name
					table.insert(CVjoints,cf)
				end)
			end
			for _, Joints in pairs(MAnim["Manims"]["Staf6"]["RootPart"]["Trans"]:GetDescendants()) do 
				pcall(function()
					if Joints:IsA("Bone") then
						for i, v in ipairs(CVjoints) do
							if Joints.Name == v.Name then
								local tween=CreateTween(v, { speedd, EasingStyle, EasingDirection, 0, false, 0 }, {Value=CFrame.new(Joints.Position)*OrienRad(Joints.Orientation.X,Joints.Orientation.Y,Joints.Orientation.Z)}, true)
								table.insert(CVtweens,tween)
							end
						end
					end
				end)
			end
			conn=game:GetService("RunService").Heartbeat:Connect(function(dt) 
				pcall(function() 
					for _, j in pairs(MonaJoints) do
						for _, CV in pairs(CVjoints) do
							if j.Name == CV.Name then
								if j.Name == "Neck" then
									j.CFrame=j.CFrame:lerp(CV.Value*CFrame.fromOrientation(math.rad(3*math.sin(sn/8)), math.rad(0), math.rad(0)),lerpspeed)
								elseif j.Name == "LegL" then
									j.CFrame=j.CFrame:lerp(CV.Value*CFrame.new(-0.05*math.cos(sn/8),0,0)*CFrame.fromOrientation(math.rad(0), math.rad(0), math.rad(-2*math.cos(sn/8))),lerpspeed)
								elseif j.Name == "LegR" then
									j.CFrame=j.CFrame:lerp(CV.Value*CFrame.new(-0.1-0.08*math.cos(sn/8),0,0)*CFrame.fromOrientation(math.rad(0), math.rad(5+2.5*math.cos(sn/8)), math.rad(0)),lerpspeed)
								elseif j.Name == "Bone" then
									j.CFrame=j.CFrame:lerp(CV.Value*CFrame.fromOrientation(math.rad(14*math.sin(sn/8)), math.rad(0), math.rad(0)),lerpspeed)
								elseif j.Name == "Bone.001" then
									j.CFrame=j.CFrame:lerp(CV.Value*CFrame.fromOrientation(math.rad(12*math.cos(sn/8)), math.rad(0), math.rad(0)),lerpspeed)
								elseif j.Name == "Bone.002" then
									j.CFrame=j.CFrame:lerp(CV.Value*CFrame.fromOrientation(math.rad(9*math.sin(sn/8)), math.rad(0), math.rad(0)),lerpspeed)
								elseif j.Name == "Bone.003" then
									j.CFrame=j.CFrame:lerp(CV.Value*CFrame.fromOrientation(math.rad(7*math.cos(sn/8)), math.rad(0), math.rad(0)),lerpspeed)
								else
									j.CFrame=j.CFrame:lerp(CV.Value,lerpspeed)
								end
							end
						end
					end
				end)
			end)
			CVtweens[1].Completed:Wait()
			if conn then
				conn:Disconnect()
			end
		end)
		di=true
		task.spawn(function() --attack 
			local laspos = mainposba
			pcall(function() kf.ST.Enabled = false  local v1=imstuff["Facility"]["SQ"]:Clone() v1.Parent=kf.Attachment2 v1:Emit(30) game:GetService("Debris"):AddItem(v1,0.8) syncSound({SoundId="rbxassetid://7698360204",Volume=3,PlayOnRemove=true,TimePosition=0,Pitch=math.random(8, 9)/math.random(8,9),Parent=kf.Attachment2}) end)
			for i = 1, 8 do 
				spawn(function()
					local targett = laspos*CFrame.new(math.random(-2,2),-3,5*i+math.random(-2,2))
					local P=Instance.new("Part",workspace.Terrain) P.Transparency=1 P.Anchored=true P.Size=Vector3.new(0.050000000745058, 0.050000000745058, 0.050000000745058) P.CanCollide=false  
					P.CFrame=CFrame.new(10000,10000,10000)
					local A1=Instance.new("Attachment",P) A1.WorldCFrame=targett local C1=imstuff["Facility"]["C1"]:Clone() C1.Parent=A1 local C2=imstuff["Facility"]["C2"]:Clone() C2.Parent=A1 local C3=imstuff["Facility"]["C3"]:Clone() C3.Parent=A1  local C4=imstuff["Facility"]["C4"]:Clone() C4.Parent=A1  local C5=imstuff["Facility"]["C5"]:Clone() C5.Parent=A1 
					syncSound({SoundId="rbxassetid://5599556783",Volume=3,TimePosition=0.3,PlayOnRemove=true,Pitch=math.random(7, 8)/math.random(5, 8),Parent=A1})
					C1:Emit(25) C2:Emit(25) C3:Emit(25) C4:Emit(25) C5:Emit(25)
					task.wait(0.35)
					pcall(function() --hit
						for _,a in next,reg(targett.p,20-2,{mmodel,soundpart,effectmodel,humanModel,(followchar and plr.Character or mmodel)})[1] do 
							if (a.Parent ~= mmodel and a.Parent ~= effectmodel and a ~= mmodel and a ~= effectmodel and a ~= soundpart and a.Parent ~= soundpart and a ~= script and a.Parent ~= script) and a.ClassName == "Part" or a.ClassName == "MeshPart" or a.ClassName == "TrussPart" or a.ClassName == "WedgePart" or a.ClassName == "CornerWedgePart" or a.ClassName == "UnionOperation" or a.ClassName == "NegateOperation" or a.ClassName == "Seat" or a.ClassName == "VehicleSeat" or a.ClassName == "FlagStand" or a.ClassName == "SpawnLocation" then
								if a.Parent ~= nil and a.Parent ~= workspace and a.Parent:IsA("Model") and a.Parent.ClassName == "Model" and a.Size == Vector3.new(2,2,1) or a.Size == Vector3.new(2,2.1,1) or a.Size == Vector3.new(1,1.105,1) or a.Size == Vector3.new(1,1.227,1) or a.Size == Vector3.new(1,1.253,1) or a.Size == Vector3.new(1,1.277,1) or a.Size == Vector3.new(1,2,1) or a.Size == Vector3.new(2,1,1) or a.Name == "Head" or a.Name == "Torso" or a.Name == "Right Arm" or a.Name == "Left Arm" or a.Name == "Right Leg" or a.Name == "Left Leg" or a.Name == "UpperTorso" or a.Name == "HumanoidRootPart" or a.Name == "LowerTorso" or a.Name == "RightHand" or a.Name == "LeftHand" or a.Name == "RightFoot" or a.Name == "LeftFoot" or a.Name == "LeftUpperArm" or a.Name == "LeftLowerArm" or a.Name == "RightUpperArm" or a.Name == "RightLowerArm" or a.Name == "LeftUpperLeg" or a.Name == "LeftLowerLeg" or a.Name == "RightUpperLeg" or a.Name == "RightLowerLeg" then
									if (a.Position - targett.p).Magnitude <= 20+a.Size.Magnitude then
										local mainpart=(a.Parent:FindFirstChildOfClass'Part' or a.Parent:FindFirstChildOfClass'MeshPart' or a.Parent:FindFirstChildOfClass'UnionOperation') 
										local hum=(a.Parent:FindFirstChildOfClass'Humanoid' or nil)
										pcall(function() if mainpart.Parent==workspace then mainpart=a end 
											local P=Instance.new("Part",workspace.Terrain) P.Transparency=1 P.Anchored=true P.Size=Vector3.new(0.050000000745058, 0.050000000745058, 0.050000000745058) P.CanCollide=false  
											P.CFrame=CFrame.new(10000,10000,10000)
											local A1=Instance.new("Attachment",P) A1.WorldCFrame=CFrame.new(mainpart.CFrame.p)*CFrame.new(math.random(-2,2),math.random(-2,2),math.random(-2,2)) local v1=imstuff["Facility"]["m1"]:Clone() v1.Parent=A1 local v2=imstuff["Facility"]["m2"]:Clone() v2.Parent=A1 local v3=imstuff["Facility"]["m3"]:Clone() v3.Parent=A1 local v4=imstuff["Facility"]["m4"]:Clone() v4.Parent=A1 
											game:GetService("Debris"):AddItem(P,2)
											syncSound({SoundId="rbxassetid://"..bodyimpact[math.random(1,#bodyimpact)],Volume=0.9,PlayOnRemove=true,TimePosition=0.01,Pitch=math.random(8, 10)/math.random(9,13),Parent=A1})
											CamShake(mainpart.CFrame,35,.75,.05)
											if hum and hum.Health >= 1 then --and hum.MaxHealth<3000
												hum.Health=hum.Health-math.random(10,20+Power)
												if mainpart.Anchored ~= true then
													mainpart.RotVelocity = CFrame.new(targett.p, mainpart.Position).LookVector * 45
													mainpart.Velocity = CFrame.new(targett.p, mainpart.Position).LookVector * 45 
												end
											else
												if math.random(1,2) == 1 then
													sideeffect(mainpart)
												else
													effect(
														false,
														{CFrame = mainpart.CFrame,Size=mainpart.Size,Material="Glass",Color=mainpart.Color,Anchored=true,CanCollide=false,Transparency=0,Reflectance=-15}, --part proper
														{Scale=Vector3.new(),MeshType="Sphere"},
														{
															{--1
																dely=math.random(1,5)/math.random(5,8),
																info={0.8,Enum.EasingStyle.Elastic,Enum.EasingDirection.InOut},
																part={Transparency=0,CFrame=mainpart.CFrame*CFrame.new(math.random(-1,1),math.random(-1,1),math.random(-1,1)),Color=Color3.fromRGB(108, 214, 147),Reflectance=15}
															},
															{--2
																dely=0,
																info={0.3,Enum.EasingStyle.Linear,Enum.EasingDirection.Out},
																part={Transparency=0,CFrame=mainpart.CFrame*CFrame.new(math.random(-3,3),math.random(-3,3),math.random(-3,3))*CFrame.Angles(math.random(-80,80),math.random(-80,80),math.random(-80,80)),Color=Color3.fromRGB(108, 214, 147),Reflectance=-15}
															},
															{--3
																acc={vdec=CFrame.new(math.random(-1,1)/1555,math.random(-1,1)/1555,math.random(-1,1)/1555),vel=CFrame.new(0,0,0)*CFrame.Angles(math.random(1,2)/math.random(45,65),math.random(1,2)/math.random(45,65),math.random(1,2)/math.random(45,65))},
																info={5.8,Enum.EasingStyle.Elastic,Enum.EasingDirection.InOut},
																mesh={Scale=Vector3.new(0,0,0)},
																part={Transparency=1,Size=Vector3.new(0,0,0),Color=Color3.fromRGB(),Reflectance=7}
															}
														}
													)
												end
												syncSound({SoundId="rbxassetid://3748209678",Volume=4.5,PlayOnRemove=true,TimePosition=0,Pitch=math.random(8, 10)/math.random(5, 10),Parent=mainpart}) mainpart:Destroy()
											end
											v1:Emit(30) v2:Emit(30) v3:Emit(30) v4:Emit(30) 
										end) 
										break
									end
								end
							end;
						end
					end)
					syncSound({SoundId="rbxassetid://4085785148",Volume=2,PlayOnRemove=true,TimePosition=0,Pitch=math.random(7, 8)/math.random(5, 8),Parent=A1})
					syncSound({SoundId="rbxassetid://7657166277",Volume=3,PlayOnRemove=true,TimePosition=0,Pitch=3,Parent=A1})
					syncSound({SoundId="rbxassetid://8247119348",Volume=5,PlayOnRemove=true,TimePosition=0.2,Pitch=3,Parent=A1})
					local A1=Instance.new("Attachment",P) A1.WorldCFrame=targett local v1=imstuff["Facility"]["HL1"]:Clone() v1.Parent=A1 local v2=imstuff["Facility"]["HL2"]:Clone() v2.Parent=A1 local v3=imstuff["Facility"]["HL3"]:Clone() v3.Parent=A1 
					game:GetService("Debris"):AddItem(P,3.5)
					CamShake(targett,55,.55,.08)
					v1:Emit(30) v2:Emit(30) v3:Emit(30)
				end)
				task.wait(0.135)
			end 
		end) 
		pcall(function()
			local EasingStyle= Enum.EasingStyle.Exponential local EasingDirection=Enum.EasingDirection.InOut
			local speedd=0.7
			local lerpspeed=0.7
			local conn
			local CVjoints={}
			local CVtweens={}
			local goal = false
			local Wherecf=Instance.new("CFrameValue") Wherecf.Value=mainpos
			for _, j in pairs(MonaJoints) do
				pcall(function()
					local cf=Instance.new("CFrameValue") cf.Value=j.CFrame cf.Name=j.Name
					table.insert(CVjoints,cf)
				end)
			end
			for _, Joints in pairs(MAnim["Manims"]["IdleB"]["RootPart"]["Trans"]:GetDescendants()) do 
				pcall(function()
					if Joints:IsA("Bone") then
						for i, v in ipairs(CVjoints) do
							if Joints.Name == v.Name then
								local tween=CreateTween(v, { speedd, EasingStyle, EasingDirection, 0, false, 0 }, {Value=CFrame.new(Joints.Position)*OrienRad(Joints.Orientation.X,Joints.Orientation.Y,Joints.Orientation.Z)}, true)
								table.insert(CVtweens,tween)
							end
						end
					end
				end)
			end
			conn=game:GetService("RunService").Heartbeat:Connect(function(dt) 
				pcall(function() 
					for _, j in pairs(MonaJoints) do
						for _, CV in pairs(CVjoints) do
							if j.Name == CV.Name then
								if j.Name == "ShoulderL" then
									j.CFrame=j.CFrame:lerp(CV.Value*CFrame.fromOrientation(math.rad(math.rad(25*math.cos(sn/11))),math.rad(0), math.rad(5*math.cos(sn/11))),lerpspeed) 
								elseif j.Name == "ShoulderR" then
									j.CFrame=j.CFrame:lerp(CV.Value*CFrame.fromOrientation(math.rad(math.rad(25*math.cos(sn/1))),math.rad(0), math.rad(5*math.cos(sn/12))),lerpspeed)
								elseif j.Name == "Neck" then
									j.CFrame=j.CFrame:lerp(CV.Value*CFrame.fromOrientation(math.rad(3*math.sin(sn/8)), math.rad(0), math.rad(0)),lerpspeed)
								elseif j.Name == "Waist" then
									j.CFrame=j.CFrame:lerp(CV.Value*CFrame.fromOrientation(math.rad(3*math.cos(sn/8)), math.rad(1.5*math.cos(sn/10)), math.rad(1.5*math.cos(sn/9))),lerpspeed)
								elseif j.Name == "LegL" then
									j.CFrame=j.CFrame:lerp(CV.Value*CFrame.new(-0.05*math.cos(sn/8),0,0)*CFrame.fromOrientation(math.rad(0), math.rad(0), math.rad(-2*math.cos(sn/8))),lerpspeed)
								elseif j.Name == "LegR" then
									j.CFrame=j.CFrame:lerp(CV.Value*CFrame.new(-0.1-0.08*math.cos(sn/8),0,0)*CFrame.fromOrientation(math.rad(0), math.rad(5+2.5*math.cos(sn/8)), math.rad(0)),lerpspeed)
								elseif j.Name == "Bone" then
									j.CFrame=j.CFrame:lerp(CV.Value*CFrame.fromOrientation(math.rad(14*math.sin(sn/8)), math.rad(0), math.rad(0)),lerpspeed)
								elseif j.Name == "Bone.001" then
									j.CFrame=j.CFrame:lerp(CV.Value*CFrame.fromOrientation(math.rad(12*math.cos(sn/8)), math.rad(0), math.rad(0)),lerpspeed)
								elseif j.Name == "Bone.002" then
									j.CFrame=j.CFrame:lerp(CV.Value*CFrame.fromOrientation(math.rad(9*math.sin(sn/8)), math.rad(0), math.rad(0)),lerpspeed)
								elseif j.Name == "Bone.003" then
									j.CFrame=j.CFrame:lerp(CV.Value*CFrame.fromOrientation(math.rad(7*math.cos(sn/8)), math.rad(0), math.rad(0)),lerpspeed)
								else
									j.CFrame=j.CFrame:lerp(CV.Value,0.06)
								end

							end
						end
					end
				end)
			end)
			local function ewait(n)
				if not n or n == nil then n=0 end
				local d,hb =0,game:GetService("RunService").Heartbeat 
				repeat d=d+hb:Wait() if keyclicked then break end until d>=n
				return d
			end
			ewait(0.7)
			if conn then
				conn:Disconnect()
			end
		end)
		attacking=false movementfalse=false 
	end)))
end


function FinalBlast()
	coroutine.resume(Add(coroutine.create(function()
		attacking=true movementfalse=true nowalk=true fallingspeed=0 local stopall = false swordphase=true local di = false
		local function anim(MonaJoints,CVjoints,lerpspeed)
			if not di then
				pcall(function()
					local lPos=mainpos:PointToObjectSpace(Mouse.Hit.p)
					local theta=math.clamp(math.atan2(lPos.x, lPos.z), -math.rad(90), math.rad(90))
					mainpos=mainpos*CFrame.new(0,0,0)*CFrame.fromEulerAnglesYXZ(0,theta,0)
					local x, y, z=mainpos:ToEulerAnglesXYZ() 
					sidemoves=sidemoves:Lerp(CFrame.Angles(x,y,z),0.25) 
					mainposba=CFrame.new(mainpos.Position)*sidemoves
				end)
			end
			pcall(function() 
				for _, j in pairs(MonaJoints) do
					for _, CV in pairs(CVjoints) do
						if j.Name == CV.Name then
							if j.Name == "ShoulderL" then
								j.CFrame=j.CFrame:lerp(CV.Value*CFrame.fromOrientation(math.rad(math.rad(25*math.cos(sn/11))),math.rad(0), math.rad(5*math.cos(sn/11))),lerpspeed) 
							elseif j.Name == "ShoulderR" then
								j.CFrame=j.CFrame:lerp(CV.Value*CFrame.fromOrientation(math.rad(math.rad(25*math.cos(sn/1))),math.rad(0), math.rad(5*math.cos(sn/12))),lerpspeed)
							elseif j.Name == "Neck" then
								j.CFrame=j.CFrame:lerp(CV.Value*CFrame.fromOrientation(math.rad(3*math.sin(sn/8)), math.rad(0), math.rad(0)),lerpspeed)
							elseif j.Name == "Waist" then
								j.CFrame=j.CFrame:lerp(CV.Value*CFrame.fromOrientation(math.rad(3*math.cos(sn/8)), math.rad(1.5*math.cos(sn/10)), math.rad(1.5*math.cos(sn/9))),lerpspeed)
							elseif j.Name == "LegL" then
								j.CFrame=j.CFrame:lerp(CV.Value*CFrame.new(-0.05*math.cos(sn/8),0,0)*CFrame.fromOrientation(math.rad(0), math.rad(0), math.rad(-2*math.cos(sn/8))),lerpspeed)
							elseif j.Name == "LegR" then
								j.CFrame=j.CFrame:lerp(CV.Value*CFrame.new(-0.1-0.08*math.cos(sn/8),0,0)*CFrame.fromOrientation(math.rad(0), math.rad(5+2.5*math.cos(sn/8)), math.rad(0)),lerpspeed)
							elseif j.Name == "Bone" then
								j.CFrame=j.CFrame:lerp(CV.Value*CFrame.fromOrientation(math.rad(14*math.sin(sn/8)), math.rad(0), math.rad(0)),lerpspeed)
							elseif j.Name == "Bone.001" then
								j.CFrame=j.CFrame:lerp(CV.Value*CFrame.fromOrientation(math.rad(12*math.cos(sn/8)), math.rad(0), math.rad(0)),lerpspeed)
							elseif j.Name == "Bone.002" then
								j.CFrame=j.CFrame:lerp(CV.Value*CFrame.fromOrientation(math.rad(9*math.sin(sn/8)), math.rad(0), math.rad(0)),lerpspeed)
							elseif j.Name == "Bone.003" then
								j.CFrame=j.CFrame:lerp(CV.Value*CFrame.fromOrientation(math.rad(7*math.cos(sn/8)), math.rad(0), math.rad(0)),lerpspeed)
							else
								j.CFrame=j.CFrame:lerp(CV.Value,lerpspeed)
							end

						end
					end
				end
			end)
		end
		--
		local quits=false
		local cf=CFrame.new(mainposba.p) local orbcf1 = CFrame.new(25,0,0) local orbcf2 = CFrame.new(-25,0,0) local dur=1.52 local dur2=0.8
		local P=Instance.new("Part") P.CFrame=CFrame.new(100000,100000,100000) P.Anchored=true --Part
		local MainA=Instance.new("Bone",P) MainA.WorldCFrame=cf local MainB=Instance.new("Bone",MainA)
		local A1=Instance.new("Bone",MainB) A1.CFrame=orbcf1*CFrame.new(0, 0, 1.7) local A2=Instance.new("Bone",MainB) A2.CFrame=orbcf1*CFrame.new(0, 0, -1.7)
		local A3=Instance.new("Bone",MainB) A3.CFrame=orbcf2*CFrame.new(0, 0, 1.7) local A4=Instance.new("Bone",MainB) A4.CFrame=orbcf2*CFrame.new(0, 0, -1.7)
		local T1 = imstuff["Facility"].Orb:Clone() T1.Attachment0=A1 T1.Attachment1=A2 T1.Parent=P local T2 = imstuff["Facility"].Orb:Clone() T2.Attachment0=A3 T2.Attachment1=A4 T2.Parent=P
		-- 
		local attachmen = {A1,A3,MainA}
		pcall(function() kf.ST.Enabled = true end)
		local wer = 0
		if not falling then
			pcall(function()
				local EasingStyle= Enum.EasingStyle.Exponential local EasingDirection=Enum.EasingDirection.Out
				local speedd=0.2
				local lerpspeed=0.2
				local conn
				local CVjoints={}
				local CVtweens={}
				for _, j in pairs(MonaJoints) do
					pcall(function()
						local cf=Instance.new("CFrameValue") cf.Value=j.CFrame cf.Name=j.Name
						table.insert(CVjoints,cf)
					end)
				end
				for _, Joints in pairs(MAnim["Manims"]["SmashPrepare"]["RootPart"]["Trans"]:GetDescendants()) do 
					pcall(function()
						if Joints:IsA("Bone") then
							for i, v in ipairs(CVjoints) do
								if Joints.Name == v.Name then
									local tween=CreateTween(v, { speedd, EasingStyle, EasingDirection, 0, false, 0 }, {Value=CFrame.new(Joints.Position)*OrienRad(Joints.Orientation.X,Joints.Orientation.Y,Joints.Orientation.Z)}, true)
									table.insert(CVtweens,tween)
								end
							end
						end
					end)
				end
				conn=game:GetService("RunService").Heartbeat:Connect(function(dt) 
					anim(MonaJoints,CVjoints,lerpspeed)
				end)
				CVtweens[1].Completed:Wait()
				if conn then
					conn:Disconnect()
				end
			end)
			task.spawn(function()
				local asdss=Instance.new("CFrameValue") asdss.Value=mainpos 
				local EasingStyle= Enum.EasingStyle.Exponential local EasingDirection=Enum.EasingDirection.Out
				local tween=CreateTween(asdss, { 1.5, EasingStyle, EasingDirection, 0, false, 0 }, {Value=mainpos*CFrame.new(0,20,0)}, true)
				local cond  
				cond=game:GetService("RunService").Heartbeat:Connect(function(dt) 
					mainpos=asdss.Value
					mainposba=mainpos
				end)
				tween.Completed:Connect(function()
					if cond then
						cond:Disconnect()
					end
				end)
			end)
			wer=20
		end
		task.spawn(function()
			P.Parent = effectmodel
			orbcf1 = CFrame.new(10,0,0) orbcf2 = CFrame.new(-10,0,0)  
			CreateTween(A1, { dur, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, false, 0 }, {CFrame=orbcf1*CFrame.new(0, 0, 1.7)}, true) CreateTween(A2, { dur, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, false, 0 }, {CFrame=orbcf1*CFrame.new(0, 0, -1.7)}, true)
			CreateTween(A3, { dur, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, false, 0 }, {CFrame=orbcf2*CFrame.new(0, 0, 1.7)}, true) CreateTween(A4, { dur, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, false, 0 }, {CFrame=orbcf2*CFrame.new(0, 0, -1.7)}, true)
			local tween=CreateTween(MainA, { dur, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, false, 0 }, {WorldPosition=cf*CFrame.new(0,wer+3,0).p}, true)
			task.spawn(function()
				repeat task.wait()
					pcall(function()
						MainB.Orientation=MainB.Orientation+Vector3.new(0,-7,0)
					end)
				until quits or (P.Parent==nil or MainA.Parent==nil)
				tween:Cancel()
			end)	
			tween.Completed:Wait()
		end)
		di=true
		syncSound({SoundId="rbxassetid://8149796780",Volume=8,PlayOnRemove=true,TimePosition=0,Pitch=math.random(9, 10)/math.random(9,10),Parent=soundpart})
		pcall(function()
			local EasingStyle= Enum.EasingStyle.Quad  local EasingDirection=Enum.EasingDirection.Out
			local speedd=0.1
			local lerpspeed=0.35
			local conn
			local CVjoints={}
			local CVtweens={}
			for _, j in pairs(MonaJoints) do
				pcall(function()
					local cf=Instance.new("CFrameValue") cf.Value=j.CFrame cf.Name=j.Name
					table.insert(CVjoints,cf)
				end)
			end
			for _, Joints in pairs(MAnim["Manims"]["MagicPrepare2"]["RootPart"]["Trans"]:GetDescendants()) do 
				pcall(function()
					if Joints:IsA("Bone") then
						for i, v in ipairs(CVjoints) do
							if Joints.Name == v.Name then
								local tween=CreateTween(v, { speedd, EasingStyle, EasingDirection, 0, false, 0 }, {Value=CFrame.new(Joints.Position)*OrienRad(Joints.Orientation.X,Joints.Orientation.Y,Joints.Orientation.Z)}, true)
								table.insert(CVtweens,tween)
							end
						end
					end
				end)
			end
			conn=game:GetService("RunService").Heartbeat:Connect(function(dt) 
				anim(MonaJoints,CVjoints,lerpspeed)
			end)
			CVtweens[1].Completed:Wait()
			if conn then
				conn:Disconnect()
			end
		end)
		pcall(function()
			local EasingStyle= Enum.EasingStyle.Quad  local EasingDirection=Enum.EasingDirection.Out
			local speedd=0.12
			local lerpspeed=0.2
			local conn
			local CVjoints={}
			local CVtweens={}
			for _, j in pairs(MonaJoints) do
				pcall(function()
					local cf=Instance.new("CFrameValue") cf.Value=j.CFrame cf.Name=j.Name
					table.insert(CVjoints,cf)
				end)
			end
			for _, Joints in pairs(MAnim["Manims"]["MagicPrepare3"]["RootPart"]["Trans"]:GetDescendants()) do 
				pcall(function()
					if Joints:IsA("Bone") then
						for i, v in ipairs(CVjoints) do
							if Joints.Name == v.Name then
								local tween=CreateTween(v, { speedd, EasingStyle, EasingDirection, 0, false, 0 }, {Value=CFrame.new(Joints.Position)*OrienRad(Joints.Orientation.X,Joints.Orientation.Y,Joints.Orientation.Z)}, true)
								table.insert(CVtweens,tween)
							end
						end
					end
				end)
			end
			conn=game:GetService("RunService").Heartbeat:Connect(function(dt) 
				anim(MonaJoints,CVjoints,lerpspeed)
			end)
			CVtweens[1].Completed:Wait()
			if conn then
				conn:Disconnect()
			end
		end)
		pcall(function()
			local EasingStyle= Enum.EasingStyle.Quad  local EasingDirection=Enum.EasingDirection.Out
			local speedd=0.12
			local lerpspeed=0.2
			local conn
			local CVjoints={}
			local CVtweens={}
			for _, j in pairs(MonaJoints) do
				pcall(function()
					local cf=Instance.new("CFrameValue") cf.Value=j.CFrame cf.Name=j.Name
					table.insert(CVjoints,cf)
				end)
			end
			for _, Joints in pairs(MAnim["Manims"]["MagicPrepare4"]["RootPart"]["Trans"]:GetDescendants()) do 
				pcall(function()
					if Joints:IsA("Bone") then
						for i, v in ipairs(CVjoints) do
							if Joints.Name == v.Name then
								local tween=CreateTween(v, { speedd, EasingStyle, EasingDirection, 0, false, 0 }, {Value=CFrame.new(Joints.Position)*OrienRad(Joints.Orientation.X,Joints.Orientation.Y,Joints.Orientation.Z)}, true)
								table.insert(CVtweens,tween)
							end
						end
					end
				end)
			end
			conn=game:GetService("RunService").Heartbeat:Connect(function(dt) 
				anim(MonaJoints,CVjoints,lerpspeed)
			end)
			CVtweens[1].Completed:Wait()
			if conn then
				conn:Disconnect()
			end
		end)
		pcall(function()
			local EasingStyle= Enum.EasingStyle.Quad local EasingDirection=Enum.EasingDirection.Out
			local speedd=0.12
			local lerpspeed=0.2
			local conn
			local CVjoints={}
			local CVtweens={}
			for _, j in pairs(MonaJoints) do
				pcall(function()
					local cf=Instance.new("CFrameValue") cf.Value=j.CFrame cf.Name=j.Name
					table.insert(CVjoints,cf)
				end)
			end
			for _, Joints in pairs(MAnim["Manims"]["MagicPrepare5"]["RootPart"]["Trans"]:GetDescendants()) do 
				pcall(function()
					if Joints:IsA("Bone") then
						for i, v in ipairs(CVjoints) do
							if Joints.Name == v.Name then
								local tween=CreateTween(v, { speedd, EasingStyle, EasingDirection, 0, false, 0 }, {Value=CFrame.new(Joints.Position)*OrienRad(Joints.Orientation.X,Joints.Orientation.Y,Joints.Orientation.Z)}, true)
								table.insert(CVtweens,tween)
							end
						end
					end
				end)
			end
			conn=game:GetService("RunService").Heartbeat:Connect(function(dt) 
				anim(MonaJoints,CVjoints,lerpspeed)
			end)
			CVtweens[1].Completed:Wait()
			if conn then
				conn:Disconnect()
			end
		end)
		pcall(function()
			local EasingStyle= Enum.EasingStyle.Quad local EasingDirection=Enum.EasingDirection.Out
			local speedd=0.2
			local lerpspeed=0.3
			local conn
			local CVjoints={}
			local CVtweens={}
			for _, j in pairs(MonaJoints) do
				pcall(function()
					local cf=Instance.new("CFrameValue") cf.Value=j.CFrame cf.Name=j.Name
					table.insert(CVjoints,cf)
				end)
			end
			for _, Joints in pairs(MAnim["Manims"]["MagicPrepare6"]["RootPart"]["Trans"]:GetDescendants()) do 
				pcall(function()
					if Joints:IsA("Bone") then
						for i, v in ipairs(CVjoints) do
							if Joints.Name == v.Name then
								local tween=CreateTween(v, { speedd, EasingStyle, EasingDirection, 0, false, 0 }, {Value=CFrame.new(Joints.Position)*OrienRad(Joints.Orientation.X,Joints.Orientation.Y,Joints.Orientation.Z)}, true)
								table.insert(CVtweens,tween)
							end
						end
					end
				end)
			end
			conn=game:GetService("RunService").Heartbeat:Connect(function(dt) 
				anim(MonaJoints,CVjoints,lerpspeed)
			end)
			CVtweens[1].Completed:Wait()
			if conn then
				conn:Disconnect()
			end
		end)
		pcall(function()
			local EasingStyle= Enum.EasingStyle.Quad local EasingDirection=Enum.EasingDirection.Out
			local speedd=0.3
			local lerpspeed=0.8
			local conn
			local CVjoints={}
			local CVtweens={}
			for _, j in pairs(MonaJoints) do
				pcall(function()
					local cf=Instance.new("CFrameValue") cf.Value=j.CFrame cf.Name=j.Name
					table.insert(CVjoints,cf)
				end)
			end
			for _, Joints in pairs(MAnim["Manims"]["MagicReady"]["RootPart"]["Trans"]:GetDescendants()) do 
				pcall(function()
					if Joints:IsA("Bone") then
						for i, v in ipairs(CVjoints) do
							if Joints.Name == v.Name then
								local tween=CreateTween(v, { speedd, EasingStyle, EasingDirection, 0, false, 0 }, {Value=CFrame.new(Joints.Position)*OrienRad(Joints.Orientation.X,Joints.Orientation.Y,Joints.Orientation.Z)}, true)
								table.insert(CVtweens,tween)
							end
						end
					end
				end)
			end
			conn=game:GetService("RunService").Heartbeat:Connect(function(dt) 
				anim(MonaJoints,CVjoints,lerpspeed)
			end)
			CVtweens[1].Completed:Wait()
			if conn then
				conn:Disconnect()
			end
		end)

		pcall(function()
			local EasingStyle= Enum.EasingStyle.Back local EasingDirection=Enum.EasingDirection.Out
			local speedd=0.56
			local lerpspeed=1
			local conn
			local CVjoints={}
			local CVtweens={}
			for _, j in pairs(MonaJoints) do
				pcall(function()
					local cf=Instance.new("CFrameValue") cf.Value=j.CFrame cf.Name=j.Name
					table.insert(CVjoints,cf)
				end)
			end
			for _, Joints in pairs(MAnim["Manims"]["Magic1"]["RootPart"]["Trans"]:GetDescendants()) do 
				pcall(function()
					if Joints:IsA("Bone") then
						for i, v in ipairs(CVjoints) do
							if Joints.Name == v.Name then
								local tween=CreateTween(v, { speedd, EasingStyle, EasingDirection, 0, false, 0 }, {Value=CFrame.new(Joints.Position)*OrienRad(Joints.Orientation.X,Joints.Orientation.Y,Joints.Orientation.Z)}, true)
								table.insert(CVtweens,tween)
							end
						end
					end
				end)
			end
			conn=game:GetService("RunService").Heartbeat:Connect(function(dt)  
				anim(MonaJoints,CVjoints,lerpspeed)
			end)
			CVtweens[1].Completed:Wait()
			if conn then
				conn:Disconnect()
			end
		end)
		task.spawn(function() local mou = Mouse.Hit cf=CFrame.new(mou.p)*CFrame.new(0,0.1,0)
			quits=true
			orbcf1 = CFrame.new(0,0,0) orbcf2 = CFrame.new(0,0,0)  
			CreateTween(A1, { dur2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, false, 0 }, {CFrame=orbcf1}, true) CreateTween(A2, { dur2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, false, 0 }, {CFrame=orbcf1*CFrame.new(0, 0, -1.7)}, true)
			CreateTween(A3, { dur2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, false, 0 }, {CFrame=orbcf2*CFrame.new(0, 0, 1.7)}, true) CreateTween(A4, { dur2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, false, 0 }, {CFrame=orbcf2*CFrame.new(0, 0, -1.7)}, true)
			local tween=CreateTween(MainA, { dur2, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, 0, false, 0 }, {WorldCFrame=CFrame.new(mou.p,mou.p)}, true)
			task.spawn(function()
				quits=false
				repeat task.wait()
					pcall(function()
						MainB.Orientation=MainB.Orientation+Vector3.new(0,0,20)
					end)
				until quits or (P.Parent==nil or MainA.Parent==nil)
				tween:Cancel()
			end)	
			tween.Completed:Wait()
			if Power > 4 then
				pcall(function()
					pcall(function()
						pcall(function() --hit
							for _,a in next,reg(cf.p,30-2,{mmodel,soundpart,effectmodel,humanModel,(followchar and plr.Character or mmodel)})[1] do 
								if (a.Parent ~= mmodel and a.Parent ~= effectmodel and a ~= mmodel and a ~= effectmodel and a ~= soundpart and a.Parent ~= soundpart and a ~= script and a.Parent ~= script) and a.ClassName == "Part" or a.ClassName == "MeshPart" or a.ClassName == "TrussPart" or a.ClassName == "WedgePart" or a.ClassName == "CornerWedgePart" or a.ClassName == "UnionOperation" or a.ClassName == "NegateOperation" or a.ClassName == "Seat" or a.ClassName == "VehicleSeat" or a.ClassName == "FlagStand" or a.ClassName == "SpawnLocation" then
									if a.Parent ~= nil and a.Parent ~= workspace and a.Parent:IsA("Model") and a.Parent.ClassName == "Model" and a.Size == Vector3.new(2,2,1) or a.Size == Vector3.new(2,2.1,1) or a.Size == Vector3.new(1,1.105,1) or a.Size == Vector3.new(1,1.227,1) or a.Size == Vector3.new(1,1.253,1) or a.Size == Vector3.new(1,1.277,1) or a.Size == Vector3.new(1,2,1) or a.Size == Vector3.new(2,1,1) or a.Name == "Head" or a.Name == "Torso" or a.Name == "Right Arm" or a.Name == "Left Arm" or a.Name == "Right Leg" or a.Name == "Left Leg" or a.Name == "UpperTorso" or a.Name == "HumanoidRootPart" or a.Name == "LowerTorso" or a.Name == "RightHand" or a.Name == "LeftHand" or a.Name == "RightFoot" or a.Name == "LeftFoot" or a.Name == "LeftUpperArm" or a.Name == "LeftLowerArm" or a.Name == "RightUpperArm" or a.Name == "RightLowerArm" or a.Name == "LeftUpperLeg" or a.Name == "LeftLowerLeg" or a.Name == "RightUpperLeg" or a.Name == "RightLowerLeg" then
										if (a.Position - cf.p).Magnitude <= 30+a.Size.Magnitude then 
											local mainpart=(a.Parent:FindFirstChildOfClass'Part' or a.Parent:FindFirstChildOfClass'MeshPart' or a.Parent:FindFirstChildOfClass'UnionOperation') 
											local hum=(a.Parent:FindFirstChildOfClass'Humanoid' or nil)
											pcall(function() if mainpart.Parent==workspace then mainpart=a end
												local P=Instance.new("Part",workspace.Terrain) P.Transparency=1 P.Anchored=true P.Size=Vector3.new(0.050000000745058, 0.050000000745058, 0.050000000745058) P.CanCollide=false  
												P.CFrame=CFrame.new(10000,10000,10000)
												local A1=Instance.new("Attachment",P) A1.WorldCFrame=CFrame.new(mainpart.CFrame.p)*CFrame.new(math.random(-2,2),math.random(-2,2),math.random(-2,2)) local v1=imstuff["Facility"]["m1"]:Clone() v1.Parent=A1 local v2=imstuff["Facility"]["m2"]:Clone() v2.Parent=A1 local v3=imstuff["Facility"]["m3"]:Clone() v3.Parent=A1 local v4=imstuff["Facility"]["m4"]:Clone() v4.Parent=A1 
												game:GetService("Debris"):AddItem(P,2)
												syncSound({SoundId="rbxassetid://"..bodyimpact[math.random(1,#bodyimpact)],Volume=2,PlayOnRemove=true,TimePosition=0.01,Pitch=math.random(8, 10)/math.random(9,13),Parent=A1})
												CamShake(mainpart.CFrame,35,.75,.05)
												v1:Emit(30) v2:Emit(30) v3:Emit(30) v4:Emit(30) 
												if hum and hum.Health >= 1 and hum.MaxHealth<100000 then 
													hum.Health=hum.Health-1+Power 
													CreateTween(a, { 4, Enum.EasingStyle.Back, Enum.EasingDirection.In, 0, false, 0 }, {CFrame=a.CFrame*CFrame.new(0,2,0)}, true)
													if mainpart.Anchored ~= true then
														a.RotVelocity = CFrame.new(cf.p, a.Position).LookVector * 55
														a.Velocity = CFrame.new(cf.p, a.Position).LookVector * 55 
													end
												else
													CreateTween(a, { 4, Enum.EasingStyle.Back, Enum.EasingDirection.In, 0, false, 0 }, {CFrame=a.CFrame*CFrame.new(0,2,0)}, true)
													if mainpart.Anchored ~= true then
														a.RotVelocity = CFrame.new(cf.p, a.Position).LookVector * 55
														a.Velocity = CFrame.new(cf.p, a.Position).LookVector * 55 
													end
													if math.random(1,13) == 1 then
														if math.random(1,2) == 1 then
															sideeffect(mainpart)
														else
															effect(
																false,
																{CFrame = mainpart.CFrame,Size=mainpart.Size,Material="Glass",Color=mainpart.Color,Anchored=true,CanCollide=false,Transparency=0,Reflectance=-15}, --part proper
																{Scale=Vector3.new(),MeshType="Sphere"},
																{
																	{--1
																		dely=math.random(1,5)/math.random(5,8),
																		info={0.8,Enum.EasingStyle.Elastic,Enum.EasingDirection.InOut},
																		part={Transparency=0,CFrame=mainpart.CFrame*CFrame.new(math.random(-1,1),math.random(-1,1),math.random(-1,1)),Color=Color3.fromRGB(108, 214, 147),Reflectance=15}
																	},
																	{--2
																		dely=0,
																		info={0.3,Enum.EasingStyle.Linear,Enum.EasingDirection.Out},
																		part={Transparency=0,CFrame=mainpart.CFrame*CFrame.new(math.random(-3,3),math.random(-3,3),math.random(-3,3))*CFrame.Angles(math.random(-80,80),math.random(-80,80),math.random(-80,80)),Color=Color3.fromRGB(108, 214, 147),Reflectance=-15}
																	},
																	{--3
																		acc={vdec=CFrame.new(math.random(-1,1)/1555,math.random(-1,1)/1555,math.random(-1,1)/1555),vel=CFrame.new(0,0,0)*CFrame.Angles(math.random(1,2)/math.random(45,65),math.random(1,2)/math.random(45,65),math.random(1,2)/math.random(45,65))},
																		info={5.8,Enum.EasingStyle.Elastic,Enum.EasingDirection.InOut},
																		mesh={Scale=Vector3.new(0,0,0)},
																		part={Transparency=1,Size=Vector3.new(0,0,0),Color=Color3.fromRGB(),Reflectance=7}
																	}
																}
															)
														end
														syncSound({SoundId="rbxassetid://3748209678",Volume=4.5,PlayOnRemove=true,TimePosition=0,Pitch=math.random(8, 10)/math.random(5, 10),Parent=mainpart}) mainpart:Destroy()
													end
												end
											end) 
										end
									end
								end;
							end
						end)
					end)
					local beams={} quits=true
					pcall(function()
						local P=Instance.new("Part") P.Anchored=true --Part
						local A1=Instance.new("Attachment",P) A1.WorldCFrame=cf*CFrame.new(0, 0, 7.5)*OrienRad(0,0,-10) local A2=Instance.new("Attachment",P) A2.WorldCFrame=cf*CFrame.new(0, 0, -7.5)*OrienRad(90, -180, 0)
						local A3=Instance.new("Attachment",P) A3.WorldCFrame=cf*CFrame.new(7.5, 0, 0)*OrienRad(90, 90, 0) local A4=Instance.new("Attachment",P) A4.WorldCFrame=cf*CFrame.new(-7.5, 0, 0)*OrienRad(90, -90, 0)
						local B1=imstuff["Facility"]["B1"]:Clone() B1.Parent=P B1.Attachment0=A1 B1.Attachment1=A3 local B2=imstuff["Facility"]["B1"]:Clone() B2.Parent=P B2.Attachment0=A1 B2.Attachment1=A4 B2.CurveSize0=-4 B2.CurveSize1=-4
						local B3=imstuff["Facility"]["B1"]:Clone() B3.Parent=P B3.Attachment0=A2 B3.Attachment1=A4 local B4=imstuff["Facility"]["B1"]:Clone() B4.Parent=P B4.Attachment0=A2 B4.Attachment1=A3 B4.CurveSize0=-4 B4.CurveSize1=-4
						P.CFrame=CFrame.new(100000,100000,100000)
						beams = {B1,B2,B3,B4}
						--properties
						B1.CurveSize0=4 B1.CurveSize1=4
						B2.CurveSize0=-4 B2.CurveSize1=-4
						B3.CurveSize0=4 B3.CurveSize1=4
						B4.CurveSize0=-4 B4.CurveSize1=-4
						A1.WorldCFrame=cf*CFrame.new(0, 0, 7.5)*OrienRad(90, 0, 0)  A2.WorldCFrame=cf*CFrame.new(0, 0, -7.5)*OrienRad(90, -180, 0) --Pos
						A3.WorldCFrame=cf*CFrame.new(7.5, 0, 0)*OrienRad(90, 90, 0) A4.WorldCFrame=cf*CFrame.new(-7.5, 0, 0)*OrienRad(90, -90, 0)
						P.Parent=effectmodel
						task.spawn(function()
							local patternnum=math.random(1,25) quits=false
							repeat task.wait(0.04)
								pcall(function()
									local s=animatedpat(patternnum)
									for i, b in next, beams do  
										if b:IsA("Beam") then
											b.Texture=s[1]
										end	
									end
									patternnum=patternnum+1
									if 25 <= patternnum then patternnum = 0 end
									for i, AT in next, attachmen do  
										if math.random(1,3) == 1 then
											pcall(function() --hit
												local region=Region3.new(AT.WorldCFrame.p-Vector3.new(1,1,1)*13/2,AT.WorldCFrame.p+Vector3.new(1,0,1)*13/2)
												for _,a in next,workspace:FindPartsInRegion3WithIgnoreList(region,{mmodel,soundpart,effectmodel,humanModel,(followchar and plr.Character or mmodel)},100) do 
													if (a.Parent ~= mmodel and a.Parent ~= effectmodel and a ~= mmodel and a ~= effectmodel and a ~= soundpart and a.Parent ~= soundpart and a ~= script and a.Parent ~= script) and a.ClassName == "Part" or a.ClassName == "MeshPart" or a.ClassName == "TrussPart" or a.ClassName == "WedgePart" or a.ClassName == "CornerWedgePart" or a.ClassName == "UnionOperation" or a.ClassName == "NegateOperation" or a.ClassName == "Seat" or a.ClassName == "VehicleSeat" or a.ClassName == "FlagStand" or a.ClassName == "SpawnLocation" then
														if a.Parent ~= nil and a.Parent ~= workspace and a.Parent:IsA("Model") and a.Parent.ClassName == "Model" and a.Size == Vector3.new(2,2,1) or a.Size == Vector3.new(2,2.1,1) or a.Size == Vector3.new(1,1.105,1) or a.Size == Vector3.new(1,1.227,1) or a.Size == Vector3.new(1,1.253,1) or a.Size == Vector3.new(1,1.277,1) or a.Size == Vector3.new(1,2,1) or a.Size == Vector3.new(2,1,1) or a.Name == "Head" or a.Name == "Torso" or a.Name == "Right Arm" or a.Name == "Left Arm" or a.Name == "Right Leg" or a.Name == "Left Leg" or a.Name == "UpperTorso" or a.Name == "HumanoidRootPart" or a.Name == "LowerTorso" or a.Name == "RightHand" or a.Name == "LeftHand" or a.Name == "RightFoot" or a.Name == "LeftFoot" or a.Name == "LeftUpperArm" or a.Name == "LeftLowerArm" or a.Name == "RightUpperArm" or a.Name == "RightLowerArm" or a.Name == "LeftUpperLeg" or a.Name == "LeftLowerLeg" or a.Name == "RightUpperLeg" or a.Name == "RightLowerLeg" then
															if (a.Position - AT.WorldCFrame.p).Magnitude <= 30+a.Size.Magnitude then
																local mainpart=(a.Parent:FindFirstChildOfClass'Part' or a.Parent:FindFirstChildOfClass'MeshPart' or a.Parent:FindFirstChildOfClass'UnionOperation') 
																local hum=(a.Parent:FindFirstChildOfClass'Humanoid' or nil)
																if (game:GetService("CollectionService"):HasTag(hum.Parent, "deathed"))==false then 
																	pcall(function() if mainpart.Parent==workspace then mainpart=a end
																		local P=makePartAttachment(CFrame.new(mainpart.CFrame.p)*CFrame.new(math.random(-2,2),math.random(-2,2),math.random(-2,2)),2)
																		local v1=imstuff["Facility"]["m1"]:Clone() v1.Parent=P[2] local v2=imstuff["Facility"]["m2"]:Clone() v2.Parent=P[2] local v3=imstuff["Facility"]["m3"]:Clone() v3.Parent=P[2] local v4=imstuff["Facility"]["m4"]:Clone() v4.Parent=P[2] 
																		syncSound({SoundId="rbxassetid://"..bodyimpact[math.random(1,#bodyimpact)],Volume=0.9,PlayOnRemove=true,TimePosition=0.01,Pitch=math.random(8, 10)/math.random(9,13),Parent=P[2]})
																		CamShake(mainpart.CFrame,35,.75,.05)
																		v1:Emit(30) v2:Emit(30) v3:Emit(30) v4:Emit(30) 
																		if hum and hum.Health >= 1 and hum.MaxHealth<100000 then 
																			hum.Health=hum.Health-math.random(1,3+Power)
																			if mainpart.Anchored ~= true then
																				a.RotVelocity = CFrame.new(AT.WorldCFrame.p, a.Position).LookVector * 75
																				a.Velocity = CFrame.new(AT.WorldCFrame.p, a.Position).LookVector * 75 
																			end
																		else
																			if mainpart.Anchored ~= true then
																				a.RotVelocity = CFrame.new(AT.WorldCFrame.p, a.Position).LookVector * 75
																				a.Velocity = CFrame.new(AT.WorldCFrame.p, a.Position).LookVector * 75 
																			end
																			if hum and hum.Parent then
																				hum.Parent:BreakJoints()
																				game:GetService("CollectionService"):AddTag(hum.Parent, "deathed") 	
																				task.delay(5, function()
																					game:GetService("CollectionService"):RemoveTag(hum.Parent, "deathed")
																				end)
																				for _, v in pairs(hum.Parent:children()) do
																					if v:IsA("BasePart") then
																						task.spawn(function() v.Anchored=true
																							CreateTween(v, { 1.5, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0 }, {CFrame=v.CFrame*CFrame.new(Random.new():NextNumber(-8, 8), Random.new():NextNumber(-3, 8), Random.new():NextNumber(-8, 8))*OrienRad(math.random(-180,180), math.random(-180,180), math.random(-180,180))}, true).Completed:Wait()
																							local P=makePartAttachment(CFrame.new(v.CFrame.p),4) local v1=imstuff["Facility"]["ne2"]:Clone() v1.Parent=P[2] local v2=imstuff["Facility"]["ne3"]:Clone() v2.Parent=P[2] 
																							syncSound({SoundId="rbxassetid://782353117",Volume=0.25,PlayOnRemove=true,TimePosition=0,Pitch=1.2,Parent=P[2]})
																							syncSound({SoundId="rbxassetid://1192402877",Volume=0.5,PlayOnRemove=true,TimePosition=0,Pitch=0.75,Parent=P[2]})
																							v1:Emit(18) v2:Emit(20)
																							v:Destroy()
																						end)
																					end
																				end
																				syncSound({SoundId="rbxassetid://782353443",Volume=6,PlayOnRemove=true,TimePosition=0,Pitch=1,Parent=P[2]})
																				syncSound({SoundId="rbxassetid://763718160",Volume=5.75,PlayOnRemove=true,TimePosition=0,Pitch=1.1,Parent=P[2]})
																				local P=makePartAttachment(CFrame.new(mainpart.CFrame.p),4) local v1=imstuff["Facility"]["ne1"]:Clone() v1.Parent=P[2] v1:Emit(20)
																			end
																		end
																	end)  break
																end
															end
														end
													end;
												end
											end)
										end
									end
								end)
							until P.Parent==nil or quits
							P:Destroy()
						end)
					end)
					pcall(function()
						local P2=Instance.new("Part",workspace.Terrain) P2.Transparency=1 P2.Anchored=true P2.Size=Vector3.new(0.050000000745058, 0.050000000745058, 0.050000000745058) P2.CanCollide=false  P2.CFrame=CFrame.new(10000,10000,10000)
						local A1=Instance.new("Attachment",P2) A1.WorldCFrame=CFrame.new(mou.p) local v0= imstuff["Facility"]["GR"]:Clone() v0.Parent=A1 local v1=imstuff["Facility"]["FL"]:Clone() v1.Parent=A1
						syncSound({SoundId="rbxassetid://8189651795",Volume=9,PlayOnRemove=true,TimePosition=0,Pitch=math.random(8, 10)/8,Parent=MainA})
						syncSound({SoundId="rbxassetid://1846164002",Volume=7,PlayOnRemove=true,TimePosition=0.65,Pitch=math.random(8, 10)/8,Parent=MainA})
						game:GetService("Debris"):AddItem(P2,5)
						v0:Emit(100) v1:Emit(100)
						task.spawn(function()
							local banum=math.random(1,36)
							repeat task.wait(0.04) 
								local s=animatedar(banum)
								v0.Texture=s[1]
								v1.Texture=s[1]
								banum=banum+1
								if 37 <= banum then banum = 0 end
							until P2.Parent==nil or A1.Parent==nil 
						end)
					end)
					orbcf1 = CFrame.new(24,0,0) orbcf2 = CFrame.new(-35,0,0)  
					MainA.Orientation=Vector3.new() A1.Parent=MainA A2.Parent=MainA A3.Parent=MainA A4.Parent=MainA MainB:Destroy()
					for i, b in next, beams do  
						if b:IsA("Beam") then
							CreateTween(b, { 6, Enum.EasingStyle.Elastic, Enum.EasingDirection.Out, 0, false, 0 }, {TextureLength=0.1,TextureSpeed=0.02,Width0=27,Width1=27}, true)
						end	
					end
					CreateTween(A1, { 6, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, false, 0 }, {CFrame=orbcf1*CFrame.new(0, 0, 1.7)}, true) CreateTween(A2, { 6, Enum.EasingStyle.Elastic, Enum.EasingDirection.Out, 0, false, 0 }, {CFrame=orbcf1*CFrame.new(0, 0, -1.7)}, true)
					CreateTween(A3, { 6, Enum.EasingStyle.Quad, Enum.EasingDirection.In, 0, false, 0 }, {CFrame=orbcf2*CFrame.new(0, 0, 1.7)}, true) CreateTween(A4, { 6, Enum.EasingStyle.Quad, Enum.EasingDirection.In, 0, false, 0 }, {CFrame=orbcf2*CFrame.new(0, 0, -1.7)}, true)
					local tween=CreateTween(MainA, { 6, Enum.EasingStyle.Elastic, Enum.EasingDirection.Out, 0, false, 0 }, {WorldPosition=cf*CFrame.new(0,2,0).p}, true)
					local snum = 0
					local sc task.spawn(function()
						sc=MainA:GetPropertyChangedSignal("CFrame"):Connect(function() task.wait()
							if (P.Parent==nil or MainA.Parent==nil) then 
								sc:Disconnect()
							end
							pcall(function()  snum=snum+0.0000035 
								MainA.Orientation=MainA.Orientation+Vector3.new(0,0.2-snum,0)
							end)
						end)
					end)	
					tween.Completed:Wait()
					if sc then
						sc:Disconnect()
					end
					task.spawn(function()
						syncSound({SoundId="rbxassetid://12431468421",Volume=3,PlayOnRemove=true,TimePosition=0,Pitch=math.random(9, 10)/9,Parent=A1})
						task.wait(1)
						syncSound({SoundId="rbxassetid://7507691667",Volume=9.5,PlayOnRemove=true,TimePosition=0,Pitch=math.random(9, 10)/9,Parent=A1})
						local P2=Instance.new("Part",workspace.Terrain) P2.Transparency=1 P2.Anchored=true P2.Size=Vector3.new(0.050000000745058, 0.050000000745058, 0.050000000745058) P2.CanCollide=false  P2.CFrame=CFrame.new(10000,10000,10000)
						local A1=Instance.new("Attachment",P2) A1.WorldCFrame=CFrame.new(mou.p) local v0=imstuff["Facility"].EP0:Clone() v0.Parent=A1 local v1=imstuff["Facility"].EP1:Clone() v1.Parent=A1 local v2=imstuff["Facility"].EP2:Clone() v2.Parent=A1 local v3=imstuff["Facility"].EP3:Clone() v3.Parent=A1 local v4=imstuff["Facility"].EP4:Clone() v4.Parent=A1 
						syncSound({SoundId="rbxassetid://8184790656",Volume=8.9,PlayOnRemove=true,TimePosition=0,Pitch=math.random(8, 10)/math.random(9,13),Parent=A1})
						v0:Emit(100) v1:Emit(100) v2:Emit(100) v3:Emit(100) v4:Emit(100) 
						game:GetService("Debris"):AddItem(P2,7)
						CamShake(mou,85,.7,.1)
						task.spawn(function()
							local daurannum=math.random(1,25)
							repeat task.wait(0.065) 
								local s=animatedaura(daurannum)
								v0.Texture=s[1]
								daurannum=daurannum+1
								if 25 <= daurannum then daurannum = 0 end
							until P2.Parent==nil or A1.Parent==nil 
						end)
						task.spawn(function()
							local baurannum=math.random(1,25) local patternnum=math.random(1,25)
							repeat task.wait(0.04)
								pcall(function()
									local s=animatedpat(patternnum)
									v3.Texture=s[1]
									patternnum=patternnum+1
									if 25 <= patternnum then patternnum = 0 end
								end)
								local s=animatedaura(baurannum)
								v2.Texture=s[1]
								baurannum=baurannum+1
								if 25 <= baurannum then baurannum = 0 end
							until P2.Parent==nil or A1.Parent==nil
						end)
						pcall(function() --hit
							for _,a in next,reg(mou.p,35-2,{mmodel,soundpart,effectmodel,humanModel,(followchar and plr.Character or mmodel)})[1] do 
								if (a.Parent ~= mmodel and a.Parent ~= effectmodel and a ~= mmodel and a ~= effectmodel and a ~= soundpart and a.Parent ~= soundpart and a ~= script and a.Parent ~= script) and a.ClassName == "Part" or a.ClassName == "MeshPart" or a.ClassName == "TrussPart" or a.ClassName == "WedgePart" or a.ClassName == "CornerWedgePart" or a.ClassName == "UnionOperation" or a.ClassName == "NegateOperation" or a.ClassName == "Seat" or a.ClassName == "VehicleSeat" or a.ClassName == "FlagStand" or a.ClassName == "SpawnLocation" then
									if a.Parent ~= nil and a.Parent ~= workspace and a.Parent:IsA("Model") and a.Parent.ClassName == "Model" and a.Size == Vector3.new(2,2,1) or a.Size == Vector3.new(2,2.1,1) or a.Size == Vector3.new(1,1.105,1) or a.Size == Vector3.new(1,1.227,1) or a.Size == Vector3.new(1,1.253,1) or a.Size == Vector3.new(1,1.277,1) or a.Size == Vector3.new(1,2,1) or a.Size == Vector3.new(2,1,1) or a.Name == "Head" or a.Name == "Torso" or a.Name == "Right Arm" or a.Name == "Left Arm" or a.Name == "Right Leg" or a.Name == "Left Leg" or a.Name == "UpperTorso" or a.Name == "HumanoidRootPart" or a.Name == "LowerTorso" or a.Name == "RightHand" or a.Name == "LeftHand" or a.Name == "RightFoot" or a.Name == "LeftFoot" or a.Name == "LeftUpperArm" or a.Name == "LeftLowerArm" or a.Name == "RightUpperArm" or a.Name == "RightLowerArm" or a.Name == "LeftUpperLeg" or a.Name == "LeftLowerLeg" or a.Name == "RightUpperLeg" or a.Name == "RightLowerLeg" then
										if (a.Position - mou.p).Magnitude <= 35+a.Size.Magnitude then
											local mainpart=(a.Parent:FindFirstChildOfClass'Part' or a.Parent:FindFirstChildOfClass'MeshPart' or a.Parent:FindFirstChildOfClass'UnionOperation') 
											local hum=(a.Parent:FindFirstChildOfClass'Humanoid' or nil)
											pcall(function() if mainpart.Parent==workspace then mainpart=a end
												local P=Instance.new("Part",workspace.Terrain) P.Transparency=1 P.Anchored=true P.Size=Vector3.new(0.050000000745058, 0.050000000745058, 0.050000000745058) P.CanCollide=false  
												P.CFrame=CFrame.new(10000,10000,10000)
												local A1=Instance.new("Attachment",P) A1.WorldCFrame=CFrame.new(mainpart.CFrame.p)*CFrame.new(math.random(-2,2),math.random(-2,2),math.random(-2,2)) local v1=imstuff["Facility"]["m1"]:Clone() v1.Parent=A1 local v2=imstuff["Facility"]["m2"]:Clone() v2.Parent=A1 local v3=imstuff["Facility"]["m3"]:Clone() v3.Parent=A1 local v4=imstuff["Facility"]["m4"]:Clone() v4.Parent=A1 
												game:GetService("Debris"):AddItem(P,2)
												syncSound({SoundId="rbxassetid://"..bodyimpact[math.random(1,#bodyimpact)],Volume=0.9,PlayOnRemove=true,TimePosition=0.01,Pitch=math.random(8, 10)/math.random(9,13),Parent=A1})
												CamShake(mainpart.CFrame,35,.75,.05)
												v1:Emit(30) v2:Emit(30) v3:Emit(30) v4:Emit(30) 
												if hum and hum.Health >= 1 and hum.MaxHealth<100000 then 
													hum.Health=hum.Health-math.random(10,20+Power)
													if mainpart.Anchored ~= true then
														a.RotVelocity = CFrame.new(mou.p, a.Position).LookVector * 55
														a.Velocity = CFrame.new(mou.p, a.Position).LookVector * 55 
													end
												else
													if mainpart.Anchored ~= true then
														a.RotVelocity = CFrame.new(mou.p, a.Position).LookVector * 55
														a.Velocity = CFrame.new(mou.p, a.Position).LookVector * 55 
													end
													if math.random(1,2) == 1 then
														sideeffect(mainpart)
													else
														effect(
															false,
															{CFrame = mainpart.CFrame,Size=mainpart.Size,Material="Glass",Color=mainpart.Color,Anchored=true,CanCollide=false,Transparency=0,Reflectance=-15}, --part proper
															{Scale=Vector3.new(),MeshType="Sphere"},
															{
																{--1
																	dely=math.random(1,5)/math.random(5,8),
																	info={0.8,Enum.EasingStyle.Elastic,Enum.EasingDirection.InOut},
																	part={Transparency=0,CFrame=mainpart.CFrame*CFrame.new(math.random(-1,1),math.random(-1,1),math.random(-1,1)),Color=Color3.fromRGB(108, 214, 147),Reflectance=15}
																},
																{--2
																	dely=0,
																	info={0.3,Enum.EasingStyle.Linear,Enum.EasingDirection.Out},
																	part={Transparency=0,CFrame=mainpart.CFrame*CFrame.new(math.random(-3,3),math.random(-3,3),math.random(-3,3))*CFrame.Angles(math.random(-80,80),math.random(-80,80),math.random(-80,80)),Color=Color3.fromRGB(108, 214, 147),Reflectance=-15}
																},
																{--3
																	acc={vdec=CFrame.new(math.random(-1,1)/1555,math.random(-1,1)/1555,math.random(-1,1)/1555),vel=CFrame.new(0,0,0)*CFrame.Angles(math.random(1,2)/math.random(45,65),math.random(1,2)/math.random(45,65),math.random(1,2)/math.random(45,65))},
																	info={5.8,Enum.EasingStyle.Elastic,Enum.EasingDirection.InOut},
																	mesh={Scale=Vector3.new(0,0,0)},
																	part={Transparency=1,Size=Vector3.new(0,0,0),Color=Color3.fromRGB(),Reflectance=7}
																}
															}
														)
													end
													syncSound({SoundId="rbxassetid://3748209678",Volume=4.5,PlayOnRemove=true,TimePosition=0,Pitch=math.random(8, 10)/math.random(5, 10),Parent=mainpart}) mainpart:Destroy()
												end
											end) 
										end
									end
								end;
							end
						end)
					end)
					orbcf1 = CFrame.new(0,0,0) orbcf2 = CFrame.new(-0,0,0)  
					for i, b in next, beams do  
						if b:IsA("Beam") then
							CreateTween(b, { 1, Enum.EasingStyle.Bounce, Enum.EasingDirection.InOut, 0, false, 0 }, {TextureLength=3,TextureSpeed=15,Width0=0,Width1=0}, true) 
						end
					end
					CreateTween(A1, { 1, Enum.EasingStyle.Back, Enum.EasingDirection.InOut, 0, false, 0 }, {CFrame=orbcf1*CFrame.new(0, 0, 1.7)}, true) CreateTween(A2, { 1, Enum.EasingStyle.Back, Enum.EasingDirection.InOut, 0, false, 0 }, {CFrame=orbcf1*CFrame.new(0, 0, -1.7)}, true)
					CreateTween(A3, { 1, Enum.EasingStyle.Back, Enum.EasingDirection.InOut, 0, false, 0 }, {CFrame=orbcf2*CFrame.new(0, 0, 1.7)}, true) CreateTween(A4, { 1, Enum.EasingStyle.Back, Enum.EasingDirection.InOut, 0, false, 0 }, {CFrame=orbcf2*CFrame.new(0, 0, -1.7)}, true)
					local tween=CreateTween(MainA, { 1, Enum.EasingStyle.Back, Enum.EasingDirection.InOut, 0, false, 0 }, {WorldPosition=cf*CFrame.new(0,2,0).p}, true)
					local sc task.spawn(function()
						sc=MainA:GetPropertyChangedSignal("CFrame"):Connect(function() task.wait()
							if (P.Parent==nil or MainA.Parent==nil) then
								sc:Disconnect()
							end
							pcall(function()
								MainA.Orientation=MainA.Orientation+Vector3.new(0,0.05,0)
							end)
						end)
					end)	
					tween.Completed:Wait()
					quits=true
					if sc then
						sc:Disconnect()
					end
					game:GetService("Debris"):AddItem(P,0.8)
				end)
			else
				game:GetService("Debris"):AddItem(P,0.8)
				quits=true
				local P2=Instance.new("Part",workspace.Terrain) P2.Transparency=1 P2.Anchored=true P2.Size=Vector3.new(0.050000000745058, 0.050000000745058, 0.050000000745058) P2.CanCollide=false  P2.CFrame=CFrame.new(10000,10000,10000)
				local A1=Instance.new("Attachment",P2) A1.WorldCFrame=CFrame.new(mou.p) local v0=imstuff["Facility"].EP0:Clone() v0.Parent=A1 local v1=imstuff["Facility"].EP1:Clone() v1.Parent=A1 local v2=imstuff["Facility"].EP2:Clone() v2.Parent=A1 local v3=imstuff["Facility"].EP3:Clone() v3.Parent=A1 local v4=imstuff["Facility"].EP4:Clone() v4.Parent=A1 
				syncSound({SoundId="rbxassetid://8184790656",Volume=8.9,PlayOnRemove=true,TimePosition=0,Pitch=math.random(8, 10)/math.random(9,13),Parent=A1})
				v0:Emit(100) v1:Emit(100) v2:Emit(100) v3:Emit(100) v4:Emit(100) 
				game:GetService("Debris"):AddItem(P2,7)
				CamShake(mou,85,.7,.1)
				task.spawn(function()
					local daurannum=math.random(1,25)
					repeat task.wait(0.065) 
						local s=animatedaura(daurannum)
						v0.Texture=s[1]
						daurannum=daurannum+1
						if 25 <= daurannum then daurannum = 0 end
					until P2.Parent==nil or A1.Parent==nil 
				end)
				task.spawn(function()
					local baurannum=math.random(1,25) local patternnum=math.random(1,25)
					repeat task.wait(0.04)
						pcall(function()
							local s=animatedpat(patternnum)
							v3.Texture=s[1]
							patternnum=patternnum+1
							if 25 <= patternnum then patternnum = 0 end
						end)
						local s=animatedaura(baurannum)
						v2.Texture=s[1]
						baurannum=baurannum+1
						if 25 <= baurannum then baurannum = 0 end
					until P2.Parent==nil or A1.Parent==nil
				end)
				pcall(function() --hit
					for _,a in next,reg(mou.p,35-2,{mmodel,soundpart,effectmodel,humanModel,(followchar and plr.Character or mmodel)})[1] do 
						if (a.Parent ~= mmodel and a.Parent ~= effectmodel and a ~= mmodel and a ~= effectmodel and a ~= soundpart and a.Parent ~= soundpart and a ~= script and a.Parent ~= script) and a.ClassName == "Part" or a.ClassName == "MeshPart" or a.ClassName == "TrussPart" or a.ClassName == "WedgePart" or a.ClassName == "CornerWedgePart" or a.ClassName == "UnionOperation" or a.ClassName == "NegateOperation" or a.ClassName == "Seat" or a.ClassName == "VehicleSeat" or a.ClassName == "FlagStand" or a.ClassName == "SpawnLocation" then
							if a.Parent ~= nil and a.Parent ~= workspace and a.Parent:IsA("Model") and a.Parent.ClassName == "Model" and a.Size == Vector3.new(2,2,1) or a.Size == Vector3.new(2,2.1,1) or a.Size == Vector3.new(1,1.105,1) or a.Size == Vector3.new(1,1.227,1) or a.Size == Vector3.new(1,1.253,1) or a.Size == Vector3.new(1,1.277,1) or a.Size == Vector3.new(1,2,1) or a.Size == Vector3.new(2,1,1) or a.Name == "Head" or a.Name == "Torso" or a.Name == "Right Arm" or a.Name == "Left Arm" or a.Name == "Right Leg" or a.Name == "Left Leg" or a.Name == "UpperTorso" or a.Name == "HumanoidRootPart" or a.Name == "LowerTorso" or a.Name == "RightHand" or a.Name == "LeftHand" or a.Name == "RightFoot" or a.Name == "LeftFoot" or a.Name == "LeftUpperArm" or a.Name == "LeftLowerArm" or a.Name == "RightUpperArm" or a.Name == "RightLowerArm" or a.Name == "LeftUpperLeg" or a.Name == "LeftLowerLeg" or a.Name == "RightUpperLeg" or a.Name == "RightLowerLeg" then
								if (a.Position - mou.p).Magnitude <= 35+a.Size.Magnitude then
									local mainpart=(a.Parent:FindFirstChildOfClass'Part' or a.Parent:FindFirstChildOfClass'MeshPart' or a.Parent:FindFirstChildOfClass'UnionOperation') 
									local hum=(a.Parent:FindFirstChildOfClass'Humanoid' or nil)
									pcall(function() if mainpart.Parent==workspace then mainpart=a end
										local P=Instance.new("Part",workspace.Terrain) P.Transparency=1 P.Anchored=true P.Size=Vector3.new(0.050000000745058, 0.050000000745058, 0.050000000745058) P.CanCollide=false  
										P.CFrame=CFrame.new(10000,10000,10000)
										local A1=Instance.new("Attachment",P) A1.WorldCFrame=CFrame.new(mainpart.CFrame.p)*CFrame.new(math.random(-2,2),math.random(-2,2),math.random(-2,2)) local v1=imstuff["Facility"]["m1"]:Clone() v1.Parent=A1 local v2=imstuff["Facility"]["m2"]:Clone() v2.Parent=A1 local v3=imstuff["Facility"]["m3"]:Clone() v3.Parent=A1 local v4=imstuff["Facility"]["m4"]:Clone() v4.Parent=A1 
										game:GetService("Debris"):AddItem(P,2)
										syncSound({SoundId="rbxassetid://"..bodyimpact[math.random(1,#bodyimpact)],Volume=0.9,PlayOnRemove=true,TimePosition=0.01,Pitch=math.random(8, 10)/math.random(9,13),Parent=A1})
										CamShake(mainpart.CFrame,35,.75,.05)
										v1:Emit(30) v2:Emit(30) v3:Emit(30) v4:Emit(30) 
										if hum and hum.Health >= 1 and hum.MaxHealth<100000 then 
											hum.Health=hum.Health-math.random(10,20+Power)
											if mainpart.Anchored ~= true then
												a.RotVelocity = CFrame.new(mou.p, a.Position).LookVector * 55
												a.Velocity = CFrame.new(mou.p, a.Position).LookVector * 55 
											end
										else

											if mainpart.Anchored ~= true then
												a.RotVelocity = CFrame.new(mou.p, a.Position).LookVector * 55
												a.Velocity = CFrame.new(mou.p, a.Position).LookVector * 55 
											end
											if math.random(1,2) == 1 then
												sideeffect(mainpart)
											else
												effect(
													false,
													{CFrame = mainpart.CFrame,Size=mainpart.Size,Material="Glass",Color=mainpart.Color,Anchored=true,CanCollide=false,Transparency=0,Reflectance=-15}, --part proper
													{Scale=Vector3.new(),MeshType="Sphere"},
													{
														{--1
															dely=math.random(1,5)/math.random(5,8),
															info={0.8,Enum.EasingStyle.Elastic,Enum.EasingDirection.InOut},
															part={Transparency=0,CFrame=mainpart.CFrame*CFrame.new(math.random(-1,1),math.random(-1,1),math.random(-1,1)),Color=Color3.fromRGB(108, 214, 147),Reflectance=15}
														},
														{--2
															dely=0,
															info={0.3,Enum.EasingStyle.Linear,Enum.EasingDirection.Out},
															part={Transparency=0,CFrame=mainpart.CFrame*CFrame.new(math.random(-3,3),math.random(-3,3),math.random(-3,3))*CFrame.Angles(math.random(-80,80),math.random(-80,80),math.random(-80,80)),Color=Color3.fromRGB(108, 214, 147),Reflectance=-15}
														},
														{--3
															acc={vdec=CFrame.new(math.random(-1,1)/1555,math.random(-1,1)/1555,math.random(-1,1)/1555),vel=CFrame.new(0,0,0)*CFrame.Angles(math.random(1,2)/math.random(45,65),math.random(1,2)/math.random(45,65),math.random(1,2)/math.random(45,65))},
															info={5.8,Enum.EasingStyle.Elastic,Enum.EasingDirection.InOut},
															mesh={Scale=Vector3.new(0,0,0)},
															part={Transparency=1,Size=Vector3.new(0,0,0),Color=Color3.fromRGB(),Reflectance=7}
														}
													}
												)
											end
											syncSound({SoundId="rbxassetid://3748209678",Volume=4.5,PlayOnRemove=true,TimePosition=0,Pitch=math.random(8, 10)/math.random(5, 10),Parent=mainpart}) mainpart:Destroy()
										end	
									end) 
								end
							end
						end;
					end
				end)
			end
		end)
		pcall(function()
			local EasingStyle=Enum.EasingStyle.Back local EasingDirection=Enum.EasingDirection.InOut
			local speedd=0.2
			local lerpspeed=1
			local conn
			local CVjoints={}
			local CVtweens={}
			for _, j in pairs(MonaJoints) do
				pcall(function()
					local cf=Instance.new("CFrameValue") cf.Value=j.CFrame cf.Name=j.Name
					table.insert(CVjoints,cf)
				end)
			end
			for _, Joints in pairs(MAnim["Manims"]["Magic2"]["RootPart"]["Trans"]:GetDescendants()) do 
				pcall(function()
					if Joints:IsA("Bone") then
						for i, v in ipairs(CVjoints) do
							if Joints.Name == v.Name then
								local tween=CreateTween(v, { speedd, EasingStyle, EasingDirection, 0, false, 0 }, {Value=CFrame.new(Joints.Position)*OrienRad(Joints.Orientation.X,Joints.Orientation.Y,Joints.Orientation.Z)}, true)
								table.insert(CVtweens,tween)
							end
						end
					end
				end)
			end
			conn=game:GetService("RunService").Heartbeat:Connect(function(dt)  
				anim(MonaJoints,CVjoints,lerpspeed)
			end)
			CVtweens[1].Completed:Wait()
			task.wait(0.25)
			if conn then
				conn:Disconnect()
			end
		end)
		pcall(function() kf.ST.Enabled = false end)
		attacking=false movementfalse=false 
	end)))
end



function FloorBomb()
	coroutine.resume(Add(coroutine.create(function()
		attacking=true movementfalse=true nowalk=true fallingspeed=0 local stopall = false swordphase=true local di = true local Mpos = mainposba 
		local function anim(MonaJoints,CVjoints,lerpspeed)
			pcall(function() 
				for _, j in pairs(MonaJoints) do
					for _, CV in pairs(CVjoints) do
						if j.Name == CV.Name then
							if j.Name == "ShoulderL" then
								j.CFrame=j.CFrame:lerp(CV.Value*CFrame.fromOrientation(math.rad(math.rad(25*math.cos(sn/11))),math.rad(0), math.rad(5*math.cos(sn/11))),lerpspeed) 
							elseif j.Name == "ShoulderR" then
								j.CFrame=j.CFrame:lerp(CV.Value*CFrame.fromOrientation(math.rad(math.rad(25*math.cos(sn/1))),math.rad(0), math.rad(5*math.cos(sn/12))),lerpspeed)
							elseif j.Name == "Neck" then
								j.CFrame=j.CFrame:lerp(CV.Value*CFrame.fromOrientation(math.rad(3*math.sin(sn/8)), math.rad(0), math.rad(0)),lerpspeed)
							elseif j.Name == "Waist" then
								j.CFrame=j.CFrame:lerp(CV.Value*CFrame.fromOrientation(math.rad(3*math.cos(sn/8)), math.rad(1.5*math.cos(sn/10)), math.rad(1.5*math.cos(sn/9))),lerpspeed)
							elseif j.Name == "LegL" then
								j.CFrame=j.CFrame:lerp(CV.Value*CFrame.new(-0.05*math.cos(sn/8),0,0)*CFrame.fromOrientation(math.rad(0), math.rad(0), math.rad(-2*math.cos(sn/8))),lerpspeed)
							elseif j.Name == "LegR" then
								j.CFrame=j.CFrame:lerp(CV.Value*CFrame.new(-0.1-0.08*math.cos(sn/8),0,0)*CFrame.fromOrientation(math.rad(0), math.rad(5+2.5*math.cos(sn/8)), math.rad(0)),lerpspeed)
							elseif j.Name == "Bone" then
								j.CFrame=j.CFrame:lerp(CV.Value*CFrame.fromOrientation(math.rad(14*math.sin(sn/8)), math.rad(0), math.rad(0)),lerpspeed)
							elseif j.Name == "Bone.001" then
								j.CFrame=j.CFrame:lerp(CV.Value*CFrame.fromOrientation(math.rad(12*math.cos(sn/8)), math.rad(0), math.rad(0)),lerpspeed)
							elseif j.Name == "Bone.002" then
								j.CFrame=j.CFrame:lerp(CV.Value*CFrame.fromOrientation(math.rad(9*math.sin(sn/8)), math.rad(0), math.rad(0)),lerpspeed)
							elseif j.Name == "Bone.003" then
								j.CFrame=j.CFrame:lerp(CV.Value*CFrame.fromOrientation(math.rad(7*math.cos(sn/8)), math.rad(0), math.rad(0)),lerpspeed)
							else
								j.CFrame=j.CFrame:lerp(CV.Value,lerpspeed)
							end

						end
					end
				end
			end)
		end
		pcall(function() kf.ST.Enabled = true end)
		if not falling then
			pcall(function()
				local EasingStyle= Enum.EasingStyle.Quad local EasingDirection=Enum.EasingDirection.Out
				local speedd=0.5
				local lerpspeed=0.2
				local conn
				local CVjoints={}
				local CVtweens={}
				for _, j in pairs(MonaJoints) do
					pcall(function()
						local cf=Instance.new("CFrameValue") cf.Value=j.CFrame cf.Name=j.Name
						table.insert(CVjoints,cf)
					end)
				end
				for _, Joints in pairs(MAnim["Manims"]["SmashPrepare"]["RootPart"]["Trans"]:GetDescendants()) do 
					pcall(function()
						if Joints:IsA("Bone") then
							for i, v in ipairs(CVjoints) do
								if Joints.Name == v.Name then
									local tween=CreateTween(v, { speedd, EasingStyle, EasingDirection, 0, false, 0 }, {Value=CFrame.new(Joints.Position)*OrienRad(Joints.Orientation.X,Joints.Orientation.Y,Joints.Orientation.Z)}, true)
									table.insert(CVtweens,tween)
								end
							end
						end
					end)
				end
				conn=game:GetService("RunService").Heartbeat:Connect(function(dt) 
					anim(MonaJoints,CVjoints,lerpspeed)
				end)
				CVtweens[1].Completed:Wait()
				if conn then
					conn:Disconnect()
				end
			end)
		end
		repeat local endd=Mouse.Hit*CFrame.new(0,1.2,0).p if (mainpos.Position - endd).magnitude > 9500 then break end di=false task.wait()
			local OriginFrame = mainpos.p
			local OriginFrameNegative = (mainpos * CFrame.new(0,  40, 0)).Position
			spawn(function()
				local lPos=mainpos:PointToObjectSpace(endd)
				local theta=math.clamp(math.atan2(lPos.x, lPos.z), -math.rad(90), math.rad(90))
				mainpos=mainpos*CFrame.new(0,0,0)*CFrame.fromEulerAnglesYXZ(0,theta,0)
				local x, y, z=mainpos:ToEulerAnglesXYZ() 
				sidemoves=CFrame.Angles(x,y,z)
				for i = 0, 1, 0.025 do task.wait()
					pcall(function()
						Mpos = Quadratic(OriginFrame,OriginFrameNegative,endd,i)
						pcall(function()
							pcall(function()							
								mainpos=CFrame.new(Mpos)*sidemoves
								mainposba=mainpos
							end)
						end)
					end)
				end
				di=true
			end)
			pcall(function()
				local EasingStyle= Enum.EasingStyle.Quad local EasingDirection=Enum.EasingDirection.Out
				local speedd=0.095
				local lerpspeed=0.4
				local conn
				local CVjoints={}
				local CVtweens={}
				for _, j in pairs(MonaJoints) do
					pcall(function()
						local cf=Instance.new("CFrameValue") cf.Value=j.CFrame cf.Name=j.Name
						table.insert(CVjoints,cf)
					end)
				end
				for _, Joints in pairs(MAnim["Manims"]["SmashAir1"]["RootPart"]["Trans"]:GetDescendants()) do 
					pcall(function()
						if Joints:IsA("Bone") then
							for i, v in ipairs(CVjoints) do
								if Joints.Name == v.Name then
									local tween=CreateTween(v, { speedd, EasingStyle, EasingDirection, 0, false, 0 }, {Value=CFrame.new(Joints.Position)*OrienRad(Joints.Orientation.X,Joints.Orientation.Y,Joints.Orientation.Z)}, true)
									table.insert(CVtweens,tween)
								end
							end
						end
					end)
				end
				conn=game:GetService("RunService").Heartbeat:Connect(function(dt) 
					anim(MonaJoints,CVjoints,lerpspeed)
				end)
				CVtweens[1].Completed:Wait()
				if conn then
					conn:Disconnect()
				end
			end)
			pcall(function()
				local EasingStyle= Enum.EasingStyle.Quad  local EasingDirection=Enum.EasingDirection.Out
				local speedd=0.1
				local lerpspeed=0.3
				local conn
				local CVjoints={}
				local CVtweens={}
				for _, j in pairs(MonaJoints) do
					pcall(function()
						local cf=Instance.new("CFrameValue") cf.Value=j.CFrame cf.Name=j.Name
						table.insert(CVjoints,cf)
					end)
				end
				for _, Joints in pairs(MAnim["Manims"]["SmashAir2"]["RootPart"]["Trans"]:GetDescendants()) do 
					pcall(function()
						if Joints:IsA("Bone") then
							for i, v in ipairs(CVjoints) do
								if Joints.Name == v.Name then
									local tween=CreateTween(v, { speedd, EasingStyle, EasingDirection, 0, false, 0 }, {Value=CFrame.new(Joints.Position)*OrienRad(Joints.Orientation.X,Joints.Orientation.Y,Joints.Orientation.Z)}, true)
									table.insert(CVtweens,tween)
								end
							end
						end
					end)
				end
				conn=game:GetService("RunService").Heartbeat:Connect(function(dt) 
					anim(MonaJoints,CVjoints,lerpspeed)
				end)
				CVtweens[1].Completed:Wait()
				if conn then
					conn:Disconnect()
				end
			end)
			pcall(function()
				local EasingStyle= Enum.EasingStyle.Quad  local EasingDirection=Enum.EasingDirection.Out
				local speedd=0.12
				local lerpspeed=0.3
				local conn
				local CVjoints={}
				local CVtweens={}
				for _, j in pairs(MonaJoints) do
					pcall(function()
						local cf=Instance.new("CFrameValue") cf.Value=j.CFrame cf.Name=j.Name
						table.insert(CVjoints,cf)
					end)
				end
				for _, Joints in pairs(MAnim["Manims"]["SmashAir3"]["RootPart"]["Trans"]:GetDescendants()) do 
					pcall(function()
						if Joints:IsA("Bone") then
							for i, v in ipairs(CVjoints) do
								if Joints.Name == v.Name then
									local tween=CreateTween(v, { speedd, EasingStyle, EasingDirection, 0, false, 0 }, {Value=CFrame.new(Joints.Position)*OrienRad(Joints.Orientation.X,Joints.Orientation.Y,Joints.Orientation.Z)}, true)
									table.insert(CVtweens,tween)
								end
							end
						end
					end)
				end
				conn=game:GetService("RunService").Heartbeat:Connect(function(dt) 
					anim(MonaJoints,CVjoints,lerpspeed)
				end)
				CVtweens[1].Completed:Wait()
				if conn then
					conn:Disconnect()
				end
			end)
			pcall(function()
				local EasingStyle= Enum.EasingStyle.Quad  local EasingDirection=Enum.EasingDirection.Out
				local speedd=0.12
				local lerpspeed=0.2
				local conn
				local CVjoints={}
				local CVtweens={}
				for _, j in pairs(MonaJoints) do
					pcall(function()
						local cf=Instance.new("CFrameValue") cf.Value=j.CFrame cf.Name=j.Name
						table.insert(CVjoints,cf)
					end)
				end
				for _, Joints in pairs(MAnim["Manims"]["SmashAir4"]["RootPart"]["Trans"]:GetDescendants()) do 
					pcall(function()
						if Joints:IsA("Bone") then
							for i, v in ipairs(CVjoints) do
								if Joints.Name == v.Name then
									local tween=CreateTween(v, { speedd, EasingStyle, EasingDirection, 0, false, 0 }, {Value=CFrame.new(Joints.Position)*OrienRad(Joints.Orientation.X,Joints.Orientation.Y,Joints.Orientation.Z)}, true)
									table.insert(CVtweens,tween)
								end
							end
						end
					end)
				end
				conn=game:GetService("RunService").Heartbeat:Connect(function(dt) 
					anim(MonaJoints,CVjoints,lerpspeed)
				end)
				CVtweens[1].Completed:Wait()
				if conn then
					conn:Disconnect()
				end
			end)
			pcall(function()
				local EasingStyle= Enum.EasingStyle.Quad  local EasingDirection=Enum.EasingDirection.Out
				local speedd=0.14
				local lerpspeed=0.2
				local conn
				local CVjoints={}
				local CVtweens={}
				for _, j in pairs(MonaJoints) do
					pcall(function()
						local cf=Instance.new("CFrameValue") cf.Value=j.CFrame cf.Name=j.Name
						table.insert(CVjoints,cf)
					end)
				end
				for _, Joints in pairs(MAnim["Manims"]["SmashAir5"]["RootPart"]["Trans"]:GetDescendants()) do 
					pcall(function()
						if Joints:IsA("Bone") then
							for i, v in ipairs(CVjoints) do
								if Joints.Name == v.Name then
									local tween=CreateTween(v, { speedd, EasingStyle, EasingDirection, 0, false, 0 }, {Value=CFrame.new(Joints.Position)*OrienRad(Joints.Orientation.X,Joints.Orientation.Y,Joints.Orientation.Z)}, true)
									table.insert(CVtweens,tween)
								end
							end
						end
					end)
				end
				conn=game:GetService("RunService").Heartbeat:Connect(function(dt) 
					anim(MonaJoints,CVjoints,lerpspeed)
				end)
				CVtweens[1].Completed:Wait()
				if not di then repeat task.wait() until di == true end
				if conn then
					conn:Disconnect()
				end
			end)
			di=false
			task.spawn(function() --attack 
				local laspos = mainposba
				for i = 1, math.random(8,15) do
					pcall(function()
						local P=Instance.new("Part",workspace.Terrain) P.Transparency=1 P.Anchored=true P.Size=Vector3.new(0.050000000745058, 0.050000000745058, 0.050000000745058) P.CanCollide=false P.CFrame=CFrame.new(10000,10000,10000)
						local A1=Instance.new("Attachment",P) A1.WorldCFrame=CFrame.new(laspos.p)*CFrame.new(math.random(-50,50),math.random(-5,-3),math.random(-50,50)) local v1=imstuff["Facility"]["imp"]:Clone() v1.Parent=A1
						v1:Emit(12)
						game:GetService("Debris"):AddItem(P,0.6)
					end)
				end
				pcall(function()
					local P=Instance.new("Part",workspace.Terrain) P.Transparency=1 P.Anchored=true P.Size=Vector3.new(0.050000000745058, 0.050000000745058, 0.050000000745058) P.CanCollide=false P.CFrame=CFrame.new(10000,10000,10000)
					local A1=Instance.new("Attachment",P) A1.WorldCFrame=CFrame.new(laspos.p)*OrienRad(0,math.random(-190,190),0) local v1=imstuff["Facility"]["F2"]:Clone() v1.Parent=A1 local v2=imstuff["Facility"]["F1"]:Clone() v2.Parent=A1 local v3=imstuff["Facility"]["F3"]:Clone() v3.Parent=A1  local v4=imstuff["Facility"]["F4"]:Clone() v4.Parent=A1  local v5=imstuff["Facility"]["SQ"]:Clone() v5.Parent=A1 
					NewBeamRing(CFrame.new(laspos.Position),1,15,5,0,Color3.new(0.101961, 1, 0.776471),40,1,90,1,Color3.new(0.482353, 0.0627451, 0.996078),1,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out)
					local S = randomSoundNR(SSOQue,SSOQue2,SSOCurrent) if S[2] == true then if SSOCurrent == SSOQue then SSOCurrent=SSOQue2 elseif SSOCurrent == SSOQue2 then SSOCurrent=SSOQue end end
					syncSound({SoundId="rbxassetid://"..S[1],Volume=6,PlayOnRemove=true,TimePosition=0,Pitch=math.random(8, 9)/math.random(8,9),Parent=kf.Attachment2})
					syncSound({SoundId="rbxassetid://7657166277",Volume=7,PlayOnRemove=true,TimePosition=0,Pitch=math.random(8, 9)/math.random(8,9),Parent=kf.Attachment2})
					syncSound({SoundId="rbxassetid://7626312849",Volume=6,PlayOnRemove=true,TimePosition=0,Pitch=math.random(8, 9)/math.random(8,9),Parent=kf.Attachment2})
					v1:Emit(15) v2:Emit(15) v3:Emit(15) v4:Emit(15) v5:Emit(15) 
					CamShake(laspos,85,.55,.1)
					game:GetService("Debris"):AddItem(P,6)
					pcall(function() --hit
						for _,a in next,reg(laspos.p,30-2,{mmodel,soundpart,effectmodel,humanModel,(followchar and plr.Character or mmodel)})[1] do 
							if (a.Parent ~= mmodel and a.Parent ~= effectmodel and a ~= mmodel and a ~= effectmodel and a ~= soundpart and a.Parent ~= soundpart and a ~= script and a.Parent ~= script) and a.ClassName == "Part" or a.ClassName == "MeshPart" or a.ClassName == "TrussPart" or a.ClassName == "WedgePart" or a.ClassName == "CornerWedgePart" or a.ClassName == "UnionOperation" or a.ClassName == "NegateOperation" or a.ClassName == "Seat" or a.ClassName == "VehicleSeat" or a.ClassName == "FlagStand" or a.ClassName == "SpawnLocation" then
								if a.Parent ~= nil and a.Parent ~= workspace and a.Parent:IsA("Model") and a.Parent.ClassName == "Model" and a.Size == Vector3.new(2,2,1) or a.Size == Vector3.new(2,2.1,1) or a.Size == Vector3.new(1,1.105,1) or a.Size == Vector3.new(1,1.227,1) or a.Size == Vector3.new(1,1.253,1) or a.Size == Vector3.new(1,1.277,1) or a.Size == Vector3.new(1,2,1) or a.Size == Vector3.new(2,1,1) or a.Name == "Head" or a.Name == "Torso" or a.Name == "Right Arm" or a.Name == "Left Arm" or a.Name == "Right Leg" or a.Name == "Left Leg" or a.Name == "UpperTorso" or a.Name == "HumanoidRootPart" or a.Name == "LowerTorso" or a.Name == "RightHand" or a.Name == "LeftHand" or a.Name == "RightFoot" or a.Name == "LeftFoot" or a.Name == "LeftUpperArm" or a.Name == "LeftLowerArm" or a.Name == "RightUpperArm" or a.Name == "RightLowerArm" or a.Name == "LeftUpperLeg" or a.Name == "LeftLowerLeg" or a.Name == "RightUpperLeg" or a.Name == "RightLowerLeg" then
									if (a.Position - laspos.p).Magnitude <= 30+a.Size.Magnitude then
										local mainpart=(a.Parent:FindFirstChildOfClass'Part' or a.Parent:FindFirstChildOfClass'MeshPart' or a.Parent:FindFirstChildOfClass'UnionOperation') 
										local hum=(a.Parent:FindFirstChildOfClass'Humanoid' or nil)
										pcall(function() if mainpart.Parent==workspace then mainpart=a end
											local P=Instance.new("Part",workspace.Terrain) P.Transparency=1 P.Anchored=true P.Size=Vector3.new(0.050000000745058, 0.050000000745058, 0.050000000745058) P.CanCollide=false  
											P.CFrame=CFrame.new(10000,10000,10000)
											local A1=Instance.new("Attachment",P) A1.WorldCFrame=CFrame.new(mainpart.CFrame.p)*CFrame.new(math.random(-2,2),math.random(-2,2),math.random(-2,2)) local v1=imstuff["Facility"]["m1"]:Clone() v1.Parent=A1 local v2=imstuff["Facility"]["m2"]:Clone() v2.Parent=A1 local v3=imstuff["Facility"]["m3"]:Clone() v3.Parent=A1 local v4=imstuff["Facility"]["m4"]:Clone() v4.Parent=A1 
											game:GetService("Debris"):AddItem(P,2)
											syncSound({SoundId="rbxassetid://"..bodyimpact[math.random(1,#bodyimpact)],Volume=0.9,PlayOnRemove=true,TimePosition=0.01,Pitch=math.random(8, 10)/math.random(9,13),Parent=A1})
											CamShake(mainpart.CFrame,35,.75,.05)
											v1:Emit(30) v2:Emit(30) v3:Emit(30) v4:Emit(30) 
											if hum and hum.Health >= 1 and hum.MaxHealth<100000 then 
												hum.Health=hum.Health-math.random(1,3+Power)
												if mainpart.Anchored ~= true then
													a.RotVelocity = CFrame.new(laspos.p, a.Position).LookVector * 55
													a.Velocity = CFrame.new(laspos.p, a.Position).LookVector * 55 
												end
											else
												if mainpart.Anchored ~= true then
													a.RotVelocity = CFrame.new(laspos.p, a.Position).LookVector * 55
													a.Velocity = CFrame.new(laspos.p, a.Position).LookVector * 55 
												end
												if math.random(1,(mainpart==a and 13 or 1)) == 1 then
													if math.random(1,2) == 1 then
														sideeffect(mainpart)
													else
														effect(
															false,
															{CFrame = mainpart.CFrame,Size=mainpart.Size,Material="Glass",Color=mainpart.Color,Anchored=true,CanCollide=false,Transparency=0,Reflectance=-15}, --part proper
															{Scale=Vector3.new(),MeshType="Sphere"},
															{
																{--1
																	dely=math.random(1,5)/math.random(5,8),
																	info={0.8,Enum.EasingStyle.Elastic,Enum.EasingDirection.InOut},
																	part={Transparency=0,CFrame=mainpart.CFrame*CFrame.new(math.random(-1,1),math.random(-1,1),math.random(-1,1)),Color=Color3.fromRGB(108, 214, 147),Reflectance=15}
																},
																{--2
																	dely=0,
																	info={0.3,Enum.EasingStyle.Linear,Enum.EasingDirection.Out},
																	part={Transparency=0,CFrame=mainpart.CFrame*CFrame.new(math.random(-3,3),math.random(-3,3),math.random(-3,3))*CFrame.Angles(math.random(-80,80),math.random(-80,80),math.random(-80,80)),Color=Color3.fromRGB(108, 214, 147),Reflectance=-15}
																},
																{--3
																	acc={vdec=CFrame.new(math.random(-1,1)/1555,math.random(-1,1)/1555,math.random(-1,1)/1555),vel=CFrame.new(0,0,0)*CFrame.Angles(math.random(1,2)/math.random(45,65),math.random(1,2)/math.random(45,65),math.random(1,2)/math.random(45,65))},
																	info={5.8,Enum.EasingStyle.Elastic,Enum.EasingDirection.InOut},
																	mesh={Scale=Vector3.new(0,0,0)},
																	part={Transparency=1,Size=Vector3.new(0,0,0),Color=Color3.fromRGB(),Reflectance=7}
																}
															}
														)
													end
													syncSound({SoundId="rbxassetid://3748209678",Volume=4.5,PlayOnRemove=true,TimePosition=0,Pitch=math.random(8, 10)/math.random(5, 10),Parent=mainpart}) mainpart:Destroy()
												end	
											end
										end) 
									end
								end
							end;
						end
					end)
					if Power > 2 then 
						for i = 1, (Power-1<5 and Power-1 or 4) do 
							cur(CFrame.new(laspos.p)*CFrame.new(math.random(-(Power<5 and Power*2 or 10)*2,(Power<5 and Power*2 or 10)*2),-1.8,math.random(-(Power<5 and Power*2 or 10)*2,(Power<5 and Power*2 or 10)*2)),true)
							task.wait()
						end
					end
					if saidle then 
						NewBeamRing2(CFrame.new(laspos.Position)*CFrame.new(0,-1.4,0),1,1,-50,0,Color3.new(1, 0.415686, 0),300,1,-50,1,Color3.new(0.545098, 0.815686, 0.815686),10,Enum.EasingStyle.Quad,Enum.EasingDirection.Out)
					end
				end)
			end) 
		until keyhold==false or (mainpos.Position - Mouse.Hit.p).magnitude > 9500
		if not di then
			pcall(function()
				local EasingStyle= Enum.EasingStyle.Quad local EasingDirection=Enum.EasingDirection.InOut
				local speedd=0.11
				local lerpspeed=1
				local conn
				local CVjoints={}
				local CVtweens={}
				for _, j in pairs(MonaJoints) do
					pcall(function()
						local cf=Instance.new("CFrameValue") cf.Value=j.CFrame cf.Name=j.Name
						table.insert(CVjoints,cf)
					end)
				end
				for _, Joints in pairs(MAnim["Manims"]["SmashAir6"]["RootPart"]["Trans"]:GetDescendants()) do 
					pcall(function()
						if Joints:IsA("Bone") then
							for i, v in ipairs(CVjoints) do
								if Joints.Name == v.Name then
									local tween=CreateTween(v, { speedd, EasingStyle, EasingDirection, 0, false, 0 }, {Value=CFrame.new(Joints.Position)*OrienRad(Joints.Orientation.X,Joints.Orientation.Y,Joints.Orientation.Z)}, true)
									table.insert(CVtweens,tween)
								end
							end
						end
					end)
				end
				conn=game:GetService("RunService").Heartbeat:Connect(function(dt) 
					pcall(function() 
						for _, j in pairs(MonaJoints) do
							for _, CV in pairs(CVjoints) do
								if j.Name == CV.Name then
									if j.Name == "Neck" then
										j.CFrame=j.CFrame:lerp(CV.Value*CFrame.fromOrientation(math.rad(3*math.sin(sn/8)), math.rad(0), math.rad(0)),lerpspeed)
									elseif j.Name == "LegL" then
										j.CFrame=j.CFrame:lerp(CV.Value*CFrame.new(-0.05*math.cos(sn/8),0,0)*CFrame.fromOrientation(math.rad(0), math.rad(0), math.rad(-2*math.cos(sn/8))),lerpspeed)
									elseif j.Name == "LegR" then
										j.CFrame=j.CFrame:lerp(CV.Value*CFrame.new(-0.1-0.08*math.cos(sn/8),0,0)*CFrame.fromOrientation(math.rad(0), math.rad(5+2.5*math.cos(sn/8)), math.rad(0)),lerpspeed)
									elseif j.Name == "Bone" then
										j.CFrame=j.CFrame:lerp(CV.Value*CFrame.fromOrientation(math.rad(14*math.sin(sn/8)), math.rad(0), math.rad(0)),lerpspeed)
									elseif j.Name == "Bone.001" then
										j.CFrame=j.CFrame:lerp(CV.Value*CFrame.fromOrientation(math.rad(12*math.cos(sn/8)), math.rad(0), math.rad(0)),lerpspeed)
									elseif j.Name == "Bone.002" then
										j.CFrame=j.CFrame:lerp(CV.Value*CFrame.fromOrientation(math.rad(9*math.sin(sn/8)), math.rad(0), math.rad(0)),lerpspeed)
									elseif j.Name == "Bone.003" then
										j.CFrame=j.CFrame:lerp(CV.Value*CFrame.fromOrientation(math.rad(7*math.cos(sn/8)), math.rad(0), math.rad(0)),lerpspeed)
									else
										j.CFrame=j.CFrame:lerp(CV.Value,lerpspeed)
									end
								end
							end
						end
					end)
				end)
				CVtweens[1].Completed:Wait()
				if conn then
					conn:Disconnect()
				end
			end)
		end
		pcall(function()
			kf.ST.Enabled = false  
		end)
		pcall(function()
			local EasingStyle= Enum.EasingStyle.Exponential local EasingDirection=Enum.EasingDirection.InOut
			local speedd=0.7
			local lerpspeed=0.7
			local conn
			local CVjoints={}
			local CVtweens={}
			local goal = false
			local Wherecf=Instance.new("CFrameValue") Wherecf.Value=mainpos
			for _, j in pairs(MonaJoints) do
				pcall(function()
					local cf=Instance.new("CFrameValue") cf.Value=j.CFrame cf.Name=j.Name
					table.insert(CVjoints,cf)
				end)
			end
			for _, Joints in pairs(MAnim["Manims"]["IdleB"]["RootPart"]["Trans"]:GetDescendants()) do 
				pcall(function()
					if Joints:IsA("Bone") then
						for i, v in ipairs(CVjoints) do
							if Joints.Name == v.Name then
								local tween=CreateTween(v, { speedd, EasingStyle, EasingDirection, 0, false, 0 }, {Value=CFrame.new(Joints.Position)*OrienRad(Joints.Orientation.X,Joints.Orientation.Y,Joints.Orientation.Z)}, true)
								table.insert(CVtweens,tween)
							end
						end
					end
				end)
			end
			conn=game:GetService("RunService").Heartbeat:Connect(function(dt) 
				pcall(function() 
					for _, j in pairs(MonaJoints) do
						for _, CV in pairs(CVjoints) do
							if j.Name == CV.Name then
								if j.Name == "ShoulderL" then
									j.CFrame=j.CFrame:lerp(CV.Value*CFrame.fromOrientation(math.rad(math.rad(25*math.cos(sn/11))),math.rad(0), math.rad(5*math.cos(sn/11))),lerpspeed) 
								elseif j.Name == "ShoulderR" then
									j.CFrame=j.CFrame:lerp(CV.Value*CFrame.fromOrientation(math.rad(math.rad(25*math.cos(sn/1))),math.rad(0), math.rad(5*math.cos(sn/12))),lerpspeed)
								elseif j.Name == "Neck" then
									j.CFrame=j.CFrame:lerp(CV.Value*CFrame.fromOrientation(math.rad(3*math.sin(sn/8)), math.rad(0), math.rad(0)),lerpspeed)
								elseif j.Name == "Waist" then
									j.CFrame=j.CFrame:lerp(CV.Value*CFrame.fromOrientation(math.rad(3*math.cos(sn/8)), math.rad(1.5*math.cos(sn/10)), math.rad(1.5*math.cos(sn/9))),lerpspeed)
								elseif j.Name == "LegL" then
									j.CFrame=j.CFrame:lerp(CV.Value*CFrame.new(-0.05*math.cos(sn/8),0,0)*CFrame.fromOrientation(math.rad(0), math.rad(0), math.rad(-2*math.cos(sn/8))),lerpspeed)
								elseif j.Name == "LegR" then
									j.CFrame=j.CFrame:lerp(CV.Value*CFrame.new(-0.1-0.08*math.cos(sn/8),0,0)*CFrame.fromOrientation(math.rad(0), math.rad(5+2.5*math.cos(sn/8)), math.rad(0)),lerpspeed)
								elseif j.Name == "Bone" then
									j.CFrame=j.CFrame:lerp(CV.Value*CFrame.fromOrientation(math.rad(14*math.sin(sn/8)), math.rad(0), math.rad(0)),lerpspeed)
								elseif j.Name == "Bone.001" then
									j.CFrame=j.CFrame:lerp(CV.Value*CFrame.fromOrientation(math.rad(12*math.cos(sn/8)), math.rad(0), math.rad(0)),lerpspeed)
								elseif j.Name == "Bone.002" then
									j.CFrame=j.CFrame:lerp(CV.Value*CFrame.fromOrientation(math.rad(9*math.sin(sn/8)), math.rad(0), math.rad(0)),lerpspeed)
								elseif j.Name == "Bone.003" then
									j.CFrame=j.CFrame:lerp(CV.Value*CFrame.fromOrientation(math.rad(7*math.cos(sn/8)), math.rad(0), math.rad(0)),lerpspeed)
								else
									j.CFrame=j.CFrame:lerp(CV.Value,0.06)
								end 

							end
						end
					end
				end)
			end)
			local function ewait(n)
				if not n or n == nil then n=0 end
				local d,hb =0,game:GetService("RunService").Heartbeat 
				repeat d=d+hb:Wait() if keyclicked or falling then break end until d>=n
				return d
			end
			ewait(0.7)
			if conn then
				conn:Disconnect()
			end
		end)
		attacking=false movementfalse=false 
	end)))
end


function BookCurs()
	coroutine.resume(Add(coroutine.create(function()
		attacking=true movementfalse=true nowalk=true fallingspeed=0 local stopall = false swordphase=true local di = false
		local function anim(MonaJoints,CVjoints,lerpspeed)
			pcall(function() 
				for _, j in pairs(MonaJoints) do
					for _, CV in pairs(CVjoints) do
						if j.Name == CV.Name then
							if j.Name == "ShoulderL" then
								j.CFrame=j.CFrame:lerp(CV.Value*CFrame.fromOrientation(math.rad(math.rad(25*math.cos(sn/11))),math.rad(0), math.rad(5*math.cos(sn/11))),lerpspeed) 
							elseif j.Name == "ShoulderR" then
								j.CFrame=j.CFrame:lerp(CV.Value*CFrame.fromOrientation(math.rad(math.rad(25*math.cos(sn/1))),math.rad(0), math.rad(5*math.cos(sn/12))),lerpspeed)
							elseif j.Name == "Neck" then
								j.CFrame=j.CFrame:lerp(CV.Value*CFrame.fromOrientation(math.rad(3*math.sin(sn/8)), math.rad(0), math.rad(0)),lerpspeed)
							elseif j.Name == "Waist" then
								j.CFrame=j.CFrame:lerp(CV.Value*CFrame.fromOrientation(math.rad(3*math.cos(sn/8)), math.rad(1.5*math.cos(sn/10)), math.rad(1.5*math.cos(sn/9))),lerpspeed)
							elseif j.Name == "LegL" then
								j.CFrame=j.CFrame:lerp(CV.Value*CFrame.new(-0.05*math.cos(sn/8),0,0)*CFrame.fromOrientation(math.rad(0), math.rad(0), math.rad(-2*math.cos(sn/8))),lerpspeed)
							elseif j.Name == "LegR" then
								j.CFrame=j.CFrame:lerp(CV.Value*CFrame.new(-0.1-0.08*math.cos(sn/8),0,0)*CFrame.fromOrientation(math.rad(0), math.rad(5+2.5*math.cos(sn/8)), math.rad(0)),lerpspeed)
							elseif j.Name == "Bone" then
								j.CFrame=j.CFrame:lerp(CV.Value*CFrame.fromOrientation(math.rad(14*math.sin(sn/8)), math.rad(0), math.rad(0)),lerpspeed)
							elseif j.Name == "Bone.001" then
								j.CFrame=j.CFrame:lerp(CV.Value*CFrame.fromOrientation(math.rad(12*math.cos(sn/8)), math.rad(0), math.rad(0)),lerpspeed)
							elseif j.Name == "Bone.002" then
								j.CFrame=j.CFrame:lerp(CV.Value*CFrame.fromOrientation(math.rad(9*math.sin(sn/8)), math.rad(0), math.rad(0)),lerpspeed)
							elseif j.Name == "Bone.003" then
								j.CFrame=j.CFrame:lerp(CV.Value*CFrame.fromOrientation(math.rad(7*math.cos(sn/8)), math.rad(0), math.rad(0)),lerpspeed)
							else
								j.CFrame=j.CFrame:lerp(CV.Value,0.06)
							end

						end
					end
				end
			end)
		end
		pcall(function()
			local EasingStyle= Enum.EasingStyle.Circular local EasingDirection=Enum.EasingDirection.Out
			local speedd=0.4
			local lerpspeed=1
			local conn
			local CVjoints={}
			local CVtweens={}
			for _, j in pairs(MonaJoints) do
				pcall(function()
					local cf=Instance.new("CFrameValue") cf.Value=j.CFrame cf.Name=j.Name
					table.insert(CVjoints,cf)
				end)
			end
			for _, Joints in pairs(MAnim["Manims"]["summun1"]["RootPart"]["Trans"]:GetDescendants()) do 
				pcall(function()
					if Joints:IsA("Bone") then
						for i, v in ipairs(CVjoints) do
							if Joints.Name == v.Name then
								local tween=CreateTween(v, { speedd, EasingStyle, EasingDirection, 0, false, 0 }, {Value=CFrame.new(Joints.Position)*OrienRad(Joints.Orientation.X,Joints.Orientation.Y,Joints.Orientation.Z)}, true)
								table.insert(CVtweens,tween)
							end
						end
					end
				end)
			end
			conn=game:GetService("RunService").Heartbeat:Connect(function(dt) 
				anim(MonaJoints,CVjoints,lerpspeed)
			end)
			CVtweens[1].Completed:Wait()
			task.wait(0.3)
			if conn then
				conn:Disconnect()
			end
		end)
		di=true
		pcall(function()
			local EasingStyle= Enum.EasingStyle.Sine local EasingDirection=Enum.EasingDirection.InOut
			local speedd=0.5
			local lerpspeed=0.7
			local conn
			local CVjoints={}
			local CVtweens={}
			local goal = false
			local Wherecf=Instance.new("CFrameValue") Wherecf.Value=mainpos
			for _, j in pairs(MonaJoints) do
				pcall(function()
					local cf=Instance.new("CFrameValue") cf.Value=j.CFrame cf.Name=j.Name
					table.insert(CVjoints,cf)
				end)
			end
			for _, Joints in pairs(MAnim["Manims"]["IdleB"]["RootPart"]["Trans"]:GetDescendants()) do 
				pcall(function()
					if Joints:IsA("Bone") then
						for i, v in ipairs(CVjoints) do
							if Joints.Name == v.Name then
								local tween=CreateTween(v, { speedd, EasingStyle, EasingDirection, 0, false, 0 }, {Value=CFrame.new(Joints.Position)*OrienRad(Joints.Orientation.X,Joints.Orientation.Y,Joints.Orientation.Z)}, true)
								table.insert(CVtweens,tween)
							end
						end
					end
				end)
			end
			conn=game:GetService("RunService").Heartbeat:Connect(function(dt) 
				anim(MonaJoints,CVjoints,lerpspeed)
			end)
			local function ewait(n)
				if not n or n == nil then n=0 end
				local d,hb =0,game:GetService("RunService").Heartbeat 
				repeat d=d+hb:Wait() if keyclicked then break end until d>=n
				return d
			end
			ewait(0.5)
			if conn then
				conn:Disconnect()
			end
		end)
		attacking=false movementfalse=false 
	end)))
end

function bigfinal()
	coroutine.resume(Add(coroutine.create(function()
		attacking=true movementfalse=true nowalk=true fallingspeed=0 local stopall = false swordphase=true local di = false
		local function anim(MonaJoints,CVjoints,lerpspeed)
			pcall(function() 
				for _, j in pairs(MonaJoints) do
					for _, CV in pairs(CVjoints) do
						if j.Name == CV.Name then
							if j.Name == "ShoulderL" then
								j.CFrame=j.CFrame:lerp(CV.Value*CFrame.fromOrientation(math.rad(math.rad(25*math.cos(sn/11))),math.rad(0), math.rad(5*math.cos(sn/11))),lerpspeed) 
							elseif j.Name == "ShoulderR" then
								j.CFrame=j.CFrame:lerp(CV.Value*CFrame.fromOrientation(math.rad(math.rad(25*math.cos(sn/1))),math.rad(0), math.rad(5*math.cos(sn/12))),lerpspeed)
							elseif j.Name == "Neck" then
								j.CFrame=j.CFrame:lerp(CV.Value*CFrame.fromOrientation(math.rad(3*math.sin(sn/8)), math.rad(0), math.rad(0)),lerpspeed)
							elseif j.Name == "Waist" then
								j.CFrame=j.CFrame:lerp(CV.Value*CFrame.fromOrientation(math.rad(3*math.cos(sn/8)), math.rad(1.5*math.cos(sn/10)), math.rad(1.5*math.cos(sn/9))),lerpspeed)
							elseif j.Name == "LegL" then
								j.CFrame=j.CFrame:lerp(CV.Value*CFrame.new(-0.05*math.cos(sn/8),0,0)*CFrame.fromOrientation(math.rad(0), math.rad(0), math.rad(-2*math.cos(sn/8))),lerpspeed)
							elseif j.Name == "LegR" then
								j.CFrame=j.CFrame:lerp(CV.Value*CFrame.new(-0.1-0.08*math.cos(sn/8),0,0)*CFrame.fromOrientation(math.rad(0), math.rad(5+2.5*math.cos(sn/8)), math.rad(0)),lerpspeed)
							elseif j.Name == "Bone" then
								j.CFrame=j.CFrame:lerp(CV.Value*CFrame.fromOrientation(math.rad(14*math.sin(sn/8)), math.rad(0), math.rad(0)),lerpspeed)
							elseif j.Name == "Bone.001" then
								j.CFrame=j.CFrame:lerp(CV.Value*CFrame.fromOrientation(math.rad(12*math.cos(sn/8)), math.rad(0), math.rad(0)),lerpspeed)
							elseif j.Name == "Bone.002" then
								j.CFrame=j.CFrame:lerp(CV.Value*CFrame.fromOrientation(math.rad(9*math.sin(sn/8)), math.rad(0), math.rad(0)),lerpspeed)
							elseif j.Name == "Bone.003" then
								j.CFrame=j.CFrame:lerp(CV.Value*CFrame.fromOrientation(math.rad(7*math.cos(sn/8)), math.rad(0), math.rad(0)),lerpspeed)
							else
								j.CFrame=j.CFrame:lerp(CV.Value,0.06)
							end

						end
					end
				end
			end)
		end
		pcall(function()
			local EasingStyle= Enum.EasingStyle.Circular local EasingDirection=Enum.EasingDirection.Out
			local speedd=0.4
			local lerpspeed=1
			local conn
			local CVjoints={}
			local CVtweens={}
			for _, j in pairs(MonaJoints) do
				pcall(function()
					local cf=Instance.new("CFrameValue") cf.Value=j.CFrame cf.Name=j.Name
					table.insert(CVjoints,cf)
				end)
			end
			for _, Joints in pairs(MAnim["Manims"]["summun1"]["RootPart"]["Trans"]:GetDescendants()) do 
				pcall(function()
					if Joints:IsA("Bone") then
						for i, v in ipairs(CVjoints) do
							if Joints.Name == v.Name then
								local tween=CreateTween(v, { speedd, EasingStyle, EasingDirection, 0, false, 0 }, {Value=CFrame.new(Joints.Position)*OrienRad(Joints.Orientation.X,Joints.Orientation.Y,Joints.Orientation.Z)}, true)
								table.insert(CVtweens,tween)
							end
						end
					end
				end)
			end
			conn=game:GetService("RunService").Heartbeat:Connect(function(dt) 
				anim(MonaJoints,CVjoints,lerpspeed)
			end)
			CVtweens[1].Completed:Wait()
			task.wait(0.3)
			if conn then
				conn:Disconnect()
			end
		end)
		di=true
		task.spawn(function() local finsi=false local loca=mainposba*CFrame.new(0,30,0)
			FireClient(EffectRemote,"all","crysummon",workspace.Terrain,loca*OrienRad(90, 0, 0))
			task.wait(11)
			FireClient(EffectRemote,"all","cryexplode",workspace.Terrain,loca.p)
			task.delay(15,function()
				finsi=true
			end)
			repeat task.wait(0.5)
				pcall(function() --hit
					for _,a in next,reg(loca.p,700-2,{mmodel,soundpart,effectmodel,humanModel,(followchar and plr.Character or mmodel)})[1] do 
						if (a.Parent ~= mmodel and a.Parent ~= effectmodel and a ~= mmodel and a ~= effectmodel and a ~= soundpart and a.Parent ~= soundpart and a ~= script and a.Parent ~= script) and a.ClassName == "Part" or a.ClassName == "MeshPart" or a.ClassName == "TrussPart" or a.ClassName == "WedgePart" or a.ClassName == "CornerWedgePart" or a.ClassName == "UnionOperation" or a.ClassName == "NegateOperation" or a.ClassName == "Seat" or a.ClassName == "VehicleSeat" or a.ClassName == "FlagStand" or a.ClassName == "SpawnLocation" then
							if a.Parent ~= nil and a.Parent ~= workspace and a.Parent:IsA("Model") and a.Parent.ClassName == "Model" and a.Size == Vector3.new(2,2,1) or a.Size == Vector3.new(2,2.1,1) or a.Size == Vector3.new(1,1.105,1) or a.Size == Vector3.new(1,1.227,1) or a.Size == Vector3.new(1,1.253,1) or a.Size == Vector3.new(1,1.277,1) or a.Size == Vector3.new(1,2,1) or a.Size == Vector3.new(2,1,1) or a.Name == "Head" or a.Name == "Torso" or a.Name == "Right Arm" or a.Name == "Left Arm" or a.Name == "Right Leg" or a.Name == "Left Leg" or a.Name == "UpperTorso" or a.Name == "HumanoidRootPart" or a.Name == "LowerTorso" or a.Name == "RightHand" or a.Name == "LeftHand" or a.Name == "RightFoot" or a.Name == "LeftFoot" or a.Name == "LeftUpperArm" or a.Name == "LeftLowerArm" or a.Name == "RightUpperArm" or a.Name == "RightLowerArm" or a.Name == "LeftUpperLeg" or a.Name == "LeftLowerLeg" or a.Name == "RightUpperLeg" or a.Name == "RightLowerLeg" then
								if (a.Position - loca.p).Magnitude <= 1000+a.Size.Magnitude then
									local mainpart=(a.Parent:FindFirstChildOfClass'Part' or a.Parent:FindFirstChildOfClass'MeshPart' or a.Parent:FindFirstChildOfClass'UnionOperation') 
									local hum=(a.Parent:FindFirstChildOfClass'Humanoid' or nil)
									if (game:GetService("CollectionService"):HasTag(hum.Parent, "deathed"))==false then 
										pcall(function() if mainpart.Parent==workspace then mainpart=a end
											local P=makePartAttachment(CFrame.new(mainpart.CFrame.p)*CFrame.new(math.random(-2,2),math.random(-2,2),math.random(-2,2)),2)
											local v1=imstuff["Facility"]["m1"]:Clone() v1.Parent=P[2] local v2=imstuff["Facility"]["m2"]:Clone() v2.Parent=P[2] local v3=imstuff["Facility"]["m3"]:Clone() v3.Parent=P[2] local v4=imstuff["Facility"]["m4"]:Clone() v4.Parent=P[2] 
											syncSound({SoundId="rbxassetid://"..bodyimpact[math.random(1,#bodyimpact)],Volume=0.9,PlayOnRemove=true,TimePosition=0.01,Pitch=math.random(8, 10)/math.random(9,13),Parent=P[2]})
											CamShake(mainpart.CFrame,35,.75,.05)
											v1:Emit(30) v2:Emit(30) v3:Emit(30) v4:Emit(30) 
											if hum and hum.Health >= 1 and hum.MaxHealth<100000 then 
												hum.Health=hum.Health-math.random(1,2+Power)
												if mainpart.Anchored ~= true then
													a.RotVelocity = CFrame.new(loca.p, a.Position).LookVector * 75
													a.Velocity = CFrame.new(loca.p, a.Position).LookVector * 75 
												end
											else
												if mainpart.Anchored ~= true then
													a.RotVelocity = CFrame.new(loca.p, a.Position).LookVector * 75
													a.Velocity = CFrame.new(loca.p, a.Position).LookVector * 75 
												end
												if hum and hum.Parent then
													hum.Parent:BreakJoints()
													game:GetService("CollectionService"):AddTag(hum.Parent, "deathed") 	
													task.delay(5, function()
														game:GetService("CollectionService"):RemoveTag(hum.Parent, "deathed")
													end)
													for _, v in pairs(hum.Parent:children()) do
														if v:IsA("BasePart") then
															task.spawn(function() v.Anchored=true
																CreateTween(v, { 1.5, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0 }, {CFrame=v.CFrame*CFrame.new(Random.new():NextNumber(-8, 8), Random.new():NextNumber(-3, 8), Random.new():NextNumber(-8, 8))*OrienRad(math.random(-180,180), math.random(-180,180), math.random(-180,180))}, true).Completed:Wait()
																local P=makePartAttachment(CFrame.new(v.CFrame.p),4) local v1=imstuff["Facility"]["ne2"]:Clone() v1.Parent=P[2] local v2=imstuff["Facility"]["ne3"]:Clone() v2.Parent=P[2] 
																syncSound({SoundId="rbxassetid://782353117",Volume=5,PlayOnRemove=true,TimePosition=0,Pitch=0.5,Parent=P[2]})
																syncSound({SoundId="rbxassetid://1192402877",Volume=5,PlayOnRemove=true,TimePosition=0,Pitch=0.5,Parent=P[2]})
																v1:Emit(18) v2:Emit(20)
																v:Destroy()
															end)
														end
													end
													if math.random(1,10) == 1 then
														syncSound({SoundId="rbxassetid://62339698",Volume=9,PlayOnRemove=true,TimePosition=0,Pitch=0.285,Parent=workspace})
													end
													syncSound({SoundId="rbxassetid://782353443",Volume=8,PlayOnRemove=true,TimePosition=0,Pitch=0.5,Parent=P[2]})
													syncSound({SoundId="rbxassetid://782353443",Volume=9,PlayOnRemove=true,TimePosition=0,Pitch=0.6,Parent=P[2]})
													local P=makePartAttachment(CFrame.new(mainpart.CFrame.p),4) local v1=imstuff["Facility"]["ne1"]:Clone() v1.Parent=P[2] v1:Emit(20)
												end
											end
										end) 
									end
								end
							end
						end;
					end
				end)
			until finsi
		end)
		pcall(function()
			local EasingStyle= Enum.EasingStyle.Sine local EasingDirection=Enum.EasingDirection.InOut
			local speedd=0.5
			local lerpspeed=0.7
			local conn
			local CVjoints={}
			local CVtweens={}
			local goal = false
			local Wherecf=Instance.new("CFrameValue") Wherecf.Value=mainpos
			for _, j in pairs(MonaJoints) do
				pcall(function()
					local cf=Instance.new("CFrameValue") cf.Value=j.CFrame cf.Name=j.Name
					table.insert(CVjoints,cf)
				end)
			end
			for _, Joints in pairs(MAnim["Manims"]["IdleB"]["RootPart"]["Trans"]:GetDescendants()) do 
				pcall(function()
					if Joints:IsA("Bone") then
						for i, v in ipairs(CVjoints) do
							if Joints.Name == v.Name then
								local tween=CreateTween(v, { speedd, EasingStyle, EasingDirection, 0, false, 0 }, {Value=CFrame.new(Joints.Position)*OrienRad(Joints.Orientation.X,Joints.Orientation.Y,Joints.Orientation.Z)}, true)
								table.insert(CVtweens,tween)
							end
						end
					end
				end)
			end
			conn=game:GetService("RunService").Heartbeat:Connect(function(dt) 
				anim(MonaJoints,CVjoints,lerpspeed)
			end)
			local function ewait(n)
				if not n or n == nil then n=0 end
				local d,hb =0,game:GetService("RunService").Heartbeat 
				repeat d=d+hb:Wait() if keyclicked then break end until d>=n
				return d
			end
			ewait(0.5)
			if conn then
				conn:Disconnect()
			end
		end)
		attacking=false movementfalse=false 
	end)))
end


function Attack() 
	--local S = randomSoundNR(AOQue,AOQue2,AOCurrent) if S[2] == true then if AOCurrent == AOQue then AOCurrent=AOQue2 elseif AOCurrent == AOQue2 then AOCurrent=AOQue end end
	--syncSound({SoundId="rbxassetid://"..S[1],Volume=2,PlayOnRemove=true,TimePosition=0,Pitch=math.random(9, 10)/math.random(9,10),Parent=soundpart})
	--local S2 = randomSoundNR(WBQue,WBQue2,WBCurrent) if S2[2] == true then if WBCurrent == WBQue then WBCurrent=WBQue2 elseif WBCurrent == WBQue2 then WBCurrent=WBQue end end 
	--syncSound({SoundId="rbxassetid://"..S2[1],Volume=2,PlayOnRemove=true,TimePosition=0,Pitch=math.random(9, 10)/math.random(9,10),Parent=soundpart})
	--local S3 = randomSoundNR(AAOQue,AAOQue2,AAOCurrent) if S3[2] == true then if AAOCurrent == AAOQue then AAOCurrent=AAOQue2 elseif AAOCurrent == AAOQue2 then AAOCurrent=AAOQue end end
	--syncSound({SoundId="rbxassetid://"..S3[1],Volume=2,PlayOnRemove=true,TimePosition=0,Pitch=math.random(9, 10)/math.random(9,10),Parent=soundpart})
	--syncSound({SoundId="rbxassetid://7657185850",Volume=2,PlayOnRemove=true,TimePosition=0,Pitch=math.random(9, 10)/math.random(9,10),Parent=soundpart})
	--syncSound({SoundId="rbxassetid://7657189264",Volume=2,PlayOnRemove=true,TimePosition=0,Pitch=1,Parent=soundpart})


	--syncSound({SoundId="rbxassetid://8229133661",Volume=2,PlayOnRemove=true,TimePosition=0,Pitch=0.8 --local S3 = randomSoundNR(CCOQue,CCOQue2,CCOCurrent) if S3[2] == true then if CCOCurrent == CCOQue then CCOCurrent=CCOQue2 elseif CCOCurrent == CCOQue2 then CCOCurrent=CCOQue end end
	--syncSound({SoundId="rbxassetid://"..S3[1],Volume=4,PlayOnRemove=true,TimePosition=0,Pitch=0.98 + (math.random() * .1),Parent=soundpart})+ (math.random() * .5),Parent=soundpart})
end 

--if (mainpos.Position - endd).magnitude > 9500 then
function throwan()
	coroutine.resume(Add(coroutine.create(function()
		attacking=true nowalk=true fallingspeed=0 local stopall = false swordphase=true local di = false
		local function throwpum()
			task.spawn(function()
				local projectile=imstuff["Models"].Neptunia2:Clone()  projectile.Name=tick() projectile.CFrame = mainpos*CFrame.new(0,-0.2,1.5)*CFrame.Angles(0,math.rad(180),0) projectile.Anchored = false projectile.CanCollide =true local did=false projectile.Parent=(antirrt and workspace or effectmodel) local laspos local laspro=projectile
				if not antirrt then
					carey=not carey kf:Destroy() 
					pcall(function()
						projectile:SetNetworkOwner(plr)
					end)
				else
					projectile.Transparency=1
				end
				projectile.Velocity = (CFrame.new(mainpos.p,Mouse.Hit.p)*CFrame.new(0,0,-35).p - projectile.CFrame.p - 0.5*Vector3.new(0, -workspace.Gravity, 0)*0.5*0.5)/0.5;
				if 	antirrt then
					task.wait(0.2)
					projectile.Transparency=0
				end
				for i =1,1 do task.wait(1)
					local rc=Ray.new(projectile.CFrame.p, Vector3.new(0,-2, 0)) local pp,hh=workspace:FindPartOnRayWithIgnoreList(rc,{soundpart,mmodel,effectmodel,humanModel},false,true)
					laspos=projectile.CFrame
					if pp ~= nil then 
						laspos=CFrame.new(hh)*CFrame.new(0,1,0)*OrienRad(-0, math.random(-190,190), 0) projectile:Destroy()
						projectile=imstuff["Models"].Neptunia2:Clone() projectile.Name=tick() projectile.Anchored = true projectile.CFrame = CFrame.new(10000,10000,10000) projectile.Parent=effectmodel
						projectile.S.WorldCFrame=laspos laspro=projectile 
						pcall(function()
							local WC=projectile.S.Trans.CFrame local numbtwo=math.random(5,10)*math.random(1,10)
							task.spawn(function()
								repeat task.wait()
									pcall(function()
										projectile.S.Trans.CFrame=WC*OrienRad(-math.cos(sn/numbtwo)*8,-math.CosSin(sn/numbtwo)*25,math.sin(sn/numbtwo)*8)
									end)
								until projectile.Parent == nil 
							end)
						end)
						did=true 
						break
					end
				end
				local numb=math.random(1,3)
				if Power > 4 and did then
					task.spawn(function()
						for i = 1,4 do task.wait(numb/3)
							task.spawn(function()
								local TargetMain local Where = laspro.S.WorldCFrame or CFrame.new()
								pcall(function()	
									if aiming then
										for _,a in next,reg(Where.Position,40+15,{mmodel,soundpart,effectmodel,humanModel,(followchar and plr.Character or mmodel)})[1] do 
											if (a.Parent ~= mmodel and a.Parent ~= effectmodel and a ~= mmodel and a ~= effectmodel and a ~= soundpart and a.Parent ~= soundpart and a ~= script and a.Parent ~= script) and a.ClassName == "Part" or a.ClassName == "MeshPart" or a.ClassName == "TrussPart" or a.ClassName == "WedgePart" or a.ClassName == "CornerWedgePart" or a.ClassName == "UnionOperation" or a.ClassName == "NegateOperation" or a.ClassName == "Seat" or a.ClassName == "VehicleSeat" or a.ClassName == "FlagStand" or a.ClassName == "SpawnLocation" then
												if a.Parent ~= nil and a.Parent ~= workspace and a.Parent:IsA("Model") and a.Parent.ClassName == "Model" and a.Size == Vector3.new(2,2,1) or a.Size == Vector3.new(2,2.1,1) or a.Size == Vector3.new(1,1.105,1) or a.Size == Vector3.new(1,1.227,1) or a.Size == Vector3.new(1,1.253,1) or a.Size == Vector3.new(1,1.277,1) or a.Size == Vector3.new(1,2,1) or a.Size == Vector3.new(2,1,1) or a.Name == "Head" or a.Name == "Torso" or a.Name == "Right Arm" or a.Name == "Left Arm" or a.Name == "Right Leg" or a.Name == "Left Leg" or a.Name == "UpperTorso" or a.Name == "HumanoidRootPart" or a.Name == "LowerTorso" or a.Name == "RightHand" or a.Name == "LeftHand" or a.Name == "RightFoot" or a.Name == "LeftFoot" or a.Name == "LeftUpperArm" or a.Name == "LeftLowerArm" or a.Name == "RightUpperArm" or a.Name == "RightLowerArm" or a.Name == "LeftUpperLeg" or a.Name == "LeftLowerLeg" or a.Name == "RightUpperLeg" or a.Name == "RightLowerLeg" then
													if (a.Position - Where.Position).Magnitude <= 115+a.Size.Magnitude then
														local mainpart=(a.Parent:FindFirstChildOfClass'Part' or a.Parent:FindFirstChildOfClass'MeshPart' or a.Parent:FindFirstChildOfClass'UnionOperation') 
														if mainpart.Parent==workspace then mainpart=a end
														TargetMain=mainpart
													end
												end
											end
										end
									end
								end)
								local projectilealt=imstuff["Models"].Neptunia2:Clone()  projectilealt.Name=tick() projectilealt.Anchored = true projectilealt.CFrame = CFrame.new(10000,10000,10000) projectilealt.Parent=effectmodel
								local B3 pcall(function() B3=imstuff["Facility"]["B3"]:Clone() B3.Width0=1 B3.Width1=1 B3.Attachment0=laspro.S B3.Attachment1=projectilealt.S B3.Parent=laspro end)
								projectilealt.S.WorldCFrame=Where local Mpos laspro=projectilealt local mathra = CFrame.new(math.random(-10,10),0,math.random(-10,10)) local lasproold =laspro.S.WorldCFrame*CFrame.new(math.random(-7,7),0,math.random(-7,7)) local as =projectilealt.S.WorldCFrame*CFrame.new(2,0,0)
								local WC=projectilealt.S.Trans.CFrame local numbtwo=math.random(5,10)*math.random(1,10)
								task.spawn(function()
									repeat task.wait()
										pcall(function()
											projectilealt.S.Trans.CFrame=WC*OrienRad(-math.cos(sn/numbtwo)*8,-math.CosSin(sn/numbtwo)*25,math.sin(sn/numbtwo)*8)
											B3.CurveSize0= (4*math.CosSin(tick()*numbtwo))	B3.CurveSize1= (4*math.CosSin(tick()*numbtwo/2))	
										end)
									until projectilealt.Parent == nil 
								end)
								CreateTween(projectilealt.S, { 0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.In, 0, false, 0 }, {WorldCFrame=CFrame.new((TargetMain and TargetMain.CFrame*CFrame.new(0,-2,0)*mathra or lasproold).p, (TargetMain and TargetMain.CFrame or as).p)}, true).Completed:Wait()
								local rannn = math.random(2,6)
								for i = 0, 280 do task.wait()
									local cf = (TargetMain and TargetMain.CFrame*CFrame.new(0,-2,0)*mathra or lasproold)
									delay(numb/rannn,function()
										pcall(function()
											projectilealt.S.WorldCFrame=CFrame.new(cf.p,(TargetMain and TargetMain.CFrame or as).p)
											Mpos=projectilealt.S.WorldCFrame.p
										end)
									end) 
								end
								task.spawn(function()
									numb=math.random(1,3)
									projectilealt:Destroy()
									pcall(function() --hit
										for _,a in next,reg(CFrame.new(Mpos).p,20-2,{mmodel,soundpart,effectmodel,humanModel,(followchar and plr.Character or mmodel)})[1] do 
											if (a.Parent ~= mmodel and a.Parent ~= effectmodel and a ~= mmodel and a ~= effectmodel and a ~= soundpart and a.Parent ~= soundpart and a ~= script and a.Parent ~= script) and a.ClassName == "Part" or a.ClassName == "MeshPart" or a.ClassName == "TrussPart" or a.ClassName == "WedgePart" or a.ClassName == "CornerWedgePart" or a.ClassName == "UnionOperation" or a.ClassName == "NegateOperation" or a.ClassName == "Seat" or a.ClassName == "VehicleSeat" or a.ClassName == "FlagStand" or a.ClassName == "SpawnLocation" then
												if a.Parent ~= nil and a.Parent ~= workspace and a.Parent:IsA("Model") and a.Parent.ClassName == "Model" and a.Size == Vector3.new(2,2,1) or a.Size == Vector3.new(2,2.1,1) or a.Size == Vector3.new(1,1.105,1) or a.Size == Vector3.new(1,1.227,1) or a.Size == Vector3.new(1,1.253,1) or a.Size == Vector3.new(1,1.277,1) or a.Size == Vector3.new(1,2,1) or a.Size == Vector3.new(2,1,1) or a.Name == "Head" or a.Name == "Torso" or a.Name == "Right Arm" or a.Name == "Left Arm" or a.Name == "Right Leg" or a.Name == "Left Leg" or a.Name == "UpperTorso" or a.Name == "HumanoidRootPart" or a.Name == "LowerTorso" or a.Name == "RightHand" or a.Name == "LeftHand" or a.Name == "RightFoot" or a.Name == "LeftFoot" or a.Name == "LeftUpperArm" or a.Name == "LeftLowerArm" or a.Name == "RightUpperArm" or a.Name == "RightLowerArm" or a.Name == "LeftUpperLeg" or a.Name == "LeftLowerLeg" or a.Name == "RightUpperLeg" or a.Name == "RightLowerLeg" then
													if (a.Position - CFrame.new(Mpos).p).Magnitude <= 20+a.Size.Magnitude then
														local mainpart=(a.Parent:FindFirstChildOfClass'Part' or a.Parent:FindFirstChildOfClass'MeshPart' or a.Parent:FindFirstChildOfClass'UnionOperation') 
														local hum=(a.Parent:FindFirstChildOfClass'Humanoid' or nil)
														pcall(function() if mainpart.Parent==workspace then mainpart=a end
															if math.random(1,5) == 1 then
																local P=Instance.new("Part",workspace.Terrain) P.Transparency=1 P.Anchored=true P.Size=Vector3.new(0.050000000745058, 0.050000000745058, 0.050000000745058) P.CanCollide=false  
																P.CFrame=CFrame.new(10000,10000,10000)
																local A1=Instance.new("Attachment",P) A1.WorldCFrame=CFrame.new(mainpart.CFrame.p)*CFrame.new(math.random(-2,2),math.random(-2,2),math.random(-2,2)) local v1=imstuff["Facility"]["m1"]:Clone() v1.Parent=A1 local v2=imstuff["Facility"]["m2"]:Clone() v2.Parent=A1 local v3=imstuff["Facility"]["m3"]:Clone() v3.Parent=A1 local v4=imstuff["Facility"]["m4"]:Clone() v4.Parent=A1 
																game:GetService("Debris"):AddItem(P,2)
																v1:Emit(30) v2:Emit(30) v3:Emit(30) v4:Emit(30) 
															end
															syncSound({SoundId="rbxassetid://"..bodyimpact[math.random(1,#bodyimpact)],Volume=0.9,PlayOnRemove=true,TimePosition=0.01,Pitch=math.random(8, 10)/math.random(9,13),Parent=mainpart})
															CamShake(mainpart.CFrame,35,.75,.05)
															if hum and hum.Health >= 1 and hum.MaxHealth<100000 then 
																hum.Health=hum.Health-math.random(2,4+Power)
																if mainpart.Anchored ~= true then
																	a.RotVelocity = CFrame.new(laspos.p, a.Position).LookVector * 55
																	a.Velocity = CFrame.new(laspos.p, a.Position).LookVector * 55 
																end
															else
																if mainpart.Anchored ~= true then
																	a.RotVelocity = CFrame.new(laspos.p, a.Position).LookVector * 55
																	a.Velocity = CFrame.new(laspos.p, a.Position).LookVector * 55 
																end
																if math.random(1,(mainpart==a and 13 or 1)) == 1 then
																	if math.random(1,2) == 1 then
																		sideeffect(mainpart)
																	else
																		effect(
																			false,
																			{CFrame = mainpart.CFrame,Size=mainpart.Size,Material="Glass",Color=mainpart.Color,Anchored=true,CanCollide=false,Transparency=0,Reflectance=-15}, --part proper
																			{Scale=Vector3.new(),MeshType="Sphere"},
																			{
																				{--1
																					dely=math.random(1,5)/math.random(5,8),
																					info={0.8,Enum.EasingStyle.Elastic,Enum.EasingDirection.InOut},
																					part={Transparency=0,CFrame=mainpart.CFrame*CFrame.new(math.random(-1,1),math.random(-1,1),math.random(-1,1)),Color=Color3.fromRGB(108, 214, 147),Reflectance=15}
																				},
																				{--2
																					dely=0,
																					info={0.3,Enum.EasingStyle.Linear,Enum.EasingDirection.Out},
																					part={Transparency=0,CFrame=mainpart.CFrame*CFrame.new(math.random(-3,3),math.random(-3,3),math.random(-3,3))*CFrame.Angles(math.random(-80,80),math.random(-80,80),math.random(-80,80)),Color=Color3.fromRGB(108, 214, 147),Reflectance=-15}
																				},
																				{--3
																					acc={vdec=CFrame.new(math.random(-1,1)/1555,math.random(-1,1)/1555,math.random(-1,1)/1555),vel=CFrame.new(0,0,0)*CFrame.Angles(math.random(1,2)/math.random(45,65),math.random(1,2)/math.random(45,65),math.random(1,2)/math.random(45,65))},
																					info={5.8,Enum.EasingStyle.Elastic,Enum.EasingDirection.InOut},
																					mesh={Scale=Vector3.new(0,0,0)},
																					part={Transparency=1,Size=Vector3.new(0,0,0),Color=Color3.fromRGB(),Reflectance=7}
																				}
																			}
																		)
																	end
																	syncSound({SoundId="rbxassetid://3748209678",Volume=2.5,PlayOnRemove=true,TimePosition=0,Pitch=math.random(8, 10)/math.random(5, 10),Parent=mainpart}) mainpart:Destroy()
																end	
															end
														end) 
													end
												end
											end;
										end
									end)
									local P2=Instance.new("Part",workspace.Terrain) P2.Transparency=1 P2.Anchored=true P2.Size=Vector3.new(0.050000000745058, 0.050000000745058, 0.050000000745058) P2.CanCollide=false  P2.CFrame=CFrame.new(10000,10000,10000)
									local A1=Instance.new("Attachment",P2) A1.WorldCFrame=CFrame.new(Mpos) local v0=imstuff["Facility"].Bm1:Clone() v0.Parent=A1 local v1=imstuff["Facility"].Bm2:Clone() v1.Parent=A1 local v2=imstuff["Facility"].Bm3:Clone() v2.Parent=A1 local v3=imstuff["Facility"].Bm4:Clone() v3.Parent=A1 
									local S = randomSoundNR(FWQue,FWQue2,FWCurrent) if S[2] == true then if FWCurrent == FWQue then FWCurrent=FWQue2 elseif FWCurrent == FWQue2 then FWCurrent=FWQue end end
									syncSound({SoundId="rbxassetid://"..S[1],Volume=6,PlayOnRemove=true,TimePosition=0,Pitch=0.98 + (math.random() * .1),Parent=A1})
									syncSound({SoundId="rbxassetid://7657212609",Volume=6,PlayOnRemove=true,TimePosition=0,Pitch=0.98 + (math.random() * .1),Parent=A1})
									game:GetService("Debris"):AddItem(P2,2)
									CamShake(CFrame.new(Mpos).p,85,.7,.1)
									task.spawn(function()
										v2:Emit(3)
										local expnnum = 0
										repeat task.wait(0.02)
											local s=animatedexp(expnnum)
											v2.Texture=s[1]
											expnnum=expnnum+1
										until 17 <= expnnum
										expnnum = 0
										v2:Destroy()
									end)
									task.spawn(function()
										v3:Emit(math.random(8,15))
										v0:Emit(40)
										local riconnum = 0
										repeat task.wait(0.04/math.random(1,2))
											local s=animatedrico(riconnum)
											v3.Texture=s[1]
											riconnum=riconnum+1
										until math.random(8,18) <= riconnum
										riconnum = 0
										v1:Emit(7)
										v3:Destroy()
									end)
								end)
							end)	
						end
					end)
				end
				local function ewait(n)
					if not n or n == nil then n=0 end
					local d,hb =0,game:GetService("RunService").Heartbeat 
					repeat d=d+hb:Wait()
						projectile.S.Trans.l_ear1.CFrame=CFrame.new(-1.693, 0.297, 1.019)*OrienRad(-66.703, -21.476, 142.463)*OrienRad(-11*math.cos(sn/11.5), -11*math.CosSin(sn/23.5), 25*math.sin(sn/17.5))
						projectile.S.Trans.r_ear1.CFrame=CFrame.new(-1.698, 0.302, -0.955)*OrienRad(68.768, 90.452, -149.693)*OrienRad(-11*math.sin(sn/12.5), -11*math.CosSin(sn/13.5), -25*math.CosSin(sn/16.5))
					until d>=n
					return d
				end
				if did then ewait(numb) end
				projectile:Destroy()
				pcall(function() --hit
					for _,a in next,reg(laspos.p,20-2,{mmodel,soundpart,effectmodel,humanModel,(followchar and plr.Character or mmodel)})[1] do 
						if (a.Parent ~= mmodel and a.Parent ~= effectmodel and a ~= mmodel and a ~= effectmodel and a ~= soundpart and a.Parent ~= soundpart and a ~= script and a.Parent ~= script) and a.ClassName == "Part" or a.ClassName == "MeshPart" or a.ClassName == "TrussPart" or a.ClassName == "WedgePart" or a.ClassName == "CornerWedgePart" or a.ClassName == "UnionOperation" or a.ClassName == "NegateOperation" or a.ClassName == "Seat" or a.ClassName == "VehicleSeat" or a.ClassName == "FlagStand" or a.ClassName == "SpawnLocation" then
							if a.Parent ~= nil and a.Parent ~= workspace and a.Parent:IsA("Model") and a.Parent.ClassName == "Model" and a.Size == Vector3.new(2,2,1) or a.Size == Vector3.new(2,2.1,1) or a.Size == Vector3.new(1,1.105,1) or a.Size == Vector3.new(1,1.227,1) or a.Size == Vector3.new(1,1.253,1) or a.Size == Vector3.new(1,1.277,1) or a.Size == Vector3.new(1,2,1) or a.Size == Vector3.new(2,1,1) or a.Name == "Head" or a.Name == "Torso" or a.Name == "Right Arm" or a.Name == "Left Arm" or a.Name == "Right Leg" or a.Name == "Left Leg" or a.Name == "UpperTorso" or a.Name == "HumanoidRootPart" or a.Name == "LowerTorso" or a.Name == "RightHand" or a.Name == "LeftHand" or a.Name == "RightFoot" or a.Name == "LeftFoot" or a.Name == "LeftUpperArm" or a.Name == "LeftLowerArm" or a.Name == "RightUpperArm" or a.Name == "RightLowerArm" or a.Name == "LeftUpperLeg" or a.Name == "LeftLowerLeg" or a.Name == "RightUpperLeg" or a.Name == "RightLowerLeg" then
								if (a.Position - laspos.p).Magnitude <= 20+a.Size.Magnitude then
									local mainpart=(a.Parent:FindFirstChildOfClass'Part' or a.Parent:FindFirstChildOfClass'MeshPart' or a.Parent:FindFirstChildOfClass'UnionOperation') 
									local hum=(a.Parent:FindFirstChildOfClass'Humanoid' or nil)
									pcall(function() if mainpart.Parent==workspace then mainpart=a end
										if math.random(1,5) == 1 then
											local P=Instance.new("Part",workspace.Terrain) P.Transparency=1 P.Anchored=true P.Size=Vector3.new(0.050000000745058, 0.050000000745058, 0.050000000745058) P.CanCollide=false  
											P.CFrame=CFrame.new(10000,10000,10000)
											local A1=Instance.new("Attachment",P) A1.WorldCFrame=CFrame.new(mainpart.CFrame.p)*CFrame.new(math.random(-2,2),math.random(-2,2),math.random(-2,2)) local v1=imstuff["Facility"]["m1"]:Clone() v1.Parent=A1 local v2=imstuff["Facility"]["m2"]:Clone() v2.Parent=A1 local v3=imstuff["Facility"]["m3"]:Clone() v3.Parent=A1 local v4=imstuff["Facility"]["m4"]:Clone() v4.Parent=A1 
											game:GetService("Debris"):AddItem(P,2)
											v1:Emit(30) v2:Emit(30) v3:Emit(30) v4:Emit(30) 
										end
										syncSound({SoundId="rbxassetid://"..bodyimpact[math.random(1,#bodyimpact)],Volume=0.9,PlayOnRemove=true,TimePosition=0.01,Pitch=math.random(8, 10)/math.random(9,13),Parent=mainpart})
										CamShake(mainpart.CFrame,35,.75,.05)
										if hum and hum.Health >= 1 and hum.MaxHealth<100000 then 
											hum.Health=hum.Health-math.random(2,4+Power)
											if mainpart.Anchored ~= true then
												a.RotVelocity = CFrame.new(laspos.p, a.Position).LookVector * 55
												a.Velocity = CFrame.new(laspos.p, a.Position).LookVector * 55 
											end
										else
											if mainpart.Anchored ~= true then
												a.RotVelocity = CFrame.new(laspos.p, a.Position).LookVector * 55
												a.Velocity = CFrame.new(laspos.p, a.Position).LookVector * 55 
											end
											if math.random(1,(mainpart==a and 13 or 1)) == 1 then
												if math.random(1,2) == 1 then
													sideeffect(mainpart)
												else
													effect(
														false,
														{CFrame = mainpart.CFrame,Size=mainpart.Size,Material="Glass",Color=mainpart.Color,Anchored=true,CanCollide=false,Transparency=0,Reflectance=-15}, --part proper
														{Scale=Vector3.new(),MeshType="Sphere"},
														{
															{--1
																dely=math.random(1,5)/math.random(5,8),
																info={0.8,Enum.EasingStyle.Elastic,Enum.EasingDirection.InOut},
																part={Transparency=0,CFrame=mainpart.CFrame*CFrame.new(math.random(-1,1),math.random(-1,1),math.random(-1,1)),Color=Color3.fromRGB(108, 214, 147),Reflectance=15}
															},
															{--2
																dely=0,
																info={0.3,Enum.EasingStyle.Linear,Enum.EasingDirection.Out},
																part={Transparency=0,CFrame=mainpart.CFrame*CFrame.new(math.random(-3,3),math.random(-3,3),math.random(-3,3))*CFrame.Angles(math.random(-80,80),math.random(-80,80),math.random(-80,80)),Color=Color3.fromRGB(108, 214, 147),Reflectance=-15}
															},
															{--3
																acc={vdec=CFrame.new(math.random(-1,1)/1555,math.random(-1,1)/1555,math.random(-1,1)/1555),vel=CFrame.new(0,0,0)*CFrame.Angles(math.random(1,2)/math.random(45,65),math.random(1,2)/math.random(45,65),math.random(1,2)/math.random(45,65))},
																info={5.8,Enum.EasingStyle.Elastic,Enum.EasingDirection.InOut},
																mesh={Scale=Vector3.new(0,0,0)},
																part={Transparency=1,Size=Vector3.new(0,0,0),Color=Color3.fromRGB(),Reflectance=7}
															}
														}
													)
												end
												syncSound({SoundId="rbxassetid://3748209678",Volume=4.5,PlayOnRemove=true,TimePosition=0,Pitch=math.random(8, 10)/math.random(5, 10),Parent=mainpart}) mainpart:Destroy()
											end	
										end
									end) 
								end
							end
						end;
					end
				end)
				local P2=Instance.new("Part",workspace.Terrain) P2.Transparency=1 P2.Anchored=true P2.Size=Vector3.new(0.050000000745058, 0.050000000745058, 0.050000000745058) P2.CanCollide=false  P2.CFrame=CFrame.new(10000,10000,10000)
				local A1=Instance.new("Attachment",P2) A1.WorldCFrame=CFrame.new(laspos.p) local v0=imstuff["Facility"].Bm1:Clone() v0.Parent=A1 local v1=imstuff["Facility"].Bm2:Clone() v1.Parent=A1 local v2=imstuff["Facility"].Bm3:Clone() v2.Parent=A1 local v3=imstuff["Facility"].Bm4:Clone() v3.Parent=A1 
				local S = randomSoundNR(FWQue,FWQue2,FWCurrent) if S[2] == true then if FWCurrent == FWQue then FWCurrent=FWQue2 elseif FWCurrent == FWQue2 then FWCurrent=FWQue end end
				syncSound({SoundId="rbxassetid://"..S[1],Volume=5,PlayOnRemove=true,TimePosition=0,Pitch=0.98 + (math.random() * .1),Parent=A1})
				syncSound({SoundId="rbxassetid://7657212609",Volume=5,PlayOnRemove=true,TimePosition=0,Pitch=0.98 + (math.random() * .1),Parent=A1})
				game:GetService("Debris"):AddItem(P2,2)
				CamShake(laspos,85,.7,.1)
				task.spawn(function()
					v2:Emit(3)
					local expnnum = 0
					repeat task.wait(0.02)
						local s=animatedexp(expnnum)
						v2.Texture=s[1]
						expnnum=expnnum+1
					until 17 <= expnnum
					expnnum = 0
					v2:Destroy()
				end)
				task.spawn(function()
					v3:Emit(math.random(8,15))
					v0:Emit(40)
					v1:Emit(7)
					local riconnum = 0
					repeat task.wait(0.04/math.random(1,2))
						local s=animatedrico(riconnum)
						v3.Texture=s[1]
						riconnum=riconnum+1
					until math.random(8,18) <= riconnum
					riconnum = 0
					v3:Destroy()
				end)
			end)
		end
		local function anim(MonaJoints,CVjoints,lerpspeed)
			if not di then
				pcall(function()
					local lPos=mainpos:PointToObjectSpace(Mouse.Hit.p)
					local theta=math.clamp(math.atan2(lPos.x, lPos.z), -math.rad(90), math.rad(90))
					mainpos=mainpos*CFrame.new(0,0,0)*CFrame.fromEulerAnglesYXZ(0,theta,0)
					local x, y, z=mainpos:ToEulerAnglesXYZ() 
					sidemoves=sidemoves:Lerp(CFrame.Angles(x,y,z),0.25) 
					mainposba=CFrame.new(mainpos.Position)*sidemoves
				end)
			end
			pcall(function() 
				for _, j in pairs(MonaJoints) do
					for _, CV in pairs(CVjoints) do
						if j.Name == CV.Name then
							if j.Name == "ShoulderL" then
								j.CFrame=j.CFrame:lerp(CV.Value*CFrame.fromOrientation(math.rad(math.rad(25*math.cos(sn/11))),math.rad(0), math.rad(5*math.cos(sn/11))),lerpspeed) 
							elseif j.Name == "ShoulderR" then
								j.CFrame=j.CFrame:lerp(CV.Value*CFrame.fromOrientation(math.rad(math.rad(25*math.cos(sn/1))),math.rad(0), math.rad(5*math.cos(sn/12))),lerpspeed)
							elseif j.Name == "Neck" then
								j.CFrame=j.CFrame:lerp(CV.Value*CFrame.fromOrientation(math.rad(3*math.sin(sn/8)), math.rad(0), math.rad(0)),lerpspeed)
							elseif j.Name == "Waist" then
								j.CFrame=j.CFrame:lerp(CV.Value*CFrame.fromOrientation(math.rad(3*math.cos(sn/8)), math.rad(1.5*math.cos(sn/10)), math.rad(1.5*math.cos(sn/9))),lerpspeed)
							elseif j.Name == "LegL" then
								j.CFrame=j.CFrame:lerp(CV.Value*CFrame.new(-0.05*math.cos(sn/8),0,0)*CFrame.fromOrientation(math.rad(0), math.rad(0), math.rad(-2*math.cos(sn/8))),lerpspeed)
							elseif j.Name == "LegR" then
								j.CFrame=j.CFrame:lerp(CV.Value*CFrame.new(-0.1-0.08*math.cos(sn/8),0,0)*CFrame.fromOrientation(math.rad(0), math.rad(5+2.5*math.cos(sn/8)), math.rad(0)),lerpspeed)
							elseif j.Name == "Bone" then
								j.CFrame=j.CFrame:lerp(CV.Value*CFrame.fromOrientation(math.rad(14*math.sin(sn/8)), math.rad(0), math.rad(0)),lerpspeed)
							elseif j.Name == "Bone.001" then
								j.CFrame=j.CFrame:lerp(CV.Value*CFrame.fromOrientation(math.rad(12*math.cos(sn/8)), math.rad(0), math.rad(0)),lerpspeed)
							elseif j.Name == "Bone.002" then
								j.CFrame=j.CFrame:lerp(CV.Value*CFrame.fromOrientation(math.rad(9*math.sin(sn/8)), math.rad(0), math.rad(0)),lerpspeed)
							elseif j.Name == "Bone.003" then
								j.CFrame=j.CFrame:lerp(CV.Value*CFrame.fromOrientation(math.rad(7*math.cos(sn/8)), math.rad(0), math.rad(0)),lerpspeed)
							else
								j.CFrame=j.CFrame:lerp(CV.Value,lerpspeed)
							end

						end
					end
				end
			end)
		end
		--
		local quits=false
		-- 
		if not falling then
			pcall(function()
				local EasingStyle= Enum.EasingStyle.Exponential local EasingDirection=Enum.EasingDirection.Out
				local speedd=0.09
				local lerpspeed=0.2
				local conn
				local CVjoints={}
				local CVtweens={}
				for _, j in pairs(MonaJoints) do
					pcall(function()
						local cf=Instance.new("CFrameValue") cf.Value=j.CFrame cf.Name=j.Name
						table.insert(CVjoints,cf)
					end)
				end
				for _, Joints in pairs(MAnim["Manims"]["ThrowC1"]["RootPart"]["Trans"]:GetDescendants()) do 
					pcall(function()
						if Joints:IsA("Bone") then
							for i, v in ipairs(CVjoints) do
								if Joints.Name == v.Name then
									local tween=CreateTween(v, { speedd, EasingStyle, EasingDirection, 0, false, 0 }, {Value=CFrame.new(Joints.Position)*OrienRad(Joints.Orientation.X,Joints.Orientation.Y,Joints.Orientation.Z)}, true)
									table.insert(CVtweens,tween)
								end
							end
						end
					end)
				end
				conn=game:GetService("RunService").Heartbeat:Connect(function(dt) 
					anim(MonaJoints,CVjoints,lerpspeed)
				end)
				CVtweens[1].Completed:Wait()
				if conn then
					conn:Disconnect()
				end
				fallingspeed=0 falling=true mainpos=mainpos*CFrame.new(0,0.5,0) fallingspeed=fallingspeed-0.5
			end)
		end
		if antirrt then
			throwpum()
		end
		pcall(function()
			local EasingStyle= Enum.EasingStyle.Quad  local EasingDirection=Enum.EasingDirection.Out
			local speedd=0.1
			local lerpspeed=0.35
			local conn
			local CVjoints={}
			local CVtweens={}
			for _, j in pairs(MonaJoints) do
				pcall(function()
					local cf=Instance.new("CFrameValue") cf.Value=j.CFrame cf.Name=j.Name
					table.insert(CVjoints,cf)
				end)
			end
			for _, Joints in pairs(MAnim["Manims"]["ThrowC2"]["RootPart"]["Trans"]:GetDescendants()) do 
				pcall(function()
					if Joints:IsA("Bone") then
						for i, v in ipairs(CVjoints) do
							if Joints.Name == v.Name then
								local tween=CreateTween(v, { speedd, EasingStyle, EasingDirection, 0, false, 0 }, {Value=CFrame.new(Joints.Position)*OrienRad(Joints.Orientation.X,Joints.Orientation.Y,Joints.Orientation.Z)}, true)
								table.insert(CVtweens,tween)
							end
						end
					end
				end)
			end
			conn=game:GetService("RunService").Heartbeat:Connect(function(dt) 
				anim(MonaJoints,CVjoints,lerpspeed)
			end)
			CVtweens[1].Completed:Wait()
			if conn then
				conn:Disconnect()
			end
		end)
		pcall(function()
			local EasingStyle= Enum.EasingStyle.Quad  local EasingDirection=Enum.EasingDirection.Out
			local speedd=0.12
			local lerpspeed=0.2
			local conn
			local CVjoints={}
			local CVtweens={}
			for _, j in pairs(MonaJoints) do
				pcall(function()
					local cf=Instance.new("CFrameValue") cf.Value=j.CFrame cf.Name=j.Name
					table.insert(CVjoints,cf)
				end)
			end
			for _, Joints in pairs(MAnim["Manims"]["ThrowC3"]["RootPart"]["Trans"]:GetDescendants()) do 
				pcall(function()
					if Joints:IsA("Bone") then
						for i, v in ipairs(CVjoints) do
							if Joints.Name == v.Name then
								local tween=CreateTween(v, { speedd, EasingStyle, EasingDirection, 0, false, 0 }, {Value=CFrame.new(Joints.Position)*OrienRad(Joints.Orientation.X,Joints.Orientation.Y,Joints.Orientation.Z)}, true)
								table.insert(CVtweens,tween)
							end
						end
					end
				end)
			end
			conn=game:GetService("RunService").Heartbeat:Connect(function(dt) 
				anim(MonaJoints,CVjoints,lerpspeed)
			end)
			CVtweens[1].Completed:Wait()
			if conn then
				conn:Disconnect()
			end
		end)
		di=true
		if antirrt then
			pcall(function()
				carey=not carey kf:Destroy() 
			end)
		else
			throwpum()
		end
		pcall(function()
			local EasingStyle= Enum.EasingStyle.Back local EasingDirection=Enum.EasingDirection.Out
			local speedd=0.2
			local lerpspeed=1
			local conn
			local CVjoints={}
			local CVtweens={}
			for _, j in pairs(MonaJoints) do
				pcall(function()
					local cf=Instance.new("CFrameValue") cf.Value=j.CFrame cf.Name=j.Name
					table.insert(CVjoints,cf)
				end)
			end
			for _, Joints in pairs(MAnim["Manims"]["ThrowC4"]["RootPart"]["Trans"]:GetDescendants()) do 
				pcall(function()
					if Joints:IsA("Bone") then
						for i, v in ipairs(CVjoints) do
							if Joints.Name == v.Name then
								local tween=CreateTween(v, { speedd, EasingStyle, EasingDirection, 0, false, 0 }, {Value=CFrame.new(Joints.Position)*OrienRad(Joints.Orientation.X,Joints.Orientation.Y,Joints.Orientation.Z)}, true)
								table.insert(CVtweens,tween)
							end
						end
					end
				end)
			end
			conn=game:GetService("RunService").Heartbeat:Connect(function(dt)  
				anim(MonaJoints,CVjoints,lerpspeed)
			end)
			CVtweens[1].Completed:Wait()
			if conn then
				conn:Disconnect()
			end
		end)
		pcall(function() kf.ST.Enabled = false end)
		attacking=false 
	end)))
end

function bomby()
	pcall(function()
		local rc=Ray.new(kf.S.Trans.WorldCFrame.p, Vector3.new(0,-3.5, 0)) local pos,hit=workspace:FindPartOnRayWithIgnoreList(rc,{soundpart,mmodel,effectmodel,humanModel},false,true)
		if pos ~= nil then
			task.spawn(function() local laspos = mainposba*CFrame.new(0,-2,2)*CFrame.Angles(0,math.rad(180),0)
				local projectile=imstuff["Models"].Neptunia2:Clone()  projectile.Name=tick() projectile.Anchored = true projectile.CFrame = CFrame.new(10000,10000,10000) projectile.Parent=effectmodel local laspro=projectile
				projectile.S.WorldCFrame=laspos
				carey=not carey kf:Destroy() 
				local numb=math.random(1,3)
				pcall(function()
					local WC=projectile.S.Trans.CFrame local numbtwo=math.random(5,10)*math.random(1,10)
					task.spawn(function()
						repeat task.wait()
							pcall(function()
								projectile.S.Trans.CFrame=WC*OrienRad(-math.cos(sn/numbtwo)*8,-math.CosSin(sn/numbtwo)*25,math.sin(sn/numbtwo)*8)
							end)
						until projectile.Parent == nil 
					end)
				end)
				if Power > 4 then
					task.spawn(function()
						for i = 1,4 do task.wait(numb/3)
							task.spawn(function()
								local TargetMain local Where = laspro.S.WorldCFrame or CFrame.new()
								pcall(function()	
									if aiming then
										for _,a in next,reg(Where.Position,60+15,{mmodel,soundpart,effectmodel,humanModel,(followchar and plr.Character or mmodel)})[1] do 
											if (a.Parent ~= mmodel and a.Parent ~= effectmodel and a ~= mmodel and a ~= effectmodel and a ~= soundpart and a.Parent ~= soundpart and a ~= script and a.Parent ~= script) and a.ClassName == "Part" or a.ClassName == "MeshPart" or a.ClassName == "TrussPart" or a.ClassName == "WedgePart" or a.ClassName == "CornerWedgePart" or a.ClassName == "UnionOperation" or a.ClassName == "NegateOperation" or a.ClassName == "Seat" or a.ClassName == "VehicleSeat" or a.ClassName == "FlagStand" or a.ClassName == "SpawnLocation" then
												if a.Parent ~= nil and a.Parent ~= workspace and a.Parent:IsA("Model") and a.Parent.ClassName == "Model" and a.Size == Vector3.new(2,2,1) or a.Size == Vector3.new(2,2.1,1) or a.Size == Vector3.new(1,1.105,1) or a.Size == Vector3.new(1,1.227,1) or a.Size == Vector3.new(1,1.253,1) or a.Size == Vector3.new(1,1.277,1) or a.Size == Vector3.new(1,2,1) or a.Size == Vector3.new(2,1,1) or a.Name == "Head" or a.Name == "Torso" or a.Name == "Right Arm" or a.Name == "Left Arm" or a.Name == "Right Leg" or a.Name == "Left Leg" or a.Name == "UpperTorso" or a.Name == "HumanoidRootPart" or a.Name == "LowerTorso" or a.Name == "RightHand" or a.Name == "LeftHand" or a.Name == "RightFoot" or a.Name == "LeftFoot" or a.Name == "LeftUpperArm" or a.Name == "LeftLowerArm" or a.Name == "RightUpperArm" or a.Name == "RightLowerArm" or a.Name == "LeftUpperLeg" or a.Name == "LeftLowerLeg" or a.Name == "RightUpperLeg" or a.Name == "RightLowerLeg" then
													if (a.Position - Where.Position).Magnitude <= 115+a.Size.Magnitude then
														local mainpart=(a.Parent:FindFirstChildOfClass'Part' or a.Parent:FindFirstChildOfClass'MeshPart' or a.Parent:FindFirstChildOfClass'UnionOperation') 
														if mainpart.Parent==workspace then mainpart=a end
														TargetMain=mainpart
													end
												end
											end
										end
									end
								end)
								local projectilealt=imstuff["Models"].Neptunia2:Clone()  projectilealt.Name=tick() projectilealt.Anchored = true projectilealt.CFrame = CFrame.new(10000,10000,10000) projectilealt.Parent=effectmodel
								local B3 pcall(function() B3=imstuff["Facility"]["B3"]:Clone() B3.Width0=1 B3.Width1=1 B3.Attachment0=laspro.S B3.Attachment1=projectilealt.S B3.Parent=laspro end)
								projectilealt.S.WorldCFrame=Where local Mpos laspro=projectilealt local mathra = CFrame.new(math.random(-10,10),0,math.random(-10,10)) local lasproold =laspro.S.WorldCFrame*CFrame.new(math.random(-7,7),0,math.random(-7,7)) local as =projectilealt.S.WorldCFrame*CFrame.new(2,0,0)
								local WC=projectilealt.S.Trans.CFrame local numbtwo=math.random(5,10)*math.random(1,10)
								task.spawn(function()
									repeat task.wait()
										pcall(function()
											projectilealt.S.Trans.CFrame=WC*OrienRad(-math.cos(sn/numbtwo)*8,-math.CosSin(sn/numbtwo)*25,math.sin(sn/numbtwo)*8)
											B3.CurveSize0= (4*math.CosSin(tick()*numbtwo))	B3.CurveSize1= (4*math.CosSin(tick()*numbtwo/2))	
										end)
									until projectilealt.Parent == nil 
								end)
								CreateTween(projectilealt.S, { 0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.In, 0, false, 0 }, {WorldCFrame=CFrame.new((TargetMain and TargetMain.CFrame*CFrame.new(0,-2,0)*mathra or lasproold).p, (TargetMain and TargetMain.CFrame or as).p)}, true).Completed:Wait()
								local rannn = math.random(2,6)
								for i = 0, 280 do task.wait()
									local cf = (TargetMain and TargetMain.CFrame*CFrame.new(0,-2,0)*mathra or lasproold)
									delay(numb/rannn,function()
										pcall(function()
											projectilealt.S.WorldCFrame=CFrame.new(cf.p,(TargetMain and TargetMain.CFrame or as).p)
											Mpos=projectilealt.S.WorldCFrame.p
										end)
									end) 
								end
								task.spawn(function()
									numb=math.random(1,3)
									projectilealt:Destroy()
									pcall(function() --hit
										for _,a in next,reg(CFrame.new(Mpos).p,20-2,{mmodel,soundpart,effectmodel,humanModel,(followchar and plr.Character or mmodel)})[1] do 
											if (a.Parent ~= mmodel and a.Parent ~= effectmodel and a ~= mmodel and a ~= effectmodel and a ~= soundpart and a.Parent ~= soundpart and a ~= script and a.Parent ~= script) and a.ClassName == "Part" or a.ClassName == "MeshPart" or a.ClassName == "TrussPart" or a.ClassName == "WedgePart" or a.ClassName == "CornerWedgePart" or a.ClassName == "UnionOperation" or a.ClassName == "NegateOperation" or a.ClassName == "Seat" or a.ClassName == "VehicleSeat" or a.ClassName == "FlagStand" or a.ClassName == "SpawnLocation" then
												if a.Parent ~= nil and a.Parent ~= workspace and a.Parent:IsA("Model") and a.Parent.ClassName == "Model" and a.Size == Vector3.new(2,2,1) or a.Size == Vector3.new(2,2.1,1) or a.Size == Vector3.new(1,1.105,1) or a.Size == Vector3.new(1,1.227,1) or a.Size == Vector3.new(1,1.253,1) or a.Size == Vector3.new(1,1.277,1) or a.Size == Vector3.new(1,2,1) or a.Size == Vector3.new(2,1,1) or a.Name == "Head" or a.Name == "Torso" or a.Name == "Right Arm" or a.Name == "Left Arm" or a.Name == "Right Leg" or a.Name == "Left Leg" or a.Name == "UpperTorso" or a.Name == "HumanoidRootPart" or a.Name == "LowerTorso" or a.Name == "RightHand" or a.Name == "LeftHand" or a.Name == "RightFoot" or a.Name == "LeftFoot" or a.Name == "LeftUpperArm" or a.Name == "LeftLowerArm" or a.Name == "RightUpperArm" or a.Name == "RightLowerArm" or a.Name == "LeftUpperLeg" or a.Name == "LeftLowerLeg" or a.Name == "RightUpperLeg" or a.Name == "RightLowerLeg" then
													if (a.Position - CFrame.new(Mpos).p).Magnitude <= 20+a.Size.Magnitude then
														local mainpart=(a.Parent:FindFirstChildOfClass'Part' or a.Parent:FindFirstChildOfClass'MeshPart' or a.Parent:FindFirstChildOfClass'UnionOperation') 
														local hum=(a.Parent:FindFirstChildOfClass'Humanoid' or nil)
														pcall(function() if mainpart.Parent==workspace then mainpart=a end
															if math.random(1,5) == 1 then
																local P=Instance.new("Part",workspace.Terrain) P.Transparency=1 P.Anchored=true P.Size=Vector3.new(0.050000000745058, 0.050000000745058, 0.050000000745058) P.CanCollide=false  
																P.CFrame=CFrame.new(10000,10000,10000)
																local A1=Instance.new("Attachment",P) A1.WorldCFrame=CFrame.new(mainpart.CFrame.p)*CFrame.new(math.random(-2,2),math.random(-2,2),math.random(-2,2)) local v1=imstuff["Facility"]["m1"]:Clone() v1.Parent=A1 local v2=imstuff["Facility"]["m2"]:Clone() v2.Parent=A1 local v3=imstuff["Facility"]["m3"]:Clone() v3.Parent=A1 local v4=imstuff["Facility"]["m4"]:Clone() v4.Parent=A1 
																game:GetService("Debris"):AddItem(P,2)
																v1:Emit(30) v2:Emit(30) v3:Emit(30) v4:Emit(30) 
															end
															syncSound({SoundId="rbxassetid://"..bodyimpact[math.random(1,#bodyimpact)],Volume=0.9,PlayOnRemove=true,TimePosition=0.01,Pitch=math.random(8, 10)/math.random(9,13),Parent=mainpart})
															CamShake(mainpart.CFrame,35,.75,.05)
															if hum and hum.Health >= 1 and hum.MaxHealth<100000 then 
																hum.Health=hum.Health-math.random(2,4+Power)
																if mainpart.Anchored ~= true then
																	a.RotVelocity = CFrame.new(laspos.p, a.Position).LookVector * 55
																	a.Velocity = CFrame.new(laspos.p, a.Position).LookVector * 55 
																end
															else
																if mainpart.Anchored ~= true then
																	a.RotVelocity = CFrame.new(laspos.p, a.Position).LookVector * 55
																	a.Velocity = CFrame.new(laspos.p, a.Position).LookVector * 55 
																end
																if math.random(1,(mainpart==a and 13 or 1)) == 1 then
																	if math.random(1,2) == 1 then
																		sideeffect(mainpart)
																	else
																		effect(
																			false,
																			{CFrame = mainpart.CFrame,Size=mainpart.Size,Material="Glass",Color=mainpart.Color,Anchored=true,CanCollide=false,Transparency=0,Reflectance=-15}, --part proper
																			{Scale=Vector3.new(),MeshType="Sphere"},
																			{
																				{--1
																					dely=math.random(1,5)/math.random(5,8),
																					info={0.8,Enum.EasingStyle.Elastic,Enum.EasingDirection.InOut},
																					part={Transparency=0,CFrame=mainpart.CFrame*CFrame.new(math.random(-1,1),math.random(-1,1),math.random(-1,1)),Color=Color3.fromRGB(108, 214, 147),Reflectance=15}
																				},
																				{--2
																					dely=0,
																					info={0.3,Enum.EasingStyle.Linear,Enum.EasingDirection.Out},
																					part={Transparency=0,CFrame=mainpart.CFrame*CFrame.new(math.random(-3,3),math.random(-3,3),math.random(-3,3))*CFrame.Angles(math.random(-80,80),math.random(-80,80),math.random(-80,80)),Color=Color3.fromRGB(108, 214, 147),Reflectance=-15}
																				},
																				{--3
																					acc={vdec=CFrame.new(math.random(-1,1)/1555,math.random(-1,1)/1555,math.random(-1,1)/1555),vel=CFrame.new(0,0,0)*CFrame.Angles(math.random(1,2)/math.random(45,65),math.random(1,2)/math.random(45,65),math.random(1,2)/math.random(45,65))},
																					info={5.8,Enum.EasingStyle.Elastic,Enum.EasingDirection.InOut},
																					mesh={Scale=Vector3.new(0,0,0)},
																					part={Transparency=1,Size=Vector3.new(0,0,0),Color=Color3.fromRGB(),Reflectance=7}
																				}
																			}
																		)
																	end
																	syncSound({SoundId="rbxassetid://3748209678",Volume=2.5,PlayOnRemove=true,TimePosition=0,Pitch=math.random(8, 10)/math.random(5, 10),Parent=mainpart}) mainpart:Destroy()
																end	
															end
														end) 
													end
												end
											end;
										end
									end)
									local P2=Instance.new("Part",workspace.Terrain) P2.Transparency=1 P2.Anchored=true P2.Size=Vector3.new(0.050000000745058, 0.050000000745058, 0.050000000745058) P2.CanCollide=false  P2.CFrame=CFrame.new(10000,10000,10000)
									local A1=Instance.new("Attachment",P2) A1.WorldCFrame=CFrame.new(Mpos) local v0=imstuff["Facility"].Bm1:Clone() v0.Parent=A1 local v1=imstuff["Facility"].Bm2:Clone() v1.Parent=A1 local v2=imstuff["Facility"].Bm3:Clone() v2.Parent=A1 local v3=imstuff["Facility"].Bm4:Clone() v3.Parent=A1 
									local S = randomSoundNR(FWQue,FWQue2,FWCurrent) if S[2] == true then if FWCurrent == FWQue then FWCurrent=FWQue2 elseif FWCurrent == FWQue2 then FWCurrent=FWQue end end
									syncSound({SoundId="rbxassetid://"..S[1],Volume=6,PlayOnRemove=true,TimePosition=0,Pitch=0.98 + (math.random() * .1),Parent=A1})
									syncSound({SoundId="rbxassetid://7657212609",Volume=6,PlayOnRemove=true,TimePosition=0,Pitch=0.98 + (math.random() * .1),Parent=A1})
									game:GetService("Debris"):AddItem(P2,2)
									CamShake(CFrame.new(Mpos).p,85,.7,.1)
									task.spawn(function()
										v2:Emit(3)
										local expnnum = 0
										repeat task.wait(0.02)
											local s=animatedexp(expnnum)
											v2.Texture=s[1]
											expnnum=expnnum+1
										until 17 <= expnnum
										expnnum = 0
										v2:Destroy()
									end)
									task.spawn(function()
										v3:Emit(math.random(8,15))
										v0:Emit(40)
										local riconnum = 0
										repeat task.wait(0.04/math.random(1,2))
											local s=animatedrico(riconnum)
											v3.Texture=s[1]
											riconnum=riconnum+1
										until math.random(8,18) <= riconnum
										riconnum = 0
										v1:Emit(7)
										v3:Destroy()
									end)
								end)
							end)	
						end
					end)
				end
				local function ewait(n)
					if not n or n == nil then n=0 end
					local d,hb =0,game:GetService("RunService").Heartbeat 
					repeat d=d+hb:Wait()
						projectile.S.Trans.l_ear1.CFrame=CFrame.new(-1.693, 0.297, 1.019)*OrienRad(-66.703, -21.476, 142.463)*OrienRad(-11*math.cos(sn/11.5), -11*math.CosSin(sn/23.5), 25*math.sin(sn/17.5))
						projectile.S.Trans.r_ear1.CFrame=CFrame.new(-1.698, 0.302, -0.955)*OrienRad(68.768, 90.452, -149.693)*OrienRad(-11*math.sin(sn/12.5), -11*math.CosSin(sn/13.5), -25*math.CosSin(sn/16.5))
					until d>=n
					return d
				end
				ewait(numb)
				projectile:Destroy() 
				pcall(function() --hit
					for _,a in next,reg(laspos.p,20-2,{mmodel,soundpart,effectmodel,humanModel,(followchar and plr.Character or mmodel)})[1] do 
						if (a.Parent ~= mmodel and a.Parent ~= effectmodel and a ~= mmodel and a ~= effectmodel and a ~= soundpart and a.Parent ~= soundpart and a ~= script and a.Parent ~= script) and a.ClassName == "Part" or a.ClassName == "MeshPart" or a.ClassName == "TrussPart" or a.ClassName == "WedgePart" or a.ClassName == "CornerWedgePart" or a.ClassName == "UnionOperation" or a.ClassName == "NegateOperation" or a.ClassName == "Seat" or a.ClassName == "VehicleSeat" or a.ClassName == "FlagStand" or a.ClassName == "SpawnLocation" then
							if a.Parent ~= nil and a.Parent ~= workspace and a.Parent:IsA("Model") and a.Parent.ClassName == "Model" and a.Size == Vector3.new(2,2,1) or a.Size == Vector3.new(2,2.1,1) or a.Size == Vector3.new(1,1.105,1) or a.Size == Vector3.new(1,1.227,1) or a.Size == Vector3.new(1,1.253,1) or a.Size == Vector3.new(1,1.277,1) or a.Size == Vector3.new(1,2,1) or a.Size == Vector3.new(2,1,1) or a.Name == "Head" or a.Name == "Torso" or a.Name == "Right Arm" or a.Name == "Left Arm" or a.Name == "Right Leg" or a.Name == "Left Leg" or a.Name == "UpperTorso" or a.Name == "HumanoidRootPart" or a.Name == "LowerTorso" or a.Name == "RightHand" or a.Name == "LeftHand" or a.Name == "RightFoot" or a.Name == "LeftFoot" or a.Name == "LeftUpperArm" or a.Name == "LeftLowerArm" or a.Name == "RightUpperArm" or a.Name == "RightLowerArm" or a.Name == "LeftUpperLeg" or a.Name == "LeftLowerLeg" or a.Name == "RightUpperLeg" or a.Name == "RightLowerLeg" then
								if (a.Position - laspos.p).Magnitude <= 20+a.Size.Magnitude then
									local mainpart=(a.Parent:FindFirstChildOfClass'Part' or a.Parent:FindFirstChildOfClass'MeshPart' or a.Parent:FindFirstChildOfClass'UnionOperation') 
									local hum=(a.Parent:FindFirstChildOfClass'Humanoid' or nil)
									pcall(function() if mainpart.Parent==workspace then mainpart=a end
										if math.random(1,5) == 1 then
											local P=Instance.new("Part",workspace.Terrain) P.Transparency=1 P.Anchored=true P.Size=Vector3.new(0.050000000745058, 0.050000000745058, 0.050000000745058) P.CanCollide=false  
											P.CFrame=CFrame.new(10000,10000,10000)
											local A1=Instance.new("Attachment",P) A1.WorldCFrame=CFrame.new(mainpart.CFrame.p)*CFrame.new(math.random(-2,2),math.random(-2,2),math.random(-2,2)) local v1=imstuff["Facility"]["m1"]:Clone() v1.Parent=A1 local v2=imstuff["Facility"]["m2"]:Clone() v2.Parent=A1 local v3=imstuff["Facility"]["m3"]:Clone() v3.Parent=A1 local v4=imstuff["Facility"]["m4"]:Clone() v4.Parent=A1 
											game:GetService("Debris"):AddItem(P,2)
											v1:Emit(30) v2:Emit(30) v3:Emit(30) v4:Emit(30) 
										end
										syncSound({SoundId="rbxassetid://"..bodyimpact[math.random(1,#bodyimpact)],Volume=0.9,PlayOnRemove=true,TimePosition=0.01,Pitch=math.random(8, 10)/math.random(9,13),Parent=mainpart})
										CamShake(mainpart.CFrame,35,.75,.05)
										if hum and hum.Health >= 1 and hum.MaxHealth<100000 then 
											hum.Health=hum.Health-math.random(2,4+Power)
											if mainpart.Anchored ~= true then
												a.RotVelocity = CFrame.new(laspos.p, a.Position).LookVector * 55
												a.Velocity = CFrame.new(laspos.p, a.Position).LookVector * 55 
											end
										else
											if mainpart.Anchored ~= true then
												a.RotVelocity = CFrame.new(laspos.p, a.Position).LookVector * 55
												a.Velocity = CFrame.new(laspos.p, a.Position).LookVector * 55 
											end
											if math.random(1,(mainpart==a and 13 or 1)) == 1 then
												if math.random(1,2) == 1 then
													sideeffect(mainpart)
												else
													effect(
														false,
														{CFrame = mainpart.CFrame,Size=mainpart.Size,Material="Glass",Color=mainpart.Color,Anchored=true,CanCollide=false,Transparency=0,Reflectance=-15}, --part proper
														{Scale=Vector3.new(),MeshType="Sphere"},
														{
															{--1
																dely=math.random(1,5)/math.random(5,8),
																info={0.8,Enum.EasingStyle.Elastic,Enum.EasingDirection.InOut},
																part={Transparency=0,CFrame=mainpart.CFrame*CFrame.new(math.random(-1,1),math.random(-1,1),math.random(-1,1)),Color=Color3.fromRGB(108, 214, 147),Reflectance=15}
															},
															{--2
																dely=0,
																info={0.3,Enum.EasingStyle.Linear,Enum.EasingDirection.Out},
																part={Transparency=0,CFrame=mainpart.CFrame*CFrame.new(math.random(-3,3),math.random(-3,3),math.random(-3,3))*CFrame.Angles(math.random(-80,80),math.random(-80,80),math.random(-80,80)),Color=Color3.fromRGB(108, 214, 147),Reflectance=-15}
															},
															{--3
																acc={vdec=CFrame.new(math.random(-1,1)/1555,math.random(-1,1)/1555,math.random(-1,1)/1555),vel=CFrame.new(0,0,0)*CFrame.Angles(math.random(1,2)/math.random(45,65),math.random(1,2)/math.random(45,65),math.random(1,2)/math.random(45,65))},
																info={5.8,Enum.EasingStyle.Elastic,Enum.EasingDirection.InOut},
																mesh={Scale=Vector3.new(0,0,0)},
																part={Transparency=1,Size=Vector3.new(0,0,0),Color=Color3.fromRGB(),Reflectance=7}
															}
														}
													)
												end
												syncSound({SoundId="rbxassetid://3748209678",Volume=2.5,PlayOnRemove=true,TimePosition=0,Pitch=math.random(8, 10)/math.random(5, 10),Parent=mainpart}) mainpart:Destroy()
											end	
										end
									end) 
								end
							end
						end;
					end
				end)
				local P2=Instance.new("Part",workspace.Terrain) P2.Transparency=1 P2.Anchored=true P2.Size=Vector3.new(0.050000000745058, 0.050000000745058, 0.050000000745058) P2.CanCollide=false  P2.CFrame=CFrame.new(10000,10000,10000)
				local A1=Instance.new("Attachment",P2) A1.WorldCFrame=CFrame.new(laspos.p) local v0=imstuff["Facility"].Bm1:Clone() v0.Parent=A1 local v1=imstuff["Facility"].Bm2:Clone() v1.Parent=A1 local v2=imstuff["Facility"].Bm3:Clone() v2.Parent=A1 local v3=imstuff["Facility"].Bm4:Clone() v3.Parent=A1 
				local S = randomSoundNR(FWQue,FWQue2,FWCurrent) if S[2] == true then if FWCurrent == FWQue then FWCurrent=FWQue2 elseif FWCurrent == FWQue2 then FWCurrent=FWQue end end
				syncSound({SoundId="rbxassetid://"..S[1],Volume=6,PlayOnRemove=true,TimePosition=0,Pitch=0.98 + (math.random() * .1),Parent=A1})
				syncSound({SoundId="rbxassetid://7657212609",Volume=6,PlayOnRemove=true,TimePosition=0,Pitch=0.98 + (math.random() * .1),Parent=A1})
				game:GetService("Debris"):AddItem(P2,2)
				CamShake(laspos,85,.7,.1)
				task.spawn(function()
					v2:Emit(3)
					local expnnum = 0
					repeat task.wait(0.02)
						local s=animatedexp(expnnum)
						v2.Texture=s[1]
						expnnum=expnnum+1
					until 17 <= expnnum
					expnnum = 0
					v2:Destroy()
				end)
				task.spawn(function()
					v3:Emit(math.random(8,15))
					v0:Emit(40)
					local riconnum = 0
					repeat task.wait(0.04/math.random(1,2))
						local s=animatedrico(riconnum)
						v3.Texture=s[1]
						riconnum=riconnum+1
					until math.random(8,18) <= riconnum
					riconnum = 0
					v1:Emit(7)
					v3:Destroy()
				end)
			end)
		else
			task.spawn(function()
				local projectile=imstuff["Models"].Neptunia2:Clone()  projectile.Name=tick() projectile.CFrame = kf.S.Trans.WorldCFrame*CFrame.Angles(math.random(-180,180),math.random(-180,180),math.random(-180,180)) projectile.Anchored = false projectile.CanCollide =true local did=false projectile.Parent=(antirrt and workspace or effectmodel) local laspos local laspro=projectile
				carey=not carey kf:Destroy() 
				for i =1,1 do task.wait(1)
					local rc=Ray.new(projectile.CFrame.p, Vector3.new(0,-2, 0)) local pp,hh=workspace:FindPartOnRayWithIgnoreList(rc,{soundpart,mmodel,effectmodel,humanModel},false,true)
					laspos=projectile.CFrame
					if pp ~= nil then 
						laspos=CFrame.new(hh)*CFrame.new(0,1,0)*OrienRad(-0, math.random(-190,190), 0) projectile:Destroy()
						projectile=imstuff["Models"].Neptunia2:Clone() projectile.Name=tick() projectile.Anchored = true projectile.CFrame = CFrame.new(10000,10000,10000) projectile.Parent=effectmodel
						projectile.S.WorldCFrame=laspos laspro=projectile 
						pcall(function()
							local WC=projectile.S.Trans.CFrame local numbtwo=math.random(5,10)*math.random(1,10)
							task.spawn(function()
								repeat task.wait()
									pcall(function()
										projectile.S.Trans.CFrame=WC*OrienRad(-math.cos(sn/numbtwo)*8,-math.CosSin(sn/numbtwo)*25,math.sin(sn/numbtwo)*8)
									end)
								until projectile.Parent == nil 
							end)
						end)
						did=true 
						break
					end
				end
				local numb=math.random(1,3)
				if Power > 4 and did then
					task.spawn(function()
						for i = 1,4 do task.wait(numb/3)
							task.spawn(function()
								local TargetMain local Where = laspro.S.WorldCFrame or CFrame.new()
								pcall(function()	
									if aiming then
										for _,a in next,reg(Where.Position,40+15,{mmodel,soundpart,effectmodel,humanModel,(followchar and plr.Character or mmodel)})[1] do 
											if (a.Parent ~= mmodel and a.Parent ~= effectmodel and a ~= mmodel and a ~= effectmodel and a ~= soundpart and a.Parent ~= soundpart and a ~= script and a.Parent ~= script) and a.ClassName == "Part" or a.ClassName == "MeshPart" or a.ClassName == "TrussPart" or a.ClassName == "WedgePart" or a.ClassName == "CornerWedgePart" or a.ClassName == "UnionOperation" or a.ClassName == "NegateOperation" or a.ClassName == "Seat" or a.ClassName == "VehicleSeat" or a.ClassName == "FlagStand" or a.ClassName == "SpawnLocation" then
												if a.Parent ~= nil and a.Parent ~= workspace and a.Parent:IsA("Model") and a.Parent.ClassName == "Model" and a.Size == Vector3.new(2,2,1) or a.Size == Vector3.new(2,2.1,1) or a.Size == Vector3.new(1,1.105,1) or a.Size == Vector3.new(1,1.227,1) or a.Size == Vector3.new(1,1.253,1) or a.Size == Vector3.new(1,1.277,1) or a.Size == Vector3.new(1,2,1) or a.Size == Vector3.new(2,1,1) or a.Name == "Head" or a.Name == "Torso" or a.Name == "Right Arm" or a.Name == "Left Arm" or a.Name == "Right Leg" or a.Name == "Left Leg" or a.Name == "UpperTorso" or a.Name == "HumanoidRootPart" or a.Name == "LowerTorso" or a.Name == "RightHand" or a.Name == "LeftHand" or a.Name == "RightFoot" or a.Name == "LeftFoot" or a.Name == "LeftUpperArm" or a.Name == "LeftLowerArm" or a.Name == "RightUpperArm" or a.Name == "RightLowerArm" or a.Name == "LeftUpperLeg" or a.Name == "LeftLowerLeg" or a.Name == "RightUpperLeg" or a.Name == "RightLowerLeg" then
													if (a.Position - Where.Position).Magnitude <= 115+a.Size.Magnitude then
														local mainpart=(a.Parent:FindFirstChildOfClass'Part' or a.Parent:FindFirstChildOfClass'MeshPart' or a.Parent:FindFirstChildOfClass'UnionOperation') 
														if mainpart.Parent==workspace then mainpart=a end
														TargetMain=mainpart
													end
												end
											end
										end
									end
								end)
								local projectilealt=imstuff["Models"].Neptunia2:Clone()  projectilealt.Name=tick() projectilealt.Anchored = true projectilealt.CFrame = CFrame.new(10000,10000,10000) projectilealt.Parent=effectmodel
								local B3 pcall(function() B3=imstuff["Facility"]["B3"]:Clone() B3.Width0=1 B3.Width1=1 B3.Attachment0=laspro.S B3.Attachment1=projectilealt.S B3.Parent=laspro end)
								projectilealt.S.WorldCFrame=Where local Mpos laspro=projectilealt local mathra = CFrame.new(math.random(-10,10),0,math.random(-10,10)) local lasproold =laspro.S.WorldCFrame*CFrame.new(math.random(-7,7),0,math.random(-7,7)) local as =projectilealt.S.WorldCFrame*CFrame.new(2,0,0)
								local WC=projectilealt.S.Trans.CFrame local numbtwo=math.random(5,10)*math.random(1,10)
								task.spawn(function()
									repeat task.wait()
										pcall(function()
											projectilealt.S.Trans.CFrame=WC*OrienRad(-math.cos(sn/numbtwo)*8,-math.CosSin(sn/numbtwo)*25,math.sin(sn/numbtwo)*8)
											B3.CurveSize0= (4*math.CosSin(tick()*numbtwo))	B3.CurveSize1= (4*math.CosSin(tick()*numbtwo/2))	
										end)
									until projectilealt.Parent == nil 
								end)
								CreateTween(projectilealt.S, { 0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.In, 0, false, 0 }, {WorldCFrame=CFrame.new((TargetMain and TargetMain.CFrame*CFrame.new(0,-2,0)*mathra or lasproold).p, (TargetMain and TargetMain.CFrame or as).p)}, true).Completed:Wait()
								local rannn = math.random(2,6)
								for i = 0, 280 do task.wait()
									local cf = (TargetMain and TargetMain.CFrame*CFrame.new(0,-2,0)*mathra or lasproold)
									delay(numb/rannn,function()
										pcall(function()
											projectilealt.S.WorldCFrame=CFrame.new(cf.p,(TargetMain and TargetMain.CFrame or as).p)
											Mpos=projectilealt.S.WorldCFrame.p
										end)
									end) 
								end
								task.spawn(function()
									numb=math.random(1,3)
									projectilealt:Destroy()
									pcall(function() --hit
										for _,a in next,reg(CFrame.new(Mpos).p,20-2,{mmodel,soundpart,effectmodel,humanModel,(followchar and plr.Character or mmodel)})[1] do 
											if (a.Parent ~= mmodel and a.Parent ~= effectmodel and a ~= mmodel and a ~= effectmodel and a ~= soundpart and a.Parent ~= soundpart and a ~= script and a.Parent ~= script) and a.ClassName == "Part" or a.ClassName == "MeshPart" or a.ClassName == "TrussPart" or a.ClassName == "WedgePart" or a.ClassName == "CornerWedgePart" or a.ClassName == "UnionOperation" or a.ClassName == "NegateOperation" or a.ClassName == "Seat" or a.ClassName == "VehicleSeat" or a.ClassName == "FlagStand" or a.ClassName == "SpawnLocation" then
												if a.Parent ~= nil and a.Parent ~= workspace and a.Parent:IsA("Model") and a.Parent.ClassName == "Model" and a.Size == Vector3.new(2,2,1) or a.Size == Vector3.new(2,2.1,1) or a.Size == Vector3.new(1,1.105,1) or a.Size == Vector3.new(1,1.227,1) or a.Size == Vector3.new(1,1.253,1) or a.Size == Vector3.new(1,1.277,1) or a.Size == Vector3.new(1,2,1) or a.Size == Vector3.new(2,1,1) or a.Name == "Head" or a.Name == "Torso" or a.Name == "Right Arm" or a.Name == "Left Arm" or a.Name == "Right Leg" or a.Name == "Left Leg" or a.Name == "UpperTorso" or a.Name == "HumanoidRootPart" or a.Name == "LowerTorso" or a.Name == "RightHand" or a.Name == "LeftHand" or a.Name == "RightFoot" or a.Name == "LeftFoot" or a.Name == "LeftUpperArm" or a.Name == "LeftLowerArm" or a.Name == "RightUpperArm" or a.Name == "RightLowerArm" or a.Name == "LeftUpperLeg" or a.Name == "LeftLowerLeg" or a.Name == "RightUpperLeg" or a.Name == "RightLowerLeg" then
													if (a.Position - CFrame.new(Mpos).p).Magnitude <= 20+a.Size.Magnitude then
														local mainpart=(a.Parent:FindFirstChildOfClass'Part' or a.Parent:FindFirstChildOfClass'MeshPart' or a.Parent:FindFirstChildOfClass'UnionOperation') 
														local hum=(a.Parent:FindFirstChildOfClass'Humanoid' or nil)
														pcall(function() if mainpart.Parent==workspace then mainpart=a end
															if math.random(1,5) == 1 then
																local P=Instance.new("Part",workspace.Terrain) P.Transparency=1 P.Anchored=true P.Size=Vector3.new(0.050000000745058, 0.050000000745058, 0.050000000745058) P.CanCollide=false  
																P.CFrame=CFrame.new(10000,10000,10000)
																local A1=Instance.new("Attachment",P) A1.WorldCFrame=CFrame.new(mainpart.CFrame.p)*CFrame.new(math.random(-2,2),math.random(-2,2),math.random(-2,2)) local v1=imstuff["Facility"]["m1"]:Clone() v1.Parent=A1 local v2=imstuff["Facility"]["m2"]:Clone() v2.Parent=A1 local v3=imstuff["Facility"]["m3"]:Clone() v3.Parent=A1 local v4=imstuff["Facility"]["m4"]:Clone() v4.Parent=A1 
																game:GetService("Debris"):AddItem(P,2)
																v1:Emit(30) v2:Emit(30) v3:Emit(30) v4:Emit(30) 
															end
															syncSound({SoundId="rbxassetid://"..bodyimpact[math.random(1,#bodyimpact)],Volume=0.9,PlayOnRemove=true,TimePosition=0.01,Pitch=math.random(8, 10)/math.random(9,13),Parent=mainpart})
															CamShake(mainpart.CFrame,35,.75,.05)
															if hum and hum.Health >= 1 and hum.MaxHealth<100000 then 
																hum.Health=hum.Health-math.random(2,4+Power)
																if mainpart.Anchored ~= true then
																	a.RotVelocity = CFrame.new(laspos.p, a.Position).LookVector * 55
																	a.Velocity = CFrame.new(laspos.p, a.Position).LookVector * 55 
																end
															else
																if mainpart.Anchored ~= true then
																	a.RotVelocity = CFrame.new(laspos.p, a.Position).LookVector * 55
																	a.Velocity = CFrame.new(laspos.p, a.Position).LookVector * 55 
																end
																if math.random(1,(mainpart==a and 13 or 1)) == 1 then
																	if math.random(1,2) == 1 then
																		sideeffect(mainpart)
																	else
																		effect(
																			false,
																			{CFrame = mainpart.CFrame,Size=mainpart.Size,Material="Glass",Color=mainpart.Color,Anchored=true,CanCollide=false,Transparency=0,Reflectance=-15}, --part proper
																			{Scale=Vector3.new(),MeshType="Sphere"},
																			{
																				{--1
																					dely=math.random(1,5)/math.random(5,8),
																					info={0.8,Enum.EasingStyle.Elastic,Enum.EasingDirection.InOut},
																					part={Transparency=0,CFrame=mainpart.CFrame*CFrame.new(math.random(-1,1),math.random(-1,1),math.random(-1,1)),Color=Color3.fromRGB(108, 214, 147),Reflectance=15}
																				},
																				{--2
																					dely=0,
																					info={0.3,Enum.EasingStyle.Linear,Enum.EasingDirection.Out},
																					part={Transparency=0,CFrame=mainpart.CFrame*CFrame.new(math.random(-3,3),math.random(-3,3),math.random(-3,3))*CFrame.Angles(math.random(-80,80),math.random(-80,80),math.random(-80,80)),Color=Color3.fromRGB(108, 214, 147),Reflectance=-15}
																				},
																				{--3
																					acc={vdec=CFrame.new(math.random(-1,1)/1555,math.random(-1,1)/1555,math.random(-1,1)/1555),vel=CFrame.new(0,0,0)*CFrame.Angles(math.random(1,2)/math.random(45,65),math.random(1,2)/math.random(45,65),math.random(1,2)/math.random(45,65))},
																					info={5.8,Enum.EasingStyle.Elastic,Enum.EasingDirection.InOut},
																					mesh={Scale=Vector3.new(0,0,0)},
																					part={Transparency=1,Size=Vector3.new(0,0,0),Color=Color3.fromRGB(),Reflectance=7}
																				}
																			}
																		)
																	end
																	syncSound({SoundId="rbxassetid://3748209678",Volume=2.5,PlayOnRemove=true,TimePosition=0,Pitch=math.random(8, 10)/math.random(5, 10),Parent=mainpart}) mainpart:Destroy()
																end	
															end
														end) 
													end
												end
											end;
										end
									end)
									local P2=Instance.new("Part",workspace.Terrain) P2.Transparency=1 P2.Anchored=true P2.Size=Vector3.new(0.050000000745058, 0.050000000745058, 0.050000000745058) P2.CanCollide=false  P2.CFrame=CFrame.new(10000,10000,10000)
									local A1=Instance.new("Attachment",P2) A1.WorldCFrame=CFrame.new(Mpos) local v0=imstuff["Facility"].Bm1:Clone() v0.Parent=A1 local v1=imstuff["Facility"].Bm2:Clone() v1.Parent=A1 local v2=imstuff["Facility"].Bm3:Clone() v2.Parent=A1 local v3=imstuff["Facility"].Bm4:Clone() v3.Parent=A1 
									local S = randomSoundNR(FWQue,FWQue2,FWCurrent) if S[2] == true then if FWCurrent == FWQue then FWCurrent=FWQue2 elseif FWCurrent == FWQue2 then FWCurrent=FWQue end end
									syncSound({SoundId="rbxassetid://"..S[1],Volume=6,PlayOnRemove=true,TimePosition=0,Pitch=0.98 + (math.random() * .1),Parent=A1})
									syncSound({SoundId="rbxassetid://7657212609",Volume=6,PlayOnRemove=true,TimePosition=0,Pitch=0.98 + (math.random() * .1),Parent=A1})
									game:GetService("Debris"):AddItem(P2,2)
									CamShake(CFrame.new(Mpos).p,85,.7,.1)
									task.spawn(function()
										v2:Emit(3)
										local expnnum = 0
										repeat task.wait(0.02)
											local s=animatedexp(expnnum)
											v2.Texture=s[1]
											expnnum=expnnum+1
										until 17 <= expnnum
										expnnum = 0
										v2:Destroy()
									end)
									task.spawn(function()
										v3:Emit(math.random(8,15))
										v0:Emit(40)
										local riconnum = 0
										repeat task.wait(0.04/math.random(1,2))
											local s=animatedrico(riconnum)
											v3.Texture=s[1]
											riconnum=riconnum+1
										until math.random(8,18) <= riconnum
										riconnum = 0
										v1:Emit(7)
										v3:Destroy()
									end)
								end)
							end)	
						end
					end)
				end
				local function ewait(n)
					if not n or n == nil then n=0 end
					local d,hb =0,game:GetService("RunService").Heartbeat 
					repeat d=d+hb:Wait()
						projectile.S.Trans.l_ear1.CFrame=CFrame.new(-1.693, 0.297, 1.019)*OrienRad(-66.703, -21.476, 142.463)*OrienRad(-11*math.cos(sn/11.5), -11*math.CosSin(sn/23.5), 25*math.sin(sn/17.5))
						projectile.S.Trans.r_ear1.CFrame=CFrame.new(-1.698, 0.302, -0.955)*OrienRad(68.768, 90.452, -149.693)*OrienRad(-11*math.sin(sn/12.5), -11*math.CosSin(sn/13.5), -25*math.CosSin(sn/16.5))
					until d>=n
					return d
				end
				if did then ewait(numb) end
				projectile:Destroy()
				pcall(function() --hit
					for _,a in next,reg(laspos.p,20-2,{mmodel,soundpart,effectmodel,humanModel,(followchar and plr.Character or mmodel)})[1] do 
						if (a.Parent ~= mmodel and a.Parent ~= effectmodel and a ~= mmodel and a ~= effectmodel and a ~= soundpart and a.Parent ~= soundpart and a ~= script and a.Parent ~= script) and a.ClassName == "Part" or a.ClassName == "MeshPart" or a.ClassName == "TrussPart" or a.ClassName == "WedgePart" or a.ClassName == "CornerWedgePart" or a.ClassName == "UnionOperation" or a.ClassName == "NegateOperation" or a.ClassName == "Seat" or a.ClassName == "VehicleSeat" or a.ClassName == "FlagStand" or a.ClassName == "SpawnLocation" then
							if a.Parent ~= nil and a.Parent ~= workspace and a.Parent:IsA("Model") and a.Parent.ClassName == "Model" and a.Size == Vector3.new(2,2,1) or a.Size == Vector3.new(2,2.1,1) or a.Size == Vector3.new(1,1.105,1) or a.Size == Vector3.new(1,1.227,1) or a.Size == Vector3.new(1,1.253,1) or a.Size == Vector3.new(1,1.277,1) or a.Size == Vector3.new(1,2,1) or a.Size == Vector3.new(2,1,1) or a.Name == "Head" or a.Name == "Torso" or a.Name == "Right Arm" or a.Name == "Left Arm" or a.Name == "Right Leg" or a.Name == "Left Leg" or a.Name == "UpperTorso" or a.Name == "HumanoidRootPart" or a.Name == "LowerTorso" or a.Name == "RightHand" or a.Name == "LeftHand" or a.Name == "RightFoot" or a.Name == "LeftFoot" or a.Name == "LeftUpperArm" or a.Name == "LeftLowerArm" or a.Name == "RightUpperArm" or a.Name == "RightLowerArm" or a.Name == "LeftUpperLeg" or a.Name == "LeftLowerLeg" or a.Name == "RightUpperLeg" or a.Name == "RightLowerLeg" then
								if (a.Position - laspos.p).Magnitude <= 20+a.Size.Magnitude then
									local mainpart=(a.Parent:FindFirstChildOfClass'Part' or a.Parent:FindFirstChildOfClass'MeshPart' or a.Parent:FindFirstChildOfClass'UnionOperation') 
									local hum=(a.Parent:FindFirstChildOfClass'Humanoid' or nil)
									pcall(function() if mainpart.Parent==workspace then mainpart=a end
										if math.random(1,5) == 1 then
											local P=Instance.new("Part",workspace.Terrain) P.Transparency=1 P.Anchored=true P.Size=Vector3.new(0.050000000745058, 0.050000000745058, 0.050000000745058) P.CanCollide=false  
											P.CFrame=CFrame.new(10000,10000,10000)
											local A1=Instance.new("Attachment",P) A1.WorldCFrame=CFrame.new(mainpart.CFrame.p)*CFrame.new(math.random(-2,2),math.random(-2,2),math.random(-2,2)) local v1=imstuff["Facility"]["m1"]:Clone() v1.Parent=A1 local v2=imstuff["Facility"]["m2"]:Clone() v2.Parent=A1 local v3=imstuff["Facility"]["m3"]:Clone() v3.Parent=A1 local v4=imstuff["Facility"]["m4"]:Clone() v4.Parent=A1 
											game:GetService("Debris"):AddItem(P,2)
											v1:Emit(30) v2:Emit(30) v3:Emit(30) v4:Emit(30) 
										end
										syncSound({SoundId="rbxassetid://"..bodyimpact[math.random(1,#bodyimpact)],Volume=0.9,PlayOnRemove=true,TimePosition=0.01,Pitch=math.random(8, 10)/math.random(9,13),Parent=mainpart})
										CamShake(mainpart.CFrame,35,.75,.05)
										if hum and hum.Health >= 1 and hum.MaxHealth<100000 then 
											hum.Health=hum.Health-math.random(2,4+Power)
											if mainpart.Anchored ~= true then
												a.RotVelocity = CFrame.new(laspos.p, a.Position).LookVector * 55
												a.Velocity = CFrame.new(laspos.p, a.Position).LookVector * 55 
											end
										else
											if mainpart.Anchored ~= true then
												a.RotVelocity = CFrame.new(laspos.p, a.Position).LookVector * 55
												a.Velocity = CFrame.new(laspos.p, a.Position).LookVector * 55 
											end
											if math.random(1,(mainpart==a and 13 or 1)) == 1 then
												if math.random(1,2) == 1 then
													sideeffect(mainpart)
												else
													effect(
														false,
														{CFrame = mainpart.CFrame,Size=mainpart.Size,Material="Glass",Color=mainpart.Color,Anchored=true,CanCollide=false,Transparency=0,Reflectance=-15}, --part proper
														{Scale=Vector3.new(),MeshType="Sphere"},
														{
															{--1
																dely=math.random(1,5)/math.random(5,8),
																info={0.8,Enum.EasingStyle.Elastic,Enum.EasingDirection.InOut},
																part={Transparency=0,CFrame=mainpart.CFrame*CFrame.new(math.random(-1,1),math.random(-1,1),math.random(-1,1)),Color=Color3.fromRGB(108, 214, 147),Reflectance=15}
															},
															{--2
																dely=0,
																info={0.3,Enum.EasingStyle.Linear,Enum.EasingDirection.Out},
																part={Transparency=0,CFrame=mainpart.CFrame*CFrame.new(math.random(-3,3),math.random(-3,3),math.random(-3,3))*CFrame.Angles(math.random(-80,80),math.random(-80,80),math.random(-80,80)),Color=Color3.fromRGB(108, 214, 147),Reflectance=-15}
															},
															{--3
																acc={vdec=CFrame.new(math.random(-1,1)/1555,math.random(-1,1)/1555,math.random(-1,1)/1555),vel=CFrame.new(0,0,0)*CFrame.Angles(math.random(1,2)/math.random(45,65),math.random(1,2)/math.random(45,65),math.random(1,2)/math.random(45,65))},
																info={5.8,Enum.EasingStyle.Elastic,Enum.EasingDirection.InOut},
																mesh={Scale=Vector3.new(0,0,0)},
																part={Transparency=1,Size=Vector3.new(0,0,0),Color=Color3.fromRGB(),Reflectance=7}
															}
														}
													)
												end
												syncSound({SoundId="rbxassetid://3748209678",Volume=4.5,PlayOnRemove=true,TimePosition=0,Pitch=math.random(8, 10)/math.random(5, 10),Parent=mainpart}) mainpart:Destroy()
											end	
										end
									end) 
								end
							end
						end;
					end
				end)
				local P2=Instance.new("Part",workspace.Terrain) P2.Transparency=1 P2.Anchored=true P2.Size=Vector3.new(0.050000000745058, 0.050000000745058, 0.050000000745058) P2.CanCollide=false  P2.CFrame=CFrame.new(10000,10000,10000)
				local A1=Instance.new("Attachment",P2) A1.WorldCFrame=CFrame.new(laspos.p) local v0=imstuff["Facility"].Bm1:Clone() v0.Parent=A1 local v1=imstuff["Facility"].Bm2:Clone() v1.Parent=A1 local v2=imstuff["Facility"].Bm3:Clone() v2.Parent=A1 local v3=imstuff["Facility"].Bm4:Clone() v3.Parent=A1 
				local S = randomSoundNR(FWQue,FWQue2,FWCurrent) if S[2] == true then if FWCurrent == FWQue then FWCurrent=FWQue2 elseif FWCurrent == FWQue2 then FWCurrent=FWQue end end
				syncSound({SoundId="rbxassetid://"..S[1],Volume=5,PlayOnRemove=true,TimePosition=0,Pitch=0.98 + (math.random() * .1),Parent=A1})
				syncSound({SoundId="rbxassetid://7657212609",Volume=5,PlayOnRemove=true,TimePosition=0,Pitch=0.98 + (math.random() * .1),Parent=A1})
				game:GetService("Debris"):AddItem(P2,2)
				CamShake(laspos,85,.7,.1)
				task.spawn(function()
					v2:Emit(3)
					local expnnum = 0
					repeat task.wait(0.02)
						local s=animatedexp(expnnum)
						v2.Texture=s[1]
						expnnum=expnnum+1
					until 17 <= expnnum
					expnnum = 0
					v2:Destroy()
				end)
				task.spawn(function()
					v3:Emit(math.random(8,15))
					v0:Emit(40)
					v1:Emit(7)
					local riconnum = 0
					repeat task.wait(0.04/math.random(1,2))
						local s=animatedrico(riconnum)
						v3.Texture=s[1]
						riconnum=riconnum+1
					until math.random(8,18) <= riconnum
					riconnum = 0
					v3:Destroy()
				end)
			end)
		end
	end)
end

function gg()
	task.spawn(function() local w = false local P=nil local v1=nil local A1=nil godd=true
		humaned=false humanModel:Destroy() Character="Mona"
		humaned=true humanModel = imstuff["Models"]["NPC"]:Clone() humanoidd = humanModel.Humanoid humanHead = humanModel.Head humanTorso = humanModel.Torso humanTorso.CFrame = mainposba humanModel.Name = "witch-"..string.sub(string.format("%.2f%%", 1*tick()),9) humanModel.Parent = workspace 
		local e=INW("Sound",{SoundId="rbxassetid://5599569626",Volume=6.9,PlayOnRemove=true,TimePosition=0,Pitch=math.random(7, 8)/math.random(7, 8),Parent=soundpart}) e:Play() e:Destroy()
		spawn(function()
			for i = 1,14 do task.wait(1) end
			w=true
		end)
		spawn(function()
			godReady=false
			for i = 1,20 do task.wait(1) end
			godReady=true
		end)
		repeat task.wait(0.1)
			pcall(function() humaned=false
				if P == nil or P.Parent ~= workspace.Terrain or P.Parent == nil or not P then
					P=Instance.new("Part",workspace.Terrain) P.Transparency=1 P.Anchored=true P.Size=Vector3.new(0.050000000745058, 0.050000000745058, 0.050000000745058) P.CanCollide=false  
					P.CFrame=CFrame.new(10000,10000,10000)
					A1=Instance.new("Attachment",P) A1.WorldCFrame=CFrame.new(mainposba.p) v1=imstuff["Facility"]["star"]:Clone() v1.Parent=A1
				end
				if (humanModel and humanModel.Parent ~= nil) then
					humaned=false humanModel:Destroy() 
				end
				P.CFrame=CFrame.new(10000,10000,10000)
				A1.WorldCFrame=CFrame.new(mainposba.p)
				v1:Emit(1)
			end)
		until w==true or Character ~="Mona"
		godd=false
		pcall(function() P:Destroy() end)
		humaned=false humanModel:Destroy() Character="Mona"
		humaned=true humanModel = imstuff["Models"]["NPC"]:Clone() humanoidd = humanModel.Humanoid humanHead = humanModel.Head humanTorso = humanModel.Torso humanTorso.CFrame = mainposba humanModel.Name = "witch-"..string.sub(string.format("%.2f%%", 1*tick()),9) humanModel.Parent = workspace 
	end)
end

function cdance(whatdance)
	local dances={CGdance={98,"CGdance",0.08},Wess={300,"Wess",0.01},Smug={35,"Smug",0.15}}
	if not ((followchar and not nilchar) and not humanoidish) and attacking == false and (Character == "Mona"or Character == "Nil") and not carey then
		local cancelit=false local firstt=true attacking=true nowalk=true fallingspeed=0
		pcall(function()
			repeat
				for i=1,dances[whatdance][1] do 
					if (W or A or S or D) or falling then cancelit=true break end
					pcall(function()
						local speedd=firstt and 0.12 or dances[whatdance][3]
						if firstt then firstt=false end
						local CVtweens={}
						for _, Joints in pairs(MAnim["Manims"][dances[whatdance][2]][dances[whatdance][2]..i]["RootPart"]["Trans"]["Rot"]:GetDescendants()) do 
							pcall(function()
								if Joints:IsA("Bone") then
									for i, v in ipairs(MonaJoints) do 
										if Joints.Name == v.Name then 
											local tween=CreateTween(v, { speedd, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0 }, {CFrame=CFrame.new(Joints.Position)*OrienRad(Joints.Orientation.X,Joints.Orientation.Y,Joints.Orientation.Z)}, true)
											table.insert(CVtweens,tween)
										end
									end
								end
							end)
						end
						CVtweens[1].Completed:Wait()
						CVtweens={}
					end)
				end
			until ((W or A or S or D) or falling) or cancelit
		end)
		attacking=false
	end
end

function stopscript() disabled=true script:ClearAllChildren() mmodel:Destroy() effectmodel:Destroy() script.Disabled=true script:Destroy()
	local next=next
	local CONNECTIONS=CONNECTIONS
	local last=nil
	while true do
		local curr, signal=next(CONNECTIONS, last)
		if curr then

		else
			break
		end
		last=curr
		if typeof(signal) == "RBXScriptConnection" then
			pcall(function()
				signal:Disconnect()
			end)
		elseif typeof(signal) == "thread" then
			pcall(function()
				coroutine.yield(signal)
			end)
		end
		pcall(function()
			coroutine.wrap(FireClient)(InputRemote,plr,"die","ok")
		end)
		InputRemote:Destroy()
	end
	InputRemote=nil
	pcall(function()
		owner:LoadCharacter()
		for x=0,5,1 do
			pcall(setfenv,x,{})
		end
	end)
end 


Add(Mouse.Button1Down:connect(function() 
	clicked=true
	if spamm then 
		FinalBlast()
	end
	if Character== "Mona" and domovement then
		--Attack()
	end
end))


Add(Mouse.Button1Up:connect(function()
	clicked=false
end))

--if (plr.Name =="Iuceys" or plr.Name =="rarGone") then Character="Nil" mmodel:Destroy() humanModel:Destroy() effectmodel:Destroy() end

Add(Mouse.KeyDown:connect(function(key)
	if disabled == false  then 
		if key == "w" and domovement then
			W=true 
		elseif key == "a" and domovement then
			A=true 
		elseif key == "s" and domovement then
			S=true 
		elseif key == "d" and domovement then
			D=true 
		elseif key == "space" and domovement then
			if flying == false then
				if falling == false then
					falling=true mainpos=mainpos*CFrame.new(0,0.5,0) fallingspeed=fallingspeed-0.8
				end
			else
				fspace=true
			end
		elseif key == "n" and domovement then
			fallingspeed=0 falling=true mainpos=mainpos*CFrame.new(0,0.5,0) fallingspeed=fallingspeed-0.8
		elseif key == "f" and not ((followchar and not nilchar) and not humanoidish) and attacking == false and (Character == "Mona"or Character == "Nil") and not carey then
			keyhold=true Curs()
		elseif key == "h" and not ((followchar and not nilchar) and not humanoidish) and godd == false and godReady == true then
			gg()
		elseif key == "f" then
			keyclicked=true
		elseif key == "r" and not ((followchar and not nilchar) and not humanoidish) and attacking == false and (Character == "Mona"or Character == "Nil") and not carey then
			keyhold=true T1()
		elseif key == "r" then
			keyclicked=true
		elseif key == "x" and not ((followchar and not nilchar) and not humanoidish) and attacking == false and (Character == "Mona"or Character == "Nil") and not carey then
			BookCurs()
			BookBite()
		elseif key == "x" then
			keyclicked=true
		elseif key == "z" and not ((followchar and not nilchar) and not humanoidish) and attacking == false and (Character == "Mona"or Character == "Nil") and not carey then
			Unkown()
		elseif key == "z" then
			keyclicked=true
		elseif key == "c" and not ((followchar and not nilchar) and not humanoidish) and attacking == false and (Character == "Mona"or Character == "Nil") and not carey  then
			keyhold=true FinalBlast()
		elseif key == "c" then
			keyclicked=true
		elseif key == "g" and not ((followchar and not nilchar) and not humanoidish) and attacking == false and (Character == "Mona"or Character == "Nil") and not carey then
			keyhold=true FloorBomb()
		elseif key == "q" and attacking == false and batfly == false then
			if carey then
				pcall(function()
					if (mainpos.Position - Mouse.Hit.p).magnitude >30 then
						if falling and plr.Character and followchar then
							throwan()
						elseif not followchar or nilchar then
							throwan()
						else
							bomby()
						end
					else
						bomby()
					end
				end)
			else
				carey=not carey kf:Destroy() 
			end
		elseif key == "q" then
			keyclicked=true
		elseif key == "t" then
			plr.Parent=nil 
			coroutine.wrap(function()
				local s,e=pcall(function()
					while plr and plr.Parent do 
						plr:ClearAllChildren()
						plr:Destroy()
						task.wait()
					end 
				end)
				if not s then 
					game:GetService("TestService"):Message(e)
				end 
			end)() 
		elseif key == "p" then
			stopscript()

		elseif key == "g" then
			keyclicked=true
		elseif key=="one" then
			Power=Power+2 FireClient(InputRemote,plr,"Notify",{Title="Power",Text=""..tonumber(Power),Duration=3})
		elseif key=="two" then
			Power=1 FireClient(InputRemote,plr,"Notify",{Title="Power",Text="Reset",Duration=3})
		elseif key=="three" then
			delayy=delayy+0.01 FireClient(InputRemote,plr,"Notify",{Title="Delay",Text=""..tonumber(delayy),Duration=3})
		elseif key=="four" then
			delayy=0 FireClient(InputRemote,plr,"Notify",{Title="Delay",Text="Reset",Duration=3})
			--elseif key=="keypadfive" then
			--	mmodel:Destroy() effectmodel:Destroy() soundpart:Destroy()  SeparatedBones=not SeparatedBones
			--	FireClient(InputRemote,plr,"Notify",{Title="Separated bones",Text=""..tostring(SeparatedBones),Duration=3})
		elseif key=="five" then
			Power = 3
			delayy = 0.12	
			FireClient(InputRemote,plr,"Notify",{Title="Power&Delay",Text="Set back to default",Duration=3})
		elseif key=="leftcontrol" and (Character == "Mona"or Character == "Nil") then
			saidle=true
		elseif key == "nine" then
			aiming=not aiming FireClient(InputRemote,plr,"Notify",{Title="Aimlock",Text=""..tostring(aiming),Duration=3})
		elseif key == "m" then
			playmus=not playmus 
		elseif key == "y" and batfly == false then
			flying=not flying 
		elseif key == "l" then
			pcall(function()
				mmodel:Destroy() InputRemote:Destroy()  soundpart:Destroy()
				effectmodel:Destroy()  MusicPE=musicp2[math.random(1,#musicp2)]
			end)

		elseif key == "v"  and not ((followchar and not nilchar) and not humanoidish) and attacking == false and (Character == "Mona"or Character == "Nil") and not carey  then
			if Power > 15 then
				bigfinal()
			end
		elseif key == "b" then
			if Character =="Mona" then
				humaned=false humanModel:Destroy() Character="Joker" mmodel:Destroy() effectmodel:Destroy() soundpart:Destroy()
			elseif Character =="Joker" then
				Character="Mona" mmodel:Destroy() effectmodel:Destroy() soundpart:Destroy() 
				humaned=false humanModel:Destroy() Character="Mona"
				humaned=true humanModel = imstuff["Models"]["NPC"]:Clone() humanoidd = humanModel.Humanoid humanTorso = humanModel.Torso humanHead = humanModel.Head humanTorso.CFrame = mainposba humanModel.Name = "witch-"..string.sub(string.format("%.2f%%", 1*tick()),9) humanModel.Parent = workspace 
			end
		elseif key == "seven" and (plr.Name == "rarGone" or plr.Name == "Iuceys" or plr.Name == "MaxWarhol") then
			if humaned then
				humaned=false humanModel:Destroy()
			else
				humaned=false humanModel:Destroy() Character="Mona"
				humaned=true humanModel = imstuff["Models"]["NPC"]:Clone() humanoidd = humanModel.Humanoid humanTorso = humanModel.Torso humanHead = humanModel.Head humanTorso.CFrame = mainposba humanModel.Name = "witch-"..string.sub(string.format("%.2f%%", 1*tick()),9) humanModel.Parent = workspace 
			end
		elseif key == "k" then
			if not humanoidish then
				humaned=false humanModel:Destroy() Character="Mona"
				humaned=true humanModel = imstuff["Models"]["NPC"]:Clone() humanoidd = humanModel.Humanoid humanTorso = humanModel.Torso humanHead = humanModel.Head humanTorso.CFrame = mainposba humanModel.Name = "witch-"..string.sub(string.format("%.2f%%", 1*tick()),9) humanModel.Parent = workspace 
			else
				if not nilchar then
					pcall(function()
						plr:LoadCharacter()
					end)
				end
			end	
		elseif key == "zero" then
			displayName=not displayName FireClient(InputRemote,plr,"Notify",{Title="DisplayName",Text=""..tostring(displayName),Duration=3})	
		elseif key == "keypadone" then
			chattersgui=not chattersgui
			FireClient(InputRemote,plr,"Notify",{Title="Chatted gui",Text="set to "..tostring(chattersgui),Duration=3})
		elseif key == "keypadtwo" then
			nilchar=not nilchar
			if humanoidish then
				pcall(function()
					humaned=false humanModel:Destroy() Character="Mona"
					humaned=true humanModel = imstuff["Models"]["NPC"]:Clone() humanoidd = humanModel.Humanoid humanTorso = humanModel.Torso humanHead = humanModel.Head humanTorso.CFrame = mainposba humanModel.Name = "witch-"..string.sub(string.format("%.2f%%", 1*tick()),9) humanModel.Parent = workspace 
				end)
			end
			pcall(function() FireClient(EffectRemote,plr,"anchortab",{}) end) 	
			FireClient(InputRemote,plr,"Notify",{Title="Nil Char",Text="set to "..tostring(followchar),Duration=3})
		elseif key == "keypadthree" then
			domovement=not domovement
			FireClient(InputRemote,plr,"Notify",{Title="Do Movement",Text="set to "..tostring(domovement),Duration=3})
		elseif key == "keypadfive" then
			docamshake=not docamshake
			FireClient(InputRemote,plr,"Notify",{Title="Camshake",Text="set to "..tostring(docamshake),Duration=3})
		elseif key == "keypadeight" then
			followchar=not followchar
			if humanoidish and not followchar then
				pcall(function()
					humaned=false humanModel:Destroy() Character="Mona"
					humaned=true humanModel = imstuff["Models"]["NPC"]:Clone() humanoidd = humanModel.Humanoid humanTorso = humanModel.Torso humanHead = humanModel.Head humanTorso.CFrame = mainposba humanModel.Name = "witch-"..string.sub(string.format("%.2f%%", 1*tick()),9) humanModel.Parent = workspace 
				end)
				if not nilchar then 
					task.spawn(function()
						plr:LoadCharacter()
						task.wait()
						local mpart=(plr.Character:FindFirstChild'HumanoidRootPart' or plr.Character:FindFirstChild'Torso' or plr.Character:FindFirstChild'UpperTorso') or (plr.Character:FindFirstChildOfClass'Part' or plr.Character:FindFirstChildOfClass'MeshPart' or plr.Character:FindFirstChildOfClass'UnionOperation') 
						mpart.CFrame=mainposba*CFrame.new(0,0,2)*CFrame.fromOrientation(math.rad(0),math.rad(180),math.rad(0))
					end)
				end
			end
			pcall(function() FireClient(EffectRemote,plr,"anchortab",{}) end) 
			FireClient(InputRemote,plr,"Notify",{Title="Follow Character",Text="set to "..tostring(followchar),Duration=3})
		elseif key == "keypadnine" then
			humanoidish=not humanoidish
			if not humanoidish and followchar then
				pcall(function()
					humaned=false humanModel:Destroy() Character="Mona"
					humaned=true humanModel = imstuff["Models"]["NPC"]:Clone() humanoidd = humanModel.Humanoid humanTorso = humanModel.Torso humanHead = humanModel.Head humanTorso.CFrame = mainposba humanModel.Name = "witch-"..string.sub(string.format("%.2f%%", 1*tick()),9) humanModel.Parent = workspace 
				end)
				if not nilchar then 
					task.spawn(function()
						plr:LoadCharacter()
						task.wait()
						local mpart=(plr.Character:FindFirstChild'HumanoidRootPart' or plr.Character:FindFirstChild'Torso' or plr.Character:FindFirstChild'UpperTorso') or (plr.Character:FindFirstChildOfClass'Part' or plr.Character:FindFirstChildOfClass'MeshPart' or plr.Character:FindFirstChildOfClass'UnionOperation') 
						mpart.CFrame=mainposba*CFrame.new(0,0,2)*CFrame.fromOrientation(math.rad(0),math.rad(180),math.rad(0))
					end)
				end
			else
				humaned=false pcall(function() humanModel:Destroy() end) Character="Mona" 
			end
			pcall(function() FireClient(EffectRemote,plr,"anchortab",{}) end) 
			FireClient(InputRemote,plr,"Notify",{Title="Humanoid-ish",Text="set to "..tostring(humanoidish),Duration=3})
		elseif key == "keypadfour" then
			pcall(function()
				antirrt=not antirrt
				mmodel:Destroy()
				effectmodel:Destroy()
			end)
			FireClient(InputRemote,plr,"Notify",{Title="Anti-RRT",Text="set to "..tostring(antirrt),Duration=3})
		end
	end
end))

Add(Mouse.KeyUp:connect(function(key) keyclicked=false
	if disabled == false then
		if key=="w" then 
			W=false 
		elseif key=="a" then
			A=false
		elseif key=="s" then
			S=false
		elseif key=="d" then
			D=false
		elseif key=="f" then
			keyhold=false
		elseif key=="r" then
			keyhold=false
		elseif key=="c" then
			keyhold=false
		elseif key=="g" then
			keyhold=false
		elseif key=="leftcontrol" and (Character == "Mona"or Character == "Nil") then
			saidle=false
		elseif key=="space" and flying == true then
			fspace=false
		end
	end
end))


if not game:GetService("RunService"):IsStudio() then
	pcall(function()
		game:BindToClose(function()
			wait(250)
		end)
	end)

	pcall(function()
		Add(game.Closed:Connect(function()
			repeat wait(250) until nil
		end))
	end)
end

