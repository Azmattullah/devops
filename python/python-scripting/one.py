# Find the Maximum Element in an Array
# Given an array of integers, find the largest element.
# Example:
# Input: [3, 7, 2, 9, 5]
# Output: 9


lst = [3, 7, 2, 9, 5, 100]

max_value = 0
for i in lst:
    if i > max_value:
        max_value = i
    
    
print(max_value)