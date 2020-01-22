function out = ismethod(var, numOrType)
    % dispatch based on number or type of arguments.
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
    % isa_(varargin,{"numeric","numeric"})
    % isa_(varargin,{"numeric","cell", "struct"})
    % if number of arguments doesn't match the types, it returns false

    varlen = length(var); 
    typelen = length(type);
    
    varisa = false(typelen,1); % uses typelen and set default to false
    
    for i = 1:varlen
        varisa(i) = isa(var{i},type{i});
    end
    
    out = all(varisa);
end