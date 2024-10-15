function plan = buildfile
import matlab.buildtool.tasks.*

plan = buildplan(localfunctions);

plan.DefaultTasks = "check";
end

function checkTask(~)
origDir = pwd();
cd("top/sf1");
buildtool("check");
cd(origDir);
cd("top/sf2");
buildtool("check");
end

function cleanTask(~)
origDir = pwd();
cd("top/sf1");
buildtool("clean");
cd(origDir);
cd("top/sf2");
buildtool("clean");
end
