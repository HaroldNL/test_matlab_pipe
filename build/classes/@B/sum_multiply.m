function outputArg1 = sum_multiply(this)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
fprintf('B.sum_multiply\n');

tmp = sum(this.A);

outputArg1 = tmp * this.x3;

end