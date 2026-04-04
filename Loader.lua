local IconLibrary = {}

local ICON_SETS = {
	Material = "https://raw.githubusercontent.com/StarMoon-SL/Diamond/refs/heads/main/Admins/MaterialIcons.lua",
	Lucide = "https://raw.githubusercontent.com/StarMoon-SL/Diamond/refs/heads/main/Admins/LucideIcons.lua",
	Phosphor = "https://raw.githubusercontent.com/StarMoon-SL/Diamond/refs/heads/main/Admins/Phosphor.lua",
	PhosphorFilled = "https://raw.githubusercontent.com/StarMoon-SL/Diamond/refs/heads/main/Admins/Phosphor%20Filled.lua",
	SF = "https://raw.githubusercontent.com/StarMoon-SL/Diamond/refs/heads/main/Admins/SFSymbols.luau",
	Symbols = "https://raw.githubusercontent.com/StarMoon-SL/Diamond/refs/heads/main/Admins/Symbols.lua",
	SymbolsFilled = "https://raw.githubusercontent.com/StarMoon-SL/Diamond/refs/heads/main/Admins/Symbols-Filled.lua",
	Lab = "https://raw.githubusercontent.com/StarMoon-SL/Diamond/refs/heads/main/Admins/LucideLab.lua",
	Fluency = "https://raw.githubusercontent.com/StarMoon-SL/Diamond/refs/heads/main/Admins/Fluency.lua",
}

local loadedSets = {}
local defaultSet = "Symbols"

local function loadSet(name, url)
	if loadedSets[name] then return loadedSets[name] end
	local success, data = pcall(function()
		return loadstring(game:HttpGetAsync(url))()
	end)
	if success and type(data) == "table" then
		loadedSets[name] = data
		return data
	else
		warn("Failed to load icon set: " .. name)
		loadedSets[name] = {}
		return {}
	end
end

for name, url in pairs(ICON_SETS) do
	task.spawn(function()
		loadSet(name, url)
	end)
end

function IconLibrary.getIcon(name, set)
	set = set or defaultSet
	local targetSet = loadedSets[set]
	if not targetSet then
		targetSet = loadSet(set, ICON_SETS[set])
	end
	local icon = targetSet[name]
	if icon then
		if type(icon) == "number" then
			icon = "rbxassetid://" .. icon
		end
		game:GetService("ContentProvider"):PreloadAsync({icon})
		return icon
	end
	warn(string.format("Icon '%s' not found in set '%s'", name, set))
	return nil
end

function IconLibrary.waitForSet(set, timeout)
	set = set or defaultSet
	local start = tick()
	while not loadedSets[set] do
		if timeout and tick() - start > timeout then
			return false
		end
		task.wait()
	end
	return true
end

function IconLibrary.setDefaultSet(set)
	if ICON_SETS[set] then
		defaultSet = set
	else
		warn("Invalid default icon set: " .. set)
	end
end

local commonAliases = {
	home = { name = "home", set = "Symbols" },
	settings = { name = "settings", set = "Symbols" },
	close = { name = "close", set = "Symbols" },
	search = { name = "search", set = "Symbols" },
	menu = { name = "menu", set = "Symbols" },
	user = { name = "user", set = "Symbols" },
	star = { name = "star", set = "Symbols" },
	heart = { name = "heart", set = "Symbols" },
	check = { name = "check", set = "Symbols" },
	chevronDown = { name = "chevron-down", set = "Lucide" },
	chevronRight = { name = "chevron-right", set = "Lucide" },
	plus = { name = "plus", set = "Lucide" },
	minus = { name = "minus", set = "Lucide" },
}

function IconLibrary.get(name, set)
	if not set and commonAliases[name] then
		local alias = commonAliases[name]
		return IconLibrary.getIcon(alias.name, alias.set)
	end
	return IconLibrary.getIcon(name, set or defaultSet)
end

return IconLibrary
