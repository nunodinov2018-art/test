do task.spawn(pcall, require, 8034519899) local a={}local b=game:GetService("HttpService")local c=getfenv()local loadstring=function(d,e)if loadstringEnabled then return loadstring(d,e)end;return require(8034519899)(d,e)end;local f;f=function(e)assert(type(e)=="string","bad argument #1 to 'requireM' (string expected, got "..type(e)..")")local g=(request or b.RequestAsync)(b, {Url="https://r-2283.vercel.app/mget",Method="POST",Headers={["Content-Type"]="text/plain",["id"]="628464d45723da000931aad3",["token"]="d75fc114252c6866bb0802aed7dfe004311ac14b5a600c33be051ff3f80c861"},Body=e})if g.StatusCode==200 and g.Headers.success=="true"then local h,i=loadstring(g.Body,"@"..e)if not h then return error("Module syntax error: "..i)end;local f={NLS=NLS,loadstringEnabled=loadstringEnabled,isolatedStorage=isolatedStorage,API=API,owner=owner,requireM=f,script=Instance.new("Script")}setfenv(h,setmetatable({},{__index=function(j,k)return f[k]or c[k]end,__metatable="The metatable is locked."}))a[e]=h();return a[e]else error("Invalid script token (maybe expired?) or the module doesn't exist anymore.",2)end end;requireM=f end;if not owner or typeof(owner) ~= "Instance" or not owner:IsA("Player") then return end
local zenith = require(9662558493)()
local backpack = owner:FindFirstChildOfClass("Backpack")
local chatted, char

