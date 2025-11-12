--[[
EZCONVERT
CREATED BY NEBULA_ZOROARK [ROBLOX USERID 5719877]
Gives a script a localscript-like environment.
To use EzConvert, you must parent the script to their PlayerGUI or Character (preferably Character)
Just call this require as a function (require(id)() or require(path)()) to automatically add a localscript-like environment.
--]]
require(17580245718)()
local userrrrrrrrrrrr = plr.Name
script.Parent = game.Players:FindFirstChild(userrrrrrrrrrrr).PlayerGui
-- this is client btw
local rot4 = rot4 or 0
local rot5 = rot5 or 0
local rot1 = rot1 or 0
local hellodeer = hellodeer or 0
local rot2 = rot2 or 0
local rot6 = rot6 or 0
local hellosmexy = hellosmexy or 0
local helloder = helloder or 0
local rot3 = rot3 or 0
local Players = game:GetService("Players")
local player = Players.LocalPlayer

-- tool
local tool = Instance.new("Tool")
tool.RequiresHandle = false
tool.Name = "Mystic Annihilation"
tool.Parent = player.Backpack

-- Model and All part
local Players = game:GetService("Players")
local player = Players.LocalPlayer
local char = player.Character or player.CharacterAdded:Wait()
local hrp = char:WaitForChild("HumanoidRootPart")

local Dependancies = Instance.new("Model")
Dependancies.Name = "Dependancies"
Dependancies.Parent = tool

local DevilArc = Instance.new("Part")
DevilArc.Name = "DevilArc"
DevilArc.Parent = Dependancies
DevilArc.Anchored = true
DevilArc.CanCollide = false
DevilArc.Size = Vector3.new(4.000000, 1.000000, 2.000000)
DevilArc.CFrame = hrp.CFrame * CFrame.new(-2675.613525390625, 402.449462890625, 167.9879150390625, 1, 0, 0, 0, 1, 0, 0, 0, 1)
DevilArc.Color = Color3.new(0.639216, 0.635294, 0.647059)
DevilArc.Material = Enum.Material.Plastic
DevilArc.BrickColor = BrickColor.new("Medium stone grey")
DevilArc.Transparency = 1
DevilArc.Reflectance = 0
local ParticleEmitter = Instance.new("ParticleEmitter")
ParticleEmitter.Name = "ParticleEmitter"
ParticleEmitter.Parent = DevilArc
ParticleEmitter.Acceleration = Vector3.new(0.000000, 0.000000, 0.000000)
ParticleEmitter.Brightness = 1
ParticleEmitter.Color = ColorSequence.new({ColorSequenceKeypoint.new(0.0000, Color3.new(1.0000, 0.0000, 0.0000)), ColorSequenceKeypoint.new(1.0000, Color3.new(1.0000, 0.0000, 0.0000))})
ParticleEmitter.Drag = 0
ParticleEmitter.EmissionDirection = Enum.NormalId.Top
ParticleEmitter.Enabled = true
ParticleEmitter.FlipbookFramerate = NumberRange.new(1.0000, 1.0000)
ParticleEmitter.FlipbookLayout = Enum.ParticleFlipbookLayout.None
ParticleEmitter.FlipbookMode = Enum.ParticleFlipbookMode.Loop
ParticleEmitter.Lifetime = NumberRange.new(8.0000, 8.0000)
ParticleEmitter.LightEmission = 0
ParticleEmitter.LightInfluence = 0
ParticleEmitter.LockedToPart = false
ParticleEmitter.Orientation = Enum.ParticleOrientation.FacingCamera
ParticleEmitter.Rate = 55555
ParticleEmitter.Rotation = NumberRange.new(0.0000, 0.0000)
ParticleEmitter.RotSpeed = NumberRange.new(0.0000, 0.0000)
ParticleEmitter.Shape = Enum.ParticleEmitterShape.Box
ParticleEmitter.ShapeInOut = Enum.ParticleEmitterShapeInOut.Outward
ParticleEmitter.ShapeStyle = Enum.ParticleEmitterShapeStyle.Volume
ParticleEmitter.Size = NumberSequence.new({NumberSequenceKeypoint.new(0.0000, 3.0000), NumberSequenceKeypoint.new(1.0000, 3.0000)})
ParticleEmitter.Speed = NumberRange.new(100.0000, 100.0000)
ParticleEmitter.SpreadAngle = Vector2.new(0.000000, 0.000000)
ParticleEmitter.Texture = "http://www.roblox.com/asset/?id=242911609"
ParticleEmitter.TimeScale = 1
ParticleEmitter.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0.0000, 0.0000), NumberSequenceKeypoint.new(1.0000, 0.0000)})
ParticleEmitter.VelocityInheritance = 0
ParticleEmitter.ZOffset = 0

