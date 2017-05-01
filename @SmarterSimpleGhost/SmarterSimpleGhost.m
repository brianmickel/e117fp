classdef SmarterSimpleGhost
    %UNTITLED3 Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        agentIndex;
    end
    
    methods
        function obj = SmarterSimpleGhost(idx)
            obj.agentIndex = idx;
        end
        
        action = getAction(obj, gameState)
        legalDirections = getLegalDirections(obj, gameState)
        
    end
    
end

