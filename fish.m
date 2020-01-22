function out = fish(varargin)

    % dispatch based on the number of inputs
    if ismethod(varargin, 1)

        out = fish1(varargin{:});

    % dispatch based on the type of inputs

    elseif ismethod(varargin, ["logical","logical"])

        out = fish2(varargin{:});

    elseif ismethod(varargin, ["numeric", "logical"]) || ismethod(varargin, ["logical", "numeric"])

        out = fish3(varargin{:});

    elseif ismethod(varargin, ["any", "logical"])

        out = fish4(varargin{:});

    else
        error("no method defined")

    end

end

function out = fish1(a)
    out = a;
end

function out = fish2(a, b)
   out = logical(a && b);
end

function out = fish3(a, b)
    out = a * b;
end

function out = fish4(a,b)
    out = b;
end