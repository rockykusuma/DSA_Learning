//: [Previous](@previous)

import Foundation


extension Character {
    var isAlphaNumeric: Bool {
        return self.isNumber || self.isLetter
    }
}

func isPalindrome(_ s: String) -> Bool {
    let resultantString = Array(s.lowercased().filter({$0.isAlphaNumeric}))
    var leftPointer = 0
    var rightPointer = resultantString.count - 1
    while leftPointer < rightPointer {
        if resultantString[leftPointer] != resultantString[rightPointer] {
            return false
        } else {
            leftPointer += 1
            rightPointer -= 1
        }
    }
    return true
}

let result = isPalindrome("A man, a plan, a canal: Panama")
print(result)


let number: Int? = Optional(23)
let numberOne: Int? = Optional.some(23)
let numberTwo: Int? = Optional.none


print(number == numberOne)
print(number.unsafelyUnwrapped)
