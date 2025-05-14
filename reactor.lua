local args = {...}
local status = args[1] or "start"

function reactorStart()
    local reactorOn = redstone.getOutput("back");
    
    if not reactorOn then
        redstone.setOutput("back", true);
        reactorOn = redstone.getOutput("back");
    end
end

function startCheckLoop()
    local reactorOverheating = redstone.getInput("left");
    local reactorHasExcessWaste = redstone.getInput("right");
    
    print("Initiating check loop...");

    while true do
        if reactorOverheating or reactorHasExcessWaste then
            redstone.setOutput("back", false);
        end
    end
end

if status == "start" then
    reactorStart()
    startCheckLoop()
end