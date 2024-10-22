local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()

-- Slap Battles game IDs
local SlapBattlesGames = {
    [6403373529] = "Slap Battles 👏",
    [18550498098] = "Guide Bossfight",
    [103505724406848] = "Poltergiest Glove",
    [11828384869] = "Elude Maze",
    [9431156611] = "Slap Royale",
    [9426795465] = "Slap Royale Match Making",
    [9015014224] = "No-one Shot Gloves",
    [11520107397] = "Killstreak Only",
    [14422118326] = "Null Zone",
    [15228348051] = "Druid TDS",
    [15228348051] = "Scythe TDS",
    [7234087065] = "Brazil",
    [0] = "Rob",
    [0] = "Frostbite",
    [74169485398268] = "Bind",
    [16034567693] = "Admin",
    
}

local currentGame = SlapBattlesGames[game.PlaceId]

if currentGame then
    local Window = OrionLib:MakeWindow({
        IntroText = currentGame,
        IntroIcon = "rbxassetid://15315284749",
        Name = ("Sxlent404 - " .. currentGame .. " | " .. identifyexecutor()),
        IntroToggleIcon = "rbxassetid://7734091286",
        HidePremium = false,
        SaveConfig = true,
        ConfigFolder = "SlapBattlesConfig"
    })

    local MainHacksTab = Window:MakeTab({
        Name = "Main Hacks",
        Icon = "rbxassetid://4483345998",
        PremiumOnly = false
    })

    -- Add game-specific hacks here based on the current game mode
    if currentGame == "Slap Battles 👏" then
        MainHacksTab:AddButton({
            Name = "Slap Battles Hack",
            Callback = function()
                print("Slap Battles hack activated")
                -- Add your hack code here
            end    
        })
    elseif currentGame == "Slap Royale" then
        MainHacksTab:AddButton({
            Name = "Slap Royale Hack",
            Callback = function()
                print("Slap Royale hack activated")
                -- Add your hack code here
            end    
        })
    -- Add more game-specific hacks for other modes
    end

    local TeleportTab = Window:MakeTab({
        Name = "Teleport",
        Icon = "rbxassetid://4483345998",
        PremiumOnly = false
    })

    -- Function to teleport to a place
    local function TeleportToPlace(placeId)
        local TeleportService = game:GetService("TeleportService")
        local player = game.Players.LocalPlayer
        
        TeleportService:Teleport(placeId, player)
    end

    -- Add teleport buttons for each game mode
    for placeId, gameName in pairs(SlapBattlesGames) do
        if placeId ~= game.PlaceId then -- Don't add a button for the current game
            local buttonName = "Teleport to " .. gameName
            
            -- Special cases for Null Zone and TDS
            if gameName == "Null Zone" then
                buttonName = "Teleport to Null Zone (Not Working)"
            elseif gameName == "Druid TDS" or gameName == "Scythe TDS" then
                buttonName = "Teleport To Slap Battles Tower Defense (Not Working)"
            end
            
            TeleportTab:AddButton({
                Name = buttonName,
                Callback = function()
                    if gameName == "Null Zone" or gameName == "Druid TDS" or gameName == "Scythe TDS" then
                        OrionLib:MakeNotification({
                            Name = "Teleport Failed",
                            Content = "Teleport to " .. gameName .. " is currently not working.",
                            Image = "rbxassetid://4483345998",
                            Time = 3
                        })
                    else
                        TeleportToPlace(placeId)
                    end
                end    
            })
        end
    end

    local BadgesTab = Window:MakeTab({
        Name = "Badges",
        Icon = "rbxassetid://4483345998",
        PremiumOnly = false
    })

    BadgesTab:AddButton({
        Name = "Get Fan And Boxer",
        Callback = function()
            TeleportToPlace(7234087065) -- Teleport to Brazil
            
            -- Wait for the game to load
            if not game:IsLoaded() then
                game.Loaded:Wait()
            end
            
            wait(1)
            
            -- Teleport the player to a specific location
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(247.564193725586, -265.000030517578, -370.037526855469)
            wait(0.5)
            
            -- Fire various remote events
            local remoteEvents = game:GetService("ReplicatedStorage").RemoteEvents
            remoteEvents.SuitUpClown:FireServer()
            wait(0.1)
            remoteEvents.KeyQuest:FireServer()
            wait(0.1)
            remoteEvents.KeyAcquired:FireServer()
            wait(0.1)
            remoteEvents.GOHOME:FireServer()
            wait(0.1)
            remoteEvents.KeyBadgeReward:FireServer()
            
            wait(1)
            
            -- Teleport the player again
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(4231.26123046875, 3505.86376953125, 270.451995849609)
            wait(0.5)
            
            -- Simulate a click on the BoxingGloves.ClickDetector
            fireclickdetector(workspace.BoxingGloves.ClickDetector)
            
            wait(1)
            
            -- Teleport the player back to Slap Battles
            TeleportToPlace(6403373529)
        end    
    })

    local MiscTab = Window:MakeTab({
        Name = "Misc",
        Icon = "rbxassetid://4483345998",
        PremiumOnly = false
    })

    -- Config Save toggle
    MiscTab:AddToggle({
        Name = "Save Config",
        Default = true,
        Save = true,
        Flag = "SaveConfig",
        Callback = function(Value)
            OrionLib.SaveConfig = Value
            if Value then
                OrionLib:MakeNotification({
                    Name = "Config Saving",
                    Content = "Config saving is now enabled.",
                    Image = "rbxassetid://4483345998",
                    Time = 3
                })
            else
                OrionLib:MakeNotification({
                    Name = "Config Saving",
                    Content = "Config saving is now disabled.",
                    Image = "rbxassetid://4483345998",
                    Time = 3
                })
            end
        end    
    })

    -- Silent Execute toggle
    MiscTab:AddToggle({
        Name = "Silent Execute",
        Default = false,
        Save = true,
        Flag = "SilentExecute",
        Callback = function(Value)
            _G.AutoExecuter = Value
            if Value then
                local ScriptSpawnSlap = queueonteleport or queue_on_teleport
                if ScriptSpawnSlap then
                    ScriptSpawnSlap([[
                    if not game:IsLoaded() then
                        game.Loaded:Wait()
                    end
                    repeat wait() until game.Players.LocalPlayer
                    wait(0.25)
                    _G.AutoExecuter = true
                    loadstring(game:HttpGet("https://raw.githubusercontent.com/sxlent404/sxlent404/main/slapbattles.lua"))()
                    ]])
                else
                    OrionLib:MakeNotification({
                        Name = "Error",
                        Content = "You cannot auto execute",
                        Image = "rbxassetid://7733658504",
                        Time = 5
                    })
                end
            end
        end    
    })

    local OthersTab = Window:MakeTab({
        Name = "Others",
        Icon = "rbxassetid://4483345998",
        PremiumOnly = false
    })

    -- Add Game Information paragraph
    OthersTab:AddParagraph("Game Information", "Game Mode: " .. currentGame .. "\nGame Place ID: " .. game.PlaceId)

    -- Add button to copy Game Place ID
    OthersTab:AddButton({
        Name = "Copy Game ID to Clipboard",
        Callback = function()
            setclipboard(tostring(game.PlaceId))
            OrionLib:MakeNotification({
                Name = "Copied!",
                Content = "Game ID has been copied to clipboard.",
                Image = "rbxassetid://4483345998",
                Time = 3
            })
        end
    })

    OthersTab:AddButton({
        Name = "Destroy UI",
        Callback = function()
            OrionLib:Destroy()
        end
    })

    OrionLib:MakeNotification({
        Name = "Script Loaded!",
        Content = "Loaded for " .. currentGame,
        Image = "rbxassetid://4483345998",
        Time = 5
    })

    OrionLib:Init()
else
    -- If not in a Slap Battles game, show an error notification
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "Error",
        Text = "This script only works in Slap Battles games.",
        Icon = "rbxassetid://7733658504",
        Duration = 5
    })
end

game:GetService("GuiService"):ClearError()
