
% clear classes    % optional in cases classes are modified


restoredefaultpath
addpath .\classes

aA = A(2,3);   % create instance
aB = B(4.1, 2.2, 5.3); % create instance


res = sum_multiply(aB)

assert(sum(aA)==5, 'A.sum failed')       % call method

assert(multiplyrounded(aB)==40, 'B.multiplyrounded failed');




% this one should fail, will stop execution here
assert(multiplyrounded(aB)==41, 'B.multiplyrounded failed');