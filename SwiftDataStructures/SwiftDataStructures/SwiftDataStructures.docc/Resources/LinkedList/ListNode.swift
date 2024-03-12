//
//  ListNode.swift
//  
//
//  Created by Aynur Nasybullin on 12.03.2024.
//

public final class ListNode<V>
where V: Comparable {
    
    private(set) var val: V
    private(set) var next: ListNode<V>?
    
    public init(_ val: V, next: ListNode? = nil) {
        self.val = val;
        self.next = next;
    }
}
