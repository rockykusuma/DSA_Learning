//: [Previous](@previous)

import Foundation

// Search the number in the sorted array using Binary Search Algorithm

func binarySearch(input: [Int], target: Int) -> Int {
        
    if input.isEmpty {
        return -1
    }
    
    var startIndex: Int = 0
    var endIndex: Int = input.count - 1
    var midIndex: Int = 0
    
    while startIndex <= endIndex {
        // Normally we can write the formula like ((startIndex + endIndex) / 2). This works until the summation of startIndex and endIndex exceeds the Integer Size Limit.
        // So in order to come out of this edge case, the below forumula helps us
                
        midIndex = startIndex + (endIndex - startIndex) / 2
        
        if target == input[midIndex] {
            return midIndex
        } else if target < input[midIndex] {
            endIndex = midIndex - 1
        } else if target > input[midIndex] {
            startIndex = midIndex + 1
        }
    }
    return -1
}

let result = binarySearch(input: [2, 6, 12, 43, 56, 108, 212, 514], target: 56)
print(result)


func orderAgnosticBinarySearch(input: [Int], target: Int) -> Int {
        
    if input.isEmpty {
        return -1
    }
    var startIndex: Int = 0
    var endIndex: Int = input.count - 1
    var midIndex: Int = 0
    
    let isAscending = input[startIndex] < input[endIndex]
    
    while startIndex <= endIndex {
        midIndex = startIndex + (endIndex - startIndex) / 2
        if target == input[midIndex] {
            return midIndex
        }
        
        if isAscending {
            if target < input[midIndex] {
                endIndex = midIndex - 1
            } else if target > input[midIndex] {
                startIndex = midIndex + 1
            }
        } else {
            if target > input[midIndex] {
                endIndex = midIndex - 1
            } else if target < input[midIndex] {
                startIndex = midIndex + 1
            }
        }
    }
    return -1
}

let result2 = orderAgnosticBinarySearch(input: [514, 314, 234, 102, 95, 32, 21, 19, 9, 3, 1, 0], target: 95)
print(result2)
