


local a=game:GetService("RunService")local function b()local a=game:GetService("CoreGui"):WaitForChild("DevConsoleMaster")local a=a:WaitForChild("DevConsoleWindow")local a=a:WaitForChild("DevConsoleUI")local a=a:WaitForChild("MainView")local a=a:WaitForChild("ClientLog")for a,a in pairs(a:GetChildren())do if a:IsA("GuiObject")and a.Name:match("%d+")then a:Destroy()end end end;a.Heartbeat:Connect(function()b()end)if shared.Forbidden.Memory.Settings.Enable==true then local a;game:GetService("RunService").RenderStepped:Connect(function()pcall(function()for b,b in pairs(game:GetService("CoreGui").RobloxGui.PerformanceStats:GetChildren())do if b.Name=="PS_Button"then if b.StatsMiniTextPanelClass.TitleLabel.Text=="Mem"then b.StatsMiniTextPanelClass.ValueLabel.Text=tostring(a).." MB"end end end end)pcall(function()if game:GetService("CoreGui").RobloxGui.PerformanceStats["PS_Viewer"].Frame.TextLabel.Text=="Memory"then for b,b in pairs(game:GetService("CoreGui").RobloxGui.PerformanceStats["PS_Viewer"].Frame:GetChildren())do if b.Name=="PS_DecoratedValueLabel"and string.find(b.Label.Text,'Current')then b.Label.Text="Current: "..a.." MB"end;if b.Name=="PS_DecoratedValueLabel"and string.find(b.Label.Text,'Average')then b.Label.Text="Average: "..a.." MB"end end end end)pcall(function()game:GetService("CoreGui").DevConsoleMaster.DevConsoleWindow.DevConsoleUI.TopBar.LiveStatsModule["MemoryUsage_MB"].Text=math.round(tonumber(a)).." MB"end)end)task.spawn(function()while task.wait(1)do local b=shared.Forbidden.Memory.Configuration.Start;local c=shared.Forbidden.Memory.Configuration.End;a=tostring(math.random(b,c)).."."..tostring(math.random(10,99))end end)end;local a=game:GetService("Players")local a=a.LocalPlayer;local b=game:GetService("Workspace").CurrentCamera;local c=game:GetService("UserInputService")local d=game:GetService("RunService")local e=game:GetService("VirtualInputManager")local f=0;local g=false;local h=nil;function Forlorn.mouse1click(a,b)e:SendMouseButtonEvent(a,b,0,true,game,false)e:SendMouseButtonEvent(a,b,0,false,game,false)end;local function i()local a=c:GetMouseLocation()return a.X,a.Y end;local function j(a)local a=b:WorldToViewportPoint(a)local b=Vector2.new(b.ViewportSize.X/2,b.ViewportSize.Y/2)local c=shared.Forbidden.ViewEra.Vertical*100;local d=shared.Forbidden.ViewEra.Horizontal*100;return(Vector2.new(a.X,a.Y)-b).Magnitude<=math.sqrt((c/2)^2+(d/2)^2)end;local function k(a)local b={}for a,a in pairs(a:GetChildren())do if a:IsA("MeshPart")or a:IsA("Part")then table.insert(b,a)end end;return b end;local function l(a)local b,b=i()e:SendMouseMoveEvent(a.X,a.Y,game)end;local function e(a)local a=a.Character and a.Character:FindFirstChild("Humanoid")if a then return a.Health>0 and a.Health<=7 end;return false end;local function m()local a=a.Character:FindFirstChildOfClass("Tool")if a then local a=a.Name:lower()return a=="knife"or a=="katana"or a=="[knife]"or a=="[katana]"end;return false end;local function n(b)local a=a:GetMouse()return a.Target and a.Target:IsDescendantOf(b.Character)end;local function o()if h and h.Character then local c=h.Character:FindFirstChild("Humanoid")if c and c.Health>0 and not e(h)then if n(h)then local c=k(h.Character)for c,c in pairs(c)do local b,d=b:WorldToViewportPoint(c.Position)if d and j(c.Position)then l(b)if os.clock()-f>=shared.Forbidden.TriggerBot.Settings.Cooldown then f=os.clock()local a=a.Character:FindFirstChildOfClass("Tool")if a and a:IsA("Tool")then if not m()then local a=a:FindFirstChild("Fire")if a and a:IsA("RemoteEvent")then a:FireServer(h.Character)else local a,b=i()Forlorn.mouse1click(a,b)end end end end end end end end end end;c.InputBegan:Connect(function(a,b)if not b and a.KeyCode==shared.Forbidden.TriggerBot.Settings.Keybind then g=true end end)c.InputEnded:Connect(function(a,b)if not b and a.KeyCode==shared.Forbidden.TriggerBot.Settings.Keybind then g=false end end)d.RenderStepped:Connect(function()if g then o()end end)local a=game:GetService("Players")local b=a.LocalPlayer;local c=b:GetMouse()local d=game:GetService("RunService")local e=game.Workspace.CurrentCamera;local f=Drawing.new("Circle")f.Color=Color3.new(1,1,1)f.Thickness=1;f.Filled=false;local function g()if not f then return end;local a,b=pcall(function()if f then f.Visible=shared.Forbidden.PointAssist.Reach_Visibility;f.Radius=shared.Forbidden.PointAssist.Reach;f.Position=Vector2.new(c.X,c.Y+game:GetService("GuiService"):GetGuiInset().Y)end end)if not a then end end;d.RenderStepped:Connect(g)local function i()local d,g=nil,math.huge;for a,a in pairs(a:GetPlayers())do if a~=b and a.Character and a.Character:FindFirstChild("HumanoidRootPart")then local b,e=e:WorldToScreenPoint(a.Character.HumanoidRootPart.Position)local b=(Vector2.new(b.X,b.Y)-Vector2.new(c.X,c.Y)).Magnitude;if f.Radius>b and b<g and e then g=b;d=a end end end;return d end;local function a(a)local b=math.huge;local d=nil;if a and a:IsDescendantOf(game.Workspace)then for a,a in ipairs(a:GetChildren())do if a:IsA("BasePart")then local e,g=e:WorldToScreenPoint(a.Position)if g then local c=(Vector2.new(e.X,e.Y)-Vector2.new(c.X,c.Y)).Magnitude;if f.Radius>c and c<b then b=c;d=a end end end end end;return d end;local function b()if shared.Forbidden.Silent.mode=="target"then return h elseif shared.Forbidden.Silent.mode=="normal"then return i()end end;c.KeyDown:Connect(function(a)if a:lower()==shared.Forbidden.Target.Keybind:lower()then if shared.Forbidden.PointAssist.Enabled then if IsTargeting then local a=i()if a and a.Character and a.Character:FindFirstChildOfClass("Humanoid").Health>=7 then h=a else end else local a=i()if a and a.Character and a.Character:FindFirstChildOfClass("Humanoid").Health>=7 then IsTargeting=true;h=a else end end end elseif a:lower()==shared.Forbidden.Target.UntargetKeybind:lower()then IsTargeting=false;h=nil end end)local function b(a)if a and a.Character then local a=a.Character.HumanoidRootPart.Position;local b=e.CFrame.Position;local a=(a-b).unit;local b=(e.CFrame.LookVector).unit;return a:Dot(b)>0.9 end;return false end;d.RenderStepped:Connect(function()if IsTargeting and h and h.Character then if h.Character:FindFirstChildOfClass("Humanoid").Health<7 then h=nil;IsTargeting=false;return end;local b=a(h.Character)if b then local c;if shared.Forbidden.PointAssist.Resolver then local a=h.Character:FindFirstChildOfClass("Humanoid")if a then local a=a.MoveDirection;c=b.Position+(a*shared.Forbidden.PointAssist.VelocityCompensation)end else local a=h.Character.HumanoidRootPart.Velocity;c=b.Position+(a*shared.Forbidden.PointAssist.VelocityCompensation)end;if c then local a=CFrame.new(e.CFrame.Position,c)if shared.Forbidden.PointAssist.StabilizationEnabled then e.CFrame=e.CFrame:Lerp(a,shared.Forbidden.PointAssist.Stabilization)else e.CFrame=a end end;if shared.Forbidden.Silent.Enabled and IsTargeting and h.Character:FindFirstChild("Humanoid")then if shared.Forbidden.Silent.mode=="target"then local a=b.Position;local b=GetVelocity(h,b.Name)Replicated_Storage[RemoteEvent]:FireServer(Argument,a+b*shared.Forbidden.Silent.Prediction)elseif shared.Forbidden.Silent.mode=="normal"then local b=i()if b and b.Character then local a=a(b.Character)if a then local c=a.Position;local a=GetVelocity(b,a.Name)Replicated_Storage[RemoteEvent]:FireServer(Argument,c+a*shared.Forbidden.Silent.Prediction)end end end end end end end)local a=game;local b=a:GetService("RunService")local b=a:GetService("Players")local c=a:GetService("UserInputService")local e=b.LocalPlayer;local f=e:GetMouse()local j=a:GetService("Workspace").CurrentCamera;local k=a:GetService("ReplicatedStorage")local l=a:GetService("StarterGui")local m=a:GetService("Workspace")local n=nil;local o=Vector2.new;local p=Drawing.new("Circle")local q=false;local r=0;local s={}if not game:IsLoaded()then game.Loaded:Wait()end;local t={DaHood={ID=2,Details={Name="Da Hood",Argument="UpdateMousePosI2",Remote="MainEvent",BodyEffects="K.O"}},DaHoodMacro={ID=16033173781,Details={Name="Da Hood Macro",Argument="UpdateMousePosI2",Remote="MainEvent",BodyEffects="K.O"}},DaHoodVC={ID=7213786345,Details={Name="Da Hood VC",Argument="UpdateMousePosI",Remote="MainEvent",BodyEffects="K.O"}},HoodCustoms={ID=9825515356,Details={Name="Hood Customs",Argument="MousePosUpdate",Remote="MainEvent"}},HoodModded={ID=5602055394,Details={Name="Hood Modded",Argument="MousePos",Remote="Bullets"}},DaDownhillPSXbox={ID=77369032494150,Details={Name="Da Downhill [PS/Xbox]",Argument="MOUSE",Remote="MAINEVENT"}},DaBank={ID=132023669786646,Details={Name="Da Bank",Argument="MOUSE",Remote="MAINEVENT"}},DaUphill={ID=84366677940861,Details={Name="Da Uphill",Argument="MOUSE",Remote="MAINEVENT"}},DaHoodBotAimTrainer={ID=14487637618,Details={Name="Da Hood Bot Aim Trainer",Argument="MOUSE",Remote="MAINEVENT"}},HoodAimTrainer1v1={ID=11143225577,Details={Name="1v1 Hood Aim Trainer",Argument="UpdateMousePos",Remote="MainEvent"}},HoodAim={ID=14413712255,Details={Name="Hood Aim",Argument="MOUSE",Remote="MAINEVENT"}},MoonHood={ID=14472848239,Details={Name="Moon Hood",Argument="MoonUpdateMousePos",Remote="MainEvent"}},DaStrike={ID=15186202290,Details={Name="Da Strike",Argument="MOUSE",Remote="MAINEVENT"}},OGDaHood={ID=17319408836,Details={Name="OG Da Hood",Argument="UpdateMousePos",Remote="MainEvent",BodyEffects="K.O"}},DahAimTrainner={ID=16747005904,Details={Name="DahAimTrainner",Argument="UpdateMousePos",Remote="MainEvent",BodyEffects="K.O"}},MekoHood={ID=17780567699,Details={Name="Meko Hood",Argument="UpdateMousePos",Remote="MainEvent",BodyEffects="K.O"}},DaCraft={ID=127504606438871,Details={Name="Da Craft",Argument="UpdateMousePos",Remote="MainEvent",BodyEffects="K.O"}},NewHood={ID=17809101348,Details={Name="New Hood",Argument="UpdateMousePos",Remote="MainEvent",BodyEffects="K.O"}},NewHood2={ID=138593053726293,Details={Name="New Hood",Argument="UpdateMousePos",Remote="MainEvent",BodyEffects="K.O"}},DeeHood={ID=139379854239480,Details={Name="Dee Hood",Argument="UpdateMousePos",Remote="MainEvent",BodyEffects="K.O"}},DaKitty={ID=113357850268933,Details={Name="Da kitty",Argument="UpdateMousePos",Remote="MainEvent",BodyEffects="K.O"}}}local u=game.PlaceId;local v;for a,a in pairs(t)do if a.ID==u then v=a.Details;break end end;if not v then b.LocalPlayer:Kick("Unsupported game")return end;local t=v.Remote;local u=v.Argument;local v=v.BodyEffects or"K.O"local v=game:GetService("ReplicatedStorage")local v=v:FindFirstChild(t)if not v then b.LocalPlayer:Kick("Are you sure this is the correct game?")return end;local function w(a)return a==u end;local x=u;if w(x)then v:FireServer(x)else b.LocalPlayer:Kick("Invalid argument")end;local function v()for a,a in pairs(s)do a:Remove()end;s={}end;local function w()local b=shared.Forbidden.Silent.BoundingSizes;v()if IsTargeting then if b.FovShape=="Square"then local a=b.Sizes/2;local a={o(f.X-a,f.Y-a),o(f.X+a,f.Y-a),o(f.X+a,f.Y+a),o(f.X-a,f.Y+a)}for c=1,4 do local d=Drawing.new("Line")d.Visible=b.FovVisible;d.From=a[c]d.To=a[c%4+1]d.Color=b.FovColor;d.Thickness=b.FovThickness;d.Transparency=b.FovTransparency;table.insert(s,d)end elseif b.FovShape=="Triangle"then local a={o(f.X,f.Y-b.Sizes),o(f.X+b.Sizes*math.sin(math.rad(60)),f.Y+b.Sizes*math.cos(math.rad(60))),o(f.X-b.Sizes*math.sin(math.rad(60)),f.Y+b.Sizes*math.cos(math.rad(60)))}for c=1,3 do local d=Drawing.new("Line")d.Visible=b.FovVisible;d.From=a[c]d.To=a[c%3+1]d.Color=b.FovColor;d.Thickness=b.FovThickness;d.Transparency=b.FovTransparency;table.insert(s,d)end else p.Visible=b.FovVisible;p.Radius=b.Sizes;p.Position=o(f.X,f.Y+(a:GetService("GuiService"):GetGuiInset().Y))p.Color=b.FovColor;p.Thickness=b.FovThickness;p.Transparency=b.FovTransparency;p.Filled=b.Filled;if b.Filled then p.Transparency=b.FillTransparency end end else p.Visible=false end end;local function a(a,b,c)l:SetCore("SendNotification",{Title=a,Text=b,Icon=c,Duration=5})end;local function l(a)if a.Character and a.Character:FindFirstChild("BodyEffects")then local a=a.Character.BodyEffects;local a=a:FindFirstChild(shared.Forbidden.BodyEffects)return a and a.Value end;return false end;local function s(a)return a.Character and a.Character:FindFirstChild("GRABBING_CONSTRAINT")~=nil end;local function s(a)if not shared.Forbidden.PointAssist.Enabled or not IsTargeting or not h then return false end;local a,b=j:WorldToScreenPoint(a.Position)local a=(o(a.X,a.Y)-o(f.X,f.Y)).Magnitude;return b and a<=shared.Forbidden.Silent.BoundingSizes.Sizes end;local function w(a)if not shared.Forbidden.Silent.WallCheck then return true end;local b=j.CFrame.Position;local c=(a.Position-b).Unit*(a.Position-b).Magnitude;local b=Ray.new(b,c)local b=m:FindPartOnRayWithIgnoreList(b,{e.Character,a.Parent})return b==a or not b end;local function m(a)local b=nil;local c=nil;local d=math.huge;local e={"Head","UpperTorso","LowerTorso","HumanoidRootPart","LeftHand","RightHand","LeftLowerArm","RightLowerArm","LeftUpperArm","RightUpperArm","LeftFoot","LeftLowerLeg","LeftUpperLeg","RightLowerLeg","RightUpperLeg","RightFoot"}for e,e in pairs(e)do local a=a:FindFirstChild(e)if a and a:IsA("BasePart")and s(a)and w(a)then local e,g=j:WorldToScreenPoint(a.Position)local e=(o(e.X,e.Y)-o(f.X,f.Y)).Magnitude;if e<d then b=a;c=a.Position;d=e end end end;return b,c end;local s=shared.Forbidden.Silent.Prediction;local function w(a,b)if a and a.Character then local b=a.Character[b].Velocity;if b.Y<-30 and shared.Forbidden.Silent.Resolver then shared.Forbidden.Silent.Prediction=0;return b elseif b.Magnitude>50 and shared.Forbidden.Silent.Resolver then return a.Character:FindFirstChild("Humanoid").MoveDirection*16 else shared.Forbidden.Silent.Prediction=s;return b end end;return Vector3.new(0,0,0)end;local function s()local a=nil;local c=math.huge;for b,b in pairs(b:GetPlayers())do if b.Character and b~=e and not l(b)then local d,e=m(b.Character)if d and e then local d=j:WorldToScreenPoint(e)local d=(o(d.X,d.Y)-o(f.X,f.Y)).Magnitude;if d<c then c=d;a=b end end end end;if a and l(a)then return nil end;return a end;local function b()shared.Forbidden.Silent.Enabled=not shared.Forbidden.Silent.Enabled;local b=shared.Forbidden.Silent.Enabled and"Forbidden Enabled"or"Forbidden Disabled"a("Forbidden Notifications",b,"rbxassetid://17561420493")if not shared.Forbidden.Silent.Enabled then p.Visible=false;v()end end;local function a(a)return Enum.KeyCode[a]end;c.InputBegan:Connect(function(a,b)if not b and a.UserInputType==Enum.UserInputType.MouseButton1 then q=true;local a=s()if a then n=a;local a=Vector3.new(f.X,f.Y,0)local b=k:FindFirstChild(t)if b then if u then local a,b=pcall(function()b:FireServer(u,a)end)if not a then end else end else end end end end)c.InputEnded:Connect(function(a,b)if a.KeyCode==Enum.KeyCode[shared.Forbidden.Target.Keybind:upper()]and shared.Forbidden.PointAssist.Mode=="hold"then q=false end;if a.KeyCode==Enum.KeyCode[shared.Forbidden.Target.UntargetKeybind:upper()]then IsTargeting=false;h=nil end end)local a=nil;local function b(a)local b=game.Players.LocalPlayer.Character;if not b then return false end;local c=b.Head.Position;local d=(a-c).Unit*1000;local e=RaycastParams.new()e.FilterType=Enum.RaycastFilterType.Blacklist;e.FilterDescendantsInstances={b}local b=workspace:Raycast(c,d,e)return b and(b.Position-a).Magnitude<5 end;d.RenderStepped:Connect(function()local c=game.Players.LocalPlayer.Character;if c and c:FindFirstChild("Humanoid")then local b=c.Humanoid;if b.Health<=1 then h=nil;IsTargeting=false;a=nil;return end end;if shared.Forbidden.Silent.Enabled and IsTargeting then g()if shared.Forbidden.Silent.mode=="target"and h then if h.Character then local c=h.Character.Head.Position;if h.Character.Humanoid.Health<1 then h=nil;IsTargeting=false;a=nil;return end;if l(h)then h=nil;IsTargeting=false;a=nil;return end;if not b(c)then IsTargeting=false;a=h;return end;local a,b=m(h.Character)if a and b then local a=w(h,a.Name)k[t]:FireServer(u,b+a*shared.Forbidden.Silent.Prediction)end end elseif shared.Forbidden.Silent.mode=="normal"then local a=i()if a and a.Character then local c=a.Character.Head.Position;if a.Character.Humanoid.Health<1 then return end;if l(a)then return end;if not b(c)then return end;local b,c=m(a.Character)if b and c then local a=w(a,b.Name)k[t]:FireServer(u,c+a*shared.Forbidden.Silent.Prediction)end end end elseif a and a.Character then local c=a.Character.Head.Position;if b(c)then h=a;IsTargeting=true;a=nil end else p.Visible=false end end)task.spawn(function()while task.wait(0.1)do if shared.Forbidden.Silent.Enabled then p.Visible=IsTargeting and shared.Forbidden.Silent.BoundingSizes.FovVisible end end end)local function a(a)if a:IsA("Tool")then a.Activated:Connect(function()if tick()-r>0.1 then r=tick()local a;if shared.Forbidden.Silent.mode=="target"then a=h elseif shared.Forbidden.Silent.mode=="normal"then a=i()end;if a and a.Character then local b,c=m(a.Character)if b and c then local a=w(a,b.Name)k[t]:FireServer(u,c+a*shared.Forbidden.Silent.Prediction)end end end end)end end;local function b(b)b.ChildAdded:Connect(a)for b,b in pairs(b:GetChildren())do a(b)end end;e.CharacterAdded:Connect(b)if e.Character then b(e.Character)end;if shared.Forbidden.TargetControl.BlockGroundHits==true then local function a(a)if shared.Forbidden.TargetControl.BlockGroundHits and a.Character:FindFirstChild("Humanoid")and a.Character.Humanoid:GetState()==Enum.HumanoidStateType.Freefall then pcall(function()local a=a.Character:FindFirstChild(getgenv().Silent and getgenv().Silent)if a then a.Velocity=Vector3.new(a.Velocity.X,(a.Velocity.Y*0.2),a.Velocity.Z)a.AssemblyLinearVelocity=Vector3.new(a.Velocity.X,(a.Velocity.Y*0.2),a.Velocity.Z)end end)end end end
