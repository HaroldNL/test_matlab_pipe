# MATLAB build pipeline

[![CI](https://github.com/HaroldNL/test_MATLAB_pipe/actions/workflows/main.yml/badge.svg?branch=main)](https://github.com/HaroldNL/test_MATLAB_pipe/actions/workflows/main.yml)

Repository containing a proof of principle for a MATLAB build pipeline. This pipeline uses the Run MATLAB Build action ([link](https://github.com/marketplace/actions/run-MATLAB-build)).

## Goal
The goal is to have a pipeline that can distribute MATLAB code in an easily accessible way, similar to Python packages. This will make it easier to distribute MATLAB projects without having to share and clone entire repositories.

## Approach
The pipeline depends on two elements: 1) the build folder; 2) the buildfile.m file. The latter provides the instructions to the MATLAB Build action, and the former contains all the files to be processed.

The pipeline creates a zip file containing (in this case):

```
./
├── classes/
│   ├── @A/
│   │   ├── A.p
│   │   └── sum.p
│   └── @B/
│       ├── private/
│       │   └── round.p  
│       ├── B.p
│       ├── multiplyrounded.p
│       └── sum_multiply.p
└── test.m
```

Note:

1. All Level 1 files (i.e., test.m) are kept as the original MATLAB files to provide examples for users.

2. All level 2 & 3 files (i.e. everything in the "classes" folder) are converted to content-obscured, executable pcode files ([ref](https://nl.mathworks.com/help/MATLAB/ref/pcode.html)).

3. Level 4 and lower are currently not supported.

### buildfile.m
This file is a MATLAB file that provides instructions to the MATLAB build action. It can consist of several steps ([ref](https://nl.mathworks.com/help/matlab/ref/buildtool.html)), two of which are most important. The first is the testTask, which should contain the necessary tests to be run before the build action continues.

The second is the buildTask, which contains the actual build instructions. This is where the .m files are converted to .p files.

Note: Packing into a zip file, etc. is done in the pipeline itself, not in the MATLAB build action.
