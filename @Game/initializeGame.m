function initializeGame(obj)
    obj.gameState = GameState(obj); % initialize game state
    foodpos = obj.gameState.foodLocBoolArray;
    wallpos = obj.gameState.isWallBoolArray;
    a = obj.gameState.agentPosition;
    charpos = [];
    for i = 1:length(a)
        charpos(i,:) = a{i};
    end
    charor = [];
    charor(1,1) = Directions.henryNumberMapFunc(obj.gameState.agentDirection{1});
    charor(2,1) = Directions.henryNumberMapFunc(obj.gameState.agentDirection{2});

    obj.Map = Board(wallpos,charpos,charor,foodpos).Map;
    pacmanGUI_2(obj); % intialized GUI
end