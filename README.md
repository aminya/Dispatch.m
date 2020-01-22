# Dispatch.m
 Runtime multiple dispatch for Matlab.

- Dispatch based on the number of arguments
- Dispatch based on the type of arguments
- Supported for code generation


Write a function like the following example as a template. Use `dispatch` function to invoke methods. 
```matlab
function out = dog(varargin)

    dispatch(varargin,...
        {@dog1, 1; % dispatch based on number of inputs
        @dog2, ["logical","logical"];   % dispatch based on type
        @dog3, ["numeric", "logical"];
        @dog3, ["logical", "numeric"]; % repeated method for different type
        @dog4, ["any", "logical"]})

end
```

Wrtie different functions as methods. You need to return a cell if your function has multiple outputs.

```matlab
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
```

Now let's test the example:
```matlab
>> dog(2)
ans =
     2
>> dog(true, false)
ans =
  logical
   0
>> dog(2, true)
ans =
  logical
   1
>> dog({2},true)
ans =
  logical
   1
>> dog({2},{2})
no method found
```

