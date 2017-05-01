classdef Game < handle
    % The Game manages the control flow, soliciting actions from agents.
    
    properties
        agents;
        isGameOver;
        gameState;
        Map; % colormap from Board class
        Figure;
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
        pacmanGUI_2(obj)
    end
   
    
end

