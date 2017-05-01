classdef (Abstract) Agent
    %all players in pacman game
    
    properties
        agentIndex;
    end
    
    methods
        legalDirections = getLegalDirections(obj, gameState)
        actionVector = getAction(obj, gameState)
    end
    
end

