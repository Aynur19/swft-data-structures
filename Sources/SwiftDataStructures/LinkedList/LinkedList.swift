//
//  File.swift
//  
//
//  Created by Aynur Nasybullin on 12.03.2024.
//

public final class LinkedList<V>: LinkedListProtocol
where V: Comparable {
    private var head: ListNode<V>?
    private var end:  ListNode<V>?
    private var count = 0
        
    public init() { }
    
    public init(_ values: [V]) {
        for value in values {
            addAtEnd(value)
        }
    }
    
    public init(_ node: ListNode<V>) {
        head = node
        end = head
        count = getCount()
    }
    
    public func getCount() -> Int {
        guard var tmp = head else { return 0 }
        var count = 1
        
        while true {
            if let next = tmp.next {
                tmp = next
                count += 1
            } else { break }
        }
        
        return count
    }
        
    public func getNode(_ index: Int) -> ListNode<V>? {
        guard index >= 0, index < count,
              var tmp = head
        else { return nil }
            
        var idx = 0
        while idx != index {
            if let next = tmp.next {
                tmp = next
            } else {
                return nil
            }
            
            idx += 1
        }
        
        return tmp
    }
    
    public func get(_ index: Int) -> V? { getNode(index)?.val }
    
    public func empty() -> Bool { count == 0 }
}
        
extension LinkedList {
    public func addAtHead(_ val: V) {
        let newHead = ListNode<V>(val)
        newHead.next = head
        head = newHead
        
        if end == nil {
            end = head
        }
        
        count += 1
    }
    
    public func addAtEnd(_ val: V) {
        if let end = end {
            end.next = .init(val)
            self.end = end.next
        } else {
            self.head = .init(val)
            self.end = head
        }
        
        count += 1
    }
    
    public func addAtIndex(_ index: Int, _ val: V) -> Bool {
        guard index <= count else { return false }
        
        guard index > 0 else {
            addAtHead(val)
            return true
        }
        
        guard index != count else {
            addAtEnd(val)
            return true
        }
        
        guard let prev = getNode(index - 1) else { return false }
        
        let addedNode = ListNode<V>(val)
        addedNode.next = prev.next
        prev.next = addedNode
        
        count += 1
        return true
    }
}
    
extension LinkedList {
    public func removeFromHead() -> V? {
        guard let head = head else { return nil }
        
        self.head = head.next
        head.next = nil
        
        if self.head == nil {
            end = nil
        }
        
        count -= 1
        return head.val
    }
    
    public func removeFromEnd() -> V? {
        guard let end = end else { return nil }
        let removedValue = end.val
        
        guard let prevEnd = getNode(count - 2) else {
            self.head = nil
            self.end = nil
            count = 0
            
            return removedValue
        }
        
        prevEnd.next = nil
        self.end = prevEnd
        count -= 1
        
        return removedValue
    }
    
    public func removeFromIndex(_ index: Int) -> V? {
        guard index < count else { return nil }
        
        guard index > 0 else {
            return removeFromHead()
        }
        
        guard index != count - 1 else {
            return removeFromEnd()
        }
        
        guard let prevNode = getNode(index - 1) else { return nil }
        let nextNode = prevNode.next
        let removedValue = nextNode?.val
      
        prevNode.next = nextNode?.next
        nextNode?.next = nil
        
        count -= 1
        return removedValue
    }
}
    

extension LinkedList {
    public func deleteFromHead() -> Bool { removeFromHead() != nil }
    
    public func deleteFromEnd() -> Bool { removeFromEnd() != nil }
    
    public func deleteFromIndex(_ index: Int) -> Bool { removeFromIndex(index) != nil }
}


extension LinkedList: CustomStringConvertible
where V: CustomStringConvertible {
    public var description: String { head?.description ?? "[]" }
}


// MARK: LeetCode Problems Solutons
extension LinkedList<Int> {
    // MARK: 1171. Remove Zero Sum Consecutive Nodes from Linked List
    // link: https://leetcode.com/problems/remove-zero-sum-consecutive-nodes-from-linked-list/
    // Approach: Hash Table, LinkedList
    // Time complexity: O(n) => 12 ms
    // Space complexity: O(n) => 15.66 MB
    public func removeZeroSumSublists() {
        guard var head = head else { return }
        head = .init(0, next: head)
        
        var sum = 0
        var dict = [Int:ListNode<Int>]() // [index:sum]
        
        func deleteNodes(_ node: ListNode<Int>, sum: Int) -> Int {
            var tmpNode = node
            var tmpSum = sum
            var removedCount = 0
            
            while true {
                if let next = tmpNode.next {
                    tmpNode = next
                    tmpSum += tmpNode.val
                } else { return removedCount }
                
                if tmpSum == sum { return removedCount }
                
                dict[tmpSum] = nil
                removedCount += 1
            }
        }
        
        var tmp = head
        while true {
            sum += tmp.val
            
            if let node = dict[sum] {
                let removedCount = deleteNodes(node, sum: sum) + 1
                
                node.next = tmp.next
                tmp.next = nil
                tmp = node
                count -= removedCount
            } else {
                dict[sum] = tmp
            }
            
            if let next = tmp.next {
                tmp = next
            } else { break }
        }
        
        self.head = head.next
    }
}
