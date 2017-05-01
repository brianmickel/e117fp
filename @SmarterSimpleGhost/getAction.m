function action = getAction(obj, gameState)
    legalDirectionsCell = obj.getLegalDirections(gameState);
    legalDirections = cell2mat(legalDirectionsCell);
    curpos = gameState.agentPosition{obj.agentIndex};
    curdir = string(gameState.agentDirection(obj.agentIndex));
    disp(curdir)
    negdir = ''; % opposite direction
    if curdir == 'N'
        negdir = 'S';
    elseif curdir == 'S'
        negdir = 'N';
    elseif curdir == 'E'
        negdir = 'W';
    elseif curdir == 'W'
        negdir = 'E';
    end

    dist2pac = gameState.agentPosition{1} - curpos;
    dir2pac = 'Q';
    if dist2pac(1) == max(abs(dist2pac))
        if dist2pac(1) > 0
            dir2pac = 'S';
        elseif dist2pac < 0
            dir2pac = 'N';
        end
    elseif dist2pac(2) == max(abs(dist2pac))
        if dist2pac(2) > 0
            dir2pac = 'E';
        elseif dist2pac(2) < 0
            dir2pac = 'W';
        end
    end
    dist2pac = max(dist2pac);

    % if current direction is available:
    %   move there
    %   if ghost is at junction:
    %       randomly pick direction (not negdir)
    %   

    if any(strcmpi(legalDirectionsCell,curdir)) % current direction is possible
        direction = curdir;
        action = Directions.dirVectorsFunc(direction);
        if length(legalDirections) > 2 % at junction (3+ moves)
            junctionDirections = legalDirections(legalDirections~=negdir);
            l = length(junctionDirections);
            direction = junctionDirections(randi(l));
            action = Directions.dirVectorsFunc(direction);
        end
        if dist2pac <= 8 % chase pacman
            if any(strcmpi(legalDirectionsCell,dir2pac)) % move toward pacman is possible
                direction = dir2pac;
                action = Directions.dirVectorsFunc(direction);
            end
        end
    else
        if length(legalDirections) > 1
            options = legalDirections;
            options = options(options~=negdir);
            l = length(options);
            direction = options(randi(l));
            action = Directions.dirVectorsFunc(direction);
        else
            direction = legalDirections(1);
            action = Directions.dirVectorsFunc(direction);
        end
    end

end