classdef Person 
    properties
        name
        age
    end   
    methods
        % constructor
        function obj = Person(name,age)
            obj.name = name;
            obj.age = age;
        end
    end
end

