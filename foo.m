function out = dispatch_test(varargin)

    % dispatch based on the number of inputs
    if ismethod(varargin, 1)

        out = varargin{1};

    % dispatch based on the type of inputs

    elseif ismethod(varargin, ["logical","logical"])

        out = logical(varargin{1} && varargin{2});

    elseif ismethod(varargin, ["numeric", "logical"]) || ismethod(varargin, ["logical", "numeric"])

        out = varargin{1} * varargin{2};
        
    elseif ismethod(varargin, ["any", "logical"])

        out = varargin{2};

    else
        error("no method defined")

    end

end
