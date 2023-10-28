//: [Previous](@previous)

import Foundation


// Reverse the input String
func stringReverse(input: String) -> String {
    var reverseString = ""
    for char in input  {
        reverseString = "\(char)" + reverseString
    }
    return reverseString
}


let result = stringReverse(input: "rakesh")
print(result)


// Reverse the input Array List
func reverseTheList(input: [Int]) -> [Int] {
    var reversedList: [Int] = []
    for i in 0 ..< input.count {
        reversedList.append(input[(input.count - 1) - i])
    }
    return reversedList
}

func reverseTheListUsingStride(input: [Int]) -> [Int] {
    var reversedList: [Int] = []
    for index in stride(from: input.count - 1, through: 0, by: -1) {
        reversedList.append(input[index])
    }
    return reversedList
}

let result2 = reverseTheListUsingStride(input: [12, 43, 54, 65, 12])
print(result2)


// Reverse the Integer
func reverseTheInteger(x: Int) -> Int {
    var signValue = 1
    var input = x
    if input < 0 {
        signValue = -1
        input = input * signValue
    }
    
    let result = (Int(stringReverse(input: input.description)) ?? 0) * signValue
    guard result < Int32.max && result > Int32.min else {
        return 0
    }
    return result
}

let result3 = reverseTheInteger(x: -3421)
print(result3)

