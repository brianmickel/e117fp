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
        lastGameState;
        
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
                obj.lastGameState = varargin{2};
            end
        end
        
        function generateInitialState(obj)
            obj.isWallBoolArray = logical([1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
                                            1 0 0 0 0 0 0 0 0 0 0 0 0 0 1;
                                            1 0 1 1 1 0 1 1 1 0 1 0 1 0 1;
                                            1 0 1 0 1 0 1 0 1 0 1 0 1 0 1;
                                            1 0 1 0 0 0 1 1 1 0 1 0 1 0 1;
                                            1 0 1 0 1 0 1 0 1 0 1 0 0 0 1;
                                            1 0 1 1 1 0 1 0 1 0 1 1 1 0 1;
                                            1 0 0 0 0 0 0 0 0 0 0 0 0 0 1;
                                            1 1 1 1 1 1 1 1 1 1 1 1 1 1 1]);
                                    
            obj.foodLocBoolArray = logical([0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
                                            0 1 1 1 1 1 1 1 1 1 1 1 1 1 0;
                                            0 1 0 0 0 1 0 0 0 1 0 1 0 1 0;
                                            0 1 0 0 0 1 0 0 0 1 0 1 0 1 0;
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
        
        function bool = isGhostPit(obj,vector)
            bool = obj.ghostPitLocBoolArray(vector(1),vector(2));
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
        
        function bool = checkIfGameOver(obj)
            bool = false;
            
            % game ends with no food
            if ~any(obj.foodLocBoolArray)
                bool = true;
            end
            % game ends with collision
            coordsPac = obj.agentPosition{1};
            coordsGho = obj.agentPosition{2};
            coordsPacPrev = obj.lastGameState.agentPosition{1};
            coordsGhoPrev = obj.lastGameState.agentPosition{2};
            
            %same space
            if coordsPac(1) == coordsGho(1) && coordsPac(2) == coordsGho(2)
                bool = true;
            end
            
            %switching places
            if coordsPac(1) == coordsGhoPrev(1) && coordsPac(2) == coordsGhoPrev(2) 
                % coordsPac == coordsPacPrev bc double refresh
                %coordsGho(1) == coordsPacPrev(1) && coordsGho(2) == coordsPacPrev(2)
                %not needed because gamestate
                %updates twice pacman first then ghost  
                bool = true;
            end
            
            display(bool)
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

