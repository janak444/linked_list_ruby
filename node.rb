# frozen_string_literal: true

# This class use to store the data and info of next node
class Node
  attr_accessor :data, :next

  def initialize(data)
    @next = nil
    @data = data
  end
end
