//
//  File.swift
//  
//
//  Created by Aynur Nasybullin on 12.03.2024.
//

public final class LinkedList<V>: LinkedListProtocol
where V: Comparable {
    typealias Node = ListNode<V>
    
    private var head: Node?
    private var end:  Node?
    private var count = 0
        
    public init() { }
        
    private func getNode(_ index: Int) -> Node? {
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
    
    func get(_ index: Int) -> ValueType? { getNode(index)?.val }
    
    func empty() -> Bool { count == 0 }
}
        
extension LinkedList {
    func addAtHead(_ val: V) {
        let newHead = Node(val)
        newHead.next = head
        head = newHead
        
        if end == nil {
            end = head
        }
        
        count += 1
    }
    
    func addAtEnd(_ val: V) {
        if let end = end {
            end.next = .init(val)
            self.end = end.next
        } else {
            self.head = .init(val)
            self.end = head
        }
        
        count += 1
    }
    
    func addAtIndex(_ index: Int, _ val: V) -> Bool {
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
        
        let addedNode = Node(val)
        addedNode.next = prev.next
        prev.next = addedNode
        
        count += 1
        return true
    }
}
    
extension LinkedList {
    func removeFromHead() -> V? {
        guard let head = head else { return nil }
        
        self.head = head.next
        head.next = nil
        
        if self.head == nil {
            end = nil
        }
        
        count -= 1
        return head.val
    }
    
    func removeFromEnd() -> V? {
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
    
    func removeFromIndex(_ index: Int) -> V? {
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
    func deleteFromHead() -> Bool { removeFromHead() != nil }
    
    func deleteFromEnd() -> Bool { removeFromEnd() != nil }
    
    func deleteFromIndex(_ index: Int) -> Bool { removeFromIndex(index) != nil }
}

extension LinkedList: CustomStringConvertible
where V: CustomStringConvertible {
    public var description: String { head?.description ?? "[]" }
}
