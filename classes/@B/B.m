function b1 = B(x1, x2,x3)
%B Summary of this function goes here
%   Detailed explanation goes here
fprintf('Creating instance of class B\n');
this.x1 = x1;
this.x2 = x2;
this.x3 = x3;

this.A  = A(x1,x2);    % reference to other class


b1 = class(this,'B');
end

