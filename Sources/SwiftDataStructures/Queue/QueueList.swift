//
//  QueueList.swift
//
//
//  Created by Aynur Nasybullin on 10.04.2024.
//

public final class QueueList<ValueType> {
    private var list = LinkedList<ValueType>()
    private var count = 0
    
    public init() { }
    
    public init(_ values: [ValueType]) {
        self.list = .init(values)
        self.count = list.getCount()
    }
}

extension QueueList: QueueProtocol {
    public func enqueue(_ x: ValueType) {
        list.addAtEnd(x)
        count += 1
    }
    
    public func dequeue() -> ValueType? {
        let value = list.removeFromHead()
        
        if value != nil {
            count -= 1
        }
        
        return value
    }
    
    public func peek() -> ValueType? { list.get(0) }
    
    public func empty() -> Bool { list.empty() }
    
    public func size() -> Int { count }
}


extension QueueList: CustomStringConvertible
where ValueType: CustomStringConvertible {
    public var description: String {
        return list.description
    }
}
