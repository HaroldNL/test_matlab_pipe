function a1 = A(x1, x2)
%A Summary of this function goes here
%   Detailed explanation goes here
fprintf('Creating instance of class A\n');
this.x1 = x1;
this.x2 = x2;

a1 = class(this,'A'); 
end

