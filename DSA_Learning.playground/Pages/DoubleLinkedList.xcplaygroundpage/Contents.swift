//: [Previous](@previous)

import Foundation
import LinkedList_PageSources


class DoubleLinkedList<T: Equatable> {
    typealias Node = ListNode<T>
    
    /// The head of the Linked List
    private (set) var head: Node?
    
    /// Computed property to check if the linked list is empty
    var isEmpty: Bool {
        return head == nil
    }
    
    /// Computed property to iterate through the linked list and return the total number of nodes
    var count: Int {
        guard var node = head else {
            return 0
        }
        var count = 1
        while let next = node.next {
            node = next
            count += 1
        }
        return count
    }
    
    /// Computed property to iterate through the linked list and return the last node in the list (if any)
    var last: Node? {
        guard var node = head else {
            return nil
        }
        
        while let next = node.next {
            node = next
        }
        return node
    }
    
    /// Append a value to the end of the list
    ///
    /// - Parameter value: The data value to be appended
    func append(value: T) {
        let newNode = Node(value: value)
        append(newNode: newNode)
    }
    
    /// Append a copy of a LinkedListNode to the end of the list.
    ///
    /// - Parameter newNode: The node containing the value to be appended
    func append(newNode: Node) {
        if isEmpty {
            head = newNode
        } else if let lastNode = last {
            lastNode.next = newNode
        } else {
            fatalError("This should never execute")
        }
    }
    
    /// Insert a value at a specific index.
    ///
    /// - Parameters:
    ///   - value: The data value to be inserted
    ///   - index: Integer value of the index to be inserted at
    func insert(_ value: T, at index: Int) {
        let newNode = Node(value: value)
        if index == 0 {
            newNode.next = head
            head = newNode
        } else if index == count {
            append(value: value)
        } else {
            insert(newNode, at: index)
        }
    }
    
    @discardableResult
    func insert(_ newNode: Node, at index: Int) -> Bool {
        guard let previousNode = node(at: index - 1), let nextNode = previousNode.next else {
            return false
        }
        newNode.next = nextNode
        previousNode.next = newNode
        return true
    }
    
    /// Insert a copy of a LinkedList at a specific index.
    ///
    /// - Parameters:
    ///   - list: The LinkedList to be copied and inserted
    ///   - index: Integer value of the index to be inserted at
    func insert(_ list: LinkedList, at index: Int) {
        if list.isEmpty {
            return
        }
        if index == 0 {
            list.last?.next = head
            head = list.head
        } else {
            guard let previousNode = node(at: index - 1), let nextNode = previousNode.next else {
                return
            }
            previousNode.next = list.head
            list.last?.next = nextNode
        }
    }
    
    func node(at index: Int) -> Node? {
        if index == 0 {
            return head
        } else {
            var node = head?.next
            for _ in 1 ..< index {
                node = node?.next
                if node == nil {
                    break
                }
            }
            return node
        }
    }
    
    /// Function to remove all nodes/value from the list
    func removeAll() {
        head = nil
    }
    
    // Big O(1)
    func removeFirstItem() -> T? {
        defer {
            head = head?.next
        }
        return head?.value
    }
    
    // Big O(n)
    func removeLastItem() -> T? {
        if isEmpty {
            return nil
        }
        if head?.next == nil {
            return removeFirstItem()
        }
        
        var previous = head
        var current = head
        while let next = current?.next {
            previous = current
            current = next
        }
        
        previous?.next = nil
        return current?.value
    }
    
    func removeAtIndex(index: Int) -> T? {
        guard var previousIndexNode = node(at: index-1), let currentIndexNode = previousIndexNode.next, let nextIndexNode = currentIndexNode.next else {
            return nil
        }
        previousIndexNode.next = nextIndexNode
        return currentIndexNode.value
    }
}

extension DoubleLinkedList: CustomStringConvertible {
    var description: String {
        guard let node = head else {
            return "Empty Linked List"
        }
        return "[\(node.description)]"
    }
}

let linkedList = DoubleLinkedList<Int>()
print(linkedList)
linkedList.append(value: 4)
print(linkedList)
