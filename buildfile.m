function plan = buildfile
plan = buildplan(localfunctions);
plan.DefaultTasks = "build";
plan("build").Dependencies = ["test"];
end

function testTask(~)
% Run unit tests
a = 40
assert(a == 40);
end

function buildTask(~)
% Create pcode
CurrPath = fullfile(getenv("GITHUB_WORKSPACE"),'build');
rpcode(CurrPath,'-inplace');
end