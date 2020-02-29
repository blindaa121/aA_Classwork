 class MyQueue
    def initialize
      @store = []
    end

    def inspect
        "<MyQueue: #{self.object_id}>"
    end

    def enqueue(el)
        store.unshift(el)
    end

    def dequeue
        store.pop
    end

    def peek
        store.last
    end

    def size
        store.length
    end

    def show
        # we want to show the whole store but not provide access to mutation to the original
        store.dup
    end

    def empty?
        store.empty?
    end

    private
    attr_reader :store
  end