classdef Game < handle
    % The Game manages the control flow, soliciting actions from agents.
    
    properties
        agents;
        isGameOver;
        gameState;
        Map; % colormap from Board class
        Figure;

        
        agentCrashedBoolean
        display;
        rules;
        moveHistory;
    end
    
    events
        UpdateScore
    end
    
    methods
        function obj = Game()
            obj.isGameOver = false;
            obj.initializeGame();
        end
        
        initializeGame(obj)
        play(obj)
    end
   
    
end

