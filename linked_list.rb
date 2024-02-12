# frozen_string_literal: true

require_relative 'node'

# This class consists of all the methods to operate on a linked list
class LinkedList
  attr_accessor :head, :tail

  def initialize
    @head = nil
    @tail = nil
  end

  def prepend(data)
    new_node = Node.new(data)
    new_node.next = @head
    @head = new_node
    @prepend ||= @head
  end

  def append(data)
    new_node = Node.new(data)
    if @tail.nil?
      @head = new_node
    else
      @tail.next = new_node
    end
    @tail = new_node
  end

  def size
    count = 0
    current = @head
    while current
      count += 1
      current = current.next
    end
    count
  end

  def head_
    @head&.data
  end

  def tail_
    @tail&.data
  end

  def at(index)
    return nil if index.negative? || index >= size

    current = @head
    index.times { current = current.next }
    current
  end

  def pop
    return nil if @head.nil?

    if @head == @tail
      @head = nil
      @tail = nil
      return
    end

    current = @head
    current = current.next until current.next == @tail
    current.next = nil
    @tail = current
  end

  def contains?(value)
    current = @head
    while current
      return true if current.data == value

      current = current.next
    end
    false
  end

  def find(value)
    current = @head
    index = 0
    while current
      return index if current.data == value

      current = current.next
      index += 1
    end
    nil
  end

  def to_s
    return 'Empty list' if @head.nil?

    current = @head
    result = ''
    while current
      result += "(#{current.data}) -> "
      current = current.next
    end
    "#{result}nil"
  end

  def insert_at(index, data)
    return prepend(data) if index.zero?
    return append(data) if index >= size

    new_node = Node.new(data)
    previous_node = at(index - 1)
    new_node.next = previous_node.next
    previous_node.next = new_node
  end

  def remove_at(index)
    return if @head.nil? || index.negative? || index >= size

    if index.zero?
      @head = @head.next
      @tail = nil if @head.nil?
      return
    end

    previous_node = at(index - 1)
    previous_node.next = previous_node.next.next
    @tail = previous_node if previous_node.next.nil?
  end
end

# Create an empty list
# list = LinkedList.new

# Test prepend and append methods
# list.prepend(1)
# list.prepend(2)
# list.append(3)
# list.append(4)

# Test size method
# puts "Size of the list: #{list.size}"

# Test head and tail methods
# puts "Head of the list: #{list.head}"
# puts "Tail of the list: #{list.tail}"

# Test to_s method
# puts "Elements of the list: #{list}"

# Test contains? method
# puts "Does the list contain 3? #{list.contains?(3)}" #

# Test find method
# puts "Index of 3 in the list: #{list.find(3)}"

# Test insert_at method

# list.insert_at(2, 5)
# puts "Elements of the list after inserting 5 at index 2: #{list}"

# Test remove_at method
# list.remove_at(2)
# puts "Elements of the list after removing element at index 2: #{list}"
