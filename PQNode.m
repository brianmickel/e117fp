classdef PQNode < handle
    %UNTITLED3 Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        priority;
        value = {};
    end
    
    methods
        
        function obj = PQNode(priority,value)
            obj.priority = priority;
            obj.value{1} = value;
        end
        
        function bool = lt(a,b)
            bool =  a.priority < b.priority;
            return;
        end
        
        function bool = gt(a,b)
            bool =  a.priority > b.priority;
            return;
        end
        
        function bool = lte(a,b)
            bool =  a.priority <= b.priority;
            return;
        end
        
        function bool = gte(a,b)
            bool =  a.priority >= b.priority;
            return;
        end
        
    end
   
    
end

