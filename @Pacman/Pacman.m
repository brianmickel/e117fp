classdef Pacman < Agent
    %UNTITLED3 Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
    end
    
    methods
        function obj = Pacman()
            obj.agentIndex = 1;
        end
        
        userInput = getUserInput(obj)
        legalDirections = getLegalDirections(obj, gameState)
        action = getAction(obj, gameState)
        
    end
    
end

