//: [Previous](@previous)

import Foundation

// Given an integer array, return 3 largest numbers in ascending order


func findThreeLargestNumbers(array: [Int]) -> [Int] {
    if array.isEmpty {
        return []
    }
    var result: [Int] = Array(repeating: Int.min, count: 3)
    for num in array {
        reArrangeTheNumber(number: num, result: &result)
    }
    return result
}

func reArrangeTheNumber(number: Int, result: inout [Int]) {
    var insertionIndex: Int = -1
    if number > result[2] {
        insertionIndex = 2
    } else if number > result[1] && number < result[2] {
        insertionIndex = 1
    } else if number > result[0] && number < result[1] {
        insertionIndex = 0
    } else {
        return
    }
    let temp = result[insertionIndex]
    result[insertionIndex] = number
    reArrangeTheNumber(number: temp, result: &result)
}

let result = findThreeLargestNumbers(array: [22, 303, 4, 9, 19, 31, 77, 77])
//let result = findThreeLargestNumbers(array: [1,2,-2147483648])
print(result)
