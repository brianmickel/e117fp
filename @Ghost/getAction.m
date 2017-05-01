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