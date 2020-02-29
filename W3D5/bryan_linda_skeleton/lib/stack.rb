 class Stack
    def initialize
      # create ivar to store stack here!
      @store = []
    end

    def inspect
        "<Stack: #{self.object_id}>"
    end

    def push(el)
      # adds an element to the stack
      store.push(el)
      #we return self here so that it does not show the entire stack (default behavior)
      #we then overwrite the default #inspect method above for what is display by calling self
      self
    end

    def pop
      # removes one element from the stack
      store.pop
    end

    def peek
      # returns, but doesn't remove, the top element in the stack
      store.last
    end

    def size
        store.length
    end

    def empty?
        store.empty?
    end
    # we can get rid of the @ symbol by adding an attr_reader
    # but this gives the user the ability to call something like: stack.reverse
    # so we place it at the bottom and list private above it
    private
    attr_reader :store
  end