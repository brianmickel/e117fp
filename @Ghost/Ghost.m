classdef Ghost < Agent
    %UNTITLED3 Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
    end
    
    methods
        function obj = Ghost(idx)
            obj.agentIndex = idx;
        end
        legalDirections = getLegalDirections(obj, gameState)
        actionVector = getAction(obj, gameState)
    end
    
end

