


local function get_volume()
    local handle = io.popen("xbacklight -get")
    if not handle then return 0 end
    local result = handle:read("*a")
    handle:close()
    return tonumber(result) or 0
end

local function set_volume(level)
    os.execute("xbacklight -set " .. level)
end

local function increase_brightness()
    local current_value = get_volume()
    local new_value = current_value + 5
    set_volume(math.min(new_value, 100))
end


local function decrease_brightness()
    local current_value = get_volume()
    local new_value = current_value - 5
    set_volume(math.max(new_value, 5))
end


local functionHash = {
    up= increase_brightness,
    down= decrease_brightness,
    def= function() print("usage: brightness.lua {up/down}") end
}
local arg = arg[1]
local func = functionHash[arg] or functionHash["def"]
func()

