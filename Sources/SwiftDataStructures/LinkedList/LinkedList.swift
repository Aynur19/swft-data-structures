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
            } else {
                end = tmp
                break
            }
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
    
    public func addAtEnd(_ list: ListNode<V>) {
        if let end = end {
            let lList = LinkedList(list)
            end.next = lList.head
            self.end = lList.end
        } else {
            self.head = .init(list)
            self.end = head
        }
        
        _ = getCount()
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
extension LinkedList {
    // MARK: LeetCode Problem 1669. Merge In Between Linked Lists
    // Link: https://leetcode.com/problems/merge-in-between-linked-lists/
    // Approach: Linked List
    // Time complexity: O(n)
    // Space complexity: O(1)
    public func mergeInBetween(
        _ list: ListNode<V>?,
        startIn: Int,
        endIn: Int
    ) {
        guard let list = list else { return }
        
        guard !self.empty() else {
            self.addAtEnd(list)
            return
        }
        
        guard let leftNode = self.getNode(startIn - 1) else {
            assertionFailure("Linked list node list1 at index `a` was not found")
            return
        }
        
        guard let rightNode = self.getNode(endIn) else {
            assertionFailure("Linked list node list1 at index `b` was not found")
            return
        }
        
        leftNode.next = list
        _ = self.getCount()
        
        if let next = rightNode.next {
            self.addAtEnd(next)
            rightNode.next = nil
        }
    }
    
    
    // MARK: LeetCode Problem 206. Reverse Linked List
    // Link: https://leetcode.com/problems/3sum/
    // Approach: Linked List
    // Time complexity: O(n)
    // Space complexity: O(1)
    public func reverse() {
        let reversedList = self.reversed()
        head = reversedList.head
        end = reversedList.end
        count = reversedList.count
    }
    
    
    // MARK: LeetCode Problem 206. Reverse Linked List
    // Link: https://leetcode.com/problems/3sum/
    // Approach: Linked List
    // Time complexity: O(n)
    // Space complexity: O(1)
    public func reversed() -> Self {
        let lList = Self()
        guard var tmp = head else { return lList }
        
        while true {
            lList.addAtHead(tmp.val)
            
            if let next = tmp.next {
                tmp = next
            } else { return lList }
        }
    }
}


extension LinkedList<Int> {
    // MARK: LeetCode Problem 1171. Remove Zero Sum Consecutive Nodes from Linked List
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
    
    
    // MARK: LeetCode Problem 2. Add Two Numbers
    // Link: https://leetcode.com/problems/add-two-numbers/
    // Approach: Linked List
    // Time complexity: O(n)
    // Space complexity: O(n)
    public static func addNumbers(_ l1: ListNode<Int>?, _ l2: ListNode<Int>?) -> ListNode<Int>? {
        guard var l1 = l1 else { return l2 }
        guard var l2 = l2 else { return l1 }
        
        let head = ListNode(0)
        var tmp = head
        var val = 0
        
        while true {
            val += l1.val + l2.val
            let tmpNext = ListNode(val % 10)
            tmp.next = tmpNext
            tmp = tmpNext
            val /= 10
            
            if let next = l1.next {
                l1 = next
            } else {
                tmp.next = l2.next
                break
            }
            
            if let next = l2.next {
                l2 = next
            } else {
                tmp.next = l1
                break
            }
        }
        
        while true {
            if let next = tmp.next {
                val += next.val
                let tmpNext = ListNode(val % 10, next: next.next)
               
                tmp.next = tmpNext
                tmp = tmpNext
                
                next.next = nil
                val /= 10
            } else { break }
        }
        
        if val > 0 {
            tmp.next = .init(val)
        }
        
        return head.next
    }
}
