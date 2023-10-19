//: [Previous](@previous)

import Foundation

func isAnagram(_ s: String, _ t: String) -> Bool {
    guard s.count == t.count else { return false }
    let firstString = s.lowercased()
    let secondString = t.lowercased()
    var dictionary: [Character: Int] = [:]
    for char in firstString {
        if let value = dictionary[char] {
            dictionary[char] = value + 1
        } else {
            dictionary[char] = 1
        }
    }
    for char in secondString {
        if let count = dictionary[char], count > 0 {
            dictionary[char] = count - 1
        } else {
            return false
        }
    }
    return true
}

func isAnagramSecondApproach(_ s: String, _ t: String) -> Bool {
    return s.lowercased().sorted() == t.lowercased().sorted()
}

func isAnagramThirdApproach(_ s: String, _ t: String) -> Bool {
    guard s.count == t.count else { return false }
    var firstString = s.lowercased()
    let secondString = t.lowercased()
    
    for char in secondString {
        if let index = firstString.firstIndex(of: char) {
            firstString.remove(at: index)
        }
    }
    return firstString.isEmpty
}

let resultOne = isAnagram("listen", "silewq")
let resultTwo = isAnagram("anagram", "nagaram")

print(resultOne)
print(resultTwo)
