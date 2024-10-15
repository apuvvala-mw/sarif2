function plan = buildfile
import matlab.buildtool.tasks.*

plan = buildplan(localfunctions);

addpath("code");
plan("clean") = CleanTask;
plan("check").Outputs.Filename = files(plan, "issues2.sarif");

plan.DefaultTasks = "check";
end

function checkTask(ctx)
issues = codeIssues();
export(issues, ctx.Task.Outputs.Filename.paths(), SourceRoot=ctx.Plan.RootFolder);
end