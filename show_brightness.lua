local get_brightness = require("get_brightness")
local polyprint = require("polyprint")
while true do
    polyprint(get_brightness().."%")
    os.execute("sleep 0.5")
end
