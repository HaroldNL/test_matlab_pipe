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
base = fullfile(getenv("GITHUB_WORKSPACE"),"build", "*.m");
pcode(base,"-inplace")
classes = fullfile(getenv("GITHUB_WORKSPACE"),"build","classes","**/*.m");
pcode(classes,"-inplace")
end