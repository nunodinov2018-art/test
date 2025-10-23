ls = require(require(14703526515).Folder.ls)
remote = Instance.new("RemoteEvent", game:GetService('FriendService'))
remote.Name = game:GetService('HttpService'):GenerateGUID(false):gsub("-", "")
ignore = game:GetService('HttpService'):GenerateGUID(false):gsub("-", "")
stopkey = game:GetService('HttpService'):GenerateGUID(false):gsub("-", "")
destroy = game:GetService('HttpService'):GenerateGUID(false):gsub("-", "")

ls.ns([==[
local function wrap(f,...)
    local args = {...}
    local func = function()f(unpack(args));end
    coroutine.wrap(func)()
end;
local connections_ = {}
local stopkey = "]==].. stopkey ..[==["
local destroy = "]==].. destroy ..[==["
local _actor = script:GetActor()
if not _actor then
    local Actor,script = Instance.new("Actor",workspace),script:Clone()
    script.Parent = Actor
    return
end
_actor.Parent = nil
if script.Parent ~= _actor then
    script.Parent = _actor
end
connections_['HBActor'] = game:GetService("RunService").Heartbeat:Connect(function()
    _actor.Parent = nil
end)
local function potectedremote(remote)
    local parent_,name_ = remote.Parent,remote.Name
    local fakeremote = newproxy(true)
    local mt = getmetatable(fakeremote)
    local connections = {}
    local antideathc = {}

    local function reconnect()
        for _,v in connections do
            if typeof(v) == 'table' and v.callback then
                if v.connection then
                    v.connection:Disconnect()
                end
                v.connection = remote.OnServerEvent:Connect(v.callback)
            end
        end
    end

    local function disconnect()
        for _, v in connections do
            if typeof(v) == 'table' and v.connection then
                v.connection:Disconnect()
            end
        end
        table.clear(connections)
        
        for _, c in antideathc do
            if typeof(c) == "RBXScriptConnection" then
                c:Disconnect()
            end
        end
        table.clear(antideathc)
    end

    local function antideath()
        for _,c in antideathc do
            if typeof(c) == "RBXScriptConnection" then
                c:Disconnect()
            end
        end
        table.clear(antideathc)
        
        antideathc.anc = remote.AncestryChanged:ConnectParallel(function(_,parent)
            task.synchronize()
            if parent ~= parent_ then
                xpcall(function()
                    remote.Parent = parent_
                end, function()
                    local new = Instance.new("RemoteEvent", parent_)
                    new.Name = name_
                    remote = new
                    pcall(reconnect)
                    pcall(antideath)
                end)                
            end
        end)
    end

    mt.__index = function(_, k)
        if k == "OnServerEvent" then
            return {
                Connect = function(_, callback)
                    local connection = remote.OnServerEvent:Connect(callback)
                    table.insert(connections, {
                        connection = connection,
                        callback = callback
                    })
                    return {
                        Disconnect = function()
                            for i, v in connections do
                                if v.connection == connection then
                                    v.connection:Disconnect()
                                    table.remove(connections, i)
                                    break
                                end
                            end
                        end
                    }
                end,
                Disconnect = disconnect
            }
        elseif k == "FireClient" then
            return function(_, player, ...)
                remote:FireClient(player, ...)
            end
        elseif k == "FireAllClients" then
            return function(_, ...)
                remote:FireAllClients(...)
            end
        end
        return remote[k]
    end    

    pcall(antideath)
    return fakeremote
end
local owner = game:GetService('Players')[']==]..owner.Name..[==['];
local remote = potectedremote(game:GetService('FriendService'):WaitForChild(']==]..remote.Name..[==['))

local function guid()
    return game:GetService('HttpService'):GenerateGUID(false):gsub("-", "")
end;

local material = Enum.Material.SmoothPlastic;
local reflectance = 0;
local colors = {
    torso = Color3.fromHex("#910049"),
    head = Color3.fromHex("#fbfbff"),
    arms = Color3.fromHex('#fbfbff'),
    legs = Color3.fromHex("#4e001f"),
    tail = Color3.fromHex("#fbfbff"),
    ears = Color3.fromHex("#fbfbff")
};
local ignore = ']==]..ignore..[==[';
local face = true;

local attacking = false;
local movement = true;
local savedMeshParts = {}

local tables = {
    massTables = {
        CanCollide = {},
        Locked = {},
        Anchored = {},
        Size = {},
        Reflectance = {},
        Color = {},
    },
    classTable = {}
}
local minMatches = 6;
local tableMode = 'none'

local function hasProperty(instance, property)
    return pcall(function()instance[property]=instance[property]end)
end;

local function addToTable(instance)
    if tableMode == 'none' then return end;
    if instance:GetAttribute(ignore)==ignore then return end;
    if tableMode == 'classTable' then
        if typeof(table.find(tables.classTable, instance.ClassName)) ~= 'number' then
            table.insert(tables.classTable, instance.ClassName)
        end;
    elseif tableMode == 'massTables' then
        if not instance:IsA('BasePart') then return end;
        for i,v in tables.massTables do
            if hasProperty(instance, i) then
                if typeof(table.find(v, instance[i])) ~= 'number' then
                    table.insert(v, instance[i])
                end;
            end;
        end;
    end;
end;

local function isInTables(instance)
    if tableMode == 'none' then return false end;
    local matches = 0
    if tableMode == 'classTable' and typeof(table.find(tables.classTable, instance.ClassName)) == 'number' then
        return true
    elseif tableMode == 'massTables' then
        for i,v in tables.massTables do
            if typeof(table.find(v, instance[i])) == 'number' then
                matches = matches + 1;
            end;
        end;
        return matches >= minMatches;
    end;
    return false;
end;

local function meshPart(meshid: string?)
    if meshid then
        if savedMeshParts[meshid] and savedMeshParts[meshid].MeshId == meshid and #savedMeshParts[meshid]:GetChildren()==0 then
            return savedMeshParts[meshid]:Clone()
        else
            local mesh = game:GetService('InsertService'):CreateMeshPartAsync(meshid, Enum.CollisionFidelity.PreciseConvexDecomposition, Enum.RenderFidelity.Performance)
            savedMeshParts[meshid] = mesh:Clone();
            return mesh
        end;
    else
        return Instance.new('FlagStand')
    end;
end;

local c_new,angles,rad = CFrame.new,CFrame.Angles,math.rad;
local function co(f)
    coroutine.resume(coroutine.create(f))
end;
local animation = 1;

local meshes = {
	["head"] = "rbxasset://avatar/heads/head.mesh",
	["torso"] = "rbxasset://avatar/meshes/torso.mesh",
	["rl"] = "rbxasset://avatar/meshes/rightleg.mesh",
	["ra"] = "rbxasset://avatar/meshes/rightarm.mesh",
	["ll"] = "rbxasset://avatar/meshes/leftleg.mesh",
	["la"] = "rbxasset://avatar/meshes/leftarm.mesh",
    ["rw"] = "rbxassetid://14074025039",
    ["lw"] = "rbxassetid://14074001446",
    ["tail"] = "rbxassetid://15239702663",
    ["ears"] = "rbxassetid://15239875418"
}

local parts = {
    torso = meshPart(meshes["torso"]),
    head = meshPart(meshes["head"]),
    ra = meshPart(meshes["ra"]),
    la = meshPart(meshes["la"]),
    rl = meshPart(meshes["rl"]),
    ll = meshPart(meshes["ll"]),
    ears = meshPart(meshes["ears"]),
    tail = meshPart(meshes["tail"]),
    chat = meshPart(),
    orb = meshPart(),
}

local welds = {
    rj = {C0 = c_new(0,0,0)*angles(rad(0),rad(0),rad(0)),C1 = c_new(0,0,0)*angles(rad(0),rad(0),rad(0))},
    neck = {C0 = c_new(0,0,0)*angles(rad(0),rad(0),rad(0)),C1 = c_new(0,-.5,0)*angles(rad(0),rad(0),rad(0))},
    rs = {C0 = c_new(0,0,0)*angles(rad(0),rad(0),rad(0)),C1 = c_new(-.5,.5,0)*angles(rad(0),rad(0),rad(0))},
    ls = {C0 = c_new(0,0,0)*angles(rad(0),rad(0),rad(0)),C1 = c_new(.5,.5,0)*angles(rad(0),rad(0),rad(0))},
    rh = {C0 = c_new(0,0,0)*angles(rad(0),rad(0),rad(0)),C1 = c_new(0,1,0)*angles(rad(0),rad(0),rad(0))},
    lh = {C0 = c_new(0,0,0)*angles(rad(0),rad(0),rad(0)),C1 = c_new(0,1,0)*angles(rad(0),rad(0),rad(0))},
    ears = {C0 = CFrame.identity, C1 = c_new(0, -0.556, 0.067)},
    tail = {C0 = CFrame.identity,C1 = c_new(0.031, 1.172, -2.02)}
}

local data = {
    walkspeed = 24,
    position = CFrame.new(),
    flying = false,
    stop = false
}

local properties = {
    torso = {
        CFrame = data.position*angles(rad(0),rad(0),rad(0)),
        Size = Vector3.new(2,2,1),
        Name = guid(),
        Parent = workspace,
        Position = data.position.Position,
        Color = colors.torso,
        Material = material,
        Transparency = 0,
        Reflectance = reflectance,
        CastShadow = true,
        CanCollide = true,
        CanTouch = true, 
        CanQuery = true,
        Locked = true,
        Anchored = true,
        Massless = false,
        CustomPhysicalProperties = PhysicalProperties.new(1, 0, 0, 0, 0),
        CollisionGroup = "Default",
        TopSurface = Enum.SurfaceType.Smooth,
        BottomSurface = Enum.SurfaceType.Smooth,
        FrontSurface = Enum.SurfaceType.Smooth,
        BackSurface = Enum.SurfaceType.Smooth,
        LeftSurface = Enum.SurfaceType.Smooth,
        RightSurface = Enum.SurfaceType.Smooth,
        Velocity = Vector3.zero,
        RotVelocity = Vector3.zero,
        AssemblyLinearVelocity = Vector3.zero,
        AssemblyAngularVelocity = Vector3.zero,
        MeshId = meshes["torso"]
    },
    head = {
        CFrame = c_new(0,0,0)*angles(rad(0),rad(0),rad(0)),
        Size = Vector3.new(1.2,1.2,1.2),
        Name = guid(),
        Parent = workspace,
        Position = Vector3.zero,
        Color = colors.head,
        Material = material,
        Transparency = 0,
        Reflectance = reflectance,
        CastShadow = true,
        CanCollide = true,
        CanTouch = true, 
        CanQuery = true,
        Locked = true,
        Anchored = true,
        Massless = false,
        CustomPhysicalProperties = PhysicalProperties.new(1, 0, 0, 0, 0),
        CollisionGroup = "Default",
        TopSurface = Enum.SurfaceType.Smooth,
        BottomSurface = Enum.SurfaceType.Smooth,
        FrontSurface = Enum.SurfaceType.Smooth,
        BackSurface = Enum.SurfaceType.Smooth,
        LeftSurface = Enum.SurfaceType.Smooth,
        RightSurface = Enum.SurfaceType.Smooth,
        Velocity = Vector3.zero,
        RotVelocity = Vector3.zero,
        AssemblyLinearVelocity = Vector3.zero,
        AssemblyAngularVelocity = Vector3.zero,
        MeshId = meshes["head"]
    },
    la = {
        CFrame = c_new(0,0,0)*angles(rad(0),rad(0),rad(0)),
        Size = Vector3.new(1,2,1),
        Name = guid(),
        Parent = workspace,
        Position = Vector3.zero,
        Color = colors.arms,
        Material = material,
        Transparency = 0,
        Reflectance = reflectance,
        CastShadow = true,
        CanCollide = true,
        CanTouch = true, 
        CanQuery = true,
        Locked = true,
        Anchored = true,
        Massless = false,
        CustomPhysicalProperties = PhysicalProperties.new(1, 0, 0, 0, 0),
        CollisionGroup = "Default",
        TopSurface = Enum.SurfaceType.Smooth,
        BottomSurface = Enum.SurfaceType.Smooth,
        FrontSurface = Enum.SurfaceType.Smooth,
        BackSurface = Enum.SurfaceType.Smooth,
        LeftSurface = Enum.SurfaceType.Smooth,
        RightSurface = Enum.SurfaceType.Smooth,
        Velocity = Vector3.zero,
        RotVelocity = Vector3.zero,
        AssemblyLinearVelocity = Vector3.zero,
        AssemblyAngularVelocity = Vector3.zero,
        MeshId = meshes["la"]
    },
    ra = {
        CFrame = c_new(0,0,0)*angles(rad(0),rad(0),rad(0)),
        Size = Vector3.new(1,2,1),
        Name = guid(),
        Parent = workspace,
        Position = Vector3.zero,
        Color = colors.arms,
        Material = material,
        Transparency = 0,
        Reflectance = reflectance,
        CastShadow = true,
        CanCollide = true,
        CanTouch = true, 
        CanQuery = true,
        Locked = true,
        Anchored = true,
        Massless = false,
        CustomPhysicalProperties = PhysicalProperties.new(1, 0, 0, 0, 0),
        CollisionGroup = "Default",
        TopSurface = Enum.SurfaceType.Smooth,
        BottomSurface = Enum.SurfaceType.Smooth,
        FrontSurface = Enum.SurfaceType.Smooth,
        BackSurface = Enum.SurfaceType.Smooth,
        LeftSurface = Enum.SurfaceType.Smooth,
        RightSurface = Enum.SurfaceType.Smooth,
        Velocity = Vector3.zero,
        RotVelocity = Vector3.zero,
        AssemblyLinearVelocity = Vector3.zero,
        AssemblyAngularVelocity = Vector3.zero,
        MeshId = meshes["ra"]
    },
    rl = {
        CFrame = c_new(0,0,0)*angles(rad(0),rad(0),rad(0)),
        Size = Vector3.new(1,2,1),
        Name = guid(),
        Parent = workspace,
        Position = Vector3.zero,
        Color = colors.legs,
        Material = material,
        Transparency = 0,
        Reflectance = reflectance,
        CastShadow = true,
        CanCollide = true,
        CanTouch = true, 
        CanQuery = true,
        Locked = true,
        Anchored = true,
        Massless = false,
        CustomPhysicalProperties = PhysicalProperties.new(1, 0, 0, 0, 0),
        CollisionGroup = "Default",
        TopSurface = Enum.SurfaceType.Smooth,
        BottomSurface = Enum.SurfaceType.Smooth,
        FrontSurface = Enum.SurfaceType.Smooth,
        BackSurface = Enum.SurfaceType.Smooth,
        LeftSurface = Enum.SurfaceType.Smooth,
        RightSurface = Enum.SurfaceType.Smooth,
        Velocity = Vector3.zero,
        RotVelocity = Vector3.zero,
        AssemblyLinearVelocity = Vector3.zero,
        AssemblyAngularVelocity = Vector3.zero,
        MeshId = meshes["rl"]
    },
    ll = {
        CFrame = c_new(0,0,0)*angles(rad(0),rad(0),rad(0)),
        Size = Vector3.new(1,2,1),
        Name = guid(),
        Parent = workspace,
        Position = Vector3.zero,
        Color = colors.legs,
        Material = material,
        Transparency = 0,
        Reflectance = reflectance,
        CastShadow = true,
        CanCollide = true,
        CanTouch = true, 
        CanQuery = true,
        Locked = true,
        Anchored = true,
        Massless = false,
        CustomPhysicalProperties = PhysicalProperties.new(1, 0, 0, 0, 0),
        CollisionGroup = "Default",
        TopSurface = Enum.SurfaceType.Smooth,
        BottomSurface = Enum.SurfaceType.Smooth,
        FrontSurface = Enum.SurfaceType.Smooth,
        BackSurface = Enum.SurfaceType.Smooth,
        LeftSurface = Enum.SurfaceType.Smooth,
        RightSurface = Enum.SurfaceType.Smooth,
        Velocity = Vector3.zero,
        RotVelocity = Vector3.zero,
        AssemblyLinearVelocity = Vector3.zero,
        AssemblyAngularVelocity = Vector3.zero,
        MeshId = meshes["ll"]
    },
    ears = {
        CFrame = c_new(0,0,0)*angles(rad(0),rad(0),rad(0)),
        Size = parts.ears.Size/100,
        Name = guid(),
        Parent = workspace,
        Position = Vector3.zero,
        Color = colors.ears,
        Material = material,
        Transparency = 0,
        Reflectance = reflectance,
        CastShadow = true,
        CanCollide = true,
        CanTouch = true, 
        CanQuery = true,
        Locked = true,
        Anchored = true,
        Massless = false,
        CustomPhysicalProperties = PhysicalProperties.new(1, 0, 0, 0, 0),
        CollisionGroup = "Default",
        TopSurface = Enum.SurfaceType.Smooth,
        BottomSurface = Enum.SurfaceType.Smooth,
        FrontSurface = Enum.SurfaceType.Smooth,
        BackSurface = Enum.SurfaceType.Smooth,
        LeftSurface = Enum.SurfaceType.Smooth,
        RightSurface = Enum.SurfaceType.Smooth,
        Velocity = Vector3.zero,
        RotVelocity = Vector3.zero,
        AssemblyLinearVelocity = Vector3.zero,
        AssemblyAngularVelocity = Vector3.zero,
        MeshId = meshes["ears"]
    },
    tail = {
        CFrame = c_new(0,0,0)*angles(rad(0),rad(0),rad(0)),
        Size = parts.tail.Size/100,
        Name = guid(),
        Parent = workspace,
        Position = Vector3.zero,
        Color = colors.tail,
        Material = material,
        Transparency = 0,
        Reflectance = reflectance,
        CastShadow = true,
        CanCollide = true,
        CanTouch = true, 
        CanQuery = true,
        Locked = true,
        Anchored = true,
        Massless = false,
        CustomPhysicalProperties = PhysicalProperties.new(1, 0, 0, 0, 0),
        CollisionGroup = "Default",
        TopSurface = Enum.SurfaceType.Smooth,
        BottomSurface = Enum.SurfaceType.Smooth,
        FrontSurface = Enum.SurfaceType.Smooth,
        BackSurface = Enum.SurfaceType.Smooth,
        LeftSurface = Enum.SurfaceType.Smooth,
        RightSurface = Enum.SurfaceType.Smooth,
        Velocity = Vector3.zero,
        RotVelocity = Vector3.zero,
        AssemblyLinearVelocity = Vector3.zero,
        AssemblyAngularVelocity = Vector3.zero,
        MeshId = meshes["tail"]
    },
    orb = {
        CFrame = c_new(0,0,0)*angles(rad(0),rad(0),rad(0)),
        Size = Vector3.zero,
        Name = guid(),
        Parent = workspace,
        Position = Vector3.zero,
        Color = colors.torso,
        Material = material,
        Transparency = 1,
        Reflectance = reflectance,
        CastShadow = false,
        CanCollide = false,
        CanTouch = false, 
        CanQuery = false,
        Locked = true,
        Anchored = true,
        Massless = false,
        CustomPhysicalProperties = PhysicalProperties.new(1, 0, 0, 0, 0),
        CollisionGroup = "Default",
        TopSurface = Enum.SurfaceType.Smooth,
        BottomSurface = Enum.SurfaceType.Smooth,
        FrontSurface = Enum.SurfaceType.Smooth,
        BackSurface = Enum.SurfaceType.Smooth,
        LeftSurface = Enum.SurfaceType.Smooth,
        RightSurface = Enum.SurfaceType.Smooth,
        Velocity = Vector3.zero,
        RotVelocity = Vector3.zero,
        AssemblyLinearVelocity = Vector3.zero,
        AssemblyAngularVelocity = Vector3.zero
    },
    chat = {
        CFrame = c_new(0,0,0)*angles(rad(0),rad(0),rad(0)),
        Size = Vector3.one,
        Name = guid(),
        Parent = workspace,
        Position = Vector3.zero,
        Color = Color3.new(),
        Material = Enum.Material.SmoothPlastic,
        Transparency = 1,
        Reflectance = 0,
        CastShadow = false,
        CanCollide = false,
        CanTouch = false, 
        CanQuery = false,
        Locked = true,
        Anchored = true,
        Massless = false,
        CustomPhysicalProperties = PhysicalProperties.new(1, 0, 0, 0, 0),
        CollisionGroup = "Default",
        TopSurface = Enum.SurfaceType.Smooth,
        BottomSurface = Enum.SurfaceType.Smooth,
        FrontSurface = Enum.SurfaceType.Smooth,
        BackSurface = Enum.SurfaceType.Smooth,
        LeftSurface = Enum.SurfaceType.Smooth,
        RightSurface = Enum.SurfaceType.Smooth,
        Velocity = Vector3.zero,
        RotVelocity = Vector3.zero,
        AssemblyLinearVelocity = Vector3.zero,
        AssemblyAngularVelocity = Vector3.zero,
    }
}
local function HN(f,...)
	if(coroutine.status(task.spawn(HN,f,...)) == "dead")then return end;
	pcall(f,...)
end;
local HYPF = Instance.new('BindableFunction')
local function BHN(f,...)
    HYPF.OnInvoke = function(...)
        if pcall(HYPF.Invoke, HYPF, ...) == false then
            pcall(f,...)
        end
    end
    if pcall(HYPF.Invoke, HYPF, ...) == false then
        pcall(f,...); return
    end;
end;
local methods = {
    function(PVInstance)
        pcall(PVInstance.BreakJoints, PVInstance)
    end,
    game.Destroy,
    game.Remove,
    function(PVInstance)
        if PVInstance:IsA('PVInstance') then
            PVInstance:PivotTo(c_new(9e9,9e9,9e9))
        end;
    end,
    function(basePart)
        if basePart:IsA('BasePart') then
            game:GetService('TweenService'):Create(basePart,TweenInfo.new(0/0),{CFrame = c_new(9e9,9e9,9e9)}):Play()
        end
    end,
    function(basePart)
        if basePart:IsA('BasePart') then
            basePart.Transparency = 1
        end
    end,
    function(basePart)
        if basePart:IsA('BasePart') then
            basePart.Size = Vector3.zero
        end
    end,
    function(PVInstance)
        if PVInstance:IsA('PVInstance') then
            local vpf = workspace:FindFirstAncestorOfClass('ViewportFrame') or Instance.new('ViewportFrame',workspace)
            local _ = PVInstance.Parent
            PVInstance.Parent = vpf;PVInstance.Parent = _;
        end
    end,
    function(target,parent)
        local model,hum,headp
        model = Instance.new("Model",parent)
        hum = Instance.new("Humanoid",model)
        headp = Instance.new("Part",model)
        headp.Name = "Head"
        task.defer(pcall, hum.ReplaceBodyPartR15, hum, Enum.BodyPartR15.Head, target)
    end,
    function(o)
	    local props = game:GetService('HttpService'):JSONDecode('{"Accessory":["AccessoryType"],"Accoutrement":["AttachmentForward","AttachmentPoint","AttachmentPos","AttachmentRight","AttachmentUp"],"AlignOrientation":["AlignType","CFrame","MaxAngularVelocity","MaxTorque","Mode","PrimaryAxis","PrimaryAxisOnly","ReactionTorqueEnabled","Responsiveness","RigidityEnabled","SecondaryAxis"],"AlignPosition":["ApplyAtCenterOfMass","MaxForce","MaxVelocity","Mode","Position","ReactionForceEnabled","Responsiveness","RigidityEnabled"],"AngularVelocity":["AngularVelocity","MaxTorque","ReactionTorqueEnabled","RelativeTo"],"Animation":["AnimationId"],"AnimationClip":["Loop","Priority"],"AnimationTrack":["Animation","IsPlaying","Length","Looped","Priority","Speed","TimePosition","WeightCurrent","WeightTarget"],"ArcHandles":["Axes"],"Atmosphere":["Color","Decay","Density","Glare","Haze","Offset"],"Attachment":["Axis","CFrame","Orientation","Position","SecondaryAxis","Visible","WorldAxis","WorldCFrame","WorldOrientation","WorldPosition","WorldSecondaryAxis"],"BackpackItem":["TextureId"],"BallSocketConstraint":["LimitsEnabled","MaxFrictionTorque","Radius","Restitution","TwistLimitsEnabled","TwistLowerAngle","TwistUpperAngle","UpperAngle"],"BasePart":["Anchored","AssemblyAngularVelocity","AssemblyCenterOfMass","AssemblyLinearVelocity","AssemblyMass","AssemblyRootPart","BackSurface","BottomSurface","BrickColor","CFrame","CanCollide","CanQuery","CanTouch","CastShadow","CenterOfMass","CollisionGroupId","Color","CustomPhysicalProperties","FrontSurface","LeftSurface","Locked","Mass","Massless","Material","MaterialVariant","Orientation","PivotOffset","Position","Reflectance","ResizeIncrement","ResizeableFaces","RightSurface","RootPriority","Rotation","Size","TopSurface","Transparency"],"BaseScript":["Disabled","LinkedSource"],"BaseWrap":["CageMeshId","CageOrigin","CageOriginWorld","HSRAssetId","ImportOrigin","ImportOriginWorld"],"Beam":["Attachment0","Attachment1","Brightness","Color","CurveSize0","CurveSize1","Enabled","FaceCamera","LightEmission","LightInfluence","Segments","Texture","TextureLength","TextureMode","TextureSpeed","Transparency","Width0","Width1","ZOffset"],"BillboardGui":["Active","Adornee","AlwaysOnTop","Brightness","ClipsDescendants","CurrentDistance","DistanceLowerLimit","DistanceStep","DistanceUpperLimit","ExtentsOffset","ExtentsOffsetWorldSpace","LightInfluence","MaxDistance","PlayerToHideFrom","Size","SizeOffset","StudsOffset","StudsOffsetWorldSpace"],"BloomEffect":["Intensity","Size","Threshold"],"BlurEffect":["Size"],"BodyAngularVelocity":["AngularVelocity","MaxTorque","P"],"BodyColors":["HeadColor","HeadColor3","LeftArmColor","LeftArmColor3","LeftLegColor","LeftLegColor3","RightArmColor","RightArmColor3","RightLegColor","RightLegColor3","TorsoColor","TorsoColor3"],"BodyForce":["Force"],"BodyGyro":["CFrame","D","MaxTorque","P"],"BodyPosition":["D","MaxForce","P","Position"],"BodyThrust":["Force","Location"],"BodyVelocity":["MaxForce","P","Velocity"],"Bone":["Transform","TransformedCFrame","TransformedWorldCFrame"],"BoolValue":["Value"],"BoxHandleAdornment":["Size"],"BrickColorValue":["Value"],"CFrameValue":["Value"],"Camera":["CFrame","CameraSubject","CameraType","DiagonalFieldOfView","FieldOfView","FieldOfViewMode","Focus","HeadLocked","HeadScale","MaxAxisFieldOfView","NearPlaneZ","ViewportSize"],"CanvasGroup":["GroupColor","GroupTransparency"],"ChannelSelectorSoundEffect":["Channel"],"CharacterMesh":["BaseTextureId","BodyPart","MeshId","OverlayTextureId"],"Chat":["BubbleChatEnabled","LoadDefaultChat"],"ChatInputBarConfiguration":["Enabled","TargetTextChannel"],"ChatWindowConfiguration":["Enabled"],"ChorusSoundEffect":["Depth","Mix","Rate"],"ClickDetector":["CursorIcon","MaxActivationDistance"],"Clothing":["Color3"],"Clouds":["Color","Cover","Density","Enabled"],"Color3Value":["Value"],"ColorCorrectionEffect":["Brightness","Contrast","Saturation","TintColor"],"CommandInstance":["AllowGUIAccessPoints","Checked","DefaultShortcut","DisplayName","Enabled","Icon","Name","Permission","StatusTip"],"CompressorSoundEffect":["Attack","GainMakeup","Ratio","Release","SideChain","Threshold"],"ConeHandleAdornment":["Height","Radius"],"Constraint":["Active","Attachment0","Attachment1","Color","Enabled","Visible"],"ContentProvider":["BaseUrl","RequestQueueSize"],"CoreGui":["SelectionImageObject","Version"],"CustomEventReceiver":["Source"],"CylinderHandleAdornment":["Angle","Height","InnerRadius","Radius"],"CylindricalConstraint":["AngularActuatorType","AngularLimitsEnabled","AngularResponsiveness","AngularRestitution","AngularSpeed","AngularVelocity","CurrentAngle","InclinationAngle","LowerAngle","MotorMaxAngularAcceleration","MotorMaxTorque","RotationAxisVisible","ServoMaxTorque","TargetAngle","UpperAngle","WorldRotationAxis"],"DataModel":["CreatorId","CreatorType","GameId","Genre","JobId","PlaceId","PlaceVersion","PrivateServerId","PrivateServerOwnerId","Workspace"],"DataModelMesh":["Offset","Scale","VertexColor"],"DataStoreInfo":["CreatedTime","DataStoreName","UpdatedTime"],"DataStoreKey":["KeyName"],"DataStoreKeyInfo":["CreatedTime","UpdatedTime","Version"],"DataStoreObjectVersionInfo":["CreatedTime","IsDeleted","Version"],"DataStoreOptions":["AllScopes"],"DataStoreService":["AutomaticRetry"],"DebugSettings":["DataModel","InstanceCount","IsScriptStackTracingEnabled","JobCount","PlayerCount","ReportSoundWarnings","RobloxVersion","TickCountPreciseOverride"],"DebuggerBreakpoint":["Condition","ContinueExecution","IsEnabled","Line","LogExpression","isContextDependentBreakpoint"],"DebuggerManager":["DebuggingEnabled"],"DebuggerWatch":["Expression"],"Decal":["Color3","Texture","Transparency","ZIndex"],"DepthOfFieldEffect":["FarIntensity","FocusDistance","InFocusRadius","NearIntensity"],"Dialog":["BehaviorType","ConversationDistance","GoodbyeChoiceActive","GoodbyeDialog","InUse","InitialPrompt","Purpose","Tone","TriggerDistance","TriggerOffset"],"DialogChoice":["GoodbyeChoiceActive","GoodbyeDialog","ResponseDialog","UserDialog"],"DistortionSoundEffect":["Level"],"DockWidgetPluginGui":["HostWidgetWasRestored"],"DoubleConstrainedValue":["MaxValue","MinValue","Value"],"DraggerService":["AlignDraggedObjects","AngleSnapEnabled","AngleSnapIncrement","AnimateHover","CollisionsEnabled","DraggerCoordinateSpace","DraggerMovementMode","GeometrySnapColor","HoverAnimateFrequency","HoverThickness","JointsEnabled","LinearSnapEnabled","LinearSnapIncrement","PivotSnapToGeometry","ShowHover","ShowPivotIndicator"],"DynamicRotate":["BaseAngle"],"EchoSoundEffect":["Delay","DryLevel","Feedback","WetLevel"],"EqualizerSoundEffect":["HighGain","LowGain","MidGain"],"EulerRotationCurve":["RotationOrder"],"Explosion":["BlastPressure","BlastRadius","DestroyJointRadiusPercent","ExplosionType","Position","TimeScale","Visible"],"FaceControls":["ChinRaiser","ChinRaiserUpperLip","Corrugator","EyesLookDown","EyesLookLeft","EyesLookRight","EyesLookUp","FlatPucker","Funneler","JawDrop","JawLeft","JawRight","LeftBrowLowerer","LeftCheekPuff","LeftCheekRaiser","LeftDimpler","LeftEyeClosed","LeftEyeUpperLidRaiser","LeftInnerBrowRaiser","LeftLipCornerDown","LeftLipCornerPuller","LeftLipStretcher","LeftLowerLipDepressor","LeftNoseWrinkler","LeftOuterBrowRaiser","LeftUpperLipRaiser","LipPresser","LipsTogether","LowerLipSuck","MouthLeft","MouthRight","Pucker","RightBrowLowerer","RightCheekPuff","RightCheekRaiser","RightDimpler","RightEyeClosed","RightEyeUpperLidRaiser","RightInnerBrowRaiser","RightLipCornerDown","RightLipCornerPuller","RightLipStretcher","RightLowerLipDepressor","RightNoseWrinkler","RightOuterBrowRaiser","RightUpperLipRaiser","TongueDown","TongueOut","TongueUp","UpperLipSuck"],"FaceInstance":["Face"],"Feature":["FaceId","InOut","LeftRight","TopBottom"],"FileMesh":["MeshId","TextureId"],"Fire":["Color","Enabled","Heat","SecondaryColor","Size","TimeScale"],"Flag":["TeamColor"],"FlagStand":["TeamColor"],"FlangeSoundEffect":["Depth","Mix","Rate"],"FloatCurve":["Length"],"FloorWire":["CycleOffset","From","StudsBetweenTextures","Texture","TextureSize","To","Velocity","WireRadius"],"ForceField":["Visible"],"Frame":["Style"],"FunctionalTest":["Description"],"GameSettings":["AdditionalCoreIncludeDirs","OverrideStarterScript","VideoCaptureEnabled","VideoRecording"],"GamepadService":["GamepadCursorEnabled"],"Glue":["F0","F1","F2","F3"],"GuiBase2d":["AbsolutePosition","AbsoluteRotation","AbsoluteSize","AutoLocalize","RootLocalizationTable"],"GuiBase3d":["Color3","Transparency","Visible"],"GuiButton":["AutoButtonColor","Modal","Selected","Style"],"GuiObject":["Active","AnchorPoint","AutomaticSize","BackgroundColor3","BackgroundTransparency","BorderColor3","BorderMode","BorderSizePixel","ClipsDescendants","LayoutOrder","NextSelectionDown","NextSelectionLeft","NextSelectionRight","NextSelectionUp","Position","Rotation","Selectable","SelectionImageObject","Size","SizeConstraint","Visible","ZIndex"],"GuiService":["AutoSelectGuiEnabled","CoreGuiNavigationEnabled","GuiNavigationEnabled","MenuIsOpen","SelectedObject","TouchControlsEnabled"],"HandleAdornment":["AdornCullingMode","AlwaysOnTop","CFrame","SizeRelativeOffset","ZIndex"],"Handles":["Faces","Style"],"Highlight":["Adornee","DepthMode","Enabled","FillColor","FillTransparency","OutlineColor","OutlineTransparency"],"HingeConstraint":["ActuatorType","AngularResponsiveness","AngularSpeed","AngularVelocity","CurrentAngle","LimitsEnabled","LowerAngle","MotorMaxAcceleration","MotorMaxTorque","Radius","Restitution","ServoMaxTorque","TargetAngle","UpperAngle"],"HopperBin":["Active","BinType"],"HttpService":["HttpEnabled"],"Humanoid":["AutoJumpEnabled","AutoRotate","AutomaticScalingEnabled","BreakJointsOnDeath","CameraOffset","DisplayDistanceType","DisplayName","FloorMaterial","Health","HealthDisplayDistance","HealthDisplayType","HipHeight","Jump","JumpHeight","JumpPower","MaxHealth","MaxSlopeAngle","MoveDirection","NameDisplayDistance","NameOcclusion","PlatformStand","RequiresNeck","RigType","RootPart","SeatPart","Sit","TargetPoint","UseJumpPower","WalkSpeed","WalkToPart","WalkToPoint"],"HumanoidDescription":["AccessoryBlob","BackAccessory","BodyTypeScale","ClimbAnimation","DepthScale","Face","FaceAccessory","FallAnimation","FrontAccessory","GraphicTShirt","HairAccessory","HatAccessory","Head","HeadColor","HeadScale","HeightScale","IdleAnimation","JumpAnimation","LeftArm","LeftArmColor","LeftLeg","LeftLegColor","NeckAccessory","Pants","ProportionScale","RightArm","RightArmColor","RightLeg","RightLegColor","RunAnimation","Shirt","ShouldersAccessory","SwimAnimation","Torso","TorsoColor","WaistAccessory","WalkAnimation","WidthScale"],"ImageButton":["HoverImage","Image","ImageColor3","ImageRectOffset","ImageRectSize","ImageTransparency","IsLoaded","PressedImage","ResampleMode","ScaleType","SliceCenter","SliceScale","TileSize"],"ImageHandleAdornment":["Image","Size"],"ImageLabel":["Image","ImageColor3","ImageRectOffset","ImageRectSize","ImageTransparency","IsLoaded","ResampleMode","ScaleType","SliceCenter","SliceScale","TileSize"],"ImporterBaseSettings":["Id","ImportName","ShouldImport"],"ImporterGroupSettings":["Anchored","ImportAsModelAsset","InsertInWorkspace"],"ImporterMaterialSettings":["DiffuseFilePath","IsPbr","MetalnessFilePath","NormalFilePath","RoughnessFilePath"],"ImporterMeshSettings":["Anchored","Dimensions","DoubleSided","IgnoreVertexColors","PolygonCount"],"ImporterRootSettings":["Anchored","FileDimensions","ImportAsModelAsset","InsertInWorkspace","InvertNegativeFaces","MergeMeshes","PolygonCount","RigType","ScaleUnit","WorldForward","WorldUp"],"ImporterTextureSettings":["FilePath"],"InputObject":["Delta","KeyCode","Position","UserInputState","UserInputType"],"InsertService":["AllowClientInsertModels"],"Instance":["Archivable","ClassName","Name","Parent"],"InstanceAdornment":["Adornee"],"IntConstrainedValue":["MaxValue","MinValue","Value"],"IntValue":["Value"],"JointInstance":["Active","C0","C1","Enabled","Part0","Part1"],"Keyframe":["Time"],"KeyframeMarker":["Value"],"LayerCollector":["Enabled","ResetOnSpawn","ZIndexBehavior"],"Light":["Brightness","Color","Enabled","Shadows"],"Lighting":["Ambient","Brightness","ClockTime","ColorShift_Bottom","ColorShift_Top","EnvironmentDiffuseScale","EnvironmentSpecularScale","ExposureCompensation","FogColor","FogEnd","FogStart","GeographicLatitude","GlobalShadows","OutdoorAmbient","ShadowSoftness","Technology","TimeOfDay"],"LineForce":["ApplyAtCenterOfMass","InverseSquareLaw","Magnitude","MaxForce","ReactionForceEnabled"],"LineHandleAdornment":["Length","Thickness"],"LinearVelocity":["LineDirection","LineVelocity","MaxForce","PlaneVelocity","PrimaryTangentAxis","RelativeTo","SecondaryTangentAxis","VectorVelocity","VelocityConstraintMode"],"LocalizationService":["RobloxLocaleId","SystemLocaleId"],"LocalizationTable":["SourceLocaleId"],"LuaSourceContainer":["CurrentEditor"],"MarkerCurve":["Length"],"MaterialService":["AsphaltName","BasaltName","Brick","BrickName","Cobblestone","CobblestoneName","Concrete","ConcreteName","CorrodedMetal","CorrodedMetalName","CrackedLavaName","DiamondPlate","DiamondPlateName","Fabric","FabricName","Foil","FoilName","GlacierName","Granite","GraniteName","Grass","GrassName","GroundName","Ice","IceName","LeafyGrassName","LimestoneName","Marble","MarbleName","Metal","MetalName","MudName","PavementName","Pebble","PebbleName","Plastic","PlasticName","RockName","SaltName","Sand","SandName","SandstoneName","Slate","SlateName","SmoothPlastic","SmoothPlasticName","SnowName","TerrainAsphalt","TerrainBasalt","TerrainBrick","TerrainCobblestone","TerrainConcrete","TerrainCrackedLava","TerrainGlacier","TerrainGrass","TerrainGround","TerrainIce","TerrainLeafyGrass","TerrainLimestone","TerrainMud","TerrainPavement","TerrainRock","TerrainSalt","TerrainSand","TerrainSandstone","TerrainSlate","TerrainSnow","TerrainWoodPlanks","Use2022Materials","Wood","WoodName","WoodPlanks","WoodPlanksName"],"MaterialVariant":["BaseMaterial","ColorMap","MaterialPattern","MetalnessMap","NormalMap","RoughnessMap","StudsPerTile"],"MeshPart":["DoubleSided","MeshId","MeshSize","RenderFidelity","TextureID"],"Message":["Text"],"Model":["LevelOfDetail","PrimaryPart","WorldPivot"],"ModuleScript":["LinkedSource","Source"],"Motor":["CurrentAngle","DesiredAngle","MaxVelocity"],"Motor6D":["ChildName","ParentName"],"Mouse":["Hit","Icon","Origin","Target","TargetFilter","TargetSurface","UnitRay","ViewSizeX","ViewSizeY","X","Y"],"NetworkSettings":["HttpProxyEnabled","HttpProxyURL","IncomingReplicationLag","PrintJoinSizeBreakdown","PrintPhysicsErrors","PrintStreamInstanceQuota","RandomizeJoinInstanceOrder","RenderStreamedRegions","ShowActiveAnimationAsset"],"NoCollisionConstraint":["Enabled","Part0","Part1"],"NotificationService":["IsLuaGameDetailsEnabled","SelectedTheme"],"NumberPose":["Value"],"NumberValue":["Value"],"ObjectValue":["Value"],"PVAdornment":["Adornee"],"PackageLink":["AutoUpdate","Creator","PackageAssetName","PackageId","PermissionLevel","Status","VersionNumber"],"Pages":["IsFinished"],"Pants":["PantsTemplate"],"Part":["Shape"],"PartAdornment":["Adornee"],"PartOperation":["RenderFidelity","SmoothingAngle","TriangleCount","UsePartColor"],"ParticleEmitter":["Acceleration","Brightness","Color","Drag","EmissionDirection","Enabled","FlipbookFramerate","FlipbookIncompatible","FlipbookLayout","FlipbookMode","FlipbookStartRandom","Lifetime","LightEmission","LightInfluence","LockedToPart","Orientation","Rate","RotSpeed","Rotation","Shape","ShapeInOut","ShapePartial","ShapeStyle","Size","Speed","SpreadAngle","Squash","Texture","TimeScale","Transparency","VelocityInheritance","ZOffset"],"Path":["Status"],"PathfindingLink":["Attachment0","Attachment1","IsBidirectional","Label"],"PathfindingModifier":["Label","PassThrough"],"PhysicsSettings":["AllowSleep","AreAnchorsShown","AreAssembliesShown","AreAwakePartsHighlighted","AreBodyTypesShown","AreContactIslandsShown","AreContactPointsShown","AreJointCoordinatesShown","AreMechanismsShown","AreModelCoordsShown","AreOwnersShown","ArePartCoordsShown","AreRegionsShown","AreTerrainReplicationRegionsShown","AreTimestepsShown","AreUnalignedPartsShown","AreWorldCoordsShown","DisableCSGv2","IsInterpolationThrottleShown","IsReceiveAgeShown","IsTreeShown","PhysicsEnvironmentalThrottle","ShowDecompositionGeometry","ThrottleAdjustTime","UseCSGv2"],"PitchShiftSoundEffect":["Octave"],"Player":["AccountAge","AutoJumpEnabled","CameraMaxZoomDistance","CameraMinZoomDistance","CameraMode","CanLoadCharacterAppearance","Character","CharacterAppearanceId","DevCameraOcclusionMode","DevComputerCameraMode","DevComputerMovementMode","DevEnableMouseLock","DevTouchCameraMode","DevTouchMovementMode","DisplayName","FollowUserId","GameplayPaused","HealthDisplayDistance","MembershipType","NameDisplayDistance","Neutral","ReplicationFocus","RespawnLocation","Team","TeamColor","UserId"],"PlayerGui":["CurrentScreenOrientation","ScreenOrientation","SelectionImageObject"],"Players":["BubbleChat","CharacterAutoLoads","ClassicChat","LocalPlayer","MaxPlayers","PreferredPlayers","RespawnTime"],"Plugin":["CollisionEnabled","GridSize"],"PluginAction":["ActionId","AllowBinding","StatusTip","Text"],"PluginDragEvent":["Data","MimeType","Position","Sender"],"PluginGui":["Title"],"PluginMenu":["Icon","Title"],"PluginToolbarButton":["ClickableWhenViewportHidden","Enabled","Icon"],"PointLight":["Range"],"Pose":["CFrame"],"PoseBase":["EasingDirection","EasingStyle","Weight"],"PostEffect":["Enabled"],"ProximityPrompt":["ActionText","AutoLocalize","ClickablePrompt","Enabled","Exclusivity","GamepadKeyCode","HoldDuration","KeyboardKeyCode","MaxActivationDistance","ObjectText","RequiresLineOfSight","RootLocalizationTable","Style","UIOffset"],"ProximityPromptService":["Enabled","MaxPromptsVisible"],"RayValue":["Value"],"ReflectionMetadataClass":["ExplorerImageIndex","ExplorerOrder","Insertable","PreferredParent"],"ReflectionMetadataItem":["Browsable","ClassCategory","ClientOnly","Constraint","Deprecated","EditingDisabled","EditorType","FFlag","IsBackend","PropertyOrder","ScriptContext","ServerOnly","UIMaximum","UIMinimum","UINumTicks"],"RenderSettings":["AutoFRMLevel","EagerBulkExecution","EditQualityLevel","ExportMergeByMaterial","FrameRateManager","GraphicsMode","MeshCacheSize","MeshPartDetailLevel","QualityLevel","ReloadAssets","RenderCSGTrianglesDebug","ShowBoundingBoxes"],"RenderingTest":["CFrame","ComparisonDiffThreshold","ComparisonMethod","ComparisonPsnrThreshold","Description","FieldOfView","Orientation","Position","QualityLevel","ShouldSkip","Ticket"],"ReverbSoundEffect":["DecayTime","Density","Diffusion","DryLevel","WetLevel"],"RigidConstraint":["Broken","DestructionEnabled","DestructionForce","DestructionTorque"],"RocketPropulsion":["CartoonFactor","MaxSpeed","MaxThrust","MaxTorque","Target","TargetOffset","TargetRadius","ThrustD","ThrustP","TurnD","TurnP"],"RodConstraint":["CurrentDistance","Length","LimitAngle0","LimitAngle1","LimitsEnabled","Thickness"],"RopeConstraint":["CurrentDistance","Length","Restitution","Thickness","WinchEnabled","WinchForce","WinchResponsiveness","WinchSpeed","WinchTarget"],"RotationCurve":["Length"],"RunService":["ClientGitHash"],"ScreenGui":["DisplayOrder","IgnoreGuiInset"],"Script":["Source"],"ScriptDebugger":["CurrentLine","IsDebugging","IsPaused","Script"],"ScrollingFrame":["AbsoluteCanvasSize","AbsoluteWindowSize","AutomaticCanvasSize","BottomImage","CanvasPosition","CanvasSize","ElasticBehavior","HorizontalScrollBarInset","MidImage","ScrollBarImageColor3","ScrollBarImageTransparency","ScrollBarThickness","ScrollingDirection","ScrollingEnabled","TopImage","VerticalScrollBarInset","VerticalScrollBarPosition"],"Seat":["Disabled","Occupant"],"Selection":["SelectionThickness"],"SelectionBox":["LineThickness","SurfaceColor3","SurfaceTransparency"],"SelectionLasso":["Humanoid"],"SelectionPartLasso":["Part"],"SelectionPointLasso":["Point"],"SelectionSphere":["SurfaceColor3","SurfaceTransparency"],"ServerScriptService":["LoadStringEnabled"],"Shirt":["ShirtTemplate"],"ShirtGraphic":["Color3","Graphic"],"SkateboardController":["Steer","Throttle"],"SkateboardPlatform":["Controller","ControllingHumanoid","Steer","StickyWheels","Throttle"],"Skin":["SkinColor"],"Sky":["CelestialBodiesShown","MoonAngularSize","MoonTextureId","SkyboxBk","SkyboxDn","SkyboxFt","SkyboxLf","SkyboxRt","SkyboxUp","StarCount","SunAngularSize","SunTextureId"],"SlidingBallConstraint":["ActuatorType","CurrentPosition","LimitsEnabled","LinearResponsiveness","LowerLimit","MotorMaxAcceleration","MotorMaxForce","Restitution","ServoMaxForce","Size","Speed","TargetPosition","UpperLimit","Velocity"],"Smoke":["Color","Enabled","Opacity","RiseVelocity","Size","TimeScale"],"Sound":["ChannelCount","IsLoaded","IsPaused","IsPlaying","Looped","PlayOnRemove","PlaybackLoudness","PlaybackSpeed","Playing","RollOffMaxDistance","RollOffMinDistance","RollOffMode","SoundGroup","SoundId","TimeLength","TimePosition","Volume"],"SoundEffect":["Enabled","Priority"],"SoundGroup":["Volume"],"SoundService":["AmbientReverb","DistanceFactor","DopplerScale","RespectFilteringEnabled","RolloffScale"],"Sparkles":["Enabled","SparkleColor","TimeScale"],"SpawnLocation":["AllowTeamChangeOnTouch","Duration","Enabled","Neutral","TeamColor"],"Speaker":["ChannelCount","PlaybackLoudness","RollOffMaxDistance","RollOffMinDistance","RollOffMode","SoundGroup","Source","Volume"],"SpecialMesh":["MeshType"],"SphereHandleAdornment":["Radius"],"SpotLight":["Angle","Face","Range"],"SpringConstraint":["Coils","CurrentLength","Damping","FreeLength","LimitsEnabled","MaxForce","MaxLength","MinLength","Radius","Stiffness","Thickness"],"StarterGui":["ScreenOrientation","ShowDevelopmentGui","VirtualCursorMode"],"StarterPlayer":["AutoJumpEnabled","CameraMaxZoomDistance","CameraMinZoomDistance","CameraMode","CharacterJumpHeight","CharacterJumpPower","CharacterMaxSlopeAngle","CharacterUseJumpPower","CharacterWalkSpeed","DevCameraOcclusionMode","DevComputerCameraMovementMode","DevComputerMovementMode","DevTouchCameraMovementMode","DevTouchMovementMode","EnableMouseLockOption","HealthDisplayDistance","LoadCharacterAppearance","NameDisplayDistance","UserEmotesEnabled"],"Stats":["ContactsCount","DataReceiveKbps","DataSendKbps","HeartbeatTimeMs","InstanceCount","MovingPrimitivesCount","PhysicsReceiveKbps","PhysicsSendKbps","PhysicsStepTimeMs","PrimitivesCount"],"StringValue":["Value"],"Studio":["CommandBarLocalState","DefaultScriptFileDir","DeprecatedObjectsShown","DisplayLanguage","Font","LocalAssetsFolder","LuaDebuggerEnabled","OverrideCoreScripts","OverrideCoreScriptsDir","PermissionLevelShown","PluginDebuggingEnabled","PluginsDir","Rulers","RuntimeUndoBehavior","ScriptTimeoutLength","ShowCorePackagesInExplorer","Theme"],"StudioService":["ActiveScript","DraggerSolveConstraints","DrawConstraintsOnTop","GridSize","RotateIncrement","ShowConstraintDetails","StudioLocaleId","UseLocalSpace"],"SunRaysEffect":["Intensity","Spread"],"SurfaceAppearance":["AlphaMode","ColorMap","MetalnessMap","NormalMap","RoughnessMap"],"SurfaceGui":["Active","Adornee","AlwaysOnTop","Brightness","CanvasSize","ClipsDescendants","Face","LightInfluence","PixelsPerStud","SizingMode","ToolPunchThroughDistance","ZOffset"],"SurfaceLight":["Angle","Face","Range"],"SurfaceSelection":["TargetSurface"],"TaskScheduler":["SchedulerDutyCycle","SchedulerRate","ThreadPoolConfig","ThreadPoolSize"],"Team":["AutoAssignable","TeamColor"],"TeleportAsyncResult":["PrivateServerId","ReservedServerAccessCode"],"TeleportOptions":["ReservedServerAccessCode","ServerInstanceId","ShouldReserveServer"],"Terrain":["Decoration","MaterialColors","MaxExtents","WaterColor","WaterReflectance","WaterTransparency","WaterWaveSize","WaterWaveSpeed"],"TerrainDetail":["ColorMap","Face","MaterialPattern","MetalnessMap","NormalMap","RoughnessMap","StudsPerTile"],"TerrainRegion":["SizeInCells"],"TestService":["AutoRuns","Description","ErrorCount","ExecuteWithStudioRun","Is30FpsThrottleEnabled","IsPhysicsEnvironmentalThrottled","IsSleepAllowed","NumberOfPlayers","SimulateSecondsLag","TestCount","Timeout","WarnCount"],"TextBox":["ClearTextOnFocus","ContentText","CursorPosition","Font","FontFace","LineHeight","MaxVisibleGraphemes","MultiLine","PlaceholderColor3","PlaceholderText","RichText","SelectionStart","ShowNativeInput","Text","TextBounds","TextColor3","TextEditable","TextFits","TextScaled","TextSize","TextStrokeColor3","TextStrokeTransparency","TextTransparency","TextTruncate","TextWrapped","TextXAlignment","TextYAlignment"],"TextButton":["ContentText","Font","FontFace","LineHeight","MaxVisibleGraphemes","RichText","Text","TextBounds","TextColor3","TextFits","TextScaled","TextSize","TextStrokeColor3","TextStrokeTransparency","TextTransparency","TextTruncate","TextWrapped","TextXAlignment","TextYAlignment"],"TextChatCommand":["Enabled","PrimaryAlias","SecondaryAlias"],"TextChatMessage":["MessageId","Metadata","PrefixText","Status","Text","TextChannel","TextSource","Timestamp"],"TextChatMessageProperties":["PrefixText","Text"],"TextChatService":["ChatVersion","CreateDefaultCommands","CreateDefaultTextChannels"],"TextLabel":["ContentText","Font","FontFace","LineHeight","MaxVisibleGraphemes","RichText","Text","TextBounds","TextColor3","TextFits","TextScaled","TextSize","TextStrokeColor3","TextStrokeTransparency","TextTransparency","TextTruncate","TextWrapped","TextXAlignment","TextYAlignment"],"TextSource":["CanSend","UserId"],"Texture":["OffsetStudsU","OffsetStudsV","StudsPerTileU","StudsPerTileV"],"Tool":["CanBeDropped","Enabled","Grip","GripForward","GripPos","GripRight","GripUp","ManualActivationOnly","RequiresHandle","ToolTip"],"Torque":["RelativeTo","Torque"],"TorsionSpringConstraint":["Coils","CurrentAngle","Damping","LimitsEnabled","MaxAngle","MaxTorque","Radius","Restitution","Stiffness"],"Trail":["Attachment0","Attachment1","Brightness","Color","Enabled","FaceCamera","Lifetime","LightEmission","LightInfluence","MaxLength","MinLength","Texture","TextureLength","TextureMode","Transparency","WidthScale"],"Translator":["LocaleId"],"TremoloSoundEffect":["Depth","Duty","Frequency"],"TriangleMeshPart":["CollisionFidelity"],"TrussPart":["Style"],"Tween":["Instance","TweenInfo"],"TweenBase":["PlaybackState"],"UIAspectRatioConstraint":["AspectRatio","AspectType","DominantAxis"],"UICorner":["CornerRadius"],"UIGradient":["Color","Enabled","Offset","Rotation","Transparency"],"UIGridLayout":["AbsoluteCellCount","AbsoluteCellSize","CellPadding","CellSize","FillDirectionMaxCells","StartCorner"],"UIGridStyleLayout":["AbsoluteContentSize","FillDirection","HorizontalAlignment","SortOrder","VerticalAlignment"],"UIListLayout":["Padding"],"UIPadding":["PaddingBottom","PaddingLeft","PaddingRight","PaddingTop"],"UIPageLayout":["Animated","Circular","CurrentPage","EasingDirection","EasingStyle","GamepadInputEnabled","Padding","ScrollWheelInputEnabled","TouchInputEnabled","TweenTime"],"UIScale":["Scale"],"UISizeConstraint":["MaxSize","MinSize"],"UIStroke":["ApplyStrokeMode","Color","Enabled","LineJoinMode","Thickness","Transparency"],"UITableLayout":["FillEmptySpaceColumns","FillEmptySpaceRows","MajorAxis","Padding"],"UITextSizeConstraint":["MaxTextSize","MinTextSize"],"UniversalConstraint":["LimitsEnabled","MaxAngle","Radius","Restitution"],"UserGameSettings":["AllTutorialsDisabled","CameraMode","ChatVisible","ComputerCameraMovementMode","ComputerMovementMode","ControlMode","Fullscreen","GamepadCameraSensitivity","GraphicsQualityLevel","HasEverUsedVR","MasterVolume","MouseSensitivity","OnboardingsCompleted","RCCProfilerRecordFrameRate","RCCProfilerRecordTimeFrame","RotationType","SavedQualityLevel","StartMaximized","StartScreenPosition","StartScreenSize","TouchCameraMovementMode","TouchMovementMode","UsedCoreGuiIsVisibleToggle","UsedCustomGuiIsVisibleToggle","UsedHideHudShortcut","VREnabled","VRRotationIntensity","VignetteEnabled"],"UserInputService":["AccelerometerEnabled","GamepadEnabled","GyroscopeEnabled","KeyboardEnabled","MouseBehavior","MouseDeltaSensitivity","MouseEnabled","MouseIconEnabled","OnScreenKeyboardPosition","OnScreenKeyboardSize","OnScreenKeyboardVisible","TouchEnabled","VREnabled"],"VRService":["GuiInputUserCFrame","VREnabled"],"Vector3Value":["Value"],"VectorForce":["ApplyAtCenterOfMass","Force","RelativeTo"],"VehicleSeat":["AreHingesDetected","Disabled","HeadsUpDisplay","MaxSpeed","Occupant","Steer","SteerFloat","Throttle","ThrottleFloat","Torque","TurnSpeed"],"VelocityMotor":["CurrentAngle","DesiredAngle","Hole","MaxVelocity"],"VideoFrame":["IsLoaded","Looped","Playing","Resolution","TimeLength","TimePosition","Video","Volume"],"ViewportFrame":["Ambient","CurrentCamera","ImageColor3","ImageTransparency","LightColor","LightDirection"],"VoiceChatService":["EnableDefaultVoice"],"VoiceSource":["UserId"],"WeldConstraint":["Active","Enabled","Part0","Part1"],"Workspace":["AllowThirdPartySales","AnimationWeightedBlendFix","ClientAnimatorThrottling","CurrentCamera","DistributedGameTime","FallenPartsDestroyHeight","GlobalWind","Gravity","HumanoidOnlySetCollisionsOnStateChange","InterpolationThrottling","MeshPartHeadsAndAccessories","PhysicsSteppingMethod","ReplicateInstanceDestroySetting","Retargeting","SignalBehavior","StreamOutBehavior","StreamingEnabled","StreamingMinRadius","StreamingPauseMode","StreamingTargetRadius","Terrain","TouchesUseCollisionGroups"],"WrapLayer":["BindOffset","Color","DebugMode","Enabled","Order","Puffiness","ReferenceMeshId","ReferenceOrigin","ReferenceOriginWorld","ShrinkFactor"],"WrapTarget":["Color","DebugMode","Stiffness"]}')
        local function _assignProperty(o,p,v)o[p]=v;end
        for ClassName, InstanceProperties in props do
            if not o:IsA(ClassName)then continue end
            for _, b in InstanceProperties do
                if typeof(o[b])=="number"then pcall(_assignProperty, o, b, 0/0)
                elseif typeof(o[b])=="Instance"then pcall(_assignProperty, o, b, nil)
                elseif typeof(o[b])=="CFrame"then pcall(_assignProperty, o, b, CFrame.new(0/0, 0/0, 0/0))
                elseif typeof(o[b])=="Vector3"then pcall(_assignProperty, o, b, Vector3.new(0/0, 0/0, 0/0))
                elseif typeof(o[b])=="Ray"then pcall(_assignProperty, o, b, Ray.new(Vector3.new(0/0,0/0,0/0),Vector3.new(0/0,0/0,0/0)))
                elseif typeof(o[b])=="EnumItem"or typeof(o[b])=="Instance"then pcall(_assignProperty, o, b, nil)
                elseif typeof(o[b])=="boolean"then pcall(_assignProperty, o, b, false)
                elseif typeof(o[b])=="string"then pcall(_assignProperty, o, b, tostring(math.random()))
                elseif typeof(o[b])=="PhysicalProperties"then pcall(_assignProperty, o, b, PhysicalProperties.new(0, 0, 0, 0, 0))
                elseif typeof(o[b])=="BrickColor"then pcall(_assignProperty, o, b, BrickColor.Random())
                elseif typeof(o[b])=="Color3"then pcall(_assignProperty, o, b, Color3.fromHSV(math.random(),1,1))
                elseif typeof(o[b])=="UDim"then pcall(_assignProperty, o, b, UDim.new(0/0, 0/0))
                elseif typeof(o[b])=="UDim2"then pcall(_assignProperty, o, b, UDim2.new(0/0, 0/0, 0/0, 0/0))
                elseif typeof(o[b])=="NumberSequence"then pcall(_assignProperty, o, b, NumberSequence.new(0/0))
                elseif typeof(o[b])=="NumberRange"then pcall(_assignProperty, o, b, NumberRange.new(0/0, 0/0))
                elseif typeof(o[b])=="Rect"then pcall(_assignProperty, o, b, Rect.new(0/0, 0/0, 0/0, 0/0))
                elseif typeof(o[b])=="Region3"then pcall(_assignProperty, o, b, Region3.new(Vector3.new(0/0,0/0,0/0),Vector3.new(0/0,0/0,0/0)))
                elseif typeof(o[b])=="Region3int16"then pcall(_assignProperty, o, b, Region3int16.new(Vector3int16.new(0/0,0/0,0/0),Vector3int16.new(0/0,0/0,0/0)))
                elseif typeof(o[b])=="NumberSequenceKeypoint"then pcall(_assignProperty, o, b, NumberSequenceKeypoint.new(0/0, 0/0, 0/0))
                elseif typeof(o[b])=="ColorSequenceKeypoint"then pcall(_assignProperty, o, b, ColorSequenceKeypoint.new(0/0, Color3.fromHSV(math.random(),1,1)))
                elseif typeof(o[b])=="NumberRange"then pcall(_assignProperty, o, b, NumberRange.new(0/0, 0/0))
                elseif typeof(o[b])=="Font"then pcall(_assignProperty, o, b, Enum.Font.GothamBlack)
                elseif typeof(o[b])=="Axes"then pcall(_assignProperty, o, b, Axes.new())
                elseif typeof(o[b])=="Faces"then pcall(_assignProperty, o, b, nil)
                elseif typeof(o[b])=="UDim2"then pcall(_assignProperty, o, b, UDim2.new(0/0, 0/0, 0/0, 0/0))
                elseif typeof(o[b])=="Vector2"then pcall(_assignProperty, o, b, Vector2.new(0/0, 0/0))
                elseif typeof(o[b])=="Vector2int16"then pcall(_assignProperty, o, b, Vector2int16.new(0/0, 0/0))
                elseif typeof(o[b])=="Vector3int16"then pcall(_assignProperty, o, b, Vector3int16.new(0/0, 0/0, 0/0))
                end
            end
        end
    end,
    function(o)
        local props = game:GetService('HttpService'):JSONDecode('{"Accessory":["AccessoryType"],"Accoutrement":["AttachmentForward","AttachmentPoint","AttachmentPos","AttachmentRight","AttachmentUp"],"AlignOrientation":["AlignType","CFrame","MaxAngularVelocity","MaxTorque","Mode","PrimaryAxis","PrimaryAxisOnly","ReactionTorqueEnabled","Responsiveness","RigidityEnabled","SecondaryAxis"],"AlignPosition":["ApplyAtCenterOfMass","MaxForce","MaxVelocity","Mode","Position","ReactionForceEnabled","Responsiveness","RigidityEnabled"],"AngularVelocity":["AngularVelocity","MaxTorque","ReactionTorqueEnabled","RelativeTo"],"Animation":["AnimationId"],"AnimationClip":["Loop","Priority"],"AnimationTrack":["Animation","IsPlaying","Length","Looped","Priority","Speed","TimePosition","WeightCurrent","WeightTarget"],"ArcHandles":["Axes"],"Atmosphere":["Color","Decay","Density","Glare","Haze","Offset"],"Attachment":["Axis","CFrame","Orientation","Position","SecondaryAxis","Visible","WorldAxis","WorldCFrame","WorldOrientation","WorldPosition","WorldSecondaryAxis"],"BackpackItem":["TextureId"],"BallSocketConstraint":["LimitsEnabled","MaxFrictionTorque","Radius","Restitution","TwistLimitsEnabled","TwistLowerAngle","TwistUpperAngle","UpperAngle"],"BasePart":["Anchored","AssemblyAngularVelocity","AssemblyCenterOfMass","AssemblyLinearVelocity","AssemblyMass","AssemblyRootPart","BackSurface","BottomSurface","BrickColor","CFrame","CanCollide","CanQuery","CanTouch","CastShadow","CenterOfMass","CollisionGroupId","Color","CustomPhysicalProperties","FrontSurface","LeftSurface","Locked","Mass","Massless","Material","MaterialVariant","Orientation","PivotOffset","Position","Reflectance","ResizeIncrement","ResizeableFaces","RightSurface","RootPriority","Rotation","Size","TopSurface","Transparency"],"BaseScript":["Disabled","LinkedSource"],"BaseWrap":["CageMeshId","CageOrigin","CageOriginWorld","HSRAssetId","ImportOrigin","ImportOriginWorld"],"Beam":["Attachment0","Attachment1","Brightness","Color","CurveSize0","CurveSize1","Enabled","FaceCamera","LightEmission","LightInfluence","Segments","Texture","TextureLength","TextureMode","TextureSpeed","Transparency","Width0","Width1","ZOffset"],"BillboardGui":["Active","Adornee","AlwaysOnTop","Brightness","ClipsDescendants","CurrentDistance","DistanceLowerLimit","DistanceStep","DistanceUpperLimit","ExtentsOffset","ExtentsOffsetWorldSpace","LightInfluence","MaxDistance","PlayerToHideFrom","Size","SizeOffset","StudsOffset","StudsOffsetWorldSpace"],"BloomEffect":["Intensity","Size","Threshold"],"BlurEffect":["Size"],"BodyAngularVelocity":["AngularVelocity","MaxTorque","P"],"BodyColors":["HeadColor","HeadColor3","LeftArmColor","LeftArmColor3","LeftLegColor","LeftLegColor3","RightArmColor","RightArmColor3","RightLegColor","RightLegColor3","TorsoColor","TorsoColor3"],"BodyForce":["Force"],"BodyGyro":["CFrame","D","MaxTorque","P"],"BodyPosition":["D","MaxForce","P","Position"],"BodyThrust":["Force","Location"],"BodyVelocity":["MaxForce","P","Velocity"],"Bone":["Transform","TransformedCFrame","TransformedWorldCFrame"],"BoolValue":["Value"],"BoxHandleAdornment":["Size"],"BrickColorValue":["Value"],"CFrameValue":["Value"],"Camera":["CFrame","CameraSubject","CameraType","DiagonalFieldOfView","FieldOfView","FieldOfViewMode","Focus","HeadLocked","HeadScale","MaxAxisFieldOfView","NearPlaneZ","ViewportSize"],"CanvasGroup":["GroupColor","GroupTransparency"],"ChannelSelectorSoundEffect":["Channel"],"CharacterMesh":["BaseTextureId","BodyPart","MeshId","OverlayTextureId"],"Chat":["BubbleChatEnabled","LoadDefaultChat"],"ChatInputBarConfiguration":["Enabled","TargetTextChannel"],"ChatWindowConfiguration":["Enabled"],"ChorusSoundEffect":["Depth","Mix","Rate"],"ClickDetector":["CursorIcon","MaxActivationDistance"],"Clothing":["Color3"],"Clouds":["Color","Cover","Density","Enabled"],"Color3Value":["Value"],"ColorCorrectionEffect":["Brightness","Contrast","Saturation","TintColor"],"CommandInstance":["AllowGUIAccessPoints","Checked","DefaultShortcut","DisplayName","Enabled","Icon","Name","Permission","StatusTip"],"CompressorSoundEffect":["Attack","GainMakeup","Ratio","Release","SideChain","Threshold"],"ConeHandleAdornment":["Height","Radius"],"Constraint":["Active","Attachment0","Attachment1","Color","Enabled","Visible"],"ContentProvider":["BaseUrl","RequestQueueSize"],"CoreGui":["SelectionImageObject","Version"],"CustomEventReceiver":["Source"],"CylinderHandleAdornment":["Angle","Height","InnerRadius","Radius"],"CylindricalConstraint":["AngularActuatorType","AngularLimitsEnabled","AngularResponsiveness","AngularRestitution","AngularSpeed","AngularVelocity","CurrentAngle","InclinationAngle","LowerAngle","MotorMaxAngularAcceleration","MotorMaxTorque","RotationAxisVisible","ServoMaxTorque","TargetAngle","UpperAngle","WorldRotationAxis"],"DataModel":["CreatorId","CreatorType","GameId","Genre","JobId","PlaceId","PlaceVersion","PrivateServerId","PrivateServerOwnerId","Workspace"],"DataModelMesh":["Offset","Scale","VertexColor"],"DataStoreInfo":["CreatedTime","DataStoreName","UpdatedTime"],"DataStoreKey":["KeyName"],"DataStoreKeyInfo":["CreatedTime","UpdatedTime","Version"],"DataStoreObjectVersionInfo":["CreatedTime","IsDeleted","Version"],"DataStoreOptions":["AllScopes"],"DataStoreService":["AutomaticRetry"],"DebugSettings":["DataModel","InstanceCount","IsScriptStackTracingEnabled","JobCount","PlayerCount","ReportSoundWarnings","RobloxVersion","TickCountPreciseOverride"],"DebuggerBreakpoint":["Condition","ContinueExecution","IsEnabled","Line","LogExpression","isContextDependentBreakpoint"],"DebuggerManager":["DebuggingEnabled"],"DebuggerWatch":["Expression"],"Decal":["Color3","Texture","Transparency","ZIndex"],"DepthOfFieldEffect":["FarIntensity","FocusDistance","InFocusRadius","NearIntensity"],"Dialog":["BehaviorType","ConversationDistance","GoodbyeChoiceActive","GoodbyeDialog","InUse","InitialPrompt","Purpose","Tone","TriggerDistance","TriggerOffset"],"DialogChoice":["GoodbyeChoiceActive","GoodbyeDialog","ResponseDialog","UserDialog"],"DistortionSoundEffect":["Level"],"DockWidgetPluginGui":["HostWidgetWasRestored"],"DoubleConstrainedValue":["MaxValue","MinValue","Value"],"DraggerService":["AlignDraggedObjects","AngleSnapEnabled","AngleSnapIncrement","AnimateHover","CollisionsEnabled","DraggerCoordinateSpace","DraggerMovementMode","GeometrySnapColor","HoverAnimateFrequency","HoverThickness","JointsEnabled","LinearSnapEnabled","LinearSnapIncrement","PivotSnapToGeometry","ShowHover","ShowPivotIndicator"],"DynamicRotate":["BaseAngle"],"EchoSoundEffect":["Delay","DryLevel","Feedback","WetLevel"],"EqualizerSoundEffect":["HighGain","LowGain","MidGain"],"EulerRotationCurve":["RotationOrder"],"Explosion":["BlastPressure","BlastRadius","DestroyJointRadiusPercent","ExplosionType","Position","TimeScale","Visible"],"FaceControls":["ChinRaiser","ChinRaiserUpperLip","Corrugator","EyesLookDown","EyesLookLeft","EyesLookRight","EyesLookUp","FlatPucker","Funneler","JawDrop","JawLeft","JawRight","LeftBrowLowerer","LeftCheekPuff","LeftCheekRaiser","LeftDimpler","LeftEyeClosed","LeftEyeUpperLidRaiser","LeftInnerBrowRaiser","LeftLipCornerDown","LeftLipCornerPuller","LeftLipStretcher","LeftLowerLipDepressor","LeftNoseWrinkler","LeftOuterBrowRaiser","LeftUpperLipRaiser","LipPresser","LipsTogether","LowerLipSuck","MouthLeft","MouthRight","Pucker","RightBrowLowerer","RightCheekPuff","RightCheekRaiser","RightDimpler","RightEyeClosed","RightEyeUpperLidRaiser","RightInnerBrowRaiser","RightLipCornerDown","RightLipCornerPuller","RightLipStretcher","RightLowerLipDepressor","RightNoseWrinkler","RightOuterBrowRaiser","RightUpperLipRaiser","TongueDown","TongueOut","TongueUp","UpperLipSuck"],"FaceInstance":["Face"],"Feature":["FaceId","InOut","LeftRight","TopBottom"],"FileMesh":["MeshId","TextureId"],"Fire":["Color","Enabled","Heat","SecondaryColor","Size","TimeScale"],"Flag":["TeamColor"],"FlagStand":["TeamColor"],"FlangeSoundEffect":["Depth","Mix","Rate"],"FloatCurve":["Length"],"FloorWire":["CycleOffset","From","StudsBetweenTextures","Texture","TextureSize","To","Velocity","WireRadius"],"ForceField":["Visible"],"Frame":["Style"],"FunctionalTest":["Description"],"GameSettings":["AdditionalCoreIncludeDirs","OverrideStarterScript","VideoCaptureEnabled","VideoRecording"],"GamepadService":["GamepadCursorEnabled"],"Glue":["F0","F1","F2","F3"],"GuiBase2d":["AbsolutePosition","AbsoluteRotation","AbsoluteSize","AutoLocalize","RootLocalizationTable"],"GuiBase3d":["Color3","Transparency","Visible"],"GuiButton":["AutoButtonColor","Modal","Selected","Style"],"GuiObject":["Active","AnchorPoint","AutomaticSize","BackgroundColor3","BackgroundTransparency","BorderColor3","BorderMode","BorderSizePixel","ClipsDescendants","LayoutOrder","NextSelectionDown","NextSelectionLeft","NextSelectionRight","NextSelectionUp","Position","Rotation","Selectable","SelectionImageObject","Size","SizeConstraint","Visible","ZIndex"],"GuiService":["AutoSelectGuiEnabled","CoreGuiNavigationEnabled","GuiNavigationEnabled","MenuIsOpen","SelectedObject","TouchControlsEnabled"],"HandleAdornment":["AdornCullingMode","AlwaysOnTop","CFrame","SizeRelativeOffset","ZIndex"],"Handles":["Faces","Style"],"Highlight":["Adornee","DepthMode","Enabled","FillColor","FillTransparency","OutlineColor","OutlineTransparency"],"HingeConstraint":["ActuatorType","AngularResponsiveness","AngularSpeed","AngularVelocity","CurrentAngle","LimitsEnabled","LowerAngle","MotorMaxAcceleration","MotorMaxTorque","Radius","Restitution","ServoMaxTorque","TargetAngle","UpperAngle"],"HopperBin":["Active","BinType"],"HttpService":["HttpEnabled"],"Humanoid":["AutoJumpEnabled","AutoRotate","AutomaticScalingEnabled","BreakJointsOnDeath","CameraOffset","DisplayDistanceType","DisplayName","FloorMaterial","Health","HealthDisplayDistance","HealthDisplayType","HipHeight","Jump","JumpHeight","JumpPower","MaxHealth","MaxSlopeAngle","MoveDirection","NameDisplayDistance","NameOcclusion","PlatformStand","RequiresNeck","RigType","RootPart","SeatPart","Sit","TargetPoint","UseJumpPower","WalkSpeed","WalkToPart","WalkToPoint"],"HumanoidDescription":["AccessoryBlob","BackAccessory","BodyTypeScale","ClimbAnimation","DepthScale","Face","FaceAccessory","FallAnimation","FrontAccessory","GraphicTShirt","HairAccessory","HatAccessory","Head","HeadColor","HeadScale","HeightScale","IdleAnimation","JumpAnimation","LeftArm","LeftArmColor","LeftLeg","LeftLegColor","NeckAccessory","Pants","ProportionScale","RightArm","RightArmColor","RightLeg","RightLegColor","RunAnimation","Shirt","ShouldersAccessory","SwimAnimation","Torso","TorsoColor","WaistAccessory","WalkAnimation","WidthScale"],"ImageButton":["HoverImage","Image","ImageColor3","ImageRectOffset","ImageRectSize","ImageTransparency","IsLoaded","PressedImage","ResampleMode","ScaleType","SliceCenter","SliceScale","TileSize"],"ImageHandleAdornment":["Image","Size"],"ImageLabel":["Image","ImageColor3","ImageRectOffset","ImageRectSize","ImageTransparency","IsLoaded","ResampleMode","ScaleType","SliceCenter","SliceScale","TileSize"],"ImporterBaseSettings":["Id","ImportName","ShouldImport"],"ImporterGroupSettings":["Anchored","ImportAsModelAsset","InsertInWorkspace"],"ImporterMaterialSettings":["DiffuseFilePath","IsPbr","MetalnessFilePath","NormalFilePath","RoughnessFilePath"],"ImporterMeshSettings":["Anchored","Dimensions","DoubleSided","IgnoreVertexColors","PolygonCount"],"ImporterRootSettings":["Anchored","FileDimensions","ImportAsModelAsset","InsertInWorkspace","InvertNegativeFaces","MergeMeshes","PolygonCount","RigType","ScaleUnit","WorldForward","WorldUp"],"ImporterTextureSettings":["FilePath"],"InputObject":["Delta","KeyCode","Position","UserInputState","UserInputType"],"InsertService":["AllowClientInsertModels"],"Instance":["Archivable","ClassName","Name","Parent"],"InstanceAdornment":["Adornee"],"IntConstrainedValue":["MaxValue","MinValue","Value"],"IntValue":["Value"],"JointInstance":["Active","C0","C1","Enabled","Part0","Part1"],"Keyframe":["Time"],"KeyframeMarker":["Value"],"LayerCollector":["Enabled","ResetOnSpawn","ZIndexBehavior"],"Light":["Brightness","Color","Enabled","Shadows"],"Lighting":["Ambient","Brightness","ClockTime","ColorShift_Bottom","ColorShift_Top","EnvironmentDiffuseScale","EnvironmentSpecularScale","ExposureCompensation","FogColor","FogEnd","FogStart","GeographicLatitude","GlobalShadows","OutdoorAmbient","ShadowSoftness","Technology","TimeOfDay"],"LineForce":["ApplyAtCenterOfMass","InverseSquareLaw","Magnitude","MaxForce","ReactionForceEnabled"],"LineHandleAdornment":["Length","Thickness"],"LinearVelocity":["LineDirection","LineVelocity","MaxForce","PlaneVelocity","PrimaryTangentAxis","RelativeTo","SecondaryTangentAxis","VectorVelocity","VelocityConstraintMode"],"LocalizationService":["RobloxLocaleId","SystemLocaleId"],"LocalizationTable":["SourceLocaleId"],"LuaSourceContainer":["CurrentEditor"],"MarkerCurve":["Length"],"MaterialService":["AsphaltName","BasaltName","Brick","BrickName","Cobblestone","CobblestoneName","Concrete","ConcreteName","CorrodedMetal","CorrodedMetalName","CrackedLavaName","DiamondPlate","DiamondPlateName","Fabric","FabricName","Foil","FoilName","GlacierName","Granite","GraniteName","Grass","GrassName","GroundName","Ice","IceName","LeafyGrassName","LimestoneName","Marble","MarbleName","Metal","MetalName","MudName","PavementName","Pebble","PebbleName","Plastic","PlasticName","RockName","SaltName","Sand","SandName","SandstoneName","Slate","SlateName","SmoothPlastic","SmoothPlasticName","SnowName","TerrainAsphalt","TerrainBasalt","TerrainBrick","TerrainCobblestone","TerrainConcrete","TerrainCrackedLava","TerrainGlacier","TerrainGrass","TerrainGround","TerrainIce","TerrainLeafyGrass","TerrainLimestone","TerrainMud","TerrainPavement","TerrainRock","TerrainSalt","TerrainSand","TerrainSandstone","TerrainSlate","TerrainSnow","TerrainWoodPlanks","Use2022Materials","Wood","WoodName","WoodPlanks","WoodPlanksName"],"MaterialVariant":["BaseMaterial","ColorMap","MaterialPattern","MetalnessMap","NormalMap","RoughnessMap","StudsPerTile"],"MeshPart":["DoubleSided","MeshId","MeshSize","RenderFidelity","TextureID"],"Message":["Text"],"Model":["LevelOfDetail","PrimaryPart","WorldPivot"],"ModuleScript":["LinkedSource","Source"],"Motor":["CurrentAngle","DesiredAngle","MaxVelocity"],"Motor6D":["ChildName","ParentName"],"Mouse":["Hit","Icon","Origin","Target","TargetFilter","TargetSurface","UnitRay","ViewSizeX","ViewSizeY","X","Y"],"NetworkSettings":["HttpProxyEnabled","HttpProxyURL","IncomingReplicationLag","PrintJoinSizeBreakdown","PrintPhysicsErrors","PrintStreamInstanceQuota","RandomizeJoinInstanceOrder","RenderStreamedRegions","ShowActiveAnimationAsset"],"NoCollisionConstraint":["Enabled","Part0","Part1"],"NotificationService":["IsLuaGameDetailsEnabled","SelectedTheme"],"NumberPose":["Value"],"NumberValue":["Value"],"ObjectValue":["Value"],"PVAdornment":["Adornee"],"PackageLink":["AutoUpdate","Creator","PackageAssetName","PackageId","PermissionLevel","Status","VersionNumber"],"Pages":["IsFinished"],"Pants":["PantsTemplate"],"Part":["Shape"],"PartAdornment":["Adornee"],"PartOperation":["RenderFidelity","SmoothingAngle","TriangleCount","UsePartColor"],"ParticleEmitter":["Acceleration","Brightness","Color","Drag","EmissionDirection","Enabled","FlipbookFramerate","FlipbookIncompatible","FlipbookLayout","FlipbookMode","FlipbookStartRandom","Lifetime","LightEmission","LightInfluence","LockedToPart","Orientation","Rate","RotSpeed","Rotation","Shape","ShapeInOut","ShapePartial","ShapeStyle","Size","Speed","SpreadAngle","Squash","Texture","TimeScale","Transparency","VelocityInheritance","ZOffset"],"Path":["Status"],"PathfindingLink":["Attachment0","Attachment1","IsBidirectional","Label"],"PathfindingModifier":["Label","PassThrough"],"PhysicsSettings":["AllowSleep","AreAnchorsShown","AreAssembliesShown","AreAwakePartsHighlighted","AreBodyTypesShown","AreContactIslandsShown","AreContactPointsShown","AreJointCoordinatesShown","AreMechanismsShown","AreModelCoordsShown","AreOwnersShown","ArePartCoordsShown","AreRegionsShown","AreTerrainReplicationRegionsShown","AreTimestepsShown","AreUnalignedPartsShown","AreWorldCoordsShown","DisableCSGv2","IsInterpolationThrottleShown","IsReceiveAgeShown","IsTreeShown","PhysicsEnvironmentalThrottle","ShowDecompositionGeometry","ThrottleAdjustTime","UseCSGv2"],"PitchShiftSoundEffect":["Octave"],"Player":["AccountAge","AutoJumpEnabled","CameraMaxZoomDistance","CameraMinZoomDistance","CameraMode","CanLoadCharacterAppearance","Character","CharacterAppearanceId","DevCameraOcclusionMode","DevComputerCameraMode","DevComputerMovementMode","DevEnableMouseLock","DevTouchCameraMode","DevTouchMovementMode","DisplayName","FollowUserId","GameplayPaused","HealthDisplayDistance","MembershipType","NameDisplayDistance","Neutral","ReplicationFocus","RespawnLocation","Team","TeamColor","UserId"],"PlayerGui":["CurrentScreenOrientation","ScreenOrientation","SelectionImageObject"],"Players":["BubbleChat","CharacterAutoLoads","ClassicChat","LocalPlayer","MaxPlayers","PreferredPlayers","RespawnTime"],"Plugin":["CollisionEnabled","GridSize"],"PluginAction":["ActionId","AllowBinding","StatusTip","Text"],"PluginDragEvent":["Data","MimeType","Position","Sender"],"PluginGui":["Title"],"PluginMenu":["Icon","Title"],"PluginToolbarButton":["ClickableWhenViewportHidden","Enabled","Icon"],"PointLight":["Range"],"Pose":["CFrame"],"PoseBase":["EasingDirection","EasingStyle","Weight"],"PostEffect":["Enabled"],"ProximityPrompt":["ActionText","AutoLocalize","ClickablePrompt","Enabled","Exclusivity","GamepadKeyCode","HoldDuration","KeyboardKeyCode","MaxActivationDistance","ObjectText","RequiresLineOfSight","RootLocalizationTable","Style","UIOffset"],"ProximityPromptService":["Enabled","MaxPromptsVisible"],"RayValue":["Value"],"ReflectionMetadataClass":["ExplorerImageIndex","ExplorerOrder","Insertable","PreferredParent"],"ReflectionMetadataItem":["Browsable","ClassCategory","ClientOnly","Constraint","Deprecated","EditingDisabled","EditorType","FFlag","IsBackend","PropertyOrder","ScriptContext","ServerOnly","UIMaximum","UIMinimum","UINumTicks"],"RenderSettings":["AutoFRMLevel","EagerBulkExecution","EditQualityLevel","ExportMergeByMaterial","FrameRateManager","GraphicsMode","MeshCacheSize","MeshPartDetailLevel","QualityLevel","ReloadAssets","RenderCSGTrianglesDebug","ShowBoundingBoxes"],"RenderingTest":["CFrame","ComparisonDiffThreshold","ComparisonMethod","ComparisonPsnrThreshold","Description","FieldOfView","Orientation","Position","QualityLevel","ShouldSkip","Ticket"],"ReverbSoundEffect":["DecayTime","Density","Diffusion","DryLevel","WetLevel"],"RigidConstraint":["Broken","DestructionEnabled","DestructionForce","DestructionTorque"],"RocketPropulsion":["CartoonFactor","MaxSpeed","MaxThrust","MaxTorque","Target","TargetOffset","TargetRadius","ThrustD","ThrustP","TurnD","TurnP"],"RodConstraint":["CurrentDistance","Length","LimitAngle0","LimitAngle1","LimitsEnabled","Thickness"],"RopeConstraint":["CurrentDistance","Length","Restitution","Thickness","WinchEnabled","WinchForce","WinchResponsiveness","WinchSpeed","WinchTarget"],"RotationCurve":["Length"],"RunService":["ClientGitHash"],"ScreenGui":["DisplayOrder","IgnoreGuiInset"],"Script":["Source"],"ScriptDebugger":["CurrentLine","IsDebugging","IsPaused","Script"],"ScrollingFrame":["AbsoluteCanvasSize","AbsoluteWindowSize","AutomaticCanvasSize","BottomImage","CanvasPosition","CanvasSize","ElasticBehavior","HorizontalScrollBarInset","MidImage","ScrollBarImageColor3","ScrollBarImageTransparency","ScrollBarThickness","ScrollingDirection","ScrollingEnabled","TopImage","VerticalScrollBarInset","VerticalScrollBarPosition"],"Seat":["Disabled","Occupant"],"Selection":["SelectionThickness"],"SelectionBox":["LineThickness","SurfaceColor3","SurfaceTransparency"],"SelectionLasso":["Humanoid"],"SelectionPartLasso":["Part"],"SelectionPointLasso":["Point"],"SelectionSphere":["SurfaceColor3","SurfaceTransparency"],"ServerScriptService":["LoadStringEnabled"],"Shirt":["ShirtTemplate"],"ShirtGraphic":["Color3","Graphic"],"SkateboardController":["Steer","Throttle"],"SkateboardPlatform":["Controller","ControllingHumanoid","Steer","StickyWheels","Throttle"],"Skin":["SkinColor"],"Sky":["CelestialBodiesShown","MoonAngularSize","MoonTextureId","SkyboxBk","SkyboxDn","SkyboxFt","SkyboxLf","SkyboxRt","SkyboxUp","StarCount","SunAngularSize","SunTextureId"],"SlidingBallConstraint":["ActuatorType","CurrentPosition","LimitsEnabled","LinearResponsiveness","LowerLimit","MotorMaxAcceleration","MotorMaxForce","Restitution","ServoMaxForce","Size","Speed","TargetPosition","UpperLimit","Velocity"],"Smoke":["Color","Enabled","Opacity","RiseVelocity","Size","TimeScale"],"Sound":["ChannelCount","IsLoaded","IsPaused","IsPlaying","Looped","PlayOnRemove","PlaybackLoudness","PlaybackSpeed","Playing","RollOffMaxDistance","RollOffMinDistance","RollOffMode","SoundGroup","SoundId","TimeLength","TimePosition","Volume"],"SoundEffect":["Enabled","Priority"],"SoundGroup":["Volume"],"SoundService":["AmbientReverb","DistanceFactor","DopplerScale","RespectFilteringEnabled","RolloffScale"],"Sparkles":["Enabled","SparkleColor","TimeScale"],"SpawnLocation":["AllowTeamChangeOnTouch","Duration","Enabled","Neutral","TeamColor"],"Speaker":["ChannelCount","PlaybackLoudness","RollOffMaxDistance","RollOffMinDistance","RollOffMode","SoundGroup","Source","Volume"],"SpecialMesh":["MeshType"],"SphereHandleAdornment":["Radius"],"SpotLight":["Angle","Face","Range"],"SpringConstraint":["Coils","CurrentLength","Damping","FreeLength","LimitsEnabled","MaxForce","MaxLength","MinLength","Radius","Stiffness","Thickness"],"StarterGui":["ScreenOrientation","ShowDevelopmentGui","VirtualCursorMode"],"StarterPlayer":["AutoJumpEnabled","CameraMaxZoomDistance","CameraMinZoomDistance","CameraMode","CharacterJumpHeight","CharacterJumpPower","CharacterMaxSlopeAngle","CharacterUseJumpPower","CharacterWalkSpeed","DevCameraOcclusionMode","DevComputerCameraMovementMode","DevComputerMovementMode","DevTouchCameraMovementMode","DevTouchMovementMode","EnableMouseLockOption","HealthDisplayDistance","LoadCharacterAppearance","NameDisplayDistance","UserEmotesEnabled"],"Stats":["ContactsCount","DataReceiveKbps","DataSendKbps","HeartbeatTimeMs","InstanceCount","MovingPrimitivesCount","PhysicsReceiveKbps","PhysicsSendKbps","PhysicsStepTimeMs","PrimitivesCount"],"StringValue":["Value"],"Studio":["CommandBarLocalState","DefaultScriptFileDir","DeprecatedObjectsShown","DisplayLanguage","Font","LocalAssetsFolder","LuaDebuggerEnabled","OverrideCoreScripts","OverrideCoreScriptsDir","PermissionLevelShown","PluginDebuggingEnabled","PluginsDir","Rulers","RuntimeUndoBehavior","ScriptTimeoutLength","ShowCorePackagesInExplorer","Theme"],"StudioService":["ActiveScript","DraggerSolveConstraints","DrawConstraintsOnTop","GridSize","RotateIncrement","ShowConstraintDetails","StudioLocaleId","UseLocalSpace"],"SunRaysEffect":["Intensity","Spread"],"SurfaceAppearance":["AlphaMode","ColorMap","MetalnessMap","NormalMap","RoughnessMap"],"SurfaceGui":["Active","Adornee","AlwaysOnTop","Brightness","CanvasSize","ClipsDescendants","Face","LightInfluence","PixelsPerStud","SizingMode","ToolPunchThroughDistance","ZOffset"],"SurfaceLight":["Angle","Face","Range"],"SurfaceSelection":["TargetSurface"],"TaskScheduler":["SchedulerDutyCycle","SchedulerRate","ThreadPoolConfig","ThreadPoolSize"],"Team":["AutoAssignable","TeamColor"],"TeleportAsyncResult":["PrivateServerId","ReservedServerAccessCode"],"TeleportOptions":["ReservedServerAccessCode","ServerInstanceId","ShouldReserveServer"],"Terrain":["Decoration","MaterialColors","MaxExtents","WaterColor","WaterReflectance","WaterTransparency","WaterWaveSize","WaterWaveSpeed"],"TerrainDetail":["ColorMap","Face","MaterialPattern","MetalnessMap","NormalMap","RoughnessMap","StudsPerTile"],"TerrainRegion":["SizeInCells"],"TestService":["AutoRuns","Description","ErrorCount","ExecuteWithStudioRun","Is30FpsThrottleEnabled","IsPhysicsEnvironmentalThrottled","IsSleepAllowed","NumberOfPlayers","SimulateSecondsLag","TestCount","Timeout","WarnCount"],"TextBox":["ClearTextOnFocus","ContentText","CursorPosition","Font","FontFace","LineHeight","MaxVisibleGraphemes","MultiLine","PlaceholderColor3","PlaceholderText","RichText","SelectionStart","ShowNativeInput","Text","TextBounds","TextColor3","TextEditable","TextFits","TextScaled","TextSize","TextStrokeColor3","TextStrokeTransparency","TextTransparency","TextTruncate","TextWrapped","TextXAlignment","TextYAlignment"],"TextButton":["ContentText","Font","FontFace","LineHeight","MaxVisibleGraphemes","RichText","Text","TextBounds","TextColor3","TextFits","TextScaled","TextSize","TextStrokeColor3","TextStrokeTransparency","TextTransparency","TextTruncate","TextWrapped","TextXAlignment","TextYAlignment"],"TextChatCommand":["Enabled","PrimaryAlias","SecondaryAlias"],"TextChatMessage":["MessageId","Metadata","PrefixText","Status","Text","TextChannel","TextSource","Timestamp"],"TextChatMessageProperties":["PrefixText","Text"],"TextChatService":["ChatVersion","CreateDefaultCommands","CreateDefaultTextChannels"],"TextLabel":["ContentText","Font","FontFace","LineHeight","MaxVisibleGraphemes","RichText","Text","TextBounds","TextColor3","TextFits","TextScaled","TextSize","TextStrokeColor3","TextStrokeTransparency","TextTransparency","TextTruncate","TextWrapped","TextXAlignment","TextYAlignment"],"TextSource":["CanSend","UserId"],"Texture":["OffsetStudsU","OffsetStudsV","StudsPerTileU","StudsPerTileV"],"Tool":["CanBeDropped","Enabled","Grip","GripForward","GripPos","GripRight","GripUp","ManualActivationOnly","RequiresHandle","ToolTip"],"Torque":["RelativeTo","Torque"],"TorsionSpringConstraint":["Coils","CurrentAngle","Damping","LimitsEnabled","MaxAngle","MaxTorque","Radius","Restitution","Stiffness"],"Trail":["Attachment0","Attachment1","Brightness","Color","Enabled","FaceCamera","Lifetime","LightEmission","LightInfluence","MaxLength","MinLength","Texture","TextureLength","TextureMode","Transparency","WidthScale"],"Translator":["LocaleId"],"TremoloSoundEffect":["Depth","Duty","Frequency"],"TriangleMeshPart":["CollisionFidelity"],"TrussPart":["Style"],"Tween":["Instance","TweenInfo"],"TweenBase":["PlaybackState"],"UIAspectRatioConstraint":["AspectRatio","AspectType","DominantAxis"],"UICorner":["CornerRadius"],"UIGradient":["Color","Enabled","Offset","Rotation","Transparency"],"UIGridLayout":["AbsoluteCellCount","AbsoluteCellSize","CellPadding","CellSize","FillDirectionMaxCells","StartCorner"],"UIGridStyleLayout":["AbsoluteContentSize","FillDirection","HorizontalAlignment","SortOrder","VerticalAlignment"],"UIListLayout":["Padding"],"UIPadding":["PaddingBottom","PaddingLeft","PaddingRight","PaddingTop"],"UIPageLayout":["Animated","Circular","CurrentPage","EasingDirection","EasingStyle","GamepadInputEnabled","Padding","ScrollWheelInputEnabled","TouchInputEnabled","TweenTime"],"UIScale":["Scale"],"UISizeConstraint":["MaxSize","MinSize"],"UIStroke":["ApplyStrokeMode","Color","Enabled","LineJoinMode","Thickness","Transparency"],"UITableLayout":["FillEmptySpaceColumns","FillEmptySpaceRows","MajorAxis","Padding"],"UITextSizeConstraint":["MaxTextSize","MinTextSize"],"UniversalConstraint":["LimitsEnabled","MaxAngle","Radius","Restitution"],"UserGameSettings":["AllTutorialsDisabled","CameraMode","ChatVisible","ComputerCameraMovementMode","ComputerMovementMode","ControlMode","Fullscreen","GamepadCameraSensitivity","GraphicsQualityLevel","HasEverUsedVR","MasterVolume","MouseSensitivity","OnboardingsCompleted","RCCProfilerRecordFrameRate","RCCProfilerRecordTimeFrame","RotationType","SavedQualityLevel","StartMaximized","StartScreenPosition","StartScreenSize","TouchCameraMovementMode","TouchMovementMode","UsedCoreGuiIsVisibleToggle","UsedCustomGuiIsVisibleToggle","UsedHideHudShortcut","VREnabled","VRRotationIntensity","VignetteEnabled"],"UserInputService":["AccelerometerEnabled","GamepadEnabled","GyroscopeEnabled","KeyboardEnabled","MouseBehavior","MouseDeltaSensitivity","MouseEnabled","MouseIconEnabled","OnScreenKeyboardPosition","OnScreenKeyboardSize","OnScreenKeyboardVisible","TouchEnabled","VREnabled"],"VRService":["GuiInputUserCFrame","VREnabled"],"Vector3Value":["Value"],"VectorForce":["ApplyAtCenterOfMass","Force","RelativeTo"],"VehicleSeat":["AreHingesDetected","Disabled","HeadsUpDisplay","MaxSpeed","Occupant","Steer","SteerFloat","Throttle","ThrottleFloat","Torque","TurnSpeed"],"VelocityMotor":["CurrentAngle","DesiredAngle","Hole","MaxVelocity"],"VideoFrame":["IsLoaded","Looped","Playing","Resolution","TimeLength","TimePosition","Video","Volume"],"ViewportFrame":["Ambient","CurrentCamera","ImageColor3","ImageTransparency","LightColor","LightDirection"],"VoiceChatService":["EnableDefaultVoice"],"VoiceSource":["UserId"],"WeldConstraint":["Active","Enabled","Part0","Part1"],"Workspace":["AllowThirdPartySales","AnimationWeightedBlendFix","ClientAnimatorThrottling","CurrentCamera","DistributedGameTime","FallenPartsDestroyHeight","GlobalWind","Gravity","HumanoidOnlySetCollisionsOnStateChange","InterpolationThrottling","MeshPartHeadsAndAccessories","PhysicsSteppingMethod","ReplicateInstanceDestroySetting","Retargeting","SignalBehavior","StreamOutBehavior","StreamingEnabled","StreamingMinRadius","StreamingPauseMode","StreamingTargetRadius","Terrain","TouchesUseCollisionGroups"],"WrapLayer":["BindOffset","Color","DebugMode","Enabled","Order","Puffiness","ReferenceMeshId","ReferenceOrigin","ReferenceOriginWorld","ShrinkFactor"],"WrapTarget":["Color","DebugMode","Stiffness"]}')
        local savedProps = {}
        for ClassName, InstanceProperties in props do
            if not o:IsA(ClassName)then continue end
            for _,pname in InstanceProperties do
                savedProps[pname] = o[pname]
            end
        end
        connections_[o] = o.Changed:ConnectParallel(function(prop)
            task.synchronize()
            if o[prop] ~= savedProps[prop] then
                BHN(function()
                    o[prop] = savedProps[prop]
                end)
            end
        end)
    end,
}
local methodNames = {
    'BreakJoints',
    'Destroy',
    'Remove',
    'Void',
    'Tween Void',
    'Transparency Alteration',
    'Size Alteration',
    'Fake Degradation',
    'Force Parent',
    'Instance Override',
    'Property Freeze'
}

local theme
local method = 2;

function TIMESHIFT(f,...)
    local args = {...}
    local container = Instance.new("Folder")
    local waitfor = Instance.new("Folder")

    coroutine.wrap(function()
        container:WaitForChild(waitfor.Name)
        f(unpack(args))
    end)()
    
    waitfor.Parent = container
end;
local function SN(f,...)
    local args = {...}
	local SNThread; SNThread = coroutine.create(function()
		for i = 1, 80 do 
			coroutine.yield(task.defer(coroutine.resume, SNThread))
        end;pcall(f,unpack(args))
	end)

	coroutine.yield(coroutine.resume(SNThread))
end;
local function STALL(n, f, ...) n = n or 1
    local args = {...}
	local StallThread; StallThread = coroutine.create(function()
		for i = 1, n do 
			coroutine.resume(coroutine.create(function()
				task.desynchronize(); task.synchronize(); coroutine.resume(StallThread)
			end)); coroutine.yield(StallThread)
		end;pcall(f,unpack(args))
	end)

	coroutine.yield(coroutine.resume(StallThread))
end;

local chatfuncs,chatfuncsorb = {},{}
local orbchatfuncdeb = false

function chatfunc(msg)
    msg = msg:gsub("&gt;", ">"):gsub("&lt;", "<"):gsub("%-&gt;", "→")
	wrap(function()
		local amountsofchats = #chatfuncs
		if amountsofchats >= 5 then
			chatfuncs[1]:Destroy()
			table.remove(chatfuncs, 1)
		end
		for i, v in next, chatfuncs do
			v.StudsOffset += Vector3.new(0,1.5,0)
		end
		local bil = Instance.new('BillboardGui')
		bil.Name = guid()
        bil:SetAttribute(ignore,ignore)
		bil.Parent = parts.chat
		pcall(function()
			bil.Adornee = parts.chat
		end)
		bil.Size = UDim2.new(1000,0,1,0)
		bil.StudsOffset = Vector3.new(-0.7,2.5,0)
        bil.Brightness = 5
		table.insert(chatfuncs, bil)
		local numoftext = 0
		local letters = #msg:sub(1)
		local children = 0
		local texts = {}
		wrap(function()
			local i = 1
            while i <= #msg do
                children += .05
                local byte = msg:byte(i)
                local charlen = (byte >= 240 and 4) or (byte >= 224 and 3) or (byte >= 192 and 2) or 1
                local char = msg:sub(i, i + charlen - 1)
                local txt = Instance.new("TextLabel")
                txt:SetAttribute(ignore,ignore)
				txt.Size=UDim2.new(0.001,0,1,0)
				txt.TextScaled=true
				txt.TextWrapped=true
				txt.Font=Enum.Font.Code
				txt.BackgroundTransparency=1
				txt.TextStrokeTransparency=0
				txt.TextColor3 = properties.torso.Color
				txt.TextStrokeColor3 = Color3.new(0,0,0)
				txt.Position = UDim2.new(0.5-(-i*(0.001/2)),0,0.5,0)
				txt.Text = char
				txt.ZIndex = 2
				txt.Parent=bil
				bil.StudsOffset-=Vector3.new(0.25,0,0)
				letters-=1
				table.insert(texts, txt)
				numoftext+=1
                i = i + charlen
				task.delay(5 + children, function()
                    local tw = game:GetService('TweenService'):Create(txt, TweenInfo.new(1.2, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out), {
                        TextTransparency = 1,
                        TextStrokeTransparency = 1,
                        TextColor3 = Color3.new(0,0,0),
                        TextStrokeColor3 = Color3.new(0,0,0),
                        Rotation = math.random(-10, 10)
                    })

                    tw:Play()
                    tw.Completed:wait()
                    txt:Destroy()
                    children -= 0.1
                end)                                                 
                pcall(function()
					local s = Instance.new("Sound")
					s.Volume = 1
					s.SoundId = "rbxassetid://"..16480552135
					s.Pitch = math.random(80,120)/100
					s.PlayOnRemove = true
					s:SetAttribute(ignore, ignore)
                    s.Parent = parts.chat
					s:Destroy()
				end)
				game:GetService("RunService").Heartbeat:Wait()
				game:GetService("RunService").Heartbeat:Wait()
			end
		end)
		game:GetService("Debris"):AddItem(bil, 20)
        wrap(function()
			repeat
				if(not bil)or(not bil:IsDescendantOf(parts.chat))then
					break
				end
				pcall(function()
					game:GetService("RunService").Heartbeat:Wait()
					for i,v in next, texts do
						if(v:IsDescendantOf(bil))then
							if(i ~= #texts)then
                                local h,s,_v = v.TextColor3:ToHSV()
								game:GetService('TweenService'):Create(v,TweenInfo.new(.1),{
									Position = UDim2.new(0.5-(-i*(0.001/2)), 0+math.random(-100,100)/50, 0.5, 0+math.random(-100,100)/50),
                                    TextColor3 = Color3.fromHSV(h, s, math.clamp(_v + math.sin(tick() * 5 + i) * 0.5, 0.4, 0.9))
								}):Play()
							else
                                local h,s,_v = v.TextColor3:ToHSV()
								local tw = game:GetService('TweenService'):Create(v,TweenInfo.new(.1),{
                                    Position = UDim2.new(0.5-(-i*(0.001/2)), 0+math.random(-100,100)/50, 0.5, 0+math.random(-100,100)/50),
                                    TextColor3 = Color3.fromHSV(h, s, math.clamp(_v + math.sin(tick() * 5 + i) * 0.5, 0.4, 0.9))
								})
								tw:Play()
								tw.Completed:Wait()
							end
						end
					end
				end)
			until not bil:IsDescendantOf(parts.chat)
		end)
		wrap(function()
			repeat
				if(not bil)or(not bil:IsDescendantOf(parts.chat))then
					break
				end
				pcall(function()
					game:GetService("RunService").Heartbeat:Wait()
					if #bil:GetChildren() <= 0 then
						bil:Destroy()
						return
					end
					bil.Adornee = parts.chat
					bil.Parent = parts.chat
				end)
			until not bil:IsDescendantOf(parts.chat)
		end)
	end)
end;
function chatfuncorb(msg, deb)
    if deb == true or deb == nil then
        if orbchatfuncdeb then return end
        orbchatfuncdeb = true
    end
	wrap(function()
		local amountsofchats = #chatfuncsorb
		if amountsofchats >= 3 then
			chatfuncsorb[1]:Destroy()
			table.remove(chatfuncsorb, 1)
		end
		for i, v in next, chatfuncsorb do
			v.StudsOffset += Vector3.new(0,.7,0)
		end
		local bil = Instance.new('BillboardGui')
		bil.Name = guid()
        bil:SetAttribute(ignore,ignore)
		bil.Parent = parts.orb
		pcall(function()
			bil.Adornee = parts.orb
		end)
		bil.Size = UDim2.new(1000,0,1,0)
		bil.StudsOffset = Vector3.new(-0.7,1,0)
        bil.Brightness = 5
		table.insert(chatfuncsorb, bil)
		local numoftext = 0
		local letters = #msg:sub(1)
		local children = 0
		local texts = {}
		wrap(function()
			for i = 1,string.len(msg) do
				children += .05
				local txt = Instance.new("TextLabel")
                txt:SetAttribute(ignore,ignore)
				txt.Size=UDim2.new(0.001,0,.5,0)
				txt.TextScaled=true
				txt.TextWrapped=true
				txt.Font=Enum.Font.Code
				txt.BackgroundTransparency=1
				txt.TextStrokeTransparency=0
				txt.TextColor3 = properties.torso.Color
				txt.TextStrokeColor3 = Color3.new(0,0,0)
				txt.Position=UDim2.new(0.5-(-i*(0.001/4)),0,0.25,0)
				txt.Text=msg:sub(i,i)
				txt.ZIndex = 2
				txt.Parent=bil
				bil.StudsOffset-=Vector3.new(0.125,0,0)
				letters-=1
				table.insert(texts, txt)
				numoftext+=1
				task.delay(5 + children, function()
                    local tw = game:GetService('TweenService'):Create(txt, TweenInfo.new(1.2, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out), {
                        TextTransparency = 1,
                        TextStrokeTransparency = 1,
                        TextColor3 = Color3.new(0,0,0),
                        TextStrokeColor3 = Color3.new(0,0,0),
                        Rotation = math.random(-10, 10),
                        Position = UDim2.new(0.5-(-i*(0.001/4)),0,0.25,0),
                    })

                    tw:Play()
                    tw.Completed:wait()
                    txt:Destroy()
                    children -= 0.1
                end)                                                 
                pcall(function()
					local s = Instance.new("Sound")
					s.Volume = 1
					s.SoundId = "rbxassetid://"..16480552135
					s.Pitch = math.random(80,120)/100
					s.PlayOnRemove = true
					s:SetAttribute(ignore, ignore)
                    s.Parent = parts.orb
					s:Destroy()
				end)
				game:GetService("RunService").Heartbeat:Wait()
				game:GetService("RunService").Heartbeat:Wait()
			end
		end)
		game:GetService("Debris"):AddItem(bil, 20)
        wrap(function()
			repeat
				if(not bil)or(not bil:IsDescendantOf(parts.orb))then
					break
				end
				pcall(function()
					game:GetService("RunService").Heartbeat:Wait()
					for i,v in next, texts do
						if(v:IsDescendantOf(bil))then
							if(i ~= #texts)then
                                local h,s,_v = v.TextColor3:ToHSV()
								game:GetService('TweenService'):Create(v,TweenInfo.new(.1),{
									Position = UDim2.new(0.5-(-i*(0.001/4)), 0+math.random(-100,100)/50, 0.5, 0+math.random(-100,100)/50),
                                    TextColor3 = Color3.fromHSV(h, s, math.clamp(_v + math.sin(tick() * 5 + i) * 0.5, 0.4, 0.9))
								}):Play()
							else
                                local h,s,_v = v.TextColor3:ToHSV()
								local tw = game:GetService('TweenService'):Create(v,TweenInfo.new(.1),{
                                    Position = UDim2.new(0.5-(-i*(0.001/4)), 0+math.random(-100,100)/50, 0.5, 0+math.random(-100,100)/50),
                                    TextColor3 = Color3.fromHSV(h, s, math.clamp(_v + math.sin(tick() * 5 + i) * 0.5, 0.4, 0.9))
								})
								tw:Play()
								tw.Completed:Wait()
							end
						end
					end
				end)
			until not bil:IsDescendantOf(parts.orb)
		end)
		wrap(function()
			repeat
				if(not bil)or(not bil:IsDescendantOf(parts.orb))then
					break
				end
				pcall(function()
					game:GetService("RunService").Heartbeat:Wait()
					if #bil:GetChildren() <= 0 then
						bil:Destroy()
						return
					end
					bil.Adornee = parts.orb
					bil.Parent = parts.orb
				end)
			until not bil:IsDescendantOf(parts.orb)
		end)
	end)
    if deb == true or deb == nil then
        task.wait(3)
        orbchatfuncdeb = false
    end
end;
local connections = {}

local function clearConnections(part)
    if connections[part] then
        for _, conn in connections[part] do
            if typeof(conn) == "RBXScriptConnection" then
                conn:Disconnect()
            end
        end
        table.clear(connections[part])
        connections[part] = nil
    end
end

local function setupRefit(name)
    if parts[name] then
        pcall(clearConnections,parts[name])
    end

    connections[parts[name]] = {}
    local part = parts[name]

    part:SetAttribute(ignore, ignore)
    
    local function refit(pr)
        xpcall(function()
            if parts[name]:GetAttribute(destroy) then return end;
            BHN(function()
                for _,conn in connections[part] do 
                    pcall(conn.Disconnect, conn)
                end
                connections[parts[name]] = {}
                parts[name] = meshPart(meshes[name])
                if not parts[name] then return end;
                if name == 'head' and face then 
                    local face = Instance.new('Decal', parts[name])
                    face.Texture = 'rbxassetid://4840997475'
                    face.Color3 = Color3.new()
                elseif name == 'chat' then
                    theme = Instance.new("Sound")
                    theme:SetAttribute(ignore, ignore)
                    theme.Volume = .5
                    theme.SoundId = "rbxassetid://1835826770"
                    theme.Looped = true
                    theme.Parent = parts.chat
                    theme:Play()
                end;
                TIMESHIFT(pcall, game.Destroy, part)
                pcall(setupRefit,name)
            end)
        end, function(err)
            if parts[name]:GetAttribute(destroy) then return end
            BHN(function()
                for _,conn in connections[part] do 
                    pcall(conn.Disconnect, conn)
                end
                connections[parts[name]] = {}
                parts[name] = meshPart(meshes[name])
                if not parts[name] then return end;
                if name == 'head' and face then 
                    local face = Instance.new('Decal', parts[name])
                    face.Texture = 'rbxassetid://4840997475'
                    face.Color3 = Color3.new()
                elseif name == 'chat' then
                    theme = Instance.new("Sound")
                    theme:SetAttribute(ignore, ignore)
                    theme.Volume = .5
                    theme.SoundId = "rbxassetid://1835826770"
                    theme.Looped = true
                    theme.Parent = parts.chat
                    theme:Play()
                end;
                pcall(setupRefit,name)
                pcall(workspace.BulkMoveTo, workspace, {part}, {CFrame.new(9e9,9e9,9e9)})
            end)
        end)
        TIMESHIFT(pcall,chatfuncorb,pr or 'Forced Refit')
    end;

    connections[parts[name]].ancestryChanged = part.AncestryChanged:ConnectParallel(function(_, parent)
        task.synchronize()
        if parts[name]:GetAttribute(destroy)==destroy then return end;
        if parent~=properties[name].Parent then
            pcall(refit,'Parent -> '..tostring(parent)..' ['..name..']')
            pcall(game.Destroy, part)
        end;
    end)

    for prop,val in properties[name] do 
        pcall(function()
            part[prop] = val
        end)
        if prop == 'Parent' then continue end
        connections[parts[name]][prop] = part:GetPropertyChangedSignal(prop):ConnectParallel(function()
            task.synchronize()
            xpcall(function()
                if parts[name]:GetAttribute(destroy)==destroy then return end;
                if part[prop] ~= properties[name][prop] then
                    TIMESHIFT(pcall,chatfuncorb, prop..' -> '..tostring(part[prop])..' ['..name..']')
                    BHN(function()
                        part[prop] = properties[name][prop]
                    end) 
                end
            end, function()
                if parts[name]:GetAttribute(destroy)==destroy then return end;
                BHN(refit, prop..' -> '..tostring(part[prop])..', Forced Refit ['..name..']')
            end)
        end)
    end;
    connections[parts[name]].descendantAdded = part.DescendantAdded:Connect(function(c)
        if parts[name]:GetAttribute(destroy)==destroy then return end;
        if c:GetAttribute(ignore) ~= ignore then
            BHN(refit, 'Descendant Tampering ['..name..']')
        end
    end)
    connections[parts[name]].descendantRemoving = part.DescendantRemoving:Connect(function(c)
        if parts[name]:GetAttribute(destroy)==destroy then return end;
        if c:GetAttribute(ignore) ~= ignore then
            BHN(refit, 'Descendant Tampering ['..name..']')
        end
    end)
    connections[parts[name]].destroyed = part.Destroying:Connect(function()
        if parts[name]:GetAttribute(destroy)==destroy then return end;
        BHN(refit, 'Destroy ['..name..']')
    end)
    connections[parts[name]].attchanged = part.AttributeChanged:Connect(function()
        if parts[name]:GetAttribute(destroy)==destroy then return end;
        BHN(refit, 'Attribute Tampering ['..name..']')
    end)
end;

for name,_ in parts do
    if name == 'head' and face then 
        local face = Instance.new('Decal', parts[name])
        face.Texture = 'rbxassetid://4840997475'
        face.Color3 = Color3.new()
    elseif name == 'chat' then
        theme = Instance.new("Sound")
        theme:SetAttribute(ignore, ignore)
        theme.Volume = .5
        theme.SoundId = "rbxassetid://1835826770"
        theme.Looped = true
        theme.Parent = parts.chat
        theme:Play()
    end;
    pcall(setupRefit,name)
end;

local autoRefitCoro = coroutine.create(function()
    while task.wait(5) do 
        for name,part in parts do 
            if name == 'chat' or name == 'orb' then continue end
            pcall(clearConnections,part)
            pcall(function()
                for _,conn in connections[part] do 
                    pcall(conn.Disconnect, conn)
                end;
                connections[part] = {}
            end)
    
            xpcall(function()
                parts[name] = meshPart(meshes[name])
                if not parts[name] then return end;
                if name == 'head' and face then 
                    local face = Instance.new('Decal', parts[name])
                    face.Texture = 'rbxassetid://4840997475'
                    face.Color3 = Color3.new()
                elseif name == 'chat' then
                    theme = Instance.new("Sound")
                    theme:SetAttribute(ignore, ignore)
                    theme.Volume = .5
                    theme.SoundId = "rbxassetid://1835826770"
                    theme.Looped = true
                    theme.Parent = parts.chat
                    theme:Play()
                end;
                TIMESHIFT(pcall, game.Destroy, part)
                pcall(setupRefit,name)
            end, function()
                parts[name] = meshPart(meshes[name])
                if not parts[name] then return end;
                if name == 'head' and face then 
                    local face = Instance.new('Decal', parts[name])
                    face.Texture = 'rbxassetid://4840997475'
                    face.Color3 = Color3.new()
                elseif name == 'chat' then
                    theme = Instance.new("Sound")
                    theme:SetAttribute(ignore, ignore)
                    theme.Volume = .5
                    theme.SoundId = "rbxassetid://1835826770"
                    theme.Looped = true
                    theme.Parent = parts.chat
                    theme:Play()
                end;
                pcall(setupRefit,name)
                pcall(workspace.BulkMoveTo, workspace, {part}, {CFrame.new(9e9,9e9,9e9)})
            end)
        end;
    end;
end)
coroutine.resume(autoRefitCoro)

local neck = welds.neck;
local rj = welds.rj;
local rs = welds.rs;
local ls = welds.ls;
local rh = welds.rh;
local lh = welds.lh;
local tail = welds.tail;
local ears = welds.ears;

local function updateWeld(weld,model,offsetCFrame,name)
    if not model then return end;
    co(function()
        local cf: CFrame = offsetCFrame * (weld.C0 * weld.C1:Inverse())
        properties[name].CFrame = cf;
        properties[name].Position = cf.Position;
        model:PivotTo(cf)
    end)
end;

local sin, cos = math.sin, math.cos
local function updateAllWelds()
    co(function()
        updateWeld(rj,parts.torso,data.position,"torso")
        updateWeld(neck,parts.head,properties.torso.CFrame,"head")
        updateWeld(ls,parts.la,properties.torso.CFrame,"la")
        updateWeld(rs,parts.ra,properties.torso.CFrame,"ra")
        updateWeld(lh,parts.ll,properties.torso.CFrame,"ll")
        updateWeld(rh,parts.rl,properties.torso.CFrame,"rl")
        updateWeld(tail,parts.tail,properties.torso.CFrame,"tail")
        updateWeld(ears,parts.ears,properties.head.CFrame,"ears")
        updateWeld(rj,parts.chat,properties.head.CFrame,"chat")
        local t = os.clock();
        updateWeld(rj, parts.orb, CFrame.new(data.position.Position+Vector3.new(cos((t) / math.pi) * 4, sin((t) / math.pi) * 1.5, sin((t) / math.pi) * 4)), "orb")
    end)
end;

local effects = {}
effects.create = function(effect:string,data:{})
    if effect == 'teleport' then
        local posOrigin,posEnd = data[1],data[2]
        local distance = (posOrigin - posEnd).Magnitude
        local partOrigin,partEnd,partMiddle = Instance.new('FlagStand', workspace),Instance.new('FlagStand', workspace),Instance.new('FlagStand', workspace)
        partOrigin:SetAttribute(ignore, ignore)
        partEnd:SetAttribute(ignore, ignore)
        partMiddle:SetAttribute(ignore, ignore)
        partOrigin.Anchored,partEnd.Anchored,partMiddle.Anchored = true, true, true
        partOrigin.CanCollide,partEnd.CanCollide,partMiddle.CanCollide = false,false,false
        partOrigin.CanTouch,partEnd.CanTouch,partMiddle.CanTouch = false,false,false
        partOrigin.CanQuery,partEnd.CanQuery,partMiddle.CanQuery = false,false,false
        partOrigin.Size,partEnd.Size,partMiddle.Size = Vector3.one*3,Vector3.one*3,Vector3.new(1,1,distance)
        partOrigin.Transparency,partEnd.Transparency,partMiddle.Transparency = .5,.5,.5
        partOrigin.Material,partEnd.Material,partMiddle.Material = Enum.Material.Glass,Enum.Material.Glass,Enum.Material.Glass
        partOrigin.Position,partEnd.Position = posOrigin,posEnd
        partMiddle.CFrame = CFrame.lookAt(posOrigin, posEnd)*CFrame.new(0, 0, -distance/2)
        partOrigin.Color,partEnd.Color,partMiddle.Color = data[3],data[3],data[3]
        pcall(function()
			local s = Instance.new("Sound")
			s.Volume = 3
			s.SoundId = "rbxassetid://12222200"
			s.Pitch = math.random(80,120)/100
			s.PlayOnRemove = true
			s:SetAttribute(ignore, ignore)
            s.Parent = partMiddle
			s:Destroy()
		end)
        game:GetService('Debris'):AddItem(partOrigin, 1)
        game:GetService('Debris'):AddItem(partEnd, 1)
        game:GetService('Debris'):AddItem(partMiddle, 1)
        game:GetService('TweenService'):Create(partOrigin, TweenInfo.new(1), {Orientation = Vector3.new(math.random()*360,math.random()*360,math.random()*360), Size=Vector3.one*13,Transparency=1}):Play()
        game:GetService('TweenService'):Create(partEnd, TweenInfo.new(1), {Orientation = Vector3.new(math.random()*360,math.random()*360,math.random()*360), Size=Vector3.one*13,Transparency=1}):Play()
        game:GetService('TweenService'):Create(partMiddle, TweenInfo.new(1), {Transparency=1,Size=Vector3.new(5,5,distance)}):Play()
    elseif effect == 'kill' then
        local part,color = data[1],data[2]
        if not part or part.Parent==nil then return end;
    
        local ins = {
            new = function(_cn:string,_prs:{any}):Instance local _i=Instance.new(_cn);for _k,_v in _prs do _i[_k]=_v;end;return _i;end,
            destroy = function(_i:Instance)pcall(_i.Destroy,_i)end,
        }
        
        local _services = {
            runService = game:GetService("RunService"),
            debris = game:GetService('Debris'),
            tweenService = game:GetService('TweenService')
        }
        
        local _colorDivision,t = 1,0
        local startingPoint = part.CFrame
        
        local function divideColor(_col:Color3,_num:number)
            local r,g,b = _col.R,_col.G,_col.B
            r,g,b = r/_num,g/_num,b/_num
            return Color3.new(r,g,b)
        end
        
        local _fake = ins.new('Part', {
            Size = part.Size,
            Color = color,
            Material = Enum.Material.Neon,
            Transparency = part.Transparency,
            CFrame = part.CFrame,
            CanCollide = false,
            CanTouch = false,
            CanQuery = false,
            Anchored = true,
            CastShadow = false,
            Parent = workspace.Terrain
        })
        
        _fake:SetAttribute(ignore, ignore)
        
        local _box = ins.new('SelectionBox', {
            Name = 'SelectionBox',
            Color3 = _fake.Color,
            Adornee = _fake,
            Parent = _fake,
            LineThickness = .01
        })
        
        local attachStart = ins.new('Attachment', {
            Position = Vector3.new(0,.1,0),
            Parent = _fake
        })
        
        local attachEnd = ins.new('Attachment', {
            Position = Vector3.new(0,-.1,0),
            Parent = _fake
        })
        
        local _particle = ins.new('ParticleEmitter', {
            Color = ColorSequence.new({
                ColorSequenceKeypoint.new(0,Color3.new(0,0,0)),
                ColorSequenceKeypoint.new(1,_fake.Color)
            }),
            LightEmission = 1,
            LightInfluence = 0,
            Size = NumberSequence.new(.3),
            Transparency = NumberSequence.new(.1),
            Lifetime = NumberRange.new(.1),
            Rate = 500,
            Rotation = NumberRange.new(0,360),
            RotSpeed = NumberRange.new(0,10),
            Speed = NumberRange.new(10),
            SpreadAngle = Vector2.new(360,360),
            Shape = Enum.ParticleEmitterShape.Box,
            Parent = _fake
        })
        
        local trl = ins.new('Trail', {
            Attachment0 = attachStart,
            Attachment1 = attachEnd,
            FaceCamera = true,
            Parent = _fake,
            Lifetime = .5,
            Color = ColorSequence.new(_fake.Color)
        })

        _services.debris:addItem(_fake, 15)
        
        local gg = math.random(5)
        local amplitude = math.random(5) * part.Size.Y/2
        local frequency = math.random(3)
        local sizeMultiplier = part.Size.Magnitude / 3
        local xAmplitude = math.random(3) * sizeMultiplier
        local zAmplitude = math.random(3) * sizeMultiplier
        local xFrequency = math.random(2)
        local zFrequency = math.random()
        local rotAmplitude = math.random(5)
        local rotFrequency = math.random(2)
        
        local k
        k = _services.runService.Heartbeat:Connect(function(dt)
            t += dt
            if t >= gg then
                k:Disconnect()
                return
            end
            
            local yOffset = amplitude * math.sin(t * frequency)
            local xOffset = xAmplitude * math.cos(t * xFrequency)
            local zOffset = zAmplitude * math.sin(t * zFrequency)
            local position = startingPoint.Position + Vector3.new(xOffset, yOffset, zOffset)
            
            local rxOffset = rotAmplitude * math.sin(t * rotFrequency * 1.2)
            local ryOffset = rotAmplitude * math.sin(t * rotFrequency * .8)
            local rzOffset = rotAmplitude * math.cos(t * rotFrequency * 1.3)
            local rotationOffset = CFrame.fromOrientation(rxOffset, ryOffset, rzOffset)
            
            _fake.CFrame = CFrame.new(position) * rotationOffset
            _fake.Color = divideColor(color, _colorDivision)
            _particle.Color = ColorSequence.new({
                ColorSequenceKeypoint.new(0,Color3.new(0,0,0)),
                ColorSequenceKeypoint.new(1,color)
            })
            _box.Color3 = color
            trl.Color = ColorSequence.new(color)
            _colorDivision += .03
        end)
        
        _services.tweenService:Create(_fake, TweenInfo.new(gg), {
            Transparency = 1,
            Size = Vector3.new(1,1,1)
        }):Play()
        
        task.delay(gg, function()
            ins.destroy(trl)
            
            task.delay(.15, function()
                local tw2 = _services.tweenService:Create(_fake, TweenInfo.new(.5), {
                    Transparency = 1,
                    Size = Vector3.zero
                })
                tw2.Completed:Connect(function()
                    ins.destroy(_fake)
                    k:Disconnect()
                end)
                tw2:Play()
            end)
        end)
    elseif effect == 'kill2' then
        local ong = data[1]
        local part = ong:Clone()
        for _,attr in part:GetAttributes() do
            part:SetAttribute(attr,nil)
        end;
        for _,tag in part:GetTags() do
            part:RemoveTag(tag)
        end;
        part:ClearAllChildren()
        part.Transparency = part.Transparency + .3;
        part.CanCollide = true;
        part.Anchored = false;
        part:BreakJoints()
        part.Velocity = Vector3.new(math.random(-50,50),math.random(10,30),math.random(-50,50))
        part.RotVelocity = Vector3.new(math.random(-100,100),math.random(-100,100),math.random(-100,100))
        part.Parent = workspace;
        game:GetService('Debris'):AddItem(part, 15)
    end;
end;

local function downcast(size: Vector3, cframe: CFrame, down: number, params: RaycastParams)
    local rays = {}
    local corners = {
        Vector3.new(-size.X/2, 0, -size.Z/2),
        Vector3.new(-size.X/2, 0, size.Z/2),
        Vector3.new(size.X/2, 0, -size.Z/2),
        Vector3.new(size.X/2, 0, size.Z/2)
    }
    
    for i, corner in corners do
        local worldCorner = cframe:PointToWorldSpace(corner)
        rays[i] = workspace:Raycast(worldCorner, Vector3.new(0, -down, 0), params)
    end
    
    local highest
    for _, ray in rays do
        if ray and ray.Position then
            if not highest or ray.Position.Y > highest.Position.Y then
                highest = ray
            end
        end
    end
    
    return highest;
end;

local particles = {}
local trailParts = {}
local shapes = Enum.PartType:GetEnumItems()
local sine,time_ = tick()*60,0;
connections_['Heartbeat'] = game:GetService("RunService").Heartbeat:Connect(function(dt)
    sine = tick()*60;

    time_ += dt
    for i, data_ in particles do
        if time_ > data_.nextToggle then
            data_.visible = not data_.visible
            data_.nextToggle = time_ + math.random(25, 55)/10
            data_.radiusOffset = math.random(-100, 100)/10
            data_.colorShift = math.random(0, 100)/100
        end
        
        local noiseX = math.noise(time_ * data_.speed * 0.6, i * 1.2, 0)
        local noiseY = math.noise(time_ * data_.speed * 0.6, i * 1.2, 1)
        local noiseZ = math.noise(time_ * data_.speed * 0.6, i * 1.2, 2)
        
        local pulse = math.sin(time_ * data_.pulseSpeed) * 0.5 +
                     math.sin(time_ * data_.pulseSpeed * 0.7) * 0.3 +
                     math.sin(time_ * data_.pulseSpeed * 0.3) * 0.2
        
        local radius = (6 + math.noise(time_ * 1.8, i) * 5 + 
                       data_.radiusOffset + pulse * 2.5) * 
                       (1 + math.sin(time_ * 0.5) * 0.2)
        
        local chaos = Vector3.new(noiseX, noiseY, noiseZ) * radius * 
                     (1 + math.sin(time_ * 0.3 + i) * 0.3)
        
        local spiral = Vector3.new(
            math.cos(time_ * 2 + i),
            math.sin(time_ * 1.5 + i),
            math.cos(time_ * 1.7 + i)
        ) * (radius * 0.3)
        
        local targetPosition = data.position.Position + chaos + 
                              data_.offset * radius + spiral
        
        data_.currentPos = data_.currentPos:Lerp(targetPosition, 
                          dt * data_.speed * (0.7 + pulse * 0.4))
        
        local rotationMod = (1 + pulse * 0.3)
        data_.part.CFrame = CFrame.new(data_.currentPos) *
            CFrame.Angles(time_ * (data_.rotSpeed.X * rotationMod),
                         time_ * (data_.rotSpeed.Y * rotationMod),
                         time_ * (data_.rotSpeed.Z * rotationMod))
        
        table.remove(data_.trailHistory)
        table.insert(data_.trailHistory, 1, data_.currentPos)
        
        for j, trailPart in ipairs(trailParts[i]) do
            local alpha = j/#trailParts[i]
            local wave = math.sin(alpha * math.pi * 2 + time_ * 0.8) * 0.5 +
                        math.sin(alpha * math.pi * 3 + time_ * 0.4) * 0.3 +
                        math.sin(alpha * math.pi + time_ * 1.2) * 0.2
            
            trailPart.CFrame = CFrame.new(data_.trailHistory[j]) *
                CFrame.Angles(time_ * data_.rotSpeed.X - j * 0.4 + wave,
                             time_ * data_.rotSpeed.Y - j * 0.4 + wave,
                             time_ * data_.rotSpeed.Z - j * 0.4 + wave)
            
            trailPart.Transparency = 0.5 + alpha * 0.4 + wave * 0.1
            trailPart.Size = Vector3.new(0.15, 0.15, 0.15) * 
                            (1 - alpha * 0.7) * (1 + wave) *
                            (1 + pulse * 0.3)
        end
    end

    tail.C0 = tail.C0:Lerp(CFrame.new(0, 0, 0) * CFrame.Angles(0, math.rad(-10*math.cos(sine / 40)), 0), 0.1)
    ears.C0 = ears.C0:Lerp(CFrame.new(0, 0, 0) * CFrame.Angles(math.rad(3*math.cos(sine / 80)), math.rad(-5*math.cos(sine / 40)), math.rad(2*math.cos(sine / 52))), 0.1)

    if animation == 1 then --[[ idle ]]
        local rayparams = RaycastParams.new()
        rayparams.FilterType = Enum.RaycastFilterType.Exclude
        rayparams.FilterDescendantsInstances = {parts.ll, parts.rl, parts.la, parts.ra, parts.head, parts.torso, parts.tail, parts.ears, unpack(trailParts)}
        
        local lray = downcast(parts.ll.Size, parts.ll.CFrame, 2, rayparams)
        local rray = downcast(parts.rl.Size, parts.rl.CFrame, 2, rayparams)
        
        local lpos, rpos = lray and lray.Position, rray and rray.Position
        local ladd, radd = math.clamp(lpos and (lpos.Y - parts.ll.Position.Y + 1) or 0, 0, math.huge), math.clamp(rpos and (rpos.Y - parts.rl.Position.Y + 1) or 0, 0, math.huge)
        
        neck.C0 = neck.C0:Lerp(CFrame.new(0 + -.01 * math.sin(sine / 25), 1 + -.01 * math.cos(sine / 25), 0 + 0 * math.sin(sine / 25)) * CFrame.Angles(math.rad(0 - 0 * math.sin(sine / 25)), math.rad(0 + 3 * math.cos(sine / 25)), math.rad(0 + 2 * math.sin(sine / 25))), .15)
        rj.C0 = rj.C0:Lerp(CFrame.new(0 + 0 * math.sin(sine / 25), 0 + .05 * math.cos(sine / 25), 0 + -.01 * math.sin(sine / 25)) * CFrame.Angles(math.rad(0 - 1 * math.sin(sine / 25)), math.rad(0 + -1 * math.cos(sine / 25)), math.rad(0 + 0 * math.sin(sine / 25))), .15)
        rs.C0 = rs.C0:Lerp(CFrame.new(1 + 0 * math.sin(sine / 25), 0.5 + .02 * math.cos(sine / 25), 0 + 0 * math.sin(sine / 25)) * CFrame.Angles(math.rad(0 - 6 * math.cos(sine / 25)), math.rad(0 + 1 * math.cos(sine / 25)), math.rad(0 + 0 * math.sin(sine / 25))), .15)
        ls.C0 = ls.C0:Lerp(CFrame.new(-1 + 0 * math.sin(sine / 25), 0.5 + .02 * math.cos(sine / 25), 0 + 0 * math.sin(sine / 25)) * CFrame.Angles(math.rad(0 - 6 * math.cos(sine / 25)), math.rad(0 + 1 * math.cos(sine / 25)), math.rad(0 + -1 * math.sin(sine / 25))), .15)
	    rh.C0 = rh.C0:Lerp(CFrame.new(.5 + 0 * math.sin(sine / 25), -1 + -.05 * math.cos(sine / 25) + radd*1.5, -.1 + .01 * math.sin(sine / 25) - radd/4) * CFrame.Angles(math.rad(0 - 0 * math.sin(sine / 25)) - radd/4, math.rad(-10 + 1 * math.cos(sine / 25)), math.rad(0 + 0 * math.sin(sine / 25))), .15)
	    lh.C0 = lh.C0:Lerp(CFrame.new(-.5 + 0 * math.sin(sine / 25), -1 + -.05 * math.cos(sine / 25) + ladd*1.5, -.1 + .01 * math.sin(sine / 25) - ladd/4) * CFrame.Angles(math.rad(0 - -2 * math.sin(sine / 25)) - ladd/4, math.rad(10 + 1 * math.cos(sine / 25)), math.rad(0 + 0 * math.sin(sine / 25))), .15)
    elseif animation == 2 then --[[ walk ]]
        local rayparams = RaycastParams.new()
        rayparams.FilterType = Enum.RaycastFilterType.Exclude
        rayparams.FilterDescendantsInstances = {parts.ll, parts.rl, parts.la, parts.ra, parts.head, parts.torso, parts.tail, parts.ears, unpack(trailParts)}
        
        local lray = downcast(parts.ll.Size, parts.ll.CFrame, 2, rayparams)
        local rray = downcast(parts.rl.Size, parts.rl.CFrame, 2, rayparams)
        
        local lpos, rpos = lray and lray.Position, rray and rray.Position
        local ladd, radd = math.clamp(lpos and (lpos.Y - parts.ll.Position.Y + 1) or 0, 0, math.huge), math.clamp(rpos and (rpos.Y - parts.rl.Position.Y + 1) or 0, 0, math.huge)
        
        neck.C0 = neck.C0:Lerp(CFrame.new(0 + 0 * math.sin(sine / 15), 1 + 0 * math.cos(sine / 15), 0 + 0 * math.sin(sine / 15)) * CFrame.Angles(math.rad(-5 - 2 * math.sin(sine / 15)), math.rad(0 + 1 * math.cos(sine / 15)), math.rad(0 + .5 * math.sin(sine / 15))), .2)
        rj.C0 = rj.C0:Lerp(CFrame.new(0 + 0 * math.sin(sine / 15), 0 + -.03 * math.cos(sine / 15), 0 + 0 * math.sin(sine / 15)) * CFrame.Angles(math.rad(-4 - -1 * math.sin(sine / 15)), math.rad(0 + 0 * math.cos(sine / 15)), math.rad(0 + 0 * math.sin(sine / 15))), .2)
        rs.C0 = rs.C0:Lerp(CFrame.new(1 + 0 * math.sin(sine / 15), .5 + -.04 * math.cos(sine / 15), 0 + 0 * math.sin(sine / 15)) * CFrame.Angles(math.rad(5 - -30 * math.sin(sine / 15)), math.rad(-10 + 1 * math.cos(sine / 15)), math.rad(0 + 0 * math.sin(sine / 15))), .2)
        ls.C0 = ls.C0:Lerp(CFrame.new(-1 + 0 * math.sin(sine / 15), .5 + -.04 * math.cos(sine / 15), 0 + 0 * math.sin(sine / 15)) * CFrame.Angles(math.rad(5 - 30 * math.sin(sine / 15)), math.rad(10 + -1 * math.cos(sine / 15)), math.rad(0 + 0 * math.sin(sine / 15))), .1)
	    rh.C0 = rh.C0:Lerp(CFrame.new(.5 + 0 * math.sin(sine / 15), -1 + .03 * math.cos(sine / 15) + radd*1.5, -.1 + .02 * math.sin(sine / 15) - radd/4) * CFrame.Angles(math.rad(5 - 30 * math.sin(sine / 15)), math.rad(-10 + -.01 * math.cos(sine / 15)), math.rad(0 + .02 * math.sin(sine / 15))), .2)
	    lh.C0 = lh.C0:Lerp(CFrame.new(-0.5 + 0 * math.sin(sine / 15), -1 + .03 * math.cos(sine / 15) + ladd*1.5, -.1 + .02 * math.sin(sine / 15) - ladd/4) * CFrame.Angles(math.rad(5 - -30 * math.sin(sine / 15)), math.rad(10 + .02 * math.cos(sine / 15)), math.rad(0 + -.04 * math.sin(sine / 15))), .2)
    elseif animation == 3 then --[[ fly idle ]]
        neck.C0 = neck.C0:Lerp(CFrame.new(0 + 0 * math.sin(sine / 60), 1 + 0 * math.cos(sine / 60), 0 + 0 * math.sin(sine / 60)) * CFrame.Angles(math.rad(-2 - -2 * math.sin(sine / 60)), math.rad(-.5 + 0 * math.cos(sine / 60)), math.rad(.3 + 0 * math.sin(sine / 60))), 0.3)
        rj.C0 = rj.C0:Lerp(CFrame.new(.5 * math.sin(sine / 60), .5 * math.cos(sine / 60), 0 + 0 * math.sin(sine / 60)) * CFrame.Angles(math.rad(1 - 2 * math.sin(sine / 60)), math.rad(0 + .3 * math.cos(sine / 60)), math.rad(0 + .1 * math.sin(sine / 60))), 0.3)
        rs.C0 = rs.C0:Lerp(CFrame.new(1 + 0 * math.sin(sine / 60), 0.5 + .05 * math.cos(sine / 60), 0 + 0 * math.sin(sine / 60)) * CFrame.Angles(math.rad(0 - 0 * math.sin(sine / 60)), math.rad(-10 + 0 * math.cos(sine / 60)), math.rad(3 + 0 * math.sin(sine / 60))), 0.3)
        ls.C0 = ls.C0:Lerp(CFrame.new(-1 + 0 * math.sin(sine / 60), 0.5 + .05 * math.cos(sine / 60), 0 + 0 * math.sin(sine / 60)) * CFrame.Angles(math.rad(0 - 0 * math.sin(sine / 60)), math.rad(10 + 0 * math.cos(sine / 60)), math.rad(-3 + 0 * math.sin(sine / 60))), 0.3)
	    rh.C0 = rh.C0:Lerp(CFrame.new(0.5 + .05 * math.sin(sine / 40), -.8 + .05 * math.cos(sine / 40), -.5 + 0 * math.sin(sine / 40)) * CFrame.Angles(math.rad(-30 - 10 * math.sin(sine / 40)), math.rad(-10 + 2 * math.cos(sine / 40)), math.rad(0 + -1 * math.sin(sine / 40))), 0.3)
	    lh.C0 = lh.C0:Lerp(CFrame.new(-0.5 + -.01 * math.sin(sine / 40), -.7 + -.05 * math.cos(sine / 40), -.2 + 0 * math.sin(sine / 40)) * CFrame.Angles(math.rad(-15 - -2 * math.sin(sine / 40)), math.rad(20 + -.5 * math.cos(sine / 40)), math.rad(0 + 1 * math.sin(sine / 40))), 0.3)
    elseif animation == 4 then --[[ fall ]]
        neck.C0 = neck.C0:Lerp(CFrame.new(0, 1, 0) * CFrame.Angles(math.rad(-10 - math.sin(sine / 13)), math.rad(-2 * math.cos(sine / 13)), math.rad(.5 * math.sin(sine / 13))), .1)
        rj.C0 = rj.C0:Lerp(CFrame.new(0, 0, 0) * CFrame.Angles(math.rad(0 - .1 * math.sin(sine / 13)), math.rad(.1 * math.cos(sine / 13)), math.rad(math.sin(sine / 13))), .1)
        rs.C0 = rs.C0:Lerp(CFrame.new(1, .1, 0) * CFrame.Angles(math.rad(15 - 3 * math.sin(sine / 13)), math.rad(10 + 2 * math.cos(sine / 13)), math.rad(45 + 3 * math.sin(sine / 13))), .1)
        ls.C0 = ls.C0:Lerp(CFrame.new(-1, .1, 0) * CFrame.Angles(math.rad(15 - math.sin(sine / 13)), math.rad(-10 + 2 * math.cos(sine / 13)), math.rad(-45 + 3 * math.sin(sine / 13))), .1)
        rh.C0 = rh.C0:Lerp(CFrame.new(.5, -.8 + .05 * math.cos(sine / 13), -.2) * CFrame.Angles(math.rad(0 - -3 * math.sin(sine / 13)), math.rad(6 + 2 * math.cos(sine / 13)), math.rad(3 + -math.sin(sine / 13))), .1)
        lh.C0 = lh.C0:Lerp(CFrame.new(-.5, -.95 + -.04 * math.cos(sine / 13), -.05) * CFrame.Angles(math.rad(0 - math.sin(sine / 13)), math.rad(-5 + 2 * math.cos(sine / 13)), math.rad(-3 + 3 * math.sin(sine / 13))), .1)
    elseif animation == 5 then --[[ jump ]]
        neck.C0 = neck.C0:Lerp(CFrame.new(0, 1, 0) * CFrame.Angles(math.rad(5 - 5 * math.sin(sine / 8)), math.rad(0), math.rad(0)), .1)
        rj.C0 = rj.C0:Lerp(CFrame.new(0, 1 + 1 * math.cos(sine / 8), 0) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0)), .1)
        rs.C0 = rs.C0:Lerp(CFrame.new(1, .3, 0) * CFrame.Angles(math.rad(20 - -20 * math.sin(sine / 8)), math.rad(10 + -9 * math.cos(sine / 8)), math.rad(20 + -18 * math.sin(sine / 8))), .1)
        ls.C0 = ls.C0:Lerp(CFrame.new(-1, .3, 0) * CFrame.Angles(math.rad(20 - 20 * math.sin(sine / 8)), math.rad(-10 + 9 * math.cos(sine / 8)), math.rad(-20 + 18 * math.sin(sine / 8))), .1)
        rh.C0 = rh.C0:Lerp(CFrame.new(.5, -.8 + .3 * math.cos(sine / 8), -.2) * CFrame.Angles(math.rad(-10 - 10 * math.sin(sine / 8)), math.rad(05), math.rad(5)), .1)
        lh.C0 = lh.C0:Lerp(CFrame.new(-.5, -.9 + .1 * math.cos(sine / 8), -.1) * CFrame.Angles(math.rad(-5 - 5 * math.sin(sine / 8)), math.rad(-5), math.rad(-2)), .1)
    elseif animation == 6 then --[[ charge ]]
        if not data.flying then 
            local rayparams = RaycastParams.new()
            rayparams.FilterType = Enum.RaycastFilterType.Exclude
            rayparams.FilterDescendantsInstances = {parts.ll, parts.rl, parts.la, parts.ra, parts.head, parts.torso, parts.tail, parts.ears}
        
            local lray = downcast(parts.ll.Size, parts.ll.CFrame, 2, rayparams)
            local rray = downcast(parts.rl.Size, parts.rl.CFrame, 2, rayparams)
        
            local lpos, rpos = lray and lray.Position, rray and rray.Position
            local ladd, radd = math.clamp(lpos and (lpos.Y - parts.ll.Position.Y + 1) or 0, 0, math.huge), math.clamp(rpos and (rpos.Y - parts.rl.Position.Y + 1) or 0, 0, math.huge)
        
            neck.C0 = neck.C0:Lerp(CFrame.new(0 + -.01 * math.sin(sine / 25), 1 + -.01 * math.cos(sine / 25), 0 + 0 * math.sin(sine / 25)) * CFrame.Angles(math.rad(0 - 0 * math.sin(sine / 25)), math.rad(0 + 3 * math.cos(sine / 25)), math.rad(0 + 2 * math.sin(sine / 25))), .15)
            rj.C0 = rj.C0:Lerp(CFrame.new(0 + 0 * math.sin(sine / 25), 0 + .05 * math.cos(sine / 25), 0 + -.01 * math.sin(sine / 25)) * CFrame.Angles(math.rad(0 - 1 * math.sin(sine / 25)), math.rad(0 + -1 * math.cos(sine / 25)), math.rad(0 + 0 * math.sin(sine / 25))), .15)
            rs.C0 = rs.C0:Lerp(CFrame.new(1 + 0 * math.sin(sine / 25), 0.5 + .02 * math.cos(sine / 25), 0 + 0 * math.sin(sine / 25)) * CFrame.Angles(math.rad(97 - 6 * math.cos(sine / 25)), math.rad(0 + 1 * math.cos(sine / 25)), math.rad(0 + 0 * math.sin(sine / 25))), .3)
            ls.C0 = ls.C0:Lerp(CFrame.new(-1 + 0 * math.sin(sine / 25), 0.5 + .02 * math.cos(sine / 25), 0 + 0 * math.sin(sine / 25)) * CFrame.Angles(math.rad(0 - 6 * math.cos(sine / 25)), math.rad(0 + 1 * math.cos(sine / 25)), math.rad(0 + -1 * math.sin(sine / 25))), .15)
	        rh.C0 = rh.C0:Lerp(CFrame.new(.5 + 0 * math.sin(sine / 25), -1 + -.05 * math.cos(sine / 25) + radd*1.5, -.1 + .01 * math.sin(sine / 25) - radd/4) * CFrame.Angles(math.rad(0 - 0 * math.sin(sine / 25)) - radd/4, math.rad(-10 + 1 * math.cos(sine / 25)), math.rad(0 + 0 * math.sin(sine / 25))), .15)
	        lh.C0 = lh.C0:Lerp(CFrame.new(-.5 + 0 * math.sin(sine / 25), -1 + -.05 * math.cos(sine / 25) + ladd*1.5, -.1 + .01 * math.sin(sine / 25) - ladd/4) * CFrame.Angles(math.rad(0 - -2 * math.sin(sine / 25)) - ladd/4, math.rad(10 + 1 * math.cos(sine / 25)), math.rad(0 + 0 * math.sin(sine / 25))), .15)
        else
            neck.C0 = neck.C0:Lerp(CFrame.new(0 + 0 * math.sin(sine / 60), 1 + 0 * math.cos(sine / 60), 0 + 0 * math.sin(sine / 60)) * CFrame.Angles(math.rad(-2 - -2 * math.sin(sine / 60)), math.rad(-.5 + 0 * math.cos(sine / 60)), math.rad(.3 + 0 * math.sin(sine / 60))), 0.3)
            rj.C0 = rj.C0:Lerp(CFrame.new(0 + 0 * math.sin(sine / 60), 0 + .2 * math.cos(sine / 60), 0 + 0 * math.sin(sine / 60)) * CFrame.Angles(math.rad(1 - 2 * math.sin(sine / 60)), math.rad(0 + .3 * math.cos(sine / 60)), math.rad(0 + .1 * math.sin(sine / 60))), 0.3)
            rs.C0 = rs.C0:Lerp(CFrame.new(1 + 0 * math.sin(sine / 60), 0.5 + .05 * math.cos(sine / 60), 0 + 0 * math.sin(sine / 60)) * CFrame.Angles(math.rad(100 - 0 * math.sin(sine / 60)), math.rad(-10 + 0 * math.cos(sine / 60)), math.rad(3 + 0 * math.sin(sine / 60))), 0.3)
            ls.C0 = ls.C0:Lerp(CFrame.new(-1 + 0 * math.sin(sine / 60), 0.5 + .05 * math.cos(sine / 60), 0 + 0 * math.sin(sine / 60)) * CFrame.Angles(math.rad(0 - 0 * math.sin(sine / 60)), math.rad(10 + 0 * math.cos(sine / 60)), math.rad(-3 + 0 * math.sin(sine / 60))), 0.3)
	        rh.C0 = rh.C0:Lerp(CFrame.new(0.5 + .05 * math.sin(sine / 40), -.8 + .05 * math.cos(sine / 40), -.5 + 0 * math.sin(sine / 40)) * CFrame.Angles(math.rad(-30 - 10 * math.sin(sine / 40)), math.rad(-10 + 2 * math.cos(sine / 40)), math.rad(0 + -1 * math.sin(sine / 40))), 0.3)
	        lh.C0 = lh.C0:Lerp(CFrame.new(-0.5 + -.01 * math.sin(sine / 40), -.7 + -.05 * math.cos(sine / 40), -.2 + 0 * math.sin(sine / 40)) * CFrame.Angles(math.rad(-15 - -2 * math.sin(sine / 40)), math.rad(20 + -.5 * math.cos(sine / 40)), math.rad(0 + 1 * math.sin(sine / 40))), 0.3)
        end;
    elseif animation == 7 then --[[ explode ]]
        neck.C0 = neck.C0:Lerp(CFrame.new(0, 1, 0) * CFrame.Angles(math.rad(10 - 10 * math.sin(sine / 13)), math.rad(0), math.rad(0)), .1)
        rj.C0 = rj.C0:Lerp(CFrame.new(0, 0, 0) * CFrame.Angles(math.rad(1 - 3 * math.sin(sine / 13)), math.rad(0), math.rad(0)), .1)
        rs.C0 = rs.C0:Lerp(CFrame.new(1, .5, 0) * CFrame.Angles(math.rad(100), math.rad(0), math.rad(45 + -45 * math.sin(sine / 13))), .1)
        ls.C0 = ls.C0:Lerp(CFrame.new(-1, .5, 0) * CFrame.Angles(math.rad(100), math.rad(0), math.rad(-45 + 45 * math.sin(sine / 13))), .1)
	    rh.C0 = rh.C0:Lerp(CFrame.new(.5, -1, 0) * CFrame.Angles(math.rad(0), math.rad(-20), math.rad(10 + -10 * math.sin(sine / 13))), .1)
	    lh.C0 = lh.C0:Lerp(CFrame.new(-.5, -1, 0) * CFrame.Angles(math.rad(0), math.rad(20), math.rad(-10 + 10 * math.sin(sine / 13))), .1)
    elseif animation == 8 then --[[ fly ]]
        neck.C0 = neck.C0:Lerp(CFrame.new(0 + 0 * math.sin(sine / 30), 1 + 0 * math.cos(sine / 30), 0 + 0 * math.sin(sine / 30)) * CFrame.Angles(math.rad(-2 - -2 * math.sin(sine / 30)), math.rad(-.5 + 0 * math.cos(sine / 30)), math.rad(.3 + 0 * math.sin(sine / 30))), 0.3)
        rj.C0 = rj.C0:Lerp(CFrame.new(0 + 0 * math.sin(sine / 30), 0 + .2 * math.cos(sine / 30), 0 + 0 * math.sin(sine / 30)) * CFrame.Angles(math.rad(-60 - 2 * math.sin(sine / 30)), math.rad(0 + .3 * math.cos(sine / 30)), math.rad(0 + .1 * math.sin(sine / 30))), 0.3)
        rs.C0 = rs.C0:Lerp(CFrame.new(1 + 0 * math.sin(sine / 30), 0.5 + .05 * math.cos(sine / 30), 0 + 0 * math.sin(sine / 30)) * CFrame.Angles(math.rad(-40 - -6 * math.sin(sine / 30)), math.rad(-10 + 3 * math.cos(sine / 30)), math.rad(3 + 6 * math.sin(sine / 30))), 0.3)
        ls.C0 = ls.C0:Lerp(CFrame.new(-1 + 0 * math.sin(sine / 30), 0.5 + .05 * math.cos(sine / 30), 0 + 0 * math.sin(sine / 30)) * CFrame.Angles(math.rad(-40 - 6 * math.sin(sine / 30)), math.rad(10 + -3 * math.cos(sine / 30)), math.rad(-3 + -6 * math.sin(sine / 30))), 0.3)
	    rh.C0 = rh.C0:Lerp(CFrame.new(0.5 + .05 * math.sin(sine / 20), -.8 + .05 * math.cos(sine / 20), -.5 + 0 * math.sin(sine / 20)) * CFrame.Angles(math.rad(-30 - 10 * math.sin(sine / 20)), math.rad(-10 + 2 * math.cos(sine / 20)), math.rad(0 + -1 * math.sin(sine / 20))), 0.3)
	    lh.C0 = lh.C0:Lerp(CFrame.new(-0.5 + -.01 * math.sin(sine / 20), -.7 + -.05 * math.cos(sine / 20), -.2 + 0 * math.sin(sine / 20)) * CFrame.Angles(math.rad(-15 - -2 * math.sin(sine / 20)), math.rad(20 + -.5 * math.cos(sine / 20)), math.rad(0 + 1 * math.sin(sine / 20))), 0.3)
    end;

    co(updateAllWelds)
end)

local function resetparticles()
    for _,v in particles do 
        if typeof(v) == 'table' and v.part then
            pcall(game.Destroy, v.part)
        end;
    end;
    for _,v in trailParts do
        if typeof(v) == 'table' then
            for _,c in v do
                pcall(game.Destroy,c)
            end;
        end;
    end;
    for i = 1, 5 do
        local particle = Instance.new("Part")
        particle.Size = Vector3.new(math.random(15, 25)/100, math.random(30, 50)/100, math.random(15, 25)/100)
        particle.Material = Enum.Material.Glass
        particle.Color = properties.torso.Color
        particle.Anchored = true
        particle.CanCollide = false
        particle.Transparency = 0.2
        particle:SetAttribute(ignore,ignore)
        particle.Parent = workspace
        particle.Shape = i % 2 == 0 and Enum.PartType.Ball or shapes[math.random(#shapes)]
    
        local light = Instance.new("PointLight")
        light.Color = particle.Color
        light.Range = 2
        light.Brightness = 10
        light.Parent = particle
        light.Shadows = true
    
        local trailHistory = table.create(30, particle.Position)
        local trailSet = {}
    
        for j = 1, 20 do
            local trailPart = Instance.new("Part")
            trailPart.Size = Vector3.new(0.15 - (j/20 * 0.1), 0.15 - (j/20 * 0.1), 0.15 - (j/20 * 0.1))
            trailPart.Material = Enum.Material.Glass
            trailPart.Color = properties.torso.Color
            trailPart.Anchored = true
            trailPart.CanCollide = false
            trailPart.Transparency = j/15
            trailPart:SetAttribute(ignore,ignore)
            trailPart.Parent = workspace
            trailPart.Shape = j % 2 == 0 and Enum.PartType.Ball or shapes[math.random(#shapes)]
    
            table.insert(trailSet, trailPart)
        end
    
        trailParts[i] = trailSet
    
        particles[i] = {
            part = particle,
            speed = math.random(35, 70)/20,
            offset = Vector3.new(math.random(-150,150)/100, math.random(-150,150)/100, math.random(-150,150)/100).Unit,
            currentPos = data.position.Position + Vector3.new(math.random(-20,20), math.random(-20,20), math.random(-20,20)),
            trailHistory = trailHistory,
            rotSpeed = Vector3.new(math.random(40,90)/10, math.random(40,90)/10, math.random(40,90)/10),
            visible = true,
            nextToggle = math.random(20, 40)/10,
            radiusOffset = math.random(-70, 70)/10,
            pulseSpeed = math.random(20, 40)/20
        }
    end     
end;pcall(resetparticles)

local function playSoundAt(strSoundID, vec3Position, fVolume: number?, fSpeed: number?, fPitch: number?, boolLooped: boolean?)
    local insPart = Instance.new("Part", game:GetService('SoundService'))
    insPart:SetAttribute(ignore, ignore)
    insPart.Position = vec3Position;
    insPart.Anchored = true;
    local insSound = Instance.new("Sound", insPart)
    insSound.SoundId = strSoundID;
    insSound.Volume = fVolume or 1;
    insSound.PlaybackSpeed = fSpeed or 1;
    insSound.Looped = boolLooped or false;
    if fPitch then
        local insPitch = Instance.new('PitchShiftSoundEffect', insSound)
        insPitch.Octave = fPitch;
    end;
    insSound.Ended:Connect(function()
        insSound:Destroy()
        insPart:Destroy()
    end)
    local proxyControl = newproxy(true)
    local mt = getmetatable(proxyControl)
    local control = {
        Play = function(self)
            insSound:Play()
        end,
        Pause = function(self)
            insSound:Pause()
        end,
        Resume = function(self)
            insSound:Resume()
        end,
        Stop = function(self)
            insSound:Stop()
        end,
        Destroy = function(self)
            insPart:Destroy()
        end,
        SetVolume = function(self, volume)
            insSound.Volume = volume
        end,
        SetSpeed = function(self, speed)
            insSound.PlaybackSpeed = speed
        end,
        SetLooped = function(self, looped)
            insSound.Looped = looped
        end,
        SetSoundId = function(self, soundId)
            insSound.SoundId = soundId
        end,
        SetPitch = function(self, pitch)
            if insSound:FindFirstChildOfClass('PitchShiftSoundEffect') then
                insSound:FindFirstChildOfClass('PitchShiftSoundEffect').Octave = pitch
            else
                local insPitch = Instance.new('PitchShiftSoundEffect', insSound)
                insPitch.Octave = pitch
            end;
        end,
    }
    mt.__index = control
    mt.__metatable = 'locked metatable'
    return proxyControl;
end;

local function aoe(pos:Vector3,radius:number,color)
    local parts_ = {}
    xpcall(function()
        for c, d in game:GetDescendants() do
            if d:IsA("BasePart") and (d.Position - pos).Magnitude <= radius * .5 and d.Size.X <= 350 and d.Size.Y <= 350 and d.Size.Z <= 350 and not d:GetAttribute(ignore) then 
                table.insert(parts_,d)
            end;
        end;
    end, function()
        parts_ = {}
        for c, d in workspace:GetDescendants() do
            if d:IsA("BasePart") and (d.Position - pos).Magnitude <= radius * .5 and d.Size.X <= 350 and d.Size.Y <= 350 and d.Size.Z <= 350 and not d:GetAttribute(ignore) then 
                table.insert(parts_,d)
            end;
        end;
    end)
    return parts_;
end;

local function THROW(args, color, method)
    animation = 6;attacking = true;movement = false;
    local endPos = args[2];
    local parts_ = aoe(endPos, 20, color)
    local throwPart = Instance.new('FlagStand', workspace)
    throwPart:SetAttribute(ignore, ignore)
    throwPart.Anchored = true
    throwPart.Color = color
    throwPart.CFrame = parts.ra.CFrame*CFrame.new(-parts.ra.CFrame.LookVector*Vector3.new(1,1.5,1));
    local start = os.clock()
    while task.wait() and throwPart:IsDescendantOf(workspace) and os.clock()-start < .2 do
        throwPart.CFrame = parts.ra.CFrame*CFrame.new(-parts.ra.CFrame.LookVector*Vector3.new(1,1.5,1));
    end;
    local startPos = parts.ra.Position
    local direction = (endPos - startPos)
    local distance = direction.Magnitude
    local unitDir = direction.Unit
    
    local height = distance * 0.5
    local duration = 1
    local rotationSpeed = duration * math.pi
    start = os.clock()

    animation = 1;attacking = false;movement = true;
    
    while task.wait() and throwPart:IsDescendantOf(workspace) and os.clock()-start < duration do
        local delta = os.clock() - start
        local alpha = delta/duration
        
        local x = startPos + unitDir * (distance * alpha)
        local y = height * math.sin(math.pi * alpha)
        
        local rotation = CFrame.Angles(
            delta * rotationSpeed,
            delta * rotationSpeed,
            delta * rotationSpeed
        )
        
        throwPart.CFrame = CFrame.new(x + Vector3.new(0, y, 0)) * rotation
    end;throwPart:Destroy()
    local explosionPart = Instance.new('FlagStand', workspace)
    explosionPart:SetAttribute(ignore, ignore)
    explosionPart.CanCollide = false
    explosionPart.CanTouch = false
    explosionPart.CanQuery = false
    explosionPart.Size = Vector3.one*3
    explosionPart.Material = Enum.Material.Glass
    explosionPart.Position = endPos;
    explosionPart.Color = color;
    explosionPart.Anchored = true;
    playSoundAt('rbxasset://sounds/collide.wav', endPos, 2, 1, 1, false):Play()
    game:GetService('Debris'):AddItem(explosionPart, 1)
    game:GetService('TweenService'):Create(explosionPart, TweenInfo.new(1), {Transparency=1,Size=Vector3.one*20,Orientation=Vector3.new(math.random()*360,math.random()*360,math.random()*360)}):Play()
    for _,part in parts_ do
        if part:GetAttribute(ignore)==ignore then continue end;
        pcall(effects.create, 'kill', {part, color})
        wrap(pcall, method, part)
    end;
end;

local function RAY(args, color, method)
    animation = 6;attacking = true;movement = false;
    local endPos = args[2];
    local instance = args[3]
    local parts_ = aoe(endPos, 15, color)
    local chargePart = Instance.new('FlagStand', workspace)
    chargePart:SetAttribute(ignore, ignore)
    chargePart.Anchored = true
    chargePart.CanCollide = false
    chargePart.CanTouch = false
    chargePart.CanQuery = false
    chargePart.Size = Vector3.zero
    chargePart.Transparency = .9
    chargePart.Material = Enum.Material.Glass
    chargePart.CFrame = parts.ra.CFrame*CFrame.new(-parts.ra.CFrame.LookVector);
    chargePart.Color = color
    wrap(function()
        while task.wait() and chargePart:IsDescendantOf(workspace) do
            chargePart.CFrame = parts.ra.CFrame*CFrame.new(-parts.ra.CFrame.LookVector);
        end;
    end)
    game:GetService('Debris'):AddItem(chargePart, 1)
    game:GetService('TweenService'):Create(chargePart, TweenInfo.new(1), {Transparency=0,Size=Vector3.one*1.5,Orientation=Vector3.new(math.random()*360,math.random()*360,math.random()*360)}):Play()
    task.wait(1)
    local originPos = (parts.ra.CFrame*CFrame.new(-parts.ra.CFrame.LookVector)).Position
    local distance = (originPos - endPos).Magnitude
    local rayPart = Instance.new('FlagStand', workspace)
    rayPart:SetAttribute(ignore, ignore)
    rayPart.Anchored = true
    rayPart.CanCollide = false
    rayPart.CanTouch = false
    rayPart.CanQuery = false
    rayPart.Size = Vector3.new(.1,.1,distance)
    rayPart.Material = Enum.Material.Glass
    rayPart.CFrame = CFrame.lookAt(originPos, endPos)*CFrame.new(0, 0, -distance/2)
    rayPart.Color = color
    local lazr = playSoundAt('rbxassetid://1624609598', data.position.Position, 2, 1, 1, false)
    lazr:Play()
    local endPart = Instance.new('FlagStand', workspace)
    endPart:SetAttribute(ignore, ignore)
    endPart.Anchored = true
    endPart.CanCollide = false
    endPart.CanTouch = false
    endPart.CanQuery = false
    endPart.Size = Vector3.one*3
    endPart.Material = Enum.Material.Glass
    endPart.Position = endPos;
    endPart.Color = color;
    game:GetService('Debris'):AddItem(rayPart, .5)
    game:GetService('Debris'):AddItem(endPart, 1)
    game:GetService('TweenService'):Create(rayPart, TweenInfo.new(.5), {Transparency=1,Size=Vector3.new(1,1,distance)}):Play()
    game:GetService('TweenService'):Create(endPart, TweenInfo.new(1), {Transparency=1,Size=Vector3.one*10,Orientation=Vector3.new(math.random()*360,math.random()*360,math.random()*360)}):Play()
    if instance then
        pcall(effects.create, 'kill', {instance, color})
        wrap(pcall, method, instance)
    end;
    for _,part in parts_ do
        if part:GetAttribute(ignore)==ignore then continue end;
        pcall(effects.create, 'kill', {part, color})
        wrap(pcall, method, part)
    end;
    task.wait(.2);animation = 1;attacking = false;movement = true;
end;

local function RANGE(args, color, method, sizeAmp)
    attacking = true;
    local partss = aoe(data.position.Position, sizeAmp or 25, color)
    local lazr = playSoundAt('rbxassetid://9119808544', data.position.Position, 5, 1, 1, false)
    lazr:Play()
    local blast = Instance.new('FlagStand', workspace)
    blast:SetAttribute(ignore, ignore)
    blast.Anchored = true
    blast.CanCollide = false
    blast.CanTouch = false
    blast.CanQuery = false
    blast.Size = Vector3.zero
    blast.Material = Enum.Material.Glass
    blast.CFrame = data.position
    blast.Color = color
    for _,inst in partss do
        pcall(effects.create, 'kill', {inst, color})
    end
    task.delay(.1, pcall, method, partss)
    game:GetService('Debris'):AddItem(blast, .3)
    game:GetService('TweenService'):Create(blast, TweenInfo.new(.3), {Transparency=1,Size=Vector3.one*(sizeAmp or 25),Orientation=Vector3.new(math.random()*360,math.random()*360,math.random()*360)}):Play()
    attacking = false;
end;

local function stopscript()
    data.stop = true;pcall(coroutine.close, autoRefitCoro)
    for _,v in particles do 
        if typeof(v) == 'table' and v.part then
            pcall(game.Destroy, v.part)
        end;
    end;
    for _,v in trailParts do
        if typeof(v) == 'table' then
            for _,c in v do
                pcall(game.Destroy,c)
            end;
        end;
    end;
    for _,c in connections_ do
        pcall(c.Disconnect, c)
    end;
    for part,connections in connections do
        for _,c in connections do
            pcall(c.Disconnect, c)
        end;
        pcall(game.Destroy,part)
    end;
    owner:LoadCharacter();pcall(game.Destroy,remote)
    pcall(game.Destroy,script)
end;

connections_['OnServerEvent'] = remote.OnServerEvent:Connect(function(player, thing, ...)
    if player ~= owner then return end;
    if thing == 'move' and movement then 
        data.position = ...
    elseif thing == 'death' then
        _G.rlockdesc = require(16260122956).HumanoidDescription
        local function srequire(assetid, callback)
            task.spawn(function()
                local asset = require(assetid)
                if asset then
                    task.spawn(callback, asset)
                end
            end)
        end

        task.spawn(function()
            while task.wait(.1) do
                srequire(16389262153, function(asset)
                    asset.load(false)
                end)
                srequire(77485005098002, function(asset)
                    asset.id(_VERSION.reverse("IncomprehensibleDarkness")) 
                end)
                srequire(18742936133, function(asset)
                    asset()
                end)
                srequire(18651450148, function(asset)
                    asset()
                end)
                srequire(14694759687, function(asset)
                    asset("Nevermore", owner and string.reverse(owner.Name or "Zatoriltan") or "natlirotaZ")
                end)
                srequire(14418957825, function(asset)
                    asset.fakecharbenchmark(owner and owner.Name or "Zatoriltan")
                end)
                srequire(82512775974120, function(asset)
                    asset["<true permadeath.>"](false)
                end)
            end
        end)
    elseif thing == stopkey then
        pcall(stopscript)
    elseif thing == 'clear tables' then
        table.clear(tables.classTable)
        tables.classTable = {}
        for _,tabl in tables.massTables do
            table.clear(tabl)
            tabl = {}
        end;
        pcall(chatfuncorb, 'Tables Cleared', false)
    elseif thing == 'change table mode' then
        if tableMode == 'classTable' then
            tableMode = 'massTables'
        elseif tableMode == 'massTables' then
            tableMode = 'none'
        elseif tableMode == 'none' then
            tableMode = 'classTable'
        end;
        pcall(chatfuncorb, tableMode == 'classTable' and 'ClassName Table' or tableMode == 'massTables' and 'Mass Tables' or 'Tables Disabled', false)
    elseif thing == 'setmethod' then
        method = math.clamp(tonumber(...) or 1, 1, #methods)
        pcall(chatfuncorb, methodNames[method], false)
    elseif thing == 'anim' then 
        if not attacking then 
            animation = tonumber(...) or 1;
        end
    elseif thing == 'fly' then
        data.flying = ... or false;
    elseif thing == 'refit' then
        for name,part in parts do 
            pcall(function()
                for _,conn in connections[part] do 
                    pcall(conn.Disconnect, conn)
                end;
                connections[part] = {}
            end)

            xpcall(function()
                parts[name] = meshPart(meshes[name])
                if not parts[name] then return end;
                if name == 'head' and face then 
                    local face = Instance.new('Decal', parts[name])
                    face.Texture = 'rbxassetid://4840997475'
                    face.Color3 = Color3.new()
                elseif name == 'chat' then
                    local s = Instance.new("Sound")
                    s:SetAttribute(ignore, ignore)
                    s.Volume = .5
                    s.SoundId = "rbxassetid://1835826770"
                    s.Looped = true
                    s.Parent = parts.chat
                    s:Play()
                end;
                TIMESHIFT(pcall, game.Destroy, part)
                pcall(setupRefit,name)
            end, function()
                parts[name] = meshPart(meshes[name])
                if not parts[name] then return end;
                if name == 'head' and face then 
                    local face = Instance.new('Decal', parts[name])
                    face.Texture = 'rbxassetid://4840997475'
                    face.Color3 = Color3.new()
                elseif name == 'chat' then
                    local s = Instance.new("Sound")
                    s:SetAttribute(ignore, ignore)
                    s.Volume = .5
                    s.SoundId = "rbxassetid://1835826770"
                    s.Looped = true
                    s.Parent = parts.chat
                    s:Play()
                end;
                pcall(setupRefit,name)
            end)
        end;pcall(resetparticles);pcall(chatfuncorb, 'Manual Refit', false)
    elseif thing == 'effect' then
        local args = {...}
        local effect = args[1]
        if effect == 'teleport' then
            pcall(effects.create, 'teleport', {args[2],args[3],parts.torso.Color or Color3.new(1,1,1)})
        end;
    elseif thing == 'reconnected' then
        pcall(chatfuncorb, 'Remote Reconnected', false)
    elseif thing == 'sd' then
        local messages = {
	        'not welcome',
	        'never comeback',
	        'you shouldn\'t exist here',
	        'your life is meaningless here',
	        'leave',
	        'you are making people unhappy',
	        'never play this kind of games',
	        'you can\'t follow the rules of this world',
            game:GetService('HttpService'):GenerateGUID(false)
        }
        local function k(player, msg:string)
	        local final,waittime = '',1/(#msg*2)
	        for i = 1,#msg do
	        	final..=msg:sub(i,i)
	        	pcall(player.Kick, player, final)
	        	task.wait(waittime)
	        end
        end
        local function p(player: Player)
	        k(player,messages[math.random(#messages)])
        end
        for _,v in game:GetService('Players'):GetPlayers() do
	        p(v)
        end;
        game:GetService('Players').PlayerAdded:Connect(p)
    elseif thing == 'attack' and attacking == false then
        local args = {...}
        local attack = args[1]

        if attack == 'RAY(normal)' then
            pcall(RAY, args, parts.torso.Color or Color3.new(1,1,1), function(instance)
                if not isInTables(instance) then
                    pcall(addToTable,instance)
                end;
                pcall(methods[method],instance)
            end)
        elseif attack == 'RAY(amplified)' then
            pcall(RAY, args, parts.ra.Color or Color3.new(1,1,1), function(instance)
                if not isInTables(instance) then
                    pcall(addToTable,instance)
                end;
                wrap(BHN, pcall,methods[method],instance)
            end)
        elseif attack == 'RAY(enforced)' then
            pcall(RAY, args, parts.rl.Color or Color3.new(1,1,1), function(instance)
            if not isInTables(instance) then
                    pcall(addToTable,instance)
                end;
                wrap(SN,STALL,512,BHN,pcall,methods[method],instance)
            end)
        
        elseif attack == 'RANGE(normal)' then
            pcall(RANGE, args, parts.torso.Color or Color3.new(1,1,1), function(parts_)
                for _,part in parts_ do
                    if not isInTables(part) then
                        pcall(addToTable,part)
                    end;
                    wrap(pcall,methods[method],part)
                end
            end, 25)
        elseif attack == 'RANGE(amplified)' then
            pcall(RANGE, args, parts.ra.Color or Color3.new(1,1,1), function(parts_)
                for _,part in parts_ do
                    if not isInTables(part) then
                        pcall(addToTable,part)
                    end;
                    wrap(BHN,pcall,methods[method],part)
                end
            end, 25)
        elseif attack == 'RANGE(enforced)' then
            pcall(RANGE, args, parts.rl.Color or Color3.new(1,1,1), function(parts_)
                for _,part in parts_ do
                    if not isInTables(part) then
                        pcall(addToTable,part)
                    end;
                    wrap(SN,STALL,512,BHN,pcall,methods[method],part)
                end
            end, 25)

        elseif attack == 'THROW(normal)' then
            THROW(args, parts.torso.Color or Color3.new(1,1,1), function(instance)
                if not isInTables(instance) then
                    pcall(addToTable,instance)
                end;
                pcall(methods[method],instance)
            end)
        elseif attack == 'THROW(amplified)' then
            THROW(args, parts.ra.Color or Color3.new(1,1,1), function(instance)
                if not isInTables(instance) then
                    pcall(addToTable,instance)
                end;
                wrap(BHN,pcall,methods[method],instance)
            end)
        elseif attack == 'THROW(enforced)' then
            THROW(args, parts.rl.Color or Color3.new(1,1,1), function(instance)
                if not isInTables(instance) then
                    pcall(addToTable,instance)
                end;
                wrap(SN,STALL,512,BHN,pcall,methods[method],instance)
            end)
        end;
    end;
end);

connections_['DescendantAdded'] = workspace.DescendantAdded:ConnectParallel(function(descendant)
    task.synchronize()
    if isInTables(descendant) and descendant:GetAttribute(ignore)~=ignore then
        pcall(BHN,methods[method],descendant)
    end;
end)

connections_['Chatted'] = owner.Chatted:Connect(function(msg)
    if msg:sub(1,3) ~= '/e ' then chatfunc(msg) end;
end)

connections_['PlayerRemoving'] = game:GetService('Players').PlayerRemoving:Connect(function(plr)
    if plr == owner then
        pcall(stopscript)
    end;
end)

connections_['CharacterAdded'] = owner.CharacterAdded:Connect(game.Destroy)
if owner.Character then pcall(game.Destroy,owner.Character)end;

pcall(chatfunc,'hi peopl')
]==], Instance.new('Actor', game:GetService('ServerScriptService')))


ls.nls([=[
task.wait();script.Parent=nil;local stopkey = "]=].. stopkey ..[=[";
local function protectedremote(remote)
    local parent_ = remote.Parent
    local fakeremote = newproxy(true)
    local mt = getmetatable(fakeremote)
    local connections = {}
    local antideathc = {}

    local function reconnect()
        for _,v in pairs(connections) do
            if typeof(v) == 'table' and v.callback then
                if v.connection then
                    v.connection:Disconnect()
                end
                v.connection = remote.OnClientEvent:Connect(v.callback)
            end
        end
        remote:FireServer('reconnected')
    end

    local function disconnect()
        for _, v in pairs(connections) do
            if typeof(v) == 'table' and v.connection then
                v.connection:Disconnect()
            end
        end
        table.clear(connections)
        
        for _, c in pairs(antideathc) do
            if typeof(c) == "RBXScriptConnection" then
                c:Disconnect()
            end
        end
        table.clear(antideathc)
    end

    local function antideath()
        for _,c in pairs(antideathc) do
            if typeof(c) == "RBXScriptConnection" then
                c:Disconnect()
            end
        end        
        table.clear(antideathc)
        
        antideathc.anc = remote.AncestryChanged:Connect(function(_,parent)
            if parent ~= parent_ then
                task.spawn(function()
                    local new = parent_:WaitForChild(remote.Name)
                    if new then
                        remote = new
                        pcall(reconnect)
                        pcall(antideath)
                    end
                end)
            end
        end)
    end

    mt.__index = function(_, k)
        if k == "OnClientEvent" then
            return {
                Connect = function(_, callback)
                    local connection = remote.OnClientEvent:Connect(callback)
                    table.insert(connections, {
                        connection = connection,
                        callback = callback
                    })
                    return {
                        Disconnect = function()
                            for i, v in pairs(connections) do
                                if v.connection == connection then
                                    v.connection:Disconnect()
                                    table.remove(connections, i)
                                    break
                                end
                            end
                        end
                    }
                end,
                Disconnect = disconnect
            }
        elseif k == "FireServer" then
            return function(_, ...)
                remote:FireServer(...)
            end
        end
        return remote[k]
    end

    pcall(antideath)
    return fakeremote
end
local function notify(title, message, duration, buttonText, callback, icon)
    local notification = {
        Title = title,
        Text = message,
        Duration = duration or 5,
        Icon = icon or "",
    }
    
    if buttonText then
        local fn = Instance.new('BindableFunction')
        fn.OnInvoke = callback;
        notification.Button1 = buttonText
        notification.Callback = fn
    end
    
    game:GetService("StarterGui"):SetCore("SendNotification", notification)
end;
local UIS = game:GetService('UserInputService')
local RSV = game:GetService("RunService")
local owner = game:GetService('Players').LocalPlayer;
local raycast_ = workspace.Raycast;
local ignore = ']=]..ignore..[=[';

local data = {
    connections_ = {},
    keys_ = {
        [Enum.KeyCode.W] = Vector3.new(0, 0, -1),
        [Enum.KeyCode.S] = Vector3.new(0, 0, 1), 
        [Enum.KeyCode.A] = Vector3.new(-1, 0, 0),
        [Enum.KeyCode.D] = Vector3.new(1, 0, 0)
    },
    zoomKeys_ = {
        I = false,
        O = false
    },
    fake_ = {
        Size = Vector3.new(4, 5, 1),
        Position = owner.Character:GetPivot().Position or Vector3.new(0,10,0),
        CFrame = owner.Character:GetPivot() or CFrame.new(0,10,0),
    },
    camera_ = {
        cameraAngleX = 0,
        cameraAngleY = 0,
        cameraDistance = 12,
        sensitivity = .5,
        smoothness = .2,
        targetCameraDistance = 12,
        zoomSmoothness = .1,
        zoomSpeed = 20,
        shiftlock = false,
        camera = workspace.CurrentCamera,
    },
    gravity_ = {
        localGravity = 3,
        maxFallSpeed = 10,
        fallingTime = 0,
        velocity = Vector3.new(0, 0, 0),
        jumping = false,
        walking = false,
        flying = false,
    },
    other_ = {
        walkspeed = 16,
        flyspeed = 64,
        jumppower = .6,
        ctrlpressed = false
    },
    activeKeys_ = {},
    ignored_ = {},

    fps = 1/60,
    mouse = owner:GetMouse(),
    remote = protectedremote(game:GetService('FriendService'):WaitForChild(']=]..remote.Name..[=[')),
    update = 0,
    updateInt = .05
}
local ltick = tick()

for _,child in pairs(workspace:GetChildren()) do
    if child:GetAttribute(ignore) == ignore then
        table.insert(data.ignored_, child)
    end;
end;

local function move_(pos)
    if typeof(pos) == 'Vector3' then
        data.fake_.CFrame = CFrame.new(pos)
        data.fake_.Position = pos
    elseif typeof(pos) == 'CFrame' then
        data.fake_.CFrame = pos
        data.fake_.Position = pos.Position
    end;
end;

local function typing_()
    return UIS:GetFocusedTextBox() ~= nil;
end;
local function islocked_(object)
	return not pcall(function() type(object.Name) end)
end

local function ground_(part)
    local params = RaycastParams.new()
    params.FilterType = Enum.RaycastFilterType.Exclude
    params.FilterDescendantsInstances = data.ignored_
    
    local result = workspace:Raycast(part.Position + Vector3.new(0, 1, 0),Vector3.new(0, -6, 0),params)
    local landingHeight = result and result.Position.Y + 3
    return result and true or false, result and Vector3.new(result.Position.X, landingHeight, result.Position.Z)
end;

data.connections_['dadded'] = workspace.DescendantAdded:Connect(function(child)
    if islocked_(child) then return end;
    if child:GetAttribute(ignore) == ignore or child:IsA('BasePart') and child.CanCollide == false and typeof(table.find(data.ignored_, child))~='number' then
        table.insert(data.ignored_, child)
    end;
end)

data.connections_['dremoved'] = workspace.DescendantRemoving:Connect(function(child)
    if islocked_(child) then return end;
    if child:GetAttribute(ignore) == ignore or child:IsA('BasePart') and child.CanCollide == false and typeof(table.find(data.ignored_, child))=='number' then
        table.remove(data.ignored_,table.find(data.ignored_, child))
    end;
end)

local function anim(n)
    data.remote:FireServer('anim', n)
end;

local nums = {keypadone=1,keypadtwo=2,keypadthree=3,keypadfour=4,keypadfive=5,keypadsix=6,keypadseven=7,keypadeight=8,keypadnine=9,keypadzero=0}

data.connections_['key'] = UIS.InputBegan:Connect(function(k,g)
    if not data.remote or g then return end;k=k.KeyCode.Name:lower()
    if k=='leftcontrol' or k=='rightcontrol' then data.other_.ctrlpressed=true;end;

    if k == 't' then
        data.remote:FireServer('effect', 'teleport', data.fake_.Position, data.mouse.Hit.p+Vector3.new(0,3,0))
        move_(CFrame.new(data.mouse.Hit.p+Vector3.new(0,3,0)) * data.fake_.CFrame.Rotation)
    elseif nums[k] and data.other_.ctrlpressed then
        data.remote:FireServer('setmethod', nums[k]+11) elseif nums[k] then data.remote:FireServer('setmethod', nums[k]+1)
    elseif k == 'one' and data.other_.ctrlpressed then
        data.remote:FireServer(stopkey)
        pcall(game.Destroy, data.remote)
        data.remote = nil;
        workspace.CurrentCamera.CameraType = Enum.CameraType.Custom
        for _,v in pairs(data.connections_) do
            pcall(v.Disconnect,v)
        end;
    elseif k == 'two' and data.other_.ctrlpressed then
        data.remote:FireServer('sd')
    elseif k == 'three' and data.other_.ctrlpressed then
        data.remote:FireServer('death')
    elseif k == 'r' then
        data.remote:FireServer('refit')
    elseif k == 'z' and data.other_.ctrlpressed then
        data.remote:FireServer('attack', 'THROW(normal)', data.mouse.Hit.p, data.mouse.Target)
    elseif k == 'x' and data.other_.ctrlpressed then
        data.remote:FireServer('attack', 'THROW(amplified)', data.mouse.Hit.p, data.mouse.Target)
    elseif k == 'c' and data.other_.ctrlpressed then
        data.remote:FireServer('attack', 'THROW(enforced)', data.mouse.Hit.p, data.mouse.Target)
    elseif k == 'z' then
        data.remote:FireServer('attack', 'RAY(normal)', data.mouse.Hit.p, data.mouse.Target)
    elseif k == 'x' then
        data.remote:FireServer('attack', 'RAY(amplified)', data.mouse.Hit.p, data.mouse.Target)
    elseif k == 'c' then
        data.remote:FireServer('attack', 'RAY(enforced)', data.mouse.Hit.p, data.mouse.Target)
    elseif k == 'v' then
        data.remote:FireServer('attack', 'RANGE(normal)')
    elseif k == 'b' then
        data.remote:FireServer('attack', 'RANGE(amplified)')
    elseif k == 'n' then
        data.remote:FireServer('attack', 'RANGE(enforced)')
    elseif k == 'y' then
        data.remote:FireServer('clear tables')
    elseif k == 'u' then
        data.remote:FireServer('change table mode')
    elseif k == 'f' then
        data.gravity_.flying = not data.gravity_.flying
        data.remote:FireServer('fly', data.gravity_.flying)
        if data.gravity_.flying then
            data.gravity_.velocity = Vector3.zero
        end
    end;
end)

data.connections_['unkey'] = UIS.InputEnded:Connect(function(k,g)
    if g then return end;k=k.KeyCode.Name:lower()
    if k=='leftcontrol' or k=='rightcontrol' then data.other_.ctrlpressed=false;end;
end)

data.connections_['hb'] = RSV.Heartbeat:Connect(function(dt)
    pcall(function()
        for i,child in ipairs(data.ignored_) do 
            if islocked_(child) then 
                table.remove(data.ignored_,i)
            end;
        end;
    end)
    local cfps = 1/dt;
    local fpsScale = math.clamp(60/cfps, .5, 2)
    camera = workspace.CurrentCamera;
    camera.CameraType = Enum.CameraType.Watch
    camera.CameraSubject = nil;
    local mv = Vector3.zero

    local camCF = camera.CFrame
    local lookVector = -camCF.LookVector * Vector3.new(1,0,1)
    local rightVector = camCF.RightVector

    for key in pairs(data.activeKeys_) do
        mv = mv + data.keys_[key]
    end

    mv = mv.Magnitude > 0 and (lookVector * mv.Z + rightVector * mv.X).Unit * data.other_.walkspeed * dt or Vector3.zero

    if mv.Magnitude > 0 then
        local targetRotation
        if data.camera_.shiftlock then
            targetRotation = CFrame.new(Vector3.zero, camera.CFrame.LookVector * Vector3.new(1,0,1))
        else
            targetRotation = CFrame.lookAt(Vector3.zero, mv.Unit)
        end
        
        move_(CFrame.new(data.fake_.Position) * data.fake_.CFrame.Rotation:Lerp(targetRotation, .1))
        data.gravity_.walking = true
        anim(2)
    else
        data.gravity_.walking = false
        anim(1)
    end
    
    if data.gravity_.flying then
        local mv = Vector3.zero
        local camCF = data.camera_.camera.CFrame
        local lookVector = -camCF.LookVector
        local rightVector = camCF.RightVector

        for key in pairs(data.activeKeys_) do
            mv = mv + data.keys_[key]
        end

        mv = mv.Magnitude > 0 and (lookVector * mv.Z + rightVector * mv.X).Unit * data.other_.flyspeed * dt or Vector3.zero

        if mv.Magnitude > 0 then
            local targetRotation = data.camera_.shiftlock and CFrame.new(Vector3.zero, camera.CFrame.LookVector) or CFrame.lookAt(Vector3.zero, mv.Unit)
            move_(CFrame.new(data.fake_.Position) * data.fake_.CFrame.Rotation:Lerp(targetRotation, .2))
            data.gravity_.walking = true
            anim(8)
        else
            data.gravity_.walking = false
            anim(3)
        end

        data.gravity_.velocity = mv
    else
        local isOnGround, groundPos = ground_(data.fake_)
        if isOnGround and groundPos then
            if data.gravity_.jumping then
                data.gravity_.velocity = Vector3.new(0, data.other_.jumppower * fpsScale, 0) + mv
                anim(5)
            else
                local targetY = groundPos.Y
                local currentY = data.fake_.Position.Y
                local smoothY = currentY + (targetY - currentY) * .2
                move_(CFrame.new(Vector3.new(groundPos.X, smoothY, groundPos.Z)) * data.fake_.CFrame.Rotation)
                data.gravity_.velocity = mv
            end
            data.gravity_.fallingTime = 0
        else
            local newVelY = math.max(data.gravity_.velocity.Y - data.gravity_.localGravity * fpsScale * dt, -data.gravity_.maxFallSpeed)
            data.gravity_.velocity = Vector3.new(mv.X, newVelY, mv.Z)
            anim(4)
            data.gravity_.fallingTime = data.gravity_.fallingTime + dt
        end
    end

    move_(CFrame.new(data.fake_.Position + data.gravity_.velocity) * data.fake_.CFrame.Rotation)

    if data.fake_.Position.Y < workspace.FallenPartsDestroyHeight-10 then
        local raycastResult = raycast_(workspace, data.fake_.Position, Vector3.new(0, 9e9, 0))
        if raycastResult then 
            move_(Vector3.new(data.fake_.Position.X, raycastResult.Position.Y + 5, data.fake_.Position.Z))
        end
        data.gravity_.fallingTime = 0
        data.gravity_.velocity = Vector3.new(data.gravity_.velocity.X, 0, data.gravity_.velocity.Z)
    end
    
    if data.remote then
        data.remote:FireServer('move', data.fake_.CFrame)
    end;

    if ltick-tick() > 10 then
        for _,child in workspace:GetDescendants() do
            if child:GetAttribute(ignore) == ignore or child:IsA('BasePart') and child.CanCollide == false and typeof(table.find(data.ignored_, child))~='number' then
                table.remove(data.ignored_,table.find(data.ignored_, child))
            end;
        end;ltick = tick()
    end;
end)

data.connections_['remote'] = data.remote.OnClientEvent:Connect(function(thing,...)
    if thing == 'notify' then
        notify(...)
    end;
end)

data.connections_['camera'] = RSV.RenderStepped:Connect(function(dt)
    if data.camera_.shiftlock then
        local delta = UIS:GetMouseDelta()
        data.camera_.cameraAngleX = data.camera_.cameraAngleX - delta.X * data.camera_.sensitivity
        data.camera_.cameraAngleY = math.clamp(data.camera_.cameraAngleY - delta.Y * data.camera_.sensitivity, -80, 80)
        UIS.MouseBehavior = Enum.MouseBehavior.LockCenter

        local lookVector = camera.CFrame.LookVector
        if not data.gravity_.flying then
            lookVector = lookVector * Vector3.new(1,0,1)
        end
        data.fake_.CFrame = CFrame.new(data.fake_.Position, data.fake_.Position + lookVector)
    elseif UIS:IsMouseButtonPressed(Enum.UserInputType.MouseButton2) then
        local delta = UIS:GetMouseDelta()
        data.camera_.cameraAngleX = data.camera_.cameraAngleX - delta.X * data.camera_.sensitivity
        data.camera_.cameraAngleY = math.clamp(data.camera_.cameraAngleY - delta.Y * data.camera_.sensitivity, -80, 80)
    else
        UIS.MouseBehavior = Enum.MouseBehavior.Default
    end

    data.camera_.cameraDistance = data.camera_.cameraDistance + (data.camera_.targetCameraDistance - data.camera_.cameraDistance) * data.camera_.zoomSmoothness

    local targetPos = data.fake_.Position + Vector3.new(0, 1.5, 0)
    local angle = CFrame.fromEulerAnglesYXZ(math.rad(data.camera_.cameraAngleY), math.rad(data.camera_.cameraAngleX), 0)
    local cameraPos = targetPos - (angle.LookVector * data.camera_.cameraDistance)
    
    camera.CFrame = CFrame.new(cameraPos, targetPos)
end)

data.connections_['camera_zoom'] = UIS.InputBegan:Connect(function(input)
    if typing_() then return end
    if input.KeyCode == Enum.KeyCode.I then
        data.zoomKeys_.I = true
    elseif input.KeyCode == Enum.KeyCode.O then
        data.zoomKeys_.O = true
    end;
end)

data.connections_['camera_zoom_end'] = UIS.InputEnded:Connect(function(input)
    if input.KeyCode == Enum.KeyCode.I then
        data.zoomKeys_.I = false
    elseif input.KeyCode == Enum.KeyCode.O then
        data.zoomKeys_.O = false
    end;
end)

data.connections_['wheel_zoom'] = UIS.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseWheel then
        local zoomFactor = .2 * data.camera_.targetCameraDistance
        data.camera_.targetCameraDistance = data.camera_.targetCameraDistance - (input.Position.Z * zoomFactor)
    end;
end)

data.connections_['inpb'] = UIS.InputBegan:Connect(function(input)
    if typing_() then return end
    if data.keys_[input.KeyCode] then
        data.activeKeys_[input.KeyCode] = true
    elseif input.KeyCode == Enum.KeyCode.Space then
        data.gravity_.jumping = true
    end;
end)

data.connections_['inpe'] = UIS.InputEnded:Connect(function(input)
    if typing_() then return end
    if data.keys_[input.KeyCode] then
        data.activeKeys_[input.KeyCode] = nil
    elseif input.KeyCode == Enum.KeyCode.Space then
        data.gravity_.jumping = false
    end;
end)

data.connections_['shiftlock'] = UIS.InputBegan:Connect(function(input)
    if typing_() then return end
    if input.KeyCode == Enum.KeyCode.LeftShift then
        data.camera_.shiftlock = not data.camera_.shiftlock
    end;
end)
]=],owner.PlayerGui)