function pacmanGUI_2(obj)
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

    instructionsText_sp = uicontrol('Parent',instructionsPanel,...
        'Units','normalized',...
        'Position',[.1 .5 .8 .4],...
        'Style','text',...
        'FontSize',8,...
        'HorizontalAlignment','left',...
        'String','SINGLE PLAYER MODE: Use the arrowkeys on your keyboard to control your character.');

    instructionsText_bot = uicontrol('Parent',instructionsPanel,...
        'Units','normalized',...
        'Position',[.1 .05 .8 .45],....
        'Style','text',...
        'FontSize',8,...
        'HorizontalAlignment','left',...
        'String','BOT MODE: Select a bot level and see how it plays out!');

    instructionsNext = uicontrol('Parent',instructionsPanel,...
        'Style','pushbutton',...
        'String','Select Mode...',...
        'Units','normalized',...
        'Position',[.35 .1 .5 .14],...
        'Callback',@next_callback); % this makes right panel change

    function next_callback(h,d)
        % this will make fright panel change
        set(instructionsPanel,'Title','Select a Mode');
        set(instructionsText_sp,'Visible','off');
        set(instructionsText_bot,'Visible','off');
        set(instructionsNext,'Visible','off');
        modePanel = instructionsPanel;

        % Proceed with Right Panel #2

        modeGroup = uibuttongroup('Parent',modePanel,...
            'Units','normalized',...
            'BorderType','none',...
            'Position',[0 .5 1 .4]);
        %                       'SelectionChangedFcn',@bselection);

        modeButtons {1} = uicontrol('Parent',modeGroup,...
            'Style','radiobutton',...
            'String','Single Player',...
            'Units','normalized',...
            'Position',[.1 .4 1 1]);

        modeButtons{2} = uicontrol('Parent',modeGroup,...
            'Style','radiobutton',...
            'String','Bot',...
            'Units','normalized',...
            'Position',[.1 .4 1 .3]);

        %     'Callback', @bot_dropdown; % Will ideally create a dropdown menu for
        %     someone to select the bot level

        botMenu = uicontrol('Parent',modeGroup,...
            'Style','popup',...
            'Units','normalized',...
            'Position',[.17 .28 .65 .08],...
            'String',{'Select Bot Level...','Level 1','Level 2','Level 3'});
        %     'Callback', @callback_piece);

        modeSubmit = uicontrol('Parent',modePanel,...
            'Style','pushbutton',...
            'String','Submit Mode',...
            'Units','normalized',...
            'Position',[.35 .25 .5 .14]);
        %         'Callback', @submit_callback);

        modePlay = uicontrol('Parent',modePanel,...
            'Style','pushbutton',...
            'String','Play!',...
            'Units','normalized',...
            'Position',[.35 .1 .5 .14],...
            'Callback',@play_callback);

        % function  submit_callback(h,d)
        % end

        function play_callback(h,d)
            set(modePanel,'Title','SCORE');
            set(modeGroup,'Visible','off');
            set(botMenu,'Visible','off');
            set(modeSubmit,'Visible','off');
            set(modePlay,'Visible','off');
            scorePanel = modePanel;
            scoreDisplay = uicontrol('Parent',scorePanel,...
                'Units', 'normalized',...
                'Position',[.1 .5 .8 .4],...
                'Style','text',...
                'FontSize', 16,...
                'HorizontalAlignment','center',...
                'ForegroundColor', 'blue',...
                'String','0');
            %                 'Callback', @score_callback);
            
            addlistener(obj, 'UpdateScore', @score_callback);
            
            function score_callback (h,d)
                % If notified of score change, collect updated score and set to variable 'newscore'
                newscore = obj.gameState.score;
                set(scoreDisplay, 'String', newscore)
            end
        end 

    end % end to @next_callback - first callback/nested function
end