function out = foo(varargin)

    out = dispatch(varargin,...
        {@foo1, 1; % dispatch based on number of inputs
        @foo2, ["logical","logical"];   % dispatch based on type
        @foo3, ["numeric", "logical"];
        @foo3, ["logical", "numeric"]; % repeated method for different type
        @foo4, ["any", "logical"];
        @foo5, ["Person"]}); % dispatch on class

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

function out = foo4(p)
    out = p.name;
end

function out = foo5(a,b)
    out = b;
end
