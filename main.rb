# frozen_string_literal: true

require_relative 'node'
require_relative 'linked_list'
require_relative 'merge_sort'

# Create a new instance of LinkedList
list = LinkedList.new

# Populate the list with data
list.append(3)
list.append(7)
list.append(2)
list.append(5)
list.append(1)
list.append(4)

# Display the original list
puts 'Original list:'
puts list

# Sort the list using merge sort
sorted_list = merge_sort_linked_list(list)

# Display the sorted list
puts "\nSorted list:"
puts sorted_list
