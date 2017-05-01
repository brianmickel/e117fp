function bool = isWall(obj,vector)
%             display('Wall Check');
%             display(vector(1));
%             display(vector(2));
    bool = obj.isWallBoolArray(vector(1),vector(2));
    return
end
