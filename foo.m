function varargout = foo(varargin)

    [varargout{1:nargout}] = dispatch(varargin,...
        {@foo1,["any"];                 % dispatch based on number of inputs
        @foo2, ["logical","logical"];   % dispatch based on type
        @foo3, ["numeric", "logical"];
        @foo3, ["logical", "numeric"];  % repeated method for different type
        @foo4, ["Person"];              % dispatch on class
        @foo5, ["any", "logical"]}); 

end

function out = foo1(a)
    out = a;
end

function out = foo2(a, b)
   out = logical(a && b);
end

function out = foo3(a, b)
    out = a * b;
end

function [out1, out2] = foo4(p)
    out1 = p.name;
    out2 = p.age;
end

function [out1, out2] = foo5(a,b)
    out1 = b;
    out2 = a;
end