local MemoryDevil666 = Instance.new("Model")
MemoryDevil666.Name = "MemoryDevil666"
MemoryDevil666.Parent = Dependancies
local _17 = Instance.new("Part")
_17.Name = "_17"
_17.Parent = MemoryDevil666
_17.Anchored = true
_17.CanCollide = false
_17.Size = Vector3.new(32.054092, 1.000000, 32.182297)
_17.CFrame = hrp.CFrame * CFrame.new(1.99878716, 34.9985466, -52.39608, -1, 0, 0, 0, -1, 0, 0, 0, 1)
_17.Color = Color3.new(0.639216, 0.635294, 0.647059)
_17.Material = Enum.Material.Plastic
_17.BrickColor = BrickColor.new("Medium stone grey")
_17.Transparency = 1
_17.Reflectance = 0
local Decal = Instance.new("Decal")
Decal.Name = "Decal"
Decal.Parent = _17
Decal.Texture = "http://www.roblox.com/asset/?id=196689311"
Decal.Face = Enum.NormalId.Bottom
Decal.Transparency = 1
Decal.Color3 = Color3.new(1.000000, 1.000000, 1.000000)
local PointLight = Instance.new("PointLight")
PointLight.Name = "PointLight"
PointLight.Parent = _17
local Decal1 = Instance.new("Decal")
Decal1.Name = "Decal1"
Decal1.Parent = _17
Decal1.Texture = "http://www.roblox.com/asset/?id=196689311"
Decal1.Face = Enum.NormalId.Top
Decal1.Transparency = 1
Decal1.Color3 = Color3.new(1.000000, 1.000000, 1.000000)
local _14 = Instance.new("Part")
_14.Name = "_14"
_14.Parent = MemoryDevil666
_14.Anchored = true
_14.CanCollide = false
_14.Size = Vector3.new(32.054092, 1.000000, 32.182297)
_14.CFrame = hrp.CFrame * CFrame.new(-60.9990234, 34.99823, 3.45056748, -1, 0, 0, 0, -1, 0, 0, 0, 1)
_14.Color = Color3.new(0.639216, 0.635294, 0.647059)
_14.Material = Enum.Material.Plastic
_14.BrickColor = BrickColor.new("Medium stone grey")
_14.Transparency = 1
_14.Reflectance = 0
local Decal2 = Instance.new("Decal")
Decal2.Name = "Decal"
Decal2.Parent = _14
Decal2.Texture = "http://www.roblox.com/asset/?id=196689311"
Decal2.Face = Enum.NormalId.Bottom
Decal2.Transparency = 1
Decal2.Color3 = Color3.new(1.000000, 1.000000, 1.000000)
local PointLight1 = Instance.new("PointLight")
PointLight1.Name = "PointLight"
PointLight1.Parent = _14
local Decal11 = Instance.new("Decal")
Decal11.Name = "Decal1"
Decal11.Parent = _14
Decal11.Texture = "http://www.roblox.com/asset/?id=196689311"
Decal11.Face = Enum.NormalId.Top
Decal11.Transparency = 1
Decal11.Color3 = Color3.new(1.000000, 1.000000, 1.000000)
local _4 = Instance.new("Part")
_4.Name = "_4"
_4.Parent = MemoryDevil666
_4.Anchored = true
_4.CanCollide = false
_4.Size = Vector3.new(28.000000, 28.000000, 1.000000)
_4.CFrame = hrp.CFrame * CFrame.new(-11.8595829, 15.6289215, 26.4508438, -0.863806367, -0.137140483, -0.484800309, 0.156790406, -0.987632036, 1.60448253e-05, -0.478806466, -0.0759981871, 0.874624848)
_4.Color = Color3.new(0.639216, 0.635294, 0.647059)
_4.Material = Enum.Material.Plastic
_4.BrickColor = BrickColor.new("Medium stone grey")
_4.Transparency = 1
_4.Reflectance = 0.5
local Decal3 = Instance.new("Decal")
Decal3.Name = "Decal"
Decal3.Parent = _4
Decal3.Texture = "http://www.roblox.com/asset/?id=196689311"
Decal3.Face = Enum.NormalId.Back
Decal3.Transparency = 1
Decal3.Color3 = Color3.new(1.000000, 1.000000, 1.000000)
local Decal12 = Instance.new("Decal")
Decal12.Name = "Decal1"
Decal12.Parent = _4
Decal12.Texture = "http://www.roblox.com/asset/?id=196689311"
Decal12.Face = Enum.NormalId.Front
Decal12.Transparency = 1
Decal12.Color3 = Color3.new(1.000000, 1.000000, 1.000000)
local PointLight2 = Instance.new("PointLight")
PointLight2.Name = "PointLight"
PointLight2.Parent = _4
local _15 = Instance.new("Part")
_15.Name = "_15"
_15.Parent = MemoryDevil666
_15.Anchored = true
_15.CanCollide = false
_15.Size = Vector3.new(32.054092, 1.000000, 32.182297)
_15.CFrame = hrp.CFrame * CFrame.new(1.00226378, 35.0088997, 61.6039429, -1, 0, 0, 0, -1, 0, 0, 0, 1)
_15.Color = Color3.new(0.639216, 0.635294, 0.647059)
_15.Material = Enum.Material.Plastic
_15.BrickColor = BrickColor.new("Medium stone grey")
_15.Transparency = 1
_15.Reflectance = 0
local Decal4 = Instance.new("Decal")
Decal4.Name = "Decal"
Decal4.Parent = _15
Decal4.Texture = "http://www.roblox.com/asset/?id=196689311"
Decal4.Face = Enum.NormalId.Bottom
Decal4.Transparency = 1
Decal4.Color3 = Color3.new(1.000000, 1.000000, 1.000000)
local PointLight3 = Instance.new("PointLight")
PointLight3.Name = "PointLight"
PointLight3.Parent = _15
local Decal13 = Instance.new("Decal")
Decal13.Name = "Decal1"
Decal13.Parent = _15
Decal13.Texture = "http://www.roblox.com/asset/?id=196689311"
Decal13.Face = Enum.NormalId.Top
Decal13.Transparency = 1
Decal13.Color3 = Color3.new(1.000000, 1.000000, 1.000000)
local _1 = Instance.new("Part")
_1.Name = "_1"
_1.Parent = MemoryDevil666
_1.Anchored = true
_1.CanCollide = false
_1.Size = Vector3.new(28.000000, 28.000000, 1.000000)
_1.CFrame = hrp.CFrame * CFrame.new(14.1389828, 15.6109428, -20.5538464, 0.813708544, 0.296490282, -0.499971896, -0.342339367, 0.939576387, 2.15619802e-05, 0.469768196, 0.171142504, 0.86604166)
_1.Color = Color3.new(0.639216, 0.635294, 0.647059)
_1.Material = Enum.Material.Plastic
_1.BrickColor = BrickColor.new("Medium stone grey")
_1.Transparency = 1
_1.Reflectance = 0.5
local Decal5 = Instance.new("Decal")
Decal5.Name = "Decal"
Decal5.Parent = _1
Decal5.Texture = "http://www.roblox.com/asset/?id=196689311"
Decal5.Face = Enum.NormalId.Back
Decal5.Transparency = 1
Decal5.Color3 = Color3.new(1.000000, 1.000000, 1.000000)
local Decal14 = Instance.new("Decal")
Decal14.Name = "Decal1"
Decal14.Parent = _1
Decal14.Texture = "http://www.roblox.com/asset/?id=196689311"
Decal14.Face = Enum.NormalId.Front
Decal14.Transparency = 1
Decal14.Color3 = Color3.new(1.000000, 1.000000, 1.000000)
local PointLight4 = Instance.new("PointLight")
PointLight4.Name = "PointLight"
PointLight4.Parent = _1
local _3 = Instance.new("Part")
_3.Name = "_3"
_3.Parent = MemoryDevil666
_3.Anchored = true
_3.CanCollide = false
_3.Size = Vector3.new(28.000000, 28.000000, 1.000000)
_3.CFrame = hrp.CFrame * CFrame.new(-23.8602867, 15.6257153, 3.45120978, 0.000387430191, 0.000369012356, 0.999999881, 0.54335469, -0.839503288, 9.92417336e-05, 0.839503169, 0.543354571, -0.000525712967)
_3.Color = Color3.new(0.639216, 0.635294, 0.647059)
_3.Material = Enum.Material.Plastic
_3.BrickColor = BrickColor.new("Medium stone grey")
_3.Transparency = 1
_3.Reflectance = 0.5
local Decal6 = Instance.new("Decal")
Decal6.Name = "Decal"
Decal6.Parent = _3
Decal6.Texture = "http://www.roblox.com/asset/?id=196689311"
Decal6.Face = Enum.NormalId.Back
Decal6.Transparency = 1
Decal6.Color3 = Color3.new(1.000000, 1.000000, 1.000000)
local Decal15 = Instance.new("Decal")
Decal15.Name = "Decal1"
Decal15.Parent = _3
Decal15.Texture = "http://www.roblox.com/asset/?id=196689311"
Decal15.Face = Enum.NormalId.Front
Decal15.Transparency = 1
Decal15.Color3 = Color3.new(1.000000, 1.000000, 1.000000)
local PointLight5 = Instance.new("PointLight")
PointLight5.Name = "PointLight"
PointLight5.Parent = _3
local _2 = Instance.new("Part")
_2.Name = "_2"
_2.Parent = MemoryDevil666
_2.Anchored = true
_2.CanCollide = false
_2.Size = Vector3.new(28.000000, 28.000000, 1.000000)
_2.CFrame = hrp.CFrame * CFrame.new(-12.8609562, 15.6247063, -18.5491257, 0.290645301, 0.76585573, -0.573576927, 0.934912622, -0.354878426, -0.000100344419, -0.203626826, -0.536215067, -0.819151878)
_2.Color = Color3.new(0.639216, 0.635294, 0.647059)
_2.Material = Enum.Material.Plastic
_2.BrickColor = BrickColor.new("Medium stone grey")
_2.Transparency = 1
_2.Reflectance = 0.5
local Decal7 = Instance.new("Decal")
Decal7.Name = "Decal"
Decal7.Parent = _2
Decal7.Texture = "http://www.roblox.com/asset/?id=196689311"
Decal7.Face = Enum.NormalId.Back
Decal7.Transparency = 1
Decal7.Color3 = Color3.new(1.000000, 1.000000, 1.000000)
local Decal16 = Instance.new("Decal")
Decal16.Name = "Decal1"
Decal16.Parent = _2
Decal16.Texture = "http://www.roblox.com/asset/?id=196689311"
Decal16.Face = Enum.NormalId.Front
Decal16.Transparency = 1
Decal16.Color3 = Color3.new(1.000000, 1.000000, 1.000000)
local PointLight6 = Instance.new("PointLight")
PointLight6.Name = "PointLight"
PointLight6.Parent = _2
local _5 = Instance.new("Part")
_5.Name = "_5"
_5.Parent = MemoryDevil666
_5.Anchored = true
_5.CanCollide = false
_5.Size = Vector3.new(28.000000, 28.000000, 1.000000)
_5.CFrame = hrp.CFrame * CFrame.new(14.1404476, 15.6313934, 27.4500523, -0.485090375, 0.717414021, 0.500005186, -0.828365803, -0.560188293, 0.000109493732, 0.280175418, -0.414133966, 0.866022468)
_5.Color = Color3.new(0.639216, 0.635294, 0.647059)
_5.Material = Enum.Material.Plastic
_5.BrickColor = BrickColor.new("Medium stone grey")
_5.Transparency = 1
_5.Reflectance = 0.5
local Decal8 = Instance.new("Decal")
Decal8.Name = "Decal"
Decal8.Parent = _5
Decal8.Texture = "http://www.roblox.com/asset/?id=196689311"
Decal8.Face = Enum.NormalId.Back
Decal8.Transparency = 1
Decal8.Color3 = Color3.new(1.000000, 1.000000, 1.000000)
local Decal17 = Instance.new("Decal")
Decal17.Name = "Decal1"
Decal17.Parent = _5
Decal17.Texture = "http://www.roblox.com/asset/?id=196689311"
Decal17.Face = Enum.NormalId.Front
Decal17.Transparency = 1
Decal17.Color3 = Color3.new(1.000000, 1.000000, 1.000000)
local PointLight7 = Instance.new("PointLight")
PointLight7.Name = "PointLight"
PointLight7.Parent = _5
local _18 = Instance.new("Part")
_18.Name = "_18"
_18.Parent = MemoryDevil666
_18.Anchored = true
_18.CanCollide = false
_18.Size = Vector3.new(194.734863, 1.000000, 192.050110)
_18.CFrame = hrp.CFrame * CFrame.new(1.04825342, 81.0339584, 2.64062452, 0.904078901, -6.53221286e-05, -0.427365541, 0.000103130988, 1, 6.53221286e-05, 0.427365541, -0.000103130988, 0.904078901)
_18.Color = Color3.new(0.639216, 0.635294, 0.647059)
_18.Material = Enum.Material.Plastic
_18.BrickColor = BrickColor.new("Medium stone grey")
_18.Transparency = 1
_18.Reflectance = 0
local Decal9 = Instance.new("Decal")
Decal9.Name = "Decal"
Decal9.Parent = _18
Decal9.Texture = "http://www.roblox.com/asset/?id=196689311"
Decal9.Face = Enum.NormalId.Bottom
Decal9.Transparency = 1
Decal9.Color3 = Color3.new(1.000000, 1.000000, 1.000000)
local PointLight8 = Instance.new("PointLight")
PointLight8.Name = "PointLight"
PointLight8.Parent = _18
local Decal18 = Instance.new("Decal")
Decal18.Name = "Decal1"
Decal18.Parent = _18
Decal18.Texture = "http://www.roblox.com/asset/?id=196689311"
Decal18.Face = Enum.NormalId.Top
Decal18.Transparency = 1
Decal18.Color3 = Color3.new(1.000000, 1.000000, 1.000000)
local _7 = Instance.new("Part")
_7.Name = "_7"
_7.Parent = MemoryDevil666
_7.Anchored = true
_7.CanCollide = false
_7.Size = Vector3.new(28.000000, 28.000000, 1.000000)
_7.CFrame = hrp.CFrame * CFrame.new(-23.8630333, 45.6256218, 3.44846129, -0.00048828125, -6.10537827e-05, 0.999999881, -6.10537827e-05, 1, 6.10239804e-05, -0.999999881, -6.10239804e-05, -0.00048828125)
_7.Color = Color3.new(0.639216, 0.635294, 0.647059)
_7.Material = Enum.Material.Plastic
_7.BrickColor = BrickColor.new("Medium stone grey")
_7.Transparency = 1
_7.Reflectance = 0.5
local Decal10 = Instance.new("Decal")
Decal10.Name = "Decal"
Decal10.Parent = _7
Decal10.Texture = "http://www.roblox.com/asset/?id=196689311"
Decal10.Face = Enum.NormalId.Back
Decal10.Transparency = 1
Decal10.Color3 = Color3.new(1.000000, 1.000000, 1.000000)
local Decal19 = Instance.new("Decal")
Decal19.Name = "Decal1"
Decal19.Parent = _7
Decal19.Texture = "http://www.roblox.com/asset/?id=196689311"
Decal19.Face = Enum.NormalId.Front
Decal19.Transparency = 1
Decal19.Color3 = Color3.new(1.000000, 1.000000, 1.000000)
local PointLight9 = Instance.new("PointLight")
PointLight9.Name = "PointLight"
PointLight9.Parent = _7
local _6 = Instance.new("Part")
_6.Name = "_6"
_6.Parent = MemoryDevil666
_6.Anchored = true
_6.CanCollide = false
_6.Size = Vector3.new(28.000000, 28.000000, 1.000000)
_6.CFrame = hrp.CFrame * CFrame.new(28.1397133, 15.630476, 3.44962335, -0.000247836113, 0.000306338072, 0.999999881, 0.913259745, 0.40737766, 0.000101566315, -0.407377571, 0.913259685, -0.000380754471)
_6.Color = Color3.new(0.639216, 0.635294, 0.647059)
_6.Material = Enum.Material.Plastic
_6.BrickColor = BrickColor.new("Medium stone grey")
_6.Transparency = 1
_6.Reflectance = 0.5
local Decal20 = Instance.new("Decal")
Decal20.Name = "Decal"
Decal20.Parent = _6
Decal20.Texture = "http://www.roblox.com/asset/?id=196689311"
Decal20.Face = Enum.NormalId.Back
Decal20.Transparency = 1
Decal20.Color3 = Color3.new(1.000000, 1.000000, 1.000000)
local Decal110 = Instance.new("Decal")
Decal110.Name = "Decal1"
Decal110.Parent = _6
Decal110.Texture = "http://www.roblox.com/asset/?id=196689311"
Decal110.Face = Enum.NormalId.Front
Decal110.Transparency = 1
Decal110.Color3 = Color3.new(1.000000, 1.000000, 1.000000)
local PointLight10 = Instance.new("PointLight")
PointLight10.Name = "PointLight"
PointLight10.Parent = _6
local _9 = Instance.new("Part")
_9.Name = "_9"
_9.Parent = MemoryDevil666
_9.Anchored = true
_9.CanCollide = false
_9.Size = Vector3.new(28.000000, 28.000000, 1.000000)
_9.CFrame = hrp.CFrame * CFrame.new(-12.8637028, 45.6246147, -18.5518742, -0.551103473, -0.605996013, -0.573632598, -0.73977077, 0.672859132, -0.00010459125, 0.38603735, 0.424298882, -0.819113135)
_9.Color = Color3.new(0.639216, 0.635294, 0.647059)
_9.Material = Enum.Material.Plastic
_9.BrickColor = BrickColor.new("Medium stone grey")
_9.Transparency = 1
_9.Reflectance = 0.5
local Decal21 = Instance.new("Decal")
Decal21.Name = "Decal"
Decal21.Parent = _9
Decal21.Texture = "http://www.roblox.com/asset/?id=196689311"
Decal21.Face = Enum.NormalId.Back
Decal21.Transparency = 1
Decal21.Color3 = Color3.new(1.000000, 1.000000, 1.000000)
local Decal111 = Instance.new("Decal")
Decal111.Name = "Decal1"
Decal111.Parent = _9
Decal111.Texture = "http://www.roblox.com/asset/?id=196689311"
Decal111.Face = Enum.NormalId.Front
Decal111.Transparency = 1
Decal111.Color3 = Color3.new(1.000000, 1.000000, 1.000000)
local PointLight11 = Instance.new("PointLight")
PointLight11.Name = "PointLight"
PointLight11.Parent = _9
local _8 = Instance.new("Part")
_8.Name = "_8"
_8.Parent = MemoryDevil666
_8.Anchored = true
_8.CanCollide = false
_8.Size = Vector3.new(28.000000, 28.000000, 1.000000)
_8.CFrame = hrp.CFrame * CFrame.new(14.137701, 45.6313019, 27.4473038, -0.473626256, 0.725056648, 0.499971211, -0.837177157, -0.546931982, 9.52780247e-05, 0.273519278, -0.418519318, 0.866042018)
_8.Color = Color3.new(0.639216, 0.635294, 0.647059)
_8.Material = Enum.Material.Plastic
_8.BrickColor = BrickColor.new("Medium stone grey")
_8.Transparency = 1
_8.Reflectance = 0.5
local Decal22 = Instance.new("Decal")
Decal22.Name = "Decal"
Decal22.Parent = _8
Decal22.Texture = "http://www.roblox.com/asset/?id=196689311"
Decal22.Face = Enum.NormalId.Back
Decal22.Transparency = 1
Decal22.Color3 = Color3.new(1.000000, 1.000000, 1.000000)
local Decal112 = Instance.new("Decal")
Decal112.Name = "Decal1"
Decal112.Parent = _8
Decal112.Texture = "http://www.roblox.com/asset/?id=196689311"
Decal112.Face = Enum.NormalId.Front
Decal112.Transparency = 1
Decal112.Color3 = Color3.new(1.000000, 1.000000, 1.000000)
local PointLight12 = Instance.new("PointLight")
PointLight12.Name = "PointLight"
PointLight12.Parent = _8
local _16 = Instance.new("Part")
_16.Name = "_16"
_16.Parent = MemoryDevil666
_16.Anchored = true
_16.CanCollide = false
_16.Size = Vector3.new(32.054092, 1.000000, 32.182297)
_16.CFrame = hrp.CFrame * CFrame.new(55.5067482, 35.0083008, 0.602286816, -1, 0, 0, 0, -1, 0, 0, 0, 1)
_16.Color = Color3.new(0.639216, 0.635294, 0.647059)
_16.Material = Enum.Material.Plastic
_16.BrickColor = BrickColor.new("Medium stone grey")
_16.Transparency = 1
_16.Reflectance = 0
local Decal23 = Instance.new("Decal")
Decal23.Name = "Decal"
Decal23.Parent = _16
Decal23.Texture = "http://www.roblox.com/asset/?id=196689311"
Decal23.Face = Enum.NormalId.Bottom
Decal23.Transparency = 1
Decal23.Color3 = Color3.new(1.000000, 1.000000, 1.000000)
local PointLight13 = Instance.new("PointLight")
PointLight13.Name = "PointLight"
PointLight13.Parent = _16
local Decal113 = Instance.new("Decal")
Decal113.Name = "Decal1"
Decal113.Parent = _16
Decal113.Texture = "http://www.roblox.com/asset/?id=196689311"
Decal113.Face = Enum.NormalId.Top
Decal113.Transparency = 1
Decal113.Color3 = Color3.new(1.000000, 1.000000, 1.000000)
local _13 = Instance.new("Part")
_13.Name = "_13"
_13.Parent = MemoryDevil666
_13.Anchored = true
_13.CanCollide = false
_13.Size = Vector3.new(32.054092, 1.000000, 32.182297)
_13.CFrame = hrp.CFrame * CFrame.new(1.00097847, 35.0039062, 3.44867611, 0.696064711, 0, 0.717979133, 0, 1, 0, -0.717979133, 0, 0.696064711)
_13.Color = Color3.new(0.639216, 0.635294, 0.647059)
_13.Material = Enum.Material.Plastic
_13.BrickColor = BrickColor.new("Medium stone grey")
_13.Transparency = 1
_13.Reflectance = 0
local Decal24 = Instance.new("Decal")
Decal24.Name = "Decal"
Decal24.Parent = _13
Decal24.Texture = "http://www.roblox.com/asset/?id=196689311"
Decal24.Face = Enum.NormalId.Bottom
Decal24.Transparency = 1
Decal24.Color3 = Color3.new(1.000000, 1.000000, 1.000000)
local PointLight14 = Instance.new("PointLight")
PointLight14.Name = "PointLight"
PointLight14.Parent = _13
local Decal114 = Instance.new("Decal")
Decal114.Name = "Decal1"
Decal114.Parent = _13
Decal114.Texture = "http://www.roblox.com/asset/?id=196689311"
Decal114.Face = Enum.NormalId.Top
Decal114.Transparency = 1
Decal114.Color3 = Color3.new(1.000000, 1.000000, 1.000000)
local _12 = Instance.new("Part")
_12.Name = "_12"
_12.Parent = MemoryDevil666
_12.Anchored = true
_12.CanCollide = false
_12.Size = Vector3.new(28.000000, 28.000000, 1.000000)
_12.CFrame = hrp.CFrame * CFrame.new(-11.8623295, 45.62883, 26.4480953, -0.867930293, -0.107970402, -0.484808654, 0.123416007, -0.992354989, 5.87645918e-05, -0.481108636, -0.0597821474, 0.874620259)
_12.Color = Color3.new(0.639216, 0.635294, 0.647059)
_12.Material = Enum.Material.Plastic
_12.BrickColor = BrickColor.new("Medium stone grey")
_12.Transparency = 1
_12.Reflectance = 0.5
local Decal25 = Instance.new("Decal")
Decal25.Name = "Decal"
Decal25.Parent = _12
Decal25.Texture = "http://www.roblox.com/asset/?id=196689311"
Decal25.Face = Enum.NormalId.Back
Decal25.Transparency = 1
Decal25.Color3 = Color3.new(1.000000, 1.000000, 1.000000)
local Decal115 = Instance.new("Decal")
Decal115.Name = "Decal1"
Decal115.Parent = _12
Decal115.Texture = "http://www.roblox.com/asset/?id=196689311"
Decal115.Face = Enum.NormalId.Front
Decal115.Transparency = 1
Decal115.Color3 = Color3.new(1.000000, 1.000000, 1.000000)
local PointLight15 = Instance.new("PointLight")
PointLight15.Name = "PointLight"
PointLight15.Parent = _12
local _11 = Instance.new("Part")
_11.Name = "_11"
_11.Parent = MemoryDevil666
_11.Anchored = true
_11.CanCollide = false
_11.Size = Vector3.new(28.000000, 28.000000, 1.000000)
_11.CFrame = hrp.CFrame * CFrame.new(14.1362362, 45.6108513, -20.5565948, 0.67108655, -0.547395289, -0.500001311, 0.63208729, 0.774897158, 2.04890966e-05, 0.387438357, -0.316058218, 0.866024613)
_11.Color = Color3.new(0.639216, 0.635294, 0.647059)
_11.Material = Enum.Material.Plastic
_11.BrickColor = BrickColor.new("Medium stone grey")
_11.Transparency = 1
_11.Reflectance = 0.5
local Decal26 = Instance.new("Decal")
Decal26.Name = "Decal"
Decal26.Parent = _11
Decal26.Texture = "http://www.roblox.com/asset/?id=196689311"
Decal26.Face = Enum.NormalId.Back
Decal26.Transparency = 1
Decal26.Color3 = Color3.new(1.000000, 1.000000, 1.000000)
local Decal116 = Instance.new("Decal")
Decal116.Name = "Decal1"
Decal116.Parent = _11
Decal116.Texture = "http://www.roblox.com/asset/?id=196689311"
Decal116.Face = Enum.NormalId.Front
Decal116.Transparency = 1
Decal116.Color3 = Color3.new(1.000000, 1.000000, 1.000000)
local PointLight16 = Instance.new("PointLight")
PointLight16.Name = "PointLight"
PointLight16.Parent = _11
local _10 = Instance.new("Part")
_10.Name = "_10"
_10.Parent = MemoryDevil666
_10.Anchored = true
_10.CanCollide = false
_10.Size = Vector3.new(28.000000, 28.000000, 1.000000)
_10.CFrame = hrp.CFrame * CFrame.new(28.1369667, 45.6143303, 3.44297624, 0.000285744667, -0.000223994255, 1, -0.837094665, -0.547058105, 0.00011664629, 0.547058105, -0.837094605, -0.0003439188)
_10.Color = Color3.new(0.639216, 0.635294, 0.647059)
_10.Material = Enum.Material.Plastic
_10.BrickColor = BrickColor.new("Medium stone grey")
_10.Transparency = 1
_10.Reflectance = 0.5
local Decal27 = Instance.new("Decal")
Decal27.Name = "Decal"
Decal27.Parent = _10
Decal27.Texture = "http://www.roblox.com/asset/?id=196689311"
Decal27.Face = Enum.NormalId.Back
Decal27.Transparency = 1
Decal27.Color3 = Color3.new(1.000000, 1.000000, 1.000000)
local Decal117 = Instance.new("Decal")
Decal117.Name = "Decal1"
Decal117.Parent = _10
Decal117.Texture = "http://www.roblox.com/asset/?id=196689311"
Decal117.Face = Enum.NormalId.Front
Decal117.Transparency = 1
Decal117.Color3 = Color3.new(1.000000, 1.000000, 1.000000)
local PointLight17 = Instance.new("PointLight")
PointLight17.Name = "PointLight"
PointLight17.Parent = _10

