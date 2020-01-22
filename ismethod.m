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


