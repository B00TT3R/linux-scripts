local function get_volume_level()
    -- Run the pactl command to get the volume level
    local handle = io.popen("pactl get-sink-volume @DEFAULT_SINK@")
    local result = handle:read("*all")
    handle:close()

    -- Extract the volume percentage using string patterns
    local volume = result:match("(%d+)%%")
    if volume then
        return tonumber(volume)
    else
        return 0
    end
end

-- Loop to continuously print the volume level every 0.2 seconds
while true do
    print(get_volume_level() .. "%")
    os.execute("sleep 0.1")
end