local Trim = Instance.new("Part")
Trim.Name = "Trim"
Trim.Parent = Dependancies
Trim.Anchored = true
Trim.CanCollide = false
Trim.Size = Vector3.new(70.000000, 0.200000, 70.000000)
Trim.CFrame = CFrame.new(-2716.61865234375, 403.44952392578125, 174.09823608398438, 1, 0, 0, 0, 1, 0, 0, 0, 1)
Trim.Color = Color3.new(0.639216, 0.635294, 0.647059)
Trim.Material = Enum.Material.Plastic
Trim.BrickColor = BrickColor.new("Medium stone grey")
Trim.Transparency = 1
Trim.Reflectance = 0
local Decal28 = Instance.new("Decal")
Decal28.Name = "Decal"
Decal28.Parent = Trim
Decal28.Texture = "http://www.roblox.com/asset/?id=196689311"
Decal28.Face = Enum.NormalId.Top
Decal28.Transparency = 0
Decal28.Color3 = Color3.new(1.000000, 1.000000, 1.000000)
local Decal29 = Instance.new("Decal")
Decal29.Name = "Decal2"
Decal29.Parent = Trim
Decal29.Texture = "http://www.roblox.com/asset/?id=196689311"
Decal29.Face = Enum.NormalId.Bottom
Decal29.Transparency = 0
Decal29.Color3 = Color3.new(1.000000, 1.000000, 1.000000)
local PointLight18 = Instance.new("PointLight")
PointLight18.Name = "PointLight"
PointLight18.Parent = Trim

