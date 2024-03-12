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
