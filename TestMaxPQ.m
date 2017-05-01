classdef TestMaxPQ
    %UNTITLED4 Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
    end
    
    methods
        function obj = TestMaxPQ()
            %insert 8 nodes with given priorities
            pq = MaxPQ();
            priorityValues = [3 5 7 4 8 5 0 2 4 9];
            valueValues = [12 324 53 34 23 543 765 754 234 45];
            for i = 1:10
                n = PQNode(priorityValues(i),valueValues(i));
                pq.insert( n );
            end
%             pq.insert()
            
            s = pq.size();
            b = []
            for i = 1:s
                a = pq.delMax();
                b = [b; a.priority];
            end
            
            display(b);
        end

    end
    
end

