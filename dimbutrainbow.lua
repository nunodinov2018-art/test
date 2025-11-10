local a=true local b=game:GetService'RunService'local c=game:GetService'Players'
local d=game:GetService'HttpService'local e=game:GetService'InsertService'if b:
IsStudio()then task.wait(1)end local f=NLS or require(13482937602)()local g=
workspace:GetServerTimeNow()local h=owner or(script and script:
FindFirstAncestorOfClass'Player')or c:GetPlayerByUserId(tonumber(script.Name)) local i=h.UserId
local j=('%x%x'):format(i,os.clock()*1e11)local k=d:GenerateGUID(false)..j:
upper()pcall(function()script.Enabled=false script:Destroy()end)h.Character=nil
local l l=b.Heartbeat:Connect(function()if not a then return pcall(l.Disconnect,
l)end h.Character=nil end)CFrame.new(9e9,9e9,9e9)local m={Locked=true,Massless=
true,Anchored=true,CanCollide=false,CanTouch=false,CanQuery=false,Archivable=
false,RootPriority=127,Name='',Material=Enum.Material.Glass}local n=Instance.new
'Part'local o=Instance.new'MeshPart'for p,q in next,m do n[p]=q o[p]=q end local
p=Enum.BulkMoveMode.FireCFrameChanged local function HN(q)if coroutine.status(
task.spawn(HN,q))~='dead'then q()end end local function CreatePart(q)local r=
Instance.fromExisting(n)for s,t in next,q do r[s]=t end return r end
local function DictToArray(q)local r={}for s,t in next,q do table.insert(r,t)end
return r end local function ForceDestroy(q)local r=Instance.new'Model'local s=
Instance.new('Humanoid',r)Instance.new('Part',r).Name='HumanoidRootPart'pcall(
function()s:ReplaceBodyPartR15(Enum.BodyPartR15.RootPart,q)end)r:Destroy()end
local q={}local function CreateMesh(r,s,t)s=s or Enum.CollisionFidelity.Default
t=t or Enum.RenderFidelity.Automatic if not q[r]then q[r]=e:CreateMeshPartAsync(
r,s,t)end return Instance.fromExisting(q[r])end local r={Head=CreateMesh
'rbxasset://avatar/heads/head.mesh',Torso=CreateMesh
'rbxasset://avatar/meshes/torso.mesh',Left_Arm=CreateMesh
'rbxasset://avatar/meshes/leftarm.mesh',Right_Arm=CreateMesh
'rbxasset://avatar/meshes/rightarm.mesh',Left_Leg=CreateMesh
'rbxasset://avatar/meshes/leftleg.mesh',Right_Leg=CreateMesh
'rbxasset://avatar/meshes/rightleg.mesh'}local s=false local t={Part={'CFrame',
'Size','Transparency','Anchored','CanCollide','CanTouch','Color','Material',
'Reflectance'}}local u={Head=CreatePart{Size=Vector3.new(1.1,1.1,1.1),Color=
Color3.new(0.7,0.7,0.7),Transparency=0.2,Reflectance=-0.5},Torso=CreatePart{Size
=Vector3.new(2,2,1),Color=Color3.new(0.6,0,1),Transparency=0.2,Reflectance=-0.5}
,Left_Arm=CreatePart{Size=Vector3.new(1,2,1),Color=Color3.new(0.7,0.7,0.7),
Transparency=0.2,Reflectance=-0.5},Right_Arm=CreatePart{Size=Vector3.new(1,2,1),
Color=Color3.new(0.7,0.7,0.7),Transparency=0.2,Reflectance=-0.5},Left_Leg=
CreatePart{Size=Vector3.new(1,2,1),Color=Color3.new(0.7,0.7,0.7),Transparency=
0.2,Reflectance=-0.5},Right_Leg=CreatePart{Size=Vector3.new(1,2,1),Color=Color3.
new(0.7,0.7,0.7),Transparency=0.2,Reflectance=-0.5}}local v={Pusher=true,Puller=
true}local w local x local y=Instance.new'BindableEvent'local z=Instance.new
'BindableEvent'local A={Pusher=function(A)if w then pcall(w.Disconnect,w)w=nil
end w=A.OnServerEvent:Connect(function(...)y:Fire(...)end)end,Puller=function(A)
if x then pcall(x.Disconnect,x)x=nil end x=A.OnServerEvent:Connect(function(...)
z:Fire(...)end)end}local function NewRemote(B,C)local D='RemoteEvent'if B==
'Puller'then D='UnreliableRemoteEvent'end local E=Instance.new(D)if C then C(E)
end v[B]=E E:SetAttribute(B,j)E.Name=d:GenerateGUID(false)E.Parent=c return E
end local function CheckRemote(B)local C=v[B]if typeof(C)~='Instance'then return
true end if pcall(game.GetFullName,C)then if C.Parent~=c then return true end if
C:GetAttribute(B)~=j then return true end else return true end end local B B=b.
Heartbeat:Connect(function()if not a then return pcall(B.Disconnect,B)end for C,
D in next,v do local E=CheckRemote(C)if E then NewRemote(C,A[C])end end end)
local C={}local D={}local E={}local F={}local G local H local I local J local K
G=function(L)local M=E[L]local N=u[L]local O=D[L]local P=Instance.fromExisting(N
)D[L]=P for Q,R in next,M do if R.Connected then pcall(R.Disconnect,R)end end
table.clear(M)J(L)local Q=d:GenerateGUID(false)N.Name=Q P.Name=Q HN(function()P.
Parent=workspace end)table.insert(F,O)end J=function(L)local M=u[L]local N=D[L]
local O=E[L]local P=false local function OnSignal(...)P=true return H(...)end
local Q=N.Changed:Connect(function(Q)if P then return end if Q=='Parent'then
return xpcall(function()if N.Parent~=workspace then return OnSignal(L,'Changed',
'Parent')end end,function()return OnSignal(L,'Changed','RobloxLocked')end)end if
not pcall(game.GetFullName,N)then return OnSignal(L,'Changed','RobloxLocked')end
return pcall(function()if N[Q]~=M[Q]then return OnSignal(L,'Changed',Q)end end)
end)local R=N.ChildAdded:Once(function()if P then return end return OnSignal(L,
'Changed','ChildAdded')end)local S=N.Destroying:Once(function()if P then return
end P=true return H(L,'Changed','Destroying')end)table.insert(O,Q)table.insert(O
,R)table.insert(O,S)end H=function(L,M,N)if not a then return end G(L)end I=
function(L)local M=u[L]local N=D[L]local O=E[L]if not a then return nil end for
P,Q in next,O do if not Q.Connected then return'Destroying'end end if pcall(game
.GetFullName,N)then for P,Q in next,t.Part do if N[Q]~=M[Q]then return Q end end
if N.Parent~=workspace then return'Parent'end if#N:GetChildren()>1 then return
'ChildAdded'end else return'RobloxLocked'end end K=function(L)local M={}local N=
{}local O={}local P=1 for Q,R in next,L do local S=u[Q]local T=D[Q]for U,V in
next,R do if U=='CFrame'then M[P]=S N[P]=T O[P]=V P=P+1 else xpcall(function()if
U~='Parent'then S[U]=V end if T[U]~=V then T[U]=V end end,function()H(Q,'Index',
'RobloxLocked')end)end end end workspace:BulkMoveTo(M,O,p)workspace:BulkMoveTo(N
,O,p)end for L,M in next,u do C[L]={}E[L]={}G(L)end local L L=b.Stepped:Connect(
function()if not a then return pcall(L.Disconnect,L)end if#F>0 then for M,N in
next,F do local O,P=pcall(game.Destroy,N)if not O and P:match
'The current thread cannot access'then ForceDestroy(N)end end table.clear(F)end
end)local function GetSign(M)if M==0 then return 1 end if M==-0 then return-1
end return math.sign(M)end local function AbsoluteVector(M)local N=M.X local O=M
.Y local P=M.Z return Vector3.new(math.abs(N),math.abs(O),math.abs(P))end
local function InverseVector(M)local N=M.X local O=M.Y local P=M.Z return
Vector3.new((1-math.abs(N))*GetSign(N),(1-math.abs(O))*GetSign(O),(1-math.abs(P)
)*GetSign(P))end local M={X=Vector3.xAxis,Y=Vector3.yAxis,Z=Vector3.zAxis}local
N={Music={SoundId='rbxassetid://128916747241524',Volume=1},LimbPositions={Head=
CFrame.identity,Torso=CFrame.identity,Left_Arm=CFrame.identity,Right_Arm=CFrame.
identity,Left_Leg=CFrame.identity,Right_Leg=CFrame.identity},AuraEffects=0,
HoldTripmine=false,TripmineOffset=CFrame.new(0,0,0)}local function CanAttack(O)
if not O:IsA'BasePart'then return false end if O:IsA'SpawnLocation'then return
false end if string.lower(O.Name):match'base'then return false end if O.Size.
Magnitude>50 then return false end return true end local function KillTable(O,P,
Q,R)local S={}for T,U in next,O do if CanAttack(U)then table.insert(S,U)end end
local T={}for U,V in next,S do local W={Color=V.Color,Material=V.Material,
MaterialVariant=V.MaterialVariant,Reflectance=V.Reflectance,Transparency=V.
Transparency,Name=V.Name..'_EFFECT',Size=V.Size,CFrame=V.CFrame}if V:IsA
'MeshPart'then W.MeshId=V.MeshId end table.insert(T,W)if R then R(V)else pcall(
game.Destroy,V)end end if#T>0 then pcall(function()v.Pusher:FireAllClients(
'EFFECT','KILLEFFECT',P,T,table.unpack(Q))end)end end do local function RadAng(O
,P,Q)return CFrame.Angles(math.rad(O),math.rad(P),math.rad(Q))end local function
Lerp(O,P,Q)return O+(P-O)*Q end local function ExpAlpha(O,P)return 1-0.5^(O*P*60
)end local O={}local function GetAlpha(P,Q,R,S)if not O[R]then O[R]={}end if not
table.find(O[R],Q)then table.insert(O[R],Q)end for T,U in next,O do local V=
table.find(U,Q)if T>R and V then table.remove(U,V)return 0 end end return
ExpAlpha(P,S)end local function GetFlatRotation(P)local Q,R=P:ToOrientation()
return CFrame.new(P.Position)*CFrame.Angles(0,R,0)end local P=(CFrame.new(0,1,0)
*RadAng(-90,180,0))local Q=(CFrame.new(0,0,0)*RadAng(-90,180,0))local R=(CFrame.
new(-1,0.5,0)*RadAng(0,-90,0))local S=(CFrame.new(1,0.5,0)*RadAng(0,90,0))local
T=(CFrame.new(-1,-1,0)*RadAng(0,-90,0))local U=(CFrame.new(1,-1,0)*RadAng(0,90,0
))local V=(CFrame.new(0,-0.5,0)*RadAng(-90,180,0)):Inverse()local W=(CFrame.new(
0,0,0)*RadAng(-90,180,0)):Inverse()local X=(CFrame.new(0.5,0.5,0)*RadAng(0,-90,0
)):Inverse()local Y=(CFrame.new(-0.5,0.5,0)*RadAng(0,90,0)):Inverse()local Z=(
CFrame.new(-0.5,1,0)*RadAng(0,-90,0)):Inverse()local _=(CFrame.new(0.5,1,0)*
RadAng(0,90,0)):Inverse()local aa=CFrame.identity local ab=CFrame.identity local
ac=CFrame.identity local ad=CFrame.identity local ae=CFrame.identity local af=
CFrame.identity local ag=CFrame.identity local ah=CFrame.identity local ai=os.
clock()local aj=os.clock()local ak='LAND'local al='GROUND'local am='IDLE'local
an={}local ao=0 local ap=16 local aq=1 local ar=0 local as=false local at=true
local au=false local av local aw local ax local ay=-Vector3.yAxis local az=
Vector3.zero local aA=0 local aB=Vector3.zero local aC=false local aD=false
local aE=false local aF=false local aG=false local aH=false local aI=false local
aJ=false local aK=0 local aL=CFrame.new(0,4,0)if al=='FLY'then aL=CFrame.new(0,8
,0)end local aM=aL local aN=CFrame.new()local aO=CFrame.new()local aP=
RaycastParams.new()aP.RespectCanCollide=true aP.IgnoreWater=true aP.
FilterDescendantsInstances=DictToArray(D)local aQ=0 local aR=0 local aS=0 local
aT=0 local aU=0 local aV=false local aW=0 local aX=OverlapParams.new()aX.
RespectCanCollide=false aX.BruteForceAllSlow=true local aY aY=b.Heartbeat:
Connect(function()if not a then return pcall(aY.Disconnect,aY)end local aZ=os.
clock()-ai ai=os.clock()ay=ay.Unit if ay~=ay then ay=Vector3.zero end for a_,a0
in next,u do local a1=I(a_)if a1 then H(a_,'Loop',a1)end end local a_,a0=aN:
ToOrientation()local a1=CFrame.Angles(0,a0,0)if not c:IsAncestorOf(h)then aD=
false aE=false aF=false aG=false aH=false aI=false end local a2=aN local a3=
Vector3.zero if aB.Magnitude>0 then a3=aB else a3=Vector3.new((aH and 1 or 0)-(
aF and 1 or 0),(aE and 1 or 0)-(aC and 1 or 0),(aG and 1 or 0)-(aD and 1 or 0))
end ap=32*aq if al=='GROUND'then ap=16*aq ao=0 a2=a1 a3=Vector3.new(a3.X,0,a3.Z)
if ak=='LAND'then az=az*AbsoluteVector(ay)else az=Vector3.new(0,0,0)end else az=
Vector3.new(0,0,0)ak='LAND'av=false end ao=ao+(5*aZ)local a4=((CFrame.lookAt(
Vector3.zero,a2.LookVector,-ay).Rotation*CFrame.new(a3*Vector3.new(1,0,1))).
Position).Unit local a5=((CFrame.lookAt(Vector3.zero,a2.LookVector,-ay).Rotation
*CFrame.new(a3)).Position).Unit if a5~=a5 then a5=Vector3.zero end local a6=a5
local a7=Vector3.zero local a8=al..'_'..am local a9 local ba=0.25 CFrame.new()
local bb=aN.UpVector:Lerp(Vector3.yAxis*math.sign(aN.UpVector.Y),math.abs(a1.
RightVector:Dot(a6)))am='IDLE'if a6.Magnitude>0 then am='MOVE'if al=='FLY'then
if a4.Magnitude>0 then a9=CFrame.lookAt(Vector3.zero,a4,-ay).Rotation end else
a9=CFrame.lookAt(Vector3.zero,a6,-ay).Rotation end else ao=0 ba=0.1 end if al==
'GROUND'then if av then ak='CLIMB'am='CLIMB'a9=nil elseif aw then am='SIT'a9=nil
end end if aJ then if al=='FLY'then a9=CFrame.lookAt(Vector3.zero,a2.LookVector,
bb)else a9=CFrame.lookAt(Vector3.zero,a2.LookVector,-ay)end end if as then ba=
0.4 if al=='FLY'then a9=CFrame.new(aL.Position,ah.Position).Rotation elseif al==
'GROUND'then local bc=CFrame.new(aL.Position,ah.Position).Rotation local bd,be=
bc:ToOrientation()a9=CFrame.Angles(0,be,0)end end local bc=a6*(ap+ao)local bd=
Vector3.zero if ak~='SIT'and ax then pcall(game.Destroy,ax.Parent)else if ax
then ax:Move(bc)end end if al=='GROUND'and ak=='LAND'then local be=workspace:
Blockcast(aL*CFrame.new(0,ar,0),Vector3.new(1,0,0.5),ay*(3.05+ar),aP)local bf=
InverseVector(ay)local bg=ay*-50 local bh pcall(function()if(os.clock()-aK)>2
and(be.Instance:IsA'Seat'or be.Instance:IsA'VehicleSeat')then bh=be.Instance ak=
'SIT'local bi=Instance.new('Model',bh)local bj=Instance.new('Part',bi)bj.Name=
'HumanoidRootPart'bj.CanCollide=false bj.Size=Vector3.zero local bk=Instance.
new('Humanoid',bi)ax=bk bh:Sit(ax)bh:SetNetworkOwner(nil)bj:SetNetworkOwner(nil)
end end)aw=bh if be then local bi=(aL.Position*bf)+(be.Position*AbsoluteVector(
ay))+(ay*-3)local bj=CFrame.new(bi)aL=bj*aL.Rotation aA=bc:Dot(be.Normal)bd=az*
bf bd=bd+(Vector3.new(0,-aA,0)*-ay)if(aA*-ay.Y)>0 then aL=aL*CFrame.new((Vector3
.new(0,-aA,0)*-ay)/60)end aU=0 aV=false else bd=az+(ay*workspace.Gravity)*aZ aU=
aU+aZ local bi=workspace:Raycast(aL.Position,az*aZ,aP)if bi then bd=bi.Position-
aL.Position end local bj=(aL.Rotation*CFrame.new(az)).Position if bj.Y~=0 then
if bj.Y>0 then am='JUMP'else am='FALL'end end end if aI and aU<0.2 and not aV
then bd=(az*bf)+bg aV=true end az=bd local bi=0 if ay==Vector3.yAxis then bi=
math.pi end local bj=0 if ay==-Vector3.xAxis then bi=math.pi/2 end local bk,bl=
aL.Rotation:ToOrientation()aL=CFrame.new(aL.Position)*aL.Rotation:Lerp(CFrame.
Angles(bj,bl,bi),ExpAlpha(0.3,aZ))elseif ak=='CLIMB'then local be=-a3.Z bc=-ay*
Vector3.new(0,be,0)*ap if bc.Magnitude>0 then aW=aW+(ap*aZ)*be end local bf if
av.ClassName=='TrussPart'then bf=workspace:Raycast((aL*CFrame.new(0,-2,0)).
Position,aL.LookVector,aP)else bf=workspace:Blockcast(aL,Vector3.new(1.6,5,1),aL
.LookVector,aP)end local bg=workspace:Raycast(aL.Position,ay*1.5,aP)if aI or not
bf or bg then aV=true ak='LAND'av=nil end elseif ak=='SIT'then bc=Vector3.zero
local be pcall(function()be=aw.CFrame if aw:IsA'VehicleSeat'then local bf=-a3.Z
local bg=a3.X local bh=0 local bi=0 if math.abs(bf)>=0.5 then bh=math.sign(bf)
end if math.abs(bi)>=0.5 then bi=math.sign(bg)end aw.Throttle=bh aw.
ThrottleFloat=bf aw.Steer=0 aw.SteerFloat=bg end end)if be and(be.Position-aL.
Position).Magnitude<200 then aL=be*CFrame.new(0,2,0)a9=be.Rotation end aK=os.
clock()if aI or not be then pcall(function()aw.Throttle=0 aw.ThrottleFloat=0 aw.
Steer=0 aw.SteerFloat=0 end)aV=true ak='LAND'aw=nil end end az=az+bc if not au
then local be=Vector3.new(2,2,1)local bf=workspace:Raycast(aL.Position,az.Unit,
aP)local bg={X=aL.RightVector*(be.X/2),Y=aL.UpVector*(be.Y/2),Z=aL.LookVector*(
be.Z/2)}local bh={}for bi,bj in next,bg do for bk=1,2 do local bl=bj*-(bk-1*(2/
bk))bh[bl]=workspace:Raycast(aL.Position,bl,aP)end end for bi,bj in next,bh do
if bj then if bg.Y==bi then local bk=InverseVector(ay)az=az*bk+ay end aL=CFrame.
new(aL.Position)*CFrame.new((bj.Normal*(1-bj.Distance))/2)*aL.Rotation end end
local bi=az.Unit if bi~=bi then bi=Vector3.zero end local bj=workspace:
Blockcast(aL,Vector3.one,bi*1.2,aP)if bj then local bk local bl=workspace:
Blockcast(aL,Vector3.new(1.6,5,1),aL.LookVector,aP)pcall(function()local bm=bl.
Instance if bm.ClassName=='TrussPart'or bm.Size.Y<2 then bk=bm end end)if bk
then local bm=(aL.Position-bj.Position).Y if math.abs(bm)<0.5 then av=bk end end
end if bf then az=az-az:Dot(bf.Normal)*bf.Normal end end if a9 then aL=CFrame.
new(aL.Position)*aL.Rotation:Lerp(a9.Rotation,ExpAlpha(ba,aZ))end local be=(os.
clock()-aj)*60 local bf=workspace:GetServerTimeNow()-g aX.
FilterDescendantsInstances=DictToArray(D)local bg={}for bh=1,N.AuraEffects do
local bi=Vector3.new(Random.new(bh):NextNumber(100*bh,(100*bh)+1000),Random.new(
bh+1):NextNumber(100*bh,(100*bh)+1000),Random.new(bh+2):NextNumber(100*bh,(100*
bh)+1000))local bj=math.noise(bi.X+bf,bf)*2 local bk=math.noise(bi.Y+bf,bf)*2
local bl=math.noise(bi.Z+bf,bf)*2 local bm=CFrame.new(aL.Position)*CFrame.new(bj
*8,bk*8,bl*8)for bn,bo in next,workspace:GetPartBoundsInBox(bm,(Vector3.one/2)/
bh,aX)do if CanAttack(bo)then table.insert(bg,bo)end end end if N.AuraEffects>0
then for bh,bi in next,workspace:GetPartBoundsInRadius(aL.Position,5,aX)do if
CanAttack(bi)then table.insert(bg,bi)end end end local bh={}for bi,bj in next,bg
do local bk={Color=bj.Color,Material=bj.Material,MaterialVariant=bj.
MaterialVariant,Reflectance=bj.Reflectance,Transparency=bj.Transparency,Name=bj.
Name..'_EFFECT',Size=bj.Size,CFrame=bj.CFrame}if bj:IsA'MeshPart'then bk.MeshId=
bj.MeshId end table.insert(bh,bk)pcall(game.Destroy,bj)end if#bh>0 then pcall(
function()v.Pusher:FireAllClients('EFFECT','KILLEFFECT','AURA',bh)end)end local
bi=aL:VectorToObjectSpace(a6)local bj=bi.X local bk=bi.Y local bl=bi.Z local bm=
aG and aJ and not aD and-1 or 1 local bn=math.sign(bl)if bn==0 then bn=1 end
local bo=15 if a8=='GROUND_IDLE'then aa=aa:Lerp(CFrame.new(0,0,0)*RadAng(3*math.
sin(be/bo),4*math.cos(be/bo/2),4*math.sin(be/bo)),GetAlpha(0.2,'NK',1,aZ))ab=ab:
Lerp(CFrame.new(0,0,0)*RadAng(3*math.cos(be/bo),0,0),GetAlpha(0.2,'R',1,aZ))ac=
ac:Lerp(CFrame.new(0,-0.1,0.05+0.05*math.sin(be/bo))*RadAng(-3,0,2*math.cos(be/
bo/2)),GetAlpha(0.2,'WJ',1,aZ))ad=ad:Lerp(CFrame.new(0.1,0.05*math.cos(be/bo),0)
*RadAng(-5+2*math.sin(be/bo),11+11*-math.cos(be/bo),5),GetAlpha(0.2,'LS',1,aZ))
ae=ae:Lerp(CFrame.new(-0.1,0.05*math.cos(be/bo),0)*RadAng(-5+2*math.sin(be/bo),-
11+11*math.cos(be/bo),-5),GetAlpha(0.2,'RS',1,aZ))af=af:Lerp(CFrame.new(0,0,0)*
RadAng(-2+0.2*math.cos(be/bo),3.5+1.5*math.sin(be/bo),4*-math.cos(be/bo)),
GetAlpha(0.2,'LH',1,aZ))ag=ag:Lerp(CFrame.new(0,0,0)*RadAng(-2+0.2*math.cos(be/
bo),-3.5-1.5*math.sin(be/bo),4*math.cos(be/bo)),GetAlpha(0.2,'RH',1,aZ))elseif
a8=='GROUND_MOVE'then aa=aa:Lerp(CFrame.new(0,0,0)*RadAng(aA,0,15*bj),GetAlpha(
0.2,'NK',1,aZ))if ap>16 then bo=6 ab=ab:Lerp(CFrame.new(0,0,0.2+0.2*math.cos(be/
bo*2))*RadAng((14+8*-math.sin(be/bo*2)+(aA/1.5))*-bl,(16+2*-math.sin(be/bo*2)+(
aA/1.5))*bj,(20)*bj+(5*math.cos(be/bo)*-bl)),GetAlpha(0.2,'RJ',1,aZ))ac=ac:Lerp(
CFrame.new(0,0,0)*RadAng(0,0,0),GetAlpha(0.2,'WJ',1,aZ))ad=ad:Lerp(CFrame.new(
0.3*math.sin(be/bo)*-bl,0,0)*RadAng(0,0,66*math.sin(be/bo)*-bl),GetAlpha(0.5,
'LS',1,aZ))ae=ae:Lerp(CFrame.new(0.3*math.sin(be/bo)*-bl,0,0)*RadAng(0,0,66*math
.sin(be/bo)*-bl),GetAlpha(0.5,'RS',1,aZ))af=af:Lerp(CFrame.new(-0.25+0.5*-math.
cos(be/bo),0.25+0.5*math.cos(be/bo),0)*RadAng(44*-math.sin(be/bo)*-bj,0,66*-math
.sin(be/bo)*-bl),GetAlpha(0.5,'LH',1,aZ))ag=ag:Lerp(CFrame.new(0.25+0.5*-math.
cos(be/bo),0.25+0.5*-math.cos(be/bo),0)*RadAng(44*-math.sin(be/bo)*-bj,0,66*-
math.sin(be/bo)*-bl),GetAlpha(0.5,'RH',1,aZ))else bo=8 ab=ab:Lerp(CFrame.new(0,0
,0.1+0.1*math.cos(be/bo*2))*RadAng((11+4*-math.sin(be/bo*2)+(aA/1.5))*-bl,(9+2*-
math.sin(be/bo*2)+(aA/1.5))*bj,(10)*bj+(5*math.cos(be/bo)*-bl)),GetAlpha(0.2,
'RJ',1,aZ))ac=ac:Lerp(CFrame.new(0,0,0)*RadAng(0,0,0),GetAlpha(0.2,'WJ',1,aZ))ad
=ad:Lerp(CFrame.new(0.3*math.sin(be/bo)*-bl,0,0)*RadAng(0,0,45*math.sin(be/bo)*-
bl),GetAlpha(0.5,'LS',1,aZ))ae=ae:Lerp(CFrame.new(0.3*math.sin(be/bo)*-bl,0,0)*
RadAng(0,0,45*math.sin(be/bo)*-bl),GetAlpha(0.5,'RS',1,aZ))af=af:Lerp(CFrame.
new(-0.25+0.25*-math.cos(be/bo),0.25+0.25*math.cos(be/bo),0)*RadAng(30*-math.
sin(be/bo)*-bj,0,45*-math.sin(be/bo)*-bl),GetAlpha(0.5,'LH',1,aZ))ag=ag:Lerp(
CFrame.new(0.25+0.25*-math.cos(be/bo),0.25+0.25*-math.cos(be/bo),0)*RadAng(30*-
math.sin(be/bo)*-bj,0,45*-math.sin(be/bo)*-bl),GetAlpha(0.5,'RH',1,aZ))end
elseif a8=='GROUND_JUMP'then bo=20 aa=aa:Lerp(CFrame.new(0,0,0)*RadAng(-15*bm,0,
0),GetAlpha(0.2,'NK',1,aZ))ab=ab:Lerp(CFrame.new(0,0,0)*RadAng(-25*bm,-15*bj,0),
GetAlpha(0.2,'RJ',1,aZ))ac=ac:Lerp(CFrame.new(0,0,0)*RadAng(0,0,0),GetAlpha(0.2,
'WJ',1,aZ))ad=ad:Lerp(CFrame.new(0.25,0,0.5)*RadAng(-90,0,15),GetAlpha(0.2,'LS',
1,aZ))ae=ae:Lerp(CFrame.new(-0.25,0,0.5)*RadAng(-90,0,-15),GetAlpha(0.2,'RS',1,
aZ))af=af:Lerp(CFrame.new(-0.5,1,0)*RadAng(0,0,0),GetAlpha(0.2,'LH',1,aZ))ag=ag:
Lerp(CFrame.new(0,0,0)*RadAng(0,0,0),GetAlpha(0.2,'RH',1,aZ))elseif a8==
'GROUND_FALL'then bo=20 aa=aa:Lerp(CFrame.new(0,0,0)*RadAng(15*bm,0,0),GetAlpha(
0.2,'NK',1,aZ))ab=ab:Lerp(CFrame.new(0,0,0)*RadAng(35*bm,15*bj,0),GetAlpha(0.2,
'RJ',1,aZ))ac=ac:Lerp(CFrame.new(0,0,0)*RadAng(0,0,0),GetAlpha(0.2,'WJ',1,aZ))ad
=ad:Lerp(CFrame.new(0.25,0,0.75)*RadAng(-135,0,15),GetAlpha(0.2,'LS',1,aZ))ae=ae
:Lerp(CFrame.new(-0.25,0,0.75)*RadAng(-135,0,-15),GetAlpha(0.2,'RS',1,aZ))af=af:
Lerp(CFrame.new(-0.5,1,0)*RadAng(0,0,0),GetAlpha(0.2,'LH',1,aZ))ag=ag:Lerp(
CFrame.new(0,0,0)*RadAng(0,0,0),GetAlpha(0.2,'RH',1,aZ))elseif a8==
'GROUND_CLIMB'then bo=20 aa=aa:Lerp(CFrame.new(0,0,0)*RadAng(-45+5*math.sin(be/
bo),0,0),GetAlpha(0.2,'NK',1,aZ))ab=ab:Lerp(CFrame.new(0,0,0.1*math.cos(be/bo))*
RadAng(1*math.sin(be/bo),0,0),GetAlpha(0.2,'RJ',1,aZ))ac=ac:Lerp(CFrame.new(0,0,
0)*RadAng(0,0,0),GetAlpha(0.2,'WJ',1,aZ))ad=ad:Lerp(CFrame.new(0.2*math.sin(aW/2
),0.3*-math.cos(aW/2),0)*RadAng(0,-15,-90+45*math.cos(aW/2)+-5*math.cos(be/bo)),
GetAlpha(0.5,'LS',1,aZ))ae=ae:Lerp(CFrame.new(-0.2*math.sin(aW/2),0.3*math.cos(
aW/2),0)*RadAng(0,15,90+45*math.cos(aW/2)+5*math.cos(be/bo)),GetAlpha(0.5,'RS',1
,aZ))af=af:Lerp(CFrame.new(-0.2+0.2*math.cos(aW/2),0.5+0.5*-math.cos(aW/2),0)*
RadAng(0,0,22*math.sin(aW/2)+2*math.cos(be/bo)),GetAlpha(0.5,'LH',1,aZ))ag=ag:
Lerp(CFrame.new(0.2+0.2*math.cos(aW/2),0.5+0.5*math.cos(aW/2),0)*RadAng(0,0,22*
math.sin(aW/2)+2*math.cos(be/bo)),GetAlpha(0.5,'RH',1,aZ))elseif a8==
'GROUND_SIT'then bo=20 aa=aa:Lerp(CFrame.new(0,0,0)*RadAng(0,0,0),GetAlpha(0.2,
'NK',1,aZ))ab=ab:Lerp(CFrame.new(0,0,0)*RadAng(0,0,0),GetAlpha(0.2,'RJ',1,aZ))ac
=ac:Lerp(CFrame.new(0,0,0)*RadAng(0,0,0),GetAlpha(0.2,'WJ',1,aZ))ad=ad:Lerp(
CFrame.new(0,0,0)*RadAng(0,0,-90),GetAlpha(0.2,'LS',1,aZ))ae=ae:Lerp(CFrame.new(
0,0,0)*RadAng(0,0,90),GetAlpha(0.2,'RS',1,aZ))af=af:Lerp(CFrame.new(0,0,0)*
RadAng(0,0,-90),GetAlpha(0.2,'LH',1,aZ))ag=ag:Lerp(CFrame.new(0,0,0)*RadAng(0,0,
90),GetAlpha(0.2,'RH',1,aZ))elseif a8=='FLY_IDLE'then bo=20 aa=aa:Lerp(CFrame.
new(0,0,0)*RadAng(5*math.sin(be/bo),0,5*math.cos(be/bo/2)),GetAlpha(0.2,'NK',1,
aZ))ab=ab:Lerp(CFrame.new(0,0,0.35*math.cos(be/bo))*RadAng(4+4*math.sin(be/bo),0
,0),GetAlpha(0.2,'RJ',1,aZ))ac=ac:Lerp(CFrame.new(0,0,0)*RadAng(0,0,0),GetAlpha(
0.2,'WJ',1,aZ))ad=ad:Lerp(CFrame.new(0,-0.1+0.1*math.sin(be/bo),0)*RadAng(-10+5*
math.cos(be/bo),15+5*-math.cos(be/bo),6),GetAlpha(0.2,'LS',1,aZ))ae=ae:Lerp(
CFrame.new(0,-0.1+0.1*math.sin(be/bo),0)*RadAng(-10+5*math.cos(be/bo),-15+5*math
.cos(be/bo),-6),GetAlpha(0.2,'RS',1,aZ))af=af:Lerp(CFrame.new(-0.5,0.5+0.2*-math
.sin(be/bo),0)*RadAng(-5,0,10*-math.cos(be/bo)),GetAlpha(0.2,'LH',1,aZ))ag=ag:
Lerp(CFrame.new(0.2,0.2+0.1*-math.sin(be/bo),0)*RadAng(-5,0,-5+3*math.cos(be/bo)
),GetAlpha(0.2,'RH',1,aZ))elseif a8=='FLY_MOVE'then bo=20 aa=aa:Lerp(CFrame.new(
0,0,0)*RadAng((-30+3*math.sin(be/bo))*-bl+(20*-bk),0,0),GetAlpha(0.2,'NK',1,aZ))
ab=ab:Lerp(CFrame.new(0,0.2*math.cos(be/bo),0.1*-math.cos(be/bo))*RadAng((62.5+
2.5*math.sin(be/bo))*-bl+(40*-bk),(35+5*math.sin(be/bo))*bj,15*bj),GetAlpha(0.2,
'RJ',1,aZ))ac=ac:Lerp(CFrame.new(0,0,0)*RadAng(0,0,0),GetAlpha(0.2,'WJ',1,aZ))ad
=ad:Lerp(CFrame.new(0.2*-bl,(0.1*math.sin(be/bo))*-bl-(0.2*math.abs(bk)),0)*
RadAng((-11+4*math.cos(be/bo))*math.abs(bl)+-15*bj+(33*-math.abs(bk)),11+3*math.
sin(be/bo)+(15*bk),(35+5*-math.cos(be/bo))*-bl+(30*bk)),GetAlpha(0.2,'LS',1,aZ))
ae=ae:Lerp(CFrame.new(-0.2*-bl,(0.1*math.sin(be/bo))*-bl-(0.2*math.abs(bk)),0)*
RadAng((-11+4*math.cos(be/bo))*math.abs(bl)+15*bj+(33*-math.abs(bk)),-11+3*-math
.sin(be/bo)+(-15*bk),(-35-5*-math.cos(be/bo))*-bl+(-30*bk)),GetAlpha(0.2,'RS',1,
aZ))af=af:Lerp(CFrame.new(-0.7,0.6+0.1*math.sin(be/bo),0)*RadAng(-5,11+3*math.
sin(be/bo),(20+6*math.cos(be/bo))*-bl+(30*bk)),GetAlpha(0.2,'LH',1,aZ))ag=ag:
Lerp(CFrame.new(0.2,0.2+0.1*math.sin(be/bo),0)*RadAng(-5,-11+3*-math.sin(be/bo),
(-15+3*-math.cos(be/bo))*-bl+(-30*bk)),GetAlpha(0.2,'RH',1,aZ))end if an.
LIGHTNING_1 then aa=aa:Lerp(CFrame.new(0,0,0)*RadAng(0,0,-45),GetAlpha(0.2,'NK',
2,aZ))ac=ac:Lerp(CFrame.new(0,0,0)*RadAng(-15,0,45),GetAlpha(0.2,'WJ',2,aZ))ae=
ae:Lerp(CFrame.new(0,0,0)*RadAng(0,45,180),GetAlpha(0.3,'RS',2,aZ))elseif an.
LIGHTNING_2 then aa=aa:Lerp(CFrame.new(0,0,0)*RadAng(0,0,45),GetAlpha(0.2,'NK',2
,aZ))ac=ac:Lerp(CFrame.new(0,0,0)*RadAng(15,0,-45),GetAlpha(0.2,'WJ',2,aZ))ae=ae
:Lerp(CFrame.new(0,0,0)*RadAng(0,-45,90),GetAlpha(0.4,'RS',2,aZ))end if an.
HOLD_TRIPMINE then ad=ad:Lerp(CFrame.new(0,0.625+0.125*math.cos(be/15),0)*
RadAng(10+20*math.sin(be/15),0,-160+20*math.cos(be/15)),GetAlpha(0.3,'LS',3,aZ))
ac=ac:Lerp(CFrame.new(0,0,0)*RadAng(-5,0,-25),GetAlpha(0.2,'WJ',3,aZ))aa=aa:
Lerp(CFrame.new(0,0,0)*RadAng(0,0,25),GetAlpha(0.2,'NK',3,aZ))N.TripmineOffset=
RadAng(15*-math.sin(be/15),(-be*4.4)%360,be%360)*CFrame.new(0,0,0.5)elseif an.
THROW_TRIPMINE then ad=ad:Lerp(CFrame.new(0,0.625+0.125*math.cos(be/15),0)*
RadAng(40,0,-75),GetAlpha(0.3,'LS',3,aZ))ac=ac:Lerp(CFrame.new(0,0,0)*RadAng(5,0
,45),GetAlpha(0.2,'WJ',3,aZ))aa=aa:Lerp(CFrame.new(0,0,0)*RadAng(0,0,-45),
GetAlpha(0.2,'NK',3,aZ))end local bp=aL*((Q*ab*ac)*(W))*((P*aa)*(V))local bq=aL*
((Q*ab*ac)*(W))local br=aL*((Q*ab*ac)*(W))*((R*ad)*(X))local bs=aL*((Q*ab*ac)*(W
))*((S*ae)*(Y))local bt=aL*((Q*ab)*(W))*((T*af)*(Z))local bu=aL*((Q*ab)*(W))*((U
*ag)*(_))local bv=(aL.Rotation*CFrame.new(0,-1.5,0)).Position local bw=workspace
:Blockcast(bt*CFrame.new(0,1,0),Vector3.new(0.9,0,0.9),bv,aP)local bx=workspace:
Blockcast(bu*CFrame.new(0,1,0),Vector3.new(0.9,0,0.9),bv,aP)if al=='GROUND'and
ak=='LAND'then if bw then local by=workspace:Raycast((bt*CFrame.new(0,1,0)).
Position,bv,aP)if by then bw=by end aQ=3-(aL.Rotation*CFrame.new(aL.Position-bw.
Position)).Y else aQ=0 end if bx then local by=workspace:Raycast((bu*CFrame.new(
0,1,0)).Position,bv,aP)if by then bw=by end aR=3-(aL.Rotation*CFrame.new(aL.
Position-bx.Position)).Y else aR=0 end else aQ=0 aR=0 end aS=Lerp(aS,aQ,
ExpAlpha(0.3,aZ))aT=Lerp(aT,aR,ExpAlpha(0.3,aZ))bt=(aL*CFrame.new(0,aS,-aS/2))*(
(Q*ab)*(W))*((T*af)*(Z))bu=(aL*CFrame.new(0,aT,-aT/2))*((Q*ab)*(W))*((U*ag)*(_))
aM=aM aL=CFrame.new(aL.Position)*CFrame.new(az*aZ)*aL.Rotation C.Head.CFrame=bp
C.Torso.CFrame=bq C.Left_Arm.CFrame=br C.Right_Arm.CFrame=bs C.Left_Leg.CFrame=
bt C.Right_Leg.CFrame=bu K(C)pcall(function()for by,bz in next,C do N.
LimbPositions[by]=bz.CFrame end N.Limbs=D v.Pusher:
FireAllClients('REPLICATION',N)end)end)local aZ=false local a0=false
local function QuadraticBezier(a1,a2,a3,a4,a5)return a1(a1(a2,a3,a5),a1(a3,a4,a5
),a5)end local a1={OnInput=function(a1,a2,a3)if a3 then return end if a1==Enum.
KeyCode.Q then aC=a2 end if a1==Enum.KeyCode.W then aD=a2 end if a1==Enum.
KeyCode.E then aE=a2 end if a1==Enum.KeyCode.A then aF=a2 end if a1==Enum.
KeyCode.S then aG=a2 end if a1==Enum.KeyCode.D then aH=a2 end if a1==Enum.
KeyCode.Space then aI=a2 end if a1==Enum.KeyCode.LeftAlt then aZ=a2 end end,[
Enum.KeyCode.F]=function(a1,a2)if a2 or not a1 then return end al=al=='GROUND'
and'FLY'or'GROUND'end,[Enum.KeyCode.R]=function(a1,a2)if a2 or not a1 then
return end ay=ay==Vector3.yAxis and-Vector3.yAxis or Vector3.yAxis end,[Enum.
KeyCode.Zero]=function(a1,a2)if a2 or not a1 then return end for a3,a4 in next,D
do G(a3)end end,[Enum.KeyCode.Nine]=function(a1,a2)if a2 or not a1 then return
end s=not s N.cad=s v.Pusher:FireClient(h,'SETCORE','SendNotification',{Title=
'dim',Text='cad '..tostring(s)})end,[Enum.KeyCode.T]=function(a1,a2)if a2 or not
a1 then return end N.AuraEffects=N.AuraEffects==0 and 6 or 0 end,[Enum.KeyCode.
LeftControl]=function(a1,a2)if a2 or not a1 then return end aq=aq==1 and 2 or 1
end,[Enum.KeyCode.Z]=function(a1,a2)if a2 or not a1 then return end if as and at
then return end as=true local a3=7 local a4=true local a5={{Color3.fromRGB(149,0
,255),Color3.fromRGB(0,0,255)},{Color3.fromRGB(8,0,255),Color3.fromRGB(0,221,255
)}}local a6=a5[math.random(1,#a5)]local a7=a6[1]local a8=a6[2]if aZ then a3=64
a4=false a7=Color3.new(1,0.35,0.35)a8=Color3.new(0.3,0.3,0.3)end local a9=0
local function FireBolt(ba,bb,bc,bd)if a9>a3 then return end a9=a9+1 local be=(
bb-ba).Magnitude local bf=CFrame.lookAt(ba,bb).LookVector*be local bg=workspace:
Raycast(ba,bf*1.1,aP)if bg then bb=bg.Position else if aZ then bb=ba+bf.Unit*
2500 else bb=ba+bf.Unit*700 end end be=(bb-ba).Magnitude task.delay(math.floor(
be/4)*(0.1/bc),function()local bh=workspace:Raycast(ba,bf*1.1,aP)if bh then if
a9>=a3 then v.Pusher:FireAllClients('SOUNDPOS',aL.Position,
'rbxassetid://170278900',{Volume=2,RollOffMinDistance=30,PlaybackSpeed=Random.
new():NextNumber(0.8,1.2)})local bi=OverlapParams.new()bi.RespectCanCollide=
false bi.FilterDescendantsInstances=DictToArray(D)bi.BruteForceAllSlow=true
local bj=workspace:GetPartBoundsInRadius(bb,22,bi)KillTable(bj,'LIGHTNING',{bd,
a8,50})v.Pusher:FireAllClients('EFFECT','EXPLODE',bb,Vector3.new(45,45,45),bd,
0.5,2)v.Pusher:FireAllClients('EFFECT','EXPLODE',bb,Vector3.new(31,31,31),a8,0.3
,1.5)for bk=1,12 do local bl=bd if bk%2==0 then bl=a8 end local bm=Random.new():
NextUnitVector()*150 v.Pusher:FireAllClients('EFFECT','BOLT',bb,bb+bm,15,12,1,bc
/3,bl,1.5)end return end local bi=(bf-(2*bf:Dot(bh.Normal)*bh.Normal))local bj=
workspace:Raycast(bh.Position,bi.Unit*2000,aP)if a4 then local bk=OverlapParams.
new()bk.RespectCanCollide=false bk.FilterDescendantsInstances=DictToArray(D)bk.
BruteForceAllSlow=true local bl=workspace:GetPartBoundsInRadius(bh.Position,5,bk
)KillTable(bl,'LIGHTNING',{bd,a8,2})end if bj then FireBolt(bh.Position,bj.
Position,bc,bd)else FireBolt(bh.Position,bh.Position+bi.Unit*500,bc,bd)end v.
Pusher:FireAllClients('EFFECT','RICOCHET',bh.Position,bh.Normal,bh.Instance)v.
Pusher:FireAllClients('EFFECT','EXPLODE',bb,Vector3.new(10,10,10),a8,0.5,1)v.
Pusher:FireAllClients('EFFECT','EXPLODE',bb,Vector3.new(7,7,7),bd,0.3,1)for bk=1
,2 do local bl=bd if bk%2==0 then bl=a8 end local bm=bh.Normal*8+Random.new():
NextUnitVector()*10 v.Pusher:FireAllClients('EFFECT','BOLT',bh.Position,bh.
Position+bm,5,5,0.5,bc,bl,1)end end end)v.Pusher:FireAllClients('EFFECT','BOLT',
ba,bb,math.floor(be/4),2,1,bc,bd,1)v.Pusher:FireAllClients('EFFECT','BOLT',ba,bb
,math.floor(be/12),3,0.75,bc/3,a8,1.5)end an.LIGHTNING_1=true task.wait(0.2)an.
LIGHTNING_1=nil an.LIGHTNING_2=true task.wait(0.1)v.Pusher:FireAllClients(
'SOUNDPOS',aL.Position,'rbxassetid://168586586',{Volume=1,RollOffMinDistance=30,
PlaybackSpeed=Random.new():NextNumber(0.7,1.3)})task.wait(0.1)v.Pusher:
FireAllClients('SOUNDPOS',aL.Position,'rbxassetid://3177740633',{Volume=1,
RollOffMinDistance=30,PlaybackSpeed=Random.new():NextNumber(0.7,1.3)})local ba=(
C.Right_Arm.CFrame*CFrame.new(0,-2,0)).Position FireBolt(ba,ah.Position,8,a7)
task.wait(0.1)an.LIGHTNING_2=nil as=false end,[Enum.KeyCode.X]=function(a1,a2)if
a2 then return end if aZ then end if a1 then if N.HoldTripmine then return end
if as and at then return end an.HOLD_TRIPMINE=true N.HoldTripmine=true N.
TripmineDebounce=os.clock()as=true v.Pusher:FireAllClients('SOUNDPOS',C.Left_Arm
.CFrame.Position,'rbxassetid://11956590',{Volume=2,RollOffMinDistance=30})else
if not N.HoldTripmine and at then as=false return end local a3=os.clock()-N.
TripmineDebounce or 0 if a3<0.3 then task.wait(0.3-a3)end as=false an.
HOLD_TRIPMINE=false an.THROW_TRIPMINE=true local a4=d:GenerateGUID(false)task.
wait(0.1)local a5=CFrame.new((C.Left_Arm.CFrame*CFrame.new(0,2,0)).Position)
local a6=CFrame.new(ah.Position)local a7=(a6.Position-a5.Position).Magnitude
local a8=CFrame.lookAt(a5.Position,a6.Position).LookVector if a7>3000 then a6=a5
+(a8*3000)end local a9=a5:Lerp(a6,0.5)*CFrame.new(-ay*50)v.Pusher:
FireAllClients('EFFECT','CREATE_TRIPMINE',a4,a5,a9,a6)v.Pusher:FireAllClients(
'SOUNDPOS',aL.Position,'rbxassetid://201858045',{Volume=2,RollOffMinDistance=100
,PlaybackSpeed=Random.new():NextNumber(0.95,1.05)})local ba=os.clock()local bb
bb=b.Heartbeat:Connect(function()local bc=os.clock()-ba local bd=bc if bd<0.5
then return end local be=QuadraticBezier(a5.Lerp,a5,a9*CFrame.new(0,50,0),a6,bd)
local bf=workspace:GetPartBoundsInRadius(be.Position,4,aX)if#bf>0 then v.Pusher:
FireAllClients('SOUNDPOS',be.Position,'rbxassetid://11984351',{Volume=1,
RollOffMinDistance=100,PlaybackSpeed=Random.new():NextNumber(0.95,1.05)})v.
Pusher:FireAllClients('SOUNDPOS',be.Position,'rbxassetid://170278900',{Volume=
0.5,RollOffMinDistance=100,PlaybackSpeed=Random.new():NextNumber(0.7,1.3)*1.3})v
.Pusher:FireAllClients('EFFECT','TWEENEFFECT',{{Origin={CFrame=be,Shape=Enum.
PartType.Ball,Color=Color3.new(0.5,0,1),Size=Vector3.zero,Material=Enum.Material
.Neon,Transparency=1},Tweens={{Info={0.1,Enum.EasingStyle.Exponential},
Properties={Transparency=0.5,Size=Vector3.one*65}},{Info={4,Enum.EasingStyle.
Back,Enum.EasingDirection.Out},Properties={Transparency=1,Size=Vector3.one}}}},{
Origin={CFrame=be,Shape=Enum.PartType.Ball,Color=Color3.new(1,0,1),Size=Vector3.
zero,Material=Enum.Material.Neon,Transparency=1},Tweens={{Info={0.1,Enum.
EasingStyle.Exponential},Properties={Transparency=0.2,Size=Vector3.one*45}},{
Info={3.95,Enum.EasingStyle.Back,Enum.EasingDirection.Out},Properties={
Transparency=1,Size=Vector3.one}}}},{Origin={CFrame=be,Shape=Enum.PartType.Ball,
Color=Color3.new(1,0.5,1),Size=Vector3.zero,Material=Enum.Material.Neon,
Transparency=1},Tweens={{Info={0.1,Enum.EasingStyle.Exponential},Properties={
Transparency=0.2,Size=Vector3.one*25}},{Info={3.9,Enum.EasingStyle.Back,Enum.
EasingDirection.Out},Properties={Transparency=1,Size=Vector3.one}}}}})for bg=1,8
do local bh=Color3.new(0.5,0,0.5)if bg%2==0 then bh=Color3.new(1,0,1)end local
bi=Random.new():NextUnitVector()*35 task.delay(bg/25,function()v.Pusher:
FireAllClients('EFFECT','BOLT',be.Position,be.Position+bi,5,11,1,4,bh,1.5)end)
end local bg=Instance.new'Explosion'bg.BlastRadius=16 bg.BlastPressure=1000000
bg.Position=be.Position bg.Visible=false bg.Parent=workspace local bh=workspace:
GetPartBoundsInRadius(be.Position,50,aX)local bi=workspace:
GetPartBoundsInRadius(be.Position,80,aX)for bj,bk in next,bi do if not bk.
Anchored then local bl=CFrame.lookAt(bk.CFrame.Position,be.Position).LookVector.
Unit local bm=(be.Position-bk.CFrame.Position).Magnitude bk.Velocity=-bl*500/(bm
/25)end end local bj={}for bk,bl in next,bh do if CanAttack(bl)then table.
insert(bj,bl)end end local bk={}local bl={}for bm,bn in next,bj do local bo=(be.
Position-bn.CFrame.Position).Magnitude if bo>40 then table.insert(bl,bn)else
table.insert(bk,bn)end end for bm,bn in next,bl do pcall(function()bn:
BreakJoints()end)end for bm,bn in next,bl do local bo=CFrame.lookAt(bn.CFrame.
Position,be.Position).LookVector.Unit local bp=(be.Position-bn.CFrame.Position).
Magnitude local bq=Instance.new('Sparkles',bn)task.delay(5,game.Destroy,bq)bn.
Color=Color3.new(1,0,0.74):Lerp(Color3.new(0,0,0),Random.new():NextNumber(0,0.1)
)bn.Velocity=-bo*500/(bp/2)bn.Anchored=false pcall(function()bn:SetNetworkOwner(
h)end)end task.delay(5,function()for bm,bn in next,bl do pcall(function()bn:
SetNetworkOwner(nil)end)end end)KillTable(bk,'LIGHTNING',{Color3.new(1,0,1),
Color3.new(1,0,1),20})v.Pusher:FireAllClients('EFFECT','DESTROY_TRIPMINE',a4)bb:
Disconnect()end end)task.delay(5,function()v.Pusher:FireAllClients('EFFECT',
'DESTROY_TRIPMINE',a4)bb:Disconnect()end)N.HoldTripmine=false task.wait(0.1)an.
THROW_TRIPMINE=false task.wait(0.1)N.OnGoingTripmine=false end end,[Enum.KeyCode
.C]=function(a1,a2)if a2 or not a1 then return end for a3,a4 in next,u do v.
Pusher:FireAllClients('EFFECT','SHATTER',{Color=a4.Color,Size=a4.Size,CFrame=a4.
CFrame,Material=a4.Material,Transparency=a4.Transparency,Reflectance=a4.
Reflectance,Delay=0.01})end v.Pusher:FireAllClients('SOUNDPOS',aL.Position,
'rbxassetid://4958429672',{PlaybackSpeed=Random.new():NextNumber(0.75,1.25),
Volume=2,RollOffMinDistance=40})if a0 then local a3=CFrame.lookAt(aL.Position,ah
.Position).Rotation if al=='GROUND'then a3=GetFlatRotation(a3)end if am~='IDLE'
then a3=aL.Rotation end aL=(CFrame.new(ah.Position)*a3)+(-ay*3)end end,[Enum.
KeyCode.One]=function(a1,a2)if a2 or not a1 then return end if u.Head:IsA
'MeshPart'then u.Head.Size=Vector3.new(1.1,1.1,1.1)for a3,a4 in next,u do local
a5=Instance.fromExisting(n)a5.Size=a4.Size a5.Color=a4.Color a5.Reflectance=a4.
Reflectance a5.Transparency=0.2 u[a3]=a5 end else u.Head.Size=Vector3.new(1.198,
1.202,1.198)for a3,a4 in next,u do local a5=Instance.fromExisting(o)a5.Size=a4.
Size a5.Color=a4.Color a5.Reflectance=a4.Reflectance a5:ApplyMesh(r[a3])u[a3]=a5
end end end,[Enum.KeyCode.Two]=function(a1,a2)if a2 or not a1 then return end at
=not at as=false v.Pusher:FireClient(h,'SETCORE','SendNotification',{Title='dim'
,Text='cooldown '..tostring(at)})end,[Enum.KeyCode.N]=function(a1,a2)if a2 or
not a1 then return end au=not au end,[Enum.KeyCode.P]=function(a1,a2)if a2 or
not a1 then return end aL=CFrame.new(0,15,0)end,[Enum.KeyCode.M]=function(a1,a2)
if a2 or not a1 then return end N.Music.Volume=N.Music.Volume==1 and 0 or 1 end}

-- RAINBOW TOGGLE (press B)
a1[Enum.KeyCode.B] = function(down)
	if not down then return end
	N.Rainbow = not N.Rainbow
	v.Pusher:FireAllClients("SETCORE", "SendNotification", {Title="Rainbow", Text=(N.Rainbow and "ON" or "OFF")})
end

-- RAINBOW HEARTBEAT (server + client)
local rainbowConn
rainbowConn = b.Heartbeat:Connect(function()
	if not N.Rainbow then return end
	local hue = tick() * 0.3 % 1
	local rainbowColor = Color3.fromHSV(hue, 1, 1)
	for _,part in next, D do
		if part and part.Parent then
			part.Color = rainbowColor
		end
	end
	-- also tell clients to color their replicated limbs
	v.Pusher:FireAllClients("RAINBOW", rainbowColor)
end)

-- Add to replication data
table.insert(N, Rainbow = false) -- just for safety

-- CLIENT SIDE RAINBOW (in the big client script you already send)
-- Add this somewhere in the client script (near the REPLICATION handler):
RecievingTypes.RAINBOW = function(col)
	for _,limb in next, Limbs do
		if limb and limb.Parent then
			limb.Color = col
		end
	end
end

local function WrapString(ac,ad)return ad..ac..ad end local function GiveClient(
ac,ad,ae)local af='script.Disabled = true;script:Destroy();\n'local ag=af..ac:
gsub('"SEC"',WrapString(j,'"')):gsub('"STOP"',WrapString(k,'"')):gsub('"UID"',i)
:gsub('"TIME"',g)local ah=ad:FindFirstChildOfClass'PlayerGui'local ai=ah or ad:
FindFirstChildOfClass'Backpack'or Instance.new('Backpack',ad)local aj=ai if ah==
ai then aj=Instance.new'GuiMain'aj.Name=''aj.ResetOnSpawn=false aj.Parent=ai end
f(ag,aj)if ae then return ae()end end local ac={[k]=function()a=false for ac,ad
in next,E do for ae,af in next,ad do pcall(af.Disconnect,af)end end v.Pusher:
FireAllClients'CLEAN'for ac,ad in next,D do pcall(game.Destroy,ad)end h.
Character=nil h:LoadCharacter()end,f=function()for ac,ad in next,v do pcall(ad.
Destroy,ad)end for ac,ad in next,u do pcall(G,ac)end h.Character=nil for ac=1,2
do task.wait()end v.Pusher:FireClient(h,'FIX')end}local function Replicate(ad)
coroutine.wrap(GiveClient)(ab,ad,function()task.wait()end)if ad==h then h.
Chatted:Connect(function(ae)if ae:match'^&gt;'or ae:match'^>'then local af=ae:
gsub('^&gt;',''):gsub('^>','')local ag=ac[af]if ag then ag()end end end)
coroutine.wrap(GiveClient)(aa,ad)end end local function PlayerAdded(ad)if not a
then PlayerAdded=function()end return end if ad.UserId==i then h=ad end
Replicate(ad)end c.PlayerAdded:Connect(PlayerAdded)for ad,ae in next,c:
GetPlayers()do coroutine.wrap(PlayerAdded)(ae)end end
