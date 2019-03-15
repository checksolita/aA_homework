class Stack
    attr_reader :stack
    def initialize
      @stack = []
    end

    def push(el)
      stack.push(el)
    end

    def pop
      stack.pop
    end

    def peek
      stack.last
    end
end

class Queue
    attr_reader :line
    def initialize
        @line = []
    end

    def enqueue(el)
        line.push(el)
    end

    def dequeue
        line.shift
    end

    def peek
      line.first
    end
end

class Map
    #Remember, a map stores information in key-value pairs, where the keys are always unique. 
    #When implemented with arrays, a map might look something like this: my_map = [[k1, v1], [k2, v2], [k3, v2], ...]
    attr_reader :array

    def initialize
        @array = []
    end

    def set(key, value) 
        #can be used to either create a new key-value pair 
        #or update the value for a pre-existing key. It's up to you to check whether a key currently exists!

        #setting a new value for an existing key:
        array << [key, value] if array.empty? 
        array.each do |k_v_pair|
            k = k_v_pair[0]
            k_v_pair[1] = value if k == key
        end

        array << [key, value] if !array.include?([key, value])
        array
    end

    def get(key)
        array.each do |k_v_pair|
            k = k_v_pair[0]
            value = k_v_pair[1] 
            return value if k == key
        end
    end

    def delete(key)
        value = get(key)
        array.reject! { |pair| key == pair[0] }
    end

    def show
        deep_dupe(array)
    end

    def deep_dupe(arr)
        dupe = []
        arr.each do |el|
            if el.is_a?(Array) 
                dupe << deep_dupe(el)
            else
                dupe << el
            end
        end
        dupe
    end
end