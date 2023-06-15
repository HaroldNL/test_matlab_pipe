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
% Get a logical vector that tells which is a directory.
dirFlags = [files.isdir];
% Extract only those that are directories.
subFolders = files(dirFlags); % A structure with extra info.
% Get only the folder names into a cell array.
subFolderNames = {subFolders(3:end).name} % Start at 3 to skip . and ..

for idx = 1:numel(subFolderNames)
    element = subFolderNames(idx)
    cls = fullfile(getenv("GITHUB_WORKSPACE"),"build","classes",element,"*.m");
    pcode(classes,"-inplace");
end

end