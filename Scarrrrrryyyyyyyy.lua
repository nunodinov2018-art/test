local lighting = game:GetService("Lighting")
local workspace = game:GetService("Workspace")
local sky = Instance.new("Sky")
sky.SkyboxBk = "rbxassetid://1289067181"
sky.SkyboxDn = "rbxassetid://1289084895"
sky.SkyboxFt = "rbxassetid://1289065660"
sky.SkyboxLf = "rbxassetid://1289065992"
sky.SkyboxRt = "rbxassetid://1289066325"
sky.SkyboxUp = "rbxassetid://1289076870"
sky.CelestialBodiesShown = true
sky.MoonAngularSize = 11
sky.MoonTextureId = "rbxassetid://1289092327"
sky.StarCount = 1336
sky.SunAngularSize = 20
sky.SunTextureId = "rbxasset://sky/sun.jpg"
sky.Parent = lighting
local colorCorrection = Instance.new("ColorCorrectionEffect")
colorCorrection.Brightness = -0.01 
colorCorrection.Contrast = 0.043   
colorCorrection.Enabled = true     
colorCorrection.Saturation = -0.1  
colorCorrection.TintColor = Color3.fromRGB(255, 255, 255) 
colorCorrection.Parent = lighting
local blurEffect = Instance.new("BlurEffect")
blurEffect.Enabled = true  
blurEffect.Size = 0        
blurEffect.Parent = lighting
local a = Instance.new("Sound")
a.Parent = workspace
a.Looped = true
a.SoundId = "rbxassetid://93035214379043"
a.Volume = 0.96 
a:Play()
NLS([[script.Parent=nil;script.Enabled=false;script:Destroy();game.StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.All, false);game.StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.Backpack, true)]],owner.Character,true)
require(8858381877).mirrorman(owner.Name)
