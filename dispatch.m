% Dispatch.m
% Runtime multiple dispatch for Matlab.
% Apache V2 License
% Copyright (c) 2020 Amin Yahyaabadi, aminyahyaabadi74@gmail.com
% Copyright (c) 2022 Gabriele Bellomia, gbellomia@live.it [multiple output] 
% https://github.com/aminya/Dispatch.m
%
% # Example
% function varargout = foo(varargin)
%
%     methodTable = {@foo1, ["any"];  % dispatch based on number of inputs
%     @foo2, ["logical","logical"];   % dispatch based on type
%     @foo3, ["numeric", "logical"];
%     @foo3, ["logical", "numeric"];  % repeated method for different type
%     @foo4, ["Person"];              % dispatch on class
%     @foo5, ["any", "logical"]};
%
%     [varargout{1:nargout}] = dispatch(varargin, methodTable);
%
% end
function varargout = dispatch(var, methodTable)

    methodNum = size(methodTable,1);
    for i=1:methodNum
        if nargcheck(var,methodTable{i,2})
            % only check types if nargin matches
            if ismethod(var, methodTable{i,2})
                % call the candidate matching method
                try % the only way I know to check for nargout match
                    [varargout{1:nargout}] = methodTable{i,1}(var{:});
                catch
                    continue % there might be another method matching
                end
                return
            end
        end
    end
    
    error("no method found")
   
end

function out = nargcheck(var, typearray)
% find if the method is correct based on number of passed arguments.
% calls isnargin (TODO: probably better to inline)

    narg = length(typearray);
    out = isnargin(var,narg);

end

function out = ismethod(var, types)
% find if the method is correct based on type of arguments.
% calls isa_ (TODO: probably better to inline)

    out = isa_(var, types);

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