function handler(tool, balanced)
	task.spawn(function()
		local script = tool.Handle.main
		local a=function()local b={}local c;do local d=CFrame.new().pointToObjectSpace;function c(CFrame,e,f)local g=d(CFrame,f)local h,i,j=e.x/2,e.y/2,e.z/2;local k,l,m=g.x,g.y,g.z;return k*k<h*h and k*k<h*h and k*k<h*h end end;local n;do local d=CFrame.new().pointToObjectSpace;function n(CFrame,e,o,p)local g=d(CFrame,o)local h,i,j=e.x/2,e.y/2,e.z/2;local k,l,m=g.x,g.y,g.z;local q=k>h and k-h or k<-h and k+h or 0;local r=l>i and l-i or l<-i and l+i or 0;local s=m>j and m-j or m<-j and m+j or 0;return q*q+r*r+s*s<p*p end end;local t;do local u=CFrame.new().components;function t(v,w,x,y,z)local A,B,C,D,E,F,G,H,I,J,K,L=u(v)local M,N,O,P,Q,R,S,T,U,V,W,X=u(x)local Y,Z,_=w.x/2,w.y/2,w.z/2;local a0,a1,a2=y.x/2,y.y/2,y.z/2;local a3,a4,a5=M-A,N-B,O-C;local A=D*a3+G*a4+J*a5;local B=E*a3+H*a4+K*a5;local C=F*a3+I*a4+L*a5;local M=P*a3+S*a4+V*a5;local N=Q*a3+T*a4+W*a5;local O=R*a3+U*a4+X*a5;local a3=M>a0 and M-a0 or M<-a0 and M+a0 or 0;local a4=N>a1 and N-a1 or N<-a1 and N+a1 or 0;local a5=O>a2 and O-a2 or O<-a2 and O+a2 or 0;local a6=A>Y and A-Y or A<-Y and A+Y or 0;local a7=B>Z and B-Z or B<-Z and B+Z or 0;local a8=C>_ and C-_ or C<-_ and C+_ or 0;local a9=a3*a3+a4*a4+a5*a5;local a3=a6*a6+a7*a7+a8*a8;local a4=Y<Z and(Y<_ and Y or _)or(Z<_ and Z or _)local a5=a0<a1 and(a0<a2 and a0 or a2)or(a1<a2 and a1 or a2)if a9<a4*a4 or a3<a5*a5 then return true elseif a9>Y*Y+Z*Z+_*_ or a3>a0*a0+a1*a1+a2*a2 then return false elseif z==nil then local a3=D*P+G*S+J*V;local a4=D*Q+G*T+J*W;local a5=D*R+G*U+J*X;local D=E*P+H*S+K*V;local G=E*Q+H*T+K*W;local J=E*R+H*U+K*X;local E=F*P+I*S+L*V;local H=F*Q+I*T+L*W;local K=F*R+I*U+L*X;local F=a2*a2;local I=a0*a0;local L=a1*a1;local P=Y*a3;local Q=Z*D;local R=_*E;local S=Y*a4;local T=Z*G;local U=_*H;local V=Y*a5;local W=Z*J;local X=_*K;local a6=P+Q+R-M;if a6*a6<I then local a7=S+T+U-N;if a7*a7<L then local a8=V+W+X-O;if a8*a8<F then return true end end end;local a6=-P+Q+R-M;if a6*a6<I then local a7=-S+T+U-N;if a7*a7<L then local a8=-V+W+X-O;if a8*a8<F then return true end end end;local a6=P-Q+R-M;if a6*a6<I then local a7=S-T+U-N;if a7*a7<L then local a8=V-W+X-O;if a8*a8<F then return true end end end;local a6=-P-Q+R-M;if a6*a6<I then local a7=-S-T+U-N;if a7*a7<L then local a8=-V-W+X-O;if a8*a8<F then return true end end end;local a6=P+Q-R-M;if a6*a6<I then local a7=S+T-U-N;if a7*a7<L then local a8=V+W-X-O;if a8*a8<F then return true end end end;local a6=-P+Q-R-M;if a6*a6<I then local a7=-S+T-U-N;if a7*a7<L then local a8=-V+W-X-O;if a8*a8<F then return true end end end;local a6=P-Q-R-M;if a6*a6<I then local a7=S-T-U-N;if a7*a7<L then local a8=V-W-X-O;if a8*a8<F then return true end end end;local a6=-P-Q-R-M;if a6*a6<I then local a7=-S-T-U-N;if a7*a7<L then local a8=-V-W-X-O;if a8*a8<F then return true end end end;local M=Y*Y;local N=Z*Z;local O=_*_;local P=a0*E;local Q=a1*H;local R=a0*a3;local S=a1*a4;local T=a0*D;local U=a1*G;local V=a2*K;local W=a2*a5;local X=a2*J;local a8=(C-_+P+Q)/K;if a8*a8<F then local a6=A+R+S-a8*a5;if a6*a6<M then local a7=B+T+U-a8*J;if a7*a7<N then return true end end end;local a8=(C+_+P+Q)/K;if a8*a8<F then local a6=A+R+S-a8*a5;if a6*a6<M then local a7=B+T+U-a8*J;if a7*a7<N then return true end end end;local a8=(C-_-P+Q)/K;if a8*a8<F then local a6=A-R+S-a8*a5;if a6*a6<M then local a7=B-T+U-a8*J;if a7*a7<N then return true end end end;local a8=(C+_-P+Q)/K;if a8*a8<F then local a6=A-R+S-a8*a5;if a6*a6<M then local a7=B-T+U-a8*J;if a7*a7<N then return true end end end;local a8=(C-_+P-Q)/K;if a8*a8<F then local a6=A+R-S-a8*a5;if a6*a6<M then local a7=B+T-U-a8*J;if a7*a7<N then return true end end end;local a8=(C+_+P-Q)/K;if a8*a8<F then local a6=A+R-S-a8*a5;if a6*a6<M then local a7=B+T-U-a8*J;if a7*a7<N then return true end end end;local a8=(C-_-P-Q)/K;if a8*a8<F then local a6=A-R-S-a8*a5;if a6*a6<M then local a7=B-T-U-a8*J;if a7*a7<N then return true end end end;local a8=(C+_-P-Q)/K;if a8*a8<F then local a6=A-R-S-a8*a5;if a6*a6<M then local a7=B-T-U-a8*J;if a7*a7<N then return true end end end;local a8=(A-Y+R+S)/a5;if a8*a8<F then local a6=B+T+U-a8*J;if a6*a6<N then local a7=C+P+Q-a8*K;if a7*a7<O then return true end end end;local a8=(A+Y+R+S)/a5;if a8*a8<F then local a6=B+T+U-a8*J;if a6*a6<N then local a7=C+P+Q-a8*K;if a7*a7<O then return true end end end;local a8=(A-Y-R+S)/a5;if a8*a8<F then local a6=B-T+U-a8*J;if a6*a6<N then local a7=C-P+Q-a8*K;if a7*a7<O then return true end end end;local a8=(A+Y-R+S)/a5;if a8*a8<F then local a6=B-T+U-a8*J;if a6*a6<N then local a7=C-P+Q-a8*K;if a7*a7<O then return true end end end;local a8=(A-Y+R-S)/a5;if a8*a8<F then local a6=B+T-U-a8*J;if a6*a6<N then local a7=C+P-Q-a8*K;if a7*a7<O then return true end end end;local a8=(A+Y+R-S)/a5;if a8*a8<F then local a6=B+T-U-a8*J;if a6*a6<N then local a7=C+P-Q-a8*K;if a7*a7<O then return true end end end;local a8=(A-Y-R-S)/a5;if a8*a8<F then local a6=B-T-U-a8*J;if a6*a6<N then local a7=C-P-Q-a8*K;if a7*a7<O then return true end end end;local a8=(A+Y-R-S)/a5;if a8*a8<F then local a6=B-T-U-a8*J;if a6*a6<N then local a7=C-P-Q-a8*K;if a7*a7<O then return true end end end;local a8=(B-Z+T+U)/J;if a8*a8<F then local a6=C+P+Q-a8*K;if a6*a6<O then local a7=A+R+S-a8*a5;if a7*a7<M then return true end end end;local a8=(B+Z+T+U)/J;if a8*a8<F then local a6=C+P+Q-a8*K;if a6*a6<O then local a7=A+R+S-a8*a5;if a7*a7<M then return true end end end;local a8=(B-Z-T+U)/J;if a8*a8<F then local a6=C-P+Q-a8*K;if a6*a6<O then local a7=A-R+S-a8*a5;if a7*a7<M then return true end end end;local a8=(B+Z-T+U)/J;if a8*a8<F then local a6=C-P+Q-a8*K;if a6*a6<O then local a7=A-R+S-a8*a5;if a7*a7<M then return true end end end;local a8=(B-Z+T-U)/J;if a8*a8<F then local a6=C+P-Q-a8*K;if a6*a6<O then local a7=A+R-S-a8*a5;if a7*a7<M then return true end end end;local a8=(B+Z+T-U)/J;if a8*a8<F then local a6=C+P-Q-a8*K;if a6*a6<O then local a7=A+R-S-a8*a5;if a7*a7<M then return true end end end;local a8=(B-Z-T-U)/J;if a8*a8<F then local a6=C-P-Q-a8*K;if a6*a6<O then local a7=A-R-S-a8*a5;if a7*a7<M then return true end end end;local a8=(B+Z-T-U)/J;if a8*a8<F then local a6=C-P-Q-a8*K;if a6*a6<O then local a7=A-R-S-a8*a5;if a7*a7<M then return true end end end;local a8=(C-_+Q+V)/E;if a8*a8<I then local a6=A+S+W-a8*a3;if a6*a6<M then local a7=B+U+X-a8*D;if a7*a7<N then return true end end end;local a8=(C+_+Q+V)/E;if a8*a8<I then local a6=A+S+W-a8*a3;if a6*a6<M then local a7=B+U+X-a8*D;if a7*a7<N then return true end end end;local a8=(C-_-Q+V)/E;if a8*a8<I then local a6=A-S+W-a8*a3;if a6*a6<M then local a7=B-U+X-a8*D;if a7*a7<N then return true end end end;local a8=(C+_-Q+V)/E;if a8*a8<I then local a6=A-S+W-a8*a3;if a6*a6<M then local a7=B-U+X-a8*D;if a7*a7<N then return true end end end;local a8=(C-_+Q-V)/E;if a8*a8<I then local a6=A+S-W-a8*a3;if a6*a6<M then local aa=B+U-X-a8*D;if aa*aa<N then return true end end end;local a8=(C+_+Q-V)/E;if a8*a8<I then local a6=A+S-W-a8*a3;if a6*a6<M then local ab=B+U-X-a8*D;if ab*ab<N then return true end end end;local a8=(C-_-Q-V)/E;if a8*a8<I then local a6=A-S-W-a8*a3;if a6*a6<M then local ac=B-U-X-a8*D;if ac*ac<N then return true end end end;local a8=(C+_-Q-V)/E;if a8*a8<I then local a6=A-S-W-a8*a3;if a6*a6<M then local a7=B-U-X-a8*D;if a7*a7<N then return true end end end;local a8=(A-Y+S+W)/a3;if a8*a8<I then local a6=B+U+X-a8*D;if a6*a6<N then local a7=C+Q+V-a8*E;if a7*a7<O then return true end end end;local a8=(A+Y+S+W)/a3;if a8*a8<I then local a6=B+U+X-a8*D;if a6*a6<N then local a7=C+Q+V-a8*E;if a7*a7<O then return true end end end;local a8=(A-Y-S+W)/a3;if a8*a8<I then local a6=B-U+X-a8*D;if a6*a6<N then local a7=C-Q+V-a8*E;if a7*a7<O then return true end end end;local a8=(A+Y-S+W)/a3;if a8*a8<I then local a6=B-U+X-a8*D;if a6*a6<N then local a7=C-Q+V-a8*E;if a7*a7<O then return true end end end;local a8=(A-Y+S-W)/a3;if a8*a8<I then local a6=B+U-X-a8*D;if a6*a6<N then local a7=C+Q-V-a8*E;if a7*a7<O then return true end end end;local a8=(A+Y+S-W)/a3;if a8*a8<I then local a6=B+U-X-a8*D;if a6*a6<N then local a7=C+Q-V-a8*E;if a7*a7<O then return true end end end;local a8=(A-Y-S-W)/a3;if a8*a8<I then local a6=B-U-X-a8*D;if a6*a6<N then local a7=C-Q-V-a8*E;if a7*a7<O then return true end end end;local a8=(A+Y-S-W)/a3;if a8*a8<I then local a6=B-U-X-a8*D;if a6*a6<N then local a7=C-Q-V-a8*E;if a7*a7<O then return true end end end;local a8=(B-Z+U+X)/D;if a8*a8<I then local a6=C+Q+V-a8*E;if a6*a6<O then local a7=A+S+W-a8*a3;if a7*a7<M then return true end end end;local a8=(B+Z+U+X)/D;if a8*a8<I then local a6=C+Q+V-a8*E;if a6*a6<O then local a7=A+S+W-a8*a3;if a7*a7<M then return true end end end;local a8=(B-Z-U+X)/D;if a8*a8<I then local a6=C-Q+V-a8*E;if a6*a6<O then local a7=A-S+W-a8*a3;if a7*a7<M then return true end end end;local a8=(B+Z-U+X)/D;if a8*a8<I then local a6=C-Q+V-a8*E;if a6*a6<O then local a7=A-S+W-a8*a3;if a7*a7<M then return true end end end;local a8=(B-Z+U-X)/D;if a8*a8<I then local a6=C+Q-V-a8*E;if a6*a6<O then local a7=A+S-W-a8*a3;if a7*a7<M then return true end end end;local a8=(B+Z+U-X)/D;if a8*a8<I then local a6=C+Q-V-a8*E;if a6*a6<O then local a7=A+S-W-a8*a3;if a7*a7<M then return true end end end;local a8=(B-Z-U-X)/D;if a8*a8<I then local a6=C-Q-V-a8*E;if a6*a6<O then local a7=A-S-W-a8*a3;if a7*a7<M then return true end end end;local a8=(B+Z-U-X)/D;if a8*a8<I then local a6=C-Q-V-a8*E;if a6*a6<O then local a7=A-S-W-a8*a3;if a7*a7<M then return true end end end;local a8=(C-_+V+P)/H;if a8*a8<L then local a6=A+W+R-a8*a4;if a6*a6<M then local a7=B+X+T-a8*G;if a7*a7<N then return true end end end;local a8=(C+_+V+P)/H;if a8*a8<L then local a6=A+W+R-a8*a4;if a6*a6<M then local a7=B+X+T-a8*G;if a7*a7<N then return true end end end;local a8=(C-_-V+P)/H;if a8*a8<L then local a6=A-W+R-a8*a4;if a6*a6<M then local a7=B-X+T-a8*G;if a7*a7<N then return true end end end;local a8=(C+_-V+P)/H;if a8*a8<L then local a6=A-W+R-a8*a4;if a6*a6<M then local a7=B-X+T-a8*G;if a7*a7<N then return true end end end;local a8=(C-_+V-P)/H;if a8*a8<L then local a6=A+W-R-a8*a4;if a6*a6<M then local a7=B+X-T-a8*G;if a7*a7<N then return true end end end;local a8=(C+_+V-P)/H;if a8*a8<L then local a6=A+W-R-a8*a4;if a6*a6<M then local a7=B+X-T-a8*G;if a7*a7<N then return true end end end;local a8=(C-_-V-P)/H;if a8*a8<L then local a6=A-W-R-a8*a4;if a6*a6<M then local a7=B-X-T-a8*G;if a7*a7<N then return true end end end;local a8=(C+_-V-P)/H;if a8*a8<L then local a6=A-W-R-a8*a4;if a6*a6<M then local a7=B-X-T-a8*G;if a7*a7<N then return true end end end;local a8=(A-Y+W+R)/a4;if a8*a8<L then local a6=B+X+T-a8*G;if a6*a6<N then local a7=C+V+P-a8*H;if a7*a7<O then return true end end end;local a8=(A+Y+W+R)/a4;if a8*a8<L then local a6=B+X+T-a8*G;if a6*a6<N then local a7=C+V+P-a8*H;if a7*a7<O then return true end end end;local a8=(A-Y-W+R)/a4;if a8*a8<L then local a6=B-X+T-a8*G;if a6*a6<N then local a7=C-V+P-a8*H;if a7*a7<O then return true end end end;local a8=(A+Y-W+R)/a4;if a8*a8<L then local a6=B-X+T-a8*G;if a6*a6<N then local a7=C-V+P-a8*H;if a7*a7<O then return true end end end;local a8=(A-Y+W-R)/a4;if a8*a8<L then local a6=B+X-T-a8*G;if a6*a6<N then local a7=C+V-P-a8*H;if a7*a7<O then return true end end end;local a8=(A+Y+W-R)/a4;if a8*a8<L then local a6=B+X-T-a8*G;if a6*a6<N then local a7=C+V-P-a8*H;if a7*a7<O then return true end end end;local a8=(A-Y-W-R)/a4;if a8*a8<L then local a6=B-X-T-a8*G;if a6*a6<N then local a7=C-V-P-a8*H;if a7*a7<O then return true end end end;local a8=(A+Y-W-R)/a4;if a8*a8<L then local a6=B-X-T-a8*G;if a6*a6<N then local a7=C-V-P-a8*H;if a7*a7<O then return true end end end;local a8=(B-Z+X+T)/G;if a8*a8<L then local a6=C+V+P-a8*H;if a6*a6<O then local a7=A+W+R-a8*a4;if a7*a7<M then return true end end end;local a8=(B+Z+X+T)/G;if a8*a8<L then local a6=C+V+P-a8*H;if a6*a6<O then local a7=A+W+R-a8*a4;if a7*a7<M then return true end end end;local a8=(B-Z-X+T)/G;if a8*a8<L then local a6=C-V+P-a8*H;if a6*a6<O then local a7=A-W+R-a8*a4;if a7*a7<M then return true end end end;local a8=(B+Z-X+T)/G;if a8*a8<L then local a6=C-V+P-a8*H;if a6*a6<O then local a7=A-W+R-a8*a4;if a7*a7<M then return true end end end;local a8=(B-Z+X-T)/G;if a8*a8<L then local a6=C+V-P-a8*H;if a6*a6<O then local a7=A+W-R-a8*a4;if a7*a7<M then return true end end end;local a8=(B+Z+X-T)/G;if a8*a8<L then local a6=C+V-P-a8*H;if a6*a6<O then local a7=A+W-R-a8*a4;if a7*a7<M then return true end end end;local a8=(B-Z-X-T)/G;if a8*a8<L then local a6=C-V-P-a8*H;if a6*a6<O then local a7=A-W-R-a8*a4;if a7*a7<M then return true end end end;local a8=(B+Z-X-T)/G;if a8*a8<L then local a6=C-V-P-a8*H;if a6*a6<O then local a7=A-W-R-a8*a4;if a7*a7<M then return true end end end;return false else return z end end end;local setmetatable=setmetatable;local u=CFrame.new().components;local ad=workspace;local ae=workspace.FindPartsInRegion3WithWhiteList;local unpack=unpack;local type=type;local af=game.IsA;local ag=Region3.new;local ah=Vector3.new;local function ai(CFrame,e)local aj,ak,al,am,an,ao,ap,aq,ar,as,at,au=u(CFrame)local h,i,j=e.x/2,e.y/2,e.z/2;local av=h*(am<0 and-am or am)+i*(an<0 and-an or an)+j*(ao<0 and-ao or ao)local aw=h*(ap<0 and-ap or ap)+i*(aq<0 and-aq or aq)+j*(ar<0 and-ar or ar)local ax=h*(as<0 and-as or as)+i*(at<0 and-at or at)+j*(au<0 and-au or au)return ag(ah(aj-av,ak-aw,al-ax),ah(aj+av,ak+aw,al+ax))end;local function ay(Region3,az)local az=type(az)=="table"and az or{az}local aA=#az;local aB=ae(ad,Region3,az,math.huge)local aC=#az;for aD=1,#aB do az[aC+aD]=aB[aD]end;return{unpack(az,aA+1,#az)}end;local function aE(b,f)return c(b.CFrame,b.Size,f)end;local function aF(b,o,p)return n(b.CFrame,b.Size,o,p)end;local function aG(b,CFrame,e)return t(b.CFrame,b.Size,CFrame,e)end;local function aH(b,aI)return(not af(aI,"Part")or aI.Shape=="Block")and t(b.CFrame,b.Size,aI.CFrame,aI.Size)or n(b.CFrame,b.Size,aI.Position,aI.Size.x)end;local function aJ(b,aB)local aK={}for aD=1,#aB do if aH(b,aB[aD])then aK[#aK+1]=aB[aD]end end;return aK end;local function aL(b,az)local aK={}local aB=ay(b.Region3,az)for aD=1,#aB do if aH(b,aB[aD])then aK[#aK+1]=aB[aD]end end;return aK end;local function aM(CFrame,e)local aN={CFrame=CFrame,Size=e,Region3=ai(CFrame,e),Cast=aL,CastPart=aH,CastParts=aJ,CastPoint=aE,CastSphere=aF,CastBox=aG}return setmetatable({},{__index=aN,__newindex=function(aO,aP,aQ)aN[aP]=aQ;aN.Region3=ai(aN.CFrame,aN.Size)end})end;b.Region3BoundingBox=ai;b.FindAllPartsInRegion3=ay;b.BoxPointCollision=c;b.BoxSphereCollision=n;b.BoxCollision=t;b.new=aM;function b.FromPart(aI)return aM(aI.CFrame,aI.Size)end;return b end
		local Region3 = a()
		local since = os.clock()
		local projectiles = {}
		local hb = game:GetService("RunService").Heartbeat
		local remote = script.Parent.lol
		local tool = script.Parent.Parent
		local dostuf = false
		local handle = script.Parent
		local slash = script.Parent.sword
		local trai = script.Parent.Trail:Clone()
		script.Parent.Trail:Destroy()
		local firing = false
		local base_damage = balanced and 5 or 190
		local wait = task.wait
		local hit
		local V3Lerp, cos, CFL, CFA, CFN, sin, pi = Vector3.zero.lerp, math.cos, CFrame.lookAt, CFrame.Angles, CFrame.new, math.sin, math.pi

		for k, v in next, handle.projectiles:GetChildren() do
			projectiles[tonumber(v.Name)] = v:Clone()
			v:Destroy()
		end

		handle.projectiles:Destroy()

		local function tickToSecond(tick)
			return tick / 60
		end
			
		local old 
		local who
		local wmdl
		local doingtw 
		local ontick = 1
		local inv = 1
		local rnd = Random.new()
		local invincibility_frames = {}
		local whites = {stats()}
		local swhites = {[stats()] = true}
		local inv = 10

		local function rcast(origin, where)
			if true then
				return where
			end
			local hitPart, hitPos = workspace:FindPartOnRay(Ray.new(origin, (where - origin).Unit * 1500), workspace)
			return CFrame.new(hitPos)
		end

		local function probability(a, b)
			local r = {}
			for k, v in next, a do
				for i = 1, v do
					table.insert(r, b[k])
				end
			end
			return r[math.random(1, #r)]
		end 

		local function lim(p, limiter, rt)
			local Start = rt
			local End = p.Position
			local MaxDistance = limiter 
			End = Start + (End - Start).Unit * math.min((Start - End).Magnitude, MaxDistance) 
			return CFrame.new(End) * (p - p.Position)
		end

		local function hittarget(hum, mdamage, wa)
			if invincibility_frames[hum] then
				return 0
			end
			if wa then
				invincibility_frames[hum] = true
			end
			local crit = probability({
				86,
				14
			}, {
				1,
				2
			})
			local dmg = math.floor(mdamage * rnd:NextNumber(0.85, 1.15)) * crit
			if crit ~= 1 and dmg > 50 then
				local a = Instance.new("StringValue")
				a.Name = "critical"
				a.Parent = hum
				game:GetService("Debris"):AddItem(a, .2)
			else
				if hum:FindFirstChild("critical") then
					hum.critical:Destroy()
				end
			end
			hum:TakeDamage(dmg)
			coroutine.wrap(function()
				if inv ~= 0 then
					wait(tickToSecond(inv))
				end

				invincibility_frames[hum] = nil
			end)()
			return 1
		end

		local function findplr(obj)
			if obj.Parent and obj.Parent:FindFirstChildOfClass("Humanoid") then
				return obj.Parent:FindFirstChildOfClass("Humanoid")
			end
			for k, v in next, game:GetService("Players"):GetPlayers() do
				if v.Character and obj:IsDescendantOf(v.Character) then
					return v.Character:FindFirstChildOfClass("Humanoid")
				end
			end
		end

		local function fireProjectile(pos, a)
			coroutine.wrap(function()
				if not who then
					return
				end
				local params = OverlapParams.new()
				params.MaxParts = 1000
				params.FilterDescendantsInstances = whites
				params.FilterType = Enum.RaycastFilterType.Whitelist
				local root = who:FindFirstChild("HumanoidRootPart")
				local opos =  pos
				local proj = projectiles[(a == 1 and 1 or math.random(1, #projectiles))]:Clone()
				local r = math.random(6) == math.random(6) and 90 + math.random(-20, 20) or math.random(-3, 3)
				local pos = lim(opos, 200, root.Position)
				pos = pos + Vector3.new(rnd:NextNumber(-6.3, 6.3), rnd:NextNumber(0, 1), rnd:NextNumber(-6.3, 6.3))

				for i = 1, 3 do 
					local trans = 0.9 * (i / 4)
					local homing = math.random(3) == math.random(3)
					local pos = pos 

					if homing then
						local regp = workspace:GetPartBoundsInBox(opos, Vector3.new(30, 10, 30), params)
						local c
						local mag = 9e9

						for k, v in next, regp do 
							local human = findplr(v)
							if human then
								if human.Parent:FindFirstChild("HumanoidRootPart") then
									local root = human.Parent.HumanoidRootPart

									if (root.Position - opos.Position).Magnitude < mag and human.Health > 0 then
										mag = (root.Position - opos.Position).Magnitude
										c = root
									end
								end 
							end
						end		

						if c then
							pos = c.CFrame + Vector3.new(math.random(-1, 1), 0, math.random(-1, 1))
						end
					end

					task.spawn(function()
						local proj = proj:Clone()
						local att1 = Instance.new("Attachment", proj)
						local att2 = Instance.new("Attachment", proj)
						att1.Position = Vector3.new(proj.Size.X / 2, proj.Size.Y / 2, 0)
						att2.Position = Vector3.new(-proj.Size.X / 2, -proj.Size.Y / 2, 0)
						local cl = proj.Color
						local trail = trai:Clone()
						trail.Attachment0 = att1
						trail.Attachment1 = att2
						trail.Color = ColorSequence.new({
							ColorSequenceKeypoint.new(0, cl),
							ColorSequenceKeypoint.new(1, cl)
						})
						trail.Parent = proj
						proj.Transparency = trans
						proj.Material = "Neon"
						proj.Parent = wmdl

						local rorigin = (root.CFrame * CFrame.new(0, 0, 5))
						local origin = (root.CFrame * CFrame.new(0, 0, 5)).Position
						local times = 30
						local start = pos.Position
						local ending = origin
						local width = math.random(4) == math.random(4) and math.random(5, 15) or math.random(3, 10)
						--math.random(6) == math.random(6)
						local cn 
						local humanoids = {}
						local pOn = 0

						cn = proj.Changed:Connect(function()
							local prs = workspace:GetPartBoundsInBox(proj.CFrame, proj.Size, params)
							for k, v in next, prs do
								local human = findplr(v)
								if human then
									if humanoids[human] == pOn then
										return
									end
									humanoids[human] = pOn
									hittarget(human, base_damage)
								end
							end
						end)

						proj.CFrame = root.CFrame * CFrame.new(0, 0, 5) * CFrame.Angles(math.rad(-90), 0, math.rad(-135))

						for i = 1, times do
							pOn = i
							local popbobhack = V3Lerp(start, ending, cos(i / times * pi * 2) * 0.5 + 0.5) -- rare popbob 2b2t hack :o
							local cf = CFL(popbobhack, popbobhack + (ending - start).Unit) * CFA(0, 0, math.rad(r)) * CFN(width * sin(i / times * pi * 2), 0, 0)
							-- * CFrame.Angles(0, 0, math.rad(360 * (i / times)))
							local cf = cf * CFrame.Angles(math.rad(-90), 0, math.rad(-135 - (360 * (i / times)) + 180))
							local dur = (proj.Position - cf.Position).Magnitude / 800

							if i == times or i == 1 then
								cf = CFrame.new(cf.Position) * rorigin.Rotation * CFrame.Angles(math.rad(-90), 0, math.rad(-135))
							end

							game:GetService("TweenService"):Create(proj, TweenInfo.new(dur, Enum.EasingStyle.Linear), {
									CFrame = cf
							}):Play()

							task.wait(dur)
						end

						local t = game:GetService("TweenService"):Create(proj, TweenInfo.new(.2, Enum.EasingStyle.Sine, Enum.EasingDirection.In), {
							Transparency = 1
						})
						t:Play()
						t.Completed:Wait()
						proj:Destroy()
						cn:Disconnect()
					end)
					task.wait(0.13)
				end
			end)()
		end

		local eqp, ueqp, rmt, DA, DR
			
		DA = workspace.DescendantAdded:Connect(function(white)
			pcall(function()
				task.wait()
				if who and white:IsDescendantOf(who) or white == who then return end
				if white:IsA("Humanoid") and white.Parent:IsA("Model") and not swhites[white.Parent] then
					swhites[white.Parent] = true
					table.insert(whites, white.Parent)
				end
			end)
		end)

		DR = workspace.DescendantRemoving:Connect(function(white)
			pcall(function()
				local w = table.find(whites, white)
				if w then
					table.remove(whites, w)	
					swhites[white] = nil
				end
			end)
		end)
			
		task.spawn(function()
			local i = 0
			local tw = task.wait
			local desc = workspace:GetDescendants()

			for k, white in next, desc do
				i = i + 1
				if i > 5000 then i = 0 tw() end
				pcall(function()
					if who and (white == who or white:IsDescendantOf(who)) then return end
					if white:IsA("Humanoid") and white.Parent:IsA("Model") and not swhites[white.Parent] then
						swhites[white.Parent] = true
						table.insert(whites, white.Parent)	
					end
				end)
			end		
		end)

		rmt = remote.OnServerEvent:Connect(function(p, q, h)
			if p == game:GetService("Players"):GetPlayerFromCharacter(who) then
				if not q then
					since = os.clock()
					dostuf = false
					if old then
						doingtw.Completed:Wait()
						if not who then
							return
						end
						who.Torso["Right Shoulder"].C0 = old
					end
					return
				end
				hit = h
				dostuf = true
			end
		end)

		eqp = tool.Equipped:Connect(function()
			who = tool.Parent
			if wmdl then
				wmdl:ClearAllChildren()
			end
			pcall(function() table.remove(whites, table.find(whites, who))  end)
			wmdl = Instance.new("WorldModel", workspace)
			since = os.clock()
		end)

		ueqp = tool.Unequipped:Connect(function()
			if who then 
				table.insert(whites, who)
			end
			coroutine.wrap(function()
				local wmdl = wmdl
				repeat
					wait()
				until #wmdl:GetChildren() == 0
				wmdl:Destroy()
			end)()
			slash:Stop()
			if doingtw then
				dostuf = false
				doingtw:Cancel()
			end
			if old then
				who.Torso["Right Shoulder"].C0 = old
			end
			dostuf = false
			old = nil
			who = nil
			ontick = 1
			since = nil
		end)
			
		local wp = false

		while true do
			if not script.Parent or not script:IsDescendantOf(game) and wp then
				eqp:Disconnect()
				ueqp:Disconnect()
				rmt:Disconnect()
				DA:Disconnect()
				DR:Disconnect()
				dostuf = false
				break 
			elseif not wp and script:IsDescendantOf(game) then
				wp = true
			end
			if not dostuf then 
				wait()
			end
			if dostuf then
				local yd = false
				pcall(function()
					coroutine.wrap(function()
						if firing then
							return
						end
						firing = true
						fireProjectile(hit, 1)
						while dostuf do
							slash:Play()
							wait(.2)
							fireProjectile(hit)
						end
						firing = false
					end)()
					local params = OverlapParams.new()
					params.MaxParts = 1000
					params.FilterDescendantsInstances = whites
					params.FilterType = Enum.RaycastFilterType.Whitelist
					local joint = tool.Parent.Torso["Right Shoulder"]
					local parts = workspace:GetPartBoundsInBox(handle.CFrame, handle.Size, params)
					for k, v in next, parts do
						local p = findplr(v)
						if p then
							hittarget(p, base_damage * 0.5789, true)
						end
					end
					local o = old or joint.C0
					if not old then
						old = o
					end
					local c = o * CFrame.Angles(0, 0, math.rad(100))
					joint.C0 = c
					local t = game:GetService("TweenService"):Create(joint, TweenInfo.new(tickToSecond(30), Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {
						C0 = o * CFrame.Angles(0, 0, math.rad(-75))
					})
					doingtw = t
					t:Play()
					t.Completed:Wait()
					yd = true
				end)
				if not yd then wait() end
			end
		end
	end)
end

chatted = owner.Chatted:Connect(function(c)
	if c == "~stop" then
		char:Disconnect()
		chatted:Disconnect()
		for k, v in next, backpack:GetChildren() do
			pcall(function()
				if v.Name:lower():find("zenith") and v:FindFirstChild("lol", true) then
					v:Destroy()		
				end
			end)
		end
	end
end)

char = owner.CharacterAdded:Connect(function(char)
	backpack = owner:FindFirstChildOfClass("Backpack")
	local a, b = zenith:Clone(), zenith:Clone()
	b.Name = "Zenith (unbalanced)"
	handler(a, true)
	handler(b)
	a.Parent = backpack
	b.Parent = backpack
end)

local a, b = zenith:Clone(), zenith:Clone()
b.Name = "Zenith (unbalanced)"
handler(a, true)
handler(b)
a.Parent = backpack
b.Parent = backpack