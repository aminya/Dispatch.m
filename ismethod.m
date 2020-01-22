function out = ismethod(var, numOrType)
    % dispatch based on number or type of arguments.
    % calls isnargin and isa_ accordingly
    if isa(numOrType, 'numeric')
        out = isnargin(var, numOrType);
    else 
        out = isa_(var, numOrType);
    end
    
end