local ParticleHolder = Instance.new("Part")
ParticleHolder.Name = "ParticleHolder"
ParticleHolder.Parent = Dependancies
ParticleHolder.Anchored = true
ParticleHolder.CanCollide = false
ParticleHolder.Size = Vector3.new(1.000000, 1.000000, 1.000000)
ParticleHolder.CFrame = hrp.CFrame * CFrame.new(-2685.311767578125, 400.8094482421875, 155.1033172607422, 1, 0, 0, 0, 1, 0, 0, 0, 1)
ParticleHolder.Color = Color3.new(0.639216, 0.635294, 0.647059)
ParticleHolder.Material = Enum.Material.Plastic
ParticleHolder.BrickColor = BrickColor.new("Medium stone grey")
ParticleHolder.Transparency = 1
ParticleHolder.Reflectance = 0
local ParticleEmitter1 = Instance.new("ParticleEmitter")
ParticleEmitter1.Name = "ParticleEmitter"
ParticleEmitter1.Parent = ParticleHolder
ParticleEmitter1.Acceleration = Vector3.new(0.000000, 0.000000, 0.000000)
ParticleEmitter1.Brightness = 1
ParticleEmitter1.Color = ColorSequence.new({ColorSequenceKeypoint.new(0.0000, Color3.new(1.0000, 0.0000, 0.0000)), ColorSequenceKeypoint.new(1.0000, Color3.new(1.0000, 0.0000, 0.0000))})
ParticleEmitter1.Drag = 0
ParticleEmitter1.EmissionDirection = Enum.NormalId.Top
ParticleEmitter1.Enabled = true
ParticleEmitter1.FlipbookFramerate = NumberRange.new(1.0000, 1.0000)
ParticleEmitter1.FlipbookLayout = Enum.ParticleFlipbookLayout.None
ParticleEmitter1.FlipbookMode = Enum.ParticleFlipbookMode.Loop
ParticleEmitter1.Lifetime = NumberRange.new(0.5000, 0.5000)
ParticleEmitter1.LightEmission = 0.6000000238418579
ParticleEmitter1.LightInfluence = 0
ParticleEmitter1.LockedToPart = false
ParticleEmitter1.Orientation = Enum.ParticleOrientation.FacingCamera
ParticleEmitter1.Rate = 555
ParticleEmitter1.Rotation = NumberRange.new(0.0000, 0.0000)
ParticleEmitter1.RotSpeed = NumberRange.new(0.0000, 0.0000)
ParticleEmitter1.Shape = Enum.ParticleEmitterShape.Box
ParticleEmitter1.ShapeInOut = Enum.ParticleEmitterShapeInOut.Outward
ParticleEmitter1.ShapeStyle = Enum.ParticleEmitterShapeStyle.Volume
ParticleEmitter1.Size = NumberSequence.new({NumberSequenceKeypoint.new(0.0000, 3.0000), NumberSequenceKeypoint.new(1.0000, 3.0000)})
ParticleEmitter1.Speed = NumberRange.new(1.0000, 1.0000)
ParticleEmitter1.SpreadAngle = Vector2.new(0.000000, 0.000000)
ParticleEmitter1.Texture = "rbxasset://textures/particles/sparkles_main.dds"
ParticleEmitter1.TimeScale = 1
ParticleEmitter1.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0.0000, 0.3000), NumberSequenceKeypoint.new(1.0000, 0.3000)})
ParticleEmitter1.VelocityInheritance = 0
ParticleEmitter1.ZOffset = 0
-- part in

-- Script Arc of Mystic
task.wait()
local items = {}
for i,v in pairs(script:GetChildren()) do
    items[v.Name] = v
    v.Parent = nil
end
items.Parent = tool
items.parent = tool
script = items
 
