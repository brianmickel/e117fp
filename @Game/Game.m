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
        
        function initializeGame(obj)
            obj.gameState = GameState(obj); % initialize game state
            foodpos = obj.gameState.foodLocBoolArray;
            wallpos = obj.gameState.isWallBoolArray;
            a = obj.gameState.agentPosition;
            charpos = [];
            for i = 1:length(a)
                charpos(i,:) = a{i};
            end
            charor = [];
            charor(1,1) = Directions.henryNumberMapFunc(obj.gameState.agentDirection{1});
            charor(2,1) = Directions.henryNumberMapFunc(obj.gameState.agentDirection{2});
                
            obj.Map = Board(wallpos,charpos,charor,foodpos).Map;
            pacmanGUI_2(obj); % intialized GUI
        end
        
            
        end
    end
        
%         function boolean = getProgress(obj)
%             if obj.isGameOver
%                 int = 1;
%                 return;
%             else
%                 int = obj.rules.getProgress(obj);
%                 return;
%             end
%         end
        
        
    
end

