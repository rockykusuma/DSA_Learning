//: [Previous](@previous)

import Foundation

func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
    if nums.isEmpty {
        return []
    }
    var dictionary: [Int: Int] = [:]
    for i in 0 ..< nums.count {
        let difference = target - nums[i]
        if let value = dictionary[difference] {
            return [value, i]
        } else {
            dictionary[nums[i]] = i
        }
    }
    return []
}

let result = twoSum([2,7,11,15], 9)
let resultTwo = twoSum([3,2,4], 6)
print(result)
print(resultTwo)


protocol Stackable {
    associatedtype Item: Equatable
    var items: [Item] {get}
    mutating func push(item: Item)
    mutating func pop() -> Item?
    func peek() -> Item?
}

struct Stack<T: Equatable>: Stackable {
    typealias Item = T
    
    var items: [T] = []
    
    mutating func push(item: T) {
        items.insert(item, at: 0)
    }
    
    mutating func pop() -> T? {
        guard !items.isEmpty else {
            return nil
        }
        return items.removeFirst()
    }
    
    func peek() -> T? {
        guard let topElement = items.first else { return nil }
        return topElement
    }
}

func rakesh() -> some Stackable {
    var stackList = Stack<Int>(items: [2])
    stackList.push(item: 4)
    stackList.push(item: 6)
    stackList.push(item: 8)
    return stackList
}

var stackList = Stack<Int>(items: [2])
stackList.push(item: 4)
stackList.push(item: 6)
stackList.push(item: 8)

print(stackList.items)
stackList.pop()
print(stackList.items)


struct Queue {
    var items: [Character] = []
    
    func peek() -> Character? {
        guard let lastElement = items.last else { return nil }
        return lastElement
    }
    
    mutating func deQueue() -> Character? {
        guard !items.isEmpty else {
            return nil
        }
        return items.removeFirst()
    }
    
    
    mutating func enQueue(_ element: Character) {
        items.append(element)
    }
}

var temp = Queue(items: ["2"])
temp.enQueue("4")
temp.enQueue("6")
temp.enQueue("8")

print(temp.items)
temp.deQueue()
print(temp.items)

