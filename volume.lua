local VOLUME_DEVICE = "Master"


local function get_volume()
    local handle = io.popen("amixer get " .. VOLUME_DEVICE .. " | grep -o '[0-9]*%' | head -n 1 | tr -d '%'")
    if not handle then return 0 end
    local result = handle:read("*a")
    handle:close()
    return tonumber(result) or 0
end

local function set_volume(level)
    os.execute("amixer set " .. VOLUME_DEVICE .. " " .. level .. "%")
end

local function increase_volume()
    local current_volume = get_volume()
    local new_volume = current_volume + 5
    set_volume(math.min(new_volume, 100))
end


local function decrease_volume()
    local current_volume = get_volume()
    local new_volume = current_volume - 5
    set_volume(math.max(new_volume, 0))
end


local functionHash = {
    up= increase_volume,
    down= decrease_volume,
    def= function() print("usage: volume.lua {up/down}") end
}
local arg = arg[1]
local func = functionHash[arg] or functionHash["def"]
func()

