class Stack
  def initialize
    @stack = []
  end

  def add(el)
    @stack.push(el)
  end

  def remove
    @stack.pop
  end

  def show
    @stack.dup
  end
end

class Queue
  def initialize
    @queue = []
  end

  def enqueue(el)
    @queue.push(el)
  end

  def dequeue
    @queue.shift
  end

  def show
    @queue.dup
  end
end

class Map
  def initialize
    @map = []
  end

  def assign(key, value)
    index = index(key)
    index.nil? ? @map << [key, value] : @map[index][1] = value
  end

  def lookup(key)
    index = index(key)
    index.nil? ? nil : @map[index][1]
  end

  def remove(key)
    index = index(key)
    @map.delete_at(index) if index
  end

  def show
    deep_dup(@map)
  end

  private

  def index(key)
    @map.index { |pair| pair[0] == key }
  end

  def deep_dup(arr)
    arr.map { |el| el.is_a?(Array) ? deep_dup(el) : el }
  end
end