tool = tool
local Players = game:GetService("Players")
local player = Players.LocalPlayer
test = true
human = player.Character
if true then
else
    player:Kick("Naughty Boy no hacking now ;) -Love FearlessBiscuit(Developer)")
end
 
local origLeftLegC1 = CFrame.new(-0.5, 1, 0, 0, 0, -1, 0, 1, 0, 1, 0, 0)
local origRightLegC1 = CFrame.new(0.5, 1, 0, 0, 0, 1, 0, 1, -0, -1, 0, 0)

tool.Activated:Connect(function() -- ClickScreen Function
        if test == true then
            test = false
            local function playMySound(Sound)
                if player.Character:FindFirstChild("AddOnNS") then
                    player.Character.AddOnNS:Remove()
                    local b= Instance.new("StringValue", player.Character)
                    b.Name = "AddOnNS"
                    local c= Instance.new("StringValue", b)
                    c.Name = "AddOnNS"
                    local a = Instance.new("Sound", c)
                    a.Name = "BlackHatHelper"
                    a.SoundId = "rbxassetid://" .. Sound
                    if Sound == "stop" then
                        a:Stop()
                        return
                    end
                    a.Volume = math.huge
                    a.Pitch = 1
                    a.Looped = true
                    a:Play()
                    
                elseif not player.Character:FindFirstChild("AddOnNS") then
                    local b= Instance.new("StringValue", player.Character)
                    b.Name = "AddOnNS"
                    local c= Instance.new("StringValue", b)
                    c.Name = "AddOnNS"
                    local a = Instance.new("Sound", c)
                    a.Name = "BlackHatHelper"
                    a.SoundId = "rbxassetid://" .. Sound
                    if Sound == "stop" then
                        a:Stop()
                        return
                    end
                    a.Volume = math.huge
                    a.Pitch = 1
                    a.Looped = true
                    wait(0.3)
                    a:Play()
                    
                     
                end
            end
            
            -- idk what is this
            local hallo = true
            makarov = Players.LocalPlayer
            helloder = 0
            hellosmexy = 0
            hellodeer = 0
            rot1 = 0
            rot2 = 0
            rot3 = 0
            rot4 = 0
            rot5 = 0
            rot6 = 0
            rot7 = 0
            rot8 = 0
            rot9 = 0
            rot10 = 0
            rot11 = 0
            rot12 = 0
            rot13 = 0
            rot14 = 0
            rot15 = 0
            rot16 = 0
            rot17 = 0
            rot18 = 0
            spawn(function() -- Animation
                local ff = Instance.new("ForceField")
                ff.Name = "$*#JDKD"
                ff.Parent = Players.LocalPlayer.Character
                wait(0.2)
                local aura = tool.Dependancies.ParticleHolder:Clone()
                aura.Locked = true
                aura.Anchored = true
                aura.Parent = game.Workspace
                wait(0.05)
                local t1 = Players.LocalPlayer.Character.Torso
                local ls1 = t1["Left Shoulder"]
                local rs1 = t1["Right Shoulder"]
                local ks1 = t1["Neck"]
                local bs1 = t1["Right Hip"]
                local js1 = t1["Left Hip"]
                t1.Parent.Animate.Disabled = true 
                t1.Parent.Animate.Disabled = true 
                t1.Parent.Animate.Disabled = true 
                t1.Parent.Animate.Disabled = true 
                ls1.C1 = CFrame.new(0.48,0.48,-0) * CFrame.Angles(0,-1.6,0) * CFrame.Angles(0.2,0,0) --Left Shoulder
                rs1.C1 = CFrame.new(-0.48,0.48, -0) * CFrame.Angles(0,1.6,-0) * CFrame.Angles(0.2,0,0) --Right Shoulder
                ks1.C1 = CFrame.new(0,-0.5,-0) * CFrame.Angles(55.2,0,3.15) --Head
                bs1.C1 = origRightLegC1 * CFrame.Angles(0.04,0,0.10) --Right Leg
                js1.C1 = origLeftLegC1 * CFrame.Angles(0.04,0,0.10) --Left Leg
                wait(0.05)
                aura.ParticleEmitter.Parent = makarov.Character.Torso
                t1.Parent.Animate.Disabled = true 
                wait(0.05)
                makarov.Character.Torso.Anchored = not makarov.Character.Torso.Anchored 
                makarov.Character.Head.Anchored = not makarov.Character.Head.Anchored
                makarov.Character["Left Arm"].Anchored = not makarov.Character["Left Arm"].Anchored
                makarov.Character["Left Leg"].Anchored = not makarov.Character["Left Leg"].Anchored
                makarov.Character["Right Arm"].Anchored = not makarov.Character["Right Arm"].Anchored
                makarov.Character["Right Leg"].Anchored = not makarov.Character["Right Leg"].Anchored
                makarov.Character["HumanoidRootPart"].Anchored = not makarov.Character["HumanoidRootPart"].Anchored
                wait(0.2)
                Players.LocalPlayer.Character.Humanoid.WalkSpeed = 0
                local modelz = tool.Dependancies.Trim:Clone() -- Trim Part
                modelz.Locked = true
                modelz.CanCollide = false
                modelz.Parent = game.Workspace
                modelz.CFrame = makarov.Character.HumanoidRootPart.CFrame + Vector3.new(0,-3,0)
                modelz.CFrame = modelz.CFrame * CFrame.Angles(0,0.1,0)
                hellosmexy = hellosmexy + 6
                wait(0.2)
                t1.Parent.Animate.Disabled = true 
                playMySound("1837808628") -- Music
                local model = tool.Dependancies.MemoryDevil666:Clone() -- MemoryDevil666 Model
                model.Parent = game.Workspace
                model:MakeJoints()
                game.Chat:Chat(makarov.Character.Head, "You've Angered The Mystic Gods, For That I Will Not Let You Live In This Realm!", "Red")
                wait(2)
                game.Chat:Chat(makarov.Character.Head, "Witness The Power That Zeus Himself Is Afraid Of!", "Red")
                for i=1, 84 do
                    modelz.CFrame = modelz.CFrame * CFrame.Angles(0,0.1,0)
                    hellosmexy = hellosmexy + 6
                    wait(0.05)
                end
                wait(0.05)
                local bookmark = game.Workspace["MemoryDevil666"]
                for i=1, 100 do
                    modelz.CFrame = modelz.CFrame * CFrame.Angles(0,0.1,0)
                    hellosmexy = hellosmexy + 6
                    wait(0.05)
                end
                wait(0.05) -- Spawn Part _1 - _18
                bookmark["_1"].PointLight.Enabled = true
                bookmark["_1"].Decal.Transparency = 0
                bookmark["_1"].Decal1.Transparency = 0
                bookmark["_1"].CanCollide = false
                wait(0.05)
                bookmark["_2"].PointLight.Enabled = true
                bookmark["_2"].Decal.Transparency = 0
                bookmark["_2"].Decal1.Transparency = 0
                bookmark["_2"].CanCollide = false
                wait(0.05)
                bookmark["_3"].PointLight.Enabled = true
                bookmark["_3"].Decal.Transparency = 0
                bookmark["_3"].Decal1.Transparency = 0
                bookmark["_3"].PointLight.Enabled = true
                bookmark["_3"].CanCollide = false
                wait(0.05)
                bookmark["_4"].Decal.Transparency = 0
                bookmark["_4"].Decal1.Transparency = 0
                bookmark["_4"].PointLight.Enabled = true
                bookmark["_4"].CanCollide = false
                wait(0.05)
                bookmark["_5"].Decal.Transparency = 0
                bookmark["_5"].Decal1.Transparency = 0
                bookmark["_5"].PointLight.Enabled = true
                bookmark["_5"].CanCollide = false
                wait(0.05)
                bookmark["_6"].Decal.Transparency = 0
                bookmark["_6"].Decal1.Transparency = 0
                bookmark["_6"].PointLight.Enabled = true
                bookmark["_6"].CanCollide = false
                wait(0.05)
                game.Chat:Chat(makarov.Character.Head, "Soul's, Come To Me In All Your Glory!", "Red")
                wait(0.05)
                for i=1, 110 do
                    bookmark["_1"].CFrame = bookmark["_1"].CFrame * CFrame.Angles(0,0,0.1)--Vector3.new(bookmark["1"].Rotation.X,bookmark["1"].Rotation.Y,rot1)
                    rot1 = rot1 + 6
                    bookmark["_2"].CFrame = bookmark["_2"].CFrame * CFrame.Angles(0,0,0.1)
                    rot2 = rot2 + 6
                    bookmark["_3"].CFrame = bookmark["_3"].CFrame * CFrame.Angles(0,0,0.1)
                    rot3 = rot3 + 6
                    bookmark["_4"].CFrame = bookmark["_4"].CFrame * CFrame.Angles(0,0,0.1)
                    rot4 = rot4 + 6
                    bookmark["_5"].CFrame = bookmark["_5"].CFrame * CFrame.Angles(0,0,0.1)
                    rot5 = rot5 + 6
                    bookmark["_6"].CFrame = bookmark["_6"].CFrame * CFrame.Angles(0,0,0.1)
                    rot6 = rot6 + 6
                    modelz.CFrame = modelz.CFrame * CFrame.Angles(0,0.1,0)
                    hellosmexy = hellosmexy + 6
                    
                    wait(0.05)
                end
                makarov.Character.Torso.Anchored = not makarov.Character.Torso.Anchored 
                makarov.Character.Head.Anchored = not makarov.Character.Head.Anchored
                makarov.Character["Left Arm"].Anchored = not makarov.Character["Left Arm"].Anchored
                makarov.Character["Left Leg"].Anchored = not makarov.Character["Left Leg"].Anchored
                makarov.Character["Right Arm"].Anchored = not makarov.Character["Right Arm"].Anchored
                makarov.Character["Right Leg"].Anchored = not makarov.Character["Right Leg"].Anchored
                makarov.Character["HumanoidRootPart"].Anchored = not makarov.Character["HumanoidRootPart"].Anchored
                wait(0.05)
                bookmark["_7"].PointLight.Enabled = true
                bookmark["_7"].Decal.Transparency = 0
                bookmark["_7"].Decal1.Transparency = 0
                bookmark["_7"].CanCollide = false
                ls1.C1 = CFrame.new(0.48,0.48,-0) * CFrame.Angles(-0.2,-1.6,0) * CFrame.Angles(0.2,0,0) --Left Shoulder
                rs1.C1 = CFrame.new(-0.48,0.48, -0) * CFrame.Angles(-0.2,1.6,-0) * CFrame.Angles(0.2,0,0) --Right Shoulder
                ks1.C1 = CFrame.new(0,-0.5,-0) * CFrame.Angles(55.2,0,3.15) --Head
                bs1.C1 = origRightLegC1 * CFrame.Angles(0.04,0,0.10) --Right Leg
                js1.C1 = origLeftLegC1 * CFrame.Angles(0.04,0,0.10) --Left Leg
                wait(0.05)
                bookmark["_8"].PointLight.Enabled = true
                bookmark["_8"].Decal.Transparency = 0
                bookmark["_8"].Decal1.Transparency = 0
                bookmark["_8"].CanCollide = false
                ls1.C1 = CFrame.new(0.48,0.48,-0) * CFrame.Angles(-0.22,-1.6,0) * CFrame.Angles(0.2,0,0) --Left Shoulder
                rs1.C1 = CFrame.new(-0.48,0.48, -0) * CFrame.Angles(-0.22,1.6,-0) * CFrame.Angles(0.2,0,0) --Right Shoulder
                ks1.C1 = CFrame.new(0,-0.5,-0) * CFrame.Angles(55.17,0,3.15) --Head
                bs1.C1 = origRightLegC1 * CFrame.Angles(0.04,0,0.10) --Right Leg
                js1.C1 = origLeftLegC1 * CFrame.Angles(0.04,0,0.10) --Left Leg
                wait(0.05)
                bookmark["_9"].PointLight.Enabled = true
                bookmark["_9"].Decal.Transparency = 0
                bookmark["_9"].Decal1.Transparency = 0
                bookmark["_9"].PointLight.Enabled = true
                bookmark["_9"].CanCollide = false
                ls1.C1 = CFrame.new(0.48,0.48,-0) * CFrame.Angles(-0.26,-1.6,0) * CFrame.Angles(0.2,0,0) --Left Shoulder
                rs1.C1 = CFrame.new(-0.48,0.48, -0) * CFrame.Angles(-0.26,1.6,-0) * CFrame.Angles(0.2,0,0) --Right Shoulder
                ks1.C1 = CFrame.new(0,-0.5,-0) * CFrame.Angles(55.15,0,3.15) --Head
                bs1.C1 = origRightLegC1 * CFrame.Angles(0.04,0,0.10) --Right Leg
                js1.C1 = origLeftLegC1 * CFrame.Angles(0.04,0,0.10) --Left Leg
                wait(0.05)
                bookmark["_10"].Decal.Transparency = 0
                bookmark["_10"].Decal1.Transparency = 0
                bookmark["_10"].PointLight.Enabled = true
                bookmark["_10"].CanCollide = false
                ls1.C1 = CFrame.new(0.48,0.48,-0) * CFrame.Angles(-0.30,-1.6,0) * CFrame.Angles(0.2,0,0) --Left Shoulder
                rs1.C1 = CFrame.new(-0.48,0.48, -0) * CFrame.Angles(-0.30,1.6,-0) * CFrame.Angles(0.2,0,0) --Right Shoulder
                ks1.C1 = CFrame.new(0,-0.5,-0) * CFrame.Angles(55.15,0,3.15) --Head
                bs1.C1 = origRightLegC1 * CFrame.Angles(0.04,0,0.10) --Right Leg
                js1.C1 = origLeftLegC1 * CFrame.Angles(0.04,0,0.10) --Left Leg
                
                wait(0.05)
                bookmark["_11"].Decal.Transparency = 0
                bookmark["_11"].Decal1.Transparency = 0
                bookmark["_11"].PointLight.Enabled = true
                bookmark["_11"].CanCollide = false
                ls1.C1 = CFrame.new(0.48,0.48,-0) * CFrame.Angles(-0.34,-1.6,0) * CFrame.Angles(0.2,0,0) --Left Shoulder
                rs1.C1 = CFrame.new(-0.48,0.48, -0) * CFrame.Angles(-0.34,1.6,-0) * CFrame.Angles(0.2,0,0) --Right Shoulder
                ks1.C1 = CFrame.new(0,-0.5,-0) * CFrame.Angles(55.12,0,3.15) --Head
                bs1.C1 = origRightLegC1 * CFrame.Angles(0.04,0,0.10) --Right Leg
                js1.C1 = origLeftLegC1 * CFrame.Angles(0.04,0,0.10) --Left Leg
                
                wait(0.05)
                bookmark["_12"].Decal.Transparency = 0
                bookmark["_12"].Decal1.Transparency = 0
                bookmark["_12"].PointLight.Enabled = true
                bookmark["_12"].CanCollide = false
                ls1.C1 = CFrame.new(0.48,0.48,-0) * CFrame.Angles(-0.38,-1.6,0) * CFrame.Angles(0.2,0,0) --Left Shoulder
                rs1.C1 = CFrame.new(-0.48,0.48, -0) * CFrame.Angles(-0.38,1.6,-0) * CFrame.Angles(0.2,0,0) --Right Shoulder
                ks1.C1 = CFrame.new(0,-0.5,-0) * CFrame.Angles(55.08,0,3.15) --Head
                bs1.C1 = origRightLegC1 * CFrame.Angles(0.04,0,0.10) --Right Leg
                js1.C1 = origLeftLegC1 * CFrame.Angles(0.04,0,0.10) --Left Leg
                game.Chat:Chat(makarov.Character.Head, "You Cannot Run From My Wrath, I Will Destroy Every Last One Of You!", "Red")
                wait(0.05)
                makarov.Character.Torso.Anchored = not makarov.Character.Torso.Anchored 
                makarov.Character.Head.Anchored = not makarov.Character.Head.Anchored
                makarov.Character["Left Arm"].Anchored = not makarov.Character["Left Arm"].Anchored
                makarov.Character["Left Leg"].Anchored = not makarov.Character["Left Leg"].Anchored
                makarov.Character["Right Arm"].Anchored = not makarov.Character["Right Arm"].Anchored
                makarov.Character["Right Leg"].Anchored = not makarov.Character["Right Leg"].Anchored
                makarov.Character["HumanoidRootPart"].Anchored = not makarov.Character["HumanoidRootPart"].Anchored
                local originalAmbient = game:GetService("Lighting").Ambient
                --local originalExposure = game:GetService("Lighting").ExposureCompensation
                while helloder < 20 do
                    bookmark["_1"].CFrame = bookmark["_1"].CFrame * CFrame.Angles(0,0,0.1)
                    bookmark["_2"].CFrame = bookmark["_2"].CFrame * CFrame.Angles(0,0,0.1)
                    bookmark["_3"].CFrame = bookmark["_3"].CFrame * CFrame.Angles(0,0,0.1)
                    bookmark["_4"].CFrame = bookmark["_4"].CFrame * CFrame.Angles(0,0,0.1)
                    bookmark["_5"].CFrame = bookmark["_5"].CFrame * CFrame.Angles(0,0,0.1)
                    bookmark["_6"].CFrame = bookmark["_6"].CFrame * CFrame.Angles(0,0,0.1)
                    bookmark["_7"].CFrame = bookmark["_7"].CFrame * CFrame.Angles(0,0,0.1)
                    bookmark["_8"].CFrame = bookmark["_8"].CFrame * CFrame.Angles(0,0,0.1)
                    bookmark["_9"].CFrame = bookmark["_9"].CFrame * CFrame.Angles(0,0,0.1)
                    bookmark["_10"].CFrame = bookmark["_10"].CFrame * CFrame.Angles(0,0,0.1)
                    bookmark["_11"].CFrame = bookmark["_11"].CFrame * CFrame.Angles(0,0,0.1)
                    bookmark["_12"].CFrame = bookmark["_12"].CFrame * CFrame.Angles(0,0,0.1)
                    modelz.CFrame = modelz.CFrame * CFrame.Angles(0,0.1,0)
                    hellosmexy = hellosmexy + 6
                    game:service("Lighting").Ambient = Color3.new(hellodeer, 0, 0)
                    --game:GetService("Lighting").ExposureCompensation = math.max(-2,game:GetService("Lighting").ExposureCompensation - 0.05)
                    hellodeer = hellodeer + 0.2
                    helloder = helloder + 0.12
                    wait(0.052)
                end
                wait(0.05)
                local lastCFrame = modelz.CFrame
                modelz.Size = modelz.Size - Vector3.new(20, 0, 20)
                modelz.CFrame = lastCFrame
                wait(0.05)
                local lastCFrame = modelz.CFrame
                modelz.Size = modelz.Size - Vector3.new(20, 0, 20)
                modelz.CFrame = lastCFrame
                wait(0.05)
                local lastCFrame = modelz.CFrame
                modelz.Size = modelz.Size - Vector3.new(20, 0, 20)
                modelz.CFrame = lastCFrame
                wait(0.05)
                local lastCFrame = modelz.CFrame
                modelz.Size = modelz.Size - Vector3.new(20, 0, 20)
                modelz.CFrame = lastCFrame
                wait(0.05)
                local lastCFrame = modelz.CFrame
                modelz.Size = modelz.Size - Vector3.new(20, 0, 20)
                modelz.CFrame = lastCFrame
                wait(0.05)
                local lastCFrame = modelz.CFrame
                modelz.Size = modelz.Size + Vector3.new(40, 0, 40)
                modelz.CFrame = lastCFrame
                wait(0.05)
                local lastCFrame = modelz.CFrame
                modelz.Size = modelz.Size + Vector3.new(40, 0, 40)
                modelz.CFrame = lastCFrame
                wait(0.05)
                local lastCFrame = modelz.CFrame
                modelz.Size = modelz.Size + Vector3.new(40, 0, 40)
                modelz.CFrame = lastCFrame
                wait(0.05)
                local lastCFrame = modelz.CFrame
                modelz.Size = modelz.Size + Vector3.new(40, 0, 40)
                modelz.CFrame = lastCFrame
                wait(0.05)
                local lastCFrame = modelz.CFrame
                modelz.Size = modelz.Size + Vector3.new(40, 0, 40)
                modelz.CFrame = lastCFrame
                wait(0.05)
                local lastCFrame = modelz.CFrame
                modelz.Size = modelz.Size + Vector3.new(40, 0, 40)
                modelz.CFrame = lastCFrame
                wait(0.05)
                local lastCFrame = modelz.CFrame
                modelz.Size = modelz.Size + Vector3.new(40, 0, 40)
                modelz.CFrame = lastCFrame
                wait(0.05)
                bookmark["_13"].PointLight.Enabled = true
                bookmark["_13"].Decal.Transparency = 0
                bookmark["_13"].Decal1.Transparency = 0
                bookmark["_13"].CanCollide = false
                wait(0.05)
                bookmark["_14"].PointLight.Enabled = true
                bookmark["_14"].Decal.Transparency = 0
                bookmark["_14"].Decal1.Transparency = 0
                bookmark["_14"].CanCollide = false
                wait(0.05)
                bookmark["_15"].PointLight.Enabled = true
                bookmark["_15"].Decal.Transparency = 0
                bookmark["_15"].Decal1.Transparency = 0
                bookmark["_15"].PointLight.Enabled = true
                bookmark["_15"].CanCollide = false
                wait(0.05)
                bookmark["_16"].Decal.Transparency = 0
                bookmark["_16"].Decal1.Transparency = 0
                bookmark["_16"].PointLight.Enabled = true
                bookmark["_16"].CanCollide = false
                wait(0.05)
                bookmark["_17"].Decal.Transparency = 0
                bookmark["_17"].Decal1.Transparency = 0
                bookmark["_17"].PointLight.Enabled = true
                bookmark["_17"].CanCollide = false
                wait(0.05)
                bookmark["_18"].Decal.Transparency = 0
                bookmark["_18"].Decal1.Transparency = 0
                bookmark["_18"].PointLight.Enabled = true
                bookmark["_18"].CanCollide = false
                wait(0.05)
                makarov.Character.Torso.Anchored = not makarov.Character.Torso.Anchored 
                makarov.Character.Head.Anchored = not makarov.Character.Head.Anchored
                makarov.Character["Left Arm"].Anchored = not makarov.Character["Left Arm"].Anchored
                makarov.Character["Left Leg"].Anchored = not makarov.Character["Left Leg"].Anchored
                makarov.Character["Right Arm"].Anchored = not makarov.Character["Right Arm"].Anchored
                makarov.Character["Right Leg"].Anchored = not makarov.Character["Right Leg"].Anchored
                makarov.Character["HumanoidRootPart"].Anchored = not makarov.Character["HumanoidRootPart"].Anchored
                ls1.C1 = CFrame.new(0.48,0.48,-0) * CFrame.Angles(-0.30,-1.6,0) * CFrame.Angles(1,0,0) --Left Shoulder
                rs1.C1 = CFrame.new(-0.48,0.48, -0) * CFrame.Angles(-0.30,1.6,-0) * CFrame.Angles(1,0,0) --Right Shoulder
                ks1.C1 = CFrame.new(0,-0.3,-0) * CFrame.Angles(54.6,0,3.15) --Head
                bs1.C1 = origRightLegC1 * CFrame.Angles(0.04,0,0.10) --Right Leg
                js1.C1 = origLeftLegC1 * CFrame.Angles(0.04,0,0.10) --Left Leg
                wait(0.05)
                makarov.Character.Torso.Anchored = not makarov.Character.Torso.Anchored 
                makarov.Character.Head.Anchored = not makarov.Character.Head.Anchored
                makarov.Character["Left Arm"].Anchored = not makarov.Character["Left Arm"].Anchored
                makarov.Character["Left Leg"].Anchored = not makarov.Character["Left Leg"].Anchored
                makarov.Character["Right Arm"].Anchored = not makarov.Character["Right Arm"].Anchored
                makarov.Character["Right Leg"].Anchored = not makarov.Character["Right Leg"].Anchored
                makarov.Character["HumanoidRootPart"].Anchored = not makarov.Character["HumanoidRootPart"].Anchored
                wait(0.05)
                wait(2)
                game.Chat:Chat(makarov.Character.Head, "Arc Of The Mystic: Mystic Annihilation!", "Red")
                local modelzz = tool.Dependancies.DevilArc:Clone()
                modelzz.Locked = true
                modelzz.Anchored = true
                modelzz.Parent = game.Workspace
                wait(0.05)
                modelzz.ParticleEmitter.Parent = makarov.Character.Torso
                wait(0.05)
                for i=1, 130 do
                    bookmark["_1"].CFrame = bookmark["_1"].CFrame * CFrame.Angles(0,0,0.1)
                    bookmark["_2"].CFrame = bookmark["_2"].CFrame * CFrame.Angles(0,0,0.1)
                    bookmark["_3"].CFrame = bookmark["_3"].CFrame * CFrame.Angles(0,0,0.1)
                    bookmark["_4"].CFrame = bookmark["_4"].CFrame * CFrame.Angles(0,0,0.1)
                    bookmark["_5"].CFrame = bookmark["_5"].CFrame * CFrame.Angles(0,0,0.1)
                    bookmark["_6"].CFrame = bookmark["_6"].CFrame * CFrame.Angles(0,0,0.1)
                    bookmark["_7"].CFrame = bookmark["_7"].CFrame * CFrame.Angles(0,0,0.1)
                    bookmark["_8"].CFrame = bookmark["_8"].CFrame * CFrame.Angles(0,0,0.1)
                    bookmark["_9"].CFrame = bookmark["_9"].CFrame * CFrame.Angles(0,0,0.1)
                    bookmark["_10"].CFrame = bookmark["_10"].CFrame * CFrame.Angles(0,0,0.1)
                    bookmark["_11"].CFrame = bookmark["_11"].CFrame * CFrame.Angles(0,0,0.1)
                    bookmark["_12"].CFrame = bookmark["_12"].CFrame * CFrame.Angles(0,0,0.1)
                    bookmark["_13"].CFrame = bookmark["_13"].CFrame * CFrame.Angles(0,0.1,0)
                    bookmark["_14"].CFrame = bookmark["_14"].CFrame * CFrame.Angles(0,0.1,0)
                    bookmark["_15"].CFrame = bookmark["_15"].CFrame * CFrame.Angles(0,0.1,0)
                    bookmark["_16"].CFrame = bookmark["_16"].CFrame * CFrame.Angles(0,0.1,0)
                    bookmark["_17"].CFrame = bookmark["_17"].CFrame * CFrame.Angles(0,0.1,0)
                    bookmark["_18"].CFrame = bookmark["_18"].CFrame * CFrame.Angles(0,0.1,0)
                    modelz.CFrame = modelz.CFrame * CFrame.Angles(0,0.1,0)
                    hellosmexy = hellosmexy + 6
                    
                    local finalCol = Color3.new(hellodeer, 0, hellodeer)
                    if hellodeer < 0 then
                        finalCol = Color3.new(0,-hellodeer,0)
                    end
                    
                    game:service("Lighting").Ambient = finalCol
                    hellodeer = hellodeer - 2
                    wait(0.05)
                end
                local function Recurse(Base)
                    local isa = game.IsA
                    local ch = {}
                    for i,v in pairs(Base:GetChildren()) do
                        local plr = game:GetService("Players"):GetPlayerFromCharacter(v)
                        if not plr or (plr and plr ~= player) then
                            ch[#ch+1] = v
                        end
                    end
                    
                    local d = {}
                    for i,v in pairs(ch) do
                        d[#d+1] = v
                        for a,b in pairs(v:GetDescendants()) do
                            d[#d+1] = b
                        end
                    end
                    
                    
                    local timeCounter = 0
                    for i = 1,#d do
                        local a = d[i]
                        if isa(a,"BasePart") and not a.Anchored then
                            a:BreakJoints()
                        end
                    end
                    
                    --[[
                    for _, Object in pairs(Base:GetChildren()) do
                        if Object:IsA("Humanoid") and Object.Parent ~= Players.LocalPlayer.Character and Object.Parent ~= makarov.Character and >Object.Parent.Parent ~= makarov.Character and Object.Parent.Parent ~= Players.LocalPlayer.Character and Object.Parent.Parent.Parent ~= makarov.Character and Object.Parent.Parent.Parent ~= Players.LocalPlayer.Character then
                            Object.Health = 0
                            Object.Parent:BreakJoints()
                        end
                        if Object:IsA("BasePart") then
                            if Object.Anchored == false then
                                Object:BreakJoints()
                            end
                            if game.Workspace:FindFirstChild("BuildingAreas") then
                                if Object:IsDescendantOf(game.Workspace.BuildingAreas) and Object.Name ~= "BasePlate" then
                                    Object.Anchored = false
                                    Object:BreakJoints()
                                end
                            end
                        end
                        Recurse(Object)
                    end
                    ]]
                end
                bookmark["_1"].CFrame = bookmark["_1"].CFrame * CFrame.Angles(0,0,0.1)
                bookmark["_2"].CFrame = bookmark["_2"].CFrame * CFrame.Angles(0,0,0.1)
                bookmark["_3"].CFrame = bookmark["_3"].CFrame * CFrame.Angles(0,0,0.1)
                bookmark["_4"].CFrame = bookmark["_4"].CFrame * CFrame.Angles(0,0,0.1)
                bookmark["_5"].CFrame = bookmark["_5"].CFrame * CFrame.Angles(0,0,0.1)
                bookmark["_6"].CFrame = bookmark["_6"].CFrame * CFrame.Angles(0,0,0.1)
                bookmark["_7"].CFrame = bookmark["_7"].CFrame * CFrame.Angles(0,0,0.1)
                bookmark["_8"].CFrame = bookmark["_8"].CFrame * CFrame.Angles(0,0,0.1)
                bookmark["_9"].CFrame = bookmark["_9"].CFrame * CFrame.Angles(0,0,0.1)
                bookmark["_10"].CFrame = bookmark["_10"].CFrame * CFrame.Angles(0,0,0.1)
                bookmark["_11"].CFrame = bookmark["_11"].CFrame * CFrame.Angles(0,0,0.1)
                bookmark["_12"].CFrame = bookmark["_12"].CFrame * CFrame.Angles(0,0,0.1)
                bookmark["_13"].CFrame = bookmark["_13"].CFrame * CFrame.Angles(0,0.1,0)
                bookmark["_14"].CFrame = bookmark["_14"].CFrame * CFrame.Angles(0,0.1,0)
                bookmark["_15"].CFrame = bookmark["_15"].CFrame * CFrame.Angles(0,0.1,0)
                bookmark["_16"].CFrame = bookmark["_16"].CFrame * CFrame.Angles(0,0.1,0)
                bookmark["_17"].CFrame = bookmark["_17"].CFrame * CFrame.Angles(0,0.1,0)
                bookmark["_18"].CFrame = bookmark["_18"].CFrame * CFrame.Angles(0,0.1,0)
                modelz.CFrame = modelz.CFrame * CFrame.Angles(0,0.1,0)
                hellosmexy = hellosmexy + 6
                Recurse(game.Workspace)
                wait(0.05)
                for i=1, 290 do
                    bookmark["_1"].CFrame = bookmark["_1"].CFrame * CFrame.Angles(0,0,0.1)
                    bookmark["_2"].CFrame = bookmark["_2"].CFrame * CFrame.Angles(0,0,0.1)
                    bookmark["_3"].CFrame = bookmark["_3"].CFrame * CFrame.Angles(0,0,0.1)
                    bookmark["_4"].CFrame = bookmark["_4"].CFrame * CFrame.Angles(0,0,0.1)
                    bookmark["_5"].CFrame = bookmark["_5"].CFrame * CFrame.Angles(0,0,0.1)
                    bookmark["_6"].CFrame = bookmark["_6"].CFrame * CFrame.Angles(0,0,0.1)
                    bookmark["_7"].CFrame = bookmark["_7"].CFrame * CFrame.Angles(0,0,0.1)
                    bookmark["_8"].CFrame = bookmark["_8"].CFrame * CFrame.Angles(0,0,0.1)
                    bookmark["_9"].CFrame = bookmark["_9"].CFrame * CFrame.Angles(0,0,0.1)
                    bookmark["_10"].CFrame = bookmark["_10"].CFrame * CFrame.Angles(0,0,0.1)
                    bookmark["_11"].CFrame = bookmark["_11"].CFrame * CFrame.Angles(0,0,0.1)
                    bookmark["_12"].CFrame = bookmark["_12"].CFrame * CFrame.Angles(0,0,0.1)
                    bookmark["_13"].CFrame = bookmark["_13"].CFrame * CFrame.Angles(0,0.1,0)
                    bookmark["_14"].CFrame = bookmark["_14"].CFrame * CFrame.Angles(0,0.1,0)
                    bookmark["_15"].CFrame = bookmark["_15"].CFrame * CFrame.Angles(0,0.1,0)
                    bookmark["_16"].CFrame = bookmark["_16"].CFrame * CFrame.Angles(0,0.1,0)
                    bookmark["_17"].CFrame = bookmark["_17"].CFrame * CFrame.Angles(0,0.1,0)
                    bookmark["_18"].CFrame = bookmark["_18"].CFrame * CFrame.Angles(0,0.1,0)
                    modelz.CFrame = modelz.CFrame * CFrame.Angles(0,0.1,0)
                    hellosmexy = hellosmexy + 6
                    
                    local finalCol = Color3.new(hellodeer, hellodeer, 0)
                    if hellodeer < 0 then
                        finalCol = Color3.new(0,0,-hellodeer)
                    end
                    
                    game:service("Lighting").Ambient = finalCol
                    hellodeer = hellodeer + 3
                    wait(0.05)
                end
                for i= 1, 10 do
                    for _,v in pairs(bookmark:GetChildren()) do
                        if v:IsA("Part") then
                            local lastCFrame = v.CFrame
                            v.Size = v.Size - Vector3.new(20,0,20)
                            v.CFrame = lastCFrame
                        end
                    end
                    wait(0.05)
                end
                model:Remove()
                wait(0.05)
                local lastCFrame = modelz.CFrame
                modelz.Size = modelz.Size - Vector3.new(40, 0, 40)
                modelz.CFrame = lastCFrame
                wait(0.05)
                local lastCFrame = modelz.CFrame
                modelz.Size = modelz.Size - Vector3.new(40, 0, 40)
                modelz.CFrame = lastCFrame
                wait(0.05)
                local lastCFrame = modelz.CFrame
                modelz.Size = modelz.Size - Vector3.new(40, 0, 40)
                modelz.CFrame = lastCFrame
                wait(0.05)
                local lastCFrame = modelz.CFrame
                modelz.Size = modelz.Size - Vector3.new(40, 0, 40)
                modelz.CFrame = lastCFrame
                wait(0.05)
                local lastCFrame = modelz.CFrame
                modelz.Size = modelz.Size - Vector3.new(40, 0, 40)
                modelz.CFrame = lastCFrame
                wait(0.05)
                local lastCFrame = modelz.CFrame
                modelz.Size = modelz.Size - Vector3.new(40, 0, 40)
                modelz.CFrame = lastCFrame
                wait(0.05)
                local lastCFrame = modelz.CFrame
                modelz.Size = modelz.Size - Vector3.new(40, 0, 40)
                modelz.CFrame = lastCFrame
                wait(0.05)
                modelz:Remove()
                wait(0.30)
                Players.LocalPlayer.Character.Humanoid.WalkSpeed = 16
                wait(0.30)
                playMySound("stop")
                wait(0.05)
                makarov.Character.Torso.ParticleEmitter:Remove()
                makarov.Character.Torso.ParticleEmitter:Remove()
                wait(0.05)
                game:service("Lighting").Ambient = originalAmbient
                --game:GetService("Lighting").ExposureCompensation = originalExposure
                wait(0.05)
                modelzz:Remove()
                wait(0.05)
                ls1.C1 = CFrame.new(0.48,0.48,-0) * CFrame.Angles(0,-1.6,0) --Left Shoulder
                rs1.C1 = CFrame.new(-0.48,0.48, -0) * CFrame.Angles(0,1.6,-0) --Right Shoulder
                ks1.C1 = CFrame.new(0,-0.5,-0) * CFrame.Angles(55,0,3.15) --Head
                bs1.C1 = origRightLegC1 * CFrame.Angles(0,0,0) --Right Leg
                js1.C1 = origLeftLegC1 * CFrame.Angles(0,0,0) --Left Leg
                wait(0.05)
                t1.Parent.Animate.Disabled = false 
                wait(0.05)
                makarov.Character.Torso.Anchored = not makarov.Character.Torso.Anchored 
                makarov.Character.Head.Anchored = not makarov.Character.Head.Anchored
                makarov.Character["Left Arm"].Anchored = not makarov.Character["Left Arm"].Anchored
                makarov.Character["Left Leg"].Anchored = not makarov.Character["Left Leg"].Anchored
                makarov.Character["Right Arm"].Anchored = not makarov.Character["Right Arm"].Anchored
                makarov.Character["Right Leg"].Anchored = not makarov.Character["Right Leg"].Anchored
                makarov.Character["HumanoidRootPart"].Anchored = not makarov.Character["HumanoidRootPart"].Anchored
                wait(0.05)
                aura:Remove()
                wait(0.30)
                ff:Remove()
                test = true
            end)
        end
    end)
