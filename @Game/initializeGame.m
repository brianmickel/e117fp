function initializeGame(obj)
    type = 1;
    obj.gameState = GameState(obj,type); % initialize game state

    obj.Map = Board(obj.gameState).Map;
    pacmanGUI_2(obj); % intialized GUI
end