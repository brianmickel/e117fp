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