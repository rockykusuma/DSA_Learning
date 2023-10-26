//: [Previous](@previous)

import Foundation


struct Stack {
    var items: [Character] = []
    
    func peek() -> Character? {
        guard let topElement = items.first else { return nil }
        return topElement
    }
    
    mutating func pop() -> Character? {
        guard !items.isEmpty else {
            return nil
        }
        return items.removeFirst()
    }
    
    
    mutating func push(_ element: Character) {
        items.insert(element, at: 0)
    }
}


func isValid(_ s: String) -> Bool {
    guard s.count % 2 == 0 else { return false }
    
    var container: Stack = Stack()
    for item in s {
        switch item {
        case "(":
            container.push(item)
        case "{":
            container.push(item)
        case "[":
            container.push(item)
        case ")":
            if let value = container.peek(), value == "(" {
                container.pop()
            } else {
                return false
            }
        case "}":
            if let value = container.peek(), value == "{" {
                container.pop()
            } else {
                return false
            }
        case "]":
            if let value = container.peek(), value == "[" {
                container.pop()
            } else {
                return false
            }
        default:
            return false
        }
    }
    return container.items.isEmpty
}

let result = isValid("([}}])")
print(result)

