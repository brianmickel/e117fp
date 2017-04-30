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
    
    methods
        function obj = Game()
            obj.isGameOver = false;
            obj.initializeGame();
        end
        
        function initializeGame(obj)
            obj.gameState = GameState(obj);
        end
        
        function run(obj)
            %
                charpos = [];
                charpos(1,1) = obj.gameState.agentPosition{1}(1);
                charpos(1,2) = obj.gameState.agentPosition{1}(2);
                charpos(2,1) = obj.gameState.agentPosition{2}(1);
                charpos(2,2) = obj.gameState.agentPosition{2}(2);
                
                %[East, South, West, North] = [1,2,3,4]
                charors = [];
                charors(1,1) = Directions.henryNumberMapFunc(obj.gameState.agentDirection{1});
                charors(2,1) = Directions.henryNumberMapFunc(obj.gameState.agentDirection{2});
                
            obj.Map = Board(obj.gameState.isWallBoolArray,charpos,...
                               charors,obj.gameState.foodLocBoolArray).Map;
            pacmanGUI_2(obj);
            %
            pause(1);
            q = 0;
            % Main Control Loop For Game
            while ~obj.isGameOver
                actions = {};
                
                %solicit actions
                %execute actions
                for i = 1:length(obj.agents)
                    actions{i} = obj.agents{i}.getAction(obj.gameState);
                    obj.gameState = GameState.generateNextState(obj.gameState,actions,i);
                end
                
                %update display with successive gamestate
                charpos = [];
                charpos(1,1) = obj.gameState.agentPosition{1}(1);
                charpos(1,2) = obj.gameState.agentPosition{1}(2);
                charpos(2,1) = obj.gameState.agentPosition{2}(1);
                charpos(2,2) = obj.gameState.agentPosition{2}(2);
                
                %[East, South, West, North] = [1,2,3,4]
                charors = [];
                charors(1,1) = Directions.henryNumberMapFunc(obj.gameState.agentDirection{1});
                charors(2,1) = Directions.henryNumberMapFunc(obj.gameState.agentDirection{2});

                
                obj.Map = Board(obj.gameState.isWallBoolArray,charpos,...
                               charors,obj.gameState.foodLocBoolArray).Map; % make a Board object
                %%%
                    % Define Color Map
                colmap = [255 75 75; % red 1
                255 220 0; % Cal yellow 2
                255 102 178; % pink 3
                0 0 0; % black 4
                0 150 255; % light blue 5
                0 0 255; % Cal blue 6
                192 192 192; % silver 7
                ]/255;
%                 % Figure handle
%                 obj.Figure = figure('Name','E177 PacMan',...
%                     'MenuBar','none',...
%                     'Resize','off');
% 
%                 fpos = get(obj.Figure,'Position');
%                 set(obj.Figure, 'Position', [fpos(1:2), 700, 374.9933]);
% 
                % Left panel
                boardPanel = uipanel ('Parent', obj.Figure,...
                    'Units', 'normalized',...
                    'Position', [0, 0, .6, 1]);

                boardAxes = axes(boardPanel,...
                    'Position',[.1 .1 .8 .8]);
                colormap(colmap);
                image(cell2mat(obj.Map)) % display the game board
                pause(.01);
                %%%
                
                if obj.gameState.checkEat()
                    %update score
                    %notify(obj.Figure,'Score')
                    display('Score')
                    display(obj.gameState.score)
                end
                %refreshdata(obj.Figure);
                display('Positions')
                display(obj.gameState.agentPosition{1})
                display(obj.gameState.agentPosition{2})
                
                q = q + 1;
                if q == 100
                    obj.isGameOver = true;
                end
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

