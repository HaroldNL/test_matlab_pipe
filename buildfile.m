function plan = buildfile
plan = buildplan(localfunctions);
plan.DefaultTasks = "build";
plan("build").Dependencies = ["test"];
end

function testTask(~)
% Run unit tests
result = myfunc(3);
assert(result == 40);
end

function buildTask(~)
% Create pcode
pcode test_file.m
end