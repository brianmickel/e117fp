function generateInitialState(obj)
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
    obj.agents{1} = SuperSmartPacman();
    obj.game.agents{1} = SuperSmartPacman();
    obj.agents{2} = SmarterSimpleGhost(2);
    obj.game.agents{2} = SmarterSimpleGhost(2);  

    obj.agentPosition = {};
    obj.agentPosition{1} = [8,8];
    obj.agentPosition{2} = [5,4];

    obj.agentDirection = {};
    obj.agentDirection{1} = 'E';
    obj.agentDirection{2} = 'N';

    obj.score = 0;
end