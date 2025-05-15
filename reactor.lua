local args = {...}
local status = args[1] or "start"
local reactorOn = redstone.getOutput("back");

function reactorStart()
    if not reactorOn then
        redstone.setOutput("back", true);
        reactorOn = redstone.getOutput("back");
    end
end

function reactorStop()
    if reactorOn then
        redstone.setOutput("back", false);
        reactorOn = redstone.getOutput("back");
    end
end

if status == "start" then
    reactorStart();
    local id = multishell.launch({}, "reactorControl.lua");
    multishell.setTitle(id, "Reactor Loop");
elseif status == "stop" then
    reactorStop();
end