classdef SuperSmartPacman < Agent
    %UNTITLED3 Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
    end
    
    methods
        function obj = SuperSmartPacman()
            obj.agentIndex = 1;
        end
        
        function action = getAction(obj, gameState)
            legalDirectionsCell = obj.getLegalDirections(gameState);
            legalDirections = cell2mat(legalDirectionsCell);
            disp(legalDirections)
            curpos = gameState.agentPosition{obj.agentIndex};
            curdir = string(gameState.agentDirection(obj.agentIndex));
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
            mindist = [100 100]; mindir = 'Q';
            for i = 2:length(gameState.agents)
                dist2ghost = gameState.agentPosition{i} - curpos;
                escapeDirs = {{'S','E'},{'S','W'},{'N','E'},{'N','W'}};
                escapeDir = escapeDirs{randi(4)};
                if dist2ghost(1) < 0
                    if dist2ghost(2) < 0
                        escapeDir = {'S','E'};
                    elseif dist2ghost(2) > 0
                        escapeDir = {'S','W'};
                    else
                        escapeDir = {'S'};
                    end
                elseif dist2ghost(1) > 0
                    if dist2ghost(2) < 0
                        escapeDir = {'N','E'};
                    elseif dist2ghost(2) > 0
                        escapeDir = {'N','W'};
                    else
                        escapeDir = {'N'};
                    end
                elseif dist2ghost(2) < 0
                    if dist2ghost(1) < 0
                        escapeDir = {'S','E'};
                    elseif dist2ghost(1) > 0
                        escapeDir = {'N','E'};
                    else
                        escapeDir = {'E'};
                    end
                elseif dist2ghost(2) > 0
                    if dist2ghost(1) < 0
                        escapeDir = {'S','W'};
                    elseif dist2ghost(1) > 0
                        escapeDir = {'N','W'};
                    else
                        escapeDir = {'W'};
                    end
                
                end
                
                if max(abs(dist2ghost)) < max(abs(mindist))
                    mindist = dist2ghost;
                    mindir = escapeDir;
                end
            end
            disp(mindir)
            
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
            else % edge cases
                if length(legalDirections) > 1
                    options = legalDirections;
                    options = options(options~=negdir);
                    l = length(options);
                    direction = options(randi(l));
                    action = Directions.dirVectorsFunc(direction);
                else % only 1 movement option
                    direction = legalDirections(1);
                    action = Directions.dirVectorsFunc(direction);
                end
            end
            if length(legalDirections) > 2 % at junction (3+ moves)
                junctionDirections = legalDirections(legalDirections~=negdir); % remove opposite direction
                l = length(junctionDirections);
                direction = junctionDirections(randi(l)); % randomly pick direction
                action = Directions.dirVectorsFunc(direction);
            end
            if max(abs(mindist)) <= 4 % move away from ghost
                options = '';
                for i = 1:length(mindir)
                    if any(strcmpi(legalDirectionsCell,mindir{i}))
                        c2m = cell2mat(mindir);
                        options(end+1) = c2m(i);
                    end
                end
                if length(options) > 0
                    l = length(options);
                    direction = options(randi(l));
                    action = Directions.dirVectorsFunc(direction);
                else
                    options = legalDirections;
                    l = length(options);
                    direction = options(randi(l));
                    action = Directions.dirVectorsFunc(direction);
                end
            end
            
            
        end
        
        function legalDirections = getLegalDirections(obj, gameState)
            legalDirections = {};
            %N
            if (~gameState.isWall(gameState.agentPosition{obj.agentIndex} + Directions.dirVectors.N)) && (~gameState.isGhostPit(gameState.agentPosition{obj.agentIndex} + Directions.dirVectors.N))
                legalDirections{end+1} = 'N';
            end
            %S
            if (~gameState.isWall(gameState.agentPosition{obj.agentIndex} + Directions.dirVectors.S)) && (~gameState.isGhostPit(gameState.agentPosition{obj.agentIndex} + Directions.dirVectors.S))
                legalDirections{end+1} = 'S';
            end
            %E
            if (~gameState.isWall(gameState.agentPosition{obj.agentIndex} + Directions.dirVectors.E)) && (~gameState.isGhostPit(gameState.agentPosition{obj.agentIndex} + Directions.dirVectors.E))
                legalDirections{end+1} = 'E';
            end
            %W
            if (~gameState.isWall(gameState.agentPosition{obj.agentIndex} + Directions.dirVectors.W)) && (~gameState.isGhostPit(gameState.agentPosition{obj.agentIndex} + Directions.dirVectors.W))
                legalDirections{end+1} = 'W';
            end
            %Q
%             legalDirections{end+1} = 'Q';
        end
        
    end
    
end

