function out = dog(varargin)

    dispatch(varargin,...
        {@dog1, 1; % dispatch based on number of inputs
        @dog2, ["logical","logical"];   % dispatch based on type
        @dog3, ["numeric", "logical"];
        @dog3, ["logical", "numeric"]; % repeated method for different type
        @dog4, ["any", "logical"]})

end

function out = dog1(a)
    out = a;
end

function out = dog2(a, b)
   out = logical(a && b);
end

function out = dog3(a, b)
    out = a * b;
end

function out = dog4(a,b)
    out = b;
end