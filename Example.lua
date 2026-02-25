local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/StarMoon-SL/Diamond/refs/heads/main/Library.Luau"))()
local Icons = loadstring(game:HttpGet("https://raw.githubusercontent.com/StarMoon-SL/Diamond/refs/heads/main/Loader.lua"))()

local Window = Library:Window({
    Name = "Diamond Hub",
    SubName = "Premium Edition",
    Logo = Icons.nebulaIcons.nebula
})

local KeybindList = Library:KeybindList("Active Keybinds")

Window:Category("Main")
local MainPage = Window:Page({Name = "Main", Icon = Icons:GetIcon("home", "Material")})

Window:Category("Combat")
local CombatPage = Window:Page({Name = "Combat", Icon = Icons:GetIcon("swords", "Symbols")})

Window:Category("Visuals")
local VisualsPage = Window:Page({Name = "Visuals", Icon = Icons:GetIcon("eye", "Phosphor")})

Window:Category("Settings")
local SettingsPage = Library:CreateSettingsPage(Window, KeybindList)

local MainSection = MainPage:Section({
    Name = "Character",
    Description = "Character modifications",
    Icon = Icons:GetIcon("person", "Material"),
    Side = 1
})

MainSection:Toggle({
    Name = "Enable Speed",
    Flag = "SpeedEnabled",
    Default = false,
    Callback = function(Value)
        print("Speed:", Value)
    end
})

local SpeedSettings = MainSection:Toggle({
    Name = "Speed Hack",
    Flag = "SpeedHack",
    Default = false,
    Callback = function(Value)
        print("Speed Hack:", Value)
    end
}):Settings(200)

SpeedSettings:Slider({
    Name = "Speed Amount",
    Flag = "SpeedAmount",
    Min = 16,
    Max = 100,
    Default = 50,
    Decimals = 0,
    Suffix = " studs",
    Callback = function(Value)
        print("Speed:", Value)
    end
})

SpeedSettings:Keybind({
    Name = "Speed Key",
    Flag = "SpeedKey",
    Default = Enum.KeyCode.LeftShift,
    Mode = "Hold",
    Callback = function(Value)
        print("Speed Key:", Value)
    end
})

MainSection:Slider({
    Name = "Jump Power",
    Flag = "JumpPower",
    Min = 50,
    Max = 200,
    Default = 50,
    Decimals = 0,
    Suffix = " power",
    Callback = function(Value)
        print("Jump:", Value)
    end
})

MainSection:Dropdown({
    Name = "Fly Mode",
    Flag = "FlyMode",
    Items = {"Default", "Fast", "Slow", "NoClip"},
    Default = "Default",
    Multi = false,
    Callback = function(Value)
        print("Fly Mode:", Value)
    end
})

MainSection:Keybind({
    Name = "Fly Key",
    Flag = "FlyKey",
    Default = Enum.KeyCode.F,
    Mode = "Toggle",
    Callback = function(Value)
        print("Flying:", Value)
    end
})

local CombatSection = CombatPage:Section({
    Name = "Aimbot",
    Description = "Aiming assistance",
    Icon = Icons:GetIcon("target", "Phosphor"),
    Side = 1
})

CombatSection:Toggle({
    Name = "Enable Aimbot",
    Flag = "AimbotEnabled",
    Default = false,
    Callback = function(Value)
        print("Aimbot:", Value)
    end
})

CombatSection:Toggle({
    Name = "Silent Aim",
    Flag = "SilentAim",
    Default = false,
    Callback = function(Value)
        print("Silent Aim:", Value)
    end
})

CombatSection:Slider({
    Name = "Aim FOV",
    Flag = "AimFOV",
    Min = 10,
    Max = 360,
    Default = 90,
    Decimals = 0,
    Suffix = "°",
    Callback = function(Value)
        print("FOV:", Value)
    end
})

CombatSection:Dropdown({
    Name = "Aim Part",
    Flag = "AimPart",
    Items = {"Head", "Torso", "HumanoidRootPart", "LeftArm", "RightArm"},
    Default = "Head",
    Multi = false,
    Callback = function(Value)
        print("Aiming at:", Value)
    end
})

CombatSection:Keybind({
    Name = "Aim Key",
    Flag = "AimKey",
    Default = Enum.KeyCode.Q,
    Mode = "Hold",
    Callback = function(Value)
        print("Aiming:", Value)
    end
})

local VisualSection = VisualsPage:Section({
    Name = "ESP",
    Description = "Extra sensory perception",
    Icon = Icons:GetIcon("eye", "Phosphor"),
    Side = 1
})

VisualSection:Toggle({
    Name = "Enable ESP",
    Flag = "ESPEnabled",
    Default = true,
    Callback = function(Value)
        print("ESP:", Value)
    end
})

VisualSection:Toggle({
    Name = "Show Boxes",
    Flag = "ShowBoxes",
    Default = true,
    Callback = function(Value)
        print("Boxes:", Value)
    end
})

VisualSection:Toggle({
    Name = "Show Names",
    Flag = "ShowNames",
    Default = true,
    Callback = function(Value)
        print("Names:", Value)
    end
})

VisualSection:Label("ESP Color"):Colorpicker({
    Name = "ESP Color",
    Flag = "ESPColor",
    Default = Color3.fromRGB(255, 0, 0),
    Callback = function(Color, Alpha)
        print("ESP Color:", Color, "Alpha:", Alpha)
    end
})

VisualSection:Slider({
    Name = "Max Distance",
    Flag = "MaxDistance",
    Min = 100,
    Max = 5000,
    Default = 1000,
    Decimals = 0,
    Suffix = " studs",
    Callback = function(Value)
        print("Distance:", Value)
    end
})

local WorldSection = VisualsPage:Section({
    Name = "World",
    Description = "World modifications",
    Icon = Icons:GetIcon("globe", "Material"),
    Side = 2
})

WorldSection:Toggle({
    Name = "Full Bright",
    Flag = "FullBright",
    Default = false,
    Callback = function(Value)
        print("Full Bright:", Value)
    end
})

WorldSection:Toggle({
    Name = "No Fog",
    Flag = "NoFog",
    Default = false,
    Callback = function(Value)
        print("No Fog:", Value)
    end
})

WorldSection:Button({
    Name = "Reset World",
    Icon = Icons:GetIcon("refresh", "Material"),
    Callback = function()
        print("Resetting world...")
    end
})

WorldSection:Textbox({
    Flag = "CustomCommand",
    Placeholder = "Enter command...",
    Default = "",
    Numeric = false,
    Finished = true,
    Callback = function(Value)
        print("Command:", Value)
    end
})

local PlayerList = WorldSection:Listbox({
    Name = "Player List",
    Flag = "PlayerList",
    Items = {"Player1", "Player2", "Player3", "Player4", "Player5"},
    Default = "Player1",
    Size = 150,
    Multi = false,
    Callback = function(Value)
        print("Selected:", Value)
    end
})

Library:Notification({
    Title = "Diamond Hub Loaded",
    Description = "Script successfully initialized",
    Duration = 5,
    Icon = Icons.nebulaIcons.sparkle
})

Window:Init()
getgenv().Library = Library