function plan = buildfile
import matlab.buildtool.tasks.*

plan = buildplan(localfunctions);

addpath("code");
plan("clean") = CleanTask;
plan("check").Outputs.Filename = files(plan, "issues1.sarif");

plan.DefaultTasks = "check";
end

function checkTask(ctx)
issues = codeIssues();
cp = matlab.project.currentProject;
export(issues, ctx.Task.Outputs.Filename.paths(), SourceRoot=cp.RootFolder);
end