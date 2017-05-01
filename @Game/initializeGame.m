function initializeGame(obj)
    obj.gameState = GameState(obj); % initialize game state

    obj.Map = Board(obj.gameState).Map;
    pacmanGUI_3(obj); % intialized GUI
end