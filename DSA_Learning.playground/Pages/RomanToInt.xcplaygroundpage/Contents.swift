//: [Previous](@previous)

import Foundation


func romanToInt(_ s: String) -> Int {
    let dictionary: [Character: Int] = ["I": 1, "V": 5, "X": 10, "L": 50, "C": 100, "D": 500, "M": 1000]
    var result = 0
    var previous: Int?
    for char in s {
        if let number = dictionary[char] {
            result += number
            if let previous = previous, previous < number {
                result -= 2 * previous
            }
            previous = number
        }
    }
    return result
}

print(romanToInt("IX"))

