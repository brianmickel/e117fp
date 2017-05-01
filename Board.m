classdef Board < handle
    % Initializes game board
    % Takes input board_type to determine which board is made
    % positions of objects are inputs
    
    properties
        Map
    end
    
    methods
        function obj = Board(gameState)
            % Board class constructor (adapted from GenerateMap)
            %%GenerateMap: generates a new game board with walls, food items, and
            %%characters for each iteration of game
            % INPUTS: 
            % foodLocBoolArray: [mxn (size of board)] Boolean Array, 1-food, 0- no food
            % wallLocBoolArray: [mxn (size of board)] Boolean Array, 1-wall, 0- no
            % wall
            % charpos: [Nx2] doubles array: [i,j] indices of location on
            % board
            % charor: [Nx1] doubles array: orientation of characters
                %[East, South, West, North] = [1,2,3,4]
                
                
            %%%%%% GameState Object to ===> wallpos,charpos,charor,foodpos
            wallpos = gameState.isWallBoolArray;
            foodpos = gameState.foodLocBoolArray;

            charpos = [];
            charor = [];

            for i = 1:length(gameState.agents)
                %charpos
                charpos(i,1) = gameState.agentPosition{i}(1);
                charpos(i,2) = gameState.agentPosition{i}(2);
                %charors
                charor(i,1) = Directions.henryNumberMapFunc(gameState.agentDirection{i});
            end
            %%%%%%
            
            walls = wallpos;
            foods = foodpos;
            players = charpos; 
            orient = charor;
            
            % Define Color Map
            colmap = [255 75 75; % red 1
            255 220 0; % Cal yellow 2
            255 102 178; % pink 3
            0 0 0; % black 4
            0 150 255; % light blue 5
            0 0 255; % Cal blue 6
            192 192 192; % silver 7
            ]/255;
            
            % Generate Map
            
            [m,n] = size(walls);
            map = cell(m,n);

            % Pacman Templates
            temp_pac = ones(10,10).*5;
            temp_pac([2,9],4:6) = 2;
            temp_pac(3,3:7) = 2;
            temp_pac(4,2:8) = 2;
            temp_pac(5,2:6) = 2;
            temp_pac(6,2:4) = 2;
            temp_pac(7,2:6) = 2;
            temp_pac(8,3:8) = 2;
            temp_pac(4,5) = 4;

            pac{1} = temp_pac; %east
            pac{2} = pac{1}'; %south
            pac{3}= fliplr(pac{1}); %west
            pac{4} = flipud(pac{2}); %north

            % Food Template

            food = ones(10,10).*5;
            food(5:6,5:6) = ones(2,2).*7;

            % Ghost Template

            temp_ghost_back = zeros(10,10);
            temp_ghost = zeros(10,10);
            temp_ghost_eyes = zeros(10,10);
            temp_ghost(3,4:7) = 1;
            temp_ghost(4,3:8) = 1;
            temp_ghost(5,[3,5:6,8]) = 1;
            temp_ghost_eyes(5,[4,7]) = 4;
            temp_ghost(6,3:8) = 1;
            temp_ghost([7,8],[3,5,6,8]) = 1;

            ghost{1} = temp_ghost_back + temp_ghost_eyes + temp_ghost.*3; % (pink)
%             ghost{1,2} = ghost{1,1}'; %south
%             ghost{1,3} = rot90(ghost{1,2}); %west
%             ghost{1,4} = rot90(ghost{1,3}); %north
            ghost{2} = temp_ghost_back + temp_ghost_eyes + temp_ghost.*1; % (red)
%             ghost{2,2} = ghost{2,1}'; %south
%             ghost{2,3} = rot90(ghost{2,2}); %west
%             ghost{2,4} = rot90(ghost{2,3}); %north
            ghost{3} = temp_ghost_back + temp_ghost_eyes + temp_ghost.*7; % (silver)
%             ghost{3,2} = ghost{3,1}'; %south
%             ghost{3,3} = rot90(ghost{3,2}); %west
%             ghost{3,4} = rot90(ghost{3,3}); %north
            
            [x,y] = size(ghost);
            for i = 1:x
                for j = 1:y
                    ind = find(ghost{i,j} == 0);
                    ghost{i,j}(ind) = 5;
                end
            end
            
            % Assemble [map] tile-by-tile
            
            ind_food = find(foods == 1);
            
            [wall_ind(:,1), wall_ind(:,2)] = find(walls == 1);
            [hall_ind(:,1), hall_ind(:,2)] = find(walls == 0);
            
            if ~isempty(ind_food)
            [food_ind(:,1), food_ind(:,2)] = find(foods == 1);
            end
            
            % Insert walls, halls, and food
            for i = 1:length(wall_ind)
                map{wall_ind(i,1), wall_ind(i,2)} = ones(10,10).*6;
            end
            for i = 1:length(hall_ind)
                map{hall_ind(i,1), hall_ind(i,2)} = ones(10,10).*5;
            end
            
            [f_r, ~] = size(food_ind);
            
            if ~isempty(ind_food)
                for i = 1:f_r
                    map{food_ind(i,1), food_ind(i,2)} = food;
                end
            end
            
            % Insert characters in the right orientation
            display(['orientation:',num2str(orient(1))]);
            map{players(1,1), players(1,2)} = pac{orient(1)};
            
            [r,~] = size(players);
            
            for i = 1:r-1
                map{players(i+1,1), players(i+1,2)} = ghost{i};
            end

            obj.Map = map;
            %colormap(colmap);
            % image(cell2mat(map));
            
        end
        
    end
    
end