local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/StarMoon-SL/Diamond/refs/heads/main/Library.lua"))()
local Icons = loadstring(game:HttpGet("https://raw.githubusercontent.com/StarMoon-SL/Diamond/refs/heads/main/Loader.lua"))()
local Window = Library:Window({
    Name = "Diamond UI",
    SubName = "Customizable and smooth",
    Logo = "120959262762131",
    BackgroundImage = "rbxassetid://1234567890",
    TitleIcon = "rbxassetid://9876543210"
})

local KeybindList = Library:KeybindList("Active Keybinds")

Window:Category("Visuals")
local VisualsPage = Window:Page({Name = "Visuals", Icon = "home"})
local VisualsSection = VisualsPage:Section({Name = "Effects", Description = "Toggle visual effects", Icon = "123944728972740", Side = 1})

VisualsSection:Toggle({
    Name = "Snow Effect",
    Flag = "SnowEffect",
    Default = false,
    Callback = function(value)
        if value then Library:StartEffect("Snow") else Library:StopEffect("Snow") end
    end
})

VisualsSection:Toggle({
    Name = "Rain Effect",
    Flag = "RainEffect",
    Default = false,
    Callback = function(value)
        if value then Library:StartEffect("Rain") else Library:StopEffect("Rain") end
    end
})

VisualsSection:Toggle({
    Name = "Fireworks Effect",
    Flag = "FireworksEffect",
    Default = false,
    Callback = function(value)
        if value then Library:StartEffect("Fireworks") else Library:StopEffect("Fireworks") end
    end
})

Window:Category("Gameplay")
local GameplayPage = Window:Page({Name = "Gameplay", Icon = "eye"})
local GameplaySection = GameplayPage:Section({Name = "Player", Description = "Player adjustments", Icon = "134236649319095", Side = 1})

GameplaySection:Toggle({
    Name = "Auto Sprint",
    Flag = "AutoSprint",
    Default = true,
    Callback = function(value)
        print("Auto sprint:", value)
    end
})

GameplaySection:Slider({
    Name = "Walk Speed",
    Flag = "WalkSpeed",
    Min = 16,
    Max = 100,
    Default = 16,
    Suffix = " studs/s",
    Decimals = 1,
    Callback = function(value)
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = value
    end
})

GameplaySection:Dropdown({
    Name = "Teleport Destination",
    Flag = "Teleport",
    Items = {"Spawn", "Mid", "High"},
    Default = "Spawn",
    Callback = function(value)
        print("Teleport to:", value)
    end
})

GameplaySection:Keybind({
    Name = "Fly Key",
    Flag = "FlyKey",
    Default = Enum.KeyCode.F,
    Mode = "Hold",
    Callback = function(isPressed)
        print("Fly toggled:", isPressed)
    end
})

Window:Category("Utilities")
local UtilityPage = Window:Page({Name = "Utilities", Icon = "103180437044643"})
local UtilitySection = UtilityPage:Section({Name = "Tools", Description = "Useful tools", Icon = "123944728972740", Side = 1})

UtilitySection:Button({
    Name = "Rejoin",
    Icon = "home",
    Callback = function()
        game:GetService("TeleportService"):Teleport(game.PlaceId)
    end
})

UtilitySection:Textbox({
    Flag = "ChatMessage",
    Placeholder = "Type message...",
    Finished = true,
    Callback = function(value)
        game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(value, "All")
    end
})

UtilitySection:Label("Color Picker Demo"):Colorpicker({
    Flag = "DemoColor",
    Default = Color3.fromRGB(255, 100, 100),
    Callback = function(color, alpha)
        print("Color:", color, "Alpha:", alpha)
    end
})

Window:Category("Misc")
local MiscPage = Window:Page({Name = "Misc", Icon = "122669828593160"})
local MiscSection = MiscPage:Section({Name = "Configuration", Description = "Save and load settings", Icon = "122669828593160", Side = 1})

local ConfigDropdown = MiscSection:Listbox({
    Flag = "ConfigList",
    Items = {},
    Multi = false,
    Callback = function(value) end
})

MiscSection:Textbox({
    Flag = "ConfigName",
    Placeholder = "Config name",
    Finished = true,
    Callback = function(value) end
})

MiscSection:Button({
    Name = "Save Config",
    Callback = function()
        local name = Library.Flags.ConfigName
        if name and name ~= "" then
            if not isfile(Library.Folders.Configs .. "/" .. name .. ".json") then
                writefile(Library.Folders.Configs .. "/" .. name .. ".json", Library:GetConfig())
                Library:RefreshConfigsList(ConfigDropdown)
            end
        end
    end
})

MiscSection:Button({
    Name = "Load Config",
    Callback = function()
        local selected = Library.Flags.ConfigList
        if selected then
            Library:LoadConfig(readfile(Library.Folders.Configs .. "/" .. selected))
        end
    end
})

MiscSection:Button({
    Name = "Delete Config",
    Callback = function()
        local selected = Library.Flags.ConfigList
        if selected then
            Library:DeleteConfig(selected)
            Library:RefreshConfigsList(ConfigDropdown)
        end
    end
})

Window:Category("Chat")
local ChatPage = Window:Page({Name = "Chat", Icon = "126497581491926"})
local GlobalChat = ChatPage:GlobalChat(1)
GlobalChat:OnMessageSendPressed(function()
    GlobalChat:SendMessage(
        "rbxassetid://78993485446406",
        game.Players.LocalPlayer.Name,
        GlobalChat:GetTypedMessage(),
        true
    )
    GlobalChat:ClearText()
end)

Library:Notification({
    Title = "UI Loaded",
    Description = "Welcome to Obsidian UI",
    Duration = 3,
    Icon = "101636617799068"
})

Window:Init()
