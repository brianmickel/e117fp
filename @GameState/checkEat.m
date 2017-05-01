function bool = checkEat(obj)
    bool = false;
    coords = obj.agentPosition{1};
    if obj.foodLocBoolArray(coords(1),coords(2))
        bool = true;
        obj.foodLocBoolArray(coords(1),coords(2)) = false;
        obj.score = obj.score + 10;
    end
    return
end