classdef Directions
    %UNTITLED4 Summary of this class goes here
    %   Detailed explanation goes here
    
    properties (Constant)
        % [di; dj]
        dirVectors = struct('N', [ 0;-1],...
                      'S', [ 0; 1],...
                      'E', [ 1; 0],...
                      'W', [-1; 0],...
                      'Q', [0; 0]);
        dirLetterReverse = struct('N', 'S',...
                            'S', 'N',...
                            'E', 'W',...
                            'W', 'E');
        henryNumberMap = struct('N', 4,...
                                'S', 2,...
                                'E', 1,...
                                'W', 3);
        %{
        dirLetterLeft = {'N': [ 0;-1],...
                         'S': [ 0; 1],...
                         'E': [ 1; 0],...
                         'W': [-1; 0],...
                         'Q': [-1; 0]};
                     
        dirLetterRight = {'N': [ 0;-1],...
                         'S': [ 0; 1],...
                         'E': [ 1; 0],...
                         'W': [-1; 0],...
                         'Q': [-1; 0]};
                            
        efer; 
                            %}
        
    end
    
    methods (Static)
        function vect = dirVectorsFunc(letter)
                if strcmpi(letter, 'N')
                    vect = Directions.dirVectors.N;
                    return
                elseif strcmpi(letter, 'S')
                    vect = Directions.dirVectors.S;
                    return
                elseif strcmpi(letter, 'E')
                    vect = Directions.dirVectors.E;
                    return
                elseif strcmpi(letter, 'W')
                    vect = Directions.dirVectors.W;
                    return
                elseif strcmpi(letter, 'Q')
                    vect = Directions.dirVectors.Q;
                    return
                end
        end
        
        function num = henryNumberMapFunc(letter)
                if strcmpi(letter, 'N')
                    num = Directions.henryNumberMap.N;
                    return
                elseif strcmpi(letter, 'S')
                    num = Directions.henryNumberMap.S;
                    return
                elseif strcmpi(letter, 'E')
                    num = Directions.henryNumberMap.E;
                    return
                elseif strcmpi(letter, 'W')
                    num = Directions.henryNumberMap.W;
                    return
                end
        end
        
        function letter = actionToDir(actionVector)
            %what about Q
            if actionVector(1) == 0
                
                if actionVector(2) == 0
                    letter = 'Q';
                elseif actionVector(2) == 1 %
                    letter = 'S';
                elseif actionVector(2) == -1 %
                    letter = 'N';
                end
                
            elseif actionVector(1) == 1 %
                
                if actionVector(2) == 0
                    letter = 'E';
                    return
                elseif actionVector(2) == 1 %
                    %not possible
                elseif actionVector(2) == -1 %
                    %not possible
                end
                
            elseif actionVector(1) == -1 %
                if actionVector(2) == 0
                    letter = 'W';
                    return
                elseif actionVector(2) == 1 %
                    %not possible
                elseif actionVector(2) == -1 %
                    %not possible
                end
            end
        end
    end
    
end

