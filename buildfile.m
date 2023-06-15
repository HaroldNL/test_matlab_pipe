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
subfolders = subdir(classes)  % listing all path of the subfolders 
subfolders{end+1}=classes     % also include folder 'path' to the list 
for i=1:nfolders
	disp(['Parsing M-files into the P-files: folder ' subfolders{i}])
    pcode([subfolders{i} '\*.m'],'-inplace')
end

end