classdef Pacman
    %UNTITLED3 Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        agentIndex;
    end
    
    methods
        function obj = Pacman()
            obj.agentIndex = 1;
        end
        
        function action = getAction(obj, gameState)
            legalDirections = obj.getLegalDirections(gameState);
            userInput = obj.getUserInput();
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
        
        function userInput = getUserInput(obj)
            set(gcf,'doublebuffer','on');
            set(gcf,'KeyPressFcn','keydown=1;');

            j = 5;
            keyIn = '';
            keydown = 0;
            tStart = tic;
            while true
                keyIn = double(get(gcf,'CurrentCharacter')); % compare the values to the list
                % below:
                %     28 => leftArrow
                %     29 => rightArrow
                %     30 => upArrow
                %     31 => downArrow
                if keydown==1 % a key was pressed
                    display('Key pressed');
                    keydown = 0;
                    switch keyIn
                        case 28
                            fprintf('left\n');
                        case 29
                            fprintf('right\n');
                        case 30
                            fprintf('up\n');
                        case 31
                            fprintf('down\n');
                        otherwise
                            break;
                    end
                    
                    break;
                else
                    if (toc(tStart) > 1)
                        userInput = {};
                        break;
                    else
                        continue;
                    end
                end
                pause(0.05);
            end
        end
    end
    
end

