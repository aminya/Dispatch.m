% Dispatch.m
% Runtime multiple dispatch for Matlab.
% Apache V2 License - Copyright (c) 2020 Amin Yahyaabadi - aminyahyaabadi74@gmail.com
% https://github.com/aminya/Dispatch.m

function out = dispatch(var, methodTable)
% performs runtime multiple dispatch for Matlab.
% # Example
% function out = foo(varargin)
%
%     methodTable = {@foo1, 1;        % dispatch based on number of inputs
%     @foo2, ["logical","logical"];   % dispatch based on type
%     @foo3, ["numeric", "logical"];
%     @foo3, ["logical", "numeric"];  % repeated method for different type
%     @foo4, ["Person"];              % dispatch on class
%     @foo5, ["any", "logical"]};
%
%     out = dispatch(varargin, methodTable);
%
% end

methodNum = size(methodTable,1);
    for i=1:methodNum
        if ismethod(var, methodTable{i,2})
            out = methodTable{i,1}(var{:});
        end
    end

    if ~exist('out','var')
       error("no method found")
    end
end


function out = ismethod(var, numOrType)
% find if the method is correct based on number or type of arguments.
% calls isnargin and isa_ accordingly

    if isa(numOrType, 'numeric')
        out = isnargin(var, numOrType);
    else
        out = isa_(var, numOrType);
    end

end


function out = isnargin(var, num)
% is number of var equal to num

   out = length(var) == num;
end


function out = isa_(var, type)
% vectorized isa
%
% # Example
% % use in type dispatch:
% isa_(varargin,{"any","any"})
% isa_(varargin,{"numeric","numeric"})
% isa_(varargin,{"double","single"})
% isa_(varargin,{"numeric","cell", "struct"})

% if number of arguments doesn't match the types, it returns false

    varlen = length(var);
    typelen = length(type);

    varisa = false(typelen,1); % uses typelen and set default to false

    for i = 1:varlen
        varisa(i) = isa2(var{i},type{i});
    end

    out = all(varisa);
end

function out = isa2(var, type)
% custom isa function. It adds "any" type to Matlab

    if type == "any"
        out = true;
    else
        out = isa(var, type);
    end

end
