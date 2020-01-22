# Dispatch.m
 Runtime multiple dispatch for Matlab.

- Dispatch based on the number of arguments
- Dispatch based on the type of arguments
- Supported for code generation


Use `ismethod` function to invoke methods.

Here is an example of a function written using `ismethod`:
```matlab
function out = foo(varargin)

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


```

```matlab
>> foo(2)
ans =
     2

>> foo(true,false)
ans =
  logical
   0
>> foo(true,1)
ans =
     1
>> foo(false,1)
ans =
     0
>> foo({1}, true)
ans =
  logical
   1 

```

You can write different functions for different methods:

```matlab
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
```
