function bool = checkIfGameOver(obj)
%checks if game is over
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
    
    dirPac = obj.agentDirection{1};
    dirGho = obj.agentDirection{2};

    %same space
    if coordsPac(1) == coordsGho(1) && coordsPac(2) == coordsGho(2)
        bool = true;
    end

    %switching places
    if coordsPac(1) == coordsGhoPrev(1) && coordsPac(2) == coordsGhoPrev(2) &&...
            dirPac == Directions.oppositeDir(dirGho)
        % coordsPac == coordsPacPrev bc double refresh
        %coordsGho(1) == coordsPacPrev(1) && coordsGho(2) == coordsPacPrev(2)
        %not needed because gamestate
        %updates twice pacman first then ghost  
        bool = true;
    end

    display(bool)
    return
end