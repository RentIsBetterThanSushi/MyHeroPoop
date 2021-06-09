if game.PlaceId == 2013751579 then--HEROES ONLINE
    local VLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/RentIsBetterThanSushi/UIHeroesOnline/main/.lua"))()
    MAINTTL = "Rent W" 

    local win = VLib:Window("HEROES ONLINE", Color3.fromRGB(196, 40, 28))

    local ss = win:Tab("MAIN")

    Distance = 4
    DB = 0

    local tool_table = {}
    for i, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
        if v:IsA("Tool") then
            table.insert(tool_table, v.Name)
        end
    end

    local Npc_Table = {
        "Thug",
        "UAStudent",
        "ArmedPolice",
        "NaturiaGuard",
        "Nomu",
        "ArmedThug",
        "Hooligan",
        "Muscular",
        "HeroKillerStain"
    }

    SelectedWeapon = nil

    ss:Dropdown(
        "Mobs",
        Npc_Table,
        function(t)
            NP = t
        end
    )

    ss:Toggle(
        "Autofarm Mobs",
        function(t)
            autofarm = t

            game:GetService("RunService").Heartbeat:Connect(
                function()
                    if autofarm then
                        pcall(
                            function()
                                game.Players.LocalPlayer.Character.Humanoid:ChangeState(11)
                            end
                        )
                    end
                end
            )

            while autofarm do
                wait()
                pcall(
                    function()
                        for i, v in pairs(game:GetService("Workspace"):GetChildren()) do
                            if
                                string.match(v.Name, NP) and v:IsA("Model") and v:FindFirstChild("hitbox") and
                                    v:FindFirstChild("HumanoidRootPart")
                             then
                                repeat
                                    wait()
                                    local TweenService = game:GetService("TweenService")
                                    local tweenInfo =
                                        TweenInfo.new(
                                        5, -- Time
                                        Enum.EasingStyle.Linear, -- EasingStyle
                                        Enum.EasingDirection.Out, -- EasingDirection
                                        0, -- RepeatCount (when less than zero the tween will loop indefinitely)
                                        false, -- Reverses (tween will reverse once reaching it's goal)
                                        0 -- DelayTime
                                    )

                                    local part = game.Players.LocalPlayer.Character.HumanoidRootPart
                                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
                                        CFrame.new(
                                        v.HumanoidRootPart.Position + Vector3.new(0, Distance, DB),
                                        v.HumanoidRootPart.Position
                                    )
                                    local tween = TweenService:Create(part, tweenInfo, {CFrame = npcCFrame})
                                    tween:Play()
                                until v.Humanoid.Health <= 0 or autofarm == false
                            end
                        end
                    end)
            end
        end)

    ss:Slider(
        "Mob Distance Behind",0,10,2,
        function(t)
            DB = t
        end)

    ss:Slider(
        "Mob Distance Height",
        -9,
        10,
        3,
        function(t)
            Distance = t
        end)

    ss:Toggle(
        "Kill Aura",
        function(t)
            aura = t
            while aura do
                wait()
                pcall(function()
                        local args = {
                            [1] = "Melee",
                            [2] = "",
                            [3] = 1,
                            [4] = 1,
                            [5] = "Melee"
                        }

                        game:GetService("ReplicatedStorage").Events.DataEvent:FireServer(unpack(args))
                    end)
            end
        end)
        
        local cred = win:Tab("CREDITS")
        cred:Button("Copy the word nigger",function()
        setclipboard("nigger")
        end) 
        
        cred:Label("MADE BY RENT :3")
        end
