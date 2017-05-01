function generateInitialState(obj)
    type = 1;
    switch type
        case 1
            % generates an initial state for the game
                obj.isWallBoolArray = logical([1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
                                                1 0 0 0 0 0 0 0 0 0 0 0 0 0 1;
                                                1 0 1 1 1 0 1 1 1 0 1 0 1 0 1;
                                                1 0 1 0 1 0 1 0 1 0 1 0 0 0 1;
                                                1 0 1 0 0 0 1 1 1 0 1 0 1 0 1;
                                                1 0 1 0 1 0 1 0 1 0 1 0 0 0 1;
                                                1 0 1 1 1 0 1 0 1 0 1 1 1 0 1;
                                                1 0 0 0 0 0 0 0 0 0 0 0 0 0 1;
                                                1 1 1 1 1 1 1 1 1 1 1 1 1 1 1]);

                obj.foodLocBoolArray = logical([0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
                                                0 1 1 1 1 1 1 1 1 1 1 1 1 1 0;
                                                0 1 0 0 0 1 0 0 0 1 0 1 0 1 0;
                                                0 1 0 0 0 1 0 0 0 1 0 1 1 1 0;
                                                0 1 0 0 0 1 0 0 0 1 0 1 0 1 0;
                                                0 1 0 0 0 1 0 1 0 1 0 1 1 1 0;
                                                0 1 0 0 0 1 0 1 0 1 0 0 0 1 0;
                                                0 1 1 1 1 1 1 1 1 1 1 1 1 1 0;
                                                0 0 0 0 0 0 0 0 0 0 0 0 0 0 0]);

                obj.ghostPitLocBoolArray = logical([0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
                                                    0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
                                                    0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
                                                    0 0 0 1 0 0 0 0 0 0 0 0 0 0 0;
                                                    0 0 0 1 1 0 0 0 0 0 0 0 0 0 0;
                                                    0 0 0 1 0 0 0 0 0 0 0 0 0 0 0;
                                                    0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
                                                    0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
                                                    0 0 0 0 0 0 0 0 0 0 0 0 0 0 0]);
                obj.agents = {};
                obj.agents{1} = Pacman();
                obj.game.agents{1} = Pacman();

                for g = 2:4
                    obj.agents{g} = Ghost(g);
                    obj.game.agents{g} = Ghost(g); 
                end

                obj.agentPosition = {};
                obj.agentPosition{1} = [2,2];
                obj.agentPosition{2} = [5,6];
                obj.agentPosition{3} = [8,14];
                obj.agentPosition{4} = [8,2];

                obj.agentDirection = {};
                obj.agentDirection{1} = 'E';
                obj.agentDirection{2} = 'S';
                obj.agentDirection{3} = 'N';
                obj.agentDirection{4} = 'E';

                obj.score = 0;
        case 2
            % generates an initial state for the game
                obj.isWallBoolArray = logical([1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
                                                1 0 0 0 0 0 0 0 0 0 0 0 0 0 1;
                                                1 0 1 1 1 0 1 1 1 0 1 0 1 0 1;
                                                1 0 1 0 1 0 1 0 1 0 1 0 0 0 1;
                                                1 0 1 0 0 0 1 1 1 0 1 0 1 0 1;
                                                1 0 1 0 1 0 1 0 1 0 1 0 0 0 1;
                                                1 0 1 1 1 0 1 0 1 0 1 1 1 0 1;
                                                1 0 0 0 0 0 0 0 0 0 0 0 0 0 1;
                                                1 1 1 1 1 1 1 1 1 1 1 1 1 1 1]);

                obj.foodLocBoolArray = logical([0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
                                                0 1 1 1 1 1 1 1 1 1 1 1 1 1 0;
                                                0 1 0 0 0 1 0 0 0 1 0 1 0 1 0;
                                                0 1 0 0 0 1 0 0 0 1 0 1 1 1 0;
                                                0 1 0 0 0 1 0 0 0 1 0 1 0 1 0;
                                                0 1 0 0 0 1 0 1 0 1 0 1 1 1 0;
                                                0 1 0 0 0 1 0 1 0 1 0 0 0 1 0;
                                                0 1 1 1 1 1 1 1 1 1 1 1 1 1 0;
                                                0 0 0 0 0 0 0 0 0 0 0 0 0 0 0]);

                obj.ghostPitLocBoolArray = logical([0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
                                                    0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
                                                    0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
                                                    0 0 0 1 0 0 0 0 0 0 0 0 0 0 0;
                                                    0 0 0 1 1 0 0 0 0 0 0 0 0 0 0;
                                                    0 0 0 1 0 0 0 0 0 0 0 0 0 0 0;
                                                    0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
                                                    0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
                                                    0 0 0 0 0 0 0 0 0 0 0 0 0 0 0]);
                obj.agents = {};
                obj.agents{1} = SmarterSimplePacman();
                obj.game.agents{1} = SmarterSimplePacman();

                for g = 2:3
                    obj.agents{g} = SmarterSimpleGhost(g);
                    obj.game.agents{g} = SmarterSimpleGhost(g); 
                end

                obj.agentPosition = {};
                obj.agentPosition{1} = [2,2];
                obj.agentPosition{2} = [5,6];
                obj.agentPosition{3} = [8,14];


                obj.agentDirection = {};
                obj.agentDirection{1} = 'E';
                obj.agentDirection{2} = 'S';
                obj.agentDirection{3} = 'N';

                obj.score = 0;
        otherwise
            % generates an initial state for the game
                obj.isWallBoolArray = logical([1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
                                                1 0 0 0 0 0 0 0 0 0 0 0 0 0 1;
                                                1 0 1 1 1 0 1 1 1 0 1 0 1 0 1;
                                                1 0 1 0 1 0 1 0 1 0 1 0 0 0 1;
                                                1 0 1 0 0 0 1 1 1 0 1 0 1 0 1;
                                                1 0 1 0 1 0 1 0 1 0 1 0 0 0 1;
                                                1 0 1 1 1 0 1 0 1 0 1 1 1 0 1;
                                                1 0 0 0 0 0 0 0 0 0 0 0 0 0 1;
                                                1 1 1 1 1 1 1 1 1 1 1 1 1 1 1]);

                obj.foodLocBoolArray = logical([0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
                                                0 1 1 1 1 1 1 1 1 1 1 1 1 1 0;
                                                0 1 0 0 0 1 0 0 0 1 0 1 0 1 0;
                                                0 1 0 0 0 1 0 0 0 1 0 1 1 1 0;
                                                0 1 0 0 0 1 0 0 0 1 0 1 0 1 0;
                                                0 1 0 0 0 1 0 1 0 1 0 1 1 1 0;
                                                0 1 0 0 0 1 0 1 0 1 0 0 0 1 0;
                                                0 1 1 1 1 1 1 1 1 1 1 1 1 1 0;
                                                0 0 0 0 0 0 0 0 0 0 0 0 0 0 0]);

                obj.ghostPitLocBoolArray = logical([0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
                                                    0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
                                                    0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
                                                    0 0 0 1 0 0 0 0 0 0 0 0 0 0 0;
                                                    0 0 0 1 1 0 0 0 0 0 0 0 0 0 0;
                                                    0 0 0 1 0 0 0 0 0 0 0 0 0 0 0;
                                                    0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
                                                    0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
                                                    0 0 0 0 0 0 0 0 0 0 0 0 0 0 0]);
                obj.agents = {};
                obj.agents{1} = Pacman();
                obj.game.agents{1} = Pacman();

                for g = 2:4
                    obj.agents{g} = Ghost(g);
                    obj.game.agents{g} = Ghost(g); 
                end

                obj.agentPosition = {};
                obj.agentPosition{1} = [2,2];
                obj.agentPosition{2} = [5,6];
                obj.agentPosition{3} = [8,14];
                obj.agentPosition{4} = [8,2];

                obj.agentDirection = {};
                obj.agentDirection{1} = 'E';
                obj.agentDirection{2} = 'S';
                obj.agentDirection{3} = 'N';
                obj.agentDirection{4} = 'E';

                obj.score = 0;
    end
end