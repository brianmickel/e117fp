classdef Ghost
    %UNTITLED3 Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        agentIndex;
    end
    
    methods
        function obj = Ghost(idx)
            obj.agentIndex = idx;
        end
        
        function actionVector = getAction(obj, gameState)
            legalDirections = obj.getLegalDirections(gameState);
            if any(strcmpi(legalDirections,gameState.agentDirection(obj.agentIndex))) % current direction is possible
                actionVector = Directions.dirVectorsFunc(gameState.agentDirection(obj.agentIndex));
                return
            else
                i = randi(length(legalDirections));
                actionVector = Directions.dirVectorsFunc(legalDirections{i})
                return
            end
            
            
        end
        
        function legalDirections = getLegalDirections(obj, gameState)
            legalDirections = {};
            %N
            
            if (~gameState.isWall(gameState.agentPosition{obj.agentIndex} + Directions.dirVectors.N))
                legalDirections{end+1} = 'N';
            end
            %S
            if (~gameState.isWall(gameState.agentPosition{obj.agentIndex} + Directions.dirVectors.S))
                legalDirections{end+1} = 'S';
            end
            
            %E
            if (~gameState.isWall(gameState.agentPosition{obj.agentIndex} + Directions.dirVectors.E))
                legalDirections{end+1} = 'E';
            end
            %W
            if (~gameState.isWall(gameState.agentPosition{obj.agentIndex} + Directions.dirVectors.W))
                legalDirections{end+1} = 'W';
            end
            %Q
%             legalDirections{end+1} = 'Q';
        end
        
        
    end
    
end

