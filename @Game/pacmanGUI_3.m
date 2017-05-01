function pacmanGUI_3(obj)
% Define Color Map
colmap = [255 75 75; % red 1
    255 220 0; % Cal yellow 2
    255 102 178; % pink 3
    0 0 0; % black 4
    0 150 255; % light blue 5
    0 0 255; % Cal blue 6
    192 192 192; % silver 7
    ]/255;
% Figure handle
obj.Figure = figure('Name','E177 PacMan',...
    'MenuBar','none',...
    'Resize','off');

fpos = get(obj.Figure,'Position');
set(obj.Figure, 'Position', [fpos(1:2), 700, 374.9933]);

% Left panel
boardPanel = uipanel ('Parent', obj.Figure,...
    'Units', 'normalized',...
    'Position', [0, 0, .6, 1]);

boardAxes = axes(boardPanel,...
    'Position',[.1 .1 .8 .8]);
colormap(colmap);
image(cell2mat(obj.Map)) % display the game board
axis off;

% Right panel #1
% First right panel will display title, instructions, and button to continue onto the next window
rightPanel = uipanel('Parent',obj.Figure,...
    'Units','normalized',...
    'Position',[.6 0 .4 1]);

% Subpanel for title
titlePanel = uipanel('Parent',rightPanel,...
    'BorderType','none',...
    'Units','normalized',...
    'Position',[.1 .7 .8 .25]);

titleAxes = axes('Parent',titlePanel,...
    'Units','normal',...
    'Position',[0 0 1 1]);

titleImage = imshow('E177.png'); % get PNG

% Subpanel with instructions
instructionsPanel = uipanel('Parent',rightPanel,...
    'Title','Game Instructions',...
    'Units','normalized',...
    'Position',[.1 .1 .8 .6]);

instructionsText_welcome = uicontrol('Parent',instructionsPanel,...
    'Units', 'normalized',...
    'Position',[.1 .53 .8 .4],...
    'Style','text',...
    'FontSize', 8,...
    'HorizontalAlignment','left',...
    'String','Welcome to E177 Pac-Man! Watch how an AI bot plays a game of Pac-Man.');

instructionsText_ghosts = uicontrol('Parent',instructionsPanel,...
    'Units', 'normalized',...
    'Position',[.1 .48 .8 .2],...
    'Style','text',...
    'FontSize', 8,...
    'HorizontalAlignment','left',...
    'String','NUMBER OF GHOSTS: Select the number of ghosts that Pac-Man must avoid to stay alive.');

instructionsText_board = uicontrol('Parent',instructionsPanel,...
    'Units', 'normalized',...
    'Position',[.1 .18 .8 .25],...
    'Style','text',...
    'FontSize', 8,...
    'HorizontalAlignment','left',...
    'String','BOARD TYPE: Select one of two unique maps that Pac-Man can play on.');

instructionsNext = uicontrol('Parent', instructionsPanel,...
    'Style', 'pushbutton',...
    'String', 'Select Options',...
    'Units', 'normalized',...
    'Position', [.35 .05 .5 .14],...
    'Callback', @next_callback); % This will cause the right panel to
%         completely change

    function next_callback (h,d)
        % This will cause the right panel to
        %         completely change
        set(instructionsPanel, 'Title', 'Game Options');
        set(instructionsText_welcome, 'Visible', 'off');
        set(instructionsText_board, 'Visible', 'off');
        set(instructionsText_ghosts, 'Visible', 'off');
        set(instructionsNext, 'Visible', 'off');
        modePanel = instructionsPanel;
        
        % Proceed with Right Panel #2
        selectText = uicontrol('Parent',modePanel,...
            'Units', 'normalized',...
            'Position',[.1 .65 .8 .3],...
            'Style','text',...
            'FontSize', 8,...
            'HorizontalAlignment','left',...
            'String','Select number of ghosts and board type, then click "Submit". Once submitted, click "Play" to begin  the game!');
        
        ghostMenu = uicontrol('Parent', modePanel,...
            'Style', 'popup',...
            'Units', 'normalized',...
            'Position', [.17 .57 .7 .08],...
            'String', {'Select # Ghosts', '0 ghosts', '1 ghost', '2 ghosts', '3 ghosts'});
        %     'Callback', @numberghosts_callback);
        
        boardMenu = uicontrol('Parent', modePanel,...
            'Style', 'popup',...
            'Units', 'normalized',...
            'Position', [.17 .42 .7 .08],...
            'String', {'Select Board', '"E 177" map', '"Cal" map'});
        %     'Callback', @boardtype_callback);
        
        modeSubmit = uicontrol('Parent', modePanel,...
            'Style', 'pushbutton',...
            'String', 'Submit',...
            'Units', 'normalized',...
            'Position', [.35 .2 .5 .14],...
            'Callback', @submit_callback);
        
        
        function  submit_callback(h,d)
            bds = get(boardMenu,'String');
            select_bd = bds{get(boardMenu,'Value')};
            ghst = get(ghostMenu, 'String');
            select_ghst = ghst{get(ghostMenu,'Value')};
            check_ghostString = strcmp(select_ghst,'Select # Ghosts');
            
            check_boardString = strcmp(select_bd,'Select Board');
            
            if all(check_ghostString) == true
                return
            elseif all(check_boardString) == true
                return
            end % Up to here, the submit_callback function will not display the play button if either ghosts or board type is not selected
            
            %% NEED TO INCLUDE CALLBACK ACTIONS FOR # GHOSTS AND BOARD TYPE
            % if string in ghostMenu = x ghosts, correspond with x number of
            % ghosts
            % if x board type selected, correspond to board map
            % elseif 0-3 ghosts or e177/cal map is not selected, do not display
            % play button
            % if two options are both selected, call respective game options
            % and display play button
            %%
            modePlay = uicontrol('Parent', modePanel,...
                'Style', 'pushbutton',...
                'String', 'Play!',...
                'Units', 'normalized',...
                'Position', [.35 .05 .5 .14],...
                'Callback', @play_callback);
            
            function play_callback (h,d)
                set(modePanel, 'Title', 'Score');
                set(selectText, 'Visible', 'off');
                set(ghostMenu, 'Visible', 'off');
                set(boardMenu, 'Visible', 'off');
                set(modeSubmit, 'Visible', 'off');
                set(modePlay, 'Visible', 'off');
                scorePanel = modePanel;
                
                scoreDisplay = uicontrol('Parent',scorePanel,...
                    'Units', 'normalized',...
                    'Position',[.1 .5 .8 .4],...
                    'Style','text',...
                    'FontSize', 24,...
                    'HorizontalAlignment','center',...
                    'ForegroundColor', 'blue',...
                    'String','0');
                %                 'Callback', @score_callback);
                
                endGame = uicontrol('Parent', modePanel,...
                    'Style', 'pushbutton',...
                    'String', 'End Game',...
                    'Units', 'normalized',...
                    'Position', [.35 .05 .5 .14],...
                    'HorizontalAlignment','center');
                %             'Callback', @end_callback);
                
                addlistener(obj, 'UpdateScore', @score_callback);
                
                function score_callback (h,d)
                    % If notified of score change, collect updated score and set to variable 'newscore'
                    newscore = obj.gameState.score;
                    set(scoreDisplay, 'String', newscore)
                end
                
                play(obj);
            end
        end % end to @next_callback - first callback/nested function
    end
end