classdef SmarterSimplePacman < Agent
    %UNTITLED3 Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
    end
    
    methods
        function obj = SmarterSimplePacman()
            obj.agentIndex = 1;
        end
        
        action = getAction(obj, gameState)
        legalDirections = getLegalDirections(obj, gameState)
    end
    
end

