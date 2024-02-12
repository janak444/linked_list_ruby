# rubocop:disable Metrics/AbcSize
# frozen_string_literal: true

def merge_sort_linked_list(list)
  return list if list.nil? || list.head.nil? || list.head.next.nil?

  # Divide the list into two halves
  left_half, right_half = split_list(list)

  # Recursively sort each half
  left_half = merge_sort_linked_list(left_half)
  right_half = merge_sort_linked_list(right_half)

  # Merge the sorted halves
  merge(left_half, right_half)
end

def split_list(list)
  slow = list.head
  fast = list.head
  prev = nil

  while fast&.next
    prev = slow
    slow = slow.next
    fast = fast.next.next if fast.next
  end

  left_half = list
  right_half = LinkedList.new
  right_half.head = slow
  prev.next = nil if prev

  [left_half, right_half]
end

def merge(left_half, right_half)
  merged_list = LinkedList.new
  current = Node.new(nil)
  merged_list.head = current

  left = left_half.head
  right = right_half.head

  # Compare elements from both lists and merge them
  while left && right
    if left.data <= right.data
      current.next = left
      left = left.next
    else
      current.next = right
      right = right.next
    end
    current = current.next
  end

  # Add any remaining elements from left list
  current.next = left if left

  # Add any remaining elements from right list
  current.next = right if right

  merged_list.head = merged_list.head.next
  merged_list
end
