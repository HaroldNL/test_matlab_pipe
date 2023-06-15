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

classes = fullfile(getenv("GITHUB_WORKSPACE"),"build","classes");
files = dir(classes);
dirFlags = [files.isdir];
subFolders = files(dirFlags);
subFolderNames = {subFolders(3:end).name} % Start at 3 to skip . and ..

for k = 1 : length(subFolderNames)
	fprintf('Sub folder #%d = %s\n', k, subFolderNames{k});
    subf = fullfile(getenv("GITHUB_WORKSPACE"),"build","classes", subFolderNames{k}, "*.m");
    pcode(subf,'-inplace')
end

end