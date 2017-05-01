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
    mindist = 100; mindir = 'Q';
    for i = 2:length(gameState.agents)
        dist2ghost = gameState.agentPosition{i} - curpos;
        if dist2ghost(1) == 0
            if dist2ghost(2) > 0
                dist2ghost = dist2ghost(2);
                dir2ghost = 'E';
            elseif dist2ghost(2) < 0
                dist2ghost = dist2ghost(2);
                dir2ghost = 'W';
            end
        elseif dist2ghost(2) == 0
            if dist2ghost(1) > 0
                dist2ghost = dist2ghost(1);
                dir2ghost = 'S';
            elseif dist2ghost(1) < 0
                dist2ghost = dist2ghost(1);
                dir2ghost = 'N';
            end
        end
        if length(dist2ghost) == 1
            if dist2ghost < mindist
                mindist = dist2ghost;
                mindir = dir2ghost;
            end
        end
    end
    
    % if current gameState.agentDirection(obj.agentIndex) is
    % available:
    %   move there
    %   if we are at a junction:
    %       randomly pick any direction, except opposite of current
    %       direction (previous spot)
    %   if move takes it too close to a nearby ghost & if there are
    %   other legal moves
    %       randomly pick any other legal move
    % else:
    %   move to legal move that is not opposite of current
    %   direction (previous spot)

    % figure out move
    if any(strcmpi(legalDirectionsCell,curdir)) % current direction is possible
        direction = curdir;
        action = Directions.dirVectorsFunc(direction);
        if length(legalDirections) > 2 % at junction (3+ moves)
            junctionDirections = legalDirections(legalDirections~=negdir); % remove opposite direction
            l = length(junctionDirections);
            direction = junctionDirections(randi(l)); % randomly pick direction
            action = Directions.dirVectorsFunc(direction);
            disp('junction')
        end
        if (mindist <= 5) && (strcmp(mindir,curdir)) % too close to nearest ghost
            if length(legalDirections > 1)
                options = legalDirections(legalDirections~=mindir);
                l = length(options);
                direction = options(randi(l));
                action = Directions.dirVectorsFunc(direction);
                disp('ghost avoid')
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
        disp('current direction not feasible')
    end
end