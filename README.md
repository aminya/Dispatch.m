# Dispatch.m
 Runtime multiple dispatch for Matlab.

- Dispatch based on the number of arguments
- Dispatch based on the type of arguments
- Supported for code generation


Write a function like the following example as a template. Use `dispatch` function to invoke methods. 
```matlab
function out = foo(varargin)

    out = dispatch(varargin,...
        {@foo1, 1; % dispatch based on number of inputs
        @foo2, ["logical","logical"];   % dispatch based on type
        @foo3, ["numeric", "logical"];
        @foo3, ["logical", "numeric"]; % repeated method for different type
        @foo4, ["any", "logical"]});

end
```

Wrtie different functions as methods.

```matlab
function out = foo1(a)
    out = a;
end

function out = foo2(a, b)
   out = logical(a && b);
end

function out = foo3(a, b)
    out = a * b;
end

function out = foo4(a,b)
    out = b;
end
```
You can't have mutiple outputs for your function. Instead return the outputs as an array or cell of outputs.

Now let's test the example:
```matlab
>> foo(2)
ans =
     2
>> foo(true, false)
ans =
  logical
   0
>> foo(2, true)
ans =
  logical
   1
>> foo({2},true)
ans =
  logical
   1
>> foo({2},{2})
no method found
```

