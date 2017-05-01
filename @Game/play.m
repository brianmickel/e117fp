function play(obj)
    % play the game!
    disp('Game Started!')
    % Main Control Loop For Game
    while ~obj.isGameOver
        actions = {};
        %solicit and execute actions
        for i = 1:length(obj.agents)
            actions{i} = obj.agents{i}.getAction(obj.gameState);
            obj.gameState = GameState.generateNextState(obj.gameState,actions,i);
        end

        %update display with successive gamestate
        obj.Map = Board(obj.gameState).Map; % make a Board object
        %%%
        
        %%update board
        % Define Color Map
        colmap = [255  75  75; % red 1
                  255 220   0; % Cal yellow 2
                  255 102 178; % pink 3
                    0   0   0; % black 4
                    0 150 255; % light blue 5
                    0   0 255; % Cal blue 6
                  192 192 192; % silver 7
                              ]/255;

        % Left panel
        boardPanel = uipanel ('Parent', obj.Figure,...
            'Units', 'normalized',...
            'Position', [0, 0, .6, 1]);

        boardAxes = axes(boardPanel,...
            'Position',[.1 .1 .8 .8]);
        colormap(colmap);
        image(cell2mat(obj.Map)) % display the game board
        axis off;
        pause(.01);
        %%%

        if obj.gameState.checkEat()
            notify(obj,'UpdateScore')
        end

        if obj.gameState.checkIfGameOver()
            display('gameOver')
            obj.isGameOver = true;
        end

%         display('Positions')
%         display(obj.gameState.agentPosition{1})
%         display(obj.gameState.agentPosition{2})
    end
end