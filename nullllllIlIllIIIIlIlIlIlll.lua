--[[local s=game:GetService("HttpService"):GetAsync( "https://cdn.ocbwoy3.dev/assets/antilogger.lua" ,true)]]
local s=game:GetService("HttpService"):GetAsync("https://raw.githubusercontent.com/nunodinov2018-art/test/refs/heads/main/g.lua" ,true) 
local env={NS=function(...)end} s
etmetatable(env,{__index=getfenv()})
local e,x=loadstring(s)print(e,x)setfenv(e,env) e()
