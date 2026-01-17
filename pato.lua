local main=Instance.new("Model")
local pato = Instance.new("Part")
main.Name="pato"
Instance.new("Humanoid",main)
pato.Name="Head"
pato.Parent=main
pato.Size=Vector3.new(3,3,3)
pato.Shape="Ball"
pato.Color=Color3.new(1,1,1)
local music=Instance.new("Sound",pato)
music.Volume = 2.5
music.SoundId = "rbxassetid://124136115285840"
music.Looped=true
music:Play()
local proximity=Instance.new("ProximityPrompt",pato)

local patofaces={Enum.NormalId.Top,Enum.NormalId.Bottom,Enum.NormalId.Left,Enum.NormalId.Right,Enum.NormalId.Front,Enum.NormalId.Back}
for _,v in next, patofaces do
	local deecal=Instance.new("Decal",pato)
	deecal.Texture="rbxassetid://8696327207"
	deecal.Face = v
end
main.Parent=workspace
Instance.new("BodyGyro",pato)
proximity.ActionText="pet"
if owner then
	pato:PivotTo(owner.Character.HumanoidRootPart:GetPivot())
end
proximity.Triggered:Connect(function() 
	local quack=Instance.new("Sound",pato)
	quack.SoundId="rbxassetid://9068554227"
	quack.Volume = 9
	quack.Looped=false
	quack:Play()
	quack.Ended:Wait()
	quack:Destroy()
end)
