# Dispatch.m
 Runtime multiple dispatch for Matlab.

- Dispatch based on the number of arguments
- Dispatch based on the type of arguments
- Supported for code generation


Write a function like the following example as a template. Use `dispatch(varargin, methodTable)` function to invoke methods.
```matlab
function out = foo(varargin)

    methodTable = {@foo1, ["any"];  % dispatch based on number of inputs
    @foo2, ["logical","logical"];   % dispatch based on type
    @foo3, ["numeric", "logical"];
    @foo3, ["logical", "numeric"];  % repeated method for different type
    @foo4, ["Person"];              % dispatch on class
    @foo5, ["any", "logical"]};             

    out = dispatch(varargin, methodTable);

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

function out = foo4(p)
    out = p.name;
    out = b;
end

function out = foo5(a,b)
    out = b;
end
```

Now let's test the example:
```matlab
% dispatch based on number of inputs
>> foo(2)
ans =
     2
```
```matlab
% dispatch based on type
>> foo(true, false)
ans =
  logical
   0
```
```matlab
% dispatch based on type
>> foo(2, true)
ans =
  logical
   1
```
```matlab
% dispatch on class
>> p = Person("Amin",25);
>> foo(p)
"Amin"
```
```matlab
% dispatch on any type
>> foo({2},true)
ans =
  logical
   1
```
```matlab
>> foo({2},p)
error: no method found
```

# Note
- You can't have multiple outputs for your function. Instead return the outputs as an array or cell of outputs.
- You can't dispatch on the name of the structs. Instead define simple class with just properties (See Person).

# License
This is written as part of my Master's thesis and it is licensed under Apache V2, so cite this paper if you use it:
```
A. Yahyaabadi, P. Ferguson, ”An intelligent multi-vehicle drone testbed for space systems and remote sensing veriﬁcation,” in Canadian Aeronautics and Space Institute (CASI) ASTRO, Canada, 2019
```
In case of changes, either make pull requests to this repository or state the changes.
