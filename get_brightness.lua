local function get_brightness()
    local handle = io.popen("xbacklight -get")
    if not handle then return "Handle error" end
    local result = handle:read("*a")
    handle:close()
    local brightness = tonumber(result)

    if brightness then
        return brightness
    else
        return "Error: Unable to get brightness level"
    end    
end
return get_brightness
