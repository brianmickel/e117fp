function action = getAction(obj, gameState)
    legalDirections = obj.getLegalDirections(gameState);
    %userInput = obj.getUserInput();
    userInput = [];
    if isempty(userInput)
        %continue in same direction or Q
        if any(strcmpi(legalDirections,gameState.agentDirection(obj.agentIndex))) % current direction is possible
            action = Directions.dirVectorsFunc(gameState.agentDirection(obj.agentIndex));
            return
        else
            t = randi(length(legalDirections));
            action = Directions.dirVectorsFunc(legalDirections{t});
            return;
        end
    else 
        if any(strcmpi(userInput,legalDirections))
            action = Directions.actionVectors(userInput)
            return
        else
            %continue in same direction or Q
            if any(strcmpi(legalDirections,gameState.agentDirection(obj.agentIndex))) % current direction is possible
                action = Direction.dirVectors(gameState.agentDirection(obj.agentIndex));
                return
            else
                action = Directions.dirVectors.Q;
                return;
            end
        end

    end

end