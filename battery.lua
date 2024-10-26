local polyprint = require("polyprint")
local function getBatteryInfo()
    -- Read battery percentage
    local capacity = io.open("/sys/class/power_supply/BAT1/capacity", "r")
    if not capacity then return end
    local percent = capacity:read("*n")  -- Read number
    capacity:close()

    -- Read charging status
    local status = io.open("/sys/class/power_supply/BAT1/status", "r")
    if not status then return end
    local charging = status:read("*l")
    status:close()

    if charging == "Full" and percent == 100 then
        return percent .. "%"
    elseif charging == "Charging" then
        return percent .. "% Charging"
    else
        return percent .. "%"
    end
end

while true do
    polyprint(getBatteryInfo())
    os.execute("sleep 1")
end
