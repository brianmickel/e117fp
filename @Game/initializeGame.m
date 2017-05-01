function initializeGame(obj)
    obj.gameState = GameState(obj); % initialize game state

    obj.Map = Board(obj.gameState).Map;
    pacmanGUI_2(obj); % intialized GUI
end