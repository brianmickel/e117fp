function generateCustomGame(obj)
    if strcmpi(obj.game.boardType,'E')
        obj.isWallBoolArray = logical([1,1,1,1,1,1,1,1,1,1,1,1,1,1,1;
                                        1,0,0,0,0,0,0,0,0,0,0,0,0,0,1;
                                        1,0,1,1,0,1,1,0,1,1,0,1,1,0,1;
                                        1,0,1,0,0,0,1,0,0,1,0,0,1,0,1;
                                        1,0,1,1,1,0,1,0,1,1,0,1,1,0,1;
                                        1,0,1,0,0,0,1,0,0,1,0,0,1,0,1;
                                        1,0,1,1,1,0,1,1,0,1,1,0,1,0,1;
                                        1,0,0,0,0,0,0,0,0,0,0,0,0,0,1;
                                        1,1,1,1,1,1,1,1,1,1,1,1,1,1,1]);

        obj.foodLocBoolArray = logical([0,0,0,0,0,0,0,0,0,0,0,0,0,0,0;
                                        0,1,1,1,1,1,1,1,1,1,1,1,1,1,0;
                                        0,1,0,0,1,0,0,1,0,0,1,0,0,1,0;
                                        0,1,0,1,1,1,0,1,1,0,1,1,0,1,0;
                                        0,1,0,0,0,1,0,1,0,0,1,0,0,1,0;
                                        0,1,0,1,1,1,0,1,1,0,1,1,0,1,0;
                                        0,1,0,0,0,1,0,0,1,0,0,1,0,1,0;
                                        0,1,1,1,1,1,1,1,1,1,1,1,1,1,0;
                                        0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]);

        obj.ghostPitLocBoolArray = logical([0,0,0,0,0,0,0,0,0,0,0,0,0,0,0;
                                            0,0,0,0,0,0,0,0,0,0,0,0,0,0,0;
                                            0,0,0,0,0,0,0,0,0,0,0,0,0,0,0;
                                            0,0,0,1,0,0,0,0,0,0,0,0,0,0,0;
                                            0,0,0,0,0,0,0,0,0,0,0,0,0,0,0;
                                            0,0,0,1,1,0,0,0,0,0,0,0,0,0,0;
                                            0,0,0,0,0,0,0,0,0,0,0,0,0,0,0;
                                            0,0,0,0,0,0,0,0,0,0,0,0,0,0,0;
                                            0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]);
    elseif strcmpi(obj.game.boardType,'C')
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
    end
    ghostPotentialPos = {[5,4],[2,2],[8,2]};
    ghostPotentialDir = {'N','S','E'};
    
    obj.agents = {};
    obj.game.agents = {};
    obj.agentDirection = {};
    obj.agentPosition = {};
    
    obj.agents{1} = SuperSmartPacman();
    obj.game.agents{1} = SuperSmartPacman();
    if obj.game.numGhosts > 0
        for i = 1:obj.game.numGhosts
            obj.agents{i+1} = SmarterSimpleGhost(i+1);
            obj.game.agents{i+1} = SmarterSimpleGhost(i+1);
            obj.agentPosition{i+1} = ghostPotentialPos{i};
            obj.agentDirection{i+1} = ghostPotentialDir{i};
        end
    end 

    
    obj.agentPosition{1} = [8,8];


    
    obj.agentDirection{1} = 'E';


    obj.score = 0;


end