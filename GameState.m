classdef GameState < handle
    %%A GameState specifies the full game state, including the food, capsules,
    % agent configurations and score changes.
    % 
    % GameStates are used by the Game object to capture the actual state of the game and
    % can be used by agents to reason about the game.
    % 
    % Much of the information in a GameState is stored in a GameStateData object.  We
    % strongly suggest that you access that data via the accessor methods below rather
    % than referring to the GameStateData object directly.
    % 
    % Note that in classic Pacman, Pacman is always agent 0

    properties
        game;
        agents;
        agentPosition;
        agentDirection;
        foodLocBoolArray;
        isWallBoolArray;
        ghostPitLocBoolArray;
        score;
        
    end
    
    methods
        function obj = GameState(varargin)
            if nargin == 1
                %generate initial state
                obj.game = varargin{1};
                obj.generateInitialState()
            elseif nargin == 2
                %generate successive state from 
                obj.agents = varargin{2}.agents;
                obj.foodLocBoolArray = varargin{2}.foodLocBoolArray;
                obj.isWallBoolArray = varargin{2}.isWallBoolArray;
                obj.ghostPitLocBoolArray = varargin{2}.ghostPitLocBoolArray;
                obj.agentPosition = varargin{2}.agentPosition;
                obj.agentDirection = varargin{2}.agentDirection;
                obj.score = varargin{2}.score;
            end
        end
        
        function generateInitialState(obj)
            obj.isWallBoolArray = logical([1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
                                            1 0 0 0 0 0 0 0 0 0 0 0 0 0 1;
                                            1 0 1 1 1 0 1 1 1 0 1 0 1 0 1;
                                            1 0 1 0 1 0 1 0 1 0 1 0 1 0 1;
                                            1 0 1 0 1 0 1 1 1 0 1 0 1 0 1;
                                            1 0 1 0 1 0 1 0 1 0 1 0 0 0 1;
                                            1 0 1 1 1 0 1 0 1 0 1 1 1 0 1;
                                            1 0 0 0 0 0 0 0 0 0 0 0 0 0 1;
                                            1 1 1 1 1 1 1 1 1 1 1 1 1 1 1]);
                                    
            obj.foodLocBoolArray = logical([0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
                                        0 1 1 1 1 1 1 1 1 1 1 1 1 1 0;
                                        0 1 0 0 0 1 0 0 0 1 0 1 0 1 0;
                                        0 1 0 0 0 1 0 1 0 1 0 1 0 1 0;
                                        0 1 0 0 0 1 0 0 0 1 0 1 0 1 0;
                                        0 1 0 0 0 1 0 1 0 1 0 1 1 1 0;
                                        0 1 0 0 0 1 0 1 0 1 0 0 0 1 0;
                                        0 1 1 1 1 1 1 1 1 1 1 1 1 1 0;
                                        0 0 0 0 0 0 0 0 0 0 0 0 0 0 0]);
                                    
            obj.ghostPitLocBoolArray = logical([0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
                                                0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
                                                0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
                                                0 0 0 1 0 0 0 0 0 0 0 0 0 0 0;
                                                0 0 0 1 1 0 0 0 0 0 0 0 0 0 0;
                                                0 0 0 1 0 0 0 0 0 0 0 0 0 0 0;
                                                0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
                                                0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
                                                0 0 0 0 0 0 0 0 0 0 0 0 0 0 0]);
            obj.agents = {};
            obj.agents{1} = Pacman();
            obj.game.agents{1} = Pacman();
            obj.agents{2} = Ghost(2);
            obj.game.agents{2} = Ghost(2);  
            
            obj.agentPosition = {};
            obj.agentPosition{1} = [2;2];
            obj.agentPosition{2} = [5;6];
            
            obj.agentDirection = {};
            obj.agentDirection{1} = 'E';
            obj.agentDirection{2} = 'N';
            
            obj.score = 0;
        end
        
        function bool = isWall(obj,vector)
%             display('Wall Check');
%             display(vector(1));
%             display(vector(2));
            bool = obj.isWallBoolArray(vector(1),vector(2));
            return
        end
        
        function bool = checkEat(obj)
            bool = false;
            coords = obj.agentPosition{1};
            if obj.foodLocBoolArray(coords(1),coords(2))
                bool = true;
                obj.foodLocBoolArray(coords(1),coords(2)) = false;
                obj.score = obj.score + 10;
            end
            return
        end
        
    end
    
    methods (Static)
        function newGameState = generateNextState(gameState,actions,currActor)
            newGameState = GameState(gameState.game, gameState);
            i = currActor;
            newGameState.agentPosition{i} = gameState.agentPosition{i} + actions{i};
            newGameState.agentDirection{i} = Directions.actionToDir(actions{i});
            %update directions and such
            
            %check if food eaten
            %check if collisions and such
        end

    end
        
    
end

