--[[

@ CXRN'S WAV PLAYER

@ NOTE: THIS IS AN EDIT OF DINO'S WAV PLAYER THAT I CREATED ORIGINALLY FOR MYSELF, FOR MORE OPTIMAL PERFORMACE, UPLOAD THE LOCALS TO ROBLOX.

@ KEYBINDS: {
    KEYPAD MINUS / KILLS THE SCRIPT
    KEYPAD MULTIPLY / ENABLES FAGGOT MODE
}

@ CREATED: 12/1/2025

]]

local rs = game:GetService('RunService')
local plrs = game:GetService('Players')
local http = game:GetService('HttpService')
local owner = owner
local id = owner.UserId

local perms = pcall(require, 106126121742989)

if not perms then
    warn("Warning, you don't have require perms, defaulting to sb provided nls.")
end

local NLS = (perms and require(106126121742989).NLS) or NLS
local lsCode = 
[[local __DARKLUA_BUNDLE_MODULES = {cache = {}}

do
    do
        local function __modImpl()
            local fft = {}

            fft.__index = fft

            local math = math
            local bit32 = bit32

            local function bit_reversal_table(size)
                local bitReversal = {}

                bitReversal[1] = 0

                local halfSize = size / 2

                for i = 1, size - 1 do
                    local old = bitReversal[bit32.rshift(i, 1) + 1]
                    local new = bit32.rshift(old, 1)

                    if bit32.band(i, 1) == 1 then
                        new = new + halfSize
                    end

                    bitReversal[i + 1] = new
                end

                return bitReversal
            end

            function fft.create_fft_state(size)
                local state = {}

                state.bitReversal = bit_reversal_table(size)
                state.size = size

                return state
            end
            function fft.fft(reals, imaginaries, state)
                local n = #reals
                local bitReversal = state.bitReversal

                for i = 0, n - 1 do
                    local k = bitReversal[i + 1]

                    if k > i then
                        reals[i + 1], reals[k + 1] = reals[k + 1], reals[i + 1]
                        imaginaries[i + 1], imaginaries[k + 1] = imaginaries[k + 1], imaginaries[i + 1]
                    end
                end

                local m = 1

                while m < n do
                    local m2 = m * 2
                    local angleStep = -2 * math.pi / m2

                    for k = 0, m - 1 do
                        local angle = k * angleStep
                        local wCos = math.cos(angle)
                        local wSin = math.sin(angle)

                        for p = k, n - 1, m2 do
                            local idxEven = p + 1
                            local idxOdd = p + m + 1
                            local rOdd = reals[idxOdd]
                            local iOdd = imaginaries[idxOdd]
                            local tRe = wCos * rOdd - wSin * iOdd
                            local tIm = wSin * rOdd + wCos * iOdd
                            local rEven = reals[idxEven]
                            local iEven = imaginaries[idxEven]

                            reals[idxOdd] = rEven - tRe
                            imaginaries[idxOdd] = iEven - tIm
                            reals[idxEven] = rEven + tRe
                            imaginaries[idxEven] = iEven + tIm
                        end
                    end

                    m = m2
                end

                return reals, imaginaries
            end

            return table.freeze(fft)
        end

        function __DARKLUA_BUNDLE_MODULES.a()
            local v = __DARKLUA_BUNDLE_MODULES.cache.a

            if not v then
                v = {
                    c = __modImpl(),
                }
                __DARKLUA_BUNDLE_MODULES.cache.a = v
            end

            return v.c
        end
    end
    do
        local function __modImpl()
            local Object = {}

            Object.__index = Object

            function Object.new(obj, ...)
                local self = setmetatable({}, Object)

                if typeof(obj) == 'string' then
                    self.Object = obj == 'MeshPart' and game:GetService('InsertService'):CreateMeshPartAsync(tostring((
...)['MeshId']) or '', Enum.CollisionFidelity.Default, Enum.RenderFidelity.Automatic) or Instance.new(obj)
                elseif typeof(obj) == 'Instance' then
                    self.Object = obj:Clone()
                end

                self.ClassName = obj

                for i, v in next, ...do
                    self[i] = v

                    if i ~= 'MeshId' then
                        self.Object[i] = (typeof(v) == 'table' and v.Object) and v.Object or v
                    end
                end

                return self
            end
            function Object:SetProperties()
                for i, v in next, self do
                    if i ~= 'Object' and i ~= 'ClassName' and i ~= 'MeshId' then
                        if typeof(v) == 'table' and v.Object then
                            self.Object[i] = v.Object
                        else
                            self.Object[i] = v
                        end
                    end
                end
            end
            function Object:Refit()
                if self.Object then
                    self.Object:Destroy()
                end
                if typeof(self.ClassName) == 'string' then
                    self.Object = self.ClassName == 'MeshPart' and game:GetService('InsertService'):CreateMeshPartAsync(tostring(self.MeshId) or '', Enum.CollisionFidelity.Default, Enum.RenderFidelity.Automatic) or Instance.new(self.ClassName)
                elseif typeof(self.ClassName) == 'Instance' then
                    self.Object = self.ClassName:Clone()
                end

                self:SetProperties()
            end
            function Object:Destroy()
                if self.Object then
                    self.Object:Destroy()
                end

                setmetatable(self, nil)

                self = nil
            end

            return table.freeze(Object)
        end

        function __DARKLUA_BUNDLE_MODULES.b()
            local v = __DARKLUA_BUNDLE_MODULES.cache.b

            if not v then
                v = {
                    c = __modImpl(),
                }
                __DARKLUA_BUNDLE_MODULES.cache.b = v
            end

            return v.c
        end
    end
end

task.wait()

local Script = script:Clone()

script:Destroy()

local script
local rs = game:GetService('RunService')
local plrs = game:GetService('Players')
local ts = game:GetService('TweenService')
local uis = game:GetService('UserInputService')
local fft = __DARKLUA_BUNDLE_MODULES.a()
local refit = __DARKLUA_BUNDLE_MODULES.b()
local name = Script:GetAttribute('owner')

Script:SetAttribute('owner', nil)

local function getInstance(parent, name)
    for _, v in pairs(parent:GetChildren())do
        if v.Name == name then
            return v
        end
    end

    task.wait()

    return getInstance(parent, name)
end

local owner = getInstance(plrs, name)
local id = owner.UserId
local localPlayer = plrs.LocalPlayer
local Settings = {
    windowSize = 512,
    bcFrequency = 440,
    pbSpeed = 1,
    volume = 1,
    bitCrush = 1,
    timePosition = 0,
    playing = false,
    byteOffset = 16,
    channels = nil,
    sampleRate = nil,
    bitsPerSample = nil,
    samples = nil,
    header = nil,
    dataSize = nil,
    maxValue = nil,
    deltaTime = 0,
    previousWaitTime = os.clock(),
    previousIndex = -1,
    reals = {},
    imaginaries = {},
    visualizerSize = 1,
    visualizerDefaultColor = Color3.fromRGB(255, 255, 255),
    visualizerRainbow = false,
    visualizerTransparency = 0,
    visualizerBars = 50,
    open = true,
    notifRunning = false,
}
local visualizerBars = {}
local waves = {}
local connections = {}
local securedInstances = {}
local remote, event, gui
local notification, visualize, connectbutton
local state = fft.create_fft_state(Settings.windowSize)

local function addConnection(signal, func)
    table.insert(connections, signal:Connect(func))
end
local function addSecuredInstance(classnane, properties)
    local instance = refit.new(classnane, properties)

    table.insert(securedInstances, instance)

    return instance
end
local function createSineWave(name, frequency)
    local character = owner.Character or owner.CharacterAdded:Wait()
    local s = Instance.new('Sound')

    s.SoundId = 'rbxassetid://9040512197'
    s.Volume = 0
    s.Playing = true
    s.Looped = true
    s.Parent = getInstance(character, 'HumanoidRootPart')
    s.RollOffMaxDistance = 100
    s.Name = name

    local frequencyPlaybackSpeed = frequency / Settings.bcFrequency

    if frequencyPlaybackSpeed > 20 then
        frequencyPlaybackSpeed = frequency / 1050
        s.SoundId = 'rbxassetid://198099744'
    end

    s.PlaybackSpeed = frequencyPlaybackSpeed

    return s
end
local function runIfOwner(func, ...)
    if localPlayer.UserId == id then
        task.spawn(func, ...)
    end
end

for i = 0, Settings.windowSize / 2 do
    table.insert(waves, createSineWave(i, 0))
end

local actions = table.freeze({
    ['link'] = function(...)
        local args = {...}
        local parseData = args[1]

        Settings.samples = parseData.samples
        Settings.sampleRate = parseData.sample_rate
        Settings.bitsPerSample = parseData.bits_per_sample

        for k, wave in next, waves do
            k = k - 1

            local frequency = (k * Settings.sampleRate / Settings.windowSize) * math.abs(Settings.pbSpeed)
            local frequencyPlaybackSpeed = frequency / Settings.bcFrequency

            if frequencyPlaybackSpeed > 20 then
                frequencyPlaybackSpeed = frequency / 1050
                wave.SoundId = 'rbxassetid://198099744'
            else
                wave.SoundId = 'rbxassetid://9040512197'
            end

            wave.PlaybackSpeed = frequencyPlaybackSpeed
        end

        Settings.timePosition = 0
        Settings.playing = true
    end,
    ['playbackspeed'] = function(...)
        local args = {...}

        Settings.pbSpeed = tonumber(args[1])

        if not Settings.sampleRate then
            return
        end

        for k, wave in next, waves do
            k = k - 1

            local frequency = (k * Settings.sampleRate / Settings.windowSize) * math.abs(Settings.pbSpeed)
            local frequencyPlaybackSpeed = frequency / Settings.bcFrequency

            if frequencyPlaybackSpeed > 20 then
                frequencyPlaybackSpeed = frequency / 1050
                wave.SoundId = 'rbxassetid://198099744'
            else
                wave.SoundId = 'rbxassetid://9040512197'
            end

            wave.PlaybackSpeed = frequencyPlaybackSpeed
        end

        runIfOwner(notification, string.format('set pbs to %s', tostring(table.concat(args, ''))))
    end,
    ['bitcrush'] = function(...)
        local args = {...}

        runIfOwner(notification, string.format('set bitcrush to %s', tostring(table.concat(args, ''))))

        Settings.bitCrush = tonumber(args[1])
    end,
    ['timeposition'] = function(...)
        local args = {...}

        runIfOwner(notification, string.format('set tpos to %s', tostring(table.concat(args, ''))))

        Settings.timePosition = tonumber(args[1])
    end,
    ['volume'] = function(...)
        local args = {...}

        runIfOwner(notification, string.format('set volume to %s', tostring(table.concat(args, ''))))

        Settings.volume = tonumber(args[1])
    end,
    ['notification'] = function(...)
        local args = {...}
        local message = args[1]
        local duration = args[2]

        runIfOwner(notification, message, duration)
    end,
    ['tasteTheRainbow'] = function()
        runIfOwner(notification, 'eat my sweets \u{1f3f3}\u{fe0f}\u{200d}\u{1f308}\u{1f308}\u{1f36c}')

        Settings.visualizerRainbow = not Settings.visualizerRainbow
    end,
    ['stop'] = function(...)
        Settings.playing = false

        for i, v in next, connections do
            v:Disconnect()
        end
        for k, wave in next, waves do
            wave.Playing = false
            wave.Volume = 0

            wave:Destroy()
        end

        if securedInstances then
            for _, v in next, securedInstances do
                v:Destroy()
            end

            securedInstances = nil
        end

        table.clear(connections)
        table.clear(waves)
        coroutine.yield()
    end,
})

local function connectToRemote()
    if event then
        event:Disconnect()
    end

    event = remote.OnClientEvent:Connect(function(func, ...)
        local action = actions[func]

        if action then
            if (...) then
                if typeof(...) == 'table' then
                    action(unpack(...))
                else
                    action(...)
                end
            else
                action()
            end

            return
        end
    end)
end
local function checkRemote()
    local remotes = game:QueryDescendants(string.format('RemoteEvent[$id = %s]', tostring(id)))
    local remoteEvent = remotes[1]

    if remote and remote.Parent ~= nil then
        return
    end
    if remoteEvent then
        remote = remoteEvent

        connectToRemote()
    end
end
local function onAction(input, processed)
    runIfOwner(function()
        if processed then
            return
        end

        remote:FireServer('keybind', {
            input.KeyCode,
        })
    end)
end

local guiFunctions = table.freeze({
    ['toggle'] = function()
        local tweenInfo = TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, 0, false)
        local main = gui.frame
        local toggle = gui.toggle
        local tween

        if Settings.open then
            tween = ts:Create(main.Object, tweenInfo, {
                Position = UDim2.new(0.5, 0, 1, 208),
            })

            tween.Completed:Once(function()
                main.Position = UDim2.new(0.5, 0, 1, 208)
                toggle.Text = 'open'
            end)
            tween:Play()
        else
            tween = ts:Create(main.Object, tweenInfo, {
                Position = UDim2.new(0.5, 0, 1, 0),
            })

            tween.Completed:Once(function()
                main.Position = UDim2.new(0.5, 0, 1, 0)
                toggle.Text = 'close'
            end)
            tween:Play()
        end

        Settings.open = not Settings.open
    end,
})

runIfOwner(function()
    gui = {}
    gui.notification = addSecuredInstance('ScreenGui', {
        ['Name'] = 'notification',
        ['ZIndexBehavior'] = Enum.ZIndexBehavior.Sibling,
        ['ResetOnSpawn'] = false,
        ['ScreenInsets'] = Enum.ScreenInsets.None,
        ['Parent'] = localPlayer.PlayerGui,
    })
    gui.body = addSecuredInstance('Frame', {
        ['Name'] = 'body',
        ['Position'] = UDim2.new(0.499915898, 0, 0, -41),
        ['Size'] = UDim2.new(0, 247, 0, 41),
        ['AnchorPoint'] = Vector2.new(0.5, 0),
        ['BackgroundColor3'] = Color3.new(0.196078, 0.196078, 0.235294),
        ['BackgroundTransparency'] = 0.10000000149011612,
        ['BorderColor3'] = Color3.new(0, 0, 0),
        ['BorderSizePixel'] = 0,
        ['Parent'] = gui.notification,
    })
    gui.message = addSecuredInstance('TextLabel', {
        ['Name'] = 'message',
        ['Size'] = UDim2.new(0, 247, 0, 41),
        ['BackgroundColor3'] = Color3.new(1, 1, 1),
        ['BackgroundTransparency'] = 1,
        ['BorderColor3'] = Color3.new(0, 0, 0),
        ['BorderSizePixel'] = 0,
        ['Font'] = Enum.Font.SourceSansItalic,
        ['FontSize'] = Enum.FontSize.Size24,
        ['TextColor3'] = Color3.new(1, 1, 1),
        ['TextSize'] = 20,
        ['TextWrap'] = true,
        ['TextWrapped'] = true,
        ['Parent'] = gui.body,
    })
    gui.main = addSecuredInstance('ScreenGui', {
        ['Name'] = 'wavplayergui',
        ['ResetOnSpawn'] = false,
        ['ZIndexBehavior'] = Enum.ZIndexBehavior.Sibling,
        ['Parent'] = localPlayer.PlayerGui,
    })
    gui.frame = addSecuredInstance('Frame', {
        ['Name'] = 'main',
        ['Position'] = UDim2.new(0.5, 0, 1, 0),
        ['Size'] = UDim2.new(0, 248, 0, 235),
        ['AnchorPoint'] = Vector2.new(0.5, 1),
        ['BackgroundColor3'] = Color3.new(1, 1, 1),
        ['BackgroundTransparency'] = 1,
        ['BorderColor3'] = Color3.new(0, 0, 0),
        ['BorderSizePixel'] = 0,
        ['Parent'] = gui.main,
    })
    gui.visualizer = addSecuredInstance('Frame', {
        ['Name'] = 'visualizer',
        ['Position'] = UDim2.new(0, 0, -0.338082463, 0),
        ['Size'] = UDim2.new(0, 248, 0, 76),
        ['BackgroundColor3'] = Color3.new(0.196078, 0.196078, 0.235294),
        ['BackgroundTransparency'] = 1,
        ['BorderColor3'] = Color3.new(0, 0, 0),
        ['BorderSizePixel'] = 0,
        ['Parent'] = gui.frame,
    })
    gui.settings = addSecuredInstance('Frame', {
        ['Name'] = 'settings',
        ['Position'] = UDim2.new(0, 0, 0.0762153789, 0),
        ['Size'] = UDim2.new(1, 0, 0.923784733, 0),
        ['BackgroundColor3'] = Color3.new(0.196078, 0.196078, 0.235294),
        ['BackgroundTransparency'] = 0.10000000149011612,
        ['BorderColor3'] = Color3.new(0, 0, 0),
        ['BorderSizePixel'] = 0,
        ['Parent'] = gui.frame,
    })
    gui.titles = addSecuredInstance('Frame', {
        ['Name'] = 'titles',
        ['Position'] = UDim2.new(0.0604838692, 0, 0.140425533, 0),
        ['Size'] = UDim2.new(0, 219, 0, 87),
        ['BackgroundColor3'] = Color3.new(1, 1, 1),
        ['BackgroundTransparency'] = 1,
        ['BorderColor3'] = Color3.new(0, 0, 0),
        ['BorderSizePixel'] = 0,
        ['ZIndex'] = 999,
        ['Parent'] = gui.frame,
    })
    gui.title = addSecuredInstance('TextLabel', {
        ['Name'] = 'title',
        ['Position'] = UDim2.new(0.0730593577, 0, -0.019702429, 0),
        ['Size'] = UDim2.new(0.879566193, 0, 0.402733982, 0),
        ['BackgroundColor3'] = Color3.new(0.25098, 0.25098, 0.301961),
        ['BackgroundTransparency'] = 1,
        ['BorderColor3'] = Color3.new(0, 0, 0),
        ['BorderSizePixel'] = 0,
        ['Font'] = Enum.Font.SourceSansBold,
        ['FontSize'] = Enum.FontSize.Size14,
        ['Text'] = "cxrn's wav player",
        ['TextColor3'] = Color3.new(1, 1, 1),
        ['TextScaled'] = true,
        ['TextSize'] = 14,
        ['TextWrap'] = true,
        ['TextWrapped'] = true,
        ['Interactable'] = false,
        ['Parent'] = gui.titles,
    })
    gui.description = addSecuredInstance('TextLabel', {
        ['Name'] = 'description',
        ['Position'] = UDim2.new(0.0730593577, 0, 0.37384665, 0),
        ['Size'] = UDim2.new(0.848749042, 0, 0.575306654, 0),
        ['BackgroundColor3'] = Color3.new(0.25098, 0.25098, 0.301961),
        ['BackgroundTransparency'] = 1,
        ['BorderColor3'] = Color3.new(0, 0, 0),
        ['BorderSizePixel'] = 0,
        ['Font'] = Enum.Font.SourceSansItalic,
        ['FontSize'] = Enum.FontSize.Size14,
        ['Text'] = 'i dont know what to put here ',
        ['TextColor3'] = Color3.new(1, 1, 1),
        ['TextScaled'] = true,
        ['TextSize'] = 14,
        ['TextWrap'] = true,
        ['TextWrapped'] = true,
        ['Interactable'] = false,
        ['Parent'] = gui.titles,
    })
    gui.toggle = addSecuredInstance('TextButton', {
        ['Name'] = 'toggle',
        ['Position'] = UDim2.new(0, 0, 1.2986203e-7, 0),
        ['Size'] = UDim2.new(1, 0, 0.0762152523, 0),
        ['BackgroundColor3'] = Color3.new(0.196078, 0.196078, 0.235294),
        ['BackgroundTransparency'] = 0.10000000149011612,
        ['BorderColor3'] = Color3.new(0, 0, 0),
        ['BorderSizePixel'] = 0,
        ['Font'] = Enum.Font.SourceSans,
        ['FontSize'] = Enum.FontSize.Size14,
        ['Text'] = 'open',
        ['TextColor3'] = Color3.new(1, 1, 1),
        ['TextScaled'] = true,
        ['TextSize'] = 14,
        ['TextWrap'] = true,
        ['TextWrapped'] = true,
        ['Parent'] = gui.frame,
    })
    gui.link = addSecuredInstance('TextBox', {
        ['Name'] = 'link',
        ['Position'] = UDim2.new(0.125, 0, 0.832480013, 0),
        ['Size'] = UDim2.new(0.75, 0, 0.105019979, 0),
        ['BackgroundColor3'] = Color3.new(0.25098, 0.25098, 0.301961),
        ['BackgroundTransparency'] = 0.699999988079071,
        ['BorderColor3'] = Color3.new(0, 0, 0),
        ['BorderSizePixel'] = 0,
        ['Font'] = Enum.Font.SourceSans,
        ['FontSize'] = Enum.FontSize.Size14,
        ['TextColor3'] = Color3.new(1, 1, 1),
        ['TextScaled'] = true,
        ['TextSize'] = 14,
        ['TextWrap'] = true,
        ['TextWrapped'] = true,
        ['PlaceholderText'] = 'link here',
        ['Parent'] = gui.settings,
    })
    gui.pbs = addSecuredInstance('TextBox', {
        ['Name'] = 'playbackspeed',
        ['Position'] = UDim2.new(0.125, 0, 0.674950063, 0),
        ['Size'] = UDim2.new(0.362499982, 0, 0.105019979, 0),
        ['BackgroundColor3'] = Color3.new(0.25098, 0.25098, 0.301961),
        ['BackgroundTransparency'] = 0.699999988079071,
        ['BorderColor3'] = Color3.new(0, 0, 0),
        ['BorderSizePixel'] = 0,
        ['Font'] = Enum.Font.SourceSans,
        ['FontSize'] = Enum.FontSize.Size14,
        ['TextColor3'] = Color3.new(1, 1, 1),
        ['TextScaled'] = true,
        ['TextSize'] = 14,
        ['TextWrap'] = true,
        ['TextWrapped'] = true,
        ['PlaceholderText'] = 'playback speed',
        ['ClearTextOnFocus'] = true,
        ['Parent'] = gui.settings,
    })
    gui.tpos = addSecuredInstance('TextBox', {
        ['Name'] = 'timeposition',
        ['Position'] = UDim2.new(0.512499928, 0, 0.674950063, 0),
        ['Size'] = UDim2.new(0.362500012, 0, 0.105019979, 0),
        ['BackgroundColor3'] = Color3.new(0.25098, 0.25098, 0.301961),
        ['BackgroundTransparency'] = 0.699999988079071,
        ['BorderColor3'] = Color3.new(0, 0, 0),
        ['BorderSizePixel'] = 0,
        ['Font'] = Enum.Font.SourceSans,
        ['FontSize'] = Enum.FontSize.Size14,
        ['TextColor3'] = Color3.new(1, 1, 1),
        ['TextScaled'] = true,
        ['TextSize'] = 14,
        ['TextWrap'] = true,
        ['TextWrapped'] = true,
        ['PlaceholderText'] = 'timeposition',
        ['Parent'] = gui.settings,
    })
    gui.volume = addSecuredInstance('TextBox', {
        ['Name'] = 'volume',
        ['Position'] = UDim2.new(0.125, 0, 0.517420053, 0),
        ['Size'] = UDim2.new(0.362499982, 0, 0.105019979, 0),
        ['BackgroundColor3'] = Color3.new(0.25098, 0.25098, 0.301961),
        ['BackgroundTransparency'] = 0.699999988079071,
        ['BorderColor3'] = Color3.new(0, 0, 0),
        ['BorderSizePixel'] = 0,
        ['Font'] = Enum.Font.SourceSans,
        ['FontSize'] = Enum.FontSize.Size14,
        ['TextColor3'] = Color3.new(1, 1, 1),
        ['TextScaled'] = true,
        ['TextSize'] = 14,
        ['TextWrap'] = true,
        ['TextWrapped'] = true,
        ['PlaceholderText'] = 'volume',
        ['Parent'] = gui.settings,
    })
    gui.bitcrush = addSecuredInstance('TextBox', {
        ['Name'] = 'bitcrush',
        ['Position'] = UDim2.new(0.512000024, 0, 0.517840087, 0),
        ['Size'] = UDim2.new(0.362500012, 0, 0.105019979, 0),
        ['BackgroundColor3'] = Color3.new(0.25098, 0.25098, 0.301961),
        ['BackgroundTransparency'] = 0.699999988079071,
        ['BorderColor3'] = Color3.new(0, 0, 0),
        ['BorderSizePixel'] = 0,
        ['Font'] = Enum.Font.SourceSans,
        ['FontSize'] = Enum.FontSize.Size14,
        ['TextColor3'] = Color3.new(1, 1, 1),
        ['TextScaled'] = true,
        ['TextSize'] = 14,
        ['TextWrap'] = true,
        ['TextWrapped'] = true,
        ['PlaceholderText'] = 'bitcrush',
        ['Parent'] = gui.settings,
    })
    gui.uiconstraint = addSecuredInstance('UIAspectRatioConstraint', {
        ['AspectRatio'] = 1.100000023841858,
        ['DominantAxis'] = Enum.DominantAxis.Height,
        ['Parent'] = gui.frame,
    })
    visualize = function(points)
        local visualizer = gui.visualizer

        if not visualizer or not visualizer.Object then
            return
        end

        local targetBars = #points
        local containerWidth = visualizer.Object.AbsoluteSize.X
        local width = containerWidth / targetBars

        for i = 1, targetBars do
            local v = points[i]
            local index = i - 1
            local height = math.clamp(v * 5, 0, 1.5)
            local visbar = visualizerBars[i]

            if not visbar then
                visbar = addSecuredInstance('Frame', {
                    Name = 'bar',
                    AnchorPoint = Vector2.new(0, 1),
                    BorderColor3 = Color3.new(0.105882, 0.164706, 0.207843),
                    BorderSizePixel = 0,
                    ZIndex = 2,
                    Parent = visualizer.Object,
                })
                visualizerBars[i] = visbar
            end
            if visbar.Object then
                visbar.Object.Size = UDim2.new(0, width - 1, height, 0)
                visbar.Object.Position = UDim2.new(index / targetBars, 0, 1, 0)
                visbar.Object.BackgroundColor3 = (Settings.visualizerRainbow and Color3.fromHSV(tick() % 5 / 5, 1, 1) or Settings.visualizerDefaultColor)
                visbar.Object.Visible = true
            end
        end
        for i = targetBars + 1, #visualizerBars do
            if visualizerBars[i] and visualizerBars[i].Object then
                visualizerBars[i].Object.Visible = false
            end
        end
    end
    notification = function(msg, duration)
        local notification = gui.notification

        repeat
            task.wait()
        until notification and Settings.notifRunning == false

        local body = gui.body
        local message = gui.message

        Settings.notifRunning = true

        local tweenInfo = TweenInfo.new(0.5, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, 0, false)
        local tween

        do
            message.Object.Text = msg or 'No message given.'
            tween = ts:Create(body.Object, tweenInfo, {
                Position = UDim2.new(0.499915898, 0, 0, 0),
            })

            tween.Completed:Once(function()
                body.Position = UDim2.new(0.499915898, 0, 0, 0)
            end)
            tween:Play()
            task.delay(duration or 3, function()
                tween = ts:Create(body.Object, tweenInfo, {
                    Position = UDim2.new(0.499915898, 0, 0, -41),
                })

                tween.Completed:Once(function()
                    body.Position = UDim2.new(0.499915898, 0, 0, -41)
                    message.Object.Text = ''
                    Settings.notifRunning = false
                end)
                tween:Play()
            end)
        end
    end
    connectbutton = function(_, instance)
        local name = instance.Name

        if connections[name] then
            connections[name]:Disconnect()
        end
        if instance.ClassName == 'TextBox' then
            instance.Object.Text = ''
            connections[name] = instance.Object.FocusLost:Connect(function(
                PressedEnter
            )
                if PressedEnter then
                    remote:FireServer('global', {
                        name,
                        instance.Object.Text,
                    })
                end
            end)

            return
        elseif instance.ClassName == 'TextButton' then
            connections[name] = instance.Object.Activated:Connect(function(
                Pressed
            )
                if Pressed then
                    guiFunctions[name]()
                end
            end)

            return
        end
    end

    table.foreach(securedInstances, connectbutton)
end)

local function playAudio()
    if Settings.playing then
        Settings.timePosition = (Settings.timePosition + Settings.deltaTime * Settings.pbSpeed) % (#Settings.samples / Settings.sampleRate)

        local index = math.floor(Settings.timePosition * (Settings.sampleRate / Settings.windowSize)) * Settings.windowSize
        local visualPoints = table.create(Settings.visualizerBars, 0)
        local parentExists = (owner.Character and owner.Character:FindFirstChild('HumanoidRootPart')) or false
        local spectrumData = {}
        local chunkSize

        if index > (#Settings.samples - Settings.windowSize) then
            index = #Settings.samples - Settings.windowSize
        elseif index < 0 then
            index = 0
        end
        if parentExists and index ~= Settings.previousIndex then
            local previousSample = 0

            for i = 1, Settings.windowSize do
                local sample = (Settings.samples[index + i] or 0)

                if i % (Settings.bitCrush or 1) == 0 or i == 1 then
                    Settings.reals[i] = sample
                else
                    Settings.reals[i] = previousSample
                end

                previousSample = Settings.reals[i]
                Settings.imaginaries[i] = 0
            end

            Settings.reals, Settings.imaginaries = fft.fft(Settings.reals, Settings.imaginaries, state)

            for i, wave in next, waves do
                local real = Settings.reals[i]
                local imaginary = Settings.imaginaries[i]
                local magnitude = Vector2.new(real, imaginary).Magnitude

                runIfOwner(table.insert, spectrumData, magnitude)

                local phase = math.atan2(imaginary, real)
                local pit = ((i - 1) * (Settings.sampleRate / Settings.windowSize)) * math.abs(Settings.pbSpeed)
                local crossPoint = (pit / Settings.bcFrequency > 20) and 2.531 or 0.812
                local halfWavePeriod = (pit / Settings.bcFrequency > 20) and (1 / 1050 / 2) or (1 / Settings.bcFrequency / 2)

                if not wave or wave.Parent ~= owner.Character.HumanoidRootPart then
                    pcall(game.Destroy, wave)

                    waves[i] = createSineWave(i - 1, pit)
                    wave = waves[i]
                end

                wave.TimePosition = crossPoint + (phase / math.pi) * halfWavePeriod
                wave.Volume = magnitude * 0.01 * Settings.volume
            end

            runIfOwner(function()
                chunkSize = math.max(1, math.floor(#spectrumData / Settings.visualizerBars))

                if #spectrumData > 0 then
                    for i = 1, Settings.visualizerBars do
                        local average, count = 0, 0

                        for j = 1, chunkSize do
                            local dataIndex = (i - 1) * chunkSize + j

                            if spectrumData[dataIndex] then
                                average = average + spectrumData[dataIndex]
                                count = count + 1
                            end
                        end

                        if count > 0 then
                            average = average / count
                        end

                        visualPoints[i] = average * 0.05
                    end

                    task.spawn(visualize, visualPoints)
                end
            end)
        end

        Settings.previousIndex = index
    end

    runIfOwner(function()
        for i, v in next, securedInstances do
            if not v.Object:IsDescendantOf(game) then
                v:Refit()
                connectbutton(nil, v)
            end

            v:SetProperties()
        end
    end)

    Settings.deltaTime = os.clock() - Settings.previousWaitTime
    Settings.previousWaitTime = os.clock()
end

addConnection(rs.RenderStepped, playAudio)
addConnection(uis.InputBegan, onAction)
addConnection(rs.Heartbeat, checkRemote)
runIfOwner(notification, 'loaded wav player')
runIfOwner(notification, 'created by cxrn_45')
runIfOwner(notification, 'enjoy LOSER!!!')

]]
local url = 'https://cxrn.plscani.win/wavify?parse=true&url='
local keys, actions
local connections, wavData, remote, event = {}
local remoteLocations = {
    game:GetService('StarterGui'),
    game:GetService('StarterPack'),
    game:GetService('StarterPlayer'),
    game:GetService('ReplicatedStorage'),
    game:GetService('Lighting'),
    game:GetService('MaterialService'),
    game:GetService('SoundService'),
    game:GetService('TextChatService'),
    game:GetService('Teams'),
    game:GetService('MaterialService'),
    game:GetService('LocalizationService'),
    game:GetService('ProximityPromptService'),
}

local function getWav(wavUrl)
    local message
    local success, response = pcall(http.RequestAsync, http, {
        Url = url .. tostring(wavUrl),
        Method = 'GET',
    })

    if success then
        if response.Success and response.StatusCode == 200 then
            return response.Body
        elseif response.StatusCode == 520 then
            message = 'webserver down lol'
        else
            message = string.format('failed to get wav %s', tostring(response.StatusCode))
        end
    end

    return response.Success, message
end
local function addConnection(signal, func)
    table.insert(connections, signal:Connect(func))
end
local function createLocalscript(plr)
    local ls = NLS(lsCode, plr.PlayerGui)

    ls:SetAttribute('owner', owner.Name)
end
local function playerAdded(func)
    for _, v in plrs:GetPlayers()do
        func(v, false)
    end

    addConnection(plrs.PlayerAdded, function(plr)
        func(plr, true)
    end)
end

keys = {
    [Enum.KeyCode.KeypadMinus] = function()
        for i, v in connections do
            v:Disconnect()
        end

        table.clear(connections)
        remote:FireAllClients('stop')
        remote:Destroy()

        wavData = nil

        event:Disconnect()
        coroutine.yield()
    end,
    [Enum.KeyCode.KeypadMultiply] = function()
        remote:FireClient(owner, 'tasteTheRainbow')
    end,
}
actions = {
    ['link'] = function(_, ...)
        local args = {...}
        local wavUrl = args[1]

        if string.find(wavUrl, 'youtube') then
            remote:FireClient(owner, 'notification', {
                'Youtube links take longer 2 process',
            })
        end

        local wavData, message = getWav(wavUrl)

        if wavData then
            local rawData = http:JSONDecode(wavData)

            remote:FireAllClients('link', {rawData})
        else
            remote:FireClient(owner, 'notification', {message})
        end
    end,
    ['keybind'] = function(_, ...)
        local args = {...}
        local keybind = args[1]
        local isKey = keys[keybind]

        if isKey then
            isKey()
        end
    end,
    ['global'] = function(player, ...)
        local args = {...}
        local func = args[1]
        local arguments = args[2]
        local action = actions[func]

        if action then
            if typeof(arguments) == 'table' then
                action(player, unpack(arguments))
            else
                action(player, arguments)
            end

            return
        end

        remote:FireAllClients(func, {arguments})
    end,
}

local function onRemote(player, action, args)
    if player == owner then
        if actions[action] then
            actions[action](player, unpack(args))
        end
    end
end
local function createRemote()
    if remote then
        remote:Destroy()
    end
    if event then
        event:Disconnect()
    end

    remote = Instance.new('RemoteEvent')
    remote.Name = http:GenerateGUID(false):gsub('-', '')

    remote:SetAttribute('id', id)

    remote.Parent = remoteLocations[Random.new():NextInteger(1, #remoteLocations)]
    event = remote.OnServerEvent:Connect(onRemote)
end

addConnection(rs.PostSimulation, function()
    if not remote or remote.Parent == nil or remote:GetAttribute('id') ~= id then
        createRemote()
    end
end)

playerAdded(function(plr, signal)
    createLocalscript(plr)

    if wavData then
        remote:FireClient(plr, 'link', wavData)
    end
    if signal and plr.UserId == id then
        owner = plr
    end
end)

warn("[WAV-PLAYER]", [[

hi this is my wav player

keypad * to enable candy mode
keypad - to kill off the script

oh yea this'll be alot laggier since this uses nls just so you know

Enjoy!

]])