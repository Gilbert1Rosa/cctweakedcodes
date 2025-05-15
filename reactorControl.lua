local reactorOverheating = redstone.getInput("left");
local reactorHasExcessWaste = redstone.getInput("right");

print("Initiating check loop...");

while true do
    if reactorOverheating or reactorHasExcessWaste then
        redstone.setOutput("back", false);
    end
end