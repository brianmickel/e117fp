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

        bool = isWall(obj,vector)
        bool = isGhostPit(obj,vector)
        bool = hasFood(obj,vector)
        generateInitialState(obj)
        bool = checkIfGameOver(obj)
        bool = checkEat(obj)
        
    end
    
    methods (Static)
        function newGameState = generateNextState(gameState,actions,currActor)
            newGameState = GameState(gameState.game, gameState);
            i = currActor;
            newGameState.agentPosition{i} = gameState.agentPosition{i} + actions{i};
            newGameState.agentDirection{i} = Directions.actionToDir(actions{i});
            %update directions and such
%             newGameState.agentDirection{i} = Directions.actionToDir(actions{i});
            
            %check if food eaten
            %check if collisions and such
        end

    end
        
    
end

