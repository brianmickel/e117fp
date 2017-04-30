classdef MaxPQ < handle
    %max priority queue implementation matlab
    
    properties
        nodes;
        n;
    end
    
    methods
        function obj = MaxPQ()
            obj.nodes = {};
            obj.n = 0;
        end
        
        function bool = isEmpty(obj)
            bool = (obj.n == 0)
            return
        end
        
        function int = size(obj)
            int = obj.n;
            return;
        end
        
        function node = max(obj)
            node = obj.nodes{1};
            return;
        end
        
        function insert(obj, node)
            obj.nodes{obj.n+1} = node;
            obj.n = obj.n + 1;
            obj.swim(obj.n);
        end
        
        function maxNode = delMax(obj)
            maxNode = obj.max();
            obj.exch(1,obj.n)
            obj.nodes{obj.n} = [];
            obj.n = obj.n - 1;
            
            obj.sink(1)
            
            return;
        end
        
        function swim(obj,k)
            while k > 1 && (obj.nodes{floor(k/2)} < obj.nodes{k})
                obj.exch(k, floor(k/2));
                k = floor(k/2);
            end
            return;
        end
        
        function sink(obj,k)
            if obj.n == 1
                return;
            end
            while 2*k <= obj.n
                j = 2*k;
                if j < obj.n && (obj.nodes{j} < obj.nodes{j+1})
                    j = j + 1;
                end
                if obj.nodes{k} > obj.nodes{j}
                    break;
                end
                obj.exch(k, j);
                k = j;
            end
        end
        
        function exch(obj,i, j)
            temp = obj.nodes{i};
            obj.nodes{i} = obj.nodes{j};
            obj.nodes{j} = temp;
        end
        
        
    end
    
end

