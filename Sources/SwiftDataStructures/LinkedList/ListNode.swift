//
//  ListNode.swift
//
//
//  Created by Aynur Nasybullin on 12.03.2024.
//

public final class ListNode<V>
where V: Comparable {
    public let val: V
    public var next: ListNode<V>?
    
    public init(_ val: V, next: ListNode<V>? = nil) {
        self.val = val
        self.next = next
    }
}

extension ListNode: Equatable {
    public static func == (lhs: ListNode<V>, rhs: ListNode<V>) -> Bool {
        var lhs = lhs
        var rhs = rhs
        
        while true {
            if lhs.val != rhs.val { return false }
            
            guard let left = lhs.next, let right = rhs.next else {
                return lhs.next == nil && rhs.next == nil
            }
            
            lhs = left
            rhs = right
        }
    }
}

extension ListNode: CustomStringConvertible
where V: CustomStringConvertible {
    public var description: String {
        var tmp = self
        var result = ["[", "\(tmp.val)"]
        
        while true {
            if let next = tmp.next {
                result.append(" -> \(next.val)")
                tmp = next
            } else { break }
        }
        
        result.append("]")
        return result.joined()
    }
}
