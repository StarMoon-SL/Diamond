local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/StarMoon-SL/Diamond/refs/heads/main/Library.lua"))()
local Icons = loadstring(game:HttpGet("https://raw.githubusercontent.com/StarMoon-SL/Diamond/refs/heads/main/Loader.lua"))()
local Window = Library:Window({
    Name = "Example Window",
    SubName = "Demonstration of all elements",
    Logo = "120959262762131"
})

local Page1 = Window:Page({
    Name = "Basics",
    Icon = "home"
})

local Section1 = Page1:Section({
    Name = "Controls",
    Description = "Toggle, Slider, Dropdown",
    Side = 1
})

Section1:Toggle({
    Name = "Enable Feature",
    Flag = "ExampleToggle",
    Default = true,
    Callback = function(Value)
        print("Toggle changed to:", Value)
    end
})

Section1:Slider({
    Name = "Volume",
    Flag = "ExampleSlider",
    Min = 0,
    Max = 100,
    Default = 50,
    Suffix = "%",
    Decimals = 0,
    Callback = function(Value)
        print("Slider value:", Value)
    end
})

Section1:Dropdown({
    Name = "Select Option",
    Flag = "ExampleDropdown",
    Items = {"Option A", "Option B", "Option C"},
    Default = "Option B",
    Callback = function(Value)
        print("Dropdown selected:", Value)
    end
})

Section1:Keybind({
    Name = "Activate Shortcut",
    Flag = "ExampleKeybind",
    Default = Enum.KeyCode.R,
    Mode = "Toggle",
    Callback = function(State)
        print("Keybind state:", State)
    end
})

Section1:Button({
    Name = "Click Me",
    Callback = function()
        print("Button pressed")
    end
})

Section1:Textbox({
    Flag = "ExampleTextbox",
    Default = "Hello",
    Placeholder = "Type something...",
    Numeric = false,
    Finished = true,
    Callback = function(Text)
        print("Textbox input:", Text)
    end
})

Section1:Label("Color Picker Example"):Colorpicker({
    Flag = "ExampleColor",
    Default = Color3.fromRGB(255, 100, 100),
    Callback = function(Color, Alpha)
        print("Color chosen:", Color, Alpha)
    end
})

local Page2 = Window:Page({
    Name = "Advanced",
    Icon = "122669828593160",
    Columns = 1
})

local Section2 = Page2:Section({
    Name = "Listbox & Multi",
    Description = "Searchable multi‑selection",
    Side = 1
})

Section2:Listbox({
    Flag = "ExampleListbox",
    Items = {"Apple", "Banana", "Cherry", "Date", "Elderberry"},
    Default = "Cherry",
    Multi = false,
    Callback = function(Value)
        print("Listbox selected:", Value)
    end
})

Section2:Listbox({
    Flag = "ExampleMultiListbox",
    Items = {"Red", "Green", "Blue", "Yellow", "Purple"},
    Default = {"Red", "Blue"},
    Multi = true,
    Callback = function(Value)
        print("Multi selection:", Value)
    end
})

Section2:Slider({
    Name = "Opacity",
    Flag = "ExampleOpacity",
    Min = 0,
    Max = 1,
    Default = 0.5,
    Decimals = 2,
    Suffix = "",
    Callback = function(Value)
        print("Opacity changed:", Value)
    end
})

Window:Init()
