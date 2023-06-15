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

function subFolderNames = GetFolders(DirWithFolders)
files = dir(classes);
dirFlags = [files.isdir];
subFolders = files(dirFlags);
subFolderNames = {subFolders(3:end).name} % Start at 3 to skip . and ..
end


function buildTask(~)
% Create pcode
base = fullfile(getenv("GITHUB_WORKSPACE"),"build", "*.m");
pcode(base,"-inplace")

classes = fullfile(getenv("GITHUB_WORKSPACE"),"build","classes");
subfolders = subFolderNames(classes)

for k = 1 : length(subfolders)
	fprintf('Sub folder #%d = %s\n', k, subfolders{k});
    here = fullfile(getenv("GITHUB_WORKSPACE"),"build","classes", subfolders{k})

    subsubfolders = subFolderNames(here)
    if length(subsubfolders) > 0
        for j = 1 : length(subsubfolders)
            convert_path = fullfile(here, subsubfolders{j}, "*.m");
            pcode(convert_path,'-inplace')
        end
    end
    
    convert_path = fullfile(here, "*.m");
    pcode(convert_path,'-inplace')
end

end